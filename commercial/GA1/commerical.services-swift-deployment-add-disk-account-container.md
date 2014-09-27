---
layout: default
title: "HP Helion OpenStack&#174; Add Disk to Account and Container Ring"
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


<p style="font-size: small;"> <a href=" /helion/openstack/ga/services/object/swift/expand-cluster/">&#9664; PREV</a> | <a href=" /helion/openstack/ga/services/object/swift/expand-cluster/">&#9650; UP</a> | <a href="/helion/openstack/ga/services/swift/deployment/add-disk-scale-out/"> NEXT &#9654</a> </p>


#Add Disk to Account and Container Ring

It is recommended to use proxy node to store account, container objects based on scale-out architecture. When new disks are added to proxy node you can choose this disk to expand storage capacity of account and container ring. We also recommend to use same sets of disks for account and container.



##Prerequisite

1. HP Helion OpenStack cloud is successfully deployed 
2. Scale-out object-ring:1 is deployed
3. Scale out proxy node is deployed

**IMPORTANT**:  
 
* All of the rings generated must be preserved preferably at more than one location. Swift needs these rings to be consistent across all nodes. 

* Take a backup of rings before any operation.


##Adding Swift disks to a ring


Perform the following steps to add Swift disk to a ring:

1. Login to Undercloud 

		#ssh heat-admin@<Undercloud IP address> 
		#sudo -i

2. Change the directory to ring builder

		#cd /root/ring-building


3. List the scale-out proxy node

		#ringos list-swift-nodes -t proxy

	Sample out of the proxy nodes is as follows:

			+---------------+
			| proxy-nodes   |
			+---------------+
			| 192.0.2.22    |
			+---------------+

4. List the disks on the Proxy node

		#ringos list-disks -n <Proxy node IP address> 

	Sample out of the disk on the proxy node:

				+----------+------------+
				| disk     | size       |
				+----------+------------+
				| /dev/sdb | 1073741824 |
				|          |            |
				| /dev/sdc | 1073741824 |
				|          |            |
				+----------+------------+
	
5. Format a given disk

		#ringos format-disks -n <Proxy node IP address>  -d <disk>

	Sample out of the formatted disk:

		+----------+-----------+---------+---------------------------------+-------------+------------+
		| disk     | formatted | mounted | mount_point                     | label       | size       |
		+----------+-----------+---------+---------------------------------+-------------+------------+
		| /dev/sdb | y         | y       | /mnt/state/srv/node/b1410063336 | b1410063336 | 1073741824 |
		+----------+-----------+---------+---------------------------------+-------------+------------+


	**Note**: You can format all the disks with a single command (-d --all).


6. Add formatted disk to account and container ring

		#ringos add-disk-to-ring -f /root/ring-building/account.builder -i <Swift nodes IP address> -p <port> -d <disk label> -w <weight> -r <region> -z <zone>
		#ringos add-disk-to-ring -f /root/ring-building/container.builder -i <Swift nodes IP address> -p <port> -d <disk label> -w <weight> -r <region> -z <zone>

**Recommendation**: 

* Set zone as 2 for scale-out Proxy nodes and region remains 1.
                
* Add a drive gradually using a weighted approach to avoid degraded performance of Swift cluster. The weight will gradually increase by 25% until it becomes 100%. Initial weight is 25.

7.List the file in the ring building directory. Identify `account.builder` and `container.builder` files.

	
8.Re-balance both account and container ring

		#ringos rebalance-ring -f /root/ring-building/account.builder
		
		#ringos rebalance-ring -f /root/ring-building/container.builder	

9.List all the Swift nodes 

		#ringos list-swift-nodes -t all

10.Copy `account.ring.gz` file to all the nodes

	#ringos copy-ring -s /root/ring-building/account.ring.gz -n <Swift nodes IP address>
	

11.Copy `container.ring.gz` file to all the nodes

	#ringos copy-ring -s /root/ring-building/container.ring.gz -n <Swift nodes IP address>

12.Repeat steps from 6 - 11 with the weights 50, 75, and 100 (w= 50, 75, 100).


 
<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*