---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Performing a Cinder Volume Backup"
permalink: /helion/openstack/carrier/admin/backup/cinder/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: All

authors: Paul F

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/openstack/1.1/3rd-party-license-agreements/">&#9664; PREV</a> | <a href="/helion/openstack/1.1/">&#9650; UP</a> | NEXT &#9654; </p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): Performing a Cinder Volume Backup
<!-- From the Titanium Server Admin Guide -->

Cinder volume backups are executed selectively, one volume at a time. They can include virtual disk images and any other Cinder volumes available in the system.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

* Aim at backing up an idle system

	In an idle system there are no running virtual machines. You have gracefully shut down all guest images and therefore there are no entities actively modifying data on any of the Cinder volumes. All volumes are reported to be in the available state. This is an ideal scenario in that you can ensure that the current content of all volumes can be replicated on a future backup restore operation.

	In non-idle systems some Cinder volumes are in the in-use state. They are either disk images or attached storage resources for running instances. The best you can do is to back up volume snapshots, and hope to do well ignoring any further changes induced by the active instances.

	Instructions to back up Cinder volumes in available and in-use states are provided in the following sections.

* Back up one volume at a time

	Backing up Cinder volumes can be a time- and space- consuming process, as determined by the size of the volumes themselves. Having two or more backup processes running simultaneously is likely to result in a severe performance hit to the controller and the running instances. This not only slows the normal system operations, but also makes the backup operations themselves take much longer.

* Clean up as soon as possible

	Backup files for Cinder volumes can fill up the /opt/backups partition on the controller very quickly. This is likely to cause further backup operations to fail in the middle of the execution. Therefore, as soon as a Cinder volume is backed up, and its backup files transferred and securely stored elsewhere:

	* remove any snapshots you may have created during the backup process
	* remove the backup files themselves

The process for backing up Cinder volumes is different if a volume is in use or is available:

* [Backing Up Available Cinder Volumes](#available)
* [Backing Up In-Use Cinder Volumes](#inuse)


## Backing Up Available Cinder Volumes {#available}

You can back up Cinder volumes in the available state.

A Cinder volume in the available state is the ideal candidate for a backup operation in that there are no running instances using it.

1. Log in as user `admin` to the active controller.

2. Log in as user `wrsroot` to the active controller and source the script `/etc/nova/openrc` to obtain administrative privileges as described in [Linux User Accounts](/helion/openstack/carrier/admin/linux/users/).

3. Use the following command to identify the volume you want to back up.

		cinder list --all-tenants

4. Use the following command to export the target volume to the controller's file system.

		cinder export <UUID>

	Where <UUID> is the idenitifcation number of the volume to back up.

	Exporting the volume takes some time, longer times for larger volumes. While it is taking place, the status of the volume is set to exporting, which you can verify by issuing the command cinder show UUID, or cinder list again. This new state is automatically reported on the Web administration interface.

	You must wait for the export operation to complete. Use the command `cinder show <UUID>` for the backup_status field to determine whether the export operation was successful. The state of the volume should be set to `available` again.

	When the export operation completes, the backup file is ready.

5. Transfer the backup file to an external storage resource using a tool such as SCP.

	The following example uses the scp command to transfer the backup file to the directory /backups/hos on a server named backups-server.backupsserver:

	scp /opt/backups/volume-53ad007a-841a-4fd3.tgz admin@backups-server.backupsserver:/backups/hos

5. Delete the backup file.

You may want to free up disk space on the controller to accommodate additional Cinder volume backups.

The volume backup is complete. Repeat this procedure with all other Cinder volumes in the available state in the system.

## Backing Up In-Use Cinder Volumes {#inuse}

You can back up Cinder volumes in the in-use state.

A Cinder volume in the in-use state is associated with a running instance, either as the instance's disk image or as an attached storage resource. In both cases, you must take a snapshot of the volume first, and then export it to the controller's file system.

1. Log in as Keystone user `admin` to the active controller.

2. Log in as user `wrsroot` to the active controller and source the script `/etc/nova/openrc` to obtain administrative privileges as described in [Linux User Accounts](/helion/openstack/carrier/admin/linux/users/).

3. Use the following command to identify the volume you want to back up.

		cinder list --all-tenants

4. Use the following command to create a volume snapshot.

		cinder snapshot-create --force True --display-name <name> <UUID>

	Where <name> is the name to assign to the snapshot and <UUID> is the identifier of the volume to snapshot. 

	You must wait until it becomes available before proceeding.

	You can verify the status of all Cinder snapshots using the following command:

	cinder snapshot-list --all-tenants

5. Use the following command to export the snapshot to the controller file system.

		cinder snapshot-export <name>

	Where <name> is the snapshot to export.

	When the export operation completes, the backup file is ready.

6. Transfer the backup file to an external storage resource using a tool such as SCP.

	The following example uses the scp command to transfer the backup file to the directory /backups/hos on a server named backups-server.backupsserver:

	scp /opt/backups/volume-53ad007a-841a-4fd3.tgz admin@backups-server.backupsserver:/backups/hos

7. Use the following command to delete the snapshot. Once the snapshot has been exported, you should remove it from the Cinder repositories to free up disk space.

		cinder snapshot-delete <name>

	Where <name> is the snapshot to delete

	
7. Delete the backup file.

	You might want to free up disk space on the controller to accommodate additional Cinder volume backups.

The volume backup is complete. Repeat this procedure with all other Cinder volumes in the in-use state in the system.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
