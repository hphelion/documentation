---
layout: default
title: "HP Helion OpenStack&#174; Community Compute Service Overview"
permalink: /cloudos/community/services/compute/overview/
product: community

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/community/services/volume/howto/">&#9664; PREV</a> | <a href="/cloudos/community/services/overview/">&#9650; UP</a> | <a href="/cloudos/community/services/compute/howto/"> NEXT &#9654</a> </p>

# HP Helion OpenStack&#174; Community Compute Service Overview#

<!-- modeled after HP Cloud Networking Getting Started (network.getting.started.md) -->

Leveraging OpenStack&reg, the Helion OpenStack&#174; Community Compute Service provides a way to instantiate virtual servers on publicly accessible physical machines hosted in your cloud environment.

Compute allows you to work with *flavors*, which are unique combinations of disk space, memory capacity, and CPU; *images*, which are collections of files used as a base installation, typically operating systems such as Ubuntu 10.10; and *servers*, which are virtual instances created using a flavor and an image

A variety of flavors and images are provided by HP Compute that can be used to create a wide mix of servers.

### Using the dashboards {#UI}

You can use the [HP Helion OpenStack&#174; Community Dashboard](/cloudos/community/services/dashboard/overview/) to work with the Compute service.

###Using the API to access Compute### {#API}
 
You can use a low-level, raw REST API access to HP Compute. See the [OpenStack Compute API v2.0 Reference](http://api.openstack.org/api-ref-compute-v2.html).

###Using the CLI### {#cli}

You can use any of several command-line interface software to access HP Compute. See the [OpenStack Command Line Interface Reference](http://docs.openstack.org/cli-reference/content/novaclient_commands.html).


## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/) The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack&#174; Community edition takes care of these details for you. The *Operations* contains information on how to manage the system.

<!-- hide me Also see the Help topics that are available in the Operational Dashboard and Administration Dashboard.  Website copies are available:

* [HP Cloud OS Operational Dashboard Help](/cloudos/manage/operational-dashboard/)
* [HP Cloud OS Administration Dashboard Help](/cloudos/manage/administration-dashboard/) -->