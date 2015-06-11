---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Planning the VXLANs"
permalink: /helion/openstack/carrier/config/plan/vxlans/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Planning the VXLANs
<!-- From the Titanium Server Admin Guide -->

You can use Virtual eXtensible Local Area Networks (VXLANs) to connect VM instances across non-contiguous Layer 2 segments (that is, Layer 2 segments connected by one or more Layer 3 routers).

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

A VXLAN is a Layer 2 overlay network scheme on a Layer 3 network infrastructure. Packets originating from VMs and destined for other VMs are encapsulated with IP, UDP, and VXLAN headers and sent as Layer 3 packets. The IP addresses of the source and destination compute nodes are included in the headers.

You can configure VXLANs on HP Helion OpenStack Carrier Grade using the following workflow.

1. Set up a provider network of the VXLAN type. See: 

	* [Setting Up a VXLAN Provider Network using Horizon](/helion/openstack/carrier/config/plan/vxlans/setting/) or 
	* [Setting Up a VXLAN Provider Network using the CLI](/helion/openstack/carrier/config/plan/vxlans/setting-cli/)

2. Configure the endpoint IP addresses of the compute nodes. See: 

	* [Configuring VXLAN Endpoint IP Addresses](/helion/openstack/carrier/config/plan/vxlans/endpoints/)

3. Establish routes between the hosts. See:

	* [Adding and Maintaining Routes for a VXLAN Network](/helion/openstack/carrier/config/plan/vxlans/routes/)

You must also ensure that the networking environment meets certain minimum requirements. For more information, see [Planning the Tenant Networks](/helion/openstack/carrier/configuration/plan/network/tenant/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----