---
layout: default
title: "HP Cloud OS for Moonshot: Administration Dashboard"
permalink: /cloudos/moonshot/manage/administration-dashboard/getting-started/
product: moonshot

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/administration-dashboard/before-you-begin/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage">&#9650; UP</a> | <a href="/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/">NEXT &#9654;</p></a>

# The Administration Dashboard #

The HP Cloud OS for Moonshot Administration Dashboard is the interface which is used to manage the cloud once the cloud environment is created in the Operational Dashboard.

The Administration Dashboard can be accessed by different user roles to perform the tasks assigned to that role. Apart from the basic functionalities, such as creating projects, users, roles, resource pools, topology templates etc.; HP Cloud OS for Moonshot Administrative Dashboard provides two major features to enhance your cloud experience.

* **Moonshot Management**

* **Workload Service**


&#9654; **Moonshot Management**

Management of IT resources in a cloud that is scalable and dynamic in nature is quite challenging. To have a simplified and enhanced cloud management experience, HP Cloud OS for Moonshot provides a Single Pane of Glass (SPOG) view with the Chassis Manager.

Chassis Manager caters to three important requirements of a Cloud Administrator.
 
* Displays  an overall perspective of the datacenter, hosted servers and health of chassis in the Datacenter View.
* Provides detailed information of individual chassis host and its health status in the Single Chassis View.
* Server management with the Power On/Off actions and Maintenance action

**Datacenter View**
 
It provides an overview of the managed chassis in a datacenter. In this view, Cloud Administrator is able to add/delete chassis which then goes on to discover all cartridges and nodes in a chassis. At a glance, the user is able to comprehend the datacenter health and view critical events that need immediate attention.

**Single Chassis View** 

It provides in-depth information of a selected chassis. In this view, the user is able to grasp the overall structure and health of the contained cartridges and nodes.

A drill-down to individual cartridge or node provides detailed information in terms of configuration, power status, health status, workload information etc. 
Event information at individual chassis level helps to monitor chassis events.
The user is also able to perform power Off/On operations on individual cartridges and nodes.
For more details on working with Moonshot Chassis, refer to the Moonshot Management section.


&#9654;**Workload Service**

In Cloud Enterprise IT, a typical goal is to deploy a composite service which comprises of different application components catering to different aspects of a service. Each application will have its own computing pattern defining its specific workload and hence needs specialized deployment of infrastructure elements i.e.  Compute, Storage and Network. Workload service aims to facilitate end user in deployment of a composite service comprising of different applications and hence different workloads in user friendly manner. For details on creating and provisioning a workload, refer to the Workloads section

## How to access the Administration Dashboard ##
Before you access the Administration Dashboard, ensure that the Cloud Environment is up and running.

You can access the HP Cloud OS for Moonshot Administration Dashboard in either of the following ways:

* In your browser window, type the public IP address of your Cloud Controller Node in the following format https://<Public IP Address>

   OR

* From the Operational Dashboard, click **Manage Clouds**->**More**->**Launch Dashboard**

The Administration Dashboard menu bar displays three different tabs- **Cloud**, **Region** and **Project**.  Each active tab displays options in the left panel. You can view tabs and options only if you have the required privileges. 

The dashboard also displays the currently logged in user, License Validity, Settings link, Help link and the Sign Out option on the top right corner of the screen.

## **Cloud Tab** ##
The tab displays different options in the left panel. The following table describes each of the option.

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: lightgrey; color: black;">

  <td><b>Panel Option</b></td> <td><b>Description</b></td></tr>

<tr style="background-color: white; color: black;">
<td>Services</td> <td>Allows you to view information related to cloud services.</td></tr>

<tr style="background-color: white; color: black;">
<td>Domains</td> <td>Allows you to view domain information.</td></tr>

<tr style="background-color: white; color: black;">
<td>Projects</td> <td>Allows you to manage projects, add users and add roles using this option.</td></tr>

<tr style="background-color: white; color: black;">
<td>Users</td> <td>Allows you to create new users and modify and delete existing users.</td></tr>

<tr style="background-color: white; color: black;">
<td>Roles</td> <td>Allows you to create a new role and displays a list of existing cloud roles. You can also delete an existing role.</td></tr>

<tr style="background-color: white; color: black;">
<td>Images</td> <td>Allows you to create, view, modify, launch and delete all from which instances can be launched.</td></tr>

<tr style="background-color: white; color: black;">
<td>Moonshot Management </td> <td>Allows you to manage Moonshot Chassis and Moonshot servers. It also enables you to discover and allocate Moonshot Servers for provisioning.</td></tr></table>

