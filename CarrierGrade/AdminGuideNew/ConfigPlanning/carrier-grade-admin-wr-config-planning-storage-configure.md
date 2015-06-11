---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Configuring a Compute Host to Provide Local Storage"
permalink: /helion/openstack/carrier/config/plan/storage/configure/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Configuring a Compute Host to Provide Local Storage
<!-- From the Titanium Server Admin Guide -->

You can configure a compute host to provide local storage for use by VMs.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

Local storage can be used to provide improved disk access performance for VMs instantiated on the host.

**Caution:** Local storage is ephemeral.

* Unlike Cinder-based storage, local storage does not persist when the instance is terminated or if the compute node fails.
* Live migration for local storage is not currently supported. Only cold migration is supported for an instance using local storage, where a new initial volume is created for the instance.

To provide local storage on a compute host, add a local volume group called `nova-local` to the host. This automatically includes the host in the local_storage_hosts host aggregate. The Nova scheduler draws from this host aggregate to instantiate VMs that require local storage.

To populate the nova-local group with storage resources, you must also add physical volumes created on local disks:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click **Inventory** on the **System Panel** section of the **Admin** menu, and then selecting the **Hosts** tab. 

3. [Lock the host to make changes](/helion/openstack/carrier/admin/host/management/inventory/lock/).

4. Click the host to make changes to open the **Inventory Detail** page for the locked host.

5. Click the **Storage** tab.

	For a compute node, the **Storage** tab displays three lists:

	* **Disks** -  Physical disks installed in the compute node.
	* **Local Volume Groups** - Groups of physical volumes designated for use as local storage for VMs.
	* **Physical Volumes** - Partitions that have been initialized for logical volume management (LVM) and assigned to a local volume group.

6. If the `nova-local` group is not in the **Local Volume Groups** list, add the group by clicking **Add Local Volume Group** and accepting the defaults in the dialog box that appears.

7. Add a physical volume to the nova-local group by clicking **Add Physical Volume**: 

	a. The **Local Volume Group** menu is automatically set to `nova-local`, and cannot be changed.

	b. Select a disk to provide storage from the **Disks** menu to select a disk to provide storage. For the root disk, a designated partition (local_pv) is used.

	You can add any number of physical volumes to the `nova-local` group, limited only by the number of available disks.

8. Click **Create Physical Volume**.

9. [Unlock the host](/helion/openstack/carrier/admin/host/management/inventory/lock/) to make the changes take effect.


The compute host is ready to provide local storage for use by VMs. Because a nova-local local volume group has
been added, the host is automatically included in the local_storage_hosts host aggregate.

To return a host to the remote_storage_hosts host aggregate, so that it is used to instantiate VMs configured for remote Cinder-based storage, delete the nova-local local volume group.

To configure a VM to use local storage or remote Cinder-based storage, or to be instantiated on any compute host
regardless of storage type, see [Specifying Local Storage for a VM](/helion/commercial/carrier/dashboard/managing/flavors/extra/vcpu/storage/).

To add disks to a compute node for extra local storage, see [Adjusting Resources on a Compute Node](/helion/openstack/carrier/admin/host/management/active/compute/#adjust).

## Using the CLI {#cli}

As an alternative to the web administration interface, you can use the CLI to configure the host for local storage. For more information, see Managing Local Volume Groups and Managing Physical Volumes.







<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----