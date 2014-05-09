---
layout: default
title: "HP Helion OpenStack&#174; Community Networking Service Overview"
permalink: /cloudos/community/services/networking/overview/
product: community

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/community/services/imaging/howto/">&#9664; PREV</a> | <a href="/cloudos/community/services/overview/">&#9650; UP</a> | <a href="/cloudos/community/services/networking/howto/"> NEXT &#9654</a> </p>


# HP Helion OpenStack&#174; Community Networking Service Overview #

<!-- modeled after HP Cloud Networking Getting Started (network.getting.started.md) -->

Leveraging OpenStackOpenStack&reg; Networking, HP Helion OpenStack&#174; Community Networking is a virtual networking service that provides network connectivity and addressing for HP Compute devices.

You can use the default network to deploy Compute virtual servers, or modify the default network to expand networking capabilities.

You can now define and configure your own virtual network topology, including control of IP address ranges.

### Using the dashboards {#UI}

You can use the [HP Helion OpenStack&#174; Community Dashboard](/cloudos/community/services/dashboard/overview/) to work with the Networking service.

###Using the API to access Compute### {#API}
 
You can use a low-level, raw REST API access to Networking. See the [OpenStack Compute API v2.0 Reference](http://api.openstack.org/api-ref-networking.html).

###Using the CLI### {#cli}

You can use any of several command-line interface software to access Networking. See the [OpenStack Command Line Interface Reference](http://docs.openstack.org/cli-reference/content/neutronclient_commands.html).

## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/) The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack&#174; Community edition takes care of these details for you. The *Operations* contains information on how to manage the system.

<!-- hide me Also see the Help topics that are available in the Operational Dashboard and Administration Dashboard.  Website copies are available:

* [HP Cloud OS Operational Dashboard Help](/cloudos/manage/operational-dashboard/)
* [HP Cloud OS Administration Dashboard Help](/cloudos/manage/administration-dashboard/) -->