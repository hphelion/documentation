---
layout: default
title: "HP Helion OpenStack&#174; Community Identity Service Overview"
permalink: /cloudos/community/services/identity/overview/
product: community

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/community/services/compute/howto/">&#9664; PREV</a> | <a href="/cloudos/community/services/overview/">&#9650; UP</a> | <a href="/cloudos/community/services/identity/howto/"> NEXT &#9654</a> </p>

# HP Helion OpenStack&#174; Community Identity Service Overview #

<!-- modeled after HP Cloud Networking Getting Started (network.getting.started.md) -->

Based on OpenStack&reg; Keystone, the HP Helion OpenStack&#174; Community Identity service provides one-stop authentication for all HP Cloud offerings. 

The Identity service validates that incoming requests are being made by the user who claims to be making the call. 

Users have a login and may be assigned tokens to access resources. Users can scope their authentication to a tenant which then limits where and how their tokens can be used to interact with services. Users are associated with tenants based on roles assigned to them with that tenant.

The Identity service will confirm that incoming request are being made by the user who claims to be making the call by validating a set of claims that the user is making. These claims are initially in the form of a set of credentials (username & password, or user access keys). After initial confirmation, the Identity Service will issue the user a token which the user can then provide to demonstrate that their identity has been authenticated when making subsequent requests.

Users can belong to specific role(s), which is a set of rights and privileges.

### Using the dashboards {#UI}

You can use the [HP Helion OpenStack&#174; Community Dashboard](/cloudos/community/services/dashboard/overview/) to work with the Identity service.

###Using the API to access Identity### {#API}
 
You can use a low-level, raw REST API access to HP Identity. See the [OpenStack Identity API v2.0 Reference](http://api.openstack.org/api-ref-identity-v2.html).

###Using the CLI### {#cli}

You can use any of several command-line interface software to access HP Identity. See the [OpenStack Command Line Interface Reference](http://docs.openstack.org/cli-reference/content/keystoneclient_commands.html).


## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/) The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack&#174; Community edition takes care of these details for you. The *Operations* contains information on how to manage the system.

<!-- hide me Also see the Help topics that are available in the Operational Dashboard and Administration Dashboard.  Website copies are available:

* [HP Cloud OS Operational Dashboard Help](/cloudos/manage/operational-dashboard/)
* [HP Cloud OS Administration Dashboard Help](/cloudos/manage/administration-dashboard/) -->