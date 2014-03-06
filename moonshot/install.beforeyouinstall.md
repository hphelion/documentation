---
layout: default
title: "Important Tasks Before You Install"
permalink: /cloudos/moonshot/install/before-you-install/
product: moonshot

---


<script> 
 
function PageRefresh { 
onLoad="window.refresh" 
} 
 
PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/install/overview/">&#9664; PREV</a> | <a href="/cloudos/moonshot/install/">&#9650; UP</a> | <a href="/cloudos/moonshot/install/install-setup-admin-node/">NEXT &#9654;</a> </p>

# Important Tasks Before You Install

Before you can start working in the HP Cloud OS for Moonshot Operational Dashboard, you must:

* [Plan the Infrastructure for a Cloud](#plan-the-infrastructure-for-a-cloud)

* [Review the Checklist of Values You'll Need in Advance](#review-checklist)

## Plan the Infrastructure for a Cloud

This section defines the minimum infrastructure requirements to standup a cloud. You will need support from your IT administrator to correctly capture information about your environment.

* [Deployment Architecture](#deployment-architecture)

* [Server Infrastructure](#server-infrastructure)

* [Network Infrastructure](#network-infrastructure)

### Deployment Architecture

A simple cloud environment would include:

* A Cloud Administration Node (Admin Node)

* A Controller Node 

* A Baremetal Host

The following diagram depicts a simplified deployment scenario. 

<img src="media/moonshot-deployment.png"></img>

<b>Note</b>: You can add multiple Baremetal Hosts with the same type of network connectivity shown in the diagram.

### Server Infrastructure

Refer to the [Support Matrix](/cloudos/moonshot/prepare/supportmatrix/) for details about the following:

* [Server infrastructure for HP Cloud OS for Moonshot](/cloudos/moonshot/prepare/supportmatrix/#server)
* [Hypervisor recommendations for HP Cloud OS for Moonshot](/cloudos/moonshot/prepare/supportmatrix/#hypervisor)
* [Node requirements for HP Cloud OS for Moonshot](/cloudos/moonshot/prepare/supportmatrix/#nodereq)
* [Bulk server provisioning node requirements for HP Cloud OS for Moonshot](/cloudos/moonshot/prepare/supportmatrix/#nodereq-bulk)
* [Moonshot chassis firmware version](/cloudos/moonshot/prepare/supportmatrix/#firmware)
* [Moonshot cartridges supported](/cloudos/moonshot/prepare/supportmatrix/#cartridges)
* [Operating systems supported ](/cloudos/moonshot/prepare/supportmatrix/#ossupp)
* [Workloads supported](/cloudos/moonshot/prepare/supportmatrix/#workloads)
* [Supported deployment scenario](/cloudos/moonshot/prepare/supportmatrix/#deployment)
* [Software requirements](/cloudos/moonshot/prepare/supportmatrix/#software)

### Network Infrastructure

The following networks are utilized in the HP Cloud OS for Moonshot infrastructure:

* <b>Admin Network</b>: Provides connectivity between the Admin node, the Controller node and the Baremetal host. The Admin node provides DHCP and PXE services on this network.

* <b>Nova_Flat network</b>: Utilized for connectivity between the Controller and Baremetal hosts and the Moonshot cartridges. The Controller node provides 
DHCP and PXE services for this network. Workloads are provisioned to the Moonshot cartridges using this network.

* <b>IPMI Network</b>: Utilized for communication between the Baremetal host and the Moonshot Chassis Manager. This includes chassis and 
cartridge discovery, power control of cartridges and nodes, and monitoring of the health of the Moonshot systems.

* <b>Public Network</b>: Provides public access to the HP Cloud OS for Moonshot Administration Dashboard and external access to 
the Internet for the Admin node and Controller node.

<b>Notes</b>:

* The Admin node and the Controller node utilize Internet access to obtain updates and workload content from HP. If Internet access is not feasible from your 
datacenter, then it is possible for updates and workloads to be downloaded locally and then uploaded to your cloud environment.

* The Controller node will require a static IP address on the Public network. Please consult with your network administrator to obtain the required static IP address.

#### Network Configuration

As shown in the deployment scenario diagram, HP Cloud OS for Moonshot will have the following network configuration:

* <b>Admin Node</b>: 2 NICs - Admin Network and Public Network

* <b>Controller Node</b>: 3 NICs - Admin Network, Nova_Flat Network, and Public Network

* <b>Baremetal Host</b>: 3 NICs - Admin Network , Nova_Flat Network, and IPMI Network

The NICs per node/host NIC are as follows:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<tr>
<th> </th>
<th> eth0 </th>
<th> eth1 </th>
<th> eth2 </th>
<tr>

<tr style="background-color: white; color: black;">
<td> <b>Admin Node</b> </td>
<td> Admin Network </td>
<td> Public Network</td>
<td> </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Controller Node</b> </td>
<td> Admin Network </td>
<td> Nova_Flat Network </td>
<td> Public Network</td> 
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Baremetal Host</b> </td>
<td> Admin Network </td>
<td> Nova_Flat Network </td>
<td> IPMI Network </td>
</tr>

</table>

## Review the Checklist of Values You'll Need in Advance {#review-checklist}

In addition to the information presented already in this topic, please review the following checklist before starting the installation. You'll need to specify the following types of information during the installation and configuration process. 

### Operation Dashboard Checklist

* In <b>Environment</b> > <b>Prerequisites</b>, the dialogs will prompt for your external DNS IP details.

* In <b>Edit Prerequisites</b> > <b>Admin Node Internet Access</b> > <b>Network</b>, you will need to specify your:
 * NIC details for the public interface
 * Http Proxy information:
  * Host
  * Port-8080
  * Non-Proxy Hosts:  10.\*|192.\*|127.0.\*|localhost

* In <b>Environment</b> > <b>Networks</b>, for your <b>Public</b> network: 
 * On the <b>Edit Network</b> dialog, you will need to specify your Subnet, Netmask, and Router IP values.
 * On the <b>Edit Network Ranges</b> dialog, you will need to specify your Node Type, IPV4 Start Address, and IPV4 End Address values.

* In <b>Environment</b> > <b>Networks</b>, for your <b>IPMI</b> network: 
 * On the <b>Edit Network</b> dialog, you will need to specify your Subnet, Netmask, and Router IP values.
 * On the <b>Edit Network Ranges</b> dialog, you will need to specify your Node Type, IPV4 Start Address, and IPV4 End Address values.

* In <b>Environment</b> > <b>Networks</b>, for your <b>Nova_Flat</b> network: 
 * On the <b>Edit Network</b> dialog, you will need to specify your Subnet, Netmask, and Router (mandatory) IP values.
 * On the <b>Edit Network Ranges</b> dialog, you will need to specify your Node Type, IPV4 Start Address, and IPV4 End Address values.

* <b>Note</b>: You will be able to skip the Edit options for the Admin Network. 
 
* In <b>Cloud</b> > <b>Manage Clouds</b> > <b>Create Cloud</b>, you will only need to enter a <b>Name</b> for your cloud. You can use default values for other options; however, plan ahead 
to specify new, non-default passwords for the Admin user, Arch user, and Trash user. 

* In <b>Cloud</b> > <b>Manage Clouds</b> > <b>Create Compute Region </b>dialog, you will need to enter a <b>Name</b> for your region. 
Recommended: create multiple regions.  On each Create Compute Region dialog, on the Controller & Compute Nodes tab, you will need to enter the number of nodes that participate in the region. 

### Administration Dashboard Checklist

* In <b>Project</b> > <b>Access and Security</b> > <b>Create Keypair</b>, you will just need to enter the Keypair name. 

* <b>Note</b>: You will not need to define flavors to complete the post-install steps.  As explained later in 
[Launch Administration Dashboard for Post-Deployment Tasks](/cloudos/moonshot/install/launch-admin-dashboard), 
a flavor will be generated automatically for you based on your Moonshot server cartridge type:  hp_moonshot_server (for an 
HP ProLiant Moonshot Server Cartridge) and hp_moonshot_m300 (for an HP ProLiant m300 Server Cartridge). 

* In <b>Project</b> > <b>Infrastructure</b> > <b>Images</b>, you will need to create images, and the associated Kernel and RAM disk images. You will not need 
to specify the Description, Minimum Disk, and Minimum RAM values. 

* In <b>Project</b> > <b>Moonshot Management</b>, you will need to specify the chassis display name, Chassis Manager IP, Chassis Manager password, and Managing Host Name.  

* In <b>Project</b> > <b>Infrastructure</b> > <b>Images</b> > <b>Launch</b> > Launch Instance dialog, you will need to specify the image, instance name, 
networking, and (pre-defined) flavor. 

## Next Step

Proceed to the next topic, [Install and Set Up the Admin Node](/cloudos/moonshot/install/install-setup-admin-node/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

