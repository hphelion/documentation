---
layout: default
title: "HP Helion OpenStack&#174; Add Disk to Starter Object Ring"
permalink: /helion/openstack/1.1/services/swift/deployment/add-disk-starter/
product: commercial.ga
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.0
product-version3: HP Helion OpenStack 1.0.1
product-version4: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Keshava HP, Binamra S

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href=" /helion/openstack/1.1/services/object/swift/expand-cluster/">&#9664; PREV</a> | <a href="/helion/openstack/1.1/services/object/swift/expand-cluster/">&#9650; UP</a> | <a href="/helion/openstack/1.1/services/swift/deployment/add-proxy-node/"> NEXT &#9654</a> </p>-->


# HP Helion OpenStack&#174;: Add a Disk to Starter Object Ring

Perform the following procedure to add disk to a starter object ring. 

1. [Prerequisite](#prer)
2. [Add disks to a Starter Object Ring](#adding-Swift-disks-to-a-ring)

##Prerequisite {#prer}

* HP Helion OpenStack&#174; cloud is successfully deployed.<br>*(Starter Swift nodes are functional by default as they are part of cloud deployment.)*
*  All of the rings generated **must** be preserved, preferably at more than one location. Swift needs these rings to be consistent across all nodes.
* Make a backup of the rings before any operation.

----------------------------------------------
**Note**: If the scale out swift nodes are not deployed, you need to perform the following:

1. Create a directory named ring-building.

		# mkdir -p /root/ring-building
		# cd /root/ring-building

2. Get all the rings and builder files from either of the starter nodes.

		rsync -qzp --rsync-path="sudo rsync" heat-admin@<starter Swift nodes IP address>:/etc/swift/object.ring.gz /root/ring-building/
		rsync -qzp --rsync-path="sudo rsync" heat-admin@<starter Swift nodes IP address>:/etc/swift/account.ring.gz /root/ring-building/
		rsync -qzp --rsync-path="sudo rsync" heat-admin@<starter Swift nodes IP address>:/etc/swift/container.ring.gz /root/ring-building/
		rsync -qzp --rsync-path="sudo rsync" heat-admin@<starter Swift nodes IP address>:/etc/swift/object.builder /root/ring-building/
		rsync -qzp --rsync-path="sudo rsync" heat-admin@<starter Swift nodes IP address>:/etc/swift/account.builder /root/ring-building/
		rsync -qzp --rsync-path="sudo rsync" heat-admin@<starter Swift nodes IP address>:

-------------------------------------------------

## Add disks to a Starter Object Ring {#adding-Swift-disks-to-a-ring}

Perform the following steps to add Swift disk to a ring:

1. Log in to the undercloud from seed. 

		# ssh heat-admin@<undercloud IP address> 
		# sudo -i

2. Change the directory to ring builder.

		# cd /root/ring-building

3. List the starter Swift nodes.

		# ringos list-swift-nodes -t starter
		
	The following sample displays starter Swift nodes:

		+---------------+
		| starter-nodes |
		+---------------+
		| 192.0.2.22    |
		| 192.0.2.24    |
		+---------------+

4. List the disks on the starter nodes.

		# ringos list-disks -n <starter Swift nodes IP address> 

	The following sample displays the lists of disk available on the starter Swift node **192.0.2.22**.

		+----------+------------+
		| disk     | size       |
		+----------+------------+
		| /dev/sdb | 1073741824 |
		|          |            |
		| /dev/sdc | 1073741824 |
		|          |            |
		+----------+------------+

5. Format the given disk.

		# ringos format-disks -n <starter Swift nodes IP address> -d <disk>

	**Note**: You can format all the disks with the single command (-d --all).

	The following sample displays the output of formatted disk of 192.0.2.22.

		+----------+-----------+---------+---------------------------------+-------------+------------+
		| disk     | formatted | mounted | mount_point                     | label       | size       |
		+----------+-----------+---------+---------------------------------+-------------+------------+
		| /dev/sdb | y         | y       | /mnt/state/srv/node/b1410063336 | b1410063336 | 1073741824 |
		+----------+-----------+---------+---------------------------------+-------------+------------+

6. List the file in ring directory and identify the `object.builder` file for object.

7. (Optional)If the builder file does not exit in the undercloud, copy the builder files using the following command.
 
		rsync -qzp --rsync-path="sudo rsync" heat-admin@<starter Swift nodes IP address>:/etc/swift/object.builder /root/ring-building/
		

8. Add the formatted disk to object ring.

		# ringos add-disk-to-ring -f /root/ring-building/object.builder -i <Starter Swift nodes IP address> -p <port> -d <disk label> -w <weight> -r <region> -z <zone>

	**Note**: 
       * Choose the zone and region information appropriately.
       * The disk label is derived from step 5.
      
	**Recommendation**: 
              
	* Add drives gradually using a weighted approach to avoid degraded performance of Swift cluster. The weight will gradually increase by 25% until it becomes 100%. The initial weight is 25.

9. Re-balance the ring.

		# ringos rebalance-ring -f /root/ring-building/object.builder
	
	**Note**: You must wait for the time specified by `min_part_hours` before another re-balance succeeds.	
	
10. List all the Swift nodes. 

		# ringos list-swift-nodes -t all
		
11. Copy the object file to all the nodes.
    
    	# ringos copy-ring -s /root/ring-building/object.ring.gz -n <Swift nodes IP address>


12. Copy the builder file to all the nodes.
    
    	# ringos copy-ring -s /root/ring-building/object.builder -n <Swift nodes IP address>

	**Note**: The `.buldier` and `.ring.gz` files **must** be present in the Swift nodes.

	You can also copy the ring files and the builder files to all the swift nodes using the following commands:

		# ringos copy-ring -s /root/ring-building/\*.ring.gz -n all

		# ringos copy-ring -s /root/ring-building/object-1.builder -n all


13. Set the weight of the disks using the following command:


    	# ringos set-weight -f /root/ring-building/object.builder -s <disk id> -w <weight>

 
14. Repeat steps from **8-13** gradually increasing the disk weight by 25: set the weight to 50, 75, and finally 100 (w= 50, 75, 100) .

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
