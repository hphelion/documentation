---
layout: default
title: "Advanced Cloud Setup"
permalink: /cloudos/install/advanced-cloud-setup/
product: cloudos

---

<a name="_top"> </a>

<script> 

function PageRefresh { 
onLoad="window.refresh" 
}
 
PageRefresh(); 
 
</script>


# Advanced Cloud Setup

This topic explains how to perform an advanced cloud setup, as an **alternative** to the wizard-based Create Cloud steps in the HP Cloud OS Operational Dashboard.

* [Introduction](#introduction)
* [Install Module Overview](#install-module-overview)
  * [Terminology](#terminology)
  * [Proposals](#proposals)
* [Steps to Apply Install Modules](#steps-to-apply-install-modules)
  * [Apply Cloud Controller Modules](#apply-cloud-controller-install-modules)
  * [Apply the Nova Install Module](#apply-the-nova-install-module)
* [Next Step](#next-step)

## Introduction

Cloud infrastructure services are delivered as "install modules," which are also known as "barclamps."  We use the term install modules here. 

Install modules are a mechanism to install and configure a service on the compute region's control node. 

When you create a cloud using the process defined in [Create a Cloud](/cloudos/install/create-cloud/), a number of OpenStack and Cloud OS 
install modules are automatically configured and deployed for you. In most cases, the automated deployment of install modules will suffice. 

However, should you need to customize values in the install modules that are not exposed in the Create Cloud Attributes tab, 
this advanced section, along with [Cloud Controller Install Modules Reference](/cloudos/install/install-modules-reference/), are provided to assist 
you in the process of customizing and deploying the individual install modules. 

If you use the advanced option described in this topic, all install modules will need to be applied manually and in the order specified in the [Apply Cloud Controller Install Modules](#apply-cloud-controller-modules) section.

To perform these tasks, you'll use a separate UI: the HP Cloud OS Installation Dashboard.  Its URL is:

http://192.168.124.10:3000

You should open the Installation Dashboard in Mozilla Firefox or Google Chrome.

## Install Module Overview

This overview introduces the install module terms, concepts and tips.

### Terminology

**Install Module** &mdash; An install module represents a mechanism through which specific cloud services are configured
and deployed. Each install module will specify one or more Roles that it can fulfill.

**Role** &mdash; A role identifies a type of service that is provided by the install module. Roles represent a logical
service provided by the install module, but, may in fact be comprised of multiple processes that will
be installed and configured on the target node. An install module may support one or more roles. For
example, the Nova install module supports both the multi-controller role as well as the multicompute
role.

**Proposal** &mdash; A proposal is a named deployment configuration for a given install module. More than one proposal (deployment configuration) can be created for a given install module.

Before you go through the procedures to apply the install modules, review the next section for information about the process of applying and customizing install modules.

### Proposals

First, create a proposal to deploy an install module. A proposal is comprised of two sections - the Node Deployment section and the Attributes section.

The Node Deployment section is used to specify Node-to-Role associations. These associations are used to determine which module services are to be deployed to which
specific nodes. See the "Create Node to Role Association" step in "Apply Cloud Controller Install Modules" 
for details on how to make these associations in the proposal.

The Attributes section represents service configuration parameters that can be customized as needed. The Attributes section may also include "references" to other proposals. Proposal
"references" are used to indicate that one install module requires the services of another install module. The "reference" also allows you to pick a specific instance of that service.
For example, Glance has a "reference" to Keystone Instances. This appears in Glance's Proposal as a drop-down list of previously created Keystone Proposals. When a Keystone
Proposal is selected, you are actually selecting a specific deployed instance of Keystone because that Proposal is tied to a specific node due to the Node-to-Role association that is
part of the Keystone Proposal.

#### Provide a Meaningful Name for each Proposal

As indicated already, more than one Proposal may be created for a given install module. Thus it is important to name them in a manner that will allow you to identify one configuration from another.

If you have named your proposals well, you will be able to more easily pick the correct "reference" Proposals from the drop-down list.

Examples: 

* Give all the proposals that will be deployed to the Cloud Controller the name of the Cloud Controller node. 

* Give the Nova proposal that will be used to create a compute region the name of the compute region.

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

After you have allocated the controller and compute nodes, you can complete the cloud creation process by manually applying 
install modules that are available in the HP Cloud OS Installation Dashboard.  As noted previously, to access this UI, open it in 
Mozilla Firefox or Google Chrome:

http://192.168.124.10:3000

Login with crowbar/crowbar.

### Apply Cloud Controller Install Modules

The Cloud Controller install modules have dependencies and must be applied so that they will be listed in the HP Cloud OS Installation Dashboard.

> **Caution:** Each install module must be successfully applied, one at a time, and in a Ready state before you apply the next install module 
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
<td> Couchdb 100 </td>
<td> Configures a CouchDB server. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Hp Cos Keystone 100 </td>
<td> Provides Identity Management services to the cloud infrastructure. </td>
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
<td> <nobr> Hp Cos Nova 100 * See the important footnote below this table. </nobr> </td>
<td> Provides multi-controller and multi-compute services. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> HP Cos Graffiti 100 </nobr> </td>
<td> Provides dictionary services, a searchable directory of cloud resources, and resource pool registry services. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> HP Cos Focus 100 </td>
<td> Provides a topology document repository. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> HP Cos Eve 100 </td>
<td> Provides a topology provisioning service for the cloud infrastructure. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> HP Skyline 100 </td>
<td> Provides the Administration Dashboard. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> HP Cos Cloud Utils 100 </td>
<td> Provides cloud utilities scripts. </td>
</tr>

</table>

\* **Important:** The Nova install module will appear in the list of install modules after the Neutron install module. 
The best practice is to create and apply the Nova proposal after all the others have been applied. 
First follow the instructions below, then see [Apply the Nova Install Module](#apply-the-nova-install-module) in this topic.

To apply the install modules in Firefox or Google Chrome:

1. Open the HP Cloud OS Installation Dashboard at http://192.168.124.10:3000.

2. Select Barclamps > Cloud Infrastructure. The Cloud Infrastructure page displays all the install modules that are specific to the cloud infrastructure.

3. **Reminder**: Apply the install modules in the order specified in the previous table, **except for the Nova install module,** as previously noted. For each install module in the list:

 a. Click the name of the install module.

 b. In the Proposal text box, change the default name of the proposal to a custom name that helps you identify one proposal from another. For example, the name of the node to which the proposal will be applied. **Important:** The proposal name can only be letters (capitalization is allowed) and numbers, with no spaces.

 c. Click Create to open the created install module's Edit Proposal page.

 d. Make sure the default values for the proposal are correct. For a complete list of all install modules and their default values, see the [Install Modules Reference](/cloudos/install/install-modules-reference).

 e. Make the node-to-role associations. In the proposal section, notice the Available Nodes and the Roles. Use the following notes to associate a node to a role, or to remove a node from a role. When the install module is Applied, the node-to-role association(s) will be used to determine which of the install module's roles (also known as 'services') will be applied to which node.
  * In the Edit Proposal view, select the Cloud Controller node name in the Available Nodes list to drag it to the appropriate role. You may need to remove a node in order to add a node to a role, if there can only be one node associated with the role.
  * To remove the association of the Cloud Controller node from a role, select the Cloud Controller node delete icon.
  * Note: Selecting the Cloud Controller node link icon simply opens the node's details page.

 f. Click Save, then Apply and then click OK.

 g. Wait for the proposal status to indicate Ready.

 h. If the proposal fails to apply, the Installation Dashboard displays an error message. See [Troubleshooting](/cloudos/troubleshooting/).

 i. Select Barclamps > Cloud Infrastructure to review the install module list. The proposal Status is also displayed in the Cloud Infrastructure install module list.

 j. Apply the next install module in the list, from top to bottom, until all install modules related to the Cloud Controller Node have been applied. **Exception:** Apply all Nova install module after applying all the other install modules in the list. 

Now you can move on to applying the Nova install module - see the next section.

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
 
 f. If the proposal fails to apply, an error message displays. See the [Troubleshooting](/cloudos/troubleshooting/) topic.
 
 g. Select Barclamps > Cloud Infrastructure to review the install module list. The proposal status is also displayed in the Cloud Infrastructure install module list. 
 
> **Tip:** If you want to add another Compute Node later, complete the steps to discover and allocate the new node, and then add the node to an existing Hp Cos Nova 100 proposal. Do not create a separate proposal for the newly added node.

#### Nova Install Module Roles

The Nova install module supports the following roles:

* Hp Cos Nova 100-multi-controller &mdash; This role determines which node provides the infrastructure management and API services.
* Hp Cos Nova 100-multi-compute &mdash; This role identifies the Compute Nodes that act as virtualization hosts.

> **Tip: As a best practice, the node used earlier for the Cloud Controller is assigned the Nova-multi-controller role and the Nova-multi-volume role. The remaining managed nodes that are designated as Compute Nodes can be assigned to the Nova-multi-compute role.

#### Nova Install Module Proposal Settings

The following table explains how the Nova install module is structured and describes its relationship with a proposal.

In the Installation Dashboard:

* You can edit the install module attributes and node deployment information.
* You can set the attribute values that are based on roles associated with the install module.
* Each install module may have specific logic that requires minimums or maximums for node assignments.

( table coming 12/5 - today!  ) 

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
<td> more coming today 12/5 ... </td>
<td> &lt; more coming today 12/5 ... > </td>
<td> more coming today 12/5 ... </td>
</tr>

</table> 

## Next Step

For details about each install module, see the next topic, [Install Modules Reference](/cloudos/install/install-modules-reference/). 

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

