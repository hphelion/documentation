---
layout: default
title: "HP Cloud OS for Moonshot: Administration Dashboard"
permalink: /cloudos/moonshot/manage/administration-dashboard/manage-moonshot-chasssis-tab/
product: moonshot

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/administration-dashboard/cloud-images/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage/administration-dashboard/working-with-cloud-tab/">&#9650; UP</a> | <a href="/cloudos/moonshot/manage/administration-dashboard/before-you-begin/">
NEXT &#9654; </p></a>


#Manage Moonshot Chassis#

This section helps you to add HP Moonshot servers to the Cloud. It allows you to manage Moonshot Chassis by using add, edit and delete options. You can view the details and overall health status of the chassis using Datacenter View or Single Chassis View. Events panel provides the information about chassis related events.

You can perform the following tasks:

* <a href="#Datacenter View">Datacenter View</a>

*  <a href="#Single Chassis View">Single Chassis View</a>

*  <a href="#Changing the Power Status of a Cartridge/Node">Changing the Power Status of a Cartridge/Node </a>

*  <a href="#Changing the Maintenance mode of a Cartridge or a Chassis">Changing the Maintenance mode of a Cartridge or a Chassis</a>

*  <a href="#Search a Node">Search a Node</a>

* <a href="#View Events Log">View Events Log</a>


**Note**: This function can be performed by the Cloud Administrator or any member who is part of the Cloud Administrator group.

To access Moonshot Management option:

1. Select **Cloud** Tab to select it.

2. From the options in the left panel,  select **Moonshot Management** to display the Datacenter View page. This option enables two views- Datacenter View and Single Chassis View.

##Datacenter View <a name= "Datacenter View"></a>

This view provides an overview of the chassis that are managed in a Datacenter. It displays Add, Edit and Delete options at the top and Events Log panel on the right. The Datacenter View has two representations – Grid View and Table View.

 * Click the Grid and Table Views to toggle between the views. <br>By default, the chassis information is displayed in the Grid view of the Datacenter view.
 
 * Double-click the Chassis to go to the <a href="#Single Chassis View"> Single Chassis View</a>.
		
###Table View###

The Table View displays the chassis details in a tabular format.

 * Click **Table View** displayed at the top right corner of the Datacenter View. <br>The following chassis details are displayed in the table.
   
  * Display Name 
   
  * Chassis Name
   
  * Chassis ID
  
  * Product ID
  
  * MAC Address

  * IP Address
  
  * Refresh Status
  
   * Status

###Add a Chassis###

To add chassis:

1. Click **Add** to display the Enter Chassis Details dialog box.

1. In the **Display Name** box, enter the display name of the chassis.
The name should have a minimum of 4 characters. The name should start with an alphabet and may be followed by numbers or an underscore (_).<br>
**Note**: Special characters and spaces are not allowed.

1. In the **Chassis Manager IP Address** box, enter the IP address of the Moonshot Chassis.

4.	In the **Chassis Manager User Name** box, enter the user name.

5.	In the **Chassis Manager Password** box, enter the password.

6.	In the **Managing Hostname** box, enter the FQDN of the Baremetal host that will manage the chassis.
For example: *hostname.cloudos.local*

7.	Click **Add** to add the Moonshot Chassis to the Cloud.<br>
The chassis can be in any of the following states: 

<img src="media/cos4ms-state-of-chassis.png"/>

Once the operation is successful, the Moonshot Chassis is graphically represented on the screen.

###Edit Chassis###

You can only edit the password of the chassis.

1. In the Datacenter View, select the chassis to edit.<br>
The Edit option is not activated until you select the chassis in the Grid or Table view.

2. Click edit to display the Edit Chassis Details dialog box.

3. Enter the new password.

4. Click **Save** to save the password details.<br>
OR<br>
Click **Cancel** to abort and go to the previous screen.

###Delete Chassis###

You can delete a chassis if it is in maintenance mode and no active instances are running on it. A chassis can also be deleted if the discovery fails when the chassis is being added for the first time.

1. In the Datacenter View, select the chassis to delete.
The Delete option is not activated until you select the chassis in the Grid or Table view.

1. Click delete to display a confirmation box.

1. Click **Confirm** to delete the chassis.<br>
The chassis is deleted after getting a confirmation.
	
## Single Chassis View <a name="Single Chassis View"></a>


The Single Chassis View displays the detailed information about the selected Chassis in two sections- Chassis Snapshot and Table section. It also displays the Events log panel on the right.
The Chassis Snapshot visually represents the chassis with all the cartridges along with power states of the cartridges.

The following table displays a list of icons and their description. These icons are displayed next to the Chassis Snapshot on the right. It also displays the complete state of the chassis in terms of the following: <br>

<img src="media/cos4ms-table.png"/>

 
 * Click refresh to view the refreshed Chassis data.<br>
The Force Refresh option takes a minute to complete. During this time you will be unable to perform any action on the cartridge or the nodes.

**Note**: By default, the chassis data is refreshed every 30 minutes.

###Table View####

The Table view section displays two tabs- Cartridges and Nodes. Cartridges Tab provides the Cartridge View and the Nodes Tab provides the Nodes View. By default, the Cartridges View is the active view.

**Cartridges View**

Click Cartridges Tab displayed below the Chassis Snapshot to view the following details about the cartridges:

 * Cartridge Name
 
 * ID
 
 * Serial # 
 
 * Product ID
 
 * Type
 
 * System ROM Version
 
 * Health
 
 * Maintenance Mode
 
**Nodes View**

Click **Nodes** Tab displayed below the Chassis Snapshot to view the following details about the nodes:

* Node ID

* CPU Cores

