---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade: Object Storage (Swift) Service Overview"
permalink: /helion/openstack/carrier/services/object/overview/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.0
product-version3: HP Helion OpenStack 1.0.1
product-version4: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Ranjan J, Keshava HP, Sameer V, Jayme P, Binamra S

---
<!--UNDER REVIEW-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/openstack/carrier/services/networking/overview/">&#9664; PREV</a> | <a href="/helion/openstack/carrier/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/carrier/services/orchestration/overview/"> NEXT &#9654</a> </p>-->

# HP Helion OpenStack&#174; Carrier Grade: Object Storage (Swift) Service Overview #

<!-- modeled after HP Cloud Networking Getting Started (network.getting.started.md) -->

HP Helion OpenStack&#174; introduces integral, built-in support for [Scale-out Object Storage (Swift)](/helion/openstack/carrier/services/object/overview/scale-out-swift/) to the cloud.
The HP Helion OpenStack&#174; cloud deployment includes automatic creation of a Swift cluster and starter nodes. It also enables SSL automatically to secure the data transmission.

Based on OpenStack&#174; Swift, the HP Helion OpenStack object storage service provides a highly available, resilient, and scalable storage pool for unstructured data.  

##Architecture Overview
At its core, Object Storage (Swift) is built from a set of software services and data constructs hosted on a cluster of servers. 

<!--
A Swift cluster is software defined storage (SDS) architecture layered on top of industry standard servers using standard storage drives. -->


A Object Storage (Swift) cluster is Software Defined Storage (SDS) architecture, layered on top of industry standard servers, using native storage devices which are typically disk drives. 

**Note**: It is not recommended to run Swift on top of other systems (hardware or software) that hide the failure domains or native storage devices like using RAID group on top of drives.

The services in the Swift cluster are either ***access*** services or ***storage*** services.

- The *access* services group is made up of the Swift Proxy Servers, which run Swift-Proxy, Account and Container Services, HTTP/HTTPS load balancers, and OpenStack Keystone authentication service.
- The *storage* services group is composed of Swift Object Servers and various background services such as replicators.  
 
Each service group can be scaled ***independently*** to meet workload and redundancy requirements. The storage service can be scaled up as necessary ([scale-out Swift](/helion/openstack/carrier/services/object/overview/scale-out-swift/)). It can also be horizontally scalable to handle an increased number of simultaneous connections as well as large number of objects. 

##Expanding the Object Storage (Swift) Deployment

Note that the initial installation of Helion OpenStack cloud includes the creation and configuration of a basic two-node Starter All-in-one Swift deployment. Any additional rings, nodes or servers are expansions of this basic installation.

For more information and in-depth diagrams, see [About Scale-Out Object Storage (Swift)](/helion/openstack/carrier/services/object/overview/scale-out-swift/).

1. Deploy Object Storage (Swift) starter nodes<br />*(completed as part of the HP Helion OpenStack cloud deployment)*
3. Scale up or expand 
	- [Deploy New Object Storage (Swift)](/helion/openstack/carrier/services/swift/deployment-scale-out/)
	-  [Add New Storage Servers](/helion/openstack/carrier/services/swift/provision-nodes)
	-  [Extend a Object Storage (Swift) Cluster](/helion/openstack/carrier/services/object/swift/expand-cluster/)
	-  [Add a New Scale-out Object Node](/helion/openstack/carrier/services/swift/deployment/add-disk-object-node/)
	-  [Add a New Scale-out Proxy Node](/helion/openstack/carrier/services/swift/deployment/add-proxy-node/)
	-  [Add a Disk to a Scale-out Object Ring](/helion/openstack/carrier/services/swift/deployment/add-disk-scale-out/)
	-  [Add a Disk to an Account and Container Ring](/helion/openstack/carrier/services/swift/deployment/add-disk-account-container/)
	-  [Add a Disk to the Starter Object Ring](/helion/openstack/carrier/services/swift/deployment/add-disk-starter/)
5. Shrink or scale down
	- [Remove a disk from an Object Node](/helion/openstack/carrier/services/swift/deployment/remove-existing-disk/)
	- [Remove a Proxy Node](/helion/openstack/carrier/services/swift/deployment/remove-proxy-node/)
	- [Removing a scale-out Object Storage Node](/helion/openstack/carrier/services/swift/deployment/remove-scale-out-object-node/)
6. Monitor

 * [Monitor Disk Usage]( /helion/openstack/carrier/services/object/swift/Monitor-disk/)
 * [Replication Status using Icinga](/helion/openstack/carrier/services/object/swift/replica-status/)
 * [Service Health Check](/helion/openstack/carrier/services/object/swift/health-check/)
 * [Check Health Services](/helion/openstack/carrier/services/object/swift/health-swift-services/)
 * [Object Storage (Swift) Proxy Health Check]( /helion/openstack/carrier/services/object/swift/monitor-swift-proxy-health-checks/)
 * [Network Interface Card](/helion/openstack/carrier/services/object/swift/monitor-speed-of-NIC/)
 * [Mount Points](/helion/openstack/carrier/services/object/swift/mount-points/)
 * [Disk Drives](/helion/openstack/carrier/services/object/swift/disk-drive/)
 * [Network Access (Ping)](/helion/openstack/carrier/services/object/swift/monitor-network-access-ping/)
 * [Drive Audit]( /helion/openstack/carrier/services/object/swift/monitor-swift-drive-audit/)
 * [File Ownership](/helion/openstack/carrier/services/object/swift/file-ownership/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
