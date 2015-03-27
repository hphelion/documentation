---
layout: default
title: "HP Helion OpenStack&#174; Installing an HLM Node on a KVM Server: Distributed Cloud Networking Overview"
permalink: /helion/openstack/carrier/install/hlm/
product: carrier-grade

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

# HP Helion OpenStack&#174; Carrier Grade: Installing an HLM Node on a KVM Server

<!-- From https://wiki.hpcloud.net/display/HCG/HLM+Node+install+on+a+KVM+Server+for+VM+Node+provisioning -->

1. Download the latest HLM Node image from

2. Copy the HLM Node image on the KVM Server

3. RDP to the KVM Server

4. Load the HLM Node image on the KVM

	a. Run the Virtual Machine Manager

	b. Click the "Create a new virtual machine" button

	c. Enter the following information:

		Name: <Type the name for the HLM Node>
		Option: Import existing disk image

	d. Enter the following information:

		Browse and select the HLM Node image
		OS Type: Linux
		Version: Debian Wheezy

	e. Enter the following information:

		Memory (RAM): 4096 MB (Recommended)
		CPUs: 2 (Recommended)

	f. Enter the following information:

		Advanced options: Select the network for the HLM Node (the HLM Node will act as the DHCP Server, so remove any DHCP Server or DHCP definition on a virtual network)
		Check "Customize configuration before install"
			Disk 1
				a. Storage format: qcow2 (depends on the image format of the HLM Node)
				b. Begin Installation
     
5. Go to the HLM Node console

		login: root
		Password: cghelion

	For the purpose of updating the configuration files, change the values to work on the selected network.

		HLM Node IP Address: 192.168.122.203
		HLM Node Netmask: 255.255.255.0
		HLM Node Network: 192.168.122.0
		HLM Node Broadcast: 192.168.122.255
		HLM Node Gateway: 192.168.122.1

6. Update /etc/network/interfaces

		auth eth0
		iface eth0 inet static
		address 192.168.122.203
		netmask 255.255.255.0
		broadcast 192.168.122.255
		gateway 192.168.122.1

7. Update /etc/resov.conf

		nameserver 192.168.122.1

8. Run "service networking restart" or reboot the HLM Node

9. Update /etc/cobbler/settings

		next_server: 192.168.122.203
		server: 192.168.122.203

10. Update /etc/cobbler/dhcp.template 

		subnet 192.168.122.0 netmask 255.255.255.0 {
		option routers             192.168.122.203;
		option domain-name-servers 192.168.122.203;
		option subnet-mask         255.255.255.0;
		range dynamic-bootp        192.168.122.100 192.168.122.200;

11. Run Cobbler

		a. service cobblerd start
		b. cobbler sync

 