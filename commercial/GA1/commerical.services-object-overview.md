---
layout: default
title: "HP Helion OpenStack&#174; Object Operations Service Overview"
permalink: /helion/openstack/ga/services/object/overview/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/openstack/services/networking/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/orchestration/overview/"> NEXT &#9654</a> </p>-->

# HP Helion OpenStack&#174; Object Storage Service Overview #

<!-- modeled after HP Cloud Networking Getting Started (network.getting.started.md) -->

HP Helion OpenStack&#174; introduces integral, built-in support for [Scale-out Swift](/helion/openstack/ga/services/object/overview/scale-out-swift/) to the cloud.

The HP Helion OpenStack&#174; object storage service includes a Swift cluster as a default element of cloud creation. This cluster is used to store data for internal services but can also be scaled out as necessary to store large amounts of end user data. 

Based on OpenStack&reg; Swift, the HP Helion OpenStack object storage service is designed to provide a safe, secure,  scalable way to store and retrieve large amounts of unstructured data and objects. The storage service is also horizontally scalable as necessary to handle large numbers of simultaneous connections. 

**Node** - a host machine running one or more Swift services
<br>
**Proxy** **node** - node that runs Proxy services; also runs TempAuth<br>
**Storage** **node** - node that runs Account, Container, and Object services<br>
**Ring** - a set of mappings of Swift data to physical devices


- [Provision a node](/helion/openstack/ga/services/swift/provision-nodes/)
- Monitoring
	- [Disk usage](/helion/openstack/ga/services/object/swift/Monitor-disk/)
	- [Replication status](/helion/openstack/ga/services/object/swift/replica-status/)
	- [Service health](/helion/openstack/ga/services/object/swift/health-check/)
- Expand
	- [Extend the Swift cluster](/helion/openstack/ga/services/object/swift/expand-cluster/)
	- [Add New Scale-out Proxy Node](Add New Scale-out Proxy Node)
	- Add disk starter object
	- Add disk scale out object ring
	- Add disk account container
- Scale-out 
	- scale-out swift
	- Deploy scale-out nodes
- Shrink
	- 	Shrink a cluster
	- 	Remove scale out object storage
	- 	Remove a proxy node
	- 	Remove an existing disk
- Diagnose disk health


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
