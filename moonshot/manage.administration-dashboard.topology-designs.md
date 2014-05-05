---
layout: default
title: "HP Cloud OS for Moonshot: Administration Dashboard"
permalink: /cloudos/moonshot/manage/administration-dashboard/topology-designs/
product: moonshot

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/administration-dashboard/deployment-profiles/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage/administration-dashboard/working-with-project-tab/">&#9650; UP</a> | <a href="/cloudos/moonshot/manage/administration-dashboard/resource-pools/">NEXT &#9654;</p></a>

# Manage Topology Designs #

Use the Topology Designs area of the HP Cloud OS for Moonshot Administration Dashboard to manage service designs, which are the recipes for automating the cloud. A topology design is used for straightforward IaaS deployments, and allows you to design in a free-form layout where connection relationships implicitly define the service fulfillment lifecycle. The provider for Topology Designs is HP Cloud OS for Moonshot. Available components are determined by the version of OpenStack you select within HP Cloud OS for Moonshot, for example: Grizzly. As part of creating a design, you add nodes and set properties in the Editor Tab. Use the Validation Tab at any time to view details about design errors. After creating the design, you can optionally create one or more Profiles based on the design which allows you to override some of the original configuration properties. Profiles create an association to a design document and allow you to set different values such as flavors, machine images and keypairs.

**Note**: 

* Topology Designs can be created by all users but should ideally be created by a Cloud Architect. 

* If the topology design is created by a Project Admin or a Project User, it is suggested that the scope should not be selected as Public, Cloud as the user will be unable to save and publish the design.

* Project User cannot edit any topology created by Cloud Architect.

* Project Administrator can edit topology designs with Project scope only, such as: Public, Project; Private, Project.

The Topology Designer allows you to perform different tasks using the following:

* <a href="#Browse Designs Page">Browse Designs Page</a> 

* <a href="#Overview Tab">Overview Tab</a>

* <a href="#Editor Tab">Editor</a>

* <a href="#Profiles Tab">Profiles</a>

* <a href="#Revisions Tab">Revisions</a>

* <a href="#Validations Tab">Validation</a>

## Browse Designs <a name="Browse Designs Page"></a>

The Browse Designs page displays the list of existing topology designs and their status. You can perform the following tasks in the Browse Designs page: 

* View Topology Designs

* View Design Details

* Create Topology Design

* Import Topology Design

### View Topology Designs ###

To view the list of topology designs, do the following:

1.	Click the **Project** Tab to select it.<br>The tab displays with options in the left panel.</br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Provisioning** and then select **Topology Designs** to display list of existing designs and their status in the Browse Designs page.You can also search for a particular design using the search options. By default, the designs are displayed in alphabetical order. To search for a particular design use any of the following options:

 * Click the down arrow in the **By Name** box to display the options.<br>
Selecting the required option displays all the designs that meet the criteria.</br>
  * In the **Search** field, enter first few characters of the name and click the magnifier.<br>The search result is displayed.</br>


### View Design Details ###

To view the design details, do the following:

1.	Click the **Project** Tab to select it.<br>The tab displays with options in the left panel.</br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Provisioning** and then select **Topology Designs** to display list of existing designs and their status in the Browse Designs page.

4.	Select a design from the list of Deployment Templates.<br>The design details are displayed in the right panel of the Overview Tab along with the graphical representation of the design.</br>
<p>
The design is displayed in View only mode and displays the following details.</p>

   * Name - The name of the design.

   * Cloud Profile - Represents the supported OpenStack version and capabilities of the cloud to which you are deploying.

   * Validation Status -Indicates the validation status of the Document, Nodes, Relations, and Profiles.

* Structure Overview - Shows the number of nodes and connections.

### Create Topology Design ###

1.	Click the **Project** Tab to select it.
The tab displays with options in the left panel.

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Provisioning** and then select **Topology Designs** to display a list of existing designs and their status in the Browse Designs page.

4.	Click **Create** to open the Create New Design dialog box.

5.	In the **Name** box, enter a unique descriptive name for the design with or without spaces.

6.	In the **Description** box, enter the details about the design for example-size, operating system etc.

7.	Click **Next**. 
The General checkbox appears selected and the Resource Pool & Scope option is highlighted.

