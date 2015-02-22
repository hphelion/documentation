---
layout: default
title: "HP Helion OpenStack&#174; Using HP Helion OpenStack"
permalink: /helion/openstack/storage/
product: commercial.test
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: All

authors: Micael B

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/openstack/3rd-party-license-agreements/">&#9664; PREV</a> | <a href="/helion/openstack/">&#9650; UP</a> | NEXT &#9654; </p>
-->

# HP Helion OpenStack&#174;: Storage Options

HP Helion OpenStack is provided with two baremetal installation options depending on your system configuration. It allows you to manage the KVM and ESX hypervisors and provision virtual ymachines.

## KVM Hypervisor {#kvm-Hypervisor}

Kernel-based Virtual Machine (KVM) is a virtualization infrastructure for the Linux kernel, which turns it into a hypervisor. KVM requires a processor with hardware virtualization extension.

You can use your KVM cloud with either HP Storevirtual or HP StoreServ (3PAR) storage:

###  With HP StoreVirtual VSA storage 

HP StoreVirtual VSA Software is a Virtual Storage Appliance that provides the complete array functionality on top of Linux KVM environment without external hardware. VSA eliminates the need for external shared storage required to implement Block Storage features. VSA uses scale-out, distributed clustering to provide a pool of storage with enterprise storage features and simple management at a reduced cost.

For more information, see [Cinder Block Storage Using HP StoreVirtual VSA](/helion/openstack/install/vsa/overview/).

###  With HP StoreServ (3PAR) storage 

HP 3PAR StoreServ is a storage array that supports Fibre Channel (FC) as well as iSCSI protocol. HP 3PAR StoreServ is integrated into the plug-in architecture of the Volume Operation service using the HP 3PAR StoreServ block storage driver. 

For information, see [HP StoreServ (3PAR) Support](/helion/openstack/install/3par/).

### Swift Scale-Out cluster 

An optional Swift Scale-Out cluster instance of between two and twelve servers that is used for production cloud Object storage use (Scale-Out Swift extends the Starter Swift Cluster enabling greater capacity while maintaining any initial data present in Starter Swift).

For instructions, see the [Scale-out Swift](/helion/openstack/services/object/overview/scale-out-swift/) document.

## ESX Hypervisor {#esx-hypervisor}

HP Helion OpenStack supports VMWare ESX hypervisor. With our ESX integration, you can provision and manage an overcloud ESX cluster. VMWare vCenter Compute driver is used as a part of ESX integration. The VMware vCenter driver connects to ESX clusters in a vCenter through Compute proxy nodes. A Compute node scheduler sees each cluster as compute and uses the same for scheduling a new instances.

For more information, see [Deploy vCenter ESX compute proxy](/helion/openstack/install/esx/proxy/).