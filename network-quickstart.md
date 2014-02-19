---
layout: default
title: "HP Cloud Networking:  Network setup quick start guide"
permalink: /compute/network/
product: compute
categories: neutron
tags: networking neutron vpn

---
# HP Cloud Networking: The Quick start guide 

HP Cloud Networking is a virtual networking service that provides network connectivity and addressing for HP Cloud compute devices. It is based on OpenStack Networking open source software. 

#####A default configuration comes with HP Cloud compute activation and includes:

* A network 
* A subnet
* A router connecting the subnets to the Internet
* A security group with basic server options

__Use as is or customize__ 

You can use the default network to deploy HP Cloud compute virtual servers, or modify the network configuration through the OpenStack Networking API.  Use the command line or the HP Cloud management console's (MC) easy-to-use interface to customize.
 
HP Cloud Networking expands networking capabilities, allowing you to perform many tasks, including:

* Defining and configuring virtual networks
* Specifying IP subnets for those networks
* Defining security group parameters
* Allocating and managing public floating IP addresses



## Overview ## {#top}

This guide provides the information you will need to get started in setting up a VPN that connects your local network to your Virtual Private Cloud (VPC) located in the HP Cloud.  In this guide, you create two instances--one as an example to use and the other as a gateway.

<img src="media/HPCS-VPC-VPN-SingleSite-Connection-Layer3-new-novendor.jpg" width="600" alt="Basic VPN setup" />

**NOTE:**  This guide assumes a "left" case with the "right" case being the hardware.  




### Audience ### {#audience}
This guide is designed for those in the following or similar roles:   

- Networking Engineers    
- Networking Administrators
* Cloud Administrators

To use this solution effectively, you should be familiar with   

- Local network configuration in HP Cloud     
- HP Cloud Compute and Networking services 
- OpenStack Nova and Neutron CLI and API   
- Virtual Private Networks (VPN)    
- strongSwan or other IPsec-based software solutions   
    

### Key Terms ### {#terms}

__Floating IP Addresses__: On-demand, public IP addresses on a network. With HP Cloud, you can allocate several floating IP addresses and assign them to virtual servers. 

__Network__: Allows you to define network connectivity and addressing in the Cloud, providing "networking as a service" between interface devices managed by other HP Public Cloud, such as compute. 

__Port__: A connection point for attaching a single device, such as a virtual server's NIC, to a virtual network.  The port describes the associated network configuration, such as the MAC and IP addresses to be used by the attached device.

__Router__: A device that forwards data packets along networks. 

__Security Groups and Security Group Rules__: Security groups and security group rules allow you to specify the type of traffic and direction (inbound/outbound) that is allowed to pass through a port. A security group is a container for security group rules.

When a port is created in HP Cloud Networking it is associated with a security group. If a security group is not specified the port is associated with a default security group. Security group default rules allow inbound traffic from the same subnet and all outbound traffic. You can add rules to this group to modify behavior. 

__Subnet__: Contains IP address blocks that assign IP addresses to virtual servers. In addition, a subnet can have a gateway, a list of DNS name servers, and host routes. Information provided by DHCP is pushed to servers with interfaces associated with the subnet.

