---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Planning for L2 Access Switches"
permalink: /helion/openstack/carrier/configuration/plan/network/guest/l2/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Planning for L2 Access Switches
<!-- From the Titanium Server Admin Guide -->

L2 access switches connect the HP Helion OpenStack Carrier Grade hosts to the different networks. Proper configuration of the access ports is necessary to ensure proper traffic flow.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

One or more L2 switches can be used to connect the HP Helion OpenStack Carrier Grade hosts to the different networks. When sharing a single L2 switch you must ensure proper isolation of the network traffic. 

**Example:**

The following is an example of how to configure a shared L2 switch:

* one port- or MAC-based VLAN for the internal management network

* one port- or MAC-based VLAN for the OAM network

* one port-based VLAN for the board management network

* one or more sets of VLANs for the, potentially multiple, provider networks. For example:

	* one set of VLANs with good QoS for bronze tenants
	* one set of VLANs with better QoS for silver tenants
	 one set of VLANs with the best QoS for gold tenants

When using multiple L2 switches, there are several deployment possibilities. Here is an example:

* A single L2 switch for the internal management and OAM networks. Port- or MAC-based network isolation is mandatory.

* One or more L2 switches, not necessarily inter-connected, with one L2 switch per provider network.

Switch ports that send tagged traffic are referred to as trunk ports. They usually participate in the Spanning Tree Protocol (STP) from the moment the link goes up, which usually translates into several seconds of delay before the trunk port moves to the forwarding state. This delay is likely to impact services such as DHCP and PXE which are used during regular operations of HP Helion OpenStack Carrier Grade.

Therefore, you must consider configuring the switch ports to which the management interfaces are attached to transition to the forwarding state immediately after the link goes up. This option is usually referred to as a PortFast.

You should also consider configuring these ports to prevent them from participating on any STP exchanges. This is usually done by configuring them to avoid processing inbound and outbound BDPU STP packets completely. Consult your switch's manual for details.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----