---
layout: default
title: "HP Management Console Getting Started"
permalink: /hz/gettingstarted/
product: hz-Getting Started

---
# Management console compute dashboard

This page provides you with an overview of the management console (MC) compute dashboard, which displays your compute information and acts as your main interface to your compute functions.  This page covers the following topics:

* [Compute dashboard overview](#Overview)
* [Navigating to other compute screens](#Navigating)
* [For further information](#ForFurtherInformation)

##Compute dashboard overview## {#Overview}

The MC compute main dashboard displays your active compute instances, divided by region:

<img src="media/main-dash-all-services.png" width="580" alt="" />

Introduction
Cloud Console Getting Started walks you through network setup, connection, and management, instance and volume creation, security options, and identity parameters that facilitate your organization's HP Cloud use.

In most cases, this document takes you through the interface in the chronological order needed to get up and running, rather than the order displayed. After you are setup, revisit the interface to monitor, modify, add, and delete networks, instances, volumes, usergroups, etc.

Screenshot of Interface.

I. Begin
A. Login to HP Cloud with your username and password
B. Activate an Availability Zone (AZ) from the list under "Compute" in the Cloud Console Interface.


II. Create and Connect a Network
A. Create a Network
1. On the Cloud Console Interface, click "Project," then "Networks" under "Manage Networks."
2. Click "+Create Network" in the right-hand navigation.
3. Enter a "Network Name." (Look at again for description/use of "Admin State" and then if needed, ask Steve - should you leave the default checked for it?

B. Create a Subnet
1. On the "Subnet" page, enter the name of your subnet.
2. Tab to or click in the the "Network Address" box. The pop-up window states the network address is in Classless Inter-Domain Routing (CIDR) format:  000.000.0.0/00. Enter the network address displayed: 192.168.0.0/24.
3. Keep the IPv4 default in the "IP Version" box unless you know you have moved to IPv6.
4. Leave the "Gateway IP" box blank to use the default value of the network address; e.g., 192.168.0.1 for 192.168.0.0/24.
5. Leave the "Disable Gateway" box unchecked to use the default and click "Create." 
6. The "Networks" screen displays your network name and associated subnets.
7. To see a graphic display of your network setup, click "Network Topology."

C. Create a Router
1.  If on the "Network Topology" screen, click "Create Router" on the top right-hand navigation. If not, click "Routers" under the "Manage Network" heading in the left-hand navigation.
2.  Enter your router name and click "Create Router." The router name and status appear on the "Routers" page.

Note: For router details, you can click the router "Name" to display its ID number and status. If you do this, click "Back" before the following steps to make the "Set Gateway" action available.

3. On the "Router" page, click "Set Gateway" under "Actions" to connect your router to the subnet.
4. Click the drop-down menu in the "External Network" box in the "Set Gateway" pop-up, select "Ext-Net," and click "Set Gateway."

Note: Th external network is the router's default route, with the router acting as a gateway for external connectivity. While you can configure a subnet that is internal-only, it would need to be connected to another subnet with external connectivity.

D.  Connect Your Network
1. Click the router name on the "Routers" page.
2. Click "+Add Interface" on the top far-right of the "Router Details" page.
3. Click the drop-down menu in the "Select Subnet" box in the "Add Interface" pop-up and click on the network you configured.

Note: You can optionally specify an IP address in the box provided, but the default interface IP address is the selected subnet's external gateway and the best choice unless you are setting up a more complicated connection. Any IP address you specify must belong to the subnet in the drop-down menu.

4. Click "Add Interface."

III. Manage HP Cloud
A. Overview

You are now ready to use the options under "Manage Compute." Mosey on over to the left-hand navigation, click that bad boy and let's get started. "Manage Compute" options include:
1. Overview
2. Instances
3. Volumes
4. Images and Snapshots
5. Access and Security

A. Select "Overview" under "Manage Compute," to display your usage summary and quotas for:
1. Instances
2. VPCUs
3. RAM
4. Floating IPs
5. Security Groups

As you use HP Cloud, click on the "Overview" options to query current usage as well as usage during specific time frames.

B. Create an Instance
1. Click "Instances" under "Manage Compute" to create an instance (virtual server).
2. Click "+Launch Instance" in the upper right-hand navigation of the screen.
a. You can leave the default choice of "Any Availability Zone" (AZ) box to work across AZs, or click the drop box to specify  where to locate an instance.

Note: You might specify an AZ for an instance if you want to segregate AZs per function for your own organizational purposes; e.g., you could select AZ1 for your data center, and set the remaining two up later for other discrete functions. Such a setup is completely optional as the AZs share all information and work in tandem.

b. Name the Instance

c. Click the drop-down menu under "Flavor" to select the hardware bed you want to emulate, i.e., how much disk space and RAM you need. When you select a Flavor, the "Flavor Details" box displays:
1. Name
2. # of VCPUs
3. Root disk size
4. Ephemeral disk size
5. Total disk size
6. RAM usage
"Project Limits" graphs quotas allowed and usage of Instances, VCPUs, and Total RAM

d. Enter the number of instances to create under "Instance Count."

e. Select the source from which you want to boot your Instance from the drop-down menu under "Instance Boot Source," enter any required information for that source in the box displayed, and click "Launch".

f. Drag and drop the network desired from the "Available Network" box to the "Selected Networks" box or click the "+" next to the desired network.

g. Click "Launch."

C. Create and Attach a Volume
A volume is a block device you can attach to an instance.
1. In the left-hand nav, click "Volumes" under "Manage Compute."
2. Click "+Create Volume" in the upper right-hand navigation.
3. Enter a name under "Volume Name" and optionally, a description in the box below and a "Type" from the following drop-down menu.
4. Staying within the "Volume Limits" shown in the "Create Volume" box, enter a number of GBs under "Size."
5. Select a volume source from the drop-down menu.
6. Click "Create Volume"
7. To attache the volume to an instance, click "Edit Attachments" under "Action" on the "Volumes" page.
8. Select an instance to attach the volume to from the drop-down menu on the "Manage Volume Attachments" page.
9. Under "Device Name," you can specify a location in the system if desired or enter the displayed default.

Note: If going with the default, you must still enter it by hand even though it is displayed (greyed out). Otherwise, you receive an error message that you must specify a location. Good times.
10. Click "Attach Volume."

D. Images and Snapshots
1. Click "Images and Snapshots" in the left hand-navigation, select your image and click "Launch.". To view instance information, choose an image name and an instance, and click "Launch"?????
2. The "Launch Instance" box displays instance information under the following tabs:
a. Details
b. Networking
c. Post-Creation
What are we doing here? Under details, adding more instances? Displaying access and security under access security. Did I decide to just let the user figure this out and just list the tabs?

E.  Click Security Groups
Add Name
Edit Rule
Add rule
Similar to 1.0.  See my Network Guide

F. Identity -  Need full explanation of identities and how to manage identity. In a project - Managing machines' interactions. How to set it up.
Descending order
1. Domains - highest level
2. Projects
3. Users
4. Groups - collection of people can have roles also.
5. Role


