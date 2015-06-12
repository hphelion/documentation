---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Planning the Tenant Networks"
permalink: /helion/openstack/carrier/configuration/plan/network/tenant/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Planning the Tenant Networks
<!-- From the Titanium Server Admin Guide -->

Tenant networks are logical networking entities visible to tenant users, and around which working network topologies are built.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

Tenant networks need support from the physical layers to work as intended. This means that the access L2 switches, providers' networks, and data interface definitions on the compute nodes, must all be properly configured. In particular, when using provider networks of the VLAN or VXLAN type, getting the proper configuration in place requires additional planning.

For provider networks of the VLAN type, consider the following guidelines:

* All ports on the access L2 switches must be statically configured to support all the VLANs defined on the provider networks they provide access to. The dynamic nature of the cloud might force the set of VLANs in use by a particular L2 switch to change at any moment.

* The set of VLANs used by each compute node is not fixed; it changes over time. The current VLAN set in use is determined by the configuration details of the tenant networks, and the scheduling on the compute nodes of the virtual machines that use them. This information is provided to the Neutron's AVS plugin, which then uses it to configure the AVS as required.

	When a tenant creates a new network, the Neutron segmentation allocation strategy is to look first for an available segmentation identifier owned by the tenant. If none is available, the search continues over the available shared segmentation identifiers. The allocation process returns an error if no segmentation identifiers are available.

	The VLAN ID assigned to a tenant network is fixed for as long as the tenant network is defined in the system. If for some reason the VLAN ID has to change, the tenant network must be deleted and recreated again.

* Configuring a tenant network to have access to external networks (not just providing local networking) requires the following elements:

	* A physical router, and the provider network's access L2 switch, must be part of the same Layer-2 network. Because this Layer 2 network uses a unique VLAN ID, this means also that the router's port used in the connection must be statically configured to support the corresponding VLAN ID.
	* The router must be configured to be part of the same IP subnet that the tenant network is intending to use.
	* When configuring the IP subnet, the tenant must use the router's port IP address as its external gateway.
	* The tenant network must have the external flag set. Only the admin user can set this flag when the tenant network is created.

For provider networks of the VXLAN type, consider the following guidelines:

* Layer 3 routers used to interconnect compute nodes must be multicast-enabled, as required by the VXLAN protocol.

* To minimize flooding of multicast packets, IGMP and MLD snooping is recommended on all Layer 2 switches. The AVS switch supports IGMP V1, V2 and V3, and MLD V1 and V2.

* To support IGMP and MDL snooping, Layer 3 routers must be configured for IGMP and MDL querying.

* To accommodate VXLAN encapsulation, the MTU values for Layer 2 switches and compute node data interfaces must allow for additional headers. For more information, see [Configuring Ethernet MTU](/helion/openstack/carrier/configuration/plan/ethernet/mtu/).

* To participate in a VXLAN network, the data interfaces on the compute nodes must be configured with IP addresses, and with route table entries for the destination subnets or the local gateway. For more information, see Configuring Endpoint IP Addresses and Adding and Maintaining Routes for a VXLAN Network.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----