---
layout: default
title: "HP OpenStack Community Edition: Technical Overview"
permalink: /cloudos/community/technical-overview/
product: community

---


# HP OpenStack&reg; Community Edition: Technical Overview

The HP OpenStack Community Edition is OpenStack&reg; technology coupled with an HP Linux operating system designed to quickly standup an OpenStack cloud. Your new cloud supports up to 30 physical nodes and 600 virtual nodes making it ideal for small-scale and proof of concept deployments.

* [Deployment model](#deployment-model)

* [Service architecture](#service-archtecture)

* [Overcloud use cases](#overcloud-use-cases)
 
* [Reference architecture](/cloudos/community/reference-architecture)

* [Installation and configuration](/cloudos/community/install)
 

## Deployment model

HP OpenStack Community edition uses the standard TripleO deployment model:

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

The following table briefly describes the HP OpenStack Community services. For a complete description of these services, see the [Services overview](/cloudos/community/services/overview/) page.

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
<td> Provides patches and updates to HP OpenStack Community</td>
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

The following table briefly describes the foundation services in the HP OpenStack Community edition. For a complete description of these services, see the [Services overview](/cloudos/community/community.services-overview) page.

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

The following services are available in HP OpenStack Community Edition. 

### Identity Operations (Keystone)

The HP Identity service enables you to create and configure users, specify user roles and credentials, and issue security tokens. 

For a fill list of tasks you can perform with the Identity service, see [How To's with the HP Cloud OS Identity Service](/cloudos/community/services/identity/howto/).

### Compute Operations (Nova)

The HP Compute service provides a way to instantiate virtual servers on publicly accessible physical machines hosted in HP data centers.

Some of the tasks users can perform are creating and working with virtual machines, attaching storage volumes, working with security groups and key pairs, and associating floating IP addresses.

Administrators can configure server flavors, modify project quotas, configure availability zones, enable and disable services, and work with virtual machines.

For a fill list of tasks you can perform with the Compute service, see [How To's with the HP Cloud OS Compute Service](/cloudos/community/services/compute/howto/).

### Network Operations (Neutron)

The HP Networking service is a virtual networking service that provides network connectivity and IP addressing for HP Compute devices. 

Some of the tasks users can perform are configuring networks and routers, adding and removing subnets, add networks to a router, associate floating IP addresses, configuring security groups, and working with load balancers and the firewall.

An administrator can create an external network, modify project quotas, and work with DHCP agents and L3 agents.

For a fill list of tasks you can perform with the Networking service, see [How To's with the HP Cloud OS Networking Service](/cloudos/community/services/networking/howto/).

### Telemetry and Reporting (Ceilometer)

The HP Telemetry and Reporting service contains internal collection actions that are triggered by messaging queue activity and generalized for all the services.

Users can record metering data, create alarms, record events, and clear metering data.

For a fill list of tasks you can perform with the Telemetry and Reporting service, see [How To's with the HP Cloud OS Telemetry and Reporting Service](/cloudos/community/services/reporting/howto/).

### Image Operations (Glance)

The HP Image Operations service enables you to manage virtual machine images, including querying and updating image metadata, and retrieval of the actual image data.

Users can work with virtual server images, configure the access controls to a private image, and modify private image metadata.

Administrators can create and delete images, modify private image metadata, and restore deleted images.

For a fill list of tasks you can perform with the Image Operations service, see [How To's with the HP Cloud OS Image Operations Service](/cloudos/community/services/imaging/howto/).

### Volume Operations (Cinder)

The HP Volume Operations service enables you to perform a number of tasks with your storage volumes, including creating a volume, creating volume snapshots, and configuring a volume.

Administrators can modify project quotas, enable services, create encryption types, create volume types and associate quality of service with volume types.

For a fill list of tasks you can perform with the Volume Operations service, see [How To's with the HP Cloud OS Volume Operations Service](/cloudos/community/services/volume/howto/).

### Object Operations (Swift)

The HP Object Operations service provides a way to store and retrieve objects in a highly redundant cluster of publicly accessible physical machines hosted in HP data centers.

Users can configure storage containers, upload and download container files, and delete container files.

For a fill list of tasks you can perform with the Object Operations service, see [How To's with the HP Cloud OS Object Operations Service](/cloudos/community/services/object/howto/).

### Orchestration (Heat)

The HP Orchestration service enbles you to coordinate multiple composite cloud applications using template formats.

The HP Orchestration service allows users to work with nested stacks, which are a mechanism of using built-in stack definitions for specific resource types.

Users can create stacks, suspend and resume stacks, view information on stacks, view information on events, work with stack templates, and work with infrastructure resources (such as servers, floating ips, volumes, security groups, and users).

For a fill list of tasks you can perform with the Orchestration service, see [How To's with the HP Cloud OS Orchestration Service](/cloudos/community/services/orchestration/howto/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
