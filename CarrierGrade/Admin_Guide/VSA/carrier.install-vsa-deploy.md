---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Deploying HP StoreVirtual VSA Storage Sytems"
permalink: /helion/openstack/carrier/install/vsa/deploy/
product: carrier-grade
product-version1: HP Helion OpenStack Carrier Grade
role1: Storage Administrator
role2: Storage Architect
authors: Michael B, Paul F

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/helion/openstack/carrier/install/vsa/">&#9664; Installing HP StoreVirtual VSA </a> | <a href="/helion/openstack/carrier/install/vsa/cluster/">Creating a StoreVirtual Cluster and adding it to a new Management Group &#9654;</a>
</p> 


# HP Helion OpenStack&#174; Carrier Grade (Beta): Deploying HP StoreVirtual VSA Storage Sytems

Ensure the following prerequisites are fulfilled before HP StoreVirtual Storage systems are deployed:

* Before enrolling the new Baremetal server for StoreVirtual deployment, ensure that `#ironic node-list` in the undercloud server does not have any free nodes.This is required to register a new node which matches the disk requirements for StoreVirtual and is picked by the installer for StoreVirtual deployment.

* Ensure that you have created a minimum of two(2) RAID groups. You can create a maximum of eight(8) groups. The first RAID group where the OS image is deployed is not considered for StoreVirtual storage.

* Each physical disk should be RAID protected and should not be RAID 0. You can use RAID 5 and above. <!--For more details, refer - [**Storevirtual documentation LINK**]-->

* For deploying StoreVirtual systems without Adaptive Optimization (AO) the setup must have a minimum two(2) disks(/dev/sda, /dev/sdb).

* For deploying StoreVirtual systems with Adaptive Optimization (AO) the setup must have at least three(3) disks(/dev/sda, /dev/sdb,/dev/sdc). The disk /dev/sdb should be a Solid State Drive(SSD).


* Ensure that you create the RAID group for SSD drives immediately after creating the RAID group for boot volume. For example: If three RAID groups are to be created. The following is recommended :

	**Step 1**: Create the first RAID group for HDD drives and mark this as boot volume(/dev/sda)
        
	**Step 2**: Create the second RAID group for SSD drives which should be used as Tier 0 for AO (/dev/sdb)
         
	**Step 3**: Create the third RAID group for HDD drives which will be used as Tier 1(/dev/sdc)

* KVM Cloud is installed and is running.
 
The license for the StoreVirtual VSA license is bundled with HP Helion OpenStack&#174; and has a maximum limit of 50 TB per node. Hence the total amount of the configured storage on an individual StoreVirtual node should not exceed 50 TB. To extend the 50 TB per node limit, you can add nodes. A VSA cluster can support up to 16 nodes, which means configured storage on a VSA cluster can be as much as 800 TB.

**Note**: Use of StoreVirtual VSA is included with your Helion OpenStack license.  When installing StoreVirtual VSA under the Helion OpenStack license, the CMC may display a message that some features are not licensed. This message displays in error and can be ignored if you have licensed the physical server with a Helion OpenStack license. 

<!--<img src="media/storevirtual-cluster-network-diagram1.png"/>-->

## Next Step

[Creating a StoreVirtual Cluster and adding it to a new Management Group](/helion/openstack/carrier/install/vsa/cluster/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----

