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

* [Cloud Tab Tasks](#cloud-tab-tasks)

* [Region Tab Tasks](#region-tab-tasks)

* [Project Tab Tasks](#project-tab-tasks)

* [Administration Dashboard Settings](#administration-dashboard-settings)

  
## Cloud Tab Tasks

Concepts:

The Cloud tab provides a convenient place for users who have permission to access information on a cloud-wide basis.

For example, on Cloud > Projects, you can see a list of all projects in the cloud. You can edit, create, or delete projects on the Cloud > Projects window.

To learn whether you can perform tasks on the Cloud tab, refer to the [Administration Dashboard Tasks by Role](/cloudos/manage/administration-dashboard/tasks-by-role) topic.

**Tasks:**

* [How to See All Services](#how-to-see-all-services)

* [How to See All Domains](#how-to-see-all-domains)

* [How to Access All Projects](#how-to-access-all-projects)

* [How to Access All Users](#how-to-access-all-users)

* [How to Access All Roles](#how-to-access-all-roles)

* [How to Access All Images(#how-to-access-all-images)



### How to See All Services

The Services window provides a convenient place for users who have permission to see a read-only list of services that are registered in the cloud.

To learn whether you have permission, see your role under [Administration Dashboard Tasks by Role](/cloudos/manage/administration-dashboard/tasks-by-role).

To see cloud services:

<ol>

<li> Click <b>Cloud</b> > <b>Services</b>. The following cloud services display.
	
<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th> Service Name </th>
<th> Service Type </th>
<th> Description </th> 
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:100px;"> Eve </td>
<td> Provisioning</td> 
<td> A composite provisioning service that uses a topology design and profile to create VMs, volumes, and network segments as described in the topology. 
Eve uses the Graffiti service for determining resource pool existence, traits, and user identity mapping. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:100px;"> Focus </td>
<td> Design storage </td> 
<td> Repository for topology designs and profiles that are used for provisioning. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:100px;"> Glance </td>
<td> Image storage </td> 
<td> Repository for images used to create new VMs. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:100px;"> Graffiti </td>
<td> Registry </td> 
<td> A searchable directory to find cloud resources based on their capabilities. <br />  <br />
An example of a cloud resource is resource pool definitions that you can use to provision to various cloud providers. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:100px;"> Keystone </td>
<td> Identity and security </td> 
<td> Provides user authentication and tracks various projects within the regions. If Keystone is disabled, you cannot log into the Administration Dashboard. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:100px;"> Quantum (new name - Neutron) </td>
<td> Networking </td> 
<td> Provides network management for VMs. </td>
</tr>

</table>

</li>

<li> For each service, you see the following information:

<ul>
<li> <b>Service URL</b>: This column shows the IP address where the service is running.
<li> <b>Status</b>: Whether enabled.
<li> <b>Actions</b>: If a service supports Rest APIs, you see Rest API under the Actions column.
</ul>

</li>

</ol>

#### How to Use the REST API Action

The HP Cloud OS API Documentation application is a tool for describing, producing, and visualizing RESTful web services. 
Its purpose is to enable client and documentation systems to update at the same pace as the server. The documentation of methods, 
parameters, and models are tightly integrated into the service code, allowing APIs to stay in sync.

If a service supports the HP Cloud OS API Documentation application, you see REST API under the <b>Actions</b> column.

Click <b>REST API</b> to start the documentation application for a service.

For information about how to use the documentation application, see the [Develop](/cloudos/develop) topic.


### How to See All Domains

The Domains window provides a convenient place for users who have permission to see a list of domains in the cloud. (Currently, the cloud contains one domain.)

To learn whether you have permission, see [Administration Dashboard Tasks by Role](/cloudos/manage/administration-dashboard/tasks-by-role).

To view all domains in the cloud:

1. Click Cloud > Domains.

  Information shown includes domain name and description.

2. Optional: To see details of a domain, click the Domain Name.

  Information shown includes domain name, ID, description, whether the domain is enabled, and a link to the domain.

### How to Access All Projects

**Concepts:**

The Project window provides a convenient place for users who have permission to see a list of all projects in the cloud and to work with those projects. 
To learn whether you have permission, see [Administration Dashboard Tasks by Role](/cloudos/manage/administration-dashboard/tasks-by-role).

Projects are groupings that allow designated users to view the same set of content. Projects protect topology designs and profiles, and realized 
resources (such as VMs, volumes, and others) from being visible to all users.

To see a list of all projects:

1. Click <b>Cloud</b> > <b>Projects</b> to open the Projects window. Projects are listed alphabetically by Name.

  Information shown includes project name and description.

2. <i>Optional</i>: To display project details, click <b>Project Name</b> to open the Overview window.

  Information shown includes project name, ID, description, whether enabled, users and roles.

**Tasks:**

* [How to Create a Project](#how-to-create-a-project)

* [How to See a Project's Usage](#how-to-see-a-projects-usage)

* [How to Add or Remove a Project User](#how-to-add-or-remove-a-project-user)

* [How to Change a Project's Compute or Storage Limits](#how-to-change-a-projects-compute-or-storage-limits)

* [How to Edit a Project Name or Description](#how-to-edit-a-project-name-or-description)

* [How to Delete or Restore a Project](#how-to-delete-or-restore-a-project) 


#### How to Create a Project

To learn whether you have permission to create a project on the Cloud tab, see [Administration Dashboard Tasks by Role](/cloudos/manage/administration-dashboard/tasks-by-role).

When you create a project, you need only one required entry - <b>Name</b>. You can keep default settings for integrations and limits, and add users later.

To create a project:

1. Click <b>Cloud</b> > <b>Projects</b> to open the Projects window.

2. Click <b>Create Project</b> to open the Create Project dialog box.

3. On the <b>Project Info</b> tab, enter:
  * <b>Name</b>: required.
  * <b>Description</b>: optional.
  * <b>Enabled</b>: By default, Enabled is selected, which means project content is available to assigned users.

4. Optional: On the <b>Project Members</b> tab, add project members from the list of available users. Click the plus sign (<b>+</b>) to add a project member. Click the minus sign (<b>-</b>) to remove a member.
 
  **Note:** You do not see cloud administrators under Available Users, because they are automatically added to projects.

5. Optional: On the <b>Integrations</b> tab, select <b>Create Default Resource Pool</b> if you need to create a resource pool for your compute regions. 
You select this option if your HP Cloud OS Operational Dashboard administrator used the advanced method to create compute regions. The advanced option 
does not automatically create resource pools. In most cases, you can leave the default (not selected) for Create Default Resource Pool. Operational Dashboard 
administrators usually create compute regions that automatically contain a resource pool. 

  <b>Note</b>: You can create a resource pool later. See [How to Create a Resource Pool](#how-to-create-a-resource-pool).

6. Optional: On the <b>Compute Limits</b> tab, select a <b>Region</b> for the project. Accept or edit the <b>Absolute Computer Limits</b>. 
This sets limits on how many system resources (such as CPU cores, floating IP, and others) project users can consume at one time in that region.

7. Optional: On the <b>Storage Limits</b> tab, accept or edit the <b>Absolute Computer Limits</b>. This sets limits on how many storage resources 
(such as snapshots, volumes, and others) project users can consume at one time.

8. Click <b>Create Project</b>. 

	
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

The Users window provides a convenient place for users who have permission to see a list of all users in the cloud and to work with those users. 
To learn whether you have permission, read about your role under [Administration Dashboard Tasks by Role](/cloudos/manage/administration-dashboard/tasks-by-role).

Users include both people and services (such as Nova). When you create a person user, you must add that user to a project and assign a project role. 
Later, you can add the user to additional projects and roles.

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



<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Region Tab Tasks

**Concepts:**

The Region tab provides a convenient place for users who have permission to work with region services and content. 
To learn whether you have permission, see [Administration Dashboard Tasks by Role](/cloudos/manage/administration-dashboard/tasks-by-role).

A Region is a compute grouping that provides the context for the usage of compute servers, networking systems, and storage resources. 
A region makes use of a defined set of users, projects, topology templates, profiles, and services governed by a single OpenStack 
Keystone domain service. Regions are used to group different locations, different types of hardware, or to separate different resources 
belonging to different groups.

If your cloud contains more than one region, select the region to manage:

On the <b>Region</b> tab, select a <b>Current Compute Region</b>.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:600px; border: 1px dotted #000000;"> <b>Note:</b> Changing regions 
might switch the point of action to the Project tab. Click the <b>Region</b> tab again to display the selected region.</p>

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




<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

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

**Concepts:**

The Updates and Extensions window provides a convenient place for users who have permission to access the HP Cloud OS Distribution Network (CODN). 
Use the Updates and Extensions window to access catalog updates and content. Updates include software versions and security patches. 
Content includes material such as images and topology templates.

You can update and upgrade the Administration Dashboard while your system continues to run. CODN contains all the products and services 
HP offers to help maintain your cloud.

To learn whether you have permission to use CODN, see [Administration Dashboard Tasks by Role](/cloudos/manage/administration-dashboard/tasks-by-role).

You must configure the HP Cloud OS Administration Dashboard to access an HP Cloud OS Distribution Network account before you can use the 
Updates and Extensions window. See the Tasks sections, below.

The Updates and Extensions window provides the standard Administration Dashboard filter capability, and you can click on the column headings 
to sort by that item.

To see updates:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Updates and Extensions</b> > <b>Updates and Extensions</b> to open the Updates and Extensions window.

3. You see information about the available updates and extensions:

 * <b>Name</b>: of the update.
 * <b>Version</b>: of the update. Information for each version is listed on a separate line.
 * <b>Size</b>: of the update.
 * <b>Provider</b>: which organization created and is responsible for the update.
 * <b>Type</b>: the kind of image that downloads.
 * <b>Status</b>: the state of the update in the catalog. This state is independent of your local system. For example, you may successfully download an update, but the update later becomes suspended in the catalog. You can continue to publish and use the update on your local system.
 * <b>Actions</b>: tasks you can perform on the update.

To see details of an update:

* Click a <b>Name</b> to open an Overview window.

  Information includes the update name, version, targets where it is installed, and manifest. (In future releases, the manifest will define the contents of the file.)

**Tasks:**

* [How to Configure an Updates and Extensions Account](#how-to-configure-an-updates-and-extensions-account)

* [How to Download an Update or Extension](#how-to-download-an-update-or-extension)

* [How to Publish an Update or Extension](#how-to-publish-an-update-or-extension)



#### How to Configure an Updates and Extensions Account

If you want to use CODN, you must configure the Administration Dashboard to access it. If you do not have access, the Administration Dashboard displays 
a warning when you open the Updates and Extensions window.

To configure:

1. Create a CODN account.

2. Configure the Administration Dashboard to access that account.

To create an account:

1. On the Project tab, select a <b>Current Project</b>.

2. Click <b>Updates and Extensions</b> > <b>Updates and Extensions</b> to open the Updates and Extensions window. You see a warning that your credentials are not configured to access the catalog.

3. Click <b>Configure</b> to open the Configure window. 
  * If you already have a CODN account, you can skip to Step 5.
  * If you need to create an HP catalog account, continue.

4. Click <b>Sign up now</b> to open the CODN Create Account window, where you:
  * Enter your <b>Name</b>, <b>Email</b>, and <b>Password</b>.
  * Agree to the terms.
  * Click <b>Submit</b>. You can close the CODN window.

5. On the Administration Dashboard Configure window:
  * Enter your CODN account email address for your <b>User Name</b>.
  * Enter your CODN account password for your <b>Password</b>.
  * Click <b>OK</b>.

6. If you configure successfully, you can use the Updates and Extensions window.

**Related Topics:**

* [How to Download an Update or Extension](#how-to-download-an-update-or-extension)

* [How to Publish an Update or Extension](#how-to-publish-an-update-or-extension)

 
##### About Account Cookies

When you configure an account, the Administration Dashboard stores a cookie on your computer. The Administration Dashboard uses the cookie the next 
time you access the Updates and Extensions window, so you need to enter username and password information only one time.

If your browser blocks cookies, you cannot configure an account.

If you clear cookies on your computer, you must configure your account again. You do not have access to CODN until you configure. However, if you downloaded 
updates and they exist in your cache, you still see them on your Updates and Extensions window. 

#### How to Download an Update or Extension

Download an update to copy it from the catalog to your local system where you can use it. If an update is not available for download, you do not see Download. 
For example, you cannot download an update that was previously downloaded and still exists in cache.

To download an update:

1. Click <b>Updates and Extensions</b> > <b>Updates and Extensions</b> to open the Updates and Extensions window.

2. Find the update or extension that you want to download, and click <b>Download</b> to open the Download confirmation box.

3. Confirm the download name and version, and click <b>Download</b>.

  The download is scheduled and runs in background. The Administration Dashboard allows 24 hours for a download to complete. If the download runs for more than 24 hours, the download terminates with an error message. You can reschedule the download for a time when fewer jobs are running, so it executes more quickly.

4. <i>Optional</i>: You can check the download progress action to understand the details of the download status.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:700px;"> <b>Note:</b> Downloads require large amounts of 
disk space. Successful downloads require that your local system contains adequate disk space. For information about what to do when you run out of space or 
experience other download problems, see the [Troubleshooting](/cloudos/manage/troubleshooting) topic. </p>

####How to Publish an Update or Extension

You can publish an update after you download it. If you have not yet downloaded the update, you do not see Publish.

A download can consist of one or more pieces that must be distributed to multiple HP Cloud OS repositories. Publish routes the download contents to 
their appropriate repositories.

To publish an update:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Updates and Extensions</b> > <b>Updates and Extensions</b> to open the Updates and Extensions window.

3. Click <b>Publish</b> to open the Targets dialog box.
  * Enter <b>Scope</b> to define who can use the update. The Administration Dashboard offers scope choices, depending upon the update type.
  * Click <b>Publish</b>.

4. After a successful publish, you see the update in the appropriate section of the Administration Dashboard. For example, if the update is a Glance image, 
you can see it on <b>Infrastructure</b> > <b>Images and Snapshots</b>.



  
<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Administration Dashboard Settings

**Concepts:**

All users see the <b>Settings</b> link on every Administration Dashboard window. The link allows you to change your personal settings and access online help.

**Tasks:**

* [How to Change User Settings](#how-to-change-user-settings)

* [How to Change Your Password](#how-to-change-your-password)

* [About the HP Cloud OS Administration Dashboard](#about-the-hp-cloud-os-administration-dashboard)


### How to Change User Settings

To change Administration Dashboard display settings:

1. Click <b>Settings</b> in the upper right of any window.

2. Click <b>User</b>.

3. In the User Settings window, keep or change the following settings:
 * <b>Language</b>: English (en).
 * <b>Timezone</b>: UTC (Coordinated Universal Time). To change the default, select a timezone from the drop-down list.
 * <b>Items Per Page</b>: This number represents how many line items display on one page. To change the default, enter a different number.
 * Click <b>Save</b>.

4. Wait for the success message.

### How to Change Your Password

To change your Administration Dashboard password:

1. Click <b>Settings</b> in the upper right of any window.

2. Click <b>Password</b>.

3. In the Change Password window:
 * <b>Current password</b>: Enter your current password.
 * <b>New password</b>: Enter the word that you want for your new password.
 * <b>Confirm new password</b>: Enter your new password again to confirm your entry.
 * Click <b>Change</b>.

### About the HP Cloud OS Administration Dashboard  

To view version information about the Administration Dashboard:

1. Click <b>Settings</b> in the upper right of any window.

2. Click About.

3. In the <b>About</b> window, review the Dashboard Version, Build Version, and Copyrights information.

  
<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

