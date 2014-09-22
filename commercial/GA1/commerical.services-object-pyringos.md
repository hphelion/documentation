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

Note that you must be careful while planning for ring attributes as some of them (like part power) cannot be changed once deployed.


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


###List Swift nodes {### list-swift-nodes ###}

List the available Swift nodes in the cloud.

	ringos  list-swift-nodes


###List disks in nodes  {#list-disks}
List disks and size of the disks on a given node.
	
	ringos list-disks -n <IP address> -u heat-admin

###format-disks {#format-disks}
To format and mount all the available disks on a node.

	ringos format-disks -n <IP address of the node> -u heat-admin -d all

To format a specific disk.

	ringos format-disks -n <IP address of the node> -u heat-admin -d /dev/sdc -l d2


###create-ring  {#create-ring }

Create a ring based on part&#095;power, replicas, and min&#095;part&#095;hours.

	ringos create-ring -f /root/ring-building/object-1.builder -p <value> -r <value> -m <value>

 In the following example, we use one zone each partition power =10, replicas =3, min_part_hours =1

	ringos create-ring -f /root/ring-building/object-1.builder -p 10 -r 3 -m 1
	
	Created ring /root/ring-building/object-1.builder


### Add disk to a ring {#add-disk-to-ring}
Add disk to a ring.

	ringos add-disk-to-ring -f /root/ring-building/object-1.builder -i <IP address of object node> -p <value> -d <value> -w <value> -r <value> -z <value>

In the following example a disk is added to a ring:

	ringos add-disk-to-ring -f /root/ring-building/object-1.builder -i  192.0.2.29 -p  6000 -d a1410063335 -w 100 -r 1 -z 1
	
	Added disk 192.0.2.29:a1410063335 to ring


###view-ring {#view-ring}
View contents of a given ring.

	ringos view-ring -f /root/ring-building/object-1.builder

In the following example, you can view the content of the ring

	ringos view-ring -f /root/ring-building/object-1.builder 
	
	object-1.builder,build version 9 
	
	1024 partitions,3.000000 replicas, 1 regions, 3 zones, 9 devices, 100.00 balance
	
	The minimum number of hours before a partition can be reassigned is 1
	
	Devices:   id  region zone      ip address  port  replication ip  replication port      name weight partitions balance meta
	
	  0         1    1               192.0.2.29  6000      192.0.2.29      6000        a1410063335    100.00          0-100.00

 
###rebalance-ring {#rebalance-ring}
Rebalances a given ring after adding disk to the ring.

	ringos rebalance-ring -f /root/ring-building/object-1.builder


###copy-ring  {#copy-ring}

Copy the ring files available with starter nodes to all the swift nodes. Perform this steps with all the available Swift nodes so that all the files are available in all the Swift nodes.

	ringos copy-ring -s /root/ring-building/\*.ring.gz -n <IP address of Swift nodes>


###remove-disk-from-ring {#remove-disk-from-ring}

Incase of failure you can removes a given disk from ring.

	ringos remove-disk-from-ring -f /root/ring-building/object-1.builder -s d0

###set weight to disk

To add ring gradually or remove gradually.

	ringos set-weight -f object-1.builder -s d5 -w 0

###set replica

Change replica count to given replicas


###set-info	

Set info of disk(s) matching search value

###set-min-part-hours	

Set min_part_hours for the given ring