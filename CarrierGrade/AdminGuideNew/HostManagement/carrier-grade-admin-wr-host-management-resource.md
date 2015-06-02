---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Resource Usage"
permalink: /helion/openstack/carrier/admin/host/management/resources/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: Systems Administrator 
role2: Cloud Architect 
role3: Storage Administrator 
role4: Network Administrator 
role5: Service Developer 
role6: Cloud Administrator 
role7: Application Developer 
role8: Network Engineer 
authors: Paul F

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/openstack/carrier/services/imaging/overview/">&#9664; PREV</a> | <a href="/helion/openstack/carrier/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/carrier/services/object/overview/"> NEXT &#9654</a> </p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): Resource Usage
<!-- From the Titanium Server Admin Guide -->

Usage of system resources is monitored by Ceilometer, the standard OpenStack mechanism for collecting and distributing performance monitoring samples from the cluster. The HP Helion OpenStack Carrier Grade cluster extends Ceilometer with improved reports and new tools to facilitate offline analysis of the collected data.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

Performance Monitor (PM) samples are periodically collected from different resources such as hosts, virtual machine instances, AVS, and others. They include CPU and memory utilization, network traffic counters, storage space, and several more. By default the samples are stored in a database which is used for reporting activities such as:

* command line queries and graphical charts
* triggering of threshold alarms
* triggering of threshold actions. The most common example is Heat actions to scale up and down a resource.

The Ceilometer database is periodically cleaned in order to contain its size and prevent the overuse of storage resources on the controller nodes.

The Ceilometer implementation in the HP Helion OpenStack Carrier Grade improves on several aspects. They are described in the following sections:

