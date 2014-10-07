---
layout: default
title: "HP Helion OpenStack&#174; Add New Proxy Node"
permalink: /helion/openstack/ga/services/swift/deployment/add-proxy-node/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href=" /helion/openstack/ga/services/object/swift/expand-cluster/">&#9664; PREV</a> | <a href=" /helion/openstack/ga/services/object/swift/expand-cluster/">&#9650; UP</a> | <a href="/helion/openstack/ga/services/swift/deployment/add-disk-storage-node/"> NEXT &#9654</a> </p>


# HP Helion OpenStack&#174;: Add New Scale-out Proxy Node

This topic shows how to add a proxy node to the store account and container ring.

1. [Prerequisite](#prer)
2. [Deploying new node(s)](#deploying-new-node)


##Prerequisite {#prer}

* HP Helion OpenStack&#174; cloud is successfully deployed.
* Starter Swift nodes are functional by default as they are part of cloud deployment. 
* Scale-out object-ring:1 is deployed.


##Deploying new node(s) {#deploying-new-node}

Perform the steps mentioned in  [Provision Node(s)](/helion/openstack/ga/services/swift/provision-nodes/) to deploy a new node.


##Update load balancer with new Proxy nodes
 
1. Log in to the undercloud from Seed.
 
		# ssh heat-admin@<Undercloud IP address> 
		# sudo -i

2. After creation of the Proxy node, list the Proxy IP addresses.

		# ringos list-swift-nodes -t proxy

3. List all the controller nodes

 		# nova list



4. Edit `swift-proxy.cfg` on each of the controller nodes. 

	 	/etc/haproxy/manual/swift-proxy.cfg

5. Add the following content in the `swift-proxy.cfg` file.

		  listen scale_swift_proxy
		  bind 192.0.2.21:8080
		  server <Proxy node hostname> <Proxy nodes IP address>:8080 check inter 2000 rise 2 fall 5 

	**Note**:The number of "server" lines will equal the number of Swift Proxies you have set up.

6. Restart the HA Proxy service on all these nodes.

		# service haproxy restart

The Swift Proxies are now successfully enabled with HA Proxy. 


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


**Related topics**

* [Extend Swift Cluster]( /helion/openstack/ga/services/object/swift/expand-cluster/)

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
