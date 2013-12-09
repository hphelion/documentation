---
layout: default
title: "HP Cloud Networking Overview"
permalink: /compute/networking
product: compute

---
# HP Cloud Networking Overview TEST TEST TEST #

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

For a high level understanding of the default Network topology in Compute 13.5, see [Understanding Network Topology in 13.5](https://community.hpcloud.com/article/understanding-network-topology-135). 

##Customizing your Configuration##

You can use the default network or customize the default network using either the HP Cloud Networking API or the HP Cloud Management Console. Customizing a network enables you to manage the networks your virtual servers connect to.

HP Cloud Networking expands networking capabilities, allowing you to perform many tasks, including:

- Creating and deleting a network
- Managing a subnet
- Adding and deleting an interface to a router
- Configuring security group parameters that define the firewall rules for virtual servers
- Allocating and managing public floating IP addresses
- Viewing network and router details

For more information on modifying the default network and creating additional networks, see [HP Cloud Networking Overview](https://docs.hpcloud.com/compute/network-guide/).

For more information on using the HP Cloud Networking API, an extension to the OpenStack API, see [Management console: Networks screen](http://docs.hpcloud.com/mc/compute/networks/)
 
For more information on using the HP Cloud Networking API, see [HP Cloud Networking API Specifications](https://docs.hpcloud.com/api/v13/networking)

##Security Groups##

Security Groups are a feature of HP Cloud Networking and are fully supported by the Networking API. 

When you create a port in HP Cloud Networking, you can associate the port with a custom security group or the default security group. You can use the API or Management console to add or modify security group rules to the specified group.

## For further information

Check out the following pages for more information on using HP Cloud Networking services:

- [Known Issues and Best Practices in Compute and Networking in 13.5](https://community.hpcloud.com/article/known-issues-and-best-practices-compute-and-networking-135)
- [Getting Started with Compute 13.5](https://community.hpcloud.com/article/getting-started-compute-135)
- [Management console: Networks screen](http://docs.hpcloud.com/mc/compute/networks/)
- [UNIX CLI for HP Documentation](http://docs.hpcloud.com/cli/unix)
- [OpenStack networking wiki](https://wiki.openstack.org/wiki/Quantum)