back to the [top](#top)


##Customizing your Configuration##

You can use the default network or customize the default network using either the HP Cloud Networking API or the HP Cloud Management Console. Customizing a network enables you to manage the networks your virtual servers connect to.

HP Cloud Networking expands networking capabilities, allowing you to perform many tasks, including:

- Creating and deleting a network
- Managing a subnet
- Adding and deleting an interface to a router
- Configuring security group parameters that define the firewall rules for virtual servers
- Allocating and managing public floating IP addresses
- Viewing network and router details

## Quick start guide ## {#quickstart}


In this guide we use these parameters:

$EXT_NET = Ext-Net   
$CIDR = 10.2.0.0/24 (example range)   
$NETWORK_ID = the id of the created network   
$SUBNET_ID = the id of the created subnet   
$TENANT_ID = the id of the tenant   
$PORT_ID1 = id of port 1 (vm-gateway)     
$PORT_ID2 = id of port 2 (vm-test)    
$VM_GATEWAY = address of the VPN VM gateway (e.g., 10.2.0.21)   

For more details on the Nova and Neutron commands please see the [HP Cloud Networking](https://docs.hpcloud.com/api/v13/networking/) and [Compute](https://docs.hpcloud.com/api/v13/compute/) API specifications.

### Activate the compute service in HP Cloud ### {#compute}

If you have not previously created an account and activated the compute service please sign up at [http://hpcloud.com](http://hpcloud.com).  Once you activate the compute service, you need to install the [compute](https://docs.hpcloud.com/api/v13/compute/) and [networking](https://docs.hpcloud.com/api/v13/networking/) clients or the [CLI](http://docs.hpcloud.com/cli/unix/network). Make sure you activate a compute instance in HP Cloud version 13.5 to access the networking and VPN capabilities.

You might need to modify the default network or create additional networks.  This page gives you some how-to's to use the [Horizon Cloud Console](#console) or [HP Cloud CLI for Windows PowerShell](#powershell) to perform the following tasks:  

**Horizon Cloud Console**
<!-- Taken from list under network quota default -->

- [Enable a network](#Enabling)
- [Specify an IP address](#SpecifyIP)
- [Assign a router to a network](#AssignRouter)
- [Create a port]
- [Create a floating IP address]
* [Create a router]
* [Create a security group]
* [Create a security group rule
 
**HP Cloud CLI for Windows PowerShell**

- [Enable a network](#Enabling)
- [Specify an IP address](#SpecifyIP)
- [Assign a router to a network](#AssignRouterCLI)

###HP Cloud Networking Quota Default:###

* 5 Networks
* 5 Subnets
* 70 Ports
* 45 Floating IP addresses
* 1 Router
* 10 Security Groups
* 50 Security Group Rules

##Before you begin## {#Overview}

Before you can enable or disable networks, you must:

* [Sign up for an HP Cloud compute account](https://account.hpcloud.com/signup)
* Activate compute service on your account
* [Create a network](/mc/compute/networks/create-network/#Creating)

## Using the Horizon Cloud Console ## {#console}

You can use the Horizon Cloud Console to perform the following tasks:

- [Enable a network](#Enabling)
- [Disable a network](#Disabling)
- [Delete a network](#Deleting)
- [Specify an IP address](#SpecifyIP)
- [Rename a network](#RenameNet)
- [Edit a sub-net](#EditSub)
- [Rename a port](#RenamePort)
- [Assign a router to a network](#AssignRouter)

All of the procedures in this section require that you access the Networks or Routers tab in the Project section of the Horizon Cloud Console, <a name="NetworkTab">as shown</a>:

   <br><img src="media/network-tab.png"  alt="" />

## How to enable a network {#Enabling}

By default, when you [create a network](/mc/compute/networks/create-network#Creating), that network is created in an enabled admin state.  

If you have at some point [disabled](#Disabling) a network, you can enable it.

1. Login to the [Horizon Console](https://horizon.hpcloud.com/).

2. Select the [Networks tab](#NetworkTab) under the Project section.

3. On the Networks screen, locate the network which you want to enable.

4. In the Actions column, click **Edit Network** for your the network. 

5. In the Edit Network screen, select the **Admin State** option and click **Save Changes**:
	<br><img src="media/network-enable.png"  alt="" />


##How to disable a network## {#Disabling}

By default, when you [create a network](/mc/compute/networks/create-network#Creating/), that network is created in an enabled admin state.  You can disable a network, as needed.

1. Login to the [Horizon Console](https://horizon.hpcloud.com/).

2. Select the [Networks tab](#NetworkTab) under the Project section.

3. On the Networks screen, locate the network which you want to disable.

4. In the Actions column, click **Edit Network** for your the network. 

5. In the Edit Network screen, clear the **Admin State** option and click **Save Changes**:
	<br><img src="media/network-disable.png"  alt="" />


## How to delete a network ## {#Deleting}

1. Login to the [Horizon Console](https://horizon.hpcloud.com/).

2. Select the [Networks tab](#NetworkTab) under the Project section.

3. On the Networks screen, locate the network which you want to delete.

4. In the Actions column, click **More** -> **Delete Network** for your the network. 
	<br><img src="media/network-delete.png"  alt="" />

5. In the confirmation dialog, click **Delete Network**.


## How to specify an IP address ### {#SpecifyIP}

1. Login to the [Horizon Console](https://horizon.hpcloud.com/).

2. Select the [Networks tab](#NetworkTab) under the Project section.

3. Click **Create Network**. 
	<br><img src="media/network-create.png"  alt="" />

4. On the **Network** tab, enter a name for the network.  
	<br><img src="media/network-fields.png"  alt="" />

5. Enter the following values, as appropriate:
	<br><img src="media/network-fields-2.png"  alt="" />

6. Enter the following values, as appropriate:
	<br><img src="media/network-fields-3.png"  alt="" />

7. Click **Create**.


### How to rename a network ### {#RenameNet}

1. Login to the [Horizon Console](https://horizon.hpcloud.com/).

2. Select the [Networks tab](#NetworkTab) under the Project section.

3. On the Networks screen, locate the network which you want to rename.

4. In the Actions column, click **Edit Network** for your the network. 

5. In the Edit Network screen, enter a new name and click **Save Changes**
	<br><img src="media/network-edit.png"  alt="" />

###How to rename a sub-net### {#EditSub}

1. Login to the [Horizon Console](https://horizon.hpcloud.com/).

2. Select the [Networks tab](#NetworkTab) under the Project section.

3. On the Networks screen, click the network associated with the subnet you want to rename.

4. In the Actions column, click **Edit Subnet** for your the subnet you are changing. 

5. In the Edit Subnet screen, enter a new name and click **Save**
	<br><img src="media/network-subnet-edit.png"  alt="" />


###How to rename a port### {#RenamePort}

1. Login to the [Horizon Console](https://horizon.hpcloud.com/).

2. Select the [Networks tab](#NetworkTab) under the Project section.

3. On the Networks screen, click the network associated with the port you want to rename.

4. In the Actions column, click **Edit Port** for your the port you are changing. 

5. In the Edit Port screen, enter a new name and click **Save**
	<br><img src="media/network-port-edit.png"  alt="" />


###How to assign a router to an external network### {#AssignRouter}

1. Login to the [Horizon Console](https://horizon.hpcloud.com/).

2. Select the [Routers tab](#NetworkTab) under the Project section.

3. On the Routers screen, locate the network which you want to rename.

4. In the Actions column, click **Set Gateway** for your the network. 

5. In the Set Gateway screen, select a network from the **External Network** list and click **Set Gateway**
	<br><img src="media/network-gateway.png"  alt="" />

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

### How to delete a network ### {#DeleteCLI}

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

### How to rename a network ### {#RenameNetCLI}

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

### How to edit a sub-net### {#EditSubCLI}

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


### How to rename a port### {#RenamePortCLI}

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

### How to assign a router to a network ### {#AssignRouterCLI}

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
