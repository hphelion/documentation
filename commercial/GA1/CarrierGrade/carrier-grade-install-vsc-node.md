---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Create the HP VSC Node"
permalink: /helion/openstack/carrier/install/vsc-node/
product: carrier-grade

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Create the HP VSC Node

The [HP Virtualized Services Controller](http://www8.hp.com/us/en/products/networking-switches/product-detail.html?oid=7268885) (HP VSC) is a component of HP Distributed Cloud Networking. HP VSC functions as the robust network control plane for DCs, maintaining a full view of pertenant network and service topologies.

HP VSC must run on a dedicated hardware server as the only 
virtual machine process, called the HP VSC Node.

Use the following steps to install the HP VSC node in the HP Helion OpenStack Carrier Grade cloud.

**Note:** You can download the complete [HP Distributed Cloud Networking manuals](http://h20565.www2.hp.com/portal/site/hpsc/public/psi/home/?sp4ts.oid=7268885&ac.admitted=1429029354732.876444892.492883150#manuals), in needed.

## Create the VSC node VM

To create the VM that hosts the VSC node:

1. Copy the `vsc_singledisk.qcow2` to the `/var/lib/libvirt/images` folder on your kvm host.

2. Use the following commands to create a virtual machine (the HP VSC node) from the VSC XML definition file then start the domain:

		virsh define vsc.xml
		virsh autostart vsc
		virsh start vsc

## Configure the VSC node

Once your VM is up and running, use the following steps to configure the VSC node:

1. Connect to the HP VSC console using libvirt:

		virsh console vsc

	HP VSC should boot to a login prompt on the console

2. Log in to the console using the default credentials:

		login: admin
		password: admin

3. Use the following steps to edit the Boot Options File (BOF) configuration. 

	The HP VSC uses a Boot Options File (BOF) named bof.cfg that is read on system boot and is used for some basic, low-level system configuration needed to successfully boot the HP VSC.

	a. Navigate to the Boot Options File context:

		bof<Enter>

	The prompt will indicate a change to the bof context 

	b. Enter the Management IP address: 

		address <ip‐prefix/ip‐prefix‐length>

	**Example:** 10.10.10.20/24

	c. Enter the primary DNS IP address, 

		primary-dns <IP_address>

	**Example:** primary-dns 10.10.10.25

	d. Enter the name of the DNS domain, 

		dns‐domain <dns‐name>

	**Example:** helion.cg

	e. Enter the static routes for the management IP network

		static‐route <ip‐prefix/ip‐prefix‐length> next‐hop <IP_address>

	**Example:** 

		10.20.20.0/24 next-hop 10.10.10.1
		10.100.100.0/24 next-hop 10.10.10.1

	f. Save the configuration to cf1. The bof.cfg file be saved to the cf1: *user* emulated disk. 

		save cf1

	g. Exit the configuration.

		exit

4. Configure NTP using the console:

	a. Enter the following commands to enter the NTP server configuration:

		configure
		name "VSC"
		time
		ntp

	b. Enter the IP addresses for NTP servers:

		server <IP_address>
		no shutdown

		Example: 
		server 10.10.10.25
		server 10.1.64.20
		no shutdown

	f. Exit the NTP server configuration:

		exit

	g. Shutdown the SNTP service:

		sntp
		shutdown
		exit

	j. Specify the time zone:

		zone <zone_abbreviation>

	**Example**

		zone UTC

	k. Complete the NTP configuration:

		exit
		exit

5. Configure Extensible Messaging and Presence Protocol (XMPP). HP VSC communicates with the HP VSD policy engine using Extensible Messaging and Presence Protocol (XMPP).

	a. Enter the following commands to enter the xmpp server configuration:

		configure
		vswitch-controller

	b. Specify the xmpp server (xmpp.example.com) and username (NSC-vPE-1) and password:

		xmpp-server "NSC-vPE1:password@xmpp.example.com"

	**Example:**

		xmpp-server "vsc:password@vsd.helion.cg"

	c. Complete the XMPP configuration:

		exit
		exit

6. Save the configurations:

		admin save

7. Check that the XMPP server is properly configured:

		admin display-config

		--------------------------------------------------
		echo "Virtual Switch Controller Configuration"
		--------------------------------------------------
		vswitch-controller
			xmpp-server "vsc:password@vsd.helion.cg"
			open-flow
			exit
			xmpp
		exit
		exit
		--------------------------------------------------

8. Save the configuration to cf1. The bof.cfg file be saved to the cf1: *user* emulated disk. 

		save cf1
 
9. Verify that IP addresses and routes have been added to the configuration file:

		config
		show system information

	Check the command output for the appropriate IP addresses, such as Management and DNS addresses and static routes.

10. Verify that you can ping the CLM network on the HLM node: 

		ping router "management" <IP_address>
 
	**Example:**

		ping router "management" 10.20.20.2

11. Log in to the HP Networks Virtualized Services Directory Architect (VSD Architect) UI in a  browser from Guest VM as the CSP administrator. 

	The default CSP administrator login: 

		User Name: csproot
		Password: csproot
		Organization: csp 

	After login, the Organization Dashboard is displayed.

	The VSD and VSC VMs should have a green bar.

 

## Useful commands for VSC

You might find the following commands helpful when working with VSC.


* Set specific values for parameters below

		configure system time ntp server 10.1.64.20
		configure system name "VSC"
		configure system sntp server-address
		configure system time zone UTC
		configure vswitch-controller xmpp-server "vsc:password@test.nuage.cdl.local"

* Verify these setting

		show system ntp
		show system information - to displays System Name
		show system sntp - to display sntp server ip address
		show system time
		show switch-controller xmpp-server - to display the name of XMPP server, FQDN and username, number of XMPP servers

* Check the settings: 

		admin display-config
		show system ntp detail

* Command to reboot vsc

		admin reboot

## Next Step

[Create the HLM Node](/helion/openstack/carrier/install/hlm-node/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---


