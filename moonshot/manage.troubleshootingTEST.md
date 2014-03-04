---
layout: default
title: "HP Cloud OS for Moonshot Troubleshooting"
permalink: /cloudos/moonshot/manage/troubleshooting2/
product: moonshot

---


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- Look for passwords --> 

<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/utilities/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage/">&#9650; UP</a> | <a href="/cloudos/moonshot/manage/operational-dashboard">NEXT &#9654;</a> </p>

# HP Cloud OS for Moonshot Troubleshooting
HP Cloud OS for Moonshot is an OpenStack-based cloud platform to manage HP Moonshot servers. Different usage scenarios might lead to abnormal system behavior or known issues. This topic describes all the known issues that you might encounter. To help you troubleshoot these issues, we have provided possible resolutions.

For easy reference, we categorized the known issues and solutions as follows:

<ul>
<li>Operation Dashboard: Cloud Infrastructure Readiness
</li>
<li>Operation Dashboard: Cloud and Region
</li>
<li>Administration Dashboard: Moonshot Management</li>
<li>Administration Dashboard: Instance Provisioning &gt; Elemental</li>
<li>Administration Dashboard: Topology Designer</li>
<li>Administration Dashboard: Instance Provisioning &gt; Topology-based </li>
<li>Administration Dashboard: Workloads</li>
<li>Log/Configuration Files and Location</li>
</ul>

If you need further assistance, feel free to contact HP Customer Support.

## Operational Dashboard: Cloud Infrastructure Readiness
#### New node fails to PXE boot because of TFTP boot timeout error
<table>
<tr>
<td>Software Component</td>
<td>Operational Dashboard</td></tr>
<tr>
<td>System Behavior</td>
<td>Dashboard will not be able to list nodes which you created even after waiting for sufficient time (usually more than 5 minutes). Also, console of your virtual machine will display TFTP error messages.</td></tr>
<tr>
<td>Probable Cause</td>
<td>It occurs because of discrepancy between boot time of Admin node and failed node. &nbsp;</td></tr>
<tr>
<td>Possible Resolution</td>
<td>
The following action performed in order may resolve the issue:<br>
<br>
<ol>
<li>Login to Admin node and run the following commands:
<ol style="list-style-type:lower-latin;">
<li>sudo bluepill tftpd stop</li>
<li>sudo bluepill tftpd start</li></ol></li>
<li>PXE boot node</li></ol></td></tr>
</table>

#### Manage Nodes Panel shows the discovered cloud nodes in ‘Off’ state
<table>
<tr>
<td>Software Component</td>
<td>Operational Dashboard</td></tr>
<tr>
<td>System Behavior</td>
<td>Manage Nodes section of Cloud tab displays state of discovered node(s) in ‘Off’ state.</td></tr>
<tr>
<td>Probable Cause</td>
<td>Chef client’s status freeze causes UI to be stuck at ‘Off’ state</td></tr>
<tr>
<td>Possible Resolution</td>
<td>
Do the following:<br>
<ol>
<li>Ensure that you have chosen correct NIC interface and it is connected to public network</li>
<li>Re-apply the pre-requisites from Operational Dashboard.</li></ol>
For more information, check /var/log/cosmos/cosmos.log<br>
and /var/log/apache2/error.log logs (Admin Node).</td></tr>
</table>

#### Allocated node stuck at ‘installing/installed’ state for more than 10 minutes
<table>
<tr>
<td>Software Component</td>
<td>Operational Dashboard</td></tr>
<tr>
<td>System Behavior</td>
<td>Manage Nodes section of Cloud Tab displays state of allocated node in ‘Installing/Installed’ for unusually long period.</td></tr>
<tr>
<td>Probable Cause</td>
<td>Time synchronisation issues</td></tr>
<tr>
<td>Possible Resolution</td>
<td>Try resetting the node.</td></tr>
</table>

