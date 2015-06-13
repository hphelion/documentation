---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Configuring Ethernet MTU"
permalink: /helion/openstack/carrier/configuration/plan/ethernet/mtu/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: Systems Administrator 
role2: Cloud Architect 
role3: Storage Administrator 
role4: Network Administrator 
role5: Service Developer 
role6: Cloud Administrator 
role7: Application Developer 
role8: Network Engineer 
authors: Paul F

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/openstack/carrier/services/imaging/overview/">&#9664; PREV</a> | <a href="/helion/openstack/carrier/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/carrier/services/object/overview/"> NEXT &#9654</a> </p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): Configuring Ethernet MTU
<!-- From the Titanium Server Admin Guide -->

The Maximum Transmission Unit (MTU) of an Ethernet frame is a configurable attribute in the HP Helion OpenStack Carrier Grade. Changing its default size must be done in coordination with other network elements on the Ethernet link.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

In HP Helion OpenStack Carrier Grade, the Maximum Transmission Unit (MTU) refers to the largest possible payload on the Ethernet frame on a particular network link. The payload is enclosed by the Ethernet header (14 bytes) and the CRC (4 bytes), resulting in an Ethernet frame that is 18 bytes longer than the MTU size.

The original IEEE 802.3 specification defines a valid standard Ethernet frame size to be from 64 to 1518 bytes, accommodating payloads ranging in size from 46 to 1500 bytes. Ethernet frames with a payload larger than 1500 bytes are considered to be jumbo frames.

For a VLAN network, the frame also includes a 4-byte VLAN ID header, resulting in a frame size 22 bytes longer than the MTU size.

For a VXLAN network, the frame is either 54 or 74 bytes longer, depending on whether IPv4 or IPv6 protocol is used. This is because, in addition to the Ethernet header and CRC, the payload is enclosed by an IP header (20 bytes for Ipv4 or 40 bytes for IPv6), a UDP header (8 bytes), and a VXLAN header (8 bytes).

In the HP Helion OpenStack Carrier Grade, you can configure the MTU size for the following interfaces and networks:

* The management, OAM, and infrastructure network interfaces on the controller. The MTU size for these interfaces is set during initial installation; for more information, see the HP Helion OpenStack Carrier Grade Software Installation Guide: The Controller Configuration Script. You can update the infrastructure interface MTU for the controller from the web administration interface or the CLI.

* Data interfaces on compute nodes. For more information, see the Compute Node entry in Reference Logical Architecture.

* Provider networks. For more information, see the Provider Networks entry in Reference Logical Architecture.

In all cases, the default MTU size is 1500. The minimum value is 576, and the maximum is 9216.

Because data interfaces are defined over physical interfaces connecting to provider networks, it is important to consider the implications of modifying the default MTU size:

* The MTU sizes for a data interface and the corresponding Ethernet interface on the edge router or switch must be compatible. You must ensure that each side of the link is configured to accept the maximum frame size that can be delivered from the other side. For example, if the data interface is configured with a MTU size of 9216 bytes, the corresponding switch interface must be configured to accept a maximum frame size of 9238 bytes, assuming a
VLAN tag is present.

	The way switch interfaces are configured varies from one switch manufacturer to another. In some cases you configure the MTU size directly, while in some others you configure the maximum Ethernet frame size instead.

	In the latter case, it is often unclear whether the frame size includes VLAN headers or not. In any case, you must ensure that both sides are configured to accept the expected maximum frame sizes.

* For a VXLAN network, the additional IP, UDP, and VXLAN headers are invisible to the data interface, which expects a frame only 18 bytes larger than the MTU. To accommodate the larger frames on a VXLAN network, you must specify a larger nominal MTU on the data interface. For simplicity, and to avoid issues with stacked VLAN tagging, some third party vendors recommend rounding up by an additional 100 bytes for calculation purposes. 

	For example, to attach to a VXLAN provider network with an MTU of 1500, a data interface with an MTU of 1600 is recommended.

* A provider network can only be associated with a compute node data interface with an MTU of equal or greater value.

* The MTU size of a compute node data interface cannot be modified to be less than the MTU size of any of its associated provider networks.

* The MTU size of a provider network can be modified only when there are no tenant networks that depend on the provider network.

* The MTU size of a provider network is automatically propagated up to any derived tenant networks.

* The Neutron L3 and DHCP agents automatically propagate the MTU size of their networks to their Linux network interfaces.

* The Neutron DHCP agent makes the option interface-mtu available to any DHCP client request from a virtual machine. The request response from the server is the current interface's MTU size, which can then be used by the client to adjust its own interface MTU size.

* The AVS prevents any AVP-Kernel or AVP-DPDK instances from setting a link MTU size that exceeds the maximum allowed on the corresponding tenant network. No such verification is available for virtio VM instances.

You can configure the MTU size from the web management interface when creating or modifying data interfaces and provider networks. On the CLI, use the option --mtu to modify the MTU size. For example:

		neutron providernet-create common-net --type vlan --mtu 9216

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----