---
layout: default
title: "HP Helion OpenStack&#174; Services Overview"
permalink: /helion/community/services/overview/
product: community

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/community/technical-overview/">&#9664; PREV</a> | <a href="/helion/community/">&#9650; UP</a> | <a href="/helion/community/support-matrix/"> NEXT &#9654</a> </p>  
-->

# HP Helion OpenStack&reg; Community Services Overview

OpenStack is comprised of several integrated services. Each service works through an API (application programming interface) that allows services to work together and allows users to interact with the services.

HP Helion OpenStack Community includes a number of additional services to work with your cloud. 

- [Service User Accounts](#service)
- [OpenStack Services](#OpenStack)
- [Dashboard Services](#Dashboard)
- [Other Services](#Other)
- [More information](#info)

In addition to the APIs, you can interact with the most services through a graphic user interface (dashboard or console) or a command line interface (CLI).

##Service User Accounts {#service}
The HP Helion OpenStack Community installation process creates a **service** **user** account for each installed service. Service user accounts require elevated privileges to validate end user tokens. It is therefore strongly recommended that you do ***not*** add these service user accounts to any project because this could allow project users to access services they should not have permission to access. 

The service user accounts include, but are not limited to, the following:

- Swift
- Nova
- Neutron
- Sherpa
- Glance
- Cinder
- Heat
- Keystone
- Ceilometer

## OpenStack Services {#OpenStack}

The following services are foundation technologies used by the HP Helion OpenStack Community. Based on OpenStack technology, HP Helion OpenStack  Community comprises of a set of services and architecture that defines a data-center-level operating system (DCOS).

**Compute Operations**. The Compute service manages the hypervisors and virtual machines in your environment. Also known as **Nova**. 

See [Overview of the Compute service](/helion/community/services/compute/overview/).

**Identity Management**. The Identity Management service enables you to create and administer users and security groups, and control access to your cloud environment. Also known as **Keystone**.

See [Overview of the Identity Management service](/helion/community/services/identity/overview).

**Image Operations**. The Image Operations service enables you to create and maintain server images, which you can use to launch virtual machines across the cloud. Also known as **Glance**.

See [Overview of the Image service](/helion/community/services/imaging/overview).

**Networking Operations**. The Networking service enables you to create and manage virtual networks. Also known as **Neutron**.

See [Overview of the Networking service](/helion/community/services/networking/overview).

**Object Operations**. The Object Operations service enables you to store and retrieve data. Object Storage is a distributed storage system for static data such as virtual machine images, photo storage, email storage, backups and archives. Also known as **Swift**.

See [Overview of the Object Operations service](/helion/community/services/object/overview/).

**Orchestration**. The Orchestration service provides a template-based orchestration for describing a cloud application. A Heat template is a [YAML](http://www.yaml.org/) file that describes the infrastructure for a cloud application. Templates contain vendor-independent specifications for launching a particular service or application.  Also known as **Heat**.

See [Overview of the Orchestration service](/helion/community/services/orchestration/overview).

**Volume Operations**. The Volume Operations service enables you to attach storage volumes to the virtual instances in your cloud environment. The service provides persistent block level storage devices for use with your Compute instances. Also known as **Cinder**.

See [Overview of the Volume Operations Service](/helion/community/services/volume/overview).

**Metering**. The Metering service enables a single infrastructure to collect measurements throughout your cloud environment. Also known as **Ceilometer**.

See [Overview of the Metering Service](/helion/community/services/reporting/overview/).

## Dashboard Services {#Dashboard}

**Horizon** The Horizon service is the basis of the [HP Helion OpenStack dashboards](/helion/community/dashboard/how-works/). The dashboards are the web-based user interface for creating and managing HP Helion OpenStack resources.

You can use the HP Helion OpenStack Community dashboard to view, allocate, and manage all virtual resources within a cloud. 

See [Overview of the Horizon Service](/helion/community/services/horizon/overview/).
<!-- Not in 1.4
**Loom**. The Loom service facilitates the comprehension and manipulation of complex systems using the Unity dashboard.

See [Overview of the Loom Service](/helion/community/services/loom/overview/).
-->
## Other Services {#Other}

**Sherpa**. The Sherpa service provides a link to the remote web catalog. The catalog provides a repository of software that can be purchased and downloaded into the Cloud OS environment.  

See [Overview of Sherpa Service](/helion/community/services/sherpa/overview).

**TripleO**. TripleO (which stands for OpenStack-on-OpenStack) is a program designed to facilitate the installation of an OpenStack cloud. The HP Helion OpenStack Community installation process uses TripleO.

See [Overview of the TripleO Service](/helion/community/services/tripleo/overview/).

**Ironic**. The Ironic service runs during the installation for provisioning of the controller and KVM compute host in a baremetal deployment.

See [Overview of the Ironic Service](/helion/community/services/ironic/overview/).

<!-- Not in 1.4
**Sirius**. HP Helion OpenStack Sirius service assists the Cloud Administrator in the configuration of storage services (like Cinder and Swift) which run in the Overcloud on various storage devices.

See [Overview of Sirius Service](/helion/community/services/sirius/overview/)

**EON**. ESX on border (EON) service is an inventory which interacts with the VMware vCenter server and collects the information available at the datacenters and clusters. These information is used for deployment and configuration of ESX Proxy Compute node. EON service is deployed in undercloud controller node.

See [Overview of EON Service](/helion/community/services/eon/overview/)


**DNSaaS**. The HP Helion OpenStack DNSaaS (Domain Name System as a Service) provides a way to display, create, modify, and delete DNS records on the assigned DNS server network. 

See [Overview of the DNS as a Service](/helion/community/install/dnsaas/).

**DVR**. Distributed Virtual Routing (DVR) allows you to define connectivity among different VNSs as well as connectivity between VNS hosts and the external network. HP Helion OpenStack Community provides Distributed Virtual Routing to cloud users. 

See [Overview of DVR Service](/helion/community/services/dvr/overview/).
-->
## For more information {#info}
For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/). The **Architecture** section contains useful information about how an OpenStack Cloud is put together. However, HP Helion OpenStack takes care of these details for you. The **Operations** section contains information on how to manage the system.

For more information on installing the command-line interface for interacting with services, see [installing the OpenStack command-line clients](http://docs.openstack.org/user-guide/content/install_clients.html).


 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
