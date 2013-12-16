---
layout: default
title: "Before You Install"
permalink: /cloudos/install/before-you-install/
product: cloudos

---

<a name="_top"> </a>

<script> 
 
function PageRefresh { 
onLoad="window.refresh" 
} 
 
PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/install/overview/">&#9664; PREV</a> | <a href="/cloudos/install/">&#9650; UP</a> | <a href="/cloudos/install/admin-node-prerequisites/">NEXT &#9654;</a> </p>

# Before You Install

Before you can start working in the HP Cloud OS Operational Dashboard, you must:

* [Plan the Infrastructure for a Cloud](#plan-the-infrastructure-for-a-cloud)
* [Set up the VM guest](#set-up-the-vm-guest)
* [Boot the Admin Node Using the HP Cloud OS ISO](#boot-the-admin-node-using-the-hp-cloud-os-iso)
* [Launch the Operational Dashboard](#launch-the-operational-dashboard)

## Plan the Infrastructure for a Cloud

For the simplest deployment, a cloud environment requires a Cloud Administration Node (Admin Node), a Cloud Controller Node, and a set of Compute Node(s). You may need support from your IT
Administrator to correctly capture information about your environment.

You need to determine the type of cloud you want to create for your organization: private, public, or hybrid. With HP Cloud OS, you can create private or hybrid clouds. You can create public clouds with HP Public Cloud. See the [Introduction to Cloud Types](/cloudos/cloudtypes/). 

Based on the type of cloud you intend to create, you can determine the requirements for the server, network, and storage infrastructures 
that are described and illustrated in the following sections:

* [Server Infrastructure](#server-infrastructure)
* [Network Infrastructure](#network-infrastructure)
* [Storage Infrastructure](#storage-infrastructure)

### Server Infrastructure

The following table identifies server requirements for your cloud environment.

<table style="text-align: left; vertical-align: top;">

<tr style="background-color: #C8C8C8;">
<th>Node Type</th>
<th>Virtual/Physical Node</th>
<th>CPU Cores</th>
<th>Memory</th>
<th>Internal Storage</th>
<th>NICs</th>
<th> <nobr>  OS (included as part of ISO)  </nobr></th>
</tr>

<tr style="background-color: white; color: black;">
<td> Admin Node </td>
<td> Virtual Only </td>
<td> 4 * </td>
<td> 16 GB * </td>
<td> 20 GB </td>
<td> 2 </td>
<td> <nobr> Ubuntu Server 12.04 LTS (64-bit) </nobr> </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Controller Node </td>
<td> Virtual and Physical </td>
<td> 4 </td>
<td> 32 GB </td>
<td> 60 GB </td>
<td> 1 ** </td>
<td> Ubuntu Server 12.04 LTS (64-bit) </td>
</tr>		

<tr style="background-color: white; color: black;">
<td> Compute Node </td>
<td> Physical Only </td>
<td> 4 *** </td>
<td> 32 GB </td>
<td> 60 GB </td>
<td> 1 </td>
<td> Ubuntu Server running KVM hypervisor 12.04 LTS (64-bit) </td>
</tr>			

<tr style="background-color: white; color: black;">
<td> Swift Controller (Ring, Proxy, Dispersion) </td>
<td> Virtual or Physical </td>
<td> 8 </td>
<td> 12 GB </td>
<td> 20 GB </td>
<td> 3 </td>
<td> Ubuntu Server 12.04 LTS (64-bit) </td>
</tr>	   

<tr style="background-color: white; color: black;">
<td> Storage Node </td>
<td> Virtual or Physical </td>
<td> 8 </td>
<td> 12 GB </td>
<td> 60 GB </td>
<td> 3 </td>
<td> Ubuntu Server 12.04 LTS (64-bit) </td>
</tr>	   

</table>

\* For the Admin Node, the CPU and memory should be dedicated to this VM and not shared with other virtual machines on the same KVM host.

\*\* External Internet connection required for public or hybrid cloud.

\*\*\* Intel or AMD hardware virtualization support required. The CPU cores and memory requirements must be sized based 
on the VM instances hosted by the compute node.
### Network Infrastructure

To plan the Cloud Environment's network infrastructure, see the following sections:

* [Switch Configuration](#switch-configuration)
* [Network Configuration](#network-configuration)

#### Switch Configuration

Your environment must provide physical switches and wiring for 3 to 4 networks, depending on the cloud configuration. 
Or the environment must support the 802.1Q specification (VLAN tagging/trunking) for tagged networks.

#### Network Configuration

The following table identifies network requirements for your cloud environment.

<table style="text-align: left; vertical-align: top;">

<tr style="background-color: #C8C8C8;">
<th> Network </th>
<th> Speed </th>
<th> <nobr> Tagged * </nobr> </th>
<th> Required </th>
<th> Notes </th>
</tr>

<tr style="background-color: white; color: black;">
<td> admin Network </td>
<td> 1 Gb </td>
<td> N </td>
<td> Y </td>
<td> Used for administrative functions, such as managed node installation, TFTP booting, DHCP assignments, system logs, backups, and other monitoring tasks. This also carries
cinder-volume traffic. Must be an Isolated Private Network. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> bmc Network * </td>
<td> 1 Gb </td>
<td> N </td>
<td> N </td>
<td> Baseboard Management Controller LAN for Intelligent Platform Management Interface (IPMI) traffic. For test purposes only. </td>
</tr>	

<tr style="background-color: white; color: black;">
<td> bmc_vlan Network </td>
<td> 1 Gb </td>
<td> Y (100) </td>
<td> N </td>
<td> Baseboard Management Controller VLAN (IPMI traffic VLAN). For test purposes only. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> os_sdn Network </td>
<td> 1 Gb </td>
<td> Y (700) or N.  Default is N (not tagged). </td>
<td> Y </td>
<td> OpenStack Software-Defined-Network. This network is for data traffic between the Virtual Machine instances, and the traffic from the instances to the Controller Node. Must be an
isolated Private Network. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> public Network </td>
<td> 1 Gb </td>
<td> Y (300) or N.  Default is N (not tagged). </td>
<td> Y </td>
<td> Must provide a pool of IP addresses for the controller node and floating IP assignments. Size of the pool depends on the number of usage requirements. This network handles
traffic to the outside world for the instances. </td>
</tr>

</table> 

\* Default configuration of network tagging to combine logical networks onto a single physical network. Recommended practice is to use a separate Network for each type of network instead of
VLAN. See [Customize Network Settings (Required)](/cloudos/install/customize-network-settings) for instructions on customizing the os_sdn, public and admin networks.


### Storage Infrastructure

The following table identifies storage requirements for your cloud environment.

<table style="text-align: left; vertical-align: top;">

<tr style="background-color: #C8C8C8;">
<th> Node Type </th>
<th> Internal Storage </th>
<th> Partition Scheme </th>
<th> File System Mounts </th>
<th> Notes </th>
</tr>

<tr style="background-color: white; color: black;">
<td> Admin node </td>
<td> <nobr> >= 20 GB </nobr> </td>
<td>  </td>
<td>  </td>
<td> </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Controller node </td>
<td> >= 60 GB </td>
<td> Block storage </td>
<td> <nobr> /tmp: >= 200 GB </nobr> <br />
/var/lib/glance/images: >= 300 GB <br /> <br />
LVM Volume Group: >= 2 TB, **or** <br />
/var/lib/cinder/volumes: >= 2 TB </td>
<td> <nobr> The controller node hosts the Image </nobr> and Volume Management services, which require block storage, either Direct Attached Storage or SAN or iSCSI. 
The sizing depends on two factors: Size and number of images, and Size and number of volumes, attached to the VM instances.

**Tip:** Infrastructure services like RabbitMQ, PostgreSQL and CouchDB require their repositories to be on high-performance storage. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Compute node(s) </td>
<td> >= 60 GB </td>
<td> Block storage </td>
<td> /tmp: >= 150 GB <br/>
/var/lib/nova/instances: >= 300 GB </td>
<td> The compute node(s) need storage space for on-instance, ephemeral disks. The sizing is based on the flavor chosen for the launched instances. </td>
</tr>

</table> 

This illustration shows how the storage space is used by the VM instances in a cloud's infrastructure:

<img src="media/cloudos-compute-node.png" title="Storage space used by VM instances in a cloud's infrastructure" />

## Set Up the VM Guest

You can only install the Admin Node on a virtual machine. Here are general guidelines for creating a virtual machine in an existing or new hypervisor infrastructure:

1. Configure the hypervisor host's network. The host must provide connectivity to the Virtual Machine guest on an isolated private network to all the bare-metal nodes' port eth0. And, the guest must also have connectivity to a routable network for Internet access.

2. Create a virtual machine with the hardware configuration suggested in "Plan Server, Network and Storage Infrastructure for a Cloud" ( link ) . The following configuration must be
reviewed during this step:

 a. Ensure the guest's primary NIC is bridged or connected to the admin network and the second NIC is bridged or connected to a routable network for Internet access.

 b. For the disk configuration, the default Disk bus type/controller uses proprietary technology. Ensure you set that to the IDE/SCSI type.
 
 c. If your hypervisor is KVM, ensure the virt type is set to KVM.
 
3. Download the Cloud OS ISO to the host's local file system or data store.

4. Configure the VM guest to point to the ISO as a CD/DVD drive or install media ISO image. 

## Boot the Admin Node Using the HP Cloud OS ISO

To boot the Admin Node using the ISO:

1. Power ON the virtual machine and open up its console.

2. (Optional) Power DOWN the Admin Node VM, edit it to disconnect the ISO CD, then Power UP the VM.

The Operational Dashboard has been successfully installed on the Admin Node.

## Launch the Operational Dashboard

After you boot from the HP Cloud OS ISO, you are ready to launch the Operational Dashboard to set up the Admin Node.

To launch the Operational Dashboard:

1. From the virtual machine client, open a Firefox or Google Chrome browser that **does not have a proxy set**.

2. In the browser, enter **http://192.168.124.10:9000** to launch the Operational Dashboard user interface. 
IMPORTANT: Use Google Chrome or Mozilla Firefox.

3. On the Environment tab, review the types of servers, connections, and networks in your environment.

## Next Step

Proceed to the next topic, [Set the Admin Node Prerequisites](/cloudos/install/admin-node-prerequisites/), to begin the process of setting up and installing the Admin node.  

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

