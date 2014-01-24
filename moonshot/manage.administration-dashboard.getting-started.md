---
layout: default
title: "Getting Started with the Administration Dashboard"
permalink: /cloudos/moonshot/manage/administration-dashboard/getting-started/
product: cloudos

---


<a name="_top"> </a>

<script> 

function PageRefresh { 
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/administration-dashboard/welcome/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage/administration-dashboard/">&#9650; UP</a> | <a href="/cloudos/moonshot/manage/administration-dashboard/topology-designs/">NEXT &#9654;</a> </p>

# Getting Started with the Administration Dashboard

**Concepts:**

When you start the Administration Dashboard for the first time, it includes one user (the Admin user), and one project (the AdminProject). 
To validate that the dashboard works, and to get started using it, users must work through a series of tasks.

The highest-level user in the dashboard (the Admin user) begins the process of getting started by performing role-specific tasks. 
Then the next role down in the privilege hierarchy (a cloud administrator) must perform role-specific tasks. The process of getting 
started continues down the privilege hierarchy to project users.

Generally, the privilege hierarchy gives each role all the rights of the roles beneath it. For example, a project administrator 
can perform all the tasks of a project user, plus some additional tasks. Occasionally, the HP Cloud OS Administration Dashboard Help 
provides guidance for best practices that supplement the privilege hierarchy.

**Tasks:**

To get started with the Administration Dashboard, the Admin user must begin with:

* [Getting Started for the Admin User](#getting-started-for-the-admin-user)

Other role-specific tasks:

* [Getting Started for Cloud Administrators](#getting-started-for-cloud-administrators) 

* [Getting Started for Cloud Architects](#getting-started-for-cloud-architects)

* [Getting Started for Project Administrators](#getting-started-for-project-administrators)

* [Getting Started for Project Users](#getting-started-for-project-users)




## Getting Started for the Admin User

**Concepts:**

The Admin user creates projects and creates users for projects. An Admin user can view domains and services, and delete protected images.

**Tasks:**

For each task, the link goes to a section in the Tasks by Tabs topic.    

* [How to Create a Project](/cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/#how-to-create-a-project)

* [How to Create a User](/cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/#how-to-create-a-user)

* [How to See All Domains](/cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/#how-to-see-all-domains)

* [How to See All Services](/cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/#how-to-see-all-services)

When you are done, tell a cloud administrator to perform [Getting Started for Cloud Administrators](#getting-started-for-cloud-administrators). 

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>




## Getting Started for Cloud Administrators

**Concepts:**

Cloud administrators possess all administrator rights associated with the cloud and all HP Cloud OS services, 
including the ability to make resources available to users.

**Tasks:**

* [How to Import, Create, or Delete a Keypair](/cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/#how-to-import-create-or-delete-a-keypair)

* [How to Access All Images](/cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/#how-to-access-all-images)

* [How to Change a Project's Compute or Storage Limits](/cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/#how-to-change-a-projects-compute-or-storage-limits)

* [How to Create an External Network](/cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/#how-to-create-an-external-network)

* [How to Create a Subnet](/cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/#how-to-create-a-subnet)

* [Resource Pools](/cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/#resource-pools)

* [How to See an Overview of Usage](/cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/#how-to-see-an-overview-of-usage)


However, some organizations might also use cloud administrators to create profiles and topology designs. See:

* [How to Create a Deployment Profile](/cloudos/moonshot/manage/administration-dashboard/topology-designs/#how-to-create-a-deployment-profile) 

* [How to Create a Topology Design](/cloudos/moonshot/manage/administration-dashboard/topology-designs/#how-to-create-a-topology-design)


When you are done, tell a cloud architect to perform [Getting Started for Cloud Architects](#getting-started-for-cloud-architects). 

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>





## Getting Started for Cloud Architects

**Concepts:**

Cloud architects create images, topology designs, and deployment profiles.

**Tasks:**

* [How to Import, Create, or Delete a Keypair](/cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/#how-to-import-create-or-delete-a-keypair)

* [How to Access All Images](/cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/#how-to-access-all-images) 

* [How to Create a Deployment Profile](/cloudos/moonshot/manage/administration-dashboard/topology-designs/#how-to-create-a-deployment-profile)

* [How to Create a Topology Design](/cloudos/moonshot/manage/administration-dashboard/topology-designs/#how-to-create-a-topology-design)

When you are done, tell a project administrator to perform [Getting Started for Project Administrators](#getting-started-for-project-administrators).

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## Getting Started for Project Administrators

**Concepts:**

Project administrators have rights to modify and delete project resources and content. Project administrators can also see 
and manage project resources that are created by project users. See [Project User Tasks](/cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/#.

**Tasks:**

* [How to Import, Create, or Delete a Keypair](/cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/#how-to-import-create-or-delete-a-keypair)

* [Images and Snapshots](/cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/#images-and-snapshots)

* [How to Launch an Instance](/cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/#how-to-launch-an-instance)

* [How to Create a Private Network](/cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/#how-to-create-a-private-network-project-tab)

* [How to Create a Subnet](/cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/#how-to-create-a-subnet)

* [Routers](/cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/#routers)

* [Security Groups and Rules](/cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/#security-groups-and-rules)

* [How to Create a Deployment Profile](/cloudos/moonshot/manage/administration-dashboard/topology-designs/#how-to-create-a-deployment-profile)

* [How to Create a Topology Design](/cloudos/moonshot/manage/administration-dashboard/topology-designs/#how-to-create-a-topology-design)

Some organizations might also use project administrators to create resource pools. 
See [How to Create a Resource Pool](/cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/#how-to-create-a-resource-pool).

When you are done, tell your project users that they can start working in the HP Cloud OS Administration Dashboard. 
See [Getting Started for Project Users](#getting-started-for-project-users).

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## Getting Started for Project Users

**Concepts:**

Project users own only the content and resources they create. Project users can modify or delete the content and resources they own. 
Project users' main goal when using the dashboard is to provision topologies.

**Tasks:**

* [How to Import, Create, or Delete a Keypair](/cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/#how-to-import-create-or-delete-a-keypair)

* [Running Topologies](/cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/#running-topologies)

* [How to Launch a Topology](/cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/#how-to-launch-a-topology)

* [How to Create a Deployment Profile](/cloudos/moonshot/manage/administration-dashboard/topology-designs/#how-to-create-a-deployment-profile)

* [How to Create a Topology Design](/cloudos/moonshot/manage/administration-dashboard/topology-designs/#how-to-create-a-topology-design)

* [How to Launch a Deployment Profile](/cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/#how-to-launch-a-deployment-profile)

* [How to Create or Delete a Security Group](/cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/#how-to-create-or-delete-a-security-group) 

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

