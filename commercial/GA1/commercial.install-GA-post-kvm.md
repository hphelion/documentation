---
layout: default
title: "HP Helion OpenStack&#174; Installation Prerequisites"
permalink: /helion/openstack/install/post-kvm/
product: commercial.ga
product-version1: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Michael B, 
---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/helion/openstack/install/kvm"> &#9664; Installing on a KVM hypervisor </a> | <a href="/helion/openstack/install/overview/">&#9650; Installation Overview</a> | </p> 


# HP Helion OpenStack&#174;: Post-Installation for KVM Hypervisor

After you have completed and verified the HP Helion OpenStack installation, perform the following tasks as appropriate.

## Configure HP Helion OpenStack tenant networks to use VLAN Provider Network. 

HP Helion OpenStack defaults to VxLAN to support tenant network isolation in a KVM Cloud Type. You can configure VLAN on HP Helion OpenStack to enable communication with tenant's virtual machines hosted in a legacy infrastructure and/or based on VMWare ESX.

For instructions, see [Enabling VLAN Provider Network in HP Helion OpenStack](/helion/openstack/vlan/provider/network/).


## Configure Block Storage by either deploying VSA or using HP 3Par Array

Use one of the following methods to add block storage to your HP Helion OpenStack cloud:

* Configure HP StoreVirtual VSA

	HP StoreVirtual VSA Software is a Virtual Storage Appliance that provides the complete array functionality on top of Linux KVM environment without an external array hardware. It eliminates the need for external shared storage required to implement block storage features. It uses scale-out, distributed clustering to provide a pool of storage with enterprise storage features and simple management.

	For instructions, see the [Configuring HP StoreVirtual VSA for Block Storage](/helion/openstack/install/vsa/overview) document. 

* Configure an HP 3Par storage array

	An optional HP 3Par storage array that can be used to provide high performance Cinder block storage 

	For instructions, see the [HP Helion OpenStack&#174;: HP StoreServ (3PAR) Support](/helion/openstack/install/3par/) document.


## Configure a Swift Scale-Out cluster **(Optional)**

An optional Swift Scale-Out cluster instance of between two and twelve servers that is used for production cloud Object storage use (Scale-Out Swift extends the Starter Swift Cluster enabling greater capacity while maintaining any initial data present in Starter Swift).

For instructions, see the [Scale-out Swift](/helion/openstack/services/object/overview/scale-out-swift/) document. 


## Install DNS as a service (DNSaaS) **(Optional)**.

If you have not installed DNSaaS, see [DNSaaS Installation and Configuration](/helion/openstack/install/dnsaas/).

DNSaaS is our managed DNS service, based on the OpenStack Designate project, is engineered to help you create, publish, and manage your DNS zones and records securely and efficiently to either a public or private DNS server network.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---
