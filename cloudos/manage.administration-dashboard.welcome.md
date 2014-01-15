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



### Administration Dashboard Tabs

Roles define the type of access a user is granted within the cloud.

#### Cloud Level Roles

Admin user: Admin role is best suited to create projects, and create users and assign the users to project. The Admin role can view domains and services, and delete protected images.
 
**Caution:** Although the Admin user has extensive permission rights, the user role is nontraditional and very limited in function. Due to a defect located in the Keystone identity service, the Admin user should only create projects and create users. If an Admin user attempts other tasks, the HP Cloud OS Administration Dashboard returns unpredictable functionality. In particular, an Admin user should not remove users from projects.

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

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

