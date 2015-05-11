---
layout: default
title: "HP Helion OpenStack&#174; 1.1: Support Matrix"
permalink: /helion/openstack/carrier/support-matrix/wr/
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

<p style="font-size: small;"> <a href="/helion/openstack/carrier/support-matrix/">&#9650; HP Helion OpenStack Carrier Grade (Alpha): Support Matrix</a>  </p>


# HP Helion OpenStack&#174; Carrier Grade (Alpha):Support Matrix for the Wind River&#174; Linux Region
<!-- Taken from Titanium Server Software Installation Guide, 15.x -->

To ensure the performance and stability of the systems running Wind River Linux in the HP Helion OpenStack Carrier Grade environment, it is very important to meet the requirements and conform to the following recommendations.

## Hardware Requirements {#hard}

For successful software installation and operation, the server hardware platform must meet specific requirements.

The servers running Wind River Linux consist of a set of hosts connected to internal and external networks:

* Two controller nodes are required.

The server runs on all x86-64 processors that support Intel Virtualization Technology (VT) VT-x/VT-d extensions. However, the kernel has been optimized specifically for the Intel Xeon-core family of processors.

### System / BIOS Requirements
The BIOS on each host must support PXE booting for initial installation of the server software.

### Memory Requirements

The following are the minimum RAM resources suggested for the hosts.

<table style="text-align: left; vertical-align: top;">
<tr style="background-color: #C8C8C8; text-align: left; vertical-align: top;">
<th>Host Type</th><th>RAM Size</th><tr>
<tr>
<td>Controller</td><td>32 GB</td></tr>
<tr>
<td>Compute</td><td>32 GB</td></tr>
</tr>
</table>

The actual memory requirement for production environments depends on the expected load. In particular, for compute nodes, the memory requirement depends on the expected number of virtual machines and the types of application running on them.

### Storage Requirements

The storage requirements for the Titanium Server depend on the system scale.

All hosts require one system disk where the Titanium Server system software is installed. System disks are automatically partitioned by the server installer program.

Controller nodes require an additional physical disk for volume storage. Storage nodes require an additional physical disk for OSD storage.

The following minimum hard drive capacities are suggested for the hosts.

<table style="text-align: left; vertical-align: top;">
<tr style="background-color: #C8C8C8; text-align: left; vertical-align: top;">
<tr>
<th>Host</th><th>Type</th><th>Drive Capacity</th></tr>
<tr>
<td>Controller</td><td>Primary disk</td><td>500 GB. A two-disk RAID-1 is suggested.</td></tr>
<tr>
<td>Controller</td><td>Secondary disk</td><td>500 GB. Solid-state drive recommended.
A two-disk RAID is suggested. </td></tr>
<tr>
<td>Compute</td><td>Primary disk</td><td>120 GB

</table>

**NOTE:** The storage configurations for controller-0 and controller-1 must be identical.

On the controller nodes, the disk space is used to accommodate a variety of content, including Titanium Server and guest images, the OpenStack configuration database, Cinder volumes, and Ceilometer CSV files.

For controller nodes, the suggested storage hardware includes the following:

* solid state drives (SSD) to improve overall performance
* hardware RAID array for transparent failover and fallback operations

The server uses distributed replicated block device (DRDB) technology to automatically synchronize the hard drives across the two controller nodes.

### Ethernet Interfaces

All hosts in the server server connect to at least the internal management network using an Ethernet interface. The ports used for this connection must support network booting and must be configured to be used as the primary booting device for normal operations.

Typically this means that they must be on-board ports, since in most BIOS/UEFI implementations only on-board ports can be configured for network booting. You can use ports on a 10 GB NIC instead, if these ports fulfill these requirements.

The following table illustrates the number and type of Ethernet ports required in two different installation scenarios. It assumes that the ports used to connect to the internal management network are on-board 1 GB ports.

**NOTE:** The following table assumes that each interface is connected to a single network. An Ethernet interface can be shared by more than one network.

