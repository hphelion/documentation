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

**Concepts:**

[Prerequisites Overview](#prerequisites-overview)

**UI Description:**

* [Prerequisites Page](#prerequisites-page)

* [Cloud Administration Node Internet Access Prerequisite Dialog](#cloud-administration-node-internet-access-prerequisite-dialog)

* [External DNS Server Prerequisite Dialog](#external-dns-server-prerequisite-dialog)

* [Cloud Administration Node Time Settings Prerequisite Dialog](#cloud-administration-node-time-settings-prerequisite-dialog)

* [Email Notification Settings Prerequisite Dialog](#email-notification-settings-prerequisite-dialog)

### Prerequisites Overview

The first step on the Operational Dashboard is to configure the HP Cloud OS Administration node prerequisites.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px;"> <b>Caution:</b> 
Any prerequisites you want to configure, must be done before you complete the steps on the Complete Install panel. 
For details, see the <a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install-overview">Complete Install Overview</a>. 
After that, the Edit Prerequisite dialogs are read-only. Once the install process is triggered, no changes can be made. 
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

<table style="text-align: left; vertical-align: top; min-width:700px;">

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
<td> Opens the Edit Prerequisite dialog for the corresponding Prerequisite. </td>
</tr> 	
 	
<tr style="background-color: white; color: black;">
<td> Complete Prerequisite button </td>
<td> Completes the setup of the setting. </td>
</tr> 	

</table>

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>



### Cloud Administration Node Internet Access Prerequisite Dialog

To access: Select the Environment tab > Prerequisites> click <b>Edit Prerequisite</b> for the Cloud Administration Node Internet Access Prerequisite.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px;"> <b>Caution:</b> 
If you want to set the Administration Node Internet Access Prerequisite, you must configure it before you complete the steps on the 
Complete Install panel. For details, see the <a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a> topic.
After that, the Administration Node Internet Access Prerequisite dialogs are read-only. Once the install process is triggered, 
no changes can be made. If you want to make changes, you need to start over by re-installing the HP Cloud OS Administration node. 
For procedural instructions, see <a href="/cloudos/install/">Install and Configure Your Cloud</a>.
</p>

The following table describes the Cloud Administration Node Internet Access Prerequisite dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

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
<td> HTTP Proxy Information </td>
<td>Set proxy information applicable for your environment. If you are on a network that has a proxy, you must fill in this proxy information.
<br />
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px;"> <b>Caution:</b>  
Specifying incorrect proxy host settings might cause some features to not work correctly in the Administration Dashboard.</p>
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
<td> <nobr> Username (Optional) </nobr> </td>
<td> Specify the username if necessary for the proxy setting. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> Password (Optional) </nobr> </td>
<td> Specify the password if necessary for the proxy setting. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> Update Prerequisite </nobr> </td>
<td> Click to save these settings, then click Complete Prerequisite to complete this setup. </td>
</tr>

</table>

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px;"> <b>Note:</b> If this prerequisite fails to 
complete successfully, an error message displays on the Prerequisites page. For a potential solution, see <a href="/cloudos/manage/troubleshooting/#problem-admin-node-internet-access-prerequisites-fail-to-complete">Problem: Admin Node Internet Access Prerequisites fail to complete</a> in the Troubleshooting topic. 
</p>

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

### External DNS Server Prerequisite Dialog

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px;"> <b>Caution:</b> 
If you want to set the External DNS Server Prerequisite, you must configure it before you complete the steps on the 
Complete Install panel. For details, see the <a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a> topic.
After that, the External DNS Server Prerequisite dialogs are read-only. Once the install process is triggered, 
no changes can be made. If you want to make changes, you need to start over by re-installing the HP Cloud OS Administration node. 
For procedural instructions, see <a href="/cloudos/install/">Install and Configure Your Cloud</a>.
</p>

To access: Select the Environment tab > Prerequisites> click <b>Edit Prerequisite</b> for the External DNS Server Prerequisite.

The following table describes the External DNS Server Prerequisite dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

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

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px;"> <b>Caution:</b> 
If you want to set the Administration Node Time Settings Prerequisite, you must configure it before you complete the steps on the 
Complete Install panel. For details, see the <a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a> topic.
After that, the Administration Node Time Settings Prerequisite dialogs are read-only. Once the install process is triggered, 
no changes can be made. If you want to make changes, you need to start over by re-installing the HP Cloud OS Administration node. 
For procedural instructions, see <a href="/cloudos/install/">Install and Configure Your Cloud</a>.
</p>

To access: Select the Environment tab > Prerequisites> click **Edit Prerequisite** for the Cloud Administration Node Time Settings Prerequisite.

The following table describes the Cloud Administration Node Time Settings Prerequisite dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

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

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px;"> <b>Caution:</b> 
If you want to set the Email Notification Settings Prerequisite, you must configure it before you complete the steps on the 
Complete Install panel. For details, see the <a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a> topic.
After that, the Email Notification Settings Prerequisite dialogs are read-only. Once the install process is triggered, 
no changes can be made. If you want to make changes, you need to start over by re-installing the HP Cloud OS Administration node. 
For procedural instructions, see <a href="/cloudos/install/">Install and Configure Your Cloud</a>.
</p>

To access: Select the Environment tab > Prerequisites> click **Edit Prerequisite** for the Email Notification Settings Prerequisite.

The following table describes the Email Notification Settings Prerequisite dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

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

The following information provides details about the Server Types panel:

**Concepts:**

[Server Types Overview](#server-types-overview)

**UI Descriptions:**

* [Server Types Page](#server-types-page)
* [Edit Server Definition Dialog](#edit-server-definition-dialog)
* [Create Server Definition Dialog](#create-server-definition-dialog)

### Server Types Overview

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px;"> <b>Caution:</b> If you plan to customize the servers, 
you must do that before you complete the steps on the Complete Install panel. For details, see 
the <a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a> topic.
After that, the Server Types dialogs are read-only. Once the install process is triggered, 
no changes can be made. If you want to make changes, you need to start over by re-installing the HP Cloud OS Administration node. 
For procedural instructions, see <a href="/cloudos/install/">Install and Configure Your Cloud</a>.
</p>

The Server Types panel allows you to capture new or use existing server definitions about the networking ports for various servers in 
your bare-metal cloud environment. If all servers in your cloud are the same server type (homogeneous nodes), you are not required to 
configure anything in this view. HP recommends that you keep and accept the default settings.

However, if the servers in your cloud are different types of servers, you may be required to use a Linux utility such as dmidecode to 
get the pattern and CLI commands to determine the bus addresses of your server's network ports.

Here is one way to get the values for Server Name Pattern and Bus Order:

Server Name Pattern:

<pre>
dmidecode | grep "Product Name"
</pre>

Bus Order (for UbuntuOS):

<pre>
ls -l /sys/class/net | egrep pci | sed -e 's/^.*pci//' -e 's%/net.*$%%'
</pre>

This is necessary to define the correct order of those ports for the various server types so that all the servers have the 
same enumeration of network ports (0, 1, 2, 3 and so on) across the cloud. If you do not configure the server types for a cloud with 
heterogeneous nodes in this way, you will experience networking failures because the servers will not have the same network port enumeration order.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px;"> <b>Tip:</b> Based on your network and hardware infrastructure, 
you can accept defaults or customize Server Types.
</p>



### Server Types Page

To access: Select the Environment tab > Server Types.

The following table describes the Server Types page UI elements: 

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI Elements</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td> Server Name Pattern column </td>
<td> List of the Cloud OS supported server types. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Bus Order column </td>
<td> List of the bus orders related to the corresponding server types. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Edit Server Definition button </td>
<td> Click to open the <a href="/cloudos/manage/operational-dashboard/environment-tab/#edit-server-definition-dialog">Edit Server Definition dialog</a> to customize the server type. 
</td>
</tr>

<tr style="background-color: white; color: black;">
<td>Create Server Definition button </td>
<td> Click to add a new server type on the Create Server Definition dialog. <br /> <br />
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px;"> <b>Note:</b> The Create Server Definition button only displays 
while the servers can be added or edited. Once you do the <a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a>, this button disappears and you cannot 
add new servers or edit or delete existing servers.</p>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> Drop-down arrow > </nobr> Delete Server Definition </td>
<td> Select to delete the server type from the HP Cloud OS Administration node. You are prompted to confirm the deletion. <br /> <br />
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px;"> <b>Note:</b> The Delete Server Definition menu item only displays while 
the servers can be added or edited.  Once you do the <a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a>, 
this menu item disappears and you cannot add new servers or edit or delete existing servers.
</td>
</tr>

</table> 

### Edit Server Definition Dialog

To access: Select the Environment tab > Server Types > click <b>Edit Server Definition</b> for the server you want to customize.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px;"> <b>Caution:</b> If you plan to customize the servers, 
you must do that before you complete the steps on the Complete Install panel. For details, see 
the <a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a> topic.
After that, the Edit Server Definition dialogs are read-only. Once the install process is triggered, 
no changes can be made. If you want to make changes, you need to start over by re-installing the HP Cloud OS Administration node. 
For procedural instructions, see <a href="/cloudos/install/">Install and Configure Your Cloud</a>.
</p>

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI Elements</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td> Server Name Pattern </td>
<td> Name of the server type you are editing.</td>
</tr>

<tr style="background-color: white; color: black;">
<td> Bus Order </td>
<td> One or more bus addresses of your server's network ports.  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Add Bus Order </td>
<td> Click to add a blank bus order textbox, in which you then type the new bus order related to the server type. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Delete Bus Order </td>
<td> Click to delete the selected bus order(s) that are not relevant to the server type. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> Update Server Definition </nobr> </td>
<td> Click to save the updated server definition. <br /> <br />
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px;"> <b>Note:</b> The <b>Update Server Definition</b> button only 
displays while the servers are editable. Once you do the 
<a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a>, 
the dialog become read-only and this button disappears.
</p>
</td>
</tr>

</table> 


### Create Server Definition Dialog

To access: Select the Environment tab > Server Types > click <b>Create Server Definition</b>.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px;"> <b>Caution:</b> The <b>Create Server Definition</b> button only displays while the servers are editable. 
Once the install process is triggered by the 
<a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a>, this button disappears and no 
changes can be made. If you want to make changes, you need to start over by re-installing the HP Cloud OS Administration node. 
For procedural instructions, see <a href="/cloudos/install/">Install and Configure Your Cloud</a>.
</p>

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI Elements</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td> Server Name Pattern </td>
<td> Name of the server type you are creating.</td>
</tr>

<tr style="background-color: white; color: black;">
<td> Bus Order </td>
<td> One or more bus addresses of your server's network ports.  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Add Bus Order </td>
<td> Click to add a blank bus order textbox, in which you then type the new bus order related to the server type. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Delete Bus Order </td>
<td> Click to delete the selected bus order(s) that are not relevant to the server type. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> Create Server Definition </nobr> </td>
<td> Click to create the updated server definition. <br /> <br />
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px;"> <b>Note:</b> The <b>Create Server Definition</b> button only 
displays while the servers are editable. Once you do the 
<a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a>, 
the dialog become read-only and this button disappears.
</p>
</td>
</tr>

</table> 

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Connections

The following information provides details about the Connections panel:

**Concepts:**

[Connections Overview](#connections-overview)

**UI Descriptions:**

* [Connections Page](#connections-page)
* [Edit Connection Dialog](#edit-connection-dialog)
* [Create Connection Dialog](#create-connection-dialog)
 
### Connections Overview

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px;"> <b>Caution:</b> 
If you plan to customize the connections, you must do that before you complete the steps on the Complete Install panel.  
For details, see the <a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install-overview">Complete Install Overview</a>. 
After that, the Connections dialogs are read-only. Once the install process is triggered, no changes can be made. 
If you want to make changes, you need to start over by re-installing the HP Cloud OS Administration node. 
For procedural instructions, see <a href="/cloudos/install/">Install and Configure Your Cloud</a>.
</p>

Based on your network infrastructure, you must customize the Connections settings in the Connections panel. 
After the enumeration of ports is consistent across all servers in the cloud, the Connections panel defines those 
ports into a set of logical connections (interfaces) that will be used to eventually define the networks.

The connections are defined based on the Network Modes along with a list of logical interfaces and the corresponding 
physical interfaces' ports and bandwidth. For each logical connection (intf0, intf1, intf2) the network type is 
identified (admin, os_sdn, public). The os_sdn value stands for OpenStack Software-Defined-Network.

Examples of Network Modes:

* Single Mode: All connections are shared on the same physical interface through VLAN.
* Dual Mode: All connections have their own interfaces where VLAN and bridge are off.
* Team Mode: All connections are shared on the same two physical interfaces through VLAN. Teaming means treating the wires like a single bundle.

Examples of Logical Interface values:

<pre>
intf0 (admin, bmc_vlan)
intf1 (os_sdn)
intf2 (public)
</pre>

Examples of Physical Interface values:

<pre>
1Gb (preferred) on 1st port
1Gb (preferred) on 2nd port
1Gb (preferred) on 3rd port
</pre>

In this Dual mode example, "1Gb (preferred) on 2nd port" means a one gigabit network for port 2, as enumerated by default from the 
server's BIOS or as overridden in the Server Types panel. The "preferred" tag suggests that if the NIC/port does not support 1Gb, HP Cloud 
OS falls back to the next maximum speed supported by the NIC or port. However, if there is no preferred tag, it means the port has to 
support 1Gb; otherwise the deployment might not succeed.

Following are some of the criteria to be considered when making changes to the default settings. 

In Dual mode, the default settings assume that all the nodes have their interfaces wired as:

<pre>
eth0 - admin network
eth1 - os_sdn network
eth2 - public/external network
</pre>

**IMPORTANT:** In such a scenario, keep the default values intact.

In Dual mode, if the wiring of networks between the nodes are non-contiguous and/or not in sequence, you need to change the default mapping:

**Example 1:** For all the nodes, eth0 - admin; eth1 - public, eth2 - private; the Connections table must be customized to look like the following:

<pre>
intf0 - 1Gb (preferred) on 1st port
intf1 - 1Gb (preferred) on 3rd port
intf2 - 1Gb (preferred) on 2nd port
</pre>


**Example 2:** For all the nodes, eth0 - admin, eth2 - os_sdn, eth4 - public/external the Connections table must be customized to look like the following:

<pre>
intf0 - 1Gb (preferred) on 1st port
intf1 - 1Gb (preferred) on 3rd port
intf2 - 1Gb (preferred) on 5th port
</pre>

In Single mode, keep the defaults. It is assumed that eth0 port is configured on the switch to support tagged VLANs (discussed in the next section).

**Note:** Interface mapping must be identical on all the nodes.

In Team mode, configure virtual connections to use both trunks. For example:

* Map eth0, eth2, and eth4 to trunk 1.
* Map eth1, eth3, and eth5 to trunk 2.

Note that in this example, the eth0 and eth1 interfaces belongs to same VLAN; the same is true for the eth2 and eth3 pair, and the eth4 and eth5 pair. 
When the HP Cloud OS Administration node allocates the bare-metal server, Cloud OS should create a teaming NIC using the NIC pairs.

Here's a partial example of how the Team mode configuration could look on this Connections dialog:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>Logical Interface</th>
<th>Physical Interface</th>
<th>Interface Mode</th>
</tr>

<tr style="background-color: white; color: black;">
<td> intf0 (admin, bmc_vlan) </td>
<td> 1Gb on 1st port, 1Gb on 2nd port </td>
<td> 6 </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> intf1 (os_sdn) </td>
<td> 1Gb on 1st port, 1Gb on 2nd port </td>
<td> 6 </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> intf2 (public) </td>
<td> 1Gb on 1st port, 1Gb on 2nd port </td>
<td> 6 </td> 
</tr>

</table>


### Connections Page

To access: Select the Environment tab > Connections.

The following table describes the Connections page UI elements: 

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th> UI Elements </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td> Network Mode column </td>
<td> Lists the available network modes for the connection set:
<ul>
<li>Single Mode: All connections are shared on the same physical interface through VLAN.
<li>Dual Mode: All connections have their own interfaces where VLAN and bridge are off.
<li>Team Mode: All connections are shared on the same two physical interfaces through VLAN. Teaming means treating the wires like a single bundle.
</ul>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> Role column </td>
<td> Lists the roles for the connection set. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Logical Interface column </td>
<td> Lists the network modes' logical interfaces for the connection set. For each logical connection (intf0, intf1, intf2) 
the network type is identified (admin, os_sdn, public):
<ul>
<li>intf0 (admin, bmc_vlan)
<li>intf1 (os_sdn)
<li>intf2 (public)
</ul>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> Physical Interface column </td>
<td> Lists the network modes' physical interface values for the corresponding connection set. For details, see the 
<a href="/cloudos/manage/operational-dashboard/environment-tab/#edit-connection-dialog">Edit Connection Dialog</a> section.
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> Interface Mode column </td>
<td> Lists the interface mode for the network mode. 
The interface mode is the default teaming algorithm to use for the bonding driver in Linux. 
It is applicable only for team mode.
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> Edit Connection button </td>
<td> Click to open the Edit Connection dialog. For details, see the 
<a href="/cloudos/manage/operational-dashboard/environment-tab/#edit-connection-dialog">Edit Connection Dialog</a> section.
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> Create Connection button </td>
<td> Click to add a new connection on the Create Connection dialog. <br /> <br /> 
<b>Note:</b> The Create Connection button only displays while the connections can be added or edited. 
Once you do the <a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a>, 
this button disappears and you cannot add new or edit connections.
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> Drop-down arrow > Delete Connection </nobr> </td>
<td> Select to delete the connection. You are prompted to confirm the deletion. <br /> <br /> 
<b>Note:</b> This option is unavailable after the <a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a>.
</td>
</tr>

</table>


### Edit Connection Dialog

To access: Select the Environment tab > Connections > click **Edit Connection** for the connection you want to customize.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px;"> <b>Caution:</b> 
If you plan to customize the connections, you must do that before you complete the steps on the Complete Install panel.  
For details, see the <a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install-overview">Complete Install Overview</a>. 
After that, the Edit Connections dialogs are read-only. Once the install process is triggered, no changes can be made. 
If you want to make changes, you need to start over by re-installing the HP Cloud OS Administration node. 
For procedural instructions, see <a href="/cloudos/install/">Install and Configure Your Cloud</a>.
</p>

The following table describes the Edit Connection dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th> UI Elements </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td> Connection Type </td>
<td> Connection type name (network mode) of the connection set you want to customize.
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> Role </td>
<td> Indicates the networking configuration needed for a specific managed node or nodes. By default, it is set to blank, 
which means for any role a managed node takes, the networking configuration must be the same across all managed nodes. <br /> <br /> 
<b>Note:</b> Do not change from the default value (blank) for this release.
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> Add Details </td>
<td> Click to add a new blank row on which you add the logical interface and physical interface. Interface mode is applicable for Team mode only. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Delete Details </td>
<td> Click to delete the selected row(s). </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Logical Interface </td>
<td> Default logical interface for the corresponding connection set. <br /> <br /> 

For each logical connection (intf0, intf1, intf2) the network type is identified (admin, os_sdn, public):

<pre>
intf0 (admin, bmc_vlan)
intf1 (os_sdn)
intf2 (public)
</pre>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> Physical Interface </td>
<td> Default physical interface values for the corresponding connection set. The value contains (up to) four characters, and follows these conventions:
<ul>
<li>1st character: the allowable value is a question mark (?) or blank. The question mark indicates a preferred connection, meaning the available bandwidth supported by the Network Interface card (NIC). If not specified (blank), Cloud OS configures the physical interface to the value specified by the next character.
<li>2nd character: the allowable value may be 1, 10, or 100. It is a numerical value to indicate the network bandwidth.
<li>3rd character: the value may be g, m, or k. It is the bandwidth unit. g represents gigabits; m represents megabits; k represents kilobits.
<li>4th character: the value may be a number between 1 and 16. It is a numerical value to specify the port or NIC number.
</ul>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> Interface Mode </td>
<td> The default teaming algorithm to use for the bonding driver in Linux. The default value is 6 which indicates teaming uses 
the "adaptive load balancing" algorithm. The other values used with teaming are not supported in this release. This parameter is 
applicable only if you are using a Team mode. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> Update Connection </nobr> </td>
<td> Click to save the connection settings. <br /> <br /> 
<b>Note:</b> The Update Connection button only displays the connections that are editable.  
Once you do the <a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a>, 
this dialog become read-only and this button disappears. </td>
</tr>

</table>


### Create Connection Dialog

To access: Select the Environment tab > Connections > click **Create Connection** for the connection you want to customize.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px;"> <b>Caution:</b> The Create Connection button only displays 
while the connections are editable. Once the install process is triggered by the 
<a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a>, this button disappears and no changes can be made. 
If you want to make changes, you need to start over by re-installing the HP Cloud OS Administration node. 
For procedural instructions, see <a href="/cloudos/install/">Install and Configure Your Cloud</a>.
</p>

The following table describes the Create Connection dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th> UI Elements </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td> Connection Type </td>
<td> Type the network mode for the connection set. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Role </td>
<td> Indicates the networking configuration needed for a specific managed node or nodes. By default, it is set to blank, which means for any role a 
managed node takes, the networking configuration must be the same across all managed nodes. <br /> <br /> 
<b>Note:</b> Do not change from the default value (blank) for this release. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Add Details </td>
<td> Click to add a new blank row on which you add the logical interface and physical interface. 
Interface mode is applicable for Team mode only. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Delete Details </td>
<td> Click to delete the selected row(s). </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Logical Interface </td>
<td> Type the logical interface appropriate for the network mode. <br /> <br /> 
For each logical connection (intf0, intf1, intf2) the network type is identified (admin, os_sdn, public). For details, see 
<a href="/cloudos/manage/operational-dashboard/environment-tab/#edit-connection-dialog">Edit Connection Dialog</a>. 
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> Physical Interface </nobr> </td>
<td> Type the physical interface values for the corresponding network mode. The value contains (up to) four characters, 
and follows specific conventions. For details see 
<a href="/cloudos/manage/operational-dashboard/environment-tab/#edit-connection-dialog">Edit Connection Dialog</a>.
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> Interface Mode </td>
<td> The default teaming algorithm to use for the bonding driver in Linux. The default value is 6 which indicates teaming uses 
the "adaptive load balancing" algorithm. The other values used with teaming are not supported in this release. This parameter is 
applicable only if you are using a Team mode. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> Create Connection </nobr> </td>
<td> Click to create the connection. <br /> <br /> 
<b>Note:</b> The Create Connection button only displays the connections that are editable.  
Once you do the <a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a>, 
this dialog become read-only and this button disappears. </td>
</tr>

</table>


<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>



## Networks

The following information provides details about the Networks panel:

**Concepts:**

[Networks Panel Overview](#network-panel-overview)

**UI Descriptions:**

* [Networks Page](#network-page)

* [Edit Network Dialog](#edit-network-dialog)

* [Edit Address Ranges Dialog](#edit-address-ranges-dialog)

* [Create Network Dialog](#create-network-dialog)
 

### Networks Panel Overview

On the Networks panel, you define the networks that are used in your IT environment. For each logical connection (intf0, intf1, intf2) a network 
is defined (admin, os_sdn, and public). These definitions are used for various purposes in the cloud such as networking between the nodes and 
the Cloud OS Administration node (using the admin network), the public or corporate network (such as public network) attached to your cloud, 
or networking between the Virtual Machine instances and the traffic from the instances to the Cloud Controller Node (using the os_sdn network).

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px;"> <b>Important:</b> Customizing the public network settings is 
critical. Any missing or incorrect values will result in you having to re-install the HP Cloud OS Administration node. 
For procedural instructions, see <a href="/cloudos/install/">Install and Configure Your Cloud</a>.
</p>

Following are some of the criteria to be considered while making changes to the default settings:

* The default settings "Dual" assume you have a separate physical network for each interface; the admin, os_sdn, and public network across the Cloud OS Administration node and all managed nodes.

* For a production type of deployment and to reduce the complexities of configuring the switches, it is strongly recommended that you provide separate wired networks for public, os_sdn and admin. This requires you to specify your own range of IP addresses and other settings.

* Some networks and address ranges for those networks are provided by default. You can modify or delete the IP address ranges as well as add new ones. You must use valid ranges that fall within the subnet as defined by the subnet address and mask specified in the network details.

* If you edit the network IP address ranges and enter invalid ranges, you will get a validation error when you click Update Address Ranges in the Edit Address Ranges dialog. The validation error shows the invalid address (start or end) and the corresponding network type. You must fix all errors in the Edit Address Ranges dialog and click Update Address Ranges to validate the addresses are correct. Clicking Cancel will not trigger the validation step.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px;"> <b>Caution:</b> The address ranges validation only occurs when you 
open the Edit Address Ranges dialog for each network and click Update Address Ranges. Otherwise,you will not know if you have any errors. 
However, the Complete Install step will run a validation check and cannot be completed until the errors are fixed. If there is an address 
range error, the validation check will show the network type and possibly the address value. If not, open the Edit Address Ranges dialog 
for the specified network and click <b>Update Address Ranges</b> to identify the incorrect address. For details, see 
<a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a>.
</p>

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>



### Networks Page

To access: Select the Environment tab > Networks.

The following table describes the Networks page UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th> UI Elements </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td><b>Network Type</b> column</td>
<td> Lists the available network types: 

<ul>
<li><b>admin</b> &mdash; Used for administrative functions, such as managed node installation, TFTP booting, DHCP assignments, system logs, backups, 
and other monitoring tasks. This also carries cinder-volume traffic. Must be an isolated private network.</li>
<li><b>bmc</b> &mdash; Baseboard Management Controller LAN network for Intelligent Platform Management Interface (IPMI) traffic. For test purposes only.</li>
<li><b>bmc_vlan</b> &mdash; Baseboard Management Controller VLAN (IPMI traffic VLAN). For test purposes only.</li>
<li><b>os_sdn</b> &mdash; OpenStack Software-Defined-Network. This network is for data traffic between the Virtual Machine instances, 
and the traffic from the instances to the Cloud Controller Node. Must be an isolated private network.</li>
<li><b>public</b> &mdash; Public or corporate network that is attached to your cloud infrastructure.  Must provide a pool of IP addresses 
for the Cloud Controller node for floating IP assignments. Size of the pool depends on the number of Virtual Machine instances. 
This network handles traffic to the outside world for the instances.</li>
</ul>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>Logical Interface</b> column</td>
<td>Logical interface connection associated with the network type.</td>
</tr>
    
<tr style="background-color: white; color: black;">
<td><b>Subnet</b> column</td>
<td>IP address associated with the network type.</td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>VLAN</b> column</td>
<td>Virtual Local Area Network ID number associated with the network type. </td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>VLAN Enabled</b> column</td>
<td> Indicates whether the associated network coexists on the same physical interface as other networks. <br />

<p>If the networks (particularly os_sdn and public) co-exist on the same physical network, VLAN Enabled must be set to <b>True</b>. 
This means that the Network Mode will be set to <b>single</b> by default on the 
<a href="/cloudos/manage/operational-dashboard/environment-tab/#confirm-complete-install-dialog">Confirm Complete Install Dialog</a>.</p>

<p>If the networks (particularly os_sdn and public) exist on separate physical interfaces,VLAN Enabled must be set to <b>False</b>. 
This means that the Network Mode will be set to <b>dual</b> by default on the 
<a href="/cloudos/manage/operational-dashboard/environment-tab/#confirm-complete-install-dialog">Confirm Complete Install Dialog</a>. </p>

</td>
</tr>
				
<tr style="background-color: white; color: black;">
<td><b>Bridge Enabled</b> column </td>
<td>Indicates whether a bridge interface should be added on top of the interface for the corresponding network: <b>False</b> (default) or <b>True</b>. </td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>Create Network</b> button</td>
<td> Click to add a new network type on the <a href="/cloudos/manage/operational-dashboard/environment-tab/#create-network-dialog">Create Network Dialog</a>. 
<br /> 		
<p><b>Note:</b> The <b>Create Network</b> button only displays while the networks can be added or edited. 
Once you do the <a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a>, this button disappears and you cannot 
add or edit networks.</p>
</td>
</tr>
				
<tr style="background-color: white; color: black;">
<td><b>Edit Network</b> button</td>
<td>Click to open the <a href="/cloudos/manage/operational-dashboard/environment-tab/#edit-network-dialog">Edit Network Dialog</a>. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> Down arrow > <b>Edit Address Ranges</b> </nobr> </td>
<td>Click to open the <a href="/cloudos/manage/operational-dashboard/environment-tab/#edit-address-ranges-dialog">Edit Address Ranges Dialog</a>. </td>
</tr>

</table>

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>



### Edit Network Dialog

To access: Select the Environment tab > Networks > click **Edit Network** for the network you want to customize.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px;"> <b>Caution:</b> If you plan to customize the networks, 
you must do that before you complete the steps on the Complete Install panel. For details, see 
the <a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a> topic.
After that, the Edit Network dialogs are read-only. Once the install process is triggered, no changes can be made. If you want to make changes, 
you need to start over by re-installing the HP Cloud OS Administration node. 
For procedural instructions, see <a href="/cloudos/install/">Install and Configure Your Cloud</a>.
</p>

The following table describes the Edit Network dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th> UI Elements </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td colspan="2"><b>Network Tab</b></td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Type</b> </td>
<td> Default network type. </td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>Logical Interface</b> </td>
<td>Logical interface connection associated with the network type.</td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>Subnet</b> </td>
<td>
   <p>IP address associated with the network type.</p>
   <p>For the public network, specify explicitly for your public IP address range.</p>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>Netmask</b> </td>
<td>
CIDR notation value used to distinguish the network and host portions of an IP address.

<p>For the public network, specify explicitly for your public IP address range.</p>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Bridge Enabled</b> </td>
<td> Indicates whether a bridge interface should be added on top of the interface for the corresponding network: True or False.

<p>For the public network, set to <b>False</b>. The default is <b>False</b> for all provided networks.</p>

</td>
</tr>

<tr style="background-color: #f8f8f8;">
<td colspan="2"><b>VLAN Tab</b> </td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>VLAN ID</b> </td>
<td>Virtual Local Area Network ID number associated with the network type. Do not change the default for the admin, os_sdn or public networks.</td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>VLAN Enabled</b> </td>
<td> Indicates whether the associated network coexists on the same physical interface as other networks.
<br /> 
<p>(<i>Recommended</i>) Leave set to <b>False</b> (the default value) if the networks  (particularly os_sdn and public) exist on 
separate physical interfaces. This means that the Network Mode will be set to <b>dual</b> by default on the 
<a href="/cloudos/manage/operational-dashboard/environment-tab/#confirm-complete-install-dialog">Confirm Complete Install Dialog</a>. </p>

<p>Set to <b>True</b> if the networks (particularly os_sdn and public) co-exist on the same physical network. 
This means that the Network Mode will be set to <b>single</b> by default on the 
<a href="/cloudos/manage/operational-dashboard/environment-tab/#confirm-complete-install-dialog">Confirm Complete Install Dialog</a>. </p>

</td>
</tr>

<tr style="background-color: #f8f8f8;">
<td colspan="2"><b>Router Tab</b>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>Router</b> </td>
<td> Device's IP Address that passes network traffic between different IP networks.
<br /> 
<p>Note: For the admin network, it is recommended to provide a non-routable private network for the admin network.</p>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> <b>Router Preference</b> </nobr> </td>
<td>Any value used by a routing protocol to determine whether one particular route should be chosen over another.</td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>Update Network</b> button</td>
<td>Saves the edited settings for all three tabs. </td>
</tr>
				
</table>

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>



### Edit Address Ranges Dialog

To access: Select the Environment tab > Networks > click the down arrow and select Edit Address Ranges for the admin, os_sdn or public network type you want to view or edit the IP address ranges.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px;"> <b>Caution:</b> If you plan to customize the address ranges, 
you must do that before you complete the steps on the Complete Install panel. For details, see 
the <a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a> topic.
After that, the Edit Address Ranges dialogs are read-only. Once the install process is triggered, no changes can be made. If you want to make changes, 
you need to start over by re-installing the HP Cloud OS Administration node. 
For procedural instructions, see <a href="/cloudos/install/">Install and Configure Your Cloud</a>.
</p>

The following table describes the Edit Network dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th> UI Elements </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Network Type</b> </td>
<td> Network type being viewed or edited. </td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>Subnet</b> </td>
<td> Subnet for the network type. </td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>Add Address Range</b> </td>
<td> Click to add a blank address range. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> <b>Delete Address Range</b> </nobr> </td>
<td> Click to delete the selected address range. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> &lt;address range> </td>
<td> Default address range(s) of the network type (see each network type below for details). </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> <b>Update Address Ranges</b> button </nobr> </td>
<td> Click to save the edited settings, and to validate that the IP address ranges are correct.
<br />
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px;"> <b>Note:</b> If you enter invalid ranges, 
you will get a validation error when you click <b>Update Address Ranges</b>. The validation error identifies the incorrect address 
(start or end) for the corresponding network type. You must fix all errors in this Edit Address Ranges dialog for the install to be 
successful. Clicking <b>Cancel</b> will not trigger the validation step. Identify the incorrect address.</p>
</td>
</tr>
				
</table>

See each network's Edit Address Ranges dialog for the defaults, as described in these sections:

* [Admin Network Edit Address Ranges Dialog](#admin-network-edit-address-ranges-dialog)

* [OS_SDN Network Edit Address Ranges Dialog](#os-sdn-network-edit-address-ranges-dialog) 
    
* [Public Network Edit Address Ranges Dialog](#public-network-edit-address-ranges-dialog)

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


#### Admin Network Edit Address Ranges Dialog

**Note:** HP recommends that you keep the default values because this network type is considered to be an isolated, private network.

To access: Select the Environment tab > Networks > click the down arrow and select Edit Address Ranges for the admin network type.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px;"> <b>Caution:</b> If you plan to customize the address ranges, 
you must do that before you complete the steps on the Complete Install panel. For details, see 
the <a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a> topic.
After that, the Edit Address Ranges dialogs are read-only. Once the install process is triggered, no changes can be made. If you want to make changes, 
you need to start over by re-installing the HP Cloud OS Administration node. 
For procedural instructions, see <a href="/cloudos/install/">Install and Configure Your Cloud</a>.
</p>

The following table describes the admin network type address range default UI elements: 

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th> UI Elements </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Network Type</b> </td>
<td> admin </td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>Subnet</b> </td>
<td> Pre-populated with the correct setting: 192.168.124.0 </td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>Node Types</b> and address ranges </td>
<td> 
<b>admin:</b> IP range for the HP Cloud OS Administration node &mdash; 192.168.124.10 to 192.168.124.11 <br /> <br />

<b>dhcp:</b> Temporary IP address assignment for the PXE booted nodes &mdash; 192.168.124.21 to 192.168.124.80  <br /> <br />

<b>host:</b> Permanent admin network IP address assignment for the participating nodes &mdash; 192.168.124.81 to 192.168.124.160  <br /> <br />

<b>switch:</b> This is for test purposes only &mdash; 192.168.124.241 to 192.168.124.250 
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> <b>Update Address Ranges</b> </nobr> </td>
<td> Click to save the edited settings, and to validate that the IP address ranges are correct.
<br />
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px;"> <b>Note:</b> If you enter invalid ranges, 
you will get a validation error when you click <b>Update Address Ranges</b>. The validation error identifies the incorrect address 
(start or end) for the corresponding network type. You must fix all errors in this Edit Address Ranges dialog for the install to be 
successful. Clicking <b>Cancel</b> will not trigger the validation step. Identify the incorrect address.</p>
</td>
</tr>
				
</table>


#### OS_SDN Network Edit Address Ranges Dialog

To access: Select the Environment tab > Networks > click the down arrow and select Edit Address Ranges for the os_sdn network type.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px;"> <b>Caution:</b> If you plan to customize the address ranges, 
you must do that before you complete the steps on the Complete Install panel. For details, see 
the <a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a> topic.
After that, the Edit Address Ranges dialogs are read-only. Once the install process is triggered, no changes can be made. If you want to make changes, 
you need to start over by re-installing the HP Cloud OS Administration node. 
For procedural instructions, see <a href="/cloudos/install/">Install and Configure Your Cloud</a>.
</p>

The following table describes the os_sdn network type address range default UI elements: 

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th> UI Elements </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Network Type</b> </td>
<td> os_sdn </td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>Subnet</b> </td>
<td> Pre-populated with the correct setting: 192.168.130.0 </td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>Node Types</b> </td>
<td> 
host
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>IPV4 Start Addr / <br /> IPV4 End Addr</b> </td>
<td> Permanent os_sdn network IP address assignment for the participating nodes -- 192.168.130.81 to 192.168.130.160
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> <b>Update Address Ranges</b> button </nobr> </td>
<td> Click to save the edited settings, and to validate that the IP address ranges are correct.
<br />
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px;"> <b>Note:</b> If you enter invalid ranges, 
you will get a validation error when you click <b>Update Address Ranges</b>. The validation error identifies the incorrect address 
(start or end) for the corresponding network type. You must fix all errors in this Edit Address Ranges dialog for the install to be 
successful. Clicking <b>Cancel</b> will not trigger the validation step. Identify the incorrect address.</p>
</td>
</tr>
				
</table>

#### Public Network Edit Address Ranges Dialog

To access: Select the Environment tab > Networks > click the down arrow and select Edit Address Ranges for the public network type.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px;"> <b>Caution:</b> If you plan to customize the address ranges, 
you must do that before you complete the steps on the Complete Install panel. For details, see 
the <a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a> topic.
After that, the Edit Address Ranges dialogs are read-only. Once the install process is triggered, no changes can be made. If you want to make changes, 
you need to start over by re-installing the HP Cloud OS Administration node. 
For procedural instructions, see <a href="/cloudos/install/">Install and Configure Your Cloud</a>.
</p>

The following table describes the public  network type address range default UI elements: 

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th> UI Elements </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Network Type</b> </td>
<td> public </td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>Subnet</b> </td>
<td>  	Pre-populated with the subnet that was configured for the public network. </td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>Node Types</b> </td>
<td> 
host
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>IPV4 Start Addr / <br /> IPV4 End Addr</b> </td>
<td> Provide the IP address range corresponding to the public network's configuration. 
This IP range is used for the PXE booted managed nodes. Get the range from your IT administrator, or define the IP range if you are the IT administrator. 
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> <b>Update Address Ranges</b> button </nobr> </td>
<td> Click to save the edited settings, and to validate that the IP address ranges are correct.
<br />
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px;"> <b>Note:</b> If you enter invalid ranges, 
you will get a validation error when you click <b>Update Address Ranges</b>. The validation error identifies the incorrect address 
(start or end) for the corresponding network type. You must fix all errors in this Edit Address Ranges dialog for the install to be 
successful. Clicking <b>Cancel</b> will not trigger the validation step. Identify the incorrect address.</p>
</td>
</tr>
				
</table>

### Create Network Dialog

To access: Select the Environment tab > Networks > click <b>Create Network</b>.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px;"> <b>Caution:</b> The <b>Create Network</b> button only displays 
while the networks are editable. Once the install process is triggered by the 
<a href="/cloudos/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a>, this button disappears and no 
changes can be made. If you want to make changes, you need to start over by re-installing the HP Cloud OS Administration node. 
For procedural instructions, see <a href="/cloudos/install/">Install and Configure Your Cloud</a>.
</p>

The following table describes the Create Network dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th> UI Elements </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td colspan="2"><b>Network Tab</b></td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Type</b> </td>
<td> Enter the network type. </td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>Logical Interface</b> </td>
<td> Select one of these values associated with the network type:
<ul>
<li>bmc
<li>intf0
<li>intf1
<li>intf2
</ul>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>Subnet</b> </td>
<td>
   <p>IP address associated with the network type.</p>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>Netmask</b> </td>
<td> Enter the 32-bit number used to distinguish the network and host portions of an IP address. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Bridge Enabled</b> </td>
<td> Select True or False.
<ul>
<li> <b>False</b> (Recommended) &mdash; Do not add a bridge interface on top of the interface for the corresponding network.
<li> <b>True</b> &mdash; Add a bridge interface on top of the interface for the corresponding network.
</ul>
</td>
</tr>

<tr style="background-color: #f8f8f8;">
<td colspan="2"><b>VLAN Tab</b> </td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>VLAN ID</b> </td>
<td> Enter the Virtual Local Area Network ID number associated with the network type. </td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>VLAN Enabled</b> </td>
<td> Select True or False. 
<ul>
<li> <b>False</b> (Recommended) &mdash; Keep this default value if the networks  (particularly os_sdn and public) co-exist on 
<b>separate</b> physical interfaces; if so, VLAN Enabled must be set to False. This means that the Network Mode will be set to <b>dual</b> by default on the 
<a href="/cloudos/manage/operational-dashboard/environment-tab/#confirm-complete-install-dialog">Confirm Complete Install Dialog</a>. </li>
<li> <b>True</b> &mdash; Set to True if the networks (particularly os_sdn and public) co-exist on the same physical network; 
if so, VLAN Enabled must be set to True. This means that the Network Mode will be set to <b>single</b> by default on the 
<a href="/cloudos/manage/operational-dashboard/environment-tab/#confirm-complete-install-dialog">Confirm Complete Install Dialog</a>. </li>
</ul>
</td>
</tr>

<tr style="background-color: #f8f8f8;">
<td colspan="2"><b>Router Tab</b>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>Router</b> </td>
<td> Enter the device's IP Address that passes network traffic between different IP networks. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> <b>Router Preference</b> </nobr> </td>
<td> Enter a numerical router preference. For example, assume there is more than one network defined in the deployment (admin, public, and os_sdn). 
Each network requires a set of IP address configurations, including a router. When a node gets more than three networks and three routers defined, 
the packets going out of the node outside of these networks need to know which router IP address has to route the traffic. 
The Router Preference determines the router order. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Create Network</b> button </td>
<td> Click to save the settings. </td>
</tr>
				
</table>


<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Complete Install

The following information provides details about the Complete Install panel.

**Concepts:**

* [Complete Install Overview](#complete-install-overview)

**UI Descriptions:**

* [Complete Install Page](#complete-install-page)
 
* [Confirm Complete Install Dialog](#confirm-complete-install-dialog)

### Complete Install Overview

On the Complete Install panel, you complete the HP Cloud OS Administration node installation, which installs underlying components on the Administration node.

You specify the install settings on the Confirm Complete Install Dialog and then finish the install process on the Complete Install Page.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px;"> <b>Note:</b> The Complete Install step runs a validation check 
of the network IP address ranges. If there is an error, this step cannot be completed until the error is fixed. 
The validation check shows the network type and possibly the address value. You must open the Edit Address Ranges dialog for the specified 
network and click Update Address Ranges to identify the incorrect address, and fix it. 
See <a href="/cloudos/manage/operational-dashboard/environment-tab/#edit-address-ranges-dialog">Edit Address Ranges Dialog</a>.
</p>

When the install is complete, the Operational Dashboard displays the Cloud tab (see <a href="/cloudos/manage/operational-dashboard/cloud-tab/">) after the user clicks the Continue... button.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px;"> <b>Caution:</b> Be sure the values for the 
Prerequisites, Server Types, Connections and Networks are what you need, before you start the install process. Once the install process is triggered, 
no changes can be made. If you want to make changes, you need to start over by re-installing the HP Cloud OS Administration node. 
For procedural instructions, see <a href="/cloudos/install/">Install and Configure Your Cloud</a>.

### Complete Install Page

Coming soon ... not formatted yet.




### Confirm Complete Install Dialog

Coming soon ... not formatted yet.



<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

