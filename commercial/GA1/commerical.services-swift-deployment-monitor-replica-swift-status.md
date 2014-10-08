---
layout: default
title: "HP Helion OpenStack&#174; Monitor-Replica Status"
permalink: /helion/openstack/services/object/swift/replica-status/
product: commercial.ga

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/openstack/services/object/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href=" /helion/openstack/services/swift/deployment/"> NEXT &#9654</a> </p>-->


# HP Helion OpenStack&#174;: Monitor Node Replication Status using Icinga

Cloud admins can use the ***icinga*** service running in the undercloud to monitor the replication status of nodes within the Swift deployment. 

##Prerequisites

* HP Helion OpenStack&#174; cloud is successfully deployed.<br>*(Starter Swift nodes are functional by default as they are part of cloud deployment.)*
* The Icinga service is active and running in the Undercloud.


##Monitoring Swift Replication Status
Perform the following steps to monitor the replication status:

1. In the Undercloud, log in to the **Icinga Dashboard** (http://&lt;Undercloud_IP&gt;/icinga/) The default login credentials are as follows:
	* Username: *icingaadmin*
	* Password: *icingaadmin* 

2. Click **Status** on the left panel and then click <a href="javascript:window.open('/content/documentation/media/icinga_host-details.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b>Host Details</b> (opens in a new window) </a>.

3. In the **Host** column, click the icon next to the host IP to see <a href="javascript:window.open('/content/documentation/media/swift_icinga_view-details.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b>Host Status Details For All Hosts</b> (opens in a new window)</a>.

4. Click the target Swift node IP address to open the <a href="javascript:window.open('/content/documentation/media/swift_icinga-replication-status.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b>Service Status Details For Host <i>IP Address</i></b> (opens in a new window)</a> to see the replication status of the selected Swift node.

##Status Messages

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th>Status</th>
	<th><center>Message</center></th>
    <th><center>Cause/Resolution</center></th>
</tr>
<tr style="background-color: white; color: black;">
	<td>OK</td>
	<td>Ok</td>
    <td>Everything is fine.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>WARNING </td>
	<td>Replication not progressing</td>
    <td>An account, container or object replicator process has not finished a complete scan recently(elapsed time exceeded the threshold defined) . Examine the account-replicator, container-replicator and object-replicator logs to see which process is "stuck". Restarting the relevant process usually resolves the issue.</td>
</tr>
</tr>
<tr style="background-color: white; color: black;">
	<td>FAIL </td>
	<td>Replication never completed</td>
    <td> The named replication process has never run on this node. Check that the replicator has been configured and started. Examine the log files to see if the replicator process has reported problems.</td>
</tr>
<!-- <tr style="background-color: white; color: black;">
	<td>UNKNOWN</td>
	<td>Not Applicable</td>
    <td>N/A</td></tr> If it won't appear, why include it?-->
</table>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*