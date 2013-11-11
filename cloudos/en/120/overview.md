---
layout: default
title: "HP Cloud OS Technical Overview"
permalink: /cloudos/en/120/overview/
product: cloudos

---

# HP Cloud OS Technical Overview

Welcome! This technical overview introduces you to the HP Cloud OS architecture, its components and services, and the relationship with OpenStack.

## What is HP Cloud OS?

HP Cloud OS is an open and extensible cloud technology based on OpenStack.  HP Cloud OS provides the foundation for a common architecture across private, public, and hybrid cloud delivery.

( diagram here ) 

Cloud OS is a piece a foundational technology that is being used for the Converged Cloud architecture.  
Cloud OS is being used for various products that HP is bringing to market around cloud computing. 

Cloud OS is organized into a set of services and architecture that acts like an operating system.  
It's an operating system that overall is a datacenter level operation system for cloud. Let's look at the various components.

Cloud OS is comprised of two important areas:

* An Administrative environment 
* An Execution environment

Those environments are used to administratively manage the cloud, or to actually execute the cloud itself on top of the customer's infrastructure. Namely: 

* Servers
* Networks
* Storage

( diagram here ) 

The two environments used together allow customers to stand up, manage, and self-serve their clouds based on Cloud OS.

## Execution Environment

The execution environment is broken into two components:

* The Cloud OS kernel layer, which acts like an operating system kernel across the datacenter for cloud 
* And the base layer, which is comprised of advanced services that sit above the kernel, like subsystem services in an operating system.

These execution components works together to create a cloud environment for a customer that's installable, manageable and usable by the users of that cloud.

( diagram here ) 

### Kernel Layer of the Execution Environment

The kernel layer is based on the OpenStack infrastructure set of services.  All of Cloud OS is OpenStack powered.  If we look at the kernel and the services that comprise it, 
we utilize services from OpenStack such as:

* Keystone &mdash; the OpenStack identity management service.  The Keystone service allows users and groups and multi-tenancy to be built into all the services that are based on HP Cloud OS.  
* Glance &mdash; the OpenStack image library service; Glance allows you to have a set of images that you can use to bootstrap virtual machines across the cloud, 
and manage all those images.
* Nova &mdash; the OpenStack service for managing the various hypervisors and a virtual machines that you have across environment, whether it's a KVM Hypervisor, 
a Microsoft Hyper-V, or VMware ESXi Hypervisor.
* Cinder &mdash; the OpenStack volume management service that allows you to take your storage architecture and infrastructure, and create volumes that can be attached 
to the virtual environment within the cloud.
* Quantum &mdash; the virtual networking service in OpenStack that allows you to create and provision virtual networks. 


( diagram here ) 

Along with these services that make up the kernel layer of Cloud OS, we also have a set of plugins that attach to your infrastructure environment. 
We provide plugins in the following ways. 

* For Nova, we provide the KVM plugin so that we manage KVM hypervisor along with the Nova service 
* For Cinder, we provide an LVM plugin that does logical volume management so that you can do raw storage or logical volume 
* For Quantum, we provide an Open-V switch plugin that allows you to open the switch plugin OpenFlow technology to do virtual networking across your environment 

### Base Layer of the Execution Environment

On top of the kernel layer is the base layer where we've created value-added services and Cloud OS to do additional functionality and things are advanced beyond the basic 
infrastructure service for opens at on top of the base layer we've created a framework of the Eden as a framework we use to build all of our services and it's a common
set of functionality.

Across all the services that we build Cloud OS it provides for scalability around our services manageability of our services and a way for us to control understand how the
services are executing atop other services on top but you know we've got service call Graffiti that includes a (Peer) a resource-poor registry. 

Peer allows us to register resource pools from any OpenStack cloud so that we can do hybrid delivery across any cloud that happens to be involved with your cloud.

For example if you want to use HP public cloud resources as hybrid delivery from your private cloud, Peer will allow you to register and other clouds that 
you can use to deliver those resources and infrastructure.

We created a service called Eden ... Eden provisioning service that allows you to create templates and
provisional templates for infrastructure
so instead of doing element or ad hoc provisioning resources
want it I'm trying to connect them together you can actually create an
entire template
provisions that template and help them build an entire infrastructure around
you lies he even the orchestration it does for OpenStack and you can do it
hybrid
across multiple clouds and finally we have a service call focus
focus is an internal service we use for managing all the documents and templates
that we have so it allows you to do
template management allows you to other types a binding document management
versioning relationship between documents that are used to drive
together all the features that were talking about
with tampering and hybrid delivery that is the execution environment parka carl
s this is what makes up the cloud
and this is how customers can sell service use that clout everything from
the basic OpenStack services there
in addition to the value-added capabilities that we brought on top of
that
the administrator environment allows operational people to actually control
the architecture the cloud and to make that architecture
a to life cycle management architecture so
things that are an administrative error things like are dashboards and tools
while the task force the skyline have
skyline is a dashboard allow cell service usage up the cloud
so any user can use that dashboard to get to interact with the cloud and build
your own virtual resources in the cloud
skyline is based on OpenStack horizon technology so it looks and acts like the
OpenStack
a.m. horizon type dashboard but we value added significantly around new
capabilities
new UI workflow and things to make it much more streamlined
in addition skyline we had asked for call cosmos
cosmos is a dashboard that's for operational people not for self service
users
it allows you to actually change the architecture of the clout so with cosmos
you can change the plugins
in which you take the Services Inc their computer infrastructure you can scale
out the cloud scale in the cloud allows you to do
elasticity up the cloud itself and the architecture make that up
cosmos is for operational folks who is also based on horizon
so there's a common dashboard architecture across the self-service
dashboard and the operational dashboards that our customers with you
lastly Cosmos sits on top and install and upgrade
system
install and upgrade system allows us to create the cloud 
and the ferry services up the cloud it allows us to change the plugins
update those as well as update all the things inside the cloud
we could take cloud and patch it make fixes to it
we can take clouded upgrade in terms as version we can add additional types: the
plugins that customers can choose based on their infrastructure needs and how
they want to differentiate their cloud
so the install upgrade mechanism allows us to manage the entire architecture
the cob altogether this creates a Cloud OS architecture
that will underpin a sedative products HP is building
that will mean that any product is based on Cloud OS will get a fundamental set
have capabilities that are guaranteed across those products so for example
hybrid delivery from one party to another being able to use another
college resources as around
in a hybrid delivery mechanism will be consistent across all products that use Cloud OS.

The idea of template-based provisioning is that I can create a template and build
infrastructure based on a template, and we use a template over and over again even a hybrid environment that will be a consistent capability across all of our technologies cloud
technologies that use Cloud OS. 

we've just look to cloud OS far less as an offering system
metaphor is made up love various types environments administratively an
execution
and the various layers that make it up the infrastructure self the
kernel-based services that make up on OS based on OpenStack
and the bay services that bring advanced capabilities that we want to bring
into the Qatar less environmental the administration funds the cloud OS
also provide a consistent center capabilities across all the products
that were based on a cloud OS foundational technology
so that means that customers that understand how did mister want avocados
product
well know how did mister all on a list price and they'll be consistency across
those products
the plugins are available the services value-added things were building
will all be consistent in the future.


Copyright &copy; 2012-2013 Hewlett-Packard Corp. All rights reserved.