#### Updating the Internet Access Prerequisites fails sometimes
<table>
<tr>
<td>Software Component</td>
<td>Operational Dashboard</td></tr>
<tr>
<td>System Behavior</td>
<td>Dashboard displays message ‘Failed to complete the prerequisites’</td></tr>
<tr>
<td>Probable Cause</td>
<td>You might have selected wrong NIC interface, which does not exist or does not support internet connectivity.</td></tr>
<tr>
<td>Possible Resolution</td>
<td>
Do the following:<br>
<ol>
<li>Ensure that you have chosen correct NIC interface and it is connected to the public network.</li>
<li>Re-apply the pre-requisite from the Operational Dashboard.</li></ol>
<br>
Check the below log files(on Admin node) &nbsp;for more information /var/log/cosmos/cosmos.log<br>
/var/log/apache2/error.log</td></tr>
</table>

## Operational Dashboard: Cloud and Region
#### Installation/Configuration of Cloud Administrator node fails sometimes (“Complete Install” fails)
<table>
<tr>
<td>Software Component</td>
<td>Operational Dashboard</td></tr>
<tr>
<td>System Behavior</td>
<td>Install log will display error with specific details for the reason of failure.</td></tr>
<tr>
<td>Probable Cause</td>
<td>Installation of Cloud Administrator node involves installing various components like Chef, NTP etc which sometimes does not get well because of timing issues. </td></tr>
<tr>
<td>Possible Resolution</td>
<td>Re-create Admin Node and start fresh installation of cloud Administrator Node.</td></tr>
</table>

