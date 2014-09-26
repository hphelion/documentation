---
layout: default
title: "HP Helion OpenStack&#174;: Technical Overview"
permalink: /helion/openstack/ga/technical-overview/
product: commercial.ga

---
<!--UNDER REVISION-->

<!---
<p style="font-size: small;"> <a href="/helion/openstack/faq/">&#9664; PREV</a> | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/services/overview/">NEXT &#9654;</a> </p> -->

# HP Helion OpenStack&#174; Technical Overview

Welcome! This page introduces you to HP Helion OpenStack, an enterprise-grade distribution of the OpenStack cloud operating system, brought to you by the HP Helion engineers, who built and operate the HP Public Cloud using OpenStack.


HP Helion OpenStack allows you to easily deploy OpenStack Cloud Services in a secure, highly available configuration, and subsequently deploy, manage and operate your cloud infrastructure in production. 

It is  designed to offer a number of value-added services that complement and enhance OpenStack and set up a cloud. HP OpenStack is enabled to manage KVM and VMWare ESX hypervisors. KVM supports up to 30 physical nodes and 40 VMs per node.


* [HP Helion OpenStack services](#Helion-services)
* [Deployment architecture](#deploy-arch)
	* [KVM environment](#KVM-env)
	* [ESX environment](#esx-env)
	* [Hardware requirement](#hardware-req)
	* [Network Architecture](#networkarch)
* [High availability](#highavailability)
* [Security architecture](#security-architecutre)
* [Installation and configuration](#install-configure)
	* [OpenStack on OpenStack -TripleO](##Deploy)
	*  [Installation option](#install-option) 
*  [Updates and extensions](#updates-and-extensions)
*  [Operational management](#operate-manage)
	* [Centralized Logging](centralized-logging)
	* [Monitoring](#monitoring)
	* [Add, remove and replace nodes](#add-remove-replace-nodes)
	* [Backup and Restore nodes](#backup-restore-nodes)
* [Next Step](#next)

##HP Helion OpenStack Services- Functional Overview<a name="Helion-services"></a>

The following table outlines the functionality of HP Helion OpenStack services based on the type of users - Users and Administrators. For a complete description of these services, see the [Services Overview](/helion/openstack/services/overview/) page.


<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th>Service</th>
	<th><center>Tenants/Users</center></th>
    <th><center>Administrator</center></th>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Compute Operations (Nova)</b></td>
	<td>HP Helion OpenStack Compute supports Nova APIs to instantiate and manage virtual servers on Linux KVM  and VMware ESX hypervisors. <br><br> User can create and manage the life cycle of virtual machines (suspend, resume, snapshot, etc.), attach block storage volumes, work with security groups and key pairs, and associate floating IP addresses. <br><br>
	<a href="/helion/openstack/services/compute/overview/">Learn more</a> about Compute Operations.</td>
    <td> Administrator can also configure server flavors, modify project quotas, configure availability zones, enable and disable services, and work with virtual machines.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Block Storage<br>Volume (Cinder)</b></td>
	<td>HP Helion OpenStack Block Storage supports Cinder APIs to instantiate and manage block storage volumes on HP StoreServ 3PAR devices and StoreVirtual Software Defined Storage. <br><br>User can create volumes, attach them to VMs, and take snapshots and backups.
	<br><br><a href="/helion/openstack/services/volume/overview/">Learn more </a> about Volume Operations.
	</td>
	<td>Administrator can deploy StoreVirtual VSA Software Defined Storage, and configure Cinder drivers for StoreVirtual and StoreServ 3PAR using the Sirius service. <br><br>
	You have the priviledge to create volume types and associate quality of service with volume types, and map StoreServ and StoreVirtual Cinder backends to the volume types.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Object Operations (Swift)</b></td>
	<td>HP Helion OpenStack Swift allows to store and retrieve objects in publicly accessible physical machines. User can configure storage containers, upload and download container files, and delete container files.<br><br>
	
	<td>Administrator can easily start with two auto-configured Swift nodes, and then scale out by deploying additional Swift Proxy and Object Storage nodes. <br><br>The Ringos CLI Utility is provided to format drives and easily manage Swift rings. <br><br>
	<a href=" /helion/openstack/ga/services/object/overview/">Learn more</a> about Swift and Ringos.</td>
 </tr>
<tr style="background-color: white; color: black;">
	<td><b>Network Operations (Neutron)<b></td>
	<td>HP Helion OpenStack Neutron provides network connectivity and IP addressing for virtual machines managed by Nova Compute.<br><br> User can create and configure virtual networks and routers, subnets, floating IP addresses, security groups, load balancers and firewalls.<br><br>
	<a href="/helion/openstack/services/networking/overview/">Learn more</a> about Network Operations.</td>
	<td>Administrator can also create an external network, and work with DHCP agents and L3 agents.</center></td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Identity Operations (Keystone)</b></td>
	<td><a href="/helion/openstack/services/identity/overview">Learn more</a> about Identity Operations.</td>
	<td>Administrator can create and configure projects/tenants and users, and set credentials, and issue security tokens.<br><br>MySQL and LDAP/ADS are supported.</td>
	</tr>
<tr style="background-color: white; color: black;">
	<td><b>Image Operations (Glance)</b></td>
	<td>HP Helion OpenStack Glance  helps to manage virtual machine images, including querying and updating image metadata, and retrieval of the actual image data.
	<br><br>
    User can create, modify, and delete private images.     <br><br>
	<a href="/helion/openstack/services/imaging/overview/">Learn more</a> about Image Operations.</td>
	<td>Administrator can create, modify and delete public images and private images. These images are made available to the users.</td>
</tr>

<tr style="background-color: white; color: black;">
	<td><b>Orchestration (Heat)</b></td>
 	<td>HP Helion Orchestration Service enables you to deploy and configure multiple composite cloud applications using template formats. It enables you to work with nested stacks, which are a mechanism of using built-in stack definitions for specific resource types.<br><br>
	User can create stacks, suspend and resume stacks, view information on stacks, view information on events, work with stack templates and infrastructure resources (such as servers, floating IPs, volumes, and security groups).<br><br>
	<a href="/helion/openstack/services/orchestration/overview/">Learn more</a> Orchestration services.</td> 
	<td>Administrator can deploy and configure the OpenStack Overcloud using the Heat Service provided in the Undercloud.</td>
</tr>

<tr style="background-color: white; color: black;">
	<td><b>Telemetry and Reporting (Ceilometer)</b></td>
 	<td><a href="/helion/openstack/services/reporting/overview/">Learn more</a> OpenStack Ceilometer based HP Telemetry and Reporting services.
	</td> 
	<td>The Telemetry service provides access to metering data collected from the compute, network, and storage services. This information can be stored in the default MySQL database or in an optional HP Vertica system for advanced analytics. Information from Telemetry and Reporting service can be used for both operational and user monitoring and external billing use cases.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Sherpa</b></td>
 	<td>HP Helion content distribution catalog service provides a mechanism to download the content such as Glance images, Heat templates, etc from the HP Helion CODN and install  the content in the appropriate service such as Glance service etc.<br><br>
	</td> 
	<td>Administrator can download content such as software patches and updates from the HP Helion CODN and apply the downloaded content to their Helion OpenStack installation. <br><br><a href ="/helion/openstack/services/sherpa/overview/">Learn more </a> HP Helion Sherpa Service</td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>EON services</b></td>
 	<td>
	</td> 
	<td>HP Helion EON service allows administrator to interact with VMware vCenter servers to discover, inventory and map ESX clusters to be used by Nova Compute. 
	<br><br> <a href ="/helion/openstack/services/eon/overview/"> Learn more</a> HP Helion EON services.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Sirius services</b></td>
 	<td> 
	</td> 
	<td>HP Helion OpenStack Sirius service assists the administrator to maintain an inventory of used 3PAR devices and CPGs, and StoreVirtual devices and VSAs  and configure Cinder 3PAR and StoreVirtual backends. <br><br> <a href =" /helion/openstack/services/sirius/overview/">Learn more</a> HP Helion OpenStack Sirius service.</td>
</tr> 
</table>

##Deployment architecture<a name="deploy-arch"></a>

You can deploy HP Helion OpenStack in two different environments depending on the hypervisor: KVM or ESX. 


###KVM environment<a name="KVM-env"></a>
	
The following diagram depicts a simplified deployment scenario using KVM.

<a href="javascript:window.open('/content/documentation/media/commercial_kvm_network_architecture.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">KVM deployment of HP Helion OpenStack beta (opens in a new window)</a>


###ESX environment<a name="esx-env"></a>

The following diagram depicts a simplified deployment scenario using ESX.

<a href="javascript:window.open('/content/documentation/media/commercial_esx_network_architecture.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack architecture diagram for ESX (opens in a new window)</a>


### Hardware requirement<a name="hardware-req"></a>

The following hardware requirement is required to install HP Helion OpenStack.


* At least 9 and up to 100 baremetal systems with the following configuration:

    * A minimum of 32 GB of physical memory
    * A minimum of 2 TB of disk space
    * A minimum of 1 x 10 GB NIC with PXE support
    * Capable of hosting VMs
    * The boot order configured with Network/PXE boot as the first option
    * The BIOS must be configured: 
      * To the correct date and time
      * With only one network interface enabled for PXE/network boot and any additional interfaces should have PXE/network boot disabled
      * To stay powered off in the event of being shutdown rather than automatically restarting
    * Running the latest firmware recommended by the system vendor for all system components, including the BIOS, BMC firmware, disk controller firmware, drive firmware, network adapter firmware, and so on

* An installer system to run the baremetal install and host the seed VM with the following configuration:

    * A minimum of 8 GB of physical memory
    * A minimum of 100 GB of disk space
    * Virtualization enabled 
    * Ubuntu 14.04 installed

For more information of Hardware configuration see [Hardware configuration](/helion/openstack/ga/install/prereqs/) and [Support Matrix](/helion/openstack/ga/support-matrix/)

### Network architecture<a name="networkarch"></a>

The following information describes the network configuration for [KVM](#KVM-Physical-network) and [ESX](#ESX-physical-network), which must be configured by the network administrator.

####KVM physical networks<a name="KVM-physical-network"></a>
<table>
<tr style="background-color: #C8C8C8;">
    <th>Network</th>
    <th>Description</th>
      </tr>
<tr style="background-color: white; color: black;">
    <td><b>IPMI/iLO</b></td>
    <td>Base IPMI network used to boot and manage physical servers in the cloud</td>
 <tr style="background-color: white; color: black;">
    <td><b>External</b></td>
    <td>Network Connected connecting compute nodes and controller nodes to Internet or Intranet. External network access is required for DVR routing from compute nodes. 
	<br><br>Floating IPs on the external network come are attached only to VMs that require them.
</td>
 </tr>
</table>

####Virtual networks
The logical networks listed in the following table are implemented as VLANs on the physical network.
<table>

<tr style="background-color: #C8C8C8;">
    <th>Network</th>
    <th>Description</th>
    <th>VLAN type</th>
    <th>Server port</th>
  </tr>
<tr style="background-color: white; color: black;">
    <td> <b>Management</b></td>
    <td>It is used for most cloud traffic including PXE boot nodes, tenant access to service APIs, internal API traffic between (one services to another), HA heartbeats, tenant access to services, VxLAN traffic for between tenant VMs, VM access to block and object storage, object storage replication and synchronization between StoreVirtual VSAs, Swift nodes, MySQL clusters, RabbitMQ clusters, keepalived, CODN access to catalog, logging traffic to centralized logging, monitoring checks to Icinga.</td>
    <td>untagged</td>
    <td>eth0 or<br>bond0</td>
  </tr>
<tr style="background-color: white; color: black;">
    <td><b>Service</b></td>
    <td>Trusted VMs communicate with the cloud infrastructure component.</td>
    <td>tagged</td>
    <td>eth0 or<br>bond0</td>
  </tr>
</td>  <tr style="background-color: white; color: black;">
    <td><b>Fiber Channel</b></td>
    <td> Fiber Channel SAN (Storage Area Network) used for data path between Compute Servers and 3PAR arrays
</table>

The Network Administrator must set up routing and firewalls for tenants to access service APIs which are only exposed on the management network. Find more information on guidelines for setting up security firewalls and routing here.  For more information on security network see [Network security](/helion/openstack/ga/install/security/).

####ESX physical network<a name="ESX-physical-network"></a>
<table>
<tr style="background-color: #C8C8C8;">
    <th>Network</th>
    <th>Description</th>
          </tr>
<tr style="background-color: white; color: black;">
    <td><b>IPMI</b></td>
    <td>Base IPMI network used to boot and manage physical servers</td>
    
    </tr>
</table>

####Virtual networks
The logical networks listed in the following table are implemented as VLANs on the physical network.
<table>
<tr style="background-color: #C8C8C8;">
    <th>Network</th>
    <th>Description</th>
    <th>VLAN type</th>
    <th>Server port</th>
  </tr>
<tr style="background-color: white; color: black;">
    <td><b>Management</b></td>
    <td>It is used for most cloud traffic including, tenant access to service APIs, internal traffic between services, VxLAN traffic between tenant VMs, VM access to block and object storage, replication and synchronization between StoreVirtual VSAs, Swift nodes, MySQL clusters, RabbitMQ clusters, keepalived, CODN access to catalog, logging traffic to centralized logging, monitoring checks to Icinga</td>
    <td>untagged</td>
    <td>eth0 or<br>bond0<br>(PXE boot for overcloud servers)</td>
  </tr>
<tr style="background-color: white; color: black;">
    <td><b>External</b></td>
    <td>Connected to Internet or Intranet. Floating IPs come from here. </td>
    <td>tagged</td>
    <td>eth0 or<br>bond0</td>
  </tr>
<tr style="background-color: white; color: black;">
    <td><b>ESX</b></td>
    <td> 
     Connects to the traffic between OVSvApp VMs running on every ESX Host, Nova and the vCenter Proxy that exists for every vCenter, and vCenter Proxy to communicate with the message queue for Cinder and Nova. Also, connects EON to communicate with the vCenter server. </td>
    <td>tagged</td>
    <td>eth0 or<br>bond0</td>
  </tr>
<tr style="background-color: white; color: black;">
    <td><b>ESX Tenant</b></td>
    <td>Tenant networks for ESX virtual machines. Neutron assigns IP addresses for virtual machines on these networks. </td>
    <td>tagged</td>
    <td>eth0 or<br>bond0</td>
  </tr>
</table>


#### Network planning

You must manage and prepare the network based on the type of hypervisor.
 
For more details information on network planning see [Preparing your network](/helion/openstack/ga/install/prereqs/).  

<!---

The physical machines need to have their management processors (iLO) connected to a network that is reachable from the Seed VM. The physical machines and the Seed VM need to be connected to a fast network.
We recommend using one physical Ethernet port on a 10 GB network. Use an untagged VLAN for this network. 

The Seed VM is expected to use eth0 to connect to the cluster network (and hence through to the management network). If your host uses another NIC, for example eth1, then you need to set the environment variable appropriately, for example BRIDGE_INTERFACE=eth1, as seen by root.

####Network fabric 
* Two physical links, one for IPMI/iLO and one for the hypervisor/OS
* Network switches capable of basic VLAN, L2 and L3 functions (there is no dependency on VxLAN-capable or OpenFlow-enabled switch, although the product supports VxLAN as the virtual/overlay network)

The physical cluster network can be shared by a number of logical networks, each with its own tagged VLAN and IP subnet. We recommend using at least one such network as the external network, with floating IPs coming from its subnet range. --->



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


##High availability<a name="highavailability"></a>

The HP Helion OpenStack High Availability (HA) architecture ensures that Cloud Services are deployed in a manner that is resilient, and remain available and functional in the event of Single Points Of Failure (SPOF) of software or hardware.

The OpenStack services are deployed in a three node Controller cluster, that ensures availability of stateless services like API services and stateful services like MySQL or RabbitMQ.

For more details on HA configuration, refer to [HP Helion OpenStack High Availability](/helion/openstack/ga/high-availability/) and [OpenStack HA Guide](http://docs.openstack.org/high-availability-guide/content/index.html).



## Installation and configuration<a name="install-configure"></a>

HP Helion OpenStack is designed to deliver an open source OpenStack solution at the modest scale. A baremetal multi-node deployment consists of a minimum of **9** baremetal servers, to which you can add **up to 100 Compute nodes**:

* 1 seed host (installer system)
* 1 undercloud server
* 3 overcloud controllers
* 2 overcloud Swift nodes
* At least 1 block storage node 
* At least 1 overcloud Compute node 

[Learn more]( /helion/openstack/ga/install/overview/) about installing and configuring HP Helion OpenStack. 

###OpenStack on OpenStack -TripleO<a name=""Deploy></a>

HP Helion OpenStack uses three linked installation phases to deploy a complete OpenStack cloud. TripleO simulates the deployment of OpenStack by creating and configuring baremetal servers to successfully run a cloud deployment.


OpenStack-on-OpenStack, or TripleO, is OpenStack's official project for deployment, configuration and life cycle management of OpenStack clouds. A TripleO installation includes a seed, undercloud and overcloud.

<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: white; color: black;">
  	<td style><b>Overcloud<b></td>
 	<td>The Overcloud is the functional cloud available to end users for running guest virtual machines and workloads. The Overcloud comprises OpenStack Cloud Services deployed on Controller Nodes, and a number of Compute Nodes and Storage Nodes. 
	<br><br>The Cloud Services in the Overcloud, used by end users, include Nova, Neutron, Cinder, Swift, Horizon, Glance, Keystone, Heat, and Ceilometer services, as described in the Functional Overview section above. These Cloud Services are deployed in a highly available cluster across the three Controller nodes. 
	<br><br>For KVM based Hypervisor environments, the Overcloud also comprises Nova Compute nodes running the KVM hypervisor, and Block Storage nodes running the StoreVirtual VSA.
</td>
</tr>
<tr style="background-color: white; color: black;">
	 <td><b>Undercloud</b></td>
	 <td>A single-server deployment of a limited set of OpenStack services, called the Undercloud, is used to deploy, test, manage, and update all the Overcloud servers. 
	<br><br>
	The Undercloud comprises Nova, Ironic, Neutron, Glance, Keystone, and Heat services, which are used to deploy and configure various nodes of the Overcloud, either on Virtual Machines or Baremetal servers.<br><br>The Centralized Logging and Monitoring components run in the Undercloud and can be accessed using a Web Browser. <br><br>The Sherpa, Eon and Sirius services also run in the Undercloud, and can be accessed via panels in the Horizon Dashboard also running in the UnderCloud.
	The Undercloud does not run in a HA configuration, but is an important component of the Cloud. 
	<br><br>
	Learn more about the Backup Restore procedures to restore the Undercloud in event of server problems.
 </tr>
<tr style="background-color: white; color: black;">
	<td><b>Seed VM</b></td>
	<td>The SeedCloud is deployed as a VM instance. This image contains bare minimal OpenStack services required to deploy and update the Undercloud on a baremetal server.
	<br><br>
	The Host Server running the SeedCloud VM is also used to run backup restore procedures for SeedCloud, Undercloud and Overcloud Controllers. It is also used to run the StoreVirtual CMC Management Console.
	<br><br>
	The SeedCloud does not run in a HA configuration, but is an important component of the Cloud. Learn more about the Backup Restore procedures to restore the SeedCloud in event of server problems.
</tr>
</td>
</table>

**Note:** You cannot build or rebuild the images. Direct editing of the Heat templates is possible, but not supported. Configuration is limited to those items supported by the configuration tool and Horizon.

###Installation option<a name="install-option"></a>

HP Helion OpenStack is provided with two baremetal installation options depending on your system configuration.  It allows you to manage the KVM and ESX hypervisors and provision virtual machines. 
 

####KVM Hypervisor with HP StoreVirtual VSA support<a name="kvm-Hypervisor"></a>

Kernel-based Virtual Machine is a virtualization infrastructure for the Linux kernel, which turns it into a hypervisor. KVM requires a processor with hardware virtualization extension.

<a href="javascript:window.open('/content/documentation/media/commercial_kvm_network_architecture.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack architecture diagram for KVM network architecture.(opens in a new window)  </a>

HP StoreVirtual VSA Software is a Virtual Storage Appliance that provides the complete array functionality on top of Linux KVM environment without external hardware. It eliminates the need for external shared storage required to implement Block Storage features. It uses scale-out, distributed clustering to provide a pool of storage with enterprise storage features and simple management at a reduced cost.

<a href="javascript:window.open('/content/documentation/media/reference-architecture-StoreVirtual-volume-type-mapping.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack architecture diagram for Store Virtual volume type mapping.(opens in a new window) </a> 

####ESX Hypervisor with HP Virtual Cloud Networking (VCN) application support<a name="esx-hypervisor"></a>

HP Helion OpenStack supports VMWare ESX hypervisor. With our ESX integration, you can provision and manage an overcloud ESXi cluster. VMWare vCenter Compute driver is used as a part of ESX integration. The VMware vCenter driver connects to ESX clusters in a vCenter through Compute proxy nodes. A Nova scheduler sees each cluster as compute and uses the same for scheduling a new instances.

An ESX Proxy Compute driver communicates to VMware vCenter server through VI SDK. All the details of vCenter in the Cloud Controller  are required to be captured. EON,  a new service sub component, captures details of the vCenter server in a Cloud Controller and provides the details of the clusters for configuring the list of clusters managed by ESX Proxy Compute node. 
 
The ESX integration uses the OVSvApp application to connect the vCenter networking to the OpenStack Neutron network controller to manage workload networks.  

<a href="javascript:window.open('/content/documentation/media/commercial_esx_network_architecture.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack architecture diagram for ESX (opens in a new window)</a>

The HP Virtual Cloud Networking (VCN) application is an enhanced networking (Neutron) module of HP Helion OpenStack that delivers network virtualization to orchestrate your data center infrastructure.

HP VCN enables you to build a robust, multi-tenant networking infrastructure that delivers ready-to-use compute, storage, and networking by providing;

* Scalable, secure, and hardened enterprise cloud networking
* Automated delivery of secure isolated networks in minutes  

####DNS as a service (DNSaaS)<a name="DNSaaS"></a>

After installing HP Helion OpenStack, you have the option to install HP Helion OpenStack DNS as a service (DNSaaS) support. The HP Helion OpenStack DNS (Domain Name System) service, based on the OpenStack Designate project, is a managed DNS service engineered to help you create, publish, and manage your DNS zones and records securely and efficiently to either a public or private DNS server network.

Currently, supported DNS servers and networks include: 

* PowerDNS

##Updates and extensions<a name="updates-and-extensions"></a>

Updates and extensions provides a mechanism to download and install the content and updates for the Overcloud.

For more information refer
[Updates and extension](/helion/openstack/ga/undercloud/admin/updates-and-extension/)

##Operational management<a name="operate-manage"></a>

###Centralized Logging<a name="centralized-logging"></a>

Centralized logging is based on Logstash, Elasticsearch, and Kinbana Dashboard which is deployed in the Undercloud server. 

Centralized logging helps the administrator triage and troubleshoot the distributed Cloud deployment from the Undercloud. Now, the user is not required to access the  several remote server (ssh) to view the individual log files.

###Monitoring<a name="monitoring"></a>

The Administrator can monitor availability of all hosts and services in the Overcloud using the Icinga Monitoring server deployed in the Undercloud.

System and service health checks are based on the **check_mk** framework. Health checks are executed locally on each node, and their results are sent over to the central Icinga server, thereby distributing the processing and allowing the Icinga server to scale up. When new nodes are added to the cloud, they are automatically discovered and monitored.

For more information refer [Monitoring](/helion/openstack/ga/services/object/swift/Monitor-cluster/)


###Add, remove and replace nodes<a name="add-remove-replace-nodes"></a>

HP Helion OpenStack provides automation scripts and operational cookbooks to add capacity to the cloud for compute, storage, and networking. 

You can prepare hardware servers and incrementally deploy HP KVM Compute nodes, HP StoreVirtual VSA Block Storage Nodes, and OpenStack Swift Proxy and Object Storage Nodes.

Conversely, you can decommission servers and remove specific nodes from the cloud.

If any of the Controller Nodes fails, you can remove and replace Controller nodes, while re-connecting them automatically into the HA cluster.

###Backup and Restore nodes<a name="backup-restore-nodes"></a>

Backup and restore scripts and procedures are provided for the seed, undercloud, overcloud Management Controller (running singleton services like Sherpa), and the MySQL database deployed in the Controller cluster. These scripts are to be used by Administrators managing the OpenStack Cloud.

Backup and Restore of VM instances/snapshots and Volumes/snapshots for Workloads in the Cloud is supported using Swift. These are to be used by end users of Projects deployed in the OpenStack Cloud.

 For more information refer [HP Helion OpenStack® Back Up and Restore](/helion/openstack/ga/backup.restore/)

## Next Steps<a name="next"></a>

Review the [HP Helion OpenStack Support Matrix](/helion/openstack/ga/support-matrix/).

To prepare your environment for the installation, see [HP Helion OpenStack&#174; Installation: Prerequisites](/helion/openstack/ga/install/prereqs/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593;</a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*


