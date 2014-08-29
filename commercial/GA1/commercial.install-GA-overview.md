---
layout: default
title: "HP Helion OpenStack&#174; Installation and Configuration"
permalink: /helion/openstack/ga/install/overview/
product: commercial

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/helion/openstack/support-matrix/">&#9664; PREV</a> | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/install/prereqs/">NEXT &#9654;</a> </p>

# HP Helion OpenStack&#174; Installation and Configuration
This page provides an overview of the installation process and requirements for  HP Helion OpenStack &mdash; a baremetal multi-node deployment consisting of a minimum of 9 baremetal servers, to which you can add **up to 100 Compute nodes**:


* 1 seed host (installer system)
* 1 undercloud server
* 3 overcloud controllers
* 2 overcloud Swift nodes
* At leat 1 block storage node 
* At least 1 overcloud Compute node 

HP Helion OpenStack uses three linked installation phases to deploy a complete OpenStack cloud. <a href ="https://wiki.openstack.org/wiki/TripleO">TripleO</a> simulates the deployment of OpenStack by creating and configuring baremetal servers to successfully run a cloud deployment. 

* Seed: The seed VM is started as a VM from a specific seed VM image. It contains a number of self-contained OpenStack components that are used to deploy the undercloud. The seed deploys the undercloud by using Ironic baremetal driver to deploy a specific undercloud machine image.

* Undercloud: In a typical HP Helion OpenStack deployment, the undercloud is a baremetal server. The undercloud is a complete OpenStack installation, which is then used to deploy the overcloud.

* Overcloud: The overcloud is the end-user OpenStack cloud. In a typical HP Helion OpenStack deployment, the overcloud comprises several baremetal servers.

This rest of this page provides you with the following installation information:

* [Installation options](#installation-options)
* [For more information](#for-more-information)

### Installation options
With HP Helion OpenStack, you have two baremetal installation options depending on your system configuration.

* **KVM hypervisor with HP StoreVirtual VSA support**

    HP Helion OpenStack supports KVM hypervisor. With our KVM integration, you  can provision and manage an overcloud KVM cluster

    HP StoreVirtual VSA allows you to consolidate multiple storage nodes into pools of storage. The available capacity and performance is aggregated and made available to every volume in the cluster. 

    [Learn how to to install and configure with a KVM hypervisor](/helion/openstack/install/kvm). 

* **ESX hypervisor with HP Virtual Cloud Networking (VCN) application support**

    HP Helion OpenStack supports VMWare ESX hypervisor. With our ESX integration, you can provision and manage an overcloud ESX cluster.

    HP Virtual Cloud Networking (VCN) application enables you to build a robust, multi-tenant networking infrastructure. Once deployed, the Open vSwitch vApp template enables networking between the tenant VMs provisioned on your ESX compute nodes.

    [Learn how to to install and configure with an ESX hypervisor](/helion/openstack/install/esx/).  

After installing HP Helion OpenStack, you have the option to install HP Helion OpenStack DNS as a service (DNSaaS) support. No matter what hypervisor you use, our managed DNS service, based on the Openstack Designate project, is engineered to help you create, publish, and manage your DNS zones and records securely and efficiently to either a public or private DNS server network.

## For more information

For more information on HP Helion OpenStack Community, see:

* [Before you begin](/helion/openstack/install/prereqs/) 
* [Support matrix](/helion/openstack/support-matrix/) 
* [FAQ](/helion/openstack/faq/) 
* [Release notes](/helion/openstack/release-notes/) 


## Next Step



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
