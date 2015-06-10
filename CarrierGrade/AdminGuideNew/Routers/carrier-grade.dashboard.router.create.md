---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Creating a Router"
permalink: /helion/commercial/carrier/dashboard/managing/router/create/
product: carrier-grade

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/commercial/carrier/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/carrier/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/carrier/ga1/">NEXT &#9654;</a></p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): Creating a Router

A network connects to the router through an interface. You must create an interface between the network and router to remotely connect to the network and any instances on that network through the router.

When you create a new router, the router does not have any internal interface and it is not associated to any subnet. You can optionally specify an external gateway after creating the router. 

### Create a router ###

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Project** dashboard, then the **System** panel, then the **Routers** link.

	The routers for the selected project appear. 

3. Click **Create Router**.

4. On the **Create router** tab enter a name for the network.

5. Select the type of router:

	* **Use Server Default** - Use the default setting specified on the controller (for a standard HP Helion OpenStack Carrier Grade installation, centralized).
	* **Centralized** - Add a centralized virtual router.
	* **Distributed** - Add a distributed virtual router (DVR).
	
	For more information about types of routers, see [Planning for Virtual Routers](/helion/openstack/carrier/configuration/plan/network/).

	Note: The **Router Type** field is shown only for the admin user. For other tenants, a centralized router is added.The admin user can change this setting on behalf of another tenant after the router has been added (see [Virtual Router Administration](/helion/openstack/carrier/configuration/plan/network/#admin).

5. Click **Create Router**.  


As an alternative to the web administration interface, you can use CLI commands to add a router. First, become the appropriate keystone user (this example sources the admin user):

	source etc/nova/openrc

To create a router from the CLI, use the neutron router-create command. For example:

	neutron router-create router_name --distributed=True

	where `router_name` is a name assigned to the router. This example creates a distributed virtual router. If the -- distributed option is omitted, the default setting (centralized) is used.

To list routers:

	neutron router-list

To show details for a router:

	neutron router-show router_id

To update a router:

	neutron router-update router_id --distributed=True

	where `router_id` is the name or UUID of the router. This example updates a router to make it a distributed virtual router.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
