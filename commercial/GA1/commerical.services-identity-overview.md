---
layout: default
title: "HP Helion OpenStack&#174; Identity Service (Keystone) Overview"
permalink: /helion/openstack/services/identity/overview/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/openstack/services/compute/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/imaging/overview/"> NEXT &#9654</a> </p>
-->

# HP Helion OpenStack&#174; Identity Service (Keystone) Overview #

<!-- modeled after HP Cloud Networking Getting Started (network.getting.started.md) -->

Based on OpenStack Keystone, the HP Helion OpenStack Identity service provides one-stop authentication. 

The Identity service enables you to create and configure users, specify user roles and credentials, and issue security tokens.

The Identity service validates that incoming requests are being made by the user who claims to be making the call. 

Users have a login and may be assigned tokens to access resources. Users can scope their authentication to a project (or, tenant) which then limits where and how their tokens can be used to interact with services. User roles, which are sets of rights and privileges, can be assigned to control access to projects.

**NOTE:** Users can have different roles per project. Actual user role functionality is defined by each separate OpenStack service outside of the Identity service. Refer to the policy.json file for each service in the `/etc/<SERVICENAME>/policy.json` file.

The Identity service will confirm that incoming request are being made by the user who claims to be making the call by validating a set of claims that the user is making. These claims are initially in the form of a set of credentials (username & password, or user access keys). After initial confirmation, the Identity service will issue the user a token which the user can then provide to demonstrate that their identity has been authenticated when making subsequent requests.

**User Authentication** - The Identity service can be configured during initial installation to use either a local, Keystone user authentication system (users and passwords are all created and managed by Keystone) or via an external user management system like LDAP or Microsoft Active Directory system. It is recommended that an external user management system be used for production deployments. The local Keystone user management system is intended to support only limited trials and proof of concept deployments and does not offer the advanced user management functions often required for production deployments.

**User Management** - The HP Helion OpenStack Identity Service tracks users and their permissions. The main components of user management include:

* Users
* Projects
* Roles

**Service management** - The HP Helion OpenStack Identity Service provides a catalog of available services with their API endpoints. The main components of service management are:

* Services
* Endpoints

**Group management** -  The HP Helion OpenStack Identity Service allows administrators to create groups and add users to groups. Then, rather than assign a role to each user individually, assign a role to the group. Every group is in a domain. 

**Domain management** - The HP Helion OpenStack Identity Service allows administrators to create tenants, users, and groups within a domain and assign roles to users and groups.

**Multi-Domain Support** The HP Helion OpenStack identity service allows administrators to create multiple [domains](#domain), which allow for the isolation of projects and users. Users, groups, and projects can be assigned to a specific domain, but might not have rights in other domains. Domain admins manage resources in their own domains. 

## Key Components

The Identity service primarily works on the following key concepts: 

### Domain ### {#domain}

A domain is a high-level container for [projects](#project), [users](#user) and [groups](#group).

Each is owned by exactly one domain. Users, however, can be associated with multiple projects by granting roles to the user on a project, including projects owned by other domains.

Each domain defines a namespace where certain API-visible name attributes exist, which affects whether those names must be globally unique or unique within that domain. In the Identity API, the uniqueness of the following attributes is as follows:

* Domain Name. Globally unique across all domains.

* Role Name. Globally unique across all domains.

* User Name. Unique within the owning domain.

* Project Name. Unique within the owning domain.

* Group Name. Unique within the owning domain.

Each domain can point to its own identity source. For example, LDAP, MySQL, can be identity sources.

**Note:** Domain management is currently not available using the Helion OpenStack v1.1 Horizon-based user dashboard. This initial implementation is targeted at sysadmins and developers interested in creating and deploying Domains for initial proof of concept deployments. Domain support is currently only available through the [CLI](http://docs.openstack.org/cli-reference/content/keystoneclient_commands.html) and [API](http://api.openstack.org/api-ref-identity-v2.html). No domain information is currently visible in the Horizon-based dashboard and users assigned to a domain will not be able to login to Horizon.

To use Keystone v3 in Horizon, for example to use LDAP, you can manually change the settings. See [Configuring Horizon for Keystone v3](/helion/openstack/services/identity/configure/) for instructions and important restrictions. 

### Administrators ### {#admins}

The HP Helion OpenStack Identity service features three types of administrator users:

* Cloud Admins are super admins. This role needs a domain-scope token.
* Domain admins manage users, user groups, and projects in their own domain.
* Project admin can assign roles to users in their project. Requires a project token.

### Project ### {#project}

A collection of users, groups, and/or resources (Compute, Object Storage, etc). Also known as a 'tenant'. Each project name must be unique in an associated domain.

### Users ### {#user}

A user is a person, system, or service who requests access to Helion OpenStack. The Identity authentication service validates incoming requests made by users using the login information provided by the user either through a local Keystone login or an external authentication system. Users are provided tokens to access resources through a service catalog. Users are associated with projects and are assigned roles a project. Each user name must be unique in the associated domain.


### Group ### {#group}

A group is a collection of [users](#user) that is associated with one or more [projects](#project) or [domains](#domain). Each group name must be unique in the associated domain.

### Role ### {#role}

A role defines set of rights and privileges that can be assigned to a user at the domain or project level. A user assuming that role inherits those rights and privileges. A role is also called a *personality*. Each user name must be unique across all of your domains.

### Policies ### {#policy}

A policy is a centralized repository for policy engine rule sets.


### Credentials ### {#creds}

Credentials are data that belongs to, is owned by and is generally only known to a user. This data is used by the user to prove his/her identity. For example:

* Username and password
* An authentication token provided by the Identity Service

### Authentication {#auth}

Authentication is the act of confirming the identity of a user. The Identity service confirms that the incoming request is being made by the user  by validating a set of claims that the user is making. 

###Token### {#token}

A token is a random string that is used to access resources. Each token has a scope that describes which resources are accessible with it.


### Service ### {#service}

An OpenStack service, such as Compute (Nova), Object Storage (Swift), or Image Service (Glance). Provides one or more endpoints through which users can access resources and perform operations.

### Endpoint ### {#endpoint}

A network-accessible address, usually described by a URL, where a service may be accessed.


## Next Steps ## #next}

### Integrate the Identity Service (Keystone) with LDAP/AD

You can optionally [integrate the Identity service with with an existing LDAP directory](/helion/openstack/services/identity/integrate-ldap/) for authentication and authorization services.

## Working with the Identity Service

To [perform tasks using the Identity service](/helion/openstack/services/identity/using/), you can use the [API](http://api.openstack.org/api-ref-identity-v2.html) or [CLI](http://docs.openstack.org/cli-reference/content/keystoneclient_commands.html).

## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/). <!-- The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack takes care of these details for you. The *Operations* section contains information on how to manage the system.-->

 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
