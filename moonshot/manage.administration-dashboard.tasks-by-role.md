---
layout: default
title: "HP Cloud OS for Moonshot: Administration Dashboard"
permalink: /cloudos/moonshot/manage/administration-dashboard/tasks-by-role/
product: moonshot

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/administration-dashboard/getting-started/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage/administration-dashboard/before-you-begin/">&#9650; UP</a> | <a href="/cloudos/moonshot/manage/administration-dashboard/working-with-cloud-tab/">
NEXT &#9654;</p></a>

# User Roles and Their Tasks  #

The HP Cloud OS for Moonshot Administration Dashboard can be accessed by different users. Each user role is customized and has different privileges attached to it. The Administration Dashboard displays differently for each user role.  Different user roles and their privileges are defined in the table below:

<table style="text-align: left; vertical-align: top; width:650px;">

<tr style="background-color: lightgrey; color: black;">

 <td><b>S.No</b></td> <td><b>Role</b></td><td><b>Working Tab</b></td><td><b>Privileges</td></tr>

<tr style="background-color: white; color: black;">
<td>1</td> <td>Cloud Administrator or Cloud Admin</td><td>All Tabs (Cloud, Region, Project)</td><td>Cloud Administrator has all the privileges associated with the cloud and HP Cloud OS for Moonshot services including the assigning projects and resources to the users. Cloud Administrators have global permissions across cloud including all regions and projects. Cloud Administrators are members of every project by design.</td></tr>

<tr style="background-color: white; color: black;">
<td>2</td><td>Administrator or Admin User</td><td>All Tabs (Cloud, Region, Project)</td><td>Admin role is best suited to create projects, and create users and assign the users to project. The Admin role can view domains and services, and delete protected images.</td><tr>

<tr style="background-color: white; color: black;">
<td>3</td><td>Cloud Architect</td><td>Project Tab</td><td>Cloud Architect creates topology designs and deployment profiles for the assigned projects.</td></tr>

<tr style="background-color: white; color: black;">
<td>4</td><td>Project Administrator or Project Admin</td><td>Project Tab</td><td>Project Administrator has the privileges to modify and delete project resources and content. Multiple users can be assigned the role of Project Administrator. A Project Administrator is explicitly added as a member of a project or multiple projects.</td></tr>

<tr style="background-color: white; color: black;">
<td>5</td><td>Project User</td><td>Project Tab</td><td>Owns only the content and resources they create. Project users can modify or delete the content and resources they own. They can also use resources that are shared with their project or cloud.</td></tr></table>



The following section describes the Administration Dashboard tasks for each of the user roles. Generally, the privilege hierarchy gives each role all the rights of the roles beneath it. For example, a Project Administrator can perform all the tasks of a Project user, plus some additional tasks.

## Admin User Tasks ##

The Admin user has the privileges to create projects and users for the projects. Admin user can view domains and services, and delete protected images. Generally, the Admin user works on the AdminProject and performs the below mentioned tasks:

* [Change Settings](/cloudos/moonshot/manage/administration-dashboard/working-with-cloud-tab/)

* [Create Projects](/cloudos/moonshot/manage/administration-dashboard/working-with-cloud-tab/)

* [Create Users](/cloudos/moonshot/manage/administration-dashboard/working-with-cloud-tab/)

* [View  Domains](/cloudos/moonshot/manage/administration-dashboard/working-with-cloud-tab/)

* [View Services](/cloudos/moonshot/manage/administration-dashboard/working-with-cloud-tab/)
 
## Cloud Administrator Tasks ##

After the cloud is created, the Cloud Administrators can focus on day-to-day cloud administration tasks. Although Cloud administrators can access all the tabs in the Administration Dashboard, they primarily concentrate on the following tasks.

* [Cloud Tab Tasks](/cloudos/moonshot/manage/administration-dashboard/working-with-cloud-tab/)

* [Region Tab Tasks](/cloudos/moonshot/manage/administration-dashboard/working-with-region-tab/)

* [Manage Updates and Extensions](/cloudos/moonshot/manage/administration-dashboard/manage-updates-extensions/)

* [Manage Workloads](/cloudos/moonshot/manage/administration-dashboard/workloads/)

* [Manage Resource Pools](/cloudos/moonshot/manage/administration-dashboard/resource-pools/)

