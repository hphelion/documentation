---
layout: default
title: "HP Helion OpenStack&#174; Object Operations Service Overview"
permalink: /helion/openstack/ga/services/object/swift/health-check/
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


# Service Health Check 

Using the Icinga service running in the undercloud the cloud admin can monitor the health status of Account/Container/Proxy and Object services. 

##Prerequisites

* HP Helion OpenStack&#174; cloud is successfully deployed.
* Starter Swift nodes are functional by default as they are part of cloud deployment.
* Icinga service is active and running in the Undercloud.



##Monitoring the Health of Swift Services

 You can monitor the health status of swift-proxy, swift-account, swift-container and swift-object services by following these steps:


Perform the following steps to monitor the health status of Swift status:

1. In the Undercloud, log in to the Icinga Dashboard <http://<Undercloud_IP>/icinga/>. Log-in credentials are:

	* Username- icingaadmin
	* Password- icingaadmin 


2.Click **Status** on the left panel and then click **Host Detail**. 


<a href="javascript:window.open('/content/documentation/media/icinga_host-details.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Host Details(opens in a new window)</a>



3.In the Host column, click the icon next to the host IP of the Swift storage node that you want to monitor. (Note: You will see a tooltip that shows View service details for this host)  

<img src="media/swift_icinga_view-details.png"/>


The page navigates to Service Status Details For Host  &lt; Swift node IP address &gt; . The page displays the Service Status Details of the selected host. 


<img src="media/swift_icinga_view-status-details-host.png"/>



Now you may view the health status of the selected Swift node.

<img src="media/swift_icinga-health-status.png"/>



Refer to the following table for status and message details.

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
    <td>Service is temporarily disabled.<br><br>
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

**Related topics**

* [Monitor Swift Cluster]( /helion/openstack/ga/services/object/swift/Monitor-cluster/)

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

 




