---
layout: default
title: "HP Helion OpenStack&#174; Telemetry and Reporting Service Troubleshooting"
permalink: /helion/openstack/services/reporting/troubleshooting/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
#HP Helion OpenStack&#174; Telemetry and Reporting Service Troubleshooting

- [Logging](#logging)
- [Messaging/Queuing Errors](#qerrors)

##Logging {#logging}
Logs for the various running components in the Overcloud Controllers can be found at */var/log/ceilometer.log*
 
The Upstart for the services also logs data at */var/log/upstart*

###Modifying

Change the level of debugging in Ceilometer by editing the *ceilometer.conf* file located at **/etc/ceilometer/ceilometer.conf**. To log the maximum amount of information, change the **debug** and **verbose** entries to *True*.

**Note**: When the logging level for a service is changed, that service must be re-started before the changes will take effect.

This is an excerpt of the *ceilometer.conf* configuration file showing where to make changes:

	[DEFAULT]
	policy_file = /etc/ceilometer/policy.json
	debug = False
	verbose = False
	notification_topics = notifications
	 
	...
	 
	[database]
	connection = mysql://root:nova@127.0.0.1/ceilometer?charset=utf8
	
##Messaging/Queuing Errors {#qerrors}

Ceilometer relies on a message bus for passing data between the various components. In high-availability scenarios, RabbitMQ servers are used for this purpose. If these servers are not available, the Ceilometer log will record errors during "Connecting to AMQP" attempts.

These errors may indicate that the RabbitMQ messaging nodes are not running as expected and/or the RPC publishing pipeline is stale. When these errors occur, re-start the instances. 

Example error:
    
    Error: unable to connect to node 'rabbit@xxxx-rabbitmq0000': nodedown
 
Use the RabbitMQ CLI to re-start the instances and the host.

	sudo invoke-rc.d rabbitmq-server start   <- Restarts the downed cluster node if error 
	sudo rabbitmqctl start_app     <- Starts the RabbitMQ host

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*