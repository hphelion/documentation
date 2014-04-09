---
layout: default
title: "HP Cloud OS Services Overview"
permalink: /cloudos/api/services/overview/
product: compute

---
# HP Cloud OS Services Overview #

HP Cloud OS 1.0 is built upon the OpenStack technology. 

HP Cloud OS is a foundation technology used for HP’s Converged Cloud Architecture. HP Cloud OS is broken down into a set of services and architecture that act like a datacenter-level operating system (DCOS).

Conceptually, HP Cloud OS is comprised of two primary environments, the Administrative Environment and the Execution Environment. 

The two environments work together to allow users to set up and manage a self-service cloud deployment.

- Administrative Environment - The [Administrative Environment](#admin) contains dashboards and tools that enable users to manage the cloud.
- Execution Environment - The [Execution Environment](#execution) contains services, systems, and subsystems that emulate an operating system. The environment executes the cloud on top of your infrastructure, including your servers, networks, and storage.

The following diagram illustrates a conceptual depiction of the administrative and execution environment.

<img src="/media/cloud-os-diagram.png" alt="" />
<!-- Image from CloudCoreProductPlan.pdf http://wiki.hpcloud.net/display/core/Cloud+OS+Core+Product+Management -->

## Execution Environment ## {#execution}

The Execution Environment contains a [Kernel Layer](#kernel) and a [Base Layer](#base).

- Kernel Layer - The HP Cloud OS [Kernel Layer](#kernel), which is similar to an operating system's kernel layer, across the cloud.
- Base Layer - The HP Cloud OS [Base Layer](#base), which is comprised of advanced services that sit above the kernel, is like subsystem services in an operating system.
 

### Kernel Layer ### {#kernel}
The Kernel Layer acts like an Operating System Kernel across a Data Center for Cloud which acts as an OS for Cloud. The Kernel Layer is based on the OpenStack infrastructure set of services. The following services from OpenStack are used.


**Compute Operations**. This service manage the various hypervisors and virtual machines. Also known as *Nova*.

- Overview – Link to API (https://docs.hpcloud.com/api/v13/compute/)
- [Getting started with the Cloud OS Compute service](/cloudos/api/services/object/getting-started)
- [How To's with the HP Cloud OS Compute Service](/cloudos/api/services/compute/howto/)


**Networking Operations**. Allows you to provision and create virtual networks. Also known as *Neutron* or *Quantam*.

- Overview – Link to API (https://docs.hpcloud.com/api/v13/networking/)
- [Getting started with the Cloud OS Networking service](/cloudos/api/services/networking/getting-started)
- [How To's with the HP Cloud OS Network Service](/cloudos/api/services/networking/howto/)


**Volume Operations**. Taking your storage and attaching it to your virtual environment and cloud. Also known as *Cinder*.

- Overview – Link to API (https://docs.hpcloud.com/api/v13/????/)
- [Getting started with the Cloud OS Volume Management service](/cloudos/api/services/volume/getting-started)
- [How To's with the HP Cloud OS Volume Management Service](/cloudos/api/services/volume/howto/)


**Image Operations**. Glance allows you to maintain images which you can use to bootstrap VM’s across the cloud and then manage them. Also known as *Glance*.

- Overview – Link to API (https://docs.hpcloud.com/api/v13/image/)
- [Getting started with the Cloud OS Image Management service](/cloudos/api/services/imaging/getting-started)
- [How To's with the HP Cloud OS Image Management Service](/cloudos/api/services/imaging/howto/)


**Identity Operations**. Allows for group and multi-tenant creation.  Also known as *Keystone*.

- Overview – Link to API (https://docs.hpcloud.com/api/v13/identity/)
- [Getting started with the Cloud OS Identity Management service](/cloudos/api/services/identity/getting-started)
- [How To's with the HP Cloud OS Identity Management Service](/cloudos/api/services/identity/howto/)

**Object Operations**. Allows for group and multi-tenant creation.  Also known as *Swift*.

- Overview – Link to API (https://docs.hpcloud.com/api/v13/identity/)
- [Getting started with the Cloud OS Object Management service](/cloudos/api/services/object/getting-started)
- [How To's with the HP Cloud OS Identity Management Service](/cloudos/api/services/identity/howto/)

**Telemetry and Reporting**. Allows .  Also known as *Ceilometer*.

- Overview – Link to API (https://docs.hpcloud.com/api/v13/identity/)
- [Getting started with the Cloud OS Telemetry and Reporting service](/cloudos/api/services/reporting/getting-started)
- [How To's with the HP Cloud OS Telemetry and Reporting Service](/cloudos/api/services/reporting/howto/)

### Base layer ### {#base}

The Base Layer contains those advance services above the kernel which provide services to the kernel or essentially perform like a subsystem.

**Eden**. Scalabilty manageability, control. 

A framework which is used to build all the HP Cloud OS services. It provides common functionality across all service. 

Eden also provides scalability and manageability around services and a way to control and understand how those services are performing

- Overview – Link to API?
- Getting started with the Eden service
- Eden service use cases/solutions/how to use/examples

**Peer** A resource pool registry; Allows you to interact with other clouds.
HP Public is a resource pool registry, which allows you to tap into any OpenStack cloud. This allows for a hybrid cloud approach for sharing resources. Example: using HP Public Cloud Services in conjunction with your internal private cloud services.

- Overview – Link to API?
- [Getting started with the Peer service](/cloudos/api/services/peer/getting-started/)
- Peer service use cases/solutions/how to use/examples

**Eve**. Provisioning, templates, build around templates
provisioning service allowing you to create templates and provision those templates for infrastructure. This allows to take advantage of the orchestration feature in HP Cloud OS and OpenStack. Eve can be used across multiple clouds

- Overview – Link to API?
- [Getting started with the Eve service](/cloudos/api/services/eve/getting-started/)
- Eve service use cases/solutions/how to use/examples

**Focus** Managing templates, binding documents, versioning. An internal service to manage the documents and templates. Versioning and document relationship is also a function provided by Focus.

- Overview – Link to API?
- [Getting started with the Focus service](/cloudos/api/services/peer/getting-started/)
- Use cases/solutions/how to use/examples


## Administrative Environment ## {#admin}

The Administration Environment allows operational resources to control the architecture of the cloud and life-cycle manage the architecture

The administration environment is made up of dashboards and tools:

**Skyline**. A dashboard that allows self-service usage of the cloud. Skyline looks and acts like the OpenStack Horizon dashboard.

**Cosmos**. A dashboard for operational resources allowing you to change the architecture of the cloud. You can scale the cloud in or out. You can also use it to change plugins. Cosmos is also based on OpenStack Horizon.

**Install/Upgrade System**. A system which allows us to create the cloud and the various services related to HP Cloud OS. It can also changes the plugins and update everything inside the cloud including patching and update


## For more information ##
Also see the Help topics that are available in the Operational Dashboard and Administration Dashboard.  Website copies are available:

* [HP Cloud OS Operational Dashboard Help](/cloudos/manage/operational-dashboard/)
* [HP Cloud OS Administration Dashboard Help](/cloudos/manage/administration-dashboard/)