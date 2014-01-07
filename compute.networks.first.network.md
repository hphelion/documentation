---
layout: default
title: "Creating Your First Network - 13.5"
permalink: /compute/networks/first-network/
product: compute

---
# Creating Your First Network - 13.5 #

<!-- Modeled after How To's with the Compute Service (https://docs.hpcloud.com/compute/using/) Some text from network guide. -->

Once you are ready to create your first network, you can choose from a variety of ways depending on which tool you feel most comfortable with. 
 
You can use the the Horizon Cloud Console or Windows PowerShell to create the network. 

- [Using the Horizon Cloud Console](#console)
- [Using the Windows PowerShell](#powershell)

## Using the Horizon Cloud Console ## {#console}

You can use the Horizon Cloud Console to perform the following tasks:

* Create a network
* Manage a network
* Delete a network
* View network, subnet, and router details

### Creating a network ###

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

### Adding a sub-network ###

1. Login to the [Horizon Console](https://horizon.hpcloud.com/).

2. Select the Networks tab under the Project section:
    <br><img src="media/network-new.png"  alt="" />

3. On the Networks screen, locate the network to which you want to add a subnet.

4. In the Actions column, click **More** -> **Add Subnet** for your the network. 
	<br><img src="media/network-delete.png"  alt="" />

5. Enter the following values, as appropriate:
	<br><img src="media/network-fields-sub.png"  alt="" />

6. Enter the following values, as appropriate:
	<br><img src="media/network-fields-sub-2.png"  alt="" />

7. Click **Create**.


See [the MC networking pages](/mc/compute/networks/) for more information about setting up networking using the MC.

## Using the Windows PowerShell ## {#powershell}

The HP Cloud environment command-line interface (CLI) software for Windows PowerShell allows Windows users to manage their HP Cloud services from the command line.

### How to create a network ###

1. On the 13.5 instance, launch a Windows PowerShell window.  

	Select the shell appropriate to your system, either the 64-bit or 32-bit version. 

2. Enter the HP Cloud environment CLI by entering:

	`PS C:> cd HPCS:`

3. Create a new network by executing the following command, using the appropriate values:

	`new-network -n Name - asu AdminStateUp`

	Where:

		n - The name of new Network.

		asu - Determines if the `AdminStateUp` flag is true or false.

	The following example creates a new network named `testNet1` with AdminStateUp set to `true`.
	
		new-network "testNet1" -asu 

### How to create a sub-network ###

1. On the 13.5 instance, launch a Windows PowerShell window.  

	Select the shell appropriate to your system, either the 64-bit or 32-bit version. 

2. Enter the HP Cloud environment CLI by entering:

	`PS C:> cd HPCS:`

3. Create a new network by executing the following command, using the appropriate values:

	`new-subnet -nid NetworkID -ipv IPVersion -c CIDRValue -a AllocationPools`

	Where:

		nid - Subnet name.

		ipv - Sets the IP Version

		c - CIDR value.

		a - Lists Allocation Pools, separating them by commas.

	The following example creates a new subnet called `testSubnet`.

		new-subnet -n testSubnet -nid bd1c30f7-71f1-455e-b91e-8d03da7f5224 -ipv 4 -c "10.0.6.0/24" -a "10.0.6.20", "10.0.6.22" , "10.0.6.26", "10.0.6.29" 

### How to create a port ###

1. On the 13.5 instance, launch a Windows PowerShell window.  

	Select the shell appropriate to your system, either the 64-bit or 32-bit version. 

2. Enter the HP Cloud environment CLI by entering:

	`PS C:> cd HPCS:`

3. Create a new network by executing the following command, using the appropriate values:

	`new-port -n Name - asu AdminStateUp -nid NetworkID -did PortsDeviceID`

	Where:
	
		n - The port name.
	
		asu - Determines if the `AdminStateUp` flag is true or false.

		nid - Identifies Port Network.

		did - Identifies Port Device.

	The following example creates a new port named `testPort1` on network `bd1c30f7-71f1-455e b91e-8d03da7f5224`. 

		new-port "testPort1" -nid bd1c30f7-71f1-455e b91e-8d03da7f5224 -asu -did "sdf\etc" 

##For further information## {#info} 

Check out the following pages for more information on using HP Cloud Networking services:

- [Known Issues and Best Practices in Compute and Networking in 13.5](https://community.hpcloud.com/article/known-issues-and-best-practices-compute-and-networking-135)
- [Getting Started with Compute 13.5](https://community.hpcloud.com/article/getting-started-compute-135)
- [Management console: Networks screen](http://docs.hpcloud.com/mc/compute/networks/)
- [UNIX CLI for HP Documentation](http://docs.hpcloud.com/cli/unix)
- [OpenStack networking wiki](https://wiki.openstack.org/wiki/Quantum)