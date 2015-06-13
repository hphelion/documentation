---
layout: public-cloud
title: "Getting Started with HP Helion Public Cloud Networking"
permalink: /publiccloud/compute/network/getting-started
product: compute
published: false

---
<!--PUBLISHED-->
# Getting Started with HP Helion Public Cloud Networking #

<!-- modeled after HP Helion Public Cloud version 13.5 overview; text from networking guide (compute.network-guide.md) -->

Leveraging [OpenStack Networking](http://www.openstack.org/software/openstack-networking/), HP Helion Public Cloud Networking is a virtual networking service that provides network connectivity and addressing for HP Helion Public Cloud Compute devices. 

In the 13.5 release, Compute and Networking services are separate entities, integrating services and providing new features. 

You can use the default network to deploy Compute virtual servers, or modify the default network to expand networking capabilities.

You can now define and configure your own virtual network topology, including control of IP address ranges.

This page covers the following topics:

* [Using the Default Network Configuration](#Overview)
* [Customizing your Configuration](#customize)
* [Using VPN](#vpn)
* [Using Security Groups](#security)
* [Using Regions and Availability Zones](#az)
* [For further information](#info)

For more details on how to work with your network, see [HP Helion Public Cloud Networking: Quick start guide](/publiccloud/compute/network/quick-start/) or [How To's with HP Helion Public Cloud Networking version 13.5](/publiccloud/compute/network/howto/).

##Using the Default Network Configuration## {#default}

A default configuration comes with Compute activation and includes:

* A network 
* A subnet
* A router connecting the subnets to the Internet
* A security group with basic server options

You can use the default network without modification. You can also configure other network topologies and attach virtual devices to ports on these networks. You can create multiple private networks and choose your own IP addressing scheme, enabling complex networking such as building multi-tiered web applications and application migration to the Cloud without changing IP addresses.

For a high level understanding of the default Network topology in Compute 13.5, see [Understanding Network Topology in 13.5](https://community.hpcloud.com/article/understanding-network-topology-135). 

For more specific questions, use the [Knowledge Base](https://community.hpcloud.com/search/knowledge/network	) or [Forums](https://community.hpcloud.com/search/forum/network) where you can learn from our own internal experts as well as other users in the HP Helion Public Cloud community.


##Customizing your Configuration## {#customize}

You can customize the default network using the [HP Helion Public Cloud Management Console](#console), the (HP Helion Public Cloud Networking API)[#API], the [HP Helion Public Cloud CLI](#cli), or our [language bindings](#bindings). 

Customizing a network enables you to create and manage the networks your virtual servers connect to.

The Networking service expands networking capabilities, allowing you to perform many tasks, including:

- Viewing network and router details
- Creating and deleting a network
- Managing a subnet
- Adding and deleting an interface to a router
- Setting up an IPsec, or site-to-site, VPN
- Configuring security group parameters that define the firewall rules for virtual servers
- Allocating and managing public floating IP addresses

You can expand your network up to the following per-domain maximums:

* 5 Networks
* 5 Subnets
* 70 Ports
* 45 Floating IP addresses
* 1 Router
* 10 Security Groups 
* 50 Security Group Rules

For more information on modifying the default network and creating additional networks, see either [HP Helion Public Cloud Networking: Quick start guide](/publiccloud/compute/network/quick-start/) or [Quick Start Guide](https://community.hpcloud.com/article/hp-helion-public-cloud-quick-start-guide) in the HP Helion Public Cloud community.

## Accessing the Networking service ##

There are a  number of tools that you can use to access and manage the Networking service.

###Using the console to access Networking### {#console}

You can use the HP Helion Public Cloud console to access the Networking service. For more information on using the console, see [Getting Started with HP Helion Public Cloud Console](/publiccloud/hpcloudconsole).


###Using the API to access Networking### {#API}
 
You can use a low level, raw REST API to access Compute services. For more information on using the Networking API, see [HP Helion Public Cloud Networking API Specifications](/publiccloud/api/networking).

###Using the CLI### {#cli}


You can use any of several command-line interface software to access Compute services. For more information on using the Networking CLI, see [HP Helion Public Cloud CLI](/publiccloud/cli/).

###Using language bindings### {#bindings}

You can use any of several language bindings to access Compute services. For more information on using the Networking bindings, see [HP Helion Public Cloud binding support](/publiccloud/bindings/).

##Using VPN with the Networking service## {#vpn}

With the Networking service you can set up an IPsec, or site-to-site, VPN connecting your external network directly to your HP Helion Public Cloud virtual network.

For VPN site-to-site connectivity, you will need to modify either the provided default network configuration or create your own network, subnet, router and ports.

For more information on using VPN with Networking, see [HP Helion Public Cloud Networking: VPN setup quick start guide](/publiccloud/compute/vpn-quickstart).

##Using Security Groups with the Networking service## {#security}

Security Groups are a feature of HP Helion Public Cloud Networking and are fully supported by the Networking API. 

Security groups define conditions such as which ports, protocols, and IP addresses the remote virtual machine can open. The Networking service provides the security group rules, which are the conditions and restrictions under which the security group operates, for example, the protocols and ports for that group.

Default rules allow:

	- All inbound traffic from the same subnet 
	- All outbound traffic
	- Inbound ssh (TCP Port 22) from any source
	- Inbound ping (ICMP) from any source 

You can use the API, CLI or HP Helion Public Cloud Console to add or modify security group rules.


##Using Regions and Availability Zones with the Networking service## {#az}

The Networking service's regional capabilities include: 

* A single API endpoint per region

* Security groups that span all Availability Zones in a region

* Floating IP addresses that can be mapped to any Availability Zone in a Region

* The connection of virtual servers in different Availability Zones to the same virtual network


##For further information## {#info} 

Check out the following pages for more information on using HP Helion Public Cloud Networking services:

- [Known Issues and Workarounds with the Networking Service](/publiccloud/compute/network/known-issues/)
- [Helion Public Cloud - Quick Start Guide](https://community.hpcloud.com/article/hp-helion-public-cloud-quick-start-guide)
- [Management console: Networks screen](http://docs.hpcloud.com/publiccloud/mc/compute/networks/)
- [OpenStack networking wiki](https://wiki.openstack.org/wiki/Quantum)
