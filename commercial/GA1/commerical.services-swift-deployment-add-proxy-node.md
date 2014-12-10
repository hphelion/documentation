---
layout: default
title: "HP Helion OpenStack&#174; Add New Proxy Node"
permalink: /helion/openstack/services/swift/deployment/add-proxy-node/
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
<p style="font-size: small;"> <a href=" /helion/openstack/services/object/swift/expand-cluster/">&#9664; PREV</a> | <a href=" /helion/openstack/services/object/swift/expand-cluster/">&#9650; UP</a> | <a href="/helion/openstack/services/swift/deployment/add-disk-storage-node/"> NEXT &#9654</a> </p>
--->

# HP Helion OpenStack&#174;: Add New Scale-out Proxy Node

This topic shows how to add a proxy node to the store account and container ring.

1. [Prerequisite](#prer)
2. [Deploying new node(s)](#deploying-new-node)


##Prerequisite {#prer}

* HP Helion OpenStack&#174; cloud is successfully deployed.<br> *(Starter Swift nodes are functional by default as they are part of cloud deployment)*
* Scale-out object-ring:1 is deployed.


##Deploying new node(s) {#deploying-new-node}

Perform the steps mentioned in  [Provision Node(s)](/helion/openstack/services/swift/provision-nodes/) to deploy a new node.


##Update load balancer with new Proxy nodes
 
1. Log in to the undercloud from seed.
 
		# ssh heat-admin@<undercloud IP address> 
		# sudo -i

2. Change the directory to ring builder.

		# cd /root/ring-building 

3. Copy account, container, object, and generated `object-1.ring.gz` files to proxy nodes and press **yes** when asked to authenticate the node. 

		# ringos copy-ring -s /root/ring-building/\*.ring.gz -n <proxy node IP address> 

4. After creation of the Proxy node, list the Proxy IP addresses.

		# ringos list-swift-nodes -t proxy

5. List all the controller nodes

 		# nova list

6. Edit `swift-proxy.cfg` on each of the controller nodes. 

	 	/etc/haproxy/manual/swift-proxy.cfg

7. Add the following content in the `swift-proxy.cfg` file.

		  listen scale_swift_proxy
		  bind <Virtual IP (running on the controller nodes)>:8080
		  server <proxy node hostname> <proxy nodes IP address>:8080 check inter 2000 rise 2 fall 5 

	**Note**:
			
	* The number of "server" lines equals the number of Swift Proxies you have set up.
	* For virtual IP: 

		* Login to the controller node
	
		  		# ssh heat-admin@<Controller Node IP address>
				# sudo -i

		*  Run the following command to view the virtual IP of the controller nodes

				/etc/keepalived/keepalived.conf


8. Restart the HA Proxy service on all these nodes.

		# service haproxy restart

The Swift Proxies are now successfully enabled with HA Proxy. 


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>



----
