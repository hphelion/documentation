---
layout: page
title: "Compute dashboard network screen"
permalink: /mc/compute/networks/
product: mc-compute

---
# Compute dashboard networks screen

The management console (MC) compute dashboard networks screen allows you to view and manipulate compute instance networks.  This page covers the following topics:

* [Networks screen overview](#Overview)
* [Networks screen functions](#Functions)
* [For further information](#ForFurtherInformation)

**Note**: This is the OpenStack "Quantum" functionality; for more information, you might look at [their Quantum wiki](https://wiki.openstack.org/wiki/Quantum).


##Networks screen overview## {#Overview}

The images screen displays your compute instance networks information for the availability zone (AZ) you have selected.

<img src="media/compute-networks00.png" width="580" alt="" />

The name, ID, subnets, admin state, and status of the networks are displayed.  You can sort your list of networks based on a particular identifier by just clicking the column heading.  For example, if you want to sort the list by ID, just click the `ID` column header.  

Clicking the `+ Create Network` button launches the [network creation screen](/mc/compute/networks/create-network) screen.  Clicking the `Options` button in the `Manage` column allows you to perform a number of functions on that network:

<img src="media/compute-networks01.png" width="580" alt="" />

* [Create a subnet](/mc/compute/networks/manage-subnet#Creating/) for that network
* [Disable](/mc/compute/networks/enable-network#Disabling/) the network
* [Delete](/mc/compute/networks/create-network#Deleting/) the network
* [Displaying](/mc/compute/networks/view-network/) details for the network


##Networks screen functions## {#Functions}

From the networks screen you can perform any of the following functions:

* [Creating and deleting a network](/mc/compute/networks/create-network/)
* [Managing a subnet](/mc/compute/networks/manage-subnet/)
* [Adding and deleting an instance to a router](/mc/compute/networks/manage-router/)
* [Viewing network details](/mc/compute/networks/view-network/)
* [Viewing subnet details](/mc/compute/networks/view-subnet/)
* [Viewing router details](/mc/compute/networks/view-router/)

<!-- * [Understanding network system messages](/mc/compute/networks/sys-messages/)-->


##For further information## {#ForFurtherInformation}

* For basic information about our HP Cloud compute services, take a look at the [HP Cloud compute overview](/compute/) page
* Use the MC [site map](/mc/sitemap) for a full list of all available MC documentation pages
