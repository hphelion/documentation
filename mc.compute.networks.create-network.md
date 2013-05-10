---
layout: page
title: "Management console: Creating and deleting a network"
permalink: /mc/compute/networks/create-network/
product: mc-compute

---
# Management console: Creating and deleting a network

This page covers how to create and delete a network using the networks screen of the management console (MC).  This page covers the following topics:

* [Before you begin](#Overview)
* [Creating a network](#Creating)
* [Deleting a network](#Deleting)
* [For further information](#ForFurtherInformation)


##Before you begin## {#Overview}

Before you can begin creating or deleting a network, you must:

* [Sign up for an HP Cloud compute account](https://account.hpcloud.com/signup)
* [Activate compute service on your account](/mc/account/using/activating/)


##Creating a network## {#Creating}

To create a network, click the `+ Create Network` button in the [networks screen](/mc/compute/networks/):

ILLUSTRATION TBD

This launches the network creation screen.

<img src="media/create-network.png" width="580" alt="" />

In the network creation screen, in the `Network Info` pane, enter a name for your network in the `Name` text-entry field anc click the `Create` button.  Your new network is created and assigned an IP address.  This new network appears in the list on the main networks screen.  (To return to the main networks screen, just click the `Networks` item in the menu bar.)


##Deleting a network## {#Deleting}

To delete an existing network, in the `Manage` column of the `Networks` list, select the `Options` button in the row of the network you want to delete, and choose the `Delete` option.

<img src="media/delete-network.png" width="580" alt="" />

A verfication window appears asking if you want to delete this network:

<img src="media/delete-verify.png" width="580" alt="" />

Select the button `Yes, delete this network`.  Your network is deleted and no longer appears in the list on the [networks screen](/mc/compute/networks/).


##For further information## {#ForFurtherInformation}

* For basic information about our HP Cloud compute services, take a look at the [HP Cloud compute overview](/compute/) page
* Use the MC [site map](/mc/sitemap) for a full list of all available MC documentation pages
* For information about the Open Stack networking ("Quantum") features, surf on over to  [their Quantum wiki](https://wiki.openstack.org/wiki/Quantum)
