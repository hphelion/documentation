---
layout: default
title: "HP Helion OpenStack&#174; Support Matrix"
permalink: /helion/openstack/support-matrix/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/openstack/services/overview/">&#9664; PREV</a> | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/install/overview/">NEXT &#9654;</a> </p>
-->
<!-- IMPORTANT!!! The HW support Matrix should be approved by:
* Gavin Brebner for Helion QA support
* Lynne Christofanelli  for HW Support qualified with hLinux
* Marty Duey for third party HW support (IHV Support)
-->

# HP Helion OpenStack&#174; Support Matrix
 
To ensure the performance and stability of the HP Helion OpenStack environment, it is very important to meet the requirements and conform to the recommendations.

This page provides an overview of the hardware and software that is supported for HP Helion OpenStack, including setup and configuration information. 

* [OpenStack version information](#os)
* [Deployment Architecture](#deploy-arch)
* [Supported Hardware](#supportedhw)
* [Supported Configurations](#supportedconfigurations)
* [Hardware Requirements](#baremetal)
* [Software Requirements](#software-requirements)
	* [Guest OS Support Matrix](#guestOS)
	* [seed cloud host requirements and recommendations](#otherseed)

## OpenStack version information {#os}

All of the [HP Helion OpenStack services](/helion/openstack/services/overview/#OpenStack) have been updated to [OpenStack Juno](http://www.openstack.org/software/juno/).

## Deployment Architecture {#deploy-arch}

The following diagrams depict simplified deployment scenarios:

* <a href="javascript:window.open('/content/documentation/media/topology_kvm.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">KVM deployment of HP Helion OpenStack</a> (opens in a new window)
* <a href="javascript:window.open('/content/documentation/media/topology_esx.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">ESX deployment of HP Helion OpenStack</a> (opens in a new window)

## Supported Hardware {#supportedhw}

The following hardware has been tested and verified to work with HP Helion OpenStack:


### HP ProLiant BladeSystem

- [BL420c Gen8](http://shopping1.hp.com/is-bin/INTERSHOP.enfinity/WFS/WW-USSMBPublicStore-Site/en_US/-/USD/ViewStandardCatalog-Browse?CatalogCategoryID=Vt4Q7habZVsAAAE3bqp1vE0Q)
- [BL460c Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5177949)
- [BL465c Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5193137)
- [BL660c Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5268287)
- [BL460 G7](http://h20566.www2.hp.com/portal/site/hpsc/public/psi/home?sp4ts.oid=4194735&ac.admitted=1421337157737.876444892.199480143)
- [BL490c G7](http://h20566.www2.hp.com/portal/site/hpsc/public/psi/home?sp4ts.oid=4268682&ac.admitted=1421337252142.876444892.199480143)


### HP ProLiant Rack Servers 

- [DL360 Gen9](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=7252836)*
- [DL380 Gen9](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=7271241)*
- [DL160 Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5211699)
- [DL320 Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5379527)
- [DL360 Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5249570)
- [DL380 Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5177957)
- [DL385 Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5249584)
- [DL560 Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5268290)
- [DL580 Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5177957)*
- [DL580 G7](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=4142916)

	*Legacy boot support only, no uEFI

### HP ProLiant Tower Servers

- [ML310 Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5379531)
- [ML350 Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5177961)
<br>
### HP ProLiant Scalable Systems

- [SL230s Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5177937)
- [SL250s Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5177941)
- [SL270s Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5177945)
- [SL4540 Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=7611044)
- [SL390s G7](http://h20564.www2.hp.com/hpsc/doc/public/display?docId=emr_na-c03287404-3&sp4ts.oid=4198401)

### IBM systems ###

- [IBM System x3550 M4 Server](http://www-03.ibm.com/systems/x/hardware/rack/x3550m4/)

### Dell systems###

- [Power Edge R620](http://www.dell.com/us/business/p/poweredge-r620/pd)





## Supported Configurations {#supportedconfigurations}

HP supports the following configurations for HP Helion OpenStack deployment:



- Host Interconnects/Protocols: 
   
      * 10Gb Software iSCSI
      * 8Gb and 16Gb Fibre-Channel
      * Software iSCSI and Fibre-Channel under KVM

- Target Interconnects: 
   
      * 8Gb FC SAN
      * 10Gb iSCSI CNA/NIC
      

- 3PAR InForm OS Version: 3.1.3 MU1 

      * HP StoreVirtual 4000 Storage
   
     
## Hardware Requirements {#baremetal}

You must have the following hardware configuration:

- At least 8 and no more than 100 baremetal systems meeting the requirements as listed below.

Additional requirements are as follows:

- For systems with multiple NICs, only one NIC may be active or connected.
- Capable of hosting VMs
- The boot order configured with Network/PXE boot as the first option:
	- For example, to set the boot order for a HP SL390, from the iLO prompt enter `set system1/bootconfig1/bootsource5 bootorder=1`.
	- To unset, enter `set system1/bootconfig1/bootsource5 bootorder=5`.

- The BIOS configured: 
	- to the correct date and time
	- all networks with the same date and time
	- seed cloud host configured in UTC (Coordinated Universal Time)
	- with only one network interface enabled for PXE/network boot and any additional interfaces should have PXE/network boot disabled

- The latest firmware recommended by the system vendor for all system components, including the BIOS, BMC firmware, disk controller firmware, drive firmware, network adapter firmware, and so on.
- For Compute nodes, Intel or AMD hardware virtualization support required. The CPU cores and memory requirements must be sized based on the VM instances hosted by the Compute node.

	**Important:** Since the installer currently uses only the first available disk, all servers must have RAID controllers pre-configured to present their storage as a single, logical disk. RAID across multiple physical discs is strongly recommended for both  performance and resilience.

	On the controller and compute nodes, make sure the RAID array is congifured to reflect a total size of less than 4TB.

- The [HP Dynamic Smart Array (B120i and B320i) controllers](http://h18013.www1.hp.com/products/servers/proliantstorage/arraycontrollers/dynamicsmartarray/index.html?jumpid=reg_r1002_usen_c-001_title_r0001) use a proprietary driver that is not included in Helion OpenStack. HP recommends the use of the full featured [Smart Array adapters](http://www8.hp.com/us/en/products/iss-controllers/index.html) (such as p220, p440, etc.) in order to achive the best set of features and performance.

	To use the Dynamic Smart Array adapter, enter the system ROM-Based Setup Utility (RBSU) and set the adapter to `Enable SATA AHCI Support` to allow the use of the adapter in non-RAID mode. However, for reliability this is not recommended.

The following table lists the minimum requirements required for installation of each type of node. 

<table style="text-align: left; vertical-align: top;">

<tr style="background-color: #C8C8C8; text-align: left; vertical-align: top;">
<th>Node Type</th>
<th>Minimum Number</th>
<th>Server Hardware</th>
<th>Minimum Requirements and Recommendations</th>
</tr>


<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td rowspan="4"> Seed Cloud Host </td>
<td rowspan="4">1</td>
<td>Disk </td>
<td> 1TB - This host will store the downloaded images as well as act as a host where backup data is preserved.</td>
</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Memory </td>
<td colspan=2>16GB</td>
</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Network </td>
<td> 1 x 10GB NIC</td>
</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>CPU </td>
<td> 4 CPU cores</td>
</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td rowspan="4"> Undercloud Controller</td>
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
<td rowspan="4"> Overcloud Controller </td>
<td rowspan="4">3</td>
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
<td rowspan="4"> Overcloud Compute Server </td>
<td rowspan="4">1</td>
<td>Disk </td>
<td> 512GB</td>
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
<td rowspan="4"> Overcloud Swift server </td>
<td rowspan="4">2</td>
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

Software requirements for the Seed Cloud Host:

Ubuntu 14.04 with the following packages.

- xrdp 
- xfce4 
- qemu-kvm 
- libvirt-bin 
- openvswitch-switch 
- openvswitch-common 
- python-libvirt 
- libssl-dev 
- libffi-dev 
- virt-manager 
- chromium-browser

### Guest OS Support Matrix {#guestOS}

Our Guest OS support is based on the hypervisor vendor. 

For ESX, refer to the [VMware Compatibility Guide](http://www.vmware.com/resources/compatibility/search.php?action=search&deviceCategory=software&advancedORbasic=advanced&maxDisplayRows=50&key=&productId=4&gos_vmw_product_release%5B%5D=90&datePosted=-1&partnerId%5B%5D=-1&os_bits=-1&os_use%5B%5D=-1&os_family%5B%5D=-1&os_type%5B%5D=-1&rorre=0).

For KVM refer to the following table:

A **Qualified** Guest OS has been tested and will support the Guest OS running on HP Helion OpenStack.

A **Certified** Guest OS has been officially certified with the appropriate vendor of the OS.

<table><tr style="background-color: #808080; color: white; text-align: left; vertical-align: top;">
<td>OS</td>
<td>Qualified</td>
<td>Certified</td>
</tr>
<tr>
<td>Windows 2012 R2
</td>
<td>Yes</td>
<td>No</td>
</tr><tr>
<td> Ubuntu 14.10
</td>
<td>Yes</td>
<td>No</td>
</tr><tr>
<td> Ubuntu 14.04
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
 RHEL 6.5
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


### Other seed cloud host requirements and recommendations {#otherseed}

There are no software requirements for the undercloud and overcloud controllers.

Other requirements and recommendations for the seed cloud host are as follows:

- The Ubuntu 14.04 operating system must be installed
- A browser to access the undercloud or overcloud
- A desktop emulator, such as [Virtual Machine Manager](http://virt-manager.org/), to monitor and access cloud nodes
- A simple command line tool installed, such as [IPMItool](http://sourceforge.net/projects/ipmitool/), to determine the state of cloud nodes.

	**Important:** This system might be reconfigured during the installation process so a dedicated system is recommended. Reconfiguration might include installing additional software packages, and changes to the network or visualization configuration.


## Next Steps {#next}

Review the [HP Helion OpenStack&#174; Technical Overview](/helion/openstack/technical-overview/).

Prepare your environment for the installation, see [HP Helion OpenStack&#174; Installation: Prerequisites](/helion/openstack/install/prereqs/).



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
