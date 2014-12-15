---
layout: default
title: "HP Helion OpenStack&#174; Metering Service Installation"
permalink: /helion/openstack/services/reporting/components/

product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();
</script>
#HP Helion OpenStack&#174; Metering Service Components

The Metering service is included by the TripleO installer as part of the HP Helion OpenStack installation. During installation, the Metering service is automatically configured to collect data from the Nova, Cinder, Glance and Neutron services. 

All the metering processes have a unified configuration file that can be found at */etc/ceilometer/ceilometer.conf* on the specific overcloud controller you are logged in to.

The TripleO installation creates several management nodes running different metering components.

<img src="media/ceil_overallarchi.png"/>

##Components in TripleO Overcloud Controller0
This controller node is the first of the High Available (HA) cluster. In this node there is an instance of the Ceilometer API running under the HA Proxy Virtual IP address. The Alarm services run on Overcloud Controller0.

**Note**: When a configuration change is made to an API running under the HA Proxy, that change needs to be replicated in **all** controllers.

The ceilometer-api are now running as part of the Apache2 service together with Horizon and Keystone. To remove them from the active list so that changes can be made and then re-instate them, use the following commands.

1. Disable the Ceilometer API on the active sites.
 
		sudo a2dissite ceilometer.conf
 
3. Perform all necessary changes. The Ceilometer API will not be served until it is re-enabled.
4. Re-enable the Ceilometer API on the active sites.
 
		sudo a2ensite ceilometer.conf
 
6. The new changes need to be picked up by Apache2. If possible, force a reload rather than a restart. Unlike a restart, the reload waits for currently active sessions to gracefully terminate or complete.
 
		sudo  /etc/init.d/apache2 force-reload
 
##Ceilometer Components in TripleO Overcloud Controller1

Just like Controller0, Controller1 has an instance of the Ceilometer API running under the HA Proxy.

##Ceilometer Components in TripleO Overcloud Controller2

This node is where all other Ceilometer components are running.

##Ceilometer Sample Polling

The Sample Polling is part of the Central Agent. Once sent to the RabbitMQ service, they are consumed by the Collector and stored in the database. The Collector is also responsible for consuming and storing notifications. Here there is a high level picture of the overall polling/collecting cycle.

<img src="media/ceil_collectorandagents.png"/>

###Ceilometer Central Agent {#centralagent}
The Central Agent is responsible for coordinating the polling activity. It parses the *pipeline.yml* configuration file and identifies all the sources that need to be polled from. The sources are then evaluated using a discovery mechanism and all the sources are translated to resources where a dedicated pollster can retrieve and publish data. At each identified interval the discovery mechanism is triggered, the resource list is composed, and the data is polled and sent to the queue.

Metering processes should normally be operating at all times. Upstart will continually attempt to restart stopped processes even if the process was deliberately stopped manually. In order to avoid this conflict, stop or start processes using the following commands.

1. Determine whether the process is running:
 
		$ sudo service ceilometer-agent-central status 
		ceilometer-agent-central start/running, process 27989


4. start or stop the process as needed:
 
		sudo service ceilometer-agent-central stop
or

		sudo service ceilometer-agent-central start

###Ceilometer Collector {#collector}
The collector is responsible for getting the samples/events from the RabbitMQ service and storing it in the main database.

Metering processes should normally be operating at all times. Upstart will continually attempt to restart stopped processes even if the process was deliberately stopped manually. In order to avoid this conflict, stop or start processes using the following commands.

1. Determine whether the process is running:
 
		$ sudo service ceilometer-collector status 
		ceilometer-collector start/running, process 27455


4. start or stop the process as needed:
 
		sudo service ceilometer-collector stop
or

		sudo service ceilometer-collector start