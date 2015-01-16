---
layout: default
title: "HP Helion OpenStack&#174; Edition: HP Helion Ceph"
permalink: /helion/openstack/ceph/
product: commercial

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--
<p style="font-size: small;"> <a href="/helion/openstack/install-beta/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/esx/">NEXT &#9654;</a> </p>
-->


#HP Helion OpenStack Enterprise Edition 1.1 Ceph Firefly 80.7 Storage Solution 


The HP Helion OpenStack Enterprise Edition 1.1 Ceph Storage Solution provides an unified scaleable and stable storage solution for the management of Helion OpenStack Glance Images, Nova Boot Volumes, Cinder persistent Volumes. The solution also supports user backup and archive workloads to the Swift API writing to the same unified Ceph storage platform. 

This guide is focused on post installation, configuration and integration between HP Helion OpenStack Enterprise Edition 1.1 and Ceph Firefly 80.7 running on hlinux kernel 3.14-6.2.


This guide assumes that the reader are familiar with the concept of OpenStack and Ceph. The main purpose of this guide is to outline in detail the integration of Ceph Block Storage with HP Helion OpenStack, detail steps to install dependencies, configure HP Helion OpenStack and Ceph Firefly, and extensive troubleshooting guidance.

<!---Although installation steps are outlined, these are mostly as validity checks for dependencies. Most Enterprise Customers should have HP size and assist with the installation of HP Helion OpenStack Enterprise Edition 1.1, and Inktank size and assist with the installation of Ceph Firefly 80.7. --->


##Ceph Overview