<table style="text-align: left; vertical-align: top;">
<tr style="background-color: #C8C8C8; text-align: left; vertical-align: top;">
<tr>
<th>Personality</th><th>Basic Scenario</th><th>LAG Scenario</th></tr>
<tr>
<td>
Controller Node</td><td>* One 1G on-board interface (Internal management network)
<br>* One 1G interface (OAM)
<br>* One optional 1G or 10G interface (Infrastructure network)</td><td>
* Two 1G on-board interfaces (Internal
management network)
<br>* Two 1G interfaces (OAM)
<br>* Two optional 1G or 10G interfaces (Infrastructure network)
NOTE: The controller-0 and controller-1 port configurations
must be identical.</td><td>
<tr>
<td>Compute Node</td><td>* One 1G on-board interface (Internal management network)
<br>* One 1G (Intel i350) or 10G (Intel 82599) interface per additional Provider Network</td><td>
* Two 1G on-board interfaces (Internal management network)
<br>* Two 1G (Intel i350) or 10G (Intel 82599) interfaces per additional Provider Network</td></tr>
<tr>
</table>

In the basic scenario, a single Ethernet port is used to attach the host to each of the networks. In the LAG scenario, two Ethernet ports are used for each connection.

### Board Management Modules

For out-of-band reset and power-on/power-off capabilities, HP360 or HP380 servers equipped with HP iLO (Integrated Lights Out) board management modules are required. Each module must be connected using port-based VLAN to a switch that has access to the internal management network.

### USB Interface

For the controller, a USB interface is required for backup and restore operations, and for software installation if a DVD is not available.

## Network Requirements {#net}

The networking environment of the Titanium Server incorporates up to five types of network: 

* the internal management network
* the OAM network
* one or more provider networks
* an optional infrastructure network
* an optional board management network. 

Operational requirements for each network are described in the following sections.

### Internal Management Network
The internal management network must be implemented as a single, dedicated, Layer 2 broadcast domain for the exclusive use of each Titanium Server cluster. Sharing of this network by more than one Titanium Server cluster is not a supported configuration.

During the Titanium Server software installation process, several network services such as BOOTP, DHCP, and PXE, are expected to run over the internal management network. These services are used to bring up the different hosts to an operational state. Therefore, it is mandatory that this network be operational and available in advance, to ensure a successful installation.

On each host, the internal management network can be implemented using a 1Gb or 10 Gb Ethernet port. In either
case, requirements for this port are:

* must be capable of PXE-booting
* can be used by the motherboard as a primary boot device

### Infrastructure Network

This is an optional network. 

As with the internal management network, the infrastructure network must be implemented as a single, dedicated, Layer 2 broadcast domain for the exclusive use of each Titanium Server cluster.

Sharing of this network by more than one Titanium Server cluster is not a supported configuration.

The infrastructure network can be implemented as a 1Gb or 10 Gb Ethernet network. In its absence, all infrastructure traffic is carried over the internal management network.

### OAM Network

You should ensure that the following services are available on the OAM Network:

* DNS Service - Needed to facilitate the name resolution of servers reachable on the OAM Network.

	The Titanium Server can operate without a configured DNS service. However, a DNS service should be in place to ensure that links to external references in the current and future versions of the web administration interface work as expected.

* NTP Service - The Network Time Protocol (NTP) can be optionally used by the Titanium Server controller nodes to synchronize their local clocks with a reliable external time reference. However, it is strongly suggested that this service be available, among other things, to ensure that system-wide log reports present a unified view of the day-to-day
operations.

The Titanium Server compute nodes always use the controller nodes as the de-facto time server for the entire Titanium Server cluster.

### Provider Network

There are no specific requirements for network services to be available on the provider network. However, you must ensure that all network services required by the guests running in the compute nodes are available. For configuration purposes, the compute nodes themselves are entirely served by the services provided by the controller nodes over the internal management network.

### Board Management Network

The board management network is implemented on the internal L2 switch using a dedicated VLAN. Refer to Reference Logical Architecture on page 12 for further information on the internal L2 switch, and to The Board Management Network on page 38 for network planning details.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
