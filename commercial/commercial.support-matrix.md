---
layout: default
title: "HP Helion OpenStack Edition: Support Matrix"
permalink: /cloudos/commercial/support-matrix/
product: commercial

---



<p style="font-size: small;"> <a href="/cloudos/commercial/">&#9664; PREV</a> | <a href="/cloudos/commercial/">&#9650; UP</a> | <a href="/cloudos/commercial/">NEXT &#9654;</a> </p>



# HP Helion OpenStack Enterprise Edition: Support Matrix

This document provides an overview of the supported hardware and software for the HP Helion OpenStack Enterprise Edition, including information for hardware and software setup.

* [Server infrastructure](#server-infrastructure)

  * [Hardware requirements](#hardware-requirements)

  * [Hardware requirements for specific server roles](#hardware-requirements-for-specific-server-roles)

  * [Usable capacity](#usable-capacity)

* [Storage requirements](#storage-requirement)

* [Physical network architecture](#physical-network-architecture)

* [Network configuration](#network-configuration)

* [Software requirements](#software-requirements)

## Server infrastructure

For the performance and stability of the HP Helion OpenStack Edition environment, it is very important to meet the minimum recommendations for memory, processors, and disk space for each of the components defined in the table below. 
Before installation, please reference the appropriate platform support matrix for each component product.

### Hardware requirements

REVIEWERS: Gavin recommends suppressing this section - "There should be no list of specific hardware types at this point. I’ve no idea what we want to formally support, but we’ve not tested any of the set listed."

All servers must be capable of hosting VMs. At a minimum, they must also have 32 GB of memory and 1 NIC.

<table style="text-align: left; vertical-align: top;">

<tr style="background-color: #C8C8C8;">
<th> HP </th>
</tr>

<tr style="background-color: white; color: black;">
<td> ProLiant DL360p Gen8 </td>
</tr>

<tr style="background-color: white; color: black;">
<td> ProLiant DL380p Gen7 </td>
</tr>

<tr style="background-color: white; color: black;">
<td> BladeSystem c7000 - ProLiant BL490c Gen6 </td>
</tr>

<tr style="background-color: white; color: black;">
<td> BladeSystem c7000 - ProLiant BL490c Gen7 </td>
</tr>

<tr style="background-color: white; color: black;">
<td> BladeSystem c7000 - ProLiant BL460c Gen8 </td>
</tr>

<tr style="background-color: #C8C8C8;">
<th> Dell </th>
</tr>

<tr style="background-color: white; color: black;">
<td> Dell R620CTL </td>
</tr>

<tr style="background-color: white; color: black;">
<td> M100E - PowerEdge M620 </td>
</tr>

<tr style="background-color: #C8C8C8;">
<th> IBM </th>
</tr>

<tr style="background-color: white; color: black;">
<td> IBM x3550 M4 CTL </td>
</tr>

<tr style="background-color: white; color: black;">
<td> BladeCenter S -  IBM Blade Center HS23 </td>
</tr>

</table>


### Hardware requirements for specific server roles

REVIEWERS: Gavin recommends suppressing this section - "There should be no list of specific hardware types at this point. I’ve no idea what we want to formally support, but we’ve not tested any of the set listed."

<table style="text-align: left; vertical-align: top;">

<tr style="background-color: #C8C8C8; text-align: left; vertical-align: top;">
<th>Server role</th>
<th>Server hardware</th>
<th>Minimum requirements and recommendations</th>
</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td rowspan="4"> Admin or management node ?</td>
<td>Disk </td>
<td> ?</td>
</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Memory </td>
<td>? </td>

</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Network </td>
<td> ?</td>

</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>CPU </td>
<td> ?</td>
</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td rowspan="4"> Seed cloud (VM) </td>
<td>Disk </td>
<td> There are additional disk space requirements on the host to store the downloaded images (including the seed), the seed's virtual size in TB.</td>
</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Memory </td>
<td>2048 MB </td>

</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Network </td>
<td> 1 VNIC</td>

</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>CPU </td>
<td> 1 virtual CPU</td>

</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td rowspan="4"> Undercloud server (x1)</td>
<td>Disk </td>
<td> 2x200 GB disks configured as a single 400 GB device using a RAID controller
<p>The Undercloud will contain the images AND potentially many successive versions of update images for the Overcloud and these all are stored on the local disk. So do not underestimate you storage needs.</p> <p>REVIEWERS: Would the min spec be better worded as - At least one local device of size 400GB, rather than steering people to RAID0? and Recommended Specification would be RAID1</p></td>



</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Memory </td>
<td> 24 GB </td>

</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Network </td>
<td> <ul><li>Minimum: 10 GB NIC w/PXE support</li>
<li>Recommended: 2x10 GB NIC capable of being bonded</li></ul></td>

</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>CPU </td>
<td>Intel or AMD 64-bit processor </td>

</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td rowspan="4"> Overcloud control plane server (x3) </td>
<td>Disk </td>
<td> 2x350 GB disks configured, using a RAID controller, as 100 GB for the system and 600 GB for volume storage</td>



</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Memory </td>
<td>32 GB </td>

</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Network </td>
<td><ul><li>Minimum: 10 GB NIC w/PXE support</li>
<li>Recommended: 2x10 GB NIC capable of being bonded</li></ul></td>

</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>CPU </td>
<td>Intel or AMD 64-bit processor </td>



</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td rowspan="4"> Overcloud swift object server (x2) </td>
<td>Disk </td>
<td> <ul><li>Minimum: 2x350 GB disks configured  as a single 700 GB device using a RAID controller</li>
<li>Recommended: 4x2 TB disks; with 3 object servers (4x2x2/3.2), this equates to about 5 usable TB. </li></ul></td>

</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Memory </td>
<td>32 GB </td>

</tr>
<tr style="background-color: white; color: black;">
<td>Network </td>
<td> 10 GB NIC w/PXE support</td>

</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>CPU </td>
<td> Intel or AMD 64-bit processor</td>

</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td rowspan="4"> Overcloud compute server (xN) </td>
<td>Disk </td>
<td> <ul><li>Minimum: 2x350 GB disks configured as a single 700 GB device using a RAID controller </li>
<li>Recommended: 4 or more 500 GB disks configured as a single device using a RAID controller </li></ul></td>

</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Memory </td>
<td><ul><li>Minimum: 32 GB </li>
<li>Recommended: 96 GB or more </li></ul> </td>

</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>Network </td>
<td><ul><li>Minimum: 10 GB NIC w/PXE support</li>
<li>Recommended: 2x10 GB NIC capable of being bonded</li></ul>
</tr>
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>CPU </td>
<td> Intel or AMD 64-bit processor with hardware virtualization enabled*</td>

</tr>
</table>

\* Intel or AMD hardware virtualization support required. The CPU cores and memory requirements must be sized based 
on the VM instances hosted by the compute node.

### Usable Capacity

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

## Storage requirements

The following table provides the storage requirements for the HP StoreVirtual (VSA). LHN OS 11.5 supports the following platforms:

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: lightgrey; color: black;">
<th colspan="5"> LHN OS 11.5 </th>

<tr style="background-color: white; color: black;">
<th colspan="2">hLinux</th><th colspan="2">Ubuntu</th><th colspan="2">ESX</th></tr>

<tr style="background-color: white; color: black;">
<th>Package </th> <th>Version#</th> <th>Package</th><th>Version#</th><th>Version</th></tr>

<tr style="background-color: white; color: black;">
<td> qemu-kvm</td><td>1.7.0+dfsg-9</td><td>qemu-common</td><td>1.0+noroms-0ubuntu14.13</td><td>5.1.2, 5.5. ie., patched/approved versions of 5.1, 5.5</td></tr>

<tr style="background-color: white; color: black;">

<td>qemu-utils</td>	<td>1.7.0+dfsg-9</td> <td>qemu-kvm</td>	<td>1.0+noroms-0ubuntu14.13</td><td></td></tr>

<tr style="background-color: white; color: black;">

<td>virsh</td> <td>1.2.1</td><td>qemu-utils</td> <td>	1.0+noroms-0ubuntu14.13</td><td></td></tr>

<tr style="background-color: white; color: black;">
<td>virt-install</td> <td>0.600.4</td>	<td>virsh</td>	<td>0.9.8</td><td></td></tr>

<tr style="background-color: white; color: black;">

<td></td><td></td><td>virt-install</td> <td>0.600.1</td><td></td>	

</table>

\* Cisco Fabric Manager is not supported as of now.

\* HP 3Par - Operating system Version 3.1.3 or higher with HP 3PAR Web Services API enabled and one CPG.

\* Brocade FOS 6.4.3 or later is supported but FOS 7.0.2 or later is recommended.

----VSA 11.5 GA will only support ESX & HyperV flavors via public portal.
VSA KVM support is being qualified with Ubuntu and hLinux but will NOT be published for general consumption till September when they complete qualification with other distros including SUSE and Red Hat----

## Physical network architecture
This table provides an overview of the physical network configuration requirements you must meet, with the following assumptions:

- Physical network ports on each server
  - One IPMI/iLO port
  - One physical ethernet port (for example, eth0) or two physical ethernet ports in a bond (for example, bond0) for the hypervisor/OS

- Network fabric
  - Two physical links, one for IPMI/iLO and one for the hypervisor/OS
  - Network switches capable of basic VLAN, L2 and L3 functions; no dependency on, for example, VxLAN-capable or OpenFlow-enabled switch


- The physical hypervisor/OS network is shared by a number of logical networks, and each logical network has its own VLAN and IP subnet

For detailed information, see the [Reference architecture](/cloudos/commercial/reference-architecture/).

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

## Network configuration

REVIEWERS: IS THIS NEEDED???

The following table identifies network requirements for the HP Helion OpenStack Enterprise Edition environment.

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: #C8C8C8;">
<th> Network </th>
<th> Speed </th>
<th> <nobr> Tagged * </nobr> </th>
<th> Required </th>
<th> Notes </th>
</tr>

<tr style="background-color: white; color: black;">
<td> Management network </td>
<td> ? </td>
<td> ? </td>
<td> Y </td>
<td> Used for management functions, such as powering on and off. Must be an Isolated Private Network. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Deployment network </td>
<td> ? </td>
<td> ? </td>
<td> Y </td>
<td> Used to deploy cloud. Must be able to reach management network and be an Isolated Private Network. There cannot be another DHCP server running on the network. </td>
</tr>
</table>

## Software requirements

Ubuntu 12.04.04 LTS – with these package versions from the 12.04.04 distro:

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: lightgrey; color: black;">
<th>Package</th><th>Version#</th>

<tr style="background-color: white; color: black;">
<td>qemu-common</td><td>1.0+noroms-0ubuntu14.13</td></tr>

<tr style="background-color: white; color: black;">
<td>qemu-kvm</td><td>1.0+noroms-0ubuntu14.13</td></tr>

<tr style="background-color: white; color: black;">
<td>emu-utils</td><td>1.0+noroms-0ubuntu14.13</td></tr>

<tr style="background-color: white; color: black;">
<td>virsh</td><td>0.9.8</td></tr>

<tr style="background-color: white; color: black;">
<td>virt-install</td> <td>0.600.1</td></tr></table>



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
