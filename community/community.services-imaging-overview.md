---
layout: default
title: "HP Helion OpenStack&#174; Image Operations Service Overview"
permalink: /helion/community/services/imaging/overview/
product: community

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/community/services/identity/overview/">&#9664; PREV</a> | <a href="/helion/community/services/overview/">&#9650; UP</a> | <a href="/helion/community/services/networking/overview/"> NEXT &#9654</a> </p> -->

# HP Helion OpenStack&#174; Image Operations Service Overview #

Based on OpenStack Glance, the HP Helion OpenStack Image Operations service is a web service for managing virtual machine images. It provides a set of RESTful APIs that enables querying/updating of image metadata as well as retrieval of the actual image data.

With the Image Operations service you can work with image files, which are virtual disk image files that the [HP Helion Compute](/helion/community/services/compute/overview/) service can use to create a virtual machine.

Each image has a name, an unique identifier (UUIDs in hexadecimal string notation) and a specific disc and container format.

## Key terms 

- **Image files** -- An image file refers to a virtual disk image file that the Compute service can load up to create a virtual machine.

- **Private image** -- An image that is available to all users in the project

- **Public images** An image that is available to all users across all projects in a domain.

- **Image metadata** -- The metadata of an image includes all the information about the image, for example: image identifier, name, status, size, disk format, container format, owner, and custom properties. 

- **Name** -- The name of the image. Note that the name of an image is not unique

- **Identifier** -- A unique string that identifies an image. Identifiers are UUIDs, commonly represented in hexadecimal string notation.

- **Status** -- The current state of an image. Images can be in one the following statuses: queued, saving, active, killed, deleted, or pending_delete.

- **Disk and container format** -- When adding an image to the Image Operations service, specifying the image disk format and container format is required.

	The disk format of a virtual machine image is the format of the underlying disk image. Virtual appliance vendors have different formats for laying out the information contained in a virtual machine disk image.

	The container format refers to whether the virtual machine image is in a file format that also contains metadata about the actual virtual machine.

- **Size** -- The image size in Bytes.

- **Checksum** -- The MD5 checksum of the image file data.

- **Minimum RAM** -- The minimum ram required in megabytes to run this image on a HP Compute server. Please refer to HP Compute document for more details about this property.

- **Minimum Disk** -- The minimum disk space required in gigabytes to run this image on a HP Compute server. 

- **Owner** -- The owner of an image, usually the project ID of the authenticated user adding the image.

- **Custom image properties** -- A set of custom, free-form image properties stored with the image metadata. 

## Working with the Image Operations Service

To [perform tasks using the Image Operations service](#howto), you can use the dashboard, API or CLI.

### Using the dashboards<a name="UI"></a>

You can use the [HP Helion OpenStack Dashboard](/helion/community/dashboard/how-works/) to work with the Image Operations service.

###Using the API<a name="API"></a>
 
You can use a low-level, raw REST API access to HP Image Operations service. See the [OpenStack Image Service API v2.0 Reference](http://developer.openstack.org/api-ref-image-v2.html).

###Using the CLI<a name="cli"></a>

You can use any of several command-line interface software to access HP Image service. See the [OpenStack Command Line Interface Reference](http://docs.openstack.org/cli-reference/content/glanceclient_commands.html).

For more information on installing the CLI, see [Install the OpenStack command-line clients](http://docs.openstack.org/user-guide/content/install_clients.html).
<!--
## How To's with the HP Helion OpenStack Image Operations Service<a name="howto"></a>

 Taken from http://wiki.hpcloud.net/display/core/Core+Edition+Use+cases#CoreEditionUsecases-OverCloud 

The following lists of tasks can be performed by a user or administrator through the [HP Helion OpenStack Dashboard](/helion/community/dashboard/how-works/), the OpenStack [CLI](
http://docs.openstack.org/cli-reference/content/glanceclient_commands.html) or OpenStack [API](http://developer.openstack.org/api-ref-image-v2.html).

### Tasks performed by users<a name="user"></a>

The following Image Operations service tasks are usually performed by someone with the *user* role.

#### Creating, modifying and deleting a private image ####

Use the Image Operations service to create, delete, or modify a private instance images. 

#### Adding and updating metadata for a private image ####

Use the Image Operations service to modify the metadata for a private image.

### Tasks performed by an Administrator<a name="admin"></a>

The following Image Operations service tasks are usually performed by someone with the *administrator* role.

#### Creating, modifying, and deleting an image ####

Use the Image Operations service to create, delete, or modify a public instance image. 

#### Adding and updating metadata for an image ####

Use the Image Operations service to modify the metadata for a private image. -->


## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/). The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack takes care of these details for you. The *Operations* section contains information on how to manage the system.

<!-- hide me Also see the Help topics that are available in the Operational Dashboard and Administration Dashboard.  Website copies are available:

* [HP Helion OpenStack Operational Dashboard Help](/helion/community/manage/operational-dashboard/)
* [HP Helion OpenStack Administration Dashboard Help](/helion/community/manage/administration-dashboard/) -->


 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
