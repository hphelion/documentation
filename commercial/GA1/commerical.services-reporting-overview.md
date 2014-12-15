---
layout: default
title: "HP Helion OpenStack&#174; Metering Service Overview"
permalink: /helion/openstack/services/reporting/overview/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


# HP Helion OpenStack&#174; Metering Service Overview
The HP Helion OpenStack Metering service leverages the OpenStack Ceilometer service. A metering service takes specified measurements of both physical and virtual resources, including physical servers and network devices such as switches and firewalls. The service can be configured to record data, trigger specific action when a pre-defined condition is met, or both. No matter what purpose the data is used for, this service provides a reliable, consistent method for data collection.

##Installation
The metering service is automatically installed as part of the Helion OpenStack installation process. It may be necessary to install the [CLI](http://docs.openstack.org/user-guide/content/install_clients.html) separately to perform various administrative tasks. 

The initial default configuration enables a limited subset of all potential meters, collecting a few essential measurements from the Nova, Cinder, Glance, and Neutron services only. With these measurements, the Ceilometer API can begin collecting basic Helion OpenStack usage and status information.  

Additional metrics collection for all of the Helion OpenStack infrastructure services, as well as other application and platform services, are targeted for future Helion OpenStack releases.  

##Working with Ceilometer
All the Ceilometer processes have a unified configuration file that can be found at */etc/ceilometer/ceilometer.conf* on the specific overcloud controller you are logged in to.

Access to Ceilometer is through the command-line interface [(CLI)](http://docs.openstack.org/cli-reference/content/ceilometerclient_commands.html), or the low-level [REST API](http://developer.openstack.org/api-ref-telemetry-v2.html). A Ceilometer Horizon dashboard panel is not available at this time. 

* [Configuration and Architecture Overview](/helion/openstack/services/reporting/components/)
* [Available Meter Types](/helion/openstack/services/reporting/metertypes/)
* [Alarms and Thresholds](/helion/openstack/services/reporting/alarms/)
* [Troubleshooting](/helion/openstack/services/reporting/troubleshooting/)
	* [Logging](/helion/openstack/services/reporting/troubleshooting/#logging)
	* [Messaging and Queuing Errors](/helion/openstack/services/reporting/troubleshooting/#qerrors)
* [API Extensions: HP Health Check API](/helion/openstack/services/reporting/APIextensions/)
* [Managing Notifications from the Nova Service](/helion/openstack/services/reporting/bestpractices/#ceilandnova)
* [Best Practices and Performance Optimization](/helion/openstack/services/reporting/bestpractices/)
	- [Configuring the Web Server for API Performance](/helion/openstack/services/reporting/bestpractices/#webserverapi)
	- [Modifying the List of Active Meters](/helion/openstack/services/reporting/bestpractices/#meterlist)
	- [Modifying Polling Intervals](/helion/openstack/services/reporting/bestpractices/#pollinterval)
	- [Swift Service Considerations](/helion/openstack/services/reporting/bestpractices/#swift)
