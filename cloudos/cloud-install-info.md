


## Set up a Private or Hybrid-only Cloud

Here is a summary of the steps required to install a private or hybrid-only cloud. For more specific instructions on Server Types, Connections, and Networks, 
please refer to [Install &amp; Configure Your Clouds](/cloudos/install/). 

### Server Types

The HP Cloud OS Operational Dashboard lets you capture new or use existing server definitions about the networking ports for the various servers in your 
bare-metal cloud environment. If all servers in your cloud are the same machine type (homogenous nodes), you will not need to configure anything in this 
panel. However, if the servers in your cloud are different types of machines (heterogeneous nodes) or have different networking cards installed, you may 
be required to use a Linux utility such as dmidecode to determine the bus addresses of your server's network ports. This is necessary in order to define 
the correct order of those ports for the various server types so that all the servers have the same enumeration of network ports (0, 1, 2, 3, and so on) 
across the cloud. If you don't configure the server types for a cloud with heterogeneous nodes in this way, you will experience networking failures 
because the machines will not have the same network port enumeration order.

### Connections

After the enumeration of ports is consistent across all machines in the cloud, the Connections panel defines those ports into a set of 
logical connections (interfaces) that will be used to eventually define networks. To define a connection set, you create a network mode (single, dual, team, and so on) 
along with a list of logical connection interfaces (intf0, intf1, and so on) with each one being bound to a port, defined by bandwidth and port number. 

Examples of Physical Interface values:

* `1Gb (preferred) on 1st port`
* `1Gb (preferred) on 2nd port`
* `1Gb (preferred) on 3rd port`

In this Dual mode example, `1Gb (preferred) on 2nd port` means a one gigabit network for port 2, as enumerated by default from the server's BIOS or as overridden 
in the Server Types panel. The "preferred"  tag suggests that if the NIC/port does not support 1Gb, Cloud OS falls back to the next maximum 
speed supported by the NIC or port.  However, if there is no preferred tag, it means the port has to support 1Gb; otherwise the deployment may fail.

In the Edit Connections dialog, the physical interface descriptions are abbreviated.  For example, `1g1` means a one gigabit network on port 1.  For details, see 
[Install &amp; Configure Your Clouds](/cloudos/install/).

### Networks

Finally, you will need to define the networks that are used in your IT environment. For each logical connection (such as `intf0, intf1`) a network is defined 
(admin network, public network, OpenStack Software Defined Network, BMC network, and so on). These definitions are used for various purposes in the cloud such 
as networking between the nodes and this Cloud Administration Node (such as admin network), the public or corporate network (such as public network) attached 
to your cloud, or a Baseboard Management Controller (BMC) network, which is a network that integrates with the Intelligent Platform Management Interface (IPMI) 
built into the server's motherboard allowing administrators to remotely control servers. The BMC network controls the bare-metal aspects required to install 
and remotely boot the servers from this Cloud Administration Node. The OpenStack Software Defined Network (`os_sdn`) carries traffic between virtual machines.

### Network Mode

When completing the setup of the Cloud Administration Node, you will be prompted to enter the network mode of the cloud you are creating. 
The network mode is based on the number of network ports all servers in the environment have to offer (single, dual, triple, and so on) and the 
configuration of that network mode in the Connections panel.

### IPMI Status

After completing the setup of the Cloud Administration Node, you will also be prompted to specify whether IPMI is enabled or disabled. 
For bare metal servers, IPMI is required to control the servers remotely. However, for virtual hybrid-only clouds you can disable IPMI. 
If IPMI is enabled, you can also capture a username and password (if required) to remotely access the machines. IPMI will use the BMC network/VLAN 
to connect to the IPMI interface and interact with your bare-metal servers. Consult your IT Administrator about your BMC network configuration 
and how to configure remote server control in the dashboard.

## Set up a Virtual Hybrid Cloud

If you are installing a virtual hybrid-only cloud, you can skip most, if not all, of this configuration. You only need to look at the default 
networking configuration to determine how to set up a virtual machine (which machine and how many virtual network ports) for your cloud.

