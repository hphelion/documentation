---
layout: default
title: "HP Helion OpenStack&#174; Community Network Architecture and Configuration"
permalink: /helion/community/network-requirements/
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

# HP Helion 1.0 OpenStack&reg; Community Network Architecture and Configuration -- Baremetal Installations Only

This page provides an overview of important information on the network configuration required for a baremetal HP Helion OpenCloud Community edition installation.

For virtual installations, the installation simulates the deployment of OpenStack by creating and configuring a set of virtual machines (VMs) on a single system. As such, no manual network configuration is required.

* [Physical network architecture](#physical-network-architecture)
* [Network configuration for a baremetal installation](#config)
	* [Network defaults](#NetworkDefault)
	* [Changing the default networking configuration](#changedefault) 


## Physical network architecture

The table in this section provides an overview of the physical network configuration requirements you must meet, with the following assumptions:

- Physical network ports on each server:
  - One IPMI/iLO port
  - One physical ethernet port (for example, eth0) for the hypervisor/OS

- Network fabric
  - Two physical links, one for IPMI/iLO and one for the hypervisor/OS
  - Network switches capable of basic VLAN, L2 and L3 functions; no dependency on, for example, VxLAN-capable or OpenFlow-enabled switch

- The physical hypervisor/OS network is shared by a number of logical networks, and each logical network has its own VLAN and IP subnet.
- The seed VM, the baremetal systems, and the BMC (IPMI controller) for all
  baremetal systems must be on a common network.

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
<td> eth0</td>

</tr>

<tr style="background-color: white; color: black;">
<td> Overcloud management </td>
<td> Traffic for overcloud internal OpenStack calls, glance image downloads, etc. </td>
<td> Tagged </td>
<td> eth0</td>

</tr>

<tr style="background-color: white; color: black;">
<td> SDN </td>
<td> Network between workload VMs, e.g. carries VxLAN traffic </td>
<td> Tagged </td>
<td> eth0</td>

</tr>

<tr style="background-color: white; color: black;">
<td> Storage </td>
<td> iSCSi traffic between VMs and storage products like StoreVirtual </td>
<td> Tagged </td>
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
<td> External-API </td>
<td> <ul><li>Connected to internet or intranet</li>
<li>Provides access to overcloud API endpoints</li></ul> </td>
<td> Tagged </td>
<td> eth0</td>

</tr>

<tr style="background-color: white; color: black;">
<td> Swift </td>
<td> Communication between swift servers (includes user data)  </td>
<td> Tagged </td>
<td> eth0</td>

</tr>

</table>


## Network configuration {#config}

Make sure your network is configured to include the following criteria:

* The seed VM, the baremetal systems and the IPMI controller for all systems must be on the same network.

* Any network interfaces that are not used for PXE boot must be disabled from BIOS to prevent PXE boot attempts from those devices.

* Any DHCP servers on the same network as your system must not hand out IP addresses to your physical nodes as they PXE boot.

* Make sure there is no wildcard DHCP server on your network. The wildcard DHCP server will likely reply to the booting under/overcloud servers before the seed VM, which will cause the PXE boot process to fail.

* The network interface intended as the bridge interface should be configured and working before running the installer. The installer creates a network bridge on the system running the installer, attaching the bridge interface to the network bridge. The installer uses the IP address of the bridge interface for the network bridge.

* The IPMI/BMC interfaces of the real hardware must be accessible from the seed VM.

 
### Network defaults {#NetworkDefault}

The installation process includes a number of default configurations. You can change many of these defaults during the installation, using the steps detailed in [Community Baremetal Installation and Configuration](/helion/community/install/).

Note the following default settings:

- The default network configuration uses a single subnet 192.0.2.0/24 for all networking. 
- The Seed VM is assigned an IP address of 192.0.2.1, in addition to the IP address assigned by the [libvirt package](#packages). 
- The external interface of host of the seed VM is added to a software bridge, called *brbm*, on the host and the IP address of the external interface is transferred to the bridge. This allows external traffic on 192.0.2.0/24 to be routed to the seed VM.
- The seed VM is the gateway for all traffic outside the baremetal network.
- IP addresses are assigned by default as follows:

	- 192.0.2.2-192.0.2.20 is used by the seed cloud to administer the undercloud nodes
	- 192.0.2.21-192.0.2.124 is used by the undercloud to administer the overcloud nodes
	- 192.0.2.129-1920.0.2.254 is used as a pool of addresses for floating IPs for the virtual machines in the overcloud.

- The IP address range for the private IPs assigned to new virtual instances is 10.0.0.0/8. 

### Changing the default networking configuration {#changedefault}

In the default configuration, the default pool of floating IP addresses for the overcloud is within the baremetal subnet. You can select a different pool of addresses during the installation. If you select a pool of addresses outside the baremetal subnet, make sure those addresses are accessible.

**Example:**

The following example shows how to select a range of IP addresses from 10.23.144.10 to 10.23.151.254 with a subnet mask of 10.23.144.0/21. To avoid overlap with the default private network range of 10.0.0.0/8, `OVERCLOUD_FIXED_RANGE_CIDR` is changed to 10.0.0.0/16.

During the [installation](/helion/community/install/) you must set `OVERCLOUD_NeutronPublicInterface` to the name of the VLAN on which the floating IP addresses will reside (you must create this VLAN separately).

	export FLOATING_START=10.23.144.10
	export FLOATING_END=10.23.151.254
	export FLOATING_CIDR=10.23.144.0/21
	export OVERCLOUD_FIXED_RANGE_CIDR=10.0.0.0/16
	export OVERCLOUD_NeutronPublicInterface=vlan1515
	export NeutronPublicInterfaceRawDevice=eth0
	export OVERCLOUD_VIRTUAL_INTERFACE=eth0

  This example assumes a homogeneous overcloud compute hardware.

**Important:** IP addresses in the ranges chosen for the undercloud and overcloud must not be used by other nodes
on your network.

## Next Step

Proceed to the installation in [Community Baremetal Installation and Configuration](/helion/community/install/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
