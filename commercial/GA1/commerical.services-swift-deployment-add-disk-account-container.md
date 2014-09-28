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

<!---
<p style="font-size: small;"> <a href=" /helion/openstack/ga/services/object/swift/expand-cluster/">&#9664; PREV</a> | <a href=" /helion/openstack/ga/services/object/swift/expand-cluster/">&#9650; UP</a> | <a href="/helion/openstack/ga/services/swift/deployment/add-disk-scale-out/"> NEXT &#9654</a> </p> --->


#Add Disk to Account and Container Ring

It is recommended to use Proxy node to store account, container objects based on scale-out architecture. When new disks are added to Proxy node you can choose this disk to expand storage capacity of account and container ring. We also recommend to use same sets of disks for account and container.

1. [Prerequisite](#prer)
2. [Adding Swift disks to a ring](#adding-swift-disks-to-a-ring)



##Prerequisite {#prer}

1. HP Helion OpenStack&#174; cloud is successfully deployed 
2. Starter swift is functional which by default gets deployed as part of deployment of cloud
2. Scale-out object-ring:1 is deployed
3. Scale-out Proxy node is deployed

**IMPORTANT**:  
 
* All of the rings generated must be preserved preferably at more than one location. Swift needs these rings to be consistent across all nodes. 
* Take a backup of rings before any operation.


##Adding Swift disks to a ring {#adding-swift-disks-to-a-ring}

Perform the following steps to add Swift disk to a ring:

1. Log in to Undercloud. 

		# ssh heat-admin@<Undercloud IP address> 
		# sudo -i

2. Change the directory to ring builder.

		# cd /root/ring-building


3. List the scale-out Proxy node.

		# ringos list-swift-nodes -t proxy

	The following sample displays the Proxy nodes:

			+---------------+
			| proxy-nodes   |
			+---------------+
			| 192.0.2.22    |
			+---------------+

4. List the disks on the Proxy node.

		# ringos list-disks -n <Proxy node IP address> 

	The following sample displays the list of disk available on the Proxy node **192.0.2.22**. 

				+----------+------------+
				| disk     | size       |
				+----------+------------+
				| /dev/sdb | 1073741824 |
				|          |            |
				| /dev/sdc | 1073741824 |
				|          |            |
				+----------+------------+
	
5. Format a given disk.

		# ringos format-disks -n <Proxy node IP address>  -d <disk>

	The following sample displays the output of formatted disk of **192.0.2.22**.

		+----------+-----------+---------+---------------------------------+-------------+------------+
		| disk     | formatted | mounted | mount_point                     | label       | size       |
		+----------+-----------+---------+---------------------------------+-------------+------------+
		| /dev/sdb | y         | y       | /mnt/state/srv/node/b1410063336 | b1410063336 | 1073741824 |
		+----------+-----------+---------+---------------------------------+-------------+------------+


	**Note**: You can format all the disks with a single command (-d --all).

6. List the file in the ring building directory. Identify `account.builder` and `container.builder` files.

7. Add formatted disk to account and container ring.

		# ringos add-disk-to-ring -f /root/ring-building/account.builder -i <Proxy nodes IP address> -p <port> -d <disk label> -w <weight> -r <region> -z <zone>
		# ringos add-disk-to-ring -f /root/ring-building/container.builder -i <Proxy nodes IP address> -p <port> -d <disk label> -w <weight> -r <region> -z <zone>

**Recommendation**: 

* Set zone as 2 for scale-out Proxy nodes and region remains 1.
                
* Add a drive gradually using a weighted approach to avoid degraded performance of Swift cluster. The weight will gradually increase by 25% until it becomes 100%. Initial weight is 25.


8.Re-balance both account and container ring.

	# ringos rebalance-ring -f /root/ring-building/account.builder
	# ringos rebalance-ring -f /root/ring-building/container.builder	

9.List all the Swift nodes. 

	# ringos list-swift-nodes -t all

10.Copy `account.ring.gz`  and  `container.ring.gz` files to all the nodes.

	# ringos copy-ring -s /root/ring-building/account.ring.gz -n <Swift nodes IP address>
	# ringos copy-ring -s /root/ring-building/container.ring.gz -n <Swift nodes IP address>

11.Repeat steps from 7 - 10 with the weights set to 50, 75, and 100 (w= 50, 75, 100). These steps should be repeated until the weight becomes 100 for each disk.



 
<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*