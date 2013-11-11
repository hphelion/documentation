---
layout: default
title: "HP Cloud OS Technical Overview"
permalink: /cloudos/en/120/overview/
product: cloudos

---

# HP Cloud OS Technical Overview

Welcome! This technical overview introduces you to the HP Cloud OS architecture, its components and services, and the HP Cloud OS relationship with OpenStack.

## What is HP Cloud OS?

HP Cloud OS is an open and extensible cloud technology based on OpenStack.  HP Cloud OS provides the foundation for a common cloud architecture across private, public, and hybrid cloud delivery.

HP Cloud OS is organized into a set of services.  Its architecture acts like a datacenter-level operating system, focused on cloud computing. 

## Understanding the Architecture

Let's look at the various components. HP Cloud OS is comprised of two important areas:

* An **Administrative environment**, which is used to manage the cloud.
* An **Execution environment**, which is used to execute the cloud itself on top of the customer's infrastructure: servers, networks, and storage.

Used together, the two environments allow you to stand up, manage, and self-serve your clouds, based on Cloud OS.

In this technical overview, we will walk through the components illustrated here:

<img src="media/cloudos-architecture-overview1.png" />

We'll start in the execution environment. 

## Execution Environment

The execution environment is broken into two components:

* The Cloud OS **kernel** layer, which acts like an operating system kernel across the datacenter for cloud 
* The Cloud OS **base** layer, which is comprised of advanced services that sit above the kernel, like subsystem services in an operating system.

These execution components works together to create a cloud environment for a customer that's installable, manageable and usable by the users of that cloud.

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
* Neutron &mdash; the virtual networking service in OpenStack that allows you to create and provision virtual networks. (Formerly called Quantum in OpenStack.)

Along with these services that make up the kernel layer of Cloud OS, we also have a set of plugins that attach to your infrastructure environment. 
We provide plugins in the following ways. 

* For Nova, we provide the KVM plugin so that we manage KVM hypervisor along with the Nova service 
* For Cinder, we provide an LVM plugin that does logical volume management so that you can do raw storage or logical volume 
* For Neutron, we provide an Open vSwitch plugin that allows you to open the switch plugin OpenFlow technology to do virtual networking across your environment 

### Base Layer of the Execution Environment

On top of the kernel layer is the base layer where we've created value-added services and Cloud OS to do additional functionality and things are advanced beyond the basic 
infrastructure service. The value-added services from HP Cloud OS are:

* Eve
* Graffiti
* Focus

#### Eve Service

Eve is the HP Cloud OS infrastructure topology provisioning service.  Eve allows you to:

* Provision TOSCA-based infrastructure topology templates (composite, hybrid, and distributed).
* Separate template creation and resource pool binding, for simpler, reusable templates.
* Integrate via a plug-in model with Cloud API's (e.g., OpenStack Nova) for orchestrating provisioning.
* Create and configure network services such as virtual load-balancers and configuration management services.

Eve also provides a logical execution container for flexible deployment of web-scale, stateless, thread controlled, non-blocking coarse-grained services.  This 
additional functionality in Eve allows you to:

* Retrieve the list of provisioning jobs
* Retrieve information about a specific provisioning job

#### Graffiti Service

The HP Cloud OS Graffiti service:

* Provides a dictionary of the "capabilities" of all the resources in a cloud environment
* Provides A searchable directory to find cloud resources based on their capabilities
* The mechanism for dynamic binding, allowing you to describe requirements rather than concrete bindings
* Supports the base concepts of requirements and capabilities within TOSCA

As illustrated here, Graffiti allows users to:

1. Publish a Common Capability Ontology
2. Publish resources that are described by the Common Capability Ontology
3. Select resource pools
4. Search the Directory to find resource(s) based on required common capabilities
5. Provision a topology binding
6. Verify that the provisioning was successful in the cloud

<img src="media/cloudos-graffiti-e2e.png" />

#### Focus Service

The Focus service serves as the Topology Template Registry and Repository Service.  
Focus provides for persistent store and management of TOSCA-based templates. Focus allows you to:

Allows you to:

* Search for documents based on criteria
* Store new documents
* Retrieve a version of an existing document
* Update the contents and/or metadata of a document
* Delete a document or a specific document version

## Administrator Environment 

The Administrative environment allows operational people to control the architecture of the cloud, and to perform the lifecycle management 
of that architecture.  

Talk about Skyline...

Talk about Cosmos...

Talk about the installation and upgrade feature.

## Next Steps




Copyright &copy; 2012-2013 Hewlett-Packard Corp. All rights reserved.


