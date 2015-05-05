---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Create the HLM Virtual Machine"
permalink: /helion/openstack/carrier/install/bm/hlm-vm/
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

<p style="font-size: small;"><a href="/helion/openstack/carrier/install/bm/network/prepare/">&#9664; Preparing the Network for Installation</a> | <a href="/helion/openstack/carrier/install/bm/overview/">&#9650; Installation Overview</a> |  <a href="/helion/openstack/carrier/install/bm/environment/"> Configuring the installation environment &#9654;</a> </p> 


# HP Helion OpenStack&#174; Carrier Grade (Alpha): Create the HLM Virtual Machine

Helion Lifecycle Management (HLM) consists of the ongoing operations/maintenance as well as the initial deployment of the HP Helion OpenStack Carrier Grade system.

## Create the HLM VM

1. Copy the latest `cg-hlm.qcow2` image to the KVM host. 

2. Using a tool such as Virtual Manager (virt-manager) to create HLM VM with latest qcow2 image provided. You installed Virtual Manager when you installed Ubuntu packages in the [Prerequistes](/helion/openstack/carrier/install/prereqs/) steps.

	Assign default, PXE and CLM networks to this VM.

3.	Shutdown the HLM VM

4.	From KVM host, execute the following command to verify that the three interfaces are defined properly:

		virsh edit hlm

	The file should appear similar to the following:

		<interface type='network'>
			<mac address='52:54:00:5f:61:73'/>
			<source network='default'/>
			<model type='virtio'/>
			<address type='pci' domain='0x0000' bus='0x00' slot='0x03' function='0x0'/>
		</interface>
		<interface type='network'>
			<mac address='52:54:00:fd:72:98'/>
			<source network='br-ctl'/>
			<model type='virtio'/>
			<address type='pci' domain='0x0000' bus='0x00' slot='0x07' function='0x0'/>
		</interface>
		<interface type='network'>
			<mac address='52:54:00:99:dd:35'/>
			<source network='br-ctl' portgroup='CLM'/>
			<model type='virtio'/>
			<address type='pci' domain='0x0000' bus='0x00' slot='0x08' function='0x0'/>
		</interface>

5. Start the HLM VM using the following command:

		virsh start hlm

	At this point, HLM VM should be up and running with required 3 interfaces.

	**Note:** The default log in credentials for the HLM VM are as follows:

		Username: root
		Password: cghelion

5. Edit the `/etc/network/interfaces` file to associate eth1 with the PXE network and eth2 with the CLM network: 

		auto lo
		iface lo inet loopback
	
		auto eth0
		iface eth0 inet dhcp
		
		auto eth1
		iface eth1 inet static
		address <IP_Address>
		netmask <Netmask>
		network <IP_Address>
		broadcast <IP_Address>
		gateway <IP_Address>
		
		auto eth2
		iface eth2 inet static
		address <IP_Address>
		netmask <Netmask>
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

6.	Use the following command to restart the Ubuntu Network (Neutron) service:

		/etc/init.d/networking restart

6.	Use the following command to display the port details for the CLM VLAN:

		ovs-vsctl show

	The output should appear similar to the following:	

		Bridge br-ctl
		Port "em1"
			Interface "em1"
		Port br-ctl
			Interface br-ctl
				type: internal
		Port "vnet1"
			Interface "vnet1"
		Port "vnet2"
			tag: 1574
			Interface "vnet2"

		ovs_version: "2.0.2"


## Next step {#nextstep}

[Configuring the installation environment](/helion/openstack/carrier/install/bm/environment/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---
