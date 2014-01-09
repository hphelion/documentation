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
 * [Prerequisites Overview](#Prerequisites Overview)
* **UI Description:**
 * [Prerequisites Page](#Prerequisites Page)
 * [Cloud Administration Node Internet Access Prerequisite Dialog](#Cloud Administration Node Internet Access Prerequisite Dialog)
 * [External DNS Server Prerequisite Dialog](#External DNS Server Prerequisite Dialog)
 * [Cloud Administration Node Time Settings Prerequisite Dialog](#Cloud Administration Node Time Settings Prerequisite Dialog)
 * [Email Notification Settings Prerequisite Dialog](#Email Notification Settings Prerequisite Dialog)

### Prerequisites Overview

The first step on the Operational Dashboard is to configure the HP Cloud OS Administration node prerequisites.

> **Caution:** Any prerequisites you want to configure, must be done before you complete the steps on the Complete Install page. 
For details, see the [Complete Install Overview](/cloudos/manage/operational-dashboard/environment-tab/#complete-install-overview). 
After that, the Edit Prerequisite dialogs will be read-only. Once the install process is triggered, no changes can be made. If you want to make changes, you need to start over by re-installing the HP Cloud OS Administration node. For procedural instructions, see [Install and Configure Your Cloud](/cloudos/install).
* **Cloud Administration Node Internet Access** &mdash; Configure to set up Internet access on the HP Cloud OS Administration node. You will need Internet access for downloading hot fixes and updates using the [Hot Fixes](/cloudos/manage/operational-dashboard/cloud-tab/#hot-fixes) panel, 
or the [Updates and Extensions](/cloudos/manage/operational-dashboard/cloud-tab/#updates-and-extensions) panel.
* **(Optional) External DNS Server** &mdash; Configure to add the IP address of the external DNS server your Cloud OS environment is using to access named websites within your cloud.
* **Cloud Administration Node Time Settings** &mdash; Configure to reflect the current time to ensure that the Cloud is created successfully.
* **(Optional) Email Notification Settings** &mdash; Configure to send email notifications when the Cloud and Compute Region operations complete because this takes some time. By enabling and setting this prerequisite, you can be alerted by e-mail when each operation completes.

	
### Prerequisites Page

To access: Select the Environment tab > Prerequisites.

The following table describes the Prerequisites page UI elements:

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI Elements</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td> Prerequisite Description column </td>
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


### Cloud Administration Node Internet Access Prerequisite Dialog

To access: Select the Environment tab > Prerequisites> click Edit Prerequisite for the Cloud Administration Node Internet Access Prerequisite.

**Caution:** If you want to set the Administration Node Internet Access Prerequisite, you must configure it before you complete the steps on the 
Complete Install panel- see [Complete Install](#). After that, the Administration Node Internet Access Prerequisite dialog 
will be read-only. Once the install process is triggered, no changes can be made. If you want to make changes, 
you need to start over by re-installing the HP Cloud OS Administration node. 
For procedural instructions, see [Install and Configure Your Cloud](/cloudos/install).

The following table describes the Cloud Administration Node Internet Access Prerequisite dialog UI elements:

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI Elements</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td> Network Interface </td>
<td> Select the network interface on the HP Cloud OS Administration node that has been configured for Internet access. 
<p><b>Note:</b> Interface eth0 is not used for Internet access. </p>
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
<p>Caution: Specifying incorrect proxy host settings might cause some features to not work correctly in the Administration Dashboard.</p>
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
<td> Specify addresses that should not use proxy servers (for Controller/Compute Nodes' admin and os_sdn networks, IP range). Each network needs to be separated by a bar "|". For example: <code>10.*|192.*|localhost</code>. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Username (Optional) </td>
<td> Specify the username if necessary for the proxy setting.
</tr>

<tr style="background-color: white; color: black;">
<td> Password (Optional) </td>
<td> Specify the password if necessary for the proxy setting.
</tr>

<tr style="background-color: white; color: black;">
<td> Update Prerequisite </td>
<td> Click to save these settings, then click Complete Prerequisite to complete this setup.
</tr>

</table>

> **Note:** If this prerequisite fails to complete successfully, an error message displays on the Prerequisites page. 
For a potential solution, see [Problem: Admin Node Internet Access Prerequisites fail to complete](/cloudos/manage/troubleshooting/#problem-admin-node-internet-access-prerequisites-fail-to-complete) 
in the Troubleshooting topic. 

### External DNS Server Prerequisite Dialog

Coming soon ... not formatted yet.

Caution: If you want to set the External DNS Server Prerequisite, you must configure it before you complete the steps on the Complete Install panel- see Complete Install. After that, the External DNS Server Prerequisite dialog will be read-only. Once the install process is triggered, no changes can be made. If you want to make changes, you need to start over by re-installing the HP Cloud OS Administration node. See the Install section of the HP Cloud OS Documentation web site for instructions.

To access: Select the Environment tab > Prerequisites> click Edit Prerequisite for the External DNS Server Prerequisite.

The following table describes the External DNS Server Prerequisite dialog UI elements:

UI Elements	Description
External DNS Server IP Address	
Type the IP address of the external DNS server used by your Cloud OS environment to be able to access named websites within your cloud.

Update Prerequisite	Click to save the IP address.

### Cloud Administration Node Time Settings Prerequisite Dialog

Coming soon ... not formatted yet.

Caution: If you want to set the Administration Node Time Settings Prerequisite, you must configure it before you complete the steps on the Complete Install panel- see Complete Install. After that, the Administration Node Time Settings Prerequisite dialog will be read-only. Once the install process is triggered, no changes can be made. If you want to make changes, you need to start over by re-installing the HP Cloud OS Administration node. See the Install section of the HP Cloud OS Documentation web site for instructions.

To access: Select the Environment tab > Prerequisites> click Edit Prerequisite for the Cloud Administration Node Time Settings Prerequisite.

The following table describes the Cloud Administration Node Time Settings Prerequisite dialog UI elements:

UI Elements	Description
Timezone	Set the appropriate time zone for your area (UTC is the default).
Date	Set the date applicable for your environment if different from the default.
Time	Set the time applicable for your environment if different from the default.
Update Prerequisite	Click to save these settings, then click Complete Prerequisite to complete this setup.

### Email Notification Settings Prerequisite Dialog

Coming soon ... not formatted yet.

Caution: If you want to set the Email Notification Settings Prerequisite, you must configure it before you complete the steps on the Complete Install panel- see Complete Install. After that, the Email Notification Settings Prerequisite dialog will be read-only. Once the install process is triggered, no changes can be made. If you want to make changes, you need to start over by re-installing the HP Cloud OS Administration node. See the Install section of the HP Cloud OS Documentation web site for instructions.

To access: Select the Environment tab > Prerequisites> click Edit Prerequisite for the Email Notification Settings Prerequisite.

The following table describes the Email Notification Settings Prerequisite dialog UI elements:

UI Elements	Description
Email Notifications	Check to enable this setting (unchecked by default)
SMTP Server	Set to an SMTP server that is valid for your network.
From Address	Set to an applicable email address for your environment. Most likely, you would add your email address as the person responsible for managing the cloud infrastructure.
To Address (comma-separated list)	Set to an applicable email address or comma-separated addresses for your environment. This address could be to the person who started the cloud build, or anyone who is interested in following the cloud build process.
Update Prerequisite	Click to save these settings.

## Server Types

Coming soon ... not formatted yet.

The following information provides details about the Server Types panel:

Concepts

Server Types Overview

UI Description

Server Types Page
Edit Server Definition Dialog
Create Server Definition Dialog

### Server Types Overview

Coming soon ... not formatted yet.

Caution: If you plan to customize the servers, you must do that before you complete the steps on the Complete Install page - see Complete Install Overview for details. After that, the server type dialogs are read-only. Once the install process is triggered, no changes can be made. If you want to make changes, you need to start over by re-installing the HP Cloud OS Administration node. See the Install section of the HP Cloud OS Documentation web site for instructions.

The Server Types panel allows you to capture new or use existing server definitions about the networking ports for various servers in your bare-metal cloud environment. If all servers in your cloud are the same server type (homogeneous nodes), you are not required to configure anything in this view. HP recommends that you keep and accept the default settings.

However, if the servers in your cloud are different types of servers, you may be required to use a Linux utility such as dmidecode to get the pattern and CLI commands to determine the bus addresses of your server's network ports.

Here is one way to get the values for Server Name Pattern and Bus Order:

Server Name Pattern:

dmidecode | grep "Product Name"

Bus Order (for UbuntuOS):

ls -l /sys/class/net | egrep pci | sed -e 's/^.*pci//' -e 's%/net.*$%%'

This is necessary to define the correct order of those ports for the various server types so that all the servers have the same enumeration of network ports (0, 1, 2, 3 and so on) across the cloud. If you do not configure the server types for a cloud with heterogeneous nodes in this way, you will experience networking failures because the servers will not have the same network port enumeration order.

Tip: Based on your network and hardware infrastructure, you can accept defaults or customize Server Types.

### Server Types Page

Coming soon ... not formatted yet.

To access: Select the Environment tab > Server Types.

The following table describes the Server Types page UI elements:

UI Elements	Description
Server Name Pattern column	List of the Cloud OS supported server types.
Bus Order column	List of the bus orders related to the corresponding server types.
Edit Server Definition button	
Click to open the Edit Server Definition dialog to customize the server type.

Create Server Definition button	
Click to add a new server type on the Create Server Definition dialog.

Note: The Create Server Definition button only displays while the servers can be added or edited. Once you do the Complete Install (see Complete Install), this button disappears and you cannot add new servers or edit or delete existing servers.

Drop-down arrow > Delete Server Definition	
Select to delete the server type from the HP Cloud OS Administration node. You are prompted to confirm the deletion.

Note: The Delete Server Definition menu item only displays while the servers can be added or edited. Once you do the Complete Install (see Complete Install), this button disappears and you cannot add new servers or edit or delete existing servers.


### Edit Server Definition Dialog

To access: Select the Environment tab > Server Types > click Edit Server Definition for the server you want to customize.

Caution: If you plan to customize the servers, you must do that before you complete the steps on the Complete Install panel- see Complete Install. After that, the Edit Server Definition dialogs are read-only. Once the install process is triggered, no changes can be made. If you want to make changes, you need to start over by re-installing the HP Cloud OS Administration node. See the Install section of the HP Cloud OS Documentation web site for instructions.

The following table describes the Edit Server Definition dialog UI elements:

UI Elements	Description
Server Name Pattern	Name of the server type you are editing.
Bus Order	One or more bus addresses of your server’s network ports.
Add Bus Order	Click to add a blank bus order text box in which you type the new bus order related to the server type.
Delete Bus Order	Click to delete the selected bus order(s) that are not relevant to the server type.
Update Server Definition	
Click to save the updated server definition.

Note: The Update Server Definition button only displays while the servers are editable. Once you do the Complete Install (see Complete Install Overview), this dialog become read- only and this button disappears.

### Create Server Definition Dialog

To access: Select the Environment tab > Server Types > click Create Server Definition.

Caution: The Create Server Definition button only displays while the servers are editable. Once the install process is triggered by the Complete Install (see Complete Install), this button disappears and no changes can be made. If you want to make changes, you need to start over by re-installing the HP Cloud OS Administration node. See the Install section of the HP Cloud OS Documentation web site for instructions.

The following table describes the Create Server Definition dialog UI elements:

UI Elements	Description
Server Name Pattern	Name of the server type you are creating.
Bus Order	One or more bus addresses of your server’s network ports.
Add Bus Order	
Click to add a blank bus order text box for each bus order related to the server type. Type the new bus order(s) in the bus order text boxes.

Delete Bus Order	Click to delete the selected bus order(s) that are not relevant to the server type.
Create Server Definition	
Click to create the new server definition.

Note: The Create Server Definition button only displays while the servers are editable. Once you do the Complete Install (see Complete Install Overview), this dialog become read- only and this button disappears.

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

Caution: If you plan to customize the connections, you must do that before you complete the steps on the Complete Install page - see Complete Install for details. After that, the Connections dialogs are read-only. Once the install process is triggered, no changes can be made. If you want to make changes, you need to start over by re-installing the HP Cloud OS Administration node. See the Install section of the HP Cloud OS Documentation web site for instructions.

Based on your network infrastructure, you must customize the Connections settings in the Connections panel. After the enumeration of ports is consistent across all servers in the cloud, the Connections panel defines those ports into a set of logical connections (interfaces) that will be used to eventually define the networks.

The connections are defined based on the Network Modes along with a list of logical interfaces and the corresponding physical interfaces' ports and bandwidth. For each logical connection (intf0, intf1, intf2) the network type is identified (admin, os_sdn, public). The os_sdn value stands for OpenStack Software-Defined-Network.

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

In this Dual mode example, "1Gb (preferred) on 2nd port" means a one gigabit network for port 2, as enumerated by default from the server's BIOS or as overridden in the Server Types panel. The "preferred" tag suggests that if the NIC/port does not support 1Gb, Cloud OS falls back to the next maximum speed supported by the NIC or port. However, if there is no preferred tag, it means the port has to support 1Gb; otherwise the deployment might not succeed.

Following are some of the criteria to be considered when making changes to the default settings:

In Dual mode, the default settings assume that all the nodes have their interfaces wired as:

* eth0 - admin network
* eth1 - os_sdn network
* eth2 - public/external network

IMPORTANT: In such a scenario, keep the default values intact.

In Dual mode, if the wiring of networks between the nodes are non-contiguous and/or not in sequence, you need to change the default mapping:

Example 1: For all the nodes, eth0 - admin; eth1 - public, eth2 - private; the Connections table must be customized to look like the following:

intf0 - 1Gb (preferred) on 1st port

intf1 - 1Gb (preferred) on 3rd port

intf2 - 1Gb (preferred) on 2nd port

Example 2: For all the nodes, eth0 - admin, eth2 - os_sdn, eth4 - public/external the Connections table must be customized to look like the following:

intf0 - 1Gb (preferred) on 1st port

intf1 - 1Gb (preferred) on 3rd port

intf2 - 1Gb (preferred) on 5th port

In Single mode, keep the defaults. It is assumed that eth0 port is configured on the switch to support tagged VLANs (discussed in the next section). 

Note: Interface mapping must be identical on all the nodes.

In Team mode, configure virtual connections to use both trunks. For example:

Map eth0, eth2, and eth4 to trunk 1.

Map eth1, eth3, and eth5 to trunk 2.

Note that in this example, the eth0 and eth1 interfaces belongs to same VLAN; the same is true for the eth2 and eth3 pair, and the eth4 and eth5 pair. When the HP Cloud OS Administration node allocates the bare-metal server, Cloud OS should create a teaming NIC using the NIC pairs.

Here's a partial example of how the Team mode configuration could look on this Connections dialog:

Logical Interface	Physical Interface	Interface Mode
intf0 (admin, bmc_vlan)	1Gb on 1st port, 1Gb on 2nd port	6
intf1 (os_sdn)	1Gb on 1st port, 1Gb on 2nd port	6
intf2 (public)	1Gb on 1st port, 1Gb on 2nd port	6

### Connections Page

To access: Select the Environment tab > Connections.

The following table describes the Connections page UI elements:

UI Elements	Description
Network Mode column	
Lists the available network modes for the connection set:

Single Mode: All connections are shared on the same physical interface through VLAN.
Dual Mode: All connections have their own interfaces where VLAN and bridge are off.
Team Mode: All connections are shared on the same two physical interfaces through VLAN. Teaming means treating the wires like a single bundle.
Role column	Lists the roles for the connection set.
Logical Interface column	
Lists the network modes' logical interfaces for the connection set. For each logical connection (intf0, intf1, intf2) the network type is identified (admin, os_sdn, public):

intf0 (admin, bmc_vlan)
intf1 (os_sdn)
intf2 (public)
Physical Interface column	
Lists the network modes' physical interface values for the corresponding connection set. For details, see Edit Connection Dialog.

Interface Mode column	
Lists the interface mode for the network mode. The interface mode is the default teaming algorithm to use for the bonding driver in Linux. It is applicable only for team mode.

Edit Connection button	Click to open the Edit Connection dialog.
Create Connection button	
Click to add a new connection on the Create Connection dialog.

Note: The Create Connection button only displays while the connections can be added or edited. Once you do the Complete Install (see Complete Install), this button disappears and you cannot add new or edit connections.

Drop-down arrow > Delete Connection
	
Select to delete the connection. You are prompted to confirm the deletion.

Note: This option is unavailable after the Complete Install (see [Complete Install](#).

### Edit Connection Dialog

To access: Select the Environment tab > Connections > click Edit Connection for the connection you want to customize.

Caution: If you plan to customize the connections, you must do that before you complete the steps on the Complete Install panel- see Complete Install. After that, the Edit Connection dialogs are read-only. Once the install process is triggered, no changes can be made. If you want to make changes, you need to start over by re-installing the HP Cloud OS Administration node. See the Install section of the HP Cloud OS Documentation web site for instructions.

The following table describes the Edit Connection dialog UI elements:

UI Elements	Description
Connection Type	Connection type name (network mode) of the connection set you want to customize.
Role	
Indicates the networking configuration needed for a specific managed node or nodes. By default, it is set to blank, which means for any role a managed node takes, the networking configuration must be the same across all managed nodes.

Note: Do not change from the default value (blank) for this release.

Add Details	Click to add a new blank row on which you add the logical interface and physical interface. Interface mode is applicable for Team mode only.
Delete Details	Click to delete the selected row(s).
Logical Interface	Default logical interface for the corresponding connection set.
For each logical connection (intf0, intf1, intf2) the network type is identified (admin, os_sdn, public):

intf0 (admin, bmc_vlan)
intf1 (os_sdn)
intf2 (public)
Physical Interface	
Default physical interface values for the corresponding connection set. The value contains (up to) four characters, and follows these conventions:

1st character: the allowable value is a question mark (?) or blank. The question mark indicates a preferred connection, meaning the available bandwidth supported by the Network Interface card (NIC). If not specified (blank), Cloud OS configures the physical interface to the value specified by the next character.
2nd character: the allowable value may be 1, 10, or 100. It is a numerical value to indicate the network bandwidth.
3rd character: the value may be g, m, or k. It is the bandwidth unit. g represents gigabits; m represents megabits; k represents kilobits.
4th character: the value may be a number between 1 and 16. It is a numerical value to specify the port or NIC number.
Interface Mode	
The default teaming algorithm to use for the bonding driver in Linux. The default value is 6 which indicates teaming uses the “adaptive load balancing” algorithm. The other values used with teaming are not supported in this release. This parameter is applicable only if you are using a Team mode.

Update Connection	
Click to save the connection settings.

Note: The Update Connection button only displays while the connections are editable. Once you do the Complete Install (see Complete Install), this dialog become read- only and this button disappears


### Create Connection Dialog

To access: Select the Environment tab >Connections > click Create Connection.

Caution: The Create Connection button only displays while the connections are editable. Once the install process is triggered by the Complete Install (see Complete Install), this button disappears and no changes can be made. If you want to make changes, you need to start over by re-installing the HP Cloud OS Administration node. See the Install section of the HP Cloud OS Documentation web site for instructions.

The following table describes the Create Connection dialog UI elements:

UI Elements	Description
Connection Type	Type the network mode for the connection set.
Role	
Indicates the networking configuration needed for a specific managed node or nodes. By default, it is set to blank, which means for any role a managed node takes, the networking configuration must be the same across all managed nodes.

Note: Do not change from the default value (blank) for this release.

Add Details	Click to add a new blank row on which you add the logical interface, physical interface. Interface mode is applicable for Team mode only.
Delete Details	Click to delete the selected row(s).
Logical Interface	Type the logical interface appropriate for the network mode.
For each logical connection (intf0, intf1, intf2) the network type is identified (admin, os_sdn, public). For details, see Edit Connection dialog.

Physical Interface	
Type the physical interface values for the corresponding network mode. The value contains (up to) four characters, and follows specific conventions. For details see Edit Connection dialog.

Interface Mode	 The default teaming algorithm to use for the bonding driver in Linux. The default value is 6 which indicates teaming uses the “adaptive load balancing” algorithm. The other values used with teaming are not supported in this release. Ignore unless you are using a Team mode.
Create Connection	
Click to create the connection.

Note: The Create Connection button only displays while the connections are editable. Once you do the Complete Install (see Complete Install), this dialog become read- only and this button disappears.


<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## Networks

Coming soon ... not formatted yet.

The following information provides details about the Networks panel:

* Concepts

* Networks Panel Overview

* UI Description
 * Networks Page
 * Edit Network Dialog
 * Edit Address Ranges Dialog
 * Create Network Dialog
 
### Networks Panel Overview

On the Networks panel, you define the networks that are used in your IT environment. For each logical connection (intf0, intf1, intf2) a network is defined (admin, os_sdn, and public). These definitions are used for various purposes in the cloud such as networking between the nodes and the Cloud OS Administration node (using the admin network), the public or corporate network (such as public network) attached to your cloud, or networking between the Virtual Machine instances and the traffic from the instances to the Cloud Controller Node (using the os_sdn network).

Important: Customizing the public network settings is critical and any missing or incorrect values will lead to re-installing the HP Cloud OS Administration node. See the Install section of the HP Cloud OS Documentation web site for instructions.
Following are some of the criteria to be considered while making changes to the default settings:

The default settings "Dual" assume you have a separate physical network for each interface; the admin, os_sdn, and public network across the Cloud OS Administration node and all managed nodes.
For a production type of deployment and to reduce the complexities of configuring the switches, it is strongly recommended that you provide separate wired networks for public, os_sdn and admin. This requires you to specify your own range of IP addresses and other settings.

Some networks and address ranges for those networks are provided by default. You can modify or delete the IP address ranges as well as add new ones. You must use valid ranges that fall within the subnet as defined by the subnet address and mask specified in the network details.
If you edit the network IP address ranges and enter invalid ranges, you will get a validation error when you click Update Address Ranges in the Edit Address Ranges dialog. The validation error shows the invalid address (start or end) and the corresponding network type. You must fix all errors in the Edit Address Ranges dialog and click Update Address Ranges to validate the addresses are correct. Clicking Cancel will not trigger the validation step.

Caution: The address ranges validation only occurs when you open the Edit Address Ranges dialog for each network and click Update Address Ranges. Otherwise,you will not know if you have any errors. However, the Complete Install step will run a validation check and cannot be completed until the errors are fixed. If there is an address range error, the validation check will show the network type and possibly the address value. If not, open the Edit Address Ranges dialog for the specified network and click Update Address Ranges to identify the incorrect address. See Complete Install Overview for details.

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Complete Install

Coming soon ... not formatted yet.

The following information provides details about the Complete Install panel.

* Concepts

 * Complete Install Overview

* UI Description

 * Complete Install Page
 * Confirm Complete Install Dialog

### Complete Install Overview

On the Complete Install panel, you complete the HP Cloud OS Administration node installation, which installs underlying components on the Administration node.

You specify the install settings on theConfirm Complete Install Dialog and then finish the install process on the Complete Install Page.

Note: The Complete Install step runs a validation check of the network IP address ranges. If there is an error, this step cannot be completed until the error is fixed. The validation check shows the network type and possibly the address value. You must open the Edit Address Ranges dialog for the specified network and click Update Address Ranges to identify the incorrect address, and fix it. See Edit Address Ranges Dialog.

When the install is complete, the Operational Dashboard displays the Cloud tab (see Cloud Tab) After the user clicks the Continue... button.

Caution: Be sure the values for the Prerequisites, Server Types, Connections and Networks are what you need, before you start the install process.Once the install process is triggered, no changes can be made. If you want to make changes, you need to start over by re-installing the HP Cloud OS Administration node. See the Install section of the HP Cloud OS Documentation web site for instructions.

### Complete Install Page

To access: Select the Environment tab > Complete Install.

The following table describes the Complete Install page UI elements:
UI Elements 	Description
Complete Install button 	

Click to open the Confirm Complete Install Dialog where you specify configuration information to complete the HP Cloud OS Administration node installation. After the HP Cloud OS Administration node is installed, this button is replaced by the Continue... button.

Note: The Complete Install step runs a validation check of the network IP address ranges. If there is an error, this step cannot be completed until the error is fixed. The validation check shows the network type and possibly the address value. You must open the Edit Address Ranges dialog for the specified network and click Update Address Ranges to identify the incorrect address, and fix it. See Edit Address Ranges Dialog.
Install Launched column 	The timestamp that the HP Cloud OS Administration node install is started.
Install Complete column 	The timestamp that the HP Cloud OS Administration node install is completed.
Network Mode column 	The mode specified in the Confirm Complete Install dialog.
IPMI/BMC Network Status column 	The IPMI/BMC Network status specified in the Confirm Complete Install dialog.
IPMI Username column 	IPMI username if one was specified in the Confirm Complete Install dialog.
IPMI Password column 	IPMI password if one was specified in the Confirm Complete Install dialog.
Show Install Log button 	Click to view the install activity in the /var/log/install.log, which appears on the bottom of the window. This button then becomes a Refresh button.
Refresh button 	Replaces the Show Install Log button to monitor the install progress.
Continue... button 	Replaces the Complete Install button after the HP Cloud OS Administration node install is complete. Click to add the Cloud tab. The HP Cloud OS Administration node is now ready to be configured to set up a cloud. See Cloud Tab for descriptions of the panels that set up a cloud.

### Confirm Complete Install Dialog

To access: Select the Environment tab > Complete Install and click Complete Install .

The following table describes the Confirm Complete Install UI elements:
UI Elements 	Description
Domain Name 	Enter the top-level domain name for your infrastructure. The name must be lowercase characters with no numbers or special characters. It must end in .com, .org, .net, .edu, .mil, .gov, or .local.
Network Mode 	

Select single or team if the admin, os_sdn, and public networks co-exist on the same physical interface.

Note: If the admin, os_sdn, and public networks are on separate physical interfaces, the only choice given is dual.
IPMI/BMC Network Status 	

Select Disabled.

Tip: The enable IPMI/BMC feature is for test purposes only.
IPMI Username 	

Ignore unless the IPMI/BMC Network Status is enabled.
IPMI Password 	Ignore unless the IPMI/BMC Network Status is enabled.
Complete Install 	

Click to install the required software on the HP Cloud OS Administration node. This may take several minutes.

Note: The Complete Install step runs a validation check of the network IP address ranges. If there is an error, this step cannot be completed until the error is fixed. The validation check shows the network type and possibly the address value. You must open the Edit Address Ranges dialog for the specified network and click Update Address Ranges to identify the incorrect address, and fix it. See Edit Address Ranges Dialog.

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

