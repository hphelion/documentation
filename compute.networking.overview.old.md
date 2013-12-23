---
layout: default
title: "HP Cloud Networking verson 13.5 Overview"
permalink: /compute/networking/
product: compute

---
# HP Cloud Networking verson 13.5 Overview #

<!-- modeled after HP Cloud version 13.5 overview; text from networking guide (compute.network-guide.md) -->

In the 13.5 release, HP Cloud compute and networking services are separate entities, integrating services and providing new features. You can now define and configure your own virtual network topology, including control of IP address ranges.

HP Cloud's default configuration comes with HP Cloud compute services activation and is ready to deploy virtual servers. The default configuration includes:

* A network 
* A subnet
* A router connecting the subnets to the Internet
* A security group with basic server options 

You can use the default network to deploy HP Cloud compute virtual servers, or modify the network configuration through the OpenStack Networking API.  Use the command line or the HP Cloud management console's (MC) easy-to-use interface to customize.

You can create multiple private networks and choose your own IP addressing scheme, enabling complex networking such as building multi-tiered web applications and application migration to the Cloud without changing IP addresses.
 
HP Cloud Networking expands networking capabilities, allowing you to perform many tasks, including:

* Defining and configuring virtual networks
* Specifying IP subnets for those networks
* Attaching instances (virtual devices) to network ports
* Defining security group parameters
* Allocating and managing public floating IP addresses


##HP Cloud Networking Features## {#FunctionalityandFeatures} 

* If you choose to modify the default network, you can create and manage the networks your virtual servers connect to.

* You can specify the subnet range associated to a network. Subnets that do not share a router do not have to be unique across tenants; however, the subnets in the default configuration share a common router and must therefore be unique. 

* Although DHCP assigns IP addresses, you can assign a particular address when creating a virtual server.

* Public IPs are not automatically assigned to a virtual server, which gets only an address from the subnet ranges associated with the network(s) it is connected to.
  
* A virtual server to which you assign a floating IP address has access to and from the Internet.

NOTE: The virtual server can send outbound traffic to the Internet. A virtual server can also receive incoming information in response to  previously initiated outbound communications without a floating IP.To receive other inbound traffic, you must assign a floating IP address to the server.

* You can configure your virtual server as a Virtual Private Network (VPN) gateway to your networks.

* The OpenStack Networking API provides the default security group, which defines conditions such as which ports, protocols, and IP addresses the remote virtual machine can open. HP Cloud Networking provides the security group rules, which are the conditions and restrictions under which the security group operates, e.g., the protocols and ports for that group. Default rules allow:

	- All inbound traffic from the same subnet 
	- All outbound traffic
	- Inbound ssh (TCP Port 22) from any source
	- Inbound ping (ICMP) from any source 

NOTE: HP Cloud Networking supports adding a rule to all protocols. If you accidentally delete the "default all egress traffic rule," you can add the rule back using the MC.


##Customizing your Configuration## {#CustomizingyourConfiguration}

Optionally, modify the default network and create additional networks to exact specifications through the OpenStack Networking API. Customize the configuration either on the command line or through the HP Cloud MC to: 
 
* Define and configure your own private virtual networks

* Specify IP addressing for those networks 

* Configure security group parameters that define the firewall rules for virtual servers

* Allocate and manage public floating IP addresses

**Use the MC to:** 

* Create a network

* Manage a network

* Delete a network

* View network, subnet, and router details

See [the MC networking pages](/mc/compute/networks/) for more information about setting up networking using the MC.


**Use the command line to:**

Setup networking parameters from the command line on Unix, MacOS, or Windows.
 
The Unix Command Line Interface is a tool which allows Unix or Mac users to manage HP Cloud from the command line or through automated scripts. You do not need to understand the underlying REST API or XML document format to use the Unix CLI. 

[Click here](https://docs.hpcloud.com/cli/) for more information on using the command line, including:

* Network Commands (version 13.5 and later)
* Subnet Commands (version 13.5 and later)
* Ports Commands (version 13.5 and later)
* Router Commands (version 13.5 and later)
* Security Group Commands
* Security Group Rule Commands
* Addresses or Floating IP Commands