8.	From the **Cloud Profile** drop-down list, select *HP Cloud OS Grizzly Baremetal*.<br>It represents the supported OpenStack version and capabilities of the cloud to which you are deploying. Your selection here determines which node types are available during design layout in the Editor and which Resource Pools are available for selection.</br>

9.	(Optional) Select a **Resource Pool**, which is a pool of resources associated with the selected Cloud Profile. 

10.	Select the required **Scope** from any one of the options defined below: <br>

	<table style="text-align: left; vertical-align: top; width:700px;">
	
	<tr style="background-color: lightgrey; color: black;">
	
	  <td><b>Scope</b></td> <td><b>Description</b></td></tr>
	
	<tr style="background-color: white; color: black;">
	
	<td>Private, Project</td> <td>Allows you access while working in this project. This document can only be viewed by the user who created it in the project in which it was created and some admin users.</td></tr>
	<tr style="background-color: white; color: black;">
	<td>Private, Cloud</td><td>Allows you access while working in any project. this document can only be viewed by the user who created it from any project of which the user is a member and by some admin users.</td></tr>
	
	<tr style="background-color: white; color: black;">
	<td> Public, Project</td><td>Allows access to you and other project members. This document can be viewed by members of the project in which it was created and by some admin users.</td></tr>
	
	<tr style="background-color: white; color: black;">
	<td>Public, Cloud</td><td>Only Cloud Users have the necessary privileges to create documents that are scoped as Public cloud. Allows access for all users. This document can be viewed by anyone in the cloud in any project.</td></tr></table>

11.	Click **Finish**.

12.	Click **Save** to save the details.

### Import a Design ###

1.	Click the **Project** Tab to select it.<br>The tab displays with options in the left panel.</br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Provisioning** and then select **Topology Designs** to display a list of existing designs and their status in the Browse Designs page

4.	Click **Import**.<br>Import dialog box is displayed.</br>

5.	In the **Archive** box, enter or click (.. ) to specify the Archive File (.zip file) that contains the service design you want to import.<br>Archive filenames for service designs begin with `SERVICE_DESIGN_`.</br>

6.	Click **OK** to import the design.

    OR

   Click **Cancel** to abort and go to the previous screen.


## Overview Tab in Topology Designer <a name= "Overview Tab"></a>

The Overview Tab opens with the selected design details at the top and a graphical representation of the topology design at the bottom of the page.

You can perform the following tasks in the **Overview** Tab:

* View Design Details

* Edit a Topology Design

* Copy a Topology Design

* Publish/Unpublish a Topology Design

* Export a Design

* Delete a Topology Design


### View Design Details ###

1.	Click the **Project** Tab to select it.<br>The tab displays with options in the left panel.</br

2.	From the Current Project drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Provisioning** and then select **Topology Designs** to display Browse Designs page.<br>The design opens in the Overview Tab with the following details:</br>

* Name - Name of the design.

* Last Modified - Date, time, and user who last modified the design.

* Cloud Profile - Represents the supported OpenStack version and capabilities of the cloud to which you are deploying.

* Resource Pool - Indicates the name of the Resource Pool if one was associated to the design.

* Validation Status - Indicates the status of the four validation categories (Document, Nodes, Relations, and Profiles).

* Structure Overview - Displays nodes in the topology design.

* Topology diagram - A graphical view of the nodes and connectors representing the design.

### Edit a Topology Design ###

All design properties except the Cloud Profile can be edited in both the Overview and Editor Tabs.

1.	Click the **Project** Tab to select it.<br>The tab displays with options in the left panel.</br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Provisioning** and then select **Topology Designs** to display the list of existing topology designs in the Browse Designs page.

4.	Select the design to edit.<br>The design displays in the Overview Tab of the Design Details page.</br>

5.	Click **Edit** to open the Edit Properties dialog box.

6.	Make the required changes. 

7.	Click **Finish** to return to the Overview Tab. 

8.	Click **Save** to save the changes.

### Copy a Design ###

To make a copy of an already existing design and all its components, do the following:

1.	Click the **Project** Tab to select it.<br>The tab displays with options in the left panel.</br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Provisioning** and then select **Topology Designs** to display the list of existing topology designs.

4.	Select the design to copy.<br>The design opens in the **Overview** Tab of the Browse Designs page.</br>

5.	Click **Save as**.<br>A Save As dialog box is displayed.</br>

