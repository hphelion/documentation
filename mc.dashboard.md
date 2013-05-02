---
layout: page
title: "Management console main dashboard"
permalink: /mc/dashboard/
product: mc

---
# Management console main dashboard

This page provides you with an overview of the main management console (MC) dashboard, which displays overview information for your active services (such as compute).  This page discusses the following topics:

* [Overview of the dashboard](#Overview)
* [Compute pane](#compute)
* [Object storage pane](#object-storage)
* [Activity stream pane](#activitystream)

##Overview of the dashboard## {#Overview}

To access the main MC dashboard, from the `Dashboard` menu in the main menu bar select `All Services':

<img src="media/main-dash-all-services.png" width="580" alt="" />

The main MC dashboard displays all your active services.  In this example, the user has compute service active for region `US West`, an active object storage account, and his activity stream is displayed.  See the sections below for a bit more discussion!


##Compute pane## {#compute}

The compute pane of the main MC dashboard displays your active availability zones (AZs), divided by region.  This user, for example, has two AZs in region `US West`. 

<img src="media/main-dash.png" width="580" alt="" />

If you want to go straight to the compute dashboard without first going through the main MC dashboard, just select the `Compute` option from the `Dashboard` item in the main menu bar.

<img src="media/main-dash-compute-menu-detail.png" width="580" alt="" />

**Note**:  You can also navigate to a particular activity zone via the main menu bar.

You can display manage your activity by clicking the `Manage` buton next to the AZ you are interested in; this launches the Compute dashboard for that specific AZ.  For example, if you want to go to the AZ 1 for the `US West` region, just click that button to see that screen:

<img src="media/compute01.png" width="580" alt="" />

For additional information about the compute functions available through the MC, surf on over to the [MC compute page](/mc/compute).  For an overview of HP Cloud's compute features, please see the [HP Cloud compute overview](/compute) page.


##Object storage pane## {#object-storage}

The object storage pane of the main MC dashboard appears directly below the [compute pane](#compute), divided by region.

<img src="media/main-dash.png" width="580" alt="" />

To access your object storage containers, just click the `Browse Containers` button.  This launches the [object storage details screen](/mc/object-storage/details/) and displays your containers and any related information:

<img src="media/object-storage01.png" width="580" alt="" />

This user has two containers in the `US West` region: `Nova-stuff` (which contains one object) and `fog-rocks` (which is empty).  The information block for each container gives you the `Object Count`, `Size`, `Sharing` information, and indicates whether or not CDN is enabled.  You can also use the object storage details screen to create new public or private containers.

For additional information about the compute functions available through the MC, surf on over to the [MC object storage page](/mc/object-storage).  For an overview of HP Cloud's object storage features, please see the [HP Cloud object storage overview](/object-storage/) page.

##Activity stream pane## {#activitystream}

The activity stream pane helps you track of various data about the resources you're consuming, their performance, availability, and other activity.  

<img src="media/activity-stream-detail.png" width="580" alt="" />

This pane displays platform alerts, including appropriate date and time information:

<img src="media/Screen%20Shot%202012-11-09%20at%201.48.12%20PM_0.png" width="580" height="146" alt="" />

For more information, please see the [activity stream](/activity-stream/) page.

<!-- Other panes discussed as they are--theoretically--added 

##Monitoring pane## {#monitoring}

info

##RDB as a service pane## {#RDB}

info

##Load balancing as a service## {#LoadBalancing}

info

##DNS## {#DNS}

info

-->
