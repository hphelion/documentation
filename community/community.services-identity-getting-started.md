---
layout: default
title: "Getting Started with HP Helion OpenStack&#174; Community Identity Service"
permalink: /cloudos/community/services/identity/getting-started/
product: community

---
# Getting Started with HP Helion OpenStack&#174; Community Identity Service #

<!-- modeled after HP Cloud Networking Getting Started (network.getting.started.md) -->

Based on OpenStack&reg; Keystone, the HP Helion OpenStack&#174; Community Identity service provides one-stop authentication for all HP Public Cloud offerings. Key terms include:

- User -- A digital representation of a person, system, or service who uses the cloud. The Identity Service validates that incoming requests are being made by the user who claims to be making the call. Users have a login and may be assigned tokens to access resources. Users can scope their authentication to a tenant which then limits where and how their tokens can be used to interact with services. Users are associated with tenants based on roles assigned to them with that tenant.

- Credentials -- Data that belongs to, is owned by, and generally only known by a user that the user can present to prove they are who they are (since nobody else should know that data).

- Authentication -- In the context of the Identity Service, the act of confirming the identity of a user or the truth of a claim. The Identity Service will confirm that incoming request are being made by the user who claims to be making the call by validating a set of claims that the user is making. These claims are initially in the form of a set of credentials (username & password, or user access keys). After initial confirmation, the Identity Service will issue the user a token which the user can then provide to demonstrate that their identity has been authenticated when making subsequent requests.

- Token -- An arbitrary bit of text that is used to access resources. Each token has a scope which describes which resources are accessible with it. While the Identity Service supports token-based authentication in this release, the intention is for it to support additional protocols in the future.

- Tenant -- A collection of HP service subscriptions and/or resources (Compute, Object Storage, etc).

- Endpoint -- A network-accessible address, usually described by URL, where a service may be accessed.

- Role -- A personality that a user assumes when performing a specific set of operations. A role includes a set of rights and privileges. A user assuming that role inherits those rights and privileges. A token that is issued to a user includes the list of roles that user can assume. Services that are being called by that user determine how they interpret the set of roles a user has and which operations or resources each roles grants access to.


###Using the Administration Dashboard### {#dashboard}

You can use the [HP Helion OpenStack&#174; Community Dashboard](/cloudos/community/services/dashboard/overview/) to work with the Identity service.



###Using the API to access Identity### {#API}
 
You can use a low-level, raw REST API access to HP Cloud OS Identity. See the [HP Cloud OS Identity Service API page](/api/v13/identity).

###Using the CLI### {#cli}

You can use any of several command-line interface software to access HP Cloud OS Identity. See [HP Cloud OS CLI](/cli/).

###Using language bindings### {#bindings}

You can use any of several language bindings to access HP Cloud OS Identity. See [HP Cloud binding support](/bindings/).


## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/) The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack&#174; Community edition takes care of these details for you. The *Operations* contains information on how to manage the system.

<!-- hide me Also see the Help topics that are available in the Operational Dashboard and Administration Dashboard.  Website copies are available:

* [HP Cloud OS Operational Dashboard Help](/cloudos/manage/operational-dashboard/)
* [HP Cloud OS Administration Dashboard Help](/cloudos/manage/administration-dashboard/) -->