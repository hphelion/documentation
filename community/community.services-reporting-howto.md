---
layout: default
title: "How To's with the HP Helion OpenStack&#174; Community Telemetry and Reporting Service"
permalink: /cloudos/community/services/reporting/howto/
product: community

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/community/services/reporting/overview">&#9664; PREV</a> | <a href="/cloudos/community/services/overview/">&#9650; UP</a> | <a href="/cloudos/community/services/volume/overview/"> NEXT &#9654</a> </p>

# How To's with the HP Helion OpenStack&#174; Community Telemetry and Reporting (Ceilometer) Service #

Based on OpenStack&reg; Ceilometer, the HP Helion OpenStack&#174; Community Telemetry and Reporting service contains internal collection actions that are triggered by messaging queue activity and generalized for all the services. 

For example, the Telemetry and Reporting contains service-specific *plugins* that utilize the same methodology for outputting all data collected by Ceilometer. 

Once collected, the data can be stored in a database which you can access using the API, or in a simple file for processing using other methods.

The following lists of tasks can be performed by a user or administrator through the [HP Helion OpenStack&#174; Community Dashboard](/cloudos/community/services/dashboard/overview/), the OpenStack CLI or OpenStack API.

For details on performing these tasks using the API or CLI, see the following OpenStack documentation:

- [OpenStack Telemetry API v2.0 Reference](http://api.openstack.org/api-ref-telemetry.html)
- [OpenStack Command Line Interface Reference](http://docs.openstack.org/cli-reference/content/ceilometerclient_commands.html)

Depending upon your user type, you can perform the following tasks.

## Working with the Telemetry and Reporting service collection actions ##

The Telemetry and Reporting service collects metrics across multiple projects in your domain. 

### Recording metering data ###

Use the Telemetry and Reporting service service to track metering data.

### Recording metering events ###

Use the Telemetry and Reporting service to record a metering event.

### Viewing a list of meters ###

Use the Telemetry and Reporting service to display a list of available meters based on the types of measurements.

### Clearing expired metering data ###

Use the Telemetry and Reporting service to remove expired metering data using the CLI.


## Working with resource data ##

The Telemetry and Reporting service monitors *resources* in your environment. A resource is any object that is being monitored by the Telemetry and Reporting service (for example, an instance, a network, or an image). 

### Viewing information on metered resources ###

Use the Telemetry and Reporting service to obtain a list of available resources.

### Viewing details about a specific resource ###

Use the Telemetry and Reporting service to obtain information on a specific resource.

## Working with the Ceilometer service reporting actions ##

The HP Telemetry and Reporting actions are accessible using a REST API.

### Viewing a list of usage data for a specific meter ###

Use the Telemetry and Reporting service to list usage data for your meters.

### Viewing a list of computed statistics across a time range ###

Use the Telemetry and Reporting service to obtain statistical data.

### Viewing a list of API capabilities supported by current driver ###

Use the Telemetry and Reporting service to obtain information on the API capabilities supported.

## Working with Alarms ##

The Telemetry and Reporting contains threshold alarms that you can configure to issue notifications for specific behaviors.

### Creating, updating and deleting alarms ###

Use the Telemetry and Reporting service to create, modify, and delete alarms using the API.

### Recording alarm changes ###

Use the Telemetry and Reporting service to track changes to Ceilometer alarms using the API.

### Viewing a list of alarms, based on filter criteria ###

Use the Telemetry and Reporting service to obtain a list of alarms based on specified criteria.

### Viewing details on a specific alarm ###

Use the Telemetry and Reporting service to obtain information on a specific alarm.

### Viewing the state of an alarm ###

Use the Telemetry and Reporting service to get details on the state of a specific alarm.

### Viewing the history of a specific alarm ###

Use the Telemetry and Reporting service to obtain a historical list of a specific alarm usage.

## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/) The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack&#174; Community edition takes care of these details for you. The *Operations* contains information on how to manage the system.

<!-- hide me Also see the Help topics that are available in the Operational Dashboard and Administration Dashboard.  Website copies are available:

* [HP Cloud OS Operational Dashboard Help](/cloudos/manage/operational-dashboard/)
* [HP Cloud OS Administration Dashboard Help](/cloudos/manage/administration-dashboard/) -->