---
layout: default
title: "HP Helion OpenStack&#174; Orchestration High Availability Service Overview"
permalink: /helion/openstack/services/troubleshooting/
product: commercial

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/helion/openstack/services/object/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/reporting/overview/"> NEXT &#9654</a> </p>


# HP Helion OpenStack&reg;  Troubleshooting


## Troubleshooting Baremetal installation

Problem: PXE boot on target node keep switching between interfaces

<table style="text-align: left; vertical-align: top;">

<tr style="background-color: white; text-align: left; vertical-align: top;">
<td>Symptoms type</td>
<td> When node boots up on iLo console it shows node waiting for PXE boot on multiple NICs </td>
</tr>
<td>Primary software component</td>
<td>Installation Dashboard</td>
</tr>
<td>Failure message </td>
<td></td>
</tr>
<td>Probable cause</td>
<td>Multiple NICs are enabled for Network Boot</td>
</tr>
</table>

###Solution

 Reboot the node, using F9 to get to the BIOS configuration.
•Assuming NIC1(eth0/em1) for Node is connected to private network shared across node enable it for Network Boot. •Select System Options > Embedded NICs
•Set NIC 1 Boot Options = Network Boot
•Set NIC 2 Boot Options = Disabled


## Problem: IPMI fails with error - Unable to establish IPMI v2 / RMCP+ session 

###Solution

Follow Grant Administrative Privileges from Tweaks for CE installer to work with BL 490c 

##Problem: BIOS blocks are not set to correct date and time across all nodes

<table style="text-align: left; vertical-align: top;">

<tr style="background-color: white; text-align: left; vertical-align: top;">
<td>Symptoms type</td>
<td> Nodes PXE boot but ISCSI doesnt start </td>
</tr>
<td>Primary software component</td>
<td>Installation Dashboard</td>
</tr>
<td>Failure message </td>
<td>Below screenshot</td>
</tr>
<td>Probable cause</td>
<td>Time and date across nodes is not correct</td>
</tr>
</table>

###Solution

Reboot the node, using F9 to get to the BIOS configuration. BIOS date and time is set correctly and the same on all systems.

- Select Date and Time
- Set the Date
- Set the Time
- Use the <ENTER> key to accept the new date and time
- Save the BIOS, which reboots the node again
- Once the node has rebooted, you can confirm its data and time from the iLO Overview

##Problem: ilo console hows hLinux daemon.err tgtd while pxe boot

<table style="text-align: left; vertical-align: top;">

<tr style="background-color: white; text-align: left; vertical-align: top;">
<td>Symptoms type</td>
<td>PXE boot gets stuck after daemon.err tgtd </td>
</tr>
<td>Primary software component</td>
<td>Installation Dashboard</td>
</tr>
<td>Failure message </td>
<td>Below screenshot</td>
</tr>
<td>Probable cause</td>
<td>Node doesnt have enough diskspace</td>
</tr>
</table>

###Solution

* Check if target node has disk space mentioned in baremetal.csv and is greater than Node_min_disk mentioned in tripleo/tripleo-incubator/scripts/hp_ced_functions.sh 
* If disk space is less than Node_min_disk, change Node_min_disk  along with DISK_SIZE in tripleo/tripleo-incubator/scripts/hp_ced_list_nodes.sh  on Seed 
* Re-run the installation script 


##Problem: ilo console hows nullwaiting for notice of completion while PXE boot

<table style="text-align: left; vertical-align: top;">

<tr style="background-color: white; text-align: left; vertical-align: top;">
<td>Symptoms type</td>
<td>Node is powered on and pxe booted but it is powered off after daemon.err and stack create fails</td>
</tr>
<td>Primary software component</td>
<td>Installation Dashboard</td>
</tr>
<td>Failure message </td>
<td>Below screenshot and Nova-compute.log shows Clean up resource before rescheduling and Terminating instance
</td>
</tr>
<td>Probable cause</td>
<td>Node doesnt have enough diskspace, SAN boot is enabled for node or local disk is not attached to /sda</td>
</tr>
</table>

###Solution

* Installer expects that SAN boot option is disabled for nodes. Can you check if SAN boot is disabled for BL 490c

On virtual connect window, you would see the following UI. It should be marked as disabled.

<image>

Also can you boot targeted BL490c with ubuntu or any linux ISO to see what device it shows up for local disk. For installer it should be /sda

##Problem: NovaCompute node fails when installing Overcloud


<table style="text-align: left; vertical-align: top;">

<tr style="background-color: white; text-align: left; vertical-align: top;">
<td>Symptoms type</td>
<td>NovaCompute node fails with error: BadRequest: object of type 'NoneType' has no len() (HTTP 400) </td>
</tr>
<td>Primary software component</td>
<td>Installation Dashboard</td>
</tr>
<td>Failure message </td>
<td>Below screenshot</td>
</tr>
<td>Probable cause</td>
<td</td>
</tr>
</table>

###Solution




----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*