---
layout: default
title: "How To's with the HP Helion OpenStack&#174; Community Volume Operations Service"
permalink: /cloudos/community/services/volume/howto/
product: community

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/community/services/volume/overview">&#9664; PREV</a> | <a href="/cloudos/community/services/overview/">&#9650; UP</a> | <a href="/cloudos/community/services/compute/overview/"> NEXT &#9654</a> </p>

# How To's with the HP Helion OpenStack&#174; Community Volume Operations Service #

<!-- Taken from http://wiki.hpcloud.net/display/core/Core+Edition+Use+cases#CoreEditionUsecases-OverCloud -->

Based on OpenStack&reg; Cinder, the HP Helion OpenStack&#174; Community Volume Operations service enables you to perform a number of tasks with your storage volumes, including creating a volume, creating volume snapshots, and configuring a volume. 

The following lists of tasks can be performed by a user or administrator through the [HP Helion OpenStack&#174; Community Dashboard](/cloudos/community/services/dashboard/overview/), the OpenStack CLI or OpenStack API.

For details on performing these tasks using the API or CLI, see the following OpenStack documentation:

- [OpenStack Block Storage API v2.0 Reference](http://docs.openstack.org/api/openstack-block-storage/2.0/content/index.html)
- [OpenStack Command Line Interface Reference](http://docs.openstack.org/cli-reference/content/cinderclient_commands.html)

Depending upon your user type, [user](#user) or [administrator](#admin), you can perform the following tasks.

## Tasks performed by users ## {#user}

The following Volume Operations service tasks are usually performed by someone with the *user* role.

### Creating and deleting Volume objects ###

Use the Volume Operations service to create and delete volumes, snapshots, and back ups.

#### Creating and deleting a volume ####

Use the Volume Operations service to create new volumes or delete volumes no longer needed.

#### Creating a bootable volume from an image ####

Use the Volume Operations service to create a volume that can be used to boot a virtual machine.

#### Creating and deleting a snapshot of a volume ####

Use the Volume Operations service to create a volume snapshot that can be used to create other volumes.

<!-- Using the CLI:

	cinder snapshot-create 
		[--force <True|False>]
		[--display-name <display-name>]
		[--display-description <display-description>]
		<volume>

	Where:
		volume -- Enter an original name for the snapshot.
		force  -- Optionally enter True to indicate whether to snapshot a volume even if it's attached to an instance. This is false by default.  
		display-name -- Optionally enter a name.
		display-description -- Optionally, enter a description for the snapshot.

Using the API:

	POST /v2/{tenant_id}/snapshots​{?snapshot,​volume_id,​force,​display_name,​display_description}

	Where:

| Attribute     | Type        | Description  |
| :-------------------- | :------------------- | :---------- 
| tenant_id     | String        | The unique identifier of the tenant or account.  |
| snapshot| String (Required)| A partial representation of a snapshot used in the creation process.|
| volume_id| ​String (Required)| To create a snapshot from an existing volume, specify the ID of the existing volume.|
| force| Boolean (Optional)| [True/False] Indicate whether to snapshot, even if the volume is attached. Default==False.|
| display_name| String (Optional)| Name of the snapshot. Default==None.|
| display_description| ​String (Optional)| Description of snapshot. Default==None.|	-->

#### Creating and deleting a backup of a volume ####

Use the Volume Operations service to create a back up of a volume or delete a back up that is no loner needed.

#### Creating a volume from a backup ####

Use the Volume Operations service to create 

#### Create an image from a volume ####

Use the Volume Operations service to create an image based on an existing volume.

### Working with volumes ###

Using the HP Volume Operations service, a user can modify volume objects.

#### Update the metadata of a volume ####

Use the Volume Operations service to modify the metadata associated with a volume.

#### Rename a volume ####

Use the Volume Operations service to change the name of an existing volume.

#### Extend a Volume ####

Use the Volume Operations service to increase the storage capacity of a volume.

#### Transfer a volume between users ####

Use the Volume Operations service to transfer a volume between users.

## Tasks performed by an Administrator ## {#admin}

The following Volume Operations service tasks are usually performed by someone with the *administrator* role.

### Modify the quota values of a project ###

Use the Volume Operations service to change the maximum number of Volume objects that can be assigned to a project.

### Enable / Disable a service ###

Use the Volume Operations service to enable or disable services.

<!-- Hiding the following, not in Core
Create / Delete an encryption type
Create / Delete a volume type
Associate QoS with a volume type -->


## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/) The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack&#174; Community edition takes care of these details for you. The *Operations* contains information on how to manage the system.

<!-- hide me Also see the Help topics that are available in the Operational Dashboard and Administration Dashboard.  Website copies are available:

* [HP Cloud OS Operational Dashboard Help](/cloudos/manage/operational-dashboard/)
* [HP Cloud OS Administration Dashboard Help](/cloudos/manage/administration-dashboard/) -->