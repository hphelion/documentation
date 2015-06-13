---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade: Support Matrix"
permalink: /helion/openstack/carrier/support-matrix/helion/
product: carrier-grade
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

<p style="font-size: small;"><a href="/helion/openstack/carrier/support-matrix/hlm/">&#9664; Support Matrix for the HP Lifecycle Management</a> | <a href="/helion/openstack/carrier/support-matrix/">&#9650; HP Helion OpenStack Carrier Grade (Beta): Support Matrix</a> | <a href="/helion/openstack/carrier/support-matrix/dcn/"> Support Matrix for HP Distributed Cloud Networking (DCN) &#9654;</a> </p>


# HP Helion OpenStack&#174; Carrier Grade (Beta): Support Matrix for HP Helion OpenStack
 
To ensure the performance and stability of the HP Helion OpenStack environment, it is very important to meet the requirements and conform to the following recommendations.

This page provides an overview of the hardware and software that is supported for HP Helion OpenStack, including setup and configuration information. 

* [Supported Hardware](#supportedhw)
* [Hardware Requirements](#baremetal)
* [Software Requirements](#software-requirements)
* [Guest OS Support Matrix](#guestOS)


<!--
## Deployment Architecture {#deploy-arch}

The following diagram depicts simplified deployment scenarios:

* <a href="javascript:window.open('/content/documentation/media/topology_kvm.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">KVM deployment of HP Helion OpenStack</a> (opens in a new window)
* <a href="javascript:window.open('/content/documentation/media/topology_esx.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">ESX deployment of HP Helion OpenStack</a> (opens in a new window)
-->

## Supported Hardware {#supportedhw}

The following hardware has been tested and verified to work with HP Helion OpenStack:


### HP Helion OpenStack Region

For the HP Helion OpenStack Region, the following servers are supported for the current release.


**HP ProLiant BladeSystem**

- [BL460c Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5177949)
- [BL460c Gen9](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=7271227)
- [BL660c Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5268287)


**HP ProLiant Rack Servers** 

- [DL360 Gen9](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=7252836)
- [DL380 Gen9](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=7271241)
- [DL320 Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5379527)
- [DL360 Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5249570)
- [DL380 Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5177957)
- [DL560 Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5268290)
- [DL580 Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5177957)

<!-- Hiding until confirmation
**HP Moonshot Servers**

- [m710 Server Cartridge](http://www8.hp.com/in/en/products/proliant-servers/product-detail.html?oid=7398911)
- [m300 Server Cartridge](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=6488204#!tab=features)

For more information, see [Managing Moonshot Servers](/helion/openstack/1.1/install/moonshot/).

-->

**HP ProLiant Scalable Systems**

- [SL230s Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5177937)
- [SL250s Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5177941)
- [SL270s Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5177945)
- [SL4540 Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=7611044)

**IBM systems**

- [IBM System x3550 M4 Server](http://www-03.ibm.com/systems/x/hardware/rack/x3550m4/)

**Dell systems**

- [Power Edge R620](http://www.dell.com/us/business/p/poweredge-r620/pd)

<!--
## Supported Configurations {#supportedconfigurations}

HP supports the following configurations for HP Helion OpenStack deployment:

- Host Interconnects/Protocols: 
   
      * 10Gb Software iSCSI
      * 8Gb and 16Gb Fibre-Channel
      * Software iSCSI and Fibre-Channel under KVM

- Target Interconnects: 
   
      * 8Gb FC SAN
      * 10Gb iSCSI CNA/NIC
      

- 3PAR InForm OS Version: 3.1.3 MU1 to 3.2.1 MU1

	* HP StoreVirtual 4000 series: driver 11.5.01.0079.0 (Helion Embedded)
-->
## Hardware Requirements {#baremetal}

You must have the following hardware configuration:

- 5 baremetal systems meeting the requirements as listed below.

- For systems with multiple NICs, only one NIC may be active or connected.

- Capable of hosting VMs

- For Compute nodes, Intel or AMD hardware virtualization support required. The CPU cores and memory requirements must be sized based on the VM instances hosted by the Compute node.

	**Important:** Since the installer currently uses only the first available disk, all servers must have RAID controllers pre-configured to present their storage as a single, logical disk. RAID across multiple physical discs is strongly recommended for both  performance and resilience.

	On the controller and compute nodes, make sure the RAID array is configured to reflect a total size of less than 4TB.

- The [HP Dynamic Smart Array (B120i and B320i) controllers](http://h18013.www1.hp.com/products/servers/proliantstorage/arraycontrollers/dynamicsmartarray/index.html?jumpid=reg_r1002_usen_c-001_title_r0001) use a proprietary driver that is not included in Helion OpenStack. HP recommends the use of the full featured [Smart Array adapters](http://www8.hp.com/us/en/products/iss-controllers/index.html) (such as p220, p440, etc.) in order to achive the best set of features and performance.

	To use the Dynamic Smart Array adapter, enter the system ROM-Based Setup Utility (RBSU) and set the adapter to `Enable SATA AHCI Support` to allow the use of the adapter in non-RAID mode. However, for reliability this is not recommended.

The following table lists the minimum requirements required for installation of each type of node. See the [Technical Overview](/helion/openstack/carrier/technical-overview/) for an architecture diagram.

<table style="text-align: left; vertical-align: top;">

<tr style="background-color: #C8C8C8; text-align: left; vertical-align: top;">
<th>Node Type</th>
<th>Role</th>
<th>Required Number</th>
<th>Server Hardware</th>
<th>Minimum Requirements and Recommendations</th>
</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td rowspan="4"> Ctl 0 </td>
<td rowspan="4">Undercloud Controller</td>
<td rowspan="4">1</td>
<td>Disk </td>
<td> 512GB
</td>
</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Memory </td>
<td>32GB </td>
</tr>
<tr style="background-color: white; color: black;">
<td>Network </td>
<td> 1 x 10 GB NIC with PXE support</td>
</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>CPU </td>
<td> 8 CPU cores - Intel or AMD 64-bit processor</td>


<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td rowspan="4">Ctl 1</td>
<td rowspan="4">Overcloud Controller</td>
<td rowspan="4">1</td>
<td>Disk </td>
<td>512GB</td>
</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Memory </td>
<td> 32GB </td>
</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Network </td>
<td> 1 x 10GB NIC with PXE support</td>
</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>CPU </td>
<td>8 CPU cores - Intel or AMD 64-bit processor </td>
</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td rowspan="4">Ctl 2 </td>
<td rowspan="4">Overcloud Controller</td>
<td rowspan="4">1</td>
<td>Disk </td>
<td> 512GB
 </td>
</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Memory </td>
<td>32GB </td>
</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Network </td>
<td> 1 x 10GB NIC with PXE support</td>
</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>CPU </td>
<td>8 CPU cores - Intel or AMD 64-bit processor </td>
</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td rowspan="4"> Compute Node1 </td>
<td rowspan="4">Overcloud Compute</td>
<td rowspan="4">1</td>
<td>Disk </td>
<td> 512GB. 100GB is required for HP Moonshot Servers.</td>

</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Memory </td>
<td>32GB - Memory must be sized based on the VM instances hosted by the Compute node.</td>
</tr>
<tr style="background-color: white; color: black;">
<td>Network </td>
<td> 1 x 10GB NIC with PXE support</td>
</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>CPU </td>
<td>8 CPU cores - Intel or AMD 64-bit processor with hardware virtualization support. The CPU cores must be sized based on the VM instances hosted by the Compute node. </td>
</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td rowspan="4"> Compute Node2 </td>
<td rowspan="4">Overcloud Compute</td>
<td rowspan="4">1</td>
<td>Disk </td>
<td> 512GB
</td>
</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Memory </td>
<td>32GB </td>
</tr>
<tr style="background-color: white; color: black;">
<td>Network </td>
<td> 1 x 10 GB NIC with PXE support</td>
</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>CPU </td>
<td> 8 CPU cores - Intel or AMD 64-bit processor</td>
</tr>

</table>

**Notes:** 

- Additional storage on the Swift server can be used as object storage.
- For installations with KVM hypervisor support, one or more additional nodes are required for VSA block storage.
- After the installation is complete, you can use the Block Storage and Object Operation services to add further storage capacity as allowed by your hardware.


<!--
## Usable Capacity {#usable_capacity}

The following table maps the minimum server configuration into usable capacity of the overcloud.


<table style="text-align: left; vertical-align: top;">

<tr style="background-color: #C8C8C8; text-align: left; vertical-align: top;">
<th>Service</th>
<th>Usable capacity</th>
<th>Notes</th>
</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td> VMs </td>
<td> 6 standard.medium (4GB memory, 80GB disk) </td>
<td> Assumes 8GB of memory and 200GB of disk overhead. Capacity increases linearly with Compute nodes.</td>
</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td> Volumes </td>
<td> 1800GB</td>
<td> Capacity is fixed</td>
</tr>		

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td> Object storage</td>
<td> 400GB; equivalent to:
<ul><li>160 images, based on 2.5GB images</li>
or
<li>40 volume backups, based on 10GB volumes</li>
</li> </td>
<td> In addition to your objects, object storage is used for images and volume backups. With 640 GB per server (after subtracting 60 GB for the OS) this leaves about 400 usable GB (1280/3.2). This is assuming an average Linux image/snapshot of 2.5 GB (the 2.5 GB is the average size of images in the swift public cloud in US-East) and a 10 GB Cinder volume backup.

<p>Note: These are the maximum figures assuming the storage is used exclusively for that type of object.</p>  </td>
</tr>			
</table>
-->


## Software Requirements {#software-requirements}

There are no software requirements for the servers where the HP Helion OpenStack region will be installed because all required software is contained within the images deployed on the system.

The servers should be baremetal before installation.

## Guest OS Support Matrix {#guestOS}

HP Helion OpenStack Guest OS support is based on the hypervisor vendor. 

For ESX, refer to the [VMware Compatibility Guide](http://www.vmware.com/resources/compatibility/search.php?action=search&deviceCategory=software&advancedORbasic=advanced&maxDisplayRows=50&key=&productId=4&gos_vmw_product_release%5B%5D=90&datePosted=-1&partnerId%5B%5D=-1&os_bits=-1&os_use%5B%5D=-1&os_family%5B%5D=-1&os_type%5B%5D=-1&rorre=0).

For KVM refer to the following table:

A **Verified** Guest OS has been tested by HP and appears to function properly as a Nova compute VM on HP Helion OpenStack.

A **Certified** Guest OS has been officially tested by the OS vendor, or by HP under the vendor's authorized program, and will be supported by the OS vendor as a Nova compute VM on HP Helion OpenStack.

<table><tr style="background-color: #808080; color: white; text-align: left; vertical-align: top;">
<td>OS</td>
<td>Verified</td>
<td>Certified</td>
</tr>
<td>Windows Server 2012 R2
</td>
<td>-</td>
<td>Yes</td>
</tr><tr>
<td>Windows Server 2012
</td>
<td>-</td>
<td>Yes</td>
</tr><tr>
<td>Windows Server 2008 R2
</td>
<td>-</td>
<td>Yes</td>
</tr><tr>
<td>Windows Server 2008
</td>
<td>-</td>
<td>Yes</td>
</tr><tr>
<td> Ubuntu 14.10 
</td>
<td>Yes</td>
<td>No</td>
</tr><tr>
<td> Ubuntu 14.04 LTS
 </td>
<td>Yes</td>
<td>No</td>
</tr><tr>
<td>Debian 8 (Jessie Beta 2)
</td>
<td>Yes</td>
<td>N/A</td>
</tr><tr>
<td>Debian 7.6
</td>
<td>Yes</td>
<td>N/A</td>
</tr><tr>
<td>CentOS 7</td>
<td>Yes</td>
<td>N/A</td>
</tr><tr>
<td> CentOS 6.5
</td>
<td>Yes</td>
<td>N/A</td>
</tr><tr>
<td>RHEL 7.0</td>
<td>Yes</td>
<td>No</td>
</tr><tr>
<td> 
 RHEL 6.6
 </td>
<td>Yes</td>
<td>No</td>
</tr>
<tr>
<td>
 Fedora
 </td>
<td>No</td>
<td>-</td>
</tr><tr>
<td>SLES</td>
<td>No</td>
<td>-</td>
</tr>
</table>


## Next Step {#next}

Review the [Technical Overview](/helion/openstack/1.1/technical-overview/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