Ceph is an Open Source, scalable, software defined storage system running on HP servers which comprised of a  [block storage](#block-storage), [object storage](#object-storage) and [file system](#file-system) with a unified management. <!---HP is committed to contribute to OpenStack integration with  management and extensions to Ceph Open Source Storage as a Solution.--->

Ceph is designed to deliver different types of storage interfaces to the end user in a same storage platform. The intergration between HP Helion OpenStack Enterprise Edition and Ceph is the usage of [block storage](#block-storage) of Ceph's RADOS Block Device (RDB). Also, the integration between User Application Archive and Backup Workloads running externally or in Virtual Machines in HP Helion OpenStack is the usage of [object storage](#object-storage) of Ceph RADOS Gateway.

The Ceph radosgw provides a REST interface with extensions which offers compatibility with Swift API. Therefore the existing applications with the integration to the HP Helion OpenStack Swift API can port seamlessly from a OpenStack Swift backend storage platform and the Ceph Solution.


###Block Storage {#block-storage}

The Ceph Block Device is a network attached device, which is introduced to the HP Helion OpenStack Controller and Compute Nodes for Glance, Nova and Cinder storage utilization, or, in order to meet a unique SLAs, to the virtual machines in the KVM Helion OpenStack managed hypervisor. Glance can be configured with Ceph object or block storage. Hence, HP has followed Ceph's best practices and is limiting support for Glance storage of images to block storage. This allows for the support of Ceph's Cl0cne and Copy on Write Feature (COW).


###Object Storage {#object-storage}

The Ceph RADOS Gateway is a REST API which supports Swift API. HP Helion OpenStack supports object storage primarily for user workloads, i.e, ranging from COTS applications running in virtual machines (such as MySQL which frequently requires to archive tar files to a reliable and resilient archive) to custom LOB Solutions (which require frequent and aggressive snapshots orchestrated in a consistency group across many VM and external baremental systems).


###File System {#file-system} (aren't we supporting this?)

Ceph provides a POSIX-compliant network file system that aims for high performance, large data storage and so on. **However file system interface is still not production ready as of this writing (December 2014)**. In this release we are not supporting the File Interface. There is an alternative way suggested, that is, either leveraging Ceph’s RBD Block storage, Ceph’s radosgw Object Storage through Swift API, or for user archive and backup type workloads, Open Source Swift API compatible File System interfaces such as Duplicity.

###Ceph Cluster

The Ceph Object Storage Daemon (OSD) stores data, handles data replication, recovery, rebalancing, and provides information to Ceph monitors by verifying other Ceph OSD Daemons for a heartbeat. It is best to maintain in a Product 3 OSD Servers to take into account the default 3 replicas. The number of OSD Daemons per Server is a part of the sizing exercise unique to each Customer. For an example, a stable configuration is 9 OSD servers with 12 2TB disks each server. Others can range to 9 OSD servers with 25 4TB disks each server such as the HP SL4540.

The Ceph Monitor maintains a master copy of the Ceph Cluster Map including the OSD map, monitor map, placement group (PG) map, and the CRUSH map. Ceph maintains a history called an “epoch” of each state change in the Ceph monitors, Ceph OSD daemons, and placement groups. It is best to maintain in Production 3 Ceph Monitors (if 1 Monitor fails and the System will still be operational). If additional monitors are required, upgrade in a manner such that the number of Monitors results in odd numbers, such as to 5 Ceph Monitors. Server types range from HP SL230s to HP DL360s.




The following diagram depicts a communication from Helion OpenStack to Ceph Cluster


<img src="media/communication_diagram_from_helion_ceph.png"/)>


###Ceph Object Gateway

Ceph object gateway is built on librgw to provide applications with a RESTful gateway to Ceph storage clusters. Ceph object storage supports following two interfaces:

**Swift-compatible**: Provides object storage functionality with a large subset of the OpenStack Swift API. HP supports this interface and 3rd party integrations with the Swift API.

**S3-compatible**: Provides object storage functionality with a large subset of the Amazon S3 RESTful API. This functionality is not support in this release <!---This is not supported by HP as part of the Solution, but it has passed minimal API testing.--->

The Ceph object gateway daemon (radosgw) is a fastCGI module for interacting with a Ceph storage cluster. Ceph object gateway can store data in the same Ceph storage cluster used 
to store data from Ceph block device clients or from Ceph file system clients. Ceph maintains its own user authentication and allows for extension to HP Helion OpenStack Keystone Authentication. For User Archive and Backup workloads originating from HP Helion OpenStack Tenant Project Virtual Machines, integrating through Keystone is preferable as a consistent authentication model.


##HP Helion OpenStack to Ceph Storage Reference Architecture

Ceph cluster includes one admin node, one monitor node (MON) and 3 object storage daemons (OSD). The monitor node can also coexist on the same Host as one of the OSD. Administrative and control operations are typically issued from admin node. There is also a Metadata Server node MDS) which stores metadata on behalf of the Ceph Filesystem. Ceph Block Devices and Ceph Object Storage do not use MDS. Since, we do not support Ceph Filesystem interface there is no requirement for a MDS node at present.


<img src="media/helion-openstack-ceph-storage-reference-architecture.png"/)>

<img src="media/logical-referrence-architecture-for-ceph-cluster.png"/)>



## Pre-requisite

###Hardware Recommendation for Ceph Cluster 

####Virtual Environment

Ceph can run on commodity hardware, that makes building and maintaining petabyte-scale data clusters economically viable. When planning for the Performance, Capacity and Resiliency of the Ceph Cluster, review sizing with HP to make sure the Solution will fit the SLA. Ceph can run on HP SL230s, HP SL4540s and HP DL580s- sizing is completely driven the SLAs. Small Proof of Concept clusters and development clusters can run successfully on Virtual Machines with minimal system requirements.  For example, 1VM running Admin, 1 VM running radosgw, 3 VMs running Ceph OSD, 1VM running Monitor.
 

<**need** to fix the table as per the document>

<table>
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th rowspa="4"> Process</th>
<th>Criteria </th>
	<th>Minimum Recommended </th>
</tr>
	<tr>
