---
layout: default
title: "HP Helion OpenStack&#174; Monitor Disk Usage"
permalink: /helion/openstack/1.1/services/object/swift/disk-drive/
product: commercial.ga
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Karthik P, Binamra S

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/openstack/1.1/services/object/overview/">&#9664; PREV</a> | <a href="/helion/openstack/1.1/services/overview/">&#9650; UP</a> | <a href=" /helion/openstack/1.1/services/swift/deployment/"> NEXT &#9654</a> </p>-->


# HP Helion OpenStack&#174; 1.1: Monitor Disk Drive(s) 

The ***Icinga*** service, which runs in the undercloud, helps cloud admins monitor the health of the disk drive(s) of all the swift node(s).


##Prerequisites

* HP Helion OpenStack&#174; cloud is successfully deployed. <br> *(Starter Object Storage (Swift) nodes are functional by default as they are part of cloud deployment)*
* The Icinga service is active and running in the undercloud
* hpssacli utility must be downloaded and installed. To download and install, refer [hpssacli utility](/helion/openstack/1.1/services/swift/diagnosis-disk-health/hpssacli/).


##Monitoring the Disk Drive(s) of Swift

It is important to check the health of the disk drive of Swift cluster on timely basis. To monitor the disk drives on Swift nodes using **Icinga**, [hpssacli utility](/helion/openstack/1.1/services/swift/diagnosis-disk-health/hpssacli/) must be installed in all Swift node(s).

The `/etc/swift` folder on each of the Swift nodes must have both the `*.builder` and the 
`*.ring.gz` files. The builder files are required to determine the list of hosts and disk drives that needs to be monitored. `swift-ring-builder` command is used in monitoring scripts to get the host and disk details from the builder files. 

The node address is retrieved from `/var/lib/os-collect-config/`. 

With the list of disk labels of a Swift node, `mount` command allows you to check whether the disk is physical or a file-system. For example: d1, d2 disks must be avoided as they are file-systems.

Perform the following steps to monitor the status of the disk drive:

1. In the undercloud Horizon dashboard, log in to the **Icinga Dashboard** (http://&lt;Undercloud_IP&gt;/icinga/). The default login credentials are as follows:
		
    * Username: *icingaadmin*
	* Password: *icingaadmin* 

2. Click **Status** on the left panel and then click 
<a href="javascript:window.open('/content/documentation/media/icinga_host-details.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b><i>Host Detail</i></b><!---(opens in a new window)----></a>.

3. In the **Host** column, <a href="javascript:window.open('/content/documentation/media/swift_icinga_view-details.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b>click the icon</b><!--- (opens in a new window)---> </a> next to the host IP when the tooltip displays as "View Service Details For This Host". <br>
The page navigates to Service Status Details For Host &lt;Swift node IP address &gt; and displays the <a href="javascript:window.open('/content/documentation/media/swift_icinga-disk-monitoring.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b>status of the disk drive(s)</b><!--- (opens in a new window)---></a> of the selected Swift node.


##Status Messages

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th>Status</th>
	<th><center>Message</center></th>
    <th><center>Cause/Resolution</center></th>
</tr>
<tr style="background-color: white; color: black;">
	<td>OK</td>
	<td>Drive diagnostic completed: No errors found.</td>
    <td> This message appears on Proxy servers where there are no account, container or object servers configured. This is a normal status.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>WARNING </td>
	<td>Drive status in a warning state. </td>
    <td>Drive errors.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>CRITICAL </td>
	<td>System Error. Check for hpssacli utility. </td>
    <td>Verify whether the hpssacli debian package is installed</td></tr>
<tr style="background-color: white; color: black;">
	<td>FAIL </td>
	<td>&lt;Failed Drive&gt; drive(s)  may be missing or in a failed state. <br>                         Found error in drive(s): <drive slot and location> </td>
    <td>Verify a failure of drives and missing drives.</td>
</table>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----

 



