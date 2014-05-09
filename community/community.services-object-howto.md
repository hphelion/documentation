---
layout: default
title: "How To's with the HP Helion OpenStack&#174; Community Service"
permalink: /cloudos/community/services/object/howto/
product: community

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/community/services/object/overview">&#9664; PREV</a> | <a href="/cloudos/community/services/overview/">&#9650; UP</a> | <a href="/cloudos/community/services/orchestration/overview/"> NEXT &#9654</a> </p>


# How To's with the HP Helion OpenStack&#174; Community Object Operations Service #

<!-- Taken from http://wiki.hpcloud.net/display/core/Core+Edition+Use+cases#CoreEditionUsecases-OverCloud -->

Leveraging OpenStack&reg; Storage, HP Helion OpenStack&#174; Community Object Operations service provides a way to store and retrieve objects in a highly redundant cluster of publicly accessible physical machines hosted in HP data centers.

The following lists of tasks can be performed by a user or administrator through the [HP Helion OpenStack&#174; Community Dashboard](/cloudos/community/services/dashboard/overview/), the OpenStack CLI or OpenStack API.

For details on performing these tasks using the API or CLI, see the following OpenStack documentation:

- [OpenStack Object Storage API v2.0 Reference](http://api.openstack.org/api-ref-objectstorage.html)
- [OpenStack Command Line Interface Reference](http://docs.openstack.org/cli-reference/content/swiftclient_commands.html)

Depending upon your user type, you can perform the following tasks.


## Working with containers ##

The Object Operations service allows users to create a storage container, move files to and from that storage container, and delete containers that are no longer needed.

### Creating, modifying and deleting containers ###

Use the Object Operations  service to create configure and delete storage containers as needed.

### Uploading files to a container ###

Use the Object Operations  service to upload files from a local system to your storage container.

### Downloading files from a container ###

Use the Object Operations  service to download files from your container to a local system.

### Deleting files from a container ###

Use the Object Operations  service to delete any of the files in your storage container.


## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/) The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack&#174; Community edition takes care of these details for you. The *Operations* contains information on how to manage the system.

<!-- hide me Also see the Help topics that are available in the Operational Dashboard and Administration Dashboard.  Website copies are available:

* [HP Cloud OS Operational Dashboard Help](/cloudos/manage/operational-dashboard/)
* [HP Cloud OS Administration Dashboard Help](/cloudos/manage/administration-dashboard/) -->