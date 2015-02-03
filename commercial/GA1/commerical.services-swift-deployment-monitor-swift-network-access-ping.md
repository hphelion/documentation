---
layout: default
title: "HP Helion OpenStack&#174; Object Operations Service Overview"
permalink: /helion/openstack/services/object/swift/monitor-network-access-ping/
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
<p style="font-size: small;"> <a href="/helion/openstack/services/object/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href=" /helion/openstack/services/swift/deployment/"> NEXT &#9654</a> </p>-->


# HP Helion OpenStack&#174;: Monitor the Network Access (Ping)
 
Cloud admins can use the ***Icinga*** service running in the undercloud to monitor the network access of all the Swift nodes. The host that are part of ring can be determined using swift-ring-builder and only those nodes are verified for connectivity.	

##Prerequisites

* HP Helion OpenStack&#174; cloud is successfully deployed.<br>*(Starter Swift nodes are functional by default as they are part of cloud deployment.)*
* The Icinga service is active and running in the undercloud.

##Monitoring the Network Access of the Host

Perform the following steps to monitor the network access of the host:


 You can monitor the health status of the swift-proxy, swift-account, swift-container and swift-object services by following these steps:

1. In the undercloud Horizon dashboard, log in to the **Icinga Dashboard** (http://&lt;Undercloud_IP&gt;/icinga/). The default login credentials are as follows:
		
	* Username: *icingaadmin*
	* Password: *icingaadmin*  

2. Click **Status** on the left panel and then click <a href="javascript:window.open('/content/documentation/media/icinga_host-details.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b><i>Host Detail</i> </b><!---(opens in a new window)---></a>.


3. In the **Host** column,  <a href="javascript:window.open('/content/documentation/media/swift_icinga_view-details.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b>click the icon<!-- </b> (opens in a new window)--></b></a> next to the host IP when the tooltip displays as "View Service Details For This Host". <br> 
The page navigates to Service Status Details For Host &lt;Swift node IP address &gt; and displays the</b>  <a href="javascript:window.open('/content/documentation/media/swift_icinga-swift-ping-host.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">the status of  host for network connectivity.<!---(opens in a new window)---></a>
<!--
4. Click the Swift node IP address to open the <a href="javascript:window.open('/content/documentation/media/swift_icinga-swift-ping-host.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b>Service Status Details For Host &lt;Swift node IP address </b> <!---(opens in a new window)---></a><!-- to view the health status of the selected Swift node.--->

##Status Messages

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th>Status</th>
	<th><center>Message</center></th>
   </tr>
<tr style="background-color: white; color: black;">
	<td>OK</td>
	<td>All nodes are reachable. Tested OK.
</td>
    
</tr>
<tr style="background-color: white; color: black;">
	<td>FAIL </td>
	<td>Unreachable nodes - &lt;node_IP&gt;
</td>
    </tr>
</table>


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----

 


































 