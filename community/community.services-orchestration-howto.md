---
layout: default
title: "How To's with the HP Helion OpenStack&#174; Community Orchestration Service"
permalink: /cloudos/community/services/orchestration/howto/
product: community

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/community/services/orchestration/overview">&#9664; PREV</a> | <a href="/cloudos/community/services/overview/">&#9650; UP</a> | <a href="/cloudos/community/services/reporting/overview/"> NEXT &#9654</a> </p>

# How To's with the HP Helion OpenStack&#174; Community Orchestration Service #

<!-- Taken from http://docs.openstack.org/user-guide/content/heatclient_commands.html -->

Leveraging OpenStack&reg; Heat, HP Helion OpenStack&#174; Community Orchestration service enbles you to coordinate multiple composite cloud applications using template formats.

The following lists of tasks can be performed by a user or administrator through the [HP Helion OpenStack&#174; Community Dashboard](/cloudos/community/services/dashboard/overview/), the OpenStack CLI or OpenStack API.

For details on performing these tasks using the API or CLI, see the following OpenStack documentation:

- [OpenStack Object Storage API v2.0 Reference](http://api.openstack.org/api-ref-objectstorage.html)
- [OpenStack Command Line Interface Reference](http://docs.openstack.org/cli-reference/content/heatclient_commands.html)

Depending upon your user type, you can perform the following tasks.


## Working with stacks ##

The Orchestration service allows users to work with nested stacks, which are a mechanism of using built-in stack definitions for specific resource types.

### Create the stack ###

Use the Orchestration service to create nested stacks.

### Delete the stack ###

Use the Orchestration service to delete nested stacks.

### Resume the stack ###

Use the Orchestration service to resume the operation of nested stacks.

### Suspend the stack ###

Use the Orchestration service to suspend the operation of nested stacks.

### List the user's stacks ###

Use the Orchestration service to view a list of nested stacks for a specific user.

### Describe the stack ###

Use the Orchestration service to view information on nested stacks.

### List events for a stack ###

Use the Orchestration service to list system events for nested stacks.

### Describe the event ###

Use the Orchestration service to view information on a system event reported by nested stacks.

### Update the stack ###

Use the Orchestration service to configure nested stacks.

### Get the template for the specified stack ###

Use the Orchestration service to view the template used to create a nested stack.

### Validate a template with parameters ###

Use the Orchestration service to validate a nested stack template.

## Working with resources ##

The Orchestration service allows users to work with infrastructure resources, including: servers, floating ips, volumes, security groups, users, and so forth.

### Show list of resources belonging to a stack ###

Use the Orchestration service to show a list of infrastructure resources.

### List resource metadata ###

Use the Orchestration service to show a list of meta data associated with infrastructure resources.

### Describe the resource

Use the Orchestration service to show details of an infrastructure resources.

## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/) The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack&#174; Community edition takes care of these details for you. The *Operations* contains information on how to manage the system.

<!-- hide me Also see the Help topics that are available in the Operational Dashboard and Administration Dashboard.  Website copies are available:

* [HP Cloud OS Operational Dashboard Help](/cloudos/manage/operational-dashboard/)
* [HP Cloud OS Administration Dashboard Help](/cloudos/manage/administration-dashboard/) -->