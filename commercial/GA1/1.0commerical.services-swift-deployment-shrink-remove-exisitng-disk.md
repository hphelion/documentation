---
layout: default
title: "HP Helion OpenStack&#174; Object Operations Service Overview"
permalink: /helion/openstack/services/swift/deployment/remove-existing-disk/
product: commercial.ga
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.0
product-version3: HP Helion OpenStack 1.0.1
product-version4: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Keshava HP, Binamra S

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href=" /helion/openstack/services/object/overview/scale-out-swift/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/overview/"> NEXT &#9654</a> </p>-->


# HP Helion OpenStack&#174;: Remove an existing Disk from Object Nodes

Perform the following steps to remove a disk from object nodes.

1. [Prerequisite](#prer)
2. [Removing disks from ring](#remove-disk-from-ring)

##Prerequisite {#prer}

* HP Helion OpenStack&#174; cloud is successfully deployed.<br>*(Starter Object Storage (Swift) nodes are functional by default as they are part of cloud deployment)*
* Scale-out object-ring:1 is deployed.
*  All of the rings generated **must** be preserved, preferably at more than one location. Swift needs these rings to be consistent across all nodes.
* Take a backup of the rings before any operation.


##Removing disks from ring {#remove-disk-from-ring}

Perform the following steps to remove disks from ring:

1. Log in to the undercloud from seed. 

		# ssh heat-admin@<undercloud IP address> 
		# sudo -i

2. Change the directory to ring builder.

		# cd /root/ring-building

3. List the file in the directory.

		# ls
	The file with the name `object-1.builder` will be listed in the list.

4. List the disks in the current `object-1.builder` file.

		# ringos view-ring -f /root/ring-building/object-1.builder 

	The following sample displays the output of the above command: 

		object-1.builder, build version 9
		1024 partitions, 3.000000 replicas, 1 regions, 3 zones, 9 devices, 100.00 balance
		The minimum number of hours before a partition can be reassigned is 1
		Devices:    id  region  zone      ip address  port  replication ip  replication port      name weight partitions balance meta
		             0       1     1      192.0.2.29  6000      192.0.2.29              6000 a1410063335 100.00          0 -100.00
		             1       1     1      192.0.2.29  6000      192.0.2.29              6000 b1410063336 100.00          0 -100.00
		             2       1     1      192.0.2.29  6000      192.0.2.29              6000 c1410063336 100.00          0 -100.00
		             3       1     2      192.0.2.30  6000      192.0.2.30              6000 a1410063357 100.00          0 -100.00
		             4       1     2      192.0.2.30  6000      192.0.2.30              6000 b1410063357 100.00          0 -100.00


5. Identify the disk to be removed from the list.

**Recommendation**:

* Remove a drive gradually using a weighted approach to avoid degraded performance of the Swift cluster. The weight will gradually decrease by 25% until it becomes 0. The initial weight is 75.


6.Set the weight of the disk.

	# ringos set-weight -f object-1.builder -s d<device> -w <weight>

The following sample displays the output of the above command:

		d7r1z3-192.0.2.31:6000R192.0.2.31:6000/b1410063386_"" weight set to 75.0

7.Re-balance the ring.

	# ringos rebalance-ring -f /root/ring-building/object-1.builder

**Note**: You must wait for `min_part_hours` before another re-balance succeeds.

8.List all the Swift nodes.

	# ringos list-swift-nodes -t all
		
		
9.Copy the `object-1.ring.gz` file to all nodes.

	# ringos copy-ring -s /root/ring-building/object-1.ring.gz -n <Swift nodes IP address>
	
	
10.Repeat steps from **6 - 9** with the weights set to 50, 25, and 0 (w= 50, 25, 0). These steps should be repeated until the weight becomes 0 for each disk.

11.Once the weight is set to 0, remove the disk from the ring.

	# ringos remove-disk-from-ring -f object-1.builder -s d<disk>

The following sample displays the output of the above command:

	Removed disk(s) matching d7 from ring object-1.builder

12.Re-balance the ring.

	# ringos rebalance-ring -f /root/ring-building/object-1.builder

**Note**: You must wait for min&#095;part_hours before another re-balance succeeds.

13.List all the Swift nodes.

	# ringos list-swift-nodes -t all
		
		
14.Copy the `object-1.ring.gz` file to all nodes.

	# ringos copy-ring -s /root/ring-building/object-1.ring.gz -n <Swift nodes IP address>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

**Related topics**

* [Shrink Object Storage (Swift) Cluster]( /helion/openstack/services/object/swift/shrink-cluster/)


