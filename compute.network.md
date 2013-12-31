---
layout: default
title: "HP Cloud Networking Overview"
permalink: /compute/network/
product: compute

---
# HP Cloud Networking version 13.5 Overview #

<!-- modeled after HP Cloud version 13.5 overview; text from networking guide (compute.network-guide.md) -->

Leveraging [OpenStack Networking](http://www.openstack.org/software/openstack-networking/), HP Cloud Networking is a virtual networking service that provides network connectivity and addressing for HP Cloud compute devices. 

In the 13.5 release, HP Cloud compute and networking services are separate entities, integrating services and providing new features. You can now define and configure your own virtual network topology, including control of IP address ranges.

This page covers the following topics:

* [Using the Default Network Configuration](#Overview)
* [Customizing your Configuration](#customize)
* [Using VPN](#vpn)
* [Using Security Groups](#security)
* [Using Regions and Availability Zones](#az)
* [For further information](#info)

##Using the Default Network Configuration## {#default}

HP Cloud's default configuration of a network, subnet, router, and security group comes with HP Cloud compute services activation and is ready to deploy virtual servers.

You can use the default network without modification. You can also configure other network topologies and attach virtual devices to ports on these networks. You can create multiple private networks and choose your own IP addressing scheme, enabling complex networking such as building multi-tiered web applications and application migration to the Cloud without changing IP addresses.

A default configuration comes with HP Cloud compute activation and includes:

* A network 
* A subnet
* A router connecting the subnets to the Internet
* A security group with basic server options

For a high level understanding of the default Network topology in Compute 13.5, see [Understanding Network Topology in 13.5](https://community.hpcloud.com/article/understanding-network-topology-135). 

For more specific questions, use the [Knowledge Base](https://community.hpcloud.com/search/knowledge/network	) or [Forums](https://community.hpcloud.com/search/forum/network) where you can learn from our own internal experts as well as other users in the HP Public Cloud community.

##Customizing your Configuration## {#customize}

You can use the default network or customize the default network using either the HP Cloud Networking API or the HP Cloud Management Console. Customizing a network enables you to manage the networks your virtual servers connect to.

HP Cloud Networking expands networking capabilities, allowing you to perform many tasks, including:

- Creating and deleting a network
- Managing a subnet
- Adding and deleting an interface to a router
- Configuring security group parameters that define the firewall rules for virtual servers
- Allocating and managing public floating IP addresses
- Viewing network and router details

For more information on modifying the default network and creating additional networks, see [HP Cloud Networking Overview](https://docs.hpcloud.com/mc/compute/networks/).

###Using the console### {#console}

You can use the HP Public Cloud console to access HP Cloud compute. For more information on using the HP Public Cloud console, see [Getting Started with HP Public Cloud Console](http://docs.hpcloud.com/hpcloudconsole).


###Using the API### {#API}
 
You can use a low level, raw REST API to access HP Cloud compute. For more information on using the HP Cloud Networking API, see [HP Cloud Networking API Specifications](https://docs.hpcloud.com/api/v13/networking).


###Using language bindings### {#bindings}

You can use any of several language bindings to access HP Cloud compute. For more information on using the HP Cloud Networking API, see [HP Cloud binding support](http://docs.hpcloud.com/bindings/).

###Using the CLI### {#cli}

You can use any of several command-line interface software to access HP Cloud compute. For more information on using the HP Cloud Networking API, see [HP Cloud CLI](http://docs.hpcloud.com/cli/).

##Using VPN## {#vpn)

With HP Cloud Networking you can set up an IPsec, or site-to-site, VPN connecting your external network directly to your HP cloud virtual network.

For VPN site-to-site connectivity, you will need to modify either the provided default network configuration or create your own network, subnet, router and ports.

For more information on using VPN with HP Cloud Networking, see [HP Cloud Networking: VPN setup quick start guide](http://docs.hpcloud.com/compute/vpn-quickstart).

##Using Security Groups## {#security}

Security Groups are a feature of HP Cloud Networking and are fully supported by the Networking API. 

When you create a port in HP Cloud Networking, you can associate the port with a custom security group or the default security group. You can use the API or Management console to add or modify security group rules to the specified group.

##Using Regions and Availability Zones## {#az}

HP Cloud Networking regional capabilities include: 

* A single API endpoint per region

* Security groups that span all Availability Zones in a region

* Floating IP addresses that can be mapped to any Availability Zone in a Region

* The connection of virtual servers in different Availability Zones to the same virtual network


##For further information## {#info} 

Check out the following pages for more information on using HP Cloud Networking services:

- [Known Issues and Best Practices in Compute and Networking in 13.5](https://community.hpcloud.com/article/known-issues-and-best-practices-compute-and-networking-135)
- [Getting Started with Compute 13.5](https://community.hpcloud.com/article/getting-started-compute-135)
- [Management console: Networks screen](http://docs.hpcloud.com/mc/compute/networks/)
- [UNIX CLI for HP Documentation](http://docs.hpcloud.com/cli/unix)
- [OpenStack networking wiki](https://wiki.openstack.org/wiki/Quantum)