---
layout: default
title: "Administration Dashboard Tasks by Role"
permalink: /cloudos/manage/administration-dashboard/tasks-by-role/
product: cloudos

---


<a name="_top"> </a>

<script> 

function PageRefresh { 
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/manage/administration-dashboard/topology-designs/">&#9664; PREV</a> | <a href="/cloudos/manage/administration-dashboard/">&#9650; UP</a> | <a href="/cloudos/manage/administration-dashboard/tasks-by-tab/">NEXT &#9654;</a> </p>

# Administration Dashboard Tasks by Role

The following topics describe HP Cloud OS Administration Dashboard tasks for each dashboard role.

Generally, the privilege hierarchy gives each role all the rights of the roles beneath it. For example, 
a project administrator can perform all the tasks of a project user, plus some additional tasks. Occasionally, 
the HP Cloud OS Administration Dashboard Help provides guidance for best practices that supplement the privilege hierarchy.

**Tasks:**

* [Admin User Tasks](#admin-user-tasks)

* [Cloud Administrator Tasks](#cloud-administrator-tasks)

* [Cloud Architect Tasks](#cloud-architect-tasks)

* [Project Administrator Tasks](#project-administrator-tasks)

* [Project User Tasks](#project-user-tasks)


## Admin User Tasks

**Concepts:**

After your organization works through Getting Started, the Admin user can focus on day-to-day Admin user tasks. As a best practice, the Admin user creates 
projects and project users, and works on the AdminProject. The Admin user can also change site settings that affect all users, view domains and services, 
and delete protected images.

**Tasks:**

* [How to Create a Project](/cloudos/manage/administration-dashboard/tasks-by-tab/#how-to-create-a-project)

* [How to Create a User](/cloudos/manage/administration-dashboard/tasks-by-tab/#how-to-create-a-user)

* [How to Add or Remove a Project User](/cloudos/manage/administration-dashboard/tasks-by-tab/#how-to-add-or-remove-a-project-user)

* [How to See All Domains](/cloudos/manage/administration-dashboard/tasks-by-tab/#how-to-see-all-domains)

* [How to See All Services](/cloudos/manage/administration-dashboard/tasks-by-tab/#how-to-see-all-services)

* [How to Delete an Image](/cloudos/manage/administration-dashboard/tasks-by-tab/#how-to-delete-an-image)

* [Administration Dashboard Settings](/cloudos/manage/administration-dashboard/tasks-by-tab/#administration-dashboard-settings)

* [How to Change Site Settings](/cloudos/manage/administration-dashboard/tasks-by-tab/#how-to-change-site-settings)

* [Updates and Extensions](/cloudos/manage/administration-dashboard/tasks-by-tab/#updates-and-extensions)


### How to Change Site Settings

All Administration Dashboard users can access settings for User, Password, About, and Help.

Only the Admin user can access the Administration Dashboard Site Settings window. When the Admin user changes site settings, the changes affect all users of the site.

To access site settings:

1. Log in as the Admin user.

2. Click Settings in the upper right of any window.

3. Click Site.

On the Site Settings window, you can:

1. Change the log level.

2. Enable extra logging.

3. Change proxy settings.

#### To Change the Log Level

Use log level to capture more detailed log files when you need to troubleshoot, or to save disk space with less detailed log files when your system is running routinely.

Log levels are:

* <b>Debug</b> — Writes the most detailed log file messages.

* <b>Info</b> — Writes informational, warning, error, and critical messages to the log file.

* <b>Warning</b> — Writes warning, error, and critical messages to the log file. Informational messages are not written.

* <b>Error</b> — Writes error and critical messages to the log file. Informational and warning messages are not written.

* <b>Critical</b> — Writes only critical messages to the log file. Informational, error, and warning messages are not written.

The default log level is Info. To change the default, select a log level from the drop down list.

To view the Administration Dashboard log file:

1. Log into the cloud controller node.

2. Go to the folder <code>/var/log/skyline</code>, and view the file skyline.log.

 
#### To Enable Extra Logging

Certain functional areas are set to generate informational messages. Log level does not control the functional area level of log information unless you select that area.

Select a functional area to change log file messages from informational to more detailed messages. You can select the following areas to enable extra logging:

* <b>Documents</b>

* <b>Resource Pools</b>

* <b>Topologies</b>

* <b>Service REST APIs</b>


#### To Change Proxy Settings

The Admin user can change proxy information from the default values that were entered in the installer. You use a proxy when you upload or create images, and when you provision to HP Cloud Services.

You might need to change your proxy information if your default proxy server fails or if you prefer to use a different proxy server.

You can change the following proxy information:

* <b>Proxy Host</b>

* <b>Proxy Port</b>

* <b>Proxy Exceptions</b>

* <b>Proxy Username</b>

* <b>Proxy Password</b> and <b>Confirm Proxy Password</b>



<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
	
## Cloud Administrator Tasks

**Concepts:**

After your organization works through [Getting Started with the Administration Dashboard](/cloudos/manage/administration-dashboard/getting-started/), 
cloud administrators can focus on day-to-day cloud administrator tasks. As a best practice, cloud administrators concentrate on 
the <b>Cloud</b> and <b>Region</b> tabs.

**Tasks:**

* [Cloud Tab Tasks](/cloudos/manage/administration-dashboard/tasks-by-tab/#cloud-tab-tasks)

* [Region Tab Tasks](/cloudos/manage/administration-dashboard/tasks-by-tab#region-tab-tasks)

* [How to Access Your Authentication Token](/cloudos/manage/administration-dashboard/tasks-by-tab/#how-to-access-your-authentication-token)

* [Administration Dashboard Settings](/cloudos/manage/administration-dashboard/tasks-by-tab/#administration-dashboard-settings)

* [Updates and Extensions](/cloudos/manage/administration-dashboard/tasks-by-tab/#updates-and-extensions)
	

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
	
## Cloud Architect Tasks

**Concepts:**

After your organization works through [Getting Started with the Administration Dashboard](/cloudos/manage/administration-dashboard/getting-started/), cloud architects can focus on day-to-day cloud architect tasks.

As a best practice, cloud architects are mostly concerned with creating deployment profiles, topology designs, and load balancers, 
although they have rights to work with all the tasks listed below.

**Tasks:**

* [How to Import, Create, or Delete a Keypair](/cloudos/manage/administration-dashboard/tasks-by-tab/#how-to-import-create-or-delete-a-keypair)

* [Networks](/cloudos/manage/administration-dashboard/tasks-by-tab/#networks)

* [Routers](/cloudos/manage/administration-dashboard/tasks-by-tab/#routers)

* [Topology Designs](/cloudos/manage/administration-dashboard/topology-designs/

* [Security Groups and Rules](/cloudos/manage/administration-dashboard/tasks-by-tab/#security-groups-and-rules)

* [How to Create a Standalone Load Balancer](/cloudos/manage/administration-dashboard/tasks-by-tab/#how-to-create-a-standalone-load-balancer)

* [How to See a Project Overview](/cloudos/manage/administration-dashboard/tasks-by-tab/#how-to-see-a-project-overview)

* [Running Topologies](/cloudos/manage/administration-dashboard/tasks-by-tab/#running-topologies)

* [Resource Pools](/cloudos/manage/administration-dashboard/tasks-by-tab/#resource-pools)

* [Instances](/cloudos/manage/administration-dashboard/tasks-by-tab/#instances)

* [Volumes](/cloudos/manage/administration-dashboard/tasks-by-tab/#volumes)

* [Images and Snapshots](/cloudos/manage/administration-dashboard/tasks-by-tab/#images-and-snapshots)

* [How to See a Network Topology Diagram](/cloudos/manage/administration-dashboard/tasks-by-tab/#how-to-see-a-network-topology-diagram)

* [Administration Dashboard Settings](/cloudos/manage/administration-dashboard/tasks-by-tab/#administration-dashboard-settings)

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Project Administrator Tasks

Concepts:

After your organization works through [Getting Started with the Administration Dashboard](/cloudos/manage/administration-dashboard/getting-started/), project administrators can focus on their day-to-day tasks - monitoring and maintaining project resources and content.

Project administrators can perform all of the project user tasks (see Project User Tasks), plus project administrators have rights to modify or delete project resources and content.

As a best practice, project administrators maintain projects, with a focus on the areas you see below.

**Tasks:**

* [How to Import, Create, or Delete a Keypair](/cloudos/manage/administration-dashboard/tasks-by-tab/#how-to-import-create-or-delete-a-keypair)

* [How to See a Project Overview](/cloudos/manage/administration-dashboard/tasks-by-tab/#how-to-see-a-project-overview)

* [Running Topologies](/cloudos/manage/administration-dashboard/tasks-by-tab/#running-topologies)

* [Resource Pools](/cloudos/manage/administration-dashboard/tasks-by-tab/#resource-pools)

* [Images and Snapshots](/cloudos/manage/administration-dashboard/tasks-by-tab/#images-and-snapshots)

* [How to Create a Private Network](/cloudos/manage/administration-dashboard/tasks-by-tab/#how-to-create-a-private-network-project-tab)

* [How to Create a Subnet](/cloudos/manage/administration-dashboard/tasks-by-tab/#how-to-create-a-subnet)

* [Routers](/cloudos/manage/administration-dashboard/tasks-by-tab/#routers)

* [Security Groups and Rules](/cloudos/manage/administration-dashboard/tasks-by-tab/#security-groups-and-rules)

* [How to Create a Deployment Profile](/cloudos/manage/administration-dashboard/tasks-by-tab/#how-to-create-a-deployment-profile)

* [How to Create a Topology Design](/cloudos/manage/administration-dashboard/tasks-by-tab/#how-to-create-a-topology-design)

* [How to Launch an Instance](/cloudos/manage/administration-dashboard/tasks-by-tab/#how-to-launch-an-instance)

* [How to See the Instance Console, Console Log, and Overview](/cloudos/manage/administration-dashboard/tasks-by-tab/#how-to-see-the-instance-console-console-log-and-overview)



<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Project User Tasks

**Concepts:**

After your organization works through [Getting Started with the Administration Dashboard](/cloudos/manage/administration-dashboard/getting-started/), 
project users can focus on day-to-day project tasks. They create topology designs and deployment profiles, and work extensively on the <b>Project</b> tab. 
Project users' main goal when using the dashboard is to provision topologies.

As a best practice, project users focus on the following tasks.

**Tasks:**

* [Topology Designs](/cloudos/manage/administration-dashboard/topology-designs/)
	
* [How to See a Project Overview](/cloudos/manage/administration-dashboard/tasks-by-tab/#how-to-see-a-project-overview)

* [Running Topologies](/cloudos/manage/administration-dashboard/tasks-by-tab/#running-topologies)

* [Resource Pools](/cloudos/manage/administration-dashboard/tasks-by-tab/#resource-pools)

* [Instances](/cloudos/manage/administration-dashboard/tasks-by-tab/#instances)

* [Volumes](/cloudos/manage/administration-dashboard/tasks-by-tab/#volumes)

* [Images and Snapshots](/cloudos/manage/administration-dashboard/tasks-by-tab/#images-and-snapshots)

* [Networks](/cloudos/manage/administration-dashboard/tasks-by-tab/#networks)

* [Routers](/cloudos/manage/administration-dashboard/tasks-by-tab/#routers)

* [How to See a Network Topology Diagram](/cloudos/manage/administration-dashboard/tasks-by-tab/#how-to-see-a-network-topology-diagram)

* [How to Import, Create, or Delete a Keypair](/cloudos/manage/administration-dashboard/tasks-by-tab/#how-to-import-create-or-delete-a-keypair)

* [Floating IPs](/cloudos/manage/administration-dashboard/tasks-by-tab/#floating-ips)

* [Administration Dashboard Settings](/cloudos/manage/administration-dashboard/tasks-by-tab/#administration-dashboard-settings)



<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

