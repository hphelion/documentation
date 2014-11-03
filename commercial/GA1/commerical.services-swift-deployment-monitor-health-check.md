---
layout: default
title: "HP Helion OpenStack&#174; Object Operations Service Overview"
permalink: /helion/openstack/services/object/swift/health-check/
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


# HP Helion OpenStack&#174;: Monitoring the Health of Services using Icinga 
Cloud admins can use the ***Icinga*** service running in the undercloud to monitor the health status of Account, Container, Proxy, and Object services. 

##Prerequisites

* HP Helion OpenStack&#174; cloud is successfully deployed.<br>*(Starter Swift nodes are functional by default as they are part of cloud deployment.)*
* The Icinga service is active and running in the undercloud.

##Monitoring the Health of Swift Services

 You can monitor the health status of the swift-proxy, swift-account, swift-container and swift-object services by following these steps:

1. In the undercloud Horizon dashboard, log in to the **Icinga Dashboard** (http://&lt;Undercloud_IP&gt;/icinga/). The default login credentials are as follows:
		
	* Username: *icingaadmin*
	* Password: *icingaadmin*  

2. Click **Status** on the left panel and then click <a href="javascript:window.open('/content/documentation/media/icinga_host-details.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b><i>Host Details</i> </b><!---(opens in a new window)---></a>.


3. In the Host column, click the icon next to the host IP of the Swift storage node to open <a href="javascript:window.open('/content/documentation/media/swift_icinga_view-details.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b><i>Service Status Details For Host All Hosts</i><!-- </b> (opens in a new window)--></b></a>.

4. Click the Swift node IP address to open the <a href="javascript:window.open('/content/documentation/media/swift_icinga-health-status.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b>Service Status Details For Host <i>Swift node IP address </i></b> <!---(opens in a new window)---></a> to view the health status of the selected Swift node.

##Status Messages

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
	The proxy-server is disabled by the creation of a file in the disable_path configuration parameter. This is often used to temporarily disable a proxy server by removing it from the
	load balancer or high availability system. Delete the file indicated in the disable_path configuration parameter to resolve it.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>FAIL </td>
	<td>No response</td>
    <td> The named server is not responding. The process may not be running or may be stuck in some way. Start or restart the server to resolve it.</td>
</tr>
</table>


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

 




