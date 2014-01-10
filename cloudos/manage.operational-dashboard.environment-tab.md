---
layout: default
title: "Operational Dashboard: Environment Tab"
permalink: /cloudos/manage/operational-dashboard/environment-tab/
product: cloudos

---


<a name="_top"> </a>

<script> 

function PageRefresh { 
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/manage/operational-dashboard/how-opdash-works/">&#9664; PREV</a> | <a href="/cloudos/manage/operational-dashboard/">&#9650; UP</a> | <a href="/cloudos/manage/operational-dashboard/cloud-tab/">NEXT &#9654;</a> </p>

# Operational Dashboard: Environment Tab

The Environment tab contains the following panels on which you begin the installation process on the Operational Dashboard. 
On these panels, you set up your cloud environment and complete the HP Cloud OS Administration node installation. 
For the installation process, you must complete each panel in the order they are displayed. 

* [Prerequisites](#prerequisites)
* [Server Types](#server-types)
* [Connections](#connections)
* [Networks](#networks)
* [Complete Install](#complete-install)

For procedural instructions, see [Install and Configure Your Clouds](/cloudos/install/).

## Prerequisites

The following information provides details about the Prerequisites panel:

* **Concepts:**

 * [Prerequisites Overview](#prerequisites-overview)

* **UI Description:**

 * [Prerequisites Page](#prerequisites-page)

 * [Cloud Administration Node Internet Access Prerequisite Dialog](#cloud-administration-node-internet-access-prerequisite-dialog)

 * [External DNS Server Prerequisite Dialog](#external-dns-server-prerequisite-dialog)

 * [Cloud Administration Node Time Settings Prerequisite Dialog](#cloud-administration-node-time-settings-prerequisite-dialog)

 * [Email Notification Settings Prerequisite Dialog](#email-notification-settings-prerequisite-dialog)

### Prerequisites Overview

The first step on the Operational Dashboard is to configure the HP Cloud OS Administration node prerequisites.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:900px;"> <b>Caution:</b> 
Any prerequisites you want to configure, must be done before you complete the steps on the Complete Install page. 
For details, see the <a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install-overview">Complete Install Overview</a>. 
After that, the Edit Prerequisite dialogs will be read-only. Once the install process is triggered, no changes can be made. 
If you want to make changes, you need to start over by re-installing the HP Cloud OS Administration node. 
For procedural instructions, see <a href="/cloudos/install/">Install and Configure Your Cloud</a>.
</p>

* **Cloud Administration Node Internet Access** &mdash; Configure to set up Internet access on the HP Cloud OS Administration node. You will need Internet access for downloading hot fixes and updates using the [Hot Fixes](/cloudos/manage/operational-dashboard/cloud-tab/#hot-fixes) panel, 
or the [Updates and Extensions](/cloudos/manage/operational-dashboard/cloud-tab/#updates-and-extensions) panel.

* **(Optional) External DNS Server** &mdash; Configure to add the IP address of the external DNS server your Cloud OS environment is using to access named websites within your cloud.

* **Cloud Administration Node Time Settings** &mdash; Configure to reflect the current time to ensure that the Cloud is created successfully.

* **(Optional) Email Notification Settings** &mdash; Configure to send email notifications when the Cloud and Compute Region operations complete because this takes some time. By enabling and setting this prerequisite, you can be alerted by e-mail when each operation completes.

	
### Prerequisites Page

To access: Select the Environment tab > Prerequisites.

The following table describes the Prerequisites page UI elements:

<table style="text-align: left; vertical-align: top; min-width:900px;">

<tr style="background-color: #C8C8C8;">
<th>UI Elements</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> Prerequisite Description column </nobr> </td>
<td> HP Cloud OS Administration node prerequisite settings:
<ul>
<li>Cloud Administration Node Internet Access</li>
<li>External DNS Server</li>
<li>Cloud Administration Node Time Settings</li>
<li>Email Notification Settings </li>
</ul>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> Last Updated column </td>
<td> Timestamp when the prerequisite was completed. </td>
</tr> 	

<tr style="background-color: white; color: black;">
<td> Edit Prerequisite button </td>
<td> <nobr> Opens the Edit Prerequisite dialog for the corresponding Prerequisite. </nobr> </td>
</tr> 	
 	
<tr style="background-color: white; color: black;">
<td> Complete Prerequisite button </td>
<td> Completes the setup of the setting. </td>
</tr> 	

</table>

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>



### Cloud Administration Node Internet Access Prerequisite Dialog

To access: Select the Environment tab > Prerequisites> click Edit Prerequisite for the Cloud Administration Node Internet Access Prerequisite.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:900px;"> <b>Caution:</b> 
If you want to set the Administration Node Internet Access Prerequisite, you must configure it before you complete the steps on the 
Complete Install panel. For details, see the <a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a> topic.
After that, the Administration Node Internet Access Prerequisite dialog will be read-only. Once the install process is triggered, 
no changes can be made. If you want to make changes, you need to start over by re-installing the HP Cloud OS Administration node. 
For procedural instructions, see <a href="/cloudos/install/">Install and Configure Your Cloud</a>.
</p>

The following table describes the Cloud Administration Node Internet Access Prerequisite dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:900px;">

<tr style="background-color: #C8C8C8;">
<th>UI Elements</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td> Network Interface </td>
<td> Select the network interface on the HP Cloud OS Administration node that has been configured for Internet access. <b>Note:</b> Interface <code>eth0</code> is not used for Internet access.
</td>
</tr>

<tr style="background-color: #f8f8f8; color: black;">
<td colspan="2"> Network Configuration - Set the network configuration for your environment. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> DHCP checkbox </td>
<td>Enable (default) or disable DHCP.
<p>If the node will receive its IP configuration via DHCP, leave the DHCP checkbox checked. When DHCP is checked, the four Network Configuration fields are disabled, and can be left blank.</p>
<p>If you have a static IP address allocated for the node, uncheck the DHCP checkbox and enter the appropriate information into the IP Address, Network Mask, Gateway, and DNS Address fields.</p> 
</td>
</tr> 	

<tr style="background-color: white; color: black;">
<td> IP Address </td>
<td> Leave blank unless you have a static IP address, which you enter here. </td>
</tr> 	
 	
<tr style="background-color: white; color: black;">
<td> Network Mask </td>
<td> Leave blank unless you have a static IP address. Type the network mask. </td>
</tr> 	

<tr style="background-color: white; color: black;">
<td> Gateway </td>
<td> Leave blank unless you have a static IP address. Type the gateway. </td>
</tr> 

<tr style="background-color: white; color: black;">
<td> DNS Address </td>
<td> Leave blank unless you have a static IP address. Type the DNS address. </td>
</tr>

<tr style="background-color: #f8f8f8; color: black;">
<td colspan="2"> HTTP Proxy Information -- Set proxy information applicable for your environment. If you are on a network that has a proxy, you must fill in this proxy information.
<br /> <br /> 
<b>Caution:</b> Specifying incorrect proxy host settings might cause some features to not work correctly in the Administration Dashboard.
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> Host </td>
<td> Get this from your system administrator or from the settings in your web browser. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Port </td>
<td> Get this from your system administrator or from the settings in your web browser. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Non-Proxy Hosts </td>
<td> Specify addresses that should not use proxy servers (for Controller/Compute Nodes' admin and os_sdn networks, IP range). 
Each network needs to be separated by a bar "|". For example: <code>10.*|192.*|localhost</code>. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Username (Optional) </td>
<td> Specify the username if necessary for the proxy setting. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Password (Optional) </td>
<td> Specify the password if necessary for the proxy setting. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> Update Prerequisite </nobr> </td>
<td> Click to save these settings, then click Complete Prerequisite to complete this setup. </td>
</tr>

</table>

> **Note:** If this prerequisite fails to complete successfully, an error message displays on the Prerequisites page. For a potential solution, see [Problem: Admin Node Internet Access Prerequisites fail to complete](/cloudos/manage/troubleshooting/#problem-admin-node-internet-access-prerequisites-fail-to-complete) in the Troubleshooting topic. 

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

### External DNS Server Prerequisite Dialog

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:900px;"> <b>Caution:</b> 
If you want to set the External DNS Server Prerequisite, you must configure it before you complete the steps on the 
Complete Install panel. For details, see the <a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a> topic.
After that, the External DNS Server Prerequisite dialog will be read-only. Once the install process is triggered, 
no changes can be made. If you want to make changes, you need to start over by re-installing the HP Cloud OS Administration node. 
For procedural instructions, see <a href="/cloudos/install/">Install and Configure Your Cloud</a>.
</p>

To access: Select the Environment tab > Prerequisites> click Edit Prerequisite for the External DNS Server Prerequisite.

The following table describes the External DNS Server Prerequisite dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:900px;">

<tr style="background-color: #C8C8C8;">
<th>UI Elements</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td> External DNS Server IP Address </td>
<td> Type the IP address of the external DNS server used by your Cloud OS environment to be able to access named websites within your cloud. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Update Prerequisite </td>
<td> Click to save the IP address. </td>
</tr>

</table> 

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


### Cloud Administration Node Time Settings Prerequisite Dialog

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:900px;"> <b>Caution:</b> 
If you want to set the Administration Node Time Settings Prerequisite, you must configure it before you complete the steps on the 
Complete Install panel. For details, see the <a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a> topic.
After that, the Administration Node Time Settings Prerequisite dialog will be read-only. Once the install process is triggered, 
no changes can be made. If you want to make changes, you need to start over by re-installing the HP Cloud OS Administration node. 
For procedural instructions, see <a href="/cloudos/install/">Install and Configure Your Cloud</a>.
</p>

To access: Select the Environment tab > Prerequisites> click Edit Prerequisite for the Cloud Administration Node Time Settings Prerequisite.

The following table describes the Cloud Administration Node Time Settings Prerequisite dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:900px;">

<tr style="background-color: #C8C8C8;">
<th>UI Elements</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td> Timezone </td>
<td> Set the appropriate time zone for your area (UTC is the default). </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Date </td>
<td> Set the date applicable for your environment if different from the default. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Time </td>
<td> Set the time applicable for your environment if different from the default. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Update Prerequisite </td>
<td> Click to save these settings, then click <b>Complete Prerequisite</b> to complete this setup. </td>
</tr>

</table> 

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


### Email Notification Settings Prerequisite Dialog

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:900px;"> <b>Caution:</b> 
If you want to set the Email Notification Settings Prerequisite, you must configure it before you complete the steps on the 
Complete Install panel. For details, see the <a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a> topic.
After that, the Email Notification Settings Prerequisite dialog will be read-only. Once the install process is triggered, 
no changes can be made. If you want to make changes, you need to start over by re-installing the HP Cloud OS Administration node. 
For procedural instructions, see <a href="/cloudos/install/">Install and Configure Your Cloud</a>.
</p>

To access: Select the Environment tab > Prerequisites> click Edit Prerequisite for the Email Notification Settings Prerequisite.

The following table describes the Email Notification Settings Prerequisite dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:900px;">

<tr style="background-color: #C8C8C8;">
<th>UI Elements</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td> Timezone </td>
<td> Set the appropriate time zone for your area (UTC is the default). </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Date </td>
<td> Set the date applicable for your environment if different from the default. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Time </td>
<td> Set the time applicable for your environment if different from the default. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Update Prerequisite </td>
<td> Click to save these settings, then click <b>Complete Prerequisite</b> to complete this setup. </td>
</tr>

</table> 

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## Server Types

Coming soon ... not formatted yet.



### Server Types Overview

Coming soon ... not formatted yet.


### Server Types Page

Coming soon ... not formatted yet.


### Edit Server Definition Dialog

Coming soon ... not formatted yet.


### Create Server Definition Dialog

Coming soon ... not formatted yet.



<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Connections

Coming soon ... not formatted yet.

The following information provides details about the Connections panel:

* Concepts
* Connections Overview
* UI Description
 * Connections Page
 * Edit Connection Dialog
 * Create Connection Dialog
 
### Connections Overview

Coming soon ... not formatted yet.




### Connections Page

Coming soon ... not formatted yet.




### Edit Connection Dialog

Coming soon ... not formatted yet.




### Create Connection Dialog

Coming soon ... not formatted yet.



<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>





## Networks

Coming soon ... not formatted yet.

The following information provides details about the Networks panel:

* Concepts

* Networks Panel Overview:

* UI Description
 * Networks Page
 * Edit Network Dialog
 * Edit Address Ranges Dialog
 * Create Network Dialog
 


### Networks Panel Overview

Coming soon ... not formatted yet.


<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>




## Complete Install

The following information provides details about the Complete Install panel.

* Concepts

 * Complete Install Overview

* UI Description

 * Complete Install Page
 * Confirm Complete Install Dialog

### Complete Install Overview

Coming soon ... not formatted yet.




### Complete Install Page

Coming soon ... not formatted yet.




### Confirm Complete Install Dialog

Coming soon ... not formatted yet.



<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

