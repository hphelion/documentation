---
layout: default
title: "HP Cloud OS for Moonshot Troubleshooting"
permalink: /cloudos/moonshot/manage/troubleshooting/
product: moonshot

---


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/utilities/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage/">&#9650; UP</a> | <a href="/cloudos/moonshot/manage/operational-dashboard">NEXT &#9654;</a> </p>

# HP Cloud OS for Moonshot Troubleshooting
HP Cloud OS for Moonshot is an OpenStack-based cloud platform to manage HP Moonshot servers. Different usage scenarios might lead to abnormal system behavior or known issues. This topic describes all the known issues that you might encounter. To help you troubleshoot these issues, we have provided possible resolutions.

For easy reference, we categorized the known issues and solutions as follows:


* [Operation Dashboard: Cloud Infrastructure Readiness](#opdash-cloud-ready)
* [Operation Dashboard: Cloud and Region](#opdash-cloud-region)
* [Administration Dashboard: Moonshot Management](#admindash-moon-manage)
* [Administration Dashboard: Instance Provisioning &gt; Elemental](#admindash-instance-element)
* [Administration Dashboard: Topology Designer](#admindash-topology)
* [Administration Dashboard: Instance Provisioning &gt; Topology-based](#admindash-instance-topology)
* [Administration Dashboard: Workloads](#admindash-workloads)
* [Log/Configuration Files and Location](#log-config-files)

If you need further assistance, feel free to contact [HP Customer Support](https://www.hpcloud.com/contact_us).

## Operational Dashboard: Cloud Infrastructure Readiness {#opdash-cloud-ready}

#### New node fails to PXE boot because of TFTP boot timeout error
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Operational Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Nodes you created are not listed in the dashboard even after waiting for sufficient time (more than 5 minutes), and the console of your virtual machine displays TFTP error messages.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>This occurs because of the discrepancy between the boot time of the Admin node and the failed node. &nbsp;</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>

<ol>
<li>Log in to the Admin node and run the following commands:
<ol style="list-style-type:lower-latin;">
<li><code>sudo bluepill tftpd stop</code></li>
<li><code>sudo bluepill tftpd start</code></li></ol></li>
<li>PXE boot your node.</li></ol></td></tr>
</table>

#### Discovered cloud nodes shown as 'Off' in Manage Nodes section
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Operational Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Manage Nodes section of the Cloud tab displays the state of discovered node(s) as <b>Off</b>.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Chef client's status freeze causes the UI to be stuck in an <b>Off</b> state.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>

<ol>
<li>Ensure that you have chosen the correct NIC interface and it is connected to the public network.</li>
<li>Re-apply the Operational Dashboard prerequisites.</li></ol>
For more information, check the <b>/var/log/cosmos/cosmos.log</b> and <b>/var/log/apache2/error.log</b> files on the Admin Node.</td></tr>
</table>

#### Allocated node stuck at 'Installing/Installed' state for more than 10 minutes
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Operational Dashboard</th>
</tr>
<td>System Behavior/Message</td>
<td>Manage Nodes section of the Cloud tab displays the state of the allocated node as 'Installing/Installed' for  an unusually long period of time.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Time synchronisation issues.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>Reset the node.</td></tr>
</table>

#### Updating the internet access prerequisites sometimes fails
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Operational Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Dashboard displays the <b>Failed to complete the prerequisites</b> message.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>You might have selected the wrong NIC interface; it might not exist or does not support internet connectivity.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
<ol>
<li>Ensure that you have chosen the correct NIC interface and it is connected to the public network.</li>
<li>Re-apply the Operational Dashboard prerequisites.</li></ol>
For more information, check the <b>/var/log/cosmos/cosmos.log</b> and <b>/var/log/apache2/error.log</b> files on the Admin Node.</td></tr>
</table>

## Operational Dashboard: Cloud and Region {#opdash-cloud-region}

#### Installation/configuration of the Cloud Administrator node sometimes fails
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Operational Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>After completion of the Complete Install steps, the Cloud Administrator node installation fails and the install log displays an error containing the specific details as to why the failure occurred.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>There can be timing issues when installing the Cloud Admininstrator node because the process involves installing various components like Chef, NTP, etc. </td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>Recreate the Admin node and start a fresh installation of the Cloud Administrator node.</td></tr>
</table>

#### Create cloud or create region fails
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Operational Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>In the Manage Clouds section of the Cloud tab, the dashboard shows a cloud's status as <b>Failed</b>.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>When creating a cloud or region various cloud components are implicitly installed in the background via barclamps. Any installation failure of barclamp causes this behavior.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>

<ol>
<li>Change log level to <b>info</b> for all compute and controller nodes. To do so, edit <b>/etc/chef/client.rb</b> and change <code>log_level:error</code> to <code>log_level:info</code>.</li>
<li>Run <code>bluepill chef-client restart</code>.</li>
<li>In the admin node, edit <b>/etc/chef/server.rb</b> and change <code>log_level:error</code> to <code>log_level:info</code> and reboot the server.</li>
<li>Go to the crowbar UI (https://&lt;Admin node IP&gt;:3000) and re-apply the barclamp(s) that failed.</li>
<li>Check the <b>/opt/dell/crowbar_framework/log/&lt;node&gt;.log</b> as it might help identify the error. </li>
<li>Remove failed cloud or region and re-create.</li></ol>

<b>Note:</b> Ensure the attributes like Network and Server Type selection are correct for the creation of Cloud or Region.</td></tr>
</table>

## Administration Dashboard: Moonshot Management {#admindash-moon-manage}

#### Internal server error from Skyline (Moonshot Management) with no additional information on exact error
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Dashboard displays an <b>HTTP 500 Internal Server Error</b> message.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Apollo service is unreachable or is busy with other tasks.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
Check the following logs on the Controller node for exact details:<br>
<ul>
<li>/var/log/skyline/skyline.log</li>
<li>/var/log/apollo/apollo.log</li></ul></td></tr>
</table>

#### "Not Authorized" error message from Skyline (Moonshot Management)
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Dashboard displays an <b>HTTP 401 Not Authorized</b> error message.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>The user does not have  permission or the X-Auth token expired because of logging in with same credentials in another session.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
Check the following logs on the Controller node for exact details:<br>
<ul>
<li>/var/log/skyline/skyline.log</li>
<li>/var/log/apollo/apollo.log</li></ul>
If this is because the X-Auth token expired, then sign out and log in again to Skyline to renew the token.</td></tr>
</table>

#### Moonshot chassis discovery takes a long time or sometimes fails
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Dashboard shows <b>In Progress</b> continually for chassis discovery.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Apollo service is unreachable or the chassis is unreachable at the given IP address.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>Check <b>/var/log/apollo/apollo.log</b> on both the Controller and Compute nodes for exact details.</td></tr>
</table>

#### Chassis refresh status is shown as "Failed" in the Datacenter table view
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Icon view shows <b>Optimal</b> status, but the table view shows <b>Refresh</b> status as <code>Failed</code></td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Chassis is unreachable.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>

<ol>
<li>Double-click the chassis and navigate to Single Chassis view.
<li>Click on Force Refresh at the top, right corner of the Single Chassis view frame.</li>
<li>After the refresh completes, return back to the Datacenter view to see the updated status.</li></ol></td></tr>
</table>

#### An existing chassis displays "Failed to connect to chassis" message
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Chassis displays a <b>Failed to connect to chassis</b> message.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Password and other details might have changed.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>Edit the chassis details and provide the correct information.</td></tr>
</table>

#### Deleting chassis failed with "Unable to delete" message
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>When trying to delete a chassis, an <b>Unable to delete, Cartridges not in maintenance mode/Active instances exist</b> or <b>Unable to delete, Chassis not in maintenance mode</b> message displays.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Chassis is not in Maintenance Mode or is in Maintenance Mode but still has active instances.
</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
To successfully delete a chassis, it must be in Maintenance Mode in the Single Chassis view and there are no active instances on the nodes in the chassis. You can also delete a chassis when the chassis discovery fails when first adding the chassis.
<br />
<br />Set the chassis to Maintenance Mode and retry the delete. Ensure there are no active instances running on the chassis.
</td></tr>
</table>

#### After the Single Chassis view page loads, any immediate action throws internal server error
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Page displays an <b>HTTP 500 Internal Server Error</b> message.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Apollo service is busy fetching event logs.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>Wait for a few minutes, until the event logs have been fetched or have stopped loading, and then retry loading the page.</td></tr>
</table>

#### Single Chassis view displays "Error" instead of cartridge ID 
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>In the Single Chassis view, <b>Error</b> is displayed for the cartridge ID and the corresponding table entry is empty.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Erroneous data from the Moonshot Chassis Manager.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
Wait for the discovery polling interval or force a refresh.</td></tr>
</table>

#### Single Chassis view not enabled
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Single Chassis view is not enabled.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Chassis is in the process of discovering cartridges or discovery has failed.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>Wait for the discovery polling interval or force a refresh. If not resolved, check the errors in the <b>/var/log/apollo.log</b> file.
</td></tr>
</table>

#### Node disk size displayed is less than actual value
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Disk size information is conflicting; value displayed is less than actual disk size.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Since the disk size information is not available from the Moonshot Chassis, only the minimum disk size supported by the node in a cartridge is configured in HP Cloud OS for Moonshot.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>None</td></tr>
</table>

#### Error message when setting a chassis to maintenance mode
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td><b>Failed to update maintenance mode for one or more cartridges</b> error message is displayed.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Chassis is unreachable or none of the nodes are registered.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>Ensure all the cartridges/nodes discovered by Apollo are registered to the <b>nova bm</b> database.</td></tr>
</table>

#### Chassis cannot be deleted error message
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Chassis Deletion</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td><b>Unable to delete chassis</b> error message is displayed.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>
Most common causes are that the chassis is not set to Maintenance Mode or it has active instances running. Failure could occur if the Discovery thread is not running for the chassis; for example, it might have stopped because of some other intervening process. </td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>Restart the Apollo agent service and then delete the chassis.</td></tr>
</table>

#### Added chassis is not in Datacenter view (IE, Firefox)
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Chassis for which discovery failed does not show up in the Datacenter view with a failed status.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Discovery of chassis failed.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
Close IE or Firefox and reopen to see the chassis in the Datacenter view. If this does not work, use  the Edit option in Chrome to rediscover the failed chassis and see it in the Datacenter view.</td></tr>
</table>

## Administration Dashboard: Instance Provisioning &#9658; Elemental {#admindash-instance-element}

#### Provisioning fails when using custom flavors
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>nova-compute log errors out: <b>Given size (10240) exceeds max allowable size (0)</b>.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>
Provisioning fails when the <b>root_mb</b> in the flavor exactly matches the node's disk size. There is a OpenStack community defect on this: <a href="https://bugs.launchpad.net/nova/+bug/1171562">https://bugs.launchpad.net/nova/+bug/1171562</a>.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>Change the <b>root_mb</b> size in the flavor so it is less than the node's disk size. </td></tr>
</table>

#### While provision, error is displayed in nova-scheduler.log
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>nova-scheduler.log displays an error message: <b>Setting instance to Error state</b>.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>There is no Baremetal node that matches the flavor specifications or a Baremetal node is set to maintenance mode.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
<ul>
<li>Ensure the Baremetal nodes are <b>NOT</b> set to maintenance mode.</li>
<li>Make sure you have a Baremetal node in the backend matching the product_id mentioned in the flavor.</li></ul></td></tr>
</table>

#### Unable to provision instances due to no DHCP server found
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Error message displayed in in nova-compute log on the compute node: <b>No dhcp-server found</b>.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>The quantum-dhcp-agent might not be running in the controller or the controller is not able to reach the Baremetal host using the nova_flat network.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
<ol>
<li>Verify that the flat network is in promiscuous mode.</li>s
<li>Verify that the quantum-dhcp-agent is running in the controller node. </li>
<li>Verify the controller node is able to reach the Baremetal host using the nova_flat network.</li></ol></td></tr>
</table>

#### Nodes registered are shown in "nova baremetal-node-list" but not in "nova hypervisor-list" (provisioning will fail in this case)
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>UI behavior shows instance in error state immediately after launch</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Nova-compute service may be down or there might be sync issues between nova-services</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
<ol>
<li>Make sure that nova-compute is up by executing the following command on controller node "nova-manage service list"</li>
<li>If nova-compute shows as XXX, restart the nova-compute service on the baremetal host</li></ol></td></tr>
</table>

#### Instance de-provisioning fails with "Unable to establish IPMI v2 / RMCP+ session" error in nova-compute.log
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>"Insufficient resources for session Error: Unable to establish IPMI v2 / RMCP+ session Unable to get Chassis Power Status"</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>This is because the number of simultaneous IPMI sessions on the chassis that hosts the nodes selected for provisioning&nbsp; is exhausted</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>Clicking "delete topology" couple of times would be able to do the cleanup. If that does not work then the chassis should be reset using the chassis manager CLI "RESET CM"</td></tr>
</table>

#### Instance provisioning fails due to failed cartridge
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>UI behavior shows instance in error state immediately after launch</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>
The current "apollo" service design takes 30minutes to import the refreshed data into the HP Cloud OS Moonshot environment. <br>
<br>
Before the Cloud Administrator &nbsp;realizes about a failed cartridge, the scheduler might select the cartridge which is in failed state and this &nbsp;might lead to failure of the instance provisioning</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
Cloud Admin should do a Force Refresh in Moonshot Chassis Management page before assigning a cartridge for provisioning, get the failed cartridge list and then put them into the maintenance mode. <br>
<br>
The nova-scheduler does not select a cartridge which is in maintenance mode</td></tr>
</table>

#### User cannot connect to instance via SSH even if instance is active and is in running state
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>"ssh: connect to host &lt;IP Addres&gt; port 22: No route to host"</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>The instance's networking is not completely configured after boot</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>Wait for a few minutes and retry</td></tr>
</table>

#### Unable to ping or SSH to an instance
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Request times out</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Network issues may prevent access to cloud instances or there can be a routing problem</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
<ol>
<li>Check if the Baremetal instances are able to forward packets from the public interface to the bridged interface.</li></ol>
sysctl -A | grep ip_forward<br>
net.ipv4.ip_forward should be set to 1<br>
<ol start="2">
<li>Check if you can communicate with the OpenStack Compute nodes from the client and any routing to these instances have the correct entries</li></ol></td></tr>
</table>

#### Provisioning fails due to issues with default quota
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>"Error" status reported in "Instances" page immediately after launching the instance</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Insufficient quota limits – CPU, instances or RAM</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>Check the Projects tab -&gt; Overview page, if any of the dialog shows indication of insufficient quota, change the quota values as desired &nbsp;from Cloud Tab -&gt; Projects -&gt; Modify Limits option and retry provisioning.</td></tr>
</table>

#### Instance is in spawning state for a long time
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: white; color: black;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Operational Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>"Status" on "Instances" page will continue to be in "Spawning/Error" and does not change to "Active"</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Network connectivity issues, Instance reboot fails due to some issues with the image etc.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
<ol>
<li>Ensure that the Baremetal host has sufficient resources to launch and is registered &nbsp;with compute nodes</li>
<li>Check the /var/log/nova/nova-compute.log (on compute node) for cause of failure.</li>
<li>The following specifications need to be there for provisioning:</li></ol>
<ul>
<li>2013-10-18 18:17:09,225.225 4466 INFO nova.compute.manager [-] Updating bandwidth usage cache</li>
<li>2013-10-18 18:22:52,753.753 4466 AUDIT nova.compute.resource_tracker [-] Auditing locally available compute resources</li>
<li>2013-10-18 18:22:52,787.787 4466 AUDIT nova.compute.resource_tracker [-] Free ram (MB): 2048</li>
<li>2013-10-18 18:22:52,787.787 4466 AUDIT nova.compute.resource_tracker [-] Free disk (GB): 10</li>
<li>2013-10-18 18:22:52,787.787 4466 AUDIT nova.compute.resource_tracker [-] Free VCPUS: 1</li></ul>
<br>
If a &quot;No valid host found&quot; error occurs while provisioning, ensure that the Baremetal Host is registered correctly by nova baremetal-node-list</td></tr>
</table>

#### De-provisioning leads to deleting state but does not delete the instance
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Message N/A. Dashboard shows instance deletion in progress always</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>When instance is terminated in spawning state, terminate request is orphaned and instance status is hung at deletion.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
<ol>
<li>Stop the nova services running in Baremetal Host and delete the instance, or</li>
<li>Restart nova-compute in compute node and refresh skyline</li></ol></td></tr>
</table>

#### Unable to access Shell in a box
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>"Web Page Cannot be Found" message in browser</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>System where the Administration Dashboard is running may not be in the Admin network</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>Ensure that the connectivity to the Admin network and the server name for the interface are pointing to the admin node</td></tr>
</table>

#### Unable to view Shell in a box, shows warning screen or grey screen
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Message - "Unable to load the console" or grey screen</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>SSL verification exceptions during first time access of shell in a box console</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>Open the &nbsp;link 'Click to view only console' in a New Tab and allow the necessary SSL verification exceptions and refresh Skyline</td></tr>
</table>

## Administration Dashboard: Topology Designer {#admindash-topology}

#### Unable to view topology designer, shows certificate warning screen or grey screen
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>The browser shows SSL verification screen or grey screen</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>SSL verification exceptions during the first access of the topology designer UI</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
In Mozilla Firefox, right click on the warning screen section and select <br>
This Frame -&gt; Open Frame in New Tab and allow the necessary SSL verification exceptions and refresh Administration Dashboard<br>
<br>
For Internet Explorer, go to url:<br>
https://&lt;controller-node-public-ip&gt;:21081/<br>
Accept the SSL warning and proceed. The page will show "Web page cannot be found" screen. Enter the skyline IP in the same browser tab and Topology Designer will now load within the Administration Dashboard</td></tr>
</table>

#### Designer does not list the resource pool when cloud profile is other than 'HP Cloud OS Grizzly Baremetal'
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Topology designer UI does not list all the resource pools that exists</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Resource pools that are not displayed might have been created with the profile other than those specific for HP Cloud OS for Moonshot</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>Make sure the required resource pool has 'HP Cloud OS Grizzly Baremetal' as it's cloud profile</td></tr>
</table>

## Administration Dashboard: Instance Provisioning &#9658; Topology-based {#admindash-instance-topology}

#### Skyline Running Topologies reports internal server error
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Skyline error message "Internal server error"</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Timeout issues between eve and other services or wrong HTTP Proxy Settings (non-proxy hosts) is configured</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>Ensure that the non-proxy host 127.* is set in Prerequisites page of Operational Dashboard. Once "Complete Install" is done, the user cannot update prerequisites. Hence, if not set correctly the user will have to re-apply the hp-cos-eve-barclamp with 127.* in non-proxy hosts.</td></tr>
</table>

## Administration Dashboard: Workloads {#admindash-workloads}

#### Download of workload from Skyline's Updates and Extension panel fails
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Dashboard displays message 'Unable to connect to server'</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>CODN can only handle certain number of download activities simultaneously. </td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>Wait for some time and retry. For details, check log file at /var/log/codn/codn.log on controller node.</td></tr>
</table>

#### Publishing workload from Updates and Extension panel does not show up in workload dashboard
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Newly added workload is not visible in dashboard</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>CODN fails to upload one of the components (i.e. image or topology etc) in cloud.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
Check the CODN log located at /var/log/codn/codn.log on controller node. <br>
<br>
If CODN fails to upload a component because a component with the same name ALREADY exists then check manifest file in the respective workload folder under /var/cache/codn/import on the controller node. Specifically, check whether duplicate policy (check_for_duplicates property) for the component is configured as desired. Set this attribute to "false" to allow duplicates.<br>
<br></td></tr>
</table>

#### Launching CCUE designer shows gray screen or throws warning
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Dashboard shows gray screen or warning</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>SSL verification exceptions during the first time access of the designer UI</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
In Mozilla Firefox, right click on the warning screen section and select <br>
This Frame -&gt; Open Frame in New Tab and allow the necessary SSL verification exceptions and refresh Administration Dashboard<br>
<br>
For Internet Explorer, go to url:<br>
https://&lt;controller-node-public-ip&gt;:21081/<br>
Accept the SSL warning and proceed. The page will show "Web page cannot be found" screen. Enter the skyline IP in the same browser tab and Topology designer will now load within the Administration Dashboard</td></tr>
</table>

#### Launch profile fails
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Dashboard displays a message 'Failed to launch Profile'</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>eve is not configured with correct proxy setting</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>Ensure that the non-proxy host 127.* is set in Prerequisites page of Operational Dashboard. Once "Complete Install" is done, the user cannot update prerequisites. Hence, if not set correctly the user will have to re-apply the hp-cos-eve-barclamp with 127.* in non-proxy hosts.</td></tr>
</table>

#### Creation of profile does not pick nova flavor for a given server in CCUE designer
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Property editor of server element in CCUE designer does not pick any flavor automatically.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>
It can happen if there is no auto-flavor created in system which meets server requirement of specified workload. <br>
e.g., If you import a workload that's not supported by the cartridges present in the cloud.<br>
<br></td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
Check support matrix as well as HP Moonshot server requirements of your workload. If your cloud has appropriate Moonshot server (i.e. cartridges) then check Apollo log /var/log/apollo/apollo.log on controller node.<br>
<br></td></tr>
</table>

## Log/Configuration Files and Location {#log-config-files}
<table style="text-align: left; vertical-align: top; min-width: 400px;">
<tr style="background-color: #C8C8C8;">
<th>Topic</th>
<th>Log configuration</th>
<th>Log file location</th></tr>
<tr style="background-color: white; color: black;">
<td>Workload content download &amp; publish [Skyline-&gt; Update and Extensions]</td>
<td>
/etc/codn/codn.log<br>
&nbsp;(Cloud Controller)<br>
<br>
To configure the log level, change the INFO to one of allowed values: DEBUG, ERROR, WARNING &amp; CRITICAL<br>
<br>
logging = {<br>
 &nbsp; &nbsp;'loggers': {<br>
 &nbsp; &nbsp; &nbsp; &nbsp;'root': {'level': 'INFO', 'handlers': ['console']},<br>
 &nbsp; &nbsp; &nbsp; &nbsp;'codn': {'level': 'INFO', 'handlers': ['file']},<br>
 &nbsp; &nbsp; ….<br>
<br></td>
<td>
/var/log/codn/codn.log<br>
&nbsp;(Cloud Controller)</td></tr>
<tr style="background-color: white; color: black;">
<td>
Workload service &nbsp;[Skyline -&gt; Provisioning -&gt; Workload]<br>
<br></td>
<td>
/etc/skyline/platform_settings.py<br>
&nbsp;(Cloud Controller)<br>
<br>
To configure the log level, change the INFO to one of allowed values defined in LOG_LEVELS in the same file<br>
<br>
LOGGING = {<br>
…. &nbsp; <br>
 &nbsp; &nbsp; &nbsp; &nbsp;'cloudos_file': {<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'level': 'INFO',<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'class': 'logging.handlers.RotatingFileHandler',<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'filename': '/var/log/skyline/skyline.log',<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'</td>
<td>
/var/log/skyline/skyline.log<br>
&nbsp;(Cloud Controller)</td></tr>
<tr style="background-color: white; color: black;">
<td>Provision [Eve]</td>
<td>
 /etc/eve-api/eve.yml<br>
/etc/eve-requestworker/eve.yml<br>
&nbsp;(Cloud Controller)<br>
<br>
To configure the log level, change the INFO to one of allowed values defined as follows<br>
<br>
logging:<br>
 &nbsp; &nbsp;# The default level of all loggers. Can be OFF, ERROR, WARN, INFO, DEBUG, TRACE, or ALL.<br>
 &nbsp; &nbsp;level: INFO<br>
<br></td>
<td>
/var/log/eve-api/eve-api.log<br>
/var/log/eve-requestworker/eve-requestworker.log<br>
(Cloud Controller)</td></tr>
<tr style="background-color: white; color: black;">
<td>Resource pool &amp; Flavor selection [Graffiti]</td>
<td>
/etc/graffiti-api/graffiti-api.yml<br>
&nbsp;(Cloud Controller)<br>
To configure the log level, change the INFO to one of allowed values defined as follows<br>
<br>
logging:<br>
 &nbsp; &nbsp;# The default level of all loggers. Can be OFF, ERROR, WARN, INFO, DEBUG, TRACE, or ALL.<br>
 &nbsp; &nbsp;level: INFO<br>
<br></td>
<td>
/var/log/graffitia-api/graffiti-api.log<br>
(Cloud Controller)</td></tr>
<tr style="background-color: white; color: black;">
<td>Workload Deployment profile guide &amp; Deployment profile persistence [Focus]</td>
<td>
/etc/focus-api/focus.yml<br>
&nbsp;(Cloud Controller)<br>
<br>
To configure the log level, change the INFO to one of allowed values defined as follows<br>
<br>
logging:<br>
 &nbsp; &nbsp;# The default level of all loggers. Can be OFF, ERROR, WARN, INFO, DEBUG, TRACE, or ALL.<br>
 &nbsp; &nbsp;level: INFO<br>
<br></td>
<td>
/var/log/focus-api/focus-api.log<br>
(Cloud Controller)</td></tr>
<tr style="background-color: white; color: black;">
<td>Moonshot Management &amp; Automatic default Flavor creation [ Apollo]</td>
<td>
/etc/apollo/logging.conf<br>
&nbsp;(Baremetal Compute Host)<br>
<br>
To configure the log level, change the INFO to one of allowed values : DEBUG, ERROR, WARNING &amp; CRITICAL<br>
<br>
[logger_root]<br>
level = INFO<br>
handlers = discoveryfile<br>
<br></td>
<td>
/var/log/apollo/apollo.log<br>
&nbsp;(Baremetal Compute Host)<br>
<br></td></tr>
<tr style="background-color: white; color: black;">
<td>Moonshot capability publish &nbsp;[ Nova-compute]</td>
<td>
/etc/nova/logging.conf<br>
&nbsp;(Baremetal Compute Host)<br>
<br>
To configure the log level, change the INFO to one of allowed values : DEBUG, ERROR, WARNING &amp; CRITICAL<br>
<br>
[logger_root]<br>
level = INFO<br>
…<br>
<br>
NOTE: update the same log level for the other loggers in this file, (loggers starts with [logger_xxx]<br>
<br>
/etc/nova/nova.conf<br>
Under [DEFAULT] section , add following line<br>
debug=True<br>
<br></td>
<td>
/var/log/nova/nova-scheduler.log<br>
/var/log/nova/nova-compute.log<br>
&nbsp;(Baremetal Compute Host)<br>
<br></td></tr>
<tr style="background-color: white; color: black;">
<td>Image [glance]</td>
<td>
/etc/glance/glance-api.conf<br>
&nbsp;(Cloud Controller)<br>
<br>
Under [DEFAULT] section , set following line<br>
debug=True<br>
<br>
NOTE: Follow the same procedure for other glance modules as well. The log location will vary accordingly.<br>
<br></td>
<td>
/var/log/glance/api.log<br>
(Cloud Controller)</td></tr>
<tr style="background-color: white; color: black;">
<td>Network [Quantum]</td>
<td>
/etc/quantum/quantum.conf<br>
&nbsp;(Cloud Controller)<br>
<br>
Under [DEFAULT] section , set following line<br>
debug=True<br>
<br></td>
<td>
/var/log/quantum/server.log<br>
(Cloud Controller)</td></tr>
</table>
<br>
<br>

</body>
</html>