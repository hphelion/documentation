---
layout: default
title: "HP Public Cloud Networking Guide"
permalink: /compute/network-guide/
product: compute
categories: neutron
tags: networking neutron

---
# HP Public Cloud Networking Guide

HP Public Cloud Networking is a virtual networking service that includes a subnet, router, and port, using the OpenStack Networking API to define network connectivity and addressing for devices used by HP Public Cloud services, such as Compute. 

This guide covers:

* [HP Public Cloud Networking Terms and Provisions](#TermsandProvisions)
* Functionality and Features
* Customizing your Configuration (optional)
* Known Issues and Workarounds

Using the OpenStack Networking API, HP Public Cloud Networking defines network connectivity and addressing for HP Public Cloud Compute devices as well as devices for other HP Public Cloud services. It expands networking capabilities, allowing you to perform many tasks, including:

•	Defining and configuring virtual networks
 
•	Specifying IP subnets for those networks

•	Defining security group parameters

•	Allocating and managing public floating IP addresses

#####A default configuration comes with HP Public Cloud Compute Service activation and includes:

•	A network 

•	A subnet
 
•	A router connecting the subnets to the Internet

•	A security group with basic server options

__Use as is or customize__ 

You can use the default network to deploy HP Public Cloud Compute Virtual Machines (VMs), or modify networking through the OpenStack Networking API.  Use the command line or the HP Public Cloud Services Management Console’s (MC) easy-to-use interface to customize.


##Terms and Provisions## {#TermsandProvisions}

__Floating IP Addresses__ – On-demand, public IP addresses on a network. With HP Public Cloud, you can allocate several floating IP addresses and assign them to server instances. 

__Network__ – Allows you to define network connectivity and addressing in the Cloud, providing “networking as a service” between interface devices managed by other HP Public Cloud Services, such as Compute.

__Plugin__ – Virtual networking services are implemented through a plugin, which provides isolated virtual networks and services such as IP address management. 

__Port__ – A virtual switch that virtual instances plug their interfaces into.  The port assigns the virtual interfaces with IP addresses from a specific subnet’s allocation pool. After assigning IP addresses, that subnet is associated with the port.

__Router__ – A device that forwards data packets along networks. 

__Security Groups and Security Group Rules__ – Security groups and security group rules allows you to specify the type of traffic and direction (ingress/egress) that is allowed to pass through a port. A security group is a container for security group rules.

When a port is created in HP Public Cloud Networking it is associated with a security group. If a security group is not specified the port is associated with a default security group. The default group drops all ingress traffic and allows all egress. You can add rules to this group to modify behavior. 

__Subnet__ – Contains IP address blocks that assign IP addresses to virtual instances (i.e., virtual machines). In addition, a subnet can have a gateway, a list of DNS name servers, and host routes. Information is pushed to instances with interfaces associated with the subnet.

__Virtual machine__ (VM) – An isolated guest operating system installation within a normal host operating system.

###HP Public Cloud Networking Quota Default:###

* 5 Networks
* 5 Subnets
* 70 Ports
* 10 Floating IP addresses
* 1 Router
* 10 Security Groups
* 20 Security Group Rules


##Functionality and Features
In the 13.5 release, HP Public Cloud Services Compute and HP Public Cloud Networking are separate entities, integrating services and providing new features. You can now define and configure your own virtual network topology, including control of IP address ranges.

Based on OpenStack Networking, the open source virtual network service, HP Public Cloud Networking provides a default network using plugins that process API requests when you activate Cloud services.

You can use HP Public Cloud’s default network without modification. You can also configure other network topologies and attach virtual devices to ports on these networks.   HP Public Cloud Networking allows you to create multiple private networks and choose your own IP addressing scheme, enabling complex networking, such as building multi-tiered web applications and application migration to the Cloud without changing IP addresses.

__Default Networking Configuration__

A default network configuration comes with HP Public Cloud Compute Services activation and is ready to deploy HP Public Cloud Compute virtual machines (VMs).  The default configuration includes:

* A network
* A subnet
* A router  connecting the subnet to the Internet
* A security group with basic server options 

__HP Public Cloud Networking Features__

* If you choose to modify the default network, you can create and manage the networks your virtual servers/instances connect to.

* You can specify the subnet range associated to a network. Subnets that do not share a router do not have to be unique across tenants; however, the subnets in the default configuration share a common router and must therefore be unique. 

* Although DHCP assigns IP addresses, you can assign a particular address when creating an instance.

* Public IPs are not automatically assigned to an instance, which gets only an address from the subnet ranges associated with the network(s) it is connected to.
  
* An instance to which you assign a floating IP address has access to and from the Internet.

__NOTE: The instance can send outbound traffic to the Internet. To receive inbound traffic, you must assign a floating IP address to the instance. An instance without a floating IP can also receive incoming information in response to  previously initiated outbound communications.__

* You can configure your VM as a Virtual Private Network (VPN) gateway to your networks.

* The OpenStack Networking API provides the default security group, which defines conditions such as which ports, protocols, and IP addresses the remote virtual machine can open. HP Public Cloud Networking provides the security group rules, which are the conditions and restrictions under which the security group operates, e.g. the protocols and ports for that group. Default rules allow:

	- All inbound traffic from the same subnet 
	- All outbound traffic (until an outbound rule is defined), no inbound traffic
	- Inbound ssh (Port 22)
	- Ping (Ingress ICMP)

**NOTE: HP Public Cloud supports adding a rule to all protocols. If you accidentally delete the "default all egress traffic rule," you can add the rule back using the management console.**

__Regions and Availability Zones__

HP Public Cloud Networking regional capabilities include: 

* A single API endpoint per region

* Security groups that span all Availability Zones in a region

* Floating IP addresses that can be mapped to any Availability Zone in a Region

* The connection of compute instances in different Availability Zones to the same virtual network

##Customize your configuration (optional)
Modify the default network and create additional networks to exact specifications through the OpenStack Networking API. Customize the configuration either on the command line or through the HP Public Cloud Services management console to: 
 
* Define and configure your own private virtual networks

* Specify IP addressing for those networks 

* Configure security group parameters that define the firewall rules for compute instances

* Allocate and manage public floating IP addresses
HP Public Cloud Services Networking Management Console 

__Use the management console to__: 

* Create a network

* Manage a network

* Delete a network

* View network, subnet, and router details


__Use the command line to__:

Setup networking parameters from the command line on Unix, MacOS, or Windows.
 
The Unix Command Line Interface is a tool which allows Unix or Mac users to manage their HP Cloud Services from the command line or automated through scripts. You do not need to understand the underlying REST API or XML document format to use the Unix CLI. 

Click here https://docs.hpcloud.com/cli/ for more information on using the command line, including:

* Network Commands (version 13.5 and later)
* Subnet Commands (version 13.5 and later)
* Ports Commands (version 13.5 and later)
* Router Commands (version 13.5 and later)
* Security Group Commands
* Security Group Rule Commands
* Addresses or Floating IP Commands

##Known Issues
###Port Configuration:###
**Background**

HP Public Cloud Compute Service attaches servers to the network via HP Public Cloud Networking ports, which are created in one of the two following ways:

1. You can create ports in Networking, which passes them to Compute. 

    OR

2. You can allow Compute to create the ports it needs for you.   

In both cases, when Compute creates a server it maintains an internal cache of the list and configuration of the created ports.  Configuration items include the fixed and floating IP addresses assigned to the ports, the latter being the most likely to change. Compute uses the cached information solely to display the network configuration details of the server in response to API queries. 

If you allow Compute to create the ports instead of going through Networking, Compute refreshes the cache as needed. However, if you make a change to the port configuration through Networking, the Compute cache does not automatically refresh,  often taking several minutes to update.
 
**Workarounds**

**!!! Important: HP does not recommend mixing Compute and OpenStack Networking API calls for network configuration. Using the OpenStack Networking API behind HP Public Cloud Networking demands a high level of expertise.**

1. Compute can perform all floating IP operations. If those are the only changes you are going to make, the   simplest workaround is to perform all floating IP manipulation through Compute so it always reports the correct network configuration information for servers.

    OR  

2. To make the port configuration through Networking, disregard the network information Compute displays and query Networking directly for the information.

    OR
 
3. Only make changes through Compute for ports that are assigned to servers.


###Security Groups: 
 
**Background**

Compute provides only a subset of the HP Public Cloud Networking security group functionality.  If you configure security groups via Networking, Compute may not display the full resulting configuration.

**Workaround**

1. Use **either** Compute or Networking to configure security groups, but do not use them together.   Using the OpenStack Networking API provides additional functionality in the form of inbound rules, which the Compute API cannot display. 


**Note: HP Public Cloud supports security group configuration through Networking to facilitate your basic interactions with the OpenStack Networking API. To directly access the API's broader functionality, HP Public Cloud highly recommends working only through the OpenStack Networking API and does not recommend mixing Compute and OpenStack Networking API calls for security group configuration.**

If using the OpenStack Networking API, ensure all users likely to display security group configuration are aware of it.
