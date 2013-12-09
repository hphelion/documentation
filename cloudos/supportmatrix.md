---
layout: default
title: "HP Cloud OS Support Matrix for Hardware and Software"
permalink: /cloudos/supportmatrix/
product: cloudos

---

<a name="_top"> </a>

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


# HP Cloud OS Support Matrix for Hardware and Software

This document provides an overview of the supported hardware and software for the HP Cloud OS Sandbox Version 1.20, including information for hardware and software setup. 

* [Server Infrastructure](#server-infrastructure)

  * [Prerequisites](#prerequisites)

  * [Minimum Recommendations](#minimum-recommendations)

  * [Supported Deployment Scenario](#supported-deployment-scenario)

* [Software Requirements](#software-requirements)

## Server Infrastructure

For the performance and stability of the HP Cloud OS environment, it is very important to meet the minimum recommendations for memory, processors, and disk space for each of the components in the table below. 
Before installation, please reference the appropriate platform support matrix for each component product.


### Prerequisites

Ubuntu Server 12.04 LTS installation media + security updates.

### Minimum Recommendations

<table style="text-align: left; vertical-align: top;">

<tr style="background-color: #C8C8C8;">
<th>Node Type</th>
<th>Virtual/Physical Node</th>
<th>CPU Cores</th>
<th>Memory</th>
<th>Internal Storage</th>
<th>NICs</th>
<th> <nobr>  OS (included as part of ISO)  </nobr></th>
</tr>

<tr style="background-color: white; color: black;">
<td> Admin Node </td>
<td> Virtual Only </td>
<td> 2 </td>
<td> 12 GB </td>
<td> 20 GB </td>
<td> 2 </td>
<td> Ubuntu Server 12.04 LTS (64-bit) </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Controller Node </td>
<td> Virtual and Physical </td>
<td> 4 </td>
<td> 32 GB </td>
<td> 60 GB </td>
<td> 1 * </td>
<td> Ubuntu Server 12.04 LTS (64-bit) </td>
</tr>		

<tr style="background-color: white; color: black;">
<td> Compute Node </td>
<td> Physical Only </td>
<td> 4 ** </td>
<td> 32 GB </td>
<td> 60 GB </td>
<td> 1 </td>
<td> Ubuntu Server running KVM hypervisor 12.04 LTS (64-bit) </td>
</tr>			

<tr style="background-color: white; color: black;">
<td> Swift Controller (Ring, Proxy, Dispersion) </td>
<td> Virtual or Physical </td>
<td> 8 </td>
<td> 12 GB </td>
<td> 20 GB </td>
<td> 3 </td>
<td> Ubuntu Server 12.04 LTS (64-bit) *** </td>
</tr>	   

<tr style="background-color: white; color: black;">
<td> Storage Node </td>
<td> Virtual or Physical </td>
<td> 8 </td>
<td> 12 GB </td>
<td> 60 GB </td>
<td> 3 </td>
<td> Ubuntu Server 12.04 LTS (64-bit) *** </td>
</tr>	   

</table>

\* External Internet connection required for public or hybrid cloud.

\*\* Intel or AMD hardware virtualization support required. The CPU cores and memory requirements must be sized based 
on the VM instances hosted by the compute node.

\*\*\* The Ubuntu Operating System to be manually installed.


### Supported Deployment Scenarios

The diagrams in this section illustrate the deployment scenarios supported in HP Cloud OS 1.20.

**Diagram 1:** Single Region. All controllers in a single virtual machine. Compute node is bare metal.

<img src="media/cloudos-single-region1.jpg" title="HP Cloud OS Single Region. All controllers in a single virtual machine. Compute node is bare metal." />

**Diagram 2:** Multi-region. All controllers in virtual machines.

<img src="media/cloudos-multi-region2.jpg" title="HP Cloud OS Multi-region. All controllers in virtual machines." />

**Diagram 3:** Single region. Controllers are in separate virtual machines.

<img src="media/cloudos-single-region-controllers-vm3.jpg" title="HP Cloud OS Single region. Controllers are in separate virtual machines." />

**Diagram 4:** Single region. All controllers in a single bare metal server. 

<img src="media/cloudos-single-region-controllers-baremetal4.jpg" title="HP Cloud OS Single region. All controllers in a single bare metal server." />

**Diagram 5:** Swift storage for all deployment scenarios.  

<img src="media/cloudos-swift-storage5.jpg" title="HP Cloud OS Swift storage for all deployment scenarios." />

## Hardware Requirements

<table style="text-align: left; vertical-align: top;">

<tr style="background-color: #C8C8C8;">
<th> HP </th>
</tr>

<tr style="background-color: white; color: black;">
<td style="font-weight: bold; background-color: #F8F8F8;"> HP DL 360/380 </td>
</tr>
<tr style="background-color: white; color: black;">
<td style="font-weight: bold; background-color: #F8F8F8;"> HP C7000 Chassis (BL servers) </td>
</tr>

<tr style="background-color: #C8C8C8;">
<th> Dell </th>
</tr>

<tr style="background-color: white; color: black;">
<td style="font-weight: bold; background-color: #F8F8F8;"> Dell R620CTL </td>
</tr>
<tr style="background-color: white; color: black;">
<td style="font-weight: bold; background-color: #F8F8F8;"> PowerEdge M620 </td>
</tr>

<tr style="background-color: #C8C8C8;">
<th> IBM </th>
</tr>

<tr style="background-color: white; color: black;">
<td style="font-weight: bold; background-color: #F8F8F8;"> IBM x3550 M4 CTL </td>
</tr>
<tr style="background-color: white; color: black;">
<td style="font-weight: bold; background-color: #F8F8F8;"> IBM Blade Center HS23 </td>
</tr>

</table>


## Software Requirements 

Refer to [Install &amp; Configure Your Clouds](/cloudos/install/) for a complete list of installation prerequisites and requirements, plus step-by-step instructions.

<table style="text-align: left; vertical-align: top;">

<tr style="background-color: #C8C8C8;">
<th> HP Cloud OS Platforms </th>
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
<td style="padding-left: 40px;"> <nobr> Java Developer Kit / Java Runtime Environment </nobr> </td>
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
<td> 10 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> Firefox </td>
<td> 25 and above </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> Chrome </td>
<td> 30 and above </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="font-weight: bold; background-color: #F8F8F8;" colspan="2"> Kernel </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> OpenStack release </td>
<td> Grizzly 2013.1.4 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="font-weight: bold; background-color: #F8F8F8;" colspan="2"> OpenStack Components and Plugins </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px; font-weight: bold;"> Cinder </td>
<td> Grizzly 2013.1.4 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 60px;"> Cinder plugin: LVM-iSCSI </td>
<td> Grizzly 2013.1.4 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px; font-weight: bold;"> Glance </td>
<td> Grizzly 2013.1.4 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 60px;"> Glance plugin: Filesystem Persistence </td>
<td> Grizzly 2013.1.4 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px; font-weight: bold;"> Keystone </td>
<td> Grizzly 2013.1.4 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 60px;"> Keystone plugin: Database Store </td>
<td> Grizzly 2013.1.4 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px; font-weight: bold;"> Nova </td>
<td> Grizzly 2013.1.4 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 60px;"> Nova plugin: KVM </td>
<td> Grizzly 2013.1.4 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px; font-weight: bold;"> Quantum (Neutron) </td>
<td> Grizzly 2013.1.4 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 60px;"> Quantum (Neutron) plugin: Open vSwitch </td>
<td> Grizzly 2013.1.4 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px; font-weight: bold;"> Horizon </td>
<td> Grizzly 2013.1.4 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 60px;"> Python </td>
<td> 2.6, 2.7 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px; font-weight: bold;"> Swift </td>
<td> Grizzly 2013.1.4 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="font-weight: bold; background-color: #F8F8F8;" colspan="2"> Base </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px; font-weight: bold;"> Graffiti </td>
<td> HP Cloud OS 1.20 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px; font-weight: bold;"> Eve </td>
<td> HP Cloud OS 1.20 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 60px;"> Plug-in: CouchDB 1.2.0 Persistence <br /> Plug-in: MongoDB 2.2 Persistence </td>
<td> HP Cloud OS 1.20 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px; font-weight: bold;"> Focus </td>
<td> HP Cloud OS 1.20 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 60px;"> Plug-in: FileSystem Persistence </td>
<td> HP Cloud OS 1.20 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px; font-weight:bold;"> Skyline </td>
<td> HP Cloud OS 1.20 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="font-weight: bold; background-color: #F8F8F8;" colspan="2"> Deployment </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> Cosmos </td>
<td> HP Cloud OS 1.20 </td>
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
<td style="font-weight: bold; background-color: #F8F8F8;" colspan="2"> Supported Hypervisors for hosting Admin node </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 40px;"> KVM <br/> QEMU <br/> ESXi (Admin node only) </td>
<td> <nobr> Ubuntu 12.04 LTS (64-bit) </nobr> <br/> Ubuntu 12.04 LTS (64-bit)
 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="font-weight: bold; background-color: #F8F8F8;"> Cloud Providers </td>
<td> HP Cloud </td>
</tr>

</table>

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

