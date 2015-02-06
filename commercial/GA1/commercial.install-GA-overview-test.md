---
layout: default
title: "HP Helion OpenStack&#174; Installation and Configuration"
permalink: /helion/openstack/install/overview/test
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

The HP Helion OpenStack installation follows the standard [TripleO deployment model](/helion/openstack/services/tripleo/overview/), creating a seed, an undercloud and an overcloud.

* **Seed**: The seed VM is started as a VM from a specific seed VM image. It contains a number of self-contained OpenStack components that are used to deploy the undercloud. The seed deploys the undercloud by using Ironic baremetal driver to deploy a specific undercloud machine image.

* **Undercloud**: In a typical HP Helion OpenStack deployment, the undercloud is a baremetal server. The undercloud is a complete OpenStack installation, which is then used to deploy the overcloud.

* **Overcloud**: The overcloud is the end-user OpenStack cloud. In a typical HP Helion OpenStack deployment, the overcloud comprises several baremetal servers.

For more details on the seed, an undercloud and an overcloud, see the [Installation Planning section](/helion/openstack/technical-overview/#install-configure) in the Technical Overview.

HP Helion OpenStack is designed to deliver an open source OpenStack solution at the modest scale. A baremetal multi-node deployment consists of a minimum of 8 baremetal servers, to which you can add up to 100 Compute nodes:

* 1 seed cloud host (installer system)
* 1 undercloud server
* 3 overcloud controllers
* 2 overcloud Swift nodes
* At least 1 overcloud Compute node 

After the installation, you can add additional block storage nodes (not required if 3Par is being used for block storage) and configure your network securely.

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
