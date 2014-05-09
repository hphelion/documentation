---
layout: default
title: "HP Helion OpenStack&#174; Community Image Service Overview"
permalink: /cloudos/community/services/imaging/overview/
product: community

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/community/services/identity/howto/">&#9664; PREV</a> | <a href="/cloudos/community/services/overview/">&#9650; UP</a> | <a href="/cloudos/community/services/imaging/howto/"> NEXT &#9654</a> </p>


# HP Helion OpenStack&#174; Community Image Operations Service Overview #

<!-- modeled after HP Cloud Networking Getting Started (network.getting.started.md) -->

The HP Helion OpenStack&#174; Community Operations service is a web service for managing virtual machine images. It provides a set of RESTful APIs that enables querying/updating of image metadata as well as retrieval of the actual image data.

With the Image Operations service you can work with image files, which are virtual disk image files that the [Compute](/cloudos/community/services/compute/overview) service can use to create a virtual machine.

Each image has a name, an unique identifier (UUIDs in hexadecimal string notation) and a specific disc and container format.

### Using the dashboards {#UI}

You can use the [HP Helion OpenStack&#174; Community Dashboard](/cloudos/community/services/dashboard/overview/) to work with the Compute service.


###Using the API to access Imaging### {#API}
 
You can use a low-level, raw REST API access to HP Imaging service. See the [OpenStack Image Service API v2.0 Reference](http://api.openstack.org/api-ref-image.html).

###Using the CLI### {#cli}

You can use any of several command-line interface software to access HP Image service. See the [OpenStack Image Service API v2.0 Reference](http://api.openstack.org/api-ref-image.html).


## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/) The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack&#174; Community edition takes care of these details for you. The *Operations* contains information on how to manage the system.

<!-- hide me Also see the Help topics that are available in the Operational Dashboard and Administration Dashboard.  Website copies are available:

* [HP Cloud OS Operational Dashboard Help](/cloudos/manage/operational-dashboard/)
* [HP Cloud OS Administration Dashboard Help](/cloudos/manage/administration-dashboard/) -->