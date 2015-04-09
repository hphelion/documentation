---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade: Services Overview"
permalink: /helion/openstack/carrier/services/overview/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: Systems Administrator 
role2: Cloud Architect 
role3: Storage Administrator 
role4: Network Administrator 
role5: Service Developer 
role6: Cloud Administrator 
role7: Application Developer 
role8: Network Engineer 
authors: Paul F

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href=" /helion/openstack/1.1/services/overview/">&#9664; PREV</a> | <a href="/helion/openstack/1.1/">&#9650; UP</a> | <a href="/helion/openstack/1.1/support-matrix/"> NEXT &#9654</a> </p>  


# HP Helion OpenStack&#174; Carrier Grade: Services Overview
[See the Helion OpenStack 1.0 version of this page](/helion/openstack/services/overview/)

OpenStack is comprised of several integrated services. Each service works through an API (application programming interface) that allows services to work together and allows users to interact with the services.

HP Helion OpenStack includes a number of additional services to work with your cloud. 

- [Service User Accounts](#service)
- [OpenStack Services](#OpenStack)
- [HP Services](#hp)
- [Installation services](#install)
- [Other Services](#Other)
- [More information](#info)

In addition to the APIs, you can interact with the most services through a graphic user interface (dashboard or console) or a command line interface (CLI).

##Service User Accounts {#service}
The HP Helion OpenStack installation process creates a **service** **user** account for each installed service. Service user accounts require elevated privileges to validate end user tokens. It is therefore strongly recommended that you do ***not*** add these service user accounts to any project because this could allow project users to access services they should not have permission to access. 

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
- Ceph

## OpenStack Services {#OpenStack}

The following services are foundation technologies used by the HP Helion OpenStack. Based on OpenStack technology, HP Helion OpenStack comprises of a set of services and architecture that defines a data-center-level operating system (DCOS).

For information on enabling and maintaining each of these OpenStack services, see [Network Administrator Notes](/helion/openstack/1.1/network/administrator/notes/).

**Compute Operations**. The Compute service manages the hypervisors and virtual machines in your environment. Also known as **Nova**. 

See [Overview of the Compute service](/helion/openstack/1.1/services/compute/overview/).

**Identity**. The Identity Management service enables you to create and administer users and security groups, and control access to your cloud environment. Also known as **Keystone**.

See [Overview of the Identity Management service](/helion/openstack/1.1/services/identity/overview).

**Image Operations**. The Image Operations service enables you to create and maintain server images, which you can use to launch virtual machines across the cloud. Also known as **Glance**.

See [Overview of the Image service](/helion/openstack/1.1/services/imaging/overview).

**Networking Operations**. The Networking service enables you to create and manage virtual networks. Also known as **Neutron**.

See [Overview of the Networking service](/helion/openstack/1.1/services/networking/overview).

**Object Operations**. The Object Operations service enables you to store and retrieve data. Object Storage is a distributed storage system for static data such as virtual machine images, photo storage, email storage, backups and archives. Also known as **Swift**.

See [Overview of the Object Operations service](/helion/openstack/1.1/services/object/overview/).

**Orchestration**. The Orchestration service provides a template-based orchestration for describing a cloud application. A Heat template is a [YAML](http://www.yaml.org/) file that describes the infrastructure for a cloud application. Templates contain vendor-independent specifications for launching a particular service or application.  Also known as **Heat**.

See [Overview of the Orchestration service](/helion/openstack/1.1/services/orchestration/overview).

**Volume Operations**. The Volume Operations service enables you to attach storage volumes to the virtual instances in your cloud environment. The service provides persistent block level storage devices for use with your Compute instances. Also known as **Cinder**.

See [Overview of the Volume Operations Service](/helion/openstack/1.1/services/volume/overview).

**Metering**. The Metering service enables a single infrastructure to collect measurements throughout your cloud environment. Also known as **Ceilometer**.

See [Overview of the Metering Service](/helion/openstack/1.1/services/reporting/overview/).


**Ceph**. Ceph is an Open Source, scalable, software defined storage running on HP Servers which provides block and object storage with unified management. 

See [Overview of the Ceph Service]( /helion/openstack/1.1/services/ceph/)

<!-- Not in Commerical
**Loom**. The Loom service facilitates the comprehension and manipulation of complex systems using the Unity dashboard.

See [Overview of the Loom Service](/helion/openstack/1.1/services/loom/overview/).
-->

## HP Services ## {#hp}

The following services have been developed by HP for use with the HP Helion OpenStack.

**Sirius**. HP Helion OpenStack Sirius service assists the Cloud Administrator in the configuration of storage services (like Cinder and Swift) which run in the Overcloud on various storage devices.

See [Overview of Sirius Service](/helion/openstack/1.1/services/sirius/overview/)

**EON**. ESX on border (EON) service is an inventory which interacts with the VMware vCenter server and collects the information available at the datacenters and clusters. These information is used for deployment and configuration of ESX Proxy Compute node. EON service is deployed in undercloud controller node.

See [Overview of EON Service](/helion/openstack/1.1/services/eon/overview/)

**Sherpa**. The Sherpa service provides a link to the remote web catalog. The catalog provides a repository of software that can be purchased and downloaded into the Cloud OS environment.  

See [Overview of Sherpa Service](/helion/openstack/1.1/services/sherpa/overview).

## Dashboard services ## {#dash}

HP Helion OpenStack uses the following services or software to present user interfaces to aspects of HP Helion OpenStack.

**Horizon** The Horizon service is the basis of the [HP Helion OpenStack dashboards](/helion/openstack/1.1/dashboard/how-works/) for creating and managing HP Helion OpenStack resources. The Horizon dashboard is developed by HP for use with HP Helion OpenStack. 

You can use the HP Helion OpenStack dashboard to view, allocate, and manage all virtual resources within a cloud. 
See [Overview of the Horizon Service](/helion/openstack/1.1/services/horizon/overview/).

**Icinga** The Icinga service, which runs in the undercloud, helps cloud admins monitor the disk usage of Swift storage node(s). Icinga is an open-source software project.

See [Overview of the Icinga Service](/helion/commercial/1.1/services/icinga/).

**Kibana**. The Kibana service, which runs in the undercloud, is the user interface into the [centralized logging service](/helion/openstack/1.1/services/logging/overview/) that helps view logging data across the HP Helion OpenStack cloud. Kibana is an open-source software project.

See [Overview of the Icinga Service](/helion/commercial/1.1/services/kibana/).

## Installation services ## {#install}

The following services are used only during the HP Helion OpenStack installation:

**TripleO**. TripleO (which stands for OpenStack-on-OpenStack) is a program designed to facilitate the installation of an OpenStack cloud. The HP Helion OpenStack installation process uses TripleO.

See [Overview of the TripleO Service](/helion/openstack/1.1/services/tripleo/overview/).

**Ironic**. The Ironic service runs during the installation for provisioning of the controller and KVM compute host in a baremetal deployment.

See [Overview of the Ironic Service](/helion/openstack/1.1/services/ironic/overview/).

## Other services and features {#Other}

The following services and features can be used with HP Helion OpenStack.

**Centralized Logging**. The HP Helion OpenStack Centralized Logging uses a number of services and systems to collect logs throughout the cloud into a central system. The administrator can use a single graphic interface to view log information in charts, graphs, tables, histograms, and other forms. 

See [Centralized Logging Overview](/helion/openstack/1.1/services/logging/overview/).

**DNSaaS**. The HP Helion OpenStack DNSaaS (Domain Name System as a Service) provides a way to display, create, modify, and delete DNS records on the assigned DNS server network. 

See [Overview of the DNS as a Service](/helion/openstack/1.1/install/dnsaas/).




## For more information {#info}
For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/). The **Architecture** section contains useful information about how an OpenStack Cloud is put together. However, HP Helion OpenStack takes care of these details for you. The **Operations** section contains information on how to manage the system.

For more information on installing the command-line interface for interacting with services, see [installing the OpenStack command-line clients](http://docs.openstack.org/user-guide/content/install_clients.html).


 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
