---
layout: default
title: "HP Helion OpenStack Services Overview"
permalink: /helion/openstack/services/overview/
product: commercial

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/helion/openstack/technical-overview/">&#9664; PREV</a> | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/support-matrix-beta/"> NEXT &#9654</a> </p>


# HP Helion OpenStack&reg; Services Overview #

OpenStack&#174; is comprised of several integrated services. Each service works through an API (application programming interface) that allows the services to work together and allows users to interact with the service.

HP Helion OpenStack includes a number of additional services for working with your cloud. This section lists the services available for you to work with your cloud.

- [OpenStack Services](#OpenStack)
- [Dashboard Services](#Dashboard)
- [Other Services](#Other)

In addition to the APIs, you can interact with the most services through a graphic user interface (dashboards) and command line interfaces (CLI).

**Note:** When assigning users to a project, it is recommended that you do not add service user accounts to any project. The HP Helion OpenStack installation process creates a service user account for each installed service. 

These accounts are utilized by the services to validate end user Tokens and, as such, require elevated privileges. 
Assigning these accounts to a project could allow project users to access services to which they should not have permission. 

The service user accounts include, but are not limited to, the following:

- swift
- nova
- neutron
- sherpa
- glance
- cinder
- heat
- keystone
- ceilometer


## OpenStack Services ## {#OpenStack}

The following services are foundation technologies used by the HP Helion OpenStack. Based on OpenStack technology, HP Helion OpenStack is comprised of a set of services and architecture that defines a data-center-level operating system (DCOS).

**Compute Operations**. The Compute service manages the hypervisors and virtual machines in your environment. Also known as *Nova*. 

See [Overview of the Compute service](/helion/openstack/services/compute/overview).

**Identity Management**. The Identity Management service enables you to create and administer users and security groups, and control access to your cloud environment. Also known as *Keystone*.

See [Overview of the Identity Management service](/helion/openstack/services/identity/overview).

**Image Operations**. The Image Operations service enables you to create and maintain server images, which you can use to launch virtual machines across the cloud. Also known as *Glance*.

See [Overview of the Image service](/helion/openstack/services/imaging/overview).

**Networking Operations**. The Networking service enables you to create and manage virtual networks. Also known as *Neutron*.

See [Overview of the Networking service](/helion/openstack/services/networking/overview).

**Object Operations**. The Object Operations service enables you to store and retrieve data. Object Storage is a distributed storage system for static data such as virtual machine images, photo storage, email storage, backups and archives. Also known as *Swift*.

See [Overview of the Object Operations service](/helion/openstack/services/object/overview).

**Orchestration**. The Orchestration service provides a template-based orchestration for describing a cloud application. A Heat template is a [YAML](http://www.yaml.org/) file that describes the infrastructure for a cloud application. Templates contain vendor-independent specifications for launching a particular service or application.  Also known as *Heat*.

See [Overview of the Orchestration service](/helion/openstack/services/orchestration/overview).

**Telemetry and Reporting**. The Telemetry and Reporting service enables a single infrastructure to collect measurements within your cloud environment.  Also known as *Ceilometer*.

See [Overview of the Telemetry and Reporting service](/helion/openstack/services/reporting/overview).

**Volume Operations**. The Volume Operations service enables you to attach storage volumes to the virtual instances in your cloud environment. The service provides persistent block level storage devices for use with your Compute instances. Also known as *Cinder*.

See [Overview of the Volume Operations Service](/helion/openstack/services/volume/overview).

## Dashboard Services ## {#Dashboard}

The following services are used by HP Helion OpenStack to create dashboards.

**Horizon** The Horizon service is the basis of the [HP Helion OpenStack dashboards](/helion/openstack/dashboard/how-works/). The dashboards are the web-based user-interface for creating and managing HP Helion OpenStack resources.

You can use the HP Helion OpenStack dashboard to view, allocate, and manage all virtual resources within a cloud. 

See [Overview of the Horizon Service](/helion/openstack/services/horizon/overview/).
<!-- Not in Commerical
**Loom**. The Loom service facilitates the comprehension and manipulation of complex systems using the Unity dashboard.

See [Overview of the Loom Service](/helion/openstack/services/loom/overview/).
-->
## Other Services ## {#Other}

**DNSaaS**. The HP Helion OpenStack DNSaaS (Domain Name System as a Service) provides a way to display, create, modify, and delete DNS records to the assigned DNS server network. 

See [Overview of the DNS as a Service](/helion/openstack/services/dns/overview/).

**Tripleo**. TripleO (which stands for OpenStack-on-OpenStack) is a program designed to facilitate the installation of an OpenStack cloud. The HP Helion OpenStack installation process uses TripleO.

See [Overview of the TripleO Service](/helion/openstack/services/tripleo/overview/).

**Ironic**. Ironic service during the installation for provisioning of the controller and KVM compute host in a bare metal deployment.

See [Overview of the Ironic Service](/helion/openstack/services/ironic/overview/).

## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/). The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, HP Helion OpenStack takes care of these details for you. The *Operations* section contains information on how to manage the system.

For more information on installing the command-line interface for interacting with services, see [Install the OpenStack command-line clients](http://docs.openstack.org/user-guide/content/install_clients.html).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

<!-- Not in beta
Capability Tagging
The Capability Tagging service provides the ability to describe requirements and capabilities using a common ontology and to tag (or, assign) requirements and capabilities to cloud resources. Also known as Graffiti or Peer
/helion/openstack/services/peer/getting-started/

## Value-Add Services ##

The following services are 

**Eden**. The Eden framework is used to build all the HP Helion OpenStack services. It provides common functionality across all services. 

Eden also provides scalability and manageability around services and a way to view and control how those services are performing

- [Overview of the Eden service](/helion/openstack/services/eden/overview)

**Graffiti** The Graffiti service is a resource pool registry, which allows you to access your cloud environment. The Graffiti service allows for a hybrid cloud approach for sharing resources. For example, Graffiti enables you to use the HP Helion OpenStack environment in conjunction with your internal private cloud services. Also known as *Peer*.

- [Overview of the Graffiti service](/helion/openstack/services/peer/overview)

**Eve**. Provisioning, templates, build around templates
provisioning service allowing you to create templates and provision those templates for infrastructure. This allows to take advantage of the orchestration feature in HP Helion OpenStack and OpenStack. Eve can be used across multiple clouds
The Eve service is an infrastructure topology provisioning service. Eve allows you to provision TOSCA-based infrastructure topology designs 

- [Overview of the Eve service](/helion/openstack/services/eve/overview)

**Focus** Managing templates, binding documents, versioning. An internal service to manage the documents and templates. Versioning and document relationship is also a function provided by Focus.
the Topology Design Registry and Repository Service. Focus provides for persistent store and management of TOSCA-based templates.
- [Overview of the Compute service](/helion/openstack/services/focus/overview)

-->

