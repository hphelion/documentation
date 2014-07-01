---
layout: default
title: "HP Helion OpenStack&#174; Volume Operations Service Overview"
permalink: /helion/openstack/services/volume/overview/
product: commercial

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/helion/openstack/services/reporting/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/horizon/overview/"> NEXT &#9654</a> </p>

# HP Helion OpenStack&#174; Volume Operations Service Overview #

<!-- modeled after HP Cloud Networking Getting Started (network.getting.started.md) -->

Based on OpenStack&reg; Cinder (Block Storage), the HP Helion OpenStack Volume Operations service enables you to perform a number of tasks with your storage volumes, including creating a volume, creating volume snapshots, and configuring a volume. 

Once created, you can easily disconnect block storage volumes from one instance and attach them to another. You can also create snapshots to easily copy a volume before making significant changes to it. Custom volumes ranging in sizes from 1 GB to 2 TB can be created using a variety of file system types.

**Note:** HP Helion Openstack beta edition uses StoreVirtual as a backend to Cinder to realize horizontally scalable block storage. StoreVirtual is unique in the sense that storage controller runs as a virtual compliance and helps realize Software Defined Block Storage. To use StoreVirtual you must use the KVM hypervisor. 

## Working with the Volume Operations Service ##

To [perform tasks using the Volume Operations service](#howto), you can use the dashboard, API or CLI.

### Using the dashboards {#UI}

You can use the [HP Helion OpenStack Dashboard](/helion/openstack/dashboard/how-works/) to work with the Volume Operations service.

###Using the API ### {#API}
 
You can use a low-level, raw REST API access to HP Volume Operations service. See the [OpenStack Block Storage API v2.0 Reference](http://developer.openstack.org/api-ref-blockstorage-v2.html).

###Using the CLI### {#cli}

You can use any of several command-line interface software to access HP Volume Operations service. See [OpenStack Command Line Interface Reference](http://docs.openstack.org/cli-reference/content/cinderclient_commands.html).

For more information on installing the CLI, see [Install the OpenStack command-line clients](http://docs.openstack.org/user-guide/content/install_clients.html).

## How To's with the HP Helion Volume Operations Service ## {#howto}
 
The following lists of tasks can be performed by a user or administrator through the [HP Helion OpenStack Dashboard](/helion/openstack/dashboard/how-works/), the [API](http://developer.openstack.org/api-ref-blockstorage-v2.html) or [CLI](http://docs.openstack.org/cli-reference/content/cinderclient_commands.html).

Depending upon your user type, [user](#user) or [administrator](#admin), you can perform the following tasks.

### Tasks performed by users ### {#user}

The following Volume Operations service tasks are usually performed by someone with the *user* role.

#### Creating and deleting a volume ###

Use the Volume Operations service to create and delete volumes, snapshots, and back ups.

#### Creating a bootable volume from an image ####

Use the Volume Operations service to create volumes that can be used to boot a virtual machine.

#### Creating and deleting a snapshot of a volume ####

Use the Volume Operations service to create volume snapshots that can be used to create other volumes.

#### Creating and deleting a backup of a volume ####

Use the Volume Operations service to create back ups of a volume or delete a backup that is no longer needed.

#### Creating a volume from a backup ####

Use the Volume Operations service to create a new volume based on a volume backup.

#### Create an image from a volume ####

Use the Volume Operations service to create an image based on an existing volume.

#### Working with volumes ###

Using the HP Volume Operations service, a user can modify volume objects.

- **Update the metadata of a volume** -- Modify the metadata associated with a volume.
- **Rename a volume** -- Change the name of an existing volume.
- **Extend a Volume** -- Increase the storage capacity of a volume.
- **Transfer a volume between users** -- Transfer a volume between users.

### Tasks performed by an Administrator ### {#admin}

The following Volume Operations service tasks are usually performed by someone with the *administrator* role.

#### Create and Delete an encryption type

Use the Volume Operations service to create or delete encryption types.

#### Create and Delete a volume type

Use the Volume Operations service to create or delete volume types.

#### Associate QoS with a volume type

Use the Volume Operations service to enable or disable services.

## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/). The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack takes care of these details for you. The *Operations* section contains information on how to manage the system.