<td>ceph-osd</td>
<td>Processor</td>
<td>4vCPU</td>
</tr>
<tr>
<td>ceph-mon</td>
<td>RAM</td>
<td>4G </td>
</tr>
<tr>
<td>ceph rados gateway</td>
<td>Disk Space</td>
<td>100 GB</td>
</tr>
<tr>
<td>ceph admin</td>
<td>Network</td>
<td>2x 1GB Ethernet vNICs</td>
</tr>
  </table>

##Production Environment

The hardware recommendation for the production environment are follows:

<table>
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th> Process</th>
	<th>Criteria </th>
	<th>Minimum Recommended Server Quantity</th>
</tr>
	<tr>
<td>Ceph-OSD</td>
<td>3 x 15 HP ProLiant SL4540 Gen8 Servers</td>
<td>5</td>
</tr>
<tr>
<td>Ceph-Mon</td>
<td>HP ProLiant DL360p Gen8 Servers</td>
<td>3 </td>
</tr>
<tr>
<td>Ceph-Admin</td>
<td>HP ProLiant DL360p Gen8 Servers</td>
<td>1&#42;</td>
</tr>
<tr>
<td>Ceph-RADOSGW</td>
<td>HP ProLiant DL360p Gen8 Servers</td>
<td>1&#42;</td>
</tr>
<tr>
<td>**need infor**</td>
<td>10 GbE Networking running on HP 5900AF switches</td>
<td>1</td>
</tr>
<tr>
<td>**need info**</td>
<td>1 GbE Networking running on an HP 2920 switch</td>
<td>1</td>
</tr>
</table>

**Note**: If the resiliency SLA for the User Archive or Backup use cases cannot tolerate downtime of the Ceph RADOS Gateway, then consider adding additional servers with an external Load Balancer.


The following table shows an example of detailed deployment scenario:

 <table>
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th> HP Helion Openstack</th>
	<th>CEPH Monitor/GateWays </th>
	<th>OSDs (6x15 SL4540)</th>
</tr>
	<tr>
<td>12 ProLiant DL360p Gen8 with 12 cores each</td>
<td>4x HP ProLiant DL360p Gen8 with 12 cores</td>
<td>6 x HP 3xSL4540 Gen8 with 16 cores each</td>
</tr>
<tr>
<td>2 x E5-2667 (Intel Xeon 2.9GHz 15M Cache)</td>
<td>2 x E5-2667 (Intel Xeon 2.9GHz 15M Cache)</td>
<td>2 x E5-2470 (Intel Xeon 2.3GHz 20M Cache) </td>
</tr>
<tr>
<td>64 GB - 8 x HP 8GB 1Rx4 PC3-12800R</td>
<td>64 GB - 8 x HP 8GB 1Rx4 PC3-12800R</td>
<td>96 GB - 12 x HP 8GB 2Rx4 PC3L-10600R</td>
</tr>
<tr>
<td>3.6 TB - 4 x HP 900GB 6G SAS 10K 2.5in SC ENT HDD</td>
<td>1 TB - 2 x HP 500GB 6G SAS 10K 2.5in SC ENT HDD</td>
<td>45 TB - 15 x HP 3TB 6G SAS 7.2K 3.5in SC MDL HDD</td>
</tr>
<tr>
<td>1 x HP 512MB FBWC for P-Series Smart Array</td>
<td>1 x HP 512MB FBWC for P-Series Smart Array</td>
<td>1TB - 2 x HP 500GB 6G SATA 7.2K 2.5in SC MDL HDD</td>
</tr>
<tr>
<td>2 x HP dual port 10GbE</td>
<td>2 x HP dual port 10GbE</td>
<td>2 x HP 2GB P-seris Smart Array FBWC</td>
<tr><td>
<td></td>
<td>2 x HP Smart Array P420i Mez Ctrllr FIO Kit</td>
</tr>
<tr><td>
<td></td>
<td>1 x HP 10G IO Module (2x1GbE 2x10GbE)</td>
</tr>
<table>


