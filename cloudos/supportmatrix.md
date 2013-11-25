---
layout: default
title: "HP Cloud OS Support Matrix"
permalink: /cloudos/supportmatrix/
product: cloudos

---

<a name="_top"> </a>

# HP Cloud OS Support Matrix for Hardware and Software

This topic identifies the supported hardware and software for the current release of HP Cloud OS, including information needed to set up the 
hardware and software.

* [Server Infrastructure](#server-infrastructure)

  * [Prerequisites](#prerequisites)

  * [Minimum Recommendations](#minimum-recommendations)

  * [Supported Deployment Scenario](#supported-deployment-scenario)

* [Software Requirements](#software-requirements)

## Server Infrastructure

For the performance and stability of your HP Cloud OS environment, it is important to meet the minimum recommendations for memory, 
processors, and disk space for each of the components in the table below. 

Before you install Cloud OS, please refer to the appropriate platform support matrix for each component product.

### Prerequisites

Ubuntu Server 12.04 LTS installation media.

### Minimum Recommendations

<table style="text-align: left; vertical-align: top;">

<tr style="background-color: #1796D3;">
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
<td> Swift Proxy Node </td>
<td> Virtual and Physical </td>
<td> 8 </td>
<td> 12 GB </td>
<td> 20 GB </td>
<td> 3 </td>
<td> Ubuntu Server 12.04 LTS (64-bit) *** </td>
</tr>	   

<tr style="background-color: white; color: black;">
<td> Storage Node </td>
<td> Virtual and Physical </td>
<td> 8 </td>
<td> 12 GB </td>
<td> 60 GB </td>
<td> 3 </td>
<td> Ubuntu Server 12.04 LTS (64-bit) *** </td>
</tr>	   

</table>

\* External Internet connection required for public or hybrid cloud.

\*\* Intel or AMD hardware virtualization support required. The CPU cores and memory requirements must be sized based on the VM instances hosted by the compute node.

\*\*\* The Ubuntu Operating System has to be manually installed.


### Supported Deployment Scenario

The cloud deployment includes single Admin and Controller nodes and multiple Compute nodes.

<img src="media/cloudos-supported-deployment-scenario.png" title="HP Cloud OS Supported Deployment Scenario" />

HP is actively developing additional deployment scenarios that may be supported in a subsequent Cloud OS release.

## Software Requirements 

Refer to [Install &amp; Configure Your Clouds](/cloudos/install/) for a complete list of installation prerequisites and requirements, plus step-by-step instructions.

<table style="text-align: left; vertical-align: top;">

<tr style="background-color: #1796D3;">
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
<td> 12.04 LTS (64-bit) </td>
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
<td> 9 </td>
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
<td style="padding-left: 40px; font-weight: bold;"> Neutron </td>
<td> Grizzly 2013.1.4 </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="padding-left: 60px;"> Neutron plugin: Open vSwitch </td>
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















 


