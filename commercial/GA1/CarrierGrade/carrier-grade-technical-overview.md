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

<!--
<p style="font-size: small;"><a href="/helion/openstack/1.1/support-matrix/"> &#9664; Support Matrix | <a href="/helion/openstack/1.1/install/overview/test/">&#9650; Installation Overview</a> | <a href="/helion/openstack/1.1/install/prereqs/"> Prerequisites &#9654</a></p> -->

# HP Helion OpenStack&#174; 1.1: Technical Overview
[See the Helion OpenStack 1.0 version of this page](/helion/openstack/technical-overview/)

This page introduces you to HP Helion OpenStack, an enterprise-grade distribution of the OpenStack cloud operating system.

HP Helion OpenStack allows you to easily deploy OpenStack Cloud Services in a secure, highly available configuration, and subsequently deploy, manage and operate your cloud infrastructure in production. 

It is  designed to offer a number of value-added services that complement and enhance OpenStack and set up a cloud. HP OpenStack is enabled to manage KVM and VMWare ESX hypervisors.

* [HP Helion OpenStack services](#Helion-services)
* [Deployment architecture](#deploy-arch)
* [Hardware requirement](#hardware-req)
* [Network architecture](#networkarch)
* [Backup and Restore nodes](#backup-restore-nodes)


## HP Helion OpenStack Services- Functional Overview {#Helion-services}

The following table outlines the functionality of HP Helion OpenStack services based on the type of users - Users and Administrators. For a complete description of these services, see the [Services Overview](/helion/openstack/1.1/services/overview/) page.


## Deployment architecture {#deploy-arch}  

You can deploy HP Helion OpenStack in two different environments depending on the hypervisor: KVM or ESX. 

The following diagram depicts a simplified deployment scenario using KVM.

<img src="media/CGH-architecture-alpha.png" width="500" /)>
<a href="javascript:window.open('/content/documentation/media/CGH-architecture-alpha.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">View larger image (opens in a new window)</a>



## Hardware requirement {#hardware-req}

For more information of Hardware configurations see the [Support Matrix](/helion/openstack/carrier/support-matrix/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Network architecture {#networkarch}

The following information describes the network configuration for the [physical networks](#physical) and [virtual networks](#virtual), which must be configured by the network administrator.

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: #C8C8C8;">
<th> Network </th>
<th> Description </th>
<th> VLAN type </th>


</tr>

<tr style="background-color: white; color: black;">
<td> IPMI / iLO </td>
<td> Network for server hardware management </td>
<td> Untagged </td>

</tr>
<tr style="background-color: white; color: black;">
<td> Undercloud management </td>
<td> <ul><li>Traffic for undercloud internal OpenStack calls, Image Operation service downloads, and so forth.</li>
<li>Provides access to undercloud API endpoints</li>
<li>Used to PXE boot overcloud servers</li>
</ul> </td>
<td> Untagged </td>

</tr>

<tr style="background-color: white; color: black;">
<td> Overcloud management </td>
<td> Traffic for overcloud internal OpenStack calls, Image Operations service downloads, and so forth. </td>
<td> Untagged </td>

</tr>

<tr style="background-color: white; color: black;">
<td> SDN </td>
<td> Network between workload VMs, for example VxLAN traffic. </td>
<td> Untagged </td>

</tr>

<tr style="background-color: white; color: black;">
<td> Storage </td>
<td> iSCSi traffic between VMs and storage products like StoreVirtual </td>
<td> Untagged </td>

</tr>

<tr style="background-color: white; color: black;">
<td> External </td>
<td><ul><li> Connected to internet or intranet</li>
<li>Provides floating IPs</li></ul> </td>
<td> Tagged </td>

</tr>

<tr style="background-color: white; color: black;">
<td> Service </td>
<td>Connects trusted VMs in overcloud to communicate with cloud infrastructure components in undercloud</td>
<td>Tagged</td>

</tr>

<tr style="background-color: white; color: black;">
<td> Object Storage (Swift) </td>
<td> Communication between Object Operations servers (includes user data)  </td>
<td> Untagged </td>

</tr>

</table>

### Virtual networks {#virtual}
The logical networks listed in the following table are implemented as VLANs on the physical network. The virtual networks are different for [KVM](#virtualkvm) and [ESX](#virtualesx).

#### Virtual networks for KVM hypervisor support  {#virtualkvm}

The logical networks listed in the following table are implemented as VLANs on the physical network.
<table>

<tr style="background-color: #C8C8C8;">
    <th>Network</th>
    <th>Description</th>
    <th>VLAN type</th>

  </tr>
<tr style="background-color: white; color: black;">
    <td> <b>Management</b></td>
    <td>This network is used for most cloud traffic including PXE boot nodes, tenant access to service APIs, internal API traffic between (one services to another), HA heartbeats, tenant access to services, VxLAN traffic for between tenant VMs, VM access to block and object storage, object storage replication and synchronization between StoreVirtual VSAs, Object Operations service nodes, MySQL clusters, RabbitMQ clusters, keepalived, [HDN](https://helion.hpwsportal.com) access to the product catalog, logging traffic to centralized logging, monitoring checks to Icinga.</td>
    <td>untagged</td>

  </tr>
<tr style="background-color: white; color: black;">
    <td><b>Service</b></td>
    <td>Trusted VMs communicate with the cloud infrastructure component.</td>
    <td>tagged</td>

  </tr>
</td>  <tr style="background-color: white; color: black;">
    <td><b>Fibre Channel</b></td>
    <td> Fibre Channel SAN (Storage Area Network) used for data path between Compute Servers and 3PAR arrays.
    <td> </td>

<tr style="background-color: white; color: black;">
    <td><b>External</b></td>
	<td>This network connects compute nodes and controller nodes to the Internet or Intranet. External network access is required for DVR routing from compute nodes. 

	<br />Floating IPs on the external network can be attached only to VMs that require a public IP address.
    <td>tagged</td>
  </tr>
</table>



### Backup and Restore nodes {#backup-restore-nodes}

Backup and restore scripts and procedures are provided for the seed VM, undercloud, overcloud management controller (running singleton services like Sherpa), and the MySQL database deployed in the controller cluster. These scripts are to be used by administrators managing the OpenStack Cloud.

Backup and Restore of VM instances/snapshots and volumes/snapshots for workloads in the cloud is supported using the Object Storage service.

 For more information see [HP Helion OpenStack&#174; Back Up and Restore](/helion/openstack/1.1/backup.restore/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

 
<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593;</a>

----