* [Working with Access and Security](/cloudos/moonshot/manage/administration-dashboard/manage-access-and-security/)

* [Administration Dashboard Settings](/cloudos/moonshot/manage/administration-dashboard/setting-tab/)


## Cloud Architect Tasks ##

The role of the Cloud Architect involves working with creating topology designs and deployment profiles. Once the cloud and projects are created by the Cloud Administrator, Cloud Architects can focus on day-to-day cloud architect tasks. Cloud architects are mostly concerned with creating topology designs and deployment profiles. They have the privileges to perform the following tasks:

* [Working with Topology Designer](/cloudos/moonshot/manage/administration-dashboard/topology-designs/)

* [Project Overview](/cloudos/moonshot/manage/administration-dashboard/working-with-cloud-tab/)

* [Manage Running Topologies](/cloudos/moonshot/manage/administration-dashboard/running-topologies/)

* [Manage Deployment Profiles](/cloudos/moonshot/manage/administration-dashboard/deployment-profiles/)

* [Manage Resource Pools](/cloudos/moonshot/manage/administration-dashboard/resource-pool/)

* [Manage Instances](/cloudos/moonshot/manage/administration-dashboard/project-instances/)

* [Manage Images](/cloudos/moonshot/manage/administration-dashboard/project-images/)

* [Manage Updates and Extensions](/cloudos/moonshot/manage/administration-dashboard/manage-updates-extensions/)

* [Using Deployed Workloads](/cloudos/moonshot/manage/administration-dashboard/workloads/)


## Project Administrator Tasks ##

The Project Administrators focus on their day-to-day tasks of monitoring and maintaining project resources and content. Project administrators have all the rights of project users, as well the rights to modify or delete project resources and content. Project Administrators can work on all the projects of which they are the members and perform all project related tasks.
Project Administrators maintain projects and performs the following tasks:

* [Working with Topology Designer](/cloudos/moonshot/manage/administration-dashboard/topology-designs/)

* [Project Overview](/cloudos/moonshot/manage/administration-dashboard/working-with-project-tab/)

* [Manage Running Topologies](/cloudos/moonshot/manage/administration-dashboard/running-topologies/)

* [Manage Deployment Profiles](/cloudos/moonshot/manage/administration-dashboard/deployment-profiles/)

* [Manage Resource Pools](/cloudos/moonshot/manage/administration-dashboard/resource-pools/)

* [Manage Instances](/cloudos/moonshot/manage/administration-dashboard/project-instances/)

* [Manage Images](/cloudos/moonshot/manage/administration-dashboard/project-images/)

* [Manage Networks](/cloudos/moonshot/manage/administration-dashboard/project-networks/)

* [Working with Access and Security](/cloudos/moonshot/manage/administration-dashboard/manage-access-and-security/)

* [Using Deployed Workloads](/cloudos/moonshot/manage/administration-dashboard/workloads/)

* [Administration Dashboard Settings](/cloudos/moonshot/manage/administration-dashboard/setting-tab/)

## Project User Tasks ##

The Project Users work on the project tasks. They create topology designs and deployment profiles, and work with the different Project tab options.
Project Users perform the following tasks:

* [Working with Topology Designer](/cloudos/moonshot/manage/administration-dashboard/topology-designs/)

* [Viewing Project Overview](/cloudos/moonshot/manage/administration-dashboard/working-with-project-tab/)

* [Manage Running Topologies](/cloudos/moonshot/manage/administration-dashboard/running-topologies/)

* [Manage Deployment Profiles](/cloudos/moonshot/manage/administration-dashboard/deployment-profiles/)

* [Manage Resource Pools](/cloudos/moonshot/manage/administration-dashboard/resource-pools/)

* [Working with Project Instances](/cloudos/moonshot/manage/administration-dashboard/project-instances/)

* [View Project Images](/cloudos/moonshot/manage/administration-dashboard/project-images/)

* [Manage Networks](/cloudos/moonshot/manage/administration-dashboard/project-networks/)

* [Using Deployed Workloads](/cloudos/moonshot/manage/administration-dashboard/workloads/)

* [Working with Access and Security](/cloudos/moonshot/manage/administration-dashboard/manage-access-and-security/)

* [Administration Dashboard Settings](/cloudos/moonshot/manage/administration-dashboard/setting-tab/)



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

























