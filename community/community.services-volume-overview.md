---
layout: default
title: "HP Helion OpenStack&#174; Community Volume Operations Service Overview"
permalink: /cloudos/community/services/volume/overview/
product: community

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/community/services/reporting/howto/">&#9664; PREV</a> | <a href="/cloudos/community/services/overview/">&#9650; UP</a> | <a href="/cloudos/community/services/volume/howto/"> NEXT &#9654</a> </p>

# HP Helion OpenStack&#174; Community Volume Operations Service Overview #

<!-- modeled after HP Cloud Networking Getting Started (network.getting.started.md) -->

The HP Helion OpenStack&#174; Community Volume Operations service enables you to connect and disconnect block storage volumes from the instances in your cloud project.

Once created, you can easily disconnect block storage volumes from one instance and attach them to another. You can also create snapshots to easily copy a volume before making significant changes to it. Custom volumes ranging in sizes from 1 GB to 2 TB can be created using a variety of file system types.

### Using the dashboards {#UI}

You can use the [HP Helion OpenStack&#174; Community Dashboard](/cloudos/community/services/dashboard/overview/) to work with the Compute service.

###Using the API to access Volume Operations### {#API}
 
You can use a low-level, raw REST API access to HP Volume Operations service. See the [OpenStack Block Storage API v2.0 Reference](http://docs.openstack.org/api/openstack-block-storage/2.0/content/index.html).

###Using the CLI### {#cli}

You can use any of several command-line interface software to access HP Volume Operations service. See [OpenStack Command Line Interface Reference](http://docs.openstack.org/cli-reference/content/cinderclient_commands.html).


## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/) The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack&#174; Community edition takes care of these details for you. The *Operations* contains information on how to manage the system.

<!-- hide me Also see the Help topics that are available in the Operational Dashboard and Administration Dashboard.  Website copies are available:

* [HP Cloud OS Operational Dashboard Help](/cloudos/manage/operational-dashboard/)
* [HP Cloud OS Administration Dashboard Help](/cloudos/manage/administration-dashboard/) -->