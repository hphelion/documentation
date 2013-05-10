---
layout: page
title: "Management console: Creating and deleting a subnet"
permalink: /mc/compute/networks/create-subnet/
product: mc-compute

---
# Management console: Creating and deleting a subnet

This page covers how to create and delete a subnet using the networks screen of the management console (MC).  This page covers the following topics:

* [Before you begin](#Overview)
* [Creating a network](#Creating)
* [Deleting a network](#Deleting)
* [For further information](#ForFurtherInformation)


##Before you begin## {#Overview}

Before you can create or delete a subnet of an existing network, you must:

* [Sign up for an HP Cloud compute account](https://account.hpcloud.com/signup)
* [Activate compute service on your account](/mc/account/using/activating/)
* [Create a network](/mc/compute/networks/create-network/)


##Creating a subnet## {#Creating}

By default, when you [create a network](/mc/compute/networks/create-network/), that network is created with no subnets.  

<img src="media/compute-networks05.jpg" width="580" alt="" />

To create a subnet, in the `Manage` column, select the `Options` button for the network for which you want to create a subnet and select `Create Subnet`:

<img src="media/compute-networks06.png" width="580" alt="" />

This launches the subnet creation screen.  

<img src="media/create-subnet.png" width="580" alt="" />

In the subnet creation screen, in the `Subnet Info` pane, enter a name for your subnet in the `Name` text-entry field, the network address for the subnet in the `Network Address` field, (optionally) a Gateway IP address in the `Gateway IP` field (if you want to assign a specific Gateway IP rather than use the default), and click the `Create Subnet` button.  You are returned to the networks screen and your new subnet is displayed in the `Subnets` column:

<img src="media/compute-networks06.png" width="580" alt="" />

You can also create a subnet from the [network details](/mc/compute/networks/view-network/) screen.

<img src="media/compute-networks10.png" width="580" alt="" />

In the network details screen, just click the `Create Subnet` button.  This launches the subnet creation screen as outlined above; follow the same process from there.


##Deleting a subnet## {#Deleting}

By default, when you [create a network](/mc/compute/networks/create-network/), that network is created with no subnets. If you used the subnet creation screen [create a subnet](/mc/compute/networks/create-subnet#Creating) to create a subnet that you now want to delete, click the subnet you want to delete:

<img src="media/compute-networks07.png" width="580" alt="" />

This launches the subnet information screen.

<img src="media/compute-networks08.png" width="580" alt="" />

To delete the subnet, click the `Delete Subnet` button.  A verification window appears asking if you want to delete this network:

<img src="media/delete-verify-subnet.png" width="580" alt="" />

Select the button `Yes, delete this subnet`.  Your subnet is deleted and no longer appears in the list in the `Subnets` column on the [networks screen](/mc/compute/networks/).

You can also launch the subnet details screen from the [network details](/mc/compute/networks/view-network/) screen.

<img src="media/compute-networks10.png" width="580" alt="" />

Just click the subnet name for the subnet you want to delete, and then follow the process outlined above. 


##For further information## {#ForFurtherInformation}

* For information about the subnet details screen, take a look at the [Viewing subnet details](/mc/compute/networks/view-subnet/) page
* For basic information about our HP Cloud compute services, take a look at the [HP Cloud compute overview](/compute/) page
* Use the MC [site map](/mc/sitemap) for a full list of all available MC documentation pages
* For information about the Open Stack networking ("Quantum") features, surf on over to  [their Quantum wiki](https://wiki.openstack.org/wiki/Quantum)
