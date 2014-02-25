---
layout: default
title: "HP Cloud Networking:  Network setup quick start guide"
permalink: /compute/network/
product: compute
categories: neutron
tags: networking neutron vpn

---
# HP Cloud Networking: Quick start guide 

HP Cloud Networking is a virtual networking service that provides network connectivity and IP addressing for HP Cloud compute devices. It is based on OpenStack Networking open source software. 

## Overview ## {#top}

The Compute API has a virtual server abstraction to describe computing resources. Similarly, the Networking API has virtual network, subnet, and port abstractions to describe networking resources.

You can configure rich network topologies by creating and configuring networks and subnets, and then instructing other OpenStack services like Compute to attach virtual devices to ports on these networks.

In particular, Networking supports each tenant having multiple private networks, and allows tenants to choose their own IP addressing scheme (even if those IP addresses overlap with those that other tenants use). 

The Networking service Offers flexibility for the cloud administrator to customize network offerings, such as building multi-tiered web applications and enabling migration of applications to the cloud without changing IP addresses.


A default configuration comes with HP Cloud compute activation and includes:

* A network 
* A subnet
* A router connecting the subnets to the Internet
* A security group with basic server options

You can use the default network to deploy HP Cloud compute virtual servers, or modify the network configuration through the OpenStack Networking API.  Use the command line or the HP Cloud management console's (MC) easy-to-use interface to customize.
 
HP Cloud Networking expands networking capabilities, allowing you to perform many tasks, including:

* Defining and configuring virtual networks
* Specifying IP subnets for those networks
* Defining security group parameters
* Allocating and managing public floating IP addresses


This guide provides the information you will need to get started in setting up a network, such as the example shown in the following image.

<img src="media/HPCS-VPC-VPN-SingleSite-Connection-Layer3-new-novendor.jpg" width="600" alt="Basic VPN setup" />

Here, the left case is the HP Public Cloud environment and the right case is your local systems.


