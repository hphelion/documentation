---
layout: default
title: "How To's with the Compute Service"
permalink: /compute/networks/howto/
product: compute

---
# How To's with HP Cloud Networking version 13.5

<!-- Modeled after How To's with the Compute Service (https://docs.hpcloud.com/compute/using/) Some text from network guide. -->

As you get used to using the networking service, you might need to modify the default network or create additional networks.  This page gives you some how-to's for the following tasks: 
 
* Specifying an IP address for those networks 
* Configuring security group parameters that define the firewall rules for virtual servers
* Allocating and managing public floating IP addresses

You can use the the [Horizon Cloud Console](#console) or [HP Cloud CLI for Windows PowerShell](#powershell) to work with a network.  

##Before you begin## {#Overview}

Before you can enable or disable networks, you must:

* [Sign up for an HP Cloud compute account](https://account.hpcloud.com/signup)
* Activate compute service on your account
* [Create a network](/mc/compute/networks/create-network/)

## Using the Horizon Cloud Console ## {#console}

You can use the Horizon Cloud Console to perform the following tasks:

* Enabling and disabling a network
* Creating a sub-network
* Specifying an IP address
* Allocating floating IP address
* Configuring security group

## How to enable a network

By default, when you [create a network](/mc/compute/networks/create-network#Creating/), that network is created in an enabled admin state.  

<img src="media/compute-networks03.jpg" width="580" alt="" />

If you have at some point [disabled](#Disabling) a network and want to enable it, in the `Manage` column of the `Networks` list, select the `Options` button and choose the `Enable` option.

<!-- Illustration of "Enable" option being selected needed here -->

##How to disable a network## {#Disabling}

By default, when you [create a network](/mc/compute/networks/create-network#Creating/), that network is created in an enabled admin state.  If you want to disable your network, in the `Manage` column of the `Networks` list, select the `Options` button and choose the `Disable` option.

<img src="media/compute-networks04.jpg" width="580" alt="" />


## How to delete a network ##

1. Login to the [Horizon Console](https://horizon.hpcloud.com/).

2. Select the Networks tab under the Project section:
    <br><img src="media/network-new.png"  alt="" />

3. On the Networks screen, locate the network which you want to delete.

4. In the Actions column, click **More** -> **Delete Network** for your the network. 
	<br><img src="media/network-delete.png"  alt="" />

5. In the confirmation dialog, click **Delete Network**.


## How to specify an IP address ###

1. Login to the [Horizon Console](https://horizon.hpcloud.com/).

2. Select the Networks tab under the Project section:
    <br><img src="media/network-new.png"  alt="" />

3. Click **Create Network**. 
	<br><img src="media/network-create.png"  alt="" />

4. On the **Network** tab, enter a name for the network.  
	<br><img src="media/network-fields.png"  alt="" />

5. Enter the following values, as appropriate:
	<br><img src="media/network-fields-2.png"  alt="" />

6. Enter the following values, as appropriate:
	<br><img src="media/network-fields-3.png"  alt="" />

7. Click **Create**.


<!--Can users enable/disable routers in 13.5?
##Enabling a router## {#Enabling}

When you enable the compute service, a router is enabled by default.  If you have [disabled](#Disabling) the router, to enable it, in the `Manage` column, select the `Options` button for the router you wish to disable and click the `Disable` item:

<img src="media/disable-router.jpg" width="580" alt="" />
 

##Disabling a router## {#Disabling}

When you enable the compute service, a router is enabled by default.  To disable the router, in the `Manage` column, select the `Options` button for the router you wish to disable and click the `Disable` item:

<img src="media/enable-router.jpg" width="580" alt="" />

-->


## Using the Windows PowerShell ## {#powershell}

The HP Cloud environment command-line interface (CLI) software for Windows PowerShell allows Windows users to manage their HP Cloud services from the command line.

For the full reference of supported HP Cloud CLI commands for Windows PowerShell, see [HP Cloud Environment CLI Software for Windows PowerShell Command Line Reference](docs.hpcloud.com/cli/windows/2/reference/). 

### How to delete a network ###

1. On the 13.5 instance, launch a Windows PowerShell window.  

	Select the shell appropriate to your system, either the 64-bit or 32-bit version. 

2. Enter the HP Cloud environment CLI by entering:

	`PS C:> cd HPCS:`

3. Create a new network by executing the following command, using the appropriate values:
	
	remove-network

	remove-network -id -all

	Where
	
		id - The ID of the network to delete.

		all - Removes all networks in the current availability-zone associated with your project.

	The following example deletes a network with the specified ID

		remove-network -id 12857174-99cf-40e9-999e-fb0fa2e84898  

Deletes the Network with the id of 12857174-99cf-40e9-999e-fb0fa2e84898

### How to rename a network ###

You can change the name of a network, as needed.

1. On the 13.5 instance, launch a Windows PowerShell window.  

	Select the shell appropriate to your system, either the 64-bit or 32-bit version. 

2. Enter the HP Cloud environment CLI by entering:

	`PS C:> cd HPCS:`

3. Change the network name by executing the following command, using the appropriate values:
	
	update-network -id networkIP Identity -n Name

	Where

	id - The network ID.

	n - The new name for the network.

	The following example renames the specified network to Network1:

		update-Network -id 12857174-99cf-40e9-999e-fb0fa2e84898 -n "Network1" 

### How to edit a sub-net###

You can modify a sub-net to rename the sub-net or change the the external gateway assigned to the sub-net.

1. On the 13.5 instance, launch a Windows PowerShell window.  

	Select the shell appropriate to your system, either the 64-bit or 32-bit version. 

2. Enter the HP Cloud environment CLI by entering:

	`PS C:> cd HPCS:`

3. Modify the sub-net by executing the following command, using the appropriate values:
	
	update-subnet -id SubnetIdentifier -egw ExternalGatewayNetworkIPAddress - n Name

	Where

		id - The sub-net ID.

		egw - The external gateway network ID to assign.

		n - The new name for the sub-net.

	The following example reassigns the subnet to the designated external network and renames the sub-net to "NewSubnetName":

	update-Subnet -id 12857174-99cf-40e9-999e-fb0fa2e84898 -egw 129.15.124.12 -n "NewSubnetName" 


### How to rename a port###

By default, when a port is created, the port is automatically assigned a name and ID. For example, when you create a subnet, a port is created for that subnet. 

You can change the name of a port, as needed.

1. On the 13.5 instance, launch a Windows PowerShell window.  

	Select the shell appropriate to your system, either the 64-bit or 32-bit version. 

2. Enter the HP Cloud environment CLI by entering:

	`PS C:> cd HPCS:`

3. Change the port name by executing the following command, using the appropriate values:
	
	update-port  -id port -did name

	Where

	id - The port ID.

	did - The new name for the port.

	The following example renames the specified port to port1:

	update-Port -id 12857174-99cf-40e9-999e-fb0fa2e84898 -did "port1" 

### How to assign a router to a network###

You can assign a router to an external network, as needed.

1. On the 13.5 instance, launch a Windows PowerShell window.  

	Select the shell appropriate to your system, either the 64-bit or 32-bit version. 

2. Enter the HP Cloud environment CLI by entering:

	`PS C:> cd HPCS:`

3. Assign the external network by executing the following command, using the appropriate values:
	
	update-router  -id RouterID -nid Name

	Where

	id - The router ID.

	nid - The new name for the router.

	The following example renames the specified router to router1:

	update-Port -id 12857174-99cf-40e9-999e-fb0fa2e84898 -nid "router1" 



##For further information## {#ForFurtherInformation}

* For information about the router details screen, take a look at the [Viewing router details](/mc/compute/networks/view-router/) page
For the full reference of supported HP Cloud CLI commands for Windows PowerShell, see [HP Cloud Environment CLI Software for Windows PowerShell Command Line Reference](docs.hpcloud.com/cli/windows/2/reference/)
* For basic information about our HP Cloud compute services, take a look at the [HP Cloud compute overview](/compute/) page
* Use the MC [site map](/mc/sitemap) for a full list of all available MC documentation pages
* For information about the Open Stack networking features, surf on over to [their networking wiki](https://wiki.openstack.org/wiki/Quantum)