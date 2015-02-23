---
layout: default
title: "HP Helion OpenStack&#174; Object Operations Service Overview"
permalink: /helion/openstack/1.1/services/object/swift/health-swift-services/
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


# HP Helion OpenStack&#174;1.1 : Monitor Health of Services using Icinga 
Cloud admins can use the ***Icinga*** service running in the undercloud to monitor the health status of the Object Storage (Swift) services. 

##Prerequisites

* HP Helion OpenStack&#174; cloud is successfully deployed.<br>*(Starter Object Storage (Swift) nodes are functional by default as they are part of cloud deployment.)*
* The Icinga service is active and running in the undercloud.

##Monitoring the Health of Object Storage (Swift) Services

You can monitor the health status of the following Swift services:

* account-auditor
* container-replicator
* object-replicator
* account-reaper
* container-server
* object-server
* account-replicator
* object-updater
* account-server
* container-updater
* container-auditor
* object-auditor
* proxy-server

Perform the following steps to monitor the health of Swift services:

 You can monitor the health status of the above listed  Swift services by following these steps:

1. In the undercloud Horizon dashboard, log in to the **Icinga Dashboard** (http://&lt;Undercloud_IP&gt;/icinga/). The default login credentials are as follows:
		
	* Username: *icingaadmin*
	* Password: *icingaadmin*  

2. Click **Status** on the left panel and then click <a href="javascript:window.open('/content/documentation/media/icinga_host-details.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b><i>Host Detail</i> </b><!---(opens in a new window)---></a>.


3. In the **Host** column,  <a href="javascript:window.open('/content/documentation/media/swift_icinga_view-details.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b>click the icon<!-- </b> (opens in a new window)--></b></a> next to the host IP when the tooltip displays as "View Service Details For This Host". <br> 
The page navigates to Service Status Details For Host &lt;Swift node IP address &gt; and displays the</b>  <a href="javascript:window.open('/content/documentation/media/swift_icinga-health-status.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">health status  of the Swift services<!---(opens in a new window)---></a>.
<!--
4. Click the Swift node IP address to open the <a href="javascript:window.open('/content/documentation/media/swift_icinga-swift-services.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b>Service Status Details For Host &lt;Swift node IP address </b> <!---(opens in a new window)---></a><!-- to view the health status of the selected Swift node.--->

##Status Messages

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th>Status</th>
	<th><center>Message</center></th>
    <th><center>Cause/Resolution</center></th>
</tr>
<tr style="background-color: white; color: black;">
	<td>OK</td>
	<td>Services are running</td>
    <td></td>
</tr>
<tr style="background-color: white; color: black;">
	<td>FAIL </td>
	<td>List of services &lt;%&gt; are dead.
</td>
    <td> Check whether all the Swift services are running.</td>
</tr>
</table>


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----

 


































 