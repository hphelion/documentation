---
layout: default
title: "HP Helion OpenStack&#174; Installation and Configuration"
permalink: /helion/openstack/ga/install/overview/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/helion/openstack/support-matrix/">&#9664; PREV</a> | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/install/prereqs/">NEXT &#9654;</a> </p>

# HP Helion OpenStack&#174; Installation Overview
This page provides an overview of the installation process

HP Helion OpenStack uses three linked installation phases to deploy a complete OpenStack cloud. <a href ="https://wiki.openstack.org/wiki/TripleO">TripleO</a> simulates the deployment of OpenStack by creating and configuring baremetal servers to successfully run a cloud deployment. 

* Seed: The seed VM is started as a VM from a specific seed VM image. It contains a number of self-contained OpenStack components that are used to deploy the undercloud. The seed deploys the undercloud by using Ironic baremetal driver to deploy a specific undercloud machine image.

* Undercloud: In a typical HP Helion OpenStack deployment, the undercloud is a baremetal server. The undercloud is a complete OpenStack installation, which is then used to deploy the overcloud.

* Overcloud: The overcloud is the end-user OpenStack cloud. In a typical HP Helion OpenStack deployment, the overcloud comprises several baremetal servers.

This rest of this page provides you with the following installation information:

* [Installation options](#installation-options)
* [About the installation process](#install-about)
* [Installation issues and troubleshooting](#install_issues)
* [Next Step](#next)
* [For more information](#info)

### Installation options {#installation-options}
With HP Helion OpenStack, you have two baremetal installation options depending on your system configuration.

* HP Helion OpenStack with a KVM hypervisor 

	HP Helion OpenStack supports KVM (Kernel-based Virtual Machine). With our KVM integration, you  can provision and manage an overcloud KVM cluster. One of these two add-ons is required for the [Volume Operations](/helion/openstack/ga/services/volume/overview/) service:

	- **Lightweight Directory Access Protocol integration:
	
		The HP Helion OpenStack Identity service can use Lightweight Directory Access Protocol (LDAP)to integrate your organization's existing directory service and user account management processes. LDAP intergration must be performed during the HP Helion OpenStack installation process.

	 	[Learn how to integrate LDAP](/helion/openstack/ga/install/ldap/) 

	- HP StoreVirtual VSA:
	
		[HP StoreVirtual VSA](http://www8.hp.com/us/en/products/data-storage/storevirtual-vsa.html) allows you to consolidate multiple storage nodes into pools of storage. The available capacity and performance is aggregated and made available to every volume in the cluster. 

	- HP 3PAR StoreServ

		HP 3PAR StoreServ is storage array (a physical device), which is integrated with HP Cloud OS to realize block storage of the cloud environment.

	[Learn how to to install and configure with a KVM hypervisor](/helion/openstack/install/kvm). 

* HP Helion OpenStack with a ESX hypervisor 

	HP Helion OpenStack supports VMWare ESX hypervisor. With our ESX integration, you can provision and manage an overcloud ESX cluster.

	- **Lightweight Directory Access Protocol integration:
	
		The HP Helion OpenStack Identity service can use Lightweight Directory Access Protocol (LDAP)to integrate your organization's existing directory service and user account management processes. LDAP intergration must be performed during the HP Helion OpenStack installation process.

	 	[Learn how to integrate LDAP](/helion/openstack/ga/install/ldap/) 

	- HP Virtual Cloud Networking (VCN) application support**

		HP Virtual Cloud Networking (VCN) application enables you to build a robust, multi-tenant networking infrastructure. Once deployed, the Open vSwitch vApp (OVSvApp) template enables networking between the tenant VMs provisioned on your ESX compute nodes.

	- HP Virtual Cloud Networking's Open vSwitch vApp (OVSvApp)
	
		The OVSvApp must be installed on each hypervisor in the HP Helion OpenStack environment to provision VMs in your VMware vCenter environment. 

	[Learn how to to install and configure with an ESX hypervisor](/helion/openstack/install/esx/).  

After installing HP Helion OpenStack, you have the option to install: 

- **HP Helion OpenStack DNS as a service (DNSaaS)**. Our managed DNS service, based on the Openstack Designate project, is engineered to help you create, publish, and manage your DNS zones and records securely and efficiently to either a public or private DNS server network.

	 [Learn how to install and configure HP Helion OpenStack DNSaaS](/helion/openstack/ga/install/dnsaas/) 


## About the installation process ## {#install-about}

The high-level process for installing HP Helion OpenStack involves the following:

1. Review the information in the [Support Matrix](/helion/openstack/ga/support-matrix/) and [Technical Overview](/helion/openstack/technical-overview/) for information on the hardware and software requirements and details.

2. Perform the necessary [Prerequisites](/helion/openstack/ga/install/prereqs)

3. Install with KVM or ESX hypervisor support:

	
	- [Install with KVM hypervisor support(/helion/openstack/ga/install/kvm/).

		Then, [configure HP StoreVirtual VSA for Block Storage](/helion/openstack/ga/install/vsa/) or [configure HP 3PAR StoreServ Storage](/helion/openstack/ga/install/3par/). 

	- [Install with ESX hypervisor support](/helion/openstack/ga/install/esx/).

		Then, [deploy the compute proxy on the ESX hosts](/helion/openstack/ga/install/esx/proxy/) and [deploy OVSvApp for HP Virtual Cloud Networking](/helion/openstack/ga/install/ovsvapp/).

4. Optionally, [install and configure DNSaaS support](/helion/openstack/ga/install/dnsaas/).

There are a few things you should be aware of before you begin your HP Helion OpenStack baremetal installation.

* Loading images is slow, so be patient.

* The seed must remain booted while the undercloud and overcloud are up.

* The `stackrc` and `tripleo_*_passwords` files contain credentials for the undercloud and the overcloud; you should ensure that they are securely stored separately from the seed.
 
    `/root/stackrc`

    `/root/tripleo/tripleo_*_passwords`

## Next Steps ## {#next}

Review the [HP Helion OpenStack Support Matrix](/helion/openstack/ga/support-matrix/) and [HP Helion OpenStack&#174; Technical Overview](/helion/openstack/ga/technical-overview/).

Prepare your environment for the installation, see [HP Helion OpenStack&#174; Installation: Prerequisites](/helion/openstack/ga/install/prereqs/).



## For more information ## {#info}

For more information on HP Helion OpenStack Community, see:

* [FAQ](/helion/openstack/ga/faq/) 
* [Release notes](/helion/openstack/ga/release-notes/) 

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
