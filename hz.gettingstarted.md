---
layout: default
title: "HP Cloud Console Getting Started"
permalink: /hz/gettingstarted/
product: hz-Getting Started

---


# HP Cloud Console Getting Started
Cloud Console Getting Started walks you through network setup, connection, instance and volume creation, security options, identity parameters, and management tools that facilitate your organization's HP Cloud use. This page takes you through the interface in the chronological order needed to get up and running, rather than the order displayed. After initial setup, revisit the interface to monitor usage, modify, add, and delete networks, instances, volumes, usergroups, etc.

This page covers how to:

* [Begin Cloud setup](#Begin)
* [Create and connect a network](#Createandconnect)
* [Manage HP Cloud](#ManageHPCloud)

and provides links:

* [For further information](#Forfurtherinformation)


Screenshot of Interface. Screenshots everywhere!!!! They're coming!


##Begin Cloud setup## {#Begin}

1. Login to HP Cloud with your username and password.
2. Activate an Availability Zone (AZ) from the list under "Compute" in the Cloud Console interface. 

##Create and connect a network## {Createandconnect}

This section includes how to:

* [Create a network](#Createanetwork)
* [Create a subnet](#Createasubnet)
* [Create a router](#Createarouter)
* [Connect your network](#Connectyournetwork)
* [Compute dashboard overview](#Overview)


###Create a network### {#Createanetwork}

1. On the Cloud Console Interface, click "Project," then "Networks" under "Manage Networks."
2. Click "+Create Network" in the right-hand navigation.
3. Enter a "Network Name." (Look at again for description/use of "Admin State" and then if needed, ask Steve - should you leave the default checked for it?)

###Create a subnet### {#Createasubnet}

1. On the "Subnet" page, enter the name of your subnet.
2. Tab to or click in the the "Network Address" box. The pop-up window states the network address is in Classless Inter-Domain Routing (CIDR) format; i.e.,  000.000.0.0/00. Enter the network address displayed: 192.168.0.0/24.
3. Keep the IPv4 default in the "IP Version" box unless you know you have moved to IPv6.
4. Leave the "Gateway IP" box blank to use the default value of the network address; e.g., 192.168.0.1 for 192.168.0.0/24.
5. Leave the "Disable Gateway" box unchecked to use the default and click "Create." 
6. The "Networks" screen displays your network name and associated subnets.
7. To see a graphic display of your network setup, click "Network Topology."


###Create a router### {#Createarouter}

1.  If on the "Network Topology" screen, click "Create Router" on the top right-hand navigation. If not, click "Routers" under the "Manage Network" heading in the left-hand navigation.

2.  Enter your router name and click "Create Router." The router name and status appear on the "Routers" page.

Note: For router details, you can click the router "Name" to display its ID number and status. If you do this, click "Back" before the following steps to make the "Set Gateway" action available.

3. On the "Router" page, click "Set Gateway" under "Actions" to connect your router to the subnet.

4. Click the drop-down menu in the "External Network" box in the "Set Gateway" pop-up, select "Ext-Net," and click "Set Gateway."

_Note: The external network is the router's default route, with the router acting as a gateway for external connectivity. While you can configure a subnet that is internal-only, you must connect it to another subnet with external connectivity._

###Connect your network### {#Connectyournetwork}

1. Click the router name on the "Routers" page.
2. Click "+Add Interface" on the top far-right of the "Router Details" page.
3. Click the drop-down menu in the "Select Subnet" box in the "Add Interface" pop-up and click on the network you configured.

_Note: You can optionally specify an IP address in the box provided, but the default interface IP address is the selected subnet's external gateway and the best choice unless you are setting up a more complicated connection. Any IP address you specify must belong to the subnet in the drop-down menu._

4. Click "Add Interface."

##Manage HP Cloud## {ManageHPCloud}

You are now ready to use the options under "Manage Compute." Mosey on over to the left-hand navigation, click that bad boy and let's get started. This section includes:

* [Overview](#Overview)
* [Create an Instances](#Instance)
* [Create and attach a volumes](#Volumes)
* [Images and Snapshots](#Imagesandsnapshots)
* [Access and Security](#Accessandsecurity)


###Overview### {#Overview}

Select "Overview" under "Manage Compute," to display your usage summary and quotas for:
* Instances
* VPCUs
* RAM
* Floating IPs
* Security Groups

As you use HP Cloud, click on the "Overview" options any time to query current usage as well as usage during specific time frames.

####Create an instance#### {#Instance}

1. Click "Instances" under "Manage Compute" to create an instance (virtual server).
2. Click "+Launch Instance" in the upper right-hand navigation of the screen.You can leave the default choice of the "Any Availability Zone" (AZ) box to work across AZs, or click the drop box to specify  where to locate an instance.

Note: You might specify an AZ for an instance if you want to segregate AZs per function for your own organizational purposes; e.g., you could select AZ1 for your data center, and set the remaining two up later for other discrete functions. Such a setup is completely optional as the AZs share all information and work in tandem.

#####Name the instance and launch#####

1. Click the drop-down menu under "Flavor" to select the hardware bed you want to emulate, i.e., how much disk space and RAM you need. When you select a Flavor, the "Flavor Details" box displays:

* Name
* # of VCPUs
* Root disk size
* Ephemeral disk size
* Total disk size
* RAM usage

"Project Limits" graphs quotas allowed and usage of Instances, VCPUs, and Total RAM.

2. Enter the number of instances to create under "Instance Count."

3. Select the source from which you want to boot your Instance from the drop-down menu under "Instance Boot Source," enter any required information for that source in the box displayed, and click "Launch".

4. Drag and drop the network desired from the "Available Network" box to the "Selected Networks" box or click the "+" next to the desired network.

5. Click "Launch."

###Create and Attach a Volume### {#Volumes}

A volume is a block storage device you attach to an instance.

1. In the left-hand navigation, click "Volumes" under "Manage Compute."
2. Click "+Create Volume" in the upper right-hand navigation.
3. Enter a name under "Volume Name" and, optionally, a description in the box below and a "Type" from the following drop-down menu.
4. Staying within the "Volume Limits" shown in the "Create Volume" box, enter a number of GBs under "Size."
5. Select a volume source from the drop-down menu.
6. Click "Create Volume."
7. To attach the volume to an instance, click "Edit Attachments" under "Action" on the "Volumes" page.
8. Select an instance to attach the volume to from the drop-down menu on the "Manage Volume Attachments" page.
9. Under "Device Name," you can specify a location in the system if desired or enter the displayed default.

_Note: If going with the default, you must still enter it by hand even though it is displayed (greyed out). Otherwise, you receive an error message that you must specify a location. Good times._

10. Click "Attach Volume."

###Images and Snapshots### {#Imagesandsnapshots}
1. Click "Images and Snapshots" in the left hand-navigation, select your image and click "Launch." To view instance information, choose an image name and an instance, and click "Launch"?????
2. The "Launch Instance" box displays instance information under the following tabs:
* Details
* Networking
* Post-Creation
What are we doing here? Under details, adding more instances? Displaying access and security under access security. Did I decide to just let the user figure this out and just list the tabs?

###Access and Security### {#Accessandsecurity}
Click Security Groups
Add Name
Edit Rule
Add rule
Similar to 1.0.  See my Network Guide

####Identity#### -  Need full explanation of identities and how to manage identity. In a project - Managing machines' interactions. How to set it up.
Descending order
1. Domains - highest level
2. Projects
3. Users
4. Groups - collection of people can have roles also.
5. Role


##For further information## {#Forfurtherinformation}

* For basic information about our HP Cloud compute services, take a look at the [HP Cloud compute overview](/compute/) page
* If you'd rather use the HP Cloud Command Line Interface (CLI) features, choose your topic of interest from our [HP CLoud CLI](/cli) pages.
