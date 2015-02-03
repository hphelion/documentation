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


# HP Helion OpenStack&#174;: Monitoring the Mount Points using Icinga

The ***Icinga*** service, which runs in the undercloud, helps cloud admins monitor the  mount point of the Swift storage node(s).


##Prerequisites

* HP Helion OpenStack&#174; cloud is successfully deployed. <br> (*Starter Swift nodes are functional by default as they are part of cloud deployment*)
* The Icinga service is active and running in the undercloud


##Monitoring Mount Points of Swift 

Ensure the correctness of mount points using Icinga.

Perform the following steps to monitor the mount points of Swift disk:

1. In the undercloud Horizon dashboard, log in to the **Icinga Dashboard** (http://&lt;Undercloud_IP&gt;/icinga/). The default login credentials are as follows:
		
    * Username: *icingaadmin*
	* Password: *icingaadmin* 

2. Click **Status** on the left panel and then click 
<a href="javascript:window.open('/content/documentation/media/icinga_host-details.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b><i>Host Detail</i></b><!---(opens in a new window)----></a>.

3. In the **Host** column, <a href="javascript:window.open('/content/documentation/media/swift_icinga_view-details.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b>click the icon</b><!--- (opens in a new window)---> </a> next to the host IP when the tooltip displays as "View Service Details For This Host". <br>
The page navigates to Service Status Details For Host &lt;Swift node IP address &gt; and displays the <a href="javascript:window.open('/content/documentation/media/swift_icinga-disk-usage.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b>mount points</b><!--- (opens in a new window)---></a>   of the selected Swift node.


<!--
4. Click the target Swift node IP address to open the  <a href="javascript:window.open('/content/documentation/media/swift_icinga-mount-points.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b><i>Service Status Details For Host &lt;Swift node IP address &gt;</i></b><!--- (opens in a new window)---></a><!-- to view the disk usage of the selected Swift node.--->


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
	<td></td>
    <td></td>
</tr>
<tr style="background-color: white; color: black;">
	<td>FAIL </td>
	<td>These mount point are not mounted with the correct labels. <br>These points do not have <b>swift:swift</b> permissions.<br> These mount points are not mounted with read and write permissions. <br>These mount points are not <b> xfs </b>.
</td>
    <td>Check all the mounted drives for permission and file systems correct labels.
</td>
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

 



