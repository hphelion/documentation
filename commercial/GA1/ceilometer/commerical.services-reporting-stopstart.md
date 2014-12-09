---
layout: default
title: "HP Helion OpenStack&#174; Telemetry and Reporting Service: Processes"
permalink: /helion/openstack/services/reporting/stopstart
/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
#HP Helion OpenStack&#174; Telemetry and Reporting Service: Manually Stopping and Starting Processes

Metering processes should normally be operating at all times. Upstart will continually attempt to restart stopped processes even if the process was deliberately stopped manually. In order to avoid this conflict, stop or start processes using the following commands.

* [Alarms](#alarms)
* [API Processes](#API_process)

##Alarms {#alarms}
###The Alarm Notifier Agent
1. Determine whether the process is running:
 
		$ sudo service ceilometer-alarm-notifier status
		ceilometer-alarm-evaluator start/running, process 34567
4. start or stop the process as needed:
 
		sudo service ceilometer-alarm-notifier stop
or

		sudo service ceilometer-alarm-notifier start

###The Alarm Evaluator Agent

1. Determine whether the process is running:
 
		$ sudo service ceilometer-alarm-evaluator status
		ceilometer-alarm-evaluator start/running, process 35567
4. start or stop the process as needed:
 
		sudo service ceilometer-alarm-evaluator stop
or

		sudo service ceilometer-alarm-evaluator start

##API Processes {#API_process}
**Note**: When a configuration change is made to an API running under the HA Proxy, that change needs to be replicated in **all** controllers.

The ceilometer-api are now running as part of the Apache2 service together with Horizon and Keystone. To remove them from the active list so that changes can be made and then re-instate them, use the following commands.

1. Disable the Ceilometer API on the active sites.
 
		sudo a2dissite ceilometer.conf
 
3. Perform all necessary changes. The Ceilometer API will not be served until it is re-enabled.
4. Re-enable the Ceilometer API on the active sites.
 
		sudo a2ensite ceilometer.conf
 
6. The new changes need to be picked up by Apache2. If possible, force a reload rather than a restart. Unlike a restart, the reload waits for currently active sessions to gracefully terminate or complete.
 
		sudo  /etc/init.d/apache2 force-reload
 

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*