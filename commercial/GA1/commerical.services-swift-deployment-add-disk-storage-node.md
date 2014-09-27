---
layout: default
title: "HP Helion OpenStack&#174; Object Operations Service Overview"
permalink: /helion/openstack/ga/services/swift/deployment/add-disk-object-node/
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

Perform the following procedure to add new scale-out object node. 


1. [Prerequisite](#preq)
2. [Deploying new object nodes](#deploy-new-object-node)
3. [Adding node and disks to object-ring:1](#add-disk-node)
4. [Re-balancing the ring](#rebalance-ring)
5. [Copying object-ring:1 to all nodes](#copy-object-node)


##Prerequisite {#preq}

1. HP Helion OpenStack cloud is successfully deployed 
2. Starter swift is functional which by default gets deployed as part of deployment of cloud
2. Scale-out object-ring:1 is deployed

##Deploying new object nodes {#deploy-new-object-node}

Perform the following steps mentioned in  [Procedure to deploy scale-out Swift nodes with HP Helion OpenStack](/helion/openstack/ga/services/swift/deployment-scale-out/) to deploy a new node.


## Adding node and disks to object-ring:1 {#add-disk-node}

Once the Swift nodes are deployed ensure that you format the required disks and mount them before adding disks to Swift cluster. 

1. Format a given disk.

		# ringos format-disks -n <Object node IP address> -d <disk>

**Note**: You can format all the disks with a single command (-d --all). 


2.Add disk to the ring. 

	# ringos add-disk-to-ring -f /root/ring-building/object-1.builder -i  <Object node IP address> -p  <port> -d <disk label> -w <weight> -r <region> -z <zone>

<!---
In the following sample displays the addition of disk to **192.0.2.29** and its output:

	# ringos add-disk-to-ring -f /root/ring-building/object-1.builder -i 192.0.2.29 -p 6000 -d a1410063335 -w 100 -r 1 -z 1
	Added disk 192.0.2.29:a1410063335 to ring --->


3.Verify the contents of `object-1.builder` file to ensure that new node and disk are added to your existing ring.

	# ringos view-ring -f /root/ring-building/object-1.builder

## Re-balancing the ring {#rebalance-ring}

1. Re-balance the ring.

		# ringos rebalance-ring -f /root/ring-building/object-1.builder

	This will generate an **object-1.ring.gz** file.

2. Verify the content in `object-1.builder` file after re-balancing the ring.

		# ringos view-ring -f /root/ring-building/object-1.builder


##Copying object-ring:1 to all nodes{#copy-object-node}

1. List all the Swift nodes. 

		# ringos list-swift-nodes -t  all
 
2. Copy account, container, object-0 , and generated `object-1.ring.gz` files to new nodes and press **yes** when asked to authenticate node. 

		# ringos copy-ring -s /root/ring-building/\*.ring.gz -n <Swift nodes IP address>


	The sample of authentication node will be displayed as follows:

		The authenticity of host '192.0.2.29 (192.0.2.29)' can't be established.
		ECDSA key fingerprint is 8a:eb:b7:66:3b:5f:fa:d6:d1:49:80:1a:a7:90:79:20.
		Are you sure you want to continue connecting (yes/no)? yes
		Copied ring /root/ring-building/object-1.ring.gz onto 192.0.2.29

 
<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*