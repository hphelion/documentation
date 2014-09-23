---
layout: default
title: "HP Helion OpenStack&#174; Object Operations Service Overview"
permalink: /helion/openstack/ga/services/object/overview/scale-out-swift/
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
<p style="font-size: small;"> <a href="/helion/openstack/ga/services/object/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href=" /helion/openstack/ga/services/swift/deployment/"> NEXT &#9654</a> </p>-->


#Swift Scale-out Cluster

HP Helion OpenStack&reg; offers an optional Swift Scale-Out cluster instance of between two and twelve servers that is used for production cloud Object storage use. Scale-Out Swift extends the Starter Swift Cluster, which enables greater capacity while maintaining any initial data present in Starter Swift.

For instructions, see [Configuring HP StoreVirtual VSA for Block Storage](/helion/openstack/ga/install/vsa/).

For deployment, see the [procedure to deploy scale-out Swift]( /helion/openstack/ga/services/swift/deployment/)

<!-- broken link to image
The following diagram depicts the HP Helion scale out architecture.

<img src ="media/swift_deployment-architecture-different-object-without-overcloud-controller-nodes/">

-->
Scale-out Swift clusters are deployed using the concept of storage policy. By default, two Swift nodes are deployed during installation of HP Helion OpenStack to ensure adherence to the "no single point of failure" policy. The Swift cluster is configured as storage-policy:0 for internal purposes as a part of its deployment. The object ring (for example, object-ring:0) associated with the storage-policy is used to store data for internal services like Glance, Sherpa, and so on. 

The scale out object storage defines a new policy, storage-policy:1. Object ring (object-ring:1) associated with storage-policy:1 is used to store data for end cloud user. Once storage-policy:1 is created, it becomes the default storage policy and a new container will use this ring to store objects.

The object storage can be extended as necessary by adding one or more nodes to object-ring:1. You can still continue to use storage-policy:0, if you continue to use the old container to store data.



<!---
Furthermore, HP Helion provides an option for the deployment of scale out Swift. The following diagram depicts a simplified deployment scenario of scale out Swift.

* <a href="javascript:window.open('/content/documentation/media/commercial_kvm_network_architecture.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">with one object ring(opens in a new window)</a>

	<!--This architecture shows the deployment of swift without any object ring. --->
<!---
 
* <a href="javascript:window.open('/content/documentation/media/swift_deployment-architecture-different-object-overcloud-controller-nodes..png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">different object storage ring using Overcloud controller nodes(opens in a new window)</a> 



* <a href="javascript:window.open('/content/documentation/media/swift_deployment-architecture-different-object-without-overcloud-controller-nodes.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">different object storage ring without using <over> cloud controller nodes(opens in a new window)</a>
--->

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*Stack community.*