---
layout: default
title: "HP Cloud OS Support Matrix"
permalink: /cloudos/supportmatrix/
product: cloudos

---

# HP Cloud OS Support Matrix for Hardware and Software

This topic identifies the supported hardware and software for the current release of HP Cloud OS, including information needed to set up the 
hardware and software.

* [Server Infrastructure](#server-infrastructure)

  * [Prerequisites](#prerequisites)

  * [Minimum Recommendations](#minimum-recommendations)

  * [Supported Deployment Scenario](#supported-deployment-scenario)

* [Software Requirements](#software-requirements)

## Server Infrastructure

For the performance and stability of the HP Cloud OS environment, it is very important to meet the minimum recommendations for memory, 
processors, and disk space for each of the components in the table below. 

Before you install Cloud OS, please refer to the appropriate platform support matrix for each component product.

### Prerequisites

Ubuntu Server 12.04 LTS installation media.

### Minimum Recommendations

<table style="text-align: left; vertical-align: top; background-color: white; color: black;">
<tr background-color: DarkGray; color: white;>
<th>Node Type</th>
<th>Virtual/Physical Node</th>
<th>CPU Cores</th>
<th>Memory</th>
<th>Internal Storage</th>
<th>NICs</th>
<th> <nobr> OS (included as part of ISO) </nobr></th>
</tr>

<tr>
<td> Admin Node </td>
<td> Virtual Only </td>
<td> 2 </td>
<td> 12 GB </td>
<td> 20 GB </td>
<td> 2 </td>
<td> Ubuntu Server 12.04 LTS (64-bit) </td>
</tr>

<tr>
<td> Controller Node </td>
<td> Virtual and Physical </td>
<td> 4 </td>
<td> 32 GB </td>
<td> 60 GB </td>
<td> 1 * </td>
<td> Ubuntu Server 12.04 LTS (64-bit) </td>
</tr>		

<tr>
<td> Compute Node </td>
<td> Physical Only </td>
<td> 4 ** </td>
<td> 32 GB </td>
<td> 60 GB </td>
<td> 1 </td>
<td> Ubuntu Server running KVM hypervisor 12.04 LTS (64-bit) </td>
</tr>			

<tr>
<td> Swift Proxy Node </td>
<td> Virtual and Physical </td>
<td> 8 </td>
<td> 12 GB </td>
<td> 20 GB </td>
<td> 3 </td>
<td> Ubuntu Server 12.04 LTS (64-bit) *** </td>
</tr>	   

<tr>
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

Refer to [Install &amp; Configure Your Clouds](/cloudos/install/) for a complete list of installation prerequisites and requirements, 
plus step-by-step instructions.

<table style="text-align: left; vertical-align: top; background-color: white; color: black;">
<tr background-color: DarkGray; color: white;>
<th>HP Cloud OS Platforms</th>
<th>Supported Versions</th>
</tr>

<tr>
<td style="font-weight: bold;"> Admin and Controller Node </td>
<td> </td>
</tr>

<tr>
<td style="font-weight: bold; padding-left: 10px;"> Operating System </td>
<td> </td>
</tr>

<tr style="padding-left: 10px;">
<td> Ubuntu Linux </td>
<td> 12.04 LTS (64-bit) </td>
</tr>

<tr style="padding-left: 10px;">
<td> Java Developer Kit/Java Runtime Environment </td>
<td> 1.7 </td>
</tr>

<tr>
<td style="font-weight: bold;"> Cloud Providers </td>
<td> HP Cloud </td>
</tr>

</table>














 