For more example on Ceph Production Cluster, refer to [http://www8.hp.com/h20195/v2/GetPDF.aspx/4AA5-2799ENW.pdf](http://www8.hp.com/h20195/v2/GetPDF.aspx/4AA5-2799ENW.pdf)


The following diagram depicts an example for the deployment of Helion OpenStack with Ceph Cluster 


<img src="media/helion-openstack-ceph-cluster-deployment-example"/)>


##Download and Access to the Solution Files and Documents

[CODN](https://helion.hpwsportal.com) is a remote web catalog containing a repository of software available for purchase and download of HP OpenStack Enterprise Customers.

First register yourself to the CODN portal and then log in to download the required Helion OpenStack Ceph Storage Solution packages.

Please contact HP sales team if there is any issue with the CODN access permission and login details. 

Once permission has been granted, log in with the supplied credentials. Select the Category Workloads, and the Sub-Category Storage to find the HP Helion OpenStack Ceph Storage Solution.

Each Ceph related files has the following description:

* Helion OpenStack Commercial integration with InkTank Ceph for Glance, Nova, and Cinder storage.

 
## Next Steps

[HP  Helion OpenStack Installation](/helion/openstack/install/overview//).
 

<!---

1. Installation Prerequisite

2. Installation and Configuration for KVM Hypervisor

3. Seed Installation

5. UnderCloud and OverCloud installation

6. Post Installation
 ---->

<!----

###Hardware Requirement

Hardware used for the Helion OpenStack installation:

####Control and Gateway Services

<table>
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th> Server Model</th>
<th>CPUs </th>
	<th>Memory</th>
<th>OS Boot Volume</th>
</tr>
	<tr>
<td>C7000 BL460C</td>
<td>12</td>
<td>96 GB</td>
<td>250</td>
</tr>
<tr>
<td>SL230</td>
<td>12</td>
<td>96 GB </td>
<td>300</td>
</tr>
</table>


####Suitable for Storage Services
<table>
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th> Server Model</th>
<th>CPUs </th>
	<th>Memory</th>
<th>OS Boot Volume</th>
<th>Storage Volume </th>
</tr>
<tr>
<td>c3x15 SL4540</td>
<td>12</td>
<td>96 GB</td>
<td>300</td>
<td>13 7.2k rpm, 2 SSD</td>
</tr>
<tr>
<td>2x25 SL4540</td>
<td>12</td>
<td>96 GB</td>
<td>300</td>
<td>21 7.2k rpm, 4 SSD</td>
</tr>
<tr>
<td>1x60 SL4540</td>
<td>12</td>
<td>96 GB</td>
<td>300</td>
<td>50 7.2k rpm, 10 SSD</td>
</tr>
  <table>


####Suitable for Control, Compute, Gateway and Storage Services

<table>
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th> Server Model</th>
<th>CPUs </th>
	<th>Memory</th>
<th>OS Boot Volume</th>
<th>Storage Volume  (External Disk Array)</th>
</tr>
<tr>
<td>DL 360</td>
<td>16</td>
<td>96 GB</td>
<td>500, SSD</td>
<td>24 7.2k rpm</td>
</tr>
<tr>
<td>DL 380</td>
<td>16</td>
<td>96 GB</td>
<td>500, SSD</td>
<td>24 7.2k rpm</td>
</tr>
 <table>

Note: Most Compute configurations are 256 to 1TB of memory.


###Validation of Firmware

DL 360 Firmware version P71 02/10/214

Screeenshot


SL 4540 Firmware version P7402/10/2014


Screenshot

###Validation of CPU

DL 360 Gen8 2 CPUs/8 cores each

screenshot

SL 4540 Gen8 2 CPUs/8 cores each
screenshot

###Validation of Memory

DL 360 12 SlotsX8GB= 96 GB

screenshot

SL 4540 12 SlotsX8 GB=96 GB

screenshot

###Validation of Network

DL360 4 ports

screenshot

SL4540 4 Ports

screenshot


C7000 4Ports

screenshot

###Validation of Storage

screenshot


----->
