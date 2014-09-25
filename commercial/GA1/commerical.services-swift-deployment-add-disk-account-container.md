---
layout: default
title: "HP Helion OpenStack&#174; Object Operations Service Overview"
permalink: /helion/openstack/ga/services/swift/deployment/add-disk-account-container/
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


#Add Disk to Account and Container Ring

It is recommended to use proxy node to store account, container, and object-ring-0 objects based on scale-out architecture. When new disks are added to proxy node you can choose this disk to expand storage capacity of account and container ring. We also recommend to use same sets of account and container instead of separate disks for account and container.

The following procedure explains the expansion of capacity of account and container. 


##Prerequisite

1. HP Helion OpenStack cloud is successfully deployed and has the following: 

	* Seed
	* Undercloud
	* Overcloud 
	* Two Swift nodes (which is functional)
2. Scale-out object-ring:1 is deployed
3. Scale out proxy node is deployed

**IMPORTANT**:  
 
*  Stored the generated rings at multiple location. These rings should be consistent all across nodes.

* Take a backup of rings before any operation.


##Adding Swift disks to a ring


Perform the following steps to add Swift disk to a ring:

1. Login to Undercloud 

		ssh heat-admin<Undercloud IP address> 
		#sudo -i

2. Change the directory to ring builder

		#cd /root/ring-building

3. List the file in the directory

		ls

	Identify `account.builder` and `container.builder` files in the ring builder directory.

4. List the scale-out proxy node

		ringos list-swift-nodes -t proxy

5. List the disk on the proxy node

		ringos list-disks -n <Node IP> -u heat-admin

6. Format a disk

		ringos format-disks -n <Node IP> -u heat-admin -d <disk>

	**Note**: You can format all the disk with a single command (--all).

7. List all the Swift nodes. Ensure to capture the list of the nodes.

		ringos list-swift-nodes -t all

8. Add formatted disk to account and container ring

		ringos add-disk-to-ring -f /root/ring-building/account.builder -i <IP address of Swift node> -p value -d <value> -w <weight> -r <region> -z <zone>
		ringos add-disk-to-ring -f /root/ring-building/container.builder -i <IP address of Swift node> -p value -d <value> -w <weight> -r <region> -z <zone>

**Recommendation**: 

* Set zone as 2 for scale-out proxy nodes and region remains 1.
                
* Add a drive gradually using a weighted approach to avoid degraded performance of Swift cluster. The weight will gradually increase by 25% until it becomes 100%. Initial weight is 25.


9.Re-balance both account and container ring

		ringos rebalance-ring -f /root/ring-building/account.builder
		
		ringos rebalance-ring -f /root/ring-building/container.builder	

10.Copy `account.ring.gz` file to all the nodes

	ringos copy-ring -s /root/ring-building/account.ring.gz -n <IP address of Swift nodes>
	

11.Copy `container.ring.gz` file to all the nodes

	ringos copy-ring -s /root/ring-building/container.ring.gz -n <IP address of Swift nodes>

12.Repeat steps from 6 - 11 with the weights 50, 75, and 100 (w= 50, 75, 100).


 
<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*