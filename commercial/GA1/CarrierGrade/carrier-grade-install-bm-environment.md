---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Configuring the installation environment"
permalink: /helion/openstack/carrier/install/bm/environment/
product: carrier-grade
product-version1: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Michael B, 

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();	

</script>
<!--
<p style="font-size: small;"><a href="/helion/openstack/1.1/technical-overview/">&#9664; Technical Overview</a> | <a href="/helion/openstack/1.1/install/overview/">&#9650; Installation Overview</a> | <a href="/helion/openstack/1.1/install/kvm">Installing on a KVM hypervisor &#9654;</a> OR <a href="/helion/openstack/1.1/install/esx"> Installing on an ESX hypervisor&#9654;</a> </p> 
-->

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Configuring the installation environment

With the networking configured and the required blank VMs up and running, there are a few tasks required to prepare the environment for installation, including extracting installation files and configuring Cobbler.

[Cobbler](http://www.cobblerd.org/) is a Linux provisioning server that automates network installs for PXE and virtualized installs. 

To configure the installation environment:

1. Copy the `cg-hos.tar.gz.gpg` file and HLM node image file (`cg-hlm.qcow2`) to the /root directory on the KVM host.

2. Decrypt and extract the file using the following command: 

		gpg -d cg-hos.tar.gz.gpg | tar -xzvf -
		(password to decrypt: cghelion)

	This will extract following folders:

	* packages (includes all debs + pips)
	* hlm-files (includes hlinux distro to be pxe booted)
	* kenobi-configuration-processor (includes Kenobi source code)
	* kenobi-node-configuration (includes Kenobi source code)
	* cg-hlm (includes source code to populate environment on HLM and deploy cloud)

3.	Change directory to `cg-hlm/hlm-build` 

4. Populate HLM node with required contents using the following command:

		./hlm_updatepackages.sh


	This command syncs the debian and pip files in the `packages` directory onto static repo on HLM node.

5. Execute the following command and supply the PXE network details when prompted:

		./hlm_initcobbler.sh

	You will be prompted with following questions:

	*What is the IP address for this boot server virtual machine?* This is the IP address of the eth1 PXE interface of the HLM node 

		Example: 192.168.122.203

	*What is the netmask for this boot server virtual machine?*

		Example: 255.255.255.0

	*What is the IP address of the default gateway for network?*

		Example: 192.168.122.1

	*What is the starting IP address for your dhcp range?*

		Example: 192.168.122.100

	*What is the ending IP address for your dhcp range?*

		Example: 192.168.122.200

	This command restarts networking. If you SSH session gets disconnected, you will need to restart the session to the HLM console.

6. Use the following command to import the hlinux distribution into Cobbler.

		 /hlm_importiso.sh:

7. Execute the following command to ensure that the `eth1`interface is set up with PXE network details entered above:

		ifconfig

	At this point Cobbler is up and running.

8.	Edit `/etc/network/interfaces` file to provide CLM network details on the eth2 interface

		auto lo
		iface lo inet loopback

		auto eth0
		iface eth0 inet dhcp

		auto eth1
		iface eth1 inet static
		address <IP_Address>
		netmask <Netmask_Address>
		network <IP_Address>
		broadcast <IP_Address>
		gateway <IP_Address>

		auto eth2
		iface eth2 inet static
		address <IP_Address>
		netmask <Netmask_Address>
		network <IP_Address>
		broadcast <IP_Address>
		gateway <IP_Address>

	**Example:**

		auto lo
		iface lo inet loopback

		auto eth0
		iface eth0 inet dhcp

		auto eth1
		iface eth1 inet static
		address 10.200.73.12
		netmask 255.255.255.0
		network 10.200.73.0
		broadcast 10.200.73.255
		gateway 10.200.73.1

		auto eth2
		iface eth2 inet static
		address 10.200.74.12
		netmask 255.255.255.0
		network 10.200.74.0
		broadcast 10.200.74.255
		gateway 10.200.74.1



## Next step {#nextstep}

[Deploying the HLM Cloud](/helion/openstack/carrier/install/bm/hlm-cloud/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---
