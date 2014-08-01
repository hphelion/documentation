---
layout: default
title: "HP Cloud OS for Moonshot: Administration Dashboard"
permalink: /cloudos/moonshot/manage/administration-dashboard/resource-pools/
product: moonshot

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/administration-dashboard/topology-designs/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage/administration-dashboard/working-with-project-tab/">&#9650; UP</a> | <a href= " /cloudos/moonshot/manage/administration-dashboard/project-instances/">NEXT &#9654;</p></a>

# Manage Resource Pool #

Resource pools are used to access various cloud providers. A resource pool consists of resources in a single cloud. A resource pool could represent one compute region, or a pool of resources on another cloud provider. Resource pools help you locate compute and storage regions to use when you provision. The cloud you create might automatically contain a default resource pool, depending on the way it was created. This option allows you to do the following tasks:

* <a href="#Create Resource Pool">Create Resource Pool</a>

* <a href="#Edit Resource Pool">Edit Resource Pool</a>

* <a href="#Delete Resource Pool">Delete Resource Pool</a>


## Create Resource Pool <a name="Create Resource Pool"></a>

Use this option to create resource pool definitions which can be used while topology provisioning.

To create a resource pool, do the following:

1.	Click the **Project** Tab to select it.<br>
The tab displays with options in the left panel.</br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the left panel, click **Provisioning** and then select **Resource Pools** to display the Resource Pools page with a list of resource pools.

4.	Click **Create Resource Pool** to display the Create Resource Pool dialog box.

5.	From the **Cloud Type** drop-down list, select the HP Cloud OS-OpenStack Grizzly.<br>
Based on the cloud type selected, the options in the Compute Region field change.</br>

	**Note**:
	
	   * If the Cloud Type is selected as Custom, Provider Details are required.
	   	
	   * If the Cloud Type is selected as HP Cloud OS Grizzly, Provider Details are not required.	
	   * If the Cloud Type is selected as HP Cloud OS Diablo, Provider Details are required.	
	   * If the Cloud Type is selected as OpenStack Grizzly, Provider Details are required.

6.  From the **Compute Region** drop-down list, select the region from the options displayed.
7.  In the **Details** section, do the following:

	* In the **Name** box, enter the name for the resource pool.

	* From the **Scope** box, select the scope. 

	Scope refers to the permissions and privileges for the resource pool. The Scope displays different options:

	* **Private, cloud** - Allows you the access while working in any project. This resource pool can only be viewed by the user who created it, from any project of which the user is a member, and also by some admin users.


	* **Private, project** - Allows you access while working in this project. This resource pool can only be viewed in the project in which it was created by the user who created it and also by some admin users.
	
	* **Public, cloud** -  Allows access for all users. This resource pool can be viewed by anyone in the cloud, in any project.

	* **Public, project** - Allows you and other project members access. This resource pool can be viewed by members of the project in the project in which it was created, and by some admin users.
	
	The Type, Version, Region ID, and Provider URL fields are prepopulated based on the Cloud Type and Compute Region that you selected.

8.	From the **Cloud Profile** drop-down list, select HP Cloud OS Grizzly Baremetal.

    **Note**: As the Cloud Type is selected as HP OpenStack Grizzly, Provider Details are not required.

9.	Click **Create Resource Pool** to save it.<br>
A message is displayed on successful creation.</br>

     OR

    Click **Cancel** to abort and go to the previous screen.


## Edit Resource Pool <a name="Edit Resource Pool"></a>

This option allows you to update resource pool definitions that will be used during topology provisioning. You can:

* Change the name of the resource pool

* Update the OpenStack server domain URL

* Modify different provider credentials when the resource is an HP Cloud

* Modify values that were not accurate when you originally entered them.

**Note**: Modification of the default resource pool is not suggested.

To edit the resource pool, do the following:

1.	Click the **Project** Tab to select it.<br>
The tab displays with options in the left panel.</br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the left panel, click **Provisioning** and then select **Resource Pools** to display the Resource Pools page with a list of resource pools.

4.	Click **Edit Resource Pool** displayed against the Resource Pool that you want to edit.<br>Edit Resource Pool page is displayed.</br>

5.	Make the required changes.

6.	Click **Update Changes** to save the details.<br>
A message is displayed on success.<br>

    OR

    Click **Cancel** to abort and go to the previous screen.

## Delete Resource Pool/Pools <a name="Delete Resource Pool"></a>

Use this option to delete a resource pool. Use the option cautiously as the process cannot be undone. 

**Note**: Deletion of the default resource pool is not suggested.

To delete a resource pool, do the following:

1.	Click the **Project** Tab to select it.<br>
The tab displays with options in the left panel.</br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the left panel, click **Provisioning** and then select **Resource Pools** to display the Resource Pools page with a list of resource pools.

4.	Click **More** drop-down list displayed against the Resource Pool which you want to delete and select Delete Resource Pool.<br>
Confirm Delete Resource dialog box is displayed.</br>

5.	Click **Delete Resource Pool** to delete the resource pool.

     OR
 
     Click **Cancel** to abort and go to the previous screen.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>