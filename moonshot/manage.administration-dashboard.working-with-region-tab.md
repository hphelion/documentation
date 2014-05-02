---
layout: default
title: "HP Cloud OS for Moonshot: Administration Dashboard"
permalink: /cloudos/moonshot/manage/administration-dashboard/working-with-region-tab/
product: moonshot

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href=""/cloudos/moonshot/manage/administration-dashboard/before-you-begin/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage/administration-dashboard/before-you-begin/">&#9650; UP</a> | <a href="/cloudos/moonshot/manage/administration-dashboard/region-instances/"> NEXT &#9654; </p></a>


#Working with Region Tab#

The Region Tab displays all the options in the left panel for the Cloud Administrators.

* Login to the HP Cloud OS for Moonshot Administration Dashboard with the Cloud Administrator credentials.
The Administration Dashboard is displayed with a menu bar at the top displaying three tabs:
**Project**, **Region**, and **Cloud**.

* Click **Region** Tab to select it. 
The screen is displayed with the region details and the options in the left panel.

You can perform the following task:

* <a href="#Region Overview">Region Overview</a>

* <a href="#Region Info">Region Info</a>

* [Manage Region Instances](http://cloudos/moonshot/manage/administration-dashboard/region-instances/)

* [Manage Images](http://cloudos/moonshot/manage/administration-dashboard/region-images/) 

* [Manage Networks](http://cloudos/moonshot/manage/administration-dashboard/region-networks/)

* [Manage Flavors](http://cloudos/moonshot/manage/administration-dashboard/region-flavors/)

##Region Overview <a name= "Region Overview"></a>

To view the details of the region, perform the following:

1.	Click the **Region** Tab to select it.<br>
By default, Overview is the active tab and displays the region details and region usage summary of the current month.

2.	To view the details of a different month, in the **Select a period of time to query its usage** section, perform the following:

 * In the **From** box, click to select the start date.
 
 * In the **To** box, click to select the end date.

 * Click **Submit**.<br>
The usage summary of the selected period is displayed.

3.	Click **Download CSV Summary** to view a text file in Microsoft Excel with the details of the region usage summary.

##Region Info <a name= "Region Info"></a>

The Info option allows user to view the list of services, compute services and default quotas.

To view the info details of the region:

1.	Click the **Region** Tab to select it.

2.	From the options in the left panel, select **Info** to display a page with three tabs- **Services**, **Compute Services**, **Default Quotas**.<br>
By default, Services is the active tab and displays all the services being used in the region. Services can be run on the same node as the compute region controller or they can be run on a different server.

3.	To view the compute service details, click the **Compute Services** Tab to activate it.<br>
A list of compute services is displayed for the region.

4.	To view the default quotas, click the **Default Quotas** Tab to activate it.<br>
A list of default quotas is displayed.
 

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
