---
layout: default
title: "HP Helion OpenStack&#174; Identity Service Overview"
permalink: /helion/openstack/services/identity/overview/
product: commercial.ga

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/openstack/services/compute/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/imaging/overview/"> NEXT &#9654</a> </p>
-->

# HP Helion OpenStack&#174; Identity Service Overview #

<!-- modeled after HP Cloud Networking Getting Started (network.getting.started.md) -->

Based on OpenStack Keystone, the HP Helion OpenStack Identity service provides one-stop authentication. 

provides Identity, Token, Catalog and Policy services

It performs the following functions:

* **User Management**- It tracks users and their permissions.The main components are:

	* Users
	* Projects
	* Roles

* **Service catalog**- It provides a catalog of available services with their API endpoints. The main components are:

	* Services
	* Endpoints

The Identity service primarily works on the following key concepts: 

### Domain ### {#domain}

A domain is a high-level container for [projects](#project), [users](#user) and [groups](#group).

### Project ### {#project}

A collection of HP service subscriptions and/or resources (Compute, Object Storage, etc).

### Users ### {#user}

A user is a digital representation of a person, system, or service who uses the cloud. The Identity authentication services validates incoming requests made by users. Users have a login and assigned tokens to access resources. Users are associated with projects based on roles assigned to them within that project.

### Group ### {#group}

A group is a collection of [users](#user) that is associated with one or more [projects](#project) or [domains](#domain).

### Credentials ###

Credentials are data that belongs to, is owned by and is generally only known to a user. This data is used by the user to prove his/her identity. For example:

* Username and password
* An authentication token provided by the Identity Service

### Authentication

It is the act of confirming the identity of a user. The Identity service confirms that the incoming request is being made by the user  by validating a set of claims that the user is making. 

###Token###
A random string that is used to access resources. Each token has a scope that describes which resources are accessible with it.


### Service ###
An OpenStack service, such as Compute (Nova), Object Storage (Swift), or Image Service (Glance). Provides one or more endpoints through which users can access resources and perform operations.

### Endpoint ###
A network-accessible address, usually described by a URL, where a service may be accessed.

### Role ###
A role defines set of rights and privileges that can be assigned to a user. A role is also called a *personality*.

## Keystone with LDAP

Keystone can also use Lightweight Directory Access Protocol (LDAP) as source of authority authentication. <!---LDAP simplifies integration of Identity authentication into an organization's existing directory service and user account management processes.-->

The requests to Identity service are delegated to the LDAP service which authorizes or rejects requests based on the policies that have been defined locally. A token is generated on successful authentication.

<!---The Identity service enables you to create and configure users, specify user roles and credentials, and issue security tokens. The `/etc/keystone/keystone.conf` file maps LDAP attributes to Identity attributes-->

<!---

- **Token** -- An arbitrary bit of text that is used to access resources. Each token has a scope that describes which resources are accessible with it. 

- **Project** -- A collection of HP service subscriptions and/or resources (Compute, Object Storage, etc). Also known as *tenant*.

- **Endpoint** -- A network-accessible address, usually described by URL, where a service may be accessed.

- **Role** -- A set of rights and privileges that can be assigned to a user.  A user assuming that role inherits those rights and privileges. A role is also called a *personality*.

The Identity service validates that incoming requests are being made by the user who claims to be making the call. 

The Identity service enables you to create and configure users, specify user roles and credentials, and issue security tokens. 

Users have a login and may be assigned tokens to access resources. Users can scope their authentication to a project (or, tenant) which then limits where and how their tokens can be used to interact with services. Users are assigned roles that can be used to control access to projects.

The Identity service will confirm that incoming request are being made by the user who claims to be making the call by validating a set of claims that the user is making. These claims are initially in the form of a set of credentials (username & password, or user access keys). After initial confirmation, the Identity service will issue the user a token which the user can then provide to demonstrate that their identity has been authenticated when making subsequent requests.

Users can belong to specific role(s), which is a set of rights and privileges.

## Key Terms ##

- **User** -- A digital representation of a person, system, or service who uses the cloud. Users are associated with tenants based on roles assigned to them with that tenant.

- **Credentials** -- Data that belongs to, is owned by, and generally only known by a user that the user can present to prove they are who they are.

- **Authentication** -- The act of confirming the identity of a user. The Identity service confirms that incoming request are being made by the user who claims to be making the call by validating a set of claims that the user is making. 

- **Token** -- An arbitrary bit of text that is used to access resources. Each token has a scope that describes which resources are accessible with it. 

- **Project** -- A collection of HP service subscriptions and/or resources (Compute, Object Storage, etc). Also known as *tenant*.

- **Endpoint** -- A network-accessible address, usually described by URL, where a service may be accessed.

- **Role** -- A set of rights and privileges that can be assigned to a user.  A user assuming that role inherits those rights and privileges. A role is also called a *personality*. -->

## Working with the Identity Service

To [perform tasks using the Identity service](#howto), you can use the API or CLI.

### Using the dashboards<a name="UI"></a>

You can use the [HP Helion OpenStack Dashboard](/helion/openstack/dashboard/how-works/) to work with the Identity service.

Note: Domain management is not available using the Helion OpenStack Dashboard. You can use the CLI for domain management instead.

###Using the API<a name="API"></a>
 
You can use a low-level, raw REST API to access  HP Identity. See the [OpenStack Identity API v2.0 Reference](http://api.openstack.org/api-ref-identity-v2.html).

###Using the CLI<a name="cli"></a>

You can use the command-line interface software to access HP Identity. See the [OpenStack Command Line Interface Reference](http://docs.openstack.org/cli-reference/content/keystoneclient_commands.html).

For more information on installing the CLI, see [Install the OpenStack command-line clients](http://docs.openstack.org/user-guide/content/install_clients.html).


<!---
## How To's with the HP Helion OpenStack Identity Service<a name="howto"></a>

The following lists of tasks can be performed by a user or administrator through the [HP Helion OpenStack Dashboard](/helion/openstack/dashboard/how-works/), the [API](http://api.openstack.org/api-ref-identity-v2.html) or [CLI](http://docs.openstack.org/cli-reference/content/keystoneclient_commands.html).


Depending upon your user type, [user](#user) or [administrator](#admin), you can perform the following tasks.

### Tasks performed by users<a name="user"></a>

The following Identity service tasks are usually performed by someone with the *user* role.

#### Managing default Project associations ####

Use the Identity service to configure project associations.

#### Listing Projects ####

Use the Identity service to view a list of projects in your cloud environment.

### Tasks performed by an Administrator<a name="admin"></a>

The following Identity service tasks are usually performed by someone with the *administrator* role.

#### Working with domains ###

Use the Identity service to configure user access to your cloud domains.

- Managing users. Configure user access to your cloud domains.
- Managing projects. Configure user access to your projects. 
- Managing user groups. Configure user group access to your domain.

### Working with roles ###

Use the Identity service to configure user roles within your cloud environment.

- Managing role definitions. Configure the roles that you can assign.
- Managing role assignments. Assign users to roles.
- Managing inherited role assignments. Configure roles inherited from other projects.

### Manage Credentials

Create EC2-compatible credentials for user per tenant. 

### Manage Endpoints

Create and delete endpoints associated with a service. 

### Manage Endpoint Filtering

Find endpoint filtered by a specific attribute or service type. 

### Manage Service Policies 

Manage the policy service, a rule-based authorization engine and the associated rule management interface.

### Issue Token

Issue a new UUID or PKI token for a user.

### Signature Validation 

Manage EC2 and S3 signature validation.

### Manage Federated Access 

Configure federated access for use in HP Helion OpenStack.

### Resetting a user password ###

Use the Identity service to reset a password for a user.

--->

## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/). <!-- The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack takes care of these details for you. The *Operations* section contains information on how to manage the system.-->

 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
