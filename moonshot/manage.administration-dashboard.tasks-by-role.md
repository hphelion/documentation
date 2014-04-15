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

<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage">&#9650; UP</a> | NEXT &#9654;</p>

# User Roles and Their Tasks  #

The HP Cloud OS for Moonshot Administration Dashboard can be accessed by different users. Each user role is customized and has different privileges attached to it. The Administration Dashboard displays differently for each user role.  Different user roles and their privileges are defined in the table below:

<table style="text-align: left; vertical-align: top; width:700px;">

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

* [Change Settings](http://cloudos/moonshot/manage/administration-dashboard/working-with-cloud-tab/)

* [Create Projects](http://cloudos/moonshot/manage/administration-dashboard/working-with-cloud-tab/)

* [Create Users](http://cloudos/moonshot/manage/administration-dashboard/working-with-cloud-tab/)

* [View  Domains](http://cloudos/moonshot/manage/administration-dashboard/working-with-cloud-tab/)

* [View Services](http://cloudos/moonshot/manage/administration-dashboard/working-with-cloud-tab/)
 
## Cloud Administrator Tasks ##

After the cloud is created, the Cloud Administrators can focus on day-to-day cloud administration tasks. Although Cloud administrators can access all the tabs in the Administration Dashboard, they primarily concentrate on the following tasks.

* [Cloud Tab Tasks](http://cloudos/moonshot/manage/administration-dashboard/working-with-cloud-tab/)

* [Region Tab Tasks](http://cloudos/moonshot/manage/administration-dashboard/working-with-region-tab/)

* [Manage Updates and Extensions](http://cloudos/moonshot/manage/administration-dashboard/updates-extensions/)

* [Manage Workloads](http://cloudos/administration-dashboard/workloads/)

* [Manage Resource Pools](http://cloudos/administration-dashboard/resource-pool/)

* [Working with Access and Security](http://cloudos/administration-dashboard/access-and-security/)

* [Administration Dashboard Settings](http://cloudos/administration-dashboard/settings-tab/)


## Cloud Architect Tasks ##

The role of the Cloud Architect involves working with creating topology designs and deployment profiles. Once the cloud and projects are created by the Cloud Administrator, Cloud Architects can focus on day-to-day cloud architect tasks. Cloud architects are mostly concerned with creating topology designs and deployment profiles. They have the privileges to perform the following tasks:

* [Working with Topology Designer](http://cloudos/administration-dashboard/topology-designs/)

* [Project Overview](http://cloudos/administration-dashboard/working-with-cloud-tab/)

* [Manage Running Topologies](http://cloudos/administration-dashboard/running-topologies/)

* [Manage Deployment Profiles](http://cloudos/administration-dashboard/deployment-profiles/)

* [Manage Resource Pools](http://cloudos/administration-dashboard/resource-pool/)

* [Manage Instances](http://cloudos/administration-dashboard/project-instances/)

* [Manage Images](http://cloudos/administration-dashboard/project-images/)

* [Manage Updates and Extensions](http://cloudos/administration-dashboard/updates-extensions/)

* [Using Deployed Workloads](http://cloudos/administration-dashboard/workloads/)


## Project Administrator Tasks ##

The Project Administrators focus on their day-to-day tasks of monitoring and maintaining project resources and content. Project administrators have all the rights of project users, as well the rights to modify or delete project resources and content. Project Administrators can work on all the projects of which they are the members and perform all project related tasks.
Project Administrators maintain projects and performs the following tasks:

* [Working with Topology Designer](http://cloudos/administration-dashboard/topology-designs/)

* [Project Overview](http://cloudos/administration-dashboard/working-with-project-tab/)

* [Manage Running Topologies](http://cloudos/administration-dashboard/running-topologies/)

* [Manage Deployment Profiles](http://cloudos/administration-dashboard/deployment-profiles/)

* [Manage Resource Pools](http://cloudos/administration-dashboard/resource-pools/)

* [Manage Instances](http://cloudos/administration-dashboard/project-instances/)

* [Manage Images](http://cloudos/administration-dashboard/project-images/)

* [Manage Networks](http://cloudos/administration-dashboard/project-networks/)

* [Working with Access and Security](http://cloudos/administration-dashboard/access-and-security/)

* [Using Deployed Workloads](http://cloudos/administration-dashboard/workloads/)

* [Administration Dashboard Settings](http://cloudos/administration-dashboard/settings-tab/)

## Project User Tasks ##

The Project Users work on the project tasks. They create topology designs and deployment profiles, and work with the different Project tab options.
Project Users perform the following tasks:

* [Working with Topology Designer](http://cloudos/administration-dashboard/topology-designs/)

* [Viewing Project Overview](http://cloudos/administration-dashboard/working-with-project-tab/)

* [Manage Running Topologies](http://cloudos/administration-dashboard/running-topologies/)

* [Manage Deployment Profiles](http://cloudos/administration-dashboard/deployment-profiles/)

* [Manage Resource Pools](http://cloudos/administration-dashboard/resource-pools/)

* [Working with Project Instances](http://cloudos/administration-dashboard/project-instances/)

* [View Project Images](http://cloudos/administration-dashboard/project-images/)

* [Manage Networks](http://cloudos/administration-dashboard/project-networks/)

* [Using Deployed Workloads](http://cloudos/administration-dashboard/workloads/)

* [Working with Access and Security](http://cloudos/administration-dashboard/access-and-security/)

* [Administration Dashboard Settings](http://cloudos/administration-dashboard/settings-tab/)



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

























