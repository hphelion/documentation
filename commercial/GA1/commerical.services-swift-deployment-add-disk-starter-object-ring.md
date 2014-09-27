---
layout: default
title: "HP Helion OpenStack&#174; Add Disk to Starter Object Ring"
permalink: /helion/openstack/ga/services/swift/deployment/add-disk-starter/
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
<p style="font-size: small;"> <a href=" /helion/openstack/ga/services/object/swift/expand-cluster/">&#9664; PREV</a> | <a href="/helion/openstack/ga/services/object/swift/expand-cluster/">&#9650; UP</a> | <a href="/helion/openstack/ga/services/swift/deployment/add-proxy-node/"> NEXT &#9654</a> </p>-->


#Add Disk to Starter Object Ring

Perform the following procedure to add disk to a starter object ring. 

1. [Prerequisite](#Prer)
2. [Adding Swift disks to a ring](#adding-Swift-disks-to-a-ring)



##Prerequisite {#prer}

* HP Helion Cloud is deployed
* Starter swift is functional which by default gets deployed as part of deployment of cloud

**IMPORTANT**:  
 
*  All of the rings generated must be preserved preferably at more than one location. Swift needs these rings to be consistent across all nodes.
* Take a backup of rings before any operation.


##Adding Swift disks to a ring {#adding-Swift-disks-to-a-ring}

Perform the following steps to add Swift disk to a ring:

1. Login to Undercloud. 

		# ssh heat-admin@<Undercloud IP address> 
		# sudo -i

2. Change the directory to ring builder.

		# cd /root/ring-building

3. List the starter Swift nodes.

		# ringos list-swift-nodes -t starter

4. List the disks on the starter nodes.

		# ringos list-disks -n <Starter Swift nodes IP address> 

5. Format a given disk.

		# ringos format-disks -n <Starter Swift nodes IP address> -d <disk>

	**Note**: You can format all the disks with the single command (-d --all).


6. List the file in ring directory and identify the `object.builder` file for object-0.

	
7. Add formatted disk to object-0 ring.

		# ringos add-disk-to-ring -f /root/ring-building/object-1.builder -i <Starter Swift nodes IP address> -p <port> -d <disk label> -w <weight> -r <region> -z <zone>

**Note**: Choose the zone and region information appropriately.

**Recommendation**: 
              
* Add a drive gradually using a weighted approach to avoid degraded performance of Swift cluster. The weight will gradually increase by 25% until it becomes 100%. Initial weight is 25.


8.Re-balance the ring.

		# ringos rebalance-ring -f /root/ring-building/object.builder
	
**Note**: Wait for min&#95;part&#95;hours before another re-balance succeeds.	
	
9.List all the Swift nodes. 

		# ringos list-swift-nodes -t all
		
10.Copy object file to all the nodes.

	# ringos copy-ring -s /root/ring-building/object.ring.gz -n <Swift nodes IP address>

11.Repeat steps from **7 - 10** with the weights set to 50, 75, and 100 (w= 50, 75, 100).


 
<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*