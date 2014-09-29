---
layout: default
title: "HP Helion OpenStack&#174; Support Matrix"
permalink: /helion/openstack/ga/support-matrix/
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
<p style="font-size: small;"> <a href="/helion/openstack/services/overview/">&#9664; PREV</a> | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/ga/install/overview/">NEXT &#9654;</a> </p>
-->

# HP Helion OpenStack&#174; Support Matrix
 
To ensure the performance and stability of the HP Helion OpenStack environment, it is very important to meet the requirements and conform to the recommendations.

This page provides an overview of the hardware and software that is supported for HP Helion OpenStack, including setup and configuration information. 

* [Deployment Architecture](#deploy-arch)
* [Supported Hardware](#supportedhw)
* [Supported Configurations](#supportedconfigurations)
* [Hardware and Network Configuration](#baremetal)
* [Usable Capacity](#usable-capacity)
* [Physical Network architecture](#physical-network-architecture)
* [Software Requirements](#software-requirements)

##Deployment Architecture<a name="deploy-arch"></a>

The following diagrams depict simplified deployment scenarios:

* <a href="javascript:window.open('/content/documentation/media/topology_kvm.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">KVM deployment of HP Helion OpenStack</a> (opens in a new window)
* <a href="javascript:window.open('/content/documentation/media/topology_esx.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">ESX deployment of HP Helion OpenStack</a> (opens in a new window)

## Supported Hardware<a name="supportedhw"></a>

HP supports the following hardware for HP Helion OpenStack deployment:
<table style="text-align: left; vertical-align: top;">

<tr style="background-color: #C8C8C8;">
<th> HP </th>
</tr>

<tr style="background-color: white; color: black;">
<td> 
<a href="http://www8.hp.com/us/en/products/proliant-servers/#!view=grid&page=1&facet=ProLiant-SL-Scalable">HP ProLiant BL160 Gen8 Server Blade</a>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> 
<a href="http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5249562">HP ProLiant BL420c Gen8 Server Blade</a>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> 
<a href="http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5177949">HP ProLiant BL460c Gen8 Server Blade</a>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> 
<a href="http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5193137">HP ProLiant BL465c Gen8 Server Blade</a>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> 
<a href="http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5268287">HP ProLiant BL660c Gen8 Server Blade</a>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> 
<a href="http://www8.hp.com/us/en/products/proliant-servers/#!view=grid&page=1&facet=ProLiant-SL-Scalable">HP ProLiant DL310e Gen8 Server V2</a>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> 
<a href="http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5379527">HP ProLiant DL320e Gen8 Server</a>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> 
<a href="http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5379527">HP ProLiant DL320e Gen8 Server V2</a>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> 
<a href="http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5249570">HP ProLiant DL360e Gen8 Server</a>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> 
<a href="http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5177953">HP ProLiant DL360p Gen8 Server</a>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> 
<a href="http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5261094">HP ProLiant DL380e Gen8 Server</a>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> 
<a href="http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5177957">HP ProLiant DL380p Gen8 Server</a>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> 
<a href="http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5177957">HP ProLiant DL380p Gen8 Server V2</a>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> 
<a href="http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5177957">HP ProLiant DL380p Gen8 Server SE</a>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> 
<a href="http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5249584">HP ProLiant DL385p Gen8 Server</a>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> 
<a href="http://www8.hp.com/us/en/products/proliant-servers/#!view=grid&page=1&facet=ProLiant-SL-Scalable">HP ProLiant DL388e Server</a>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> 
<a href="http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5268290">HP ProLiant DL560 Gen8 Server</a>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> 
<a href="http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=4142916">HP ProLiant DL580 G7 Server</a>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> 
<a href="http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=6636692">HP ProLiant DL580 Gen8 Server &mdash; Legacy Bios only (not uEFI)</a>
</td>
</tr>


<tr style="background-color: white; color: black;">
<td> 
<a href="http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5379860">HP ProLiant Microserver Gen8</a>
</td>
</tr>


<tr style="background-color: white; color: black;">
<td> 
<a href="http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5249594">HP ProLiant ML310e Gen8 Server</a>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> 
<a href="http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5260584">HP ProLiant ML350e Gen8 Server</a>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> 
<a href="http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5177961">HP ProLiant ML350p Gen8 Server</a>
</td>
</tr>


<tr style="background-color: white; color: black;">
<td> 
<a href="http://www8.hp.com/us/en/products/proliant-servers/#!view=grid&page=1&facet=ProLiant-SL-Scalable">HP ProLiant SL210t Gen8 Server</a>
</td>
</tr>


<tr style="background-color: white; color: black;">
<td> 
<a href="http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5177937">HP ProLiant SL230s Gen8 Server</a>
</td>
</tr>


<tr style="background-color: white; color: black;">
<td> 
<a href="http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5177941">HP ProLiant SL250s Gen8 Server</a>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> 
<a href="http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5177945">HP ProLiant SL270s Gen8 Server</a>
</td>
</tr>


<tr style="background-color: white; color: black;">
<td> 
<a href="http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5287871">HP ProLiant SL4540 Gen8 Server</a>
</td>
</tr>


</table>

## Supported Configurations<a name="supportedconfigurations"></a>

HP supports the following configurations for HP Helion OpenStack deployment:



- Host Interconnects/Protocols: 
   
      * 10Gb Software iSCSI
      * 8Gb and 16Gb Fibre-Channel
      * Software iSCSI and Fibre-Channel under KVM

- Target Interconnects: 
   
      * 8Gb FC SAN
      * 10Gb iSCSI CNA/NIC
      

- 3PAR InForm OS Version: 3.1.3 MU1 
   
     
## Hardware and Network Configuration<a name="baremetal"></a>

You must have the following hardware and network configuration:

- At least 7 and no more than 100 baremetal systems meeting the requirements as listed below.

Additional requirements are as follows:

- For systems with multiple NICs, the NICs must not be connected to the same Layer 2 network or VLAN.
- Capable of hosting VMs
- The boot order configured with Network/PXE boot as the first option:
	- For example, to set the boot order for a HP SL390, from the iLO prompt enter `set system1/bootconfig1/bootsource5 bootorder=1`.
	- To unset, enter `set system1/bootconfig1/bootsource5 bootorder=5`.

- The BIOS configured: 
	- To the correct date and time
	- With only one network interface enabled for PXE/network boot and any additional interfaces should have PXE/network boot disabled

- The latest firmware recommended by the system vendor for all system components, including the BIOS, BMC firmware, disk controller firmware, drive firmware, network adapter firmware, and so on.
- For Compute nodes, Intel or AMD hardware virtualization support required. The CPU cores and memory requirements must be sized based on the VM instances hosted by the Compute node.

	**Important:** Since the installer currently uses only the first available disk, all servers must have RAID controllers pre-configured to present their storage as a single, logical disk. RAID across multiple physical discs is strongly recommended for both  performance and resilience.

- An additional system to run the baremetal installer and host the seed VM meeting the requirements in the table below. Other requirements and recommendations are as follows:

	- The Ubuntu 14.04 operating system must be installed
	- A browser to access the undercloud or overcloud
	- A desktop emulator, such as [Virtual Machine Manager](http://virt-manager.org/), to monitor and access cloud nodes
	- A simple command line tool installed, such as [IPMItool](http://sourceforge.net/projects/ipmitool/), to determine the state of cloud nodes.

	**Important:** This system might be reconfigured during the installation process so a dedicated system is recommended. Reconfiguration might include installing additional software packages, and changes to the network or visualization configuration.

-You must also satisfy these network configuration requirements:

 - The seed VM, the baremetal systems and the baremetal controllers must be on the same network

- Ensure network interfaces that are not used for PXE boot are disabled from BIOS to prevent PXE boot attempts from those devices.

- The seed VM, the baremetal systems, and the BMC (IPMI controller) for all baremetal systems must be on a common network.

- If you have other DHCP servers on the same network as your system, you must ensure that the DHCP server does not hand out IP addresses to your physical nodes as they PXE boot.

- The network interface intended as the bridge interface should be configured and working before running the installer. The installer creates a network bridge on the system running the installer, attaching the bridge interface to the network bridge. The installer uses the IP address of the bridge interface for the network bridge.


<table style="text-align: left; vertical-align: top;">

<tr style="background-color: #C8C8C8; text-align: left; vertical-align: top;">
<th>Node type</th>
<th>Server hardware</th>
<th>Minimum requirements and recommendations</th>
</tr>


<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td rowspan="4"> Seed cloud host </td>
<td>Disk </td>
<td> 100 GB - There are additional disk space requirements on the host to store the downloaded images (including the seed). See the product image download details.</td>
</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Memory </td>
<td>16 GB</td>

</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Network </td>
<td> 1 x 10 GB NIC</td>

</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>CPU </td>
<td> 4 CPU cores</td>

</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td rowspan="4"> Undercloud controller</td>
<td>Disk </td>
<td> 2 TB - The undercloud contains the images and potentially many successive versions of update images for the overcloud and these all are stored on the local disk. Do not underestimate you storage needs.</td>



</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Memory </td>
<td> 32 GB </td>

</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Network </td>
<td> 1 x 10 GB NIC with PXE support</td>

</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>CPU </td>
<td>8 CPU cores - Intel or AMD 64-bit processor </td>

</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td rowspan="4"> Overcloud controller </td>
<td>Disk </td>
<td> 500GB - 2TB
 </td>



</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Memory </td>
<td>32 GB </td>

</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Network </td>
<td> 1 x 10 GB NIC with PXE support</td>

</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>CPU </td>
<td>8 CPU cores - Intel or AMD 64-bit processor </td>



</tr>


<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td rowspan="4"> Overcloud Compute server </td>
<td>Disk </td>
<td> 500GB - 2TB</td>

</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Memory </td>
<td>32 GB - Memory must be sized based on the VM instances hosted by the Compute node.</td>

</tr>
<tr style="background-color: white; color: black;">
<td>Network </td>
<td> 1 x 10 GB NIC with PXE support</td>

</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>CPU </td>
<td>8 CPU cores - Intel or AMD 64-bit processor with hardware virtualization support. The CPU cores must be sized based on the VM instances hosted by the Compute node. </td>


</tr>


<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td rowspan="4"> Overcloud Swift server </td>
<td>Disk </td>
<td> 500GB - 2TB
</td>

</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Memory </td>
<td>32 GB </td>

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

<!--
### Hardware Configuration
The following table shows the minimum recommendations for hardware by node type.

<table style="text-align: left; vertical-align: top;">
<tr style="background-color: #C8C8C8; text-align: left; vertical-align: top;">
<th>Node type</th>
<th>Virtual/physical</th>
<th>CPU cores</th>
<th>Memory</th>
<th>Internal storage</th>
<th>NICs</th>
</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td> KVM host</td>
<td> Baremetal</td>
<td>4* </td>
<td> 8 GB*</td>
<td> 100 GB</td>
<td>2 </td>
</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td> Undercloud controller</td>
<td> Baremetal</td>
<td>8 </td>
<td> </td>
<td> </td>
<td> </td>
</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Overcloud controller </td>
<td> Baremetal</td>
<td>8 </td>
<td> </td>
<td> </td>
<td> </td>
</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td> Overcloud Compute 1</td>
<td> Baremetal</td>
<td>8**</td>
<td> </td>
<td> </td>
<td> </td>
</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td> Overcloud Compute 2</td>
<td> Baremetal</td>
<td>8** </td>
<td> </td>
<td> </td>
<td> </td>
</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Overcloud Compute 3 </td>
<td> Baremetal</td>
<td>8 </td>
<td> </td>
<td> </td>
<td> </td>
</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Overcloud Swift 1 </td>
<td> Baremetal</td>
<td> 8</td>
<td> </td>
<td> </td>
<td> </td>
</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Overcloud Swift 2 </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
</tr>
</table>


## Usable Capacity<a name="usable_capacity"></a>

The following table maps the minimum server configuration into usable capacity of the overcloud.


<table style="text-align: left; vertical-align: top;">

<tr style="background-color: #C8C8C8; text-align: left; vertical-align: top;">
<th>Service</th>
<th>Usable capacity</th>
<th>Notes</th>
</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td> VMs </td>
<td> 6 standard.medium (4 GB memory, 80 GB disk) </td>
<td> Assumes 8 GB of memory and 200 GB of disk overhead. Capacity increases linearly with Compute nodes.</td>
</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td> Volumes </td>
<td> 1800 GB</td>
<td> Capacity is fixed</td>
</tr>		

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td> Object storage</td>
<td> 400 GB; equivalent to:
<ul><li>160 images, based on 2.5 GB images</li>
or
<li>40 volume backups, based on 10 GB volumes</li>
</li> </td>
<td> In addition to your objects, object storage is used for images and volume backups. With 640 GB per server (after subtracting 60 GB for the OS) this leaves about 400 usable GB (1280/3.2). This is assuming an average Linux image/snapshot of 2.5 GB (the 2.5 GB is the average size of images in the swift public cloud in US-East) and a 10 GB Cinder volume backup.

<p>Note: These are the maximum figures assuming the storage is used exclusively for that type of object.</p>  </td>
</tr>			
</table>
-->


## Physical Network Architecture<a name="physical-network-architecture"></a>
This table provides an overview of the physical network configuration requirements you must meet, with the following assumptions:

- Physical network ports on each server
	- One IPMI port
	- One physical ethernet port (for example, eth0) for the hypervisor/OS

- Network fabric
	- Two physical links, one for IPMI and one for the hypervisor/OS
	- Network switches capable of basic VLAN, L2 and L3 functions;
	- The physical hypervisor/OS network is shared by a number of logical networks, and each logical network has its own VLAN and IP subnet

For detailed information, see the [Preparing the network](/helion/openstack/ga/install/prereqs/#network) section of the *Prerequisites*.

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: #C8C8C8;">
<th> Network </th>
<th> Description </th>
<th> VLAN type </th>
<th> Server port </th>

</tr>

<tr style="background-color: white; color: black;">
<td> IPMI / iLO </td>
<td> Network for server hardware management </td>
<td> Untagged </td>
<td> IPMI or iLO</td>

</tr>

<tr style="background-color: white; color: black;">
<td> Undercloud management </td>
<td> <ul><li>Traffic for undercloud internal OpenStack calls, Glance image downloads, etc.</li>
<li>Provides access to undercloud API endpoints</li>
<li>Used to PXE boot overcloud servers</li>
</ul> </td>
<td> Untagged </td>
<td> eth0</td>

</tr>

<tr style="background-color: white; color: black;">
<td> Overcloud management </td>
<td> Traffic for overcloud internal OpenStack calls, Glance image downloads, etc. </td>
<td> Untagged </td>
<td> eth0</td>

</tr>

<tr style="background-color: white; color: black;">
<td> SDN </td>
<td> Network between workload VMs, e.g. carries VxLAN traffic </td>
<td> Untagged </td>
<td> eth0</td>

</tr>

<tr style="background-color: white; color: black;">
<td> Storage </td>
<td> iSCSi traffic between VMs and storage products like StoreVirtual </td>
<td> Untagged </td>
<td> eth0</td>

</tr>

<tr style="background-color: white; color: black;">
<td> External </td>
<td><ul><li> Connected to internet or intranet</li>
<li>Provides floating IPs</li></ul> </td>
<td> Tagged </td>
<td> eth0</td>

</tr>

<tr style="background-color: white; color: black;">
<td> Service </td>
<td>Connects trusted VMs in overcloud to communicate with cloud infrastructure components in undercloud</td>
<td>Tagged</td>
<td>eth0</td>

</tr>

<tr style="background-color: white; color: black;">
<td> Swift </td>
<td> Communication between Swift servers (includes user data)  </td>
<td> Untagged </td>
<td> eth0</td>

</tr>

</table>

## Software Requirements <a name="software-requirements"></a>

Software requirements for the seed cloud host:

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


There are no software requirements for the undercloud and overcloud controllers.

## Next Steps<a name="next"></a>

Review the [HP Helion OpenStack&#174; Technical Overview](/helion/openstack/ga/technical-overview/).

Prepare your environment for the installation, see [HP Helion OpenStack&#174; Installation: Prerequisites](/helion/openstack/ga/install/prereqs/).



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
