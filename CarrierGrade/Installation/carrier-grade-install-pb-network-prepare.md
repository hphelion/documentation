---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Preparing the Network for Installation"
permalink: /helion/openstack/carrier/install/pb/network/prepare/
product: carrier-grade

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"><a href="/helion/openstack/carrier/install/pb/prereqs/">&#9664; Installation Prerequisites</a> | <a href="/helion/openstack/carrier/install/pb/overview/">&#9650; Installation Overview</a> | <a href="/helion/openstack/carrier/install/pb/hlm-vm/"> Create the HLM Virtual Machine &#9654;</a> </p> 



# HP Helion OpenStack&#174; Carrier Grade (Beta): Preparing the Network for Installation 

Before installing HP Helion OpenStack Carrier Grade, you are responsible for preparing the network for all installations. 

## Configure VLAN networking on the KVM host

1. Edit `/etc/network/interfaces` file to provide network details on the each interface:

		auto lo
		iface lo inet loopback

		# The primary network interface
		auto br-pxe
		allow-ovs br-pxe
		iface br-pxe inet static
		address <IP_address>
		netmask <Netmask>
		gateway <IP_address>
		ovs_type OVSBridge
		ovs_ports em1
		
		#Bring up interface online
		allow-br-pxe em1
		iface em1 inet manual
		ovs_bridge br-pxe
		ovs_type OVSPort
		
		auto br-clm
		allow-ovs br-clm
		iface br-clm inet manual
		ovs_type OVSBridge
		ovs_ports em1.1551
		
		allow-br-clm em1.1551
		iface em1.1551 inet manual
		ovs_bridge br-clm
		ovs_type OVSPort
		
		auto br-bls
		allow-osv br-bls
		iface br-bls inet manual
		ovs_type OVSBridge
		ovs_ports em1.1554
		
		allow-br-bls em1.1554
		iface em1.1554 inet manual
		ovs_bridge br-bls
		ovs_type OVSPort
		
		auto br-dcm
		allow-osv br-dcm
		iface br-dcm inet manual
		ovs_type OVSBridge
		ovs_ports em1.1550
		
		allow-br-dcm em1.1550
		iface em1.1550 inet manual
		ovs_bridge br-dcm
		ovs_type OVSPort

	**Example:**

		auto lo
		iface lo inet loopback

		# The primary network interface
		auto br-pxe
		allow-ovs br-pxe
		iface br-pxe inet static
		address 10.200.183.11
		netmask 255.255.255.0
		gateway 10.200.183.1
		ovs_type OVSBridge
		ovs_ports em1
		
		#Bring up interface online
		allow-br-pxe em1
		iface em1 inet manual
		ovs_bridge br-pxe
		ovs_type OVSPort
		
		auto br-clm
		allow-ovs br-clm
		iface br-clm inet manual
		ovs_type OVSBridge
		ovs_ports em1.1551
		
		allow-br-clm em1.1551
		iface em1.1551 inet manual
		ovs_bridge br-clm
		ovs_type OVSPort
		
		auto br-bls
		allow-osv br-bls
		iface br-bls inet manual
		ovs_type OVSBridge
		ovs_ports em1.1554
		
		allow-br-bls em1.1554
		iface em1.1554 inet manual
		ovs_bridge br-bls
		ovs_type OVSPort
		
		auto br-dcm
		allow-osv br-dcm
		iface br-dcm inet manual
		ovs_type OVSBridge
		ovs_ports em1.1550
		
		allow-br-dcm em1.1550
		iface em1.1550 inet manual
		ovs_bridge br-dcm
		ovs_type OVSPort


2.	Execute the following command to check the output

		ovs-vsctl show
706add53-21a4-4062-9149-d7bd77896076
		ovs_version: "2.0.2"

## Create the networks for associating with the HLM virtual machine

The installation process will create a virtual machine for HP Helion Lifecycle Management. 

Perform the following steps to enable networks that will be associated with HLM VM.

1. Launch a terminal and log in to your KVM host as root:

	sudo su -

2. Create the `br-clm` network by creating an XML definition file: 

	a. Create the XML file

		cat br-clm.xml
			<network>
				<name>br-clm</name>
				<forward mode='bridge'/>
				<bridge name='br-clm'/>
				<virtualport type='openvswitch'/>
			</network>

	b. Execute the following commands to create and start the network, and configure the network to auto-start

		virsh net-define br-ctm.xml
		virsh net-start br-clm
		virsh net-autostart br-clm

3. Create the `br-bls` network by creating an XML definition file: 

	a. Create the XML file

		cat br-bls.xml
			<network>
				<name>br-bls</name>
				<forward mode='bridge'/>
				<bridge name='br-bls'/>
				<virtualport type='openvswitch'/>
			</network>

	b. Execute the following commands to create and start the network, and configure the network to auto-start

		virsh net-define br-bls.xml
		virsh net-start br-bls
		virsh net-autostart br-bls

3. Create the `br-pxe` network by creating an XML definition file: 

	a. Create the XML file

		cat br-pxe.xml
			<network>
				<name>br-pxe</name>
				<forward mode='bridge'/>
				<bridge name='br-pxe'/>
				<virtualport type='openvswitch'/>
			</network>

	b. Execute the following commands to create and start the network, and configure the network to auto-start

		virsh net-define br-pxe.xml
		virsh net-start br-pxe
		virsh net-autostart br-pxe

