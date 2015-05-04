---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Installing HP StoreVirtual VSA"
permalink: 		
product: carrier-grade
product-version1: HP Helion OpenStack Carrier Grade
role1: Storage Administrator
role2: Storage Architect
authors: Michael B, Paul F

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"><a href="/helion/openstack/carrier/install/vsa/overview/">&#9664; Installing HP StoreVirtual VSA Overview </a> | <a href="/helion/openstack/carrier/install/vsa/cluster/">Creating a StoreVirtual Cluster and Adding to a Management Group &#9654;</a></p>

<!-- From Installing HPStoreVirtual.docx at https://wiki.hpcloud.net/pages/viewpage.action?pageId=49097241 -->

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Installing HP StoreVirtual VSA

This page provides detailed instructions on installing HP StoreVirtual VSA Centralized Management Console (CMC) and deploying HP StoreVirtual VSA Storage Nodes in your HP Helion OpenStack Carrier Grade cloud.

## Prerequisites 

* KVM must be installed:

		sudo apt-get install qemu-kvm libvirt-bin bridge-utils virt-manager
		sudo apt-get install ubuntu-vm-builder
		sudo apt-get update

* Optionally install Virtual Manager

		sudo apt-get install virt-manager

* Verify that KVM was installed correctly

		virsh -c qemu:///system list
		virsh net-list --all

* The X Windows System must be running to install the CMC.


## Installing HP StoreVirtual VSA Centralized Management Console (CMC) on Linux {#install-hp-storevirtual-cmc}

In order to configure the HP StoreVirtual VSA nodes, you must first install the CMC. You can manage all connected StoreVirtual VSA instances from single CMC connected to HP Helion OpenStack management network.

We recommend that you install CMC on the same KVM host. This host has direct network connectivity to servers running HP StoreVirtual VSA. However, you may select an alternate host as long as it is accessible from the HP Helion OpenStack management network.


**Note**: These changes are required for 64-bit operating system only.

* Execute the following commands:

		# apt-get update
		# dpkg --add-architecture i386
		# apt-get install openjdk-7-jdk:i386

To install CMC:

1. Verify if the CMC installer file inside `tripleo` directory (packaged with the HP Helion OpenStack&#174; installer) has executable permission. If not, execute the following command:

		# chmod +x CMC_11.5.01.0079.0_Installer_Linux.bin

2. Launch the installer:

		# ./CMC_11.5.01.0079.0_Installer_Linux.bin

3. Follow the steps in the console-based installation wizard to complete the installation.

4. To start the CMC, if you have direct GUI access:<br />
 From the directory in which the files are installed, click the **HP Store Virtual Centralized Management Console** to launch CMC.  

	**Note**: To launch the CMC from command line (CLI), navigate to the location where it is installed and enter: 

		# ./"HP Store Virtual Centralized Management Console".


## Deploying HP StoreVirtual VSA
<!-- From the StoreVirtual_VSA_for_HP_Helion_OpenStack_Installer-11.5.01.0079 readme -->

To install KVM VSA:

1. Create a Bridge Network

		sudo apt-get install qemu
		sudo apt-get install libcap2-bin
		sudo setcap cap_net_admin=ei /usr/bin/qemu-system-x86_64
		sudo vi /etc/security/capability.conf
		"cap_net_admin   <username>"

		sudo vi /etc/network/interfaces

		iface eth0 inet manual
		iface eth0 inet dhcp

		auto br0
		iface br0 inet dhcp
			bridge_ports eth0
			bridge_stp off
			bridge_fd 0
			bridge_maxwait 0
		
		sudo invoke-rc.d networking restart

2. Download the installer binary (installer) and the KVM OS disk image `KVM-VSA-<version>.img.gz`.

3. Create a JSON Input file by running the following commands: 

		./installer -create-default-json" , or 
		./installer -create-default-json" -disks <n> -tiering

	This input file tells the installer how to configure the VM. 
   
	**Example**

	The following is an example of the default-input.json: 

		{
			"HostName": "newHost", 
			"OSImageStoragePool": "default",
			"Personality": "VSA",
			"SANiQ_Preferred": 0,
			"Networks": [
				{   
					"DHCP": 1,
					"IPAddress": "", 
					"Subnet": "", 
					"Gateway": "",
					"NetworkInterface": "default"
				}   
			],  
			"Disks": [
				{   
					"Location": "default",
					"Size": "500G"
					"Tier": "Tier 0"
				},  
				{   
					"Location": "/dev/sdc",
					"Size": ""
					"Tier": "Tier 1"
				}   
			]   
		}

	**Notes:** 

	* To assign static IP for the VM, DHCP needs to be 0 and IP address, Subnet mask and Default gateway fields must be filled in. Similarly, to have a dynamic IP DHCP needs to be 1 and the other fields need to be empty. 

	* `NetworkInterface` must match the fields available in `virsh net-list --all`.
	
	* `SANiQ_Preferred` is the preferred NIC interface for SAN/iQ. Select 0 or 1.

	* Disk Location can be a storage pool, as found in in `virsh pool-list`; Or can be a raw device. 

	* `OSImageStoragePool` is where the OS image will be located. This needs to be a valid storage pool.

4. Use the following command to install VSA on the KVM host:

		./installer [--no-prompt] [--debug] <JSON Input File> <KVM-VSA-<version>.img.gz

5. Use the following command to verify that the VM is running

		virsh -c qemu:///system list

## Next Step {#next-steps}

[Creating a StoreVirtual Cluster and Adding to a Management Group](/helion/openstack/carrier/install/vsa/cluster/)


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----

