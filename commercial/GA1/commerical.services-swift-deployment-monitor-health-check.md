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

Icinga service, which runs in the Undercloud, helps cloud admin to monitor health status of Account, Container, Proxy and Object services. 

##Prerequisite

1. HP Helion OpenStack cloud is successfully deployed and has the following: 

	* Seed
	* Undercloud
	* Overcloud 
	* Two Swift nodes 
2. Swift Storage node(s) are active and running
3. Icinga service is active and running in the Undercloud


##Monitoring Health of Swift Services

 You can monitor the health status of swift-proxy, swift-account, swift-container and swift-object services. 


Perform the following steps to monitor the health status of Swift status:

1. In the Undercloud, login to Icinga Dashboard <http://<Undercloud_IP>/icinga/>. Login credentials are:
		
	* Username- icingaadmin
	* Password- icingaadmin 

Tactical Monitoring Overview page displays.

2.Click **Status** on the left panel and then click **Host Detail**. 

<img src ="media/icinga_host-details.png/">

The page navigates to  Current Network Status. The page displays the Host Status Details For All Host in a tabular form. The table contains the following information:

* Host: IP address of the Host
* Status: Displays the status of the Host i.e. Up and dowm. 
* Last Check: 
* Duration:
* Attempt:
* Status Information: 

3.In the Host column, click the icon icon next to the host IP (with tooltip that shows View service details for this host) of the Swift storage node that you want to monitor.  

<img src ="media/swift_icinga_view-details.png"/>

**Note**: To reconfirm the Swift storage node see [Reconfirm storage swift node](#storage-swift)


The page navigates to Service Status Details For Host <Swift node IP>. The page displays the Service Status Details of the selected host. 

<img src ="media/swift_icinga_view-status-details-host.png"/>

The page displays the following information of the selected host:

* Host: IP address of the Host
* Service: The service associated with the host.
* Status: Displays the status of the Host-OK, WARNING,CRITICAL and UNKNOWN. 
* Last Check: 
* Duration:
* Attempt:
* Status Information: 

For example: The above image displays the service status details for the host 192.0.2.26.

Now, you view the health status of the selected Swift node.

<img src ="media/swift_icinga-health-status.png"/>


##View Service State Information

Perform the following steps to service state information:

1. In the Undercloud, login to Icinga Dashboard <http://<**Undercloud_IP**>/icinga/>. Login credentials are:
		
	* Username- icingaadmin
	* Password- icingaadmin 

Tactical Monitoring Overview page displays.

2.Click **Status** on the left panel and then click **Host Detail**.

The page navigates to  Current Network Status. The page displays the Host Status Details For All Host in a tabular form. 

3.In the Host column, click the icon icon next to the host IP (with tooltip that shows View service details for this host) of the Swift storage node that you want to monitor. 

The page navigates to Service Status Details For Host <Swift node IP>. The page displays the Service Status Details of the selected host. 

Now, you view the replication status of the selected Swift node.

<img src ="media/swift_icinga-replication-status.png"/>

4.Click the name of the service listed in the table. The page navigated to Service State Information. It provides the detailed information of the service.


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

 




