---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade: Technical Overview"
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


<p style="font-size: small;"> <a href="/helion/openstack/carrier/install/bm/overview/">&#9650; Installation Overview</a> | <a href="/helion/openstack/carrier/support-matrix/">Support Matrix &#9654;</a></p>

# HP Helion OpenStack&#174; Carrier Grade (Beta): Technical Overview

This page introduces you to HP Helion OpenStack Carrier Grade, a carrier-grade distribution of OpenStack, the leading open source cloud computing platform.

* [HP Helion OpenStack services](#Helion-services)
* [Deployment architecture](#deploy-arch)
* [Network architecture](#networkarch)
* [Hardware requirement](#next)

## HP Helion OpenStack Carrier Grade services- functional overview {#Helion-services}

The following table outlines the functionality of HP Helion OpenStack  Carrier Grade services based on the type of users - Users and Administrators. For a complete description of these services, see the [Services Overview](//helion/openstack/carrier/services/overview/) page.


## Deployment architecture {#deploy-arch}  

You can deploy HP Helion OpenStack Carrier Grade on a [KVM hypervisor](http://www.linux-kvm.org/page/Main_Page). 

The following diagram depicts a simplified deployment scenario using KVM.

<!-- This image is for alpha release only. Replace for beta -->


<a href="javascript:window.open('/content/documentation/media/CGH-architecture-beta.png','_self','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><img src="media/CGH-architecture-beta.png" width="750" /></a>
<br>Click to view larger image; click **Back** to return.

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

## Next step {#next}

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


