---
layout: default
title: "Getting Started with HP Helion OpenStack&#174; Community Image Service"
permalink: /cloudos/community/services/imaging/getting-started/
product: community

---
# Getting Started with HP Helion OpenStack&#174; Community Image Service #

<!-- modeled after HP Cloud Networking Getting Started (network.getting.started.md) -->

The HP Helion OpenStack&#174; Community Image service is a web service for managing virtual machine images. It provides a set of RESTful APIs that enables querying/updating of image metadata as well as retrieval of the actual image data.

Key terms include:

- Image Files -- An image file refers to a virtual disk image file that the Compute service can load up to create a virtual machine.

- Image Metadata -- The metadata of an image includes all the information about the image, e.g. image identifier, name, status, size, disk format, container format, owner, and custom properties. Not all metadata are required to be specified with a value when adding a new image to HP Cloud Image Service

- Name -- Its value should be the name of the image. Note that the name of an image is not unique

- Identifier -- Each image has an identifier, which is guaranteed to be unique to a Region. Images identifiers are UUIDs, commonly represented in hexadecimal string notation.

- Status -- Images in the Image service can be in one the following statuses: queued, saving, active, killed, deleted, or pending_delete.

- Disk and Container Format -- When adding an image to the Image service, specifying the image's disk format and container format is required.

	The disk format of a virtual machine image is the format of the underlying disk image. Virtual appliance vendors have different formats for laying out the information contained in a virtual machine disk image.

	The container format refers to whether the virtual machine image is in a file format that also contains metadata about the actual virtual machine.

- Size -- The image size in Bytes.

- Checksum -- The MD5 checksum of the image file data.

- Min-ram -- The minimum ram required in megabytes to run this image on a HP Compute server. Please refer to HP Compute document for more details about this property.

- Min-disk -- The minimum disk space required in gigabytes to run this image on a HP Compute server. 

- Owner -- The Image Service normally sets the owner of an image to be the Project/Tenant ID of the authenticated user adding the image.

- Custom Image Properties -- The Image Service allows a set of custom, free-form image properties stored with the image metadata. 

###Using the Administration Dashboard### {#dashboard}

You can use the [HP Helion OpenStack&#174; Community Dashboard](/cloudos/community/services/dashboard/overview/) to work with the Identity service.

###Using the API to access Imaging### {#API}
 
You can use a low-level, raw REST API access to the Imaging service. See the [HP Cloud OS Image Service API page](/api/v13/image).

###Using the CLI### {#cli}

You can use any of several command-line interface software to access the Image service. See [HP Cloud OS CLI](/cli/).

###Using language bindings### {#bindings}

You can use any of several language bindings to access the Image service. See [HP Cloud binding support](/bindings/).


## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/) The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack&#174; Community edition takes care of these details for you. The *Operations* contains information on how to manage the system.

<!-- hide me Also see the Help topics that are available in the Operational Dashboard and Administration Dashboard.  Website copies are available:

* [HP Cloud OS Operational Dashboard Help](/cloudos/manage/operational-dashboard/)
* [HP Cloud OS Administration Dashboard Help](/cloudos/manage/administration-dashboard/) -->