3. Create the `br-dcm` network by creating an XML definition file: 

	a. Create the XML file

		cat br-dcm.xml
			<network>
				<name>br-dcm</name>
				<forward mode='bridge'/>
				<bridge name='br-dcm'/>
				<virtualport type='openvswitch'/>
			</network>

	b. Execute the following commands to create and start the network, and configure the network to auto-start

		virsh net-define br-dcm.xml
		virsh net-start br-dcm
		virsh net-autostart br-dcm

6. Use the `virsh net-list` command to view information on the new networks:

		virsh net-list

		Name		State		Autostart		Persistent
		----------------------------------------------------------
		br-bls		active		yes				yes
		br-clm		active		yes				yes
		br-dcm		active		yes				yes
		br-pxe		active		yes				yes
 		default		active		yes				yes

7. Execute the following command to make sure the `br-pxe` network has been assigned an IP address:

		ifconfig br-pxe

	Run following command if the `br-pxe` does not indicate the IP address has been assigned.

		Ifdown br-pxe
		Ifdown <interface>
		Ifup br-pxe
		Ifup <yourinterface>

8. Execute the following command to make sure the `br-pxe` network was assigned the IP address of the primary interface.

		ifconfig | more

9. Reboot the setup.

10. Execute the following command to make sure the primary interface does not have IP address and confirm the IP address of the `br-pxe` network:

				ifconfig | more

10. Execute the following command to view the routing table. Make sure all of the networks are configured as expected.

		Route -n
 
10. Execute the following command to 

11. 2.	Execute the following command to make sure the VLAN ID is as expected.

		ovs-vsctl show

	The output should apprea similar to the following:

		Bridge br-clm
			Port "vnet2"
				Interface "vnet2"
			Port "em1.1551"
				Interface "em1.1551"
			Port br-clm
				Interface br-clm
					type: internal
		Bridge br-pxe
			Port br-pxe
				Interface br-pxe
					type: internal
			Port "vnet1"
				Interface "vnet1"
			Port "em1"
				Interface "em1"
		Bridge br-dcm
			Port br-dcm
				Interface br-dcm
					type: internal
			Port "em1.1550"
				Interface "em1.1550"
			Port "vnet3"
				Interface "vnet3"
		Bridge br-bls
			Port "em1.1554"
				Interface "em1.1554"
			Port br-bls
				Interface br-bls
					type: internal
		ovs_version: "2.0.2"

	**Note:** If `ovs-vsctl show` does not show all the required bridges, bring up the interface where the bridge does not appear:

		ifup br-bls
		ifup br-dcm
		ifup br-clm

## Networking Issues Ubuntu 14.04

Open vSwitch 2.0.x with bridge is not able to ping or SSH after reboot or running Anisble playbooks to create new bridges. This is a known issue in the Ubuntu community. For more details on the issue, see [Networking does not restart](https://bugs.launchpad.net/ubuntu/+source/ifupdown/+bug/1301015).

1. Use the `ifdown` command to make sure the routing table is clean for all interfaces and only the `virbr0 192.168.122.0 net` displays.

2. Manually assign the IP addresses used previously, as shown in the following examples:

		ip addr add 10.10.10.10/24 dev em1
		ip link set em1 up
		route add -net default gw 10.10.10.1
		apt-get purge openvswitch-switch openvswitch-common
		apt-get update
		apt-get install openvswitch-switch
		ip addr flush dev em1
		ifup br-pxe
		ifup br-bls
		ifup br-clm
		ifup br-dcm

Networking will be restored through thE OVS Bridge

<!-- Hide this; might not be needed 

1. On the KVM host, change to the `/root/infra-ansible-playbooks/roles/HLM-CFG/` directory.

		cd /root/infra-ansible-playbooks/roles/HLM-CFG/

2. Create `br-pxe` bridge and virtual network by running:

		ansible-playbook -i hosts hlm-kvm-pre-req.yml

	This will create an extra file under `/etc/network/`.  


3. Verify the interfaces file has four networks: `br-bls`, `br-pxe`, `br-clm`, `br-dcm`.

4. Execute  the following command to make sure the `br-pxe` interface was assiged an IP address:

		ifconfig br-pxe

	Execute the following command if the `br-pxe` interface does not have in IP address:

		Ifdown br-pxe
		Ifdown << yourinterface >>
		Ifup br-pxe
		Ifup << yourinterface >>


5. Run the following command to make sure the `br-pxel` interface has the IP address that was earlier set to the primary interface:

		ifconfig | more

6. Reboot the setup.

7. Run the following command to make sure `br-pxe` has the IP address that was earlier set to the primary interface and primary interface does not have an IP address.

		`ifconfig | more`

8. Use the following command to view the results of the routing configuration:

		route -n
 
	The routing table should appear similar to the following:

	<img src="media/CGH-install-route-table.png" />

-->

## Next Step

[Create the HLM Virtual Machine](/helion/openstack/carrier/install/pb/hlm-vm/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---