#### Create Cloud / Create Region fails
<table>
<tr>
<td>Software Component</td>
<td>Operational Dashboard</td></tr>
<tr>
<td>System Behavior</td>
<td>Dashboard shows status of cloud as “Failed” in Manage Clouds section of Cloud tab.</td></tr>
<tr>
<td>Probable Cause</td>
<td>Creation of cloud or region implicitly installs various cloud components in background via barclamps. Any failure of installation of barclamp will cause this behavior.</td></tr>
<tr>
<td>Possible Resolution</td>
<td>
Do the following:<br>
<br>
<ol>
<li>Change log level to info. To do so, edit /etc/chef/client.rb and change “log_level&nbsp;:error” to “log_level&nbsp;:info”. Do the same for all compute and controller nodes.</li>
<li>bluepill chef-client restart</li>
<li>In the server (admin node), &nbsp;edit /etc/chef/server.rb and change “log_level:error” to “log_level&nbsp;:info” and reboot </li>
<li>Go to the crowbar UI (https://&lt;Admin node IP&gt;:3000) and re-apply the barclamp(s) that has failed </li>
<li>Check /opt/dell/crowbar_framework/log/&lt;node&gt;.log as it may help in identifying the error. </li>
<li>Remove failed cloud or region and re-create.</li></ol>
<br>
Ensure the attributes like Network, Server Type selection are correct for the creation of Cloud or Region.</td></tr>
</table>

## Administration Dashboard: Moonshot Management

#### Internal server error from Skyline (Moonshot Management) with no additional information on exact error
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior</td>
<td>Dashboard displays message ‘HTTP 500 Internal Server Error’</td></tr>
<tr>
<td>Probable Cause</td>
<td>Apollo service unreachable or is busy in other tasks</td></tr>
<tr>
<td>Possible Resolution</td>
<td>
Check the following logs on controller node for exact detail<br>
<ol>
<li>/var/log/skyline/skyline.log</li>
<li>/var/log/apollo/apollo.log</li></ol></td></tr>
</table>

#### Not Authorized error from Skyline (Moonshot Management)
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior</td>
<td>Dashboard displays message ‘HTTP 401 Not Authorized’</td></tr>
<tr>
<td>Probable Cause</td>
<td>The user does not have the permission or the X-Auth token expired due to re-login with same credentials in another session</td></tr>
<tr>
<td>Possible Resolution</td>
<td>
Check the following logs on controller node for exact details<br>
<ol>
<li>/var/log/skyline/skyline.log</li>
<li>/var/log/apollo/apollo.log</li></ol>
If this is because of Auth token expiry then signout and re-login to Skyline to renew the token</td></tr>
</table>

#### Moonshot chassis discovery takes a long time or fails sometimes
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior/ Message</td>
<td>Dashboard shows chassis discovery always in progress</td></tr>
<tr>
<td>Probable Cause</td>
<td>Apollo service unreachable or Chassis is unreachable at the given IP address</td></tr>
<tr>
<td>Possible Resolution</td>
<td>Check /var/log/apollo/apollo.log on both controller and compute node for exact details </td></tr>
</table>

#### Chassis refresh status is shown as “Failed” in the Datacenter table view
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior/ Message</td>
<td>Icon view shows optimal status, table view shows refresh status as failed</td></tr>
<tr>
<td>Probable Cause</td>
<td>Chassis is unreachable</td></tr>
<tr>
<td>Possible Resolution</td>
<td>
<ol>
<li>Double click on the chassis and proceed to Single Chassis view and click on Force Refresh button at the top right corner of the chassis view frame</li>
<li>After the force refresh completes, return back to the Datacenter view to see the updated status</li></ol></td></tr>
</table>

#### If an existing chassis displays failed to connect message
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior/ Message</td>
<td>“Failed to connect to chassis”</td></tr>
<tr>
<td>Probable Cause</td>
<td>Password and other details may have changed</td></tr>
<tr>
<td>Possible Resolution</td>
<td>Edit Chassis details and provide correct information</td></tr>
</table>

#### Deleting chassis failed with a message stating unable to delete
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior/ Message</td>
<td>“Unable to delete, Cartridges not in maintenance mode/Active instances exist” or “Unable to delete, Chassis not in maintenance mode”</td></tr>
<tr>
<td>Probable Cause</td>
<td>
To successfully delete a chassis, it should be put in Maintenance Mode in the Single Chassis view and there should not be any active instance on the nodes in the chassis. <br>
<br>
The deletion of a chassis is also allowed when the chassis discovery fails when adding the &nbsp;chassis for the first time</td></tr>
<tr>
<td>Possible Resolution</td>
<td>Set the chassis to maintenance mode and retry delete. Ensure no active instances are running</td></tr>
</table>

#### After the single chassis view page loads, any immediate action throws internal server error
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior/ Message</td>
<td>HTTP 500 Internal Server Error</td></tr>
<tr>
<td>Probable Cause</td>
<td>Apollo service is busy in fetching event logs</td></tr>
<tr>
<td>Possible Resolution</td>
<td>Wait for a while, until the event logs have been fetched or stopped loading and then retry</td></tr>
</table>

#### Cartridge shows “Error” text on Single Chassis view image
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior/ Message</td>
<td>Error is displayed on cartridge instead of cartridge ID and corresponding table entry is empty</td></tr>
<tr>
<td>Probable Cause</td>
<td>Erroneous data from Moonshot Chassis Manager</td></tr>
<tr>
<td>Possible Resolution</td>
<td>
<ul>
<li>Wait for the discovery polling interval, or</li>
<li>Initiate a Force Refresh</li></ul></td></tr>
</table>

#### Single Chassis view has a greyed out image
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior/ Message</td>
<td>Single chassis view image is greyed out and no actions are possible</td></tr>
<tr>
<td>Probable Cause</td>
<td>Chassis is in the process of discovering cartridges or discovery has failed</td></tr>
<tr>
<td>Possible Resolution</td>
<td>
<ul>
<li>Wait for the discovery polling interval, or</li>
<li>Initiate a Force Refresh </li>
<li>If not resolved check the errors in /var/log/apollo.log</li></ul></td></tr>
</table>

#### The disk size of a node is always shown as a lesser value than the actual disk size on the node
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior/ Message</td>
<td>Disk size information is conflicting</td></tr>
<tr>
<td>Probable Cause</td>
<td>Since the disk size information is not available from the Moonshot Chassis, only the minimum disk size supported by the node in a cartridge is configured in &nbsp;HP Cloud OS for Moonshot</td></tr>
<tr>
<td>Possible Resolution</td>
<td>None</td></tr>
</table>

#### Error when setting a chassis in maintenance mode
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior/ Message</td>
<td>“Failed to update maintenance mode for one or more cartridges”</td></tr>
<tr>
<td>Probable Cause</td>
<td>Chassis unreachable or no nodes are registered</td></tr>
<tr>
<td>Possible Resolution</td>
<td>Ensure all the cartridges/nodes discovered by Apollo are registered to nova bm database</td></tr>
</table>

#### Failure in Chassis Deletion
<table>
<tr>
<td>Software Component</td>
<td>Chassis Deletion</td></tr>
<tr>
<td>System Behavior/ Message</td>
<td>“Unable to delete chassis”</td></tr>
<tr>
<td>Probable Cause</td>
<td>
Maintenance mode not set and active instances running are the obvious causes for failure in deletion of chassis. <br>
<br>
Apart from the above two, deletion could fail because Discovery thread is not running for the chassis. It might have stopped because of some other intervening process </td></tr>
<tr>
<td>Possible Resolution</td>
<td>Restart Apollo agent service and delete the chassis</td></tr>
</table>

#### Added chassis is invisible in the Datacenter view (IE, Firefox)
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior/ Message</td>
<td>Chassis for which discovery failed, does not show up in the Datacenter view with failed status</td></tr>
<tr>
<td>Probable Cause</td>
<td>Discovery of chassis failed</td></tr>
<tr>
<td>Possible Resolution</td>
<td>
<ol>
<li>Close the browser and open it again to see the chassis in Datacenter view</li></ol>
If option 1 does not work, please follow option 2.<br>
2. Please use Chrome to see the failed chassis in Datacenter view and use Edit option to re-discover it.</td></tr>
</table>

## Administration Dashboard: Instance Provisioning &#9658; Elemental

#### Provisioning fails when using custom flavors
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior/ Message</td>
<td>Nova-compute log errors out : “Given size (10240) exceeds max allowable size (0)”</td></tr>
<tr>
<td>Probable Cause</td>
<td>
Provisioning will fail when the root_mb in the flavor exactly matches the node’s disk size. There is a OpenStack community defect on this<br>
<a href="https://bugs.launchpad.net/nova/+bug/1171562">https://bugs.launchpad.net/nova/+bug/1171562</a></td></tr>
<tr>
<td>Possible Resolution</td>
<td>Make the root_mb size in the flavor less than the node’s disk size </td></tr>
</table>

#### While provision, error is displayed in nova-scheduler.log
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior/ Message</td>
<td>“Setting instance to Error state”</td></tr>
<tr>
<td>Probable Cause</td>
<td>A baremetal node matching the flavor specs is not present or node is set to maintenance mode</td></tr>
<tr>
<td>Possible Resolution</td>
<td>
<ol>
<li>Make sure the baremetal nodes are NOT set to maintenance mode.</li>
<li>Make sure that you have a baremetal node in backend matching the product_id mentioned in the flavor</li></ol></td></tr>
</table>

#### Unable to provision instances due to no DHCP server found
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior/ Message</td>
<td>Error in nova-compute log on the compute node: “no dhcp-server found”</td></tr>
<tr>
<td>Probable Cause</td>
<td>Quantum-dhcp –agent may not be running in the controller or the controller is not able to reach baremetal host via nova_flat network</td></tr>
<tr>
<td>Possible Resolution</td>
<td>
<ol>
<li>Verify that the flat network is in promiscuous mode.</li>
<li>Verify quantum-dhcp-agent is in running state in the controller node. </li>
<li>Verify the controller node is able to reach the baremetal host via the nova_flat network</li></ol></td></tr>
</table>

#### Nodes registered are shown in “nova baremetal-node-list” but not in “nova hypervisor-list” (provisioning will fail in this case)
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior/ Message</td>
<td>UI behavior shows instance in error state immediately after launch</td></tr>
<tr>
<td>Probable Cause</td>
<td>Nova-compute service may be down or there might be sync issues between nova-services</td></tr>
<tr>
<td>Possible Resolution</td>
<td>
<ol>
<li>Make sure that nova-compute is up by executing the following command on controller node “nova-manage service list”</li>
<li>If nova-compute shows as XXX, restart the nova-compute service on the baremetal host</li></ol></td></tr>
</table>

#### Instance de-provisioning fails with “Unable to establish IPMI v2 / RMCP+ session” error in nova-compute.log
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior/ Message</td>
<td>“Insufficient resources for session Error: Unable to establish IPMI v2 / RMCP+ session Unable to get Chassis Power Status”</td></tr>
<tr>
<td>Probable Cause</td>
<td>This is because the number of simultaneous IPMI sessions on the chassis that hosts the nodes selected for provisioning&nbsp; is exhausted</td></tr>
<tr>
<td>Possible Resolution</td>
<td>Clicking “delete topology” couple of times would be able to do the cleanup. If that does not work then the chassis should be reset using the chassis manager CLI “RESET CM”</td></tr>
</table>

#### Instance provisioning fails due to failed cartridge
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior/ Message</td>
<td>UI behavior shows instance in error state immediately after launch</td></tr>
<tr>
<td>Probable Cause</td>
<td>
The current “apollo” service design takes 30minutes to import the refreshed data into the HP Cloud OS Moonshot environment. <br>
<br>
Before the Cloud Administrator &nbsp;realizes about a failed cartridge, the scheduler might select the cartridge which is in failed state and this &nbsp;might lead to failure of the instance provisioning</td></tr>
<tr>
<td>Possible Resolution</td>
<td>
Cloud Admin should do a Force Refresh in Moonshot Chassis Management page before assigning a cartridge for provisioning, get the failed cartridge list and then put them into the maintenance mode. <br>
<br>
The nova-scheduler does not select a cartridge which is in maintenance mode</td></tr>
</table>

#### User cannot connect to instance via SSH even if instance is active and is in running state
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior/ Message</td>
<td>“ssh: connect to host &lt;IP Addres&gt; port 22: No route to host”</td></tr>
<tr>
<td>Probable Cause</td>
<td>The instance’s networking is not completely configured after boot</td></tr>
<tr>
<td>Possible Resolution</td>
<td>Wait for a few minutes and retry</td></tr>
</table>

#### Unable to ping or SSH to an instance
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior</td>
<td>Request times out</td></tr>
<tr>
<td>Probable Cause</td>
<td>Network issues may prevent access to cloud instances or there can be a routing problem</td></tr>
<tr>
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
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior/ Message</td>
<td>“Error” status reported in “Instances” page immediately after launching the instance</td></tr>
<tr>
<td>Probable Cause</td>
<td>Insufficient quota limits – CPU, instances or RAM</td></tr>
<tr>
<td>Possible Resolution</td>
<td>Check the Projects tab -&gt; Overview page, if any of the dialog shows indication of insufficient quota, change the quota values as desired &nbsp;from Cloud Tab -&gt; Projects -&gt; Modify Limits option and retry provisioning.</td></tr>
</table>

#### Instance is in spawning state for a long time
<table>
<tr>
<td>Software Component</td>
<td>Operational Dashboard</td></tr>
<tr>
<td>System Behavior/ Message</td>
<td>“Status” on “Instances” page will continue to be in “Spawning/Error” and does not change to “Active”</td></tr>
<tr>
<td>Probable Cause</td>
<td>Network connectivity issues, Instance reboot fails due to some issues with the image etc.</td></tr>
<tr>
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
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior/ Message</td>
<td>Message N/A. Dashboard shows instance deletion in progress always</td></tr>
<tr>
<td>Probable Cause</td>
<td>When instance is terminated in spawning state, terminate request is orphaned and instance status is hung at deletion.</td></tr>
<tr>
<td>Possible Resolution</td>
<td>
<ol>
<li>Stop the nova services running in Baremetal Host and delete the instance, or</li>
<li>Restart nova-compute in compute node and refresh skyline</li></ol></td></tr>
</table>

#### Unable to access Shell in a box
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior/ Message</td>
<td>“Web Page Cannot be Found” message in browser</td></tr>
<tr>
<td>Probable Cause</td>
<td>System where the Administration Dashboard is running may not be in the Admin network</td></tr>
<tr>
<td>Possible Resolution</td>
<td>Ensure that the connectivity to the Admin network and the server name for the interface are pointing to the admin node</td></tr>
</table>

#### Unable to view Shell in a box, shows warning screen or grey screen
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior/ Message</td>
<td>Message - “Unable to load the console” or grey screen</td></tr>
<tr>
<td>Probable Cause</td>
<td>SSL verification exceptions during first time access of shell in a box console</td></tr>
<tr>
<td>Possible Resolution</td>
<td>Open the &nbsp;link ‘Click to view only console’ in a New Tab and allow the necessary SSL verification exceptions and refresh Skyline</td></tr>
</table>

## Administration Dashboard: Topology Designer

#### Unable to view topology designer, shows certificate warning screen or grey screen
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior/ Message</td>
<td>The browser shows SSL verification screen or grey screen</td></tr>
<tr>
<td>Probable Cause</td>
<td>SSL verification exceptions during the first access of the topology designer UI</td></tr>
<tr>
<td>Possible Resolution</td>
<td>
In Mozilla Firefox, right click on the warning screen section and select <br>
This Frame -&gt; Open Frame in New Tab and allow the necessary SSL verification exceptions and refresh Administration Dashboard<br>
<br>
For Internet Explorer, go to url:<br>
https://&lt;controller-node-public-ip&gt;:21081/<br>
Accept the SSL warning and proceed. The page will show “Web page cannot be found” screen. Enter the skyline IP in the same browser tab and Topology Designer will now load within the Administration Dashboard</td></tr>
</table>

#### Designer does not list the resource pool when cloud profile is other than ‘HP Cloud OS Grizzly Baremetal’
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior/ Message</td>
<td>Topology designer UI does not list all the resource pools that exists</td></tr>
<tr>
<td>Probable Cause</td>
<td>Resource pools that are not displayed might have been created with the profile other than those specific for HP Cloud OS for Moonshot</td></tr>
<tr>
<td>Possible Resolution</td>
<td>Make sure the required resource pool has ‘HP Cloud OS Grizzly Baremetal’ as it’s cloud profile</td></tr>
</table>

## Administration Dashboard: Instance Provisioning &#9658; Topology-based

#### Skyline Running Topologies reports internal server error
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior/ Message</td>
<td>Skyline error message “Internal server error”</td></tr>
<tr>
<td>Probable Cause</td>
<td>Timeout issues between eve and other services or wrong HTTP Proxy Settings (non-proxy hosts) is configured</td></tr>
<tr>
<td>Possible Resolution</td>
<td>Ensure that the non-proxy host 127.* is set in Prerequisites page of Operational Dashboard. Once “Complete Install” is done, the user cannot update prerequisites. Hence, if not set correctly the user will have to re-apply the hp-cos-eve-barclamp with 127.* in non-proxy hosts.</td></tr>
</table>

## Administration Dashboard: Workloads

#### Download of workload from Skyline’s Updates and Extension panel fails
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior</td>
<td>Dashboard displays message ‘Unable to connect to server’</td></tr>
<tr>
<td>Probable Cause</td>
<td>CODN can only handle certain number of download activities simultaneously. </td></tr>
<tr>
<td>Possible Resolution</td>
<td>Wait for some time and retry. For details, check log file at /var/log/codn/codn.log on controller node.</td></tr>
</table>

#### Publishing workload from Updates and Extension panel does not show up in workload dashboard
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior</td>
<td>Newly added workload is not visible in dashboard</td></tr>
<tr>
<td>Probable Cause</td>
<td>CODN fails to upload one of the components (i.e. image or topology etc) in cloud.</td></tr>
<tr>
<td>Possible Resolution</td>
<td>
Check the CODN log located at /var/log/codn/codn.log on controller node. <br>
<br>
If CODN fails to upload a component because a component with the same name ALREADY exists then check manifest file in the respective workload folder under /var/cache/codn/import on the controller node. Specifically, check whether duplicate policy (check_for_duplicates property) for the component is configured as desired. Set this attribute to “false” to allow duplicates.<br>
<br></td></tr>
</table>

#### Launching CCUE designer shows gray screen or throws warning
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior</td>
<td>Dashboard shows gray screen or warning</td></tr>
<tr>
<td>Probable Cause</td>
<td>SSL verification exceptions during the first time access of the designer UI</td></tr>
<tr>
<td>Possible Resolution</td>
<td>
In Mozilla Firefox, right click on the warning screen section and select <br>
This Frame -&gt; Open Frame in New Tab and allow the necessary SSL verification exceptions and refresh Administration Dashboard<br>
<br>
For Internet Explorer, go to url:<br>
https://&lt;controller-node-public-ip&gt;:21081/<br>
Accept the SSL warning and proceed. The page will show “Web page cannot be found” screen. Enter the skyline IP in the same browser tab and Topology designer will now load within the Administration Dashboard</td></tr>
</table>

#### Launch profile fails
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior</td>
<td>Dashboard displays a message ‘Failed to launch Profile’</td></tr>
<tr>
<td>Probable Cause</td>
<td>eve is not configured with correct proxy setting</td></tr>
<tr>
<td>Possible Resolution</td>
<td>Ensure that the non-proxy host 127.* is set in Prerequisites page of Operational Dashboard. Once “Complete Install” is done, the user cannot update prerequisites. Hence, if not set correctly the user will have to re-apply the hp-cos-eve-barclamp with 127.* in non-proxy hosts.</td></tr>
</table>

#### Creation of profile does not pick nova flavor for a given server in CCUE designer
<table>
<tr>
<td>Software Component</td>
<td>Administration Dashboard</td></tr>
<tr>
<td>System Behavior</td>
<td>Property editor of server element in CCUE designer does not pick any flavor automatically.</td></tr>
<tr>
<td>Probable Cause</td>
<td>
It can happen if there is no auto-flavor created in system which meets server requirement of specified workload. <br>
e.g., If you import a workload that’s not supported by the cartridges present in the cloud.<br>
<br></td></tr>
<tr>
<td>Possible Resolution</td>
<td>
Check support matrix as well as HP Moonshot server requirements of your workload. If your cloud has appropriate Moonshot server (i.e. cartridges) then check Apollo log /var/log/apollo/apollo.log on controller node.<br>
<br></td></tr>
</table>

## Log/Configuration Files and Location
<table>
<tr>
<td>Topic</td>
<td>Log configuration</td>
<td>Log file location</td></tr>
<tr>
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
<tr>
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
<tr>
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
<tr>
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
<tr>
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
<tr>
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
<tr>
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
<tr>
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
<tr>
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
<div id="FOOTER">
<p>Page |  </p>
<p>© Copyright  Hewlett-Packard Development Company&nbsp;&nbsp;&nbsp;&nbsp;</p>
</div>
</body>
</html>