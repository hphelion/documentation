---
layout: default
title: "HP Helion OpenStack&#174; Installation and Configuration"
permalink: /helion/openstack/install/overview/test/
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
<p style="font-size: small;"> <a href="/helion/openstack/support-matrix/">&#9664; PREV</a> | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/install/prereqs/">NEXT &#9654;</a> </p>
-->

# HP Helion OpenStack&#174; Installation Overview 

This document describes the installation process for HP Helion OpenStack 1.1. 

**What you will install**

HP Helion OpenStack is designed to deliver an open source OpenStack solution at the modest scale. A baremetal multi-node deployment consists of a minimum of 8 baremetal servers, to which you can add up to 100 Compute nodes:

* 1 seed cloud host (installer system)
* 1 undercloud server
* 3 overcloud controllers
* 2 overcloud Swift nodes
* At least 1 overcloud Compute node 

After the installation, you can add additional block storage nodes (not required if 3Par is being used for block storage) and configure your network securely.

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



## The Installation Process

This section introduces the overall process you will follow to install HP Helion OpenStack. Information or links to information will be provided at the time it is needed.

**Before You Start**

1. Review the information in the Support Matrix and Technical Overview documents for details about hardware and software requirements.

2. Verify that the necessary prerequisites have been performed.

**Perform the Installation**

You can install with either KVM or ESX hypervisor support.
	
* For KVM hypervisor support, after installing you will configure HP StoreVirtual VSA for Block Storage or configure HP 3PAR StoreServ Storage. 

* For ESX hypervisor support, after installing you will deploy the compute proxy on the ESX hosts and deploy OVSvApp for HP Virtual Cloud Networking.

Optionally, you can install and configure DNSaaS support.

Make sure you are aware of the environment you are installing into and use the correct install path.

## Keep in mind ##

There are a few things you should be aware of before you begin your HP Helion OpenStack baremetal installation.

* Loading images is slow, so be patient.

* The seed VM must remain booted while the undercloud and overcloud are up.

* The `stackrc` and `tripleo_*_passwords` files contain credentials for the undercloud and the overcloud; you should ensure that they are securely stored separately from the seed.
 
    `/root/stackrc`

    `/root/tripleo/tripleo_*_passwords`

* The installation will create two initial Object Storage nodes. If you need additional Object Storage nodes, you must create them manually after installation. 


**Important:** When installing HP Helion OpenStack, it is your responsibility to track the physical location (slot number and rack) and associated identifiers (such as MAC addresses) for each physical server to aid in future hardware maintenance. This is necessary because when HP Helion OpenStack is installed on physical servers, the TripleO automation tracks only the MAC network addresses of servers; the physical locations of servers are not tracked. This means there is no automated way to inform a service technician which slot or rack to go to when service is needed on a particular physical server. 

## First Step ##

Before you start, make sure your environment meets the hardware and software requirements. See the [HP Helion OpenStack Support Matrix](/helion/openstack/support-matrix/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
