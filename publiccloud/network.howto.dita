---
layout: public-cloud
title: "How To's with the Network Service"
permalink: /publiccloud/compute/network/howto/
product: compute
published: false

---
<!--PUBLISHED-->
# How To's with HP Helion Public Cloud Networking version 13.5

<!-- Modeled after How To's with the Compute Service (https://docs.hpcloud.com/compute/using/) Some text from network guide. -->

You might need to modify the default network or create additional networks.  This page gives you some how-to's to use the [Horizon Cloud Console](#console) or [HP Helion Public Cloud CLI for Windows PowerShell](#powershell) to perform the following tasks:  

- Creating and deleting networks
- Enabling and disabling networks
- Specifying an IP address for a network
- Attaching a network to the router
- Renaming a network
- Enabling or disabling a port
- Editing a sub-net
- Renaming network objects

## Before you begin ## {#Overview}

If you have not previously created an account and activated the compute service please sign up at [http://hpcloud.com](http://hpcloud.com).  

If you prefer to use the [HP Helion Public Cloud CLI for Windows PowerShell](/publiccloud/cli/windows/installation/) make sure the CLI is installed and you have sufficient access permissions.

#### Assigning access permission to services #### {#access}

The user who will be working with the network must have the proper user access to the Compute and Networking services. Specifically, the user needs to have Compute Admin and Network Admin permission. 

For information on users, groups, and roles, see [Managing Account Users](https://community.hpcloud.com/article/managing-account-users).


## Using the Horizon Cloud Console ## {#console}

You can use the Horizon Cloud Console to perform the following tasks:

- [Create a network and subnet](#Creating)
- [Delete a network](#Deleting)
- [Enable or disable a network](#Enabling)
- [Specify an IP address for a network](#IPUI)
- [Connect a network to the router](#ConnectRouter)
- [Disconnect a network from the router](#DisconnectRouter)
- [Enable or disable a port](#EnablePort)
- [Rename a network object](#RenameNet)

All of the procedures in this section require that you [be able to access](#access) the Networks or Routers tab in the Project section of the Horizon Cloud Console, <a name="NetworkTab"></a>as shown:
   <br /><img src="media/network-tab-crop.png"  alt="" />

### How to create a network and subnet ### {#Creating}

To create a network and subnet, use the following steps:

1. Login to the [HP Helion Public Cloud Console](https://horizon.hpcloud.com/).

2. Select the [Networks tab](#NetworkTab) under the Project section.

3. Click **Create Network**. 
	<br /><img src="media/compute-network-new-network-create.png"  alt="" />

4. On the **Network** tab, 
	<br /><img src="media/compute-network-new-network.png"  alt="" />
	- Enter a name for the network.
	- Leave the **Admin State** selected to launch the network in the enabled state or clear the field to disable the new network.  

6. Click **Next** to configure a subnet for the network. 

7. On the **Subnet** tab: 
	<br /><img src="media/compute-network-new-network-sub.png"  alt="" />
	- Enter the subnet name.
	- Enter a network address range for the subnet in CIDR (Classless Inter-Domain Routing) format in the **Network Address** field,  for example: 192.168.0.0/24.
	- Select IPv4 or IPv6, as appropriate, in the **IP Version** field.
	- Enter a gateway IP address from the subnet or leave the **Gateway IP** field blank to use the default value for the gateway IP address; for example, 192.168.0.1 for 192.168.0.0/24.
	- Leave **Disable Gateway** clear to enable the network gateway for this network, or select  **Disable Gateway** to disable the network. You will not be able to connect this network to the router if the gateway is disabled. 
 
8. Click **Next**. 

9. On the **Subnet Details** tab:
	<br /><img src="media/compute-network-new-network-sub-det.png"  alt="" />
	- Clear the **Enable DHCP** option, as needed, to not use the network as a DCHP. DHCP is enabled by default.
		If enabled, the subnet will serve as your DHCP server. Instances associated with the subnet will be assigned an IP address from this pool. . 
	- Optionally, enter the starting and ending IP addresses you want for your DHCP allocation pool in the **Allocation Pools** field, in the format IP_ADDR,IP_ADDR. For example: `192.168.1.10,192.168.1.120`.
		By deafult, the server has an application pool starting with 10.0.0.0/24.  
	- Optionally, enter the `IP Address` of your subnet in the **DNS Name Servers** field.
		If blank, your subnet will default to using HP's internal DNS which uses DNSMASQ.
	- Optionally, enter the `Destination CIDR` and `Next Hop` for your subnet in the **Host Routes** field to create host routes.  

10. Click **Create**. 


### How to delete a network ### {#Deleting}

You can delete a network, as needed. Before deleting a network, you must [disable any network ports](#EnablePort) and [delete any interface to the router](#DisconnectRouter).

1. Login to the [Horizon Console](https://horizon.hpcloud.com/).

2. Select the [Networks tab](#NetworkTab) under the Project section.

3. On the Networks screen, locate the network which you want to delete.

4. In the Actions column, click **More** > **Delete Network** for your the network. 
	<br /><img src="media/network-delete.png"  alt="" />

5. In the confirmation dialog, click **Delete Network**.


### How to enable or disable a network ### {#Enabling}

By default, when you [create a network](#Creating), that network is created in an enabled admin state.  

You can to disable a port or enable a network as follows:

1. Login to the [Horizon Console](https://horizon.hpcloud.com/).

2. Select the [Networks tab](#NetworkTab) under the Project section.

3. On the Networks screen, locate the network which you want to enable.

4. In the Actions column, click **Edit Network** for your the network. 

5. In the Edit Network screen:
	- select the **Admin State** option to enable the network
	- clear the **Admin State** option to disable the network
	<br /><img src="media/network-enable.png"  alt="" />

6. Click **Save Changes**.

### How to specify a specific IP address ### {#IPUI}

The Networking service allows you to choose your own IP addressing scheme, even if your IP addresses overlap with other projects. 

The only time you can specify an address for a network is when you create the network. After the network is created, you cannot change the IP address. 

See [How to create a network](#Creating).


### How to connect a network to the router ### {#ConnectRouter}

A network connects to the router through an *interface*. You must create an interface between the network and router to remotely connect to the network and any instances on that network through the router.

You connect the network to the router as follows:

1. Login to the [Horizon Console](https://horizon.hpcloud.com/).

2. Select the [Routers tab](#NetworkTab) under the Project section.

3. On the Routers screen, click the name of the router.

4. On the Router Overview screen, click **Add Interface**.

5. In the **Subnet** field, select the network to connect.

6. Optionally, enter an IP address for the interface from the subnet IP address pool. If you do not specify an address, an address will be assigned from the pool.

7. Click **Add Interface**.

### How to disconnect a network from the router ### {#DisconnectRouter}

A network connects to the router through an *interface*. 

You disconnect a network by removing the interface, as follows:

1. Login to the [Horizon Console](https://horizon.hpcloud.com/).

2. Select the [Routers tab](#NetworkTab) under the Project section.

3. On the Routers screen, click the name of the router.

4. On the Router Overview screen, locate the interface to the network you want to disconnect and click **Delete Interface**.

5. In the confirmation dialog, click **Delete Interface**.


### How to enable or disable a port ### {#EnablePort}

When a port is created, it is enabled by default. You can to disable a port or enable a port, as needed.

To enable or disable a port: 

1. Login to the [Horizon Console](https://horizon.hpcloud.com/).

2. Select the [Networks tab](#NetworkTab) under the Project section.

3. On the Networks screen, click the network associated with the port you want to modify.

4. In the Actions column, click **Edit Port** for your the port you are changing. 

5. In the Edit Port screen:
	- select **Admin State** to enable the port
	- clear **Admin State** to disable the port

	<br /><img src="media/network-port-edit.png"  alt="" />

6. Click **Save Changes**.

### How to rename objects ### {#RenameNet}

You can change the name of many of the items on the Network screens, as follows:

1. Login to the [Horizon Console](https://horizon.hpcloud.com/).

2. Select the [Networks tab](#NetworkTab) under the Project section.

3. Locate the object which you want to rename.

4. In the Actions column, click the **Edit** button for the object you are modifying. 

5. In the edit screen, if the name field is available, enter a new name and click the save button. If the name field is not available, you cannot change the name. 
	


## Using the Windows PowerShell ## {#powershell}

The HP Helion Public Cloud environment command-line interface (CLI) software for Windows PowerShell allows Windows users to manage their HP Helion Public Cloud services from the command line.

To use the [HP Helion Public Cloud CLI for Windows PowerShell](/publiccloud/cli/windows/installation/) make sure the CLI is installed and you have sufficient access permissions.

You need to install and use the CLI on a system configured to access the project associated with the network you want to work with. The installation instructions show how to configure the CLI to interact with a specific project. 

You can use the Windows PowerShell CLI to perform the following tasks:  

- [Create a network](#CreatingCLI)
- [Delete a network](#DeleteCLI)
- [Specify an IP address for a network](#IPCLI)
- [Connect a network to the router](#ConnectRouterCLI)
- [Disconnect a network from the router](#DisconnectRouterCLI)
- [Rename a network](#RenameNetCLI)
- [Edit a sub-net](#EditSubCLI)
- [Rename a port](#RenamePortCLI)

For the full reference of supported HP Helion Public Cloud CLI commands for Windows PowerShell, see [HP Helion Public Cloud Environment CLI Software for Windows PowerShell Command Line Reference](/publiccloud/cli/windows/reference/). 

### How to create a network ### {#CreatingCLI}

1. On a system configured to access the project, launch a Windows PowerShell window.  

	Select the shell appropriate to your system, either the 64-bit or 32-bit version. 

2. Enter the HP Helion Public Cloud environment CLI by entering:

	`cd HPCS:`

3. Create a new network by executing the following command, using the appropriate values:
	
	`new-network -n - asu` 

	Where
	
		n - The name to assign to the new network.

		asu - Creates the network in the active state (Admin status up).

	The following example creates a network called Newtwork1.

		new-network -n Network1 -asu 


### How to delete a network ### {#DeleteCLI}

1. On a system configured to access the project, launch a Windows PowerShell window.  

	Select the shell appropriate to your system, either the 64-bit or 32-bit version. 

2. Enter the HP Helion Public Cloud environment CLI by entering:

	`cd HPCS:`

3. Delete a network by executing the following command, using the appropriate values:

	`remove-network -id -all`

	Where
	
		id - The numeric ID of the network to delete. Do not use the network name. 

		all - Removes all networks in the current availability-zone associated with your project.

	The following example deletes a network with the specified ID

		remove-network -id 12857174-99cf-40e9-999e-fb0fa2e84898  


### How to specify a specific IP address ### {#IPCLI}

The Networking service allows you to choose your own IP addressing scheme, even if your IP addresses overlap with other tenants. 

The only time you can specify an address for a network is when you create the network. After the network is created, you cannot change the IP address. 

See [How to create a network](#CreatingCLI). 


### How to connect a network to the router ### {#ConnectRouterCLI}

A network connects to the router through an *interface*. You must create an interface between the network and router to remotely connect to the network and any instances on that network through the router.

You connect the network to the router as follows:

1. On a system configured to access the project, launch a Windows PowerShell window.  

	Select the shell appropriate to your system, either the 64-bit or 32-bit version. 

2. Enter the HP Helion Public Cloud environment CLI by entering:

	`cd HPCS:`

3. Create an interface between the router and a network, using the appropriate values:
	
	`new-routerinterface`

	Where

		rid - The numeric ID of the router. Do not use the router name.

		sid - The numeric ID of the subnet. Do not use the router name.

		pid - The numeric ID of the port. Do not use the router name.

	The following example creates an interface between the router and the specified port on a network.

		new-routerinterface -rid bd1c30f7-71f1 -pid c9e32588-5b69 -sid 7yuu9886-5b69-4100


### How to disconnect a network from the router ### {#DisconnectRouterCLI}

A network connects to the router through an *interface*. 

You disconnect a network as follows:

1. On a system configured to access the project, launch a Windows PowerShell window.  

	Select the shell appropriate to your system, either the 64-bit or 32-bit version. 

2. Enter the HP Helion Public Cloud environment CLI by entering:

	`cd HPCS:`


3. Delete the interface between the router and a network, using the appropriate values:
	
	`remove-routerinterface`

	Where

		id - The numeric ID of the router. Do not use the router name.

		sid - The numeric ID of the subnet. Do not use the router name.

	The following example deletes the interface on the router.

		remove-routerinterface -rid bd1c30f7-71f1 -sid 7yuu9886-5b69-4100 

### How to rename a network ### {#EditNetCLI}

You define the name of a network when you create the network. If, at a later time, you can change the name, as needed.

To change the name of a network:

1. On a system configured to access the project, launch a Windows PowerShell window.  

	Select the shell appropriate to your system, either the 64-bit or 32-bit version. 

2. Enter the HP Helion Public Cloud environment CLI by entering:

	`cd HPCS:`

3. Rename the network using the appropriate values:
	
	`update-network -id -n`

	Where

		id - The numeric ID of the router. Do not use the router name.

		n - The new name for the network.

	The following example renames the network to Network1.

		update-network -id 12857174-99cf-40e9 -n "Network1" 

	
### How to edit a sub-net### {#EditSubCLI}

You can modify a sub-net to rename the sub-net or change the external gateway assigned to the sub-net.

1. On a system configured to access the project, launch a Windows PowerShell window.  

	Select the shell appropriate to your system, either the 64-bit or 32-bit version. 

2. Enter the HP Helion Public Cloud environment CLI by entering:

	`cd HPCS:`

3. Modify the sub-net by executing the following command, using the appropriate values:
	
	update-subnet -id  -egw - n 

	Where

		id - The numeric ID of the subnet to modify. Do not use the subnet name.

		egw - The external gateway network ID to assign.

		n - The new name for the sub-net.

	The following example reassigns the subnet to the designated external network and renames the sub-net to "NewSubnetName":

	update-Subnet -id 12857174-99cf-40e9-999e-fb0fa2e84898 -egw 129.15.124.12 -n "NewSubnetName" 


### How to rename a port### {#RenamePortCLI}

By default, when a port is created, the port is automatically assigned a name and ID. For example, when you create a subnet, a port is created for that subnet. 

You can change the name of a port, as needed.

1. On a system configured to access the project, launch a Windows PowerShell window.  

	Select the shell appropriate to your system, either the 64-bit or 32-bit version. 

2. Enter the HP Helion Public Cloud environment CLI by entering:

	`cd HPCS:`

3. Change the port name by executing the following command, using the appropriate values:
	
	update-port  -id -did 

	Where

		id - The numeric ID of the port to rename. Do not use the port name.

		did - The new name for the port.

	The following example renames the specified port to port1:

	update-Port -id 12857174-99cf-40e9-999e-fb0fa2e84898 -did "port1" 

##For further information## {#ForFurtherInformation}

* For information about the router details screen, take a look at the [Viewing router details](/publiccloud/mc/compute/networks/view-router/) page.
* For basic information about our HP Helion Public Cloud compute services, take a look at the [HP Helion Public Cloud compute overview](/publiccloud/compute/) page.
* For a list of issues and workarounds for working with the Networking service, see [Known Issues and Workarounds with the Networking Service](/publiccloud/compute/network/known-issues/).
* Use the [documentation site map](/publiccloud/mc/sitemap) for a full list of all available MC documentation pages
* For information about the Open Stack networking features, surf on over to [their networking wiki](https://wiki.openstack.org/wiki/Quantum)
