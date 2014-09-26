---
layout: default
title: "HP Helion OpenStack&#174; Object Operations Service Overview"
permalink: /helion/openstack/ga/services/swift/deployment/add-disk-storage-node/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href=" /helion/openstack/ga/services/object/swift/expand-cluster/">&#9664; PREV</a> | <a href=" /helion/openstack/ga/services/object/swift/expand-cluster/">&#9650; UP</a> | <a href=" /helion/openstack/ga/services/object/swift/Monitor-cluster/"> NEXT &#9654</a> </p>


#Add New Scale-out Object Node

Perform the following procedure to add new scale-out storage node. 


##Prerequisite

1. HP Helion OpenStack cloud is successfully deployed and has the following: 

	* Seed
	* Undercloud
	* Overcloud 
	* Starter Swift nodes (which is functional)
2. Scale-out object-ring:1 is deployed


##Deploying new object nodes

Perform the following steps mentioned in  [Procedure to deploy scale-out Swift nodes with HP Helion OpenStack](/helion/openstack/ga/services/swift/deployment-scale-out/) to deploy new node.


## Adding node and disks to object-ring:1

Once the Swift nodes are deployed ensure that you format the required disks and mount them before adding disks to Swift cluster. 

1. Use the following command to format disk:

		#ringos format-disks -n <IP address of Swift node> -d all

Refer [ringos Manual]( /helion/openstack/GA1/services/object/pyringos/) for more details.


2.Add disk to the ring. 

	#ringos add-disk-to-ring -f /root/ring-building/object-1.builder -i  <Node IP address> -p  <value> -d <value> -w <value> -r <value> -z <value>

**Note:** Use labels and disks obtained in output of step 1. 

In the following example we are adding disk of node(**192.0.2.29**) to zone 1:

	ringos add-disk-to-ring -f /root/ring-building/object-1.builder -i 192.0.2.29 -p 6000 -d a1410063335 -w 100 -r 1 -z 1
	Added disk 192.0.2.29:a1410063335 to ring


3.Verify the contents of `object-1.builder` file to ensure that new node and disk are added to your existing ring.

	ringos view-ring -f /root/ring-building/object-1.builder

## Re-balance the ring

1. Rebalance the ring using the following command:

		ringos rebalance-ring -f /root/ring-building/object-1.builder

This will generate a **object-1.ring.gz** file.

2. Verify the content in `object-1.builder` file after rebalancing the ring.

		ringos view-ring -f /root/ring-building/object-1.builder

##Copying Object-ring:1 to all nodes

1. List all the Swift nodes. 

		ringos list-swift-nodes -t  all
 
2. Copy account, container, object-0 , and generated`object-1.ring.gz` files to new nodes. 

	ringos copy-ring -s /root/ring-building/\*.ring.gz -n <IP address of Swift node>


Press **yes** when asked to authenticate node.  

The sample of authentication node will be displayed as follows:

	The authenticity of host '192.0.2.29 (192.0.2.29)' can't be established.
	ECDSA key fingerprint is 8a:eb:b7:66:3b:5f:fa:d6:d1:49:80:1a:a7:90:79:20.
	Are you sure you want to continue connecting (yes/no)? yes
	Copied ring /root/ring-building/object-1.ring.gz onto 192.0.2.29

 
<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*