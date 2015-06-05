---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Performing a System Data Restore"
permalink: /helion/openstack/carrier/admin/backup/restore/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Performing a System Data Restore

You can restore a HP Helion OpenStack Carrier Grade cluster from available system data and Cinder volume backup files to bring it back to the operational state it was when the backup procedure took place.

Restoring a HP Helion OpenStack Carrier Grade cluster from a set of backup files is done by restoring one host at a time, starting with the controllers, then the storage nodes, and finally the compute nodes.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

Before you start the restore procedure you must ensure the following conditions are in place:

* All cluster hosts must be powered down, just as if they were going to be initialized anew.
* All backup files are accessible from a USB flash drive locally attached to the controller where the restore operation takes place (controller-0).
* You have the HP Helion OpenStack Carrier Grade installation image available on a USB flash drive, just as when the software was installed the first time. It is mandatory that you use the exact same version of the software used during the original installation, otherwise the restore procedure will fail.
* The restore procedure requires all hosts but controller-0 to boot over the internal management network using the PXE protocol, just as it was done during the initial software installation. 

Ideally, you cleaned up all hard drives in the cluster, and the old boot images are no longer present; the hosts then default to boot from the network when powered on. If this is not the case, you must configure each host manually for network booting right after this exercise asks you to power them on.

* [Restore controller-0](#controller0)
* [Restore controller-1](#controller1)
* [Restore the storage nodes](#storage)
* [Restore Cinder volumes](#cinder)

## Restore controller-0 {#controller0}

1. [Install the HP Helion OpenStack Carrier Grade software on controller-0](http://gaf2871b9d2d13cf45c1306b35bf01764.cdn.hpcloudsvc.com/HP_Helion_OpenStack_Carrier_Grade_Software_Install.pdf).

	When the software installation is complete, you should be able to log in using the host's console and the web administration interface.

2. Log in to the console as user `wrsroot` with password `wrsroot`. 

3. Ensure the backup files are available to the controller.

	Plug the USB flash drive containing the backup files into the system. The USB flash drive is mounted automatically. Use the command df to list the mount points.

	The following steps assume that the backup files are available from a USB flash drive mounted in `/media/wrsroot` in the directory `backups`.

4. Use the following command to update the controller's software to the previous patching level.

		sudo config_controller --restore-system \

	When restoring the system configuration, the current software version on the controller, at this time, the original software version from the ISO image, is compared against the version available in the backup files. They differ if the latter includes patches applied to the controller's software at the time the backup files were created. If different, the restore process automatically applies the patches and forces an additional reboot of the controller to make them effective.

	You must enter reboot at the prompt as requested. Once the controller is back, log in as user wrsroot as before to continue.

5. Use the following command to verify that the patches were applied, as illustrated in the following example:

		sudo wrs-patch query


		Patch ID 					Repo State 		Patch State
		=======================		==========		===========
		COMPUTECONFIG 				Available		n/a
		LIBCUNIT_CONTROLLER_ONLY	Applied			n/a
		STORAGECONFIG 				Applied 		n/a

6. Use the following command to restore the system configuration.

		sudo config_controller --restore-system \
		/media/wrsroot/backups/backup_20140918_images.tgz

	The controller's software is up to date now, at the same stage it was when the backup operation was executed. The restore procedure can be invoked again, and should run without interruptions.

7. Authenticate to the system as Keystone user **admin**.

	Use the following command to source the admin user environment as follows:

		source /etc/nova/openrc

8. Use the following command to restore the system images.

		sudo config_controller --restore-images \
		/media/wrsroot/backups/backup_20140918_images.tgz


## Restore controller-1 {#controller1}

Use the following command to restore `controller-1`.

1. List the current state of the hosts.

		system host-list

2. Power on the host.

	Remember to ensure that the host boots from the network and not from an old disk image that might still be present on its hard drive.

3. Use the following command to unlock the host.

		system host-unlock 2

4. Use the following command to verify the new state of the hosts.

		system host-list

The unlocking operation forces a reboot of the host, which is then initialized with the corresponding image available from the system backup.

You must wait for the host to become enabled and available before proceeding to the next step.


## Restore the storage nodes {#storage}

You need to restore the storage nodes if you are using the Cinder Ceph backend. Follow the same procedure used to [restore controller-1](#controller1), first restoring host storage-0 and then storage-1.

## Restore Cinder volumes {#cinder}

You restore Cinder volumes by importing them from the backup files. You must import all volume backup files,
one at a time.

1. Delete any snapshots that may exist in the system.

	The restore operation fails if a snapshot exists for a volume that is about to be restored. You can list the available snapshots with the command cinder snapshot-list --all-tenants , and remove them with the command cinder snapshot-delete snapshot-id.

2. Use the following command to list the current state of the Cinder volumes.

		cinder list --all-tenants

	All volumes are reported to be in the error state because they are not available yet, but they are registered in the storage database.

3. Copy the Cinder volumes to the /opt/backups folder.

		sudo cp /media/wrsroot/backups/volume-* /opt/backups

4. Use the following command to import a volume.

		cinder import volume-53ad007a-841a-4fd3-a22b-813d4a6a8a85.tgz

	The volume remains in the importing state while the operation takes place. Use the backup_status filed on the output of the cinder show command to monitor the progress. You must wait until the original volume state, `in-use` or `available`, is restored. Note that in-use volumes are fully restored even if their corresponding instances are not running yet.

5. Use the following command to import all other volumes in the backup files.

		cinder list --all-tenants

	Once finished, all volumes are listed in their original states.

6. Use the following command to remove any in-use volumes that remain in error.

		cinder list

	You must remove all in-use volumes that for any reason failed to recover, and their associated virtual machine instances. This is necessary to prevent errors from occurring when restoring the compute nodes used to launch the virtual machines. If an in-use volume is in error at the time its virtual machine is launched, the Nova scheduler reports an error and the restore operation fails.

	For the purposes of this example, assume that volume 53ad007a-... failed to restore. Its status is then reported as error.

7. Use the following command to remove the virtual machine instance.

		nova delete c820df55-...

8. Use the following command to remove the volume in error status.

		cinder delete 53ad007a-...

## Restore compute {#compute}

Once the cinder volumes are restored, you must restore the compute nodes, one at a time.

You restore these hosts following the same procedure used to [restore controller-1](#controller1).

The state of the hosts when the restore operation is complete is as follows:

	system host-list

<img src="media/CGH-WR-System-Restore.png">

As each compute node is restored, the original instances at the time the backups were done are started automatically.

The HP Helion OpenStack Carrier Grade sever is fully restored. The state of the system, including storage resources and virtual machines, is identical to the state the cluster was in when the backup procedure took place.

Remember however, that passwords for local user accounts must be restored manually since they are not included as part of the backup and restore procedures. For more information, see [Linux User Accounts].

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
