---
layout: default
title: "HP Helion OpenStack: Technical Overview"
permalink: /cloudos/commercial/technical-overview/
product: commercial

---


# HP Helion OpenStack: Technical Overview

The HP Helion OpenStack is OpenStack&reg; technology coupled with an HP Linux operating system designed to quickly standup an OpenStack cloud. Your new cloud supports up to 30 physical nodes and 600 virtual nodes making it ideal for small-scale and proof of concept deployments.

* [Deployment model](#deployment-model)

* [Service architecture](#service-archtecture)

* [Overcloud use cases](#overcloud-use-cases)
 
* [Reference architecture](/cloudos/commercial/reference-architecture)

* [Installation and configuration](/cloudos/commercial/install)
 

## Deployment model

HP Helion OpenStack uses the standard TripleO deployment model:

- Seed Cloud Image - A bootable image that is deployed into a VM
- Undercloud Image - An image that is deployed by the seed cloud onto a single physical server to create the Undercloud
- Overcloud Images - Images that are deployed onto physical servers by the Undercloud. Overcloud images have specialised roles:   Management, Swift, and Compute 

### Seed cloud

The seed cloud VM is a single node that is used to create the undercloud. 

The seed is not a full OpenStack installation, it is a cut-down installation providing only the software required to install the undercloud onto physical systems in the data center.

The seed cloud is a VM created to a Cloud OS specification as part of the install process and booted from an image provided as part of Cloud OS.  

Once the undercloud is created, you can discard the seed cloud VM, if needed.


### Undercloud

The undercloud is used to administer and maintain the hardware the physical machines in the data center for the purpose of making them run an OpenStack cloud. 

It installs physical machines using nova, then uses heat to deploy and configure the resulting booted systems. The sole purpose of the undercloud is to administer.

The undercloud is not a full OpenStack installation; it is a pared down installation providing only the software required to enable installing the overcloud onto physical systems in the data centre.

### Overcloud

The overcloud is the HP OpenStack installation where you interact with your cloud. Using the Horizon console, you manage and work with your cloud, such as creating instances, storing objects, and creating volumes.

This is a full, feature-rich OpenStack installation.

## Service architecture {#service-archtecture}

The following table briefly describes the HP Helion OpenStack services. For a complete description of these services, see the [Services overview](/cloudos/commercial/services/overview/) page.

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: #C8C8C8;">
<th> Service </th>
<th> Functionality </th>
</tr>

<tr style="background-color: white; color: black;">
<td> Cinder </td>
<td> Block storage for file systems attached to users' servers</td>
</tr>

<!-- Not in EAF; replace for Beta <tr style="background-color: white; color: black;">
<td> Sherpa </td>
<td> Provides patches and updates to HP Helion OpenStack</td>
</tr> -->

<tr style="background-color: white; color: black;">
<td> Glance </td>
<td> Image managment service providing OS images and metadata</td>
</tr>

<tr style="background-color: white; color: black;">
<td> Heat </td>
<td>Orchestrates cloud application templates to generate running cloud applications </td>
</tr>

<tr style="background-color: white; color: black;">
<td> HP Linux </td>
<td> Standardized HP Linux image used by Cloud OS services</td>
</tr>

<tr style="background-color: white; color: black;">
<td> Neutron </td>
<td>Virtual network configuration, management and connectivity for compute instances </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Nova </td>
<td>On-demand compute instances </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Swift </td>
<td> On-demand scalable storage capacity for archiving and data backup</td>
</tr>

<!-- Removed per Phil Day review 4/23
<tr style="background-color: white; color: black;">
<td> TripleO </td>
<td> Infrastructure provisioning, including Tuskar and Ironic</td>
</tr> -->
</table>

The following table briefly describes the foundation services in the HP Helion OpenStack. For a complete description of these services, see the [Services overview](/cloudos/commercial/commercial.services-overview) page.

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: #C8C8C8;">
<th> Service </th>
<th> Functionality </th>
</tr>

<tr style="background-color: white; color: black;">
<td> Ceilometer </td>
<td> Provides per-user usage metering of services consumed</td>
</tr>

<tr style="background-color: white; color: black;">
<td> Horizon </td>
<td> Provides administration and self-service user portal access to HP OpenStack services</td>
</tr>

<tr style="background-color: white; color: black;">
<td> Keystone </td>
<td> Identity service providing authentication and authorization services</td>
</tr>

</table>


## Overcloud use cases

### Identity Operations (Keystone)

Admin Capabilities

- Manage role assignment for Users to Projects
- Manage role assignment for Groups to Projects
- Issue UUID Token
- Reset User Password

User Capabilities

- Change Password
- Manage Default Tenant/Project Association
- List Tenants/Projects user has access to


### Compute Operations (Nova)
User

- Create a VM
- Create a VM which boots from a Volume
- Reboot a VM
- Rebuild a VM
- Start / Stop a VM
- Create / Delete a snapshot of a VM
- Rescue / Unrescue a VM
- Delete a VM
- Attach / Detach a Volume to/from a VM
- Get console log of a VM
- Get VNC console connection to a VM
- Create / modify / delete Security Group
- Create / upload / delete a key pair
- Associate / disassociated Floating IP address
- Add a network interface to a VM

<!-- Removed, Per Phil Day review 4/23 Create a VM connected to multiple networks (Not Supported); Resize a VM -->

Administrator

- Create / modify / delete a Flavor
- Modify the quota of a project
- Modify the quota of a user within a project
- Create / modify / delete Availability zone
- Create / modify / delete Aggregate
- Enable / Disable a service
- Lock / Unlock a VM
- Pause / Unpause a VM
- Suspend / Resume a VM
- Live Migrate a VM

### Network Operations (Neutron)

User

- Create  / Update / Delete a Network
- Create / Update / Delete a Router
- Add / Remove a subnet to/from a Network
- Add /Remove a network to/from a Router
- Add / Remove an external network to/from a Router
- Create / Update / Delete a port on a Network
- Allocate / De-allocate a Floating IP address
- Associate / Disassociate a Floating IP address to/from a Fixed IP address
- Create / Modify / Delete a Security Group
- Create / Modify / Delete a Security Group Rule
- Create / Modify / Delete a Load Balancer
- Create / Modify / Delete a Firewall

Administrator

- Create an external Network
- Modify the quota values of a project
- Add / Remove a network to/from a DHCP agent
- Add / Remove a router to/from an L3 agent
- Create / Update / Delete a provider network of network_type vlan

### Telemetry and Reporting (Ceilometer)

Collection

- Record Metering Data
- Create/Update/Delete Alarm (API)
- Record Alarm Change (API)
- Record Metering Event
- Clear Expired Metering Data (CLI)

Reporting

- Get list of Meters (types of measurements)
- Get list of Samples (usage data) for a specific Meter
- Get list of computed statistics for samples in a time range
- Get list of Resources (instance)
- Get details about one Resource
- Get list of API capabilities supported by current driver
- Get list of Alarms based on filter criteria
- Get details on a specific alarm
- Get the history of a specific alarm
- Get the state of an alarm

### Image Operations (Glance)

User

- Create / Modify / Delete a private image, facilitate snapshots
- Modify the access controls to a private image
- Add/update metadata for a private image

Administrator

- Create / Modify / Delete a public image
- Add/update metadata for a public image
- Document how to restore a deleted image

### Volume Operations (Cinder)

User

- Create / Delete a volume
- Create a bootable volume from an image in Glance
- Create / delete a snapshot of a volume
- Create / delete a backup of a volume in Swift
- Create a volume from a backup in Swift
- Update the metadata of a volume
- Create an image in Glance from a volume
- Rename a volume
- Extend a Volume
- Transfer a volume between users

Administrator

- Modify the quota values of a project
- Enable / Disable a service
- Create / Delete an encryption type
- Create / Delete a volume type
- Associate QoS with a volume type

### Object Operations (Swift)

User

- Create / Modify / Delete a container
- Upload files to a container
- Download files from a container
- Delete files in a container







<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
