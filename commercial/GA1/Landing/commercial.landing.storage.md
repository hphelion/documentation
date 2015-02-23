---
layout: default
title: "HP Helion OpenStack&#174; Using HP Helion OpenStack"
permalink: /helion/openstack/landing/storage/
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

You can use your KVM cloud with either HP Storevirtual or HP StoreServ (3PAR) storage:

###  HP StoreVirtual VSA storage 

[Cinder Block Storage Using HP StoreVirtual VSA](/helion/openstack/install/vsa/overview/)
<br>HP StoreVirtual VSA Software is a Virtual Storage Appliance for the Linux KVM environment.
<hr>

###  HP StoreServ (3PAR) storage 

[HP StoreServ (3PAR) Support](/helion/openstack/install/3par/)
<br>HP 3PAR StoreServ is a storage array that supports Fibre Channel (FC) as well as iSCSI protocol.
<hr>

### Swift Scale-Out cluster 

[Scale-out Swift](/helion/openstack/services/object/overview/scale-out-swift/)
<br>An optional Swift Scale-Out cluster instance of between two and twelve servers that is used for production cloud Object storage use.
<hr>

## ESX Hypervisor {#esx-hypervisor}

[Deploy vCenter ESX compute proxy](/helion/openstack/install/esx/proxy/)
<br>HP Helion OpenStack supports VMWare ESX hypervisor to provision and manage an overcloud ESX cluster. 