---
layout: default
title: "Advanced Cloud Setup"
permalink: /cloudos/moonshot/install/advanced-cloud-setup/
product: cloudos

---

<a name="_top"> </a>

<script> 

function PageRefresh { 
onLoad="window.refresh" 
}
 
PageRefresh(); 
 
</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/install/updates-and-extensions/">&#9664; PREV</a> | <a href="/cloudos/moonshot/install/">&#9650; UP</a> | <a href="/cloudos/moonshot/install/install-modules-reference/">NEXT &#9654;</a> </p>

# Advanced Cloud Setup

This topic explains how to perform an advanced cloud setup, as an **alternative** to the wizard-based Create Cloud steps in the HP Cloud OS Operational Dashboard.

* [Introduction](#introduction)
* [Install Module Overview](#install-module-overview)
  * [Terminology](#terminology)
  * [Proposals](#proposals)
* [Steps to Apply Install Modules](#steps-to-apply-install-modules)
  * [Apply Cloud Controller Modules](#apply-cloud-controller-install-modules)
  * [Apply the Swift Install Module (Optional)](#apply-the-swift-install-module-optional)
  * [Apply the Nova Install Module](#apply-the-nova-install-module)
* [Next Step](#next-step)

## Introduction

Cloud infrastructure services are delivered as "install modules," which are also known as "barclamps."   

Install modules are a mechanism to install and configure a service on the Controller and Compute Nodes. 

When you create a cloud using the process defined in [Create a Cloud](/cloudos/moonshot/install/create-cloud/), a number of OpenStack and HP Cloud OS 
install modules are automatically configured and deployed for you. In most cases, the automated deployment of install modules will suffice. 
**Exception:** the Swift install module must be installed manually following the general steps in this topic. 

If you decide instead to apply the install modules yourself, or should you need to customize values in the install modules 
that were not exposed in the Create Cloud Attributes tab, this advanced topic, along with 
[Install Modules Reference](/cloudos/moonshot/install/install-modules-reference/), 
are provided to assist you in the process of customizing and deploying the individual install modules. 

If you use the advanced option described in this topic, all install modules will need to be applied manually and in the 
order specified in the [Apply Cloud Controller Install Modules](#apply-cloud-controller-install-modules) section.

To perform these tasks, you'll use a separate UI: the HP Cloud OS Installation Dashboard.  Its URL is:

http://192.168.124.10:3000

You should open the Installation Dashboard in Mozilla Firefox or Google Chrome. **Note:** In the current release, the dashboards use pre-defined login credentials. These are not published in the web-hosted documentation. To get the pre-defined login credentials, refer to the readme file included in the same ZIP that contained the HP Cloud OS ISO. 
If you have not already done so, see the ZIP on the <a href="https://cloudos.hpwsportal.com" target="codn">HP Cloud OS Distribution Network</a>. 

## Install Module Overview

This overview introduces the install module terms, concepts and tips.

### Terminology

**Install Module** &mdash; An install module represents a mechanism through which specific cloud services are configured
and deployed. Each install module will specify one or more Roles that it can fulfill.

**Role** &mdash; A role identifies a type of service that is provided by the install module. Roles represent a logical
service provided by the install module, but, may in fact be comprised of multiple processes that will
be installed and configured on the target node. An install module may support one or more roles. For
example, the Nova install module supports both the multi-controller role as well as the multi-compute role.

**Proposal** &mdash; A proposal is a named deployment configuration for a given install module. More than one proposal (deployment configuration) can be created for a given install module.

Before you go through the procedures to apply the install modules, review the next section for information about the process of applying and customizing install modules.

### Proposals

First, create a proposal to deploy an install module. A proposal is comprised of two sections - the Node Deployment section and the Attributes section.

The Node Deployment section is used to specify Node-to-Role associations. These associations are used to determine which module services are to be deployed to which
specific nodes. In this topic, see the following sections for details on how to make these associations in the proposal:

* [Create Node to Role Association](#create-node-to-role-associations)

* [Apply Cloud Controller Install Modules](#apply-cloud-controller-install-modules)

The Attributes section represents service configuration parameters that can be customized as needed. The Attributes section may also include "references" to other proposals. Proposal
references are used to indicate that one install module requires the services of another install module. The reference also allows you to pick a specific instance of that service.
For example, Glance has a reference to Keystone Instances. This appears in Glance's Proposal as a drop-down list of previously created Keystone Proposals. When a Keystone
Proposal is selected, you are actually selecting a specific deployed instance of Keystone because that Proposal is tied to a specific node due to the Node-to-Role association that is
part of the Keystone Proposal.

#### Provide a Meaningful Name for each Proposal

As indicated already, more than one Proposal may be created for a given install module. Thus it is important to name them in a manner that will allow you to identify one configuration from another.

If you have named your proposals well, you will be able to more easily pick the correct "reference" Proposals from the drop-down list.

Examples: 

* Give all the proposals that will be deployed to the Cloud Controller the name of the Cloud Controller node. Space characters are allowed in the proposal name.

* Give the Nova proposal that will be used to create a compute region the name of the Compute Controller node. Space character can be included in the proposal name. 

#### Node-to-Role Association Tips

* You may need to remove a Node from a Role before being allowed to add a different node.

* When selecting a node, let the cursor hover over the name of the node, the cursor should
change to a cross symbol, click on the name and drag to the name of the role. Release and
the name of the node should appear under the role.

* Some roles may only allow one node to be associated with it, while other roles may allow
more than one. For example, the Hp Cos Nova 100 install module provides both the multicontroller
and multi-compute roles. Only one node can be associated with the controller role,
but, multiple nodes can be associated with the compute role.

* Some roles must have at least one node associated with the role, while others do not
require any nodes. For example, in the Postgresql 915 proposal, the server role requires a
node to be associated with it, but the client role does not.

* In some cases, a single node may be associated with more than one Role. Using Nova as an
example, the same node could be associated with both the controller and the compute roles. 
(That node should have the memory, CPU and disk capacity to accommodate being a controller node and a virtualization host.)

## Steps to Apply Install Modules

After you have allocated the managed nodes, you can complete the cloud creation process by manually applying 
install modules that are available in the HP Cloud OS Installation Dashboard.  As noted previously, to access this UI, open it in 
Mozilla Firefox or Google Chrome:

http://192.168.124.10:3000

**Note:** In the current release, the dashboards use pre-defined login credentials. These are not published in the web-hosted documentation. To get the pre-defined login credentials, refer to the readme file included in the same ZIP that contained the HP Cloud OS ISO. 
If you have not already done so, see the ZIP on the <a href="https://cloudos.hpwsportal.com" target="codn">HP Cloud OS Distribution Network</a>. 

 
### Apply Cloud Controller Install Modules

The Cloud Controller install modules have dependencies and must be applied in the order that they are listed in the HP Cloud OS Installation Dashboard.

> **Important:** Each install module must be successfully applied, one at a time, and in a Ready state before you apply the next install module 
in the list.

The following table lists the install modules **in the order they must be applied** as you're creating a cloud instance.

<table style="text-align: left; vertical-align: top;">

<tr style="background-color: #C8C8C8;">
<th> Install Module </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td> Hp Cos Admin 100 </td>
<td> Provides administration services. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Postgresql 915 </td>
<td> <nobr> Provides a PostgreSQL-based database engine to the Cloud Controller </nobr> and Compute Region Controller(s). </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Rabbitmsgq 271 </td>
<td> Provides a RabbitMQ based message queuing mechanism to cloud infrastructure services. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Couchdb 120 </td>
<td> Configures a CouchDB server. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Hp Cos Keystone 100 </td>
<td> Provides Identity Management services to the cloud infrastructure. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Hp Cos Swift 100 </td>
<td> Provides an object/blob storage service.
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> Hp Cos Glance 100 </td>
<td> Provides Image Repository services to launch virtual machine instances. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Hp Cos Cinder 100 </td>
<td> Provides a volume storage service. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Hp Cos Quantum 100 </td>
<td> Provides a network connectivity service. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> Hp Cos Nova 100 * </nobr> </td>
<td> Provides multi-controller and multi-compute services. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> Hp Cos Graffiti 100 </nobr> </td>
<td> Provides the HP Cloud OS Resource Pool Registry and Capability Tagging Service. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Hp Cos Focus 100 </td>
<td> Provides the HP Cloud OS topology document repository. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Hp Cos Eve 100 </td>
<td> Provides the HP Cloud OS topology provisioning service for the cloud infrastructure. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Hp Skyline 100 </td>
<td> Provides the Administration Dashboard. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Hp Cos Cloud Utils 100 </td>
<td> Provides cloud utilities scripts. </td>
</tr>

</table>

\* **Important:** In the HP Cloud OS Installation Dashboard, the Nova install module will appear alphabetically in the list of install modules. 

The best practice, though, is to create and apply the Nova proposal after all the others have been applied. First follow the instructions below, then see [Apply the Nova Install Module](#apply-the-nova-install-module) in this topic.

To apply the install modules in Mozilla Firefox or Google Chrome:

1. Open the HP Cloud OS Installation Dashboard at http://192.168.124.10:3000.

2. Select Barclamps > Cloud Infrastructure. The Cloud Infrastructure page displays all the install modules that are specific to the cloud infrastructure.

3. **Reminder**: Apply the install modules in the order specified in the previous table, **except for the Nova install module,** as previously noted. For each install module in the list:

 a. Click the name of the install module.

 b. In the Proposal text box, change the default name of the proposal to a custom name that helps you identify one proposal from another. For example, the name of the node to which the proposal will be applied. **Important:** The proposal name can only be letters (capitalization is allowed) and numbers, with no spaces.

 c. Click Create to open the created install module's Edit Proposal page.

 d. Make sure the default values for the proposal are correct. For a complete list of all install modules and their default values, see the [Install Modules Reference](/cloudos/moonshot/install/install-modules-reference).

 e. Make the node-to-role associations. In the proposal section, notice the Available Nodes and the Roles. Use the following notes to associate a node to a role, or to remove a node from a role. When the install module is Applied, the node-to-role association(s) will be used to determine which of the install module's roles (also known as 'services') will be applied to which node.
  * In the Edit Proposal view, select the controller name in the Available Nodes list to drag it to the appropriate role. You may need to remove a node in order to add a node to a role, if there can only be one node associated with the role.
  * To remove the association of the controller from a role, select the controller's delete icon.
  * **Note:** Selecting the controller's link icon simply opens the node's details page.

 f. Click Save, then Apply and then click OK.

 g. Wait for the proposal status to indicate Ready.

 h. If the proposal fails to apply, the Installation Dashboard displays an error message. See [Troubleshooting](/cloudos/moonshot/manage/troubleshooting/).

 i. Select Barclamps > Cloud Infrastructure to review the install module list. The proposal Status is also displayed in the Cloud Infrastructure install module list.

 j. Apply the next install module in the list, from top to bottom, until all install modules related to the Cloud Controller Node have been applied. 
 
**Exception:** Apply the Nova install module after applying all the other install modules in the list. 


### Apply the Swift Install Module (Optional)

After creating the cloud and defining your compute region(s), you can deploy Swift in your cloud (if you elected to setup Swift) by following these steps:

1. Launch the HP Cloud OS Installation Dashboard. Its URL is http://192.168.124.10:3000. **Note:** In the current release, the dashboards use pre-defined login credentials. These are not published in the web-hosted documentation. To get the pre-defined login credentials, refer to the readme file included in the same ZIP that contained the HP Cloud OS ISO. If you have not already done so, see the ZIP on the <a href="https://cloudos.hpwsportal.com" target="codn">HP Cloud OS Distribution Network</a>. 

2. The Swift install module is pre-installed with a default proposal created (without assigned nodes).

3. From the UI's top menu, select Barclamps > Cloud Infrastructure > Hp Cos Swift 100.

4. Click the Edit button for the pre-existing Swift proposal.

4. Assign the controller node to the Swift ring-compute, proxy and dispersion roles. For background information, see the next section, [Swift Roles](#swift-roles). 

5. Assign between 2-5 nodes to the Swift storage role. 

6. All the other defaults should be adequate.

7. Click the Apply button to deploy Swift in your cloud. 

#### Swift Roles

##### Proxy

The proxy server is responsible for tying together the Swift storage architecture. For each request sent to the proxy server, 
it will look up the location of the account, container, or object in the ring (see below) and route the request accordingly. The 
proxy server also exposes the public API. 

A large number of failures are also handled in the proxy server. For example, if a server is unavailable for an object PUT, 
it will ask the ring for a handoff server and route there instead.

When objects are streamed to (or from) an object server, they are streamed directly through the proxy server to (or from) the user.  The 
proxy server does not spool them.

##### Ring-compute

In a Swift environment, a ring represents a mapping between the names of entities stored on disk and their physical location. 
There are separate rings for accounts, containers, and objects. When other components need to perform any operation on an object, 
container, or account, they need to interact with the appropriate ring to determine its location in the cluster.

The Ring maintains this mapping using zones, devices, partitions, and replicas. Each partition in the ring is replicated, by default, 
three times across the cluster.  The locations for a partition are stored in the mapping maintained by the ring. The ring is 
also responsible for determining which devices are used for handoff in failure scenarios.

Data can be isolated with the concept of zones in the ring. Each replica of a partition is guaranteed to reside in a different zone. 
A zone could represent a drive, a server, a cabinet, a switch, or even a datacenter. The partitions of the ring are equally divided 
among all the devices in the Swift installation. When partitions need to be moved around (for example if a device is added to the cluster), 
the ring ensures that a minimum number of partitions are moved at a time, and only one replica of a partition is moved at a time.

Weights can be used to balance the distribution of partitions on drives across the cluster. This can be useful, for example, 
when different sized drives are used in a cluster. The ring is used by the proxy server and several background processes (like replication).

##### Dispersion

The Swift dispersion role is used for cluster health monitoring. 

There is a swift-dispersion-report tool that you can use to measure the overall cluster health. This is accomplished by checking if a 
set of deliberately distributed containers and objects are currently in their proper places within the cluster. 

For instance, a common deployment has three replicas of each object. The health of that object can be measured by checking if each 
replica is in its proper place. If only two of the three is in place, the object's health can be said to be at 66.66%.

A single object's health, especially an older object, usually reflects the health of that entire partition the object is in. 
If you make enough objects on a distinct percentage of the partitions in the cluster, you can get a valid estimate of the overall 
cluster health. In practice, about 1% partition coverage seems to balance well between accuracy and the amount of time 
it takes to gather results.

### Apply the Nova Install Module

If you have already followed the steps in the previous section, continue here.

To apply the Nova install module:

1. On the Installation Dashboard,select Barclamps > Cloud Infrastructure. The install modules that are specific to the cloud infrastructure are displayed. The majority of the cloud infrastructure install modules have already been deployed, as indicated by a Ready state.

2. On the Cloud Infrastructure view, select Hp Cos Nova 100 in the Name column. 

3. Specify the Compute Region name as the proposal.

 a. Click Create.

 b. Verify that default values are correct for the proposal. Depending on your cloud environment, some Nova attributes may need to be modified. See [Nova Install Module Proposal Settings](#nova-install-module-proposal-settings).
 
 c. Make sure you drag and drop the designated nodes to their appropriate Role. See [Nova Install Module Roles](#nova-install-module-roles).
 
 d. Click Save, then Apply, then click OK.
 
 e. Wait for the proposal status to indicate Ready.
 
 f. If the proposal fails to apply, an error message displays. See the [Troubleshooting](/cloudos/moonshot/manage/troubleshooting/) topic.
 
 g. Select Barclamps > Cloud Infrastructure to review the install module list. The proposal status is also displayed in the Cloud Infrastructure install module list. 
 
> **Tip**: If you want to add another Compute Node later, complete the steps to discover and allocate the new node, and then add the node to an existing Hp Cos Nova 100 proposal. Do not create a separate proposal for the newly added node.

#### Nova Install Module Roles

The Nova install module supports the following roles:

* Hp Cos Nova 100-multi-controller &mdash; This role determines which node provides the infrastructure management and API services.
* Hp Cos Nova 100-multi-compute &mdash; This role identifies the Compute Nodes that act as virtualization hosts.

> **Tip**: As a best practice, the Compute Controller should be assigned the Nova-multi-controller role and the Nova-multi-volume role. The remaining managed nodes that are designated as Compute Nodes can be assigned to the Nova-multi-compute role.

#### Nova Install Module Proposal Settings

The following table explains how the Nova install module is structured and describes its relationship with a proposal.

In the Installation Dashboard:

* You can edit the install module attributes and node deployment information.
* You can set the attribute values that are based on roles associated with the install module.
* Each install module may have specific logic that requires minimums or maximums for node assignments.

<table style="text-align: left; vertical-align: top;">

<tr style="background-color: #C8C8C8;">
<th> Attribute </th>
<th> Value </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td> Compute Region </td>
<td> &lt;compute region name> </td>
<td> The name of the compute region. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Postgres </td>
<td> &lt;first-proposal-instance> </td>
<td> The Postgres proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Keystone </td>
<td> &lt;first-proposal-instance> </td>
<td> The Keystone proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> Keystone Service User </nobr> </td>
<td> Nova </td>
<td> <nobr> The type of user that Nova uses when authenticating with Keystone. </nobr>  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> Keystone Service Password </nobr> </td>
<td> &lt;first-proposal-instance> </td>
<td> The password for the Nova Keystone authentication user. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Glance </td>
<td> <nobr> &lt;first-proposal-instance> </nobr> </td>
<td> The Glance proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Verbose </td>
<td> false </td>
<td> Boolean indicating whether Nova runs in verbose mode. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> Use NoVNC (otherwise VPN-VNC) </nobr> </td>
<td> true </td>
<td> Boolean indicating whether the nova-novncproxy service is used. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Hypervisor </td>
<td> qemu </td>
<td> Indicates the hypervisor that Nova should use when launching virtual machines. May be either qemu or kvm. Select qemu if nova-compute
nodes are on virtual machines. Select kvm if nova-compute nodes are bare-metal. </td>
</tr>

</table> 

## Next Step

For details about each install module, see the next topic, [Install Modules Reference](/cloudos/moonshot/install/install-modules-reference/). 

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

