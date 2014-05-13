---
layout: default
title: "HP OpenStack Community Edition Services Overview"
permalink: /cloudos/community/services/overview/
product: community

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/community/install/">&#9664; PREV</a> | <a href="/cloudos/community/">&#9650; UP</a> | <a href="/cloudos/community/reference-architecture/"> NEXT &#9654</a> </p>


# HP OpenStack&reg; Community Edition Services Overview #

<!-- HP services are foundation technologies used by the HP OpenStack Community. Based on OpenStack&reg; technology, HP OpenStack Community is comprised of a set of services and architecture that act like a data-center-level operating system (DCOS).  -->

Based on OpenStack&reg; technology, HP services act like a data-center-level operating system 

Conceptually, HP OpenStack Community is comprised of two primary environments, the Administrative Environment and the Execution Environment. 

The two environments work together to allow users to set up and manage a self-service cloud deployment.

- Administrative Environment - The [Administrative Environment](#admin) contains dashboards and tools that enable users to manage the cloud.
- Execution Environment - The [Execution Environment](#execution) contains services, systems, and subsystems that emulate an operating system. The environment executes the cloud on top of your infrastructure, including your servers, networks, and storage.

The following diagram illustrates a conceptual depiction of the administrative and execution environment.

<img src="media/technical_overview.jpg" alt="" width="500" />
<!-- Image from CloudCoreProductPlan.pdf http://wiki.hpcloud.net/display/core/Cloud+OS+Core+Product+Management -->

## Execution Environment ## {#execution}

The Execution Environment contains a [Kernel Layer](#kernel) and a Base Layer.

- Kernel Layer - The [Kernel Layer](#kernel) provides services such as compute, networking, storage, and monitoring, and is similar to an operating system's kernel layer.
- Base Layer - The Base Layer is comprised of advanced services that sit above the kernel. The Base Layer is like subsystem services in an operating system.
 

### Kernel Layer ### {#kernel}
The Kernel Layer acts like an operating system kernel across a data center for cloud and acts as the operating system for your cloud environment. The Kernel Layer is based on the following OpenStack infrastructure set of services:


**Compute Operations**. The compute service manages the hypervisors and virtual machines in your environment. Also known as *Nova*.

- [Overview of the Compute service](/cloudos/community/services/compute/overview)
- <!-- Hidden for preview release- [Getting started with the Compute service](/cloudos/community/services/compute/getting-started) 
---> [How To's with the Compute service](/cloudos/community/services/compute/howto/)

**Identity Management**. The Identity Management service enables you to create and administer security users and  groups to control access to and within your cloud environment. Also known as *Keystone*.

- [Overview of the Identity Management service](/cloudos/community/services/identity/overview)
- <!-- Hidden for preview release [Getting started with the Identity Management service](/cloudos/community/services/identity/getting-started)
---> [How To's with the Identity Management Service](/cloudos/community/services/identity/howto/)

**Image Operations**. The Image Operations service enables you to create and maintain virtual server images, which you can use to bootstrap VM's across the cloud and then manage them. Also known as *Glance*.

- [Overview of the Image service](/cloudos/community/services/imaging/overview)
- <!-- Hidden for preview release [Getting started with the Cloud OS Image Operations service](/cloudos/community/services/imaging/getting-started)
---> [How To's with the HP Cloud OS Image Operations Service](/cloudos/community/services/imaging/howto/)

**Networking Operations**. The Networking service enables you to provision and create virtual networks. Also known as *Neutron*.

- [Overview of the Networking service](/cloudos/community/services/networking/overview)
- <!-- Hidden for preview release- [Getting started with the Networking service](/cloudos/community/services/networking/getting-started)
---> [How To's with the Networking Service](/cloudos/community/services/networking/howto/)

**Object Operations**. The Object Operations service enables you to store and retrieve data. Object Storage is a distributed storage system for static data such as virtual machine images, photo storage, email storage, backups and archives. Also known as *Swift*.

- [Overview of the Object Opertations service](/cloudos/community/services/object/overview)
- <!-- Hidden for preview release [Getting started with the Cloud OS Object Management service](/cloudos/community/services/object/getting-started)
---> [How To's with the Object Operations service](/cloudos/community/services/object/howto/)

**Orchestration**. The Orchestration implements an orchestration engine to launch multiple composite cloud applications based on templates in the form of text files that can be treated like code.  Also known as *Heat*.

- [Overview of the Orchestration service](/cloudos/community/services/orchestration/overview)
- <!-- Hidden for preview release [Getting started with the Orchestration service](/cloudos/community/services/orchestration/getting-started)
---> [How To's with the Orchestration service](/cloudos/community/services/orchestration/howto/)

**Telemetry and Reporting**. The Telemetry and Reporting service enables a single infrastructure to collect measurements within your cloud environment.  Also known as *Ceilometer*.

- [Overview of the Telemetry and Reporting service](/cloudos/community/services/reporting/overview)
- <!-- Hidden for preview release [Getting started with the Telemetry and Reporting service](/cloudos/community/services/reporting/getting-started)
---> [How To's with the Telemetry and Reporting service](/cloudos/community/services/reporting/howto/)

**Volume Operations**. The Volume Operations enables you to attach storage volumes to a virtual servers in your cloud environment. The service provides persistent block level storage devices for use with your Compute
instances. Also known as *Cinder*.

- [Overview of the Volume Operations Service](/cloudos/community/services/volume/overview)
- <!-- Hidden for preview release [Getting started with the Cloud OS Volume Management service](/cloudos/community/services/volume/getting-started)
---> [How To's with the HP Cloud OS Volume Management service](/cloudos/community/services/volume/howto/)

<!--
### Base layer ### {#base}

The Base Layer contains those advance services above the kernel which provide services to the kernel. The Base Layer essentially performs the role of the subsystem.

**Eden**. The Eden framework is used to build all the HP Cloud OS services. It provides common functionality across all services. 

Eden also provides scalability and manageability around services and a way to view and control how those services are performing

- [Overview of the Eden service](/cloudos/community/services/eden/overview)
- Hidden for preview release Getting started with the Eden service
 Eden service use cases/solutions/how to use/examples

**Graffiti** The Graffiti service is a resource pool registry, which allows you to access your cloud environment. The Graffiti service allows for a hybrid cloud approach for sharing resources. For example, Graffiti enables you to use the HP Cloud OS environment in conjunction with your internal private cloud services. Also known as *Peer*.

- [Overview of the Graffiti service](/cloudos/community/services/peer/overview)
- Hidden for preview release [Getting started with the Peer service](/cloudos/community/services/peer/getting-started/)
 Peer service use cases/solutions/how to use/examples


**Eve**. Provisioning, templates, build around templates
provisioning service allowing you to create templates and provision those templates for infrastructure. This allows to take advantage of the orchestration feature in HP Cloud OS and OpenStack. Eve can be used across multiple clouds

- [Overview of the Eve service](/cloudos/community/services/eve/overview)
- Hidden for preview release [Getting started with the Eve service](/cloudos/community/services/eve/getting-started/)
 Eve service use cases/solutions/how to use/examples

**Focus** Managing templates, binding documents, versioning. An internal service to manage the documents and templates. Versioning and document relationship is also a function provided by Focus.

- [Overview of the Compute service](/cloudos/community/services/focus/overview)
- Hidden for preview release [Getting started with the Focus service](/cloudos/community/services/focus/getting-started/)
 Use cases/solutions/how to use/examples
-->


## Administrative Environment ## {#admin}

The Administration Environment allows operational resources to control the architecture of the cloud and performs life-cycle management of the architecture through the use dashboards.
<!--
The administration environment is made up of dashboards and tools:

**Skyline**. The Skyline dashboard allows you to manage your cloud environment. Skyline looks and acts like the [HP Public Cloud Console](/hpcloudconsole/).

**Cosmos**. The Cosmos dashboard allows you to change the architecture of the cloud. You can scale the cloud in or out. You can also use it to change plugins.
-->

**HP Administration dashboard**  The [Administration Dashboard](/cloudos/manage/administration-dashboard/) as a simplified means of creating and managing HP Cloud OS resources, topology designs, and deployment profiles.

You can use the Administration Dashboard to view, allocate, and manage all virtual resources within a cloud. 
**Install/Upgrade System**. The Install/Upgrade dashboard allows you to create a cloud and activate HP Cloud OS services. You can also modify plugins and update the cloud environment, including patching and updating.


## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/) The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Cloud Community Edition takes care of these details for you. The *Operations* contains information on how to manage the system.

<!-- hide me Also see the Help topics that are available in the Operational Dashboard and Administration Dashboard.  Website copies are available:

* [HP Cloud OS Operational Dashboard Help](/cloudos/manage/operational-dashboard/)
* [HP Cloud OS Administration Dashboard Help](/cloudos/manage/administration-dashboard/) -->