## **Region Tab** ##

The Region tab displays the following option to work with in the compute region. 
<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: lightgrey; color: black;">

  <td><b>Panel Option</b></td> <td><b>Description</b></td></tr>
<tr style="background-color: white; color: black;">

<td>Overview</td> <td>Allows you to view the detailed usage summary of a region. By default, it is displayed for the current month.</td></tr>

<tr style="background-color: white; color: black;">
<td>Info</td> <td>Displays the details of the Compute Services and Default Quotas.</td></tr>

<tr style="background-color: white; color: black;">
<td>Instances</td> <td>Displays the list of instances.</td></tr>

<tr style="background-color: white; color: black;">
<td>Images</td> <td>This option allows you to create, view, modify, launch and delete images. </td></tr>

<tr style="background-color: white; color: black;">
<td>Networks</td> <td>This tab provides a way to view networks details.</td></tr>
</td>

</tr><tr style="background-color: white; color: black;">
<td>Flavors</td> <td>Displays the list of flavors in the region. You can create, modify, delete flavors and also view extra specifications of the selected flavor.</td></tr></table>

## **Project Tab** ##
This tab allows you to use the following options. 
<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: lightgrey; color: black;">

  <td><b>Panel Option</b></td> <td><b>Description</b></td></tr>
<tr style="background-color: lightgrey; color: black;">
<td><b>Overview</b></td> <td></td></tr>

<tr style="background-color: white; color: black;">
<td>Overview</td> <td>Allows you to view the detailed usage summary of a region.</td></tr>

<tr style="background-color: lightgrey; color: black;">
<td><b>Provisioning</b></td> <td></td></tr>

<tr style="background-color: white; color: black;">
<td>Workloads</td> <td>Displays Workload services. These services aim to facilitate you in deployment of a composite service comprising of different applications and hence different workloads.</td></tr>

<tr style="background-color: white; color: black;">
<td>Running Topologies </td> <td>Displays a list of topologies that have been provisioned from deployment profiles.</td></tr>

<td>Deployment Profiles</td> <td>Displays a list of published topology designs. These profiles can be provisioned.</td></tr>

<tr style="background-color: white; color: black;">
<td>Topology Designs</td> <td>Displays a list of topology designs. A topology design is used for straightforward IaaS deployments, and allows you to design in a free-form layout where connection relationships implicitly define the service fulfillment lifecycle.</td></tr>

<tr style="background-color: white; color: black;">
<td>Resource Pools</td> <td>Records that define the access to a specific cloud provider, resources that are made available by the provider and services associated with the resources.</td></tr>

<tr style="background-color: lightgrey; color: black;">
<td><b>Infrastructure</b></td> <td></td></tr>

<tr style="background-color: white; color: black;">
<td>Instances</td> <td>Displays the list of running instances.</td></tr>

<tr style="background-color: white; color: black;">
<td>Images </td> <td>Displays all the images (QCOW2 format) that can be launched to create new instances.</td></tr>

<tr style="background-color: white; color: black;">
<td>Networks </td> <td>You can view the network details using this option.</td></tr>
<tr style="background-color: lightgrey; color: black;">
<td><b>Access and Security</b></td> <td></td></tr>

<tr style="background-color: white; color: black;">
<td>Access & Security </td> <td>This option allows you create and manage Keypairs, view API Endpoints and view Authentication Token.</td></tr>

<tr style="background-color: lightgrey; color: black;">
<td><b>Updates and Extensions</b></td> <td></td></tr>

<tr style="background-color: white; color: black;">
<td>Updates and Extensions </td> <td>This option allows you to download content files from HP Cloud OS Delivery Network (CODN) and use it in your cloud environment.</td></tr></table>

## **Settings Link** ##

The Settings link is visible with all its options to the Admin User and Cloud Administrator. The Site option is not visible to other users. It displays the following options:

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: lightgrey; color: black;">

  <td><b>Panel Option</b></td> <td><b>Description</b></td></tr>
<tr style="background-color: ligtgrey; color: black;">

<tr style="background-color: white; color: black;">
<td>Site </td> <td>Allows you to change the site settings as per your requirements.</td></tr>

<tr style="background-color: white; color: black;">
<td>User </td> <td>Allows you to select various user settings such as language, time zone and items per page.</td></tr>

<tr style="background-color: white; color: black;">
<td>Password </td> <td>Allows you to change your password.</td></tr>

<tr style="background-color: white; color: black;">
<td>About </td> <td>Allows you to view version and copyright information.</td></tr></table>

## Help ##

This option takes you to the Help documentation page of Administration Dashboard.