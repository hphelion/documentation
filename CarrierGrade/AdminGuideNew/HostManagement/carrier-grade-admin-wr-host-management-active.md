---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Managing Hosts on an Active System"
permalink: /helion/openstack/carrier/admin/host/management/active/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Managing Hosts on an Active System
<!-- From the Titanium Server Admin Guide -->

You can add or remove hosts and change disks without interrupting the HP Helion OpenStack Carrier Grade.

To make changes to a host, you must lock it. Locking a host automatically and seamlessly redirects activity to other available hosts. While the host is locked, you can safely power it down and make disk changes, or remove the host and insert a new one.

After making the required configuration changes, you can unlock the host and begin using it.

* [Working with Controller Nodes](/helion/openstack/carrier/admin/host/management/active/nodes/)
Managing Storage Nodes
Managing Compute Nodes



Managing Storage Nodes
On systems that use a Ceph backend for Cinder storage, you can add or replace storage disks or swap a storage node
while the system is running, even if the storage resources are in active use.
A HP Helion OpenStack Carrier Grade system with a Ceph storage backend uses exactly two storage nodes; you
cannot add or remove storage nodes. However, you can add disks to a storage node to increase capacity, and you can
replace a faulty host.
Note:
The storage node pair in a HP Helion OpenStack Carrier Grade system provides redundancy for High
Availability. A balanced storage capacity is recommended, in which each host has sufficient independent
resources to meet the operational requirements of the system.
1. Lock the host to be modified or replaced.
Open the Hosts list by clicking Inventory on the System Panel section of the Admin menu, and then selecting
the Hosts tab.
Click More > Lock Host for the host.
Wait for the procedure to be completed.
2. Power down the host and make any required hardware changes.
This may involve replacing or adding disks, or replacing the host completely.
3. Place the new or modified host node into service.
* For disk replacement, no additional configuration changes are needed. To begin using the new disk, power up
the host and unlock it.
* For disk addition, you must create a new storage volume (OSD) before you can use the new disk. For more
information, see the HP Helion OpenStack Carrier Grade Software Installation Guide: Creating Storage
Volumes.
* For host replacement, you must delete the existing host using More > Delete Host. Then you must initialize
the new host with a personality as a storage node, configure its interfaces, and create storage volumes. For
more information on initializing and configuring a storage node, see the HP Helion OpenStack Carrier Grade
Software Installation Guide: Initializing and Configuring Storage Nodes.


Managing Compute Nodes
The compute nodes in HP Helion OpenStack Carrier Grade form a resource pool for hosting guest instances. You can
manage this pool by managing the hosts.
You can change the resource pool in several ways:
* You can add or remove hosts to increase or decrease the size of the pool.
* You can replace a host with another that has different resources (for example, memory, or number of CPU cores).
* You can adjust the resources on an existing host.
* You can replace a failed compute node host with an equivalent.
Caution:
When replacing or adjusting a host, ensure that the overall resource pool still meets the requirements for your
system.
HP Helion OpenStack Carrier Grade (Beta) Administration Guide | Managing Hardware Resources | 99
Complete instructions for adding a compute node are provided in the HP Helion OpenStack Carrier Grade Software
Installation Guide: Initializing and Configuring Compute Nodes.
Removing Compute Nodes
You can remove a compute node from the pool of available resources.
You may need to remove a compute node in order to replace a failed host, or to change the configuration of a host. If
the host is active, you can migrate instances on it by locking the host.
Caution:
Before locking a host, ensure that sufficient resources are available on other hosts to migrate any running
instances.
1. Lock the host to be removed.
Open the Hosts list by clicking Inventory on the System Panel section of the Admin menu, and then selecting
the Hosts tab.
Click More > Lock Host for the host.
Wait for the procedure to be completed.
2. Delete the host from the HP Helion OpenStack Carrier Grade system.
Click More > Delete Host for the host.
3. Power down the host and remove the hardware from the cluster.
Adjusting Resources on a Compute Node
You can adjust the resources of a compute node while it is offline.
1. Lock the host to make changes.
a) On the Admin pane of the web administration interface, in the System Panel section, select Inventory.
b) Select the Hosts tab.
c) Open the More drop-down list for the host, and then select Lock Host.
d) Wait for the host to be reported as Locked.
2. Power off the host.
3. Make any required resource changes (for example, BIOS changes required for proper operation).
If you are adding a disk to provide additional local storage for VMs, you can install an unpartitioned disk. New
disks are detected by the compute node operating system and automatically configured with a single partition.
4. Power on the host, and wait for it to reboot fully.
When the host is fully rebooted, it is shown as Locked, Enabled, and Available in the Hosts list.
Note:
Do not unlock the host until it is fully rebooted.
5. Unlock the host.
The host is rebooted a second time.
When the host is reported as Unlocked, Enabled, and Available, it is ready for use with the adjusted resources.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----