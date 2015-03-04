---
layout: default
title: "HP Helion OpenStack&#174; Community Hardware and Software Requirements"
permalink: /helion/community/hwsw-requirements/
product: community

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/community/">&#9664; PREV</a> | <a href="/helion/community/">&#9650; UP</a> | <a href="/helion/community/install-overview/">NEXT &#9654;</a> </p>
-->

# HP Helion OpenStack&#174; Community Hardware and Software Requirements

This page provides an overview of the hardware and software that is supported for HP Helion OpenStack Community edition and includes setup and configuration information. For the performance and stability of the HP Helion OpenStack Community edition environment, it is very important to meet the requirements and conform to the minimum recommendations.

* [Supported hardware](#supportedhw)
* [Hardware and Software Requirements](#hardware)
	* [For baremetal installation](#baremetal)
	* [For virtual installation](#virtual)
* [Software configuration](#software)
* [Usable capacity](#usable-capacity)


## Supported hardware {#supportedhw}

The following hardware is supported for Helion OpenStack Community edition for both virtual and baremetal installations:

### HP Proliant BladeSystem

- [BL160 Gen8](http://www8.hp.com/us/en/products/proliant-servers/#!view=grid&page=1&facet=ProLiant-SL-Scalable)
- [BL420c Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5249562)
- [BL460c Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5177949)
- [BL465c Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5193137)
- [BL660c Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5268287)

### HP Proliant Rack Servers

- [DL310 Gen8](http://www8.hp.com/us/en/products/proliant-servers/#!view=grid&page=1&facet=ProLiant-SL-Scalable)
- [DL320 Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5379527)
- [DL360 Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5249570)
- [DL380 Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5177957)
- [DL385 Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5249584)
- [DL560 Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5268290)
- [DL580 G7](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=4142916)
- [DL580 Gen8 Legacy boot support only, no uEFI](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5177957)

### HP Proliant Tower Servers

- [ML310 Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5249594)
- [DL350 Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5260584)
<br />
### HP Proliant Scalable Systems

- [SL230s Gen8](http://www8.hp.com/us/en/products/proliant-servers/#!view=grid&page=1&facet=ProLiant-SL-Scalable)
- [SL250s Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5177941)
- [SL270s Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5177945)
- [SL4540 Gen8](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=5287871)

### IBM systems ###

- [IBM System x3550 M4 Server](http://www-03.ibm.com/systems/x/hardware/rack/x3550m4/)

### Dell systems###

- [Power Edge R620](http://www.dell.com/us/business/p/poweredge-r620/pd)

## Hardware configuration {#hardware}

Make sure your server(s) meet the requirements appropriate for the installation type:

* [Baremetal installations](#baremetal)
* [Virtual installations](#virtual)

### Hardware configuration for baremetal installations {#baremetal}

The [multi-node baremetal installation of HP Helion OpenStack Community](/helion/community/install/) is configured for a minimum of 7 and maximum of 36 baremetal systems, plus a system to run the installation. For this installation, your hardware must meet the following minimum requirements:

* A system to run the installer (called the seed cloud host or installer system) and host the seed VM that meets the following minimum requirements:

	* A minimum of 16 GB of physical memory
	* A minimum of 100 GB of disk space 
	* The Ubuntu 13.10 or 14.04 operating system installed

	**Important:** This system might be reconfigured during the installation process so a dedicated system is recommended. Reconfiguration might include installing additional software packages and changes to the network or virtualization configuration.

* At least 7 and up to 36 baremetal systems that meet the following configuration:

	* A minimum of 32 GB of physical memory
	* A maximum of 2 TB of disk space
	* A minimum of 1 x 10 GB NIC with PXE support

		* For systems with multiple NICs, the NICs must not be connected to the same Layer 2 network or VLAN.

	* Capable of hosting VMs
	* The boot order configured with Network/PXE boot as the first option
	* The BIOS configured: 
		* To the correct date and time
		* With only one network interface enabled for PXE/network boot and any additional interfaces should have PXE/network boot disabled
		* To stay powered off in the event of being shutdown rather than automatically restarting

	* Running the latest firmware recommended by the system vendor for all system components, including the BIOS, BMC firmware, disk controller firmware, drive firmware, and network adapter firmware.

	* The installer currently uses only the first available disk; servers with RAID controllers need to be pre-configured to present their storage as a single logical disk. RAID across multiple disks is strongly recommended for both performance and resilience.

	* When installing make sure there is no wildcard DHCP server on your network. The wildcard DHCP server will likely reply to the booting under/overcloud servers before the seed VM, which will cause the PXE boot process to fail.

## Hardware and software configuration for virtual installations {#virtual}

For the [virtual installation](/helion/community/install-virtual/) you must use a system that meets the following requirements:

* At least 64GB of RAM
* At least 200GB of available disk space
* Virtualization support **enabled** in the BIOS
* The Ubuntu 13.10 operating system installed

**Note:** At this time, the installer has been verified to work on Ubuntu 13.10 **only**. It does not work on Ubuntu
 12.04, 14.04; Debian (stable or testing); CentOS (any version) or hLinux (any version).

## Software configuration {#software}

Make sure your server(s) meet the following requirements for both virtual and baremetal installations:

If they are not already installed, install the following required Debian/Ubuntu packages:

* `qemu`
* `openvswitch`
* `libvirt`
* `python-libvirt`
* `openssh-server`

Baremetal installations running Ubuntu 14.04 also must install the `qemu-kvm` package.

**Note:** Ensure that the firewall configuration allows access to the SSH ports.

Install these packages before starting the installation process using the following command:

`sudo apt-get install -y libvirt-bin openvswitch-switch python-libvirt qemu-system-x86`

After you install the `libvirt` packages, you must reboot or restart `libvirt`:

`sudo /etc/init.d/libvirt-bin restart`

Install a desktop emulator, such as [Virtual Machine Manager](http://virt-manager.org/), to monitor and access cloud nodes


## Usable capacity

The following table maps the minimum server configuration into usable capacity of the overcloud for both virtual and baremetal installations.

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
<td> In addition to your objects, object storage is used for images and volume backups. With 640 GB per server (after subtracting 60 GB for the OS) this leaves about 400 usable GB (1280/3.2). This is assuming an average Linux image/snapshot of 2.5 GB and a 10 GB cinder volume backup.

<p>Note: These are the maximum figures assuming the storage is used exclusively for that type of object.</p>  </td>
</tr>			
</table>

## Next Steps {#next}

**For baremetal installations**, review the networking information in [Community Network Architecture and Configuration](/helion/community/network-requirements/).

**For virtual installations**, proceed to the installation in [Community Virtual Installation and Configuration](/helion/community/install-virtual/),

 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
