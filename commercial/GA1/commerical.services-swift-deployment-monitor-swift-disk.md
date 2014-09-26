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

Icinga service, which runs in the Undercloud, helps cloud admin to monitor the disk usage of Swift storage node (s)

##Prerequisite

1. HP Helion OpenStack cloud is successfully deployed.  
2. Swift node(s) are active and running
3. Icinga service is active and running in the Undercloud


##Monitoring Disk Usage of Swift 

This checks that the file systems used by the servers are mounted. Also it checks the disk usage(percentage) for the devices used by Swift (/srv/node). Other file systems such as /usr or /var is not monitored. 


Perform the following steps to monitor the usage of Swift disk:

1. In the Undercloud Horizon, login to Icinga Dashboard (http://<**Undercloud_IP**>/icinga/). The default login credentials are as follows::
		
	* Username- icingaadmin
	* Password- icingaadmin 

2. Click **Status** on the left panel and then click **Host Detail**. 

<img src ="media/icinga_host-details.png/">



3.In the Host column, click the icon next to the host IP (with tooltip that shows View service details for this host) of the Swift storage node that you want to monitor.  

<img src ="media/swift_icinga_view-details.png"/>



The page navigates to Service Status Details For Host < Swift node IP>. 

<img src ="media/swift_icinga-disk-usage"/>

Now, you can view the disk usage of the selected Swift node.




<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
 




