---
layout: default
title: "HP Helion OpenStack&#174; Monitor Disk Usage"
permalink: /helion/openstack/services/object/swift/mount-points/
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
<p style="font-size: small;"> <a href="/helion/openstack/services/object/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href=" /helion/openstack/services/swift/deployment/"> NEXT &#9654</a> </p>-->


# HP Helion OpenStack&#174;: Monitoring the Disk Drive(s) Health

The ***Icinga*** service, which runs in the undercloud, helps cloud admins monitor health of the disk drive(s) of the Swift storage node(s).


##Prerequisites

* HP Helion OpenStack&#174; cloud is successfully deployed. <br> (*Starter Swift nodes are functional by default as they are part of cloud deployment*)
* The Icinga service is active and running in the undercloud


##Monitoring the Health of Disk Drive(s)

It is important to check the health of the disk drive of Swift cluster on timely basis. To verify the health of the Disk Drive, [hpssacli utility](http://docs.hpcloud.com/helion/openstack/services/swift/diagnosis-disk-health/hpssacli/) is leveraged.

The `/etc/swift` folder on each of the Swift nodes must have both the `*.builder` and the 
`*.ring.gz` files. Using swift-ring-builder cmd the Swift nodes and disks that are in rings are determined.

The node address is retrieved from `/var/lib/os-collect-config/`. 

With the list of disk labels of a Swift node, mount command (what is the command?) is used to check whether the disk is physical or a file-system. For example: d1, d2 disks must be avoided as they are file-systems.

Perform the following steps to monitor the health of the disk drive:

1. In the undercloud Horizon dashboard, log in to the **Icinga Dashboard** (http://&lt;Undercloud_IP&gt;/icinga/). The default login credentials are as follows:
		
    * Username: *icingaadmin*
	* Password: *icingaadmin* 

2. Click **Status** on the left panel and then click 
<a href="javascript:window.open('/content/documentation/media/icinga_host-details.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b><i>Host Detail</i></b><!---(opens in a new window)----></a>.

3. In the **Host** column, <a href="javascript:window.open('/content/documentation/media/swift_icinga_view-details.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b>click the icon</b><!--- (opens in a new window)---> </a> next to the host IP when the tooltip displays as "View Service Details For This Host". <br>
The page navigates to Service Status Details For Host &lt;Swift node IP address &gt; and displays the <a href="javascript:window.open('/content/documentation/media/swift_icinga-disk-monitoring.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b>health of the disk drive(s)</b><!--- (opens in a new window)---></a>   of the selected Swift node.


<!--
4. Click the target Swift node IP address to open the  <a href="javascript:window.open('/content/documentation/media/swift_icinga-mount-points.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b><i>Service Status Details For Host &lt;Swift node IP address &gt;</i></b><!--- (opens in a new window)---></a><!-- to view the disk usage of the selected Swift node.--->



<Need the information ?>



##Status Messages

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th>Status</th>
	<th><center>Message</center></th>
    <th><center>Cause/Resolution</center></th>
</tr><!---
<tr style="background-color: white; color: black;">
	<td>OK</td>
	<td>No devices to report</td>
    <td> This message appears on Proxy servers where there are no account, container or object servers configured. This is a normal status.</td>
</tr>---->
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
</tr><!---
<tr style="background-color: white; color: black;">
	<td>FAIL </td>
	<td>Not mounted</td>
    <td> The named device is not mounted. The device may have failed to mount or was unmounted due to an error. To resolve, stop all Swift processes, mount all devices and restart Swift.</td>
</tr>---><!---
<tr style="background-color: white; color: black;">
	<td>UNKNOWN</td>
	<td>No devices to report</td>
    <td></td></tr>---->
</table>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----

 



