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
Any prerequisites you want to configure, must be done before you complete the steps on the Complete Install page. 
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
<td> <nobr> Opens the Edit Prerequisite dialog for the corresponding Prerequisite. </nobr> </td>
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

To access: Select the Environment tab > Prerequisites> click Edit Prerequisite for the Cloud Administration Node Time Settings Prerequisite.

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

To access: Select the Environment tab > Prerequisites> click Edit Prerequisite for the Email Notification Settings Prerequisite.

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
you must do that before you complete the steps on the Complete Install page. For details, see 
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
<td> Drop-down arrow > Delete Server Definition </td>
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
you must do that before you complete the steps on the Complete Install page. For details, see 
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
<td>Update Server Definition </td>
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
<td>Create Server Definition </td>
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
If you plan to customize the connections, you must do that before you complete the steps on the Complete Install page.  
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

