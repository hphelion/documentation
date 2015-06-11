---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Technical Overview"
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


<p style="font-size: small;"> <a href="/helion/openstack/carrier/install/pb/overview/">&#9650; Installation Overview</a> | <a href="/helion/openstack/carrier/support-matrix/">Support Matrix &#9654;</a></p>

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

<!-- This image is for beta release only. Replace for beta -->


<a href="javascript:window.open('/content/documentation/media/CGH-architecture-beta-5.png','_self','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><img src="media/CGH-architecture-beta-5.png" width="750" /></a>
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
<td> Cloud Management and Object Store Network -- Untagged (Private)</td>
</tr>

<tr style="background-color: white; color: black;">
<td> PXE </td>
<td> Boot/initial configuration network. Untagged </td>
</tr>

<tr style="background-color: white; color: black;">
<td> CAN </td>
<td> Consumer Access Network (shared with WR - OAM)</td>
</tr>

<tr style="background-color: white; color: black;">
<td> EXT </td>
<td> External network (FIP network for DCN region); can be on a separate interface (`intf*`)</td>
</tr>

<tr style="background-color: white; color: black;">
<td> CTL </td>
<td> IPMI/iLO network (shared with WR) </td>
</tr>

<tr style="background-color: white; color: black;">
<td> BLS </td>
<td>Block Storage Network; can be on a separate interface (`intf*`) </td>
</tr>

<tr style="background-color: white; color: black;">
<td> DCM </td>
<td>Data Center Management network (accessible to WR region) and route across multi-DC </td>
</tr>

<tr style="background-color: white; color: black;">
<td> TUL (Swift) </td>
<td> Tenant Underlay Network(s); routed across multi-DC for VxLAN 12 extension  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> WR-TUL/SR-IOV (Swift) </td>
<td> Tenant Underlay Network from WR region </td>
</tr>

<tr style="background-color: white; color: black;">
<td> WR-PXE </td>
<td> Boot/Cloud Management network for WR Cloud/Region -- Untagged</td>
</tr>

<tr style="background-color: white; color: black;">
<td> WR-EXT </td>
<td> External network (FIP network for WR region) </td>
</tr>

<tr style="background-color: white; color: black;">
<td> WR-BLS </td>
<td> WR Cloud BLock Storage Network; can be on a separate interface (intf*) </td>
</tr>
</table>



## Interfaces

The following are the interfaces being used, based on the technical architecture diagram. You can use more than two interfaces and specific networks to physical networks.

* Intf0 is mapped to Port1/Bonded Pair
* Intf1 is mapped to Port2/Bonded Pair
* Intf*n* are Multiple Provider Networks or SR-IOV interfaces.

## Routing ACLs

Configure the following routing access lists.

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: #C8C8C8;">
<th> From </th>
<th> To </th>
<th> Reason </th>
</tr>

<tr style="background-color: white; color: black;">
<td> CLM </td>
<td> DCM </td>
<td> Access NTP, DNS, LDAP, StoreVirtual APIs, and so forth </td>
</tr>
<tr>
<td> CLM </td>
<td> CTL </td>
<td> Access iLO network for managing the lifecycle of the node </td>
</tr>
<tr>
<td> CLM </td>
<td> EXT </td>
<td> Access external networks, for example to download patches </td>
</tr>
<tr>
<td> CLM </td>
<td> CAN </td>
<td> Accessing OpenStack APIs </td>
</tr>
<tr>
<td> DCM </td>
<td> CLM </td>
<td> VSC IP to HLM CLM VM IP (only during deployment) </td>
</tr>
<tr>
<td> TUL1 </td>
<td> TUL2 </td>
<td> Inter DC communication (VPN tunnel, BGP, MPLS) </td>
</tr>
<tr>
<td> DCM1 </td>
<td> DCM2 </td>
<td> Inter DC communication (VPN tunnel, BGP, MPLS) </td>
</table>

CLM, PXE, OBS, BLS, WR-PXE, WR-INFRA, WR-TUL will use RFC 1918 non-routable IPs to prevent access to the CLM network from DCM, CLT, or EXT. 

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


