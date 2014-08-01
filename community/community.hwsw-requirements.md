---
layout: default
title: "HP Helion OpenStack Community Hardware and Software Requirements"
permalink: /helion/community/hwsw-requirements/
product: community

---
<!--PUBLISHED-->


<p style="font-size: small;"> <a href="/helion/community/">&#9664; PREV</a> | <a href="/helion/community/">&#9650; UP</a> | <a href="/helion/community/install-overview/">NEXT &#9654;</a> </p>


# HP Helion OpenStack&reg; Community Hardware and Software Requirements

This page provides an overview of the hardware and software that is supported for HP Helion OpenStack Community edition, and includes setup and configuration information. For the performance and stability of the HP Helion OpenStack Community edition environment, it is very important to meet the requirements and conform to the minimum recommendations.

* [Supported hardware](#supportedhw)

* [Hardware and software configuration for baremetal installation](#baremetal)

* [Hardware and software configuration for virtual installation](#virtual)
    
* [Usable capacity](#usable-capacity)

* [Physical network architecture](#physical-network-architecture)


## Supported hardware ## {#supportedhw}

The following hardware is supported for Helion OpenStack Community Edition:
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

## Hardware and network configuration for  multi-node baremetal installation {#baremetal}
The [multi-node baremetal installation of HP Helion OpenStack Community](/helion/community/install/), is configured for a minimum of 5 and maximum of 30 baremetal systems. For this installation, you must have the following hardware and network configuration:

* At least 5 and up to 30 baremetal systems with the following configuration:

    * A minimum of 32 GB of physical memory
    * A minimum of 2 TB of disk space
    * A minimum of 1 x 10 GB NIC with PXE support

      * For systems with multiple NICs, the NICs must not be connected to the same Layer 2 network or VLAN.

    * Capable of hosting VMs
    * The boot order configured with Network/PXE boot as the first option
    
        For example, to set the boot order for a HP SL390, from the iLO prompt enter `set system1/bootconfig1/bootsource5 bootorder=1`.

        To unset, enter `set system1/bootconfig1/bootsource5 bootorder=5`.

    * The BIOS configured: 
     
      * To the correct date and time
      * With only one network interface enabled for PXE/network boot and any additional interfaces should have PXE/network boot disabled

    * Running the latest firmware recommended by the system vendor for all system components, including the BIOS, BMC firmware, disk controller firmware, drive firmware, network adapter firmware, and so on


    **Important:** Since the installer currently uses only the first available disk, all servers must have RAID controllers pre-configured to present their storage as a single, logical disk. RAID across multiple physical discs is strongly recommended for both  performance and resilience.

* An additional system to run the baremetal installer and host the seed VM with the following configuration:

    * A minimum of 8 GB of physical memory
    * A minimum of 100 GB of disk space 
    * One of the following operating systems installed:

      * Ubuntu 13.10
      * Ubuntu 14.04

    * If they are not already installed, the following required Debian/Ubuntu packages are added to the system; however, we recommend you install them beforehand.

     * qemu
     * openvswitch
     * libvirt
     * python-libvirt

    **Important:** This system might be reconfigured during the installation process so a dedicated system is recommended. Reconfiguration might include installing additional software packages, and changes to the network or virtualisation configuration.

* You must also satisfy these network configuration requirements:

    * The seed VM, the baremetal systems and the baremetal controllers must be on the same network

    * Ensure network interfaces that are not used for PXE boot are disabled from BIOS to prevent PXE boot attempts from those devices.

    * If you have other DHCP servers on the same network as your system, you must ensure that the DHCP server does not hand out IP addresses to your physical nodes as they PXE boot.

    * The network interface intended as the bridge interface should be configured and working before running the installer. The installer creates a network bridge on the system running the installer, attaching the bridge interface to the network bridge. The installer uses the IP address of the bridge interface for the network bridge.

## Hardware and software configuration for virtual installation {#virtual}
For the [virtual installation](/helion/community/install-virtual/) you must use a system that meets or exceeds the following hardware specification:

* At least 48 GB of RAM
* At least 200 GB of available disk space
* Virtualization support **enabled** in the BIOS
* One of the following operating systems installed:

    * Ubuntu 13.10
    * Ubuntu 14.04

* If they are not already installed, the following required Debian/Ubuntu packages are added to the system:

    * qemu
    * openvswitch
    * libvirt
    * python-libvirt
    * openssh-server

        **Note:** Ensure that the firewall configuration allows access to the ssh ports.

## Usable capacity

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
<td> Assumes 8 GB of memory and 200 GB of disk overhead. Capacity increases linearly with compute nodes.</td>
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
<td> In addition to your objects, object storage is used for images and volume backups. With 640 GB per server (after subtracting 60 GB for the OS) this leaves about 400 usable GB (1280/3.2). This is assuming an average Linux image/snapshot of 2.5 GB (the 2.5 GB is the average size of images in the swift public cloud in US-East) and a 10 GB cinder volume backup.

<p>Note: These are the maximum figures assuming the storage is used exclusively for that type of object.</p>  </td>
</tr>			
</table>

## Physical network architecture
This table provides an overview of the physical network configuration requirements you must meet, with the following assumptions:

- Physical network ports on each server
  - One IPMI/iLO port
  - One physical ethernet port (for example, eth0) or two physical ethernet ports in a bond (for example, bond0) for the hypervisor/OS

- Network fabric
  - Two physical links, one for IPMI/iLO and one for the hypervisor/OS
  - Network switches capable of basic VLAN, L2 and L3 functions; no dependency on, for example, VxLAN-capable or OpenFlow-enabled switch

- The physical hypervisor/OS network is shared by a number of logical networks, and each logical network has its own VLAN and IP subnet
- If you have other DHCP servers on the same network, you must ensure that the DHCP server does not hand out IP addresses to your physical nodes as they PXE boot.

<!--
For detailed information, see the [Reference architecture](/helion/community//reference-architecture/).
--> 

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
<td> eth0 or bond0</td>

</tr>

<tr style="background-color: white; color: black;">
<td> Overcloud management </td>
<td> Traffic for overcloud internal OpenStack calls, glance image downloads, etc. </td>
<td> Tagged </td>
<td> eth0 or bond0</td>

</tr>

<tr style="background-color: white; color: black;">
<td> SDN </td>
<td> Network between workload VMs, e.g. carries VxLAN traffic </td>
<td> Tagged </td>
<td> eth0 or bond0</td>

</tr>

<tr style="background-color: white; color: black;">
<td> Storage </td>
<td> iSCSi traffic between VMs and storage products like StoreVirtual </td>
<td> Tagged </td>
<td> eth0 or bond0</td>

</tr>

<tr style="background-color: white; color: black;">
<td> External </td>
<td><ul><li> Connected to internet or intranet</li>
<li>Provides floating IPs</li></ul> </td>
<td> Tagged </td>
<td> eth0 or bond0</td>

</tr>

<tr style="background-color: white; color: black;">
<td> External-API </td>
<td> <ul><li>Connected to internet or intranet</li>
<li>Provides access to overcloud API endpoints</li></ul> </td>
<td> Tagged </td>
<td> eth0 or bond0</td>

</tr>

<tr style="background-color: white; color: black;">
<td> Swift </td>
<td> Communication between swift servers (includes user data)  </td>
<td> Tagged </td>
<td> eth0 or bond0</td>

</tr>

</table>

<!--
## Network configuration


The following table identifies network requirements for the HP OpenStack Community edition environment.

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: #C8C8C8;">
<th> Network </th>
<th> Speed </th>
<th> <nobr> Tagged * </nobr> </th>
<th> Required </th>
<th> Notes </th>
</tr>

<tr style="background-color: white; color: black;">
<td> Internal management network </td>
<td> ? </td>
<td> ? </td>
<td> Y </td>
<td> Used for management functions, such as powering on and off. Must be an Isolated Private Network. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> IPMI network </td>
<td> ? </td>
<td> ? </td>
<td> Y </td>
<td>  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> External network </td>
<td> ? </td>
<td> ? </td>
<td> Y </td>
<td>  </td>
</tr>
</table>
Used to deploy cloud. Must be able to reach management network and be an Isolated Private Network. There cannot be another DHCP server running on the network. -->

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
