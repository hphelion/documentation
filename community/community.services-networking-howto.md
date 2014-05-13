---
layout: default
title: "How To's with the HP Helion OpenStack&#174; Community Networking Service"
permalink: /cloudos/community/services/networking/howto/
product: community

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/community/services/networking/overview">&#9664; PREV</a> | <a href="/cloudos/community/services/overview/">&#9650; UP</a> | <a href="/cloudos/community/services/object/overview/"> NEXT &#9654</a> </p>

# How To's with the HP Helion OpenStack&#174; Community Networking Service #

<!-- Taken from http://wiki.hpcloud.net/display/core/Core+Edition+Use+cases#CoreEditionUsecases-OverCloud -->

Based on OpenStack&reg Networking, the HP Helion OpenStack&#174; Community Networking service is a virtual networking service that provides network connectivity and IP addressing for HP Compute devices. 

The following lists of tasks can be performed by a user or administrator use through the [HP Administration Dashboard](/cloudos/manage/administration-dashboard/), the OpenStack CLI or OpenStack API.

For details on performing these tasks using the API or CLI, see the following OpenStack documentation:

- [OpenStack Networking API v2.0 Reference](http://api.openstack.org/api-ref-networking.html)
- [OpenStack Command Line Interface Reference](http://docs.openstack.org/cli-reference/content/neutronclient_commands.html)

Depending upon your user type, [user](#user) or [administrator](#admin), you can perform the following tasks.

## Tasks performed by users ## {#user}

The following Networking service tasks are usually performed by someone with the *user* role.

### Working with networks ###

The Networking service enables you to perform the following tasks with your network.

#### Creating, modifying and deleting a network ####

Use the Networking service to create, delete, and modify your network, as needed.

#### Creating, modifying and deleting a port on a Network ####

Use the Networking service to create, delete, and modify ports on your network.

#### Allocating and de-allocating a floating IP address ####

Use the Networking service to allocate floating IP addresses that can be associated with the instances on your netowrks.

### Associating and disassociating a floating IP address ####

Use the Networking service to associate floating IP addresses with the instances on your networks.

### Working with routers ###

The Networking service enables you to perform the following tasks with the routers on your network.

#### Creating, modifying and deleting a router ####

Use the Networking service to create, delete, and modify your the router attached to your network, as needed.

#### Adding and removing a subnet to a network ####

Use the Networking service to create, delete, and modify subnets associated with your network, as needed.

#### Adding and removing a network to a router ####

Use the Networking service to attach or detach a network to your router, as needed.

### Adding and removing an external network to a Router ####

Use the Networking service to attach or detach an external network to your router, as needed.

### Working with routers ###

The Networking service enables you to perform the following tasks with the security groups associated with your network.

### Creating, modifying and deleting a security group ####

Use the Networking service to create, delete, and modify the security groups associated with your network.

### Creating, modifying and deleting a security group rule ####

Use the Networking service to create, delete, and modify the security groups rules associated with your security groups.

## Tasks performed by an Administrator ## {#admin}

The following Networking service tasks are usually performed by someone with the *administrator* role.

### Creating an external Network ###

Use the Networking service to create an external network for your environment.

### Modify the quota values of a project ###

Use the Networking service to change the number of networking objects that you can work with.

### Adding and removing a network to a DHCP agent ####

Use the Networking service to add or remove a network from a DHCP agent.

### Adding and removing a router to an L3 agent ####

Use the Networking service to add or remove a network from an L3 agent.


## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/) The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack&#174; Community edition takes care of these details for you. The *Operations* contains information on how to manage the system.

<!-- hide me Also see the Help topics that are available in the Operational Dashboard and Administration Dashboard.  Website copies are available:

* [HP Cloud OS Operational Dashboard Help](/cloudos/manage/operational-dashboard/)
* [HP Cloud OS Administration Dashboard Help](/cloudos/manage/administration-dashboard/) -->