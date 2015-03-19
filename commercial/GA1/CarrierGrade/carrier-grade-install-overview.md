---
layout: default
title: "HP Helion OpenStack&#174; 1.1: Installation Overview"
permalink: /helion/openstack/carrier/install/overview/
product: commercial.ga
product-version1: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Michael B, 

---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/helion/openstack/1.1/">&#9650; HP Helion OpenStack Documentation Home</a> | <a href="/helion/openstack/1.1/support-matrix/">Support Matrix &#9654;</a> </p>


# HP Helion OpenStack&#174; 1.1: Installation Overview 
[See the Helion OpenStack 1.0 version of this page](/helion/openstack/install/overview/)

This document describes the installation process for HP Helion OpenStack 1.1. 

HP Helion OpenStack is designed to deliver an open source OpenStack solution at the modest scale. A baremetal multi-node deployment consists of a minimum of 8 baremetal servers, to which you can add up to 100 Compute nodes:

* 1 seed cloud host (installer system)
* 1 undercloud server
* 3 overcloud controllers
* 2 overcloud Swift nodes
* At least 1 overcloud Compute node 

After the installation, you can add additional block storage nodes and configure your network securely.

## Installation planning {#install-configure}

HP Helion OpenStack uses three linked installation phases, called [OpenStack-on-OpenStack (TripleO) deployment model](https://wiki.openstack.org/wiki/TripleO) to deploy a complete OpenStack cloud. 

TripleO is OpenStack's official project for deployment, configuration, and life cycle management of OpenStack clouds. A TripleO installation includes a seed, undercloud and overcloud:

<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: white; color: black;">
	<td><b>Seed VM</b></td>
	<td>The Seed cloud is deployed as a VM instance. This image contains minimal OpenStack services required to deploy and update the undercloud on a baremetal server.
</tr>
</td>
<tr style="background-color: white; color: black;">
	<td><b>Undercloud</b></td>
	<td>A single-server deployment of a limited set of OpenStack services, called the undercloud, is used to deploy, test, manage, and update all the overcloud servers. 
	<br /><br />The undercloud comprises the Compute, Ironic, Networking Operations, Object Operations, Identity Operations, and Orchestration services, which are used to deploy and configure various nodes of the overcloud on baremetal servers.<br /><br />The Centralized Logging and Monitoring components run in the undercloud and can be accessed using a Web Browser. <br /><br />The Sherpa, Eon and Sirius services also run in the undercloud, and can be accessed via panels in the Horizon Dashboard from the undercloud.
 </tr>
<tr style="background-color: white; color: black;">
  	<td style><b>Overcloud<b></td>
 	<td>The overcloud is the functional cloud available to end users for running guest virtual machines and workloads. The overcloud comprises OpenStack Cloud Services deployed on controller nodes, and a number of compute nodes and storage nodes. 
	<br /><br />The cloud services in the overcloud, used by end users, include Compute, Networking, Block Storage, Object Operations, Horizon, Image Operations, Identity Operations, and Orchestration
	<br /><br />For KVM based Hypervisor environments, the overcloud also comprises Nova Compute nodes running the KVM hypervisor, and Block Storage nodes running the StoreVirtual VSA.
<br />
</td>
</tr>
</table>

You can find more information on the seed, undercloud and overcloud in the [Technical Overview](/helion/openstack/1.1/technical-overview/).

You can find more information on available services in the [Services Overview](/helion/openstack/1.1/services/overview/).

## Installation options {#install-option}

HP Helion OpenStack is provided with two baremetal installation options depending on your system configuration.  It allows you to manage the KVM and ESX hypervisors and provision virtual machines. 
 
You can find more information on the hypervisor options in the Technical Overview.

### KVM Hypervisor {#kvm-Hypervisor}

Kernel-based Virtual Machine (KVM) is a virtualization infrastructure for the Linux kernel, which turns it into a hypervisor. KVM requires a processor with hardware virtualization extension.

You can use your KVM cloud with either HP Storevirtual or HP StoreServ (3PAR) storage:

####  With HP StoreVirtual VSA storage 

HP StoreVirtual VSA Software is a Virtual Storage Appliance that provides the complete array functionality on top of Linux KVM environment without external hardware. VSA eliminates the need for external shared storage required to implement Block Storage features. VSA uses scale-out, distributed clustering to provide a pool of storage with enterprise storage features and simple management at a reduced cost.

####  With HP StoreServ (3PAR) storage 

HP 3PAR StoreServ is a storage array that supports Fibre Channel (FC) as well as iSCSI protocol. HP 3PAR StoreServ is integrated into the plug-in architecture of the Volume Operation service using the HP 3PAR StoreServ block storage driver. 

### ESX Hypervisor {#esx-hypervisor}

HP Helion OpenStack supports VMWare ESX hypervisor. With our ESX integration, you can provision and manage an overcloud ESX cluster. VMWare vCenter Compute driver is used as a part of ESX integration. The VMware vCenter driver connects to ESX clusters in a vCenter through Compute proxy nodes. A Compute node scheduler sees each cluster as compute and uses the same for scheduling a new instances.

The ESX integration uses the OVSvApp application to connect the vCenter networking to the Network Operations controller to manage workload networks.  

The HP Virtual Cloud Networking (VCN) application is an enhanced Networking Operations (Neutron) module of HP Helion OpenStack that delivers network virtualization to orchestrate your data center infrastructure.

## The Installation Process

This section introduces the overall process you will follow to install HP Helion OpenStack. Information or links to information will be provided at the time it is needed.

You install HP Helion OpenStack by first installing the seed cloud by running a single command. The host system for the seed cloud is called the seed cloud host. 

After installing the seed, launch a console session to the seed cloud host and execute a single command to install the undercloud and overcloud, with all the appropriate nodes.

You configure the undercloud and overcloud before installing using a series of text files that contain environment variables and size definition for the servers you are using for installation.

**Before You Start**

The key to a smooth installation of HP Helion OpenStack is planning. 

Before you start, there are a number of prerequisite steps you must perform. 

These requirements are detailed in the next step of the installation.

1. Review the information in the Support Matrix and Technical Overview documents for details about hardware and software requirements.

2. Verify that the necessary prerequisites have been performed.

**Perform the Installation**

You can install with either KVM or ESX hypervisor support.
	
Make sure you are aware of the environment you are installing into and use the correct install path.

**Perform post installation configuration**

After HP Helion OpenStack is installed and you have verified that the undercloud and overcloud nodes are up and running, there are a number of configurations that you need to consider, including incorporating DNS as a Service (DNSaaS), storage methods, and other considerations based on your environment.

* For KVM hypervisor support, after installing you will configure HP StoreVirtual VSA for Block Storage or configure HP 3PAR StoreServ Storage. 

* For ESX hypervisor support, after installing you will deploy the compute proxy on the ESX hosts and deploy OVSvApp for HP Virtual Cloud Networking.

* Optionally, you can install and configure DNSaaS support.

These options are detailed after you finish the installation.


## Keep in mind ##

There are a few things you should be aware of before you begin your HP Helion OpenStack baremetal installation.

* Loading images is slow, so be patient.

* The seed VM must remain booted while the undercloud and overcloud are up.

* The `stackrc` and `tripleo_*_passwords` files contain credentials for the undercloud and the overcloud; you should ensure that they are securely stored separately from the seed.
 
    `/root/stackrc`

    `/root/tripleo/tripleo_*_passwords`

* Check if there is a reference about SSL certificates and locations. Append to the end of this reference details about certificates and their location 
 `/usr/local/share/ca-certificates/ephemeralca-cacert.crt`

* The installation will create two initial Object Storage nodes. If you need additional Object Storage nodes, you must create them manually after installation. 

* All the Helion servers use UTC as a time zone.

* For some known issues that you might encounter during the installation, see [Troubleshooting the Installation](/helion/openstack/1.1/services/troubleshooting/install/).

**Important:** When installing HP Helion OpenStack, it is your responsibility to track the physical location (slot number and rack) and associated identifiers (such as MAC addresses) for each physical server to aid in future hardware maintenance. This is necessary because when HP Helion OpenStack is installed on physical servers, the TripleO automation tracks only the MAC network addresses of servers; the physical locations of servers are not tracked. This means there is no automated way to inform a service technician which slot or rack to go to when service is needed on a particular physical server. 

## First Step ##

Before you start, make sure your environment meets the hardware and software requirements. See the [Support Matrix](/helion/openstack/1.1/support-matrix/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
