---
layout: default
title: "HP Helion OpenStack&#174;: Technical Overview"
permalink: /helion/openstack/technical-overview/
product: commercial.ga
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.0
product-version3: HP Helion OpenStack 1.0.1
product-version4: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Sameer V, Pranoy R, Binamra S

---
<!--UNDER REVISION-->

<p style="font-size: small;"> &#9664; <a href="/helion/openstack/support-matrix/">Support Matrix | <a href="/helion/openstack/install/overview/test/">&#9650; Installation Overview</a> | <a href="/helion/openstack/install/prereqs/"> Prerequisites</a> &#9654</p>

# HP Helion OpenStack&#174; Technical Overview

This page introduces you to HP Helion OpenStack, an enterprise-grade distribution of the OpenStack cloud operating system.

HP Helion OpenStack allows you to easily deploy OpenStack Cloud Services in a secure, highly available configuration, and subsequently deploy, manage and operate your cloud infrastructure in production. 

It is  designed to offer a number of value-added services that complement and enhance OpenStack and set up a cloud. HP OpenStack is enabled to manage KVM and VMWare ESX hypervisors.

* [HP Helion OpenStack services](#Helion-services)
* [Deployment architecture](#deploy-arch)
	* [KVM environment](#KVM-env)
	* [ESX environment](#esx-env)
* [Hardware requirement](#hardware-req)
* [Network architecture](#networkarch)
	* [Physical network architecture](#physical)
	* [Virtual networks](#virtual)
* [Network planning](#networkplan)
	* [Network security](#networksecurity)
* [Installation planning](#install-configure)
	* [Installation options](#install-option) 
* [High availability](#highavailability)
* [Updates and extensions](#updates-and-extensions)
* [Operational management](#operate-manage)
	* [Centralized Logging](#centralized-logging)
	* [Monitoring](#monitoring)
	* [Add, remove and replace nodes](#add-remove-replace-nodes)
	* [Backup and Restore nodes](#backup-restore-nodes)
* [Next Steps](#next)

## HP Helion OpenStack Services- Functional Overview {#Helion-services}

The following table outlines the functionality of HP Helion OpenStack services based on the type of users - Users and Administrators. For a complete description of these services, see the [Services Overview](/helion/openstack/services/overview/) page.


<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th>Service</th>
	<th><center>Description</center></th>
    <th><center>Administrator task</center></th>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Compute Operations (Nova)</b></td>
	<td>The HP Helion OpenStack Compute supports an API to instantiate and manage virtual servers on KVM  and VMware ESX hypervisors. <br><br> Users can create and manage the life cycle of virtual machines (suspend, resume, snapshot, and so forth), attach block storage volumes, work with security groups and key pairs, and associate floating IP addresses. <br><br>
Users can also boot a VM using a Cinder volume as the root partition.<br><br>
	<a href="/helion/openstack/services/compute/overview/">Learn more</a> about the Compute Operations service.</td>
    <td> Administrators can also configure server flavors, modify project quotas, configure availability zones, enable and disable services, and work with virtual machines.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Block Storage<br>Volume (Cinder)</b></td>
	<td>The HP Helion OpenStack Block Storage supports an API to instantiate and manage block storage volumes on HP StoreServ 3PAR devices and StoreVirtual Software Defined Storage. <br><br>User can create volumes, attach them to VMs, and take snapshots and backups.<br><br>
Users can create a bootable volume and use that to boot a VM.
	<br><br><a href="/helion/openstack/services/volume/overview/">Learn more </a> about the Volume Operations service.
	</td>
	<td>Administrators can deploy StoreVirtual VSA Software Defined Storage, and configure drivers for StoreVirtual and StoreServ 3PAR using the Sirius service. <br><br>
	Administrsators can create volume types and associate quality of service with volume types, and map StoreServ and StoreVirtual backends to the volume types.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Object Operations (Swift)</b></td>
	<td>The HP Helion OpenStack Object and Operations service helps manage the storage and retrieval of objects in publicly accessible machines. 
	<br><br>Users can configure storage containers, upload and download container files, and delete container files.<br><br>
	<a href="/helion/openstack/services/object/overview/">Learn more</a> about the Object Operations service and Ringos.</td>
	
	<td>Administrators can easily start with two auto-configured storage nodes, and then scale out by deploying additional Swift Proxy and Object Storage nodes. <br><br>The Ringos CLI Utility is provided to format drives and easily manage Swift rings. </td>
 </tr>
<tr style="background-color: white; color: black;">
	<td><b>Network Operations (Neutron)<b></td>
	<td>The HP Helion OpenStack Network Operations service provides network connectivity and IP addressing for virtual machines managed by Compute service.<br><br> User can create and configure virtual networks and routers, subnets, floating IP addresses, security groups, load balancers and firewalls.<br><br>
	<a href="/helion/openstack/services/networking/overview/">Learn more</a> about the Network Operations service.</td>
	<td>Administrators can also create an external network, and work with DHCP agents and L3 agents.</center></td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Identity Operations (Keystone)</b></td>
	<td>The HP Helion OpenStack Identity Operations service provides one-stop authentication.

	<br><br><a href="/helion/openstack/services/identity/overview/">Learn more</a> about the Identity Operations service.</td>
	<td>Administrators can create and configure projects/tenants and users, and set credentials, and issue security tokens.<br><br>MySQL and LDAP/ADS are supported.</td>
	</tr>
<tr style="background-color: white; color: black;">
	<td><b>Image Operations (Glance)</b></td>
	<td>The HP Helion OpenStack Image Operations service helps to manage virtual machine images, including querying and updating image metadata, and retrieval of the actual image data.
	<br><br>
    User can create, modify, and delete private images.     <br><br>
	<a href="/helion/openstack/services/imaging/overview/">Learn more</a> about Image Operations.</td>
	<td>Administrators can create, modify and delete public images and private images. These images are made available to the users.</td>
</tr>

<tr style="background-color: white; color: black;">
	<td><b>Orchestration (Heat)</b></td>
 	<td>The HP Helion Orchestration service enables you to deploy and configure multiple composite cloud applications using template formats. It enables you to work with nested stacks, which are a mechanism of using built-in stack definitions for specific resource types.<br><br>
	Users can create stacks, suspend and resume stacks, view information on stacks, view information on events, work with stack templates and infrastructure resources (such as servers, floating IPs, volumes, and security groups).<br><br>
	<a href="/helion/openstack/services/orchestration/overview/">Learn more</a> about the Orchestration services.</td> 
	<td>Administrators can deploy and configure the OpenStack overcloud using the Orchestration service provided in the undercloud.</td>
</tr>
<!---
<tr style="background-color: white; color: black;">
	<td><b>Telemetry and Reporting (Ceilometer)</b></td>
 	<td><a href ="/helion/openstack/services/reporting/overview/">Learn more</a> about the HP Helion OpenStack Metering service.</td> </td> 
	<td>The Telemetry service provides access to metering data collected from the compute, network, and storage services. This information can be stored in the default MySQL database or in an optional HP Vertica system for advanced analytics. Information from Telemetry and Reporting service can be used for both operational and user monitoring and external billing use cases.</td>
</tr> --->
<tr style="background-color: white; color: black;">
	<td><b>Sherpa</b></td>
 	<td>The HP Helion Sherpa service is a content distribution catalog service provides a mechanism to download the content such as Image Operation images, Orchestration templates, and so forth, from the HP Helion [HDN](https://helion.hpwsportal.com) and install the content in the appropriate service such as the Identity service etc.

	<br><br><a href =" /helion/openstack/services/sherpa/overview/">Learn more </a> about the HP Helion Sherpa Service.
	</td> 
	<td>Administrators can download content such as software patches and updates from the HP Helion [HDN](https://helion.hpwsportal.com) and apply the downloaded content to their Helion OpenStack installation. </td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>EON services</b></td>
	<td>The HP Helion ESX onboarding (EON) service is an inventory which interacts with the VMware vCenter server and collects the information available at the datacenters and clusters. The information is used for deployment and configuration of ESX Proxy Compute node. EON service is deployed in undercloud controller node.

	<br><br> <a href =" /helion/openstack/services/eon/overview/"> Learn more</a> HP Helion EON services.</td>
	<td>Administrators can interact with VMware vCenter servers to discover, inventory and map ESX clusters to be used by the Compute service. 
</td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Sirius services</b></td>
 	<td>The HP Helion OpenStack Sirius service is a REST-based web service for storage device management. It is used to configure of storage services such as the  Block Storage and the Object Operations services that run in the overcloud and manage various storage devices.
	 <br><br> <a href =" /helion/openstack/services/sirius/overview/">Learn more</a> HP Helion OpenStack Sirius service.</td> 
	<td>Administrators can maintain an inventory of used 3PAR devices and CPGs, and StoreVirtual devices and VSAs  and configure Cinder 3PAR and StoreVirtual backends.</td>
</tr> 
</tr>
<tr style="background-color: white; color: black;">
	<td><b>DVR services</b></td>
 	<td>HP Helion OpenStack Distributed Virtual Routing (DVR) allows you to define connectivity among different Virtual Network Switches (VNS) as well as connectivity between VNS hosts and the external network. HP Helion OpenStack provides Distributed Virtual Routing to cloud users.
	 <br><br> <a href =" /helion/openstack/services/dvr/overview/">Learn more</a> HP Helion OpenStack DVR service.</td> 
	<td> Administrators can  create centralized router (legacy router).</td>
</tr> 
<tr style="background-color: white; color: black;">
	<td><b>Ceilometer</b></td>
 	<td>HP Helion OpenStack Metering, based on Ceilometer, takes specified measurements of both physical and virtual resources, including physical servers and network devices such as switches and firewalls. The service can be configured to record data, trigger specific action when a pre-defined condition is met, or both. <br><br> <a href ="/helion/openstack/services/reporting/overview/">Learn more</a> about the HP Helion OpenStack Metering service.</td> 
	<td> Administrators can create and configure information collection from various HP Helion services.</td>
</tr>
</table>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>



## Deployment architecture {#deploy-arch}  

You can deploy HP Helion OpenStack in two different environments depending on the hypervisor: KVM or ESX. 


###KVM environment {#KVM-env}
	
The following diagram depicts a simplified deployment scenario using KVM.

<img src="media/topology_kvm.png"/)>


###ESX environment {#esx-env}

The following diagram depicts a simplified deployment scenario using ESX.

<img src="media/topology_esxnew.png"/)>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Hardware requirement {#hardware-req}

For more information of Hardware configuration see [Hardware configuration](/helion/openstack/install/prereqs/) and [Support Matrix](/helion/openstack/support-matrix/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Network architecture {#networkarch}

The following information describes the network configuration for the [physical networks](#physical) and [virtual networks](#virtual), which must be configured by the network administrator.

### Physical network architecture {#physical}

This table provides an overview of the physical network configuration requirements you must meet, with the following assumptions:

- Physical network ports on each server
	- One IPMI port
	- One physical ethernet port (for example, eth0) for the hypervisor/OS

- Network fabric
	- Two physical links, one for IPMI and one for the hypervisor/OS
	- Network switches capable of basic VLAN, L2 and L3 functions;
	- The physical hypervisor/OS network is shared by a number of logical networks, and each logical network has its own VLAN and IP subnet

For detailed information, see the [Preparing the network](/helion/openstack/install/prereqs/#network) section of the *Prerequisites*.

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: #C8C8C8;">
<th> Network </th>
<th> Description </th>
<th> VLAN type </th>
<th> Server port </th>

</tr>

<tr style="background-color: white; color: black;">
<td> IPMI / iLO </td>
<td> Network for server hardware management </td>
<td> Untagged </td>
<td> IPMI or iLO</td>

</tr>

<tr style="background-color: white; color: black;">
<td> Undercloud management </td>
<td> <ul><li>Traffic for undercloud internal OpenStack calls, Image Operation service downloads, and so forth.</li>
<li>Provides access to undercloud API endpoints</li>
<li>Used to PXE boot overcloud servers</li>
</ul> </td>
<td> Untagged </td>
<td> eth0</td>

</tr>

<tr style="background-color: white; color: black;">
<td> Overcloud management </td>
<td> Traffic for overcloud internal OpenStack calls, Image Operations service downloads, and so forth. </td>
<td> Untagged </td>
<td> eth0</td>

</tr>

<tr style="background-color: white; color: black;">
<td> SDN </td>
<td> Network between workload VMs, for example VxLAN traffic. </td>
<td> Untagged </td>
<td> eth0</td>

</tr>

<tr style="background-color: white; color: black;">
<td> Storage </td>
<td> iSCSi traffic between VMs and storage products like StoreVirtual </td>
<td> Untagged </td>
<td> eth0</td>

</tr>

<tr style="background-color: white; color: black;">
<td> External </td>
<td><ul><li> Connected to internet or intranet</li>
<li>Provides floating IPs</li></ul> </td>
<td> Tagged </td>
<td> eth0</td>

</tr>

<tr style="background-color: white; color: black;">
<td> Service </td>
<td>Connects trusted VMs in overcloud to communicate with cloud infrastructure components in undercloud</td>
<td>Tagged</td>
<td>eth0</td>

</tr>

<tr style="background-color: white; color: black;">
<td> Object Storage (Swift) </td>
<td> Communication between Object Operations servers (includes user data)  </td>
<td> Untagged </td>
<td> eth0</td>

</tr>

</table>

### Virtual networks {#virtual}
The logical networks listed in the following table are implemented as VLANs on the physical network. The virtual networks are different for [KVM](#virtualkvm) and [ESX](#virtualesx).

#### Virtual networks for KVM hypervisor support  {#virtualkvm}

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
    <td>This network is used for most cloud traffic including PXE boot nodes, tenant access to service APIs, internal API traffic between (one services to another), HA heartbeats, tenant access to services, VxLAN traffic for between tenant VMs, VM access to block and object storage, object storage replication and synchronization between StoreVirtual VSAs, Object Operations service nodes, MySQL clusters, RabbitMQ clusters, keepalived, [HDN](https://helion.hpwsportal.com) access to the product catalog, logging traffic to centralized logging, monitoring checks to Icinga.</td>
    <td>untagged</td>
    <td>eth0</td>
  </tr>
<tr style="background-color: white; color: black;">
    <td><b>Service</b></td>
    <td>Trusted VMs communicate with the cloud infrastructure component.</td>
    <td>tagged</td>
    <td>eth0</td>
  </tr>
</td>  <tr style="background-color: white; color: black;">
    <td><b>Fibre Channel</b></td>
    <td> Fibre Channel SAN (Storage Area Network) used for data path between Compute Servers and 3PAR arrays.
    <td> </td>
    <td> </td>
<tr style="background-color: white; color: black;">
    <td><b>External</b></td>
	<td>This network connects compute nodes and controller nodes to the Internet or Intranet. External network access is required for DVR routing from compute nodes. 

	<br>Floating IPs on the external network can be attached only to VMs that require a public IP address.
    <td>tagged</td>
    <td>eth0</td>
  </tr>
</table>


#### Virtual networks for ESX hypervisor support {#virtualesx}

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
    <td>This network is used for most cloud traffic including, tenant access to service APIs, internal traffic between services, VxLAN traffic between tenant VMs, VM access to block and object storage, replication and synchronization between StoreVirtual VSAs, Object Operations service nodes, MySQL clusters, RabbitMQ clusters, keepalived, [HDN](https://helion.hpwsportal.com) access to the product catalog, logging traffic to centralized logging, monitoring checks to Icinga.</td>
    <td>untagged</td>
    <td>eth0<br>(PXE boot for overcloud servers)</br></td>
  </tr>
<tr style="background-color: white; color: black;">
    <td><b>External</b></td>
    <td>This network connects compute nodes and controller nodes to the Internet or Intranet. External network access is required for DVR routing from compute nodes. 
	<br><br>Floating IPs on the external network can be attached only to VMs that require a public IP address.</td>
    <td>tagged</td>
    <td>eth0</td>
  </tr>
<tr style="background-color: white; color: black;">
    <td><b>ESX</b></td>
    <td>This network connects the traffic between OVSvApp VMs running on every ESX Host, Network Operations service and the vCenter Proxy that exists for every vCenter, and vCenter Proxy to communicate with the message queue for Block Storage and Network Operations. Also, connects EON to communicate with the vCenter server. </td>
    <td>tagged</td>
    <td>eth0</td>
  </tr>
<tr style="background-color: white; color: black;">
    <td><b>ESX Tenant</b></td>
    <td>This network is a tenant network for ESX virtual machines. The Network Operations service assigns IP addresses for virtual machines on these networks. </td>
    <td>tagged</td>
    <td>eth0</td>
  </tr>
</table>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Network planning {#networkplan}

You must manage and prepare the network based on the type of hypervisor.
 
For more details information on network planning see [Preparing your network](http://15.184.32.138/helion/openstack/install/prereqs/network/).  

### Network security {#networksecurity}

The Network Administrator must set up routing and firewalls for tenants to access service APIs which are only exposed on the management network. For more information on guidelines for setting up security firewalls and routing see [Network security]( /helion/openstack/install/security/).

<!---

The physical machines need to have their management processors (iLO) connected to a network that is reachable from the Seed VM. The physical machines and the Seed VM need to be connected to a fast network.
We recommend using one physical Ethernet port on a 10 GB network. Use an untagged VLAN for this network. 

The Seed VM is expected to use eth0 to connect to the cluster network (and hence through to the management network). If your host uses another NIC, for example eth1, then you need to set the environment variable appropriately, for example BRIDGE_INTERFACE=eth1, as seen by root.

#### Network fabric 
* Two physical links, one for IPMI/iLO and one for the hypervisor/OS
* Network switches capable of basic VLAN, L2 and L3 functions (there is no dependency on VxLAN-capable or OpenFlow-enabled switch, although the product supports VxLAN as the virtual/overlay network)

The physical cluster network can be shared by a number of logical networks, each with its own tagged VLAN and IP subnet. We recommend using at least one such network as the external network, with floating IPs coming from its subnet range. --->

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Installation planning {#install-configure}

HP Helion OpenStack uses three linked installation phases, called OpenStack-on-OpenStack (TripleO), to deploy a complete OpenStack cloud. TripleO simulates the deployment of OpenStack by creating and configuring baremetal servers to successfully run a cloud deployment.

TripleO is OpenStack's official project for deployment, configuration, and life cycle management of OpenStack clouds. A TripleO installation includes a seed, undercloud and overcloud:

<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: white; color: black;">
	<td><b>Seed VM</b></td>
	<td>The Seed cloud is deployed as a VM instance. This image contains minimal OpenStack services required to deploy and update the undercloud on a baremetal server.
	<br><br>
	The host server running the seed VM is also used to run backup restore procedures for the seed VM, undercloud and overcloud. The seed VM is also used to run the StoreVirtual CMC Management Console.
	<br><br>
	The seed VM does not run in a HA configuration, but is an important component of the cloud. Learn more about the <a href ="/helion/openstack/backup.restore/">Backup and Restore procedures</a> to restore the seed VM in event of server problems.
</tr>
</td>
<tr style="background-color: white; color: black;">
	 <td><b>Undercloud</b></td>
	 <td>A single-server deployment of a limited set of OpenStack services, called the undercloud, is used to deploy, test, manage, and update all the overcloud servers. 
	<br><br>
	The undercloud comprises the Compute, Ironic, Networking Operations, Object Operations, Identity Operations, and Orchestration services, which are used to deploy and configure various nodes of the overcloud on baremetal servers.<br><br>The Centralized Logging and Monitoring components run in the undercloud and can be accessed using a Web Browser. <br><br>The Sherpa, Eon and Sirius services also run in the undercloud, and can be accessed via panels in the Horizon Dashboard fr the undercloud.
	The undercloud does not run in a HA configuration, but is an important component of the cloud. 
	<br><br>
	Learn more about the <a href ="/helion/openstack/backup.restore/">Backup and Restore procedures</a> to restore the undercloud in event of server problems. 
 </tr>
<tr style="background-color: white; color: black;">
  	<td style><b>Overcloud<b></td>
 	<td>The overcloud is the functional cloud available to end users for running guest virtual machines and workloads. The overcloud comprises OpenStack Cloud Services deployed on controller nodes, and a number of compute nodes and storage nodes. 
	<br><br>The cloud services in the overcloud, used by end users, include Compute, Networking, Block Storage, Object Operations, Horizon, Image Operations, Identity Operations, and Orchestration as described in the <a href ="/helion/openstack/technical-overview/#Helion-services"> Functional Overview </a>section above. 
	<br><br>These services are deployed in a highly available cluster across the three Controller nodes.
	<br><br>For KVM based Hypervisor environments, the overcloud also comprises Nova Compute nodes running the KVM hypervisor, and Block Storage nodes running the StoreVirtual VSA.
</br>
</td>
</tr>
</table>


**Note:** You cannot build or rebuild the images. Direct editing of the Orchestration (Heat) templates is possible, but not supported. Configuration is limited to those items supported by the configuration tool and Horizon.

[Learn more]( /helion/openstack/install/overview/) about installing and configuring HP Helion OpenStack. 

### Installation options {#install-option}

HP Helion OpenStack is provided with two baremetal installation options depending on your system configuration.  It allows you to manage the KVM and ESX hypervisors and provision virtual machines. 
 

#### KVM Hypervisor with HP StoreVirtual VSA support {#kvm-Hypervisor}

Kernel-based Virtual Machine (KVM) is a virtualization infrastructure for the Linux kernel, which turns it into a hypervisor. KVM requires a processor with hardware virtualization extension.

[HP Helion OpenStack architecture diagram for KVM network architecture](#KVM-env).

<!--- this is redundant diagram
<img src="media/topology_kvm.png"/)> --->

HP StoreVirtual VSA Software is a Virtual Storage Appliance that provides the complete array functionality on top of Linux KVM environment without external hardware. VSA eliminates the need for external shared storage required to implement Block Storage features. VSA uses scale-out, distributed clustering to provide a pool of storage with enterprise storage features and simple management at a reduced cost.

HP Helion OpenStack architecture diagram for Store Virtual volume type mapping

<img src="media/reference-architecture-StoreVirtual-volume-type-mapping.png"/> 

**Note:** Your HP Helion OpenStack installation can be configured [to use 3Par for block storage](/helion/openstack/install/3par/).

#### ESX Hypervisor with HP Virtual Cloud Networking (VCN) application support {#esx-hypervisor}

HP Helion OpenStack supports VMWare ESX hypervisor. With our ESX integration, you can provision and manage an overcloud ESX cluster. VMWare vCenter Compute driver is used as a part of ESX integration. The VMware vCenter driver connects to ESX clusters in a vCenter through Compute proxy nodes. A Compute node scheduler sees each cluster as compute and uses the same for scheduling a new instances.

An ESX Proxy Compute driver communicates to VMware vCenter server through VI SDK. All the details of vCenter in the Cloud Controller  are required to be captured. The EON service sub-component, captures details of the vCenter server in a Cloud Controller and provides the details of the clusters for configuring the list of clusters managed by ESX Proxy Compute node. 
 
The ESX integration uses the OVSvApp application to connect the vCenter networking to the Network Operations controller to manage workload networks.  

[HP Helion OpenStack architecture diagram for ESX](#esx-env)
<!---redundant diagram
<img src="media/commercial_esx_network_architecture.png"/> --->

The HP Virtual Cloud Networking (VCN) application is an enhanced Networking Operations (Neutron) module of HP Helion OpenStack that delivers network virtualization to orchestrate your data center infrastructure.

HP VCN enables you to build a robust, multi-tenant networking infrastructure that delivers ready-to-use compute, storage, and networking by providing;

* Scalable, secure, and hardened enterprise cloud networking
* Automated delivery of secure isolated networks in minutes  

#### DNS as a service (DNSaaS) {#DNSaaS}

After installing HP Helion OpenStack, you have the option to install HP Helion OpenStack DNS as a service (DNSaaS) support. The HP Helion OpenStack DNS (Domain Name System) service, based on the OpenStack Designate project, is a managed DNS service engineered to help you create, publish, and manage your DNS zones and records securely and efficiently to either a public or private DNS server network.

[Learn more]( /helion/openstack/install/dnsaas/) about DNSaaS installation and configuration.

<!---
Currently, supported DNS servers and networks include: 

* PowerDNS--->

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## High availability {#highavailability}

The HP Helion OpenStack High Availability (HA) architecture ensures that cloud resources are always available on request, resulting in uninterrupted operations for users. 

The OpenStack services are deployed in a three node Controller cluster, which ensures availability of stateless services like API services and stateful services like MySQL or RabbitMQ.

For more details on HA configuration, refer to [HP Helion OpenStack High Availability](/helion/openstack/high-availability/) and [OpenStack HA Guide](http://docs.openstack.org/high-availability-guide/content/index.html).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


<!---this is part of release 1.5
##Ceph Firefly 80.7 Storage Solution

The HP Helion OpenStack 1.1 Ceph Storage Solution provides an unified scalable and stable Storage Solution for the management of Helion OpenStack Glance Images, Nova Boot Volumes, Cinder persistent Volumes. The Solution also supports User backup and archive workloads to the Swift API writing to the same unified Ceph storage platform. This Solution is supported by HP.

For more details on Ceph integration, refer to [HP Helion OpenStack Enterprise Edition 1.1 Ceph Firefly 80.7 Storage Solution](/helion/openstack/ceph/)

--->
## Updates and extensions {#updates-and-extensions}

Updates and extensions provides a mechanism to download and install the content and updates for the overcloud.

For more information refer
[Updates and extension](/helion/openstack/undercloud/admin/updates-and-extension/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Operational management {#operate-manage}

The following systems help you manage your cloud services.

### Centralized Logging {#centralized-logging}

Centralized logging is based on <a href="http://logstash.net/">Logstash</a>, <a href="http://www.elasticsearch.org/">Elasticsearch</a>, and <a href="http://www.elasticsearch.org/guide/en/kibana/current/_dashboard_schema.html">Kibana Dashboard</a> which is deployed in the undercloud server. 

Centralized logging helps the administrator triage and troubleshoot the distributed cloud deployment from the undercloud. The user is not required to access the several remote servers to view the individual log files.

**Note:** Logging requires 4GB of disk space to make sure that all logging messages are retained. <!-- CORE-1964 -->

### Monitoring {#monitoring}

The administrator can monitor the availability of all hosts and services in the overcloud using the <a href="https://www.icinga.org/">Icinga Monitoring server</a> deployed in the undercloud.

System and service health checks are based on the **check_mk** framework. Health checks are executed locally on each node, and their results are sent over to the central Icinga server, thereby distributing the processing and allowing the Icinga server to scale up. When new nodes are added to the cloud, they are automatically discovered and monitored.

For more information refer to [Monitoring](/helion/openstack/services/object/swift/Monitor-cluster/).


### Add, remove and replace nodes {#add-remove-replace-nodes}

HP Helion OpenStack provides automation scripts to add capacity to the cloud for compute, storage, and networking. 

You can prepare hardware servers and incrementally deploy HP Compute nodes, HP StoreVirtual VSA Block Storage nodes, and OpenStack Swift Proxy and Object Storage nodes.

Conversely, you can decommission servers and remove specific nodes from the cloud.

If any of the controller nodes fails, you can remove and replace controller nodes, while re-connecting them automatically into the HA cluster. 

For more information refer to [Removing and Replacing a Failed Overcloud Controller](/helion/openstack/removing/failedovercloud/).

For more information on adding (Scale Out) or removing (Scale In) nodes (KVM Compute Nodes) to an already-installed overcloud on a KVM hypervisor, see [HP Helion OpenStack&#174; Add (Scale-Out) and Remove (Scale-In) Nodes on KVM Hypervisors](/helion/openstack/install/add/nodes/).

### Backup and Restore nodes {#backup-restore-nodes}

Backup and restore scripts and procedures are provided for the seed VM, undercloud, overcloud management controller (running singleton services like Sherpa), and the MySQL database deployed in the controller cluster. These scripts are to be used by administrators managing the OpenStack Cloud.

Backup and Restore of VM instances/snapshots and volumes/snapshots for workloads in the cloud is supported using the Object Storage service.

 For more information see [HP Helion OpenStack&#174; Back Up and Restore](/helion/openstack/backup.restore/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Next Step {#next}

Prepare your environment for the installation. See [HP Helion OpenStack&#174; Installation: Prerequisites](/helion/openstack/install/prereqs/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593;</a>

----


