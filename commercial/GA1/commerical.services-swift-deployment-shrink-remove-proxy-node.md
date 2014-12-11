---
layout: default
title: "HP Helion OpenStack&#174; Object Operations Service Overview"
permalink: /helion/openstack/services/swift/deployment/remove-proxy-node/
product: commercial.ga

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href=" /helion/openstack/services/object/overview/scale-out-swift/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/overview/"> NEXT &#9654</a> </p>-->

#HP Helion OpenStack&#174;: Remove a Proxy Node

It is recommended that you gradually reduce the weight in the ring and change the disk in the Swift cluster to avoid poor performance. 

Scale-out Proxy nodes can only be removed from the cloud after all the disks have been removed from the node.


1. [Prerequisites](#prer)
2. [Identify the disks of the node to be removed](#identify-disk-node-removed)
3. [Removing disk from the ring](#remove-disk-from-ring)
4. [Re-balancing the ring](#re-balance-ring)
5. [Copying the rings to other nodes](#copy-ring)
6. [Removing the haproxy configuration from each of the Overcloud Controller nodes](#remove-haproxy)
7. [Remove the scale-out proxy node by removing the corresponding stack](#remove-scale-out-proxy)
8. [Verify the node removal](#verify-node-removal)

##Prerequisites {#prer}

* HP Helion OpenStack&#174; cloud is successfully deployed.<br>*(Starter Swift nodes are functional by default as they are part of cloud deployment.)*
* The scale-out Object Ring-1 has been deployed.
* At least one scale-out proxy node has been deployed.
* All of the rings generated **must** be preserved, preferably at more than one location. Swift needs these rings to be consistent across all nodes.
* Take a backup of the rings before any operation.



##Identify the disks of the node to be removed {#identify-disk-node-removed}

Perform the following steps to identify the disks of the node to be removed:

1. Log in to the undercloud from seed. 

		# ssh heat-admin@<undercloud IP address> 
		# sudo -i

2. Change the directory to ring builder.

		# cd /root/ring-building

3. Identify the builder file for account and container rings. It will be `account.builder` and `container.builder`.

4. List the disks in the current `account.builder` and `container.builder` files.

		# ringos view-ring -f /root/ring-building/account.builder 
		# ringos view-ring -f /root/ring-building/container.builder


	**Recommendation**:

	Remove drives gradually using a weighted approach to avoid degraded performance of the Swift cluster. The weight will gradually decrease by 25% until it becomes 0%. The initial weight is 75.


5. Set the weight of the disk for `account.builder` and `container.builder`files.

    		# ringos set-weight -f account.builder -s d<device> -w <weight>
    		# ringos set-weight -f container.builder -s d<device> -w <weight>

6. Re-balance the ring.

    	# ringos rebalance-ring -f account.builder
    	# ringos rebalance-ring -f container.builder

	**Note**: You must wait for the time specified by `min_part_hours` before another re-balance succeeds.

7. List all the Swift nodes.

		# ringos list-swift-nodes -t all
		
8. Copy `account.ring.gz`  and  `container.ring.gz` files to all nodes.
    
    	# ringos copy-ring -s /root/ring-building/account.ring.gz -n <Swift nodes IP address>
    	# ringos copy-ring -s /root/ring-building/container.ring.gz -n <Swift nodes IP address>

9. Repeat steps from **5-8** decreasing the weight by 25 each time; set the weight to 50, 25, and finally 0 (w= 50, 25, 0). These steps should be repeated until the weight becomes 0 for each disk.

10. Verify the `account.rbuilder`  and `container.builder` files.
    	
		# ringos view-ring -f /root/ring-building/account.builder
    	# ringos view-ring -f /root/ring-building/container.builder

##Removing disk from the ring {#remove-disk-from-ring}

1. Once weight is set to 0, remove the disk from the ring.

		# ringos remove-disk-from-ring -f account.builder -s d<device>
		# ringos remove-disk-from-ring -f container.builder -s d<device>
	
Repeat this step for each disk of the specific node.


##Re-balancing the ring {#re-balance-ring}

1. Re-balance the ring. 

		# ringos rebalance-ring -f container.builder
		# ringos rebalance-ring -f account.builder

2. Verify the ring content.

		# ringos view-ring -f /root/ring-building/account.builder
		# ringos view-ring -f /root/ring-building/container.builder

##Copy the rings to other nodes {#copy-ring}

1. List all the Swift nodes.

		# ringos list-swift-nodes -t all

2. Copy `account.ring.gz` and `container.ring.gz` files to all the nodes.

		# ringos copy-ring -s /root/ring-building/account.ring.gz -n <Swift nodes of IP address>
		# ringos copy-ring -s /root/ring-building/container.ring.gz -n <Swift nodes of IP address>


##Remove the haproxy configuration from each of the overcloud Controller nodes {#remove-haproxy}

1. Edit `swift-proxy.cfg` on each of the controller nodes. 

	 	/etc/haproxy/manual/swift-proxy.cfg

2. Remove the following content in the `swift-proxy.cfg` file.

		  listen scale_swift_proxy
		  bind 192.0.2.21:8080
		  server <Proxy node hostname> <Proxy nodes IP address of >:8080 check inter 2000 rise 2 fall 5 

	**Note**:You will have the number of "server" lines equal to number of Swift proxies you have setup.

3. Restart HA proxy service on all these nodes.

		# service haproxy restart

##Remove the scale-out proxy node {#remove-scale-out-proxy}

Once the disks are removed from the ring, remove the scale-out proxy node by removing the corresponding stack.

1. List the scale-out proxy nodes.

		# heat stack-list

	The following sample displays the output of the above command:

		+--------------------------------------+------------------------------+-----------------+----------------------+
		| id                                   | stack_name                   | stack_status    | creation_time        |
		+--------------------------------------+------------------------------+-----------------+----------------------+
		| 130afae7-d342-4a3e-ae8c-657340dd2c3f | overcloud-ce-controller      | UPDATE_COMPLETE | 2014-09-22T12:16:38Z |
		| 9eb3dd5a-583a-44a9-bea2-84077b2f70a6 | overcloud-ce-novacompute1    | UPDATE_COMPLETE | 2014-09-22T12:41:36Z |
		| 89581cb1-9c2e-46d6-8e0b-aa4518e796dc | overcloud-ce-soswiftproxy1   | UPDATE_COMPLETE | 2014-09-24T09:10:56Z |
		| 9397296e-be45-4a2b-bfba-4d109fce218c | overcloud-ce-soswiftstorage1 | UPDATE_COMPLETE | 2014-09-24T09:11:04Z |
		| b8325052-ec52-4b3b-8304-eb6ec23dd2ac | overcloud-ce-soswiftstorage2 | UPDATE_COMPLETE | 2014-09-24T09:11:14Z |
		+--------------------------------------+------------------------------+-----------------+----------------------+

2. Identify the stack ID of the target scale-out proxy node.
3. Remove the stack. 

		heat stack-delete <id>

##Verify the node removal {#verify-node-removal}

	# nova list

The following sample displays the removal of  **89581cb1-9c2e-46d6-8e0b-aa4518e796dc**

	+--------------------------------------+-------------------------------------------------------+--------+------------+-------------+---------------------+
	| ID                                   | Name                                                  | Status | Task State | Power State | Networks            |
	+--------------------------------------+-------------------------------------------------------+--------+------------+-------------+---------------------+
	| b58c1e9e-e0ad-444b-9f1c-75ada39686c9 | ov--soswiftstorage1-SwiftScaleoutObject1-57jwgsqsr7bf | ACTIVE | -          | Running     | ctlplane=192.0.2.39 |
	| d65bdf2f-7152-4ab5-956a-b3732921d2e8 | ov--soswiftstorage2-SwiftScaleoutObject2-j4zr4dqbrk2r | ACTIVE | -          | Running     | ctlplane=192.0.2.40 |
	| da0d0ccc-f230-435e-b06f-6d33e0bccbb9 | overcloud-ce-controller-SwiftStorage0-y2dnvniiil3x    | ACTIVE | -          | Running     | ctlplane=192.0.2.25 |
	| 858e43e5-f165-4eec-9204-f2d446e7b92b | overcloud-ce-controller-SwiftStorage1-chc74b6u5oug    | ACTIVE | -          | Running     | ctlplane=192.0.2.26 |
	| f637ef36-7df3-474b-ac58-984e87c91719 | overcloud-ce-controller-controller0-22tyyitx66hl      | ACTIVE | -          | Running     | ctlplane=192.0.2.24 |
	| ca9aa23d-aa7a-4e3f-9549-94c0fd4fb8d1 | overcloud-ce-controller-controller1-lvw4ihhm2emf      | ACTIVE | -          | Running     | ctlplane=192.0.2.27 |
	| dfecd038-1771-49d4-942c-c4601b2f62e3 | overcloud-ce-controller-controllerMgmt0-i752ehzde534  | ACTIVE | -          | Running     | ctlplane=192.0.2.23 |
	| a8f60488-d257-4e71-b42d-72c1d5aee7d2 | overcloud-ce-novacompute1-NovaCompute1-5zry7wzanhhs   | ACTIVE | -          | Running     | ctlplane=192.0.2.28 |
	+--------------------------------------+-------------------------------------------------------+--------+------------+-------------+---------------------+


4.	On the seed VM, update the `/root/tripleo/configs/kvm-custom-ips.json` file to reflect new scale number of swift scale-out proxy node. 

		"so_swift_proxy_scale": 2, 

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
