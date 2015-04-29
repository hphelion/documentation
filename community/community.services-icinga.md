---
layout: default
title: "HP Helion OpenStack&#174; Icinga Service"
permalink: /helion/community/services/icinga/
product: community

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/community/services/object/overview/">&#9664; PREV</a> | <a href="/helion/community/services/overview/">&#9650; UP</a> | <a href=" /helion/community/services/swift/deployment/"> NEXT &#9654</a> </p>-->


# HP Helion OpenStack&#174; Icinga Service

The ***Icinga*** service, which runs in the undercloud, helps cloud admins monitor the disk usage of Swift storage node(s).

HP Helion OpenStack&#174; allows you to monitor Swift cluster in any of the followings ways:


* [Monitor Disk Usage](#diskuse)
* [Replication Status using Icinga](#replication)
* [Service Health Check](#health)


## Prerequisites

* HP Helion OpenStack&#174; cloud is successfully deployed. 
* All nodes are functional by default as they are part of cloud deployment
* The Icinga service is active and running in the undercloud


## Monitoring Disk Usage {#diskuse} 

Icinga checks the following:

- That the file systems used by the servers are mounted. 
- The disk usage (by percentage) for the devices in use by Swift (/srv/node). 

Note that other file systems such as `/usr` or `/var` are not monitored. 

Perform the following steps to monitor the usage of Swift disk:

1. In the undercloud Horizon dashboard, log in to the **Icinga Dashboard** (http://&lt;undercloud_IP&gt;/icinga/). The default login credentials are as follows:
		
    * Username: *icingaadmin*
	* Password: *icingaadmin* 

2. Click **Status** on the left panel and then click <b>Host Details</b>.
<br /><img src="/content/documentation/media/icinga_host-details.png">

3. In the **Host** column, click the icon next to the host IP (with tooltip that shows View Service Details For This Host) of the Swift storage node that you want to monitor.

4. The <b>Service Status Details For Host All Hosts</b> page opens.
<br /><img src="/content/documentation/media/swift_icinga_view-details.png">

5. Click the target Swift node IP address to open the <b>Service Status Details For Host &lt;Swift node IP address &gt;</b> to view the disk usage of the selected Swift node.
<br /><img src="/content/documentation/media/swift_icinga-disk-usage.png">

### Status Messages for disk usage monitoring

The Icinga service presents the following messages to indicate the disk usage status of the cloud:

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th>Status</th>
	<th><center>Message</center></th>
    <th><center>Cause/Resolution</center></th>
</tr>
<tr style="background-color: white; color: black;">
	<td>OK</td>
	<td>No devices to report</td>
    <td> This message appears on Proxy servers where there are no account, container or object servers configured. This is a normal status.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>OK </td>
	<td>Percent used</td>
    <td> Percent disk usage for devices used by Swift (/srv/node)</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>WARNING </td>
	<td>Disk space low</td>
    <td>The percentage used space of one of the disk drives exceeds the user defined threshold(Default set to 85% for HP Helion OpenStack 1.0). It is important to prevent Swift devices becoming full because it is difficult to recover if this happens. To resolve, add more devices to the rings or ask your users to delete objects.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>FAIL </td>
	<td>Disk space critically low</td>
    <td>The available space on one of the disk drives has dropped below the "fallocate_reserve" given in <object-server-configuration>. If no value is given in the object server configuration file, this is defaulted to zero. Swift cannot store more data on the drive, if the available space drops below this defined limit.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>FAIL </td>
	<td>Not mounted</td>
    <td> The named device is not mounted. The device may have failed to mount or was unmounted due to an error. To resolve, stop all Swift processes, mount all devices and restart Swift.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>UNKNOWN</td>
	<td>No devices to report</td>
    <td></td></tr>
</table>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Monitor Node Replication Status using Icinga {#repication}

Cloud admins can use the ***icinga*** service running in the undercloud to monitor the replication status of nodes within the Swift deployment. 

Perform the following steps to monitor the replication status:

1. In the undercloud, log in to the **Icinga Dashboard** (http://&lt;undercloud_IP&gt;/icinga/) The default login credentials are as follows:
	* Username: *icingaadmin*
	* Password: *icingaadmin* 

2. Click **Status** on the left panel and then click <b>Host Details</b>.
<br /><img src="/content/documentation/media/icinga_host-details.png"> 

3. In the **Host** column, click the icon next to the host IP to see <b>Host Status Details For All Hosts</b>.
<br /><img src="/content/documentation/media/swift_icinga_view-details.png"> 
4. Click the target Swift node IP address to open the <b>Service Status Details For Host <i>IP Address</i></b> to see the replication status of the selected Swift node.
<br /><img src="/content/documentation/media/swift_icinga-replication-status.png">

###Status Messages for replication monitoring

The Icinga service presents the following messages to indicate the replication status of the cloud:

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

### Monitoring the Health of Services using Icinga {#health}
Cloud admins can use the ***Icinga*** service running in the undercloud to monitor the health status of Account, Container, Proxy, and Object services. 

You can monitor the health status of the swift-proxy, swift-account, swift-container and swift-object services by following these steps:

1. In the undercloud Horizon dashboard, log in to the **Icinga Dashboard** (http://&lt;Undercloud_IP&gt;/icinga/). The default login credentials are as follows::
		
	* Username: *icingaadmin*
	* Password: *icingaadmin*  

2. Click **Status** on the left panel and then click <b>Host Details </b>.
<br /><img src="/content/documentation/media/icinga_host-details.png">

3. In the Host column, click the icon next to the host IP of the Swift storage node to open <b>Service Status Details For Host <i>All Hosts</i></b>.
<br /><img src="/content/documentation/media/swift_icinga_view-details.png">

4. Click the Swift node IP address to open the <b>Service Status Details For Host <i>Swift node IP address </i></b> to view the health status of the selected Swift node.
<br /><img src="/content/documentation/media/swift_icinga-health-status.png">

### Status Messages for health monitoring

The Icinga service presents the following messages to indicate the health status of the cloud:

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th>Status</th>
	<th><center>Message</center></th>
    <th><center>Cause/Resolution</center></th>
</tr>
<tr style="background-color: white; color: black;">
	<td>OK</td>
	<td>OK</td>
    <td></td>
</tr>
<tr style="background-color: white; color: black;">
	<td>WARNING </td>
	<td>Disabled : proxy-server</td>
    <td>Service is temporarily disabled.<br /><br />
	The proxy-server has been disabled by the creation of a file in the "disable_path" config parameter. This is often used to temporarily disable a proxy server by removing it from the
	load balancer or high availability system. To resolve this issue, delete the file indicated in the "disable_path" configuration parameter.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>FAIL </td>
	<td>No response</td>
    <td> The named server is not responding. The process may not be running or may be stuck in some way. To resolve, start or restart the server.</td>
</tr>
</table>


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----

 



