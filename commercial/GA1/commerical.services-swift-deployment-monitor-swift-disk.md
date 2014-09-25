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

1. HP Helion OpenStack cloud is successfully deployed and has the following: 

	* Seed
	* Undercloud
	* Overcloud 
	* Two Swift nodes 
2. Swift Storage node(s) are active and running
3. Icinga service is active and running in the Undercloud


##Monitoring Usage of Swift Disk

The usage of Swift disk are monitored based on the mount of the file system used by the servers. It also verifies the percent usage for the devices used by Swift (/srv/node). Other file systems (/usr or /var) are not monitored. 


Perform the following steps to monitor the usage of Swift disk:

1. In the Undercloud Horizon, login to Icinga Dashboard (http://<**Undercloud_IP**>/icinga/). The default login credentials are as follows::
		
	* Username- icingaadmin
	* Password- icingaadmin 

2. Click **Status** on the left panel and then click **Host Detail**. 

<img src ="media/icinga_host-details.png/">



3.In the Host column, click the icon icon next to the host IP (with tooltip that shows View service details for this host) of the Swift storage node that you want to monitor.  

<img src ="media/swift_icinga_view-details.png"/>

**Note**: To reconfirm the Swift storage node see [Reconfirm storage swift node](#storage-swift)


The page navigates to Service Status Details For Host <Swift node IP>. 

<img src ="media/swift_icinga-disk-usage"/>

Now, you can view the disk usage of the selected Swift node.


4.(Optional)Click the name of the service listed in the table. The page navigated to Service State Information. It provides the detailed information of the service.


##Reconfirm storage swift node {#storage-swift}

You can also reconfirm the Swift storage IP:

a. ssh to the undercloud 
    
		ssh heat-admin<Undercloud IP address> 

b. Source stack RC using the following command:

     # Source stackrc 

c. Use the following command to list the available Swift nodes
    
     ringos  list-swift-nodes

A list of swift nodes will be displayed.





<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
 




