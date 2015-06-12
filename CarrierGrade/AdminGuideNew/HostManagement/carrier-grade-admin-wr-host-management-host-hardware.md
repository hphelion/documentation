---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Working with Hardware Profiles"
permalink: /helion/openstack/carrier/admin/host/management/inventory/hardware/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Working with Hardware Profiles

A hardware profile is a named object that captures a particular host configuration. The profile can be applied to any other host with a similar hardware configuration.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>


The following types of hardware profiles are available from the Systems Inventory page, each presented on a separate tab:

* [Viewing CPU Profiles](#cpu)
* [Viewing Interface Profiles](#interface)
* [Viewing Storage Profiles](#storage)
* [Memory Profiles](#memory)

Once a hardware profile is defined, it can be applied to any host where it makes sense to be applied to change its configuration.

## Viewing CPU Profiles {#cpu}

A CPU profile is a named assignment of processors and cores to one or more of the following types of processing threads:

* **Platform** - System threads handling the core hosting functionality of the host. Platform threads are always present on all types of hosts in the cluster.
* **vSwitch** - AVS threads dedicated to handling network traffic and packet processing tasks. They exists on the compute nodes only.
* **Shared** - Threads handling low-load or non-real-time virtual machine tasks, implemented on a shared physical CPU in a compute node.
* **Virtual Machines** - Threads handling virtual machines. They exists on the compute nodes only.

On controller and storage nodes, all processors and cores are automatically assigned to platform threads, as they are the only ones available. On compute nodes, which always run a number of threads of all types, a default CPU allocation is done automatically when the system software is initially installed.

To view information on CPU profiles:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **System Inventory** link.

3. Click the **CPU Profiles** tab.

	A list of the currently defined CPU profiles displays.

CPU profiles can be deleted using the button Delete CPU Profiles on this page. When clicked, it deletes all selected profiles in the list. 

The delete operation does not affect CPU profiles already applied.

## Viewing Interface Profiles {#interface}

An interface profile is a named configuration of Ethernet ports and interfaces on a host.

* **Ethernet Ports** - The list of physical Ethernet ports that have been allocated to connect to a network.
* **Interfaces** - Logical L2 interfaces defined on top of physical Ethernet ports.

To view information on interface profiles:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **System Inventory** link.

3. Click the **Interface Profiles** tab.

	A list of the currently defined interface profiles displays.

Interface profiles can be deleted using the button Delete Interface Profiles on this page. When clicked, it deletes all selected profiles in the list. The delete operation does not affect interface profiles already applied.


## Viewing Storage Profiles {#storage}

A storage profile is a named configuration for a list of storage resources on a computing node. Each storage resource
consists of the following elements:

* **Disks** - A Linux block storage device, such as /dev/sdd, identifying an entire hard drive.
* **Storage Volumes** - A Ceph storage volume consisting of a name and a storage function. The name is used as a human-readable version of the native storage device UUID. The storage function indicates the type of storage backend, such as OSD for a Ceph storage system.

To view information on storage profiles:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **System Inventory** link.

3. Click the **Storage Profiles** tab.

	A list of the currently defined storage profiles displays.

## Memory Profiles {#memory}

A memory profile is a named assignment of huge pages for use as VM memory. For more information, see Creating and Using Memory Profiles.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----