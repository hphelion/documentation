---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): High Availability(HA)"
permalink: /helion/openstack/carrier/high-availability/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.0
product-version3: HP Helion OpenStack 1.0.1
product-version4: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Sameer V, Vandana S
---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--<p style="font-size: small;"> <a href="/helion/openstack/carrier/services/object/overview/">&#9664; PREV</a> | <a href="/helion/openstack/carrier/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/carrier/services/reporting/overview/"> NEXT &#9654</a> </p>-->

# HP Helion OpenStack&#174; Carrier Grade (Alpha): High Availability(HA)

This page covers the following topics:

*  [High Availability( HA) concepts overview](#concepts-overview) 
    * [Scope of High Availability: Protection against Single Points of Failure (SPOF)](#scope-ha)
*  [Highly Available cloud services](#ha-helion)
    * [High Availability of Overcloud Controllers](#ha-overcloud-controller)
        * [API Request Message Flow](#api-msg-flow)
        * [Handling Node Failure](#handling-node-failure)
        * [Handling Network Partitions](#handling-network-partition)
            * [MySQL Galera Cluster](#mysql-galera)
    * [Singleton Services](#singleton-services)
        * [Cinder Volume](#cinder-volume)
        * [Sherpa](#sherpa) 
        * [nova-consoleauth](#nova-console-auth) 
    * [Rebuilding or Replacing Failed Controller Nodes](#replace-rebuild)
* [Highly Available Cloud Infrastructure](#ha-cloud-infra)
    * [Availability Zones](#availability-zones)
    * [Compute with KVM](#compute-with-kvm)
        *  [Nova availability zones](#nova-availability-zones)
    * [Compute with ESX](#compute-with-esx)
    * [Block Storage with StoreVirtual VSA](#block-storage)
    * [Block Storage with 3PAR StoreServ](#block-storeserv)
    * [Object Storage with Swift](#object-storage)
    * [Cinder Availability Zones](#cinder-avail)
* [Highly Available Cloud Applications and Workloads](#ha-workloads)
* [What is not Highly Available?](#not-ha)
* [More information](#more-info)

##High Availability Concepts Overview {#concepts-overview}

Highly Available Cloud Services ensures that at least a minimum of cloud resources are always available on request, which results in uninterrupted operations for users. 

Cloud users are able to provision and manage the compute, storage, and network infrastructure resources at any given point in time and the Horizon Dashboard and the OpenStack APIs must be reachable and be able to fulfill user requests. 

<a href="javascript:window.open('/content/documentation/media/Ha-resilient-cloud-infrastructure.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Resilient Cloud Infrastructure (opens in a new window)</a> 


Once the Compute, Storage, and Network resources are deployed, users expect these resources to be reliable in the following ways:  

* If the Nova-Compute KVM Hypervisors/servers hosting the project compute virtual machine(VM) dies and the compute VM is lost along with its local ephemeral storage, the re-launching of the dead compute VM succeeds because it launches on another Nova-Compute KVM Hypervisor/server.

* If ephemeral storage loss is undesirable, the compute VM can be booted from the Cinder volume.

* Data stored in Block Storage service volumes is always available and volumes are rarely lost by the service provider.

* Data stored by the Object service is always available and is rarely lost by the cloud service provider.

* Network resources such as routers, subnets, and floating IP addresses provisioned by the Networking Operation service are rarely lost by the cloud service provider and will continue to provide a network path to the Compute VMs. 

The infrastructure that provides these features is called a **Highly Available Cloud Infrastructure**.

### Highly Available Cloud-Aware Tenant Workloads ###

HP Helion OpenStack Compute hypervisors do not support transparent high availability for user applications; as such, the project application provider is responsible for deploying their applications in a redundant and highly available manner, using multiple VMs spread appropriately across availability zones, routed through the load balancers and made highly available through clustering. 

These are known as **Highly Available Cloud-Aware Tenant Workloads**.

### Scope of High Availability: Protection against Single Points of Failure(SPOF) {#scope-ha}

In order to achieve this high availability of services, infrastructure and workloads, we define the scope of HA to be limited to protecting these only against single points of failure (SPOF).

Single points of failure include:

1. **Hardware SPOFs**: Hardware failures can take the form of servers failing, memory going bad, power failing, hypervisors crashing, hard disks dying, NIC cards breaking, switch ports failing, network cables loosening, and so forth.

2. **Software SPOFs**: Server processes can crash due to software defects, out-of-memory conditions, operating system kernel panic, and so forth.

By design, HP Helion OpenStack strives to create a system architecture resilient to SPOFs, and does not attempt to automatically protect the system against multiple cascading levels of failures; such cascading failures will result in an unpredictable state.

Hence, the cloud operator is encouraged to recover and restore any failed component, as soon as the first level of failure occurs.

## Highly Available cloud services {#ha-helion}

The HP Helion OpenStack installer deploys highly available configurations of OpenStack cloud services, resilient against single points of failure.

###High Availability of Overcloud Controllers {#ha-overcloud-controller}

The high availability of the overcloud controller components comes in two main forms.

1. Many services are stateless and multiple instances are run across the control plane in active-active mode. The API services (nova-api, cinder-api, etc.) are accessed through the HA proxy load balancer whereas the internal services (nova-scheduler, cinder-scheduler, etc.), are accessed through the message broker. These services use the database cluster to persist any data. 

    **Note:** The HA proxy load balancer is also run in active-active mode and keepalived (used for Virtual IP (VIP) Management) is run in active-active mode, with only one keepalived instance holding the VIP at any one point in time.

2.    HA of the message queue service and the database service is achieved by running these in a clustered mode across the three nodes of the overcloud control plane: RabbitMQ cluster with Mirrored Queues and Percona MySQL Galera cluster.

    <a href="javascript:window.open('/content/documentation/media/ha-architecture.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HA Architecture (opens in a new window)</a>

The above diagram  illustrates the HA architecture with the focus on VIP management and load balancing. It only shows a subset of active-active API instances and does not show examples of other services such as nova-scheduler, cinder-scheduler, etc.  

In the above diagram, requests from an OpenStack client to the overcloud API services are sent to VIP and port combination; for example, 192.0.2.26:8774 for a Nova request. The load balancer listens for requests on that VIP and port. When it receives a request, it selects one of the controller nodes configured for handling Nova requests, in this particular case, and then forwards the request to the IP of the selected controller node on the same port. 

The nova-api service list, which is listening for requests on the IP of its host machine, then receives the request and deals with it accordingly. The database service is also accessed through the load balancer <!---(TODO: Section discussing database lockup issue with concurrent writes - this could require HA proxy always selecting a single node for access or just for writes, if possible)-->. RabbitMQ, on the other hand, is not currently accessed through VIP/HA proxy as the clients are configured with the set of nodes in the RabbitMQ cluster and failover between cluster nodes is automatically handled by the clients.

The sections below cover the following topics in detail:

* [API Request Message Flow](#api-msg-flow)
* [Handling Node Failure](#handling-node-failure)
* [Handling Network Partitions](#handling-network-partition)
* [MySQL Galera Cluster](#mysql-galera)
  
#### API Request Message Flow {#api-msg-flow} 

The diagram below shows the flow for an API request in an overcloud HA deployment. All API requests (internal and external) are sent through the VIP. 

<a href="javascript:window.open('/content/documentation/media/Ha-api-request-flow.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HA API Message Flow(opens in a new window)</a>


The flow of a sample API request is explained below:

1.    keepalived has currently configured the VIP on the Controller0 node; client sends Nova request to VIP:8774

2.    HA proxy (listening on VIP:8774) receives the request and selects Controller0 from the list of available nodes (Controller0, Controller1, Controller2). The request is forwarded to the Controller0IP:8774

3.    nova-api on Controller0 receives the request and determines that a database change is required. It connects to the database using VIP:
4.    .

4.    HA proxy (listening on VIP:3306) receives the database connection request and selects Controller1 from the list of available nodes (Controller0, Controller1, Controller2). The connection request is forwarded to Controller1IP:3306


#### Handling Node Failure {#handling-node-failure}

With the above overcloud HA set up, loss of a controller node is handled as follows:

Assume that the Controller0, which is currently in control of the VIP, is lost, as shown in the diagram below:

<a href="javascript:window.open('/content/documentation/media/ha-nodefailure-1.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Node Failure- Fig 1(opens in a new window)</a>


When this occurs, keepalived immediately moves the VIP on to the Controller1 and can now receive API requests, which is load-balanced by HA proxy, as stated earlier. 

**Note:** Although MySQL and RabbitMQ clusters have lost a node, they still continue to be operational:

<a href="javascript:window.open('/content/documentation/media/ha-nodefailure-2.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Node Failure- Fig 2(opens in a new window)</a>

Finally, when Controller0 comes back online, keepalived and HA proxy will resume in standby/slave mode and be ready to take over, should there be a failure of Controller1. The Controller0 rejoins the MySQL and RabbitMQ clusters as shown in the figure below:

<a href="javascript:window.open('/content/documentation/media/ha-nodefailure-3.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Node Failure- Fig 3(opens in a new window)</a>


####Handling Network Partitions {#handling-network-partition}

It is important for the overcloud HA setup to tolerate network failures, specifically those that result in a partition of the cluster, whereby one of the three nodes in the overcloud control plane cannot communicate with the remaining two nodes of the cluster. The description of network partition handling is separated into the main HA components of the overcloud.<!---**sentence seems to be incomplete. Please validate** ??-->

#####MySQL Galera Cluster {#mysql-galera}

The handling of network partitions is illustrated in the diagram below. Galera has a quorum mechanism so when there is a partition in the cluster, the primary or quorate partition can continue to operate as normal, whereas the non-primary/minority partition cannot commit any requests. In the example below, Controller0 is partitioned from the rest of the control plane. As a result, requests can only be satisfied on Controller1 or Controller2. Controller0 will continue to attempt to rejoin the cluster:

<a href="javascript:window.open('/content/documentation/media/mysql-galera-cluster.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">MySQL Galera Cluster Diagram(opens in a new window)</a>

When HA proxy detects the errors against the mysql instance on Controller0, it removes that node from its pool for future database requests.

### Singleton Services###
HP Helion OpenStack defines three Controllers:

1. OvercloudController0 
1. OvercloudController1
1. OvercloudController2


####Cinder-Volume {#cinder-volume}

Due to the single threading required in both cinder-volume and the drivers, the Cinder volume service is run as a singleton in the control plane.


<a href="javascript:window.open('/content/documentation/media/ha-cinder-volume.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Cinder Volume Diagram(opens in a new window)</a>

Cinder-volume is deployed on all three controller nodes, but kept active on only one node at a time. By default, cinder-volume is kept active on the overcloud controller. If the controller fails, you must enable and start the cinder-volume service on one of the other overcloud controller nodes, until it is restored. Once the  controller is restored, you must shut down the Cinder volume service from all other nodes and start it on the controller to ensure it runs as a singleton.
 
Since cinder.conf is kept synchronized across all the 3 nodes, Cinder volume can be run on any of the nodes at any given time. Ensure that it is run on only one node at a time.

**Steps to start Cinder-Volume**

    os-svc-enable-upstart cinder-volume enable
    
    service cinder-volume start

**Steps to stop Cinder-Volume**

    service cinder-volume stop
    
    os-svc-enable-upstart cinder-volume disable



####Sherpa {#sherpa}

You must take periodic backups of the Sherpa service since it does maintain some state information on local disk storage on the controller. 
If the controller fails, Sherpa becomes unavailable until you rebuild or restore the controller. After restoring the controller, you should restore the Sherpa state from its latest backup.

####Nova consoleauth {#nova-consoleauth}

If the controller fails, the Nova consoleauth service will become unavailable and users will not be able to connect to their VM consoles via VNC. The service will be restored once you restore the  controller.

###Rebuilding or Replacing failed Controller Nodes {#replace-rebuild}

As described above, the three node controller cluster provides a robust, highly available control plane of OpenStack services. 
Either OvercloudController1 or OvercloudController2 servers can be shut down for a short duration for maintenance activities without impacting cloud service availability. (OvercloudController0 cannot be shut down without affecting cloud service availability.)

**Note**: The HA design is only robust against single points of failure and may not protect you against multiple levels of failure. As soon as first-level failure occurs, you must try to fix the symptom/root cause and recover from the failure, as soon as possible.

In the unlikely event that one of the controller servers suffers an irreparable hardware failure, you can decommission and delete it from the cluster. You can then deploy the failed controller on a new server and connect it back into the original three node controller cluster. Learn more about [Replacing/Rebuilding Controller Nodes]( /helion/openstack/carrier/removing/failedovercloud/).

##Highly Available Cloud Infrastructure {#ha-cloud-infra}

The highly available cloud infrastructure consists of the following:

* [Availability Zones](#availability-zones)
* [Compute with KVM](#compute-with-kvm)
*  [Nova availability zones](#nova-availability-zones)
* [Compute with ESX](#compute-with-esx)
* [Block Storage with StoreVirtual VSA](#block-storage)
* [Block Storage with 3PAR StoreServ](#block-storeserv)
* [Object Storage with Swift](#object-storage)
* [Networking](#networking)

###Availability Zones {#availability-zones}

<a href="javascript:window.open('/content/documentation/media/ha-availability-zone.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Availability Zones (opens in a new window)</a>

While planning your OpenStack deployment, you should decide on how to zone various types of nodes &#45; such as compute, block storage, and object storage. For example, you may decide to place all servers in the same rack in the same zone. For larger deployments, you may plan more elaborate redundancy schemes for redundant power, network ISP connection, and even physical firewalling between zones (*this aspect is outside the scope of this document*).

HP Helion OpenStack offers APIs, CLIs and Horizon UIs for the administrator to define and user to consume, availability zones for each of Nova, Cinder and Swift services. This section outlines the process to deploy specific types of nodes to specific physical servers, and makes a statement of available support for these types of availability zones in the current release. 

**Note:** By default, HP Helion OpenStack is deployed in a single availability zone upon installation. Multiple availability zones can be configured by an administrator post-install, if required. Refer to the [Chapter 5: Scaling]](http://docs.openstack.org/openstack-ops/content/scaling.html) in the *OpenStack Operations Guide* for more information.

### Compute with KVM {#compute-with-kvm}

You can deploy your KVM Nova-Compute nodes either during initial installation, or by adding compute nodes post initial installation. 

While adding compute nodes post initial installation, you can specify the target physical servers for deploying the compute nodes.

Learn more about [Adding Compute Nodes after Initial Installation](/helion/openstack/carrier/install/add/nodes/).

####Nova Availability Zones {#nova-availability-zone}

Nova host aggregates and availability zones are not supported for general consumption in the current release. 

However, Nova availability zones will be supported for the narrow use of the HP Helion OpenStack Platform Services deployed on HP Helion OpenStack. Please refer to the Platform Service documentation for further information.


###Compute with ESX Hypervisor {#compute-with-esx}

Compute nodes deployed on ESX Hypervisor can be made highly available using the HA feature of VMware ESX Clusters. For more information on VMware HA, please refer to your VMware ESX documentation.


###Block Storage with StoreVirtual VSA {#block-storage}

Highly available Cinder block storage volumes are provided by the network RAID 10 implementation in the HP StoreVirtual VSA software. You can deploy the VSA nodes in three node cluster and specify Network RAID 10 protection for Cinder volumes.

The underlying SAN/iQ operating system of the StoreVirtual VSA ensures that the two-way replication maintains two mirrored copies of data for each volume. 

This Network RAID 10 capability ensures that failure of any single server does not cause data loss, and maintains data access to the clients.

Furthermore, each of the VSA nodes of the cluster can be strategically deployed in different zones of your data center for maximum redundancy and resiliency.
For more information on how to deploy VSA nodes on desired target servers, refer to the[ Deploy VSA](/helion/openstack/carrier/install/vsa/) document. 


<a href="javascript:window.open('/content/documentation/media/ha-block-storage.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HA Block Storage (opens in a new window)</a>


###Block Storage with 3PAR StoreServ {#block-storeserv}

The 3PAR StoreServ device family has several layers of redundancy built in through its hardware architecture. For more information, refer to the 3PAR StoreServ documentation.

You will typically connect the 3PAR StoreServ devices to the compute servers using two redundant SAN fabrics. The Cinder 3PAR driver supports multipath connectivity between the compute servers and the 3PAR devices, ensuring that the data I/O path remains available in the event of any single point of failure in the hardware path spanning &#45; server HBA, port, switches, and the ports of the 3PAR devices.

###Cinder Availability Zones {#cinder-avail}

Cinder availability zones are not supported for general consumption in the current release.

### Object Storage with Swift {#object-storage}

You can configure your Swift Rings by specifying a target zone for each drive that is added to the ring. Learn more about configuring zones for various drives using the Ringos tool here. Please refer to the [Ringos](/helion/openstack/carrier/GA1/services/object/pyringos/) document.

<a href="javascript:window.open('/content/documentation/media/ha-swift.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HA Swift  (opens in a new window)</a>

<!--
### Neutron Networking {#networking}
 
Neutron Netwoking in HA covers the following:

1. Neutron Ser
2. ver (API) and its underlying MySQL and RabbitMQ are HA using HAproxy, Galera and Mirrored queue technologies for clustering.

2. With the advent of DVR, the Neutron L3 agent no longer lives on central controller nodes, but is distributed and runs on each Compute node, such that, if it fails, its impact is only limited to VMs within that compute node. (do you have some pointer we could refer the user for further info on DVR concepts)

3. DHCP agent is still running on central Cloud controllers - should a cloud controller running DHCP services fail, you must manually migrate over all the DHCP services to any of the remaining cloud controller nodes using the procedures outlined and validated (still work in progress) in https://jira.hpcloud.net/browse/CORE-1777. Until the DHCP services are migrated, no new VMs will be able to launch and existing VMs will not be able to renew their DHCP leases upon expiration.

4. SNAT services still run on one of the central Cloud controller - should a cloud controller running SNAT services fail, your VMs will lose SNAT ability and will not be able to reach services on external networks. You can work around this by attaching a floating IP to your VM, which will allow it to reach to external networks without going through the central SNAT. 
 -->

##Highly Available Cloud Applications and Workloads {#ha-workloads}
Projects writing applications to be deployed in the cloud must be aware of the cloud architecture and potential points of failure and architect their applications accordingly for high availability.

Some guidelines for consideration:

1.    Assume intermittent failures and plan for retries 

    * **OpenStack Service APIs**: invocations can fail &#45; you should carefully evaluate the response of each invocation, and retry in case of failures.
    
    * **Compute**: VMs can die &#45; monitor and restart them

    * **Network**: Network calls can fail &#45; retry should be successful

    * **Storage**: Storage connection can hiccup &#45; retry should be successful

2.    Build redundancy into your application tiers

       * Servers running your VM instances can die. 

      *    Replicate VMs containing stateless services such as Web application tier or Web service API tier and put them behind load balancers (you must implement your own HA Proxy type load balancer in your application VMs until HP Helion OpenStack delivers the LBaaS service).
  
      *     Boot the replicated VMs into different Nova availability zones.

      *    If your VM stores state information on its local disk (Ephemeral Storage), and you cannot afford to lose it, then boot the VM off a Cinder volume.
 
      *    Take periodic snapshots of the VM which will back it up to Swift through Glance.

      * Your data on ephemeral may get corrupted (but not your backup data in Swift and not your data on Cinder volumes).

      * Take regular snapshots of Cinder volumes and also back up Cinder volumes or your data exports into Swift.

3. Instead of rolling your own highly available stateful services, use readily available HP Helion OpenStack platform services such as:

    *    Database as a Service (DBaaS)
    *    DNS as a Service(DNSaaS)
    *    Messaging as a Service (MSGaaS)

## What is not Highly Available? {#not-ha}

The following section defines the different services in Seed and Undercloud that are not HA supported:

### Seed {#seed}

All services running on the Seed VM are not highly available and if the Seed VM fails, it has an impact on the Undercloud functionality.


Ensure the following points:

- Ensure a periodic backup of Seed VM. Please refer to the [Backup and Restore](/helion/openstack/carrier/backup.restore/) document for more details.

- In case of Seed VM failure, the Undercloud continues to function. However, if any of the Undercloud nodes crash or is shutdown, it does not boot up as it is dependent on Seed to provide the PXE image.

- In the above case, it is recommended to recover Seed VM by following the documented restore process and bring it up in order for it to serve Undercloud node PXE requests during the restart process.


### Undercloud {#undercloud}

All the services running on Undercloud node are not highly available and if the Undercloud node fails, it impacts the Overcloud functionality. 

Ensure the following points:

- Ensure the periodic backup of Undercloud node. Please refer to the [Backup and Restore](/helion/openstack/carrier/backup.restore/) document for more details.

- In case of Undercloud node failure, the Overcloud continues to function. However, if any of the Overcloud nodes crash or is shutdown, it does not boot up as it is dependent on the Undercloud to provide the PXE image.

- In the above case, it is recommended to recover the Undercloud node by following the documented restore process and bring it up for it to serve Overcloud node PXE requests during the restart process.

###Other

* High availability is not supported for Centralized Virtual Router.
## More information ## {#more-info}

- [OpenStack High-availability Guide](http://docs.openstack.org/high-availability-guide/content/ch-intro.html)

<!-- http://www.ibm.com/developerworks/cloud/library/cl-cloudappdevelop/ **pretty sure we can't link HP's website to IBM's** -->

- [12-Factor Apps](http://12factor.net/)


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