6.	In the **Name** box, enter a new name or keep the default which appends "copy of" to the original design name.

7.	In the **Description** box, enter the description as needed.

8.	Click **Save** to save the details.


### Publish/Unpublish a Design ###

The status of a saved topology design displays as Published or Unpublished. Published status indicates the design is fully bound (has a Resource Pool defined), has no validation errors, and can be used to provision. Published designs and their associated profiles can be viewed and launched by selecting Deployment Profiles option under the Provisioning option in the Project Tab: 
**Project > Provisioning > Deployment Profiles**.

Rules regarding saving, validation, and publishing:

* You can create and save a design with validation errors.

* You can create and save a profile with errors.

* You cannot save a profile that has errors if the underlying design is published.

Publishing status can be viewed in Browse Designs and can be changed in the Overview or the Editor Tabs.

#### To publish a design: ####

1.	Click the **Project** Tab to select it.<br>
The tab displays with options in the left panel.

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Provisioning** and then select **Topology Designs** to display Browse Designs page.

4.	Select the design to publish.
The design is displayed in the **Overview** Tab in the Design Details page.

5.	From the **Overview** Tab, click **Publish**.
If the design has no validation errors and publish is successful, the Publish button in the page changes to Unpublish.

To unpublish a design:

1.	Follow steps 1-4 defined in the Publish a Design section to unpublish a design.

2.	From the **Overview** Tab, click Unpublish.
The Publish button becomes available and within Browse Designs the status displays as blank.

### Delete a Topology Design ###

1.	Click the **Project** Tab to select it.<br>The tab displays with options in the left panel.</br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Provisioning** and then select Topology Designs to display Browse Designs page.

4.	Select the design to delete.<br>The design displays in the Overview Tab of the Design Details page.</br>

5.	Click **Delete**.
A confirmation box is displayed.

6.	Click **Yes**.<br>The design is deleted and the Browse Designs page is displayed. The design does not display in the list of designs.</br>

### Export a Design ###

The export process takes all the topology files, including the design in XML format, and creates a content archive (.zip) file. Exporting is used for data backup within the same HP Cloud OS instance.
The design must be valid and you must specify a Resource Pool before exporting.

1.	Click the **Project** Tab to select it.<br>The tab displays with options in the left panel.</br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Provisioning** and then select Topology Designs to display Browse Designs page.

4.	Select the design to export.

5.	From the **Overview** Tab, click **Export**.<br>A dialog box opens prompting you to save the archive (.zip) file.</br>

6.	Click **Save** to save the design.

##  Editor <a name="Editor Tab"></a>

The Editor Tab within Topology Designs helps you to create and edit a design in a free-form component layout.

You can perform the following tasks in the Editor Tab.

* Create a new design

* Use Editor Controls

* Design Topology Layouts

* Edit a Topology Design

**Create a new design**

From **Browse Designs**, click **Create**.<br>A blank canvas displays in the **Editor** tab. For more information, refer to Create Topology Design.</br>


**Use Editor Controls**

When you open the editor, the following controls are available in the left toolbar:

<img src="media/cos4ms-editor-controls.PNG"/>



**Design Topology Layouts**

You can design the free-form component layout of nodes and their connections in the Editor Tab once the design is created.
As you move your cursor around the canvas in the Editor, gray tiles are displayed. Once you click a tile, a list of available node types determined by the Cloud Profile is displayed. A new blank design displays at least one validation error indicating the design layout is unsaved. As you add nodes, more validation issues will display until you set required properties for the nodes and save the template. By default, the system proposes a Name for the node consisting of the node type and a sequential number, e.g., Network Segment 1. This name can be changed by editing the node properties.
To create a design layout, do the following:

1.	After you create a new design, the Editor opens with a blank canvas.<br>
You can define the design layout in the canvas.</br>

2.	Left-click a tile to display a list.

3.	Select the node type as *Server Group*.<br>The  icon displays in the canvas and the properties are displayed in the right panel.</br>

**Note**: Currently we are supporting only server groups.

To set the properties for the Node (Server Group)

**Note**: The term Node is used here for Server Group as currently we are supporting only Server Group. 

Do the following:

