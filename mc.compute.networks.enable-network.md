---
layout: default
title: "Management console: Enabling and disabling a network"
permalink: /mc/compute/networks/enable-network/
product: mc-compute

---
# Management console: Enabling and disabling a network

This page covers how to create and delete a network using the networks screen of the management console (MC).  This page covers the following topics:

* [Before you begin](#Overview)
* [Enabling a network](#Enabling)
* [Disabling a network](#Disabling)
* [For further information](#ForFurtherInformation)


##Before you begin## {#Overview}

Before you can enable or disable networks, you must:

* [Sign up for an HP Cloud compute account](https://account.hpcloud.com/signup)
* Activate compute service on your account
* [Create a network](/mc/compute/networks/create-network/)


##Enabling a network## {#Enabling}

By default, when you [create a network](/mc/compute/networks/create-network#Creating/), that network is created in an enabled admin state.  

<img src="media/compute-networks03.jpg" width="580" alt="" />

If you have at some point [disabled](#Disabling) a network and want to enable it, in the `Manage` column of the `Networks` list, select the `Options` button and choose the `Enable` option.

<!-- Illustration of "Enable" option being selected needed here -->

##Disabling a network## {#Disabling}

By default, when you [create a network](/mc/compute/networks/create-network#Creating/), that network is created in an enabled admin state.  If you want to disable your network, in the `Manage` column of the `Networks` list, select the `Options` button and choose the `Disable` option.

<img src="media/compute-networks04.jpg" width="580" alt="" />


##For further information## {#ForFurtherInformation}

* For basic information about our HP Cloud compute services, take a look at the [HP Cloud compute overview](/compute/) page
* Use the MC [site map](/mc/sitemap) for a full list of all available MC documentation pages
* For information about the Open Stack networking features, surf on over to [their networking wiki](https://wiki.openstack.org/wiki/Quantum)