Before completing the setup of the Cloud Administration Node for your cloud type, make sure all the information entered in the panels on 
the left side of this dashboard is accurate. Consult with your IT Administrator as needed, and see [Install &amp; Configure Your Clouds](/cloudos/install/).

When you are sure you have captured the correct information that describes your IT environment, go to the Configure tab (**Internal note: tab name correct?**) 
and click the Complete Install button (**Internal note: button name correct?**) to complete the setup of the Cloud Administration Node. 

After you complete this setup, the Deploy Cloud button (**Internal note: button name correct?**) appears in place of the Complete Setup button. 
Click this button to create the Cloud Controller and Compute Region Controllers (if needed) for your cloud.

## Tasks on the Cloud Tab

At this point, you have successfully completed the setup of the Cloud Administration Node. Now you are ready to update the prerequisites and move into 
managing nodes and standing up a cloud. The Prerequisites panel provides a description, the last time the prerequisite was successfully completed, and (if necessary) 
allows you to edit some details required to complete that prerequisite.

### Manage Nodes

Once the Prerequisite section is updated and complete, you can power on the nodes that will be involved in your cloud and manage them. 
Every 30 seconds the node list will be refreshed to sure it is current. As nodes are discovered, a temporary operating system is installed 
on each node. When the node is ready to be allocated, it enters the Not Allocated state. Managing nodes also involves assigning 
human-readable names (also called aliases) and descriptions to each node. Once the nodes are named correctly and in the Not Allocated 
state, you can select the Allocate Node action. This installs the final operating system on the selected node(s) and prepares them to be 
included in your cloud. You can click the name of any node to get more information on that node.

### Manage Clouds

#### Services

A cloud is made up of individual services installed and integrated together across one or more machines. Each service is large-grained with 
respect to its REST API and can be made up of many internal components distributed across one or more machines during installation. 
It is through plug-in points in each service, integrated to the service API of another service, that allows for compositing and integration 
into a single cloud architecture. For HP Cloud OS, each service has a code name and is responsible for a separate set of functionality 
that is encapsulated behind its coarse-grained API.

#### Controllers

While each service can be individually deployed, HP Cloud OS groups these services into two distinct groups for ease of architectural 
description and deployment: Cloud Controller and Resource Regions (specifically Compute Region Controllers). A Cloud Controller contains 
those services that are considered singular for a cloud instance (such as Keystone, Glance, Graffiti, Eve, and Focus) and defines the 
boundaries of the cloud instance from a security and identity perspective. A Resource Region is defined as a pool of resources 
(compute, storage, and so on) that can be consumed through a coarse-grained service API by consumers of the cloud (i.e., Nova as a Compute 
Region Controller). Further, a cloud instance may have none, one, or multiple resource regions of a particular type. For instance, a 
cloud can have more than one Compute Region Controller, which could be divided by geography, by availability, organization, hardware 
characteristics, and so on, or may have no Compute Region Controllers if you are installing a hybrid cloud that relies on the Compute 
Region Controller of another cloud for its resources.

#### Deployment

For smaller cloud environments, a Cloud Controller can be installed on a single node (machine) called a controller node whose sizing is dependent 
on the scale of the cloud instance. A Compute Region Controller (based on OpenStack Nova) has three main internal components of which two, the 
cloud controller and volume controller, can also be installed on the same controller node or can be separated onto other nodes for larger scale 
environments. The final component of the Compute Region Controller, the compute worker, must be installed on all compute nodes that make up the 
pool of compute resources to be consumed by cloud consumers.

If you were to install a small cloud instance, you could have a single node used as an Admin node which contains the cloud infrastructure installation 
services, a second controller node that contains the domain controller's services and the compute region's cloud controller and volume services, 
and one or more compute nodes to make up the compute resource pool. Although small, this size cloud instance can be scaled-out significantly 
either up-front or after the deployment, depending on how domain services are to be spread across machines, the number of Compute Region 
Controllers required, and scale requirements.

If you are creating a medium or large-scale cloud, please consult with your IT Administrator to understand the scalability of your 
hardware and how to best deploy the services to achieve the size and volume you require. Once a deployment plan is developed, 
complete the steps in the Cloud Controllers and Compute Region Controllers panels to deploy the services for your cloud accordingly. 