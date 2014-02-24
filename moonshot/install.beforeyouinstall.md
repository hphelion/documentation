---
layout: default
title: "Important Tasks Before You Install"
permalink: /cloudos/moonshot/install/before-you-install/
product: moonshot

---


<script> 
 
function PageRefresh { 
onLoad="window.refresh" 
} 
 
PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/install/overview/">&#9664; PREV</a> | <a href="/cloudos/moonshot/install/">&#9650; UP</a> | <a href="/cloudos/moonshot/install/admin-node-prerequisites/">NEXT &#9654;</a> </p>

# Important Tasks Before You Install

Before you can start working in the HP Cloud OS for Moonshot Operational Dashboard, you must:

* [Plan the Infrastructure for a Cloud](#plan-the-infrastructure-for-a-cloud)

* [Set up the Admin Node](#set-up-the-admin-node)

* [Boot the Admin Node Using the HP Cloud OS for Moonshot ISO](#boot-the-admin-node-using-the-hp-cloud-os-for-moonshot-iso)

* [Launch the Operational Dashboard](#launch-the-operational-dashboard)

## Plan the Infrastructure for a Cloud

This section defines the minimum infrastructure requirements to make the cloud environment up and running. You will need support from your IT administrator to correctly capture information about your environment.

* [Deployment Architecture](#deployment-architecture)

* [Server Infrastructure](#server-infrastructure)

* [Network Infrastructure](#network-infrastructure)

### Deployment Architecture

A simple cloud environment would include:

* A Cloud Administration Node (Admin Node)

* A Controller Node 

* A Baremetal Host

The following diagram depicts a simplified deployment scenario. 

<img src="media/moonshot-deployment.png"></img>

See the sections below for more information.

### Server Infrastructure

The following sections identify the server requirements for your cloud environment, in terms of memory, processors, and disk space for each component.
This information is repeated from the [Support Matrix](/cloudos/moonshot/prepare/supportmatrix/) as a convenience to the reader.

* [General recommendation](#general)
* [Hypervisor recommendations for HP Cloud OS for Moonshot](#hypervisor)
* [Node requirements for HP Cloud OS for Moonshot](#nodereq)
* [Moonshot chassis firmware version](#firmware)
* [Moonshot cartridges supported](#cartridges)
* [Operating systems supported ](#ossupp)
* [Workloads supported](#workloads)
* [Supported deployment scenario](#deployment)
* [Software requirements](#software)

#### General recommendation {#general}

We recommend that your server contains the following:

* Quad Core Processor

* Hard disk drive with a minimum of 500 GB of space

#### Hypervisor recommendations {#hypervisor}

<table style="text-align: left; vertical-align: top; min-width: 700px;">

<tr style="background-color: #C8C8C8;">
<th>Hypervisor</th>
<th>Version</th>
</tr>
<tr style="background-color: white; color: black;">
<td>KVM</td>
<td>qemu-kvm1.0 and above</td>
</tr>		  
<tr style="background-color: white; color: black;">
<td>VMWare</td>
<td>ESXi 5.1 and above</td>
</tr>
</table>

### Node requirements {#nodereq}

<table style="text-align: left; vertical-align: top; min-width: 700px;">

<tr style="background-color: #C8C8C8;">
<th>Node Type</th>
<th>Virtual?</th>
<th>CPU Cores</th>
<th>Memory</th>
<th>Internal Storage</th>
<th>NICs</th>
<th><span style='display:block; width:150px;'>OS <br />(incl. as part of ISO)</span></th>
<th><span style='display:block; width:180px;'>Virtualized Platforms Supported</span></th>
</tr>

<tr style="background-color: white; color: black;">
<td>Admin Node</td>
<td>Yes</td>
<td> 4 </td>
<td> 12 GB </td>
<td> 40 GB </td>
<td> 2 </td>
<td> Ubuntu Server 12.04 LTS (64-bit) </td>
<td>VMWare ESXi 5.1 and above <br /> KVM qemu-kvm-1.0 and above</td>
</tr>

<tr style="background-color: white; color: black;">
<td>Controller Node</td>
<td>Yes</td>
<td> 4 </td>
<td> 32 GB </td>
<td> 60 GB </td>
<td> 3 </td>
<td> Ubuntu Server 12.04 LTS (64-bit) </td>
<td>VMWare ESXi 5.1 and above <br /> KVM qemu-kvm-1.0 and above</td>
</tr>

<tr style="background-color: white; color: black;">
<td>Baremetal Host</td>
<td>Yes</td>
<td> 4 </td>
<td> 32 GB </td>
<td> 60 GB </td>
<td> 3 </td>
<td> Ubuntu Server 12.04 LTS (64-bit) </td>
<td>VMWare ESXi 5.1 and above <br /> KVM qemu-kvm-1.0 and above</td>
</tr>	

</table>



#### Moonshot chassis firmware version {#firmware}

<table style="text-align: left; vertical-align: top; min-width: 700px;">

<tr style="background-color: #C8C8C8;">
<th>Software / Firmware</th>
<th>Version</th>
</tr>
<tr style="background-color: white; color: black;">
<td>m300 BIOS</td>
<td>H02 2013.11.13</td>
</tr>		  
<tr style="background-color: white; color: black;">
<td>ProLiant Moonshot Cartridge BIOS</td>
<td>H01 2013.11.15</td>
</tr>
<tr style="background-color: white; color: black;">
<td>iLO CM</td>
<td>1.11</td></tr>
<tr style="background-color: white; color: black;">
<td>Satellite FW</td>
<td>2013.10.18</td>
</tr>
<tr style="background-color: white; color: black;">
<td>Carbondale 8</td>
<td>4.3</td>
</tr>
<tr style="background-color: white; color: black;">
<td>Switch FastPath FW</td>
<td>2.0.0.13</td>
</tr>
<tr style="background-color: white; color: black;">
<td>CMU</td>
<td>7.2</td>
</tr>
<tr style="background-color: white; color: black;">
<td>Moonshot Windows Deployment Packs</td>
<td>2013.12.1</td>
</tr>
</table>

#### Moonshot cartridges supported {#cartridges}

<table style="text-align: left; vertical-align: top; min-width: 700px;">

<tr style="background-color: #C8C8C8;">
<th>Cartridge Type</th>
<th>CPU Cores</th>
<th>Memory</th>
<th>Internal Storage</th>
</tr>
<tr style="background-color: white; color: black;">
<td>HP ProLiant Moonshot Server Cartridge</td>
<td>2</td>
<td>8 GB</td>
<td>500 GB or 1 TB</td>
</tr>		  
<tr style="background-color: white; color: black;">
<td>HP ProLiant m300 Server Cartridge</td>
<td>8</td>
<td>32 GB (4x8 GB)</td>
<td>240 GB, 500 GB or 1 TB</td>
</tr>
</table>

**Note:** You must have an IPMI driver version 2.0 or above, and an external Internet connection, if you are using a public or hybrid cloud.

#### Operating systems supported {#ossupp}

<table style="text-align: left; vertical-align: top; min-width: 700px;">

<tr style="background-color: #C8C8C8;">
<th>Cartridge Type</th>
<th>OS / Version Supported</th>
</tr>
<tr style="background-color: white; color: black;">
<td>HP ProLiant Moonshot Server Cartridge</td>
<td>Ubuntu 12.04 LTS <b>OR</b> Redhat Enterprise Linux 6.4</td>
</tr>		  
<tr style="background-color: white; color: black;">
<td>HP ProLiant m300 Server Cartridge</td>
<td>Ubuntu 13.10 <b>OR</b> Redhat Enterprise Linux 6.5</td>
</tr>
</table>



#### Workloads supported {#workloads}
<table style="text-align: left; vertical-align: top; min-width: 700px;">

<tr style="background-color: #C8C8C8;">
<th>Cartridge Type</th>
<th>Top Workloads</th>

</tr>
<tr style="background-color: white; color: black;">
<td>HP ProLiant Moonshot Server Cartridge</td>
<td>Static web</td>

</tr>		  

<TR style="background-color: white; color: black;">
<TD rowspan="4">HP ProLiant m300 Server Cartridge</TD>
<TD>Static web</TD>

</TR>

<TR style="background-color: white; color: black;">
<TD>Caching/dynamic web</td>

</TR>
<TR style="background-color: white; color: black;">
<TD>NoSQL</TD>

</TR>
<TR style="background-color: white; color: black;">
<TD>Analytics</TD>

</TR>
</table>



### Network Infrastructure

The following networks are utilized in the HP Cloud OS for Moonshot infrastructure:

* <b>Management Network</b>: Also known as the "Admin network," provides connectivity between the Admin node, the Controller node and the Baremetal host. The Admin node provides DHCP and PXE services on this network.

* <b>PXE/Data Network</b>: Also known as the "Nova_Flat network," this network is utilized for connectivity between the Controller and Baremetal hosts and the Moonshot cartridges. The Controller node provides 
DHCP and PXE services for this network. Workloads are provisioned to the Moonshot cartridges using this network.

* <b>IPMI Network</b>: This network is utilized for communication between the Baremetal host and the Moonshot Chassis Manager. This includes chassis and 
cartridge discovery, power control of cartridges and nodes, and monitoring of the health of the Moonshot systems

* <b>External Network</b>: Also known as the "Public network," this network provides public access to the HP Cloud OS for Moonshot Administration Dashboard and external access to 
the internet for the Admin node and Controller node.

<b>Notes</b>:

* The Admin node and the Controller node utilize internet access to obtain updates and workload content from HP. If Internet access is not feasible from your 
datacenter, then it is possible for updates and workloads to be downloaded locally and then uploaded to your cloud environment.

* The Controller node will require a static IP address on the External (public) network. Please consult with your network administrator to obtain the required static IP address.

#### Network Configuration

Again referring to this simplified deployment scenario: 

<img src="media/moonshot-deployment.png"></img>

HP Cloud OS for Moonshot will have the following network configuration:

* <b>Admin Node</b>: 2 NICs - Management Network and External Network

* <b>Controller Node</b>: 3 NICs - Management Network, PXE/Data Network, and External Network

* <b>Baremetal Host</b>: 3 NICs - Management Network , PXE/Data Network, and IPMI Network

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<tr>
<th> </th>
<th> eth0 </th>
<th> eth1 </th>
<th> eth2 </th>
<th> eth3 </th>
<tr>

<tr style="background-color: white; color: black;">
<td> Admin Node </td>
<td> Management Network </td>
<td> </td>
<td> </td>
<td> External Network </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Controller Node </td>
<td> Management Network </td>
<td> PXE/Data Network </td>
<td> </td> 
<td> External Network </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Baremetal Host </td>
<td> Management Network </td>
<td> PXE/Data Network </td>
<td> IPMI Network </td>
<td> </td> 
</tr>

</table>


## Set Up the Admin Node

Install the Admin Node on a virtual machine. Here are general guidelines for creating a virtual machine in an existing or new hypervisor infrastructure:

1. Configure the hypervisor host's network. The host must provide connectivity to the virtual machine Admin Node on an isolated private network 
to all the bare-metal nodes' port eth0. And the virtual machine Admin Node must also have connectivity to a routable network for Internet access.

2. Create a virtual machine Admin Node with the hardware configuration suggested in the previous section, [Plan the Infrastructure for a Cloud](#plan-the-infrastructure-for-a-cloud). 
The following configuration must be reviewed during this step:

 a. Ensure the virtual machine Admin Node's primary NIC is bridged or connected to the admin network and the second NIC is bridged or connected to a routable network for Internet access.

 b. For the disk configuration, the default Disk bus type/controller uses proprietary technology. Ensure you set that to the IDE/SCSI type.
 
 c. If your hypervisor is KVM, ensure the virt type is set to KVM.
 
3. Download the HP Cloud OS for Moonshot ISO to the host's local file system or data store.

4. Configure the virtual machine Admin Node to point to the ISO as a CD/DVD drive or install media ISO image. 

## Boot the Admin Node Using the HP Cloud OS for Moonshot ISO

To boot the Admin Node using the ISO:

1. Power ON the virtual machine Admin Node and open up its console.

2. In the console window, you can view the boot up process. Once completed, a login prompt displays.

3. (Optional) Power DOWN the Admin Node VM, edit it to disconnect the ISO CD, then Power UP the VM.

At this point, the Operational Dashboard has been successfully installed on the Admin Node.

## Launch the Operational Dashboard

After you boot from the HP Cloud OS for Moonshot ISO, you are ready to launch the Operational Dashboard to set up the Admin Node.

To launch the Operational Dashboard:

1. From the virtual machine Admin Node, open a Mozilla Firefox or Google Chrome browser that has the following IP addresses set as proxy exceptions:
  
  192.*;10.*;localhost;127.0.*

2. In the browser, enter **http://192.168.124.10:9000** to launch the Operational Dashboard user interface. 
IMPORTANT: Use Google Chrome or Mozilla Firefox.

3. On the Environment tab, review the types of prerequisites, servers, connections, and networks in your environment.

## Next Step

Proceed to the next topic, [Set the Admin Node Prerequisites](/cloudos/moonshot/install/admin-node-prerequisites/), to begin the process of setting up and installing the Admin node.  

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

