---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Planning the Management Network"
permalink: /helion/openstack/carrier/configuration/plan/network/mgmt/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Planning the Management Network
<!-- From the Titanium Server Admin Guide -->

The internal management network is a private network, only visible internally by the hosts in the cluster.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>


You must consider the following guidelines:

* The management network cannot be a VLAN-tagged network. This restriction is required to accommodate PXE booting of other nodes over the network. To isolate the cluster's management traffic on an L2 switch connected to other networks, use port- or MAC-based VLANs. However, the infrastructure or external OAM networks can use
VLAN tagging to share the same interface.
* You can use any 1G or 10 G interface on the hosts to connect to this network, provided that the interface supports network booting and can be configured from the BIOS as the primary boot device.
* For the IPv4 address plan, use a private IPv4 subnet as specified in RFC 1918. This helps prevent unwanted crossnetwork
traffic on this network.

It is suggested that you use the default subnet and addresses provided by the controller configuration script.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----