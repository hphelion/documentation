---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Preparing the Network for Installation"
permalink: /helion/openstack/carrier/install/network/
product: carrier-grade

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

# HP Helion OpenStack&#174; Carrier Grade (Beta): Preparing the Network for Installation 

Before installing HP Helion OpenStack Carrier Grade, you are responsible for preparing the network for all installations. 

## Add Bridge/VLANs on the seed cloud host

1. Check the vswitch status using `ovs-vsctl show` command. If you already have `br-data` and `br-ctl` in the seed cloud host, delete them with the below commands:

		ovs-vsctl del-br br-data
		ovs-vsctl del-br br-ctl
		ovs-vsctl del-br br-kvm

		virsh net-destroy br-ctl
		virsh net-destroy br-data
		virsh net-destroy br-kvm

2. Create 2 bridges: one exclusive for data to carry TUL traffic and other for non-data traffic like PXE, CTL, CLM, CAN, DCM and so forth: 

		ovs-vsctl add-br br-ctl
		ovs-vsctl add-br br-data
		ovs-vsctl add-br br-kvm

3. Run these commands to define the network, start VLANs. 

		virsh net-define cghelion-br-ctl-network.xml
		virsh net-start br-ctl
		virsh net-autostart br-ctl

		virsh net-define cghelion-br-data-network.xml
		virsh net-start br-data
		virsh net-autostart br-data

		virsh net-define cghelion-br-kvm-network.xml
		virsh net-start br-kvm
		virsh net-autostart br-kvm

4. Check the vswitch status using `ovs-vsctl show` command.

5. To delete any bridge use the following commands.

	virsh net-undefine <bridge-name>
	virsh net-destroy <bridge-name>
	ovs-vsctl del-br <bridge-name>

	**Example:**

	virsh net-undefine <br-ctl>
	virsh net-destroy br-ctl
	ovs-vsctl del-br br-ctl

## Configure Pair Bonding for the KVM Host

If you have multiple NICs, you can aggregate the multiple interfaces into a single logical *bonded* interface

For example, if you run `ifconfig` on your KVM host and you see `em1/em2` or `eth1/ethx` interfaces, you create a bonded interface on the KVM host. If you do not want bond the interfaces, make sure `emx` or `ethx` is in the interfaces files.

To create a bond on the KVM host :

1. From Console (ILO) use the `ifdown` command to de-configure the current active ports assigned `eth0`, `em1`, or `p3p1`, as needed

	ifdown eth0
	ifdown em1
	ifdown p3p1

2. Modifiy the `/etc/network/interfaces` file to the following (DHCP EXAMPLE):

		# The loopback network interface
		auto lo
		iface lo inet loopback

		#BR-CTL BRIDGE - UNTAGGED PXE NETWORK CIDR
		auto br-ctl
		allow-ovs br-ctl
		iface br-ctl inet static
		address 10.200.73.11
		netmask 255.255.255.0
		gateway 10.200.73.1
		ovs_type OVSBridge
		ovs_ports em1

		#Bring up interface online
		allow-br-ctl em1
		iface em1 inet manual
		ovs_bridge br-ctl
		ovs_type OVSPort

	Sample /etc/network/interfaces file from KVM host 
	<img src="media/CGH-interfaces-file" >

3. Reboot the system using the following command:

		sudo /etc/init.d/networking restart

3. Execute the `ifconfig -a` command to output OVS bridge details. If the bridge is not present, execute the following commands to restart the bridge:

		ifdown br-ctl
		ifup br-ctl


5.	Enable the `br-ctl` network that is used for associating with HLM VM

	a. Create br-ctl.xml file like below. Ensure respective VLAN ID for CLM is used.

		<network>
			<name>br-ctl</name>
			<forward mode='bridge'/>
			<bridge name='br-ctl'/>
			<virtualport type='openvswitch'/>
			<portgroup name='CLM'>
				<vlan>
					<tag id='1574'/>
				</vlan>
			</portgroup>
		</network>

	b. Execute the following commands:

		virsh net-define br-ctl.xml
		virsh net-start br-ctl
		virsh net-autostart br-ctl
		virsh net-list should display default and br-ctl 
		
	c.	Display information on the bridge:		

		ovs-vsctl show 

	The output should appear similar to the following example:

		Bridge br-ctl
			Port "em1"
				Interface "em1"
			Port br-ctl
				Interface br-ctl
					type: internal
		ovs_version: "2.0.2"

5. Make sure that you can connect to an external [NTP server](/helion/openstack/carrier/install/ntp/) and check that you can connect to an external network after exporting the proxy. 

## Next Step

[Configure a Virtual Router During Installation](/helion/openstack/carrier/install/virt-router/)


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---


