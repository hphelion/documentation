---
layout: default
title: "Management console: Managing ports"
permalink: /mc/compute/network/manage-ports/
product: mc-compute

---
# Management console: Managing ports #

With the default network configuration the instance you create will also create a port automatically for you, with an IP assigned from your subnet, and attach it to your default network.

<!--What is this port? -->

A port represents a virtual switch port on a logical network switch. Virtual instances attach their interfaces into ports. The logical port also defines the MAC address and the IP address(es) to be assigned to the interfaces plugged into them.

When IP addresses are associated to a port, this implies the port is associated with a subnet, as the IP address was taken from the allocation pool for a specific subnet.

You create ports automatically when you create a subnet or a router.
Create network with a subnet (DHCP port)
Add subnet to existing network (DHCP port)
Create router

<br><img src="media/network-fields.png"  alt="" />

This page covers how to create and delete a port using the networks screen of the management console (MC).  This page covers the following topics:

* [Before you begin](#Overview)
* [Enabling a port](#Enabling)
* [Disabling a router](#Disabling)
* [For further information](#ForFurtherInformation)


##Before you begin## {#Overview}

Before you perform any network management on your routers, you must:

* [Sign up for an HP Cloud compute account](https://account.hpcloud.com/signup)
* [Activate compute service on your account](https://community.hpcloud.com/article/getting-started-compute-135#actservice)
* [Create a network](/mc/compute/networks/create-network/)

<!--When cloudadmin tool deployed, add a link to it here?-->
<!--Include a link to the CLI process for creating a router here as well?-->

### How to create a port ###

1. On the 13.5 instance, launch a Windows PowerShell window.  

	Select the shell appropriate to your system, either the 64-bit or 32-bit version. 

2. Enter the HP Cloud environment CLI by entering:

	`PS C:> cd HPCS:`

3. Create a new network by executing the following command, using the appropriate values:

	`new-port -n Name - asu AdminStateUp -nid NetworkID -did PortsDeviceID`

	Where:
	`n` - The port name.
	
	`asu` - Determines if the `AdminStateUp` flag is true or false.

	`nid` - Identifies Port Network.

	`did`	- Identifies Port Device.

	The following example creates a new port named `testPort1` on network `bd1c30f7-71f1-455e b91e-8d03da7f5224`. 

	new-port "testPort1" -nid bd1c30f7-71f1-455e b91e-8d03da7f5224 -asu -did "sdf\etc" 





##For further information## {#ForFurtherInformation}

* For information about the router details screen, take a look at the [Viewing router details](/mc/compute/networks/view-router/) page
* For basic information about our HP Cloud compute services, take a look at the [HP Cloud compute overview](/compute/) page
* Use the MC [site map](/mc/sitemap) for a full list of all available MC documentation pages
* For information about the Open Stack networking features, surf on over to [their networking wiki](https://wiki.openstack.org/wiki/Quantum)
