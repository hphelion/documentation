---
layout: default
title: "HP Cloud Networking:  Network setup quick start guide"
permalink: /compute/network/
product: compute
categories: neutron
tags: networking neutron vpn

---
# HP Cloud Networking:  Quick start guide 

With HP Cloud Networking you can set up an IPsec, or site-to-site, VPN connecting your external network directly to your HP cloud virtual network. This guide provides the basic instructions for setting this up with your network using strongSwan. 

**Note:** These instructions use an Ubuntu server instance. You may, of course, choose to use another instance type and still use these directions as a general guide for setting up your VPN.

A default configuration comes with HP Public Cloud compute activation and includes:

* A network 
* A subnet
* A router connecting the subnets to the Internet
* A security group with basic server options, both SSH and Ping rules

You can use the default network to deploy HP Public Cloud compute instances (virtual servers), or create a network configuration through the HP Public Cloud Console with the following instructions.

This guide covers the following:

- [Overview](#top)
- [Audience](#audience)
- [Key terms](#terms)
- [Quick start](#quickstart)
- [Tips and best practices](#tips)
- [Troubleshooting](#troubleshooting)
- [For further information](#refs)


## Overview ## {#top}

HP Cloud Networking is a virtual networking service that provides network connectivity and addressing for HP Cloud compute devices. It is based on OpenStack Networking open source software.

Before starting, ensure that you have adequate permissions to accomplish each of the following steps.  

### Audience ### {#audience}
This guide is designed for those in the following or similar roles:   

- Networking Engineers    
- Networking Administrators
* Cloud Administrators

To use this solution effectively, you should be familiar with   

- Local network configuration in HP Cloud     
- HP Cloud Compute and Networking services 
- OpenStack Nova and Neutron CLI and API   
- Virtual Private Networks (VPN)    
- strongSwan or other IPsec-based software solutions   
    

### Key Terms ### {#terms}

Key terms include:

- **Floating IP Addresses** - On-demand, public IP addresses on a network. With HP Cloud, you can allocate several floating IP addresses and assign them to virtual servers. 
- **Network** - Allows you to define network connectivity and addressing in the Cloud, providing "networking as a service" between interface devices managed by other HP Public Cloud, such as compute. 
- **Port** - A connection point for attaching a single device, such as a virtual server's NIC, to a virtual network.  The port describes the associated network configuration, such as the MAC and IP addresses to be used by the attached device.
- **Router** - A device that forwards data packets along networks. 
- **Subnet** - Contains IP address blocks that assign IP addresses to virtual servers. In addition, a subnet can have a gateway, a list of DNS name servers, and host routes. Information provided by DHCP is pushed to servers with interfaces associated with the subnet.


back to the [top](#top)

###API###
 
You can use a low level, raw REST API to access HP Cloud compute. For more information on using the HP Cloud Networking API, see [HP Cloud Networking API Specifications](https://docs.hpcloud.com/api/v13/networking).


###Bindings###

You can use any of several language bindings to access HP Cloud compute. For more information on using the HP Cloud Networking API, see [HP Cloud binding support](http://docs.hpcloud.com/bindings/).

###CLI###

You can use any of several command-line interface software to access HP Cloud compute. For more information on using the HP Cloud Networking API, see [HP Cloud CLI](http://docs.hpcloud.com/cli/).


## Quick start guide ## {#quickstart}

This guide provides the information you will need to get started in setting up a network

<img src="media/HPCS-VPC-VPN-SingleSite-Connection-Layer3-new-novendor.jpg" width="600" alt="Basic VPN setup" />

If you have not previously created an account and activated the compute service please sign up at [http://hpcloud.com](http://hpcloud.com). Make sure you activate a compute instance in HP Cloud version 13.5 to access the networking capabilities.

This section includes how to:

* [Create a network](#Createanetwork) 
* [Create a subnet](#Createasubnet) 
* [Create a router](#Createarouter)
* [Connect your network](#Connectyournetwork)

This guide provides instruction for using the HP Public Cloud Console and for using the Python NovaClient and the Python NeutronClient CLIs. 

To use the Nova and Neutron CLIs, you need to install the [compute](https://docs.hpcloud.com/api/v13/compute/) and [networking](https://docs.hpcloud.com/api/v13/networking/) clients. 

This guide assumes that you are using Ubuntu as the operating system, but the concepts covered work in the OS of your choice. 

All commands in this guide use command line interfaces. 

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

###Create a network### {#Createanetwork}

####Create a network using the console####  {#CreatenetworkConsole}

Use the following steps to create a network using the HP Public Cloud Console:

1. Login to [HP Public Cloud](https://horizon.hpcloud.com/) with your username and password.

2. On the HP Public Cloud console interface, click "Project," on the left-side bar then "Networks" under "Manage Networks."

    <img src="media/CreateaNetworkImage1.png" width="580" alt="" />

3. Click "+Create Network" in the right-hand navigation.

    <img src="media/CreateaNetworkImage2.png" width="580" alt="" /> 

4. Enter a "Network Name" in the "Create Network" pop-up screen, leave the "Admin" State box checked, and continue to the directions in "Create a subnet" below.

    <img src="media/CreateaNetworkImage3.png" width="580" alt="" />

####Create a network using the CLI####  {#CreatenetworkCLI}

Use the following steps to create a network using the CLI:

**Note**: Skip this step if you are using the network and subnet provided with your service activation.

In the example we use **vpn_network** for the name of the network.

    neutron net-create vpn_network
    neutron subnet-create $NETWORK_ID $CIDR 

###Create a subnet using the console### {#CreatesubnetConsole}

Use the following steps to create a subnet using the HP Public Cloud Console:

1. Login to [HP Public Cloud](https://horizon.hpcloud.com/) with your username and password.

2. Click the "Subnet" tab in the "Create Network" pop-up screen. 
 
**Note**: If you click the "Create" button on the "Network" pop-up before setting up a "Subnet,"  you are prompted to specify a network address or turn off the option to create a subnet through an error message.

3. Enter the subnet name.

4. Click in the "Network Address" box. The pop-up message states the network address is in Classless Inter-Domain Routing (CIDR) format; i.e.,  000.000.0.0/00. Enter the network address displayed: 192.168.0.0/24.

5. Keep the IPv4 default in the "IP Version" box unless you know you have moved to IPv6.

6. Leave the "Gateway IP" box blank to use the default value of the network address; e.g., 192.168.0.1 for 192.168.0.0/24.

7. Leave the "Disable Gateway" box unchecked to use the default and click "Create." 

    <img src="media/CreateaSubnetImage1.png" width="580" alt="" />

8. The "Networks" screen displays your network name and associated subnets.

    <img src="media/CreateaSubnetImage2.png" width="580" alt="" />

9. To see a graphic display of your network setup, click "Network Topology" under "Manage Network" in the left-hand navigation.  

    <img src="media/CreateaSubnetImage3.png" width="580" alt="" />

####Create a subnet using the CLI####  {#CreatesubnetCLI}

Use the following steps to create a subnet using the CLI:

**Note**: Skip this step if you are using the network and subnet provided with your service activation.

In the example we use **vpn_network** for the name of the network.

    neutron subnet-create $NETWORK_ID $CIDR 

###Create a router using the console### {#CreaterouterConsole} 

Use the following steps to create a router using the HP Public Cloud Console:

1. Login to [HP Public Cloud](https://horizon.hpcloud.com/) with your username and password.

2.  If on the "Network Topology" screen, click "Create Router" in the top right-hand navigation. If not, click "Routers" under the "Manage Network" heading in the left-hand navigation.

    <img src="media/CreateaRouterImage1.png" width="580" alt="" />

3.  If you clicked "+Create Router" on the "Network Topology" screen, enter your router name and click "Create Router." If you clicked "Routers" under "Manage Network", click "+Create Router" in the upper right-hand navigation and enter the router name in the pop-up. 
    
4. Click "Router" in the left-hand navigation to see the router name and status. **Note**:  Click the router "Name" to display its ID number and status. If you do this, click "Routers" in the left-hand navigation to make the "Set Gateway" action available for the following step or click the "Back" button in your browser.

    <img src="media/CreateaRouteImage2.png" width="580" alt="" />

5. On the "Routers" page, click "Set Gateway" under "Actions" to connect your router to the Internet.

     <img src="media/CreateaRouterImage3.png" width="580" alt="" />

6. Click the drop-down menu in the "External Network" box in the "Set Gateway" pop-up, select "Ext-Net," and click "Set Gateway."

    **Note**: The external network is the router's default route, with the router acting as a gateway for external connectivity. While you can configure a subnet that is internal-only, you must connect it to another subnet with external connectivity.
    
    <img src="media/CreateaRouterImage4.png" width="580" alt="" />
    
####Create a router using the CLI####  {#CreaterouterCLI}

Use the following steps to create a router using the CLI:

**Note**: Skip this step if you are using the router provided with your service activation.

Create the router **vpn_router** and set its gateway to be the external network.

	neutron router-create vpn_router
	neutron router-gateway-set vpn_router $EXT_NET

###Connect your network using the console### {#ConnectnetworkConsole}

Use the following steps to connect to a network using the HP Public Cloud Console:

1. Login to [HP Public Cloud](https://horizon.hpcloud.com/) with your username and password.

2. Click the router name on the "Routers" page.

3. Click "+Add Interface" on the far-right of the "Router Details" page. 

    <img src="media/Connectyournetworkimage1.png" width="580" alt="" />

4. Click the drop-down menu in the "Select Subnet" box in the "Add Interface" pop-up and click on the network you configured. **Note**: You can optionally specify an IP address in the box provided, but the default interface IP address is the selected subnet's external gateway and the best choice unless you are setting up a more complicated connection. Any IP address you specify must belong to the subnet in the drop-down menu. 

5. Click "Add Interface."

    <img src="media/Connectyournetworkimage2.png" width="580" alt="" />

**Important: To delete a network, you must delete any instances running on that network (instance creation covered below) and the router interface before deleting the network. If you don't have instances on the network, you still have to delete the router interface before deleting the network**:

6. If you have created an instance, click "Instances" on the left-hand bar under "Manage Compute."

7. Select the check box for any instance running on the network you want to delete and click "Terminate Instances" in the upper right-hand navigation. 

8. Click "Routers" under "Manage Network in the left-hand bar.

9. Click on the router "Name." 

10. On the "Router Details" page, select the check box next to the "Interface" name, and click "Delete Interface." 

11. Click "Networks" in the left-hand bar, select the check box next to the network you want to delete, and click "Delete Networks" in the upper right-hand navigation. 


####Connect to a network using the CLI####  {#CreatenetworkCLI}

Use the following steps to connect to a network using the CLI:

**Note**: Skip this step if you are using the router provided with your service activation.

Create the router **vpn_router** and set its gateway to be the external network.

	neutron router-create vpn_router
	neutron router-gateway-set vpn_router $EXT_NET

### Set up the private network ### {#gtwy}

#### Create a network and subnet

#### Attach the router to the subnet  
**Note**: Skip this step if you are using the default configuration provided with your service activation.

    neutron router-interface-add vpn_router $SUBNET_ID  


### Create ports ### {#port}

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


### Create compute instances ### {#instances}
You need to create two instances (VMs) to test and run your VPN.

#### Create a keypair to allow ssh to the instance

    nova keypair-add ipsec_vpn_gateway > ipsec_vpn_gateway.pem
    chmod 600 ipsec_vpn_gateway.pem

The above command creates a new keypair called **ipsec_vpn_gateway**.  View all available keypairs with the **nova keypair-list** command.

    nova keypair-list
    +-------+--------------------------------------------------------------+
    |  Name              |                   Fingerprint                   |
    +--------------------+-------------------------------------------------+
    | ipsec_vpn_gateway  | b0:18:32:fa:4e:d4:3c:1b:c4:6c:dd:cb:53:29:13:82 |
    | mykey2             | b0:18:32:fa:4e:d4:3c:1b:c4:6c:dd:cb:53:29:13:82 |
    +--------------------+-------------------------------------------------+


#### Select your compute image

To boot a compute instance you will need to know which [operating system and size of image](https://docs.hpcloud.com/api/v13/compute/) you would like to use.  For the purpose of this guide, we use a small image using Ubuntu. Select the type of image you want and then assess the amount of bandwidth you need and select the appropriately sized flavor.

#### Boot the gateway instance and test instance

Boot two instances&mdash;one to use as the VPN gateway (vm-gateway) and the other (vm-test) to test with.

- --image:  the name or ID of the image to launch.  View available images by running **nova image-list**
 
- --key_name:  the name of the key to inject into the instance at launch
- --flavor:  the name or ID of the size of the instance to create.  View the list of available flavors by running `nova flavor-list`.

Example: 
  
    nova boot --image <image-name> --flavor=100 --key_name=<keypair-name> --security-groups=<security-group-name> --nic port-id=<portid-1> <name of vm>

Example:  Create the gateway instance 

    nova boot --image small --flavor=100 --keyname=ipsec_vpn_gateway --nic port-id=$PORT_ID1 vm-gateway

Example:  Create the test instance   

    nova boot --image small --flavor=100 --keyname=ipsec_vpn_gateway --nic port-id=$PORT_ID2 vm-test

#### Validate status of instances

Check the status of the launched instance(s):   
  
    nova list
    +--------------------------------------+------------+--------+-----------------+
    | ID                                   | Name       | Status | Networks        |
    +--------------------------------------+------------|--------+-----------------+
    | 558159d5-1257-43db-b261-523207c8a290 | vm-gateway | ACTIVE | mynet=10.2.0.21 |
    | 8c0dbcaa-8ef7-484f-8f89-47760fdcd44a | vm-test    | ACTIVE | mynet=10.2.0.33 |
    +--------------------------------------+------------+--------+-----------------+

After a short period of time the instance changes from BUILD to ACTIVE.  You can then connect to the launched instance using the private key that you created.

### Associate floating IPs ### {#floatip}

#### Create the floating IPs

Next, you need to create the floating IPs associated with the external network (Ext_Net).  Each created floating IP has an ID that we will refer to as `$FLOATING_ID1` and `$FLOATING_ID2`.

    neutron floatingip-create $EXT_NET
    neutron floatingip-create $EXT_NET

#### Associated each floating IP with  a port

    neutron floatingip-associate $FLOATING_ID1 $PORT_ID1
    neutron floatingip-associate $FLOATING_ID2 $PORT_ID2

To show the floating IP: 
  
    neutron floatingip-show $FLOATING_ID1
    neutron floatingip-show $FLOATING_ID2

**Note:** You can also assign floating IPs via the Nova API and subsequently call the command `nova list` to display the instances and their status.




## Tips and best practices ## {#tips}


back to the [top](#top)

## Troubleshooting ## {#troubleshooting}


back to the [top](#top)

## For further information ## {#refs}

Check out the following pages for more information on using HP Cloud Networking services:

- [Getting Started with Networking 13.5](/compute.networking.getting-started)
- [HP Cloud Networking Overview](/networking/)
- [UNIX CLI Network Examples](http://docs.hpcloud.com/cli/unix/network)
- [HP Cloud Networking API Specifications](https://docs.hpcloud.com/api/v13/networking/)
- [HP Cloud Compute Service API Reference](https://docs.hpcloud.com/api/v13/compute/)
- [Known Issues and Best Practices in Compute and Networking in 13.5](https://community.hpcloud.com/article/known-issues-and-best-practices-compute-and-networking-135)
- [OpenStack networking wiki](https://wiki.openstack.org/wiki/Quantum)

back to the [top](#top)
