---
layout: default
title: "Topology Designs"
permalink: /cloudos/manage/administration-dashboard/topology-designs/
product: cloudos

---


<a name="_top"> </a>

<script> 

function PageRefresh { 
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/manage/administration-dashboard/getting-started/">&#9664; PREV</a> | <a href="/cloudos/manage/administration-dashboard">&#9650; UP</a> | <a href="/cloudos/manage/administration-dashboard/tasks-by-role/">NEXT &#9654;</a> </p>

# Topology Designs

You can use the dashboard's designer to create and manage topology designs for straightforward IaaS deployments. 
Your topology designs become the recipes for automating the cloud. The designer allows you to design in a free-form 
layout where connection relationships implicitly define the service fulfillment lifecycle.

HP Cloud OS is the provider for your designs. Available components are determined by the OpenStack version (for example Diablo, Grizzly) you 
select within HP Cloud OS. As part of creating a design, you add nodes and connectors and set properties in the Editor tab. Use the Validation 
tab at any time to view details about design errors.

After creating the design, you can optionally create one or more Profiles based on that design which allows you to override some 
of the original configuration properties. Profiles create an association to a design document and allow you to set different 
values such as flavors, machine images, or keypairs.

Click Project > Provisioning > Topology Designs to access the designer. A list of existing designs and their status display in the 
Browse Designs window.

Tasks are organized by the following tabs:

<table style="text-align: left; vertical-align: top; min-width:600px;">

<tr style="background-color: #C8C8C8;">
<th> Window </th>
<th> Description </th>
<th> Available Tasks </th> 
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:100px;"> <a href="#browse-topology-designs">Browse Designs</a> </td>
<td> A list of existing topology designs and their status. </td> 
<td> 
<ul>
<li> <b>View design details</b> - click a design to open it in the <b>Overview</b> tab </li>
<li> <b>Create</b> - create a new topology design
<li> <b>Import</b> - Import an external design
</ul>
</td> 
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:100px;"> <a href="#topology-designs-overview">Overview</a> </td>
<td> Displays the details of the selected design:
<ul>
<li> Name
<li> Last Modified
<li> Cloud Profile
<li> Resource Pool
<li> Validation Status
<li> Structure Overview
<li> Topology diagram
</ul>
</td> 
<td> 
<ul>
<li> <b>Save</b>
<li> <b>Edit</b> - the design properties.
<li> <b>Save as</b> - make a copy of a design.
<li> <b>Publish/Unpublish</b> - published designs can be used to provision.
<li> <b>Export</b> - export the design to another HP Cloud OS instance.
<li> <b>Delete</b>
</ul>
</td> 
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:100px;"> <a href="#topology-designs-overview">Editor</a> </td>
<td> A canvas area used to select and arrange nodes, connectors, and properties. Use the Validation tab if you need more 
details about errors within the Editor.
</td> 
<td> 
<ul>
<li> <b>Edit</b> - the design properties.
<li> Add/change nodes.
<li> Add/change connectors.
<li> Add/change node and connector properties.
<li> <b>Publish/Unpublish</b>
</ul>
</td> 
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:100px;"> <a href="#deployment-profiles">Profiles</a> </td>
<td> Provides a way to override the default configuration of a design by creating as many Profiles as needed.
</td> 
<td> 
<ul>
<li> View existing profiles.
<li> <b>Create</b> - a new profile.
</ul>
</td> 
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:100px;"> <a href="#how-to-revert-to-a-previous-topology-design-version">Revisions</a> </td>
<td> The system tracks design revisions sequentially in the Revisions tab, allowing you to revert to an earlier version if needed.
</td> 
<td> <b>Revert to selected</b> </td> 
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:100px;"> <a href="validation">Validation</a> </td>
<td> Provides details about design errors in the Editor and Profiles areas.  The following artifacts are validated:
<ul>
<li> Document properties
<li> Node properties
<li> Connector properties
<li> Profiles
</ul>
</td> 
<td> View the validation error details, and link back to the source to correct them. </td> 
</tr>

</table>


<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Browse Topology Designs

**Concepts:**

1. On the Project tab, select a Current Project.

2. Click Provisioning > Topology Designs to open the Browse Designs window. The list of Deployment Templates displays the design Name and Publishing status.

To filter the design list:

* By default, all designs display alphabetically By Name when you open Topology Designs.

Other options to reorder or filter the design list:

* Click the arrow in the By Name field and select Recently modified.
    
* Click in the Search field () and enter the first few characters of the search string.

**Tasks:**

* [How to View Topology Design Details](#how-to-view-topology-design-details)

* [How to Create a Topology Design](#how-to-create-a-topology-design)

* [How to Import a Topology Design](#how-to-import-a-topology-design)


### How to View Topology Design Details

On the Project tab, select a Current Project.

Click Provisioning > Topology Designs to open the Browse Designs window.

Select a design from the list of Deployment Templates. See Browse Topology Designs for more information on how to filter the list of designs.

A view-only graphical representation of the design components opens in the right panel of the Overview tab with the following details displayed on the left:

* <b>Name</b>: The name of the design.

* <b>Last Modified</b>: The date, time, and user who last updated the design.

* <b>Cloud Profile</b>: Represents the supported OpenStack version and capabilities of the cloud to which you are deploying.

* <b>Resource Pool</b>: The Resource Pool selected during creation.

* <b>Validation status</b>: Indicates the validation status of the Document, Nodes, Relations, and Profiles.

* <b>Structure Overview</b>: Shows the number of nodes and connections.



### How to Create a Topology Design

To create a topology design:

<ol>
<li value="1">On the Project tab, select a <b>Current Project</b>.</li>
<li value="2">Click <b>Provisioning &gt; Topology Designs</b> to open the <b>Browse Designs</b> window. </li>
<li value="3">Click <b>Create</b>. The Create New Design wizard opens.</li>
<li value="4">With the <b>General</b> step highlighted on the left, enter the following information:</li>
</ol>
			
<table style="text-align: left; vertical-align: top; min-width:600px;">

<tr style="background-color: #C8C8C8;">
<th> Field </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;">Cloud Profile <i>(Required)</i></td>
<td>Represents the supported OpenStack version and capabilities of the cloud to which you are deploying. Your selection here determines which node types are available during design layout in the <b>Editor </b>and 
which Resource Pools are available for selection.</td>
</tr>
					
<tr style="background-color: white; color: black;">
<td style="min-width:150px;">Name <i>(Required)</i></td>
<td>Enter a unique, descriptive name for the design, with or without spaces.</td>
</tr>
                    
<tr style="background-color: white; color: black;">
<td style="min-width:150px;">Description</td>
<td>Provide details about the design, such as size, operating system, and so on.</td>
</tr>
</table>

<ol>
<li value="5">Click <b>Next</b>. A check mark appears in the <b>General</b> step and the <b>Resource Pool &amp; Scope</b> step is highlighted. </li>
<li value="6">Optionally select a <b>Resource Pool</b>, which is a pool of resources associated with the selected Cloud Profile. Selecting a Resource Pool allows you to set node and connector properties when laying out the design. </li>
<li value="7">Select the <b>Scope</b>, which is required:</li>
</ol>

<table style="text-align: left; vertical-align: top; min-width:600px;">

<tr style="background-color: #C8C8C8;">
<th> Scope </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;">Private, project</td>
<td>
Allows you access while working in this project. This document can only be viewed by the user who created it in the project in which it was created and some admin users.</span>
</td>
</tr>
				
<tr style="background-color: white; color: black;">
<td style="min-width:150px;">Private, cloud </td>
<td>Allows you access while working in any project. This document can only be viewed by the user who created it, from any project of which the user is a member, and by some admin users.</td>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;">Public, project</td>
<td>Allows you and other project members access. This document can be viewed by members of the project in the project in which it was created and by some admin users.</td>
</tr>
				
<tr style="background-color: white; color: black;">
<td style="min-width:150px;">Public, cloud</td>
<td>
<p>Only Cloud Admin users have the necessary privileges to create documents that are scoped as Public, cloud.</p>
<p>Allows access for all users. This document can be viewed by anyone in the cloud in any project.</p>
</td>
</tr>

</table>

<ol>
<li value="8">Click<b> Finish</b>. </li>
<li value="9">Click <b>Save.</b></li>
</ol>
        
To add nodes and connectors to the design, see the next section, How to Lay Out a Topology Design.


### How to Import a Topology Design

The import process imports archives of topology designs and their supported artifacts within the same HP Cloud OS instance.

To import a topology design:

1. On the Project tab, select a Current Project.

2. Click Provisioning > Topology Designs to open the Browse Designs window.

3. From Browse Designs, click the **Import** button.

4. Enter or click () to specify the Archive File (.zip file) that contains the service design you want to import. Archive file names for service designs begin with `SERVICE_DESIGN_`.

5. Click OK.


<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Topology Designs Overview

**Concepts:**

The Overview tab opens with the selected topology design details on the left and a visual representation of the topology design networking layout on the right.

To view topology design details:

1. On the Project tab, select a Current Project.

2. Click Provisioning > Topology Designs to open the Browse Designs window.

3. The design opens in the Overview tab with the following details:
  * Name: Name of the design.
  * Last Modified: Date, time, and user who last modified the design.
  * Cloud Profile: Represents the supported OpenStack version and capabilities of the cloud to which you are deploying.
  * Resource Pool: Indicates the name of the Resource Pool if one was associated to the design.
  * Validation Status: Indicates the status of the four validation categories (Document, Nodes, Relations, and Profiles). For more information, see Validation.
  * Structure Overview: Displays a count of nodes and connections in the topology design.
  * Topology diagram: A graphical view of the nodes and connectors representing the design.


**Tasks:**

* [How to Edit Topology Design Properties](#how-to-edit-topology-properties)

* [How to Copy a Topology Design](#how-to-copy-a-topology-design)

* [How to Publish or Unpublish a Topology Design](#how-to-publish-or-unpublish-a-topology-design)

* [How to Export a Topology Design](#how-to-export-a-topology-design)

* [How to Delete a Topology Design](#how-to-delete-a-topology-design) 



### How to Edit Topology Design Properties

TBS...


### How to Copy a Topology Design

TBS...

### How to Publish or Unpublish a Topology Design

TBS...


### How to Export a Topology Design

TBS...



### How to Delete a Topology Design 

TBS...


<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Topology Design Editor

The Editor tab within Topology Designs is where you create and edit a design in a free-form component layout by:

* Adding nodes

* Adding relationship connectors

* Configuring properties for nodes and connectors
  
* Editing properties for nodes and relationships

### To edit an existing design

1. On the Project tab, select a Current Project.
    
2. Click Provisioning > Topology Designs to open the Browse Designs window.

3. Select the design to edit.

### To create a new design

1. From Browse Designs, click Create. 

2. A blank design opens in the Editor tab. For more information, see [How to Create a Topology Design](#how-to-create-a-topology-design).

### To use the editor controls

1. When you open the editor, the following controls are available in the left toolbar:
  * Edit the selected item.
  * Delete selected item.
  
2. Zoom in.  **NOTE:** You can also use the wheel on your mouse to zoom in and out within the Editor.

3. Zoom out.

4. Zoom the design to fit the window.


**Tasks:**

* How to Lay Out a Topology Design

* How to Edit Topology Design Nodes and Connectors


<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Deployment Profiles

Concepts:

When you create a topology design, the properties you set for the nodes become the default configuration for the design. Within HP Cloud OS, this original configuration displays as the Default Profile in the Provisioning > Deployment Profiles area. Profiles provide a way to override the default configuration by allowing you to set different values for node properties such as flavors, machine images, or keypairs. Profiles create an association to a binding document. Profiles are optional and are not required in order to publish a design. For more information, see How to Publish or Unpublish a Topology Design.

Profiles are validated by the topology designer and tracked in the Validation tab. The validation process checks that a profile contains valid values for the configuration properties that are being overwritten.

You can create as many profiles as needed. You can create a new profile based on an existing profile.  This can save you time and effort if the profiles have similar configurations. This process copies all the nodes, connectors, and properties of the original profile into the new profile where you can then change the properties.

To view profiles and details:

1. On the Project tab, select a Current Project.
    
2. Click Provisioning > Topology Designs to open the Browse Designs window.
    
3. From Browse Designs, select the design for which you want to view profiles.
   
4. Click the Profiles tab. A list of existing profiles displays.
    
5. Select a profile. The profile opens in the Overview tab, showing the Name, Description, Changed Properties and a visual representation of the topology design. NOTE: The linked path at the top of this window allows you to move back as needed.

 

**Tasks:**

* How to Create a Deployment Profile

* How to Edit Deployment Profile Properties

* How to Delete a Deployment Profile

	

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## How to Revert to a Previous Topology Design Version

The designer tracks topology design revisions on the Revisions tab. Every time you edit or save a topology design, the revisions list is updated. You can revert to an earlier topology design.

To revert to an previous topology design version:

1. On the Project tab, select a Current Project.

2. Click Provisioning > Topology Designs to open the Browse Designs window.

3. Select the design you want to revert.

4. From the Overview tab, click the Revisions tab. A read-only list of design revisions displays with the Revision number, Date, and Author.

5. Select a revision from the list.

6. Click Revert to Selected. Click Yes to confirm.

7. A new version is created (a copy of the selected version) with updated details.



<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Validation

**Concepts:**

Validation is a continuing process during design creation, configuration, and editing. 

Topology Designs provides a validation log where you can view details about all design issues in one place. In addition to this log, you will see red validation flags as you create a design in the Editor and create Profiles. 

The validation process checks that a Profile contains all the required configuration properties, e.g., that Flavor is set for a server group node.

Within the Editor, the following artifacts are validated:

* Document properties

* Node properties

* Connector properties

Rules regarding saving, validation, and publishing:

* You can create and save a design with validation errors.

* You can create and save a profile with errors.

* You cannot save a profile that has errors if the underlying design is published.

As part of the validation process, any new node that is added in the Editor immediately displays with an Unsaved icon () and a list of specific property errors highlighted in the right panel. Within the Validation tab, you can click on the artifact name to be 
linked back to the source of the error.

The Validation tab can be accessed at any time during the design process. 

**Tasks:**

[How to View Validation Errors](#how-to-view-validation-errors)

### How to View Validation Errors

1. On the Project tab, select a Current Project.

2. Click Provisioning > Topology Designs to open the Browse Designs window.

3. Select the design.
   
4. From the Overview tab, click the Validation tab.

5. Within this window, a table displays with:
   * The icon associated with a component
   * The name of the component, which is a direct link to the component so you can update
   * A brief description of issues with the component

6. Click a linked validation item to move to the source of the issue and correct.

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

