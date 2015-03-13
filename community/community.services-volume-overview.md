---
layout: default
title: "HP Helion OpenStack&#174; Community Block Storage Volume Operations Overview"
permalink: /helion/community/services/volume/overview/
product: community

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/community/services/reporting/overview/">&#9664; PREV</a> | <a href="/helion/community/services/overview/">&#9650; UP</a> | <a href="/helion/community/services/horizon/overview/"> NEXT &#9654</a> </p>
-->

# HP Helion OpenStack&#174; Community Block Storage Volume Operations Overview #

<!-- modeled after HP Cloud Networking Getting Started (network.getting.started.md) -->

The HP Helion OpenStack Community Block Storage Volume Operations uses the OpenStack Cinder (Block Storage) service to manage storage volumes, including creating volumes, creating volume snapshots, and configuring volumes. 

Once created, you can easily disconnect block storage volumes from one instance and attach them to another. You can also create snapshots of these volumes. 

HP Helion OpenStack Community uses StoreVirtual as a backend to Cinder to realize horizontally scalable block storage. StoreVirtual is unique in the sense that the storage controller runs as a virtual appliance and helps realize Software Defined Block Storage. To use StoreVirtual you must use the KVM hypervisor. 


HP Helion OpenStack Community also supports HP StoreServ 3PAR as Cinder backend.




## Working with the Volume Operations Service ##

To perform tasks using the Volume Operations service, you can use the dashboard, API or CLI.

* [Working with HP StoreVirtual VSA](/helion/openstack/1.1/install/vsa/)

* [Working with HP 3PAR StoreServ](/helion/openstack/1.1/install/3par/)



### Using the dashboards<a name="UI"></a>
You can use the [HP Helion OpenStack Dashboard](/helion/community/dashboard/how-works/) to work with the Volume Operations service.

###Using the API<a name="API"></a>
 
You can use a low-level, raw REST API for access to the HP Volume Operations service. See the [OpenStack Block Storage API v2.0 Reference](http://developer.openstack.org/api-ref-blockstorage-v2.html).

###Using the CLI<a name="cli"></a>

You can use any of several command-line interfaces to access HP Volume Operations service. See [OpenStack Command Line Interface Reference](http://docs.openstack.org/cli-reference/content/cinderclient_commands.html).

For more information on installing the CLI, see [Install the OpenStack command-line clients](http://docs.openstack.org/user-guide/content/install_clients.html).

<!--
## How To's with the HP Helion Volume Operations Service<a name="howto"></a>
 
The following lists of tasks can be performed by a user or administrator through the [HP Helion OpenStack Dashboard](/helion/openstack/1.1/dashboard/how-works/), the [API](http://developer.openstack.org/api-ref-blockstorage-v2.html) or [CLI](http://docs.openstack.org/cli-reference/content/cinderclient_commands.html).

Depending upon your user type, [user](#user) or [administrator](#admin), you can perform the following tasks.

### Tasks performed by users<a name="user"></a>

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

- **Update the metadata of a volume** - Modify the metadata associated with a volume.
- **Rename a volume** - Change the name of an existing volume.
- **Extend a Volume** - Increase the storage capacity of a volume.
- **Transfer a volume between users** - Transfer a volume between users.

### Tasks performed by an Administrator<a name="admin"></a>

The following Volume Operations service tasks are usually performed by someone with the *administrator* role.

#### Create and Delete an encryption type

Use the Volume Operations service to create or delete encryption types.

#### Create and Delete a volume type

Use the Volume Operations service to create or delete volume types.

#### Associate QoS with a volume type

Use the Volume Operations service to enable or disable services.-->

## For more information ##

For more general information on how to operate your cloud, refer to the [OpenStack Operations Guide](http://docs.openstack.org/ops/). The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack takes care of these details for you. The *Operations* section contains information on how to manage the system.

 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
