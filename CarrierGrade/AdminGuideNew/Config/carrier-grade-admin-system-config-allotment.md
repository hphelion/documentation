---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Changing Storage Space Allotments on the Controller"
permalink: /helion/openstack/carrier/admin/system/config/allotment/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: Systems Administrator 
role2: Cloud Architect 
role3: Storage Administrator 
role4: Network Administrator 
role5: Service Developer 
role6: Cloud Administrator 
role7: Application Developer 
role8: Network Engineer 
authors: Paul F

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/openstack/carrier/services/imaging/overview/">&#9664; PREV</a> | <a href="/helion/openstack/carrier/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/carrier/services/object/overview/"> NEXT &#9654</a> </p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): Changing Storage Space Allotments on the Controller #

<!-- modeled after Wind River Admin Guide -->


You can change the allotments for controller-based storage at any time after installation. This includes the space allotted for database, image, and backup storage, and for clusters using an LVM backend, the space allotted for Cinder volume storage.

**Note:** For clusters using a Ceph backend, Cinder volume storage is allotted on storage nodes, not on the controller node. To change the Cinder volume storage for a Ceph backend, see [Replacing Active Storage Nodes](/helion/openstack/carrier/admin/host/management/active/storage/).

During software installation, the HP Helion OpenStack Carrier Grade is configured with the following storage allotments:

* **Database storage** - The storage allotment for the OpenStack database.
* **Image storage** - The size of the partition to use for image storage.
* **Backup storage** - The storage allotment for backup operations.
* **Volume storage** - For a system using LVM storage, the storage allotment for all Cinder volumes used by guest instances.

You can change these allotments using the System Configuration controls in the web administration interface, or using the CLI. For CLI instructions, see [System Configuration Management Using the CLI](/helion/openstack/carrier/admin/system/config/cli/).

To accommodate the changes, there must be enough disk space on the controller, including headroom needed to complete the operation. The headroom required is 45 GiB on the primary disk for a cluster using an LVM backend, or 65 GiB for a cluster using a Ceph backend. This is in addition to the space required for the new allotments. The requested changes are checked against available space on the affected disks; if there is not enough, the changes are disallowed.

To provide more space, you can replace the affected disk or disks. Database, image, and backup storage use space on the primary disk. Cinder volume storage (on a cluster with an LVM backend) uses space on a disk selected by device node number during controller configuration. The replacement disk must occupy the same device node number.

Changes to the Cinder volume storage may also affect the primary disk because of the headroom requirement.

To pass the disk-space checks, any replacement disks must be installed before the allotments are changed.

**Caution:** The configurations for controller-0 and controller-1 must be identical. If you make changes to one, you must make the same changes to the other.

Changes to the storage allotments require a reinstallation of the HP Helion OpenStack Carrier Grade host software on the controllers, even if the primary disk is not replaced.

You can change the storage allotment using the [Horizon dashboard](#horizon) or [the CLI](#cli).

Before changing storage allotments, prepare as follows:

* Calculate your system storage requirements. Include the headroom required for changes to the storage space allotments.
* Record the current configuration settings in case they need to be restored (for example, because of an unexpected interruption during changes to the system configuration). Consult the configuration plan for your system.

## Changing the storage allotment using the Horizon dashboard {#horizon}

1. If necessary, install replacement disks in the controllers. 

	If you do not need to replace disks, you can skip this step. To determine whether you need to replace disks, calculate your storage requirements. Be sure to include the headroom required on the primary disk.

	To replace disks in the controllers, follow these steps. For more details, see [Managing Controller Nodes](/helion/openstack/carrier/admin/host/management/active/controller/).

	a. [Lock the standby controller](/helion/openstack/carrier/admin/host/management/inventory/lock/).

	b. [Power down the standby controller](/helion/openstack/carrier/admin/host/management/inventory/host/#poweroff).

	c. Make any required hardware changes.

	d. [Power up the standby controller](/helion/openstack/carrier/admin/host/management/inventory/host/#poweroff).

	e. Reinstall the HP Helion OpenStack Carrier Grade software on the standby controller.

	f. [Unlock the standby controller](/helion/openstack/carrier/admin/host/management/inventory/lock/).

	g. [Swact the controllers](/helion/openstack/carrier/admin/host/management/inventory/host/#swact}.

	h. Repeat these steps for the new standby controller.

2. Edit the disk storage allotments.

	a. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

	b. Click the **Admin** dashboard, then the **System** panel, then the **System Inventory** link.

	c. Select the Controller Filesystem tab.

	The Controller Filesystem page appears, showing the currently defined storage allotments.

	d. Click Edit Filesystem.

	The Edit Controller Filesystem dialog box appears.

	**Note:** The Cinder storage (GiB) field is present only for clusters using the LVM backend.

	e. Replace the storage allotments as required.

	f. Click Save.

	This raises major alarms against the controllers (250.001 Configuration out-of-date). You can view the alarms on the **Fault Management** page. In addition, the status `Config out-of-date` is shown for the controllers in the **Hosts** list.

3. [Lock the standby controller](/helion/openstack/carrier/admin/host/management/inventory/lock/).

4. Reinstall the HP Helion OpenStack Carrier Grade software on the standby controller.

This step is required to update the system configuration, even if you have already reinstalled the HP Helion OpenStack Carrier Grade software as part of the disk replacement procedure.

5. [unlock the standby controller](/helion/openstack/carrier/admin/host/management/inventory/lock/).

	When the controller is unlocked, the 250.001 Configuration out-of-date alarms against the controller are cleared.

6. [Swact the controllers](/helion/openstack/carrier/admin/host/management/inventory/host/#swact}.

7. [Lock the new standby controller](/helion/openstack/carrier/admin/host/management/inventory/lock/).

8. Reinstall the HP Helion OpenStack Carrier Grade software on the controller.

9. [Unlock the controller](/helion/openstack/carrier/admin/host/management/inventory/lock/).

10. Confirm that the 250.001 Configuration out-of-date alarms are cleared for both controllers.

After making these changes, ensure that the configuration plan for your system is updated with the new storage allotments and disk sizes.

## Changing the storage allotment using the CLI {#cli}

To view the existing storage configuration, use the following command.

	system controllerfs-show

Before you can change storage allotments, you must have enough disk space, including additional headroom required to complete the operation. If there is not enough disk space, changes to the storage allotment are disallowed. 

You can replace the disks in the controllers to provide more space. For more information, see [Replacing Active Storage Nodes](/helion/openstack/carrier/admin/host/management/active/storage/). 

To support storage changes, you must reinstall the HP Helion OpenStack Carrier Grade software on each controller during the disk replacement procedure. This is required even if the primary disk is not directly affected by the change. To reinstall the software, you can use the following command:

	system host-reinstall controller_name

To change the database, image, or backup storage allotment, or the Cinder volume storage allotment on a system with an LVM storage backend, use the following command syntax, where the allotments are in GiB.

	system controllerfs-modify \
	database_gib=database_allotment \
	image_gib=image_allotment \
	backup_gib=backup_allotment \
	cinder_gib=cinder_volume_allotment \
	action=apply

For example:

	system controllerfs-modify \
	database_gib=10 image_gib=13 backup_gib=22 action=apply

After changing the controller storage configuration, you must lock each controller and reinstall the HP Helion OpenStack Carrier Grade software, even if you have already done so as part of changing the controller disks. You can use the following command:

	system host-reinstall controller_name

Then you can unlock the controller to clear any Configuration out-of-date alarms. A controller swact is required to update both controllers.

 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
