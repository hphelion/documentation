---
layout: default
title: "HP Cloud Console Getting Started"
permalink: /hz/gettingstarted/
product: hz-Getting Started

---


# Getting Started with HP Public Cloud Console
This Getting Started guide walks you through network setup, connection, instance and volume creation, security options, identity parameters, and management tools that facilitate your organization's HP Cloud use. **This page takes you through the interface in the chronological order needed to get up and running, rather than the order displayed in the console**. 

After initial setup, revisit the interface to monitor usage, modify, add, and delete networks, instances, volumes, roles, groups, and more.

***HP Public Cloud Horizon Preview Edition

This page covers how to:

* [Create and connect a network](#Createandconnect)
* [Manage HP Cloud](#ManageHPCloud)

and provides links:

* [For further information](#Forfurtherinformation)


##Create and connect a network## {#Createandconnect}

This section includes how to:

* [Create a network](#Createanetwork) 
* [Create a subnet](#Createasubnet)
* [Create a router](#Createarouter)
* [Connect your network](#Connectyournetwork)


###Create a network### {#Createanetwork}

1. Login to HP Public Cloud with your username and password.
2. On the Cloud console interface, click "Project," on the left side-bar then "Networks" under "Manage Networks."

***Add screenshot Create a Network Image 1
3. Click "+Create Network" in the right-hand navigation.

***Add screenshot Create a Network Image 2


4. Enter a "Network Name" in the "Create Network" pop-up screen, leave the Admin State box checked, and continue to the directions in "{#Create a subnet}" below.

***Add screenshot Create a Network Image 3

###Create a subnet### {#Createasubnet}

1. Click the "Subnet" tab in the "Create Network" pop-up screen. **Note**: If you click the "Create" button on the "Network" pop-up before setting up a "Subnet,"  you are prompted to specify a network address or turn off the option to create a subnet through an error message.
2. Enter the name of your subnet.
3. Click in the "Network Address" box. The pop-up message states the network address is in Classless Inter-Domain Routing (CIDR) format; i.e.,  000.000.0.0/00. Enter the network address displayed: 192.168.0.0/24.
4. Keep the IPv4 default in the "IP Version" box unless you know you have moved to IPv6.
5. Leave the "Gateway IP" box blank to use the default value of the network address; e.g., 192.168.0.1 for 192.168.0.0/24.
6. Leave the "Disable Gateway" box unchecked to use the default and click "Create." 

***Add screenshot Create a Subnet Image 1

7. The "Networks" screen displays your network name and associated subnets.

***Add screenshot Create a Subnet Image 2

8. To see a graphic display of your network setup, click "Network Topology" under "Manage Network" in the left-hand navigation.


###Create a router### {#Createarouter}

1.  If on the "Network Topology" screen, click "Create Router" in the top right-hand navigation or left-hand navigation. If not, click "Routers" under the "Manage Network" heading in the left-hand navigation.

***Create a Router Image 1.

2.  If you clicked "Routers" under "Manage Network", click "+Create Router" in the upper right-hand navigation and enter the router name in the pop-up. If you clicked "+Create Router" on the "Network Topology" screen, enter your router name and click "Create Router."  

3. Click "Router" in the left-hand navigation to see the router name and status. **Note**:  Click the router "Name" to display its ID number and status. If you do this, click "Routers" in the left-hand navigation to make the "Set Gateway" action available for the following step or click the "Back" button in your browser.

***Create a Router Image 2

3. On the "Router" page, click "Set Gateway" under "Actions" to connect your router to the Internet.

***Create a Router Image 3

4. Click the drop-down menu in the "External Network" box in the "Set Gateway" pop-up, select "Ext-Net," and click "Set Gateway."

**Note**: The external network is the router's default route, with the router acting as a gateway for external connectivity. While you can configure a subnet that is internal-only, you must connect it to another subnet with external connectivity.

***Create a Router Image 4

###Connect your network### {#Connectyournetwork}

1. Click the router name on the "Routers" page.

2. Click "+Add Interface" on the top far-right of the "Router Details" page. 

***Connect your network image 1

3. Click the drop-down menu in the "Select Subnet" box in the "Add Interface" pop-up and click on the network you configured. **Note**: You can optionally specify an IP address in the box provided, but the default interface IP address is the selected subnet's external gateway and the best choice unless you are setting up a more complicated connection. Any IP address you specify must belong to the subnet in the drop-down menu.

4. Click "Add Interface."

***Connect your network Image 2

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

As you use HP Public Cloud, click on the "Overview" options any time to query current usage as well as usage during specific time frames.

####Create an instance#### {#Instance}

An instance is a virtual server.

**Important** You can boot an instance from the HP-provided list of images or your own image. If the latter, you must first create a snapshot of the image. See [Images and Snapshots](#Imagesandsnapshots) for details then complete the steps in this section. 

1. Click "Instances" under "Manage Compute" in the left-hand navigation.

2. Click "+Launch Instance" in the upper right-hand navigation of the screen. 

***Create an Instance Image 1

3. You can leave the default choice of the "Any Availability Zone" (AZ) box, which arbitrarily assigns an AZ for an instance or click the drop box to specify  where to locate an instance. **Note**: The default choice locating an instance in any AZ offers high availability, ensuring a high level of operational performance. You can also specify an AZ for an instance if you want to segregate AZs per function for your own organizational purposes; e.g., you could select AZ1 for your data center, and set the remaining two up later for other discrete functions. Such a setup is completely optional as the AZs share all information and work in tandem.

3. Enter a name in the "Instance Name" box.

4. Click the drop-down menu under "Flavor" to select the hardware configuration you want to emulate, i.e., how much disk space and RAM you need. When you select a flavor, the "Flavor Details" box displays the following:

* Name
* # of VCPUs
* Root disk size
* Ephemeral disk size
* Total disk size
* RAM usage

**Note** The "Project Limits" box under "Flavor Details" graphically displays quotas allowed and usage of Instances, VCPUs, and Total RAM after you select a flavor.

***Create an Instance Image 2

4. Enter the number of instances you want to create under "Instance Count."

5. Select the "Instance Boot Source" source from the drop-down menu. To select an HP Cloud default image, select "Boot from Image" from the drop-down. If you created a snapshot image, select "Boot from snapshot." Enter information (if the interface prompts) for the source.

***Create an Instance 3

6. Click the "Select Image" drop down under "Image Name." Select one of the default images HP Cloud provides or an image you created (as discussed [above](#Instance) and click "Launch."

***Create an Instance 4

7. Click the "Networking" tab in the upper navigation of  "Launch Instance" and drag and drop the network from which you want to launch the instance from the "Available Networks" box to the "Selected Networks" box or click the (+) next to the desired network to select it. 

**Note** If you click "Launch" after "Select Image," before clicking the "Networking" tab, an error message displays; however, you can still select  the network desired from the "Available Network" box to the "Selected Networks" box.

8. Click "Launch."

***Create an Instance 5

###Create and Attach a Volume### {#Volumes}

A volume is a block storage device you attach to an instance.

**Important**: You can boot from the HP-provided list of volumes or your own volume. If the latter, you must first create a snapshot of the volume. See [Images and Snapshots](#Imagesandsnapshots) for details, then complete the steps in this section.
 
1. In the left-hand navigation, click "Volumes" under "Manage Compute."
2. Click "+Create Volume" in the upper right-hand navigation.

***Volume Image 1

3. Enter a name under "Volume Name" and, optionally, a description in the box below and a "Type" from the following drop-down menu.

4. Staying within the "Volume Limits" shown in the "Create Volume" box, enter a number of GBs under "Size."

***Volume Image 2

5. Select a volume source from the drop-down menu. 
6. If you select "Image" as your volume source, click the drop-down menu for "Choose an image" under the "Use image as a source" box that appears. Click on the image you want to use. 

***Volume Image 3

8. Select an AZ. HP recommends the pre-filled "Any Availability Zone."
7. Click "Create Volume."

***Volume Image 4

8. To attach the volume to an instance, click "Edit Attachments" under "Action" on the "Volumes" page.

**Volume Image 5

9. Select an instance to attach the volume to from the drop-down menu on the "Manage Volume Attachments" page.

10. Under "Device Name," you can specify a location in the system if desired or enter the displayed default. **Note**: If choosing the default, you must still enter it manually even though it is displayed (greyed out). Otherwise, you receive an error message that you must specify a location. Good times. 

11. Click "Attach Volume."

***Volume Image 6


###Images and Snapshots### {#Imagesandsnapshots}

**Functionality Overview**

Click "Images and Snapshots" to view available server and volume images and their details. HP provides a list of server and volume images for your use or you can create a "snapshot" of your own server or volume image.  You can launch an instance from the instructions in this section as well as from the instructions under [Create an Instance](#Instance) above. 

1. Click "Images and Snapshots" in the left hand-navigation to display image names and information. For more details, click the image name on the "Images" page. Images listed under "Public" are available to anyone. "Project" images are private.

***Images and Snapshots Image 1

2. To delete an image, select the check box in the left column next to its name and click "Delete Images" in the upper-right hand navigation.

3. To create an image, click "+Create Image" in the top navigation to open the "Create an Image" pop-up. 

4. Enter an image name and an optional description in the respective fields.

5. Click the drop-down menu under "Select an Image Source." Depending on which image source you use, enter the HTTP URL in the "Image Location" field or click  "Choose File" to select the image source. **Important** Only images available via an HTTP URL are supported. Compressed image binaries (.zip and .tar.gz) are supported. The "Image Location" field MUST be a valid and direct URL to the image binary. URLs that redirect or serve error pages will result in unusable images.

6. Click the drop-down box in the "Format" field and select your format.

7. Enter the minimum disk space required to boot the image in the "Minimum Disk (GB)" Field. If none entered, the field defaults to 0 (no minimum). 

8. Click the blue "Create Image" button.

9. After creating an image, it appears under the "Project" tab on the "Images and Snapshots" page. Launch as many instances as you like from your image.  

**Note** You can create volume images the same way you create instance images, but you cannot create an image with a volume attached. You must attach the volume to each instance separately.  

###Access and Security### {#Accessandsecurity}
Security groups and security group rules allow you to specify the type of traffic and direction (inbound/outbound) that is allowed to pass through a network port. A security group is a container for security group rules.

When a port is created in HP Cloud Networking it is associated with a security group. If a security group is not specified the port is associated with a default security group. Security group default rules allow inbound traffic from the same subnet and all outbound traffic. You can add rules to this group to modify behavior or create additional security groups to contain the rules your need.

Click "Access & Security" in the left-hand bar under "Project" and "Manage Compute."   

###Organize and manage HP Cloud Access## {#Identity}

Click  "Identify" in the left-hand interface to display links:

* Domain - The domain is your primary work space in HP Public Cloud.  An individual or company can be the domain owner and enables a project with the necessary services and permissions. The first user created in a domain is considered the domain owner and placed in both the “Users” and “Domain Administrators” groups. 

A domain has one owner and may have multiple users, groups and roles. A domain owner can allow users of another domain access to its projects.

* Projects – A project is a collection of HP Public Cloud services, e.g., compute, storage, etc. within a domain  A project is defined by selecting services to be activated and a set of users to interact with the services. A Project may contain multiple services, such as compute or object storage. Services can exist multiple times within the same project as long as they have different service endpoints, distinguished by their geography and region.

* Users - Users are defined individually and can be assigned to groups and granted roles either directly or through inclusion in groups.  A user may have multiple roles.

* Groups - When you create a domain, two default groups are created: Users and Domain Administrators. Domain Administrators can add individuals to a group and create new groups, which may contain multiple users. 

* Roles - A role is a user or group  capability within a  service that determines access rights. Roles include  Compute Admin, Network Admin, Object Storage Admin, and others.  Domain owners can  assign roles to individuals or groups. A role may be associated with multiple users and multiple groups.

##For further information## {#Forfurtherinformation}

* For basic information about our HP Cloud compute services, take a look at the [HP Cloud compute overview](/compute/) page
* If you'd rather use the HP Cloud Command Line Interface (CLI) features, choose your topic of interest from our [HP CLoud CLI](/cli) pages.
