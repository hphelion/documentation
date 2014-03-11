---
layout: default
title: "Operational Dashboard: Environment Tab"
permalink: /cloudos/moonshot/manage/operational-dashboard/environment-tab/
product: moonshot

---



<script> 

function PageRefresh { 
onLoad="window.refresh"
}

PageRefresh();

</script>



<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/operational-dashboard/how-opdash-works/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage/operational-dashboard/">&#9650; UP</a> | <a href="/cloudos/moonshot/manage/operational-dashboard/cloud-tab/">NEXT &#9654;</a> </p>

# Operational Dashboard: Environment tab

The Environment tab contains the following panels on which you begin the installation process on the Operational Dashboard. 
On these panels, you set up your cloud environment and complete the HP Cloud OS for Moonshot Administration node installation. 
For the installation process, you must complete each panel in the order they are displayed. 

* [Connections](#connections)
* [Prerequisites](#prerequisites)
* [Networks](#networks)
* [Complete install](#complete-install)

For procedural instructions, see [Install and configure your cloud](/cloudos/moonshot/install/).

## Connections {#connections}

The Connections view is where you define a connection set. You define a network mode (single,dual,team) along with a list of logical connection interfaces (intf0,intf1,intf2) with each one being bound to a port, defined by bandwidth and port number. The default network settings for the participating hosts/nodes should be

* eth0 connected to a private network
* eth1 connected to a public network
* eth2 connected to a second private network

**Note:** You are not required to make any changes in this option.

## Prerequisites {#prerequisites}

The following information provides details about the Prerequisites panel:

**Concepts:**

[Prerequisites overview](#prerequisites-overview)

**UI description:**

* [Prerequisites page](#prerequisites-page)

* [Cloud Administration Node Internet Access Prerequisite dialog](#cloud-administration-node-internet-access-prerequisite-dialog)

* [Cloud Administration Node Time Settings Prerequisite dialog](#cloud-administration-node-time-settings-prerequisite-dialog)

* [External DNS Server Prerequisite dialog](#external-dns-server-prerequisite-dialog)

* [Email Notification Settings dialog](#email-notification-settings-prerequisite-dialog)

### Prerequisites overview

The first step on the Operational Dashboard is to configure the HP Cloud OS for Moonshot Administration node prerequisites.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:700px;"> <b>Caution:</b> 
You must complete configuration of the Cloud Administration Node Internet Access and External DNS Server prerequisites before you complete the steps on the Complete Install panel. 
For details, see <a href="/cloudos/moonshot/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a>. 
After that, the Edit Prerequisite dialogs for those settings are read-only. Once the install process is triggered, no changes can be made. 
If you want to make changes to the Cloud Administration Node Internet Access and External DNS Server prerequisites, you will need to start over by re-installing the HP Cloud OS for Moonshot Administration node. 
For procedural instructions, see <a href="/cloudos/moonshot/install/">Install and Configure Your Cloud</a>.
</p>

If you do not define the following prerequisites, your cloud will not work at all or will not work properly:

* **Cloud Administration Node Internet Access** &mdash; Configure to set up Internet access on the HP Cloud OS for Moonshot Administration node. You will need Internet access for downloading hot fixes and updates using the [Updates and Extensions](/cloudos/moonshot/manage/operational-dashboard/cloud-tab/#updates-and-extensions) panel.

* **Cloud Administration Node Time Settings** &mdash; Configure to reflect the current time to ensure that the Cloud is created successfully.

* **External DNS Server** &mdash; Configure to add the IP address of the external DNS server your Cloud OS environment is using to access named websites within your cloud.

**Optionally**, you can use the **Email Notification Settings** to configure sending email notifications when the Cloud and Compute Region operations complete because this takes some time. By enabling and setting this prerequisite, you can be alerted by e-mail when each operation completes.



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

	
### Prerequisites page

**To access**: Select the **Environment** tab > **Prerequisites**.

The following table describes the Prerequisites page UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI element</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> <b>Prerequisite Description</b> column </nobr> </td>
<td> HP Cloud OS for Moonshot Administration node prerequisite settings:
<ul>
<li>Cloud Administration Node Internet Access</li>
<li>Cloud Administration Node Time Settings</li><li>External DNS Server</li>

<li>Email Notification Settings </li>
</ul>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Last Updated</b> column </td>
<td> Timestamp when the prerequisite was completed. </td>
</tr> 	

<tr style="background-color: white; color: black;">
<td> <b>Edit Prerequisite</b> button </td>
<td> Opens the Edit Prerequisite dialog for the corresponding Prerequisite. </td>
</tr> 	

<tr style="background-color: white; color: black;">
<td> <b>Complete Prerequisite</b> button </td>
<td> Completes the setup. </td>
</tr> 	
 	
</table>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>



### Cloud Administration Node Internet Access Prerequisite dialog

**To access**: Select the **Environment** tab > **Prerequisites**> click **Edit Prerequisite** for the Cloud Administration Node Internet Access Prerequisite.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:700px;"> <b>Caution:</b> 
If you want to set the Administration Node Internet Access Prerequisite, you must configure it before you complete the steps on the 
Complete Install panel. For details, see the <a href="/cloudos/moonshot/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a> topic.
After that, the Administration Node Internet Access Prerequisite dialogs are read-only. Once the install process is triggered, 
no changes can be made. If you want to make changes, you need to start over by re-installing the HP Cloud OS for Moonshot Administration node. 
For procedural instructions, see <a href="/cloudos/moonshot/install/">Install and Configure Your Cloud</a>.
</p>

The following table describes the Cloud Administration Node Internet Access Prerequisite dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI element</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Network Interface</b> </td>
<td> Select the network interface on the HP Cloud OS for Moonshot Administration node that has been configured for Internet access. <b>Note:</b> Interface <code>eth0</code> is not used for Internet access.
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Network Configuration</b></td>
<td>Set the network configuration for your environment. </td>
</tr>



<tr style="background-color: white; color: black;">
<td> <b>IP Address</b> </td>
<td> Leave blank unless you have a static IP address, which you enter here. </td>
</tr> 	
 	
<tr style="background-color: white; color: black;">
<td> <b>Network Mask</b> </td>
<td> Leave blank unless you have a static IP address. Type the network mask. </td>
</tr> 	

<tr style="background-color: white; color: black;">
<td> <b>Gateway</b> </td>
<td> Leave blank unless you have a static IP address. Type the gateway. </td>
</tr> 

<tr style="background-color: white; color: black;">
<td> <b>DNS Address</b> </td>
<td> Leave blank unless you have a static IP address. Type the DNS address. </td>
</tr>

<tr style="background-color: white; color: black;">
<td colspan="2"> <b>HTTP Proxy Information</b>
Set proxy information applicable for your environment. If you are on a network that has a proxy, you must fill in this proxy information.
<br />
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"> <b>Caution:</b>  
Specifying incorrect proxy host settings might cause some features to not work correctly in the Administration Dashboard.</p> </td>

</tr>

<tr style="background-color: white; color: black;">
<td> <b>Host</b> </td>
<td> Enter the host IP address. Get this from your system administrator or from the settings in your web browser. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Port</b> </td>
<td> Enter the Port details. Get this from your system administrator or from the settings in your web browser. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Non-Proxy Hosts</b> </td>
<td> Specify addresses that <b>should not</b> use proxy servers (for Controller/Baremetal Host and admin networks, IP range). 
Each network must be separated by a bar ( | ), such as: <code>10.*|192.*|127.0*|localhost</code>

<tr style="background-color: white; color: black;">
<td> <nobr> <b>Username</b> (Optional) </nobr> </td>
<td> Specify the username if necessary for the proxy setting. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> <b>Password</b> (Optional) </nobr> </td>
<td> Specify the password if necessary for the proxy setting. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> <b>Update Prerequisite</b> </nobr> </td>
<td> Click to save these settings and complete this setup. </td>
</tr>

</table>

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:700px;"> <b>Note:</b> If this prerequisite fails to complete successfully, an error message displays on the Prerequisites page. For a potential solution, see <a href="/cloudos/moonshot/manage/troubleshooting/#problem-admin-node-internet-access-prerequisites-fail-to-complete">Problem: Admin Node Internet Access Prerequisites fail to complete</a> in the Troubleshooting topic. <br />
Also, specifying incorrect proxy host settings might cause failures when attempting to launch the Operational Dashboard and the Administration Dashboard.
</p>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

### Cloud Administration Node Time Settings Prerequisite dialog

**To access**: Select the **Environment** tab > **Prerequisites**> click **Edit Prerequisite** for the Cloud Administration Node Time Settings Prerequisite.

The following table describes the Cloud Administration Node Time Settings Prerequisite dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI element</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Timezone</b> </td>
<td> Set the appropriate time zone for your area (UTC is the default). </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Date</b> </td>
<td> Set the date applicable for your environment if different from the default. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Time</b> </td>
<td> Set the time applicable for your environment if different from the default. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Update Prerequisite</b> </td>
<td> Click to save these settings and complete this setup. </td>
</tr>

</table> 

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

### External DNS Server Prerequisite dialog

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:700px;"> <b>Caution:</b> 
If you want to set the External DNS Server Prerequisite, you must configure it before you complete the steps on the 
Complete Install panel. For details, see the <a href="/cloudos/moonshot/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a> topic.
After that, the External DNS Server Prerequisite dialogs are read-only. Once the install process is triggered, 
no changes can be made. If you want to make changes, you need to start over by re-installing the HP Cloud OS for Moonshot Administration node. 
For procedural instructions, see <a href="/cloudos/moonshot/install/">Install and Configure Your Cloud</a>.
</p>

**To access**: Select the **Environment** tab > **Prerequisites**> click **Edit Prerequisite** for the External DNS Server Prerequisite.

The following table describes the External DNS Server Prerequisite dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI element</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>External DNS Server IP Address</b> </td>
<td> Type the IP address of the external DNS server used by your HP Cloud OS for Moonshot environment to be able to access named websites within your cloud. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Update Prerequisite</b> </td>
<td> Click to save the IP address. </td>
</tr>

</table> 

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

### Email Notification Settings Prerequisite dialog

**To access**: Select the **Environment** tab > **Prerequisites**> click **Edit Prerequisite** for the Email Notification Settings Prerequisite.

The following table describes the Email Notification Settings Prerequisite dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI element</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Email Notifications</b> </td>
<td> Click to enable this setting. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>SMTP Server</b> </td>
<td> Set to an SMTP server that is valid for your network. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>From Address</b> </td>
<td> Set to an applicable email address for your environment. Most likely, this will be the email address of the person responsible for managing the could infrastructure. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>To Address (comma-separated list)</b> </td>
<td> Set to an applicable email address or comma-separated list of addresses. This might be the person who initiated the cloud build or anyone who is interested in following the cloud build process.</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Update Prerequisite</b> </td>
<td> Click to save the IP address. </td>
</tr>

</table> 

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Networks {#networks}

The following information provides details about the Networks panel:

**Concepts:**

[Networks Panel overview](#networks-panel-overview)

**UI descriptions:**

* [Networks panel](#networks-panel-overview)

* [Networks page](#networks-page)

* [Edit Network dialog](#edit-network)

* [Edit Address Range dialog](#edit-address-range)



### Networks Panel overview {#networks-panel-overview}

On the Networks panel, you define the networks for each logical connection (intf0, intf1, intf2,...). A network is defined for each connection such as the admin network, public network, nova_flat network, and the IPMI network. These  network definitions are used for various purposes in the cloud:

* **admin** &mdash; Networking between the nodes and the Admin Node. Used for administrative functions, such as managed node installation, TFTP booting, DHCP assignments, system logs, backups, and other monitoring tasks. Also carries cinder-volume traffic. Must be an isolated private network.
* **nova_flat** &mdash; Flat networking uses ethernet adapters configured as bridges to allow the network traffic to transit between the various nodes. You can use a single adapter on the physical host, or you can use multiple adapters. This option does not require a switch that does VLAN tagging.
* **IPMI** &mdash; Connects the Baremetal host to the IPMI interface of the Moonshot chassis.
* **public** &mdash; Public or corporate network that is attached to your cloud infrastructure. Must provide a pool of IP addresses for the Cloud Controller node for floating IP assignments. Size of the pool depends on the number of Virtual Machine instances. This network handles traffic to the outside world for the instances.



<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:700px;"> <b>Important:</b> Customizing the public network settings is 
critical. Any missing or incorrect values will result in you having to re-install the HP Cloud OS for Moonshot Administration node. 
For procedural instructions, see <a href="/cloudos/moonshot/install/">Install and Configure Your Cloud</a>.
</p>

The following table describes the networks in the HP Cloud OS for Moonshot environment:

<table style="text-align: left; vertical-align: top; min-width:700px;">



<tr style="background-color: #C8C8C8;">

<th>Node</th>
<th>Network type</th>
<th>Interface</th>
<th>IP assignment mode</th>
<th>IP address provider</th>
<th>Network range specified in this option</th>
</tr>
<tr style="background-color: white; color: black;"><td rowspan="2"><b>Admin</b></td>
<td>Management/isolated</td>
<td>eth0</td>
<td>DHCP</td>
<td>DHCP service running on Admin node</td>
<td>HP Cloud OS for Moonshot prerequisites</td>
<tr><td>Public</td>
<td>eth1</td>
<td>Static or DHCP</td>
<td>For dynamic, DHCP service is from public network</td>
<td>HP Cloud OS for Moonshot prerequisites</td></tr>
</tr>
<tr style="background-color: white; color: black;">
<td rowspan="3"><b>Controller</b></td>
<td>Management/isolated</td>
<td>eth0</td>
<td>DHCP</td>
<td>DHCP service running on Admin node</td>
<td>HP Cloud OS for Moonshot prerequisites</td>
<tr><td>nova_flat</td>
<td>eth1</td>
<td>Static</td>
<td>Static assignment by Admin node</td>
<td>HP Cloud OS for Moonshot prerequisites</td></tr>
<tr><td>Public</td>
<td>eth2</td>
<td>Static</td>
<td>Static assignment by Admin node</td>
<td>HP Cloud OS for Moonshot prerequisites</td></tr>
</tr>
<tr style="background-color: white; color: black;">
<td rowspan="4"><b>Baremetal Host</b></td>
<td>Management/isolated</td>
<td>eth0</td>
<td>DHCP</td>
<td>DHCP service running on Admin node</td>
<td>HP Cloud OS for Moonshot prerequisites</td>
<tr><td>nova_flat</td>
<td>eth1</td>
<td>Static</td>
<td>Static assignment by Admin node</td>
<td>HP Cloud OS for Moonshot prerequisites</td></tr>
<tr><td>IPMI</td>
<td>eth2</td>
<td>DHCP/static</td>
<td>If DHCP-enabled Baremetal IPMI network option is "True" while creating cloud, then the DHCP server on IPMI network will assign IP. <br /><br />
If DHCP-enabled Baremetal IPMI network option is "False", then the range is statically assigned by the Admin node.
</td>
<td>For static, range is defined in HP Cloud OS for Moonshot prerequisites page</td></tr>
<tr><td>nova_flat</td>
<td>eth0</td>
<td>DHCP</td>
<td>IP is assigned by the DHCP service running on Controller node</td>
<td>nova_flat networks' DHCP IP range</td></tr>
</tr>
<tr style="background-color: white; color: black;">
<td><b>Cartridge</b></td>
<td>Public</td>
<td>eth1</td>
<td>DHCP</td>
<td>IP is assigned by the DHCP service running on external/public network</td>
<td>External networks' DHCP range</td>
</tr>

</table>




<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:700px;"> <b>Caution:</b> The address ranges validation only occurs when you 
open the Edit Address Ranges dialog for each network and click <b>Update Address Ranges</b>. Otherwise,you will not know if you have any errors. 
However, the Complete Install step will run a validation check and cannot be completed until the errors are fixed. If there is an address 
range error, the validation check will show the network type and possibly the address value. If not, open the Edit Address Ranges dialog 
for the specified network and click <b>Update Address Ranges</b> to identify the incorrect address. For details, see 
<a href="/cloudos/moonshot/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a>.
</p>


### Networks page {#networks-page}

**To access**: Select the **Environment** tab > **Networks**.

The following table describes the Networks page UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th> UI element </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td><b>Network Type</b> column</td>
<td> Lists the available network types: 

<ul>
<li><b>admin</b></li>
<li><b>nova_flat</b></li>
<li><b>IPMI</b></li>
<li><b>public</b></li>
</ul>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>Logical Interface</b> column</td>
<td>Displays logical interface connection associated with the network type.</td>
</tr>
    
<tr style="background-color: white; color: black;">
<td><b>Subnet</b> column</td>
<td>Displays IP address associated with the network type.</td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>VLAN</b> column</td>
<td>Displays Virtual Local Area Network ID number associated with the network type. </td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>VLAN Enabled</b> column</td>
<td> Indicates whether the associated network coexists on the same physical interface as other networks. <br />

<p>If the networks co-exist on the same physical network, VLAN Enabled must be set to <b>True</b>. This means the Network Mode will be set to <b>single</b> by default on the 
<a href="/cloudos/moonshot/manage/operational-dashboard/environment-tab/#confirm-complete-install-dialog">Confirm Complete Install dialog</a>.</p>

<p>If the networks exist on separate physical interfaces, VLAN Enabled must be set to <b>False</b>. This means the Network Mode will be set to <b>dual</b> by default on the 
<a href="/cloudos/moonshot/manage/operational-dashboard/environment-tab/#confirm-complete-install-dialog">Confirm Complete Install dialog</a>. </p>

</td>
</tr>
				
<tr style="background-color: white; color: black;">
<td><b>Bridge Enabled</b> column </td>
<td>Indicates, using <b>True</b> or <b>False</b>, whether a bridge interface should be added on top of the interface for the corresponding network. </td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>Create Network</b> button</td>
<td> Click to add a new network type on the <a href="/cloudos/moonshot/manage/operational-dashboard/environment-tab/#create-network-dialog">Create Network dialog</a>. 
<br /> 		
<p><b>Note:</b> The <b>Create Network</b> button only displays while you can add or edit networks. Once you <a href="/cloudos/moonshot/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a>, this button disappears and you cannot add or edit networks.</p>
</td>
</tr>
				
<tr style="background-color: white; color: black;">
<td><b>Edit Network</b> button</td>
<td>Allows you to <a href="/cloudos/moonshot/manage/operational-dashboard/environment-tab/#edit-network-dialog">edit network settings</a>. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> Down arrow &gt; <b>Edit Address Ranges</b> </nobr> </td>
<td>Allows you to <a href="/cloudos/moonshot/manage/operational-dashboard/environment-tab/#edit-address-ranges-dialog">edit the range of IP addresses</a>. </td>
</tr>

</table>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>



### Edit Network dialog {#edit-network}

**To access**: Select the **Environment** tab > **Networks** > click **Edit Network** for the network you want to customize.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:700px;"> <b>Caution:</b> If you plan to customize the networks, 
you must do that before you complete the steps on the Complete Install panel. For details, see 
the <a href="/cloudos/moonshot/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a> topic.
After that, the Edit Network dialogs are read-only. Once the install process is triggered, no changes can be made. If you want to make changes, 
you need to start over by re-installing the HP Cloud OS for Moonshot Administration node. 
For procedural instructions, see <a href="/cloudos/moonshot/install/">Install and Configure Your Cloud</a>.
</p>

The following table describes the Edit Network dialog UI elements. You will notice a few variations depending on your type of network: public, nova_flat, or IPMI.

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th> UI element </th>
<th> Description </th>
</tr>

<tr style="background-color: #f8f8f8;">
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
<td> Indicates whether a bridge interface should be added on top of the interface for the corresponding network.

<p>For the public network, set to <b>False</b>. The default is <b>False</b> and should not be changed for nova_flat or IPMI networks.</p>

</td>

</tr>

<tr style="background-color: #f8f8f8;">
<td colspan="2"><b>VLAN Tab</b> </td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>VLAN ID</b> </td>
<td>Virtual Local Area Network ID number associated with the network type. Do not change the default for the nova_flat, IPMI, or public networks.</td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>VLAN Enabled</b> </td>
<td> Indicates whether the associated network coexists on the same physical interface as other networks.
<br /> 
<p>(<i>Recommended</i>) Leave set to <b>False</b> (the default value) if the networks (particularly public) exist on separate physical interfaces. This means that the Network Mode will be set to <b>dual</b> by default on the 
<a href="/cloudos/moonshot/manage/operational-dashboard/environment-tab/#confirm-complete-install-dialog">Confirm Complete Install dialog</a>. </p>

<p>Set to <b>True</b> if the networks (particularly public) co-exist on the same physical network. 
This means that the Network Mode will be set to <b>single</b> by default on the 
<a href="/cloudos/moonshot/manage/operational-dashboard/environment-tab/#confirm-complete-install-dialog">Confirm Complete Install dialog</a>. </p>

</td>
</tr>

<tr style="background-color: #f8f8f8;">
<td colspan="2"><b>Router Tab</b>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>Router</b> </td>
<td> Device's IP Address that passes network traffic between different IP networks.
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> <b>Router Preference</b> </nobr> </td>
<td>Any value used by a routing protocol to determine whether one particular route should be chosen over another.</td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>Update Network</b></td>
<td>When clicked, this button saves the edited settings for all three tabs. </td>
</tr>
				
</table>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>



### Edit Address Ranges dialog {#edit-address-range}

**To access**: Select the **Environment** tab > **Networks** > click the down arrow and select **Edit Address Ranges** for the nova_flat, IPMI, or public network type to view or edit the IP address ranges.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:700px;"> <b>Caution:</b> If you plan to customize the address ranges, 
you must do that before you complete the steps on the Complete Install panel. For details, see 
the <a href="/cloudos/moonshot/manage/operational-dashboard/environment-tab/#complete-install">Complete Install</a> topic.
After that, the Edit Address Ranges dialogs are read-only. Once the install process is triggered, no changes can be made. If you want to make changes, 
you need to start over by re-installing the HP Cloud OS for Moonshot Administration node. 
For procedural instructions, see <a href="/cloudos/moonshot/install/">Install and Configure Your Cloud</a>.
</p>

The following table describes the Edit Network dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th> UI element</th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Network Type</b> </td>
<td> Network type being viewed or edited. </td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>Subnet</b> </td>
<td> Pre-populated with the subnet that was configured for the public network. </td>
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
<td><b>Node Types</b> </td>
<td> 
For IPMI and public, this is set for <b>host</b>. For nova_flat this is set for <b>host</b> and <b> DHCP</b>.
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>IPV4 Start Addr / <br /> IPV4 End Addr</b> </td>
<td> Provide the IP address range corresponding to the network's configuration. Get the range from your IT administrator, or define the IP range if you are the IT administrator. 
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> <b>Update Address Ranges</b> button </nobr> </td>
<td> Click to save the edited settings, and to validate that the IP address ranges are correct.
<br />
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"> <b>Note:</b> If you enter invalid ranges, 
you will get a validation error when you click <b>Update Address Ranges</b>. The validation error identifies the incorrect address 
(start or end) for the corresponding network type. You must fix all errors in this Edit Address Ranges dialog for the install to be 
successful. Clicking <b>Cancel</b> will not trigger the validation step. Identify the incorrect address.</p>
</td>
</tr>

				
</table>



## Complete Install {#complete-install}

The following information provides details about the Complete Install panel.

**Concepts:**

* [Complete Install overview](#complete-install-overview)

**UI descriptions:**

* [Complete Install page](#complete-install-page)
 
* [Confirm Complete Install dialog](#confirm-complete-install-dialog)

### Complete Install overview

On the Complete Install panel, you complete the HP Cloud OS for Moonshot Administration node installation, which installs underlying components on the Administration node.

You specify the install settings on the Confirm Complete Install Dialog and then finish the install process on the Complete Install Page.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:700px;"> <b>Note:</b> The Complete Install step runs a validation check 
of the network IP address ranges. If there is an error, this step cannot be completed until the error is fixed. 
The validation check shows the network type and possibly the address value. You must open the Edit Address Ranges dialog for the specified 
network and click <b>Update Address Ranges</b> to identify the incorrect address, and fix it. 
See <a href="/cloudos/moonshot/manage/operational-dashboard/environment-tab/#edit-address-range">Edit Address Ranges Dialog</a>.
</p>

When the install is complete, the Operational Dashboard displays the Cloud tab (see the <a href="/cloudos/moonshot/manage/operational-dashboard/cloud-tab/">Cloud Tab</a> section of this topic) after you click the **Continue...** button.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:700px;"> <b>Caution:</b> Be sure the values for the 
Prerequisites, Networks Connections, and Network Settings are what you need, before you start the install process. Once the install process is triggered, 
no changes can be made. If you want to make changes, you need to start over by re-installing the HP Cloud OS for Moonshot Administration node. 
For procedural instructions, see <a href="/cloudos/moonshot/install/">Install and Configure Your Cloud</a>.
</p>

### Complete Install page
**To access**: Select the **Environment** tab > **Complete Install**.

The following table describes the Complete Install page UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th> UI element </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> <b>Complete Install</b> button </nobr> </td> </td>
<td> Click to open the Complete Install dialog, where you will then specify configuration information to complete the 
HP Cloud OS for Moonshot Administration node installation. After the HP Cloud OS for Moonshot Administration node is installed, this button is replaced by the Continue... button. <br />
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"> <b>Note:</b> The Complete Install step runs a validation check 
of the network IP address ranges. If there is an error, this step cannot be completed until the error is fixed. 
The validation check shows the network type and possibly the address value. You must open the Edit Address Ranges dialog for the specified 
network and click <b>Update Address Ranges</b> to identify the incorrect address, and fix it. 
See <a href="/cloudos/moonshot/manage/operational-dashboard/environment-tab/#edit-address-range">Edit Address Ranges ialog</a>.
</p>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Domain Name</b> </td>
<td> Display the name of the cloud domain. </td>
</tr>



<tr style="background-color: white; color: black;">
<td> <b>Install Started</b> column </td>
<td> The timestamp that the HP Cloud OS for Moonshot Administration node install is started. </td>
</tr>

<tr style="background-color: white; color: black;">
<td><b>Install Complete</b> column </td>
<td> The timestamp that the HP Cloud OS for Moonshot Administration node install is completed. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Network Mode</b> column </td>
<td> The mode specified in the Complete Install dialog. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>IPMI/BMC Network Status</b> column </td>
<td> The IPMI/BMC Network status specified in the Complete Install dialog. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>IPMI Username</b> column </td>
<td> IPMI username, if one was specified in the Complete Install dialog. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>IPMI Password</b> column </td>
<td> IPMI password, if one was specified in the Complete Install dialog. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Show Install Log</b> column </td>
<td> Click to view the install activity in the /var/log/install.log, which appears on the bottom of the window. 
This button then becomes a Refresh button. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Refresh</b> button </td>
<td> Replaces the Show Install Log button to monitor the install progress. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Continue...</b> button </td>
<td> Replaces the Complete Install button after the HP Cloud OS for Moonshot Administration node install is complete. 
Click to add the Cloud tab. The HP Cloud OS for Moonshot Administration node is now ready to be configured to set up a cloud. 
See the <a href="/cloudos/moonshot/manage/operational-dashboard/cloud-tab">Cloud Tab</a> topic for descriptions of the panels that set up a cloud.</td>
</tr>
				
</table>



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>



### Confirm Complete Install dialog

**To access**: Select the **Environment** tab > **Complete Install** and click **Complete Install**.

The following table describes the Confirm Complete Install UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th> UI element </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Domain Name</b> </td>
<td> Enter the top-level domain name for your infrastructure. The name must be lowercase characters with no numbers or 
special characters. In the current release, it must end in .com, .org, .net, .edu, .mil, .gov, or .local. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Network Mode</b>  </td>
<td> From the drop-down list, select <b>dual</b>.<br /> <br />
<p><b>Note:</b>Dual network mode needs two Ethernet cards and allows you to completely separate traffic to/from the admin network and to/from the public network.</p>
</td>
</tr>



<tr style="background-color: white; color: black;">
<td> <nobr> <b>Complete Install</b> </nobr> </td>
<td> Click to install the required software on the HP Cloud OS for Moonshot Administration node. This may take several minutes. <br /> 
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"> <b>Note:</b> The Complete Install step runs a validation check 
of the network IP address ranges. If there is an error, this step cannot be completed until the error is fixed. 
The validation check shows the network type and possibly the address value. You must open the Edit Address Ranges dialog for the specified 
network and click <b>Update Address Ranges</b> to identify the incorrect address, and fix it. 
See <a href="/cloudos/moonshot/manage/operational-dashboard/environment-tab/#edit-address-range">Edit Address Ranges dialog</a>.
</p>

</td>
</tr>
		
</table>



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

