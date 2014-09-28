---
layout: default
title: "HP Helion OpenStack&#174; Add Disk to scale-out Object Ring"
permalink: /helion/openstack/ga/services/swift/deployment/add-disk-scale-out/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/helion/openstack/ga/services/object/swift/expand-cluster/">&#9664; PREV</a> | <a href=" /helion/openstack/ga/services/object/swift/expand-cluster/">&#9650; UP</a> | <a href="/helion/openstack/ga/services/swift/deployment/add-disk-starter/"> NEXT &#9654</a> </p>


#Add Disk to scale-out Object Ring

Perform the following procedure to add a disk to a scale-out object ring. 


##Prerequisites

1. HP Helion OpenStack&#174; cloud is successfully deployed 
2. Scale-out object-ring:1 is deployed


**IMPORTANT**:  
 
*  All of the rings generated must be preserved, preferably at more than one location. Swift needs these rings to be consistent across all nodes.
* Take a backup of the rings before any operation.


##Adding Swift disks to a ring

Perform the following steps to add disk to a Swift ring:

1. Log in to the undercloud 

		ssh heat-admin@<Undercloud IP address> 
		sudo -i

2. Change the directory to ring-building

		cd /root/ring-building

3. List the disks on a node

		ringos list-disks -n <Swift nodes IP address> 

4. Format a given disk

		ringos format-disks -n <Swift nodes IP address> -d <disk>

	**Note**: You can format all the disks with a single command (-d --all).

3. List the files in the ring building directory and identify the`object-1.builder` file.

6. Add a formatted disk to the object-1 ring

		ringos add-disk-to-ring -f /root/ring-building/object-1.builder -i <Swift nodes IP address> -p <port> -d <disk label> -w <weight> -r <region> -z <zone>

	**Recommendation**: 
              
* Add a drive gradually using a weighted approach to avoid degraded performance of the Swift cluster. The weight will gradually increase by 25% until it reaches 100%. Initial weight is 25.


	7.Re-balance the object-1 ring

		ringos rebalance-ring -f /root/ring-building/object-1.builder
	
	**Note**: Wait for min&#095;part_hours before another re-balance succeeds.	


	8.List all the Swift nodes. 

		ringos list-swift-nodes -t all

			
	9.Copy the `object-1.ring.gz` file to all the nodes

	ringos copy-ring -s /root/ring-building/object-1.ring.gz -n <IP address of Swift nodes>
	

	10.Repeat steps **6 through 8** with the weights set to 50, 75, and 100 (w= 50, 75, 100).


 
<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

 