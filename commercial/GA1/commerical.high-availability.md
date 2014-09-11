---
layout: default
title: "HP Helion OpenStack&#174; Orchestration High Availability Service Overview"
permalink: /helion/openstack/ga/high-availability/
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

# HP Helion OpenStack&#174; High Availability (HA)

This page gives an overview of HA in the Overcloud for HP Helion OpenStack. The High Availability of the Overcloud Controller components comes in two main forms.

* Many services are stateless and multiple instances are run across the control plane in Active-Active mode. In the case of API services (nova-api, cinder-api, etc.) the services are accessed through the haproxy load-balancer. In the case of internal services (nova-scheduler, cinder-scheduler, etc.), the services are accessed through the message broker. These services use the database cluster to persist any data. 

    **Note**: The haproxy load-balancer is also run in Active-Active mode and keepalived <**what is this**> (used for VIP management) is run in Active-Active mode, with only one keepalived instance holding the VIP at any given point in time.

* HA of the message queue service and the database service is achieved by running these in a clustered mode across the three nodes of the overcloud control plane: RabbitMQ cluster with Mirrored Queues and Percona MySQL Galera cluster.


The diagram below illustrates the HA architecture, with particular focus on VIP management and load-balancing. It only shows a subset of active-active API instances and does not show examples of other services (nova-scheduler, cinder-scheduler, etc.). 

<img src="media/ha-architecture.png"/>

The above diagram shows the use of a single publicly-accessible VIP for all requests, i.e. public API requests, internal API requests from Overcloud services and requests to the database. 





----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*







