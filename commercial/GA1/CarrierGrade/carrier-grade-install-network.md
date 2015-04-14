---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Preparing the Network for Installation"
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

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Preparing the Network for Installation 

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

		# Bridge for KVM HOST
		auto br-kvm
		allow-ovs br-kvm
		iface br-kvm inet dhcp
		ovs_type OVSBridge
		ovs_ports bond0 #=>(Change to em1 if Single NIC Setup is seen in your setup)
		# Bond for KVM Bridge change to any ports you need em1 or eth0 as needed replacing p3p1 etc (Below is 10GB interface on DL360)
		allow-br-kvm bond0 #=>(Change to em1 if Single NIC Setup)
		iface bond0 inet manual #=>(Change to em1 if Single NIC Setup)
		ovs_bridge br-kvm
		ovs_type OVSBond #==>(Change to OVSPort for Single NIC Setup)
		ovs_bonds p3p1 p3p2 #=>(remove line for Single NIC Setup and if you have em1/em2 change as "ovs bonds em1 em2")
		ovs_options bond_mode=active-backup #=>(remove line for Single NIC Setup)
		#DCN ALL Virtual Env - Bridges
		auto br-ctl
		allow-ovs br-ctl
		iface br-ctl inet manual
		ovs_type OVSBridge

		auto br-data
		allow-ovs br-data
		iface br-data inet manual
		ovs_type OVSBridge

	Sample /etc/network/interfaces file from KVM host 
	<img src="media/CGH-interfaces-file" >

3. Create interface and ovs bridges by doing ifup each Interface added:

		ifup br-kvm
		ifup br-ctl
		ifup br-data

4. Make sure you have this route entry on the KVM host once your `br-kvm` is configured
 
5. Make sure that you can connect to an external [NTP server](/helion/openstack/carrier/install/ntp/) and check that you can connect to an external network after exporting the proxy. 

## Next Step

[Configure a Virtual Router During Installation](/helion/openstack/carrier/install/virt-router/)


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---


