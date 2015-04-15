---
layout: default
title: "HP Helion OpenStack&#174; Using the Identity Service"
permalink: /helion/community/services/identity/using/
product: community

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/community/services/compute/overview/">&#9664; PREV</a> | <a href="/helion/community/services/overview/">&#9650; UP</a> | <a href="/helion/community/services/imaging/overview/"> NEXT &#9654</a> </p>
-->

# HP Helion OpenStack&#174; Using the Identity Service #

Based on OpenStack Keystone, the HP Helion OpenStack Identity service provides one-stop authentication. 

The following lists of tasks can be performed by a user or administrator through the [HP Helion OpenStack Dashboard](/helion/community/dashboard/how-works/), the [API](http://api.openstack.org/api-ref-identity-v2.html) or [CLI](http://docs.openstack.org/cli-reference/content/keystoneclient_commands.html).

### Using the dashboards {#UI}

You can use the [HP Helion OpenStack Dashboard](/helion/community/dashboard/how-works/) to work with many aspects of the Identity service.

**Note**: [Domain management](#userdomains) is not available using the Helion OpenStack Dashboard. You can use the CLI for [domain management](#userdomains) instead.

###Using the API {#API}
 
You can use a low-level, raw REST API to access the Identity service. See the [OpenStack Identity API v2.0 Reference](http://api.openstack.org/api-ref-identity-v2.html).

###Using the CLI {#cli}

You can use the command-line interface software to access the Identity service. See the [OpenStack Command Line Interface Reference](http://docs.openstack.org/cli-reference/content/keystoneclient_commands.html).

For more information on installing the CLI, see [Install the OpenStack command-line clients](http://docs.openstack.org/user-guide/content/install_clients.html).


Depending upon your user type, [user](#user) or [administrator](#admin), you can perform the following tasks.

## Tasks performed by users {#user}

The following Identity service tasks are usually performed by someone with the *user* role.


### Working with domains {#userdomains}
A domain is a high-level container for [projects](/helion/community/services/identity/overview/#project), [users](/helion/community/services/identity/overview/#user) and [groups](/helion/community/services/identity/overview/#group). Each is owned by exactly one domain. Users, however, can be associated with multiple *projects* by granting roles to the user on a project, including projects owned by other domains.

Domain management is not available using the Helion OpenStack Horizon console. You can use the [API](/helion/community/services/identity/overview/#API) or [CLI](/helion/community/services/identity/overview/#CLI) for domain management instead. Also, any user and associated with a Domain will not be able to log in to Horizon.

Use the Identity service to configure user access to your cloud domains.

* View information on all your domains, including names, enabled status, ID, and policy links.
* View information on a specified domain, including the description, enabled status, ID, and policy links.
* Delete a domain.
* List the domain roles for a specified user.
* List domain roles for a specified domain group.
* Grant a specified role to a domain group.
* Validate that a group has a specified role on a domain.
* Revoke a role from a group on a domain.

Each domain defines a namespace where certain API-visible name attributes exist, which affects whether those names must be globally unique or unique within that domain. In the Identity API, the uniqueness of the following attributes is as follows:

* Domain Name
* Role Name: Globally unique across all domains
* User Name: Unique within the owning domain.
* Project Name: Unique within the owning domain
* Group Name: Unique within the owning domain

### Listing Projects ####

Use the Identity service to view a list of projects in your cloud environment.

### Working with projects ### {#userprojects}

All project-level tasks must be performed by an administrator.

## Tasks performed by an Administrator<a name="admin"></a>

The following Identity service tasks are usually performed by someone with the *administrator* role.

### Working with domains ### {#admindomains}

Use the Identity service to configure user access to your cloud domains.

* Add a domain to your cloud.
* Update information for a specified domain, including the description, enabled status, ID, and policy links. 

### Working with projects ### {#adminprojects}

* Add a project to a domain.
* View information on all your projects, including names, enabled status, and ID.
* View information on a specified project, including the name, enabled status, and ID.
* Update a specified project, including the description, enabled status, ID, and policy links. 
* Delete a project.
* List the project roles for a specified user or group.
* Grant a specified role to a project user or group.
* Validate that a project user or group has a specified role.
* Revoke a role from a project user or group.

### Working with users ### {#adminusers}

* Add a user to a project.
* View information on all your users, including names and enabled status.
* View information on a specified user, including the name and enabled status.
* Update a specified user, including the description, enabled status, ID, and policy links. 
* Delete a user.
* List the project, group, and roles associated with a specified user.

### Working with groups ### {#adminusers}

* Add a group to a domain.
* View information on the groups associated with a domain, including names, descriptions, and policy links.
* View information on a specific group, including the name, description, and policy links.
* Update a specified group, including the description, enabled status, ID, and policy links. 
* Delete a group.
* List the users in a group, including the name, description, and enabled status.
* Add and remove users from a group.
* Validate that a user is in a specific group.

### Working with credentials ### {#admincreds}

Use the Identity service to create and manage EC2-compatible credentials for user per tenant. 

* Add a credential to a domain.
* View information on the credentials associated with a domain, including IDs, policy links, associated projects, type, and associated users.
* View information on a specific credential.
* Update a specified credential, including the description, enabled status, ID, and policy links. 
* Delete a credential.

### Working with roles ### {#adminroles}

Use the Identity service to configure user roles within your cloud environment.

* Add a role to a domain.
* View information on the roles associated with a domain, including names, IDs, and policy links.
* Assign a role to a domain user.
* Validate that a user has a specific role.
* Revoke a role from a user.
* List role assignments for a group or user.

### Manage Policies ### {#adminpolicy}

Use the Identity service to configure policies.

* Add a role to a project.
* View information on the policies associated with a domain, including names, IDs, and the user that owns the policy.
* Update a specified policy, including names, IDs, and the user that owns the policy. 
* Delete a policy.

<!--**REVIEWERS: ARE ADMINS ABLE TO PERFORM THESE TASKS? THEY CAME FROM AN EARLIER DRAFT OF THE IDENTITY DOCS.** 

### Manage Endpoints

Create and delete endpoints associated with a service. 

### Manage Endpoint Filtering

Find endpoint filtered by a specific attribute or service type. 

### Issue Token

Issue a new UUID or PKI token for a user.

### Signature Validation 

Manage EC2 and S3 signature validation.

### Manage Federated Access 

Configure federated access for use in HP Helion OpenStack.

### Resetting a user password ###

Use the Identity service to reset a password for a user.

-->


## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/). <!-- The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack takes care of these details for you. The *Operations* section contains information on how to manage the system.-->

 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
