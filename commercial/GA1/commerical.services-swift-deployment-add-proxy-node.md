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


#Add New Proxy Node

You can add proxy node to store account, container, and object-ring.


Perform the following procedure to add new scale-out storage node. 


##Prerequisite

1. HP Helion OpenStack cloud is successfully deployed and has the following: 

	* Seed
	* Undercloud
	* Overcloud 
	* Starter Swift nodes (which is functional)
2. Scale-out object-ring:1 is deployed


##Deploying new nodes

Perform the following steps mentioned in  [Procedure to deploy scale-out Swift nodes with HP Helion OpenStack](/helion/openstack/ga/services/swift/deployment-scale-out/) to deploy new node.



##Update load balancer with new proxy nodes
 
1. After creation of Proxy node, list the Proxy IPs.

		ringos list-swift-nodes -t proxy

A list of Proxy nodes will be displayed as shown in the sample below:
<br>
<img src="media/swift_node_ha-proxy.png"/>

2.Edit `swift-proxy.cfg` on each of the controller nodes. 

	 /etc/haproxy/manual/swift-proxy.cfg

3.Add the following content in the `swift-proxy.cfg` file.

	  listen scale_swift_proxy
	  bind 192.0.2.21:8080
	  server <Proxy_node_hostname> <IP address of Proxy node>:8080 check inter 2000 rise 2 fall 5 

**Note**:You will have the number of "server" lines equal to number of Swift proxies you have setup.

4.Restart HA proxy service on all these nodes.

	service haproxy restart

Thus the Swift-Proxies are successfully enabled with HA proxy. 

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*