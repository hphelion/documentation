---
layout: default
title: "Administration Dashboard Tasks by Tab"
permalink: /cloudos/manage/administration-dashboard/tasks-by-tab/
product: cloudos

---


<a name="_top"> </a>

<script> 

function PageRefresh { 
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/manage/administration-dashboard/tasks-by-role/">&#9664; PREV</a> | <a href="/cloudos/manage/administration-dashboard/">&#9650; UP</a> | NEXT &#9654; </p>

# Administration Dashboard Tasks by Tab

Dashboard users see the tabs that they need to perform their roles' tasks.

These descriptions are coming soon in the format of other HP Cloud OS topics. For now, please see 
<a href="http://docs.hpcloud.com/cloudos/administration-dashboard/index.htm">this copy on the website</a>. 

* Cloud Tab Tasks
  * How to See All Services
  * How to See All Domains
  * How to Access All Projects
  * How to Access All Users
  * How to Access All Roles
  * How to Access All Images

* Region Tab Tasks
  * How to See an Overview of Usage
  * How to Access Instances
  * How to See Info about Services, Compute Services, and Default Quotas
  * How to Access Volumes
  * How to Access Images
  * How to Access Networks
  * How to Access Routers
  * How to Access Flavors and Flavor Extra Specs

* Project Tab Tasks
  * How to See a Project Overview
  * Running Topologies
  * Deployment Profiles
  * Resource Pools
  * Instances
  * Volumes
  * Images and Snapshots
  * Networks
  * Routers
  * How to See a Network Topology Diagram
  * Security Groups and Rules
  * How to Import, Create, or Delete a Keypair
  * Floating IPs
  * How to Access API Endpoints
  * How to Access Your Authentication Token
  * Updates and Extensions

* Administration Dashboard Settings
  * How to Change User Settings
  * How to Change Your Password
  * About the HP Cloud OS Administration Dashboard
  
  
  
  
## Cloud Tab Tasks

TBS...


### How to See All Services

TBS...


### How to See All Domains

The Domains window provides a convenient place for users who have permission to see a list of domains in the cloud. (Currently, the cloud contains one domain.)

To learn whether you have permission, see Administration Dashboard Tasks by Role.

To view all domains in the cloud:

1. Click Cloud > Domains.
  Information shown includes domain name and description.

2. Optional: To see details of a domain, click the Domain Name.
  Information shown includes domain name, ID, description, whether the domain is enabled, and a link to the domain.

### How to Access All Projects


#### How to Create a Project

To learn whether you have permission to create a project on the Cloud tab, see Administration Dashboard Tasks by Role.

When you create a project, you need only one required entry - Name. You can keep default settings for integrations and limits, and add users later.

To create a project:

1. Click Cloud > Projects to open the Projects window.

2. Click Create Project to open the Create Project dialog box.

3. On the Project Info tab, enter:
  * Name: required.
  * Description: optional.
  * Enabled: By default, Enabled is selected, which means project content is available to assigned users.

4. Optional: On the Project Members tab, add project members from the list of available users. Click the plus sign (+) to add a project member. Click the minus sign (-) to remove a member.
**Note:** You do not see cloud administrators under Available Users, because they are automatically added to projects.

5. Optional: On the Integrations tab, select Create Default Resource Pool if you need to create a resource pool for your compute regions. You select this option if your HP Cloud OS Operational Dashboard administrator used the advanced method to create compute regions. The advanced option does not automatically create resource pools.
In most cases, you can leave the default (not selected) for Create Default Resource Pool. Operational Dashboard administrators usually create compute regions that automatically contain a resource pool.
Note: You can create a resource pool later. See How to Create a Resource Pool.

6. Optional: On the Compute Limits tab, select a Region for the project. Accept or edit the Absolute Computer Limits. This sets limits on how many system resources (such as CPU cores, floating IP, and others) project users can consume at one time in that region.

7. Optional: On the Storage Limits tab, accept or edit the Absolute Computer Limits. This sets limits on how many storage resources (such as snapshots, volumes, and others) project users can consume at one time.

8. Click Create Project. 
	
#### How to See a Project's Usage

TBS...

#### How to Add or Remove a Project User

TBS...

#### How to Change a Project's Compute or Storage Limits

TBS...

#### How to Edit a Project Name or Description

TBS...

#### How to Delete or Restore a Project

TBS...


### How to Access All Users

**Concepts:**

The Users window provides a convenient place for users who have permission to see a list of all users in the cloud and to work with those users. To learn whether you have permission, read about your role under Administration Dashboard Tasks by Role.

Users include both people and services (such as Nova). When you create a person user, you must add that user to a project and assign a project role. Later, you can add the user to additional projects and roles.

To see a list of users:

1. Click Cloud > Users to open the Users window. 
  Information shown includes user name, role, email address, and whether the user is enabled.
 
2. Optional: Click an email address to automatically create an email addressed to that user.

3. Optional: To see user details, click User Name to open an Overview window.
  Information shown includes all the information from the Users window, and every project and role associated with the user.

**Tasks:**

* How to Create a User

* How to Edit a User

* How to Delete, Disable, or Enable a User

#### How to Create a User

TBS...

#### How to Edit a User

TBS...

#### How to Delete, Disable, or Enable a User

TBS...



### How to Access All Roles

TBS...


### How to Access All Images

TBS...





## Region Tab Tasks

**Concepts:**

The Region tab provides a convenient place for users who have permission to work with region services and content. 
To learn whether you have permission, see Administration Dashboard Tasks by Role.

A Region is a compute grouping that provides the context for the usage of compute servers, networking systems, and storage resources. 
A region makes use of a defined set of users, projects, topology templates, profiles, and services governed by a single OpenStack 
Keystone domain service. Regions are used to group different locations, different types of hardware, or to separate different resources 
belonging to different groups.

If your cloud contains more than one region, select the region to manage:

On the Region tab, select a Current Compute Region.

Note: Changing regions might switch the point of action to the Project tab. Click the Region tab again to display the selected region.


**Tasks:**

* How to See an Overview of Usage

* How to See Instances

* How to Access Volumes

* How to Access Images

* How to Access Networks

* How to Access Routers

* How to Access Flavors and Flavor Extra Specs


### How to See an Overview of Usage

TBS...

### How to Access Instances

TBS...

### How to See Info about Services, Compute Services, and Default Quotas

TBS...

### How to Access Volumes

TBS...

### How to Access Images

TBS...

### How to Access Networks

TBS...

### How to Access Routers

TBS...

### How to Access Flavors and Flavor Extra Specs

TBS...

## Project Tab Tasks

TBS...

### How to See a Project Overview

TBS...

### Running Topologies

TBS...
  
### Deployment Profiles

TBS...
  
### Resource Pools

TBS...
  
### Instances

TBS...
  
### Volumes

TBS...
  
### Images and Snapshots

TBS...
  
### Networks

TBS...
  
### Routers

TBS...
  
### How to See a Network Topology Diagram

TBS...
  
### Security Groups and Rules

TBS...
  
### How to Import, Create, or Delete a Keypair

TBS...
  
### Floating IPs

TBS...
  
### How to Access API Endpoints

TBS...
  
### How to Access Your Authentication Token

TBS...
  
### Updates and Extensions

TBS...

  
<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>




## Administration Dashboard Settings

TBS...


### How to Change User Settings

TBS...


### How to Change Your Password

TBS...


### About the HP Cloud OS Administration Dashboard  

TBS...

  
<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

