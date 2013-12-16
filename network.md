---
layout: default
title: "HP Cloud Networking Overview"
permalink: /compute/network-overview/
product: compute
categories: neutron
tags: networking neutron

---
# HP Cloud Networking Overview

HP Cloud Networking is a virtual networking service that provides network connectivity and addressing for HP Cloud compute devices. It is based on OpenStack Networking open source software. Key terms include:

- **Floating IP Addresses** - On-demand, public IP addresses on a network. With HP Cloud, you can allocate several floating IP addresses and assign them to virtual servers. 
- **Network** - Allows you to define network connectivity and addressing in the Cloud, providing "networking as a service" between interface devices managed by other HP Public Cloud, such as compute. 
- **Port** - A connection point for attaching a single device, such as a virtual server's NIC, to a virtual network.  The port describes the associated network configuration, such as the MAC and IP addresses to be used by the attached device.
- **Router** - A device that forwards data packets along networks. 
- **Subnet** - Contains IP address blocks that assign IP addresses to virtual servers. In addition, a subnet can have a gateway, a list of DNS name servers, and host routes. Information provided by DHCP is pushed to servers with interfaces associated with the subnet.


A default configuration comes with HP Cloud compute activation that includes a network, subnet,and  router connecting the subnets to the Internet.

You can use the default network to deploy HP Cloud compute virtual servers, or modify the default network to expand networking capabilities, including:

* Defining and configuring virtual networks
* Specifying IP subnets for those networks
* Defining security group parameters
* Allocating and managing public floating IP addresses


###API###
 
You can use a low level, raw REST API to access HP Cloud compute. For more information on using the HP Cloud Networking API, see [HP Cloud Networking API Specifications](https://docs.hpcloud.com/api/v13/networking).


###Bindings###

You can use any of several language bindings to access HP Cloud compute. For more information on using the HP Cloud Networking API, see [HP Cloud binding support](http://docs.hpcloud.com/bindings/).

###CLI###

You can use any of several command-line interface software to access HP Cloud compute. For more information on using the HP Cloud Networking API, see [HP Cloud CLI](http://docs.hpcloud.com/cli/).


## For further information

Check out the following pages for more information on using HP Cloud Networking services:

- [Getting Started with Networking 13.5](/compute.networking.getting-started)
- [HP Cloud Networking Overview](/networking/)
- [Known Issues and Best Practices in Compute and Networking in 13.5](https://community.hpcloud.com/article/known-issues-and-best-practices-compute-and-networking-135)
- [OpenStack networking wiki](https://wiki.openstack.org/wiki/Quantum)
