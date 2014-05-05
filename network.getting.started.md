---
layout: default
title: "Getting Started with HP Cloud Networking"
permalink: /compute/network/getting-started
product: compute

---
# Getting Started with HP Cloud Networking #

<!-- modeled after HP Cloud version 13.5 overview; text from networking guide (compute.network-guide.md) -->

Leveraging [OpenStack Networking](http://www.openstack.org/software/openstack-networking/), HP Cloud Networking is a virtual networking service that provides network connectivity and addressing for HP Cloud compute devices. 

In the 13.5 release, HP Cloud compute and networking services are separate entities, integrating services and providing new features. 

You can use the default network to deploy HP Cloud compute virtual servers, or modify the default network to expand networking capabilities.

You can now define and configure your own virtual network topology, including control of IP address ranges.

This page covers the following topics:

* [Using the Default Network Configuration](#Overview)
* [Customizing your Configuration](#customize)
* [Using VPN](#vpn)
* [Using Security Groups](#security)
* [Using Regions and Availability Zones](#az)
* [For further information](#info)

For more details on how to work with your network, see [HP Cloud Networking: Quick start guide](/compute/network-quick-start) or [How To's with HP Cloud Networking version 13.5](/compute/networks/howto/).

##Using the Default Network Configuration## {#default}

A default configuration comes with HP Cloud compute activation and includes:

* A network 
* A subnet
* A router connecting the subnets to the Internet
* A security group with basic server options

You can use the default network without modification. You can also configure other network topologies and attach virtual devices to ports on these networks. You can create multiple private networks and choose your own IP addressing scheme, enabling complex networking such as building multi-tiered web applications and application migration to the Cloud without changing IP addresses.

For a high level understanding of the default Network topology in Compute 13.5, see [Understanding Network Topology in 13.5](https://community.hpcloud.com/article/understanding-network-topology-135). 

For more specific questions, use the [Knowledge Base](https://community.hpcloud.com/search/knowledge/network	) or [Forums](https://community.hpcloud.com/search/forum/network) where you can learn from our own internal experts as well as other users in the HP Helion Public Cloud community.


##Customizing your Configuration## {#customize}

You can customize the default network using the [HP Cloud Management Console](#console), the (HP Cloud Networking API)[#API], the [HP Cloud CLI](#cli), or our [language bindings](#bindings). 

Customizing a network enables you to create and manage the networks your virtual servers connect to.

HP Cloud Networking expands networking capabilities, allowing you to perform many tasks, including:

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

For more information on modifying the default network and creating additional networks, see either [HP Cloud Networking: Quick start guide](/compute/network-quick-start/) or [Getting Started Guide](https://community.hpcloud.com/article/getting-started-guide) in the HP Helion Public Cloud community.

## Accessing the HP Helion Public Cloud Networking Service ##

There are a  number of tools that you can use to access and manage the HP Cloud Networking Service.

###Using the console to access Networking### {#console}

You can use the HP Helion Public Cloud console to access HP Cloud Networking Service. For more information on using the HP Helion Public Cloud console, see [Getting Started with HP Helion Public Cloud Console](/hpcloudconsole).


###Using the API to access Networking### {#API}
 
You can use a low level, raw REST API to access HP Cloud compute. For more information on using the HP Cloud Networking API, see [HP Cloud Networking API Specifications](/api/v13/networking).

###Using the CLI### {#cli}

You can use any of several command-line interface software to access HP Cloud compute. For more information on using the HP Cloud Networking API, see [HP Cloud CLI](/cli/).

###Using language bindings### {#bindings}

You can use any of several language bindings to access HP Cloud compute. For more information on using the HP Cloud Networking API, see [HP Cloud binding support](/bindings/).

##Using VPN with the Networking Service## {#vpn}

With HP Cloud Networking you can set up an IPsec, or site-to-site, VPN connecting your external network directly to your HP cloud virtual network.

For VPN site-to-site connectivity, you will need to modify either the provided default network configuration or create your own network, subnet, router and ports.

For more information on using VPN with HP Cloud Networking, see [HP Cloud Networking: VPN setup quick start guide](/compute/vpn-quickstart).

##Using Security Groups with the Networking Service## {#security}

Security Groups are a feature of HP Cloud Networking and are fully supported by the Networking API. 

Security groups define conditions such as which ports, protocols, and IP addresses the remote virtual machine can open. HP Cloud Networking provides the security group rules, which are the conditions and restrictions under which the security group operates, for example, the protocols and ports for that group.

Default rules allow:

	- All inbound traffic from the same subnet 
	- All outbound traffic
	- Inbound ssh (TCP Port 22) from any source
	- Inbound ping (ICMP) from any source 

You can use the API, CLI or HP Helion Public Cloud Console to add or modify security group rules.


##Using Regions and Availability Zones with the Networking Service## {#az}

HP Cloud Networking regional capabilities include: 

* A single API endpoint per region

* Security groups that span all Availability Zones in a region

* Floating IP addresses that can be mapped to any Availability Zone in a Region

* The connection of virtual servers in different Availability Zones to the same virtual network


##For further information## {#info} 

Check out the following pages for more information on using HP Cloud Networking services:

- [Known Issues and Workarounds with the Networking Service](/compute/network/known-issues/)
- [Getting Started with Compute 13.5](https://community.hpcloud.com/article/getting-started-compute-135)
- [Management console: Networks screen](http://docs.hpcloud.com/mc/compute/networks/)
- [OpenStack networking wiki](https://wiki.openstack.org/wiki/Quantum)
