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
<p style="font-size: small;"> <a href="/helion/openstack/ga/services/object/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/ga/services/swift/deployment-scale-out/"> NEXT &#9654</a> </p>
-->

#HP Helion OpenStack&reg; Scale-out Swift

<!---
HP Helion OpenStack&reg; offers  an optional Swift scale-out cluster instance of between two and twelve servers that is used for production cloud Object storage use. Scale-Out Swift extends the Starter Swift Cluster, which enables greater capacity while maintaining any initial data present in Starter Swift. --->



When the HP Helion OpenStack&reg; is deployed two swift nodes are installed by default. They are termed as starter nodes. These two nodes are configured as storage-policy:0 for internal purposes as part of deployment. The object ring associated with the storage-policy:0 is used to store data for internal services like Glance, Sherpa, and so on. 

The scale-out object storage is realized by defining a new storage policy – storage-policy:1. Object-1 ring is associated with storage-policy:1. This ring is used to store end user data. Once the storage-policy:1 is created,  it is the default policy and all of the containers would be on this policy unless otherwise specified.


You can expand the object storage by adding one or more nodes to object-ring:1. But you can still continue to use storage-policy:0, if you continue to use the old container to store data.

HP Helion OpenStack Swift ships a tool set- ringos which helps to create scale-out Swift. For more details, see [ringos]( /helion/openstack/GA1/services/object/pyringos/) manual.


##Scale-out Swift architecture 

The following diagram depicts the HP Helion OpenStack scale-out Swift architecture.

<a href="javascript:window.open('/content/documentation/media/swift_deployment-architecture-different-object-without-overcloud-controller-nodes.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack Scale-out (opens in a new window)</a>



##Swift Cluster Lifecycle

Swift cluster is like a data center which can be big or small based on size of cluster. It needs constant human intervention to figure out the current health and perform appropriate action.You will need to do different actions at different point in time for various reasons. For example you may like to replace failed node, you may like to increase cluster capacity as client needs more storage space, you may want to add more proxy nodes as workload needs more throughput. Most of the time, you need to keep a constant eye on cluster. The below table lists the actions that you will be doing throughout life of Swift cluster along with section which you should refer for detailed operation.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th><center>Life-cycle event<center></th>
	<th><center>Reference</center></th>
    </tr>
<tr style="background-color: white; color: black;">
	<td>Deploying Starter Swift</td>
	<td>Please see HP Helion OpenStack documentation</td>
   </tr>
<tr style="background-color: white; color: black;">
	<td>Provision Swift Node(s) </td>
	<td>Please refer <a href="/helion/openstack/ga/services/swift/provision-nodes/">Provision Swift Nodes</a></td> 
</td>
   </tr>
<tr style="background-color: white; color: black;">
	<td>Deploy Scale-out Swift</td>
	<td>Please see <a href=" /helion/openstack/ga/services/swift/deployment-scale-out/">Deploying scale-out Swift</a></td>
    </tr>
<tr style="background-color: white; color: black;">
	<td>Extend Swift Cluster</td>
	<td>Please refer<a href="/helion/openstack/ga/services/object/swift/expand-cluster/">Expand Swift Cluster</a></td>
    </tr>
<tr style="background-color: white; color: black;">
	<td>Shrink Swift cluster</td>
	<td>Please refer <a href="/helion/openstack/ga/services/object/swift/shrink-cluster/">Shrink Swift Cluster</a></td>
    </tr>
<tr style="background-color: white; color: black;">
	<td>Monitor Swift cluster</td>
	<td>Please refer <a href="/helion/openstack/ga/services/object/swift/Monitor-cluster/">Monitor Swift Cluster</a></td>
    </tr>
<tr style="background-color: white; color: black;">
	<td>Maintain Swift cluster</td>
	<td></a></td>
    </tr>
</table>

Above event is depicted below in life-cycle diagram:

<a href="javascript:window.open('/content/documentation/media/swift-cluster-lifecycle.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Swift cluster lifecycle.(opens in a new window) </a> 



<!---
##Scale-out Swift deployment

For deploying scale-out Swift refer the following sections:


* [Provision Swift Node(s)]( /helion/openstack/ga/services/swift/provision-nodes/)
* [Deploy Scale-out Swift]( /helion/openstack/ga/services/swift/deployment-scale-out/)
* [Expand Swift Cluster]( /helion/openstack/ga/services/object/swift/expand-cluster/)
* [Monitor Swift Cluster]( /helion/openstack/ga/services/object/swift/Monitor-cluster/)
* [Shrink Swift Cluster]( /helion/openstack/ga/services/object/swift/shrink-cluster/)

--->







<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*Stack community.*
