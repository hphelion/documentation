---
layout: default
title: "Administration Dashboard Tasks by Tab"
permalink: /cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/
product: cloudos

---


<a name="_top"> </a>

<script> 

function PageRefresh { 
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage/administration-dashboard/">&#9650; UP</a> | NEXT &#9654; </p>

# Administration Dashboard Tasks by Tab

Dashboard users see the tabs that they need to perform their roles' tasks.

* [Cloud Tab Tasks](#cloud-tab-tasks)

* [Region Tab Tasks](#region-tab-tasks)

* [Project Tab Tasks](#project-tab-tasks)

* [Administration Dashboard Settings](#administration-dashboard-settings)

  
## Cloud Tab Tasks

Concepts:

The Cloud tab provides a convenient place for users who have permission to access information on a cloud-wide basis.

For example, on Cloud > Projects, you can see a list of all projects in the cloud. You can edit, create, or delete projects on the Cloud > Projects window.

To learn whether you can perform tasks on the Cloud tab, refer to [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

**Tasks:**

* [How to See All Services](#how-to-see-all-services)

* [How to See All Domains](#how-to-see-all-domains)

* [How to Access All Projects](#how-to-access-all-projects)

* [How to Access All Users](#how-to-access-all-users)

* [How to Access All Roles](#how-to-access-all-roles)

* [How to Access All Images](#how-to-access-all-images)



### How to See All Services

The Services window provides a convenient place for users who have permission to see a read-only list of services that are registered in the cloud.

To learn whether you have permission, see your role under [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

To see cloud services:

<ol>

<li> Click <b>Cloud</b> > <b>Services</b>. The following cloud services display. <br />  <br /> 
	
<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th> Service Name </th>
<th> Service Type </th>
<th> Description </th> 
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:100px; font-weight: bold;"> Eve </td>
<td> Provisioning</td> 
<td> A composite provisioning service that uses a topology design and profile to create VMs, volumes, and network segments as described in the topology. 
Eve uses the Graffiti service for determining resource pool existence, traits, and user identity mapping. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:100px; font-weight: bold;"> Focus </td>
<td> Design storage </td> 
<td> Repository for topology designs and profiles that are used for provisioning. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:100px; font-weight: bold;"> Glance </td>
<td> Image storage </td> 
<td> Repository for images used to create new VMs. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:100px; font-weight: bold;"> Graffiti </td>
<td> Registry </td> 
<td> A searchable directory to find cloud resources based on their capabilities. <br />  <br />
An example of a cloud resource is resource pool definitions that you can use to provision to various cloud providers. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:100px; font-weight: bold;"> Keystone </td>
<td> Identity and security </td> 
<td> Provides user authentication and tracks various projects within the regions. If Keystone is disabled, you cannot log into the Administration Dashboard. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:100px;"> <b>Quantum</b> (new name &mdash; <b>Neutron</b>) </td>
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

To learn whether you have permission, see [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

To view all domains in the cloud:

1. Click <b>Cloud</b> > <b>Domains</b>.

  Information shown includes domain name and description.

2. Optional: To see details of a domain, click the <b>Domain Name</b>.

  Information shown includes domain name, ID, description, whether the domain is enabled, and a link to the domain.

### How to Access All Projects

**Concepts:**

The Project window provides a convenient place for users who have permission to see a list of all projects in the cloud and to work with those projects. 
To learn whether you have permission, see [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

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

To learn whether you have permission to create a project on the Cloud tab, see [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

When you create a project, you need only one required entry - <b>Name</b>. You can keep default settings for integrations and limits, and add users later.

To create a project:

<ol>

<li> Click <b>Cloud</b> > <b>Projects</b> to open the Projects window.

<li> Click <b>Create Project</b> to open the Create Project dialog box.

<li> On the <b>Project Info</b> tab, enter:

<ul>
<li> <b>Name</b>: required.
<li> <b>Description</b>: optional.
<li> <b>Enabled</b>: By default, Enabled is selected, which means project content is available to assigned users.
</ul>
</li>

<li> <i>Optional</i>: On the <b>Project Members</b> tab, add project members from the list of available users. Click the plus sign (<b>+</b>) to add a project member. Click the minus sign (<b>-</b>) to remove a member.
<br /> <br /> <p><b>Note:</b> You do not see cloud administrators under Available Users, because they are automatically added to projects.</p>
</li>

<li> <i>Optional</i>: On the <b>Integrations</b> tab, select <b>Create Default Resource Pool</b> if you need to create a resource pool for your compute regions. 
You select this option if your HP Cloud OS Operational Dashboard administrator used the advanced method to create compute regions. The advanced option 
does not automatically create resource pools. In most cases, you can leave the default (not selected) for Create Default Resource Pool. Operational Dashboard 
administrators usually create compute regions that automatically contain a resource pool. 
<br /> <br/> <p> <b>Note</b>: You can create a resource pool later. See <a href="#how-to-create-a-resource-pool">How to Create a Resource Pool</a>.</p>
</li>

<li> <i>Optional</i>: On the <b>Compute Limits</b> tab, select a <b>Region</b> for the project. Accept or edit the <b>Absolute Computer Limits</b>. 
This sets limits on how many system resources (such as CPU cores, floating IP, and others) project users can consume at one time in that region.

<li> <i>Optional</i>: On the <b>Storage Limits</b> tab, accept or edit the <b>Absolute Computer Limits</b>. This sets limits on how many storage resources 
(such as snapshots, volumes, and others) project users can consume at one time.

<li> Click <b>Create Project</b>. 

</ol> 
	
#### How to See a Project's Usage

To learn whether you have permission to see a project's usage on the Cloud tab, see [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

To see a project's usage:

1. Click <b>Cloud</b> > <b>Projects</b> to open the Projects window.

2. Find the project where you want to see usage, and click <b>More</b> > <b>View Usage</b> to open the Usage Summary window.

3. You can select a different month to view and click <b>Submit</b>.

4. <b>Download CSV Summary</b> opens a text file in Microsoft Excel with current month usage information.


#### How to Add or Remove a Project User

To learn whether you have permission to add or remove a project user on the Cloud tab, 
see [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

Before adding a new user to a project, make sure the user is logged out. If you add users to a project while they are logged in, the 
Administration Dashboard may log them out without warning or show an error message. If so, users should sign out and sign back in. Carefully coordinate with 
users, or schedule adding users to a project when they are not logged in.

To add or remove a project user:

1. Click <b>Cloud</b> > <b>Projects</b> to open the Projects window.

2. Find the project, and click <b>Modify Users</b> to open the Edit Project dialog box at the Project Members tab.

3. Use the plus sign (<b>+</b>) to add Available Users. Use the minus sign (<b>-</b>) to remove Project Members.

  <b>Note</b>: You can only add or remove project users and project administrators. Higher level roles, such as cloud administrators and Arch are added 
  automatically. To see all project users, open the detail view of the project. See [How to Access All Projects](#how-to-access-all-projects).

4. Click Save.

#### How to Change a Project's Compute or Storage Limits

You can change your default compute and storage limits to more closely reflect your capacity. For example, if your compute region is hosted on a very large system, you can offer users more than the default capacity. 
If your compute region is hosted on a VM, you can restrict capacity.

To learn whether you have permission to change a project's limits, see [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

To change a project's compute limits:

1. Click <b>Cloud</b> > <b>Projects</b> to open the Projects window.

2. Find the project where you want to change the compute limits, and click <nobr><b>More</b> > <b>Modify Compute Limits</b></nobr> to open the Edit Project dialog box.

3. On the <b>Compute Limits</b> tab of the dialog box, select a <b>Region</b>. Compute limits are defined on a region-by-region basis.

4. Keep or modify the existing <b>Absolute Compute Limits</b>. Enter integer values that are -1 (to set unlimited capacity) or greater.

5. Click Save.

To change a project's storage limits:

1. Click <b>Cloud</b> > <b>Projects</b> to open the Projects window.

2. Find the project where you want to change the storage limits, and click <nobr><b>More</b> > <b>Modify Storage Limits</b></nobr> to open the Edit Project dialog box.

3. On the <b>Storage Limits</b> tab of the dialog box, keep or modify the existing <b>Absolute Storage Limits</b>.

4. Click <b>Save</b>.


#### How to Edit a Project Name or Description

To edit a project:

1. Click Cloud > Projects to open the Projects window.

2. Find the project to edit, and click More > Edit Project to open the Edit Project dialog box.

3. On the Project Info tab, you can change the Name, Description, and whether the project is Enabled.

4. Click Save.

**Related Topics:**

* [How to Change a Project's Compute or Storage Limits](#how-to-change-a-projects-compute-or-storage-limits)

* [How to Add or Remove a Project User](#how-to-add-or-remove-a-project-user)


#### How to Delete or Restore a Project

When you delete a project, it is marked for deletion by adding a tilde (<b>~</b>) prefix to its name.

The project is not actually deleted until a cloud clean-up utility runs. At that time, all resources associated with the project are removed. You can restore the project any time before the utility runs.

To delete a project:

1. Click <b>Cloud</b> > <b>Projects</b> to open the Projects view.

2. Find the project you want to delete, and click <b>More</b> > <b>Delete Project</b>.
    
3. In the confirmation dialog, click <b>Delete Project</b>. The project list redisplays. The project appears at the bottom of the list and is marked for deletion.


To restore a project:

1. Click <b>Cloud</b> > <b>Projects</b> to open the Projects view.

2. Find the project to restore. It display at the bottom of the <b>Project Name</b> list with a tilde (<b>~</b>) preceding the name.

3. Click <b>More</b> > <b>Restore Project</b>.
   
4. In the confirmation dialog, verify your selection and then click <b>Restore</b>. The project is restored.



### How to Access All Users

**Concepts:**

The Users window provides a convenient place for users who have permission to see a list of all users in the cloud and to work with those users. 
To learn whether you have permission, read about your role under [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

Users include both people and services (such as Nova). When you create a person user, you must add that user to a project and assign a project role. 
Later, you can add the user to additional projects and roles.

To see a list of users:

1. Click Cloud > Users to open the Users window. 
  Information shown includes user name, role, email address, and whether the user is enabled.
 
2. Optional: Click an email address to automatically create an email addressed to that user.

3. Optional: To see user details, click User Name to open an Overview window.
  Information shown includes all the information from the Users window, and every project and role associated with the user.

**Tasks:**

* [How to Create a User](#how-to-create-a-user)

* [How to Edit a User](#how-to-edit-a-user)

* [How to Delete, Disable, or Enable a User](#how-to-delete-disable-or-enable-a-user)


#### How to Create a User

To learn whether you have permission to create a user on the Cloud tab, see [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

To create a user:

<ol>

<li> Click <b>Cloud</b> > <b>Users</b> to open the Users window. </li> 

<li> Click <b>Create User</b> to open the Create User dialog box.  </li> 

<li> On the <b>User</b> tab of the dialog box, enter the <b>User Name</b> and <b>Password</b>.
<br /> <br /> 
<p> <i>Optional</i>: Enter an <b>Email</b> address for the user. </p>
</li>

<li> Click the <b>Project</b> tab to assign the user to a project.
<ul>
<li> Select a <b>Primary Project</b> for the user.
<li> Select a project role from the list. The user will be assigned that role on the project.
</ul> 
</li> 

<li> <i>Optional</i>: Click the <b>Cloud</b> tab if you want to assign the user cloud-specific roles. 
See <a href="/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/">Administration Dashboard Tasks by Roles</a>.  </li> 

<li> Click <b>Create User</b>.  </li> 

</ol> 


#### How to Edit a User

To learn whether you have permission to edit a user on the Cloud tab, see [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:700px;"> <b>Note:</b>  You cannot edit control users such 
as Trash or Nova. Edit does not display for users that cannot be edited. </p>

To edit a user:

1. Click <b>Cloud</b> > <b>Users</b> to open the Users window.

2. Find the user you want to edit, and click <b>Edit</b> to open the Update User dialog box.

3. On the <b>User</b> tab of the dialog box, update the <b>User Name</b>, <b>Email</b>, or <b>Password</b>.

4. On the <b>Cloud</b> tab, update the user cloud role. See [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

5. Click <b>Update User</b>.


#### How to Delete, Disable, or Enable a User

To learn whether you have permission to perform the following tasks on the Cloud tab, see [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:700px;"> <b>Note:</b>  You cannot delete, disable, or 
enable the following users: Admin, Arch, and control users such as Trash or Nova. Delete, Disable, and Enable do not display for those users. </p>

Deleting a user marks the user for deletion by adding a tilde (<b></b>) prefix to the name. The user will be permanently removed from this list when a 
cloud clean-up utility runs.

To delete a user:

1. Click <b>Cloud</b> > <b>Users</b> to open the Users window.

2. Find the user you want to delete. Click <b>More</b> > <b>Delete User</b>.

3. A confirmation dialog box opens, warning you that the action cannot be undone. To confirm, click <b>Delete User</b>.
   
4. The <b>Users</b> list redisplays and the user is marked for deletion. The deleted user will be permanently removed from the list when the cloud clean-up utility runs.

 

A deleted user is not removed from the Administration Dashboard until the cloud clean-up utility runs. You can restore a deleted user before the utility runs.

To restore a deleted user:

1. Click <b>Cloud</b> > <b>Users</b> to open the Users window.

2. Find the user you want to restore and click <b>Restore User</b>.

3. A confirmation dialog box opens. To confirm, click <b>Restore</b>.

4. The Users list redisplays and the user moves back into the list alphabetically.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:700px;"> <b>Note:</b>  After you restore a user, 
the user is no longer associated with any project. </p>

 

You can disable a user, so the user remains in the Administration Dashboard, but cannot log in.

To disable a user:

1. Click <b>Cloud</b> > <b>Users</b> to open the User view.

2. Find the user you want to disable. Click <b>More</b> > <b>Disable User</b>.

3. The user remains on the list but the <b>Enabled</b> field changes to <b>False</b>.

     

You can enable a disabled user. To enable a user:

1. Click <b>Users</b> to open the User view.

2. Find the user you want to enable. Click <b>More</b> > <b>Enable User</b>.

3. The user remains on the list and the <b>Enabled</b> field changes to <b>True</b>.



### How to Access All Roles

**Concepts:**

The Roles window provides a convenient place for users who have permission to see a list of all roles in the cloud and to work with those roles. 
To learn whether you have permission, see [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

Use roles to give a user privileges to access project resources. Different roles assign different privileges.

To see all roles:

1. Click <b>Cloud</b> > <b>Roles</b> to open the Roles window. Roles display alphabetically by Role Name.

2. <i>Optional</i>: To see role details, click the <b>Role Name</b> to open an Overview window.

3. Information shown includes role name, ID, and all users and projects associated with the role.

**Tasks:**

* [How to Create a Role](#how-to-create-a-role)

* [How to Edit a Role](#how-to-edit-a-role)

* [How to Delete a Role](#how-to-delete-a-role)
	
	
#### How to Create a Role

Cloud administrators and the Admin user can create a new role on the Cloud tab.

To create a role:

1. Click <b>Cloud</b> > <b>Roles</b> to open the Roles view.

2. Click <b>Create Role</b>.

3. On the <b>Create Role</b> dialog box, enter a <b>Role Name</b> and click <b>Create Role</b>.

4. The role is added to the Roles list alphabetically.


#### How to Edit a Role

Cloud administrators and the Admin user can edit a role to change the name that is associated with the role. The role maintains the privileges that were previously assigned to it, but with a different name.

In a common use case, you edit a role name to be more appropriate to your company's titles.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:700px;"> <b>Note:</b> You cannot edit the Admin or Arch roles.
</p>

To edit a role:

1. Click <b>Cloud</b> > <b>Roles</b> to open the Roles window.

2. Find the role you want to edit and click <b>Edit</b>.

3. On the <b>Update Role</b> dialog box, edit the <b>Role Name</b> and click <b>Update Role</b>.


#### How to Delete a Role

Cloud administrators and the Admin user can delete a role. When you delete a role, it is removed throughout the Administration Dashboard.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:700px;"> <b>Note:</b> 
You cannot delete the Admin or Arch roles.
</p>

To delete a role:

1. Click <b>Cloud</b> > <b>Roles</b> to open the Roles view.

2. Find the role to delete, and click <b>More</b> > <b>Delete Role</b>.

3. In the confirmation dialog, verify your selection and click <b>Delete Role</b>.	


### How to Access All Images

**Concepts:**

The Images window provides a convenient place for users who have permission to see a list of all images in the cloud and to work with those images. 
To learn whether you have permission, see [Administration Dashboard Tasks by Roles](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

If you create a Public image, project users can access the image and use it to launch a VM. Only Public images are visible to all users.

The Images window shows all non-snapshot images with the following formats:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: white; color: black;">
<td colspan="2"> <b>AMI (Amazon Machine Image)</b> &mdash; Not valid unless it is associated with a kernel image (AKI) and a RAMdisk Image (ARI). </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>ISO</b> &mdash; Optical Disk Image </td>
<td> <b>QCOW2</b> &mdash; QEMU Emulator </td> 
</tr>
	 
<tr style="background-color: white; color: black;">
<td> <b>RAW</b> </td>
<td> <b>VDI</b> &mdash; Virtual Disk Image </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> <b>VHD</b> &mdash; Virtual Hard Disk Image </td>
<td> <b>VMDK</b> &mdash; Virtual Machine Disk Image </td> 
</tr>

</table> 


To see a list of images:

1. Click <b>Cloud</b> > <b>Images</b> to open the Images window.

  Information shown includes image name, type, status, format, whether the image is public, and whether the image is protected.

2. <i>Optional</i>: To see image details, click the <b>Image Name</b> to open the Image Overview window.

**Tasks:**

* [How to Create an Image](#how-to-create-an-image)

* [How to Launch an Image](#how-to-launch-an-image)

* [How to Edit an Image](#how-to-edit-an-image)

* [How to Delete an Image](#how-to-delete-an-image)




#### How to Create an Image 

To learn whether you have permission to create an image on the Cloud tab, see [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

The image must be available on an HTTP URL. Compressed image binaries, such as .zip, and .tar.gz, are supported.

To create an image:

1. Click <b>Cloud</b> > <b>Images</b> to open the Images window.

2. Click <b>Create Image</b> to open the <b>Create an Image</b> dialog box.

3. Enter <b>Name</b> and optional <b>Description</b>.

4. Select an <b>Image Source</b>.
 * <b>Image Location</b> to enter and external URL from which to load the image.
 * <b>Image File</b> to browse to a local image.

5. Enter an Image Location that meets the following requirements:

 a. A valid and direct HTTP URL to the image binary. URLs that redirect or serve error pages will result in unusable images.
    
	**Note:** If you do not have rights to the image binary url, you receive an error when trying to create the image

 b. The image must be accessible to the Image Service.

 c. The image must be in a supported format.
 
    **Note:** If you upload an image with a format that is not supported, you will receive an Error 404, Not Found error when you attempt to create the image.

6. Select a <b>Format</b> from the menu. The image must be in one of the formats listed.

7. Enter the <b>Minimum Disk space</b> and <b>Minimum Ram</b>.

8. Select <b>Public</b> if you want the image visible to all users in the cloud. Your user role must have the appropriate permission to make an image Public.

9. Select <b>Protected</b> to mark the image as read-only. The image cannot be edited or deleted.

10. Click <b>Create Image</b>. If successful, the image displays with an Active status. If creation is not successful within a specified amount of time (set by your system administrator; typically no more than five minutes), the Status of the image in the list displays Upload Failed.

**Note:** Only AMI, RAW, and QCOW2 images are launchable.



#### How to Launch an Image

To learn whether you have permission to launch an image on the Cloud tab, see [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

You can only launch images that are formatted as AMI, RAW, and QCOW2. Launching an image provisions it to the cloud.

To launch an image:

<ol>

<li> Click <b>Cloud</b> > <b>Images</b> to open the Images view. </li>

<li> Find the image to launch and then click <b>Launch</b> to open the Launch Instance dialog box. 
The dialog opens to the Details tab. Some fields are automatically populated from the image. </li>

<li> Enter or edit the <b>Details</b> tab information as needed:
<ul>
<li> <b>Instance Source</b>: Specify whether you are using an image or snapshot.  </li>
<li> <b>Image</b>: Select from the list of images that have been uploaded to the system.  </li>
<li> <b>Instance Name</b>: The name of the host you are creating (Required). 
<br /> <br /> 
<b>Note:</b> At this point, you can go ahead and launch the instance, using the defaults for the remaining options. </li>
<li> <b>Flavor</b>: Indicates the size of the node. When you select a flavor here, the <b>Flavor Details</b> table on the right changes to 
show the node properties and values associated with your size selection.  </li>
<li> <b>Instance Count</b>: Can be more than 1.  </li>
</ul> 
</li>

<li> Use the <b>Access and Security</b> tab to control access to your instance via keypairs and security groups.
<ul>
<li> <b>Keypair</b>: Keypairs are SSH security keys that are 512 bits long, provide authentication, and allow you to exchange traffic securely 
within a VM. These credentials are injected into images when they are launched. 
<br /> <br /> 
Creating a new keypair registers the public key and downloads the private key (a .pem file), allowing you to log into the VM. 
The public key gets installed on the VM; the private key is used to log in.
<br /> <br /> 
To add a keypair, either:
<ul>
<li> Select a keypair from the list, or </li>
<li> Click (<b>+</b>) to import a keypair. Enter <b>Keypair Name</b> and <b>Public Key</b> </li>
</ul>
</li>

<li> <b>Admin Pass</b> and <b>Confirm Admin Pass</b> </li>

<li> <b>Security Groups</b> </li>
</ul>
</li>

<li> Use the <b>Networking</b> tab to select one or more networks. You can click the plus (<b>+</b>) symbol or drag and drop to make your selections. 
Use the minus (<b>-</b>) symbol to remove networks. </li>
    
<li> Use the <b>Volume Options</b> tab to select boot options for an instance that launches with attached storage. </li>

<li> Use the <b>Post Creation</b> tab to customize the instance by adding a script to run after launch. The <b>Customization Script</b> 
field is analogous to "User Data" in other systems. </li>

<li> Click <b>Launch</b>. If successful, the image is added to the Images list with an Active status. </li>

</ol> 

#### How to Edit an Image

To learn whether you have permission to edit an image on the Cloud tab, see [Administration Dashboard Tasks by Roles](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

You cannot modify an image format.

When you edit an Amazon Machine Image (AMI) image, you see additional fields allowing you to select a Kernel image (AKI) and a RAMdisk Image (ARI). 
An AMI image is not valid unless it is associated with an AKI and ARI.

To edit an image:

1. Click <b>Cloud</b> > <b>Images</b> to open the Images window.

2. Find the image you want to edit, and click <b>More</b> > <b>Edit</b>.

3. Keep or edit:
  * <b>Name</b> : As desired.
  * <b>Description</b>: Optional.
  * <b>Architecture</b>: Optional information about hardware requirements for the VM the image runs on. For example, <code>x86 64 bits</code>.
  * <b>Format</b>: You cannot edit format.  Note: If you edit an AMI image, you can select a different AKI and ARI.
  * <b>Public</b>: Visibility.
  * <b>Protected</b>: Select to mark the image as read-only. A protected image cannot be edited or deleted.
    
4. Click <b>Update Image</b>.


#### How to Delete an Image

To learn whether you have permission to delete an image or protected image on the Cloud tab, see [Administration Dashboard Tasks by Roles](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

If you have permission to delete a protected image, you must first edit the image, so it is not protected. See [How to Edit an Image](#how-to-edit-an-image).

After you delete an image, you cannot create instances based on that (deleted) image. Also, if you delete an image that a topology document references, the infrastructure design document will fail during an attempt to provision.

To delete one or more images:

1. Click <b>Cloud</b> > <b>Images</b> to open the Images window.

2. To delete one image, click <b>More</b> > <b>Delete Image</b>.

3. <i>Optional</i>: To delete one or more images, select the images and click <b>Delete Images</b>.

4. A confirmation dialog box opens, warning that the action cannot be undone.

5. Click <b>Delete Image</b>. The Images list redisplays and the image or images are removed.


<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## Region Tab Tasks

**Concepts:**

The Region tab provides a convenient place for users who have permission to work with region services and content. 
To learn whether you have permission, see [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

A Region is a compute grouping that provides the context for the usage of compute servers, networking systems, and storage resources. 
A region makes use of a defined set of users, projects, topology templates, profiles, and services governed by a single OpenStack 
Keystone domain service. Regions are used to group different locations, different types of hardware, or to separate different resources 
belonging to different groups.

If your cloud contains more than one region, select the region to manage:

On the <b>Region</b> tab, select a <b>Current Compute Region</b>.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:600px; border: 1px dotted #000000;"> <b>Note:</b> Changing regions 
might switch the point of action to the Project tab. Click the <b>Region</b> tab again to display the selected region.</p>

**Tasks:**

* [How to See an Overview of Usage](#how-to-see-an-overview-of-usage)

* [How to See Instances](#how-to-see-instances)

* [How to Access Volumes](#how-to-access-volumes)

* [How to Access Images](#how-to-access-images)

* [How to Access Networks](#how-to-access-networks)

* [How to Access Routers](#how-to-access-routers)

* [How to Access Flavors and Flavor Extra Specs](#how-to-access-flavors-and-flavor-extra-specs)


### How to See an Overview of Usage

The Region tab provides a convenient place for users who have permission to see a usage summary. To learn whether you have permission, 
see [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

To see an overview of usage:

1. Click <b>Region</b> > <b>Overview</b> to see limits and usage for the current month.

2. You can select a different month to view and click <b>Submit</b>.

3. <b>Download CSV Summary</b> opens a text file in Microsoft Excel with current month usage information.


### How to See Instances

**Concepts:**

Instances are running VMs. The Region tab provides a convenient place for users who have permission to see region instances. To learn whether you have 
permission, see [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

To see a list of instances:

1. Click Region > Instances to open the Instances window.

2. Information shown includes instance name, image name, IP address, size, keypair, status, task, power state, and uptime.

3. Optional: To display details of a region instance, click the Name to open a window that offers the following tabs:
 * Overview, where you see instance details and specifications.
 * Log, which is the system log from the VM. Use this log for debugging and troubleshooting. You can view the full instance log or specify the number of lines of the log file to view.
 * Console, where you can remotely log directly in to the VM.

**Tasks:**

* [How to See the Instance Console, Console Log, and Overview](#how-to-see-the-instance-console-console-log-and-overview)
* [How to Edit an Instance](#how-to-edit-an-instance-region-tab)
* [How to Suspend, Resume, or Terminate an Instance](#how-to-suspend-resume-or-terminate-an-instance)


#### How to See the Instance Console, Console Log, and Overview

The instance console is the system log from the VM, and it is used for debugging and troubleshooting. You can view the full instance log or specify the 
number of lines of the log file to view.

 To display the instance console:

1. On the <b>Region</b> tab, select a <b>Current Compute Region</b>.

2. Click <b>Instances</b> to open the Instances window.

3. Find the instance you want to learn more about, and click <b>More</b> > <b>Console</b> to open the Console window.

4. <i>Optional</i>: Click the <b>Log</b> tab to see the most recent 35 lines from the Instance Console Log. 
To change the number of display lines, enter a value in <b>Log Length</b> and click <b>Go</b>. 
Click <b>View Full</b> Log to view all logged entries in a separate window.

5. <i>Optional</i>: Click the <b>Overview</b> tab to see high level information (such as status, specs, security, and so on) about the region instance.


#### How to Edit an Instance {#how-to-edit-an-instance-region-tab}

To edit a region instance:

1. On the <b>Region</b> tab, select a <b>Current Compute Region</b>.
   
2. Click b to open the Instances window.

3. Find the Instance you want to edit, and click <b>Edit Instance</b>.

4. Select the <b>Info</b> tab to update the <b>Name</b>.

5. Select the <b>Security Groups</b> tab to edit security groups. Use the plus symbol (<b>+</b>) to add groups and the minus symbol (<b>-</b>) to remove groups.
  * <b>All Security Groups</b> &mdash; A list of security groups that are associated with the project, but not the instance.
  * <b>Instance Security Groups</b> &mdash; A list of security groups that are currently associated with the instance.

 6. Click <b>Save</b>.


#### How to Suspend, Resume, or Terminate an Instance

When you terminate an instance, the Administration Dashboard shuts the VM down, and the resources associated with it are released. You cannot start the 
VM after it is terminated, because it no longer exists. Termination is scheduled, because it takes some time to free all the resources. The scheduled 
termination script runs in the background.

When you terminate an instance:

* Any changes associated with the volume that the image is running on are discarded.

* Any changes associated with the volume implied by the disk space (ephemeral) that are specified in the flavor are discarded.

* Any changes associated with attached volumes are retained in the attached volume and could be reattached to a different VM.

* The VM is removed from any security group it was associated with, and frees its floating IP addresses.

To terminate one or more instances:

1. On the <b>Region</b> tab, select a <b>Current Compute Region</b>.

2. Click <b>Instances</b> to open the Instances window.

3. To terminate one instance, find the instance and select <b>More</b> > <b>Terminate Instance</b>.

4. <i>Optional</i>: To terminate multiple instances, select the instances you want to terminate, and click <b>Terminate Instances</b>.

5. In the warning dialog box, verify your selection and click <b>Terminate Instance</b>(<b>s</b>).



### How to See Info about Services, Compute Services, and Default Quotas

**Concepts:**

The Region tab provides a convenient place for users who have permission to see information about services, compute service and default quotas (limits). 
To learn whether you have permission, see [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

**Tasks:**

* [How to See a List of Services](#how-to-see-a-list-of-services)

* [How to See a List of Compute Services](#how-to-see-a-list-of-compute-services)

* [How to See a List of Default Quotas (Limits)](#how-to-see-a-list-of-default-quotas-limits)


#### How to See a List of Services

The Services window provides a convenient place for users who have permission to see a read-only list of registered services.

Services can be run on the same node as the compute region controller or they can be run on a different server.

To see a list of services, click <b>Region</b> > <b>Info</b> > <b>Services</b> tab, which opens the Services window.

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th> Service Name </th>
<th> Description </th> 
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:100px; font-weight: bold;"> Nova </td>
<td> A region is constructed by installing and naming a compute server called Nova. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:100px; font-weight: bold;"> Quantum </td>
<td> Provides network management for VMs. </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:100px; font-weight: bold;"> Focus </td> 
<td> Repository for topology designs and profiles that are used for provisioning. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:100px; font-weight: bold;"> Glance </td>
<td> Repository for images used to create new VMs. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:100px; font-weight: bold;"> Cinder </td>
<td> Provides block-storage based volume management for VMs. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:100px; font-weight: bold;"> EC2 </td>
<td> An alternate service interface for the Nova service. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:100px; font-weight: bold;"> Eve </td>
<td> A composite provisioning service that uses a topology design and profile to create VMs, volumes, and network segments as described in the topology. 
Eve uses the Graffiti service for determining resource pool existence, traits, and user identity mapping. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:100px; font-weight: bold;"> Keystone </td>
<td> Provides user authentication and tracks various projects within the regions. If Keystone is disabled, you cannot log into the Administration Dashboard. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:100px; font-weight: bold;"> Graffiti </td>
<td> A searchable directory to find cloud resources based on their capabilities. <br />  <br />
An example of a cloud resource is resource pool definitions that you can use to provision to various cloud providers. </td> 
</tr>

</table>

The <b>Host</b> column shows the IP address where the service is running.

The <b>Status</b> shows whether the service is enabled.


#### How to See a List of Compute Services

The Compute Services window provides a convenient place for users who have permission to see a read-only list of registered compute services.

To see a list of registered compute services, click <b>Region</b> > <b>Info</b> > <b>Compute Services</b> tab, which opens the Compute Services window.


#### How to See a List of Default Quotas (Limits)

The Default Quotas window provides a convenient place for users who have permission to see a read-only list of region quotas. 
The Administration Dashboard provides default limits, but you can modify those limits at the project level. 
See [How to Change a Project's Compute or Storage Limits](#how-to-change-a-projects-compute-or-storage-limits). 

To see a list of region default quotas (limits), click <b>Region</b> > <b>Info</b> > <b>Default Quotas</b> tab, which opens the Default Quotas window.


### How to Access Volumes

**Concepts:**

The Region tab provides a convenient place for users who have permission see volumes. To learn whether you have permission, see 
[Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

Volumes are the disk storage volumes that have been created in the region. Volumes are persistent, meaning you can create data in these volumes and attach 
to various VMs (instances) over time as needed.

To see a list of volumes:

1. Click <b>Region</b> > <b>Volumes</b> to open the Volumes window.

  The information shown includes volume name, host size, status, type, attached to, and the associated project name.

2. <i>Optional</i>: To see details of a volume, click the <b>Name</b> to open an Overview window.

  Information shown includes volume name, ID, status, specs, and attachments.

**Tasks:**

* [How to Create a Volume Type](#how-to-create-a-volume-type)

* [How to Delete a Volume Type](#how-to-delete-a-volume-type)

* [How to Delete a Volume](#how-to-delete-a-volume)



#### How to Create a Volume Type 

To create a region volume type:

1. On the <b>Region</b> tab, select a <b>Current Compute Region</b>.

2. Click <b>Volumes</b> to open the Volumes window.

3. Click <b>Create Volume Type</b>.

4. Enter a <b>Name</b>. This is commonly associated with the storage backend driver capabilities, such as Performance, SSD, or Backup.

5. Click <b>Create Volume Type</b>.


#### How to Delete a Volume Type 

To delete one or more volume types:

1. Click <b>Region</b> > <b>Volumes</b> to open the Volumes window.

2. Find the volume type you want to delete, and click <b>Delete Volume Type</b>.

  <i>Optional</i>: To delete more than one volume type, select the volume types and click <b>Delete Volume Types</b>.

3. In the confirmation dialog, verify your selection and then click <b>Delete Volume Types</b>.


#### How to Delete a Volume 

Deleting a volume means the volume will no longer exist, the data will be lost, it cannot be attached to any VM, and no user can access it. 
Deleting a volume cannot be undone.

 

To delete one or more volumes:

1. Click <b>Region</b> > <b>Volumes</b> to open the Volumes window.

2. Find the volume you want to delete and click <b>Delete Volume</b>.

  <i>Optional</i>: To delete more than one volume, select the volumes and click <b>Delete Volumes</b>.

3. In the confirmation dialog, verify your selection and then click <b>Delete Volume</b>.



### How to Access Images

**Concepts:**

The Region tab provides a convenient place for users who have permission to see a list of images (that are not snapshots) and to work with those images. 
To learn whether you have permission, see [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

Images are stored at the Domain level with a single Glance service and are unaffected by region selection. Only Public images are visible to all users.

Launchable images must be in one of the following formats:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: white; color: black;">
<td colspan="2"> <b>AMI (Amazon Machine Image)</b> &mdash; Not valid unless it is associated with a kernel image (AKI) and a RAMdisk Image (ARI). </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>ISO</b> &mdash; Optical Disk Image </td>
<td> <b>QCOW2</b> &mdash; QEMU Emulator </td> 
</tr>
	 
<tr style="background-color: white; color: black;">
<td> <b>RAW</b> </td>
<td> <b>VDI</b> &mdash; Virtual Disk Image </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> <b>VHD</b> &mdash; Virtual Hard Disk Image </td>
<td> <b>VMDK</b> &mdash; Virtual Machine Disk Image </td> 
</tr>

</table> 


To see a list of all images:

1. Click Regions > Images to open the Images window.

  The information shown includes name, type, status, whether the image is public or protected, and format.

2. <i>Optional</i>: To see image details, click the Image Name link to open its Overview window.

  The information shown includes image name, ID, whether protected, checksum, creation date, updated date, and specs.

**Tasks:**

* [How to Create an Image](#how-to-create-an-image-region-tab)

* [How to Edit an Image](#how-to-edit-an-image-region-tab)

* [How to Delete an Image](#how-to-delete-an-image-region-tab)


#### How to Create an Image {#how-to-create-an-image-region-tab}

You can create and configure an image to upload to the image service used by the Administration Dashboard. The image must be available on an HTTP URL. 
Compressed image binaries, such as .zip, and .tar.gz, are supported.

To create an image:

1. Click <b>Region</b> > <b>Images</b> > <b>Create Image</b>.

2. In the <b>Create an Image</b> dialog box, enter a <b>Name</b>.

3. Enter an <b>Image Location</b> that meets the following requirements:

 a. A valid and direct HTTP URL to the image binary. URLs that redirect or serve error pages will result in unusable images.
   
    **Note:** If you do not have rights to the image binary url, you receive an error when trying to create the image

 b. The image must be accessible to the image service.

 c. The image must be in a supported format.
 
    **Note:** If you upload an image with a format that is not supported, you will receive an Error 404, Not Found error when you attempt to create the image.

4. Select an <b>Image File</b>.

   Select a <b>Format</b> from the drop-down list. The image must be in one of the formats listed.
   
5. Enter the <b>Minimum Disk space</b> and <b>Minimum Ram</b>.

6. Keep <b>Public</b> checked if you want the image visible to all users.

7. Click <b>Create Image</b>. If successful, the image displays with an Active status. If creation is not successful within a specified amount of time (set by your system administrator; typically no more than five minutes), the <b>Status</b> of the image in the list displays <b>Upload Failed</b>.

**Note:** Only AMI, RAW, and QCOW2 images are launchable.



#### How to Edit an Image {#how-to-edit-an-image-region-tab}

You cannot modify an image format.

When you edit an Amazon Machine Image (AMI) image, you see additional fields allowing you to select a Kernel image (AKI) and a RAMdisk Image (ARI). An AMI image is not valid unless it is associated with an AKI and ARI.

To edit an image:

1. Click <b>Region</b> > <b>Images</b> to open the Images window.

2. Find the image to edit. Click <b>Edit</b>.

3. Keep or edit:
  * <b>Name</b>: As desired.
  * <b>Description</b>: Optional description.
  * <b>KernelID</b>
  * <b>Ramdisk ID</b>
  * <b>Architecture</b>: Optional information about hardware requirements for the VM the image runs on. For example, x86 64 bits.
  * <b>Public</b>: Visibility
 
  **Note**: If you edit an AMI image, you can select a different AKI and ARI.
   
  * <b>Protected</b>: Select to create a read-only image. Protected images cannot be edited or deleted.

4. Click <b>Update Image</b>.



#### How to Delete an Image {#how-to-delete-an-image-region-tab}

After you delete an image, you cannot create instances based on that (deleted) image. Also, if you delete an image that a topology template references, provisioning will fail.

Images are protected from deletion by rules. If you are not allowed to delete an image, you do not see <b>Delete Image</b>.

To delete one or more images:

1. Click <b>Region</b> > <b>Images</b> to open the Images window.

2. Find the image you want to delete, and click <b>Delete Image</b>.

  <i>Optional</i>: To delete more than one image, select the images and click <b>Delete Images</b>.

3. A confirmation dialog box opens, warning that the action cannot be undone.

4. Click <b>Delete Image</b>. The Images list redisplays and the image or images are removed.



### How to Access Networks

**Concepts:**

The Region tab provides a convenient place for users who have permission to see a list of networks and work with those networks. 
To learn whether you have permission, see Administration Dashboard Tasks by Role.

To see a list of networks:

1. Click <b>Region</b> > <b>Networks</b>.

  The information shown includes the networks' status, administrative state, associated subnets, and whether the network is shared.

2. <i>Optional</i>: To see the details of a network, click the <b>Network Name</b>. The Administration Dashboard opens the Network Overview window of the associated project.

**Tasks:**

* [How to Create an External Network](#how-to-create-an-external-network)

* [How to Create a Private Network](#how-to-create-a-private-network-region-tab)

* [How to Edit a Network](#how-to-edit-a-network)

* [How to Delete a Network](#how-to-delete-a-network)


#### How to Create an External Network

The Admin user or cloud administrators can create an external network on the <b>Region</b> tab. The cloud can only support one external network, so the network should be created as a shared network. As a shared network, it can be used by multiple projects, if needed.

To create an external network:

<ol> 

<li> Click <b>Region</b> > <b>Networks</b> to open the Networks window. </li> 

<li> Click <b>Create Network</b> to open the Create Network dialog box where you:

<ul>

<li> Enter a <b>Name</b> for the network. </li> 

<li> Select a <b>Project</b> to associate with the network. </li> 

<li> <b>Keep Admin State</b> selected to create a network that is active and operational. </li> 

<li> Select <b>Shared</b> to associate the network with all projects in the cloud. </li> 

<li> Select <b>External Network</b> to create a network that is operational outside the cloud.
<br /> <br /> 
<p> <b>Note</b>: If you select <b>Admin State</b> and <b>Shared</b>, and do not select <b>External Network</b>, the combination of settings is invalid. 
You can create the network, but it will fail during provisioning.</p>
</ul>

</li> 

<li> Click <b>Create Network</b>. </li>    

<li> If the network is created successfully, the Administration Dashboard displays the network information on the <b>Project</b> > <b>Infrastructure</b> > <b>Networks</b> window. 
</li> 

</ol>

**Related Topic:**

[How to Create a Subnet](#how-to-create-a-subnet)


#### How to Create a Private Network #### {#how-to-create-a-private-network-region-tab} 

The Admin user and cloud administrators can create a private network on the Region tab.

To create a private network:

<ol>

<li> Click <b>Region</b> > <b>Networks</b> to open the Networks window. </li> 

<li> Click <b>Create Networks</b> and to open the Create Network dialog box where you:

<ul>

<li> Enter a <b>Name</b> for the network. </li> 

<li> Select a <b>Project</b> to associate with the network. </li> 

<li> Keep <b>Admin State</b> selected to create a network that is active and operational. </li> 

<li> Do <b><i>not</i></b> select Shared, because you are creating a private network. You do not want to share the network with other projects.  </li> 

<li> Do <b><i>not</i></b> select External Network. External networks are always shared.
<br /> <br /> 
<p> <b>Note:</b> If you select <b>Admin State</b> and <b>Shared</b>, and do not select <b>External Network</b>, the combination of 
settings is invalid. You can create the network, but it will fail during provisioning. </p> 
</li> 

<li> Click <b>Create Network</b>. </li> 

</ul>

</li> 
    
<li> If the network is created successfully, the Administration Dashboard displays the network information on the Project > Infrastructure > Networks window.
</li> 

</ol> 

**Related Topics:**

[How to Create a Subnet](#how-to-create-a-subnet)


 
#### How to Edit a Network

The <b>Region</b> > <b>Networks</b> window provides a convenient place for the Admin user and cloud administrators to see all the networks in all the 
regions, so administrators can decide which networks to edit.

If you originally created the network for a single project, and you later decide to share it, you must edit the <b>Shared</b> and <b>External Network</b> options.

 
To edit a network:

1. Click <b>Region</b> > <b>Networks</b> to open the Networks window.

2. Find the network you want to edit, and click <b>Edit Networks</b> to open the Edit Network dialog box.

3. Keep or edit the <b>Name</b>, <b>Admin State</b>, <b>Shared</b>, or <b>External Network</b> values. You cannot edit the <b>ID</b>.

  **Note:** If you select <b>Admin State</b> and <b>Shared</b>, and do not select <b>External Network</b>, the combination of settings is invalid. You can create the network, but it will fail during provisioning.

4. Click <b>Save Changes</b>.



#### How to Delete a Network

The <b>Region</b> > <b>Networks</b> window provides a convenient place for the Admin user and cloud administrators to see all the networks in all the regions, so administrators can decide which networks to delete.

A network is referenced by subnets and routers, which are, in turn, referenced by VMs. You cannot delete a network that has VMs connected to one of its subnets. To delete a network, VMs must not be connected to that network.

 

To delete one or more networks:

1. Click <b>Region</b> > <b>Networks</b> to open the Networks window.

2. To delete one network, click <b>More</b> > <b>Delete Network</b>.

  <i>Optional</i>: To delete one or more networks, select the networks and click <b>Delete Networks</b>.

4. In the <b>Confirm Delete Network</b> dialog, verify your selection, and click <b>Delete Network</b>(<b>s</b>).

5. The Networks window opens, and you do not see the networks listed.



### How to Access Routers

**Concepts:**

The Region tab provides a convenient place for users who have permission to see a list of routers. and work with those routers. To learn whether you have 
permission, see [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).


To see a list of routers:

1. Click <b>Region</b> > <b>Routers</b> to open the Routers window.

  The information shown includes the router name, status, external network, and associated project.
  
2. <i>Optional</i>: To see the details of a router, click the <b>Name</b>. The Administration Dashboard opens the Routers window in the associated project. You are now working on the project level. 

**Tasks:**

* [How to Delete a Router](#how-to-delete-a-router)

#### How to Delete a Router

The <b>Region</b> > <b>Routers</b> window provides a convenient place for the admin user and cloud administrators to see all the routers in all the regions, so administrators can decide which routers to delete.

To delete one or more routers:

1. Click <b>Region</b> > <b>Routers</b> to open the Routers window.

2. Select one or more routers, and then click <b>Delete Routers</b>.

3. In the confirmation dialog, verify your selection, and then click <b>Delete Router</b>.

4. The Routers window opens, and you do not see the routers listed.


### How to Access Flavors and Flavor Extra Specs

**Concepts:**

The Region tab provides a convenient place for users who have permission to see a list of flavors and work with those flavors. 
To learn whether you have permission, see [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

Flavors are machine configurations that can be used to create new VMs. A flavor describes the amount of memory, number of CPUs, and ephemeral disk space available to the VM. You can create an extra spec key-value for a flavor.

To see a list of flavors, click Regions > Flavors to open the Flavors window. The information shown includes name, VCPUs, RAM, Root Disk, ephemeral disk, swap disk, and ID.

**Tasks:**

* [How to Create a Flavor](#how-to-create-a-flavor)

* [How to Edit a Flavor](#how-to-edit-a-flavor)

* [How to Delete a Flavor](#how-to-delete-a-favor)

* [How to Create a Flavor Extra Spec](#how-to-create-a-flavor-extra-spec)

* [How to Edit a Flavor Extra Spec](#how-to-edit-a-flavor-extra-spec)

* [How to Delete a Flavor Extra Spec](#how-to-delete-a-flavor-extra-spec)



#### How to Create a Flavor

Only cloud architects can create flavors. Creating a flavor defines a new configuration used to create new VMs. Typically, the pre-defined flavors m1.tiny through m1.xlarge are valid.

To create a region flavor:

1. On the <b>Region</b> tab, select a <b>Current Compute Region</b>.

2. Click <b>Flavors</b> to open the Flavors window.

3. Click <b>Create Flavor</b> to open the Create Flavor dialog box.

4. All fields are required. All fields are integer values except for the <b>Name</b> field.

5. Click <b>Create Flavor</b>. The list redisplays with the new flavor listed alphabetically and a system-assigned <b>Flavor ID</b>.


#### How to Edit a Flavor

To edit a region flavor:

1. On the <b>Region</b> tab, select a <b>Current Compute Region</b>.

2. Click <b>Flavors</b> to open the Flavors window.

3. Find the flavor you want to edit, and click <b>Edit Flavor</b> to open the Edit Flavor dialog box.

4. Keep or change the values.

5. Click <b>Save</b>.


#### How to Delete a Flavor

Only a domain administrator within a region can delete flavors. When you delete a flavor, the flavor is no longer visible in the Administration Dashboard 
and cannot be used to create a new VM, to assign in resource pool services, or to specify in Infrastructure Design documents.

A deleted flavor still exists in the Nova database until the clean flavors script (scheduled by a system administrator) runs. The script cannot delete a 
flavor, if the flavor is in use by an active instance. You must terminate the instance.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:700px;"> <b>Note:</b> If all flavors are deleted, you 
cannot create VMs. </p>

To delete one or more region flavors:

1. On the <b>Region</b> tab, select a Current Compute Region.

2. Click <b>Flavors</b> to open the Flavors window.

3. Select the flavors you want to delete. To select all, click the top checkbox in the header row.

4. Click <b>Delete Flavors</b>.

5. In the <b>Confirm Delete Flavors</b> dialog box, verify your selections and then click <b>Delete Flavors</b>.

6. Wait for the success message.


#### How to Create a Flavor Extra Spec

You can create an extra spec key-value for a flavor.

To create an extra spec for a flavor:

1. Click <b>Region</b> > <b>Flavors</b> to open the Flavors window.

2. Find the flavor in the Flavors list, and click <b>More</b> > <b>View Extra Specs</b> to open the Extra Specs window.

3. Click <b>Create</b> to open the <b>Create Flavor Extra Spec</b> dialog box. Enter:

4. Click <b>Create</b>.


#### How to Edit a Flavor Extra Spec

You can edit an extra spec value. If you make changes to the extra spec name, the Administration Dashboard creates a new extra specs key.

To edit a flavor extra spec:

1. Click <b>Region</b> > <b>Flavors</b> to open the Flavors window.

2. Find the flavor where you want to edit specs, and click <b>More</b> > <b>View Extra Specs</b> to open the Extra Specs window.

3. Click <b>Edit</b>.

4. Make changes to Value and then click <b>Save</b>.


#### How to Delete a Flavor Extra Spec

To delete a flavor extra specs key:

1. Click <b>Region</b> > <b>Flavors</b> to open the Flavors window.

2. Find the flavor where you want to delete specs. Click <b>More</b> > <b>View Extra Specs</b> to open the Extra Specs window.

3. Find the extra spec you want to delete. Click <b>More</b> > <b>Delete Extra Spec</b>. A confirmation window opens, warning you that the action cannot be undone.
    
4. Click <b>Delete Extra Spec</b>. The extra spec is deleted from the Extra Specs list and the system.

	
	
	

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Project Tab Tasks

**Concepts:**

Projects are groupings that allow designated users to view the same set of content. Projects protect topology templates, infrastructure designs, and 
realized resources (such as VMs, volumes, and others) from being visible to all users.

To learn about which tasks you can perform on the Project tab, see your role under [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

**Tasks:**

* [How to See a Project Overview](#how-to-see-a-project-overview)

* [Running Topologies](#running-topologies) 

* [Deployment Profiles](#deployment-profiles)

* [Resource Pools](#resource-pools)

* [Instances](#instances)

* [Volumes](#volumes)

* [Images and Snapshots](#images-and-snapshots)

* [Networks](#networks)

* [Routers](#routers)

* [How to See a Network Topology Diagram](#how-to-see-a-network-topology-diagram) 

* [Security Groups and Rules](#security-groups-and-rules)

* [How to Import, Create, or Delete a Keypair](#how-to-import-create-or-delete-a-keypair)

* [Floating IPs](#floating-ips)

* [How to Access API Endpoints](#how-to-access-api-endpoints)

* [How to Access Your Authentication Token](#how-to-access-your-authentication-token)

* [Updates and Extensions](#updates-and-extensions)


### How to See a Project Overview

To see a project overview:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Overview</b> > <b>Overview</b> to see limit and usage summaries for the current month.

3. <i>Optional</i>: Change the <b>From</b> and <b>To</b> range, and click <b>Submit</b> to see limit and usage summaries for a different time period.

4. <i>Optional</i>: Click <b>Download CSV Summary</b> to open a text file in Microsoft Excel with current month usage information.


### Running Topologies

**Concepts:**

To see a list of running topologies:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Provisioning</b> ><b> Running Topologies</b> to open the Running Topologies window.

  Information shown includes topology name, action, state, task, and last update.

3. <i>Optional</i>: To see details of a running topology, click the Topology Name, to open a window that offers the following tabs:
  * <b>Overview</b>
  * <b>Job</b>
  * <b>Content</b>

**Tasks:**

* [How to Launch a Topology](#how-to-launch-a-topology)

* [How to Delete or Terminate a Running Topology](#how-to-delete-or-terminate-a-running-topology)



#### How to Launch a Topology

You can launch the latest version of a topology design.

To launch a topology design:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Provisioning</b> > <b>Running Topologies</b> to open the Topologies window.

3. Click <b>Launch Topology</b>.

4. Select a deployment profile. (Required).

5. Enter a meaningful <b>Infrastructure Name</b> (Required).

6. Click <b>Launch Topology</b>.

7. Wait for the success message.

8. Verify that the topology you just created is included in the Running Topologies list.

Servers that are part of the topology will appear in the Instances list, but the whole topology will be in the Running Topologies list.


#### How to Delete or Terminate a Running Topology

When you delete a running topology, the Administration Dashboard stops the VM and other topology elements (such as networks, volumes, and others), 
and permanently removes them. This action cannot be undone.

To delete a running topology:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.
   
2. Click <b>Provisioning</b> > <b>Running Topologies</b> to open the Topologies window.

3. Select the topology you want to delete and then click <b>Delete Topology</b>.
   
4. Wait for the success message.
   
5. Verify that the deleted topology is excluded from the Topologies list.


<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:700px;"> <b>Note:</b> Although terminated topologies 
are not running, they are still included in the <b>Running Topologies</b> window, with an updated <b>State</b>.
</p>

To terminate a running topology:

1. On the Project tab, select a Current Project.

2. Click Provisioning > Running Topologies to open the Topologies window.

3. Select the Topology you want to terminate, and click Terminate Topology. The State changes to Inactive.

Terminating a topology can fail in the following case:

* Assume that you provision topology A, and it includes a subnet, router and security group.

* Assume that you next provision topology B, and it uses the subnet, router, and security group from topology A.

If you attempt to terminate topology A, the terminate will fail for all components that are also provisioned to topology B. You must terminate topology B before you can terminate topology A.


  
### Deployment Profiles

**Concepts:**

To see a list of deployment profiles:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Provisioning</b> > <b>Deployment Profiles</b> to open the Deployments window.

  Information shown includes deployment name, version, based on, scope, and associated project.
  
3. <i>Optional</i>: To see details of a deployment profile, click the <b>Deployment Name</b> to open a window that offers the following tabs:
  * <b>Overview</b>, where you see detailed deployment profile information, including versions.
  * <b>Contents</b>, where you see deployment profile contents.

**Tasks:**

* [How to Launch a Deployment Profile](#how-to-launch-a-deployment-profile)



#### How to Launch a Deployment Profile

To launch a deployment profile:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Provisioning</b> > <b>Deployment Profiles</b> to open the Deployment Profiles window.

3. Find the deployment that you want to launch. Click <b>Launch</b> to open the Launch dialog box where you:

  a. Accept or modify the Infrastructure Name.

  b. Click <b>Launch</b>.

4. If the launch is successful, you create a running topology. A deployment profile can be launched multiple times to create multiple running topologies. See [Running Topologies](#running-topologies).

  
### Resource Pools

**Concepts:**

Resource pools are used to access various cloud providers. For multiple regions, one resource pool is required for each region.

A resource pool consists of resources in a single cloud. A resource pool could represent one compute region, or it could represent a pool of resources on another cloud provider.

Resource pools help you locate compute and storage resources to use when you provision.

Depending upon how your cloud was created, your cloud might automatically contain a default resource pool.

Graffiti is the service used for resource pool registry. Every time you want to access a different cloud provider, you must define a new record in the Graffiti Resource Pool Registry. These records define how to access a certain cloud provider.

To see a list of resource pools:

1. On the Project tab, select a Current Project.

2. Click Provisioning > Resource Pools to open the Resource Pools window.

3. Information shown includes resource pool name, type, version, scope, user name and provider.

4. <i>Optional</i>: To see resource pool details, click the <b>Resource Pool Name</b> to open an Overview window.

5. Information shown includes resource pool name, type, scope, ID information, provider information, and more.

**Tasks:**

* [How to Create a Resource Pool](#how-to-create-a-resource-pool)

* [How to Edit a Resource Pool](#how-to-edit-a-resource-pool)

* [How to Add, Edit, or Delete a Resource Pool Service](#how-to-add-edit-or-delete-a-resource-pool-service)

* [How to Delete a Resource Pool](#how-to-delete-a-resource-pool)
	


#### How to Create a Resource Pool

Resource pools help you locate compute and storage resources to use when you provision.

Depending upon how your cloud was created, your cloud might automatically contain default resource pools for the cloud's compute regions.

To create a resource pool:

<ol>

<li> On the <b>Project</b> tab, select a <b>Current Project</b>. </li> 

<li> Click <b>Provisioning</b> > <b>Resource Pools</b> to open the Resource Pools window. If resource pools have been created, you see them listed on the window. </li> 

<li> Click <b>Create Resource Pool</b> to open the Create Resource Pool dialog box. </li> 

<li> Select a <b>Cloud Type</b> to create a resource pool when you are using local (on premise services) or HP Cloud services. 

<ul>
<li> <b>Custom</b>: All provider details are required.
<li> <b>HP Cloud OS - OpenStack (Grizzly)</b>: The dashboard provides values for the HP Cloud OS Administration Dashboard environment. Provider details are not required.
<li> <b>HP Cloud - OpenStack (Diablo)</b>: The dashboard provides values for the HP Cloud Services environment. You must enter <b>Provider Details</b>, which are required.
<li> <b>Custom - OpenStack (Grizzly)</b>: Provides maximum flexibility when you are creating a resource pool. <b>Details</b> and <b>Provider Details</b> are required.
</ul>
</li> 

<li> Select a Compute Region to create a resource pool when you are using local (on premise) services or HP Cloud services. If you do not select a Compute Region, you must enter information in the remaining fields. </li> 

<li> In the <b>Details</b> section:
<ul>
<li> Enter a <b>Name</b>.
<li> Select a <b>Scope</b>: <br /> <br /> 
<p> <b>Private, cloud</b>: Allows you access while working in any project. This resource pool can only be viewed by the user who created it, from any project of which the user is a member, and by cloud administrators. </p>
<p> <b>Private, project</b>: Allows you access while working in the current project. This resource pool can only be viewed by the user who created it in the project in which it was created, and by cloud administrators. </p>
<p> <b>Public, cloud</b>: Allows access for all users. This resource pool can be viewed by anyone in the cloud, in any project. </p>
<p> <b>Public, project</b>: Allows you and other project members access. This resource pool can be viewed by members of the project in the project in which it was created, and by cloud administrators. </p>
</ul>
</li>

<li> Select a <b>Cloud Profile</b> to represent the current supported OpenStack version and capabilities of the cloud to which you are deploying.
 <br /> <br /> 
<p> <b>HP Cloud OS Grizzly</b> </p>
<p> <b>HP Cloud Service</b> </p>
<p> <b>Note:</b> The dashboard automatically enters Type, Version, Region ID and Provider URL based upon the cloud type and compute region you selected. </p>
</li> 

<li> <i>Optional</i>: In the <b>Provider Details</b> section, enter a Project ID, User Domain Name, Project Domain Name, User Name, and Password. Enter the password again in <b>Confirm Password</b> to validate.
<ul>
<li> If you are using a local (on premise service), such as HP Cloud OS, you do not need an account on that service to create and edit resource pools. </li> 
<li> If you are using a remote service, such as HP Cloud or Rackspace, you must have an account on that cloud provider's system to create and edit resource pools.  </li> 
<li> If you create a resource pool that requires credentials, the Administration Dashboard validates them when you create a resource pool, instead of when you first use the resource pool.  </li> 
</ul>
</li> 

<li> Click <b>Create Resource Pool</b>. </li> 

</ol> 

#### How to Edit a Resource Pool

Use the <b>Edit Resource Pool</b> view to update resource pool definitions that will be used during topology provisioning. In common use cases, you can:

* Change the name of the resource pool.
  
* Switch to a new region.
  
* Update the OpenStack server domain URL.
  
* Modify different provider credentials when the resource is an HP Cloud.
  
* Modify values that were not accurate when you originally entered them.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:700px;"> <b>Note:</b> If you change your HP Cloud password, 
you must also change your password in the <b>Edit Resource Pool</b> view.
</p>

To update resource pool definitions:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Provisioning</b> > <b>Resource Pools</b> to open the Resource Pools window.

3. Find the resource pool that you want to edit, and click <b>Edit Resource Pool</b>.

4. In the <b>Details</b> section, modify the <b>Name</b>, <b>Type</b>, <b>Region ID</b>, <b>Version</b>, <b>Scope</b>, <b>Cloud Profile</b>, and <b>Provider URL</b>.

5. Depending on the Cloud Type, in the Provider Credentials section, modify the <b>Tenant ID</b>, <b>User Name</b>, and <b>Password</b>. Enter the password again in <b>Confirm Password</b> to validate. If you create a resource pool that requires credentials, the Administration Dashboard validates them when you edit a resource pool, instead of when you first use the resource pool.

6. Click <b>Update Resource Pool</b> to save your changes.


#### How to Add, Edit, or Delete a Resource Pool Service

Use the <b>Edit Resource Pool Services</b> view to add, edit, and delete services to and from a resource pool.

A service definition uses the model and version properties to identify an infrastructure service that is realized using the specified image/flavor combination. If you find problems in particular model/version, you might be required to add a new resource pool service.

To add a resource pool service:

1. On the Project tab, select a Current Project.

2. Click <b>Provisioning</b> > <b>Resource Pools</b> to open the Resource Pools window. **Note:** Version must be prefixed by "v". For example, to enter a version 1.0, enter "v1.0".

3. Click <b>Add Service</b> to open a row of entry boxes for your new service.

4. Enter the <b>Name</b>, <b>Type</b>, <b>Model</b>, <b>Version</b>, <b>Flavor ID</b>, and select an <b>Image ID</b> (if you have images loaded). **Note:** Version must be prefixed by "v". For example, to enter a version 1.0, enter "v1.0".

5. Click <b>Update Resource Pool Services</b> to save your changes.

 

To edit a resource pool service:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Provisioning</b> > <b>Resource Pools</b> to open the Resource Pools window.

3. Find the resource pool you want to edit, and click <b>More</b> > <b>Edit Services</b>.

4. Keep or modify the service entry boxes.

5. Click <b>Update Resource Pool Services</b> to save your changes.

     

To delete one or more resource pool services:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Provisioning</b> > <b>Resource Pools</b> to open the Resource Pools window.

3. Select the resource pools you want to delete, and click <b>Delete Services</b>.


#### How to Delete a Resource Pool

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:700px;"> <b>Caution:</b> Make sure you really want to 
delete a resource pool. Deleted resource pools cannot be restored. You must recreate them.
</p>

<b>Best Practice</b>: Delete the resource pool after deleting all services that were using that resource pool.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:700px;"> <b>Note:</b> 
You can delete a resource pool even if a service is provisioned using that resource pool. Also, after the resource pool is deleted, the 
de-provisioning operation will still succeed.
</p>

To delete one or more resource pools:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Provisioning</b> > <b>Resource Pools</b> to open the Resource Pools window.

3. To delete one resource pool, find the resource pool you want to delete and click <b>More</b> > <b>Delete Resource Pool</b>.

4. <i>Optional</i>: To delete more than one resource pool, select the resource pools, and click <b>Delete Resource Pools</b>.

5. Confirm your selection in the warning dialog box, and click <b>Delete Resource Pool</b>.

  
### Instances

**Concepts:**

Instances are all of the VMs running within a selected project.

To view a list of instances:

1. On the <b>Project</b> tab, select a <b>Current Project</b> from the drop-down list.

2. Select <b>Infrastructure</b> > <b>Instances</b> to open the Instances window.

  Information shown includes instance name, image name, IP address, size, keypair, status, task, power state, and uptime.

3. <i>Optional</i>: To see instance details, click an Instance Name to open a window that offers the following tabs:

  * <b>Overview</b>, where you see instance details and specifications.

  * <b>Log</b>, which is the system log from the VM. Use this log for debugging and troubleshooting. You can view the full instance log or specify the number of lines of the log file to view.

  * <b>Console</b>, where you can remotely log directly in to the VM.

**Tasks:**

* [How to Launch an Instance](#how-to-launch-an-instance)

* [How to Create an Instance Snapshot](#how-to-create-an-instance-snapshot)

* [How to Edit an Instance](#how-to-edit-an-instance-project-tab)

* [How to Associate a Floating IP to an Instance](#how-to-associate-a-floating-ip-to-an-instance)

* [How to Disassociate a Floating IP from an Instance](#how-to-disassociate-a-floating-ip-from-an-instance)

* [How to Pause or Resume an Instance](#how-to-pause-or-resume-an-instance)

* [How to Hard Reboot an Instance](#how-to-hard-reboot-an-instance)

* [How to Suspend or Resume an Instance](#how-to-suspend-or-resume-an-instance)

* [How to Force Delete an Instance](#how-to-force-delete-an-instance)

* [How to Terminate an Instance](#how-to-terminate-an-instance)





#### How to Launch an Instance

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:700px;"> <b>Caution:</b> When you set up an instance, 
carefully make your selections. After the instance is launched, the only editable property is its <b>Name</b>. </p>

To launch an instance:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Instances</b> to open the Instances window.

3. Click <b>Launch Instance</b> to open the Launch Instance window.

4. The window opens at the <b>Details</b> tab. Enter the following information:

   a. <b>Instance Source</b>: Whether you are launching an image (default) or snapshot.

   b. <b>Image</b>: Depending on your selection in the Instance Source field, you are required to select an AMI, RAW, and QCOW2 formatted image or a specific snapshot. (ARI and AKI types cannot be launched.)

   c. <b>Availability Zone</b>: Any availability zone or Nova.

   d. <b>Instance Name</b>: The name of the host you are creating (Required).

   e. <b>Flavor</b>: Indicates the size of the node. When you select a flavor here, the Flavor Details table on the right changes to indicate the node properties and values associated with your size selection.

     * <b>Name</b> : This is tiny, small, medium, large, or xlarge, or the name of a custom flavor that has been created

	 * <b>CPUs</b> : The number of virtual CPUs.

	 * <b>Root Disk</b>: Assigned by the image.

	 * <b>Ephemeral Disk</b>: A second storage disk available to the VM.

	 * <b>Total Disk</b>: This size is defined in Region > Flavors by the Domain Administrator. It is known as the Root Disk.

	 * <b>RAM</b>: Processor memory.

   f. <b>Instance Count</b>: Can be more than 1.
  
5. Use the Access and Security tab to control access to your instance via keypairs and security groups.

  a. <b>Keypair</b>: Keypairs are ssh credentials that are injected into images when they are launched. The public key is installed on the VM; you will use the private key to log in.

    To add a keypair, either:

	  i. Select a keypair from the list, or

	  ii. Click (<b>+</b>) to import a keypair. Enter <b>Keypair Name</b> and <b>Public Key</b>.

	To create a keypair, see [How to Import, Create, or Delete a Keypair](#how-to-import-create-or-delete-a-keypair).

  b. <b>Security Groups</b>: Security groups are one way to provide a measure of network isolation between different VMs, as they limit the ports into which network traffic can enter the group. You can select multiple groups.

6. Use the <b>Networking</b> tab to select one or more networks.

  You must specify at least one network. You can use the plus (<b>+</b>) symbol or drag-and-drop to select networks. Use the minus (<b>-</b>) sign to remove networks.

7. Use the <b>Volume Options</b> tab to select boot options for an instance that is launching with attached storage.

8. Use the <b>Post Creation</b> to customize the instance. This tab is analogous to "User Data" in other systems. The tab allows you to customize the instance by adding a script to run after instance launch.

9. Click <b>Launch</b>. If the launch is successful, the instance is added to the Instances list with a Power State of Running.



#### How to Create an Instance Snapshot

After you set up, install, and configure an instance, you can create a snapshot to preserve the disk state of the running instance. At a later time, you can use the snapshot to start up another VM.

To create an instance snapshot:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Instances</b> to open the Instances window.

3. Find the instance you want to snapshot, and click <b>Create Snapshot</b>.

4. Enter a name for the snapshot.

5. Click <b>Create Snapshot</b>. The Administration Dashboard displays the snapshot as an image on the <b>Images and Snapshots</b> panel. 
See [Images and Snapshots](#images-and-snapshots).



#### How to Edit an Instance {#how-to-edit-an-instance-project-tab}

To edit a project instance:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Instances</b> to open the Instances window.

3. In the Instances list, select the Instance you want to edit and then click <b>Edit Instance</b>.

4. Select the <b>Info</b> tab to update the <b>Name</b>.

5. In the <b>Security Groups</b> tab, edit security groups, use the plus symbol (<b>+</b>) to add groups and the minus symbol (<b>-</b>) to remove groups:
  * <b>All Security Groups</b> &mdash; A list of security groups that are associated with the project, but not the instance.
  * <b>Instance Security Groups</b> &mdash; A list of security groups that are currently associated with the instance.

6. Click <b>Save</b>.




#### How to Associate a Floating IP to an Instance

You can associate a Floating IP address to an instance that needs to be visible outside the cloud.

To associate a floating IP to an instance:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Instances</b> to open the Instances window.

3. Select an instance and then click <b>Associate Floating IP</b> to open the Manage Floating IP Associations window.
   
4. Select an <b>IP Address</b> from the list.

5. <i>Optional</i>: If you do not see available addresses:
 * Click (<b>+</b>) to allocate a floating IP from a pool.
 * Select a <b>Pool</b> and then click <b>Allocate IP</b>.

6. Select a <b>Port</b> to be associated from the list.

7. Click <b>Associate</b>.


#### How to Disassociate a Floating IP from an Instance

To disassociate a floating IP from an instance:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Instances</b> to open the Instances window.

3. Find the instance you want to disassociate, and click <b>More</b> > <b>Disassociate Floating I</b>P. A confirmation window opens, warning that the action cannot be undone.
    
4. Click <b>Disassociate Floating IP</b> to confirm.



#### How to Pause or Resume an Instance

Pausing an instance stores the content of the VM in memory (RAM). This keeps the instance running, but in a frozen state.

To free up memory and vCPUs, you should suspend an instance.

To pause a project instance:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Instances</b> to open the Instances window.

3. Find the instance you want to pause, and click <b>More</b> > <b>Pause Instance</b>.

4. The <b>Status</b> and <b>Power State</b> of the instance show <b>Paused</b>.

 

To resume an instance:

1. Select the <b>instance</b> > <b>More</b> > <b>Resume Instance</b>.

2. After a short time, the Status returns to Active and the Power State returns to <b>Running</b>.



#### How to Hard Reboot an Instance

Rebooting an instance is similar to cycling power on a physical server &mdash; the operating system is restarted from scratch. Rebooting temporarily makes the 
VM and all the services it hosts unavailable. In a common use case, your installation requires a reboot because you installed new software.

To reboot an instance:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Instances</b> to open the Instances window.

3. Find the instance you want to reboot, and click <b>More</b> > <b>Hard Reboot Instance</b>. A confirmation window opens, warning that the action cannot be undone.

4. Click <b>Hard Reboot Instance</b>. The <b>Task</b> column indicates the instance is <b>Rebooting Hard</b>. If reboot is successful, the 
<b>Status</b> shows <b>Active</b> and the <b>Power State</b> shows <b>Running</b>.


#### How to Suspend or Resume an Instance

Suspending an instance frees up memory and vCPUs. Suspension could be compared to hibernation mode.
 
##### Suspend an Instance

To suspend an instance:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Instances</b> to open the Instances window.

3. Find the instance you want to suspend, and click <b>More</b> > <b>Suspend Instance</b>. The <b>Task</b> column indicates the instance is suspending. 
When this process completes, the <b>Status</b> shows <b>Suspended</b>, and the <b>Power State</b> shows <b>Shutoff</b>.

 
##### Resume an Instance

To resume an instance:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Instances</b> to open the Instances window.

3. Find the instance you want to resume, and click <b>More</b> > <b>Resume Instance</b>. The Task column indicates the instance is resuming. 
When this process completes, the <b>Status</b> returns to <b>Active</b>, and the <b>Power State</b> returns to <b>Running</b>.



#### How to Force Delete an Instance

Use the <b>Force Delete</b> option to delete an instance when it appears to be in an unresponsive state. Any user has the option to Force Delete, 
which immediately and completely deletes the instance from the project.

To force delete a project instance:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Instances</b> to open the Instances window.

3. In the <b>Instances</b> list, select the instance you want to force delete, and select <b>More</b> > <b>Force Delete</b>. 
The instance is deleted without a warning prompt.


#### How to Terminate an Instance

When you terminate an instance, the VM is shut down and the resources associated with it are released. It is not possible to start the VM after it 
is terminated because it no longer exists. Termination is scheduled because it takes some time to free all the resources.

When an instance is terminated:

* Any changes associated with the volume that the image is running on are discarded.

* Any changes associated with the volume implied by the disk space (ephemeral) that are specified in the flavor are discarded.

* Any changes associated with attached volumes are retained in the attached volume and could be reattached to a different VM.

* The VM is removed from any security group it was associated with, and frees its floating IP addresses.

 

To terminate one or more instances:

1. On the Project tab, select a Current Project.

2. Click Infrastructure > Instances to open the Instances window.

3. Select one or more instances to terminate, and click More > Terminate Instance.

4. In the Confirm Terminate Instance dialog, verify your selection and then click Terminate Instance(s).

5. Wait for the success message.

 
**Related topics:**

* [How to Pause or Resume an Instance](#how-to-pause-to-resume-an-instance)

* [How to Suspend or Resume an Instance](#how-to-suspend-or-resume-an-instance)

* [How to Force Delete an Instance](#how-to-force-delete-an-instance)


  
### Volumes

**Concepts:**

Volumes are the disk storage volumes that have been created in the project. Volumes are persistent &mdash; you can create data in these volumes and attach 
them to various VMs (instances) over time, as needed.

To see a list of volumes:

1. On the Project tab, select a Current Project.

2. Click Infrastructure > Volumes to open the Volumes window.

**Tasks:**

* [How to Create a Volume](#how-to-create-a-volume)

* [How to Create a Volume from an Image or Instance Snapshot](#how-to-create-a-volume-from-an-image-or-instance-snapshot)

* [How to Attach or Detach Volumes to an Instance](#how-to-attach-or-detach-volumes-to-an-instance)

* [How to Create a Volume Snapshot](#how-to-create-a-volume-snapshot)

* [How to Delete a Volume](#how-to-delete-a-volume)
	
	
#### How to Create a Volume

After you create a volume, you can attach it to a VM and place content in it.

To create a volume:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Volumes</b> to open the Volumes window.

 a. To create a volume that is not based on an image, enter:
  * <b>Volume Name</b>: A volume name is required.
  * <b>Description</b>: Optional description.
  * <b>Type</b>: Choose a volume type. Volume types are defined by cloud administrators, at the region level.
  * <b>Size</b>: In GB.
  * <b>Volume Source</b>: Leave the default, not based on a snapshot or image.

 b. To create a volume that is based on an image or snapshot:
  * Volume Source
   * Select <b>Snapshot</b> to display the Use snapshot as a source menu. If the dashboard does not contain snapshots, you do not see this option.
   * Select <b>Image</b> to display the <b>Use image as a source</b> menu.
   * Select an image or snapshot from the source menu. Keep or modify the entries that are automatically populated from the source.

3. Click <b>Create Volume</b>. The volume is created and available to attach to VMs.


#### How to Create a Volume from an Image or Instance Snapshot

To create a volume from an image or instance snapshot:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Images and Snapshots</b> to open the Images and Snapshots window.

3. Find the image or snapshot that you want to use, and click <b>More</b> > <b>Create Volume</b> to open a dialog box where you enter:
  * <b>Volume Name</b>: A default name is based on the image name.
  * <b>Description</b>: Optional description.
  * <b>Type</b>: Defined by cloud administrators, at the region level.
  * <b>Size</b>: In GB.
  * <b>Use image as source</b>: Populated by the image name.

4. Click <b>Create Volume</b>.


#### How to Attach or Detach Volumes to an Instance

Volumes are disk storage volumes that have been created in a project and can be attached to an instance. A volume can only be attached to a single VM 
at a time, and that VM has sole use of that volume.

To attach a project volume to an instance:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Volumes</b> to open the Volumes window.

3. Find the volume you want to attach, and click <b>Edit Attachments</b> to open the <b>Manage Volume Attachments</b> dialog box.

4. Select an instance from <b>Attach</b> to <b>Instance</b>.

5. Enter a <b>Device Name</b>, which is an attached device, such as a device between <code> /dev/vdc </code> and <code> /dev/vdz</code>.

6. Click <b>Attach Volume</b>.

 

To detach a volume from an instance:

* After a volume is attached, <b>Detach Volume</b> is available through the <b>Attach Volume</b> action.


#### How to Create a Volume Snapshot

To create a project volume snapshot:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Volumes</b> to open the Volumes window.

3. Find the volume you want to snapshot, and click <b>More</b> > <b>Create Snapshot</b>.

4. Enter a <b>Name</b> for the snapshot and a <b>Description</b>.

5. Click <b>Create Snapshot</b>. The volume snapshot is added to Images and Snapshots.


#### How to Delete a Volume
	
Deleting a volume means the volume will no longer exist, the data will be lost, it cannot be attached to any VM, and no user can access it.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:700px;"> <b>Caution:</b> 
Deleting a volume cannot be undone. </p>

To delete one or more project volumes:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Volumes</b> to open the Volumes window.

3. To delete one volume, find the volume and select <b>More</b> > <b>Delete Volume</b>.

4. <i>Optional</i>: To delete multiple volumes, select the checkboxes for the volumes you want to delete, and click <b>Delete Volume</b>.

5. In the warning dialog box, verify your selection, and click <b>Delete Volume</b>.
	

  
### Images and Snapshots

**Concepts:**

When you launch a VM, the launch is based on an image. This Images view lists only the launchable images that can be used to create new VMs:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: white; color: black;">
<td colspan="2"> <b>AMI (Amazon Machine Image)</b> &mdash; Not valid unless it is associated with a kernel image (AKI) and a RAMdisk Image (ARI). </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>ISO</b> &mdash; Optical Disk Image </td>
<td> <b>QCOW2</b> &mdash; QEMU Emulator </td> 
</tr>
	 
<tr style="background-color: white; color: black;">
<td> <b>RAW</b> </td>
<td> <b>VDI</b> &mdash; Virtual Disk Image </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> <b>VHD</b> &mdash; Virtual Hard Disk Image </td>
<td> <b>VMDK</b> &mdash; Virtual Machine Disk Image </td> 
</tr>

</table> 

To see a list of project images:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Images and Snapshots</b> to open the Images and Snapshots window.

  Information shown includes image name, type, status, format, whether the image is public, and whether the image is protected.

3. <i>Optional</i>: To see image details, click the <b>Image Name</b> to open the Image Overview window.

**Tasks:**

* [How to Create an Image](#how-to-create-an-image-project-tab)

* [How to Edit an Image or Instance Snapshot](#how-to-edit-an-image-or-instance-snapshot)

* [How to Launch an Image or Instance Snapshot](#how-to-launch-an-image-or-instance-snapshot)

* [How to Delete an Image or Instance Snapshot](#how-to-delete-an-image-or-instance-snapshot)

* [How to Delete a Volume Snapshot](#how-to-delete-a-volume-snapshot)
	
	
#### How to Create an Image {#how-to-create-an-image-project-tab}

You can create and configure an image to upload to the Image Service. Compressed image binaries, such as .zip, and .tar.gz, are supported.

To create an image:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Images and Snapshots</b> > <b>Create Image</b>.

3. On the <b>Create an Image</b> dialog box, enter a <b>Name</b> and optional <b>Description</b>.

4. Enter one of the following for the Image Source:
 * <b>Image File</b>: Then browse to select the file.
 * <b>Image Location</b>: Then enter the image URL. It must be a valid and direct HTTP URL to the image binary. URLs that redirect or serve error pages will result in unusable images.
   
   **Note:** If you do not have rights to the image's URL, you receive an error when trying to create the image.

   The image must be accessible to the Image Service and in a supported format.
   
   **Note:** If you upload an image with a format that is not supported, you will receive an Error 404, Not Found error when you attempt to create the image.

5. Select a <b>Format</b>. The image must be in one of the formats listed.

6. Enter the <b>Minimum Disk space</b> and <b>Minimum Ram</b>.

7. Leave <b>Public</b> unselected to create a private image. <!-- Private images can be seen by --> 

    To learn whether you have permission to create a public image, see your role tasks under [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

8. Leave <b>Protected</b> unselected to create an image that other users can edit or delete.

9. Select <b>Protected</b> to create a read-only image that other users cannot edit or delete. To learn whether you have permission to create a protected 
image, see your role under [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

10. Click <b>Create Image</b>. If successful, the image displays with an <b>Active</b> status. If creation is not successful within a specified amount of time (set by your system administrator; typically no more than five minutes), the <b>Status</b> of the image in the list displays <b>Upload Failed</b>.

**Note:** Only AMI, RAW, and QCOW2 images are launchable.



#### How to Edit an Image or Instance Snapshot

You cannot modify an image format.

When you edit an Amazon Machine Image (AMI) image, you see additional fields allowing you to select a Kernel image (AKI) and a RAMdisk Image (ARI). 
An AMI image is not valid unless it is associated with an AKI and ARI.

To edit an image or instance snapshot:

1. Click <b>Project</b> > <b>Images and Snapshots</b> to open the Images and Snapshots window.

2. Find the image or snapshot you want to edit, and click More > Edit.

3. Keep or edit:
 * <b>Name</b>: As desired.
 * <b>Description</b>: Optional description.
 * <b>Public</b>: Visibility.
 * <b>Protected</b>: Select to mark the image as read-only. A protected image cannot be edited or deleted.
    
4. Click <b>Update Image</b>.


#### How to Launch an Image or Instance Snapshot {#how-to-launch-an-image-or-instance-snapshot} 

You can only launch images that are formatted as AMI, RAW, and QCOW2. Launching an image provisions it to the cloud.

To launch a project image:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Images and Snapshots</b> to open the Images window.

3. Find the image to launch, and click <b>Launch</b> to open the Launch Instance dialog box. The dialog opens to the <b>Details</b> tab. Some fields are automatically populated from the image.

4. Enter or edit the Details tab information as needed:
 * <b>Instance Source</b>: Specify whether you are using an image or snapshot.
 * <b>Image or Instance Snapshot</b>: Select from the list of images that have been uploaded to the system.
 * <b>Availability Zone</b>: Any availability zone or Nova.
 * <b>Instance Name</b>: The name of the host you are creating (Required).
 * <b>Flavor</b>: Indicates the size of the node. When you select a flavor here, the Flavor Details table on the right changes to show the node properties and values associated with your size selection.
 * <b>Instance Count</b>: Can be more than 1.
 
5. Use the <b>Access and Security</b> tab to control access to your instance via keypairs and security groups.

 a. <b>Keypair</b>: Keypairs are ssh credentials that are injected into images when they are launched. The public key is installed on the VM; you will use the private key to log in.

    To add a keypair, either:
	
	* Select a keypair from the list, or
	* Click (<b>+</b>) to import a keypair. Enter <b>Keypair Name</b> and <b>Public Key</b>.

    To create a keypair, see [How to Import, Create, or Delete a Keypair](#how-to-import-create-to-delete-a-keypair).

 b. Enter <b>Admin Password</b> and <b>Confirm Admin Password</b>.
 
 c. Select a <b>Security Group</b>.

6. Use the <b>Networking</b> tab to select one or more networks (required).

  You must specify at least one network. You can click the plus (<b>+</b>) symbol or drag and drop to make your selections. Use the minus (<b>-</b>) symbol to remove networks.

7. Use the <b>Volume Options</b> tab to select boot options for an instance that launches with attached storage.

8. Use the <b>Post Creation</b> tab to customize the instance by adding a script to run after launch. The Customization Script field is analogous to "User Data" in other systems.

9. Click <b>Launch</b>. If successful, the image is added to the <b>Images</b> list with an <b>Active</b> status.


#### How to Delete an Image or Instance Snapshot

Images are protected from deletion by rules. If you are not allowed to delete an image, you receive an error when you attempt to delete the image.

If you delete an image that is used in a design or profile, an attempt to provision the document will fail.

To delete one or more images:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Images and Snapshots</b>.

3. Find the image you want to delete, and click <b>More</b> > <b>Delete Image</b>.

  <i>Optional</i>: To delete multiple images, select the images and click <b>Delete Images</b>.

4. Confirm your selection in the warning dialog box. Click <b>Delete Image</b>.



#### How to Delete a Volume Snapshot
	
To delete one or more volume snapshots:

1. On the Project tab, select a Current Project.

2. Click Infrastructure > Images and Snapshots to open the Images and Snapshots window.

3. Find the volume snapshot you want to delete, and click More > Delete Volume Snapshot.

  <i>Optional</i>: To delete multiple volume snapshots, select the snapshots and click <b>Delete Volume Snapshots</b>.

4. Confirm your selection in the warning dialog box, and click <b>Delete Volume Snapshot</b>.

  
### Networks

**Concepts:**

From this view, you can create, edit, and delete project networks. You can also add subnets using this view.

**Tasks:**

* [How to Create a Private Network](#how-to-create-a-private-network-project-tab)

* [How to Edit a Network](#how-to-edit-a-network)

* [How to Create a Subnet](#how-to-create-a-subnet)

* [How to Edit a Subnet](#how-to-edit-a-subnet)

* [How to Delete a Subnet](#how-to-delete-a-subnet)

* [How to Delete a Network](#how-to-delete-a-network)


#### How to Create a Private Network {#how-to-create-a-private-network-project-tab} 

You can create a private network that is assigned to your current project.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:700px;"> <b>Note:</b> You cannot create an external network 
on the Project tab. You must have access to the Region tab to create a shared or external network. 
See <a href="#how-to-create-an-external-network">How to Create an External Network</a>. </p>

To create a private network:

<ol>

<li> On the <b>Project</b> tab, select a <b>Current Project</b>.  </li> 

<li> Click <b>Infrastructure</b> > <b>Networks</b> to open the Networks window.  </li> 

<li> Click <b>Create Network</b> to open the Create Network dialog box.  </li> 

<li> On the <b>Network</b> tab of the dialog box:

<ul>
<li>Enter a <b>Network Name</b> for your network. </li> 
<li>Make sure <b>Admin State</b> is checked. This is the administrative state of the network. If you select Admin State, the network forwards packets. 
If you do not select Admin State, the network does not forward packets. </li> 
</ul>
</li>

<li>On the <b>Subnet</b> tab of the dialog box:
<ul>
<li> To create a network with no associated subnet, unselect <b>Create Subnet</b> and click <b>Create</b>.  </li> 
<li> If you want to create a network with an associated subnet, keep <b>Create Subnet</b> selected and continue through the following steps:

<ul>
<li>Enter a <b>Subnet Name</b>.  </li> 
<li>Enter <b>Network Address</b>.  </li> 
<li>Select an <b>IP Version</b>.  </li> 
<li><i>Optional</i>: Enter a <b>Gateway IP</b>. This is the IP address that servers on the subnet will use if the address they want to send to is not on 
the subnet. It is a gateway to other networks. In a common use case, the gateway address would be that of a router; however, it could also be of another 
server that is providing routing services.</li>
<li> Select <b>Disable Gateway</b> to make the subnet private. Packets cannot leave the subnet, except through other devices on the network.  </li> 
</ul>  
</li> 

</ul> 
</li>

<li> On the Subnet Detail tab of the dialog box:
<ul>
<li> Leave <b>Enable DHCP</b> selected to dynamically allocate IP addresses. This is the appropriate selection for a private network.  </li> 
<li> Enter an <b>Allocation Pools</b> IP address list for the subnet, using one line in the entry box for each address.  </li> 
<li> Enter a <b>DNS Name Servers</b> IP address list for the subnet, using one line in the entry box for each address.  </li> 
<li> Enter a <b>Host Routes</b> IP address list to announce additional routes to the hosts. Use one line in the entry box for each address.  </li> 
</ul> 
</li> 

<li> Click <b>Create</b>.  </li> 

<li> Verify that the network you just created is included in the Networks list.  </li> 

</ol> 


#### How to Edit a Network

You can edit a network that is assigned to a project. In a common use case, you need to edit when the Admin State should be changed, such as for maintenance or testing efforts.

To edit a network:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Networks</b> to open the Networks window.

3. Find the network you want to edit, and click <b>Edit Network</b> to open the Edit Network window.

4. Change the <b>Name</b> or <b>Admin State</b>. You cannot edit the <b>ID</b>.

5. Click <b>Save Changes</b>.

6. Wait for the success message.



#### How to Create a Subnet

You can create a subnet on a network. Subnets allow you to divide a network into addressable segments.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:700px;"> <b>Note:</b> You must be the Admin user or a 
cloud administrator to create a subnet on an external network or shared network. </p> 

To create a subnet:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Networks</b> to open the Networks window.

3. Find the network where you want to add a subnet, and click <nobr><b>More</b> > <b>Add Subnet</b></nobr> to open the Create Subnet dialog box.

  **Note:** An alternate method is to click <b>Create Subnet</b> on the Networks Overview window. The Create Subnet dialog box opens.

4. On the <b>Subnet</b> tab of the dialog box:

  a. Enter a unique <b>Subnet Name</b>.

  b. Enter a <b>Network Address</b> from your assigned, dedicated IP address range.

  c. Keep the defaults for IP Version, Gateway IP, and Disable Gateway.

5. On the <b>Subnet Detail</b> tab of the dialog box:

  a. Leave <b>Enable DHCP</b>.

  b. Enter an <b>Allocation Pools IP</b> address list for the subnet, using one line in the entry box for each address.

  c. Enter a <b>DNS Name Servers IP</b> address list for the subnet, using one line in the entry box for each address.

  d. Enter a <b>Host Routes IP</b> address list to announce additional routes to the hosts. Use one line in the entry box for each address.

6. The Networks window opens, and you see the subnet.


#### How to Edit a Subnet

The <b>Region</b> > <b>Networks</b> window provides a convenient place for the admin user and cloud administrators to see all the subnets in all the regions, so administrators can decide which subnets to edit.

In many cases, especially if the subnet is associated with an external network, subnet details change after it is created. As a result of these changes, you might need to update information. For example:

* If you entered an incorrect subnet gateway address during subnet creation, or if the subnet gateway address changes, you can correct the subnet gateway address. You cannot change the mask of a subnet.
  
* You can change or add DNS servers, and modify routing information.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:700px;"> <b>Note:</b> Only the Admin user can edit a subnet on an external network.
</p>

To edit a subnet:

1. Click <b>Region</b> > <b>Networks</b> to open the Networks window.

2. Click the <b>Network Name</b> where you want to edit a subnet. The Administration Dashboard opens the Network Overview window in the associated project. You are now working at the project level.

3. Find the subnet you want to edit, and click <b>Edit Subnet</b> to open the <b>Update Subnet</b> dialog box where:
  * On the <b>Subnet</b> tab of the dialog box, you can change the <b>Subnet Name</b>, <b>Gateway IP</b>, or <b>Disable Gateway</b> settings. You cannot edit the Network Address.
  * On the <b>Subnet Details</b> tab of the dialog box, you can change the <b>Enable DHCP</b> setting, <b>DNS Name Servers</b>, or <b>Host Routes</b> settings.

4. Click <b>Update</b>.

5. The Network Overview window opens, and you see the edits.



#### How to Delete a Subnet

To delete a subnet:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Networks</b> to open the Networks window.

3. Find the network where you want to delete a subnet, and click the <b>Name</b> to open the Network Overview window.

4. Find the subnet you want to delete, and click <b>More</b> > <b>Delete Subnet</b>.

  <i>Optional</i>: To delete multiple subnets, select the subnets, and click <b>Delete Subnet</b>.

5. Confirm your selection in the warning dialog box, and click <b>Delete Subnet</b>.



#### How to Delete a Network

You can delete a network that is assigned to a project. In a common use case, you want to delete a network that you decide is no longer required in the project.

To delete a one or more networks:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Networks</b> to open the Networks window.

3. Find the network you want to delete, and click <b>More</b> > <b>Delete Network</b>.

4. <i>Optional</i>: To delete multiple networks, select the networks, and click <b>Delete Networks</b>.

5. Confirm your selection in the warning dialog box, and click <b>Delete Network</b>.




  
### Routers

A router is a logical entity for forwarding packets across internal subnets and NATting them on external networks through an appropriate external gateway.

A router has an interface for each subnet it is associated with. By default, the IP address of this interface is the subnet's gateway IP. When a router is associated with a subnet, a port for that router interface will be added to the subnet's network.

To see a list of routers:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Routers</b> to open the Routers window.

3. In the Routers list, click on the name of the router to open the Router Overview window.

4. Verify general information about the selected router and <b>Interfaces</b>, such as the <b>External Network</b> for your public network.

**Tasks:**

* [How to Create a Router](#how-to-create-a-router)

* [How to Add an Internal Interface to a Router](#how-to-add-an-internal-interface-to-a-router)

* [How to Add an External Interface to a Router](#how-to-add-an-external-interface-to-a-router)

* [How to Delete a Router](#how-to-delete-a-router)



#### How to Create a Router

You can create a router to interconnect subnets and forward traffic within the subnets.

A router has an interface for each subnet it is associated with. By default, the IP address of this interface is the subnet's gateway IP. When a router is associated with a subnet, a port for that router interface will be added to the subnet's network.

To create a router:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Routers</b> to open the Routers window.

3. Click <b>Create Router</b>.

4. On the <b>Create Router</b> dialog, enter a <b>Router Name</b>.

5. Click <b>Create Router</b>.



#### How to Add an Internal Interface to a Router

To learn whether you have permission, see your role under [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

To add an internal interface to a project router:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Routers</b> to open the Routers window.

3. Click the name of a router where you want to add an interface to open an Overview window.

4. Click <b>Add Interface</b>.

5. In the Add Interface window:
  * Select a subnet from the drop-down list.
  * Leave the IP Address field blank.

6. Click <b>Add Interface</b>.

7. Wait for the success message.

8. Go back to the Router Overview to verify the <b>Interfaces</b> information:
  * External and Internal interfaces are identified.
  * The initial Internal Interface <b>Status</b> is <b>DOWN</b>.
  * After an Instance is created using this router, the <b>Status</b> will change to <b>ACTIVE</b>.


#### How to Add an External Interface to a Router

To learn whether you have permission, see your role under [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

To add an external interface to a router:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Routers</b> to open the Routers window.

3. Click the router <b>Name</b> to open an Overview window.

4. Click <b>Add Gateway</b> Interface.

5. In the Set Gateway window, select an <b>External Network</b> from the drop-down list.

6. Click <b>Set Gateway</b>.


#### How to Delete a Router

To delete one or more project routers:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Routers</b> to open the Routers window.

3. Find the router you want to delete, and click <b>More</b> > <b>Delete Router</b>.

  <i>Optional</i>: To delete multiple routers, select routers and click <b>Delete Routers</b>.

5. Confirm your selection in the warning dialog box, and click <b>Delete Router</b>.

6. The Routers window opens, and you do not see the routers listed.


 
### How to See a Network Topology Diagram

**Concepts:**

You can see a layout diagram of project networks, subnets, and routers.

To see the diagram:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Infrastructure</b> > <b>Network Topology</b>. You can launch instances, and create networks and routers on this window. Follow the steps described in the instances, networks, and routers topics below.

**Related topics:**

* [How to Launch an Instance](#how-to-launch-an-instance)

* [How to Create a Private Network](#how-to-create-a-private-network-project-tab)

* [How to Create a Router](#how-to-create-a-router)

* [Topology Designs](/cloudos/moonshot/manage/administration-dashboard/topology-designs/)

  
### Security Groups and Rules

**Concepts:**

Security groups are one way to provide a measure of network isolation between different VMs because they limit the ports into which network traffic can enter 
the group. Within a security group, you can add, edit, and delete rules to specify communications to other ports.

**Tasks:**

* [How to Create or Delete a Security Group](#how-to-create-or-delete-a-security-group)

* [How to Add or Delete a Security Group Rule](#how-to-add-or-delete-a-security-group-rule)





#### How to Create or Delete a Security Group

Security groups are one way to provide a measure of network isolation between different VMs because they limit the ports into which network traffic can enter the group. Within a security group, you can add, edit, and delete rules to specify communications to other ports.

To create a security group:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Access and Security</b> > <b>Access and Security</b> > <b>Security Groups</b> tab.

3. Click <b>Create Security Group</b>.

4. On the <b>Create Security Group</b> dialog, enter a <b>Name</b> and <b>Description</b>.

5. Click <b>Create Security Group</b>.

6. Wait for the success message.

7. Verify that the new security group is included in the Security Groups list.

To delete one or more security groups:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Access and Security</b> > <b>Access and Security</b> > <b>Security Groups</b> tab.

3. Find the security group that you want to delete, and click <b>More</b> > <b>Delete Security Group</b>.

  <i>Optional</i>: To delete multiple security groups, select the security groups and click <b>Delete Security Groups</b>.

4. Confirm your selection in the warning dialog box, and click <b>Delete Security Groups</b>.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000; min-width:700px;"> <b>Note:</b> You cannot delete the default Security Group. </p>


#### How to Add or Delete a Security Group Rule

Within a security group, you can add, edit, and delete rules to specify communications to other ports.

To create a security group rules:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Access and Security</b> > <b>Access and Security</b> > <b>Security Groups</b> tab.

3. Select the group to edit, and click <b>Edit Rules</b>.

4. In the <b>Security Group Rules</b> view, click <b>Add Rule</b>.

5. In the Add Rule window, enter the following information:

  a. <b>Rule</b>: Select from the drop-down list.

  b. <b>Direction</b>: Select Ingress or Egress.

  c. <b>Open Port</b>:

     Select <b>Port</b> to open a single port. Then enter <b>Port</b>.

     Select <b>Port Range</b> if you want to enter a starting and ending port. Then enter <b>From Port</b> (the source port, such as 80) and <b>To Port</b> (the port where VMs inside the security group receive traffic, such as 80).

     <b>Remote</b>: Specify the source of traffic this rule allows. Select one of the following.

     <b>CIDR</b>: To specify a range (a block) of IP addresses. The block defines how many addresses to create. Then enter <b>CIDR</b>.

     <b>Security Group</b>: The source group will allow any other instance in this security group access to any other instance. Then select a <b>Security Group</b> and <b>Ether Type</b>.

6. Click <b>Add</b>.

7. Verify that the new rule is included in the Security Group Rules list.

To delete security group rules:

1. In the <b>Security Group Rules</b> list, find the rule you want to delete, and click <b>Delete Rule</b>.

2. In the <b>Confirm Delete Rule</b> dialog, verify the name of the rule, and then click <b>Delete Rule</b>.

3. Verify that the new rule is excluded from in the Security Group Rules list.

  
### How to Import, Create, or Delete a Keypair

If you need a keypair, you must create or import the keypair for yourself. No other user can create or import a keypair for you.

Keypairs are ssh security keys (credentials) that are 512 bits long. A keypair consists of a public key and a private key. 
The credentials provide authentication and allow you to exchange traffic securely within a VM.

If you want a secure, provisioned cloud instance, you must use a keypair to launch images or topologies:

* The public key portion is installed on the VM.

* Users use the private key portion to ssh to the launched instance.

You can use the Administration Dashboard to create a keypair, or to import a keypair you previously created. 

#### To create a keypair

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Access and Security</b> > <b>Access and Security</b> > <b>Keypairs</b> tab.

3. On the <b>Keypairs</b> tab, click <b>Create Keypair</b>.

4. Enter a <b>Keypair Name</b> &mdash; free-form text that does not include spaces, for example: <code>testonlykeypair</code>.

5. Click <b>Create Keypair</b>.

  The private key portion is downloaded to your browser system as a .pem file. You can only download the file once. It is important to save the file in a safe location.
   
  The Administration Dashboard maintains the public key portion within the cloud and injects it into launched instances.

#### To import a keypair

You might have previously created a keypair that you want to use. To import a keypair:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Access and Security</b> > <b>Access and Security</b> > <b>Keypairs</b> tab.

3. Click <b>Import Keypair</b>.

4. On the Import Keypair dialog, enter:

  * <b>Keypair Name</b>: Free form text that does not include spaces, for example testonlykeypair.

  * <b>Public Key</b>: The public key portion.

  * Click <b>Import Keypair</b>.

 

#### To delete a keypair

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Access and Security</b> > <b>Access and Security</b> > <b>Keypairs</b> tab.

3. Select one or more keypairs.

4. Click <b>Delete Keypair</b>.

  
### Floating IPs

**Concepts:**

You can allocate additional floating IP addresses to a project. This process does not assign the address to a particular instance in the project.

After you allocate an IP to your project, you can associate or disassociate the address to an instance.

You can release a floating IP address that is associated with your project. When you release the floating IP, it becomes available to other projects.

**Tasks:**

* [How to Allocate a Floating IP](#how-to-allocate-a-floating-ip)

* [How to Associate or Disassociate Floating IPs](#how-to-associate-or-disassociate-floating-ips)

* [How to Release a Floating IP](#how-to-release-a-floating-ip)
	
	
	
	
#### How to Allocate a Floating IP

To allocate a floating IP to a project:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Access and Security</b> > <b>Access and Security</b> > <b>Floating IPs</b> tab.

3. In the Floating IPs list, click <b>Allocate IP To Project</b>.

4. In the Allocate Floating IP dialog, select a <b>Pool</b> from the drop-down list.

5. Click <b>Allocate IP</b>.



#### How to Associate or Disassociate Floating IPs

You can assign an address to a particular VM instance.

To associate a floating IP:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Access and Security</b> > <b>Access and Security</b> > <b>Floating IPs</b> tab.

3. In the Floating IPs list, select an IP address and click <b>Allocate IP to Project</b>.

4. In the Allocate Floating IP dialog, select a <b>Pool</b> from the drop-down list.

5. Click <b>Allocate IP</b>.

6. Wait for the success message.

 

To disassociate a floating IP:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Access and Security</b> > <b>Access and Security</b> > <b>Floating IPs</b> tab.

3. In the Floating IPs list, select an address where the <b>Disassociate Floating IP</b> action is available.

4. Click <b>Disassociate Floating IP</b>.

5. Wait for the success message.



#### How to Release a Floating IP 

To release a floating IP:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Access and Security</b> > <b>Access and Security</b> > <b>Floating IPs</b> tab.

3. Find the IP that you want to release, and click <b>More</b> > <b>Release Floating IP</b>.

4. Wait for the success message.

	
  
### How to Access API Endpoints

To access API endpoints:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Access and Security</b> > <b>Access and Security</b> > <b>API Access</b> tab.

3. Information shown includes service name and service endpoint.

  
### How to Access Your Authentication Token

The Administration Dashboard manages your authentication token. The Administration Dashboard retrieves your token from the Keystone service when you successfully log in to the dashboard.

You can access your authentication token in the Administration Dashboard for subsequent use outside the dashboard. For example, when you use a REST client to request an OpenStack service, you might need to supply your authentication token.

To access your authentication token:

1. On the <b>Project</b> tab, select a <b>Current Project</b>.

2. Click <b>Access and Security</b> > <b>Access and Security</b> > <b>Authentication Token</b> tab.

3. A truncated version of the token displays. Click <b>More</b> to see the entire token.
  
### Updates and Extensions

**Concepts:**

The Updates and Extensions window provides a convenient place for users who have permission to access the HP Cloud OS Distribution Network (CODN). 
Use the Updates and Extensions window to access catalog updates and content. Updates include software versions and security patches. 
Content includes material such as images and topology templates.

You can update and upgrade the Administration Dashboard while your system continues to run. CODN contains all the products and services 
HP offers to help maintain your cloud.

To learn whether you have permission to use CODN, see [Administration Dashboard Tasks by Role](/cloudos/moonshot/manage/administration-dashboard/tasks-by-role/).

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
experience other download problems, see the <a href="/cloudos/moonshot/manage/troubleshooting/">Troubleshooting</a> topic. </p>

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

4. After a successful publish, you see the update in the appropriate section of the Administration Dashboard. For example, if the update is a Glance image, you can see it on <b>Infrastructure</b> > <b>Images and Snapshots</b>.

  
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

