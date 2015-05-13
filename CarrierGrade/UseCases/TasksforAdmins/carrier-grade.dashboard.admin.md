---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Administering the HP Helion OpenStack Region"
permalink: /helion/commercial/carrier/dashboard/managing/admin/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Administering HP Helion OpenStack Carrier Grade

The Admin panel in the HP Helion OpenStack Carrier Grade Horizon dashboards enable you to work within the current cloud domain. You can access tools to work with the Compute, Network, Object Operations, and Orchestration services.

<img src="media/HorizonUI_Admin_beta" alt="" width="500" />

As an administrator (admin), you can perform all of the [user tasks](/helion/commercial/carrier/dashboard/managing/nonadmin/) in addition to the admin tasks.

Depending upon the servers you are working with (either the hLinux servers or Wind River Linux servers), you can manage:

* domains
* hypervisors
* host aggregates
* instances
* volumes
* flavors
* images
* networks
* routers
* quotas
* security
* resources
* inventory
* server groups
* fault management
* system configuration
* projects
* users



### Managing Hypervisors ###



### Managing Host Aggregates ###

A host aggregate is a method to subdivide availability zones into *hypervisor pools*, which is a collection of hypervisors grouped together into a collection of common hosts.

For more information, see [Managing Host Aggregates](/helion/commercial/carrier/dashboard/managing/aggregates/).

### Managing instances ###

You can use the dashboards to manage instances created by other users. You can lock, pause, suspend a particular instance and you can also migrate an instance to a different host system.

For more information, see [Managing Instances](/helion/commercial/carrier/dashboard/managing/instances/users/).

### Managing volumes

A volume type defines the characteristics of a volume. It usually maps to a set of capabilities of the storage back-end driver that is used for this volume. 

For more information, see [Creating and Deleting a Volume Types](/helion/commercial/carrier/dashboard/managing/volume/admin/).

### Managing flavors

Compute flavors are machine configurations that describe the amount of memory, number of CPUs, and storage capacity of instances. The moment you register a chassis, a flavor is created by default. You can use the default flavor or create a flavor of your choice.

For more information, see [Managing Compute Flavors](/helion/commercial/carrier/dashboard/managing/flavors/).

### Managing images ###

You can use the dashboards to determine if an image snapshot is available only in the current project or to all projects in the domain. 

For more information, see [Making an Image Public](/helion/commercial/carrier/dashboard/managing/images/public/).


### Managing networks ###

A network is a pluggable, scalable system for managing networks and IP addresses.

You can use the dashboards to create, delete, and configure your HP Helion OpenStack subnet(s) and ports.

For more information, see [Managing Networks](/helion/commercial/carrier/dashboard/managing/networks/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

### Managing routers

A virtual router connects to networks in a cloud environment.

You can enable or disable routers.

For more information, see [Enabling and Disabling a Router](/helion/commercial/carrier/dashboard/managing/router/admin/enable/) and [Deleting a Router](/helion/commercial/carrier/dashboard/managing/router/admin/enable/).

### Managing resources

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

### Managing inventory

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

### Managing server groups

Server Groups is a mechanism to group virtual machines to which a common set of scheduling attributes is applied.

As an admin, you can [create server groups](/helion/commercial/carrier/dashboard/managing/groups/create/).

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

### Managing fault management

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

### Managing system configuration

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

### Managing project quotas ###

You can use the dashboards to manage maximum allowable values for various elements for all projects.

For more information, see [Managing project quotas](/helion/commercial/carrier/dashboard/managing/quotas/).


### Managing users ###

You can use the dashboard to create new users, assign users to projects, and change a user password as needed.

For more information, see [Managing Users](/helion/commercial/carrier/dashboard/managing/users/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

You can use the dashboards to change the password for a user, as needed. 

For more information, see [Changing a User Password](/helion/commercial/carrier/dashboard/managing/users/password/change/).


### Managing projects ###

You can create new projects and manage existing projects, such as controlling access to projects by assigning roles to users and groups.

For more information, see [Managing Projects](/helion/commercial/carrier/dashboard/managing/projects/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>




<!-- Not  in UI yet
### Managing roles ###

You can use the dashboard to define user roles that can be used to control access to projects and domains. 

For more information, see [Managing Roles](/helion/commercial/carrier/dashboard/managing/roles/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
-->



### Viewing information on services

You can view information for OpenStack services.

See [Viewing Services Information](/helion/commercial/carrier/dashboard/managing/system-info/)


----
