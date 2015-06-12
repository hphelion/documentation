---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Adding and Maintaining Routes for a VXLAN Network"
permalink: /helion/openstack/carrier/config/plan/vxlans/routes/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Adding and Maintaining Routes for a VXLAN Network
<!-- From the Titanium Server Admin Guide -->

You can add or delete routing table entries for hosts on a VXLAN network using CLI commands.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>


Before making interface changes, you must lock the compute node first.

	system host-lock hostname

	where `hostname` is the name of the compute node host


To add routes, use the following command.

	system host-route-add node ifname network prefix gateway metric

	where

	* `node` is the name or UUID of the compute node
	* `ifname` is the name of the interface
	* `network` is an IPv4 or IPv6 network address 
	* `prefix` is the netmask length for the network address
	* `gateway` is the default gateway
	* `metric` is the cost of the route (the number of hops)

To delete routes, use the following command.

system host-route-delete uuid ifname network prefix gateway metric

	where 

	* `uuid` is the UUID of the route to be deleted.
	* `node` is the name or UUID of the compute node
	* `ifname` is the name of the interface
	* `network` is an IPv4 or IPv6 network address 
	* `prefix` is the netmask length for the network address
	* `gateway` is the default gateway
	* `metric` is the cost of the route (the number of hops)

To list existing routes, including their UUIDs, use the following command.

	system host-route-list


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----