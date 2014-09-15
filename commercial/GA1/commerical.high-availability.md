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


## HA Configuration for the Overcloud ##

The HA configuration for services in the Overcloud is defined in the below table:

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: lightgrey; color: black;">

  <td><b>Service</b></td><td></td><td><b>HA Configuration</b></td></tr>

<tr style="background-color: white; color: black;">
<td>Keystone (authentication)</td><td></td><td>Active - Active servers behind a network load balancer (HA-Proxy)</td></tr>

<tr style="background-color: white; color: black;">
<td>Horizon (GUI)</td><td></td> <td>None. A single instance is run on the third mgmt server. The limiting factor here is being able to support sticky sessions in the Load Balancer.</td></tr>

<tr style="background-color: white; color: black;">
<td>Nova (Compute)</td><td>nova-api</td><td>Active - Active servers behind a network load balancer (HA-Proxy)</td></tr>

<tr style="background-color: white; color: black;">
<td></td><td>nova-api (mgmt)</td><td>None</td></tr>

<tr style="background-color: white; color: black;">
<td></td><td>nova-scheduler</td><td>Active - Active servers reading from shared message queue</td></tr>

<tr style="background-color: white; color: black;">
<td></td><td>nova-conductor</td><td>Active - Active servers reading from shared message queue</td></tr>

<tr style="background-color: white; color: black;">
<td></td><td>nova-novncproxy</td><td>Active - Active servers behind a network load balancer (HA-Proxy)</td></tr>

<tr style="background-color: white; color: black;">
<td></td><td>nova-novncproxy</td><td>Active - Active servers behind a network load balancer (HA-Proxy)</td></tr>

<tr style="background-color: white; color: black;">
<td></td><td>nova-compute</td><td>None, Upstream ConsoleAuth does not currently support more that one service instance</td></tr>

<tr style="background-color: white; color: black;">
<td>Neutron (Network)</td><td>neutron-server</td><td>Active - Active servers behind a network load balancer (HA-Proxy) and shared message queue</td></tr>

<tr style="background-color: white; color: black;">
<td></td><td>neutron-metadata-agent</td><td>None. Will run on all three Mgmt servers. Metadata proxies are tied to routers</td></tr>

<tr style="background-color: white; color: black;">
<td></td><td>neutron-dhcp-agent</td><td>Active - Active servers on each network</td></tr>

<tr style="background-color: white; color: black;">
<td></td><td>neutron-l3-agent</td><td>None. Routers are distributed across all three Mgmt servers to reduce the impact of a server failure</td></tr>


<tr style="background-color: white; color: black;">
<td></td><td>neutron-ovs-agent</td><td>None. Runs on every compute node. Runs on all three Mgmt servers to support DHCP and Router functions</td></tr>


<tr style="background-color: white; color: black;">
<td>Glance (Images)</td><td>glance-api</td><td>Active - Active servers behind a network load balancer (HA-Proxy)</td></tr>

<tr style="background-color: white; color: black;">
<td></td><td>glance-registry</td><td>Active - Active servers behind a network load balancer (HA-Proxy)</td></tr>


<tr style="background-color: white; color: black;">
<td>Cinder (Bock Storage)</td><td>cinder-api</td><td>Active - Active servers behind a network load balancer (HA-Proxy)</td></tr>


<tr style="background-color: white; color: black;">
<td></td><td>cinder-scheduler</td><td>Active - Active servers reading from shared message queue</td></tr>


<tr style="background-color: white; color: black;">
<td></td><td>cinder-backup</td><td>Active - Active servers reading from shared message queue</td></tr>


<tr style="background-color: white; color: black;">
<td></td><td>cinder-volume</td><td>None. Volumes are distributed across all three Mgmt servers to reduce the impact of a server failure</td></tr>

<tr style="background-color: white; color: black;">
<td>Swift (Object Storage)</td><td>swift-proxy</td><td>Active - Active servers behind a network load balancer (HA-Proxy)</td></tr>


<tr style="background-color: white; color: black;">
<td></td><td>swift-object</td><td>Data replication across two servers. Note that Swift provides the Image store for Glance</td></tr>

<tr style="background-color: white; color: black;">
<td>Celiometer</td><td>celiometer</td><td>None</td></tr>

<tr style="background-color: white; color: black;">
<td>Heat</td><td>heat-api</td><td>None</td></tr>


<tr style="background-color: white; color: black;">
<td></td><td>heat-api-cfn</td><td>None</td></tr>


<tr style="background-color: white; color: black;">
<td></td><td>heat-api-cloudwatch</td><td>None</td></tr>

<tr style="background-color: white; color: black;">
<td></td><td>heat-engine</td><td>None</td></tr>


<tr style="background-color: white; color: black;">
<td>HA-Proxy</td><td></td><td>Active - Passive cluster using keepalived. HA-Proxy provides the network load balancer / HA solution for other components</td></tr>

<tr style="background-color: white; color: black;">
<td>MySQL</td><td></td><td>Active - Active - Active Cluster using Percona XtraDB</td></tr>


<tr style="background-color: white; color: black;">
<td>RabbitMQ</td><td></td><td>Active - Active - Active cluster using mirrored queues</td></tr></table>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*







