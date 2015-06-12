---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Administrators Guide"
permalink: /helion/openstack/carrier/admin/old/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: All

authors: Paul F

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/openstack/1.1/3rd-party-license-agreements/">&#9664; PREV</a> | <a href="/helion/openstack/1.1/">&#9650; UP</a> | NEXT &#9654; </p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): Administrators Guide 

Use the following links for information on administrative tasks you can perform for the HP Helion OpenStack Carrier Grade:

## Managing Your HP Helion OpenStack Carrier Grade Cloud

For information on the day-to-day administrative tasks you can perform in the HP Helion OpenStack Carrier Grade, see [Managing Your Cloud](/helion/commercial/carrier/dashboard/managing/).


## Configure Block Storage by either deploying VSA or using HP 3Par Array
	
Use one of the following methods to add block storage to your HP Helion OpenStack cloud:

* Configure HP StoreVirtual VSA

	HP StoreVirtual VSA Software is a Virtual Storage Appliance that provides the complete array functionality on top of Linux KVM environment without an external array hardware.

	For instructions, see the Configuring HP StoreVirtual VSA for Block Storage document.

* Configure an HP 3Par storage array

	An optional HP 3Par storage array that can be used to provide high performance Cinder block storage 

	For instructions, see the HP StoreServ (3PAR) Support document.

## Configure a Swift Scale-Out cluster

An optional Swift Scale-Out cluster instance of between two and twelve servers that is used for production cloud Object storage use (Scale-Out Swift extends the Starter Swift Cluster enabling greater capacity while maintaining any initial data present in Starter Swift).

HP Helion OpenStack Carrier Grade includes integral, built-in support for Scale-out Object Storage (Swift) to the cloud. The HP Helion OpenStack Carrier Grade cloud deployment includes automatic creation of a Swift cluster and starter nodes. It also enables SSL automatically to secure the data transmission.

For more information, see [Object Storage (Swift) Service Overview](/helion/openstack/carrier/services/object/overview/scale-out-swift/).

## Migrating Virtual Machines

Live migration occurs when a virtual machine is transferred to execute on a different compute node with minimal disruption of the guest applications. This can happen automatically, or upon request by the system administrator.

There are two migration methods:

* Cold migration. During a cold migration, the instance is shut down for a period of time to be moved to another hypervisor. For specific steps, see [Cold Migrate an Instance](/helion/commercial/carrier/dashboard/managing/instances/migrate/cold/).

* Live migration. During a live migration, the instance is kept running during the migration, requiring almost no downtime. For specific steps, see [Live Migration of Virtual Machines](/helion/commercial/carrier/dashboard/managing/instances/migrate/live/).

	For more information on live migration, see [Live Migration of Virtual Machines](/helion/commercial/carrier/dashboard/managing/instances/live/migrate/).



## Scaling Virtual Machine Resources

You can scale the resources of individual instances up or down. Currently, the CPU resources for an instance are scalable.

For more information, see [Scaling Virtual Machine Resources](/helion/commercial/carrier/dashboard/managing/instances/scaling/).

## Virtual Machines and Carrier-Grade Availability

The Wind River Linux servers in HP Helion OpenStack Carrier Grade provide a health monitoring mechanism that can be used to implement and support the deployment of guest applications in Carrier-Grade High Availability (HA) mode.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

For more information, see [Virtual Machines and Carrier-Grade Availability](/helion/openstack/carrier/admin/carrier-grade-avail/).

## Managing Stacks

You can create and manage collections of resources, or services (also known as stacks), using the Orchestration (Heat) service. 

With Orchestration, you can define a service configuration in a template file, and then apply the template to create or modify the service resources and connections.

The Orchestration layer includes life-cycle management features to simplify the addition, modification, and deletion of services.

The Wind River Linux servers include extensions for enhanced scope and reliability.

For more information, see [ Using Stacks, Templates, and Parameters](/helion/openstack/carrier/admin/stacks/).


<!-- Hide for alpha
- [Troubleshooting](/helion/openstack/carrier/services/troubleshooting/)

## Administering the HP Helion OpenStack Carrier Grade using Helion Lifecycle Management

Using HLM, you can install and upgrade HP Helion OpenStack Carrier Grade and do....

For information on the administrative tasks you can perform using HLM, see [Using Helion Lifecycle Management](/helion/openstack/carrier/admin/hlm/).

## Administering HP Helion OpenStack Carrier Grade

For information on the administrative tasks you can perform in the HP Helion OpenStack region, see [Administering the HP Helion OpenStack Region](/helion/openstack/carrier/admin/helion/)



## Administering HP Distributed Cloud Networking (DCN)

Using DCN, you can install and upgrade HP Helion OpenStack Carrier Grade and do...

For information on the administrative tasks you can perform using DCN, see [Administering HP Distributed Cloud Networking (DCN)](/helion/openstack/carrier/admin/dcn/).

## Administering the Wind River Linux Region

For information on the administrative tasks you can perform in the WindRiver region, see [Administering the WindRiver Region](/helion/openstack/carrier/admin/wr/)

-->

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----
