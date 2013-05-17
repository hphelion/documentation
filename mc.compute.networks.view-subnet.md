---
layout: page
title: "Management console: Viewing subnet details"
permalink: /mc/compute/networks/view-subnet/
product: mc-compute

---
# Management console: Viewing subnet details

This page covers how to view subnet details using the networks screen of the management console (MC).  This page covers the following topics:

* [Before you begin](#Overview)
* [Accessing the subnet details screen](#Accessing)
* [Contents of the subnet details screen](#Organization)
* [For further information](#ForFurtherInformation)


##Before you begin## {#Overview}

Before you can view the details of a subnet of an existing network, you must:

* [Sign up for an HP Cloud compute account](https://account.hpcloud.com/signup)
* [Activate compute service on your account](/mc/account/using/activating/)
* [Create a network](/mc/compute/networks/create-network#Creating/)
* [Create a subnet](/mc/compute/networks/manage-subnet#Creating/)


##Accessing the subnet details screen## {#Accessing}

The easiest way to access the subnet details screen is from the from the [network screen](/mc/compute/networks).  In the `Networks` list, in the `Subnets` column, click the subnet for which you want to access the details.

<img src="media/subnet-details-launch0.png" width="580" alt="" />
 
You can also launch the subnet details screen from the network details screen.  In the network details screen, in the `Manage` column, you can click the `Options` button and select the `Subnet Details` option.

<img src="media/subnet-details-launch1.png" width="580" alt="" />

You can also launch the subnet details screen from the network details screen by, in the `Subnets` pane clicking the subnet name for which you want details.

##Contents of the subnet details screen## {#Organization}

The subnet details screen lists all the information for the subnet:  Name, network address, gateway IP address, DHCP status (enabled or disabled), the allocation pool information (if any allocation pools exist), DNS servers, and host routes.

<img src="media/subnet-details.png" width="580" alt="" />

The subnet details screen provides you access to the following functions:

* [Editing the subnet information](/mc/compute/networks/manage-subnet#Editing)
* [Enabling and disabling DHCP](/mc/compute/networks/manage-subnet#DHCP)
* [Deleting the subnet](/mc/compute/networks/manage-subnet#Deleting)


##For further information## {#ForFurtherInformation}

* For basic information about our HP Cloud compute services, take a look at the [HP Cloud compute overview](/compute/) page
* Use the MC [site map](/mc/sitemap) for a full list of all available MC documentation pages
* For information about the Open Stack networking ("Quantum") features, surf on over to  [their Quantum wiki](https://wiki.openstack.org/wiki/Quantum)
