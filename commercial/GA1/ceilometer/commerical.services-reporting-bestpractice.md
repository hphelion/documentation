---
layout: default
title: "HP Helion OpenStack&#174; Metering Service Best Practices"
permalink: /helion/openstack/services/reporting/bestpractices/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

#HP Helion OpenStack&#174; Metering Service: Best Practices and Optimization
Configuration changes that improve reporting API and database responsiveness by keeping data storage to a reasonable level.

- [Nova](#ceilandnova)
	- 	[Data Collected by Ceilometer (default list)](#novadata)
	- 	[Enabling Nova Notifications](#novaconfigfile)
- [Configuring the Web Server for API Performance](#webserverapi)
- [Modifying the List of Active Meters](#meterlist)
- [Modifying Polling Intervals](#pollinterval)
- [Swift](#swift)

##Nova {#ceilandnova}
The Nova service is configured by default to send certain notifications regarding usage and VM status information collected by Ceilometer. To increase, decrease, or stop these notifications  from the Nova service, modify [Nova's Ceilometer configuration file](#novaconfigfile).

###Data Collected by Ceilometer {#novadata}
Once the *openstack.common.rpc* notifications are enabled in the configuration file, Nova will send the following data to Ceilometer:

<table width="100%">
<tr><td width="100"><b>Name</b></td>
<td><b>Unit</b></td> 
<td><b>Type</b></td>
<td><b>Resource</b></td>
<td><b>Note</b></td></tr> 
<tr><td>instance</td>
<td>g</td> 
<td>instance</td>
<td> inst ID</td>
<td>Existence of instance</td></tr>
<tr><td>instance: <i>type</td>
<td>g</td> 
<td>instance</td>
<td> inst ID</td>
<td>Existence of instance of <i>type</i> (Where <i>type</i> is a valid OpenStack types.) </td></tr>
<tr><td>memory</td>
<td>g</td> 
<td>MB</td>
<td> inst ID</td>
<td>Volume of allocated RAM. Measured in MB.</td></tr>
<tr><td>vcpus</td>
<td>g</td> 
<td>vcpu</td>
<td> inst ID</td>
<td>Volume of allocated RAM. Measured in MB.</td></tr>
<tr><td>disk.root.size</td>
<td>g</td> 
<td>GB</td>
<td> inst ID</td>
<td>Size of root disk. Measured in GB.</td></tr>
<tr><td>disk.ephemeral.size</td>
<td>g</td> 
<td>GB</td>
<td> inst ID</td>
<td>Size of ephemeral disk. Measured in GB.</td></tr>
</table>

###Enable Nova Notifications {#novaconfigfile}
This example is an excerpt of the configuration file including only the changes necessary to enable notifications. When notification publishing has been enabled, the *nova.conf* file will appear as follows. 
	
	notification_driver=nova.openstack.common.notifier.rpc_notifier
	notification_topics=notifications
	notify_on_state_change=vm_and_task_state
	instance_usage_audit=True
	instance_usage_audit_period=hour

The *instance\_usage\_audit_period* interval can be set to check the instance's status every hour, once a day, once a week or once a month. Every time the audit period elapses, Nova sends a notification to Ceilometer to record whether or not the instance is live and running. Metering this statistic is critical if billing depends on usage. 

###Restart the Nova Service
Note that the Nova service must be restarted to pick up the changes to the configuration file. Log in to the controller node and execute the following to restart the Compute services:

	service nova-api restart
	service nova-cert restart
	service nova-consoleauth restart
	service nova-scheduler restart
	service nova-conductor restart
	service nova-novncproxy restart

For a more in-depth look at how information is sent over *openstack.common.rpc*, refer to the [OpenStack Ceilometer documentation](http://docs.openstack.org/developer/ceilometer/measurements.html).
 
**Validation**
After the Nova service is re-started, the notification daemons using the namespace *ceilometer.notification* should receive some traffic. Each plugin can listen to any topic(s), but by default it will listen to *notifications.info*.

##Configuring the Web Server for API Performance {#webserverapi}
Reporting API provide the main access point for data stored in Ceilometer. An excessive increase of concurrent access at the front-end tends to put strain on the database. Use this procedure to optimize both the front-end and back-end (database) and improve performance.

1. Add the *ceilometer.conf* file to the */etc/apache2/sites-available* folder.
2. Add the following data to the *ceilometer.conf* file:

		Listen <ipaddress>:8777 
		<VirtualHost *:8777>
		    WSGIDaemonProcess ceilometer user=ceilometer group=ceilometer processes=4 threads=5 home=/opt/stack/venvs/openstack python-path=/opt/stack/venvs/openstack/lib/python2.7/site-packages
		    WSGIScriptAlias / /opt/stack/venvs/openstack/lib/python2.7/site-packages/ceilometer/api/app.wsgi
		    SetEnv APACHE_RUN_USER ceilometer
		    SetEnv APACHE_RUN_GROUP ceilometer
		    WSGIProcessGroup ceilometer
		    ErrorLog /var/log/apache2/ceilometer_error.log
		    LogLevel info
		    CustomLog /var/log/apache2/ceilometer_access.log combined
		    <Directory />
		        Require all granted
		    </Directory>
		</VirtualHost>

3. Create a softlink for the *ceilometer.conf* file in the */etc/apache2/sites-enabled* folder.

		ln -s /etc/apache2/sites-available/ceilometer.conf /etc/apache2/sites-enabled

4. Apply the WSGIDaemon recommended settings.

	The Ceilometer API run as WSGI processes. Each process can have a certain amount of threads to handle the filters and applications that make up the processing pipeline. Increasing the number of threads will improve responsiveness, but only up to a point. 

	The recommended configuration is to have **four** processes running in parallel with **five** threads per process. Add the following lines to the *ceilometer.conf* file:

		processes=4
		threads=5

5. Reload the Web Server

	For the changes to take effect, the Apache2 service also needs to be reloaded. After reload, the system administrator can change the configuration of processes and threads and experiment if alternative settings as necessary. 

		sudo service apache2 reload

**Verification**

1. Verify that the Ceilometer API are running. Execute:

		ps -ef | grep apache

	If everything is working, this command should generate an output similar to the following:

		ceilome+ 31430 31427 10 16:29 ? 00:02:40 /usr/sbin/apache2 -k start
		ceilome+ 31431 31427 10 16:29 ? 00:02:41 /usr/sbin/apache2 -k start
		ceilome+ 31432 31427 10 16:29 ? 00:02:42 /usr/sbin/apache2 -k start
		ceilome+ 31433 31427 10 16:29 ? 00:02:43 /usr/sbin/apache2 -k start  

	Note that the number of entries in the output should match the number of 	processors set in the configuration file. The recommended value is four.

2. Verify that Apache2 is accepting incoming traffic on port 8777:

		netstat -tulpn | grep 8777
	
	This command should produce the following output:

		tcp6 0 0 :::8777 :::* LISTEN 8959/apache2

##Modifying the List of Meters {#meterlist}
Reducing the amount of unnecessary data sent to the storage reduces the load on the SQL-based cluster, which increases performance.
Ceilometer data collection is configured by modifying the *pipeline.yml* file. This configuration file is located in the */etc/ceilometer* folder on all of the controller nodes.

**Note**: The *pipeline.yml* configuration file needs to be changed on **all** the controller nodes to actually affect the white-listing and or polling strategy.

The configuration file is comprised of two major elements: **sources** and **sinks**. **Sources** are data harvested from notifications posted by services or collected through polling. **Sinks** represent how that data is modified before it is published to the internal queue for collection and storage.

In the Sources section there is a list of default meters. These meters are the data that is going to be collected. The list of meters can be easily reduced or increased by editing the *pipeline.yml* configuration file and then restarting the [Ceilometer Central Agent](/helion/openstack/services/reporting/components/#centralagent) and the [Ceilometer Collector](/helion/openstack/services/reporting/components/#collector). If more meters are desired, please refer to the [OpenStack Ceilometer documentation](http://docs.openstack.org/developer/ceilometer/measurements.html#measurements). 

	---
	sources:
	    - name: meter_source
	      interval: 604800
	      meters:
	          - "instance"
	          - "image"
	          - "image.size"
	          - "image.upload"
	          - "image.delete"
	          - "volume"
	          - "volume.size"
	          - "snapshot"
	          - "snapshot.size"
	          - "ip.floating"
	          - "network.*"
	          - "compute.instance.create.end"
	          - "compute.instance.delete.end"
	          - "compute.instance.update"
	          - "compute.instance.exists"
	      sinks:
	          - meter_sink
	sinks:
	    - name: meter_sink
	      transformers:
	      publishers:
	          - notifier://

##Modifying the Polling Intervals {#pollinterval}
This option does not apply to meters that are notification-only because those meters are not polled.

The **interval attribute** is the time between polls when a meter can be polled. 
Meters that are available as both notification **and** polling are going to be polled at the specified interval. To rely on notifications rather than polling, set the interval attribute to 604800 seconds, or once a week.

Here it is an example of a compute-only *pipeline.yml* file where the poll interval has been increased to once daily. 

**Note**: These changes will also completely STOP reception of data from all the non-listed meters.

	---
	sources:
	    - name: meter_source
	      interval: 86400
	      meters:
	          - "instance"
	          - "memory"
	          - "vcpus"
	          - "compute.instance.create.end"
	          - "compute.instance.delete.end"
	          - "compute.instance.update"
	          - "compute.instance.exists"
	      sinks:
	          - meter_sink
	sinks:
	    - name: meter_sink
	      transformers:
	      publishers:
	          - notifier://

##Swift Considerations {#swift}
Ceilometer, by default, does not collect any data from Swift. Swift data can only be collected using polling, not notifications, and the service could easily generate enough traffic to overwhelm any back-end solution not specifically built to handle Big Data.

Polling can be a big performance hit due to the sheer amount of data that the system may have to ingest. It also greatly increases query response time when the database has overly-large amounts of data to scan. Such scans usually consume excessive amounts of CPU and memory resources. In the worst cases, long waits for query replies can result in timeouts.

The Swift service has five separate polling meters:


- storage.objects
- storage.objects.size
- storage.objects.containers
- storage.containers.objects
- storage.containers.objects.size

Here is an example of the *pipeline.yml* configuration file updating the Swift meters to poll only once an hour.

	---
	sources:
	    - name: meter_source
	      interval: 604800
	      meters:
	          - "instance"
	          - "image"
	          - "image.size"
	          - "image.upload"
	          - "image.delete"
	          - "volume"
	          - "volume.size"
	          - "snapshot"
	          - "snapshot.size"
	          - "ip.floating"
	          - "network.*"
	          - "compute.instance.create.end"
	          - "compute.instance.delete.end"
	          - "compute.instance.update"
	          - "compute.instance.exists"
	      sinks:
	          - meter_sink
	    - name: swift_source
	      interval: 3600
	      meters:
	          - "storage.objects"
	          - "storage.objects.size"
	          - "storage.objects.containers"
	          - "storage.containers.objects"
	          - "storage.containers.objects.size"
	      sinks:
	          - meter_sink
	sinks:
	    - name: meter_sink
	      transformers:
	      publishers:
	          - notifier://

Every time polling interval elapses, it collects at least five messages per **each** existing Swift object and container. The following table illustrate the amount of data produced hourly in different scenarios:

<table>
<tr><td>Swift Containers</td><td>Objects Per Container</td><td>Number of Samples Per Hour (5 meters)</td><td>Total Samples Stored in a 24-hour Period </td></tr>
<tr><td>10</td><td>10</td><td>500</td><td>12,000</td></tr>
<tr><td>10</td><td>100</td><td>5000</td><td>120,000</td></tr>
<tr><td>100</td><td>100</td><td>50,000</td><td>1,200,000</td></tr>
<tr><td>100</td><td>1000</td><td>500,000</td><td>120,000,000</td></tr>
</table>

Even a very, very small Swift storage with only 10 containers and 100 files will store 120,000 samples a day. File size doesn't matter; it's the sheer number of samples that risks a severe performance impact on the database.

