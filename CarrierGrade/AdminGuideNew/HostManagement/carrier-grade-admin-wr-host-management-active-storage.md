---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Replacing Active Storage Nodes"
permalink: /helion/openstack/carrier/admin/host/management/active/storage/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Replacing Active Storage Nodes
<!-- From the Titanium Server Admin Guide -->

On systems that use a Ceph backend for Cinder storage, you can add or replace storage disks or swap a storage node while the system is running, even if the storage resources are in active use.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

A HP Helion OpenStack Carrier Grade system with a Ceph storage backend uses exactly two storage nodes; you cannot add or remove storage nodes. However, you can add disks to a storage node to increase capacity, and you can replace a faulty host.

**Note:** The storage node pair in a HP Helion OpenStack Carrier Grade system provides redundancy for High Availability. A balanced storage capacity is recommended, in which each host has sufficient independent
resources to meet the operational requirements of the system.


To replace a storage node on an active system:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

	* Use the IP address for the appropriate region where you want to make the change, either: the hLinux region or the Wind River Linux region.

2. Click the **Admin** dashboard, then the **System** panel, then the **System Inventory** link.

3. Click the **Hosts** tab.

2. [Lock the standby controller](/helion/openstack/carrier/admin/host/management/inventory/lock/) by clicking **More** then **Lock Host** for the controller.

	Wait for the procedure to be completed.

4. [Power down the standby controller](/helion/openstack/carrier/admin/host/management/inventory/host/#power) and make any required hardware changes.

	This may involve replacing disks, or replacing the host completely.

5. Place the new or modified controller into service.

	To begin using the new disk, [power up the host](/helion/openstack/carrier/admin/host/management/inventory/host/#power) and [unlock](/helion/openstack/carrier/admin/host/management/inventory/lock/) the host.

	* For disk replacement, no additional configuration changes are needed. 
	* For disk addition, you must create a new storage volume (OSD) before you can use the new disk. For more information, see the HP Helion OpenStack Carrier Grade Software Installation Guide: Creating Storage Volumes.
	* For host replacement, you must [delete the existing host](/helion/openstack/carrier/admin/host/management/inventory/host/#delete) using **More** then **Delete Host**. Then you must initialize the new host with a personality as a storage node, configure its interfaces, and create storage volumes. 

For more information on initializing and configuring a storage node, see [Initializing and Configuring Storage Nodes](/helion/openstack/carrier/admin/host/initialize/storage/).


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----