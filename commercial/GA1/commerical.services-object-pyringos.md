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

pyringos tool run on the Undercloud and helps to deploy Swift cluster.

You can use the following commands using the pyringos Client CLI package in the Undercloud.

* [Help Command](#help)

* [Ring Commands](#ring)

* [Node Commands](#node)

* [Disk Commands](#disk)

* [Miscellaneous Commands](#misc)


##Help Command {#help}

###Help

You can display the help of this program or one of its sub-programs

	ringos help


### Help subcommand

You get two sets of arguments- Positional and Optional.

	ringos help <sub-command>



The following command line are used to perform ringos activities.

## Ring Commands {#ring}

###Create ring  {#create-ring }

Create a ring based on part&#095;power, replicas, and min&#095;part&#095;hours.

	
	ringos create-ring -f <BUILDER> -p <PART_POWER> -r <REPLICAS> -m <MIN_PART_HOURS>


 In the following example, we use one zone each partition power =10, replicas =3, min_part_hours =1

	ringos create-ring -f /root/ring-building/object-1.builder -p 10 -r 3 -m 1
	
	Created ring /root/ring-building/object-1.builder


### Add disk to a ring {#add-disk-to-ring}
Adding a ring to a disk.

 	ringos add-disk-to-ring -f <BUILDER> -i <IP> [-p <PORT>] -d <DISK> -w <WEIGHT> [-r <REGION>] [-z <ZONE>] 


* &lt;BUILDER>: builder file.
* &lt;IP>: IP address of  Swift nodes (Object node, Proxy node, Container node, and starter nodes)
* &lt;PORT>: port number.
* &lt;DISK>: Disk label                
* &lt;WEIGHT>: Weight.
* &lt;REGION>:region 
* &lt;ZONE>: Single point failure within a cluster
                       

In the following example a disk is added to a ring:

	ringos add-disk-to-ring -f /root/ring-building/object-1.builder -i  192.0.2.29 -p  6000 -d a1410063335 -w 100 -r 1 -z 1
	
	Added disk 192.0.2.29:a1410063335 to ring


###View a ring {#view-ring}
View contents of a given ring.

	ringos view-ring -f <BUILDER>


In the following example, you can view the content of the ring

	ringos view-ring -f /root/ring-building/object-1.builder 
	
	object-1.builder,build version 9 
	
	1024 partitions,3.000000 replicas, 1 regions, 3 zones, 9 devices, 100.00 balance
	
	The minimum number of hours before a partition can be reassigned is 1
	
	Devices:   id  region zone      ip address  port  replication ip  replication port      name weight partitions balance meta
	
	  0         1    1               192.0.2.29  6000      192.0.2.29      6000        a1410063335    100.00          0-100.00

 
###Re-balance a ring {#rebalance-ring}
Re-balances a given ring after adding disk to the ring.

	ringos view-ring -f <BUILDER>

###copy-ring  {#copy-ring}

Copies ring the the available nodes.

	 ringos copy-ring -s <RING> -n <NODE> 

For example:

	ringos copy-ring -s /root/ring-building/\*.ring.gz -n <IP address of Swift nodes>


### Remove a disk from the ring {#remove-disk-from-ring}

Incase of failure you can removes a given disk from ring.

			ringos remove-disk-from-ring -f <BUILDER> -s <SEARCH_VAL>

For example:

	ringos remove-disk-from-ring -f /root/ring-building/object-1.builder -s d0


### Validate-ring       

Run validate routine on the ring.

  	ringos validate-ring -f <BUILDER>


###search-ring

 Shows information about matching devices.
 
	ringos search-ring -f <BUILDER> -s <SEARCH_VAL>

### Write a ring 

 Writes the builder contents onto a ring file.

	 ringos write-ring -f <BUILDER>


##Node Commands {#node}

###List Swift nodes {### list-swift-nodes ###}

List the available Swift nodes (starter, contianer, proxy, and object nodes) in the cloud.

	ringos list-swift-nodes -t <TYPE>

###List disks in nodes  {#list-disks}
List disks and size of the disks on a given node.
	
	ringos list-disks -n <NODE> -u heat admin
	
##Disk Commands {#disk}

###format-disks {#format-disks}
To format and mount all the available disks on a node.

	ringos format-disks -n <IP address of the node> -u heat-admin -d all

To format a specific disk.

	ringos format-disks -n <IP address of the node> -u heat-admin -d <DISK> [-l <LABEL>]


###set weight to disk

To set the weight gradually or remove gradually.

	ringos set-weight -f <BUILDER> -s <SEARCH_VAL> -w <WEIGHT>

For example:

	ringos set-weight -f object-1.builder -s d5 -w 0

##Miscellaneous Commands {#misc}

###Set replica

Change replica count to given replicas

	ringos set-replicas -f <BUILDER> -r <REPLICAS>


###Set information	

Set info of disk(s) matching search value

	ringos set-info -f <BUILDER> -s <SEARCH_VAL> -i <INFO>

###set min part hours	

Set min_part_hours for the given ring

	ringos set-min-part-hours -f <BUILDER> -m <MIN_PART_HOURS>


##Bash completion   

Prints all of the commands and options to the standard output.

	ringos bash-completion

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
