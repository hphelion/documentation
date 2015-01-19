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

##Helion OpenStack Default Meters
These meters are installed and enabled by default during an HP Helion OpenStack cloud installation. 

###Compute (Nova)
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td><b>Name</b></td><td><b>Type</b></td><td><b>Unit</b></td><td><b>Resource</b></td><td><b>Origin</b></td><td><b>Note</b></td>
</tr><tr>
<td>instance</td><td>Gauge</td><td>Instance</td><td>inst ID</td><td>Both</td><td>Existence of instance.</td>
</tr>

</table>

###Image (Glance)
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td><b>Name</b></td><td><b>Type</b></td><td><b>Unit</b></td><td><b>Resource</b></td><td><b>Origin</b></td><td><b>Note</b></td>
</tr><tr>
<td>image</td><td>Gauge</td><td>Image</td><td>image ID</td><td>Both</td><td>Image polling -> it (still) exists</td>
</tr>
<tr><td>image.size</td><td>Gauge</td><td>B</td><td>image ID</td><td>Both</td><td>Uploaded image size</td></tr>
<tr><td>image.upload</td><td>Delta</td><td>Image</td><td>image ID</td><td>notification</td><td>Number of uploads of the image</td></tr>
<tr><td>image.delete</td><td>Delta</td><td>Image</td><td>image ID</td><td>notification</td><td>Number of deletes on the image</td></tr>
</table>

###Network (Neutron)
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td><b>Name</b></td><td><b>Type</b></td><td><b>Unit</b></td><td><b>Resource</b></td><td><b>Origin</b></td><td><b>Note</b></td>
</tr><tr>
<td>network</td><td>Gauge</td><td>network</td><td>netw ID</td><td>notification</td><td>Existence of network</td>
</tr>
<tr><td>network.create</td><td>Delta</td><td>network</td><td>netw ID</td><td>notification</td><td>Creation requests for this network</td></tr>
<tr><td>network.update</td><td>Delta</td><td>network</td><td>netw ID</td><td>notification</td><td>Update requests for this network</td></tr>
<tr><td>ip.floating</td><td>Gauge</td><td>ip</td><td>ip ID</td><td>Both</td><td>Existence of floating ip</td></tr>
</table>


###Volume (Cinder)
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td><b>Name</b></td><td><b>Type</b></td><td><b>Unit</b></td><td><b>Resource</b></td><td><b>Origin</b></td><td><b>Note</b></td>
</tr><tr>
<td>volume</td><td>Gauge</td><td>Volume</td><td>vol ID</td><td>notification</td><td>Existence of volume</td>
</tr>
<tr><td>volume.size</td><td>Gauge</td><td>GB</td><td>vol ID</td><td>notification</td><td>Size of volume</td></tr>
<tr><td>snapshot</td><td>Gauge</td><td>Snapshot</td><td>snap ID</td><td>notification</td><td>Existence of snapshot</td></tr>
<tr><td>snapshot.size</td><td>Gauge</td><td>GB</td><td>snap ID</td><td>notification</td><td>Size of snapshot's volume</td></tr>
</table>