---
layout: default
title: "HP Helion OpenStack&#174;: Technical Overview"
permalink: /helion/openstack/technical-overview/
product: commercial

---
<!--PUBLISHED-->
<p style="font-size: small;"> <a href="/helion/openstack/faq/">&#9664; PREV</a> | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/services/overview/">NEXT &#9654;</a> </p>

# HP Helion OpenStack&#174; Technical Overview

Welcome! This technical overview introduces you to HP Helion OpenStack, an open and extensible enterprise-grade cloud technology. 

HP Helion OpenStack is OpenStack technology coupled with a version of Linux&#174; provided by HP. It is  designed to offer a number of value-added services that complement and enhance  the OpenStack platform and set up a cloud. It supports up to 30 physical nodes in total and 40 VMs per node.

* [Reference architecture](#ref-arch)
	* [Deployment model](#Deploy)
	* [Configuration](#Config) 
* [Physical network architecture](#physicalnetarch)
* [HP Helion OpenStack services](#Helion-services)
* [Installation and configuration](#install-configure)

##Reference architecture {#ref-arch}

###Deployment model {#Deploy} 

OpenStack on OpenStack, or TripleO, is the official OpenStack project for deployment of OpenStack systems. It builds on the core resource provisioning strengths of OpenStack technology. It enables you to administer your cloud, and deploy and maintain baremetal installations of OpenStack technology using the same APIs you are familiar with for deploying workloads on an OpenStack cloud. A template-based deployment engine (using OpenStack Heat) allows for rigorous testing and reliable, repeatable deployments of known configurations.

####TripleO 

A TripleO installation includes a Seed, the Undercloud and the Overcloud.

<table style="text-align: left; vertical-align: top; width:700px;">
<tr style="background-color: white; color: black;">
	<td><b>Seed VM</b></td>
	<td>The Seed VM is a bootable image provided as part of HP Helion OpenStack and is deployed in a VM instance. This image contains the minimum services required of OpenStack cloud to function and to be able to provision physical hardware to deploy the Undercloud. The services are Nova, Neutron, Glance, Keystone, Ironic & Heat.</td>
</tr>
<tr style="background-color: white; color: black;">
	 <td><b>Undercloud</b></td>
	 <td>The Undercloud server is a basic, single-node OpenStack installation running on a single physical server used to deploy, test, manage, and update the Overcloud servers. There is no HA configuration for the Undercloud. It contains a strictly limited sub-set of OpenStack technology, just enough to interact with the overcloud. The services running on the undercloud are Nova, Neutron, Glance, Keystone, Ironic, Heat, and Ceilometer. This server also contains HP Helion OpenStack content distribution catalog  service, which provides a mechanism to download and install content and updates for the overcloud.<br><br>
	 The undercloud also hosts images for various server types, which forms the functional cloud environment&#151;overcloud. These images are Overcloud Controller, Overcloud Compute, Overcloud Swift & Overcloud Compute Proxy (required for cloud, which supports VMWare ESX as a hypervisor).
</td>
 </tr>
<tr style="background-color: white; color: black;">
 	<td style><b>Overcloud<b></td>
 	<td>The overcloud is the functional cloud available to end users for running guest virtual machines and workloads. It offers access to Nova, Neutron, Glance, Keystone, Cinder, Swift, Ironic, Heat, Horizon, and Ceilometer services.</td>
</tr>
</table>

**Note:** You cannot build or rebuild the images. Direct editing of the Heat templates is possible, but not supported. Configuration is limited to those items supported by the configuration tool and Horizon.

####Configuration {#Config}

* 1 server to host the Seed VM
* 1 undercloud server
* 4 overcloud nodes (One Controller node and three Compute nodes) 
* 2 Swift object servers

The maximum supported configuration is 36 servers consisting of 30 Compute servers and five configuration and management servers. 

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593;</a>

##Physical network architecture {#physicalnetarch}

The following information describes the physical network configuration, which must be configured by users.

####Networks

<table>
<tr style="background-color: #C8C8C8;">
    <th>Network</th>
    <th>Description</th>
    <th>VLAN type</th>
    <th>Server port</th>
  </tr>
<tr style="background-color: white; color: black;">
    <td><b>IPMI/iLO</b></td>
    <td>Base IPMI network used to boot and manage physical servers</td>
    <td>untagged</td>
    <td>IPMI/iLO</td>
<tr style="background-color: white; color: black;">
    <td><b>Undercloud<br>management</b></td>
    <td>Traffic for Undercloud internal OpenStack calls, Glance image downloads, etc.  Also provides access to Undercloud API endpoints.</td>
    <td>untagged</td>
    <td>eth0 or<br>bond0<br>(PXE boot for overcloud servers)</td>
  </tr>
<tr style="background-color: white; color: black;">
    <td><b>Overcloud<br>management</b></td>
    <td>Traffic for Overcloud internal OpenStack calls, Glance image downloads, etc.  </td>
    <td>untagged</td>
    <td>eth0 or<br>bond0</td>
  </tr>
 <tr style="background-color: white; color: black;">
    <td><b>SDN</b></td>
    <td>Network between workload VMs, for example, carries VxLAN traffic.</td>
    <td>untagged</td>
    <td>eth0 or<br>bond0</td>
  </tr>
<tr style="background-color: white; color: black;">
    <td><b>Storage</b></td>
    <td>iSCSi traffic between VMs and Storage products like StoreVirtual.</td>
    <td>untagged</td>
    <td>eth0 or<br>bond0</td>
  </tr>
<tr style="background-color: white; color: black;">
    <td><b>External</b></td>
    <td>Connected to Internet or Intranet. Floating IPs come from here. </td>
    <td>tagged</td>
    <td>eth0 or<br>bond0</td>
  </tr>
<tr style="background-color: white; color: black;">
    <td><b>External API</b></td>
    <td>Connected to Internet or Intranet, provides access to Overcloud API endpoints. </td>
    <td>tagged</td>
    <td>eth0 or<br>bond0</td>
  </tr>
<tr style="background-color: white; color: black;">
    <td><b>Swift</b></td>
    <td>Communication between Swift servers (includes user data).</td>
    <td>untagged</td>
    <td>eth0 or<br>bond0</td>
  </tr>
</table>

#### Network planning

The physical machines need to have their management processors (iLO) connected to a network that is reachable from the Seed VM. The physical machines and the Seed VM need to be connected to a fast network. 

We recommend using one physical Ethernet port on a 10GB network. Use an untagged VLAN for this network. 

The Seed VM is expected to use eth0 to connect to the cluster network (and hence through to the management network). If your host uses another NIC, for example eth1, then you need to set the environment variable appropriately, for example BRIDGE_INTERFACE=eth1, as seen by root.

####Network fabric 
* Two physical links, one for IPMI/iLO and one for the hypervisor/OS
* Network switches capable of basic VLAN, L2 and L3 functions (there is no dependency on VxLAN-capable or OpenFlow-enabled switch, although the product supports VxLAN as the virtual/overlay network)

The physical cluster network can be shared by a number of logical networks, each with its own tagged VLAN and IP subnet. We recommend using at least one such network as the external network, with floating IPs coming from its subnet range. 

[Learn more](/helion/openstack/support-matrix-beta/#physical-network-architecture) about HP Helion OpenStack physical network architecture. 

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


##HP Helion OpenStack Services {#Helion-services}

The following table briefly describes the core HP Helion OpenStack services. For a complete description of these services, see the [Services Overview](/helion/openstack/services/overview/) page.


<table style="text-align: left; vertical-align: top; width:700px;">
<tr style="background-color: #C8C8C8;">
	<th>Service</th>
	<th><center>Description</center></th>
    <th><center>Seed</center></th>
	<th><center>Undercloud</center></th>
	<th><center>Overcloud</center></th>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Identity Operations (Keystone)</b></td>
	<td>HP Identity Operations, based on OpenStack Keystone, enables you to create and configure projects/tenants and users, and set credentials, and issue security tokens.<br><br>
	<a href="/helion/openstack/services/identity/overview">Learn more</a> about Identity Operations.</td>
	<td><center>X</center></td>
	<td><center>X</center></td>
	<td><center>X</center></td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Compute Operations (Nova)</b></td>
	<td>HP Compute Operation services, based on OpenStack Nova, provides a way to instantiate virtual servers on publicly accessible physical machines. Some of the tasks you can perform as a user are creating and working with virtual machines, attaching storage volumes, working with security groups and key pairs, and associating floating IP addresses.<br><br>
	As an administrator, you can also configure server flavors, modify project quotas, configure availability zones, enable and disable services, and work with virtual machines.<br><br>
	<a href="/helion/openstack/services/compute/overview/">Learn more</a> about Compute Operations.</td>
    <td><center>X</center></td>
	<td><center>X</center></td>
	<td><center>X</center></td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Network Operations (Neutron)<b></td>
	<td>HP Network Operation services, based on OpenStack Neutron, provides network connectivity and IP addressing for HP compute devices.<br><br> 
	Some of the tasks you can perform as a user are configuring networks and routers, adding and removing subnets, create a router, associate floating IP addresses, configuring security groups, and working with load balancers and firewalls.<br><br>As an administrator, you can also create an external network, and work with DHCP agents and L3 agents.<br><br>
	<a href="/helion/openstack/services/networking/overview/">Learn more</a> about Network Operations.</td>
	<td><center>X</center></td>
	<td><center>X</center></td>
	<td><center>X</center></td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Image Operations (Glance)</b></td>
	<td>HP Image Operations services, based on OpenStack Glance, helps you manage virtual machine images, including querying and updating image metadata, and retrieval of the actual image data.
	<br><br>
    As a user, you can create, modify and delete images, but only private images. As an administrator, you can also create, modify and delete public images and private images.
    <br><br>
	<a href="/helion/openstack/services/imaging/overview/">Learn more</a> about Image Operations.</td>
	<td><center>X</center></td>
	<td><center>X</center></td>
	<td><center>X</center></td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Volume operations (Cinder)</b></td>
	<td>HP Volume Operations services (or Block Storage), based on OpenStack Cinder, helps you perform various tasks with your storage volumes, including creating a volume, creating volume snapshots, and configuring a volume.<br><br>
	As an administrator, you can also modify project quotas, enable services, create encryption types, create volume types and associate quality of service with volume types.
	<br><br><a href="/helion/openstack/services/volume/overview/">Learn more </a> about Volume Operations.</td>
	<td><center> </center></td>
	<td><center> </center></td>
	<td><center>X</center></td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Object Operations (Swift)</b></td>
	<td>HP Object Operations service, based on OpenStack Swift, provides you with a way to store and retrieve objects in publicly accessible physical machines. You can configure storage containers, upload and download container files, and delete container files.<br><br>
	<a href="/helion/openstack/services/object/overview/">Learn more</a> about Object Operations.</td>
	<td><center> </center></td>
	<td><center> </center></td>
	<td><center>X</center></td>
 </tr>
<tr style="background-color: white; color: black;">
	<td><b>Orchestration (Heat)</b></td>
 	<td>HP Orchestration service, based on OpenStack Heat, enables you to coordinate multiple composite cloud applications using template formats. It enables you to work with nested stacks, which are a mechanism of using built-in stack definitions for specific resource types.<br><br>
	As users, you can create stacks, suspend and resume stacks, view information on stacks, view information on events, work with stack templates and infrastructure resources (such as servers, floating ips, volumes and security groups).<br><br>
	<a href="/helion/openstack/services/orchestration/overview/">Learn more</a> Orchestration services.</td> 
	<td><center>X</center></td>
	<td><center>X</center></td>
	<td><center>X</center></td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Telemetry and Reporting (Ceilometer)</b></td>
 	<td>The Telemetry service provides access to metering data collected from the compute, network, and storage services.  This information can be stored in the default MySQL database or in an optional HP Vertica system for advanced analytics.  Information from this service can be used for both operational and user monitoring and external billing use cases.<br><br>
	<a href="/helion/openstack/services/reporting/overview/">Learn more</a> about OpenStack Ceilometer based HP Telemetry and Reporting services.</td> 
	<td><center></center></td>
	<td><center>X</center></td>
	<td><center>X</center></td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Sherpa</b></td>
 	<td>HP Helion content distribution catalog service provides a mechanism to download and install content and updates for the Overcloud.
	</td> 
	<td><center></center></td>
	<td><center>X</center></td>
	<td><center>X</center></td>
</tr>
</table>


The following table briefly describes the additional services in HP Helion OpenStack.

<table style="text-align: left; vertical-align: top; width:700px;">
<tr style="background-color: #C8C8C8;">
	<th>Service</th>
	<th><center>Functionality</center></th>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Hypervisors</b></td>
	<td><b>Baremetal:</b><br> 
	This is not a hypervisor in the traditional sense, but this driver provisions physical hardware through pluggable sub-drivers. 
	</td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Logging</b></td>
	<td>A number of log files are available to track the status of your deployment.</b><br>
    </td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Monitoring</b></td>
	<td> 
	Two types of monitoring are available: <br><br>
	- Watching for problems: ensures that all services are up and running, creating a functional cloud.<br>
	- Watching usage trends: involves monitoring resource usage over time in order to make informed decisions about potential bottlenecks and upgrades.
	</td>
</tr>
</table>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Installation and configuration ## {#install-configure}

###KVM Hypervisor with HP StoreVirtual VSA support

Kernel-based Virtual Machine is a virtualization infrastructure for the Linux kernel, which turns it into a hypervisor. KVM requires a processor with hardware virtualization extension.

<a href="javascript:window.open('/content/documentation/media/commercial_kvm_network_architecture.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack beta architecture diagram for KVM network architecture.</a>(opens in a new window) 

HP StoreVirtual VSA Software is a Virtual Storage Appliance that provides the complete array functionality on top of Linux KVM environment without external hardware. It eliminates the need for external shared storage required to implement Block Storage features. It uses scale-out, distributed clustering to provide a pool of storage with enterprise storage features and simple management at a reduced cost.

<a href="javascript:window.open('/content/documentation/media/reference-architecture-StoreVirtual-volume-type-mapping.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack beta architecture diagram for Store Virtual volume type mapping.</a> (opens in a new window)

###ESX Hypervisor with HP Virtual Cloud Networking (VCN) application support 

ESX integration in HP Helion OpenStack enables administrators to connect their cloud to an existing VMware vCenter installation. As part of this ESX Integration, VMware vCenter Compute driver is used. The VMware vCenter driver makes use of Compute proxy nodes to connect to ESX clusters in a vCenter.  A Nova scheduler sees each Compute Proxy as a large Compute node to use for scheduling new virtual machine instances.  

An ESX Proxy Compute driver talks to VMware vCenter server via VI SDK to manage all the cloud operations. Due to this, there is a need for capturing the vCenter server details in the Cloud Controller and a way for configuring the 'ESX Proxy Compute Node' to manage a list of Clusters from a vCenter Server. A new service sub component "eon" handles capturing vCenter Server details into Cloud controller and provides the details of the clusters for configuring the list of clusters to be managed by an ESX Proxy Compute node.

The ESX integration uses the OVSvApp application to connect the vCenter networking to the OpenStack Neutron network controller to manage workload networks.  

<a href="javascript:window.open('/content/documentation/media/commercial_esx_network_architecture.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack beta architecture diagram for ESX network architecture.</a>(opens in a new window)

The HP Virtual Cloud Networking (VCN) application is an enhanced networking (Neutron) module of HP Helion OpenStack that delivers network virtualization to orchestrate your data center infrastructure.

HP VCN enables you to build a robust, multi-tenant networking infrastructure that delivers ready-to-use compute, storage, and networking by providing;

* Scalable, secure, and hardened enterprise cloud networking
* Automated delivery of secure isolated networks in minutes
* Future support to an open SDN ecosystem and unified control and visibility for physical/virtual networks.  

###DNS as a service (DNSaaS) {#DNSaaS}

After installing HP Helion OpenStack, you have the option to install HP Helion OpenStack DNS as a service (DNSaaS) support. The HP Helion OpenStack DNS (Domain Name System) service, based on the Openstack Designate project, is a managed DNS service engineered to help you create, publish, and manage your DNS zones and records securely and efficiently to either a public or private DNS server network.

Currently, supported DNS servers and networks include: 

* PowerDNS

###Baremetal installation 

This baremetal installation is designed to deliver an open source OpenStack solution at modest scale. A baremetal multi-node deployment consists of a minimum of 5 baremetal servers, to which you can add **up to 30 Compute nodes**:

* 1 undercloud server
* 1 overcloud controller
* 2 overcloud Swift nodes 
* At least 1 overcloud Compute node 

[Learn more](/helion/openstack/install-beta-overview/) about installing and configuring HP Helion OpenStack beta. 
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593;</a>