* Click to select the node in the canvas.<br>The properties panel displays on the right side of the page. The properties that you set in the panel become the default configuration of the design. The following table defines the node properties.</br>


	<table style="text-align: left; vertical-align: top; width:700px;">
		
	<tr style="background-color: lightgrey; color: black;">
	
	  <td><b>Node Name</b></td> <td><b>Node Properties</b></td><td><b>Description</b></td></tr>
	
	<tr style="background-color: white; color: black;">
	<td>Server Group</td><td>Name*</td><td>By default, the system proposes a name with a sequential number for each server group added to the design, e.g., Server Group 1, Server Group 2. Replace this name, if required.</td></tr>
	
	<tr style="background-color: white; color: black;">
	<td></td><td>Instance Name Prefix*</td><td>A prefix to the name of the host you are creating.</td></tr>
	
	<tr style="background-color: white; color: black;">
	<td></td><td>Number of Instances</td><td>Controls the minimum and maximum number of servers that can be used in the server group. To create a single server Server Group, specify 1 for both values. For a Server Group where the maximum number of servers is greater than the minimum, the user is allowed to add additional servers in the future up to the maximum.</td></tr>
	
	<tr style="background-color: white; color: black;">
	<td>Image</td><td></td><td>Image is only available if a Resource Pool was selected during design creation. To add a resource Pool to the design, click the Edit Design Properties button.</td></tr>
	
	<tr style="background-color: white; color: black;">
	<td>Machine Flavor*</td><td></td><td>A flavor describes the machine configuration size (amount of memory, number of CPUs, and storage capacity of Baremetal instances.Machine Flavor is only available if a Resource Pool was selected during design creation. To add a Resource Pool to the design, click Edit.</td></tr>
	
	<tr style="background-color: white; color: black;">	
	<td>Key Name</td><td></td><td>Select the keypair to be used for this instance. Keypairs are the SSH credentials required for accessing an instance. Key Name is only available if a Resource Pool was selected during design creation.</td></table>

* Click **Save** to save the details.

**Edit a Topology Design**

Once the design is created and saved, you can modify the properties of the components and change the layout of the nodes and connectors within the Editor tab. A selected component is indicated with blue highlighting and associated properties open in the right panel for editing. For more information on creating a design and specific properties, refer to Design Topology Layout section.

1.	Click the **Project** Tab to select it.</br>The tab displays with options in the left panel.</br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Provisioning** and then select **Topology Designs** to display Browse Designs page.

4.	Select the design to edit.

5.	Click the **Editor** tab.</br>The design displays on the canvas.</br>

6.	Make the required changes.

7.	Click **Save** to save the details.

**To edit node properties**

1.	In the **Editor** Tab, click the node to edit.<br>The properties display in the right panel.</br>

2.	Edit the fields as required.

3.	Click **Save**.

**To delete node/nodes** 

1.	Select the item on the canvas to be deleted.

2.	Right-click and select Delete Item.<br>The system prompts you to confirm the deletion.</br>

3.	Click **Yes** to confirm.<br>The item is removed from the layout.</br>

## Profiles  <a name="Profiles Tab"></a>

When a topology design is created, the properties set for the nodes become the 
default configuration for the design. This configuration displays as the Default Profile in the Provisioning > Deployment Profiles option. Profiles provide a way to override the default configuration by allowing you to set different values for node properties such as flavors, machine images, or keypairs. They create an association to a binding document. Profiles are optional and are not required in order to publish a design.
Profiles are validated by the topology designer and tracked in the Validation Tab. The validation process checks that a profile contains valid values for the configuration properties that are being overwritten.
You can create as many profiles as required. You can also create a new profile based on an existing profile with similar configuration to save time and duplication of effort. 

**View Profiles List**

1.	Click the **Project** Tab to select it.<br>The tab displays with options in the left panel.</br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Provisioning** and then select **Topology Designs** to display Browse Designs page with a list of existing designs.

4.	Select the design for which you want to view profiles.

5.	Click the **Profiles** tab.<br>A list of existing profiles is displayed.</br>

6.	Select a profile.<br>The profile opens in the Overview Tab, showing the Name, Description, Changed properties and a visual representation of the topology design.</br>

**Create a Profile**

1.	Click the **Project** Tab to select it.<br>The tab displays with options in the left panel.</br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Provisioning** and then select Topology Designs to display Browse Designs page with a list of existing designs.

4.	Select the design for which you want to create a profile. 

5.	Click the **Profiles** tab.

6.	Click **Create**.

7.	From the **Based on** drop-down list, select an existing profile on which you want to base the new profile.<br>If you select an existing profile, you save configuration time and effort as properties for the existing profile are populated in the new profile.</br>

8.	In the **Name** box, enter the name for the new profile.

9.	In the **Description** box, enter the description for the profile.

10.	From the **Resource Pool** drop-down list, select the resource pool.

11.	From the **Scope** drop-down list, select the scope.

12.	Click **OK**.<br>The profile opens in the Editor Tab, with the title bar at the top of the window displaying the path to the Profile Detail of the current design.</br>

13.	In the **Editor** Tab, update fields as required for the new configuration profile.

14.	Click **Save**. 

15.	Click the design name in the title bar path to return to the **Profiles** Tab,

**Edit a Profile**

1.	Click the **Project** Tab to select it.</br>The tab displays with options in the left panel.</br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Provisioning** and then select Topology Designs to display Browse Designs page with a list of existing designs.

4.	Select the design for which you want to view profiles.<br>The design displays in the Overview Tab.</br>

5.	Click the **Profiles** Tab.

6.	Click the profile to edit.<br>The profile opens in the Overview Tab, showing the topology design diagram on the right and details in the left panel.

7.	Click **Edit** to make the required changes.

8.	Click **OK**.<br>The Overview Tab is displayed.</br>

9.	Click **Save** to save the details.

**Delete a Profile**

The ability to delete a profile is determined by your Scope. For example, only a Cloud Administrator can create, edit, or delete profiles that are scoped Public, Cloud.

1.	Click the **Project** Tab to select it.<br>The tab displays with options in the left panel.</br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3. From the options in the left panel, click **Provisioning** and then select **Topology Designs** to display Browse Designs page with a list of existing designs.

4.	Select the design with the profile to delete. 

5.	From the Overview tab, click the Profiles tab.

6.	Click on the profile you want to delete.
The profile opens in the Overview tab, showing the topology design diagram on the right and details in the left panel.


7.	Click Delete.
A confirmation dialog box displays.

8.	Click Yes.
The profile is deleted.

## Revisions <a name="Revisions Tab"></a>
The system tracks design revisions sequentially in the **Revisions** Tab. Every time a design is edited and saved, the revisions list is updated. You can revert to an earlier version of the design, if required.

To revert to a previous design version, do the following:

1.	Click the **Project** Tab to select it.
The tab displays with options in the left panel.

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Provisioning** and then select **Topology Designs** to display **Browse Designs** page with a list of existing designs.

4.	Select the design for which you want to view profiles.

5.	Select the design you want to revert.

6.	From the **Overview** Tab, click the **Revisions** Tab. 
A list of design revisions are displayed with the Revision number and Date & Time.

7.	Select a revision from the list.

8.	Click **Revert to Selected**. 

9.	Click **Yes** to confirm.
A new version is created (a copy of the selected version) with updated details.

## Validation <a name="Validations Tab"></a>

Validation is a continuing process during design creation, configuration and editing. Topology Designs provide a validation log to view all design detail issues in one place.  While creating design in Editor Tab and Profiles in Profiles Tab, an error count is displayed in case of errors. The validation process checks that a Profile contains all the required configuration properties, for example the image is selected etc.

Within the Editor, the following artifacts are validated:

* Document properties

* Node properties

**Rules regarding saving, validation, and publishing:**

* You can create and save a design with validation errors.

* You can create and save a profile with errors.

* You cannot save a profile that has errors if the underlying design is published.

As part of the validation process, any new node that is added in the Editor immediately displays with an Unsaved icon and a list of specific property errors highlighted in the right panel. The Validation tab can be accessed at any time during the design process.

To view validation errors, do the following:

1.	Click the **Project** Tab to select it.
The tab displays with options in the left panel.

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Provisioning** and then select **Topology Designs** to display Browse Designs page with a list of existing designs.

4.	Select the design 
The design details are displayed in the Overview Tab

5.	Click the **Validation** Tab to activate it.<br>
The Validation page displays with following details.
 * the icon representing the component
 * the name of the component
 * a brief description of the error/errors
 * type of component

6.	Click error to go to the source of the issue and correct it.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>