* Memory(in MB)

* Min Disk (in MB)

* MAC List

* Power Status

* Instance UUID

The Nodes View also displays two tabs on the right- **Workload** and **Configuration**. To view the workload and configuration details of a particular node, do the following:

1. Select a node from the table for which you want to view the workload or configuration details.

2. Click the **Workload** Tab to view the workload details of the selected node.

3. Click the **Configuration** Tab to view the configuration details of selected node.

**Note**:

* Selecting / de-selecting a cartridge or a node in the Cartridges or Nodes table is a toggle function. 

* You can select multiple cartridges or nodes by selecting the particular rows one-by-one, in the Cartridges or Nodes table – as the case may be.

* Selecting a cartridge in the Cartridges table also selects that cartridge on the Chassis Snapshot and vice versa.

* Selecting the cartridge also selects all its nodes in the Nodes table.

* Selecting all the Nodes of a cartridge in the Nodes table selects the parent cartridge also.

* Selects all the cartridge/nodes in the table as well as in the Chassis Snapshot section.

* De-selects all the cartridges/nodes in the table as well as Chassis Snapshot section.

##Changing the Power Status of a Cartridge/Node <a name= "Changing the Power Status of a Cartridge/Node"></a>

**Note**:

  * You cannot change the power status of a provisioned cartridge.
   
  * Changing the Power status of a cartridge also changes the power status of all related nodes. <br>

To change the power status of Cartridge/Node:

1. To power On/Off nodes of a cartridge, click the cartridge or node in the table or click the cartridge on the chassis image in the Chassis Snapshot section to select it

2. Select a cartridge from the table and click power On/Off button to activate and deactivate respectively.<br>
OR<br>
From the right-click menu of the cartridge, select **Power On** or **Off** to change the power status.<br>
A Confirmation dialog box Node Power On/Off is displayed.

1. Click **Confirm** to power On/Off the cartridge/node.
The cartridge/node is powered off or on.<br>
OR<br>
Click **Cancel** to abort and go to the previous screen.

##Changing the Maintenance Mode of a Cartridge or a Chassis <a name= "Changing the Maintenance Mode of a Cartridge or a Chassis"></a>

You can place a cartridge or a chassis in maintenance On or Off mode. This is a scheduled activity that may be done periodically.

**Note**:

* If a cartridge is in maintenance mode, then the nodes of the cartridge cannot be used for provisioning.

* If a chassis is in maintenance mode, then the cartridges and the nodes within the chassis cannot be used for provisioning.

To change the maintenance mode of a chassis:

1. In the Single Chassis view, click the maintenance mode displayed at the top right corner to set Maintenance Mode to On or Off.<br>
Maintenance Mode On/Off dialog box is displayed.<br>

1. Click **Confirm** to set the Maintenance Mode for the chassis.<br>
OR<br>
Click **Cancel** to abort and go to the previous screen.

To change the maintenance mode of a cartridge:

1. In the Single Chassis view, select the cartridge from the table and click the maintenance mode to set maintenance mode to on or off. <br> 
OR<br>
In the Chassis Snapshot, right-click on the cartridge to select **Maintenance Mode On** or
**Maintenance Mode Off**.<BR>
A Maintenance Mode On/Off dialog box is displayed.

1. Click **Confirm** to set the Maintenance Mode for the cartridge.<br>
OR<br>
Click **Cancel** to abort and go to the previous screen.

##Search a Cartridge <a name= "Search a Cartridge"></a>

This option allows you to search particular cartridges based on the search criteria defined.

1. In the Single Chassis view, click the **Cartridge** Tab to select it.

2. Click drop-down arrow displayed at the top right corner of the table and select the column name.

3. In the **Filter** box, enter the search criteria.

4. Click magnifier.<br>
The search results are displayed based on the search criterion in the table.

##Search a Node <a name= "Search a Node"></a>

This option allows you to search particular nodes based on the search criteria defined.

1. In the Single Chassis view, click the **Node** Tab to select it.

2. Click drop-down arrow displayed at the top right corner of the table and select the column name.

3. In the **Filter** box, enter the search criteria.

4. Click magnifier.<br>
The search results are displayed based on the search criterion in the table.

##View Events Log <a name= "View Events Log"></a>

Events log displays of the sequence of events in the selected view. You can search for a particular event by defining search criteria.

**View Event Log in Datacenter View**

Events log is displayed on the right panel of Datacenter View page. The Panel displays two tabs – **High + Warning** and **Informational**. By default **High + Warning** is the active tab and displays the high severity events and warnings. The **Informational** Tab displays the informational details of general events. You  can search for particular events by defining the search criteria.

1. In the **Events Panel**, in the **From** box, click  calendar  to select the start date for searching the events.

2. In the **To** box, click calendar to select the end date for searching the events.

3. Click magnifier.
The search results are displayed in the table.<br>
OR<br>
 * In the **Filter** box, enter the text to base your search on.
 * Click magnifier.<br>
The search results are displayed in the table.

4. (Optional) Click eraser to clear the search criteria.

**Note**: 

-  You can also perform search based on both the date and text criteria.

-  The Events log refreshes every 10 minutes by default

**View Events Log in Single Chassis View**

Events log is displayed in the right panel of Single Chassis View page. It displays the sequence of events related to the particular chassis.

1.	In the **Events Panel** of the Single Chassis View, in the **From** box, click calendar  to select the start date for searching the events.

2.	In the **To** box, click calendar to select the end date for searching the events.

3.	Click magnifier.<br>
The search results are displayed in the Events panel.

4.	(Optional) Click **All** to display all the events.

**Note**: The Events log refreshes itself every 10 minutes by default.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>








