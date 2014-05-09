---
layout: default
title: "How To's with the HP Helion OpenStack&#174; Community Identity Service"
permalink: /cloudos/community/services/identity/howto/
product: community

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/community/services/identity/overview">&#9664; PREV</a> | <a href="/cloudos/community/services/overview/">&#9650; UP</a> | <a href="/cloudos/community/services/imaging/overview/"> NEXT &#9654</a> </p>

# How To's with the HP Helion OpenStack&#174; Community Identity Service #

<!-- Taken from http://wiki.hpcloud.net/display/core/Core+Edition+Use+cases#CoreEditionUsecases-OverCloud -->

Based on the OpenStack&reg; Keystone service, the HP Helion OpenStack&#174; Community Identity service provides authentication for all HP Cloud offerings.

The Identity service enables you to create and configure users, specify user roles and credentials, and issue security tokens. 

The following lists of tasks can be performed by a user or administrator through the [HP Helion OpenStack&#174; Community Dashboard](/cloudos/community/services/dashboard/overview/), the OpenStack CLI or OpenStack API.

For details on performing these tasks using the API or CLI, see the following OpenStack documentation:

- [OpenStack Identity API v2.0 Reference](http://api.openstack.org/api-ref-identity-v2.html)
- [OpenStack Command Line Interface Reference](http://docs.openstack.org/cli-reference/content/keystoneclient_commands.html)

Depending upon your user type, [user](#user) or [administrator](#admin), you can perform the following tasks.

## Tasks performed by users ## {#user}

The following Identity service tasks are usually performed by someone with the *user* role.

### Changing a password  ###

Use the Identity service to change the password to your cloud environment.

### Managing default Tenant and Project associations ###

Use the Identity service to configure project associations	.

### Listing Tenants/Projects

Use the Identity service to view a list of projects in your cloud environment.

## Tasks performed by an Administrator ## {#admin}

The following Identity service tasks are usually performed by someone with the *administrator* role.
<!--
### Working with domains ###

Use the Identity service to configure user access to your cloud domains.

#### Managing users in a domain ####

Use the Identity service to configure user access to your cloud domains.

#### Managing users in a domain ####

Use the Identity service to configure the users who have access to your domain and projects.
 
#### Managing projects in a domain ####

Use the Identity service to configure user access to your projects. 

#### Managing user groups in a domain ####

Use the Identity service to configure user group access to your domain.
-->

### Working with roles ###

Use the Identity service to configure user roles within your cloud environment.

#### Managing role definitions ####

Use the Identity service to configure the roles that you can assign.

#### Managing role assignments ####

Use the Identity service to assign users to roles.

#### Managing inherited role assignments ####

Use the Identity service to configure roles inherited from other projects.

<!-- Hiding the following services not in core
### Manage Credentials (NOT CORE??)
### Manage Services (NOT CORE)
### Manage Endpoints (NOT CORE)
### Manage Service Policies (NOT CORE)
### Manage Credentials  (NOT CORE)
### Manage Endpoint Filtering (NOT CORE)
### Issue PKI Token (NOT CORE)
### Issue UUID Token (NOT CORE)
### EC2 Signature Validation (NOT CORE?)
### S3 Signature Validation (NOT CORE)
### Manage OAUTH (NOT CORE)
### Manage Trust (NOT CORE?)
### Federation (NOT CORE) -->

### Resetting a user password ###

Use the Identity service to reset a password for a user.

## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/) The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack&#174; Community edition takes care of these details for you. The *Operations* contains information on how to manage the system.

<!-- hide me Also see the Help topics that are available in the Operational Dashboard and Administration Dashboard.  Website copies are available:

* [HP Cloud OS Operational Dashboard Help](/cloudos/manage/operational-dashboard/)
* [HP Cloud OS Administration Dashboard Help](/cloudos/manage/administration-dashboard/) -->