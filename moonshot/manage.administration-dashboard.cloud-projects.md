---
layout: default
title: "HP Helion Cloud OS for Moonshot: Administration Dashboard"
permalink: /cloudos/moonshot/manage/administration-dashboard/cloud-projects/
product: moonshot

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage">&#9650; UP</a> | NEXT &#9654; </p>

#Manage Projects#

Project is a grouping that allows users within each group to view and use the same set of resources. Projects protect topology templates, resources and infrastructure design from being visible to all users. Only the Cloud Administrator can create projects. Using the Projects option the Cloud Administrator can create new projects, assign users to the projects and define the compute limits for each project.

You can perform the following tasks:

* <a href="#Create a Cloud Project">Create a Cloud Project</a> 

* <a href="#Modify a Cloud Project">Modify a Cloud Project</a> 

* <a href="#View Cloud Project Usage Summary">View Cloud Project Usage Summary</a> 

* <a href="#Modify Compute Limits">Modify Compute Limits</a> 

* <a href="#Add or Remove a Project User">Add or Remove a Project User</a> 

* <a href="#Delete a Cloud">Delete a Cloud</a> 

* <a href="#Restore a Cloud Project">Restore a Cloud Project</a>



To view the list of projects:

1. Click  **Cloud** Tab to select it.

2. From the options in the left panel, select **Projects**. <br>The list of projects is displayed in a table in the right pane.

3. To view the details of a particular project, in the **Filter** box, enter few characters of the project name. <br>The project details are displayed in the Project page.

4. Click  **Project Name** to display an Overview screen with detailed project information. <br>It displays the information related to project name, ID, default users and their roles etc.

##Create a Cloud Project ##<a name= "Create a Cloud Project"></a>

Use this option to create a new project, associate users to it, integrate applications and tools to it and define limits for it.

To create a project:

1. Click **Cloud** Tab to select it.

2. From the options in the left panel, select **Projects** to display the Project page.

3. Click **Create Project** displayed on the top right in the right pane.<br> Create Project dialog box is displayed with four different tabs: **Project Info**, **Project Members**, **Integrations**, and **Compute Limits**. By default, Project Info is the active tab.

4. Perform the following in the Project Info Tab:

 *  In the **Name** box, enter the name of the project.

 *  In the **Description** box, enter the description of the project.

 *  By default **Enabled** is selected. This means that the project content is available to all the users assigned to it.

1. Click to activate the **Project Members** Tab. <br>Available Users and Project Members are displayed.<br> Perform the following:

 * From **Available Users**, enter the name of the project.

 * Click add against the user to add the user to the **Project Members** column. <br>This adds the user to the project.

 * To add a role to the user, in the *Project*

 * *Members* column, click drop-down arrow to display the role list.

 * Select the role. The user is assigned to the selected role in the project.

 * (Optional) Click minus against the project member to remove from the project. <p>
 **Note**: This is an optional step at the initial stage of project creation as no users are displayed, once you create the users, they will be visible in the list of Available Users.</p>

1. (Optional) In the Integration Tab, perform the following:
 
 * (Optional) Click check box to select it, if no default Resource Pool exists and you want to create one. The Resource Pool is created as part of the project creation. A default resource pool is created for each region in the domain.

1. In the **Compute Limits** Tab, you can set the default limits for the compute resources in the project for example: total CPUS’s, total instances that can be created, Keypairs etc. Perform the following:
 * (From the **Region** drop-down list, select the region. By default the current region is displayed.
 
 * In the **RAM (MB)**, **Keypairs**, **CPU Cores**, **Instances**, **Metadata Items** boxes, default values are displayed. You can make the changes as required.
 
1. Click **Create** **Project**. A message is displayed on successful project creation. The project is displayed with a system generated project ID.<br>
OR<br>
Click **Cancel** to abort and go to the previous screen.

##Modify a Cloud Project##<a name= "Modify a Cloud Project"></a>
Use this option to make the changes to the project details.

To modify project details:

1. Click the **Cloud** Tab to select it.

2. From the options in the left panel, select **Projects** to display the Projects page with a list of projects.

3. Click **More** drop-down list against the project that you want to edit.

4. Select **Edit** **Project**. The Edit Project dialog box is displayed with three tabs: **Project Info**, **Project Members**, and **Compute Limits**. By default, Project Info is the active tab.

5. Select each tab and make the required changes.

6. Click **Save** to save the changes. <br>
OR<br>
Click **Cancel** to abort and go back to the previous screen.

##View Cloud Project Usage Summary##<a name= "View Cloud Project Usage Summary"></a>

Use this option to view the usage summary in a project. The usage summary gives the details of the resources being used in a particular project.

1. Click the **Cloud** Tab to select it.

2. From the options in the left panel, select **Projects** to display the Projects page with a list of projects.

3. Click **More** drop-down list against the project for which you want to view usage summary.

4. Select **View Usage**.<br> Project Usage Summary page is displayed with the details of the current month.

5. Click **From** and **To** boxes, to view the details of a different month, to display a calendar. 

6. Select dates and click **Submit**. <br> The details for the selected month are displayed.

7. Click **Download CSV Summary** to view a text file in Microsoft Excel with the details of the usage summary.

##Modify Compute Limits ##<a name= "Modify Compute Limits"></a>

This option allows you to edit the compute limits that are defined in your project. 

To modify compute limits:

1. Click **Cloud** Tab to select it.

2. From the options in the left panel, select **Projects**  to display the Projects page with a list of projects.

3. Click **More** drop-down list against the project for which you want to edit the limits.

4. Select **Modify Compute Limits** to display the Edit Project dialog box. By default, Compute Limits is the active tab.

5. Make the required changes.

6. Click **Save** to apply the changes.<br>
OR<br>
Click **Cancel** to abort and go to the previous screen.

##Add or Remove a Project User## <a name= "Add or Remove a Project User"></a>

You can add a new user to the project or remove an existing user from the project.

To add or remove a project user:

1. Click **Cloud** Tab to select it.

2. From the options in the left panel, select **Projects** to display the Projects page with a list of projects.

3. Click **Modify** **Users** against the project for which you want to make changes. The Edit Project dialog box is displayed with three tabs: **Project Info**, **Project Members**, and **Compute Limits**. By default, Project Members is the active tab and displays two columns: Available Users and Project Members.
To add a user to the project from the Available Users column, click add to add the user to the Project Members column.

5. To remove the user, click minus against the user in the Project Members column to remove the user.

6. Click **Save** to save the details.<br>
OR<br>
Click **Cancel** to abort and go to the previous screen.

##Delete a Cloud## <a name= "Delete a Cloud"></a>

To delete a project:

1. Click  **Cloud** Tab to select it.

2.  From the options in the left panel, select **Projects** to display the Projects page with a list of projects.

3. Click **More** drop-down list against the project which you want to delete. A confirmation dialog box is displayed.

4. Select **Delete Project**.

5. Click **Delete Project** to delete the project. The project is marked for deletion and (~) is displayed against the project name.<br>
Or <br>
Click **Cancel** to abort and go to the previous screen.

##Restore a Cloud Project## <a name= "Restore a Cloud Project"></a>

To restore a deleted project:

1. Click **Cloud** Tab to select it.

2. From the options in the left panel, select **Projects**  to display the Projects page with a list of projects.

3. Click **Restore** displayed against the project to restore.<br>
OR <br>
Click **Cancel** to abort and go to the previous screen.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


