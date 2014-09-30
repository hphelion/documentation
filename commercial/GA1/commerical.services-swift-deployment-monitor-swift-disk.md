---
layout: default
title: "HP Helion OpenStack&#174; Monitor Disk Usage"
permalink: /helion/openstack/ga/services/object/swift/Monitor-disk/
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


# Monitor Disk Usage

Icinga service, which runs in the Undercloud, helps cloud admin to monitor the disk usage of Swift storage node (s).


##Prerequisite

* HP Helion OpenStack&#174; cloud is successfully deployed. 
* Starter Swift nodes are functional by default as they are part of cloud deployment
* Icinga service is active and running in the Undercloud


##Monitoring Disk Usage of Swift 

This checks that the file systems used by the servers are mounted. Also it checks the disk usage(percentage) for the devices used by Swift (/srv/node). Other file systems such as /usr or /var is not monitored. 


Perform the following steps to monitor the usage of Swift disk:

1. In the Undercloud Horizon, log in to Icinga Dashboard &lt;http://&lt;**Undercloud_IP**&gt;/icinga/&gt;. The default login credentials are as follows::
		
	* Username- icingaadmin
	* Password- icingaadmin 

2. Click **Status** on the left panel and then click **Host Detail**. 


<a href="javascript:window.open('/content/documentation/media/icinga_host-details.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Host Details(opens in a new window)</a>

<!---
<img src="media/icinga_host-details.png"/> --->


3.In the Host column, click the icon next to the host IP (with tooltip that shows View Service Details For This Host) of the Swift storage node that you want to monitor.  


<a href="javascript:window.open('/content/documentation/media/swift_icinga_view-details.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Service Status Details For Host All Hosts (opens in a new window)</a>

<!---

<img src="media/swift_icinga_view-details.png"/> --->



The page navigates to Service Status Details For Host &lt;Swift node IP address &gt;. 


<a href="javascript:window.open('/content/documentation/media/swift_icinga-disk-usage','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Service Status Details For Host &lt;Swift node IP address &gt;(opens in a new window)</a>

<!---
<img src="media/swift_icinga-disk-usage"/> --->

Now, you can view the disk usage of the selected Swift node.


Refer the following table for the status and message details.

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
    <td>The percentage used space of one of the disk drives exceeds the user defined threshold(Default set to 85% for HP Helion Openstack 1.0). It is important to prevent Swift devices becoming full because it is difficult to recover if this happens. To resolve, add more devices to the rings or ask your users to delete objects.</td>
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


**Related topics**

* [Monitor Swift Cluster]( /helion/openstack/ga/services/object/swift/Monitor-cluster/)


*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

 



