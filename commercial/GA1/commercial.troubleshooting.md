---
layout: default
title: "HP Helion OpenStack&#174; Orchestration High Availability Service Overview"
permalink: /helion/openstack/services/ga/troubleshooting/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--

<p style="font-size: small;"> <a href="/helion/openstack/services/object/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/reporting/overview/"> NEXT &#9654</a> </p> --->


# HP Helion OpenStack&reg;  Troubleshooting

HP Helion Openstack is an OpenStack technology couple with the version of Linux&reg; provided by HP. Different usage scenarios might lead to abnormal system behavior or known issues. This topic describes all the known issues that you might encounter. To help you troubleshoot these issues, we have provided possible resolutions.

If you need further assistance, contact [HP Customer Support]([http://www.hpcloud.com/about/contact](http://www.hpcloud.com/about/contact)).

## Baremetal installation

####PXE boot on target node keep switching between interfaces


<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Installation Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>When node boots up on iLo console it shows node waiting for PXE boot on multiple NICs.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Multiple NICs are enabled for Network Boot. &nbsp;</td></tr>
<tr style="background-color: white; color: black;">
<td>Failure Message</td>
<td></td>
<tr style="background-color: white; color: black;">
<td>Resolution</td>
<td>
<ul>
 <li>Reboot the node, using F9 to get to the BIOS configuration.
 <li>Assuming NIC1(eth0/em1) for Node is connected to private network shared across node  enable it for Network Boot. 
 <li> Select System Options > Embedded NICs
<li> Set NIC 1 Boot Options = Network Boot
 <li>Set NIC 2 Boot Options = Disabled
</ul>
</td>
</table>


##Installation

**IPMI fails with error and Unable to establish IPMI v2 / RMCP+ session** 


<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Installation</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>IPMI fails with an error and is unable to establish IPMI v2/RMCP session</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td> &nbsp;</td></tr>
<tr style="background-color: white; color: black;">
<td>Failure Message</td>
<td></td>
<tr style="background-color: white; color: black;">
<td>Resolution</td>
<td>

</table>

##Installation
####BIOS blocks are not set to correct date and time across all nodes


<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Installation</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Nodes PXE boot but ISCSI doesnt start</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Time and date across nodes is not correct</td></tr>
<tr style="background-color: white; color: black;">
<td>Failure Message</td>
<td></td>
<tr style="background-color: white; color: black;">
<td>Resolution</td>
<td>Reboot the node, using F9 to get to the BIOS configuration. BIOS date and time is set correctly and the same on all systems.
<ul><li>Select Date and Time
<li>Set the Date
<li>Set the Time
<li>Use the <ENTER> key to accept the new date and time
<li>Save the BIOS, which reboots the node again
<li>Once the node has rebooted, you can confirm its data and time from the iLO Overview
</td>
</table>

##Installation
####ilo console hows hLinux daemon.err tgtd while pxe boot

<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Installation</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>PXE boot gets stuck after daemon.err tgtd</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Node doesnt have enough diskspace</td></tr>
<tr style="background-color: white; color: black;">
<td>Failure Message</td>
<td>Attachning screen shot ()</td>
<tr style="background-color: white; color: black;">
<td>Resolution</td>
<td><ul><li> Check if target node has disk space mentioned in baremetal.csv and is greater than Node_min_disk mentioned in tripleo/tripleo-incubator/scripts/hp_ced_functions.sh 
<li>If disk space is less than Node_min_disk, change Node_min_disk  along with DISK_SIZE in tripleo/tripleo-incubator/scripts/hp_ced_list_nodes.sh  on Seed 
<li> Re-run the installation script 
</ul></li>
</td>
</table>


##Installation
####ilo console hows nullwaiting for notice of completion while PXE boot


<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Installation Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Node is powered on and pxe booted but it is powered off after daemon.err and stack create fails.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Node doesnt have enough diskspace, SAN boot is enabled for node or local disk is not attached to /sda</td></tr>
<tr style="background-color: white; color: black;">
<td>Failure Message</td>
<td>Below screenshot and Nova-compute.log shows Clean up resource before rescheduling and Terminating instance()</td>
<tr style="background-color: white; color: black;">
<td>Resolution</td>
<td><ul><li> Installer expects that SAN boot option is disabled for nodes. Can you check if SAN boot is disabled for BL 490c </ul></li>

On virtual connect window, you would see the following UI. It should be marked as disabled.
<br><br>
Also can you boot targeted BL490c with ubuntu or any linux ISO to see what device it shows up for local disk. For installer it should be /sda
</td>
</table>


##Installation
##NovaCompute node fails when installing Overcloud


<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Installation Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>NovaCompute node fails with error: BadRequest: object of type 'NoneType' has no len() (HTTP 400)</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td></td></tr>
<tr style="background-color: white; color: black;">
<td>Failure Message</td>
<td>Below screenshot</td>
<tr style="background-color: white; color: black;">
<td>Resolution</td>
<td>
</td>
</table>

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