---
layout: default
title: "HP Helion OpenStack&#174; Community Telemetry and Reporting Service Overview"
permalink: /cloudos/community/services/reporting/overview/
product: community

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/community/services/orchestration/howto/">&#9664; PREV</a> | <a href="/cloudos/community/services/overview/">&#9650; UP</a> | <a href="/cloudos/community/services/reporting/howto/"> NEXT &#9654</a> </p>


# HP Helion OpenStack&#174; Community Telemetry and Reporting Service Overview#

<!-- modeled after HP Cloud Networking Getting Started (network.getting.started.md); text from http://www.mirantis.com/blog/openstack-metering-using-ceilometer/ -->
Based on OpenStack&reg; Ceilometer, the HP Helion OpenStack&#174; Community Telemetry and Reporting service monitors the physical devices in the your environment, including physical servers running services and network devices used in the environment (switches, firewalls). 

The Telemetry and Reporting service allows you to collect measurements using only one agent throughout your environment, pulling usage data from every component and storing the data in a single place. 

The Telemetry and Reporting service contains three type of meters:

- **Cumulative** -- A cumulative meter measures date over time (for example, instance hours)
- **Gauge** -- A gauge measures discrete items.(for example, floating IPs or image uploads) and fluctuating values (such as disk input or output).
- **Delta** A delta measures change over time, for example, monitoring bandwidth.

Each meter is collected from one or more *samples*, which are gathered from the messaging queue or polled by agents. Samples are represented by counter objects. Each counter has the following fields:

- the name of the meter
- the type of meter (cumulative, gauge, or delta)
- the amount of data measured
- the unit of measure
- the resource being measured
- the project ID and user the resource belongs to

Alarms can be configured to trigger notifications if a specific threshold value has been reached. 

### Using the dashboards {#UI}

You can use the [HP Helion OpenStack&#174; Community Dashboard](/cloudos/community/services/dashboard/overview/) to work with the Compute service.

###Using the API to access Compute### {#API}
 
You can use a low-level, raw REST API access to HP Telemetry and Reporting. See the [OpenStack Telemetry API v2.0 Reference](http://api.openstack.org/api-ref-telemetry.html).

###Using the CLI### {#cli}

You can use any of several command-line interface software to access HP Telemetry and Reporting. See the [OpenStack Command Line Interface Reference](http://docs.openstack.org/cli-reference/content/ceilometerclient_commands.html).

## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/) The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack&#174; Community edition takes care of these details for you. The *Operations* contains information on how to manage the system.

<!-- hide me Also see the Help topics that are available in the Operational Dashboard and Administration Dashboard.  Website copies are available:

* [HP Cloud OS Operational Dashboard Help](/cloudos/manage/operational-dashboard/)
* [HP Cloud OS Administration Dashboard Help](/cloudos/manage/administration-dashboard/) -->