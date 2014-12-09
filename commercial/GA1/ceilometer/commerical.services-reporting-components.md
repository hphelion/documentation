---
layout: default
title: "HP Helion OpenStack&#174; Telemetry and Reporting Installation"
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
#HP Helion OpenStack&#174; Telemetry and Reporting Service Components

OpenStack Ceilometer is automatically installed by the TripleO installer. During installation, the metering service is automatically configured to collect data from all available Helion IaaS services. 

All the Ceilometer processes have a unified configuration file that can be found at */etc/ceilometer/ceilometer.conf* on the specific overcloud controller you are logged in to.

The TripleO installation creates several management nodes running different Ceilometer components.

<img src="media/ceil_overallarchi.png"/>

##Components in TripleO Overcloud Controller0

This controller node is the first of the High Available (HA) cluster and in this node there is an instance of the Ceilometer API running under the HA Proxy Virtual IP address.
 
The ceilometer-api are now running as part of the Apache2 service together with Horizon and Keystone. In order to verify that these are running, remove them from the active list and re-instate them.

1. Disable the ceilometer-api from the active sites.
 
		sudo a2dissite ceilometer.conf
 
2. Perform all necessary configuration changes and then re-enable the ceilometer-api.
 
		sudo a2ensite ceilometer.conf
 
3. In order for the changes to take effect, force the Web server to reload. A reload is preferable to a re-start since it waits for the active sessions to gracefully terminate or complete.
 
		sudo  /etc/init.d/apache2 force-reload

**Note**: Changes need to be performed on **all** the controllers where the API are running under the HA Proxy.
 
##Ceilometer Components in TripleO Overcloud Controller1

Just like Controller0, Controller1 has an instance of the Ceilometer API running under the HA Proxy.

##Ceilometer Components in TripleO Overcloud ManagementController

This node is where all other Ceilometer components are running.

##Ceilometer Sample Polling

The Sample Polling is part of the Central Agent. Once sent to the RabbitMQ service, they are consumed by the Collector and stored in the database. The Collector is also responsible for consuming and storing notifications. Here there is a high level picture of the overall polling/collecting cycle.

<img src="media/ceil_collectorandagents.png"/>

###Ceilometer Central Agent {#centralagent}
The Central Agent is responsible for coordinating the polling activity. It parses the *pipeline.YAML* configuration file and identifies all the sources that need to be polled from. The sources are then evaluated using a discovery mechanism and all the sources are translated to resources where a dedicated pollster can retrieve and publish data. At each identified interval the discovery mechanism is triggered, the resource list is composed, and the data is polled and sent to the queue.

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