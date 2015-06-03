---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Managing Active Compute Nodes"
permalink: /helion/openstack/carrier/admin/host/management/active/compute/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Managing Active Compute Nodes
<!-- From the Titanium Server Admin Guide -->

The compute nodes in HP Helion OpenStack Carrier Grade form a resource pool for hosting guest instances. You can manage this pool by managing the hosts.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

You can change the resource pool in several ways:
* You can add or remove hosts to increase or decrease the size of the pool.
* You can replace a host with another that has different resources (for example, memory, or number of CPU cores).
* You can adjust the resources on an existing host.
* You can replace a failed compute node host with an equivalent.

**Caution:** When replacing or adjusting a host, ensure that the overall resource pool still meets the requirements for your system.

Complete instructions for adding a compute node are provided in [Initializing and Configuring Compute Nodes](/helion/openstack/carrier/admin/host/management/initialize/compute/).

In this topic:

* [Removing Compute Nodes](#removing)
* [Adjusting Resources on a Compute Node](#adjust)

## Removing Compute Nodes {#removing}

You can remove a compute node from the pool of available resources.

You may need to remove a compute node in order to replace a failed host, or to change the configuration of a host. If the host is active, you can migrate instances on it by locking the host.

Caution: Before locking a host, ensure that sufficient resources are available on other hosts to migrate any running instances.

To remove a compute node on an active system:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

	* Use the IP address for the appropriate region where you want to make the change, either: the hLinux region or the Wind River Linux region.

2. Click the **Admin** dashboard, then the **System** panel, then the **System Inventory** link.

3. Click the **Hosts** tab.

4. [Lock the host to be removed](/helion/openstack/carrier/admin/host/management/inventory/lock/) by clicking **More** then **Lock Host** for the controller.

	Wait for the procedure to be completed.

5. [Delete the host](/helion/openstack/carrier/admin/host/management/inventory/host/#delete) from the HP Helion OpenStack Carrier Grade system. Click **More** then **Delete Host** for the host.

6. Power down the host and remove the hardware from the cluster.

## Adjusting Resources on a Compute Node {#adjust}

You can adjust the resources of a compute node while it is offline.

To adjust compute node resources on an active system:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

	* Use the IP address for the appropriate region where you want to make the change, either: the hLinux region or the Wind River Linux region.

2. Click the **Admin** dashboard, then the **System** panel, then the **System Inventory** link.

3. Click the **Hosts** tab.

4. [Lock the host to be modified](/helion/openstack/carrier/admin/host/management/inventory/lock/) by clicking **More** then **Lock Host** for the controller.

	Wait for the procedure to be completed.

5. [Power down the host](/helion/openstack/carrier/admin/host/management/inventory/host/#power).

6. Make any required resource changes (for example, BIOS changes required for proper operation).

	If you are adding a disk to provide additional local storage for VMs, you can install an unpartitioned disk. New disks are detected by the compute node operating system and automatically configured with a single partition.

7. [Power on the host](/helion/openstack/carrier/admin/host/management/inventory/host/#power) and wait for it to reboot fully.

	When the host is fully rebooted, it is shown as Locked, Enabled, and Available in the Hosts list.

	Note: Do not unlock the host until it is fully rebooted.

8. [Unlock the host](/helion/openstack/carrier/admin/host/management/inventory/lock/).

	The host is rebooted a second time.

The host is ready for use  with the adjusted resources when reported as `Unlocked`, `Enabled`.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----