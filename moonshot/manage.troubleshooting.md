---
layout: default
title: "HP Cloud OS for Moonshot Troubleshooting"
permalink: /cloudos/moonshot/manage/troubleshooting/
product: moonshot

---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/utilities/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage/">&#9650; UP</a> | <a href="/cloudos/moonshot/manage/operational-dashboard">NEXT &#9654;</a> </p>

# HP Cloud OS for Moonshot troubleshooting

HP Cloud OS for Moonshot is an OpenStack-based cloud platform to manage HP Moonshot servers. Different usage scenarios might lead to abnormal system behavior or known issues. This topic describes all the known issues that you might encounter. To help you troubleshoot these issues, we have provided possible resolutions.

For easy reference, we categorized the known issues and solutions as follows:

* [Operation Dashboard: Cloud infrastructure readiness](#opdash-cloud-ready)

* [Operation Dashboard: Cloud and region](#opdash-cloud-region)

* [Administration Dashboard: Moonshot management](#admindash-moon-manage)

* [Administration Dashboard: Instance provisioning &gt; elemental](#admindash-instance-element)

* [Administration Dashboard: Topology Designer](#admindash-topology)

* [Administration Dashboard: Instance provisioning &gt; topology-based](#admindash-instance-topology)

* [Administration Dashboard: Workloads](#admindash-workloads)

* [Log/configuration files and location](#log-config-files)

If you need further assistance, contact [HP Customer Support](https://www.hpcloud.com/contact_us).

## Operational Dashboard: Cloud infrastructure readiness {#opdash-cloud-ready}

#### New node fails to PXE boot because of TFTP boot timeout error

<table style="text-align: left; vertical-align: top; min-width: 700px;">
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

#### Discovered nodes shown as 'Off' in Manage Nodes section

<table style="text-align: left; vertical-align: top; min-width: 700px;">
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
<li>Restart the node.</li></ol>
For more information, check the <b>/var/log/cosmos/cosmos.log</b> and <b>/var/log/apache2/error.log</b> files on the Admin Node.</td></tr>
</table>

#### Allocated node stuck at 'Installing/Installed' state for more than 10 minutes

<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Operational Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Manage Nodes section of the Cloud tab displays the state of the allocated node as 'Installing/Installed' for  an unusually long period of time.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Time synchronization issues.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>Reset the node.</td></tr>
</table>

#### Updating the internet access prerequisites sometimes fails

<table style="text-align: left; vertical-align: top; min-width: 700px;">
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

#### Launch Dashboard fails

<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Operational Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Dashboard fails to launch</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>The browser does not have correct proxy exceptions or there are no proxy exceptions set.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>Ensure your browser has the following set as proxy exceptions:
<pre>10.*
192.*
127.0*
localhost
</pre></td></tr>
</table>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Operational Dashboard: Cloud and Region {#opdash-cloud-region}

#### Installation/configuration of the Admin node sometimes fails

<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Operational Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>After completing the Complete Install steps, the Admin node installation fails and the install log displays an error containing the specific details as to why the failure occurred.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>There can be timing issues when installing the Admin node because the process involves installing various components like Chef, NTP, etc. </td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>Recreate the Admin node restart the installation process.</td></tr>
</table>

#### Create cloud or create region fails

<table style="text-align: left; vertical-align: top; min-width: 700px;">
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
<li>Change log level to <b>info</b> for all Baremetal hosts and Controller nodes. To do so, edit <b>/etc/chef/client.rb</b> and change <code>log_level:error</code> to <code>log_level:info</code>.</li>
<li>Run <code>bluepill chef-client restart</code>.</li>
<li>In the admin node, edit <b>/etc/chef/server.rb</b> and change <code>log_level:error</code> to <code>log_level:info</code> and reboot the server.</li>
<li>Go to the crowbar UI (https://&lt;Admin node IP&gt;:3000) and re-apply the barclamp(s) that failed.</li>
<li>Check the <b>/opt/dell/crowbar_framework/log/&lt;node&gt;.log</b> as it might help identify the error. </li>
<li>Remove failed cloud or region and re-create.</li></ol>

<b>Note:</b> Ensure the attributes like Network and Server Type selection are correct for the creation of Cloud or Region.</td></tr>
</table>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Administration Dashboard: Moonshot Management {#admindash-moon-manage}

#### Internal server error from Moonshot Management with no additional information on exact error
<table style="text-align: left; vertical-align: top; min-width: 700px;">
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

#### "Not Authorized" error message from Moonshot Management

<table style="text-align: left; vertical-align: top; min-width: 700px;">
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
If this is because the X-Auth token expired, then sign out and log in again to the Administration Dashboard to renew the token.</td></tr>
</table>

#### Moonshot chassis discovery takes a long time or sometimes fails

<table style="text-align: left; vertical-align: top; min-width: 700px;">
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
<td>Check <b>/var/log/apollo/apollo.log</b> on both the Controller nodes and Baremetal hosts for exact details.</td></tr>
</table>

#### Chassis refresh status is shown as "Failed" in the Datacenter table view

<table style="text-align: left; vertical-align: top; min-width: 700px;">
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

<table style="text-align: left; vertical-align: top; min-width: 700px;">
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

<table style="text-align: left; vertical-align: top; min-width: 700px;">
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

<table style="text-align: left; vertical-align: top; min-width: 700px;">
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

<table style="text-align: left; vertical-align: top; min-width: 700px;">
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

<table style="text-align: left; vertical-align: top; min-width: 700px;">
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

<table style="text-align: left; vertical-align: top; min-width: 700px;">
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

<table style="text-align: left; vertical-align: top; min-width: 700px;">
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

<table style="text-align: left; vertical-align: top; min-width: 700px;">
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

<table style="text-align: left; vertical-align: top; min-width: 700px;">
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

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Administration Dashboard: Instance Provisioning &#9658; Elemental {#admindash-instance-element}

#### Provisioning fails when using custom flavors

<table style="text-align: left; vertical-align: top; min-width: 700px;">
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

<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>nova-scheduler.log displays an error message: <b>Setting instance to Error state</b>.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>There is no Baremetal host that matches the flavor specifications or a Baremetal host is set to maintenance mode.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
<ul>
<li>Ensure the Baremetal hosts are <b>NOT</b> set to maintenance mode.</li>
<li>Make sure you have a Baremetal host in the backend matching the product_id mentioned in the flavor.</li></ul></td></tr>
</table>

#### Unable to provision instances due to no DHCP server found

<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Error message displayed in nova-compute log on the Baremetal host: <b>No dhcp-server found</b>.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>The quantum-dhcp-agent might not be running in the Controller node or the Controller node is not able to reach the Baremetal host using the nova_flat network.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
<ol>
<li>Verify that the flat network is in promiscuous mode.</li>
<li>Verify that the quantum-dhcp-agent is running in the Controller node. </li>
<li>Verify the Controller node is able to reach the Baremetal host using the nova_flat network.</li></ol></td></tr>
</table>

#### Provisioning fails because nodes registered are shown in "nova baremetal-node-list" but not in "nova hypervisor-list"

<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>The UI shows an instance in an error state immediately after launching.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>nova-compute service might be down or there might be sync issues between nova services.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
<ol>
<li>Make sure that nova-compute is running using the following command on the Controller node:
<pre>nova-manage service list</pre>
<li>If nova-compute shows as <b>XXX</b>, restart the nova-compute service on the Baremetal host.</li></ol></td></tr>
</table>

#### Instance de-provisioning fails with error in nova-compute.log

<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>De-provisioning fails and nova-compute.log captures this error message: <b>Insufficient resources for session Error: Unable to establish IPMI v2 / RMCP+ session Unable to get Chassis Power Status</b>.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>The number of simultaneous IPMI sessions on the chassis that hosts the nodes selected for provisioning are exhausted.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>Clicking <b>delete topology</b> a few times will clean up the locked sessions. If that does not work, then the chassis should be reset using the <code>RESET CM</code> command with the chassis manager CLI.</td></tr>
</table>

#### Instance provisioning fails due to failed cartridge

<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>The UI shows an instance in an error state immediately after launching.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>
The current apollo service design takes 30 minutes to import the refreshed data into the HP Cloud OS for Moonshot environment. Before the Cloud Administrator realizes there is a failed cartridge, the scheduler might select the cartridge which is in a failed state, which could cause the instance provisioning to fail.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
<ol><li>The Cloud Administrator should force a refresh from the Moonshot Chassis Management page before assigning a cartridge for provisioning.</li>
<li>Then, put any failed cartridges into maintenance mode since the nova-scheduler will not select a cartridge that is in this mode.</li></ol></td></tr>
</table>

#### User cannot connect to instance via SSH even if instance is active and is in running state

<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Trying to connect to an active, running instance using SSH results in an error message: <b>ssh: connect to host &lt;IP Address&gt; port 22: No route to host</b>.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>The instance's networking is not completely configured after booting.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>Wait for a few minutes and try to connect again.</td></tr>
</table>

#### Unable to ping or SSH to an instance

<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Request times out when trying to ping or SSH to an instance.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Network issues might prevent access to cloud instances or there can be a routing problem.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
<ol>
<li>Check to see if the Baremetal instances can forward packets from the public interface to the bridged interface.</li>
<pre>sysctl -A | grep ip_forward</pre>
<p><code>net.ipv4.ip_forward</code> should be set to <b>1</b>.</p>
<li>Ensure you can communicate with the OpenStack Baremetal hosts from the client, and that any routing to these instances have the correct entries.</li></ol></td></tr>
</table>

#### Provisioning fails with an "Error" status in the Instances page

<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>An <b>Error</b> status is reported in the Instances page immediately after launching the instance.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Insufficient quota limits are set for the CPU, instances or RAM.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td><ol><li>In the Projects tab &gt; Overview page, look for any indication of insufficient quotas.</li>
<li>Change the quota values using the Cloud tab &gt; Projects &gt; Modify Limits option.</li>
<li>Retry provisioning.</li></ol></td></tr>
</table>

#### Instance is in spawning state for a long time

<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: white; color: black;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Operational Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>The instance's status on the Instances page stays in <b>Spawning/Error</b> and does not change to <b>Active</b>.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Network connectivity issues or the instance reboot fails due to some issues with the image, etc.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
<ol>
<li>Ensure the Baremetal host has sufficient resources to launch and is registered with the nova baremetal-node-list.</li>
<li>Check the /var/log/nova/nova-compute.log on the Baremetal host for cause of failure.</li>
<li>Ensure the following specifications are there because they are necessary for provisioning:</li>
<ul>
<li>2013-10-18 18:17:09,225.225 4466 INFO nova.compute.manager [-] Updating bandwidth usage cache</li>
<li>2013-10-18 18:22:52,753.753 4466 AUDIT nova.compute.resource_tracker [-] Auditing locally available Baremetal resources</li>
<li>2013-10-18 18:22:52,787.787 4466 AUDIT nova.compute.resource_tracker [-] Free ram (MB): 2048</li>
<li>2013-10-18 18:22:52,787.787 4466 AUDIT nova.compute.resource_tracker [-] Free disk (GB): 10</li>
<li>2013-10-18 18:22:52,787.787 4466 AUDIT nova.compute.resource_tracker [-] Free VCPUS: 1</li></ul>
<li>
If a <b>No valid host found</b> error occurs while provisioning, ensure that the Baremetal host is registered correctly by nova baremetal-node-list.</li></ol></td></tr>
</table>

#### De-provisioning leads to deleting state but does not delete the instance

<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>When de-provisioning, the Admin Dashboard shows instance deletion in progress, continually, and does not display an error message.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>When an instance is terminated in the spawning state, the terminate request is orphaned and the instance status is hung at deletion.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
<ol>
<li>Stop the nova services running in the Baremetal host and delete the instance, or</li>
<li>Restart nova-compute in the Baremetal host.</li>
<li>Refresh the Administration Dashboard.</li></ol></td></tr>
</table>

#### Unable to access shellinabox

<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>When accessing shellinabox, the <b>Web Page Cannot be Found</b> error message displays in the browser.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>The system where the Admin Dashboard is running might not be in the Admin network.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>Ensure that the connectivity to the Admin network and the server name for the interface are pointing to the Admin node.</td></tr>
</table>

#### Unable to view shellinabox and warning screen or grey screen displays

<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>When viewing shellinabox, the <b>Unable to load the console</b> error message displays or screen turns grey.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>SSL verification exceptions during the first time you access shellinabox console.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
<ol>
<li>Open the link <b>Click to view only console in a New Tab</b>.</li>
<li>Allow the necessary SSL verification exceptions.</li>
<li>Refresh the Administration Dashboard.</li></ol></td></tr>
</table>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Administration Dashboard: Topology Designer {#admindash-topology}

#### Unable to view Topology Designer and SSL verification or grey screen displays

<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>When viewing Topology Designer, the browser displays an SSL verification or a grey screen.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>SSL verification exceptions during the first time you access Topology Designer UI.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
In Mozilla Firefox:
<ol>
<li>Right-click the SSL verification screen and select <b>This Frame &gt; Open Frame in New Tab</b>.</li>
<li>Allow the necessary SSL verification exceptions.</li>
<li>Refresh the Administration Dashboard</li>
</ol>
For Internet Explorer:
<ol>
<li>Navigate to <b>https://&lt;controller-node-public-ip&gt;:21081/</b>.</li>
<li>Accept the SSL warning and proceed. The page that loads displays <b>Web page cannot be found</b>.</li>
 <li>Enter the Administration Dashboard IP in the same tab. Topology Designer now loads within the Administration Dashboard.</li></ol></td></tr>
</table>

#### Topology Designer does not list the resource pool unless cloud profile is "HP Cloud OS Grizzly Baremetal"

<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Topology Designer does not list all the resource pools that exist.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Resource pools that are not displayed might have been created with a profile other than those specific for HP Cloud OS for Moonshot.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>Make sure the required resource pools have <b>HP Cloud OS Grizzly Baremetal</b> as their cloud profile.</td></tr>
</table>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Administration Dashboard: Instance Provisioning &#9658; Topology-based {#admindash-instance-topology}

#### Running Topologies reports internal server error

<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Using Administration Dashboard to run topology reports results in <b>Internal server error</b> error message.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Timeout issues between eve and other services or wrong HTTP Proxy Settings (non-proxy hosts) are configured.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>Ensure that the non-proxy host 127.* is set in the Prerequisites page of the Operational Dashboard.
<p><b>Note:</b> Once the <b>Complete Install</b> steps are completed, you cannot update the prerequisites. So, if the settings are incorrect, you must reapply the hp-cos-eve-barclamp with 127.* in the non-proxy hosts.</p></td></tr>
</table>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Administration Dashboard: Workloads {#admindash-workloads}

#### Downloading workload from Updates and Extension panel fails

<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>When using Updates and Extensions to download a workload, the Dashboard displays <b>Unable to connect to server</b> error message.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Cloud OS Distribution Network (CODN) can only handle a certain number of download activities simultaneously. </td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>Wait for awhile and retry the download. For details, check the log file <b>/var/log/codn/codn.log</b> on the Controller node.</td></tr>
</table>

#### Publishing workload from Updates and Extension panel does not show up in dashboard

<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>When using Updates and Extensions to publish a workload, the newly-added workload is not visible in the dashboard.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>CODN fails to upload one of the components, such as image or topology,  in the cloud.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
Check the CODN log file <b>/var/log/codn/codn.log</b> on the Controller node.
<p>
If CODN fails to upload a component because a component with the same name ALREADY exists, then check the manifest file in the respective workload folder under <b>/var/cache/codn/import</b> on the Controller node. Specifically, check whether the <code>check_for_duplicates</code> property for the component is configured as it should be. Set this attribute to <b>false</b> to allow duplicates.</p>
</td></tr>
</table>

#### Launching Topology Designer shows grey screen or throws warning

<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Dashboard shows grey screen or warning</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>SSL verification exceptions during the first time access of the designer UI</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>

<ol>
<li>Right-click the SSL verification screen and select <b>This Frame &gt; Open Frame in New Tab</b>.</li>
<li>Allow the necessary SSL verification exceptions.</li>
<li>Refresh the Administration Dashboard</li>
</ol>
For Internet Explorer:
<ol>
<li>Navigate to <b>https://&lt;controller-node-public-ip&gt;:21081/</b>.</li>
<li>Accept the SSL warning and proceed. The page that loads displays <b>Web page cannot be found</b>.</li>
 <li>Enter the Administration Dashboard IP in the same tab. Topology Designer now loads within the Administration Dashboard.</li></ol>
</td></tr>
</table>

#### Launch profile fails with error message

<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>When launching a profile, the dashboard displays <b>Failed to launch Profile</b> error message.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>eve is not configured with correct proxy setting</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
Ensure that the non-proxy host 127.* is set in the Prerequisites page of the Operational Dashboard.
<p><b>Note:</b> Once the <b>Complete Install</b> steps are completed, you cannot update the prerequisites. So, if the settings are incorrect, you must reapply the hp-cos-eve-barclamp with 127.* in the non-proxy hosts.</p>
</td></tr>
</table>

#### Creation of profile does not pick nova flavor for a given server in CCUE designer

<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Administration Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>The Property editor of the server element in CCUE designer does not pick any flavor automatically.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>
This can happen if there is no auto-flavor created in system which meets  the server requirement of specified workload. For example, if you import a workload that is not supported by the cartridges present in the cloud.</td></tr>
<tr style="background-color: white; color: black;">
<td>Possible Resolution</td>
<td>
Check the <a xref="">Support Matrix</a> as well as the HP Cloud OS for Moonshot server requirements of your workload. If your cloud has the appropriate Moonshot server (i.e. cartridges), then check the Apollo log <b>/var/log/apollo/apollo.log</b> on Controller node.<br>
<br></td></tr>
</table>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Log/Configuration Files and Location {#log-config-files}

<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th><span style='display:block; width:180px;'>Topic</span></th>
<th>Log configuration</th>
<th>Log file location</th></tr>
<tr style="background-color: white; color: black;">
<td>Workload content download &amp; publish (Administration Dashboard &gt; Update and Extensions)</td>
<td>
/etc/codn/codn.log (Controller node)<br /><br />

To configure the log level, change the INFO to one of allowed values of DEBUG, ERROR, WARNING and CRITICAL:

<pre>logging = {
 &nbsp; &nbsp;'loggers': {
 &nbsp; &nbsp; &nbsp; &nbsp;'root': {'level': 'INFO', 'handlers': ['console']},
 &nbsp; &nbsp; &nbsp; &nbsp;'codn': {'level': 'INFO', 'handlers': ['file']},
 &nbsp; &nbsp; ….</pre></td>
<td>
/var/log/codn/codn.log (Controller node)</td></tr>

<tr style="background-color: white; color: black;">
<td>
Workload service (Administration Dashboard &gt; Provisioning &gt; Workload</td>
<td>
/etc/skyline/platform_settings.py (Controller node)<br /><br />

To configure the log level, change the INFO to one of allowed values defined in LOG_LEVELS in the same file:

<pre>LOGGING = {
…. &nbsp; 
 &nbsp; &nbsp; &nbsp; &nbsp;'cloudos_file': {
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'level': 'INFO',
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'class': 'logging.handlers.RotatingFileHandler',
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'filename': '/var/log/skyline/skyline.log',
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'</pre></td>
<td>
/var/log/skyline/skyline.log (Controller node)</td></tr>

<tr style="background-color: white; color: black;">
<td>Provision (Eve)</td>
<td>
 /etc/eve-api/eve.yml and /etc/eve-requestworker/eve.yml (Controller node)<br /><br />
<br>
To configure the log level, change the INFO to one of allowed values defined as follows:
<pre>
logging:
 &nbsp; &nbsp;# The default level of all loggers. Can be OFF, ERROR, WARN, INFO, DEBUG, TRACE, or ALL.
 &nbsp; &nbsp;level: INFO</pre></td>
<td>
/var/log/eve-api/eve-api.log and /var/log/eve-requestworker/eve-requestworker.log (Controller node)</td></tr>

<tr style="background-color: white; color: black;">
<td>Resource pool &amp; Flavor selection (Graffiti)</td>
<td>
/etc/graffiti-api/graffiti-api.yml (Controller node)<br /><br />
To configure the log level, change the INFO to one of allowed values defined as follows:
<pre>
logging:
 &nbsp; &nbsp;# The default level of all loggers. Can be OFF, ERROR, WARN, INFO, DEBUG, TRACE, or ALL.
 &nbsp; &nbsp;level: INFO
</pre></td>
<td>
/var/log/graffiti-api/graffiti-api.log (Controller node)</td></tr>

<tr style="background-color: white; color: black;">
<td>Workload Deployment profile guide and Deployment profile persistence (Focus)</td>
<td>
/etc/focus-api/focus.yml (Controller node)<br /><br />

To configure the log level, change the INFO to one of allowed values defined as follows:
<pre>
logging:
 &nbsp; &nbsp;# The default level of all loggers. Can be OFF, ERROR, WARN, INFO, DEBUG, TRACE, or ALL.
 &nbsp; &nbsp;level: INFO</pre></td>
<td>
/var/log/focus-api/focus-api.log (Controller node)</td></tr>

<tr style="background-color: white; color: black;">
<td>Moonshot Management and Automatic default Flavor creation (Apollo)</td>
<td>
/etc/apollo/logging.conf (Baremetal host)<br /><br />

To configure the log level, change the INFO to one of allowed values of DEBUG, ERROR, WARNING and CRITICAL:
<pre>
[logger_root]
level = INFO
handlers = discoveryfile
</pre></td>
<td>
/var/log/apollo/apollo.log (Baremetal host)</td></tr>

<tr style="background-color: white; color: black;">
<td>Moonshot capability publish (nova-compute)</td>
<td>
/etc/nova/logging.conf (Baremetal host)<br /><br />
To configure the log level, change the INFO to one of allowed values of DEBUG, ERROR, WARNING and CRITICAL:
<pre>
[logger_root]
level = INFO
…</pre>
<b>Note: </b>Update the same log level for the other loggers in this file. (Loggers starts with <code>[logger_xxx]</code>.)
In /etc/nova/nova.conf, under DEFAULT section, add following line:
<pre>debug=True</pre>
</td>
<td>
/var/log/nova/nova-scheduler.log and /var/log/nova/nova-compute.log (Baremetal host)</td></tr>

<tr style="background-color: white; color: black;">
<td>Image (glance)</td>
<td>
/etc/glance/glance-api.conf (Controller node)<br /><br />

Under DEFAULT section, set following line:
<pre>debug=True</pre>

<b>Note:</b> Follow the same procedure for other glance modules as well. The log location will vary accordingly.</td>
<td>
/var/log/glance/api.log (Controller node)</td></tr>

<tr style="background-color: white; color: black;">
<td>Network (Quantum)</td>
<td>
/etc/quantum/quantum.conf (Controller node)
<br /><br />

Under DEFAULT section, set following line:
<pre>debug=True</pre>
</td>
<td>
/var/log/quantum/server.log (Controller node)</td></tr>
</table>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

<!-- do not put html file closing tags like /body and /html in a Markdown file - not necessary. --> 
