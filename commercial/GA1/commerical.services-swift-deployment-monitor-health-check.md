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

Using the "icinga" service running in the undercloud the cloud admin can monitor the health status of Account/Container/Proxy and Object services. 

##Prerequisite

1. HP Helion OpenStack cloud is successfully deployed
2. Swift node(s) are active and running
3. Icinga service is active and running in the Undercloud


##Monitoring Health of Swift Services

 You can monitor the health status of swift-proxy, swift-account, swift-container and swift-object services. 


Perform the following steps to monitor the health status of Swift status:

1. In the Undercloud, login to Icinga Dashboard <http://<Undercloud_IP>/icinga/>. Login credentials are:
		
	* Username- icingaadmin
	* Password- icingaadmin 


2.Click **Status** on the left panel and then click **Host Detail**. 

<img src ="media/icinga_host-details.png/">


3.In the Host column, click the icon next to the host IP (with tooltip that shows View service details for this host) of the Swift storage node that you want to monitor.  

<img src ="media/swift_icinga_view-details.png"/>


The page navigates to Service Status Details For Host <Swift node IP>. The page displays the Service Status Details of the selected host. 

<img src ="media/swift_icinga_view-status-details-host.png"/>



Now, you view the health status of the selected Swift node.

<img src ="media/swift_icinga-health-status.png"/>









<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

 




