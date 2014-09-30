---
layout: default
title: "HP Helion OpenStack&#174; Orchestration High Availability Service Overview"
permalink: /helion/openstack/ga/high-availability/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!---<p style="font-size: small;"> <a href="/helion/openstack/services/object/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/reporting/overview/"> NEXT &#9654</a> </p>-->

# HP Helion OpenStack&#174; High Availability(HA)

This page covers the following topics:

*  [High Availability( HA) concepts overview](#concepts-overview) 
	*  [Scope of High Availability: Protection against Single Points of Failure(SPOF)](#scope-ha)
*  [Highly Available cloud services](#ha-helion)
	*  [High Availability of Overcloud Controllers](#ha-overcloud)
		* [API Request Message Flow](#api-msg-flow)
		* [Handling Node Failure](#handling-node-failure)
		* [Handling Network Partitions](#handling-network-partition)
			* [MySQL Galera Cluster](#mysql-galera)
	* [Singleton Services on Management Controller](#singleton-services)
		* [Cinder Volume](#cinder-volume)
		* [Sherpa](#sherpa) 
		* [nova-consoleauth](#nova-console-auth) 
	* [Rebuilding or Replacing failed Controller Nodes](#replace-rebuild)
* [Highly Available Cloud Infrastructure](#ha-cloud-infra)
	* [Availability Zones](#availability-zones)
	* [Compute with KVM](#compute-with-kvm)
		*  [Nova availability zones](#nova-availability-zones)
	* [Compute with ESX](#compute-with-esx)
	* [Block Storage with StoreVirtual VSA](#block-storage)
	* [Block Storage with 3PAR StoreServ](#block-storeserv)
	* [Object Storage with Swift](#object-storage)
	* [Networking](#networking)
* [Highly Available Cloud Applications and Workloads](#ha-workloads)

##High Availability concepts overview<a name="concept-overview"></a>

Cloud Administrators of Highly Available Cloud Services ensure that resources are always available on request to enable uninterrupted operations. The projects are able to provision and manage the Compute, Storage, Network infrastructure resources i.e. Nova Compute VMs, Cinder Volumes, Neutron Networks, etc. at any given point in time.This means that the Horizon Dashboard, and various OpenStack APIs for Nova, Cinder, Neutron, Swift, etc. must be reachable and be able to fulfill user requests. This is called **Highly Available Cloud Services**.

<a href="javascript:window.open('/content/documentation/media/Ha-resilient-cloud-infrastructure.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Resilient Cloud Infrastructure (opens in a new window)</a> 


The resource (Compute, Storage, Network) reliability in a particular cloud can be    assessed in the following way: 

* If the Nova-Compute KVM Hypervisors/Servers hosting the Project compute Virtual Machine(VM) dies and the compute VM is lost along with its local ephemeral storage, the re-launching of the dead compute VM succeed as it launches on another Nova-Compute KVM Hypervisor/Server.

	* If ephemeral storage loss is undesirable, the Compute VM can be booted from Cinder Volume.

* Data stored in Cinder Volumes is always available for I/O access and volumes are never lost by the Service Provider.

* Data stored in Swift is always available and is never lost by the Cloud Service Provider.

* Network resources like Routers, Subnets, Floating IP addresses provisioned by Neutron are never lost by the Cloud Service Provider and continue to provide Network path to the Project Compute VMs. 

The infrastructure that provides these features is called a **Highly Available Cloud Infrastructure**.

HP Helion OpenStack Nova-Compute KVM Hypervisors do not support transparent HA to Project Applications – onus is on the Project Application Provider to deploy their Applications in a redundant and highly available manner, using multiple VMs spread appropriately across Availability Zones, routed through the  Load Balancers and made highly available through Clustering. These are known as **Highly Available Cloud Aware Tenant Workloads**.

### Scope of High Availability: Protection against Single Points of Failure(SPOF){#scope-ha}

In order to make the High Availability of Services, Infrastructure and Workloads; a contained, well defined, addressable problem; we define the scope of HA to be limited to protecting these only against Single Points of Failure.

The Single Points Of Failure (SPOF) include:

1. **Hardware SPOFs**: Servers can fail, memory goes bad, power connection fails, hypervisor crashes, Hard disks die, NIC cards die, switch ports fail, network cables loosen, etc.

2. **Software SPOFs**: Server processes can crash due to software defect, out of memory condition, Operating System kernel panic, etc.

By design, HP Helion OpenStack&#174; strives to create a system architecture resilient to SPOFs, and does not attempt to automatically protect the system against multiple cascading levels of failures; such cascading failures will result in an unpredictable state.

Hence, the Cloud Operator is encouraged to recover and restore any failed component, as soon as the first level of failure occurs.

## Highly Available cloud services<a name="ha-helion"></a>

The HP Helion OpenStack installer deploys highly available configurations of OpenStack Cloud Services, resilient against Single Points of Failure (SPOF).

###High Availability of Overcloud Controllers

The High Availability of the Overcloud Controller components comes in two main forms.

1. Many services are stateless and multiple instances are run across the control plane in Active-Active mode. The API services (nova-api, cinder-api, etc.) are accessed through the HA proxy load-balancer whereas the internal services (nova-scheduler, cinder-scheduler, etc.), are accessed through the message broker. These services use the database cluster to persist any data. 

	**Note:** The HA proxy load-balancer is also run in Active-Active mode and keepalived (used for Virtual IP (VIP) Management) is run in Active-Active mode, with only one keepalived instance holding the VIP at any one point in time.

2.	HA of the message queue service and the database service is achieved by running these in a clustered mode across the three nodes of the Overcloud control plane: RabbitMQ cluster with Mirrored Queues and Percona MySQL Galera cluster.

    <a href="javascript:window.open('/content/documentation/media/ha-architecture.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HA Architecture (opens in a new window)</a>

The above diagram  illustrates the HA architecture with the focus on VIP management and load-balancing. It only shows a subset of active-active API instances and does not show examples of other services such as nova-scheduler, cinder-scheduler, etc.  

In the above diagram, requests from an OpenStack client to the Overcloud API services are sent to VIP and port combination,for example 192.0.2.26:8774 for a nova request. The load-balancer listens for requests on that VIP and port. When it receives a request, it selects one of the controller nodes configured for handling nova requests, in this particular case, and then forwards the request to the IP of the selected controller node on the same port. 

The nova-api service list, which is listening for requests on the IP of its host machine, then receives the request and deals with it accordingly. The database service is also accessed through the load-balancer <!---(TODO: Section discussing database lockup issue with concurrent writes – this could require HA proxy always selecting a single node for access or just for writes, if possible)-->. RabbitMQ on the other hand is not currently accessed through VIP/HA proxy as the clients are configured with the set of nodes in the RabbitMQ cluster and failover between cluster nodes is automatically handled by the clients.

The sections below cover the following topics in detail:

* [API Request Message Flow](#api-msg-flow)
* [Handling Node Failure](#handling-node-failure)
* [Handling Network Partitions](#handling-network-partition)
* [MySQL Galera Cluster](#mysql-galera)
  
#### API Request Message Flow  

The diagram below shows the flow for an API request in an Overcloud HA deployment. All API requests (internal and external) are sent through the VIP. 

<a href="javascript:window.open('/content/documentation/media/Ha-api-request-flow.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HA API Message Flow(opens in a new window)</a>


The flow of a sample API request is explained below:

1.	keepalived has currently configured the VIP on the Controller0 node; client sends nova request to VIP:8774

2.	HA proxy (listening on VIP:8774) receives the request and selects Controller0 from the list of available nodes (Controller0, Controller1). The request is forwarded to the Controller0IP:8774

3.	nova-api on Controller0 receives the request and determines that a database change is required. It connects to database using VIP:3306.

4.	HA proxy (listening on VIP:3306) receives the database connection request and selects Controller1 from the list of available ndoes (Controller0, Controller1, mgmt-controller). The connection request is forwarded to Controller1IP:3306


#### Handling Node Failure

With the above Overcloud HA setup, loss of a controller node is handled as follows:

Assume that the Controller0, which is currently in control of the VIP, is lost, as shown in the diagram below:

<a href="javascript:window.open('/content/documentation/media/ha-nodefailure-1.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Node Failure- Fig 1(opens in a new window)</a>


When this occurs, keepalived immediately moves the VIP on to the Controller1 and can now receive API requests, which is load-balanced by HA proxy, as stated earlier. 

**Note:** Although MySQL and RabbitMQ clusters have lost a node, but they still continue to be operational:

<a href="javascript:window.open('/content/documentation/media/ha-nodefailure-2.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Node Failure- Fig 2(opens in a new window)</a>

Finally, when the Controller0 comes back online, keepalived and HA proxy will resume in standby/slave mode and be ready to take over, should there be a failure of Controller1. The Controller0 rejoins the MySQL and RabbitMQ clusters as shown in the figure below:

<a href="javascript:window.open('/content/documentation/media/ha-nodefailure-3.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Node Failure- Fig 3(opens in a new window)</a>


####Handling Network Partitions

It is important for the Overcloud HA setup to tolerate network failures, specifically those that result in a partition of the cluster, whereby one of the three nodes in the Overcloud Control Plane cannot communicate with the remaining two nodes of the cluster. The description of network partition handling is separated into the main HA components of the Overcloud...**sentence seems to be incomplete. Please validate** ?? 

#####MySQL Galera Cluster<a name="mysql-galera"></a>
The handling of network partitions is illustrated in the diagram below. Galera has a quorum mechanism so when there is partition in the cluster, the primary or quorate partition can continue to operate as normal, whereas the non-primary/minority partition cannot commit any requests. In the example below, Controller0 is partitioned from the rest of the Control Plane. As a result, requests can only be satisfied on Controller1 or Management Controller. Controller0 will continue to attempt to rejoin the cluster:

<a href="javascript:window.open('/content/documentation/media/mysql-galera-cluster.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">MySQL Galera Cluster Diagram(opens in a new window)</a>

When HA proxy detects the errors against the mysql instance on Controller0, it removes that node from its pool for future database requests.

###Singleton Services on Management Controller <a name="singleton-services"></a>

The following three services run as singletons in the Control Plane for the current release 

* [Cinder Volume](#cinder-volume)
* [Sherpa](#sherpa) 
* [nova-consoleauth](#nova-console-auth) 
 
The above services are deployed and activated on the third Controller called **Management Controller**. Automated failover for these singleton services is not provided and in the event of irrecoverable failure of the Management Controller server, you must resort to de-commissioning the failed server from the Control Plane and deploying the Management Controller on a new server using instructions provided in the [Backup and Restore](/helion/openstack/ga/backup.restore/) document. 

####Cinder-Volume<a name="cinder-volume"></a>

Due to single threading required in cinder-volume and the drivers, the cinder-volume service is run as a singleton in the Control plane.


<a href="javascript:window.open('/content/documentation/media/ha-cinder-volume.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Cinder Volume Diagram(opens in a new window)</a>

Cinder-volume is deployed on all three Controller nodes, but kept active on only one node at a time. By default, cinder-volume is kept active on the OverCloud Management-Controller. If the Management Controller fails, you must enable and start cinder-volume service on one of the other Overcloud Controller nodes, until it is restored. Once Management Controller is restored, you must shut down the cinder-volume service from all other nodes and start it on the Management Controller to ensure it runs as a singleton. 
Since cinder.conf is kept synchronized across all the 3 nodes, cinder volume can be run on any of the nodes at any given time. Ensure that it is run on only one node at any given time.

**Steps to start Cinder-Volume**

	os-svc-enable-upstart cinder-volume enable
	
	service cinder-volume start

**Steps to stop Cinder-Volume**

	service cinder-volume stop
	
	os-svc-enable-upstart cinder-volume disable



####Sherpa<a name="sherpa"></a>

You must take periodic backups of the Sherpa service since it does maintain some state information on local disk storage on the Management Controller. 
If the Management Controller fails, Sherpa becomes unavailable until you rebuild or restore the Management Controller. After restoring the Management Controller, you should restore the Sherpa state from its latest backup.

####Nova console-auth<a name="nova-console-auth"></a>

If the Management Controller fails, the nova console-auth service will become unavailable and users will not be able to connect to their VM consoles via VNC. The service will be restored once you restore the Management Controller.

###Rebuilding or Replacing failed Controller Nodes {#replace-rebuild}

As described above, the three node Controller cluster provides a robust, highly available Control Plane of OpenStack Services. 
Any one of the Controller Servers can be shut down for a short duration maintenance activities without impacting Cloud Service availability. 

**Note**: The HA design is only robust against Single Points of Failures and may not protect you against multiple levels of failure. As soon as first level failure occurs, you must try and fix the symptom/root cause and recover from the failure, as soon as possible.

In the unlikely event that one of the Controller Servers suffers an irreparable hardware failure, you can decommission and delete it from the cluster. You can then deploy the failed Controller on a new Server and connect it back into the original three node Controller Cluster. <--Learn more about replacing/rebuilding Controller nodes here [link to documentation on replacing/rebuilding Controller nodes]**IS THIS THE SAME DOCUMENT AS BACKUP AND RESTORE** ?? -->

##Highly Available Cloud Infrastructure

The highly available cloud infrastructure consists of the following:

* [Availability Zones](#availability-zones)
* [Compute with KVM](#compute-with-kvm)
*  [Nova availability zones](#nova-availability-zones)
* [Compute with ESX](#compute-with-esx)
* [Block Storage with StoreVirtual VSA](#block-storage)
* [Block Storage with 3PAR StoreServ](#block-storeserv)
* [Object Storage with Swift](#object-storage)
* [Networking](#networking)

###Availability Zones<a name="availability-zones"></a>

<a href="javascript:window.open('/content/documentation/media/ha-availability-zone.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Availability Zones (opens in a new window)</a>

While planning your OpenStack deployment, you should decide on how to Zone various types of Nodes – like Compute, Block Storage, and Object Storage. For example, you may decide to place all Servers in the same rack in the same zone. For larger deployments, you may plan more elaborate redundancy schemes for redundant power, Network ISP connection, and even physical fire walling between Zones (*this aspect is outside the scope of this document*).

OpenStack offers APIs, CLIs and Horizon UIs for the Administrator to define and user to consume, Availability Zones for each of Nova, Cinder and Swift Services. This section outlines the process to deploy specific types of nodes to specific physical servers, and makes a statement of available support for these types of Availability Zones in the current release. 

### Compute with KVM<a name="compute-with-kvm"></a>

You can deploy your KVM Nova-Compute Nodes either during initial installation, or by adding compute nodes post initial installation. 

While adding Compute Nodes post initial installation, you can specify the target physical servers for deploying the Compute Nodes.

Learn more about adding Compute Nodes after initial installation here [provide link to Operational Procedures to Scale-Out Compute Nodes here**LINK TO BE PROVIDED HERE** 

####Nova Availability Zones<a name="nova-availability-zone"></a>

Nova Host Aggregates and Availability Zones are not supported for general consumption in the current release. 

However, Nova Availability Zones will be supported for the narrow use for the Helion Platform Services deployed on HP Helion OpenStack&#174;. Please refer to the Platform Service documentation for further information.


###Compute with ESX Hypervisor<a name="compute-with-esx"></a>

Compute Nodes deployed on ESX Hypervisor can be made Highly Available using the HA feature of VMware ESX Clusters. For more information on VMware HA, please refer to your VMware ESX documentation.


###Block Storage with StoreVirtual VSA<a name="block-storage"></a>

Highly available Cinder Block Storage Volumes are provided by the Network RAID 10 implementation in the HP StoreVirtual VSA software. You can deploy the VSA Nodes in three node cluster and specify Network RAID 10 protection for Cinder Volumes.

The underlying SAN/iQ Operating System of the StoreVirtual VSA ensures that the two-way replication maintains two mirrored copies of data for each volume. 

This Network RAID 10 capability ensures that failure of any single Server does not cause data loss, and maintains data access to the clients.

Furthermore, each of the VSA Nodes of the cluster can be strategically deployed in different Zones of your data center for maximum redundancy and resiliency.
For more information on how to deploy VSA Nodes on desired target Servers,refer to the[ Deploy VSA](/helion/openstack/ga/install/vsa/) document. 


<a href="javascript:window.open('/content/documentation/media/ha-block-storage.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HA Block Storage (opens in a new window)</a>


###Block Storage with 3PAR StoreServ<a name="block-storeserv"></a>

The 3PAR StoreServ device family has several layers of redundancy built-in through its hardware architecture. For more information, refer to the 3PAR StoreServ documentation.

You will typically connect the 3PAR StoreServ devices to the Compute Servers using two redundant SAN fabrics. The Cinder 3PAR Driver supports multipath connectivity between the Compute Servers and the 3PAR devices, ensuring that the data I/O path remains available in the event of any single point of failure in the hardware path spanning – Server HBA, Port, Switches, and the ports of the 3PAR devices.

###Cinder Availability Zones

Cinder Availability Zones are not supported for general consumption in the current release.

### Object Storage with Swift<a name="object-storage"></a>

You can configure your Swift Rings by specifying a target Zone for each drive that is added to the ring. Learn more about configuring Zone for various drives using the pyringos tool here. Please refer to the [ringos](/helion/openstack/GA1/services/object/pyringos/) document.

<a href="javascript:window.open('/content/documentation/media/ha-swift.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HA Swift  (opens in a new window)</a>

<!--
### Neutron Networking<a name="networking"></a>
 **-TBD_** -->

##Highly Available Cloud Applications and Workloads <a name="ha-workloads"></a>
Projects writing applications to be deployed in the Cloud must be aware of the Cloud architecture and potential points of failure and architect their applications accordingly for High Availability.

Some of guidelines for consideration:

1.	Assume intermittent failures and plan for retries 

    * **OpenStack Service APIs**: invocations can fail &#45; you should carefully evaluate the response of each invocation, and retry in case of failures.
    
	* **Compute**: VMs can die &#45; monitor and restart them

	* **Network**: Network calls can fail &#45; retry should successful

	* **Storage**: Storage connection can hiccup &#45; retry should successful

2.	Build redundancy into your Application tiers

   	* Servers running your VM instances can die 

      *	Replicate VMs containing Stateless Services such as Web Application Tier or Web Service API tier and put them behind Load Balancers (you must implement your own HA Proxy type Load Balancer in your Application VMs until Helion OpenStack delivers the LBaaS service)
  
      *	 Boot the replicated VMs into different Nova Availability Zones 

	  *	If your VM stores state information on its local disk (Ephemeral Storage), and you cannot afford to lose it, then boot the VM off a Cinder Volume.
 
      *	Take periodic snapshots of the VM which will back it up to Swift through Glance.

  	* Your Data can get corrupted

      * Take regular snapshots of Cinder Volumes and also backup Cinder Volumes or your data exports into Swift

3. Instead of rolling your own highly available stateful services, use readily available Helion OpenStack Platform Services such as:

	*	Database as a Service (DBaaS)
	*	DNS as a Service(DNSaaS)
	*	Messaging as a Service (MSGaaS)

## More information ##

[OpenStack High-availability Guide](http://docs.openstack.org/high-availability-guide/content/ch-intro.html)

<!-- http://www.ibm.com/developerworks/cloud/library/cl-cloudappdevelop/ **pretty sure we can't link HP's website to IBM's** -->

[12-Factor Apps](http://12factor.net/)

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*