---
layout: default
title: "Welcome to the HP Cloud OS Administration Dashboard"
permalink: /cloudos/manage/administration-dashboard/welcome/
product: cloudos

---


<a name="_top"> </a>

<script> 

function PageRefresh { 
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/manage/administration-dashboard/before-you-begin/">&#9664; PREV</a> | <a href="/cloudos/manage/administration-dashboard/">&#9650; UP</a> | <a href="/cloudos/manage/administration-dashboard/getting-started/">NEXT &#9654;</a> </p>

# Welcome to the HP Cloud OS Administration Dashboard

**Concepts:**

* [Why You Use the Administration Dashboard](#why-you-use-the-administration-dashboard)

* [Administration Dashboard Look and Feel](#administration-dashboard-look-and-feel)

**Tasks:**

* [Prerequisites to Accessing the Administration Dashboard](#prerequisites-to-accessing-the-administration-dashboard)

* [How to Log in to the Administration Dashboard](#how-to-log-in-to-the-administration-dashboard)

## Why You Use the Administration Dashboard

You can use the Administration Dashboard as a simplified means of creating and managing HP Cloud OS resources, topology designs, and deployment profiles.

The Administration Dashboard also provides the ability to provision a composite topology described by the topology templates and infrastructure design 
documents. The Administration Dashboard is associated with a single cloud. 

You can use the Administration Dashboard to view, allocate, and manage all virtual resources within a cloud. 

## Administration Dashboard Look and Feel

**Concepts:**

The Administration Dashboard provides customized views by role. You see only the tabs and panels you need to do your job.

**Related topics:**

* [Administration Dashboard Roles](#administration-dashboard-roles)

* [Administration Dashboard Tabs](#administration-dashboard-tabs)

### Administration Dashboard Roles

Roles define the type of access a user is granted within the cloud.

#### Cloud Level Roles

**Admin user:** Admin role is best suited to create projects, and create users and assign the users to project. The Admin role can view domains and services, and delete protected images.
 
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:700px;"> <b>Caution:</b> 
Although the Admin user has extensive permission rights, the user role is nontraditional and very limited in function. 
Due to a defect located in the Keystone identity service, the Admin user should only create projects and create users. 
If an Admin user attempts other tasks, the HP Cloud OS Administration Dashboard returns unpredictable functionality. 
In particular, an Admin user should not remove users from projects. </p>

**Cloud Administrator:** All administrator rights associated with the cloud and all HP Cloud OS services, including the ability to make resources available to users. Has global permission across the cloud, including all regions and projects.

**Cloud Architect:** Creates topology designs, deployment profiles, and load balancers.

#### Project Level Roles

**Project Administrator:** Has rights to modify and delete project resources and content. Multiple users can be assigned the role of project administrator.

**Project Users:** Own only the content and resources they create. Project users can modify or delete the content and resources they own. They can also use shared resources with their project and cloud.

#### Ownership Rules

General rules about ownership in the Administration Dashboard include:

* To create resources or content within a project, you must be associated with the project and have either an administrative role or a specific creation role. The project user role automatically includes creation roles for most types of resources.

* A project administrator can modify the project's resources and content. Non-administrators can modify only the resources and content they create.

* Users with a specific publishing role can scope content Public, Project.
  
* Cloud administrators can scope content Public, Cloud.

#### Visibility Rules

General rules about visibility in the Administration Dashboard include:

* Project users can see all the project's Public scoped resources and content. The scope can be Public, Cloud or Public, Project.

* Project users cannot see content within their project if the content was created by other users and scoped Private, Project or Private, Cloud.

* All users can see content that is marked Public, Cloud.

### Administration Dashboard Tabs

#### Settings Tab

Every HP Cloud OS Administration Dashboard user can see the Settings tab.

Every window in the Administration Dashboard provides a link to this tab.

<table style="text-align: left; vertical-align: top; min-width:600px;">

<tr style="background-color: #C8C8C8;">
<th> Panel </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> User </td>
<td> To select various user settings such as language, time zone, and items per page. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> Password </td>
<td> To change your password. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> About </td>
<td> To view version and copyright information. </td> 
</tr>

</table>




#### Project Tab

Every HP Cloud OS Administration Dashboard user can see the Project tab.

<table style="text-align: left; vertical-align: top; min-width:600px;">

<tr style="background-color: #C8C8C8;">
<th> Panel </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> Overview </td>
<td> Displays a Project Usage Summary. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td colspan="2" style="background-color: #f8f8f8;"> Provisioning </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Running Topologies </td>
<td> Displays a list of the topologies that have been provisioned from deployment profiles. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Deployment Topologies </td>
<td> Displays a list of published topology designs. These profiles can be provisioned. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Topology Designs </td>
<td> Displays a list of topology designs. A topology design is used for straightforward IaaS deployments, and allows you to 
design in a free-form layout where connection relationships implicitly define the service fulfillment lifecycle.  </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Resource Pools </td>
<td> Records that define the access to a specific cloud provider, resources that are made available by the provider, and services 
associated with the resources.
</td> 
</tr>

<tr style="background-color: white; color: black;">
<td colspan="2" style="background-color: #f8f8f8;"> Infrastructure </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Instances </td>
<td> A list of all VMs running within the project.
</td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Volumes </td>
<td> All of the disk storage volumes that have been allocated to the project.
</td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Images and Snapshots </td>
<td>  Images are all the launchable images (AMI, RAW, and QCOW2 format) that can be used to create new VMs.
<br /> <br />
Snapshots preserve the disk state of running Instances and Volumes.
</td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Networks </td>
<td> Define networks and subnets that can be used when building topologies and interconnecting virtual machine instances.
</td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Routers </td>
<td> Create routers that can be used in building topologies.
</td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Network Topology </td>
<td> Provides a graphical view of virtual machine instances and the layout of the network, based upon the information in the Networks window and Routers window.
</td> 
</tr>

<tr style="background-color: white; color: black;">
<td colspan="2" style="background-color: #f8f8f8;"> Access and Security </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Security Groups </td>
<td> Limit the port into which network traffic can enter the group, to provide some network isolation between VMs. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Keypairs </td>
<td> The ssh security keys that let you exchange traffic securely within a VM. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Floating IPs </td>
<td> Lists the floating IPs currently in use and lets you allocate additional floating IP addresses to a project. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> API Access </td>
<td> Displays the API endpoints for the Cloud OS services. Use the endpoints to access the Cloud OS services REST APIs. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Authentication Token </td>
<td> The Administration Dashboard retrieves this token from the Keystone service when you log in to the dashboard. 
You can access the token for use outside the dashboard. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td colspan="2" style="background-color: #f8f8f8;"> Updates and Extensions </td>
</tr>

<tr style="background-color: white; color: black;">
<td>  Updates and Extensions </td>
<td> Access the HP Cloud OS Distribution Network to update and upgrade your cloud while it continues to run. </td> 
</tr>

</table>

#### Region Tab

Only the Admin user and cloud administrators see the Region tab.

<table style="text-align: left; vertical-align: top; min-width:600px;">

<tr style="background-color: #C8C8C8;">
<th> Panel </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> Overview </td>
<td> Provides usage information for all regions (in other words, the cloud). </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Instances </td>
<td> A list of all VMs for all regions (in other words, the cloud). </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Info </td>
<td> A region-specific list of services, compute services, and default quotas (limits). </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Volumes </td>
<td> All of the disc storage volumes for all regions (in other words, the cloud).  </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Images </td>
<td> A list of images that you can launch for all regions (in other words, the cloud).
</td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Networks </td>
<td> Provides a way to define networks that can be used when building topologies and interconnecting virtual machine instances. 
The list is for all regions (in other words, the cloud).
</td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Routers </td>
<td> Lets you delete routers that can be used in building topologies and connecting instances. The list is for all regions (in other words, the cloud).
</td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Flavors </td>
<td> A list of machine configurations that can be used to create new VMs. A flavor describes the amount of memory, number of CPUs, and 
ephemeral disk space available to the VM. The list is for all regions (in other words, the cloud). 
</td> 
</tr>

</table>


#### Cloud Tab

Only the Admin user and cloud administrators can see the Cloud tab. 

<table style="text-align: left; vertical-align: top; min-width:600px;">

<tr style="background-color: #C8C8C8;">
<th> Panel </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> Services </td>
<td> A read-only list of all services running in the cloud. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Domains </td>
<td> A read-only list of all domains in the cloud. (Currently, only one domain.) Only the Admin user can see this window. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Projects </td>
<td> A list of all projects in the cloud.
<br />  <br /> 
Projects are created by a cloud administrator and allow a group of users to see the same set of resources. 
You can manage projects, add users, and manage user roles. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Users </td>
<td> A list of all users in the cloud.
<br />  <br /> 
Allows you to work with the users (create, delete, and edit). </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Roles </td>
<td> A list of all roles in the cloud. Allows you to work with the roles (create and delete). </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Images </td>
<td> A list of all images in the cloud.
<br />  <br /> 
Allows you to work with the images (create, launch and delete). 
</td> 
</tr>

</table>

## Prerequisites to Accessing the Administration Dashboard

Before you can access the HP Cloud OS Administration Dashboard, someone in your organization must use the HP Cloud OS Operational Dashboard 
to install, set up, configure, and stand up a cloud environment. Use Operational Dashboard to set up and install an Admin node, create a cloud, 
define compute regions, and apply updates and extensions to your cloud. See the [HP Cloud OS Operational Dashboard Help](/cloudos/manage/operational-dashboard/).

For instructions on how to use an advanced method of installing a cloud, see [Install and Configure Your Clouds](/cloudos/install).

## How to Log in to the Administration Dashboard

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:600px; border: 1px dotted #000000;"> <b>Important:</b> Use Google Chrome or 
Mozilla Firefox to access the Administration Dashboard.</p>

You can access the Administration Dashboard in one of two ways:

* Open a browser and type the URL using the public IP address of the Cloud Controller node: Login with the Admin account and password you 
specified on the Create Cloud > Attributes dialog in the HP Cloud OS Operational Dashboard.

* Within the Operational Dashboard, Manage Clouds > More > Launch Dashboard for the cloud you created.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

