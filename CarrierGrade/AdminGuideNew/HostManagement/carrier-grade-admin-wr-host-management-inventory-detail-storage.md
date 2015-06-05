---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Working with Host Storage"
permalink: /helion/openstack/carrier/admin/host/management/inventory/storage/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Working with Host Storage
<!-- From the Titanium Server Admin Guide -->

The **Storage** tab on the **Inventory Detail** page presents storage details for a host.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

This page contains the following:

* [Viewing storage details](#view)
* [Managing Local Volume Groups](#local)
* [Managing Physical Volumes](#physical)

## Viewing storage details {#view}

To view host storage information:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **System Inventory** link.

3. Click the **Hosts** tab.

4. In the Host Name column, click the name of the locked host to open the **Inventory Detail** page for that host.

5. Click the **Storage** tab.

The information is presented in one or more lists, as determined by the host type.

* Disks - This list is presented for all host types. It lists all available hardware devices used for storage. For each device, the
following information is included:

	* UUID - The unique identifier for the device.
	* Node - The Linux device name.
	* Type - The type of storage device, typically a hard drive (disk).
	* Size - The capacity of the device in MiB.
	* Serial ID - The device's serial ID number.
	* Model - The manufacturer's model for the device.

* Storage Volumes - This list is presented for storage hosts. It shows a list of logical storage volumes defined on available disks. For each volume, the following information is included:

	* UUID - The unique identifier for the storage volume.
	* Name - The name assigned to the volume, if any.
	* Function - The type of storage backend handling the storage volume. The type OSD indicates that the storage volume is using the Ceph backend.

	For information about creating storage volumes or adding storage profiles, see the HP Helion OpenStack Carrier Grade Software Installation Guide: Creating Storage Volumes.

* Local Volume Groups - This list is presented for compute nodes. It shows groups that provide local storage for use by VMs. For more
information, see [Managing Local Volume Groups](#local).

	For each group, the following information is provided:

	* Name - The name assigned to the local volume group.
	* State - The availability of the local volume group.
	* Access - The access status of the volume group (writeable, readonly, resizeable, exported, partial, or clustered).
	* Size - The capacity of the device in bytes.
	* Current Physical Volumes - The number of physical volumes that define the local volume group.
	* Current Logical Volumes - The number of logical volumes contained by the local volume group.
	* Actions - Available actions that can be performed on the local volume group.

* Physical Volumes - This list is presented for compute nodes. It shows physical volumes that provide local storage for use by VMs. For more information, see [Managing Physical Volumes](#physical).

	For each group, the following information is provided:

	* Name - The device name associated with the physical volume.
	* State - The availability of the physical volume.
	* Type - The device type used for the physical volume.
	* Disk UUID - The unique identifier of the disk used to implement the physical volume.
	* Disk Device Node - The device used to implement the physical volume.
	* LVM Logical Group Name - The name of the local volume group to which the physical volume belongs.
	* Actions - Available actions that can be performed on the physical volume.

## Managing Local Volume Groups {#local}

You can add, delete, and review local volume groups on a compute host.

Local volume groups are used to designate physical volumes on a compute host as local storage for use by VMs.

You can use the web administration or the CLI to manage them. For web administration interface instructions, see Configuring a Compute Host to Provide Local Storage.

Before you can modify the settings for a host, you must lock the host:

	host-lock hostname

To configure a compute host to provide local storage for use by VMs, add a local volume group with the name novalocal.

The following CLI commands are available for managing local volume groups.

	host-lvg-add hostname groupname

	where 
	* groupname is the name of the local volume group to which the physical volume is added
	* where hostname is the name of the host system``

	**Note:** The only valid groupname is nova-local.

	host-lvg-delete hostname nova-local
	host-lvg-list hostname
	host-lvg-show hostname

To complete the configuration of a compute host for local storage, you must also add physical volumes to the `nova-local` local volume group. For more information, see [Managing Physical Volumes](#physical).

## Managing Physical Volumes {#physical}

You can add, delete, and review physical volumes on a compute host.

Physical volumes provide storage using local disks. You can use the web administration or the CLI to manage them.

For web administration interface instructions, see Configuring a Compute Host to Provide Local Storage.

As each physical volume is created, it is added to an existing local volume group. Before you can modify the settings for a host, you must lock the host:

	host-lock <hostname>

	where hostname is the name of the host system

Before you can add a physical volume, a local volume group must exist on the host. To create one, see [Managing Local Volume Groups](#local).

The following CLI commands are available for managing physical volumes.

	host-pv-add hostname <groupname> disk_uuid

	where 
	* groupname is the name of the local volume group to which the physical volume is added
	* where hostname is the name of the host system``

**Note:** The only valid group name is `nova-local`.

When disk_uuid indicates the root disk, the physical volume uses a system-designated partition on the root disk. For any other disk, the physical volume uses the entire disk.

	host-pv-delete hostname nova-local disk_uuid
	host-pv-list hostname
	host-pv-show hostname

To configure VMs to use local storage, see Specifying Local Storage for a VM.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----