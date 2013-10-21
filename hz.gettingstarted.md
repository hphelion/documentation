---
layout: default
title: "HP Cloud Console Getting Started"
permalink: /hz/gettingstarted/
product: hz-Getting Started

---


# HP Cloud Console Getting Started
Cloud Console Getting Started walks you through network setup, connection, instance and volume creation, security options, identity parameters, and management tools that facilitate your organization's HP Cloud use. **This page takes you through the interface in the chronological order needed to get up and running, rather than the order displayed**. 

After initial setup, revisit the interface to monitor usage, modify, add, and delete networks, instances, volumes, usergroups, etc.

This page covers how to:

* [Create and connect a network](#Createandconnect)
* [Manage HP Cloud](#ManageHPCloud)

and provides links:

* [For further information](#Forfurtherinformation)


**Screenshot of Interface. Screenshots everywhere!!!! They're coming!**


##Create and connect a network## {#Createandconnect}

This section includes how to:

* [Create a network](#Createanetwork)
* [Create a subnet](#Createasubnet)
* [Create a router](#Createarouter)
* [Connect your network](#Connectyournetwork)


###Create a network### {#Createanetwork}

1. Login to HP Cloud with your username and password.
2. On the Cloud Console Interface, click "Project," then "Networks" under "Manage Networks."
3. Click "+Create Network" in the right-hand navigation.
4. Enter a "Network Name" in the "Create Network" pop-up screen, leave the Admin State box checked, and continue to the directions in "{#Create a subnet}" below.

###Create a subnet### {#Createasubnet}

1. Click the "Subnet" tab in the "Create Network" pop-up screen. **Note**: If you click the "Create" button before the "Subnet" tab, the interface automatically defaults to the same screen as the "Subnet" tab takes you to, but it displays an error message.
2. Enter the name of your subnet.
3. Click in the "Network Address" box. The pop-up message states the network address is in Classless Inter-Domain Routing (CIDR) format; i.e.,  000.000.0.0/00. Enter the network address displayed: 192.168.0.0/24.
4. Keep the IPv4 default in the "IP Version" box unless you know you have moved to IPv6.
5. Leave the "Gateway IP" box blank to use the default value of the network address; e.g., 192.168.0.1 for 192.168.0.0/24.
6. Leave the "Disable Gateway" box unchecked to use the default and click "Create." 
7. The "Networks" screen displays your network name and associated subnets.
8. To see a graphic display of your network setup, click "Network Topology" under "Manage Network" in the left-hand navigation.


###Create a router### {#Createarouter}

1.  If on the "Network Topology" screen, click "Create Router" in the top right-hand navigation. If not, click "Routers" under the "Manage Network" heading in the left-hand navigation.

2.  Enter your router name and click "Create Router." The router name and status appear on the "Routers" page. **Note**: For router details, you can click the router "Name" to display its ID number and status. If you do this, click "Back" before the following steps to make the "Set Gateway" action available.

3. On the "Router" page, click "Set Gateway" under "Actions" to connect your router to the Internet.

4. Click the drop-down menu in the "External Network" box in the "Set Gateway" pop-up, select "Ext-Net," and click "Set Gateway."

**Note**: The external network is the router's default route, with the router acting as a gateway for external connectivity. While you can configure a subnet that is internal-only, you must connect it to another subnet with external connectivity.

###Connect your network### {#Connectyournetwork}

1. Click the router name on the "Routers" page.

2. Click "+Add Interface" on the top far-right of the "Router Details" page. **Note**: You can click on the "Network Topology" link under "Manage Network" in the left-hand navigation to see a graphical representation of your network.

3. Click the drop-down menu in the "Select Subnet" box in the "Add Interface" pop-up and click on the network you configured. **Note**: You can optionally specify an IP address in the box provided, but the default interface IP address is the selected subnet's external gateway and the best choice unless you are setting up a more complicated connection. Any IP address you specify must belong to the subnet in the drop-down menu.

4. Click "Add Interface."

##Manage HP Cloud## {#ManageHPCloud}

You are now ready to use the options under "Manage Compute" under "Project" in the left-hand navigation. This section includes:

* [Overview](#Overview)

* [Create an Instance](#Instance)

* [Create and attach a volume](#Volumes)

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

An instance is a virtual server.

**Important** You can boot an instance from the HP-provided list of images or your own image. If the latter, you must first create a snapshot of the image. See (#Images and Snapshots) for details then complete the steps in this section. 

1. Click "Instances" under "Manage Compute."

2. Click "+Launch Instance" in the upper right-hand navigation of the screen. You can leave the default choice of the "Any Availability Zone" (AZ) box to work across AZs, or click the drop box to specify  where to locate an instance. **Note**: You can specify an AZ for an instance if you want to segregate AZs per function for your own organizational purposes; e.g., you could select AZ1 for your data center, and set the remaining two up later for other discrete functions. Such a setup is completely optional as the AZs share all information and work in tandem.

3. Enter a name in the "Instance Name" box.

4. Click the drop-down menu under "Flavor" to select the hardware bed you want to emulate, i.e., how much disk space and RAM you need. When you select a flavor, the "Flavor Details" box displays the following:

* Name
* # of VCPUs
* Root disk size
* Ephemeral disk size
* Total disk size
* RAM usage

**Note** The "Project Limits" box under "Flavor Details" graphically displays quotas allowed and usage of Instances, VCPUs, and Total RAM after you select a flavor.

4. Enter the number of instances you want to create under "Instance Count."

5. Select the "Instance Boot Source" source from the drop-down menu, enter information (if the interface prompts) for the source, and click "Launch". 

6. Click the "Select Image" drop down under "Image Name." Select one of the default images HP Cloud provides or an image you created (as discussed [above](#Instance).

7. Click the "Networking" tab in the upper navigation of  "Launch Instance" and drag and drop the network from which you want to launch the instance from the "Available Networks" box to the "Selected Networks" box or click the (+) next to the desired network to select it. 

**Note** If you click "Launch" after "Select Image," before clicking the "Networking" tab, you can also drag and drop the network desired from the "Available Network" box to the "Selected Networks" box. However, if you do not click the "Networking" tab an error message displays. 

8. Click "Launch."

###Create and Attach a Volume### {#Volumes}

A volume is a block storage device you attach to an instance.

**Important**: You can boot from the HP-provided list of volumes or your own volume. If the latter, you must first create a snapshot of the volume. See (#Images and Snapshots) for details then complete the steps in this section.
 
1. In the left-hand navigation, click "Volumes" under "Manage Compute."
2. Click "+Create Volume" in the upper right-hand navigation.
3. Enter a name under "Volume Name" and, optionally, a description in the box below and a "Type" from the following drop-down menu.
4. Staying within the "Volume Limits" shown in the "Create Volume" box, enter a number of GBs under "Size."
5. Select a volume source from the drop-down menu. 
6. If you select "Image" as your volume source, click the drop-down menu for "Choose an image" under the "Use image as a source" box that appears. Select 
7. Click "Create Volume."
8. To attach the volume to an instance, click "Edit Attachments" under "Action" on the "Volumes" page.
9. Select an instance to attach the volume to from the drop-down menu on the "Manage Volume Attachments" page.
10. Under "Device Name," you can specify a location in the system if desired or enter the displayed default. **Note**: If going with the default, you must still enter it by hand even though it is displayed (greyed out). Otherwise, you receive an error message that you must specify a location. Good times. (Steve checking on whether user has to use default. If so, it's a bug. Follow up to see if fixed.)
11. Click "Attach Volume."

###Images and Snapshots### {#Imagesandsnapshots}

[Terms and Provisions](#TermsandProvisions) 
##Terms and Provisions## {#TermsandProvisions} 

**Functionality Overview**
Click "Images and Snapshots" to view available server and volume images. You can view image details as well as launch an instance or volume from here. In addition, you can create your own images from which to launch an instance or a volume and delete images.   as discussed in [Create an Instance](#Instance) and [Create a Volume](#Volume). 
 
1. Click "Images and Snapshots" in the left hand-navigation to display image names and information. For more details, click the image name on the "Images" page. 

The "Projects" tab is my own image after I create a snapshot/"+Create Image." Once created, I can launch another one. Check this out in interface.  Not right is it? Shouldn't this just display in the "Images Name" list? 

Follow up with Steve - There is a Public tab - Public should only be under a project and not here. Did this get submitted as bug and fixed?

**Important** HP provides a list of server and volume images for your use. If you have a server image already customized with developer tools, software, etc., or a volume image with your data, you can also create a "snapshot" of your own server or volume image.

We covered launching an instance under Create an Instance {#Instance} above. You can also  launch an instance from the list displayed when you click "Images and Snapshots" in the interface.

You can create your own image with "+Create Image" in the top navigation or go to Instances in the left-hand navigation and create a snapshot of your own server and setup custom instances to replicate. 

Under Project tab is my own image after I create a snapshot/"+Create Image" Check this out in interface.  Then I can launch another one.

Can do the same with volumes, but you can't create an image with a volume attached. Make volume snapshot. Create volume from a snapshot and attach to other instances.

##Identity## {#Identity}

###Access and Security### {#Accessandsecurity}
Add security and group rules from Networking Guide:
Security Groups and Security Group Rules: Security groups and security group rules allow you to specify the type of traffic and direction (inbound/outbound) that is allowed to pass through a port. A security group is a container for security group rules.

When a port is created in HP Cloud Networking it is associated with a security group. If a security group is not specified the port is associated with a default security group. Security group default rules allow inbound traffic from the same subnet and all outbound traffic. You can add rules to this group to modify behavior.

Go back through navigation and refine this. May need more help from Steve:
Click Security Groups
Add Name
Edit Rule
Add rule
Similar to 1.0.  See my Network Guide

####Identity####
Domain
(Projects that I enable) 
A domain administrator can perform all services. 
The entity that serves as a collection of users, groups, roles, and tenants. It represents the primary relationship between the customer and HP.  A Domain can be an individual or company.  
 
When a Domain is created, the public Groups User and Admin are created in the Domain.  Additionally, the domainadmin and domainuser Role will be placed on the Admin and User Group respectively.  The first User created in a Domain is marked the Domain owner and placed in both the User and Admin Group.  
 
Cross Domain trust relationships can be established to enable one Domain to allow Users of another Domain access to its Tenants
A Domain will have one Owner
A Domain may have multiple Users
A Domain may have multiple Groups
A Domain may have multiple Roles

Project
Represents a collection of HP service subscriptions within a domain.  (compute, storage, etc)   In OpenStack Cactus terminology a project would equate to a Swift account or Nova project.  
A project may define its own public Roles (e.g. Nova defines sysadmin, developer, projectowner, and netadmin)

A Project may contain multiple service subscriptions
The same service type (e.g. Nova, Swift) subscriptions may exist multiple times within the same Tenant as long as they differ service endpoint.


Service specify or define roles.

Represents a service subscription.  Services are distinguished between one another by their service type (compute, object-store, etc) and service endpoint.  Service endpoints are distinguished by their location described by a geography, region, and zone.

User are defined separately and put in a group with role identities.
An identity stored in the Control Services identity store used by a client to authenticate to HP OpenStack.
A User may wield multiple Roles

Group
A collection of Users within a Domain.  

There exist system defined public Groups (User, Admin) available by default to all domains.  For each new Domain created, an Admin and User Group will be created.  Additionally, Domain administrators can create new Groups for their own usage.
A Group may contain multiple Users
A User may be a member of multiple Groups
Public Groups cannot be deleted or modified by Domain administrators or their Users
Role
A responsibility which is linked to a User or Group and scoped to a particular Tenant for the purpose of determining access rights.  There exist system defined public Roles (domainadmin, domainuser, sysadmin, netadmin, developer, projectowner) available to all Domains.  Domain administrators can create new Roles with specific Grants for their own usage.
A Role may be associated with multiple Users
A Role may be associated with multiple Groups
Public Roles cannot be deleted or modified by Domain administrators or their Users
Need full explanation of identities and how to manage identity. In a project - Managing machines' interactions. How to set it up.
Descending order
1. Domains - highest level
2. Projects
3. Users
4. Groups - collection of people can have roles also.
5. Role


##For further information## {#Forfurtherinformation}

* For basic information about our HP Cloud compute services, take a look at the [HP Cloud compute overview](/compute/) page
* If you'd rather use the HP Cloud Command Line Interface (CLI) features, choose your topic of interest from our [HP CLoud CLI](/cli) pages.
