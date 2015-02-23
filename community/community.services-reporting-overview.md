---
layout: default
title: "HP Helion OpenStack&#174; Metering Service Overview"
permalink: /helion/community/services/reporting/overview/
product: community

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


# HP Helion OpenStack&#174; Telemetry and Reporting Service Overview#

The HP Helion OpenStack Telemetry and Reporting service leverages the OpenStack Ceilometer service to monitor the physical devices in your environment, including physical servers and network devices such as switches and firewalls. 

The Telemetry and Reporting service allows you to collect measurements using only one agent; it collects usage data from every component throughout your environment and stores the data in a single location. 

The Telemetry and Reporting service contains three type of monitors:

- **Cumulative** -- A cumulative meter measures date over time (for example, instance hours).
- **Gauge** -- A gauge measures discrete items.(for example, floating IPs or image uploads) and fluctuating values (such as disk input or output).
- **Delta** -- A delta measures change over time, for example, monitoring bandwidth.

Each meter is populated from one or more *samples*, which are gathered from the messaging queue or polled by agents. Samples are represented by counter objects. Each counter has the following fields:

- the name of the meter
- the type of meter (cumulative, gauge, or delta)
- the amount of data measured
- the unit of measure
- the resource 
- being measured
- the project ID and user the resource belongs to

Alarms can be configured to trigger notifications if a specific threshold value has been reached. 

## Working with the Telemetry and Reporting Service ##

To [perform tasks using the Telemetry and Reporting service](#howto), you can use the dashboard, API or CLI.

### Using the dashboards {#UI}

You can use the [HP Helion OpenStack Dashboard](/helion/community/dashboard/how-works/) to work with the Telemetry and Reporting service.

### Using the API<a name="API"></a>
 
You can use a low-level, raw REST API access to HP Telemetry and Reporting. See the [OpenStack Telemetry API v2.0 Reference](http://developer.openstack.org/api-ref-telemetry-v2.html).

###Using the CLI<a name="cli"></a>

You can use any of several command-line interface software to access HP Telemetry and Reporting. See the [OpenStack Command Line Interface Reference](http://docs.openstack.org/cli-reference/content/ceilometerclient_commands.html).

For more information on installing the CLI, see [Install the OpenStack command-line clients](http://docs.openstack.org/user-guide/content/install_clients.html).

<!---

## How To's with the HP Helion Telemetry and Reporting Service<a name="howto"></a>

The following lists of tasks can be performed by a user or administrator through the [HP Helion OpenStack Dashboard](/helion/openstack/1.1/ga/dashboard/how-works/), the OpenStack [CLI](http://docs.openstack.org/cli-reference/content/ceilometerclient_commands.html) or OpenStack [API](http://developer.openstack.org/api-ref-telemetry-v2.html).

### Working with the Telemetry and Reporting service collection actions ###

The Telemetry and Reporting service collects metrics across multiple projects in your domain. 

- **Recording metering data** -- Track metering data.
- **Recording metering events** -- Record a metering event.
- **Viewing a list of meters** -- Display a list of available meters based on the types of measurements.
- **Clearing expired metering data** -- Remove expired metering data using the CLI.

### Working with resource data ###

The Telemetry and Reporting service monitors *resources* in your environment. A resource is any object that is being monitored by the Telemetry and Reporting service (for example, an instance, a network, or an image). 

- **Viewing information on metered resources** -- Obtain a list of available resources.
- **Viewing details about a specific resource** -- Obtain information on a specific resource.

### Working with the Ceilometer service reporting actions ###

The HP Telemetry and Reporting actions are accessible using a REST API.

- **Viewing a list of usage data for a specific meter** -- List usage data for your meters.
- **Viewing a list of computed statistics across a time range** -- Obtain statistical data.
- **Viewing a list of API capabilities supported by current driver** -- Obtain information on the API capabilities supported.

## Working with Alarms ##

The Telemetry and Reporting contains threshold alarms that you can configure to issue notifications for specific behaviors.

- **Creating, updating and deleting alarms** -- Create, modify, and delete alarms using the API.
- **Recording alarm changes** -- Track changes to Ceilometer alarms using the API.
- **Viewing a list of alarms, based on filter criteria** -- Obtain a list of alarms based on specified criteria.
- **Viewing details on a specific alarm** -- Obtain information on a specific alarm.
- **Viewing the state of an alarm** -- Get details on the state of a specific alarm.
- **Viewing the history of a specific alarm** -- Obtain a historical list of a specific alarm usage.
 --->

## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/). The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack takes care of these details for you. The *Operations* section contains information on how to manage the system.

 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