* [Optimized Ceilometer Filters](#filters)
* [On-Line Ceilometer Reports](#reports)
* [CSV Performance Monitoring Backend](#backend)
* [Retention Period](#retention)

### Optimized Ceilometer Filters {#filters}

The Ceilometer implementation in the HP Helion OpenStack Carrier Grade is specially tuned to allow time-sensitive actions, such as Heat autoscaling, to take place in response to relatively high-frequency sample rates of system events.

The size of both the Ceilometer database and the CSV files are maintained under control at all times, while still enabling the required system actions to take place in real-time.

### On-Line Ceilometer Reports {#reports}

On-line, on-demand, Ceilometer reports in the HP Helion OpenStack Carrier Grade benefit from several improvements over the stock OpenStack reporting tool, including:

* optimized Ceilometer database queries
* improved naming of menu entries on pull-down menus
* use of brief meter descriptions and human-readable legends on the charts

Additionally, all database queries are user-initiated, as opposed to event-initiated. This provides a different user workflow, whereby all required report parameters and filters are configured first, before the database query is executed.

Access to Ceilometer reports is available from the Stats tab on the Resource Usage Overview page. This page can be accessed from the web management interface by selecting the option **Resource Usage** on the **Admin** tab of the **System** panel. 

The **Stats** tab contains the following fields:

* **Metric** - The Ceilometer metric you want to query. Metrics are grouped by service, as follows:

	* Compute (Nova)
	* Network (Neutron)
	* Image (Glance)
	* Volume (Cinder)
	* Switching (AVS)

	On the CLI, use the following command to list the available metrics, and find their resource IDs:

		ceilometer meter-list

* **Value** - The particular statistic you want to visualize. Select among Average, Minimum, Maximum, and Summation.

* **Group by** - How to group the displayed charts, as follows:

	* **None** - The selected statistic is presented as a single line chart reporting the aggregate over all resources and projects (tenants).
	* **Projects (Tenants)** - The selected statistic is presented as a multiple line charts over all resources, one line per tenant.
	* **Resource** - The selected statistic is presented as a multiple line charts over all resources, one line per resource (hosts, instances, and so on).

* **Period** - The period of time to be covered by the report.  When selecting other, two new fields become available, **Date From** and **Date To**, allowing you to specify a specific time period.

* **Metadata** - Metadata represents additional attributes collected with a metric. In this menu, you can select the specific attribute you want the report on.

	The pull-down menu is auto-populated with the corresponding attributes for the selected metric. 

	On the CLI, use the following command to list the metadata associated with a metric identified with its resource ID:

		ceilometer resource-show –r <resource_id>

* **Filter** - Use this field to limit the report to show metric samples whose metadata attribute equals the specified value. The
filter field is applied only when a specific metadata attribute is selected.

	Once the selections are in place, click the Report button to display the report.

### CSV Performance Monitoring Backend {#backend}

The HP Helion OpenStack Carrier Grade provides access to performance measurement samples in the form of comma-separated values (CSV) files. They provide the following benefits:

* off-line permanent storage of large samples history
* enables the use of off-line tools for data analysis, accounting, and archiving

The CSV files are expected to be retrieved from the controllers using any suitable file transfer client application such as SFTP or SCP. This can be done manually by the system administrator, or automatically by an operations and support server (OSS/BSS) configured with the appropriate login credentials.

Recording of samples and management of CSV files is done through special Ceilometer pipelines available from the Pipelines tab, as illustrated below:

The csv pipeline collects system information with the exception of AVS switching meters. The latter are collected by the `vswitch_avg` pipeline.

Click the **Update Settings** button to configure the behavior of a pipeline. The **Edit Pipeline** window is presented as follows:

The following fields are available:

* **Name** - A read-only field displaying the name of the pipeline.

* **Meters** - An editable field displaying the list of comma-separated meters included in the pipeline. The list must be enclosed in square brackets, as follows:

		[meter1,meter2,...]

The following syntax rules apply to the specified meters:

* A meter specification is a text string of the form `metergroup.metersubgroup.meter`, for example, `disk.read.bytes`.
* A meter specification supports a trailing wild-card to include all meters within a `metergroup`. For example, the text `disk.*` matches the meters `disk.read.bytes` and `disk.write.bytes`.
* A meter specification supports a trailing wild-card to include all `metersubgroups` within a `metergroup`. For example, the text `disk.read.*` matches the meter `disk.read.bytes`.
* Meter specifications support a leading exclamation mark to exclude the specified meter, as follows:

		[!meter1,!meter2,...]

	Such a pipeline includes all meters but the ones in the list.

	Exclamation marks cannot be applied selectively in a list of meters. Either all meters use them or none at all.

	The following list is therefore invalid:
	[meter1,!meter2,meter3]

* **Location** - The absolute path to the CSV file on the controller.
* **Enabled** -  A check box used to enable or disable the pipeline.
* **Max Bytes** - The maximum size, in bytes, of a CSV file. The default value is 10 MB.
* **Backup Count** - The number of concurrent backup CSV files to maintain in a rotation ring, including the currently active file. When a CSV file reaches its maximum size, it is renamed as a backup file, and a new CSV file is opened for writing. Backup files older than the size of the rotation ring are automatically removed.
* **Compress Backups** - A check box used to select whether or not to compress backup files in the rotation ring.
* 
### Retention Period {#retention}

Performance samples are kept in the database for a limited period of time known as the retention period. Its default value is 86400 seconds, or 24 hours.

Click the **Edit Retention Period** button in the **Retention Period** tab to modify the current value. You must verify that the configured value is equal or higher than the period over which you intend to gather statistics.

You can also control the retention period from the CLI. To view the current settings, use the following command.

	system pm-show

To change the retention period from the CLI, use the following command syntax.

	system pm-modify retention_secs=retention_period

**Note:** Changes to the retention period cause 250.001 Configuration out-of-date alarms to be raised briefly for the controller nodes. During this period, the status Config out-of-date is displayed for the controller nodes on the **Host** tab of the **Inventory** pane. These alarms are resolved and cleared automatically after a few seconds.




<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----