---
layout: default
title: "HP Helion OpenStack&#174; Metering Service: Meter Types"
permalink: /helion/openstack/services/reporting/metertypes/
product: commercial.ga
---
<!--UNDER REVISION-->

<script>
function PageRefresh {
onLoad="window.refresh"
}
PageRefresh();
</script>

#HP Helion OpenStack&#174; Metering Service: Available Meter Types
The Metering service contains three types of meters:

- **Cumulative** - A cumulative meter measures date over time (for example, instance hours).
- **Gauge** - A gauge measures discrete items (for example, floating IPs or image uploads) or fluctuating values (such as disk input or output).
- **Delta** - A delta measures change over time, for example, monitoring bandwidth.

Each meter is populated from one or more *samples*, which are gathered from the messaging queue (listening agent), polling agents, or push agents. 
Samples are populated by *counter* objects.

Each counter contains the following *fields*:

- the **name** of the meter
- the **type** of meter (cumulative, gauge, or delta)
- the **amount** of data measured
- the **unit** of measure
- the **resource** being measured
- the **project** **ID** and **user** that the resource is assigned to.

[Alarms](/helion/openstack/services/reporting/alarms/) can be configured to trigger notifications or other actions when a specific metering threshold value has been reached or exceeded.

**Note**: The metering service shares the same High-availability proxy, messaging, and database clusters with the other Information services. To avoid unnecessarily high loads, [non-essential meters can be disabled](/helion/openstack/services/reporting/bestpractices/#meterlist). 
