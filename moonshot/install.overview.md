---
layout: default
title: "Installation Overview"
permalink: /cloudos/moonshot/install/overview/
product: moonshot

---


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/install/">&#9664; PREV</a> | <a href="/cloudos/moonshot/install/">&#9650; UP</a> | <a href="/cloudos/moonshot/install/before-you-install/">NEXT &#9654;</a> </p>

# Installation Overview

Welcome! This topic presents an overview of the installation steps.  

An HP Cloud OS for Moonshot infrastructure requires advance planning and preparation by IT network administrators. The HP Cloud OS for Moonshot installation 
deploys the HP Cloud OS for Moonshot Operational Dashboard (used to set up, configure, and install an HP cloud infrastructure) and the HP Cloud OS for 
Moonshot Administration Dashboard (used to create and manage cloud resources).

* [HP Cloud OS for Moonshot Environment](#hp-cloud-os-for-moonshot-environment)

* [Preview of the Installation Steps](#preview-of-the-installation-steps)

* [Components of the HP Cloud OS for Moonshot Environment](#components-of-the-hp-cloud-os-for-moonshot-environment)

* [Overall Installation and Configuration Checklist](#overall-installation-and-configuration-checklist)

* [Next Step](#next-step)

## HP Cloud OS for Moonshot Environment

The HP Cloud OS for Moonshot environment provides you with: 

* Optimized cloud workloads across cloud providers, with model-once and provision-anywhere capability.  These features are combined with repeatable, consistent 
workload placement across diverse cloud deployment models. This functionality allows you and your customers to optimally align workloads with resources, and to improve resource utilization. 

* A flexible and open architecture powered by OpenStack technology, giving you an industry leading, vendor neutral, open source cloud architecture. 

The HP Cloud OS for Moonshot environment also include an installer, services, and controllers that provide simplified service delivery with automated, live 
content distribution, and an easier installation and configuration processes. This functionality allows manually intensive operational processes to be 
reduced from hundreds of steps over multiple packages to a simple, automated process.

## Preview of the Installation Steps

Installing and configuring Cloud OS for Moonshot is a multi-step process. Throughout the process you will be prompted to either enter required information 
or accept the default information.

At a high level, here are the steps to setup and install the Admin node:

<img src="media/cloudos-moonshot-install-process.png" title="HP Cloud OS for Moonshot installation process" /> 

The steps shown above feature an automated process in the HP Cloud OS for Moonshot Operational Dashboard. HP Cloud OS for Moonshot handles all of the 
installation details for you, installing the OpenStack services and the HP Cloud OS for Moonshot value-added services.

Taking a broader view, this next diagram illustrates those steps in a larger context:

<img src="media/cloudos-moonshot-install-process-expanded.png" title="HP Cloud OS for Moonshot - an expanded view of the install process" /> 

Notice how once you've installed and set up the Admin node, you perform steps first in the Operational Dashboard to create your cloud and perform associated tasks. Then from the Operational Dashboard, you will launch the separate Administration Dashboard to perform a number of post-installation tasks. And from that 
point forward, you will use the Administration Dashboard to manage your cloud environment, including the Moonshot server cartridges.

<img src="media/cloudos-moonshot-post-install-tasks.png" title="HP Cloud OS for Moonshot post-install tasks" /> 

The documented post-installation tasks are designed to familiarize you with the Administration Dashboard, which you'll use from that point forward to manage your cloud. 
The tasks are also designed to help you verify that your recently deployed cloud environment is functioning properly.

## Components of the HP Cloud OS for Moonshot Environment

The following diagram illustrates the HP Cloud OS for Moonshot environment.

<img src="media/cloudos-moonshot-environment2.png" title="HP Cloud OS for Moonshot environment" /> 

### Services

Cloud Infrastructure consists of individual services installed and integrated together across one or
more nodes to form a cloud environment. These are composite services that are integrated
together into a single cloud solution. Services are exposed or published as RESTful APIs.
The list of services that can be deployed for HP Cloud OS for Moonshot are:

* <b>Keystone</b> &mdash; An OpenStack service to provide identity (domain,
project and users) management, access token, and service catalog functionality.

* <b>Glance</b> &mdash; An OpenStack service to provide for discovering,
registering, and retrieving virtual machine images.

* <b>Nova</b> &mdash; An OpenStack service to provide a
compute fabric controller.

* <b>Cinder</b> &mdash; An OpenStack service to provide volume management.

* <b>Neutron</b> &mdash; An OpenStack service to create and provision virtual networks.

* <b>Swift</b> &mdash; An OpenStack service to store and retrieve lots of data in virtual containers.  

* <b>Apollo</b> &mdash; An HP Cloud OS for Moonshot service that provides HP Moonshot Chassis and Server Management. In addition, it helps to discover HP Moonshot Servers and allocates them for the provisioning.

* <b>Graffiti</b> &mdash; An HP Cloud OS for Moonshot resource pool registry and capability tagging service. Designed to support
diverse functions: discovering, registering, and retrieving resource pool definitions for compute, network, and volume resources; 
a dictionary of the cloud's capabilities; a searchable directory to find cloud resources based on their capabilities; and 
dynamic binding, describing the requirements instead of static binding.  

* <b>Eve</b> &mdash; An HP Cloud OS for Moonshot service to provide for provisioning lifecycle
of a TOSCA-based infrastructure topology design of the compute, network, and volume resources
in a defined resource pool. Also provides security and management.

* <b>Focus</b> &mdash; An HP Cloud OS for Moonshot service to provide for discovering, registering, versioning, and retrieving of document types necessary to describe
TOSCA-based infrastructure topologies.

### Administration Node

The HP Cloud OS for Moonshot Administration Node (Admin Node) hosts the Operational Dashboard that deploys private and hybrid-only cloud infrastructure environments by network booting the managed Baremetal
servers, which are the Controller and Baremetal host. 

### Controllers

While each service can be individually deployed, HP Cloud OS for Moonshot groups these services into distinct groups for ease of architectural description.

**Cloud Controller:** This contains those services that are considered single services for a cloud environment, such as Keystone, Glance, Graffiti, Eve, and Focus, and define the boundaries of the
cloud environment from an identity standpoint.

**Network Controller:** This contains Neutron's server, l3 agent and DHCP services. It is a single service in a cloud and can co-exist with cloud controller services.

**Compute Region Controller:** A Resource Region is known as a Compute Region. This is a pool of compute resources that can be consumed through a service API by consumers of the cloud,
such as Nova. This is responsible for the launch of instances across baremetal hosts. The scheduling is based on varied flavors of instances and available resources on the compute nodes.
In a single compute region deployment model, this can coexist with cloud controller services.  

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"> <b>Note:</b> An HP cloud can consist of more than one region. For example, you can separate the regions based on the workload such as between a development/test team and a production deployment. A
development/test team region's compute requirements can use commodity and less expensive hardware. Whereas a production deployment region's compute requirements need a set of compute
resources that are backed up with heavy compute and fault-tolerant resources. HP recommends that you define and use multiple compute regions. In this scenario, the Compute Region Controller is its own node.

### Baremetal Host

The Baremetal Host hosts the cloud instances using a baremetal driver for the OpenStack Nova compute service. Within the OpenStack framework, the baremetal driver has the same role as the drivers for other hypervisors (libvirt, xen, etc.), and yet it is presently unique in that the hardware is not virtualized - 
there is no hypervisor between the tenants and the physical hardware that includes Moonshot cartridges.

## Overall Installation and Configuration Checklist

Assuming a typical configuration, the overall setup process involves the following steps. The total time to complete the setup once HW is installed, configured and the hypervisor is ready is four to six hours. In this list, approximate execution times are shown here for reference, once the installation from the HP Cloud OS for Moonshot ISO has begun. 

* Collect the required information for the network configuration

* Setup the Moonshot chassis, cartridges and configure the internal switches

* Configure the server hardware and the physical networking as required

* Setup a server with either VMware ESXi or Linux KVM as a hypervisor

* Configure the networking within the hypervisor to support the required networking configuration

* Create three virtual machines to host the Admin, Controller and Compute VMs

* Create a VM to use as an access node for installation of the HP Cloud OS for Moonshot software ISO

* Install and configure the Admin node (60 minutes)

* Add (discover and allocate) the Controller and Compute VMs (30 minutes)

* Create a cloud and compute region (60 minutes)

* Add and discover the Moonshot chassis (15 min)

* Download and import the desired workload(s) (30 to 60 minutes - depending on download time)

* Provision a workload (30 minutes)

## Next Step

Proceed to the next topic, [Important Tasks Before You Install](/cloudos/moonshot/install/before-you-install/). 

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


