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
  * [Apply Cloud Controller Modules](#apply-cloud-controller-modules)
  * [Apply the Nova Install Module](#apply-the-nova-install-module)
* [Next Step](#next-step)

## Introduction

When you create a cloud using the process defined in [Create a Cloud](/cloudos/install/create-cloud/), a number of OpenStack and Cloud OS 
install modules are automatically configured and deployed for you. In most cases, the automated deployment of install modules will suffice. 
However, should you need to customize values in the install modules that are not exposed in the Create Cloud Attributes tab, 
this advanced section, along with [Cloud Controller Install Modules Reference](/cloudos/install/install-modules/), are provided to assist 
you in the process of customizing and deploying the individual install modules. 

If you use this advanced option, all install modules will need to be applied manually and in the order specified in the [Apply Cloud Controller Install Modules](#apply-cloud-controller-modules) section of this topic.

You'll use a separate UI, the HP Cloud OS Installation Dashboard, to perform these advanced steps.  Its URL is:

http://192.168.124.10:3000

You should open the Installation Dashboard in Firefox or Google Chrome.

## Install Module Overview

This overview introduces some basic Install Module terms, concepts and tips.

### Terminology

Let's define our terms and understand the process.

**Install Module** &mdash; An install module represents a mechanism through which specific cloud services are configured
and deployed. Each install module will specify one or more Roles that it can fulfill.

**Role** &mdash; A role identifies a type of service that is provided by the install module. Roles represent a logical
service provided by the install module, but, may in fact be comprised of multiple processes that will
be installed and configured on the target node. An install module may support one or more roles. For
example, the Nova install module supports both the multi-controller role as well as the multicompute
role.

**Proposal** &mdash; A proposal is a named deployment configuration for a given install module. More than one proposal (deployment configuration) can be created for a given install module.

Before you begin going through the procedures to apply the install modules, review the following 
section for information about the process of applying and customizing install modules.

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

#### Name a Proposal Well

As indicated already, more than one Proposal may be created for a given install module. Thus it is important to name them in a manner that will allow you to identify one configuration from another.

If you have named your proposals well you will be able to more easily pick the correct "reference" Proposals from the drop-down list.

Example: Name all proposals that will be deployed to the Cloud Controller the name of the Cloud Controller Node and name the Nova Proposal that will be used to create a Compute
Region the name of the Compute Region.

#### Node-to-Role Association Tips

* You may need to remove a Node from a Role before being allowed to add a different node.

* When selecting a Node, let the cursor hover over the name of the Node, the cursor should
change to a cross symbol, click on the name and drag to the name of the Role. Release and
the name of the node should appear under the Role.

* Some Roles may only allow one node to be associated with it, while other Roles may allow
more than one. For example, the Hp Cos Nova 100 install module provides both the multicontroller
and multi-compute roles. Only one node can be associated with the controller role,
but, multiple nodes can be associated with the compute role.

* Some Roles must have at least one node associated with the Role, while others do not
require any nodes. For example, in the Postgresql 915 proposal, the server Role requires a
node to be associated with it, but the client Role does not.

* In some cases, a single node may be associated with more than one Role. Using Nova as an
example, the same node could be associated with both the controller and the compute Roles
(that node should, of course, have the memory, CPU and disk capacity to accommodate
being both a controller node as well as being a virtualization host).

## Steps to Apply Install Modules

After you have allocated the Controller and Compute Nodes, you can complete the cloud creation process by manually applying 
install modules that are available in the Installation Dashboard.  As noted previously, to access this UI, open it in Firefox or Google Chrome:

http://192.168.124.10:3000

Login with crowbar/crowbar.

### Apply Cloud Controller Modules

The Controller install modules have dependencies and must be applied so that they will be listed in the HP Cloud OS Installation Dashboard.

Caution: Each install module must be successfully applied, one at a time, and in a Ready state before you apply the next install module 
in the list.

The following table lists the install modules in the order they must be applied.

( table here ) 



### Apply the Nova Install Module

Content is coming 12/5...

#### Nova Install Module Roles

Content is coming 12/5...

#### Nova Install Module Proposal Settings

Content is coming 12/5...

## Next Step

For details about each install module, see the [Install Modules Reference](#/cloudos/install/install-modules/). 

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

