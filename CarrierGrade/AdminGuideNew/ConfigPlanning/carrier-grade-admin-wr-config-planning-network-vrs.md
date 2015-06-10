---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Planning for Virtual Routers"
permalink: /helion/openstack/carrier/configuration/plan/network/vrs/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Planning for Virtual Routers
<!-- From the Titanium Server Admin Guide -->

Virtual routers provide internal and external network connectivity for tenants.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

The user associated with a tenant can add a designated number of virtual routers (Neutron routers) to the tenant. The maximum number is specified in the [quotas for the tenant](/helion/commercial/carrier/dashboard/managing/quotas/).

The virtual router automatically provides a connection to system services required by the tenant, such as the metadata service that supplies instances with user data. You can configure the virtual routers with interfaces to tenant networks to provide internal and external connectivity.

A virtual router can be implemented as a centralized router, or a distributed virtual router (DVR).

**Note:** Only the admin user can specify a distributed router. For other tenants, this choice is not available, and a centralized router is implemented by default. The admin user can change a centralized router to a distributed router on behalf of other tenants (see [Virtual Router Administration](#admin).

A distributed router cannot be converted to a centralized router.

* **Centralized** - A centralized virtual router is instantiated on a single compute node. All traffic using the router must pass through the compute node.
* **Distributed** - A distributed virtual router is instantiated in a distributed manner across multiple hosts. Distributed virtual routers provide more efficient routing than standard virtual routers for east-west (tenant-to-tenant) or floating IP address traffic. Local traffic is routed within the local host, while external L3 traffic is routed directly between the local host and the gateway router.

To implement the distributed model, a centralized-portion of the router is still deployed on one host. The centralized portion manages north-south (external network) traffic and source network address translation (SNAT) traffic, as well as agents deployed on other hosts. The agents offload the centralized router for east-west (tenant-to-tenant) routing and floating IP network address translation.

To add a virtual router, see [Adding Virtual Routers](#add). 
To create interfaces, see [Configuring Virtual Routers](#config).

## Adding Virtual Routers {#add}

You can add virtual routers to a tenant using the web administration interface or the CLI.

To add a router to a tenant, you must be logged in as the user associated with the tenant.

For more information, see [Creating a Router](/helion/commercial/carrier/dashboard/managing/router/create/)

To attach router interfaces to tenant networks, see [Configuring Virtual Routers](#config).

## Configuring Virtual Routers {#config}
You can create router interfaces to tenant networks using the web administration interface or the CLI.

Before you can create interfaces to tenant networks, you must [create the tenant networks](/helion/commercial/carrier/dashboard/managing/network/create/) and [associated subnets](/helion/commercial/carrier/dashboard/managing/network/subnet/). 

For more information about tenant networks and subnets, see [Planning the Tenant Management Networks](/helion/openstack/carrier/configuration/plan/network/tenant/) and [Managed and Unmanaged Subnets](/helion/openstack/carrier/configuration/plan/network/subnets/).



## Virtual Router Administration {#admin}

Users with administrative privileges can review and edit router information for all tenants.

The [Routers page](/helion/commercial/carrier/dashboard/managing/routers/), accessed from **Admin > System > Routers**, provides central control of all virtual routers. From this page, you can edit router names, change router types, change the status of routers (Up or Down), and delete routers.

Only users with administrative privileges can convert a centralized router to a distributed router.

**Note:** A distributed router cannot be converted to a centralized router.

An administrative user can delete routers on any tenant. A non-administrative user can delete routers on the tenant associated with the user.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----