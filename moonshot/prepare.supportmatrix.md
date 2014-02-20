---
layout: default
title: "HP Cloud OS for Moonshot: Platform and Software Support Matrix"
permalink: /cloudos/moonshot/prepare/supportmatrix/
product: moonshot

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/prepare/releasenotes">&#9664; PREV</a> | <a href="/cloudos/moonshot/">&#9650; UP</a> | NEXT &#9654; </p>

# HP Cloud OS for Moonshot: Supported Hardware and Software

This document is an overview of the supported hardware and software for the HP Cloud OS for Moonshot Version 1.0, including information for setting up your hardware and software. For the performance and stability of the HP Cloud OS for Moonshot environment, it is important for you to meet the minimum recommendations for memory, processors, and disk space for each of the components.

In the following sections, we list the minimum recommendations for memory, processors and disk space for each component when you are creating an HP Cloud OS for Moonshot environment. 

**Note:** Be sure to reference the appropriate platform support matrix for each component product before you install.


* [Server infrastructure](#server)
* [Hypervisor recommendations](#hypervisor)
* [HP Cloud for Moonshot node requirements](#nodereq)
* [Moonshot chassis firmware version](#firmware)
* [Moonshot cartridges supported](#cartridges)
* [Operating systems supported ](#ossupp)
* [Workloads supported](#workloads)
* [Supported deployment scenario](#deployment)
* [Software requirements](#software)

## Server infrastructure {#server}
We recommend your server contains the following:

* Quad Core Processor
* Hard disk drive with a minimum of 500 GB of space

## Hypervisor recommendations {#hypervisor}
<table style="text-align: left; vertical-align: top; min-width: 400px;">

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

## HP Cloud for Moonshot node requirements {#nodereq}
<table style="text-align: left; vertical-align: top; min-width: 400px;">

<tr style="background-color: #C8C8C8;">
<th>Node Type</th>
<th>Virtual?</th>
<th>CPU Cores</th>
<th>Memory</th>
<th>Internal Storage</th>
<th>NICs</th>
<th>OS (included as part of ISO)</th>
<th>Virtualized Platforms Supported</th>
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


## Moonshot chassis firmware version {#firmware}
<table style="text-align: left; vertical-align: top; min-width: 400px;">

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

## Moonshot cartridges supported {#cartridges}
<table style="text-align: left; vertical-align: top; min-width: 400px;">

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
<td>2</td>
<td>32 GB (4x8 GB)</td>
<td>240 GB, 500 GB or 1 TB</td>
</tr>
</table>

**Note:** You must have an IPMI driver version 2.0 or above and an external internet connection if you are using a public or hybrid cloud.

## Operating systems supported {#ossupp}
<table style="text-align: left; vertical-align: top; min-width: 400px;">

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


## Workloads supported {#workloads}
<table style="text-align: left; vertical-align: top; min-width: 400px;">

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

<TR>
<TD>Caching/dynamic web</td>

</TR>
<TR>
<TD>NoSQL</TD>

</TR>
<TR>
<TD>Analytics</TD>

</TR>
</table>


## Supported deployment scenario {#deployment}
The HP Cloud OS for Moonshot deployment includes one Admin node, one Controller node, and one Baremetal host. The following diagram depicts... 

<img src="media/moonshot-deployment.png"></img>


## Software Requirements {#software}

Refer to the [HP Cloud OS for Moonshot Installation Guide](/cloudos/moonshot/install/) for a complete list of installation prerequisites and requirements, plus step-by-step instructions.

<table style="text-align: left; vertical-align: top; min-width: 600px;">

<tr style="background-color: #C8C8C8;">
<th> HP Cloud OS 1.0 Platforms </th>
<th> Supported Versions </th>
</tr>

<tr style="background-color: white; color: black;">
<td style="font-weight: bold; background-color: #F8F8F8;" colspan="2"> Admin and Controller Node </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="font-weight: bold; background-color: #F8F8F8;" colspan="2"> Operating System </td>
</tr>

<tr style="background-color: white; color: black;">
<td  style="padding-left: 40px;"> Ubuntu Linux </td>
<td> 12.04 LTS (64-bit) + security updates </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> Java Developer Kit / Java Runtime Environment </td>
<td> 1.7 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="font-weight: bold; background-color: #F8F8F8;" colspan="2"> Database </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> CouchDB </td>
<td> 1.2.0 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> PostgreSQL </td>
<td> 9.1.5 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="font-weight: bold; background-color: #F8F8F8;" colspan="2"> Application Server </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> Apache httpd </td>
<td> 2.3 and above </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> Tomcat </td>
<td> 7 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="font-weight: bold; background-color: #F8F8F8;" colspan="2"> Web Browser </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> Internet Explorer </td>
<td> 11.0 or higher </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> Firefox </td>
<td> 17 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> Chrome </td>
<td> 26 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="font-weight: bold; background-color: #F8F8F8;" colspan="2"> Kernel </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> OpenStack release </td>
<td> Grizzly 2013.1.3 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="font-weight: bold; background-color: #F8F8F8;" colspan="2"> OpenStack Components and Plugins </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> Cinder </td>
<td> Grizzly 2013.1.3 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> Glance </td>
<td> Grizzly 2013.1.3 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 60px;"> Plugin: Filesystem Persistence </td>
<td> Grizzly 2013.1.3 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> Keystone </td>
<td> Grizzly 2013.1.3 </td>
</tr>


<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> Nova </td>
<td> Grizzly 2013.1.3 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 60px;"> Plug-in: Baremetal </td>
<td> Grizzly 2013.1.3 </td>
</tr>
<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> Quantum (Neutron) </td>
<td> Grizzly 2013.1.3 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 60px;"> Plugin: Open vSwitch </td>
<td> Grizzly 2013.1.3 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> Horizon </td>
<td> Grizzly 2013.1.3 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> Python </td>
<td> 2.6, 2.7 </td>
</tr>


<tr style="background-color: white; color: black;">
<td style="font-weight: bold; background-color: #F8F8F8;" colspan="2"> Base </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> Graffiti </td>
<td> HP Cloud OS for Moonshot 1.0 </td>
</tr>


<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> Eve </td>
<td> HP Cloud OS for Moonshot 1.0 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 60px;"> Plug-in: CouchDB 1.2.0 Persistence <br /> Plug-in: MongoDB 2.2 Persistence </td>
<td> HP Cloud OS for Moonshot 1.0 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> Focus </td>
<td> HP Cloud OS for Moonshot 1.0 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 60px;"> Plug-in: FileSystem Persistence </td>
<td> HP Cloud OS for Moonshot 1.0 </td>
</tr>
<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> Skyline </td>
<td> HP Cloud OS for Moonshot 1.0 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="font-weight: bold; background-color: #F8F8F8;" colspan="2"> Deployment </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> Cosmos </td>
<td> HP Cloud OS for Moonshot 1.0 </td>
</tr>
<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> Crowbar </td>
<td> 1.4 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="font-weight: bold; background-color: #F8F8F8;" colspan="2"> Message Queue </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> RabbitMQ </td>
<td> 2.7.1 and above </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="font-weight: bold; background-color: #F8F8F8;" colspan="2"> Supported Hypervisors for hosting nodes </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> KVM </td>
<td> Ubuntu 12.04 LTS (64-bit) </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> VMWare ESX </td>
<td> ESXi 5.1 or above </td>
</tr>

</table>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

