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
processors, and disk space for each of the components in the table below. Before installation, please reference the appropriate 
platform support matrix for each component product.

### Prerequisites

Ubuntu Server 12.04 LTS installation media.

### Minimum Recommendations

<table>
<tr>
<th>Node Type</th>
<th>Virtual/Physical Node</th>
<th>CPU CoresM</th>
<th>Memory</th>
<th>Internal Storage</th>
<th>NICs</th>
<th>OS (included as part of ISO)</th>
</tr>

<tr>
<td style="text-align: left; vertical-align: top;"> Admin Node </td>
<td style="text-align: left; vertical-align: top;"> Virtual Only </td>
<td style="text-align: left; vertical-align: top;"> 2 </td>
<td style="text-align: left; vertical-align: top;"> 12 GB </td>
<td style="text-align: left; vertical-align: top;"> 20 GB </td>
<td style="text-align: left; vertical-align: top;"> 2 </td>
<td style="text-align: left; vertical-align: top;"> Ubuntu Server 12.04 LTS (64-bit) </td>
</tr>

<tr>
<td style="text-align: left; vertical-align: top;"> Controller Node </td>
<td style="text-align: left; vertical-align: top;"> Virtual and Physical </td>
<td style="text-align: left; vertical-align: top;"> 4 </td>
<td style="text-align: left; vertical-align: top;"> 32 GB </td>
<td style="text-align: left; vertical-align: top;"> 60 GB </td>
<td style="text-align: left; vertical-align: top;"> 1\* </td>
<td style="text-align: left; vertical-align: top;"> Ubuntu Server 12.04 LTS (64-bit) </td>
</tr>		

<tr>
<td style="text-align: left; vertical-align: top;"> Compute Node </td>
<td style="text-align: left; vertical-align: top;"> Physical Only </td>
<td style="text-align: left; vertical-align: top;"> 4\*\* </td>
<td style="text-align: left; vertical-align: top;"> 32 GB </td>
<td style="text-align: left; vertical-align: top;"> 60 GB </td>
<td style="text-align: left; vertical-align: top;"> 1 </td>
<td style="text-align: left; vertical-align: top;"> Ubuntu Server running KVM hypervisor 12.04 LTS (64-bit) </td>
</tr>			

<tr>
<td style="text-align: left; vertical-align: top;"> Swift Proxy Node </td>
<td style="text-align: left; vertical-align: top;"> Virtual and Physical </td>
<td style="text-align: left; vertical-align: top;"> 8 </td>
<td style="text-align: left; vertical-align: top;"> 12 GB </td>
<td style="text-align: left; vertical-align: top;"> 20 GB </td>
<td style="text-align: left; vertical-align: top;"> 3 </td>
<td style="text-align: left; vertical-align: top;"> Ubuntu Server 12.04 LTS (64-bit)\*\*\* </td>
</tr>	   

<tr>
<td style="text-align: left; vertical-align: top;"> Storage Node </td>
<td style="text-align: left; vertical-align: top;"> Virtual and Physical </td>
<td style="text-align: left; vertical-align: top;"> 8 </td>
<td style="text-align: left; vertical-align: top;"> 12 GB </td>
<td style="text-align: left; vertical-align: top;"> 60 GB </td>
<td style="text-align: left; vertical-align: top;"> 3 </td>
<td style="text-align: left; vertical-align: top;"> Ubuntu Server 12.04 LTS (64-bit)\*\*\* </td>
</tr>	   

</table>

\* External Internet connection required for public or hybrid cloud.
\*\* Intel or AMD hardware virtualization support required. The CPU cores and memory requirements must be sized based on the VM instances hosted by the compute node.
\*\*\* The Ubuntu Operating System has to be manually installed.


### Supported Deployment Scenario

The cloud deployment includes single Admin and Controller nodes and multiple Compute nodes.

<img src="media/cloudos-supported-deployment-scenario.png" title="HP Cloud OS Supported Deployment Scenario" />

HP is actively developing other supported deployment scenarios, which may be available in a subsequent release.

## Software Requirements 

Refer to [Install &amp; Configure Your Clouds](/cloudos/install/) for a complete list of installation prerequisites and requirements, 
plus step-by-step instructions.

( next table TBS... ) 














 


