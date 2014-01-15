---
layout: default
title: "Getting Started with the Administration Dashboard"
permalink: /cloudos/manage/administration-dashboard/getting-started/
product: cloudos

---


<a name="_top"> </a>

<script> 

function PageRefresh { 
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/manage/administration-dashboard/welcome/">&#9664; PREV</a> | <a href="/cloudos/manage/administration-dashboard/">&#9650; UP</a> | <a href="/cloudos/manage/administration-dashboard/topology-designs/">NEXT &#9654;</a> </p>

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

* How to Create a Project

* How to Create a User

* How to See All Domains

* How to See All Services

These descriptions are coming soon in the format of other HP Cloud OS topics. For now, please see 
<a href="http://docs.hpcloud.com/cloudos/administration-dashboard/index.htm">this copy on the website</a>. 

When you are done, tell a cloud administrator to perform [Getting Started for Cloud Administrators](#getting-started-for-cloud-administrators). 

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## Getting Started for Cloud Administrators

**Concepts:**

Cloud administrators possess all administrator rights associated with the cloud and all HP Cloud OS services, 
including the ability to make resources available to users.

**Tasks:**

* How to Import, Create, or Delete a Keypair

* How to Access All Images

* How to Change a Project's Compute or Storage Limits

* How to Create an External Network

* How to Create a Subnet

* Resource Pools

* How to See an Overview of Usage

However, some organizations might also use cloud administrators to create profiles and topology designs. See:

* How to Create a Deployment Profile

* How to Create a Topology Design

These descriptions are coming soon in the format of other HP Cloud OS topics. For now, please see 
<a href="http://docs.hpcloud.com/cloudos/administration-dashboard/index.htm">this copy on the website</a>. 

When you are done, tell a cloud architect to perform [Getting Started for Cloud Architects](#getting-started-for-cloud-architects). 

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Getting Started for Cloud Architects

**Concepts:**

Cloud architects create images, topology designs, and deployment profiles.

**Tasks:**

* How to Import, Create, or Delete a Keypair

* How to Access All Images

* How to Create a Deployment Profile

* How to Create a Topology Design

These descriptions are coming soon in the format of other HP Cloud OS topics. For now, please see 
<a href="http://docs.hpcloud.com/cloudos/administration-dashboard/index.htm">this copy on the website</a>. 

When you are done, tell a project administrator to perform [Getting Started for Project Administrators](#getting-started-for-project-administrators).

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## Getting Started for Project Administrators

**Concepts:**

Project administrators have rights to modify and delete project resources and content. Project administrators can also see 
and manage project resources that are created by project users. See [Project User Tasks](#).

**Tasks:**

* How to Import, Create, or Delete a Keypair

* Images and Snapshots

* How to Launch an Instance

* How to Create a Private Network

* How to Create a Subnet

* Routers

* Security Groups and Rules

* How to Create a Deployment Profile

* How to Create a Topology Design

These descriptions are coming soon in the format of other HP Cloud OS topics. For now, please see 
<a href="http://docs.hpcloud.com/cloudos/administration-dashboard/index.htm">this copy on the website</a>.

Some organizations might also use project administrators to create resource pools. See [How to Create a Resource Pool](#).

When you are done, tell your project users that they can start working in the HP Cloud OS Administration Dashboard. See [Getting Started for Project Users](#getting-started-for-project-users).

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## Getting Started for Project Users

**Concepts:**

Project users own only the content and resources they create. Project users can modify or delete the content and resources they own. 
Project users' main goal when using the dashboard is to provision topologies.

**Tasks:**

* How to Import, Create, or Delete a Keypair

* Running Topologies

* How to Launch a Topology

* How to Create a Deployment Profile

* How to Create a Topology Design

* How to Launch a Deployment Profile

* How to Create or Delete a Security Group

These descriptions are coming soon in the format of other HP Cloud OS topics. For now, please see 
<a href="http://docs.hpcloud.com/cloudos/administration-dashboard/index.htm">this copy on the website</a>.

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
