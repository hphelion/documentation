---
layout: default
title: "HP Helion OpenStack&#174; Identity Service Overview"
permalink: /helion/community/services/identity/overview/
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

# HP Helion OpenStack&#174; Identity Service Overview #

<!-- modeled after HP Cloud Networking Getting Started (network.getting.started.md) -->

Based on OpenStack Keystone, the HP Helion OpenStack Identity service provides one-stop authentication. 

The Identity service enables you to create and configure users, specify user roles and credentials, and issue security tokens.

The Identity service validates that incoming requests are being made by the user who claims to be making the call. 

Users have a login and may be assigned tokens to access resources. Users can scope their authentication to a project (or, tenant) which then limits where and how their tokens can be used to interact with services. Users are assigned roles that can be used to control access to projects.

The Identity service will confirm that incoming request are being made by the user who claims to be making the call by validating a set of claims that the user is making. These claims are initially in the form of a set of credentials (username & password, or user access keys). After initial confirmation, the Identity service will issue the user a token which the user can then provide to demonstrate that their identity has been authenticated when making subsequent requests.

Users can belong to specific role(s), which is a set of rights and privileges.


The Identity service provides Identity, Token, Catalog and Policy services:

**User Management** - The HP Helion OpenStack Identity Service tracks users and their permissions. The main components of user management include:

* Users
* Projects
* Roles

**Service management** - The HP Helion OpenStack Identity Service provides a catalog of available services with their API endpoints. The main components of service management are:

* Services
* Endpoints

**Group management** -  The HP Helion OpenStack Identity Service allows administrators to create groups and add users to groups. Then, rather than assign a role to each user individually, assign a role to the group. Every group is in a domain. 

**Domain management** - The HP Helion OpenStack Identity Service allows administrators to create tenants, users, and groups within a domain and assign roles to users and groups.

## Key Components

The Identity service primarily works on the following key concepts: 

### Domain ### {#domain}

A domain is a high-level container for [projects](#project), [users](#user) and [groups](#group).

Each is owned by exactly one domain. Users, however, can be associated with multiple projects by granting roles to the user on a project, including projects owned by other domains.

Each domain defines a namespace where certain API-visible name attributes exist, which affects whether those names must be globally unique or unique within that domain. In the Identity API, the uniqueness of the following attributes is as follows:

    Domain Name. 

    Role Name. Globally unique across all domains.

    User Name. Unique within the owning domain.

    Project Name. Unique within the owning domain.

    Group Name. Unique within the owning domain.


**Note:** Domain management is not available using the Helion OpenStack Dashboard. You can use the [API](#API) or [CLI](#CLI) for domain management instead. Also, any user and associated with a Domain will not be able to login to Horizon.


### Project ### {#project}

A collection of HP service subscriptions and/or resources (Compute, Object Storage, etc). Also called *tenant*. Each project name must be unique in the associated domain.

### Users ### {#user}

A user is a digital representation of a person, system, or service who uses the cloud. The Identity authentication services validates incoming requests made by users. Users have a login and assigned tokens to access resources. Users are associated with projects based on roles assigned to them within that project. Each user name must be unique in the associated domain.

### Group ### {#group}

A group is a collection of [users](#user) that is associated with one or more [projects](#project) or [domains](#domain). Each group name must be unique in the associated domain.

### Role ### {#role}

A role defines set of rights and privileges that can be assigned to a user. A user assuming that role inherits those rights and privileges. A role is also called a *personality*. Each user name must be unique across all of your domains.


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


## Keystone Integration with LDAP/AD {#LDAP}

Keystone can also use an external Lightweight Directory Access Protocol (LDAP) or Microsoft Active Directory as source of authority authentication. Either of these authentication sources are the preferred way to configure Keystone user authentication. The native Keystone authentication function is intended only for proof of concept deployments.

LDAP simplifies integration of Identity authentication into an organization's existing directory service and user account management processes.

The requests to Identity service are delegated to the external LDAP or Microsoft AD service, which authorizes or rejects requests based on the policies that have been defined locally. A token is generated on successful authentication.

The `/etc/keystone/keystone.conf` file maps LDAP attributes to Identity attributes, including: users, roles, credentials, and security tokens.

To configure Identity, set options in the /etc/keystone/keystone.conf file. Modify these examples as needed.
 

To integrate Identity with LDAP

    Enable the LDAP driver in the keystone.conf file:
    Select Text
    1
    2
    3
    	
    [identity]
    #driver = keystone.identity.backends.sql.Identity
    driver = keystone.identity.backends.ldap.Identity

    Define the destination LDAP server in the keystone.conf file:
    Select Text
    1
    2
    3
    4
    5
    6
    7
    	
    [ldap]
    url = ldap://localhost
    user = dc=Manager,dc=example,dc=org
    password = samplepassword
    suffix = dc=example,dc=org
    use_dumb_member = False
    allow_subtree_delete = False

    Create the organizational units (OU) in the LDAP directory, and define their corresponding location in the keystone.conf file:
    Select Text
    1
    2
    3
    4
    5
    6
    7
    8
    9
    	
    [ldap]
    user_tree_dn = ou=Users,dc=example,dc=org
    user_objectclass = inetOrgPerson
    tenant_tree_dn = ou=Groups,dc=example,dc=org
    tenant_objectclass = groupOfNames
    role_tree_dn = ou=Roles,dc=example,dc=org
    role_objectclass = organizationalRole
    [Note]	Note

    These schema attributes are extensible for compatibility with various schemas. For example, this entry maps to the person attribute in Active Directory:
    Select Text
    1
    	
    user_objectclass = person

    A read-only implementation is recommended for LDAP integration. These permissions are applied to object types in the keystone.conf file:
    Select Text
    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    	
    [ldap]
    user_allow_create = False
    user_allow_update = False
    user_allow_delete = False
    tenant_allow_create = False
    tenant_allow_update = False
    tenant_allow_delete = False
    role_allow_create = False
    role_allow_update = False
    role_allow_delete = False

    Restart the Identity service:

    # service keystone restart

    [Warning]	Warning

    During service restart, authentication and authorization are unavailable.

Additional LDAP integration settings. Set these options in the keystone.conf file.

Filters

    Use filters to control the scope of data presented through LDAP.
    Select Text
    1
    2
    3
    4
    	
    [ldap]
    user_filter = (memberof=cn=openstack-users,ou=workgroups,dc=example,dc=org)
    tenant_filter =
    role_filter =
LDAP Account Status

    Mask account status values for compatibility with various directory services. Superfluous accounts are filtered with user_filter.

    For example, you can mask Active Directory account status attributes in the keystone.conf file:
    Select Text
    1
    2
    3
    4
    	
    [ldap]
    user_enabled_attribute = userAccountControl
    user_enabled_mask = 2
    user_enabled_default = 512




## Working with the Identity Service

To [perform tasks using the Identity service](/helion/community/services/identity/using/), you can use the API or CLI.


## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/). <!-- The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack takes care of these details for you. The *Operations* section contains information on how to manage the system.-->

 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