See [Customizing your Configuration](#customize).

### Audience ### {#audience}
This guide is designed for those in the following or similar roles:   

- Networking Engineers    
- Networking Administrators
- Cloud Administrators

To use this solution effectively, you should be familiar with   

- Local network configuration in HP Cloud     
- HP Cloud Compute and Networking services 
- OpenStack Nova and Neutron CLI and API   
- Virtual Private Networks (VPN)    
- strongSwan or other IPsec-based software solutions   
    

### Key Terms ### {#terms}

**Network**: An isolated L2 segment, analogous to VLAN in the physical networking world. A network allows you to define network connectivity and addressing in the Cloud, providing "networking as a service" between interface devices managed by other HP Public Cloud, such as compute. 

**Subnet**: A block of v4 or v6 IP addresses and associated configuration state.

Contains IP address blocks that assign IP addresses to virtual servers. In addition, a subnet can have a gateway, a list of DNS name servers, and host routes. Information provided by DHCP is pushed to servers with interfaces associated with the subnet.

**Port**: A connection point for attaching a single device, such as a virtual server's NIC, to a virtual network.  The port describes the associated network configuration, such as the MAC and IP addresses to be used by the attached device.

**Router**: A device that forwards data packets along networks. 

**Security Groups and Security Group Rules**: Security groups and security group rules allow you to specify the type of traffic and direction (inbound/outbound) that is allowed to pass through a port. A security group is a container for security group rules.

When a port is created in HP Cloud Networking it is associated with a security group. If a security group is not specified the port is associated with a default security group. Security group default rules allow inbound traffic from the same subnet and all outbound traffic. You can add rules to this group to modify behavior. 

back to the [top](#top)

##Customizing your Network## {#customize}

After activating the Compute 13.5 region, the default network that is set up for you looks like the diagram below. You are given a default router with the external network (labeled "Ext-Net") attached to it so it can be reached from the Internet. A default network is then created and is attached to the router.

You are also given a default subnet on your network. The subnet will serve as your DHCP server and it has a CIDR of 10.0.0.0/24 which is the pool of fixed private IPs that your instances will be assigned. Your subnet will default to using HP's internal DNS which uses DNSMASQ.

You can use the default network or customize the default network using either the HP Cloud Networking API or the HP Cloud Management Console. Customizing a network enables you to manage the networks your virtual servers connect to.

HP Cloud Networking expands networking capabilities, allowing you to perform many tasks, including:

- Viewing network and router details
- Creating and deleting a network
- Managing a subnet
- Adding and deleting an interface to a router

You might need to modify the default network or create additional networks.  This page gives you some how-to's to use the [Horizon Cloud Console](#console) or [HP Cloud CLI for Windows PowerShell](#powershell) to perform the following tasks:  

- Create a network
- Create a subnet
- Create a port
- Create a router
- Assign a router to a network

### Activate the compute service in HP Cloud ### {#compute}

If you have not previously created an account and activated the compute service please sign up at [http://hpcloud.com](http://hpcloud.com).  


### Using the Horizon Cloud Console ### {#console}

You can use the Horizon Cloud Console to perform the following tasks:

- [Create a network](#Enabling)
- [Create a subnet](#CreateSubUI)
- [Create a port](#CreatePortUI)
- [Create a router](#AssignRouterUI)
- [Assign a router to a network](#AssignRouter)

All of the procedures in this section require that you access the Networks or Routers tab in the Project section of the HP Public Cloud Console, <a name="NetworkTab">as shown</a>:

   <br><img src="media/network-tab.png"  alt="" />

#### Using the Network Topology tab #### {#NetworkTop}

The Network Topology tab represents your network layout.

   <br><img src="media/compute-network-topology_crop.png"  alt="" />


#### Creating a network #### {#CreateNetworkUI}

In order to associate an instance with a network, the network much exist. To create a network, use the following steps:

1. Login to the [Horizon Console](https://horizon.hpcloud.com/).

2. Select the [Networks tab](#NetworkTab) under the Project section.

3. Click **Create Network**. 
	<br><img src="media/network-create.png"  alt="" />

4. On the **Network** tab, enter a name for the network  and leave the **Admin State** selected.  
	<br><img src="media/network-fields.png"  alt="" />

5. Click **Next** to configure a subnet for the network. Proceed with the following section.


#### Create a subnet #### {#CreateSubUI}

1. On the **Subnet** tab, enter the subnet name
	<br><img src="media/network-fields-2.png"  alt="" />

2. In the **Network Address** field enter a network address in Classless Inter-Domain Routing (CIDR) format: 192.168.0.0/24.

3. In the **IP Version** field, select IPv4 or IPv6, as appropriate.

4. Leave the **Gateway IP** field blank to use the default value of the network address; for example, 192.168.0.1 for 192.168.0.0/24.

5. Clear the **Disable Gateway** box to use the default gaetway. 
 
6. Click **Next**. 

7. On the **Subnet** tab, enter the subnet name
	<br><img src="media/network-fields-2.png"  alt="" />


9. The **Networks** screen displays your network name and associated subnets.

    <img src="media/CreateaSubnetImage2.png" width="580" alt="" />

10. To see a graphic display of your network setup, click "Network Topology" under "Manage Network" in the left-hand navigation.  

    <img src="media/CreateaSubnetImage3.png" width="580" alt="" />

#### Create a port #### {#CreatePortUI}

1. Login to the [HP Public Cloud Console](https://horizon.hpcloud.com/).

2. Select the [Networks tab](#NetworkTab) under the Project section.

#### Create a router #### {#SpecifyIP}




#### Assign a router to an external network #### {#AssignRouterUI}

1. Login to the [Horizon Console](https://horizon.hpcloud.com/).

2. Select the [Routers tab](#NetworkTab) under the Project section.

3. On the Routers screen, locate the network which you want to rename.

4. In the Actions column, click **Set Gateway** for your the network. 

5. In the Set Gateway screen, select a network from the **External Network** list and click **Set Gateway**
	<br><img src="media/network-gateway.png"  alt="" />

### Using the Cloud 13.5 CLI ### {#CLI}

Once you [activate](#compute) the compute service, you need to install the [compute](https://docs.hpcloud.com/api/v13/compute/) and [networking](https://docs.hpcloud.com/api/v13/networking/) clients or the [CLI](http://docs.hpcloud.com/cli/unix/network). Make sure you activate a compute instance in HP Cloud version 13.5 to access the networking and VPN capabilities.

These instructions use the HP Cloud v13.5 CLI on an Ubuntu server instance. You may, of course, choose to use another instance type and still use these directions as a general guide for setting up your VPN.

- [Create a network and subnet](#CreateNetworkCLI) 
- [Create a port](#CreatePortCLI)
- [Create a router and attach the router to a network](#CreateRouterCLI)
-  [Attach the router to the subnet](#AttachRouterCLI)

For the full reference of supported HP Cloud CLI commands, see . 

In this guide we use these parameters:

$EXT_NET = Ext-Net   
$CIDR = 10.2.0.0/24 (example range)   
$NETWORK_ID = the id of the created network   
$SUBNET_ID = the id of the created subnet   
$TENANT_ID = the id of the tenant   
$PORT_ID1 = id of port 1 (vm-gateway)     
$PORT_ID2 = id of port 2 (vm-test)    
$VM_GATEWAY = address of the VPN VM gateway (e.g., 10.2.0.21)   

For more details on the Nova and Neutron commands please see the [HP Cloud Networking](https://docs.hpcloud.com/api/v13/networking/) and [Compute](https://docs.hpcloud.com/api/v13/compute/) API specifications.

#### Create a new Ubuntu server instance ####
 
Set up a new Ubuntu server instance&mdash;separate from your other VPC gateway machines and using the command line. Test the setup of this new server.

1. Install Python-NovaClient and Python-NeutronClient on this server. See the [Knowledge Base](https://community.hpcloud.com/article/cloud-135-cli-installation-instructions) for instructions.
2. Verify that you can access the Nova and Neutron APIs for your tenant from this Python Client by running the `nova list` and `neutron port-list` commands.


#### Create a network and subnet #### {#CreateNetworkCLI}
**Note**: Skip this step if you are using the network and subnet provided with your service activation.

In the example we use **vpn_network** for the name of the network.

    neutron net-create vpn_network
    neutron subnet-create $NETWORK_ID $CIDR 


#### Create ports #### {#CreatePortCLI}

Create two ports and disable the port security on the VPN gateway port. Use this new gateway machine in the SRX-VPC set up for the VPN connection.  

**NOTE:** disabling port security will disable the use of all security groups on the port.
	
    neutron port-create $NETWORK_ID --port_security_enabled False --name $PORT_ID1
    neutron port-create $NETWORK_ID --name $PORT_ID2

Ports can be viewed with **neutron port-list** command.

    neutron port-list 	
    +--------------------------------------+------+-------------------+-------------------------------------------------------------------------------------+
    | id                                   | name | mac_address       | fixed_ips                                                                           |
    +--------------------------------------+------+-------------------+-------------------------------------------------------------------------------------+
    | baf13412-2641-4183-9533-de8f5b91444c |      | fa:16:3e:f6:ec:c7 | {"subnet_id": "15a09f6c-87a5-4d14-b2cf-03d97cd4b456", "ip_address": "10.2.0.21"}  |
    | f7a08fe4-e79e-4b67-bbb8-a5002455a493 |      | fa:16:3e:97:e0:fc | {"subnet_id": "15a09f6c-87a5-4d14-b2cf-03d97cd4b456", "ip_address": "10.2.0.33"} |
    +--------------------------------------+------+-------------------+-------------------------------------------------------------------------------------+


#### Create the router and attach it to the external network #### {#CreateRouterCLI}   

**Note**: Skip this step if you are using the router provided with your service activation.

Create the router **vpn_router** and set its gateway to be the external network.

	neutron router-create vpn_router
	neutron router-gateway-set vpn_router $EXT_NET

#### Attach the router to the subnet #### {#AttachRouterCLI} 

**Note**: Skip this step if you are using the default configuration provided with your service activation.

    neutron router-interface-add vpn_router $SUBNET_ID  


##For further information## {#ForFurtherInformation}

* For information about the router details screen, take a look at the [Viewing router details](/mc/compute/networks/view-router/) page
For the full reference of supported HP Cloud CLI commands for Windows PowerShell, see [HP Cloud Environment CLI Software for Windows PowerShell Command Line Reference](docs.hpcloud.com/cli/windows/2/reference/)
* For basic information about our HP Cloud compute services, take a look at the [HP Cloud compute overview](/compute/) page
* Use the MC [site map](/mc/sitemap) for a full list of all available MC documentation pages
* For information about the Open Stack networking features, surf on over to [their networking wiki](https://wiki.openstack.org/wiki/Quantum)
