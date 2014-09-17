---
layout: default
title: "HP Helion OpenStack&#174; Object Operations Service Overview"
permalink: /helion/openstack/GA1/services/object/pyringos/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

#pyringos

pyringos tool deploys Swift cluster with the help of SSH access to the servers, sudo and python only. It runs on the Undercloud, so it does not require servers, databases, or any other tools. It is an ideal tool if you want minimal extra bureaucracy to manage Swift cluster. The pyringos tool is not a generic deployment system and does not define the workflow of Swift cluster deployment or management.

<!--

pyringos tool is a way to deploy Swift cluster relying only upon SSH access to the servers, sudo, and some Python. It runs on your Undercloud, and does not require servers, databases, or any other tools. It is an ideal tool if you want minimal extra bureaucracy to manage Swift cluster. The pyringos tool is not a generic deployment system and does not define the workflow of Swift cluster deployment or management.-->

##Command line

The following command line are used to perform ringos activities.

* [list-swift-nodes](#list-swift-nodes)
* [list-disks](#list-disks)
* [format-disks](#format-disks)
* [create-ring](#create-ring)
* [add-disk-to-ring](#add-disk-to-ring)
* [rebalance-ring](#rebalance-ring)
* [view-ring](#view-ring)
* [copy-ring](#copy-ring)
* [remove-disk-from-ring](#remove-disk-from-ring)


###List-swift-nodes {### list-swift-nodes ###}

List the available Swift nodes in the cloud.

	ringos  list-swift-nodes


###list-disks  {#list-disks}
List disks and size of the disks on a given node.
	
	ringos help list-disks

###format-disks {#format-disks}
To format and mount all the available disks on a node.

	ringos format-disks -n (IP address of the node) -u heat-admin -d all

To format a specific disk.

	ringos format-disks -n (IP address of the node) -u heat-admin -d /dev/sdc -l d2

###create-ring  {#create-ring }

Create a ring based on part&#095;power, replicas, and min&#095;part&#095;hours.

	ringos create-ring -f /root/ring-building/object-1.builder -p <value> -r <value> -m <value>

 In the following example , we use one zone each partition power =10, replicas =3, min_part_hours =1

	ringos create-ring -f /root/ring-building/object-1.builder -p 10 -r 3 -m 1
	
<!--->>Created ring /root/ring-building/object-1.builder --->


###add-disk-to-ring {#add-disk-to-ring}
Add disk to a ring.


	ringos add-disk-to-ring -f /root/ring-building/object-1.builder -i  <IP address??> -p  < values> -d <values??> -w <value> -r <value> -z <value>
	
<!--->>Added disk 192.0.2.29:a1410063335 to ring--->


 
###rebalance-ring {#rebalance-ring}
Rebalances a given ring


###view-ring {#view-ring}
View contents of a given ring.

	ringos view-ring -f 

In the following example, you can view the ring

	ringos view-ring -f /root/ring-building/object-1.builder 
	
	object-1.builder,build version 9 
	
	1024 partitions,3.000000 replicas, 1 regions, 3 zones, 9 devices, 100.00 balance
	
	The minimum number of hours before a partition can be reassigned is 1
	
	Devices:   id  region zone      ip address  port  replication ip  replication port      name weight partitions balance meta
	
	  0         1    1               192.0.2.29  6000      192.0.2.29      6000        a1410063335    100.00          0-100.00

###copy-ring  {#copy-ring}
Pushes ring to a given node

 
###remove-disk-from-ring {#remove-disk-from-ring}
Removes a given disk from ring
