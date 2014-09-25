---
layout: default
title: "HP Helion OpenStack&#174; Object Operations Service Overview"
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

<!--
<p style="font-size: small;"> <a href=" /helion/openstack/ga/services/object/overview/scale-out-swift/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/overview/"> NEXT &#9654</a> </p>-->


#Add Disk to scale-out Object Ring

Perform the following procedure to add disk to a scale-out object ring. 


##Prerequisite

1. HP Helion OpenStack cloud is successfully deployed and has the following: 

	* Seed
	* Undercloud
	* Overcloud 
	* Two Swift nodes (which is functional)
2. Scale-out object-ring:1 is deployed


**IMPORTANT**:  
 
*  Store all the rings at multiple location. These rings should be consistent all across the nodes.

* Take a backup of rings before any operation.


##Adding Swift disks to a ring


Perform the following steps to add Swift disk to a ring:

1. Login to Undercloud 

		ssh heat-admin<Undercloud IP address> 
		#sudo -i

2. Change the directory to ring builder

		#cd /root/ring-building

3. List the builder file for object-ring:1

		ls	

	The file will be displayed as `object-1.builder`.

3. List the disk on a node

		ringos list-disks -n <IP address of node> -u heat-admin

4. Format a disk

		ringos format-disks -n <IP address of node> -u heat-admin -d <disk>

	**Note**: You can format all the disk with the single command (--all).

5. List all the Swift nodes. Ensure to capture the list of the nodes.

		ringos list-swift-nodes -t all

6. Add formatted disk to object-1 ring

		ringos add-disk-to-ring -f /root/ring-building/object-1.builder -i <IP address of Swift node> -p value -d <value> -w <weight> -r <region> -z <zone>

**Recommendation**: 
              
* Add a drive gradually using a weighted approach to avoid degraded performance of Swift cluster. The weight will gradually increase by 25% until it becomes 100%. Initial weight is 25.


7.Re-balance object-1 ring

		ringos rebalance-ring -f /root/ring-building/object-1.builder
	
**Note**: Wait for min&#095;part_hours before another re-balance succeeds.	
			
8.Copy `object-1.ring.gz` file to all the nodes

	ringos copy-ring -s /root/ring-building/object-1.ring.gz -n <IP address of Swift nodes>
	

9.Repeat steps from **6 - 8** with the weights 50, 75, and 100 (w= 50, 75, 100).


 
<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*