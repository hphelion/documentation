---
layout: default
title: "HP Helion OpenStack&#174; Orchestration High Availability Service Overview"
permalink: /helion/openstack/ga/services/highavailability/overview/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/helion/openstack/services/object/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/reporting/overview/"> NEXT &#9654</a> </p>

# HP Helion OpenStack&#174; High Availability (HA) Service Overview#

High Available system is the one which  minimizes as many failure conditions as possible thereby  increasing the  use of resources significantly and becomes a direct indicator of successful  business operations.Leveraging OpenStack, the HP Helion OpenStack High Availability Service protects the folowing:

* **System downtime** - occurs when a user-facing service is unavailable beyond a specified maximum amount of time.

* **Data loss** - accidental deletion or destruction of data.  
 
 In addition to providing High Availability to the OpenStack Service components, HP Helion Openstack also provides HA service for the nova-compute service. it avoids Single-Point-Of-Failure (SPOF) and controls data loss.  

HA can be provided in the following two models.

- **Active-Active Model**: This model utilizes distributed applications and distributed databases on multiple servers in the LAN/WAN  environment where the data is replicated to some or all of the  servers. When a server failure occurs, the data and applications are  accessible from an alternate server. 

- **Active-Passive Model**: This model utilizes duplicate server hardware  configurations in which one server has the role of an active server  for data and application services, and the other is a backup server  that monitors the state of the active server. When the backup server  detects a hardware or software failure that has occurred on the active  server, it takes over the role and identity of the active server.


## Working with the HA Service

You can implement HA of respective services using Command-line interface (CLI).

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*







