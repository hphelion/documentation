---
layout: default
title: "How To's with the HP Helion OpenStack&#174; Community Imaging Service"
permalink: /cloudos/community/services/imaging/howto/
product: community

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/community/services/imaging/overview">&#9664; PREV</a> | <a href="/cloudos/community/services/overview/">&#9650; UP</a> | <a href="/cloudos/community/services/networking/overview/"> NEXT &#9654</a> </p>

# How To's with the HP Helion OpenStack&#174; Community Image Operations Service #

<!-- Taken from http://wiki.hpcloud.net/display/core/Core+Edition+Use+cases#CoreEditionUsecases-OverCloud -->

Based on OpenStack&reg Glance, the HP Helion OpenStack&#174; Community Image Operations service enables you to manage virtual machine images, including querying and updating image metadata, and retrieval of the actual image data.

The following lists of tasks can be performed by a user or administrator use through the [HP Administration Dashboard](/cloudos/manage/administration-dashboard/), the OpenStack CLI or OpenStack API.

For details on performing these tasks using the API or CLI, see the following OpenStack documentation:

- [OpenStack Image Service API v2.0 Reference](http://api.openstack.org/api-ref-image.html)
- [OpenStack Command Line Interface Reference}(
http://docs.openstack.org/cli-reference/content/glanceclient_commands.html)

Depending upon your user type, [user](#user) or [administrator](#admin), you can perform the following tasks.

## Tasks performed by users ## {#user}

The following Image Operations service tasks are usually performed by someone with the *user* role.

### Creating, modifying and deleting a private image ###

Use the Image Operations service to create, delete, or modify a private instance images. 

### Adding and updating metadata for a private image ###

Use the Image Operations service to modify the metadata for a private image.

## Tasks performed by an Administrator ## {#admin}

The following Image Operations service tasks are usually performed by someone with the *administrator* role.

### Creating, modifying, and deleting an image ###

Use the Image Operations service to create, delete, or modify a public instance image. 

### Adding and updating metadata for an image ###

Use the Image Operations service to modify the metadata for a private image.

## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/) The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack&#174; Community edition takes care of these details for you. The *Operations* contains information on how to manage the system.

<!-- hide me Also see the Help topics that are available in the Operational Dashboard and Administration Dashboard.  Website copies are available:

* [HP Cloud OS Operational Dashboard Help](/cloudos/manage/operational-dashboard/)
* [HP Cloud OS Administration Dashboard Help](/cloudos/manage/administration-dashboard/) -->