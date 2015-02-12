---
layout: default
title: "HP Helion OpenStack&#174; Metering Service (Ceilometer): Alarms"
permalink: /helion/openstack/services/reporting/alarms/
product: commercial.ga
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
Role1: Systems Administrator 
Role2: Data Center Architect 
Role3: Cloud Administrator 
Role4: Net Ops Engineer 
Role5: NOC Engineer 
Role6: Network Administrator
Writer: Jayme P

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
#HP Helion OpenStack&#174; Metering Service (Ceilometer): Alarms

The Metering service contains threshold alarms that you can configure to issue notifications for specific conditions. When the threshold condition is met or exceeded, an alarm is triggered. The action to be taken is defined within the alarm; a typical alarm response would be a log entry or an e-mail, but other options can be implemented.

The Alarm services run on Overcloud Controller0.

Access to Ceilometer is through the command-line interface [(CLI)](http://docs.openstack.org/cli-reference/content/ceilometerclient_commands.html), or the low-level [REST API](http://developer.openstack.org/api-ref-telemetry-v2.html).

Tasks that can be performed via the [CLI](http://docs.openstack.org/cli-reference/content/ceilometerclient_commands.html):

- **Creating, updating and deleting alarms** -- Create, modify, and delete alarms
- **Recording alarm changes** -- Track changes to alarms
- **Viewing a list of alarms, based on filter criteria** -- Obtain a list of alarms based on specified criteria.
- **Viewing details on a specific alarm** -- Obtain information on a specific alarm.
- **Viewing the state of an alarm** -- Get details on the state of a specific alarm.
- **Viewing the history of a specific alarm** -- Obtain a historical list of a specific alarm usage.

<!--<img src="ceilometer_alarming.png" -->

##Manually Stopping and Starting Processes {#stopstart}

Metering processes should normally be operating at all times. Upstart will continually attempt to restart stopped processes even if the process was deliberately stopped manually. In order to avoid this conflict, stop or start processes using the following commands.

###The Alarm Notifier Agent
1. Determine whether the process is running:
 
		sudo service ceilometer-alarm-notifier status
		ceilometer-alarm-evaluator start/running, process 34567
4. start or stop the process as needed:
 
		sudo service ceilometer-alarm-notifier stop
or

		sudo service ceilometer-alarm-notifier start

###The Alarm Evaluator

1. Determine whether the process is running:
 
		sudo service ceilometer-alarm-evaluator status
		ceilometer-alarm-evaluator start/running, process 35567
4. start or stop the process as needed:
 
		sudo service ceilometer-alarm-evaluator stop
or

		sudo service ceilometer-alarm-evaluator start

