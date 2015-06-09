---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Planning the Infrastructure Network"
permalink: /helion/openstack/carrier/configuration/plan/network/infra/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Planning the Infrastructure Network
<!-- From the Titanium Server Admin Guide -->

The infrastructure network is a private network visible only to the hosts in the cluster. It is optional unless storage nodes are part of the cluster.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

Ihe infrastructure network shares the design considerations applicable to the internal management network. It can be implemented using either a 1 Gb or 10 Gb Ethernet interface. Unlike the management network, it can be VLAN-tagged, enabling it to share an interface with the management or OAM network.

The decision whether to implement an infrastructure network depends on the infrastructure traffic levels expected.

The following table provides general guidelines on when to implement the infrastructure network, using the number of compute nodes in the HP Helion OpenStack Carrier Grade cluster as an indication of expected traffic levels:


* **2 to 4 nodes** - No infrastructure network required. All infrastructure traffic is carried over the internal management network.
* **5 to 8** - Use 1 Gb Ethernet 
* **9 or more** - Use 10 Gb Ethernet

In addition to the number of compute nodes, other factors must be taken into account when deciding the type of infrastructure network to use. For example, live migration of large, memory-intensive, guest applications is likely to require additional network resources that might not be available in the current configuration. It is always safe toimplement the fastest infrastructure network possible.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----