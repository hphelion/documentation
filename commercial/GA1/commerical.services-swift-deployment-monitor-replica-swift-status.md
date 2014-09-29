---
layout: default
title: "HP Helion OpenStack&#174; Monitor-Replica Status"
permalink: /helion/openstack/ga/services/object/swift/replica-status/
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
<p style="font-size: small;"> <a href="/helion/openstack/ga/services/object/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href=" /helion/openstack/ga/services/swift/deployment/"> NEXT &#9654</a> </p>-->


# Replication Status using Icinga

Using the "icinga" service running in the Undercloud the cloud admin can monitor the replication status of Swift. 

##Prerequisite

1. HP Helion OpenStack&#174; cloud is successfully deployed.
2. Starter Swift nodes are functional by default as they are part of cloud deployment.
3. Icinga service is active and running in the Undercloud.


##Monitoring Swift Replication Status
Perform the following steps to monitor the replication status:

1. In the Undercloud, log in to Icinga Dashboard <http://<**Undercloud_IP**>/icinga/>. The default login credentials are as follows:
	* Username- icingaadmin
	* Password- icingaadmin 


2.Click **Status** on the left panel and then click **Host Detail**. 

<img src="media/icinga_host-details.png/">

3.In the Host column, click the icon next to the host IP (with tooltip that shows View service details for this host) of the Swift storage node that you want to monitor.  

<img src="media/swift_icinga_view-details.png"/>


The page navigates to Service Status Details For Host &lt;Swift node IP address &gt;  

<img src="media/swift_icinga-replication-status.png"/>

Now, you can view the replication status of the selected Swift node.

Refer the following table for the status and message details.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th>Status</th>
	<th><center>Message</center></th>
    <th><center>Cause/Resolution</center></th>
</tr>
<tr style="background-color: white; color: black;">
	<td>OK</td>
	<td>Ok</td>
    <td></td>
</tr>
<tr style="background-color: white; color: black;">
	<td>WARNING </td>
	<td>Replication not progressing</td>
    <td>An account, container or object replicator process has not finished a complete scan recently(elapsed time exceeded the threshold defined) . Examine the account-replicator, container-replicator and object-replicator logs to see which process is "stuck". Usually, restarting the relevant process resolves the issue.</td>
</tr>
</tr>
<tr style="background-color: white; color: black;">
	<td>FAIL </td>
	<td>Replication never completed</td>
    <td> The named replication process has never run on this node. Check that the replicator has been configured and started. Examine the log files to see if the replicator process has reported problems.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>UNKNOWN</td>
	<td>No Applicable</td>
    <td></td></tr>
</table>


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

 




