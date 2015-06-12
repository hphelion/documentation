---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Cluster Overview"
permalink: /helion/openstack/carrier/admin/host/management/clusters/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Cluster Overview
<!-- From the Titanium Server Admin Guide -->

The Overview page appears when you log into the HP Helion OpenStack Carrier Grade web management interface as the administrator. It presents a dashboard providing a quick health-check overview of the cluster.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

The Overview page is an enhanced version of its OpenStack counterpart. It includes the following features:

* dynamically updated, relocatable resource charts. Click the top of any chart, and drag it to the desired location to customize the presentation as desired. The layout changes are persistent across logins.
* dynamically updated, relocatable Host Server Status summary table. Presents the total number of hosts currently
in one of the following states:
	* locked
	* unlocked
	* available
	* unavailable
	* degraded
* dynamically updated, relocatable Alarms summary table. Lists the current count of critical, major, minor, and
warning alarms.

Common attributes of the resource pages are:

* All resource charts display resource information in real-time, spanning over a time-window of ten minutes.
* Labels along the X-axis present the number of minutes elapsed since the last full-time hour of the system clock.
* Hovering the mouse over the charts overlays information windows with detailed values.
* History information is lost when the Overview page is no longer displayed.

The following charts are available:

**Compute vCPU Usage** - Presents information about the number of virtual CPUs across the entire cluster, available and allocated to virtual machines, and their average level of utilization. Elements in this chart are as follows:
* Y-axis is in units vCPUs.
* A solid black line tracking the number of available vCPUs. This line settles at a constant value at the top of the chart, unless the number of compute nodes changes over time.
* Light blue bars indicating the number of allocated vCPUs, that is, the number of vCPUs in use by virtual machines (one in the example).
* Dark blue bars indicating the average level of utilization of the allocated vCPUs (varies from 30 to 83% in the example), presented as a relative height with respect to the light blue bars.

**Instance CPU Utilization** - Presents information about virtual CPU utilization levels on virtual machines, across the entire cluster or for individual instances. Elements in this chart are as follows:

* Y-axis displays the virtual CPU utilization level, from 0 to 100%.
* A solid black line tracking the maximum utilization level.
* Dark blue bars indicating the average utilization level.
* A gray line tracking the minimum utilization level.
* A filter drop-down menu to select the virtual machines on which to report utilization levels. The default value for this filter is "All Instances," and therefore it reports the same utilization levels indicated by the dark blue bars in the Compute vCPU Usage chart.

**Compute Memory Usage** - Presents information about memory usage levels on the compute nodes across the entire cluster. Elements in this
chart are as follows:

* Y-axis is in units of bytes.
* A solid black line tracking the available aggregated compute memory. This line usually settles as a constant value at the top of the chart, unless the number of compute nodes changes over time.
* Dark blue bars indicating the amount of memory allocated to virtual machines (less than 1 GB in the example).

**Compute Disk Usage** - Presents information about disk usage levels on the compute nodes across the entire cluster. Elements in this chart
are as follows:

* Y-axis is in units of bytes.
* A solid black line tracking the available aggregated storage capacity. This line usually settles as a constant value at the top of the chart, unless the number of storage nodes changes over time.
* Dark blue bars indicating the amount of disk space allocated to virtual machines (about 1 GB in the example).

**AVS CPU Utilization** - Presents information about AVS CPU utilization levels on the compute nodes across the entire cluster. Elements in this chart are as follows:

* Y-axis displays the AVS CPU utilization level, from 0 to 100%.
* A solid black line tracking the maximum utilization level.
* Dark blue bars indicating the average utilization level.

**Provider Network Port Utilization** - Presents information about network traffic levels on provider networks across the entire cluster. Elements in this chart are as follows:

* Y-axis displays the port utilization level, from 0 to 100%.
* A solid black line tracking the maximum utilization level.
* Pairs of dark blue and dark green bars indicating the average utilization level, egress and ingress (Tx and Rx) traffic respectively.
* A gray line tracking the minimum utilization level.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----