---
layout: default
title: "HP Cloud Networking Guide"
permalink: /compute/network-guide/
product: compute
categories: neutron
tags: networking neutron

---
# HP Cloud Networking Guide

HP Cloud Networking is a virtual networking service that provides network connectivity and addressing for HP Cloud compute devices. It is based on OpenStack Networking open source software. 

This guide covers:

* [Terms and Provisions](#TermsandProvisions) 
* [Functionality and Features](#FunctionalityandFeatures)
* [Customizing your Configuration](#CustomizingyourConfiguration) (optional)
* [Known Issues and Workarounds](#KnownIssuesandWorkarounds)


#####A default configuration comes with HP Cloud compute service activation and includes:

* A network 
* A subnet
* A router connecting the subnets to the Internet
* A security group with basic server options

__Use as is or customize__ 

You can use the default network to deploy HP Cloud compute service virtual servers, or modify the network configuration through the OpenStack Networking API.  Use the command line or the HP Cloud management console’s (MC) easy-to-use interface to customize.
 
HP Cloud Networking expands networking capabilities, allowing you to perform many tasks, including:

* Defining and configuring virtual networks
* Specifying IP subnets for those networks
* Defining security group parameters
* Allocating and managing public floating IP addresses



##Terms and Provisions## {#TermsandProvisions} 

__Floating IP Addresses__ – On-demand, public IP addresses on a network. With HP Cloud, you can allocate several floating IP addresses and assign them to virtual servers. 

__Network__ – Allows you to define network connectivity and addressing in the Cloud, providing “networking as a service” between interface devices managed by other HP Cloud Services, such as compute. 

__Port__ – A connection point for attaching a single device, such as a virtual server's NIC, to a virtual network.  The port describes the associated network configuration, such as the MAC and IP addresses to be used by the attached device.

__Router__ – A device that forwards data packets along networks. 

__Security Groups and Security Group Rules__ – Security groups and security group rules allow you to specify the type of traffic and direction (ingress/egress) that is allowed to pass through a port. A security group is a container for security group rules.

When a port is created in HP Cloud Networking it is associated with a security group. If a security group is not specified the port is associated with a default security group. The default group drops all ingress traffic and allows all egress traffic. You can add rules to this group to modify behavior. 

__Subnet__ – Contains IP address blocks that assign IP addresses to virtual servers. In addition, a subnet can have a gateway, a list of DNS name servers, and host routes. Information provided by DHCP is pushed to servers with interfaces associated with the subnet.


###HP Cloud Networking Quota Default:###

* 5 Networks
* 5 Subnets
* 70 Ports
* 45 Floating IP addresses
* 1 Router
* 10 Security Groups
* 50 Security Group Rules


##Functionality and Features## {#FunctionalityandFeatures} 
In the 13.5 release, HP Cloud compute and networking services are separate entities, integrating services and providing new features. You can now define and configure your own virtual network topology, including control of IP address ranges.

HP Cloud's default configuration of a network, subnet, router, and security group comes with HP Cloud compute services activation and is ready to deploy virtual servers.

You can use the default network without modification. You can also configure other network topologies and attach virtual devices to ports on these networks. You can create multiple private networks and choose your own IP addressing scheme, enabling complex networking such as building multi-tiered web applications and application migration to the Cloud without changing IP addresses.



__HP Cloud Networking Features__

* If you choose to modify the default network, you can create and manage the networks your virtual servers connect to.

* You can specify the subnet range associated to a network. Subnets that do not share a router do not have to be unique across tenants; however, the subnets in the default configuration share a common router and must therefore be unique. 

* Although DHCP assigns IP addresses, you can assign a particular address when creating a virtual server.

* Public IPs are not automatically assigned to a virtual server, which gets only an address from the subnet ranges associated with the network(s) it is connected to.
  
* A virtual server to which you assign a floating IP address has access to and from the Internet.

__NOTE: The virtual server can send outbound traffic to the Internet. A virtual server can also receive incoming information in response to  previously initiated outbound communications without a floating IP.To receive other inbound traffic, you must assign a floating IP address to the server.__

* You can configure your virtual server as a Virtual Private Network (VPN) gateway to your networks.

* The OpenStack Networking API provides the default security group, which defines conditions such as which ports, protocols, and IP addresses the remote virtual machine can open. HP Cloud Networking provides the security group rules, which are the conditions and restrictions under which the security group operates, e.g., the protocols and ports for that group. Default rules allow:

	- All inbound traffic from the same subnet 
	- All outbound traffic
	- Inbound ssh (TCP Port 22) from any source
	- Inbound ICMP (i.e., ping) from any source 

**NOTE: HP Cloud Networking supports adding a rule to all protocols. If you accidentally delete the "default all egress traffic rule," you can add the rule back using the MC.**

__Regions and Availability Zones__

HP Cloud Networking regional capabilities include: 

* A single API endpoint per region

* Security groups that span all Availability Zones in a region

* Floating IP addresses that can be mapped to any Availability Zone in a Region

* The connection of virtual servers in different Availability Zones to the same virtual network

##Customizing your Configuration## {#CustomizingyourConfiguration}

Optionally modify the default network and create additional networks to exact specifications through the OpenStack Networking API. Customize the configuration either on the command line or through the HP Cloud Services MC to: 
 
* Define and configure your own private virtual networks

* Specify IP addressing for those networks 

* Configure security group parameters that define the firewall rules for virtual servers

* Allocate and manage public floating IP addresses

__Use the MC to__: 

* Create a network

* Manage a network

* Delete a network

* View network, subnet, and router details

See [the MC networking pages](/mc/compute/networks/) for more information about setting up networking using the MC.


__Use the command line to__:

Setup networking parameters from the command line on Unix, MacOS, or Windows.
 
The Unix Command Line Interface is a tool which allows Unix or Mac users to manage their HP Cloud Services from the command line or through automated scripts. You do not need to understand the underlying REST API or XML document format to use the Unix CLI. 

[Click here](https://docs.hpcloud.com/cli/) for more information on using the command line, including:

* Network Commands (version 13.5 and later)
* Subnet Commands (version 13.5 and later)
* Ports Commands (version 13.5 and later)
* Router Commands (version 13.5 and later)
* Security Group Commands
* Security Group Rule Commands
* Addresses or Floating IP Commands

##Known Issues and Workarounds## {#KnownIssuesandWorkarounds}
###Port Configuration:###
**Background**

The HP Cloud compute service attaches virtual servers to the network via HP Cloud Networking ports, which are created in one of the two following ways:

1. You can create ports in Networking and pass them to compute. 

    OR

2. You can allow compute to create the ports it needs for you.   

**Issue**

In both cases, when the compute service creates a server it maintains an internal cache of the list and configuration of the created ports.  Configuration items include the fixed and floating IP addresses assigned to the ports, the latter being the most likely to change. The compute service uses the cached information solely to display the network configuration details of the server in response to compute API queries. 

If you allow compute to create the ports instead of going through Networking, compute refreshes the cache as needed. However, if you make a change to the port configuration through Networking, the compute cache does not automatically refresh,  often taking several minutes to update.
 
**Workarounds**

**!!! Important: HP does not recommend mixing compute and OpenStack Networking API calls for network configuration. Using the OpenStack Networking API behind HP Cloud Networking demands a high level of expertise.**


1. Compute can perform all floating IP operations. If those are the only operations you are going to perform, the   simplest workaround is to perform all floating IP manipulation through compute so it always reports the correct network configuration information for servers.

    OR  

2. To make the port configuration through Networking, disregard the network information compute displays and query Networking directly for the information.

    OR
 
3. Only make changes through the compute service for ports that are assigned to servers.


###Security Groups: 
 
**Background**

The compute service provides only a subset of the HP Cloud Networking security group functionality.  For example, compute does not support egress rules. 

**Issue**

If you configure security groups via Networking, compute may not display the full resulting configuration.

**Workaround**

1. Use **either** the compute **or** networking service to configure security groups, but do not use them together.   Using the OpenStack Networking API provides additional functionality in the form of egress rules, which the compute API cannot display. 

**Note: Security Groups are a feature of  HP Cloud Networking and are fully supported by the Networking API. A limited set of Security Group features are also accessible via the compute API for convenience and backwards compatibility. To directly access the API's broader functionality, HP highly recommends working only through the OpenStack Networking API and does not recommend mixing compute and OpenStack Networking API calls for security group configuration. If using the Networking API, notify all users likely to display security group configuration.**
