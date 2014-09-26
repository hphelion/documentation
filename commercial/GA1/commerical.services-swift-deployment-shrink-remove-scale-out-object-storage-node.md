---
layout: default
title: "HP Helion OpenStack&#174; Object Operations Service Overview"
permalink: /helion/openstack/ga/services/swift/deployment/remove-existing-disk/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href=" /helion/openstack/ga/services/object/overview/scale-out-swift/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/overview/"> NEXT &#9654</a> </p>-->

#Remove Scale-out Object Storage Node

You are recommended to gradually reduce the weight in the ring and change the disk in the Swift cluster to avoid poor performance. 

Once all the disks of the node are removed then the Scale-out object node can be removed from the cloud.


##Prerequisite

1. HP Helion OpenStack cloud is successfully deployed and has the following: 
	* Seed
	* Undercloud
	* Overcloud 
	* Two Swift nodes (which is functional)
2. Scale-out object-ring:1 is deployed




**IMPORTANT**:  
 
*  Stored the generated rings at multiple location. These rings should be consistent all across nodes.

* Take a backup of rings before any operation.


##Removing disks from ring

Perform the following steps to remove disks from ring:

1. Login to Undercloud 

		ssh heat-admin<Undercloud IP address> 
		#sudo -i

2. Change the directory to ring builder

		#cd /root/ring-building

3. List the file in the directory

		ls
	The file with the name `object-1.builder` will be listed in the list.

4. List the disks in the current `object-1.builder` file

		ringos view-ring -f /root/ring-building/object-1.builder 

5. Identify the node that need to be removed from the list.

**Recommendation**:

* Remove a drive gradually using a weighted approach to avoid degraded performance of Swift cluster. The weight will gradually decrease by 25% until it becomes 0%. Initial weight is 75.


6.Set weight of the disks on the node 

		ringos set-weight -f object-1.builder -s d<Node IP address> -w <value>


7.Re-balance the ring

		ringos rebalance-ring -f /root/ring-building/object-1.builder


**Note**: Wait for min&#095;part_hours before another re-balance succeeds.

8.List all the Swift nodes

		ringos list-swift-nodes -t all
		
		
9.Copy `object-1.ring.gz` file to all nodes

	ringos copy-ring -s /root/ring-building/account.ring.gz -n <IP address of Swift nodes>

10.Repeat steps from 6 - 8 with the weights 50, 25, and 0 (w= 50, 25, 0). This step should be repeated until the weight becomes 0 for each disk.

11.Once weight is set to 0, remove the disk from the ring

	ringos remove-disk-from-ring -f object-1.builder -s <NOde IP address>

Repeat this step for each disk of the specific node.

## Removing scale-out object node 

Once the disks are removed from the ring, remove the scale-out object node by removing the corresponding stack.

1. List the scale-out object node

		heat stack-list

2. Identify the stack of the scale-out object node

The list appears as the sample shown below:

<img src ="media/img swift_shrinkage-stack-list/"> 

3.Remove the stack 

	heat stack-delete <id>


##Verifying the node removal

	#nova list

A list of nodes appears and the removed node will not be available.



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*