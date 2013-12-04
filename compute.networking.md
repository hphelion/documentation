---
layout: default
title: "HP Cloud Networking Overview"
permalink: /compute/networking
product: compute

---
# HP Cloud Networking Overview

<!-- <iframe src="http://player.vimeo.com/video/33922384?title=0&amp;byline=0&amp;portrait=0" width="580" height="420" frameborder="0"> </iframe> -->

Leveraging [OpenStack Networking](http://www.openstack.org/software/openstack-networking/), HP Cloud Networking is a virtual networking service that provides network connectivity and addressing for HP Cloud compute devices. 

In the 13.5 release, HP Cloud compute and networking services are separate entities, integrating services and providing new features. You can now define and configure your own virtual network topology, including control of IP address ranges.

HP Cloud's default configuration of a network, subnet, router, and security group comes with HP Cloud compute services activation and is ready to deploy virtual servers.

You can use the default network without modification. You can also configure other network topologies and attach virtual devices to ports on these networks. You can create multiple private networks and choose your own IP addressing scheme, enabling complex networking such as building multi-tiered web applications and application migration to the Cloud without changing IP addresses.

A default configuration comes with HP Cloud compute activation and includes:

- 5 Networks
- 5 Subnets
- 70 Ports
- 45 Floating IP addresses
- 1 Router
- 10 Security Groups
- 50 Security Group Rules

You can use the default network to deploy HP Cloud compute virtual servers, or modify the network configuration through the OpenStack Networking API. Use the command line or the HP Cloud management console's (MC) easy-to-use interface to customize.

HP Cloud Networking expands networking capabilities, allowing you to perform many tasks, including:

    Defining and configuring virtual networks
    Specifying IP subnets for those networks
    Defining security group parameters
    Allocating and managing public floating IP addresses


##Customizing your Configuration##

You can modify the default network and create additional networks to exact specifications through the OpenStack Networking API. 

Customize the configuration either on the command line or through the HP Cloud MC to:

Define and configure your own private virtual networks

Specify IP addressing for those networks

Configure security group parameters that define the firewall rules for virtual servers

Allocate and manage public floating IP addresses


From the networks screen you can perform any of the following functions:

Creating and deleting a network
Managing a subnet
Adding and deleting an interface to a router
Viewing network details
Viewing subnet details
Viewing router details


##Security Groups##

Security Groups are a feature of HP Cloud Networking and are fully supported by the Networking API. A limited set of Security Group features are also accessible via the compute API for convenience and backwards compatibility. To directly access the API's broader functionality, HP recommends working only through the OpenStack Networking API and does not recommend mixing compute and OpenStack Networking API calls for security group configuration.

## For further information

Check out the following pages for more information on using HP Cloud compute services:

* [Ruby Fog bindings compute examples](/bindings/fog/compute/)
* [CLI UNIX compute examples](/cli/unix/compute/)
* [Windows PowerShell CLI compute examples](/cli/windows/compute/)
* [Management console compute dashboard information](/mc/compute/)
