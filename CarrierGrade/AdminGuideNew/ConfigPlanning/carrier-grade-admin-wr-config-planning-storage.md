---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Planning the Storage"
permalink: /helion/openstack/carrier/config/plan/storage/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Planning the Storage
<!-- From the Titanium Server Admin Guide -->

Storage resources on the controller and storage nodes are used to maintain internal databases, and to provide storage for virtual machines. For VMs, you can also use ephemeral local storage on compute nodes.


<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

During HP Helion OpenStack Carrier Grade software installation, the controller configuration script gives you the options to allocate space on the controller for the internal database, and for general storage volumes (images and disk space for the virtual machines).

The size of the database grows with the number system resources created by the system administrator and the tenants.

This includes objects of all kinds such as compute nodes, provider networks, images, flavors, tenant networks, subnets, virtual machine instances and NICs. As a reference point, consider the following deployment scenario:

* two controllers
* four compute nodes with dual Intel(R) Xeon(R) CPU E5-2670 v2 @ 2.50GHz each.
* 40 virtual machine instances
* 120 tenant networks
* steady collection of power management statistics

The size of the database in this case is approximately 9 GB. With a suggested default of 20 GB, there is still plenty of room to grow. However, you should periodically monitor the size of the database to ensure that it does not become a bottleneck when delivering new services.

For general storage, the default settings suggested during the controller configuration script are recommended to utilize the maximum available space on the storage media.

## Storage for Virtual Machines

For VMs, you can use remote Cinder storage or local storage.
Persistent block storage for virtual machines is allocated by the Cinder service using either the LVM over iSCSI or the Ceph distributed storage backends.

* **LVM/iSCSI** - This backend provides block storage managed by the Linux Logical Volume Manager (LVM) exposed as iSCSI targets. In the HP Helion OpenStack Carrier Grade implementation:

	* Storage space is allocated on the active controller and automatically mounted over iSCSI by the virtual machines running on the compute nodes. No storage space is allocated on the compute nodes.
	* The two controllers always maintain their storage partitions in sync for carrier-grade reliability.
	* This backend does not support storage nodes.

* **Ceph** - This backend provides block storage using Ceph, a distributed storage system. In the HP Helion OpenStack
Carrier Grade implementation:

	* Storage space is allocated on the storage nodes exclusively. No persistent block storage space is allocated on the compute nodes or the controllers.
	* Two storage nodes are used to provide a scalable and fully HA-protected storage solution. For details on hardware requirements and software installation procedures for storage nodes, refer to the HP Helion OpenStack Carrier Grade Software Installation Guide.

	**Note:** For Ceph storage, an infrastructure network is required 

The LVM/iSCSCI and Ceph-based storage backend options are exclusive. You select one or another when configuring controller-0 by selecting the appropriate storage option. Select lvm for the LVM/iSCSCI backend, or ceph for the Ceph backend. See the HP Helion OpenStack Carrier Grade Software Installation Guide for details.

As an alternative to persistent storage provided by the Cinder service, you can implement ephemeral local storage on the compute nodes where the VMs are instantiated. This is useful for VMs requiring local disk access for performance optimization. You can use a pre-allocated partition on the root disk, as well as additional disks optionally installed in the compute nodes. For more information, see [Configuring a Compute Host to Provide Local Storage](/helion/openstack/carrier/config/plan/storage/-configure).

**Caution:** Local storage is ephemeral.

* Unlike Cinder-based storage, local storage does not persist when the instance is terminated or if the compute node fails.
* Live migration for local storage is not currently supported. Only cold migration is supported for an instance using local storage, where a new initial volume is created for the instance.

To instantiate VMs on compute nodes configured for local storage, see [Specifying Local Storage for a VM](/helion/commercial/carrier/dashboard/managing/flavors/extra/vcpu/storage/).






<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----