---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Preparing the Network for Installation"
permalink: /helion/openstack/carrier/install/bm/network/prepare/
product: carrier-grade

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"><a href="/helion/openstack/carrier/technical-overview/">&#9664; Technical Overview</a> | <a href="/helion/openstack/carrier/install/overview/">&#9650; Installation Overview</a> | <a href="/helion/openstack/carrier/install/bm/hlm-vm/"> Create the HLM Virtual Machine &#9654;</a> </p> 



# HP Helion OpenStack&#174; Carrier Grade (Alpha): Preparing the Network for Installation 

Before installing HP Helion OpenStack Carrier Grade, you are responsible for preparing the network for all installations. 


1. Modifiy the `/etc/network/interfaces` file to the following (DHCP EXAMPLE):

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

[Create the HLM Virtual Machine](/helion/openstack/carrier/install/bm/hlm-vm/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---


