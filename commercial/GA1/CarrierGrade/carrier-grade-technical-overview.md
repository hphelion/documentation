---
layout: default
title: "HP Helion OpenStack&#174; 1.1: Technical Overview"
permalink: /helion/openstack/carrier/technical-overview/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.0
product-version3: HP Helion OpenStack 1.0.1
product-version4: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Sameer V, Pranoy R, Michael B
---

<!--UNDER REVISION-->


<p style="font-size: small;"><a href="/helion/openstack/carrier/support-matrix/"> &#9664; Support Matrix | <a href="/helion/openstack/carrier/install/overview/">&#9650; Installation Overview</a> | <a href="/helion/openstack/carrier/install/bm/network/prepare/"> Preparing the Network for Installation</a></p>

# HP Helion OpenStack&#174; 1.1: Technical Overview

This page introduces you to HP Helion OpenStack, an enterprise-grade distribution of the OpenStack cloud operating system.

HP Helion OpenStack allows you to easily deploy OpenStack Cloud Services in a secure, highly available configuration, and subsequently deploy, manage and operate your cloud infrastructure in production. 

It is  designed to offer a number of value-added services that complement and enhance OpenStack and set up a cloud. HP OpenStack is enabled to manage KVM and VMWare ESX hypervisors.

* [HP Helion OpenStack services](#Helion-services)
* [Deployment architecture](#deploy-arch)
* [Network architecture](#networkarch)
* [Hardware requirement](#hardware-req)



## HP Helion OpenStack Services- Functional Overview {#Helion-services}

The following table outlines the functionality of HP Helion OpenStack services based on the type of users - Users and Administrators. For a complete description of these services, see the [Services Overview](/helion/openstack/1.1/services/overview/) page.


## Deployment architecture {#deploy-arch}  

You can deploy HP Helion OpenStack in two different environments depending on the hypervisor: KVM or ESX. 

The following diagram depicts a simplified deployment scenario using KVM.

<!-- This image is for alpha release only. Replace for beta -->


<a href="javascript:window.open('/content/documentation/media/CGH-architecture-alpha.png','_self','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><img src="media/CGH-architecture-alpha.png" width="750" /></a>
Click to view larger image; click **Back** to return.


## Network architecture {#networkarch}

The following information describes the network configuration for the [physical networks](#physical) and [virtual networks](#virtual), which must be configured by the network administrator.

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: #C8C8C8;">
<th> Network </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td> CLM / OBS</td>
<td> Cloud Management and Object Store Network (shared with WR)</td>
</tr>

<tr style="background-color: white; color: black;">
<td> PXE </td>
<td> Boot/initial configuration network. Untagged </td>
</tr>

<tr style="background-color: white; color: black;">
<td> CAN </td>
<td> Consumer Access Network (shared with WR)</td>
</tr>

<tr style="background-color: white; color: black;">
<td> EXT </td>
<td> External network (routable between WR and Helion (B2B) region through respective TUL) AND can be on a separate interface (intf*) </td>
</tr>

<tr style="background-color: white; color: black;">
<td> CTL </td>
<td> IPMI/iLO network (shared with WR) </td>
</tr>

<tr style="background-color: white; color: black;">
<td> BLS </td>
<td>Block Storage Network (shared with WR) </td>
</tr>

<tr style="background-color: white; color: black;">
<td> DCM </td>
<td>Data Center Management network </td>
</tr>

<tr style="background-color: white; color: black;">
<td> TUL (Swift) </td>
<td> Tenant Underlay Network  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> WR-TUL (Swift) </td>
<td> Tenant Underlay Network from WR region </td>
</tr>
</table>

## Hardware requirement {#hardware-req}

For more information of Hardware configurations see the [Support Matrix](/helion/openstack/carrier/support-matrix/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


<!--
### Backup and Restore nodes {#backup-restore-nodes}

Backup and restore scripts and procedures are provided for the seed VM, undercloud, overcloud management controller (running singleton services like Sherpa), and the MySQL database deployed in the controller cluster. These scripts are to be used by administrators managing the OpenStack Cloud.

Backup and Restore of VM instances/snapshots and volumes/snapshots for workloads in the cloud is supported using the Object Storage service.

For more information see [HP Helion OpenStack&#174; Back Up and Restore](/helion/openstack/1.1/backup.restore/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
-->
 
----


