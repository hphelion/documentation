---
layout: default
title: "HP Cloud Compute Networking"
permalink: /compute/networks/outline
product: compute

---
# HP Cloud Compute Networking Outline#


##HP Cloud Networking Overview ##
[HP Cloud Networking Overview](/compute/networks/) 

*I created a new file; high-level detail; modeled after [HP Cloud version 13.5 overview](https://docs.hpcloud.com/version-overview); including text from networking guide*

* Using the Default Network Configuration
* Customizing your Configuration
	* Using the console
	* Using the API
	* Using language bindings
	* Using the CLI
* Using VPN
* Using Security Groups
* Using Regions and Availability Zones
* For further information

###Creating Your First Network - 13.5 ###

[Creating Your First Network](/compute/networks/first-network/)

*I created this file; not complete; based on [Creating first instance](https://community.hpcloud.com/article/creating-your-first-instance-135); **do we need**? Similar file to [Getting Started with HP Public Cloud Console](http://docs.hpcloud.com/hpcloudconsole)*

**Using the Horizon Cloud Console**

* Create a network
* Manage a network
* Delete a network
* View network, subnet, and router details

**Using the Windows PowerShell**

* Create a network
* Manage a network
* Delete a network
* View network, subnet, and router details

###Working with networks ###

[Management console: Networks screen](/mc/compute/networks/)

*File exists for MC; need to update to Horizon*

- Networks screen overview
- Networks screen functions
- For further information

#####Working with networks using the API#####

*File exists*

The network service that provides a powerful API to define the network connectivity and addressing used by devices from other services, such as the Compute service. 

The HP Cloud Services API supports virtual network, subnet, router and port abstractions to describe network resources; text taken from [cloud wiki](https://wiki.hpcloud.net/display/iaas/Neutron+-+HPCS+Cloud+Network+Service).

You can use the API to:
- Allocate and add floating IPs
- Work with security groups


For Network API details, see the [HP Cloud Compute Service API Reference](https://docs.hpcloud.com/api/compute/#2.3Network).

#####Viewing the network topology####

*We should have something for the [Network Topology screen](https://horizon.hpcloud.com/project/network_topology/) that describes that page, what it represents and what you  can do there. Created a [Horizon console: Network Topology screen](/mc/compute/topology/) placeholder.*

#####Viewing network details#####

[Viewing network details](/mc/compute/networks/mc.compute.networks.view-network)

*File exists for MC; need to update to Horizon*

- Before you begin
- Accessing the network details screen
- Organization of the network details screen
- Sorting lists
- Editing network names
- Network details screen available features
- For further information


#####Managing a subnet#####

[Managing a subnet](/mc/compute/networks/manage-subnet)

*File exists for MC; need to update to Horizon*

- Before you begin
- Creating a subnet
- Editing a subnet
- Enabling and disabling DHCP
- Deleting a subnet
- For further information


#####Viewing subnet details#####

[Viewing subnet details](/mc/compute/networks/mc.compute.networks.view-subnet)

*File exists for MC; need to update to Horizon*

- Before you begin
- Accessing the subnet details screen
- Contents of the subnet details screen
- For further information


###Working with routers ###

[Management console: Routers screen](/mc/compute/routers)

*I created a new file for this; as an intro section, matching that of [Management console: Networks screen](/mc/compute/networks/).*

- Routers screen overview
- Routers screen functions
- For further information


####Managing routers ####

[Managing routers](/mc/compute/networks/manage-routers)

*File exists for MC; need to update to Horizon; used HTML to hide enable/disable sections (can't do this in 13.5???)*

- Before you begin
- Enabling a router
- Disabling a router
- Attaching an interface to a router
- Detaching an interface from a router
- Attaching a router to an external network
- Detaching a router from an external network
- For further information

####Viewing router details ####

[Viewing router details](/mc/compute/networks/mc.compute.networks.view-router)

*File exists for MC; need to update to Horizon*

- Before you begin
- Accessing the router details screen
- Organization of the router details screen
- Sorting the interfaces list
- Router details screen available features
- For further information

###Working with ports ###

[Managing Ports](/mc/compute/networks/manage-ports/)

*I created file; do we need? Add to Viewing router details?*

- Before you begin
- Creating a port
- Enabling a port
- Disabling a port
- Deleting a port    

###How to's ###

[How To's with HP Cloud Networking version 13.5](/compute/networks/howto/)


*File created, but empty; do we need?; I added tasks that didn't fit elsewhere, modeled after How To's with the Compute Service.* 
*Moved [Enabling and disabling a network](/mc/compute/networks/enable-network.md) into How To's*

- Enable a network
- Disable a network
- Delete a network
- Specify an IP address
- Rename a network
- Edit a sub-net
- Rename a port
- Assign a router to a network
 
- Delete a network using the CLI
- Rename a network using the CLI
- Edit a sub-net using the CLI
- Rename a port using the CLI
- Assign a router to a network using the CLI
- Rename a network using the CLI
- Edit a sub-net using the CLI
- Rename a port using the CLI
- Assign a router to a network using the CLI

###Known Issues and Workarounds###

[Known issues and workarounds](/compute/networks/issues/)

*Taken from Networking Guide and [Understanding network screen system messages](/compute/networks/sys-messages), which was empty*	


- Port Configuration
- Security Groups
- Understanding network screen system messages
- Before you begin
	- System message 1
	- System message 2
- For further information

###For more information###

Community links to consider:

[Understanding Network Topology in 13.5](https://community.hpcloud.com/article/understanding-network-topology-135)

[Knowledge Base](https://community.hpcloud.com/search/knowledge/network)

[Forums](https://community.hpcloud.com/search/forum/network)