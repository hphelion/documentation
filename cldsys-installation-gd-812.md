---
layout: default
title: "HP CloudSystem 8.1 Update 2 Installation
and Configuration Guide"
permalink: /HPCLOUDSYSTEMTEST/
product: public-cloud

---
<!--UNDER REVIEW-->


Welcome to HP CloudSystem
=========================

HP CloudSystem Foundation
about
HP CloudSystem Enterprise
about
HP CloudSystem provides a software-defined approach to managing the
cloud in a converged infrastructure environment. CloudSystem consists of
two offerings:

-   **HP CloudSystem Foundation** is built on enterprise-grade OpenStack
    technology. It integrates hardware and software to deliver core
    Infrastructure as a Service (IaaS) provisioning and lifecycle
    management of compute, network and storage resources. You can manage
    CloudSystem Foundation from an administrative console, self-service
    portal, CLIs, and OpenStack APIs. It provides an appliance-based
    deployment console to simplify installation and maintenance, and an
    embedded version of HP Operations Orchestration (OO) for automating
    administrative processes.

    See ?.

    ![CloudSystem Foundation](img/foundation_intro.png)

-   **HP CloudSystem Enterprise** expands on CloudSystem Foundation to
    integrate servers, storage, networking, security, and management to
    automate the lifecycle for hybrid service delivery. Template
    architects use Enterprise to create infrastructure templates and
    offer them as services in a Marketplace Portal. Users select
    services from a catalog and manage their subscriptions. When a
    service is requested, Enterprise automatically provisions the
    servers, storage, and networking. Enterprise also includes an
    enhanced set of Operations Orchestration workflows.

    CloudSystem Enterprise provides a hybrid cloud management platform
    where you can manage all cloud services.

    See ?.

    ![CloudSystem Enterprise](img/enterprise_intro.PNG)

Explanation of solution components
----------------------------------

The components of CloudSystem Foundation and CloudSystem Enterprise are
explained below.

-   ?

-   ?

-   ?

![CloudSystem architecture](img/overview.png)

### Management hypervisors and integrated tools

management hypervisors
about
VMware vCenter Server
about
HP 3PAR StoreServ storage system
about
-   **Management hypervisors** host the various virtual machine
    appliances that make up the CloudSystem solution. Both ESXi and KVM
    hypervisors are supported.

-   **VMware vCenter Server** acts as a central administrator for ESXi
    clusters that are connected on a network. vCenter Server allows you
    to pool and manage the resources of multiple hosts, as well as
    monitor and manage your physical and virtual infrastructure. You can
    import and activate ESXi clusters in the CloudSystem Console after
    you register a connection with vCenter Server.

    VMware vCloud Networking and Security **(vCNS)** provides security
    for the ESXi compute hosts.

-   An **HP 3PAR StoreServ storage system** provides a method of carving
    storage for data disks. Block storage drivers are imported from the
    HP 3PAR StoreServ storage system to the CloudSystem Console.

-   An **FC SAN**, **iSCSI** or **Flat SAN** connects the HP 3PAR
    storage system to compute nodes or ESXi clusters.

### CloudSystem Foundation components

HP CloudSystem Foundation
components
Foundation base appliance
about
SDN appliance
about
network node appliances
about
vCenter proxy appliance
about
CloudSystem Console
about
CloudSystem Portal
about
HP Operations Orchestration
about
HP OO Studio
about
-   **CloudSystem Foundation** is the IaaS solution used for
    provisioning virtual machine instances. Management tasks for both
    Foundation and Enterprise are performed from Foundation’s
    CloudSystem Console. Foundation includes the following components,
    which all run on virtual machines on one or more management
    hypervisors:

    -   The Foundation **base appliance** contains the core services and
        functionality of the CloudSystem Console. The CloudSystem
        Portal, OpenStack services, OO Central and supporting CLIs also
        reside on the Foundation base appliance.

        -   The **SDN** (Software Defined Networking)**appliance** is
            the control center for the network infrastructure of the
            Foundation base appliance. When the OpenStack Neutron
            service needs to define a new router or a plugin on the
            Foundation base appliance, the request is sent to the SDN
            appliance.

            CloudSystem Foundation automatically creates the SDN
            appliance after the Foundation base appliance is installed
            and the Cloud Networking settings are saved in the
            CloudSystem Console.

        -   The **network node appliances** manage various network
            services, such as DHCP and L3 (routing) services, for
            provisioned virtual machines and provisioned virtual
            networks. The SDN appliance manages the network node
            appliances as a cluster. When the SDN appliance receives a
            request to create a new router, it creates the router in one
            of the network node appliances.

            Multiple network node appliances are created during
            installation, after the Foundation base appliance is
            installed and Cloud Networking settings are saved in the
            CloudSystem Console.

        -   A **vCenter proxy appliance** supports ESXi compute nodes.
            OpenStack Nova and Neutron agents reside in the vCenter
            proxy appliance. The vCenter proxy appliance acts as a proxy
            for the ESXi management hypervisor. The management
            hypervisor accepts each vCenter Server cluster as one large
            compute node. This configuration allows your cloud to take
            advantage of HA and load balancing features supported in
            vCenter Server.

            The vCenter proxy appliance runs the OpenStack agents for up
            to 12 ESXi clusters. Foundation automatically creates the
            first vCenter proxy appliance when the first ESXi cluster is
            activated in the CloudSystem Console.

        -   The **CloudSystem Console** GUI supports administrative
            tasks, such as creating volume types, activating compute
            nodes, setting up networks, monitoring the Foundation base
            appliance, and performing maintenance tasks on the
            appliance.

        -   The **CloudSystem Portal** GUI is accessed from a modified
            Foundation base appliance URL by appending **portal** to the
            Foundation IP address. Example: `https://portal`. Instances
            are created and managed from this portal.

        -   **HP Operations Orchestration (OO) Central** provides the
            ability to run scripted workflows on the Foundation base
            appliance. Access OO Central from the Integrated Tools
            screen in the CloudSystem Console.

            After installing Enterprise, a new set of OO content packs
            is available to support workflows in HP CSA’s Topology
            Designer and Sequential Designer.

            **HP OO Studio** provides the ability to edit OO workflows.
            OO Studio is installed separately, using the installer
            executable file included in the `HP
            CloudSystem-OO-Studio-8.1.2.0` zip file.

            To learn more about installing HP OO Studio, see ?.

### CloudSystem Enterprise components

HP CloudSystem Enterprise
components
Enterprise appliance
about
Marketplace Portal
about
Topology Designer
about
Sequential Designer
about
HP CSA
about
-   **HP CloudSystem Enterprise** expands on CloudSystem Foundation by
    integrating servers, storage, networking, security, and management
    to automate the lifecycle for hybrid service delivery. Template
    architects use Enterprise to create infrastructure templates, which
    are offered as services in the Marketplace Portal. When a cloud user
    requests a service from the catalog, Enterprise automatically
    provisions the servers, storage, and networking designed in the
    service.

    Enterprise is installed from Foundation and uses the Foundation
    platform to conduct management tasks. Enterprise includes the
    following components:

    -   The **Enterprise appliance** contains the core functionality of
        the Enterprise offering, including HP Cloud Service Automation
        (HP CSA), the Marketplace Portal, Topology Designer and
        Sequential Designer.

        -   **HP CSA** is the administrative portal for the Enterprise
            appliance. Designs are created in the HP CSA portal.

        -   The **Marketplace Portal** displays offerings that can be
            purchased and applied to a cloud environment.

        -   **HP CSA Topology Designer** is an easy to use solution for
            infrastructure provisioning designs. **HP CSA Sequential
            Designer** handles more complex application provisioning
            designs. Designs from both designers are offered as services
            in the Marketplace Portal.

Before you begin
================

HP CloudSystem is a flexible cloud management solution that supports
multiple installation options. This guide does not cover all possible
options. If the installation required by your organization does not
match the installation described in this guide, contact an HP Support
representative for assistance.

Audience
--------

This guide is intended for experienced system administrators with a
working knowledge of the following concepts.

-   Top of Rack (TOR) switches for networking

-   CLI commands for Windows and Linux

-   VMware vCenter Server functionality, if using ESXi hypervisors and
    compute nodes

-   VMware distributed and standard vSwitches

-   Red Hat KVM hypervisor configuration and use, if using KVM
    hypervisors and compute nodes

-   Secure shell (ssh) and secure copy (scp) commands, if using KVM
    hypervisors and compute nodes

If you plan to use the OpenStack CLI and APIs to manage some of the
cloud resources from the command line, it is helpful to have experience
with OpenStack technologies such as Nova, Glance, Cinder, Keystone and
Neutron.

Assumptions
-----------

This installation guide makes the following assumptions about your
readiness for the installation. Make sure these assumptions match the
state of your environment before you begin the installation.

-   All hardware required to support a CloudSystem installation is
    installed and configured. You can use the requirements chapter to
    verify this before installation. See ?.

-   If you are using VMware vSphere, then VMware vCenter Server is
    installed and ready to connect to CloudSystem.

-   If you plan to use block storage, then an HP 3PAR StoreServ storage
    system is configured and ready to connect to CloudSystem.

-   You have a list of user names and passwords for VMware vCenter
    Server and HP 3PAR StoreServ storage system.

-   You have prepared a list of IP addresses that you can assign to
    CloudSystem virtual appliances.

**Next steps**: ?.

HP CloudSystem installation prerequisites
=========================================

HP CloudSystem
installation prerequisites
This chapter outlines the recommended and minimum hardware and software
requirements, the networking pre-configuration, and the solution
integration tools that must be in place before installing CloudSystem.

Understanding the installation process
--------------------------------------

HP CloudSystem
installation overview
A high-level overview of the CloudSystem installation path is provided
in the table below. The Additional resources column contains links to
information in this guide, as well as information from other
documentation sources.

+--------+----------------------------------------+----------------------------+
|        | Installation step                      | Additional resources       |
+========+========================================+============================+
|        | Verify that the target environment     | See?, ?, ?                 |
|        | satisfies the hardware, software, and  |                            |
|        | networking prerequisites described in  |                            |
|        | this guide.                            |                            |
+--------+----------------------------------------+----------------------------+
|        | Configure the HP 3PAR StoreServ        | See [OpenStack Cinder      |
|        | storage system to support storage      | documentation](https://wik |
|        | requirements for compute nodes and     | i.openstack.org/wiki/Cinde |
|        | virtual machine instances. This guide  | r)[HP                      |
|        | does not cover the specific steps      | 3PAR StoreServ             |
|        | required to accomplish this.           | documentation](http://www. |
|        | -   The 3PAR StoreServ storage system  | hp.com/go/3par)            |
|        |     server certificate must contain a  |                            |
|        |     Fully Qualified Domain Name (FQDN) |                            |
|        |     in the CN attribute Subject field. |                            |
|        |                                        |                            |
|        | -   For block storage volumes, enable  |                            |
|        |     REST API web services on the 3PAR  |                            |
|        |     StoreServ.                         |                            |
+--------+----------------------------------------+----------------------------+
|        | Set up the management hypervisor       | See ?, ?, [VMware vSphere  |
|        | solution (ESXi or KVM) per CloudSystem | Documentation](http://www. |
|        | requirements. If using VMware vSphere, | vmware.com/support/pubs/vs |
|        | configure vCenter Server.              | phere-esxi-vcenter-server- |
|        |                                        | pubs.html)                 |
|        |                                        | at                         |
|        |                                        | [VMware](https://www.vmwar |
|        |                                        | e.com/)                    |
+--------+----------------------------------------+----------------------------+
|        | Use **csstart** to deploy the          | See?, ?                    |
|        | Foundation base appliance.             |                            |
+--------+----------------------------------------+----------------------------+
|        | Enter and save Cloud Networking        | See ?                      |
|        | settings in the CloudSystem Console.   |                            |
+--------+----------------------------------------+----------------------------+
|        | **Optional**: Install OO Studio, if    | See ?                      |
|        | you want to customize workflows.       |                            |
+--------+----------------------------------------+----------------------------+
|        | **Optional**: Install CloudSystem      | See ?                      |
|        | Enterprise.                            |                            |
+--------+----------------------------------------+----------------------------+
|        | Stage and prepare compute nodes. This  | See “Resource              |
|        | guide does not cover the specific      | Configuration in           |
|        | steps required to accomplish this.     | CloudSystem Foundation:    |
|        |                                        | Compute node creation” in  |
|        |                                        | the HP CloudSystem 8.1     |
|        |                                        | Administrator Guide at     |
|        |                                        | [Enterprise Information    |
|        |                                        | Library](http://www.hp.com |
|        |                                        | /go/CloudSystem/docs)      |
+--------+----------------------------------------+----------------------------+
|        | Build and manage cloud resources. This | See “Cloud service         |
|        | guide does not cover the specific      | provisioning, deployment,  |
|        | steps required to accomplish this.     | and service management in  |
|        |                                        | CloudSystem Portal” in the |
|        |                                        | HP CloudSystem 8.1         |
|        |                                        | Administrator Guide at     |
|        |                                        | [Enterprise Information    |
|        |                                        | Library](http://www.hp.com |
|        |                                        | /go/CloudSystem/docs)      |
+--------+----------------------------------------+----------------------------+

: Installation process

Software requirements
---------------------

HP CloudSystem
software requirements
VMware vCenter Server
software requirements
Red Hat Enterprise Linux
software requirements
HP 3PAR StoreServ storage system
software requirements
HP OO Studio
software requirements
HP Operations Orchestration
software requirements
HP CSA
software requirements
Refer to the table below for a list of supported software versions.

+-------------------------+------------------------------+----------------------+
| Software                | Version                      | Location             |
+=========================+==============================+======================+
| **VMware vCenter        | **vCenter Server Appliance   | Available from       |
| Server** and **ESXi     | 5.5 U2** (build 2001466)     | <http://software.hp. |
| host** (management and  |                              | com>.                |
| compute)                | -   ESXi 5.5 U2              | Select the           |
|                         |                              | virtualization       |
| To verify VMware guest  | -   ESXi 5.5 U1              | software link.       |
| operating systems, see  |                              |                      |
| the [VMware             | -   ESXi 5.5                 | For customized       |
| Compatibility           |                              | images, see          |
| Guide](http://www.vmwar | -   ESXi 5.1 U2              | [Customize VMware    |
| e.com/resources/compati |                              | ESXi Images for HP   |
| bility/search.php?devic | -   ESXi 5.0 U3              | ProLiant             |
| eCategory=software&test |                              | Servers](http://h180 |
| Config=16)              | **vCenter Server Appliance   | 04.www1.hp.com/produ |
| and type “Guest OS” in  | 5.5 U1b** (build 1891313)    | cts/servers/software |
| the **What are you      |                              | /vmware/esxi-image.h |
| looking for** field.    | -   ESXi 5.5 U1              | tml )                |
|                         |                              |                      |
| > **Note**              | -   ESXi 5.5                 | See VMware Knowledge |
| >                       |                              | Base [VMware vSphere |
| > An HP customized      | -   ESXi 5.1 U2              | and vCloud suite     |
| > image is available    |                              | build numbers        |
| > for VMware vSphere    | -   ESXi 5.0 U3              | table](http://kb.vmw |
| > 5.5, VMware vSphere   |                              | are.com/selfservice/ |
| > 5.1 Update 2, and     | **vCenter Server Appliance   | microsites/search.do |
| > ESXi 5.0 Update 3.    | 5.1 U2** (build 1474364)     | ?language=en_US&cmd= |
|                         |                              | displayKC&externalId |
|                         | -   ESXi 5.1 U2              | =1014508#vCenter )   |
|                         |                              |                      |
|                         | -   ESXi 5.0 U3              |                      |
|                         |                              |                      |
|                         | **vCenter Server Appliance   |                      |
|                         | 5.0 U3** (build 1302764)     |                      |
|                         |                              |                      |
|                         | -   ESXi 5.0 U3              |                      |
|                         |                              |                      |
|                         | **vCenter Server for Windows |                      |
|                         | 5.5 U2** (build 2001466)     |                      |
|                         |                              |                      |
|                         | -   ESXi 5.5 U2              |                      |
|                         |                              |                      |
|                         | -   ESXi 5.5 U1              |                      |
|                         |                              |                      |
|                         | -   ESXi 5.5                 |                      |
|                         |                              |                      |
|                         | -   ESXi 5.1 U2              |                      |
|                         |                              |                      |
|                         | -   ESXi 5.0 U3              |                      |
|                         |                              |                      |
|                         | **vCenter Server for Windows |                      |
|                         | 5.5 U1b** (build 1891313)    |                      |
|                         |                              |                      |
|                         | This version is supported    |                      |
|                         | when it is installed with a  |                      |
|                         | software update previously   |                      |
|                         | available from VMware. The   |                      |
|                         | software update is now       |                      |
|                         | included in vCenter Server   |                      |
|                         | for Windows 5.5 U2.          |                      |
|                         |                              |                      |
|                         | -   ESXi 5.5 U1              |                      |
|                         |                              |                      |
|                         | -   ESXi 5.5                 |                      |
|                         |                              |                      |
|                         | -   ESXi 5.1 U2              |                      |
|                         |                              |                      |
|                         | -   ESXi 5.0 U3              |                      |
|                         |                              |                      |
|                         | **vCenter Server for Windows |                      |
|                         | 5.1 U2** (build 1473063)     |                      |
|                         |                              |                      |
|                         | -   ESXi 5.1 U2              |                      |
|                         |                              |                      |
|                         | -   ESXi 5.0 U3              |                      |
|                         |                              |                      |
|                         | **vCenter Server for Windows |                      |
|                         | 5.0 U3** (build 1300600)     |                      |
|                         |                              |                      |
|                         | -   ESXi 5.0 U3              |                      |
+-------------------------+------------------------------+----------------------+
| **VMware vCloud         | 5.5                          | See ?                |
| Networking and Security |                              | See ?                |
| (vCNS)**                |                              |                      |
|                         |                              |                      |
| Required on ESXi        |                              |                      |
| compute nodes to        |                              |                      |
| support security groups |                              |                      |
| for provisioned         |                              |                      |
| instances.              |                              |                      |
+-------------------------+------------------------------+----------------------+
| **Red Hat Enterprise    | 6.4                          | See ?                |
| Linux**                 |                              |                      |
|                         | 6.5                          |                      |
| To verify RedHat        |                              |                      |
| supported operating     |                              |                      |
| systems, see the        |                              |                      |
| [RedHat Customer        |                              |                      |
| Portal](https://access. |                              |                      |
| redhat.com/certified-hy |                              |                      |
| pervisors).             |                              |                      |
+-------------------------+------------------------------+----------------------+
| **3PAR Inform**         | **Inform OS 3.2.1**          | Contact your HP 3PAR |
|                         |                              | support              |
|                         | Patch 01 is recommended      | representative for   |
|                         |                              | additional           |
|                         | -   3PAR Service Processor   | information.         |
|                         |     4.3.0.GA-17              |                      |
|                         |                              |                      |
|                         |     Patch 001 is recommended |                      |
|                         |                              |                      |
|                         | -   3PAR Inform Management   |                      |
|                         |     Console 4.6.0.14         |                      |
|                         |                              |                      |
|                         | -   CLI-SNMP (for clients)   |                      |
|                         |     3.2.1.46                 |                      |
|                         |                              |                      |
|                         | -   Smart Start 1.4.0.14     |                      |
|                         |                              |                      |
|                         | -   RC Quorum Witness        |                      |
|                         |     2.0.001                  |                      |
|                         |                              |                      |
|                         | -   Web Service API          |                      |
|                         |     (included in the OS      |                      |
|                         |     build)                   |                      |
|                         |                              |                      |
|                         | **Inform OS 3.1.3.230        |                      |
|                         | (MU1)**                      |                      |
|                         |                              |                      |
|                         | -   3PAR Service Processor   |                      |
|                         |     4.2.0.GA-29              |                      |
|                         |                              |                      |
|                         |     Patch 001 is recommended |                      |
|                         |                              |                      |
|                         | -   3PAR Inform Management   |                      |
|                         |     Console 4.5.1            |                      |
|                         |                              |                      |
|                         | -   CLI-SNMP (for clients)   |                      |
|                         |     3.1.3.230                |                      |
|                         |                              |                      |
|                         | -   Web Service API 1.3.1    |                      |
|                         |                              |                      |
|                         | **Inform OS 3.1.2.484 (MU    |                      |
|                         | 3)**                         |                      |
|                         |                              |                      |
|                         | > **Note**                   |                      |
|                         | >                            |                      |
|                         | > Patch 16 is a required     |                      |
|                         | > security patch. Patch 30   |                      |
|                         | > is a recommended patch,    |                      |
|                         | > but is not required.       |                      |
|                         |                              |                      |
|                         | -   3PAR Service Processor   |                      |
|                         |     (SP) 4.1.0.GA-97         |                      |
|                         |                              |                      |
|                         |     > **Note**               |                      |
|                         |     >                        |                      |
|                         |     > Patch 009 or Patch 010 |                      |
|                         |     > must be applied to be  |                      |
|                         |     > compatible with the OS |                      |
|                         |     > patch P16.             |                      |
|                         |                              |                      |
|                         | -   3PAR Inform Management   |                      |
|                         |     Console 4.4.1 (.27)      |                      |
|                         |                              |                      |
|                         | -   CLI-SNMP (for clients)   |                      |
|                         |     3.1.2.484                |                      |
|                         |                              |                      |
|                         | -   Web Service API 1.2.1    |                      |
+-------------------------+------------------------------+----------------------+
| **Virtual Machine File  | CloudSystem supports all     | See ?                |
| System (VMFS) storage** | ESXi datastore storage       |                      |
|                         | supported by VMware          |                      |
+-------------------------+------------------------------+----------------------+
| **HP OO Studio**        | 10.10                        | The executable file  |
|                         |                              | used to install this |
|                         |                              | software is included |
|                         |                              | in the HP            |
|                         |                              | CloudSystem Tools    |
|                         |                              | 8.1.2 – Dec 2014     |
|                         |                              | release zip, which   |
|                         |                              | is part of the HP    |
|                         |                              | CloudSystem 8.1 U2   |
|                         |                              | release.             |
+-------------------------+------------------------------+----------------------+
| **HP Operations         | 10.10                        | This version is      |
| Orchestration**         |                              | included in          |
|                         |                              | CloudSystem          |
|                         |                              | Foundation and is    |
|                         |                              | not a separate       |
|                         |                              | installation.        |
+-------------------------+------------------------------+----------------------+
| **HP CSA**              | 4.1                          | This version is      |
|                         |                              | included in          |
|                         |                              | CloudSystem          |
|                         |                              | Enterprise and is    |
|                         |                              | not a separate       |
|                         |                              | installation.        |
+-------------------------+------------------------------+----------------------+
| **OpenStack Keystone,   | Havana Release, with select  | Included in          |
| Glance, Nova, Cinder,   | updates and Icehouse         | CloudSystem          |
| Neutron, Horizon**      | backports                    | Foundation (not a    |
|                         |                              | separate install)    |
+-------------------------+------------------------------+----------------------+

: CloudSystem software requirements

Hardware requirements
---------------------

HP CloudSystem
hardware requirements
Hardware requirements for management hypervisors, compute nodes, virtual
appliances, and SAN and Storage are provided in this section.

### Physical configuration hardware requirements

management hypervisors
hardware requirements
management hypervisors
formula for storage requirements
management hypervisors
Glance repository sizing guidelines
management hypervisors
server requirements
management hypervisors
server and firmware compatibility
compute nodes
hardware requirements
compute nodes
server requirements
compute nodes
server and firmware compatibility
HP ConvergedSystems
supported versions
#### Management hypervisor requirements

The following table lists the recommended and minimum hardware
requirements for a single ESXi or KVM management hypervisor.

In an HA configuration, both the primary and failover hypervisors must
meet the hardware requirements described in this table.

> **Important**
>
> The management hypervisor should only host the CloudSystem appliances.
> Install only one set of appliances per management hypervisor.

  --------------------------------------------------------------------
  Requirements        Cores      RAM      Storage
  ------------------- ---------- -------- ----------------------------
  Recommended         16 cores   128 GB   See the **formula** below.
                                          

  Minimum supported   8 cores    96 GB    See the **formula** below.
                                          
  --------------------------------------------------------------------

  : Management hypervisor hardware requirements

**Formula to determine the storage requirements for the management
hypervisor.**

The formula used to determine the management hypervisor storage
requirements is appliance storage + glance images and snapshots =
management hypervisor storage

-   Appliance storage: **860 GB**

    -   25 GB for templates

    -   250 GB each for the Foundation base appliance, vCenter proxy
        appliance and Enterprise appliance

    -   20 GB for each of the three network node appliances

    -   25 GB for the SDN appliance

-   Glance images/snapshots: **varies**

      Glance repository   Linux images (4 GB each)   Windows images (16 GB each)   Snapshots (20 GB each)   TOTAL
      ------------------- -------------------------- ----------------------------- ------------------------ ---------
      Small               15                         10                            15                       520 GB
      Medium              20                         15                            40                       1.2 TB
      Large               25                         30                            500                      10.1 TB

      : Glance repository sizing guidelines

**Supported servers, firmware and customized images.**

Use the steps below to match a supported server with compatible firmware
versions.

1.  Navigate to [Server operating systems &
    virtualization](http://h17007.www1.hp.com/us/en/enterprise/servers/management/operating-environments/index.aspx#tab=TAB3).

2.  Click the operating system you plan to use.

3.  Scroll down to the table and verify that the server you plan to use
    is a supported server.

    HP servers that support the ESXi and KVM operating systems listed in
    ? are supported as management hypervisors.

<!-- -->

1.  Navigate to the HP Support Center at <http://www.hp.com/go/hpsc>.

2.  Enter the supported server name in the product search box and click
    Go.

3.  Click Get drivers, software & firmware.

4.  Find the server link in the list and click the link.

5.  Click the name of the operating system you plan to use.

6.  Click firmware.

7.  Verify the versions that support the server you plan to use.

    If your firmware version is out of date, download the latest
    version.

#### Compute nodes

> **Important**
>
> You cannot use a compute node as the management hypervisor.

Compute node sizes vary according to your resource needs. The following
questions are provided to guide you as you determine the size of your
compute node.

-   What flavor settings will the provisioned instances use?

-   What oversubscription rate is supported for each compute resource?
    See the “Resource configuration in CloudSystem Foundation: Compute
    Node Creation” chapter in the HP CloudSystem 8.1 Administrator Guide
    at [Enterprise Information
    Library](http://www.hp.com/go/CloudSystem/docs).

-   How many instances will each compute node support?

After answering the questions above, determine the amount of CPU cores,
memory, and storage to allocate to each compute node.

For additional information on compute node requirements, refer to the
“Resource configuration in CloudSystem Foundation: Compute Node
Creation” chapter in the HP CloudSystem 8.1 Administrator Guide at
[Enterprise Information Library](http://www.hp.com/go/CloudSystem/docs).

**Supported servers, firmware and customized images.**

Use the steps below to match a supported server with compatible firmware
versions.

1.  Navigate to [Server operating systems &
    virtualization](http://h17007.www1.hp.com/us/en/enterprise/servers/management/operating-environments/index.aspx#tab=TAB3).

2.  Click the operating system you plan to use.

3.  Scroll down to the table and verify that the server you plan to use
    is a supported server.

<!-- -->

1.  Navigate to the HP Support Center at <http://www.hp.com/go/hpsc>.

2.  Enter the supported server name in the product search box and click
    Go.

3.  Click Get drivers, software & firmware.

4.  Find the server link in the list and click the link.

5.  Click the name of the operating system you plan to use.

6.  Click firmware.

7.  Verify the versions that support the server you plan to use.

    If your firmware version is out of date, download the latest
    version.

#### HP ConvergedSystems support

CloudSystem supports the following converged systems:

-   HP ConvergedSystem 700x for Foundation

-   HP ConvergedSystem 700x for Microsoft

-   HP ConvergedSystems 700x for VMware

#### Storage requirements

storage
requirements
storage
ephemeral
storage
block storage
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Storage type                                                                                                        Disk Type                                           Hypervisor type   Location                                                                                                                      Supported versions
  ------------------------------------------------------------------------------------------------------------------- --------------------------------------------------- ----------------- ----------------------------------------------------------------------------------------------------------------------------- -----------------------------------------------------------------------
  Cinder block storage                                                                                                Instance data                                       ESXi              Created in vCenter Server and presented to the hypervisor                                                                     CloudSystem supports all ESXi datastore storage supported by VMware
  -   Virtual Machine File System Driver                                                                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                          

  Cinder block storage                                                                                                Instance data                                       KVM               Created in the HP 3PAR storage system and presented to the compute node. The virtual volume is attached to the VM instance.   See the list of supported HP 3PAR Inform OS versions in Table 2 above
  -   HP 3PAR Fibre Channel (FC) Driver ^1^                                                                                                                                                                                                                                                                               
                                                                                                                                                                                                                                                                                                                          
  -   HP 3PAR iSCSI Driver                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                          

  Nova Ephemeral (assigned to a VM instance when the instance is created and released when the instance is deleted)   Instance boot and data (managed through flavors)    ESXi and KVM      Created in the ESXi datastore or the dedicated Nova instance data disk in KVM; presented to the hypervisor                    CloudSystem supports
                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                          -   all ESXi datastore storage supported by VMware ^2^
                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                          -   all storage supported by HP servers running RHEL
                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                          

  Management hypervisor storage for CloudSystem virtual appliances                                                    Appliance boot and data (dedicated for VM guests)

  Glance storage for CloudSystem images                                                                               Appliance data (dedicated for Glance storage)
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  : Storage requirements

^1^ HP 3PAR supported hardware and Fibre Channel configuration:

-   3PAR F-Class, P7000, P10000 series

-   Fibre Channel fabric support

    -   pre-configured zones where the storage system is zoned to the
        appropriate virtual machine host

    -   open zoning where no zoning configuration is enabled

^2^ The VMware datastore property “type” must be NFS or VMFS. Verify the
datastore property in the vCenter Server Managed Object Browser
datastore summary.

> **Note**
>
> REST API interface must be enabled on the HP 3PAR storage system if
> you are NOT using a VMDK driver.

### Virtual appliance requirements — CloudSystem virtual appliances

HP CloudSystem
virtual appliance requirements
The table below lists all CloudSystem virtual appliances, along with
compute, memory and storage requirements.

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Virtual appliance                                                         Cores                     RAM         Storage
  ------------------------------------------------------------------------- ------------------------- ----------- -----------------------------------------------------------------------------------------------------
  Foundation base appliance                                                 8vCPUs                    32 GB       250 GB (Thin Provisioned)
                                                                                                                  
                                                                                                                  Glance image storage of 2–4 TB is provided by a separate mounted volume in a production environment
                                                                                                                  

  SDN appliance (Foundation)                                                4vCPUs                    8 GB        25 GB (Thin Provisioned)
                                                                                                                  

  network node appliances (Foundation)                                      3(2vCPUs)                 3(4 GB)     3(20 GB) (Thin Provisioned)
                                                                                                                  

  vCenter proxy appliance (Foundation)                                      4vCPUs                    16 GB       250 GB (Thin Provisioned)
                                                                                                                  
  > **Note**                                                                                                      
  >                                                                                                               
  > 1 vCenter proxy appliance is required for every VMware vCenter Server                                         
                                                                                                                  

  Enterprise appliance                                                      8vCPUs                    20 GB       250 GB (Thin Provisioned)
                                                                                                                  

  **Total of all Foundation and Enterprise appliances**                     **30 vCPUs (15 cores)**   **88 GB**   **860 GB (Thin Provisioned)**This includes 25 GB for templates
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  : Virtual appliance hardware requirements

Network planning
----------------

HP CloudSystem
network planning
networks
planning
Data Center Management Network
planning
Consumer Access Network
planning
Cloud Management Network
planning
External Network
planning
Provider and Private networks
planning
HP CloudSystem
connections to Data Center Management Network and Consumer Access
Network
HP CloudSystem
OpenStack default ports
OpenStack
default ports
networks
OpenStack defaut ports
OpenStack
secondary services default ports
networks
OpenStack secondary services default ports
HP CloudSystem
OpenStack secondary services default ports
HP CloudSystem
CloudSystem default ports
networks
CloudSystem default ports
Before installing CloudSystem, plan for the following networks.

+----+--------------+-------+---------------------------+---------------------------+
|    | Network      | Numbe | Purpose                   | Connected to...           |
|    |              | r     |                           |                           |
+====+==============+=======+===========================+===========================+
|    | Data Center  | 1     | This network connects     | CloudSystem Console,      |
|    | Management   |       | virtual appliances to HP  | CloudSystem Portal,       |
|    | Network      |       | 3PAR, VMware vCenter      | vCenter proxy appliance,  |
|    |              |       | Server, VMware vCloud     | Enterprise appliance,     |
|    |              |       | Networking and Security   | VMware vCenter Server     |
|    |              |       | (vCNS) and enclosures.    |                           |
|    |              |       | Only administrator roles  |                           |
|    |              |       | have access to this       |                           |
|    |              |       | network. In the OpenStack |                           |
|    |              |       | Keystone endpoint         |                           |
|    |              |       | catalog, the admin URL is |                           |
|    |              |       | on this network.          |                           |
+----+--------------+-------+---------------------------+---------------------------+
|    | Cloud        | 1     | This network is a         | Foundation base           |
|    | Management   |       | dedicated private network | appliance, SDN appliance, |
|    | Network      |       | for cloud management.     | network node appliances,  |
|    |              |       |                           | vCenter proxy appliance,  |
|    |              |       |                           | KVM compute nodes         |
+----+--------------+-------+---------------------------+---------------------------+
|    | Consumer     | 1     | This network is a         | CloudSystem Portal        |
|    | Access       |       | distinct VLAN that gives  | (Foundation), Marketplace |
|    | Network      |       | cloud users a separate    | Portal (Enterprise)       |
|    |              |       | access point for the      |                           |
|    |              |       | CloudSystem Portal and    |                           |
|    |              |       | the Enterprise appliance, |                           |
|    |              |       | where they cannot access  |                           |
|    |              |       | administrative–only       |                           |
|    |              |       | servers. In the OpenStack |                           |
|    |              |       | Keystone endpoint         |                           |
|    |              |       | catalog, the public URL   |                           |
|    |              |       | is on this network.       |                           |
|    |              |       | > **Note**                |                           |
|    |              |       | >                         |                           |
|    |              |       | > Use this network to     |                           |
|    |              |       | > launch a console for    |                           |
|    |              |       | > KVM instances in the    |                           |
|    |              |       | > CloudSystem Portal.     |                           |
+----+--------------+-------+---------------------------+---------------------------+
|    | External     | 1     | This network is a         | network node appliances   |
|    | Network      |       | distinct VLAN that allows |                           |
|    |              |       | cloud end users to attach |                           |
|    |              |       | public IP addresses to    |                           |
|    |              |       | their provisioned virtual |                           |
|    |              |       | machine instances.        |                           |
+----+--------------+-------+---------------------------+---------------------------+
|    | Provider     | at    | A Provider Network is a   | Cloud Data Trunk, network |
|    | Networks     | least | data center network       | node appliances           |
|    | and/or       | 1     | routed through the        |                           |
|    | Private      |       | existing data center      |                           |
|    | Networks     |       | infrastructure. A Private |                           |
|    |              |       | Network is created from a |                           |
|    |              |       | pool of VLANs. Both       |                           |
|    |              |       | networks support instance |                           |
|    |              |       | communication.            |                           |
+----+--------------+-------+---------------------------+---------------------------+

: Network planning

It is important to understand the relationship between the CloudSystem
components, the Data Center Management Network and the Consumer Access
Network.

  CloudSystem component             Data Center Management Network       Consumer Access Network
  --------------------------------- ------------------------------------ -----------------------------------------------------------
  CloudSystem Portal                Yes                                  Yes
  CloudSystem Console               Yes                                  No
  Virtual machine console           No                                   Yes
  HP CSA management console         Yes                                  Yes (can be blocked with external URL firewall filtering)
  Marketplace Portal                No                                   Yes
  HP OO (on Foundation appliance)   Yes                                  Yes
  csadmin                           Yes (access via adminURL endpoint)   Yes (access via publicURL endpoint)
  OpenStack clients                 Yes                                  Yes
  SAN fabric                        Yes                                  No

  : CloudSystem connections to the Data Center Management Network and
  the Consumer Access Network

The following three tables contain the default firewall ports used by
CloudSystem and OpenStack services.

  OpenStack service                                                              Default ports   Port type
  ------------------------------------------------------------------------------ --------------- ------------------------
  block storage (`cinder`)                                                       8776            publicURL and adminURL
  compute endpoints (`nova`)                                                     8774            publicURL and adminURL
  compute API (`nova-api`)                                                       8773, 8775      
  compute ports for access to virtual machine consoles                           5900–5999       
  compute VNC proxy for browsers (`openstack-nova-novncproxy`)                   6080            
  compute VNC proxy for traditional VNC clients (`openstack-nova-xvpvncproxy`)   6081            
  proxy port for HTML5 console used by compute service                           6082            
  identity service administrative endpoint (`keystone`)                          35357           adminURL
  identity service public endpoint                                               5000            publicURL
  image service API (`glance`)                                                   9292            publicURL and adminURL
  image service registry                                                         9191            
  networking (`neutron`)                                                         9696            publicURL and adminURL

  : Default ports used by OpenStack components

  Service                         Default port   Used by
  ------------------------------- -------------- ----------------------------------------------------------------------------------------------------
  HTTP                            80             CloudSystem Portal when it is not configured to use secure access
  HTTP alternate                  8080           OpenStack Object Storage (`swift`) service
  HTTPS                           443            Any OpenStack service that is enabled for SSL, especially secure-access for the CloudSystem Portal
  rsync                           873            OpenStack Object Storage. This is required.
  iSCSI target                    3260           OpenStack Block Storage. This is required.
  MySQL database service          3306           Most OpenStack components
  Message Broker (AMQP traffic)   5672           OpenStack Block Storage, Networking, Orchestration, and Compute

  : Default ports used by secondary services related to OpenStack
  components

> **Note**
>
> The port range 5900 - 6105 (inclusive) is automatically enabled for
> VNC connections on every ESXi host in all clusters under OpenStack
> control.

  Service    Default port      Used by
  ---------- ----------------- --------------------------------------------------
  FTP        21                File Transfer Protocol
  DNS        53                Domain Name System (DNS)
  DHCP       67, 68            BOOTPS:BOOTPC, DHCP
  NTP        123               Network Time Protocol
  AMQPS      5671              Message Broker (Secure)
  POSTGRES   5432              Postgresql
             6080              OpenStack-Nova-novncproxy
             8085              
  HP CSA     8081, 8090, 443   CloudSystem Enterprise, Cloud Service Automation
  HP OO      9090              Operations Orchestration

  : Default ports required by other CloudSystem components

### Overview of network topology

networks
network topology
networks
management trunk
Data Center Management Network
about
Consumer Access Network
about
Cloud Management Network
about
External Network
about
Cloud Data Trunk
about
Provider and Private networks
about
management trunk
about
networks
Data Center Management Network
networks
Consumer Access Network
networks
Cloud Management Network
networks
External Network
networks
Cloud Data Trunk
networks
Provider and Private Networks
Networks are organized into two trunks. The **Management trunk** holds
all infrastructure networks that connect the virtual appliances, vCenter
Server and the HP 3PAR StoreServ storage system. The **Cloud Data
Trunk** holds the networks that connect provisioned virtual machines to
the cloud.

![Network trunks](img/trunk_overview.png)

#### Network definitions

**Management Trunk**

The Management trunk contains the following networks.

-   **Data Center Management Network**: This network provides access to
    the CloudSystem Console, which is the interface for the Foundation
    base appliance. REST API calls are made from this network. The
    Foundation base appliance and the Enterprise appliance access
    vCenter Server over this network. The Foundation base appliance also
    communicates with HP 3PAR StoreSev over this network.

    Three or more vCenter Servers are supported.

    -   The Foundation base appliance uses this network to access the
        vCenter Server that is managing the management hypervisor.

    -   The vCenter proxy appliance uses this network to access the
        vCenter Server that is managing ESXi compute clusters. This can
        be a separate vCenter Server or the same vCenter Server used by
        the Foundation base appliance. Best practice is to have a
        separate vCenter Server managing compute clusters.

    -   The Enterprise appliance also uses this network to access
        vCenter Server. Enterprise can be configured to use a third
        vCenter Server, or it can access one of the two existing vCenter
        Servers.

-   **Cloud Management Network**: This private network for the cloud is
    typically a VLAN, but could also be a physical network. The
    Foundation base appliance runs a DHCP server for this network.

    > **Important**
    >
    > The Cloud Management Network should be a dedicated private network
    > for cloud system management use only. Some of the contents
    > transmitted between compute nodes and the cloud controller are
    > unencrypted. Network isolation should be used to prevent unwanted
    > exposure to sensitive data.

-   **Consumer Access Network**: This network gives cloud users a
    separate access point for the CloudSystem Portal and the Enterprise
    appliance, where other administrative servers are not accessible. In
    the OpenStack Keystone endpoint catalog, the public URL is on this
    network.

    The Consumer Access Network allows you to access the consoles of KVM
    virtual machine instances from the CloudSystem Portal. If you
    connect to the CloudSystem Portal using the Data Center Management
    Network, you cannot access KVM consoles.

-   **External Network**: This network is automatically connected to the
    network node appliances after Cloud Networking settings are saved
    during the CloudSystem Console first time setup. Subnets must be
    defined in the CloudSystem Portal before using this network.

    Virtual machines are not connected directly to this network.
    Internal provider or private networks connect directly to a virtual
    machine, then a virtual router is used to connect the internal and
    external networks. A networking service routes outgoing traffic to
    the External Network. When the External Network subnet assigns
    Floating IPs to virtual machines, then the External Network can
    access them.

**Cloud Data Trunk**

This trunk must be configured as a group of VLANs. It hosts the VLANs
that OpenStack networking makes available to users. CloudSystem uses
specific VLANs on this trunk as Private Networks. Some VLANs may not be
dedicated to CloudSystem. All compute nodes in the cloud must be
connected to this trunk.

The Cloud Data Trunk contains the following production networks.

-   **Provider Network**: A Provider Network is a data center network
    routed through the existing data center infrastructure. Adding a
    Provider Network allows you to add an existing data center network
    to any number of virtual machine instances in the cloud.

-   **Private Networks**: Private Networks are created from a pool of
    VLANs. The cloud administrator configures this pool in the
    CloudSystem Console. Then, when cloud users in the CloudSystem
    Portal create a private network, the OpenStack Neutron networking
    service assigns a VLAN from the pool.

    OpenStack Neutron networking manages all aspects of this network,
    including external routing.

> **Important**
>
> All of the networks described above must be distinct networks.

#### Configuration of management networks

Management network configuration varies depending on the management
hypervisor configuration.

The following figure shows a sample configuration with an ESXi
management host, networks and ESXi compute nodes.

![ESXi management host with ESXi compute
nodes](img/cs8esxnetworkoverview.png)

The following figure shows a sample configuration with a KVM management
host, networks and KVM compute nodes.

![KVM management host with KVM compute
nodes](img/cs8kvmnetworkoverview.png)

For a detailed explanation of the network configuration, see?, ?

Browser requirements
--------------------

HP CloudSystem
browser requirements
browser
requirements
The following browsers are supported for the CloudSystem installation.

  ---------------------------------------------------------------------
  Vendor      Product                                  Version
  ----------- ---------------------------------------- ----------------
  Microsoft   Internet Explorer                        9, 10
                                                       

  Mozilla     Firefox Extended Support Release (ESR)   24
                                                       
              Personal Edition                         Latest version
                                                       

  Google      Chrome                                   33
                                                       
  ---------------------------------------------------------------------

  : Supported browsers

Tools requirements
------------------

HP CloudSystem
tools requirements
The `CloudSystem-Tools-8.1.2.0.zip` file contains a `csstart`
installation script and several CLI packages. The requirements for the
systems running these tools are listed in the table below.

  -----------------------------------------------------------------------------
  CloudSystem Tool   Product   Version
  ------------------ --------- ------------------------------------------------
  `csstart`          Windows   Windows Version 7, 2008 R2 (32-bit and 64-bit)
                               
                     Linux     Red Hat RHEL 6.4, 6.5
                               

  CLI packages       Windows   Windows Version 7, 2008 R2 (32-bit and 64-bit)
                               
                     Linux     CentOS 6.2, 6.3, 6.4, Ubuntu 12.04
                               
  -----------------------------------------------------------------------------

  : Supported versions of tools used to run `csstart` and CLI packages

**Next step**: ?

Preparing for the installation
==============================

Before you begin the installation, it is important to have all of the
required images and tools unpacked and staged. The installation path
varies, depending on whether you are installing CloudSystem on an ESXi
or KVM management hypervisor.

-   ?

-   ?

-   ?

Installation kits
-----------------

HP CloudSystem
installation kits
installation kits
about
installation
signature files
The CloudSystem release kit is downloaded from HP Software Depot at
[www.hp.com/go/cloudsystem/download](http://www.hp.com/go/cloudsystem/download).

There are six `.zip` files that contain the installation components
needed for CloudSystem Foundation and CloudSystem Enterprise. The
installation components vary, depending on the type of management
hypervisor you plan to install. There are also two `.bin` files that are
used to upgrade CloudSystem. The table below shows each file and the
installation path it supports.

+-------------------------+--------------+--------------+--------------+--------------+
| Installation components | Foundation   | Foundation   | Enterprise   | Enterprise   |
|                         | ESXi         | KVM          | ESXi         | KVM          |
+=========================+==============+==============+==============+==============+
| HP CloudSystem          |              |              | x            |              |
| Enterprise ESX 8.1.2 -  |              |              |              |              |
| Dec 2014                |              |              |              |              |
|                         |              |              |              |              |
| (contains the ESXi      |              |              |              |              |
| image for the           |              |              |              |              |
| Enterprise appliance)   |              |              |              |              |
+-------------------------+--------------+--------------+--------------+--------------+
| HP CloudSystem          |              |              |              | x            |
| Enterprise KVM 8.1.2 -  |              |              |              |              |
| Dec 2014                |              |              |              |              |
|                         |              |              |              |              |
| (contains the KVM image |              |              |              |              |
| for the Enterprise      |              |              |              |              |
| appliance)              |              |              |              |              |
+-------------------------+--------------+--------------+--------------+--------------+
| HP CloudSystem          | x            |              |              |              |
| Foundation ESX 8.1.2 -  |              |              |              |              |
| Dec 2014                |              |              |              |              |
|                         |              |              |              |              |
| (contains ESXi images   |              |              |              |              |
| for the Foundation base |              |              |              |              |
| appliance, SDN          |              |              |              |              |
| appliance, and network  |              |              |              |              |
| node appliances)        |              |              |              |              |
+-------------------------+--------------+--------------+--------------+--------------+
| HP CloudSystem          |              | x            |              |              |
| Foundation KVM 8.1.2 -  |              |              |              |              |
| Dec 2014                |              |              |              |              |
|                         |              |              |              |              |
| (contains KVM images    |              |              |              |              |
| for the Foundation base |              |              |              |              |
| appliance, SDN          |              |              |              |              |
| appliance, and network  |              |              |              |              |
| node appliances)        |              |              |              |              |
+-------------------------+--------------+--------------+--------------+--------------+
| HP CloudSystem Tools    | x            | x            | x            | x            |
| 8.1.2 – Dec 2014        |              |              |              |              |
|                         |              |              |              |              |
| (contains the `csstart` |              |              |              |              |
| installation script and |              |              |              |              |
| the CLI packages)       |              |              |              |              |
| This file was not       |              |              |              |              |
| changed for this        |              |              |              |              |
| release.                |              |              |              |              |
+-------------------------+--------------+--------------+--------------+--------------+
| HP CloudSystem OO       | x            | x            | x            | x            |
| Studio 8.1.2 – Dec 2014 |              |              |              |              |
|                         |              |              |              |              |
| (contains OO content    |              |              |              |              |
| packs and OO Studio     |              |              |              |              |
| installation executable |              |              |              |              |
| file)                   |              |              |              |              |
| This file was not       |              |              |              |              |
| changed for this        |              |              |              |              |
| release.                |              |              |              |              |
+-------------------------+--------------+--------------+--------------+--------------+
| HP CloudSystem          |              |              | x            | x            |
| Enterprise Upgrade      |              |              |              |              |
| 8.1.2 - Dec 2014        |              |              |              |              |
|                         |              |              |              |              |
| (contains .bin file for |              |              |              |              |
| upgrading Enterprise)   |              |              |              |              |
+-------------------------+--------------+--------------+--------------+--------------+
| HP CloudSystem          |              |              |              |              |
| Enterprise Upgrade      |              |              |              |              |
| 8.1 - Jul 2014          |              |              |              |              |
|                         |              |              |              |              |
| (contains .bin file for |              |              |              |              |
| upgrading Enterprise    |              |              |              |              |
| from 8.0 to 8.1 before  |              |              |              |              |
| preparing to upgrade to |              |              |              |              |
| 8.1.2)                  |              |              |              |              |
+-------------------------+--------------+--------------+--------------+--------------+
| HP CloudSystem          | x            | x            |              |              |
| Foundation Upgrade      |              |              |              |              |
| 8.1.2 - Dec 2014        |              |              |              |              |
|                         |              |              |              |              |
| (contains .bin file for |              |              |              |              |
| upgrading Foundation.)  |              |              |              |              |
+-------------------------+--------------+--------------+--------------+--------------+
| HP CloudSystem          |              |              |              |              |
| Foundation Upgrade      |              |              |              |              |
| 8.1 - Jul 2014          |              |              |              |              |
|                         |              |              |              |              |
| (contains .bin file for |              |              |              |              |
| upgrading Foundation    |              |              |              |              |
| from 8.0 to 8.1 before  |              |              |              |              |
| preparing to upgrade to |              |              |              |              |
| 8.1.2)                  |              |              |              |              |
+-------------------------+--------------+--------------+--------------+--------------+

: Components included in HP CloudSystem release files

**Signature files.**

Each zip file has a corresponding signature file. Signature files are
used to verify the authenticity of the downloaded files.

See [HP GPG or RPM signature
Verification](https://h20392.www2.hp.com/portal/swdepot/displayProductInfo.do?productNumber=HPLinuxCodeSigning).

### Contents of CloudSystem `.zip` files

installation kits
about file contents
The contents of each CloudSystem `.zip` file are described in the
following section.

-   **CS-Enterprise-8.1.2.0.ova**: OVF package for the Enterprise
    appliance on an ESXi hypervisor.

<!-- -->

-   **CS-Enterprise-8.1.2.0.qcow2**: Disk image for the Enterprise
    appliance on a KVM hypervisor.

> **Note**
>
> Each `qcow2` file comes with a corresponding `sha1` checksum file.
> When `csstart` runs, it uses the checksum file to verify that the
> files are copied to the hypervisor without error.

-   **CS-Base-8.1.2.0.ova**: Open Virtualization Format (OVF) package
    for the base appliance on an ESXi hypervisor.

-   **CS-SDN-8.1.2.0.ova**: OVF package for the SDN appliance on an ESXi
    hypervisor.

-   **CS–NN–8.1.2.0.ova**: OVF package for the network node appliance on
    an ESXi hypervisor.

<!-- -->

-   **CS-Base-8.1.2.0.qcow2**: Disk image for the base appliance on a
    KVM hypervisor.

-   **CS-SDN-8.1.2.0.qcow2**: Disk image for the SDN appliance on a KVM
    hypervisor.

-   **CS-NN-8.1.2.0.qcow2**: Disk image for the network node appliance
    on a KVM hypervisor.

> **Note**
>
> Each `qcow2` file comes with a corresponding `sha1` checksum file.
> When `csstart` runs, it uses the checksum file to verify that the
> files are copied to the hypervisor without error.

-   **eula\_content.html**: This file contains the CloudSystem Software
    License Terms, including the HP End User License Agreement, license
    terms and license list.

-   **csstart-linux.tar**: Contains the command line to install
    CloudSystem from a Linux system.

-   **csstart-windows.zip**: Contains the **csstartgui.bat** file that
    launches the GUI version of csstart, as well as the command line to
    install CloudSystem from a Windows system.

-   **csadmin**: Provides Linux command line access to perform
    administrative functions such as storage management, support dump
    actions for management virtual appliances, and password setting for
    management appliance console access.

-   **csadmin.exe**: Provides Windows command line access to perform
    administrative functions such as storage management, support dump
    actions for management virtual appliances, and password setting for
    management appliance console access.

-   **CloudSystemClient-8.1.2.0.msi**: Installs the Windows version of
    the commands for OpenStack Keystone, Nova, Neutron and Cinder.

-   **CloudSystemClient–8.1.2.0.rpm**: Installs the Linux version of the
    commands for OpenStack Keystone, Nova, Neutron and Cinder.

-   **rhel-kvm-deps-8.1.2.0.rpm**: When run in a YUM repository, this
    file checks for required RHEL RPMs and returns a list of any that
    are missing.

<!-- -->

-   Administrative content packs that can be installed and edited in OO
    Studio:

    -   OO-HP-Solutions-cp.jar

    -   OO-Systems-cp.jar

    -   OO-Virtualization-cp.jar

    -   OO-Base-cp.jar

    -   OO-Cloud-cp.jar

-   **CSA-content-packs.zip**: contains content packs that support
    workflows for Topology Designer and Sequential Designer in HP CSA.

    -   CSA-SA-CP-4.10.0000.jar

    -   CSA-AMAZON-CP-4.10.0000.jar

    -   CSA-CHEF-CP-4.10.0000.jar

    -   CSA-SITESCOPE-CP-4.10.0000.jar

    -   CSA-HP-HELION-PUBLIC-CLOUD-CP-4.10.0000.jar

    -   CSA-VMWARE-CP-4.10.0000.jar

    -   CSA-CONFIG-CP-4.10.0000.jar

    -   oo10-sm-cp-1.0.1.jar

    -   oo10-sa-cp-1.0.2.jar

    -   oo10-csa-moe-CP-5.0.0.jar

    -   oo10-csa-cp-4.10.000.jar

    -   oo10-csa-cp-4.10.001.jar

        > **Note**
        >
        > This content pack supersedes oo10-csa-cp-4.10.000.jar. In HP
        > OO, it appears as version 4.10.004.

-   **installer-win64-studio.exe**: Used to install OO Studio.

<!-- -->

-   Contains the `.bin` file used to upgrade the Enterprise appliance
    from 8.0 to 8.1.1.

<!-- -->

-   Contains the `.bin` file used to upgrade the Enterprise appliance
    from 8.1 or 8.1.1 to 8.1.2

<!-- -->

-   Contains the `.bin` file used to upgrade the Foundation appliances
    from 8.0 to 8.1.1.

<!-- -->

-   Contains the `.bin` file used to upgrade the Foundation appliances
    from 8.1 or 8.1.1 to 8.1.2.

Preparing to install on ESXi
----------------------------

installation
download release files for ESXi
This section covers the steps required to download the contents of the
release package and stage the files on your local workstation.

![Path to install from a Windows
workstation](img/cs8esxinstallenvironment.png)

**Prerequisites.**

-   You have a staging area on your Windows workstation with access to
    your vCenter Server. Required disk storage is approximately 35 GB.

-   You have administrator privileges to log in to VMware vCenter
    Server.

-   You have software that you can use to unzip the CloudSystem files.

Log on to your local workstation.

Open a browser and navigate to the HP Software Depot at
<http://software.hp.com>.

In the Search Software Depot field, type **HP CloudSystem**.

Select the HP CloudSystem offering.

Sign in with your HP Passport or create a new passport account.

Enter your name and address information.

Accept the license agreement.

Download the following `.zip` files to your staging environment.

The workstation used to stage the files must have access to the vCenter
Server that you plan to use to deploy the OVAs.

-   **HP CloudSystem Enterprise ESX 8.1.2. – Dec 2014**

-   **HP CloudSystem Foundation ESX 8.1.2 – Dec 2014**

-   **HP CloudSystem Tools 8.1.2 – Dec 2014**

Extract the `.zip` file content in your staging environment.

Unpack the `csstart` file.

-   If you are using a Windows staging environment, unzip the
    `csstart-windows.zip` file.

-   If you are using a Linux staging environment, untar the
    `csstart-linux.tar` file.

**Next step**: ?

Preparing to install on KVM
---------------------------

installation
download release files for KVM
This section covers the steps required to download the contents of the
release package and stage the files on your local workstation.

1.  ?

2.  ?

![Path to install from a Linux
workstation](img/cs8kvminstallenvironment.PNG)

**Prerequisites.**

-   You have a Linux or Windows workstation to stage the KVM kit and run
    installation tools. Required disk storage is approximately 35 GB.

-   You have administrator privileges to log in to the KVM management
    hypervisor.

Open a browser and navigate to the HP Software Depot at
<http://software.hp.com>.

In the Search Software Depot field, type **HP CloudSystem**.

Select the HP CloudSystem offering.

Sign in with your HP Passport or create a new passport account.

Fill in the required form details and accept the license agreement.

Download the following files to your staging environment.

-   **HP CloudSystem Enterprise KVM 8.1.2 – Dec 2014**

-   **HP CloudSystem Foundation KVM 8.1.2 – Dec 2014**

Log on to the management hypervisor.

Make sure you have a `/CloudSystem/images` directory for your images.

Unzip the .`qcow2` files you downloaded from HP Software Depot in the
`/CloudSystem/images` directory.

Open a browser and navigate to the HP Software Depot at
<http://software.hp.com>.

In the Search Software Depot field, type **HP CloudSystem**.

Select the HP CloudSystem offering.

Sign in with your HP Passport.

Fill in the required form details and accept the license agreement.

Download the **HP CloudSystem Tools 8.1.2 – Dec 2014** file to your
workstation.

Unpack the `csstart` file.

-   If you are using Linux, untar the `csstart-linux.tar` file.

-   If you are using Windows, unzip the `csstart-windows.zip` file.

**Next step**: ?

Installing CloudSystem on an ESXi cluster
=========================================

installation
ESXi
ESXi
installation
This chapter contains the procedures required to set up the network
infrastructure and install the CloudSystem Foundation base appliance on
an ESXi management hypervisor. The checklist below provides an overview
of the installation path.

  ------------------------------------------------------------------------
        Installation step                              Related information
  ----- ---------------------------------------------- -------------------
        Create the management cluster and define the   ?
        vSwitch or port group IDs and network security 
        settings in vCenter Server.                    

        Configure the management hypervisor            ?
        environment and choose the type of security    
        checks to perform when running `csstart`.      

        Launch `csstart` and install the Foundation    ?
        base appliance.                                
  ------------------------------------------------------------------------

  : ESXi management hypervisor installation path

Understanding the CloudSystem network infrastructure on ESXi
------------------------------------------------------------

networks
ESXi network infrastructure
ESXi
network infrastructure
Data Center Management Network
ESXi network infrastructure
Consumer Access Network
ESXi network infrastructure
External Network
ESXi network infrastructure
Cloud Management Network
ESXi network infrastructure
Cloud Data Trunk
ESXi network infrastructure
Several networks provide the communication platform for CloudSystem,
vCenter Server and the HP 3PAR StoreServ storage system. The
configuration of the networks is flexible. This section explains the
major components of the networking infrastructure and provides an
example of a supported configuration. This is only a guide. Modify the
procedure below to fit your network configuration needs. For example,
the VLAN IDs can vary according to your environment.

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Network                          CloudSystem virtual appliance       Management hypervisor vNICs                                                   Example names for vSwitch or port group (matches figure below)
  -------------------------------- ----------------------------------- ----------------------------------------------------------------------------- ----------------------------------------------------------------
  Data Center Management Network   Foundation base appliance           vNIC0 on vCenter Server, Foundation base appliance and Enterprise appliance   dc-mgmt
                                                                                                                                                     
                                   vCenter proxy appliance             vNIC1 on vCenter proxy appliance                                              
                                                                                                                                                     
                                   Enterprise appliance                                                                                              
                                                                                                                                                     
                                   vCenter Server ESXi compute nodes                                                                                 
                                                                                                                                                     

  Cloud Management Network         Foundation base appliance           vNIC0 on vCenter proxy appliance, SDN appliance and network node appliances   cloud-mgmt
                                                                                                                                                     
                                   SDN appliance                       vNIC1 on Foundation base appliance                                            
                                                                                                                                                     
                                   network node appliances                                                                                           
                                                                                                                                                     
                                   vCenter proxy appliance                                                                                           
                                                                                                                                                     
                                   KVM compute nodes                                                                                                 
                                                                                                                                                     

  **Consumer Access Network**      Foundation base appliance           vNIC2 on the Foundation base appliance                                        access
                                                                                                                                                     
                                   Enterprise appliance                vNIC1 on the Enterprise appliance                                             
                                                                                                                                                     

  Cloud Data Trunk                 network node appliances             vNIC1                                                                         CloudTrunk
                                                                                                                                                     
                                   all compute nodes                                                                                                 
                                                                                                                                                     

  External Network                 network node appliances             vNIC2                                                                         external
                                                                                                                                                     
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  : Explanation of CloudSystem networks

> **Important**
>
> All of the networks described above must be distinct networks.

For a detailed explanation of the networks, see ?.

The figure below shows a visual representation of the recommended
configuration for networks.

![ESXi sample network configuration](img/cs8-esxmgmthost.png)

### Create the ESXi management cluster and configure the network infrastructure

ESXi
configuring network infrastructure
When creating the ESXi management cluster, keep the following guidelines
in mind:

-   Use a separate vCenter Server for the management hypervisor and
    compute nodes.

    -   Compute nodes cannot be in the same cluster as the management
        hypervisor.

    -   A compute node cannot also function as the management
        hypervisor.

The following procedure describes the steps required to create the ESXi
management hypervisor in a cluster and configure the network interfaces.
The procedure is based on the information provided in the image above,
but you can modify the configuration to fit your network needs.

Read the following important information before you configure the
networks for the Foundation base appliance.

+--------------------------------------+--------------------------------------+
| Important to know                    | Why it matters                       |
+======================================+======================================+
| Do not configure the iSCSI           | iSCSI initiators are set up on the   |
| initiators on the management         | compute nodes, not the management    |
| hypervisor.                          | hypervisor. Initiators check to see  |
|                                      | which storage resources on the       |
|                                      | network are available.               |
+--------------------------------------+--------------------------------------+
| The name of the distributed switch   | vCenter Server requires that all     |
| or standard switch that you are      | switch names on a single host have a |
| using for CloudSystem must be unique | unique name. If you have multiple    |
| across all switches in vCenter       | hosts, the same name can be used     |
| Server.                              | across different hosts.              |
|                                      | (Step 4)                             |
|                                      |                                      |
|                                      | [Go to                               |
|                                      | procedure](#p_esx-config-network-ins |
|                                      | tall)                                |
+--------------------------------------+--------------------------------------+
| The `csstart` setup assistant pulls  | The information in the               |
| configuration information from the   | `deployer.conf` file tells `csstart` |
| `deployer.conf` file. Changes to     | where to locate the images used to   |
| configuration should be made         | start the virtual appliances. Other  |
| directly in the `deployer.conf`      | settings in this file are used to    |
| file.                                | define network addressing and        |
|                                      | network interfaces.                  |
+--------------------------------------+--------------------------------------+
| The `csstart` setup assistant logs   | If errors occur during the startup   |
| information during the startup       | process, `csstart` will log the      |
| process in a file named              | relevant error information to the    |
| `deploy.log`. This file is located   | `deploy.log` file.                   |
| in the same directory where the      |                                      |
| `deployer.conf` configuration file   |                                      |
| resides.                             |                                      |
+--------------------------------------+--------------------------------------+
| Generic names are used in this       | It is important to use the same      |
| procedure. Make sure to substitute   | names defined in the hardware        |
| the actual names of your interfaces  | profile when assigning the networks  |
| `(ifcfg-eth<ID>`), bonds             | in the management hypervisor. If the |
| `(ifcfg-bond<ID>`), tagged VLANs     | names do not match, then network     |
| `(bond<ID>.<VLANID>)` and bridges    | communication errors will occur.     |
| `(ifcfg-br-<Name>)` when configuring | (Step 4)                             |
| the network.                         |                                      |
|                                      | [Go to                               |
|                                      | procedure](#p_esx-config-network-ins |
|                                      | tall)                                |
+--------------------------------------+--------------------------------------+

: Important network configuration information

**Prerequisites.**

-   You have administrator privileges to log in to VMware vCenter Server

Log in to vCenter Server with the administrator user name and password.

> **Note**
>
> Do not use unsupported vCenter Server password characters. You can
> find a list of unsupported characters on the [VMware Knowledge
> Base](http://kb.vmware.com/selfservice/search.do?cmd=displayKC&docType=kc&docTypeID=DT_KB_1_1&externalId=2060746).
>
> You must use a local administrator account (not a domain administrator
> account).

Create the management cluster in vCenter Server.

Select the individual ESXi host in the management cluster and click the
Configuration tab, then click the Networking link on the left menu.

Set up the Management vSwitch or port group IDs according to the
configuration that you defined in your networking infrastructure and the
dedicated network switch. You can also refer to the sample diagram above
for guidance on setting port group IDs.

Set the Cloud Data Trunk port group VLAN.

Best practice is to use a distributed switch for the Cloud Data Trunk.

To set the port group on a standard vSwitch, set the port group VLAN to
4095 (all VLANs).

To set the port group on a distributed vSwitch, list the exact range of
VLANs assigned to the Cloud Data Trunk.

Example: 1–4, 5, 6, 10–100.

Add the following security settings to the Cloud Data Trunk port group.

-   Set Promiscuous mode to **ACCEPT**.

-   Set MAC Address Changes to **ACCEPT**.

-   Set Forged Transmits to **ACCEPT**.

Add the following security settings to the External Network port group.

-   Set Promiscuous mode to **ACCEPT**.

-   Set MAC Address Changes to **ACCEPT**.

-   Set Forged Transmits to **ACCEPT**.

Repeat steps 3–7 for each ESXi host in the cluster.

Configuring CloudSystem in an ESXi management environment
---------------------------------------------------------

ESXi
management cluster
The management environment consists of a cluster of management
hypervisor hosts that contain the following virtual appliances.

-   A Foundation base appliance

-   An SDN appliance

-   Three network node appliances

-   An optional vCenter proxy appliance

    One vCenter proxy appliance is needed for each vCenter Server that
    is managing compute nodes in your cloud. If your cloud contains only
    KVM compute nodes, then you do not need any vCenter proxy
    appliances.

-   An optional Enterprise appliance, if you plan to use CloudSystem
    Enterprise

The `csstart` installation script launches a setup assistant to guide
you through the installation process. When you run `csstart`, the setup
assistant opens and displays fields for capturing details about the new
virtual appliance, network configuration, and vCenter Server
connections. The information is saved in a configuration file called
`deployer.conf`.

Running `csstart` applies the configuration information saved in
`deployer.conf` to the Foundation base appliance. When the installation
completes, the Foundation base appliance appears in the management
cluster in vCenter Server.

The SDN appliance and the network node appliances are automatically
created after the Cloud Networking settings are entered and saved in the
CloudSystem Console.

### Selecting the hypervisor security level for CloudSystem installation

ESXi
hypervisor security
This section describes the security options available for a CloudSystem
installation.

When running the `csstart` setup assistant, the supported security
option is `auto-accept-cert`. This option **disables security checks for
csstart, but enables security when creating the remaining virtual
appliances**.

When `csstart` runs, it injects the certificate into the Foundation base
appliance, but does not try to verify vCenter Server. When the
additional virtual appliances are created by the Foundation base
appliance, the certificate is used to verify that the correct hypervisor
is used.

The **csstartgui.bat** file is used to launch the `csstart` setup
assistant on Windows. This file is included in the HP CloudSystem Tools
8.1.2 – Dec 2014 release file. It should be extracted from the release
package and placed on your staging server. Instructions for using this
file to launch the `csstart` setup assistant are provided in the next
section.

The following requirements must be in place before performing the
installation using the `csstart` setup assistant:

1.  The `deployer.conf` file has `security-checking = enabled`. This is
    the default setting.

2.  Verify that a certificate resides in vCenter Server

    See the [VMware Knowledge
    Base](http://kb.vmware.com/selfservice/search.do?cmd=displayKC&docType=kc&docTypeID=DT_KB_1_1&externalId=2034833)
    for instructions on implementing certificates with vSphere.

You can also choose to disable security checks by changing the setting
in the `deployer.conf` file to `security-checking = disabled`. When
security is disabled, you must run `csstart` from the CLI.

**See also**

-   ?

-   ?

### Configuring the Foundation base appliance on ESXi

ESXi
configuring the Foundation base appliance
Read the following important notes before configuring the Foundation
base appliance.

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Important to know                                                                                                                                                                                                                                        Why it matters
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  HP recommends that you sync the management hypervisor with a good set of external NTP servers. If CloudSystem is deployed on ESXi, configure the Foundation and Enterprise appliances to sync with the same NTP servers configured for the ESXi hosts.   Data records can become out of sync between appliances when time is not set to automatically sync with the NTP server. If the Foundation and Enterprise appliance date/time is out of sync, then you will not be able to create designs in HP CSA.

  The management hypervisor must be configured with a FQDN (not an IP address).                                                                                                                                                                            The FQDN is necessary when attaching block storage volumes using the 3PAR StoreServ storage system.

  You cannot have multiple copies of an appliance image stored in vCenter Server.                                                                                                                                                                          `csstart` looks for appliance image names at random and could select the wrong image.  Using different datastores or different folders does not resolve the issue. If you need two copies of an appliance image on a single instance of vCenter Server, then you must have unique names for each image. Edit the `deployer.conf` file with a text editor to point to the correct image.

  The vCenter Server user running `csstart` only needs the top level privileges for **Datastore**, **Network**, **Resource**, and **Virtual machine**.                                                                                                     The vCenter Server user that is stored in the base appliance by `csstart` does not need full administrator privileges on the Windows server running vCenter Server. The user does not need full access to vCenter Server. Allocating the lowest allowed level of privileges optimizes data center security.

  Standard and distributed vSwitches are supported on the Management trunk and the Cloud Data trunk. If you use distributed switches, make sure to remove network adapters from imported OVF files.                                                        Network connections will not be set up properly on the virtual appliances if network adapters are present.
                                                                                                                                                                                                                                                           [Go to procedure](#p_vm-images)
                                                                                                                                                                                                                                                           
                                                                                                                                                                                                                                                           (Step 7)
                                                                                                                                                                                                                                                           

  The `deployer.conf` file contains confidential information, such as passwords, and should be kept secure.                                                                                                                                                When installing with Windows, you should run the `csstart` setup assistant from a directory with restricted access in order to protect this file.
                                                                                                                                                                                                                                                           (Step 2)
                                                                                                                                                                                                                                                           
                                                                                                                                                                                                                                                           [Go to procedure](#p_esx_cstart)
                                                                                                                                                                                                                                                           

  DRS is recommended for use in a cluster that is also hosting virtual machines other than the CloudSystem management hypervisors.                                                                                                                         The automatic placement of CloudSystem management hypervisors in the cluster may overload some hypervisors if DRS is not in use.

  If you use a single management host that is not part of a DRS cluster, then make sure you have enough resources to host all CloudSystem virtual appliances.                                                                                              `csstart` creates the virtual appliances in the first host of a non-DRS cluster. There is no way to select a specific host. All hosts in the non-DRS cluster need to be large enough to support all CloudSystem virtual appliances.

  When you run the `csstart` setup assistant, you will be asked for a Glance disk size. The installation creates a Glance disk on the same datastore where the base appliance template is stored.                                                          You must have sufficient space for the virtual appliance boot disks, as well as the Glance disk, or the installation process will not be able to complete.
  See ? for sizing calculations.                                                                                                                                                                                                                           (Step 3)
                                                                                                                                                                                                                                                           
                                                                                                                                                                                                                                                           [Go to procedure](#p_esx_cstart)
                                                                                                                                                                                                                                                           

  Each OVA in the datastore needs to have a unique name. You cannot use separate folders in the datastore.                                                                                                                                                 Instances are started in the same datastore that contains the OVA. If multiple OVAs with the same name are stored in the datastore, `csstart` will not know which one to use to create the instance.

  The Enterprise image must be deployed in the same datastore as the other CloudSystem virtual appliance images.                                                                                                                                           The Enterprise installation will fail if the Enterprise OVA is not included in the same datastore as the other virtual appliance images.

  Do not move or delete images, or rename the images, after you create the base appliance.                                                                                                                                                                 In order to speed up virtual machine boot times and save disk space, `csstart` does not make a full copy of the image. Changing the name or location of the image disrupts the operation of the shared copy encoded by `csstart`.
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  : Important CloudSystem configuration information

**Prerequisites.**

-   The management hypervisor network infrastructure is in place.

    See ?.

-   You have administrator privileges to log in to vCenter Server.

-   vCenter Server has a certificate

    See the [VMware Knowledge
    Base](http://kb.vmware.com/selfservice/search.do?cmd=displayKC&docType=kc&docTypeID=DT_KB_1_1&externalId=2034833)
    for instructions on implementing certificates with vSphere.

-   One large datastore is created with approximately 2 TB to support
    the virtual appliance boot drives plus additional storage for
    OpenStack Glance images.

    See ?.

-   The cluster where CloudSystem virtual machines are created has
    connectivity to the HP 3PAR StoreServ storage system. Use VMDK for
    block storage in an ESXi environment.

-   The ESXi management hypervisor can run as a standalone host.
    Multiple management hypervisor hosts are configured in a cluster.

-   The csstartgui.bat and the full csstart folder are extracted from
    HP\_CloudSystem-Tools-8.1.2 – Dec 2014 to a Windows workstation.

Log in to vCenter Server using the VMware vSphere Client or a web
browser.

Select Inventory Hosts and Clusters and select your management cluster.

Select FileDeploy OVF template.

Follow the screen prompts. Point to the **CS-Base-8.1.2.0.ova** image
file that was staged on your Windows workstation. Make sure to name the
template **CS-Base-8.1.2.0**. The name should match the ova file name.

Best practice is to select thin provisioning. Installation is much
faster with this option. Thick provisioning requires about an hour for
the Foundation base appliance, vCenter proxy appliance and Enterprise
appliance to install and it requires 560 GB of space.

The location where the OVA images are stored is the same location where
`csstart` creates the virtual machine appliances. Make sure the
datastore you plan to use has 500 GB of space.

Verify that the virtual machine was created. It should be listed on the
left side of the screen under the VMs and templates view.

Do NOT boot the virtual machine.

Right-click the virtual machine and select Edit settings.

Remove any network adapters.

If using distributed switches, network adaptors must be removed from
imported OVF files to ensure proper setup of network connections on
virtual appliances.

Convert the new virtual machine to a template.

The `csstart` installation script uses this template during deployment.

Repeat steps 3-8 for the SDN appliance, selecting the
**CS-SDN-8.1.2.0.ova** image file that was staged on your Windows
workstation. Make sure to name the template **CS-SDN–8.1.2.0**. The name
should match the OVA file name.

Repeat steps 3-8 for the network node appliance, selecting the
**CS-NN-8.1.2.0.ova** image file that was staged on your Windows
workstation. Make sure to name the template **CS-NN-8.1.2.0**. The name
should match the OVA file name.

Repeat steps 3-8 for the Enterprise appliance, selecting
**CS-Enterprise-8.1.2.0.ova** image file that was staged on your Windows
workstation. Make sure to name the template **CS-Enterprise-8.1.2.0**.
The name should match the OVA file name.

If you plan to use DHCP, then you must have the following configuration
in place before running `csstart`.

-   Dynamic DNS needs to be configured with the DNS server that uses the
    hostname returned by the client in the DHCP handshake.

-   **If DHCP is configured on the Data Center Management Network**,
    leave the default gateway blank. The DHCP server must specify the
    default gateway. You also cannot define a gateway on the Consumer
    Access Network. `Csstart` will not properly configure the Foundation
    base appliance if gateways are defined manually.

-   **If DHCP is configured on the Consumer Access Network**, the DHCP
    server cannot specify a default gateway. `Csstart` will not properly
    configure the Foundation base appliance if a gateway is defined on
    the Consumer Access Network.

Gather the following information, which you will enter later in the
`csstart` setup assistant.

-   **Management appliance details**

    -   Foundation base appliance hostname

        If using DHCP, the hostname must be a FQDN that the network will
        recognize.

    -   Glance disk size

    -   Foundation base appliance *new* secure password

-   **Data Center Management Network details**

    -   IP address of the Data Center Management Network

    -   Subnet mask

    -   Gateway address

        If using DHCP, leave this blank to allow the DHCP server to
        define the gateway.

    -   Preferred DNS server IP address

        This is helpful if you plan to define hosts based on names
        instead of IP addresses.

-   **Consumer Access Network details**

    -   IP address of the Consumer Access Network

    -   Subnet mask

    > **Important**
    >
    > Do not enter a gateway address on this network. If you want to
    > change this after running `csstart`, see ?

-   **Location of vCenter Server**

    -   vCenter Server IP address or hostname

    -   vCenter Server user name and password

-   **vSphere cluster or host**

    -   Management cluster name or the name of the host managing the
        CloudSystem virtual appliances

-   **Network information**

    -   vCenter Server vSwitch port group name for the Consumer Access
        Network

        Refer to ClusterHost ConfigurationNetworking in vCenter Server
        to find the network name.

    -   vCenter Server vSwitch port group name for the Data Center
        Management Network

    -   vCenter Server vSwitch port group name for the Cloud Management
        Network

    -   vCenter Server vSwitch port group name for the Cloud Data Trunk

    -   vCenter Server vSwitch port group name for the External Network

Log on to the Windows workstation that has network connectivity to the
vCenter Server managing the management hypervisor.

Launch the **csstartgui.bat** file that you extracted from the **HP
CloudSystem Tools 8.1 – Jul 2014** file.

Opening the `.bat` file launches a browser, opens URL `localhost:5000`,
and starts the `csstart` setup assistant.

Follow the prompts in the `csstart` setup assistant, using the
information you gathered in step one.

When the installation is complete, verify that the Foundation base
appliance appears in the management cluster in vCenter Server.

The SDN appliance and network node appliances are created after entering
Cloud Network settings in the CloudSystem Console.

Installing CloudSystem on a KVM hypervisor
==========================================

installation
about KVM
KVM
about installation
This chapter contains the procedures required to set up the network
infrastructure and install the CloudSystem Foundation base appliance on
a KVM management hypervisor. The checklist below provides an overview of
the installation path.

  ------------------------------------------------------------------------
        Installation step                              Related information
  ----- ---------------------------------------------- -------------------
        Create the management hypervisor.              ?

        Configure the network infrastructure.          ?

        Launch `csstart` and install the Foundation    ?
        base appliance.                                
  ------------------------------------------------------------------------

  : KVM management hypervisor installation path

Creating the management hypervisor
----------------------------------

Use the procedures in this section to create the KVM management
hypervisor. You cannot install CloudSystem in a KVM cluster.

### Preparing the hardware

If using a blade, edit the server profile.

On blades or standalone DLs, perform the following two tasks.

Define the management networks.

Define the Cloud Data Trunk and identify the VLANs to include in the
trunk.

### Installing RHEL

RHEL, installing
installing
RHEL
Obtain the installation media from
[http://www.redhat.com](http://redhat.com). Red Hat distributions and
documentation are titled generically as RHEL6, instead of 6.4, 6.5 and
so on. Check the documentation revision history or distribution version
to be certain you are referencing the correct information.

**Prerequisites.**

-   An iLO connection is established.

-   The time is set in the BIOS.

-   Smart arrays are disabled in the BIOS.

-   The iLO virtual media or physical DVD is presented.

Using the RHEL installation media, mount the DVD or ISO image and
complete the installation steps according to the Red Hat Enterprise
Linux
[documentation](https://access.redhat.com/site/documentation/en-US/Red_Hat_Enterprise_Linux/).

### Creating a local YUM repository and validating RHEL RPMs

KVM
creating a YUM repository
An empty RPM file, **rhel-kvm-deps-8.1.2.0.rpm**, is included in **HP
CloudSystem Tools 8.1.2 - Dec-2014**. This file lists all the required
RHEL RPMs. After creating the YUM repository, run the RPM file and
download any missing RPMs. Add the missing RPMs to your local YUM
repository.

See ?.

**Prerequisites.**

-   **rhel-kvm-deps-8.1.2.0.rpm** is extracted from the **HP CloudSystem
    Tools 8.1.2 -Dec-2014** file and moved to your local workstation.

> **Note**
>
> If you want to copy and paste commands from this procedure, first copy
> and paste the commands to Notepad++. Then copy and paste the commands
> to the management hypervisor. This step ensures that there are no
> hidden characters in the commands pasted to the hypervisor.

Use a secure copy tool, such as SCP, in the procedure below.

Make a new directory and copy RHEL 6.4 or RHEL 6.5 to a directory
location such as `/home/kits`:

    # mkdir /home/kits

Make a new directory for the DVD mount point:

    # mkdir /dvd

Mount the DVD:

-   For 6.4, run the following command:

        # mount —o loop /home/kits/rhel-server-6.4–x86_64–dvd.iso /dvd

-   For 6.5, run the following command:

        # mount —o loop /home/kits/rhel-server-6.5–x86_64–dvd.iso /dvd

Create the repository:

For 6.4 run the following two commands:

``` {#v27199367}
# cd /etc/yum.repos.d/
```

``` {#v28153123}
# vi LocalDCRhel.repo
[RHELDVD]
name=Locally Mounted RHEL 6.4 ISO
baseurl=file:///dvd/
enabled=0
```

For 6.5, run the following two commands:

``` {#v28153125}
# cd /etc/yum.repos.d/
```

``` {#v27199369}
# vi LocalDCRhel.repo
[RHELDVD]
name=Locally Mounted RHEL 6.5 ISO
baseurl=file:///dvd/
enabled=0
```

Import the GPG-Key (GNU Privacy Guard):

``` {#v27199374}
# rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release
```

``` {#v27199376}
# yum clean all
```

``` {#v27199378}
# yum update
```

Install the RPM file:

    yum install rhel-kvm-deps-8.1.2.0.rpm --enablerepo=RHELDVD

Missing RHEL RPMs are identified and installed.

Verify that the **libguestfs** and **libguestfs-tools** packages were
installed:

``` {#v27199384}
yum list | grep libguestfs*
```

Understanding the CloudSystem network infrastructure on KVM
-----------------------------------------------------------

networks
about KVM network infrastructure
KVM
about network infrastructure
Data Center Management Network
KVM network infrastructure
Consumer Access Network
KVM network infrastructure
External Network
KVM network infrastructure
Cloud Management Network
KVM network infrastructure
Cloud Data Trunk
KVM network infrastructure
Several networks provide the communication platform for CloudSystem, the
HP 3PAR StoreServ storage system, and the suite of integrated tools. The
configuration of the networks is flexible. This section explains the
major components of the networking infrastructure and provides an
example of a supported configuration. This is only a guide. Modify the
procedures below to fit your network configuration needs. For example,
the bridge names can vary according to your environment.

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Network                          CloudSystem virtual appliance   Management hypervisor interface                                               Example names for bridges (matches figure below)
  -------------------------------- ------------------------------- ----------------------------------------------------------------------------- --------------------------------------------------
  Data Center Management Network   Foundation base appliance       vNIC0 on Foundation base appliance and Enterprise appliance                   br-dc-mgmt
                                                                                                                                                 
                                   vCenter proxy appliance         vNIC1 on vCenter proxy appliance                                              
                                                                                                                                                 
                                   Enterprise appliance                                                                                          
                                                                                                                                                 

  Cloud Management Network         Foundation base appliance       vNIC0 on vCenter proxy appliance, SDN appliance and network node appliances   br-cloud-mgmt
                                                                                                                                                 
                                   vCenter proxy appliance         vNIC1 on Foundation base appliance                                            
                                                                                                                                                 
                                   SDN appliance                                                                                                 
                                                                                                                                                 
                                   network node appliances                                                                                       
                                                                                                                                                 
                                   KVM compute nodes                                                                                             
                                                                                                                                                 

  **Consumer Access Network**      Foundation base appliance       vNIC1 on Enterprise appliance                                                 br-access
                                                                                                                                                 
                                   Enterprise appliance            vNIC2 on Foundation base appliance                                            
                                                                                                                                                 

  Cloud Data Trunk                 network node appliances         vNIC1                                                                         br-cloud-trunk
                                                                                                                                                 

  External Network                 network node appliances         vNIC2                                                                         br-external
                                                                                                                                                 
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  : Explanation of CloudSystem networks

> **Important**
>
> All of the networks described above must be distinct networks.

For a detailed explanation of the networks, see ?.

The figure below shows a visual representation of the recommended
configuration for networks.

![KVM sample network configuration](img/cs8-kvmmgmthost.png)

> **Note**
>
> The vCenter proxy appliance and the vSphere VM 5.X appliance shown in
> the figure are only used if you are managing ESXi compute nodes from a
> KVM management hypervisor.

### Configure the network infrastructure on the KVM management hypervisor

KVM
configuring network infrastructure
The following procedure describes the steps for configuring the network
interfaces on a KVM hypervisor. The procedure is based on the
information provided in the figure above, but you can modify the
configuration to fit your network needs.

Read the following important information before you configure the
networks for the Foundation base appliance.

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Important to know                                                                                                                                                                                                                                                                                         Why it matters
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Make sure the VLANs in the Management Trunk are actually assigned to cables plugged into the interface network ports.                                                                                                                                                                                     A network of cables must be physically connected to allow the supported virtual appliances to communicate over the networks. Make sure the virtual and physical components have correct associations such that data can transfer between points (between appliances, hypervisors, servers, nodes, etc.)

  Do not configure the iSCSI initiators on the management hypervisor.                                                                                                                                                                                                                                       iSCSI initiators are set up on the compute nodes, not the management hypervisor. Initiators check to see which storage resources on the network are available.

  The `csstart` setup assistant pulls configuration information from the `deployer.conf` file. Changes to configuration should be made directly in the `deployer.conf` file.                                                                                                                                The information in the `deployer.conf` file tells `csstart` where to locate the images used to start the virtual appliances. Other settings in this file are used to define network addressing and network interfaces.

  The `csstart` setup assistant logs information during the startup process in a file named `deploy.log`. This file is located in the same directory where the `deployer.conf` configuration file resides.                                                                                                  If errors occur during the startup process, `csstart` will log the relevant error information to the `deploy.log` file.

  Generic names, as shown on the sample configuration figure above, are used in this procedure. Make sure to substitute the actual names of your interfaces `(ifcfg-eth<ID>`), bonds `(ifcfg-bond<ID>`), tagged VLANs `(bond<ID>.<VLANID>)` and bridges `(ifcfg-br-<Name>)` when configuring the network.   It is important to use the same names defined in the hardware profile when assigning the networks in the management hypervisor `ifconfig` files. If the names do not match, then network communication errors will occur.
                                                                                                                                                                                                                                                                                                            (Steps 3-5)
                                                                                                                                                                                                                                                                                                            
                                                                                                                                                                                                                                                                                                            [Go to procedure](#p_kvm-config-net-infra-install)
                                                                                                                                                                                                                                                                                                            

  Do not include spaces in bridge names.                                                                                                                                                                                                                                                                    `csstart` does not support spaces in bridge names.
                                                                                                                                                                                                                                                                                                            (Steps 3-5)
                                                                                                                                                                                                                                                                                                            
                                                                                                                                                                                                                                                                                                            [Go to procedure](#p_kvm-config-net-infra-install)
                                                                                                                                                                                                                                                                                                            
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  : Important network configuration information

**Prerequisites.**

-   Red Hat Enterprise Linux 6.4 or 6.5 is installed on the management
    host.

> **Note**
>
> If you want to copy and paste commands from this procedure, first copy
> and paste the commands to Notepad++. Then copy and paste the commands
> to the management hypervisor. This step ensures that there are no
> hidden characters in the commands pasted to the hypervisor.

Log in to the management hypervisor.

Change the directory to `/etc/sysconfig/network-scripts`.

Create the interface, bond and bridge configuration files for the Data
Center Management Network, the Cloud Management Network, the Consumer
Access Network, the External Network and the Cloud Data Trunk.

See ?.

See ?.

Open the **ifcfg-ethM** file and add the following lines:

``` {#v27199409}
MASTER=bondA
SLAVE=yes
NM_CONTROLLED=no
```

Save the change and close the file.

Open the **ifcfg-ethN** file and add the following lines:

``` {#v27199413}
MASTER=bondA
SLAVE=yes
NM_CONTROLLED=no
```

Save the change and close the file.

Create a new bond configuration file using the name **ifcfg-bondA**.
This bond connects to `bondA.X` for the Data Center Management Network
and bond `A.Y` for the Cloud Management Network. The configuration file
should contain the following lines:

``` {#v27199417}
DEVICE=bondA
BOOTPROTO=none
ONBOOT=yes
NM_CONTROLLED=no
USERCTL=no
BONDING_OPTS=”mode=5 miimon=100”
```

Save and close the file.

Create a new bond configuration file using the name **ifcfg-bondA.X**.
This bond connects to the Data Center Management Network bridge. The
configuration file should contain the following lines:

``` {#v27199421}
DEVICE=bondA.X
BOOTPROTO=none
ONBOOT=yes
NM_CONTROLLED=no
USERCTL=no
VLAN=yes
BRIDGE=br-dc-mgmt
```

Save and close the file.

Create a new bond configuration file using the name **ifcfg-bondA.Y**.
This bond connects to the Cloud Management Network bridge. The
configuration file should contain the following lines:

``` {#v27199425}
DEVICE=bondA.Y
BOOTPROTO=none
ONBOOT=yes
NM_CONTROLLED=no
USERCTL=no
VLAN=yes
BRIDGE=br-cloud-mgmt
```

Save and close the file.

Create a new bond configuration file using the name **ifcfg-bondA.Z**.
This bond connects to the Consumer Access Network bridge. The
configuration file should contain the following lines:

``` {#v28153132}
DEVICE=bondA.Z
BOOTPROTO=none
ONBOOT=yes
NM_CONTROLLED=no
USERCTL=no
VLAN=yes
BRIDGE=br-consumer-access
```

Save and close the file.

Create a new bridge configuration file using the name
**ifcfg-br-dc-mgmt**. This bridge connects the Foundation base
appliance, the optional vCenter proxy appliance and the Enterprise
appliance to the Data Center Management Network. The configuration file
should contain the following lines:

``` {#v27199429}
DEVICE=br-dc-mgmt
TYPE=”Bridge”
DNS1=name_of _the_primary_DNS_server
IPADDR=IP_address_of_the_KVM_management_host
NETMASK=netmask_ID
BOOTPROTO=static
ONBOOT=yes
NM_CONTROLLED=no
DELAY=0
# dc-mgmt, vlan 10
```

Save and close the file.

Create a new bridge configuration file using the name
**ifcfg-br-cloud-mgmt**. This bridge connects the Foundation base
appliance, the optional vCenter proxy appliance, the SDN appliance and
the network node appliances to the Cloud Management Network. The
configuration file should contain the following lines:

``` {#v27199433}
DEVICE=br-cloud-mgmt
TYPE=”Bridge”
NM_CONTROLLED=no
BOOTPROTO=none
ONBOOT=yes
DELAY=0
# cloud mgmt, vlan 12
```

Save and close the file.

Create a new bridge configuration file using the name
**ifcfg-br-consumer-access**. This bridge connects the Foundation base
appliance and the Enterprise appliance to the Consumer Access Network.
The configuration file should contain the following lines:

``` {#v28153136}
DEVICE=br-consumer-access
TYPE=”Bridge”
DNS1=name_of _the_primary_DNS_server
IPADDR=IP_address_of_the_KVM_management_host
NETMASK=netmask_ID
BOOTPROTO=static
ONBOOT=yes
NM_CONTROLLED=no
DELAY=0
```

Save and close the file.

Create the interface, bond and bridge configuration for the External
Network.

See ?.

Open the **ifcfg-ethO** file and add the following lines:

``` {#v27199442}
MASTER=bondB
SLAVE=yes
NM_CONTROLLED=no
```

Save the change and close the file.

Open the **ifcfg-ethP** file and add the following lines:

``` {#v27199446}
MASTER=bondB
SLAVE=yes
NM_CONTROLLED=no
```

Save the change and close the file.

Create a new bond configuration file using the name **ifcfg-bondB**.
This bond connects to the External Network bridge. The configuration
file should contain the following lines:

``` {#v27199450}
DEVICE=bondB
BOOTPROTO=none
ONBOOT=yes
USERCTL=no
NM_CONTROLLED=no
BONDING_OPTS=”mode=5 miimon=100”
BRIDGE=br-external
```

Save the change and close the file.

Create a new bridge configuration file using the name
**ifcfg-br-external**. This is the bridge that connects the network node
appliances to the External Network. The configuration file should
contain the following lines:

    DEVICE=br-external
    TYPE=”Bridge”
    BOOTPROTO=none
    ONBOOT=yes
    NM_CONTROLLED=no
    DELAY=0

Create the interface, bond and bridge configuration files for the Cloud
Data Trunk.

See ?.

Open the **ifcfg-ethQ** file and add the following lines:

``` {#v27199461}
MASTER=bondC
SLAVE=yes
NM_CONTROLLED=no
```

Save the change and close the file.

Open the **ifcfg-ethR** file and add the following lines:

``` {#v27199465}
MASTER=bondC
SLAVE=yes
NM_CONTROLLED=no
```

Save the change and close the file.

Create a new bond configuration file using the name **ifcfg-bondC**.
This bond connects to the Cloud Data Trunk bridge. The configuration
file should contain the following lines:

``` {#v27199469}
DEVICE=bondC
BOOTPROTO=none
ONBOOT=yes
USERCTL=no
NM_CONTROLLED=no
BONDING_OPTS=”mode=5 miimon=100”
BRIDGE=br-cloud-trunk
```

Save the change and close the file.

Create a new bridge configuration file using the name
**ifcfg-br-cloud-trunk**. This is the bridge that connects the network
node appliance to the Cloud Data Trunk. The configuration file should
contain the following lines:

``` {#v27199473}
DEVICE=br-cloud-trunk
TYPE=”Bridge”
BOOTPROTO=none
ONBOOT=yes
NM_CONTROLLED=no
DELAY=0
# cloud trunk, vlan all
```

Save the change and close the file.

Run the following command to restart networking and allow the new
configuration to take effect:

    service network restart

Run the following command to see a list of the bridges that were created
and the interfaces for each bridge:

    brctl show

Run the following command to make sure all of the interfaces, bridges
and bonds are configured and running:

    ifconfig

Configuring the KVM management environment
------------------------------------------

KVM
about management cluster
The management environment consists of a single management hypervisor
host that contains the following virtual appliances.

-   A Foundation base appliance

-   An SDN appliance

-   Three network node appliances

-   An optional vCenter proxy appliance for ESXi compute nodes

-   An optional Enterprise appliance, if you plan to use CloudSystem
    Enterprise

The `csstart` installation script launches a setup assistant to guide
you through the installation process. When you run `csstart`, the setup
assistant opens and displays fields for capturing details about the new
virtual appliance and network configuration. The information is saved in
a configuration file called `deployer.conf`.

Running `csstart` applies the configuration information saved in
`deployer.conf` to the virtual appliance designated to host the
Foundation base appliance. When the installation completes, the
Foundation base appliance appears in the management hypervisor appliance
list.

The SDN appliance and the network node appliances are automatically
created after the Cloud Networking settings are entered and saved during
[first time setup](#c_firsttime-setup-install).

### Selecting the hypervisor security level for CloudSystem installation

KVM
hypervisor security
This section describes the security options available for a CloudSystem
installation.

When running the `csstart` setup assistant, the supported security
option is `auto-accept-cert`. This option **disables security checks for
csstart, but enables security when creating the remaining virtual
appliances**.

When `csstart` runs, it requests the SSH key from the hypervisor and
injects the certificate into the Foundation base appliance. No security
checks are performed when the Foundation base appliance is created. When
the additional virtual appliances are created by the Foundation base
appliance, that certificate is used to verify that the correct
hypervisor is used.

Sample command:

    ./csstart gui --auto-accept-cert --listen 0.0.0.0 --port 5000

The following requirements must be in place before performing the
installation using the `csstart` setup assistant:

1.  The `deployer.conf` file has `security-checking = enabled`. This is
    the default setting.

2.  Verify that a valid server certificate resides on the KVM host.

    See the [Red Hat Customer
    Portal](https://access.redhat.com/documentation/en-US/) for
    instructions on implementing certificates.

You can also choose to disable security checks by changing the setting
in the `deployer.conf` file to `security-checking = disabled`. When
security is disabled, you must run `csstart` from the CLI.

**See also**

-   ?

-   ?

### Configuring the Foundation base appliance on KVM

KVM
configuring the Foundation base appliance
Read the following important notes before configuring the Foundation
base appliance.

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Important to know                                                                                                                                                                                                                                                                                                                                                                                                                                            Why it matters
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  HP recommends that you set the time on the management hypervisor to automatically sync with the NTP server. The Foundation and Enterprise appliances should be synced with the virtual machine host running the management hypervisor.                                                                                                                                                                                                                       Data records can become out of sync between appliances when time is not set to automatically sync with the NTP server. If the Foundation and Enterprise appliance date/time is out of sync, then you will not be able to create designs in HP CSA.

  If you are using the RHEL default driver, **Broadcom TG3 NIC**, then you must update the driver.                                                                                                                                                                                                                                                                                                                                                             Using an outdated driver will prevent you from accessing a provisioned instance with a floating IP.
  See [HP Support Center](http://h20566.www2.hp.com/portal/site/hpsc/template.PAGE/public/psi/swdDetails/?sp4ts.oid=5226971&spf_p.tpst=swdMain&spf_p.prp_swdMain=wsrp-navigationalState%3Didx%253D%257CswItem%253DMTX_549a762a22594c7eaa42e95612%257CswEnvOID%253D4103%257CitemLocale%253D%257CswLang%253D%257Cmode%253D%257Caction%253DdriverDocument&javax.portlet.begCacheTok=com.vignette.cachetoken&javax.portlet.endCacheTok=com.vignette.cachetoken).   
                                                                                                                                                                                                                                                                                                                                                                                                                                                               

  If you are using the Emulex driver, **be2net**, then you must upgrade the driver to version 4.4.245.0 or later.                                                                                                                                                                                                                                                                                                                                              Using an outdated driver will interrupt SSH and TCP network traffic.
  See [Citrix support](http://www.emulex.com/downloads/oem-qualified/emc/drivers/linux40/rhel-5x/drivers/).                                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                               

  When installing with Linux, you should run the `csstart` setup assistant from a directory with restricted access in order to protect the `deployer.conf` file.                                                                                                                                                                                                                                                                                               The `deployer.conf` file contains confidential information, such as passwords, and should be kept secure.
                                                                                                                                                                                                                                                                                                                                                                                                                                                               (Step 2)
                                                                                                                                                                                                                                                                                                                                                                                                                                                               
                                                                                                                                                                                                                                                                                                                                                                                                                                                               [Go to procedure](#p_base-app)
                                                                                                                                                                                                                                                                                                                                                                                                                                                               

  The installation images and the corresponding checksums should be placed in the default `/CloudSystem/images` directory.                                                                                                                                                                                                                                                                                                                                     The `csstart` setup assistant does not provide a way to change the image location. You must update that directly in the `deployer.conf` file.
                                                                                                                                                                                                                                                                                                                                                                                                                                                               See ?.
                                                                                                                                                                                                                                                                                                                                                                                                                                                               

  Exit the `csstart` setup assistant before using a text editor to change the advanced fields in the `deployer.conf` file.                                                                                                                                                                                                                                                                                                                                     The setup assistant caches the contents of the `deployer.conf` file in memory. If you edit `deployer.conf` outside of the setup assistant, then the updates are not captured and applied during installation.
                                                                                                                                                                                                                                                                                                                                                                                                                                                               See ?.
                                                                                                                                                                                                                                                                                                                                                                                                                                                               

  When you run the `csstart` setup assistant, you will be asked for a Glance disk size. Make sure to size the disk appropriately.                                                                                                                                                                                                                                                                                                                              The installation creates a Glance disk on the same datastore where the Foundation base appliance template is stored. You must have sufficient space for the virtual appliance boot disks, as well as the Glance disk, or the installation process will not be able to complete.
  See ? for sizing calculations.                                                                                                                                                                                                                                                                                                                                                                                                                               (Step 7)
                                                                                                                                                                                                                                                                                                                                                                                                                                                               
                                                                                                                                                                                                                                                                                                                                                                                                                                                               [Go to procedure](#p_base-app)
                                                                                                                                                                                                                                                                                                                                                                                                                                                               

  Do not move, delete or rename images after you create the Foundation base appliance.                                                                                                                                                                                                                                                                                                                                                                         In order to speed up virtual machine boot times and save disk space, `csstart` does not make a full copy of the image. Changing the name or location of the image disrupts the operation of the shared copy encoded by `csstart`.
                                                                                                                                                                                                                                                                                                                                                                                                                                                               [Go to procedure](#p_base-app)
                                                                                                                                                                                                                                                                                                                                                                                                                                                               
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  : Important CloudSystem configuration information

-   **HP CloudSystem Foundation KVM 8.1.2 – Dec 2014** is downloaded
    from the release site and images are unpacked on a Linux server.

-   A `/CloudSystem/images` directory is created on the management
    hypervisor and the `qcow2` images and checksums are moved to this
    directory. The `/CloudSystem/images` directory should be owned by
    root and should have permissions set to 755.  This setting allows
    write access only to the root user for the files owned by root.

-   128 GB of disk space is available on the management hypervisor for
    image storage

    See ?.

-   The network **ifcfg** files are created in the management hypervisor
    `etc/sysconfig/network-scripts` directory.

    See ?.

-   The management hypervisor has connectivity to the HP 3PAR StoreServ
    storage system. This is required if you are using block storage for
    instances. See ?.

If you plan to use DHCP, then you must have the following configuration
in place before running `csstart`.

-   Dynamic DNS needs to be configured with the DNS server that uses the
    hostname returned by the client in the DHCP handshake.

-   **If DHCP is configured on the Data Center Management Network**,
    leave the default gateway blank. The DHCP server must specify the
    default gateway. You also cannot define a gateway on the Consumer
    Access Network. `Csstart` will not properly configure the Foundation
    base appliance if gateways are defined manually.

-   **If DHCP is configured on the Consumer Access Network**, the DHCP
    server cannot specify a default gateway. `Csstart` will not properly
    configure the Foundation base appliance if a gateway is defined on
    the Consumer Access Network.

> **Note**
>
> If you want to copy and paste commands from this procedure, first copy
> and paste the commands to Notepad++. Then copy and paste the commands
> to the management hypervisor. This step ensures that there are no
> hidden characters in the commands pasted to the hypervisor.

Gather the following information, which you will enter later in the
`csstart` setup assistant.

-   **Management appliance details**

    -   Foundation base appliance hostname

        If using DHCP, the hostname must be a FQDN that the network will
        recognize.

    -   Glance disk size

    -   Foundation base appliance *new* secure password

-   **Data Center Management Network details**

    -   IP address of the Data Center Management Network

    -   Subnet mask

    -   Gateway address

        If using DHCP, leave this blank to allow the DHCP server to
        define the gateway.

    -   Preferred DNS server IP address

        This is required if you plan to use names for hosts instead of
        IP addresses.

-   **Consumer Access Network details**

    -   IP address of the Consumer Access Network

    -   Subnet mask

    -   Gateway address

        > **Important**
        >
        > Do not enter a gateway address on this network. If you want to
        > change this after running `csstart`, see ?.

-   **Location of KVM management hypervisor**

    -   Management hypervisor hostname

    -   User name for the management hypervisor administrator

    -   Password for the management hypervisor administrator

-   **KVM bridge information**

    -   Name of the Consumer Access Network bridge

    -   Name of the Data Center Management Network bridge

    -   Name of the Cloud Management Network bridge

    -   Name of the Cloud Data Trunk bridge

    -   Name of the External Network bridge

From your Linux (or Windows) workstation, run the following command to
launch the `csstart` setup assistant:

    ./csstart gui --auto-accept-cert --listen 0.0.0.0 --port 5000 [-b]

The optional `–b` automatically opens a browser and displays the
`csstart` setup assistant.

Follow the prompts in the `csstart` setup assistant, using the
information you gathered in step one.

When the installation is complete, log in to the management hypervisor
and verify that the Foundation base appliance was created:

``` {#v27199525}
virsh list –all
```

The SDN appliance and network node appliances are created after entering
Cloud Network settings in the CloudSystem Console.

Setting up the CloudSystem Console for the first time
=====================================================

CloudSystem Console
first time set-up
To complete the final step of the CloudSystem Foundation installation,
add Cloud Networking information to the CloudSystem Console. Once the
network setting is saved, the Foundation base appliance automatically
creates the SDN appliance and network node appliances.

For definitions of the SDN appliance and network node appliances, see ?.

-   ?

-   ?

Configuring cloud networking
----------------------------

cloud networking
configuring
networks
configuring Cloud Networking settings in the CloudSystem Console
> **Important**
>
> Before you apply the Cloud Networking configuration in the CloudSystem
> Console, verify that you have the correct subnets. Cloud Networking is
> intended to be configured only once. If you need to change Cloud
> Networking after compute nodes are activated, you will need to delete
> all of the compute nodes first.

**Prerequisites.**

-   Minimum required privileges: Infrastructure administrator

-   The appliance is physically connected to the network.

-   The Foundation base appliance is installed.

Open a supported browser and enter the url `https://<>.`

Log in to the CloudSystem Console using the administrator user name and
the new secure password you defined in `csstart`.

The console opens to the Dashboard screen.

Expand the help icon ![](img/help_icon.jpg) along the right side of the
screen.

Under the Recommended actions heading, select **Edit Cloud Networking**.

The Cloud Networking window opens.

Enter the **Cloud Management subnet** in the field provided. This is the
Cloud Management Network you established in ? or ?.

Click **OK** to save the setting.

Verify that the SDN appliance and network node appliances are created
and running:

-   For ESXi, check vCenter Server to make sure the appliances are in
    the management cluster.

-   For KVM, log in to the management hypervisor and run the command

        virsh list <csbase-name> SDN

        virsh list <csbase-name> NN[1|2|3]

Enable console access on the Foundation base appliance. The
`csadmin console-users` CLI commands are used to enable console access
for cloud administrator users and to set the password.

See the appendix ? if you need console access instructions.

Use the Foundation base appliance console you enabled above:

-   From vCenter Server, select the Foundation base appliance, then
    click the **Console** tab.

    The CloudSystem Console UI screen opens.

-   Press **Ctl-Alt-F1** to switch to the console.

    Switch back to the UI by pressing **Alt-F2**.

<!-- -->

-   Open a VNC viewer to the `Foundation_IP_address:vncport`

Log in to the Foundation base appliance using the **cloudadmin**
credentials.

To restart the Nova Conductor service, run the following command:

    # service openstack-nova-conductor restart

> **Note**
>
> If you cannot access the console, go to the Settings screen in the
> CloudSystem Console and select Actions Restart.

If you are using **manual** assignment (not DHCP) for IP addresses or
want to change your default gateway after installing Foundation, see ?

Performing time synchronization on the Foundation base appliance
----------------------------------------------------------------

Foundation base appliance
synchronizing time
time synchronization
settings for Foundation base appliance
CloudSystem services can encounter errors and unpredictable system
behavior can occur if the time on the Foundation base appliance, vCenter
proxy appliance and the Enterprise appliance differ by more than a few
minutes. Make sure the correct Time and Language synchronization setting
in the CloudSystem Console is selected before CloudSystem is available
for general use.

**Prerequisites.**

-   Foundation base appliance is successfully installed on a management
    hypervisor.

-   Management hypervisor where the Foundation base appliance was
    installed is synchronized with a set of NTP servers.

Log in to the CloudSystem Console.

From the Settings screen, click the Edit icon in the Appliance panel.

Choose one of the following two options:

-   **Synchronize with time server**

    1.  In the Time and Language settings section, change the setting to
        Synchronize with time server.

    2.  Enter the IP address of the external NTP servers.

        These servers should be the same NTP servers used by the
        management hypervisor.

-   **Synchronize with VM host**

    1.  In the Time and Language settings section, keep the setting
        Synchronize with VM host.

Click OK to save the changes and close the Edit window.

**Next steps**: Choose any of the following next steps.

-   Refer to the HP CloudSystem 8.1 Administrator Guide at [Enterprise
    Information Library](http://www.hp.com/go/CloudSystem/docs) for
    additional information on configuring ESXi and KVM compute nodes,
    configuring cloud resources and deploying instances.

-   ?

-   ?

CloudSystem Foundation installation next steps
==============================================

The CloudSystem Foundation installation is complete, but you still need
to prepare and build resources for the cloud. The table below provides
links to resources that will help you complete these tasks.

  ------------------------------------------------------------------------
        Installation Step                      Additional Resources
  ----- -------------------------------------- ---------------------------
        Stage and prepare compute nodes.       See the **Resource
                                               configuration in
                                               CloudSystem Foundation:
                                               Compute node creation**
                                               chapter in the HP
                                               CloudSystem 8.1
                                               Administrator Guide at
                                               [Enterprise Information
                                               Library](http://www.hp.com/
                                               go/CloudSystem/docs)

        Build and manage cloud resources.      See **Cloud service
                                               provisioning, deployment
                                               and service management in
                                               CloudSystem Portal** in the
                                               HP CloudSystem 8.1
                                               Administrator Guide at
                                               [Enterprise Information
                                               Library](http://www.hp.com/
                                               go/CloudSystem/docs)
  ------------------------------------------------------------------------

  : Cloud preparation steps

If you are not ready to prepare your cloud, you can go to:

-   ?

-   ?

Preparing HP Operations Orchestration for CloudSystem Foundation
================================================================

HP Operations Orchestration (OO) is a next generation IT Process
Automation solution. OO supports CloudSystem in two ways.HP Operations
Orchestration preparing for use in CloudSystem FoundationHP Operations
Orchestrationcontent packs

-   HP Operations Orchestration Central (OO Central) version 10.10 is
    integrated with CloudSystem Foundation. It contains a set of default
    workflow that allow you to manage administrative tasks associated
    with the private cloud. CloudSystem Foundation supports full OO
    functionality, but only the workflows in the pre-defined bundle are
    available for use.

-   HP Operations Orchestration Studio (OO Studio) version 10.10 is a
    separate installation. You can install OO Studio to edit existing
    workflows or create new workflows. After workflows are edited in OO
    Studio, you can load them back to OO Central and use them to perform
    administrative tasks.

Using OO Central
----------------

To access OO Central, open the CloudSystem Console and select Integrated
Tools from the main menu.

OO Central comes with a full array of content packs, which perform tasks
for CloudSystem Foundation and CloudSystem Enterprise.

-   **base-cp**: This content pack provides support for integrations
    with various solutions (email, excel, active directory, file system,
    etc). It also includes basic operations used by other content packs.

-   **systems-cp**: This content pack provides support for integrating
    operating systems such as AIX, FreeBSD, HP UX, Red Hat, Solaris,
    SUSE Linux and Windows.

-   **virtualization-cp**: This content pack supports integration with
    virtualization platforms such as Citrix Xen Server, Hyper-V, KVM,
    SCVMM and VMware.

-   **hp-solutions-cp**: This content pack provides support for
    integrating HP solutions such as HP ArchSight, HP Fortify, HP Load
    Runner, HP Application Lifecycle Management, and HP Onboard
    Administrator.

-   **cloud-cp**: This content pack supports exposed APIs from cloud
    providers like OpenStack, Amazon EC2, IAM, S3 and VMware vCloud.

-   **csa-chef-cp**: Supports Topology Designer.

-   **csa-sa-cp**: Supports Topology Designer.

-   **csa-sitescope-cp**: Supports Topology Designer.

-   **csa-hp-helion-public-cp**: Supports Topology Designer.

-   **csa-amazon-cp**: Supports Topology Designer.

-   **csa-vmware-cp**: Supports Topology Designer.

-   **csa-config-cp**: Supports Topology Designer.

-   **sm-cp**: Supports Topology Designer and Sequential Designer.

-   **sa-cp**: Supports Topology Designer and Sequential Designer.

-   **csa-cp**: Supports Sequential Designer.

-   **oo10-csa-cp-4.10.001**: This content pack supersedes the CSA4.10
    content pack and allows you to include Topology Designs as
    components of Sequence Designs.

    > **Note**
    >
    > This content pack is only included with a fresh installation of
    > CloudSystem 8.1 U2. If you are upgrading to 8.1 U2, you will need
    > to import this content pack manually. When imported to OO, it
    > appears as version 4.10.004.
    >
    > To find this content pack, go to [HP Software
    > Depot](https://h20392.www2.hp.com/portal/swdepot/index.do) and
    > download the CloudSystem 8.1 Update 2 file **HP CloudSystem OO
    > Studio 8.1.2 – Dec 2014**`(Z7550-96113.zip)`. Extract the
    > `CSA-content-packs.zip`, then extract the contents of that file to
    > find `oo10-csa-cp-4.10.001.jar`.

  OO content pack           CloudSystem Foundation (administrative tasks)   CSA Topology Designer   CSA Sequential Designer
  ------------------------- ----------------------------------------------- ----------------------- -------------------------
  base-cp                   x                                               x                       x
  systems-cp                x                                               x                       x
  virtualization-cp         x                                               x                       x
  hp-solutions-cp           x                                               x                       x
  cloud-cp                  x                                               x                       x
  csa-chef-cp                                                               x                       
  csa-sitescope-cp                                                          x                       
  csa-hp-helion-public-cp                                                   x                       
  csa-amazon-cp                                                             x                       
  csa-vmware-cp                                                             x                       
  csa-config-cp                                                             x                       
  sm-cp                                                                     x                       x
  sa-cp                                                                     x                       x
  csa-cp                                                                                            x

  : Uses of OO content packs

Once the content packs are loaded, you can run them at any time. For
more information about HP Operations Orchestration, see
<http://www.hp.com/go/oo>.

Installing OO Studio
--------------------

HP OO Studio
installing
Installing OO Studio allows you to customize workflows. Customized flows
are saved as content packs and exported to a local directory. You can
then pull the customized flows into OO Central and run them to perform
administrative tasks in CloudSystem Foundation.

**Prerequisites.**

-   Foundation is fully installed and first time setup is completed.

-   You have access to a Windows workstation.

-   System requirements are met. Refer to HP Operations Orchestration
    System Requirements at [Enterprise Information
    Library](http://www.hp.com/go/CloudSystem/docs).

Unzip the **HP CloudSystem OO Studio 8.1 – Jul 2014** file.

Launch the `installer-win64-studio.exe` file, taking all default
settings.

After the installation is complete, import the OO content packs.

Under Dependencies, click Import Content Pack.

Select all the jar files extracted from **HP CloudSystem OO Studio 8.1.2
– Dec 2014** and click Open.

> **Note**
>
> Several content packs are at the root level in the zip file. The
> additional HP CSA content packs are inside the
> `csa-content-packs.zip`. Make sure to extract the HP CSA content packs
> from the zip file inside **HP CloudSystem OO Studio 8.1.2 – Dec 2014**
> before you try to import them.

Verify that the content packs display in the Dependencies section.

**Next steps**

-   Refer to ?

-   Refer to the OO Studio documentation bundled with the OO Studio
    program files for additional information on using workflows.

-   Refer to the “Integrated tool connectivity and configuration”
    chapter in the HP CloudSystem 8.1 Administrator Guide at [Enterprise
    Information Library](http://www.hp.com/go/CloudSystem/docs) for
    additional information on working with OO workflows.

Installing CloudSystem Enterprise 8.1 Update 2
==============================================

HP CloudSystem Enterprise
installing
HP CloudSystem Enterprise
synchronize time with the Foundation base appliance
> **Important**
>
> If you already have a version of Enterprise installed, use the upgrade
> instructions found in the chapter, ?.

-   ?

-   ?

CloudSystem Enterprise is an IaaS, PaaS and SaaS solution used for
complex cloud provisioning. After installing Enterprise, you can access
the Tools pane and the OO Callout Configuration pane from the
CloudSystem Console Enterprise screen.

-   **HP Cloud Service Automation (HP CSA)** is the administrative
    portal for the Enterprise appliance. Designs are created in the HP
    CSA portal using one of two designer: **Topology Designer** or
    **Sequential Designer**. The Topology Designer is an easy to use
    solution for infrastructure provisioning designs. Sequential
    Designer handles more complex application provisioning designs.
    Designs from both designers are offered as services in the
    Marketplace Portal.

-   The **Marketplace Portal** displays offerings that can be purchased
    and applied to a cloud environment.

-   The **OO Callout Configuration** pane on the Enterprise screen
    allows you to point to an instance (endpoint) of HP Operations
    Orchestration (OO) Central. OO Central is used to manage workflows
    that execute actions during the provisioning process. The default
    endpoint that Enterprise uses is the instance that is packaged with
    CloudSystem Foundation. If you want to point to a different instance
    of OO Central, refer to the white paper provided in the [Enterprise
    Information Library](http://www.hp.com/go/CloudSystem/docs).

> **Important**
>
> Do not change the Foundation base appliance network configuration
> (hostname, IP address, subnet mask, gateway address, DNS server or
> alternate DNS server) *after* Enterprise is installed. Doing so will
> break communication between Foundation and Enterprise and you will not
> be able to create subscriptions, create or edit designs, or manage
> existing subscriptions in HP CSA.

Installing the Enterprise appliance
-----------------------------------

Use the CloudSystem Console to launch the Enterprise installation. When
you install Enterprise, a new virtual appliance is created on the
management hypervisor. The entire installation process should take about
30 minutes.

  Important to know                                                                                                                                                                                                                                                                                                     Why it matters
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  The management hypervisors hosting the Foundation appliance and Enterprise appliance must use the same NTP servers for time sync.                                                                                                                                                                                     When the two appliances are out of sync, then you will not be able to create designs using HP CSA.
  Enterprise and Foundation must use the same IP address conventions.                                                                                                                                                                                                                                                   If Foundation was configured to support DHCP address assignments, this configuration will apply automatically to Enterprise. If Foundation was configured to support static IP addresses, you must enter static IP addresses when installing Enterprise.
  If you want to enable strong OpenLDAP or Active Directory certificate validation for authentication to the CloudSystem Portal, review the steps in the “Enabling strong certificate validation in the CloudSystem Portal” appendix of the HP CloudSystem 8.1 Administrator Guide **before** you install Enterprise.   Strong certificate validation may require a change to the alternate DNS server on the Foundation base appliance. Any changes to the Foundation  base appliance network configuration must be made before Enterprise is installed, because Enterprise uses these settings to communicate with Foundation. 

  : Important CloudSystem configuration information

**Prerequisites.**

-   Foundation is fully installed and [first time
    setup](#c_firsttime-setup-install) is complete.

-   In an ESXi configuration, the Enterprise OVA is added to the
    datastore that supports the management cluster in vCenter Server.

-   In a KVM configuration, the Enterprise `qcow2` image is saved to the
    Linux or Windows server where you ran `csstart` to install the
    Foundation base appliance.

-   You are using a supported browser. See ?.

-   You have registered the FQDN for the Enterprise appliance with the
    DNS server.

-   If Foundation was configured using static IP addresses, then you
    must have a static IP address for the Data Center Management Network
    and the Consumer Access Network.

Log in to the CloudSystem Console.

From the main menu, select Enterprise.

Click Install CloudSystem Enterprise.

The installation window opens.

![Enterprise screen in CloudSystem
Foundation](img/enterprise_scrn_capture.png)

Review the installation instructions, then click Next.

In the Enterprise appliance hostname field, enter the FQDN that you
registered with the DNS server.

Enter the Enterprise appliance static IP address on the Data Center
Management Network.

> **Note**
>
> If the Data Center Management Network configured in Foundation uses
> DHCP, then no field will appear for this network.

Enter the Enterprise appliance static IP address on the Consumer Access
Network.

> **Note**
>
> If the Data Center Management Network configured in Foundation uses
> DHCP, then this network will also use DHCP to assign IP addresses. No
> field will appear for Consumer Access Network.

Click Next.

Enter the user name and password required to log in to OO Central.

OO Central runs on the Foundation base appliance. The user name and
password are the same as the user name and password used to access the
CloudSystem Console, except that you must enter the OO user name with
all lower case letters. Once you log in to OO Central for the first
time, you can change the user name and password.

Click Install.

Verify that the appliance was created successfully.

After Enterprise is installed, a Tools and OO Callout Configuration pane
are added to the Enterprise screen. The Tools pane displays links to the
Cloud Service Management Console and the Marketplace Portal. The OO
Callout Configuration pane displays fields that allow you to point to an
external instance of OO Central.

All existing Foundation functionality will continue to be available.
Enterprise appliance details can be monitored in the CloudSystem Console
from the Enterprise screen. Perform all management tasks for the
Enterprise appliance in the CloudSystem Console on the Settings screen.

> **Note**
>
> If you want to copy and paste commands from this procedure, first copy
> and paste the commands to Notepad++. Then copy and paste the commands
> to the management hypervisor. This step ensures that there are no
> hidden characters in the commands pasted to the hypervisor.

Enable console access on the Enterprise appliance. The
`csadmin console-users` CLI commands are used to set the password and
enable console access for cloud administrator users.

See the appendix ? if you need console access instructions.

From the management hypervisor, open the Enterprise appliance console.

-   From vCenter Server, select the Enterprise appliance, then click the
    **Console** tab.

<!-- -->

-   Open a VNC viewer to the `Enterprise_IP_address:vncport`

Log in to the Enterprise appliance using the cloudadmin credentials.

Edit the `/etc/ntp.conf.enterprise` file to use the Foundation base
appliance FQDN or IP address for the NTP server.

Save the file.

Replace the partner\_ntp.conf file with this revised file:

``` {#v28381918}
cp /etc/ntp.conf.enterprise /etc/partner_ntp.conf
```

Check the `/etc/ntp.conf` file and make sure it contains a line to
include the `/etc/partner_ntp.conf` file:

``` {#v28381921}
# File for including partners custom ntp configurations 
```

``` {#v28381922}
includefile /etc/partner_ntp.conf
```

Restart the `ntpd` service:

``` {#v28381925}
service ntpd restart
```

**Next steps**: See “Understanding CloudSystem Enterprise” in the HP
CloudSystem 8.1 Administrator Guide at [Enterprise Information
Library](http://www.hp.com/go/CloudSystem/docs).

Upgrading to HP CloudSystem 8.1 Update 2
========================================

HP CloudSystem
upgrading
-   ?

-   ?

-   ?

-   ?

> **Important**
>
> The upgrade procedure may require rebooting the CloudSystem appliances
> and compute nodes.  HP strongly recommends that you begin the upgrade
> procedure at a time when your services can be interrupted or
> restarted, if necessary.

Upgrade paths
-------------

HP CloudSystem
upgrade paths
upgrade
paths
If you have CloudSystem 8.1 or 8.1 Update 1 installed, you can upgrade
to 8.1 Update 2. If you have CloudSystem 8.0 installed, you must upgrade
to 8.1 before upgrading to 8.1 Update 2.

The supported upgrade paths for CloudSystem Foundation and CloudSystem
Enterprise are listed below.

+---------------+---------------+---------------+---------------+-------------------+
| Original      | You want to   | Is Enterprise | Action to     | Additional        |
| Version       | upgrade to... | Installed?    | complete      | information       |
+===============+===============+===============+===============+===================+
| CloudSystem   | CloudSystem   | No            | Upgrade to    | -   “HP           |
| 8.0           | 8.1 U2        |               | CloudSystem   |     CloudSystem   |
|               |               |               | Foundation    |     8.1           |
|               |               |               | 8.1 first,    |     Installation  |
|               |               |               | then upgrade  |     and           |
|               |               |               | to            |     Configuration |
|               |               |               | CloudSystem   |     Guide” in the |
|               |               |               | Foundation    |     [Enterprise   |
|               |               |               | 8.1 U2        |     Information   |
|               |               |               |               |     Library](http |
|               |               |               |               | ://www.hp.com/go/ |
|               |               |               |               | CloudSystem/docs) |
|               |               |               |               |                   |
|               |               |               |               | -   ?             |
+---------------+---------------+---------------+---------------+-------------------+
| CloudSystem   | CloudSystem   | Yes           | Upgrade to    | -   “HP           |
| 8.0           | 8.1 U2        |               | CloudSystem   |     CloudSystem   |
|               |               |               | Foundation    |     8.1           |
|               |               |               | 8.1, then     |     Installation  |
|               |               |               | upgrade to    |     and           |
|               |               |               | CloudSystem   |     Configuration |
|               |               |               | Enterprise    |     Guide” in the |
|               |               |               | 8.1. Next,    |     [Enterprise   |
|               |               |               | upgrade to    |     Information   |
|               |               |               | CloudSystem   |     Library](http |
|               |               |               | Foundation    | ://www.hp.com/go/ |
|               |               |               | 8.1 U2, then  | CloudSystem/docs) |
|               |               |               | upgrade to    |                   |
|               |               |               | CloudSystem   | -   ?             |
|               |               |               | Enterprise    |                   |
|               |               |               | 8.1 U2.       | -   ?             |
+---------------+---------------+---------------+---------------+-------------------+
| CloudSystem   | CloudSystem   | No            | Upgrade to    | -   ?             |
| 8.1 or 8.1 U1 | 8.1 U2        |               | CloudSystem   |                   |
|               |               |               | Foundation    |                   |
|               |               |               | 8.1 U2        |                   |
+---------------+---------------+---------------+---------------+-------------------+
| CloudSystem   | CloudSystem   | Yes           | Upgrade to    | -   ?             |
| 8.1 or 8.1 U1 | 8.1 U2        |               | CloudSystem   |                   |
|               |               |               | Foundation    | -   ?             |
|               |               |               | 8.1 U2, then  |                   |
|               |               |               | upgrade to    |                   |
|               |               |               | CloudSystem   |                   |
|               |               |               | Enterprise    |                   |
|               |               |               | 8.1 U2        |                   |
+---------------+---------------+---------------+---------------+-------------------+
| CloudSystem   | CloudSystem   | No, but you   | Upgrade to    | -   ?             |
| 8.1 or 8.1 U1 | 8.1 U2        | want to add   | CloudSystem   |                   |
|               |               | CloudSystem   | Foundation    | -   ?             |
|               |               | Enterprise    | 8.1 U2. Then, |                   |
|               |               |               | perform a     |                   |
|               |               |               | fresh         |                   |
|               |               |               | installation  |                   |
|               |               |               | of            |                   |
|               |               |               | CloudSystem   |                   |
|               |               |               | Enterprise    |                   |
|               |               |               | 8.1 U2.       |                   |
+---------------+---------------+---------------+---------------+-------------------+

: CloudSystem upgrade paths

> **Important**
>
> You must use the same version of CloudSystem Foundation and
> CloudSystem Enterprise. Different versions are not compatible.

Recommended best practices for upgrading to CloudSystem 8.1 U2
--------------------------------------------------------------

upgrade
best practices
To ensure the best possible upgrade experience, **HP strongly
recommends** that you back up the CloudSystem appliances and create
snapshots of the virtual appliances before starting the upgrade process.
You can use the snapshots to bring the virtual appliances back up in
their original state, if needed.

To properly manage the new 8.1 U2 environment, it is also important to
create new backup images for all of the Foundation and Enterprise
appliances after completing the upgrade. The backup images are used in
the event that you need to restore your 8.1 U2 environment.

1.  Shut down all CloudSystem virtual appliances (Foundation base
    appliance, SDN appliance, network node appliances, vCenter proxy
    appliance).

2.  Back up the CloudSystem appliances and create a snapshot of each
    virtual appliance.

    See the “HP CloudSystem Foundation and Enterprise Software:
    Recommended backup and restore procedures” white paper in the
    [Enterprise Information
    Library](http://www.hp.com/go/CloudSystem/docs).

3.  Reboot the virtual appliances in the following order:

    1.  Reboot the Foundation base appliance.

        Wait for the login screen to appear in the browser before
        continuing to the next step.

    2.  Reboot the SDN appliance.

        Wait for the login screen to appear in the hypervisor console
        before continuing to the next step.

    3.  Reboot the Network node appliance.

    4.  Reboot the Enterprise appliance.

    See the “HP CloudSystem Foundation and Enterprise Software:
    Recommended backup and restore procedures” white paper in the
    [Enterprise Information
    Library](http://www.hp.com/go/CloudSystem/docs) for additional
    details.

4.  Perform the Foundation upgrade to 8.1 U2.

    See ?.

5.  If needed, manually upgrade the operating systems of your compute
    nodes.

6.  Create a backup image of the new Foundation 8.1 U2 appliance.

    See the “HP CloudSystem Foundation and Enterprise Software:
    Recommended backup and restore procedures” white paper in the
    [Enterprise Information
    Library](http://www.hp.com/go/CloudSystem/docs).

<!-- -->

1.  Shut down the Enterprise appliance.

2.  Back up CloudSystem Enterprise and create a snapshot of the
    appliance.

    See the “HP CloudSystem Foundation and Enterprise Software:
    Recommended backup and restore procedures” white paper in the
    [Enterprise Information
    Library](http://www.hp.com/go/CloudSystem/docs).

3.  Turn the Enterprise appliance back on.

    See the “HP CloudSystem Foundation and Enterprise Software:
    Recommended backup and restore procedures” white paper in the
    [Enterprise Information
    Library](http://www.hp.com/go/CloudSystem/docs).

4.  Perform the Enterprise upgrade to 8.1 U2.

    See ?.

5.  Create a backup image of the new Enterprise 8.1 U2 appliance.

    See the “HP CloudSystem Foundation and Enterprise Software:
    Recommended backup and restore procedures” white paper in the
    [Enterprise Information
    Library](http://www.hp.com/go/CloudSystem/docs).

Overview of the upgrade process
-------------------------------

upgrade
overview of upgrade steps
When upgrading to CloudSystem 8.1 U2, you must complete the following
sequence of upgrade steps in order.

1.  ?

    The upgrade process locks all other users out of the CloudSystem
    Foundation virtual appliances until the upgrade is complete. The
    entire upgrade process should take approximately one hour.

    The following changes occur when upgrading to HP CloudSystem
    Foundation 8.1 U2:

    -   The Foundation base appliance is updated to support new 8.1 U2
        features.

        For a list of new features, see the “Description” chapter of the
        HP CloudSystem 8.1 Update 2 Release Notes in the [Enterprise
        Information Library](http://www.hp.com/go/CloudSystem/docs).

    -   All virtual appliances (SDN appliance, vCenter proxy appliances
        and network nodes) are updated, including updating the OpenStack
        services running on the vCenter proxy appliances. The vCenter
        proxy appliances are not rebooted.

    -   In KVM environments, compute nodes are updated with new
        OpenStack services for KVM and OVS. KVM compute nodes are not
        rebooted.

        > **Note**
        >
        > The KVM compute node operating systems are not changed during
        > the upgrade. If you want to upgrade the operating systems of
        > your compute nodes, then you will need to do that manually,
        > *after* completing the CloudSystem Foundation upgrade. HP
        > recommends deactivating the compute nodes before upgrading the
        > operating system.
        >
        > You can have a mix of RHEL 6.4 and 6.5 compute nodes in your
        > environment.
        >
        > See the “Compute Node Creation” chapter of the HP CloudSystem
        > 8.1 Administrator Guide in the [Enterprise Information
        > Library](http://www.hp.com/go/CloudSystem/docs).

2.  ?

    The upgrade process stops all services until the upgrade is
    complete. The entire upgrade process should take approximately 30
    minutes.

    The following changes occur when upgrading to HP CloudSystem
    Enterprise 8.1 U2:

    -   The Enterprise appliance is updated to support new 8.1 U2
        features.

        For a list of new features, see the “Description” chapter of the
        HP CloudSystem 8.1 Upgrade 2 Release Notes in the [Enterprise
        Information Library](http://www.hp.com/go/CloudSystem/docs).

Upgrading to Foundation 8.1 Update 2
------------------------------------

upgrade
CloudSystem Foundation
CloudSystem Foundation
upgrading
upgrade
editing the deployer.conf file
-   ?

-   ?

-   ?

-   ?

These instructions are based on the assumption that you have a fully
installed version of CloudSystem 8.1 already up and running.

> **Important**
>
> If you are using HP Operations Orchestration, you will need to
> increase the size of the virtual machine hosting the Foundation base
> appliance to 250 GB and increase the OO database size to 20 GB before
> upgrading to CloudSystem 8.1 U2. Contact HP Support for assistance
> with these changes. See ?.

**Prerequisites.**

-   CloudSystem 8.1 is already installed

-   You have at least one activated compute node in your environment

-   You have Infrastructure Administrator privileges for the appliance.

-   You have a Windows or Linux workstation available to stage
    CloudSystem tools.

-   You have reviewed the recommended best practices for performing an
    upgrade. See ?.

The purpose of this procedure is to upload and install the new 8.1 U2
bits to your CloudSystem Foundation virtual appliances.

Download the **HP CloudSystem Foundation Upgrade 8.1 U2, Dec 2014** file
from [HP Software
Depot](https://h20392.www2.hp.com/portal/swdepot/index.do) to your local
staging environment.

Extract the upgrade `.bin` file from the zip file.

Log in to the CloudSystem Console and select SettingsActions Update
Foundation appliances.

Move the `.bin` file to the appliance UI screen either by dragging or
browsing to the file location.

Select an upgrade action from the bottom of the window:

-   The Upload and Installaction loads the `.bin` file into CloudSystem
    and launches the upgrade process.

-   The Upload action loads the `.bin` file into CloudSystem, but does
    not launch the upgrade process. After the upload completes, click
    Install.

> **Tip**
>
> The UI disappears when the upgrade restarts the Foundation base
> appliance. If the UI does not reappear after several minutes, click
> `F5` to refresh.

After the upgrade is complete, click SettingsAppliance and confirm that
the version listed in the General section is **8.1.2**.

The Activity screen displays an alert confirming that all compute nodes
are upgraded. Disregard the alert if you have not configured compute
nodes. In addition, you can disregard an alert stating that virtual
machines are already running on the cluster.

If the upgrade failed, verify that CloudSystem 8.1 is working as
expected, then try the upgrade again.

If you are using **manual** assignment (not DHCP) for IP addresses or
want to change your default gateway on the Foundation appliance, see ?.

Log in to the CloudSystem Console.

From the Settings screen, click the Edit icon in the Appliance panel.

Choose one of the following two options:

-   **Synchronize with time server**

    1.  In the Time and Language settings section, change the setting to
        Synchronize with time server.

    2.  Enter the IP address of the external NTP servers.

        These servers should be the same NTP servers used by the
        management hypervisor.

-   **Synchronize with VM host**

    1.  In the Time and Language settings section, keep the setting
        Synchronize with VM host.

Click OK to save the changes and close the Edit window.

The upgrade process does not update existing virtual appliance images.
New image files are not necessary for a successful upgrade because the
upgrade procedure patches the original image files to create the 8.1 U2
virtual appliances. However, updated image files may be useful at a
later time if you anticipate having more than twelve compute clusters or
plan to expand your network. Then, when additional vCenter proxy
appliances or network node appliances are automatically created, they
will be created from the newer 8.1 U2 appliance images.

If you have an environment with 12 or fewer compute clusters and you do
not plan to expand your network or deploy an Enterprise appliance, then
you do not need to perform this procedure.

Download the CloudSystem release kits from HP Software Depot at
[www.hp.com/go/cloudsystem/download](www.hp.com/go/cloudsystem/download)

Select **HP CloudSystem Enterprise ESX 8.1 U2 – Dec 2014** and **HP
CloudSystem Foundation ESX 8.1 U2 – Dec 2014** individually and download
the zip files to your Windows workstation.

Follow the instructions in the procedure ?.

### Verifying the upgrade

upgrade
verifying CloudSystem Foundation upgrade
Use the checklist provided below to verify that all CloudSystem
Foundation virtual appliances, compute nodes and networks were
successfully upgraded.

+--------+----------------+-----------------------------------------------------+
|        | CloudSystem    | Verify upgrade                                      |
|        | Foundation     |                                                     |
|        | component      |                                                     |
+========+================+=====================================================+
|        | Foundation     | 1.  Log in to the CloudSystem Console.              |
|        | base appliance |                                                     |
|        |                | 2.  Navigate to the Settings screen and click       |
|        |                |     Appliance.                                      |
|        |                |                                                     |
|        |                | 3.  Verify that the version listed is 8.1.2.        |
+--------+----------------+-----------------------------------------------------+
|        | Compute nodes  | 1.  Log in to the CloudSystem Console.              |
|        |                |                                                     |
|        |                | 2.  Navigate to the Activity screen.                |
|        |                |                                                     |
|        |                | 3.  Verify that an activity notification was posted |
|        |                |     for each compute node, indicating that the      |
|        |                |     upgrade process *started* successfully.         |
|        |                |                                                     |
|        |                | 4.  Verify that an activity notification was posted |
|        |                |     for each compute node, indicating that the      |
|        |                |     upgrade process *completed* successfully.       |
|        |                |                                                     |
|        |                | 5.  If you see an upgrade error on the Activity     |
|        |                |     screen, expand each error and read the detailed |
|        |                |     information. You can also log in to the compute |
|        |                |     node and check the yum logs for error messages. |
|        |                |                                                     |
|        |                |     -   Correct any errors on the compute nodes.    |
|        |                |                                                     |
|        |                |     -   To upgrade the compute node, log in to the  |
|        |                |         compute node and run:                       |
|        |                |                                                     |
|        |                |             yum update                              |
+--------+----------------+-----------------------------------------------------+

: CloudSystem Foundation upgrade checklist

### Backing up the appliance after updating it

After updating your appliance to HP CloudSystem 8.1 U2, create a new
backup file. You must have a backup image of your current version of
CloudSystem. You cannot use an 8.1 backup image to restore an 8.1 U2
appliance.

See HP CloudSystem: Recommended Backup and Restore Procedures in the
Enterprise Information Library at
<http://www.hp.com/go/CloudSystem/docs>.

**Next steps:**

-   ? (if Enterprise is not already installed)

-   ? (if Enterprise is installed and you are ready to upgrade)

Upgrading to Enterprise 8.1 Update 2
------------------------------------

HP CloudSystem Enterprise
upgrading
upgrade
HP CloudSystem Enterprise
upgrade
removing OO content packs
HP Operations Orchestration
removing content packs before an upgrade
-   ?

-   ?

-   ?

**Prerequisites.**

-   CloudSystem Enterprise 8.1 is already installed.

-   You have Infrastructure Administrator privileges for the appliance.

-   Foundation upgrade was successfully performed. See ?.

-   You have reviewed the recommended best practices for performing an
    upgrade. See ?.

The purpose of this procedure is to upload and install the new 8.1 U2
bits to your CloudSystem Enterprise appliance.

Download the **HP CloudSystem Enterprise Upgrade 8.1, Dec 2014** zip
file from [HP Software
Depot](https://h20392.www2.hp.com/portal/swdepot/index.do) to your local
staging environment.

Extract the upgrade `.bin` file from the zip file.

Log in to the CloudSystem Console and select EnterpriseActionsUpdate
CloudSystem Enterprise.

Move the `.bin` file to the appliance UI screen either by dragging or
browsing to the file location.

Select an upgrade action from the bottom of the window:

-   The Upload and Install action loads the `.bin` file into CloudSystem
    and launches the upgrade process.

-   The Upload action loads the `.bin` file into CloudSystem, but does
    not launch the upgrade process. After the upload completes, click
    Install.

> **Tip**
>
> The UI disappears when the upgrade action restarts the Enterprise
> appliance. If the UI does not reappear after several minutes, click
> `F5` to refresh.

If the Enterprise upgrade fails, see ?.

If you are using **manual** assignment (not DHCP) for IP addresses or
want to change your default gateway on the Enterprise appliance, see ?

The recommended best practice for setting time synchronization between
the Foundation and Enterprise appliances is to use the Foundation base
appliance as the primary NTP server. The `ntp.conf` file contains time
synchronization settings for Enterprise. The upgrade process does not
change the `ntp.conf` file on the Enterprise appliance. You must
manually update the `ntp.conf` file.

Enable console access on the Enterprise appliance. The
`csadmin console-users` CLI commands are used to set the password and
enable console access for cloud administrator users.

See the appendix ? if you need console access instructions.

From the management hypervisor, open the Enterprise appliance console.

-   From vCenter Server, select the Enterprise appliance, then click the
    **Console** tab.

<!-- -->

-   Open a VNC viewer to the `Enterprise_IP_address:vncport`

Log in to the Enterprise appliance using the **cloudadmin** credentials.

Edit the `/etc/ntp.conf.enterprise` file to use the Foundation base
appliance FQDN or IP address for the NTP server.

Save the file.

To replace the `partner_ntp.conf` file with this revised file, run the
following command:

``` {#v28153601}
cp /etc/ntp.conf.enterprise /etc/partner_ntp.conf
```

Check the `/etc/ntp.conf` file and make sure it contains a line to
include the `/etc/partner_ntp.conf` file:

``` {#v28153604}
# File for including partners custom ntp configurations 
```

``` {#v28153605}
includefile /etc/partner_ntp.conf
```

To restart the `ntpd` service, run the following command:

``` {#v28153608}
service ntpd restart
```

### Verifying the upgrade

upgrade
verifying CloudSystem Enteprise upgrade
HP CloudSystem Enterprise
verifying an upgrade
Use the checklist provided below to verify that CloudSystem Enterprise
was successfully upgraded.

+--------+----------------+-----------------------------------------------------+
|        | CloudSystem    | Verify upgrade                                      |
|        | Enterprise     |                                                     |
|        | component      |                                                     |
+========+================+=====================================================+
|        | Enterprise     | 1.  Log in to the CloudSystem Console.              |
|        | appliance      |                                                     |
|        |                | 2.  Navigate to the Settings screen and click       |
|        |                |     Enterprise.                                     |
|        |                |                                                     |
|        |                | 3.  Click CloudSystem Enterprise and verify that    |
|        |                |     the version listed is 8.1.2.                    |
+--------+----------------+-----------------------------------------------------+

: CloudSystem Enterprise upgrade checklist

### Backing up the appliance after updating it

After updating your appliance to HP CloudSystem 8.1 U2, create a new
backup file. You must have a backup image of your current version of
CloudSystem. You cannot use an 8.1 backup image to restore an 8.1 U2
appliance.

See HP CloudSystem: Recommended Backup and Restore Procedures in the
Enterprise Information Library at
<http://www.hp.com/go/CloudSystem/docs>.

Troubleshooting installation issues
===================================

HP CloudSystem
troubleshooting installation
-   ?

-   ?

-   ?

-   ?

-   ?

> **Note**
>
> For additional troubleshooting information, see the
> **Troubleshooting** chapters in the HP CloudSystem 8.1 Administrator
> Guide, available at [Enterprise Information
> Library](http://www.hp.com/go/CloudSystem/docs).

Basic troubleshooting techniques
--------------------------------

troubleshooting
basic techniques
troubleshoot
basic techniques
HP CloudSystem has a variety of troubleshooting tools you can use to
resolve issues. By following a combined approach of examining screens
and logs, you can obtain a history of activity and the errors
encountered.

-   The Activity screen in the CloudSystem Console displays a log of all
    changes made on the appliance, whether user-initiated or
    appliance-initiated. It is similar to an audit log, but with finer
    detail and it is easier to access from the UI.

    The Activity screen also provides a log of health alerts and status
    notifications.

-   You can download an audit log in the CloudSystem Console to help you
    understand what security relevant actions took place on the system.

-   You can create a support dump file in the CloudSystem Console to
    gather logs and other information required for debugging into an
    encrypted, compressed file that you can send to your authorized
    support representative for analysis.

+----------------+-----------------------------------------------------------+
| Recommendation | Details                                                   |
+================+===========================================================+
| **Look for a   | -   The user interface checks for syntax when you enter a |
| message**      |     value. If you make a syntax error, an instructional   |
|                |     message appears next to the entry. The user interface |
|                |     or command line continues to display messages until   |
|                |     you enter the correct value.                          |
|                |                                                           |
|                | <!-- -->                                                  |
|                |                                                           |
|                | -   Before applying them, the appliance verifies key      |
|                |     network parameters like the IP address and the fully  |
|                |     qualified domain name (FQDN), to ensure that they     |
|                |     have the proper format.                               |
|                |                                                           |
|                | -   After network settings are applied, the appliance     |
|                |     performs additional validation, such as reachability  |
|                |     checks and host name to IP lookup. If a parameter is  |
|                |     incorrect, the appliance generates an alert that      |
|                |     describes validation errors for the Network Interface |
|                |     Card (NIC), and the connection between the browser    |
|                |     and the appliance can be lost.                        |
+----------------+-----------------------------------------------------------+
| **Examine the  | 1.  Locate recent activities with a severity of Critical, |
| Activity       |     Warning, or Unknown.                                  |
| screen**       |                                                           |
|                | 2.  Read the message for problem identification and       |
|                |     potential solutions.                                  |
|                |                                                           |
|                | 3.  Expand the activity to add notes to the activity      |
|                |     details.                                              |
+----------------+-----------------------------------------------------------+
| **Examine the  | 1.  From the local computer, use the `ping` command to    |
| appliance      |     determine if you can reach the appliance.             |
| virtual        |                                                           |
| machine**      |     -   If the `ping` command is successful, determine    |
|                |         that the browser settings, especially the proxy   |
|                |         server, are correct.                              |
|                |                                                           |
|                |         Consider bypassing the proxy server.              |
|                |                                                           |
|                |     -   If the `ping` command did not reach the           |
|                |         appliance, ensure that the appliance is connected |
|                |         to the network.                                   |
|                |                                                           |
|                | 2.  Log onto the hypervisor to verify that the hypervisor |
|                |     is running.                                           |
|                |                                                           |
|                | 3.  Verify that the virtual guest for the appliance is    |
|                |     operational.                                          |
|                |                                                           |
|                | 4.  Ensure that the VM host configuration is valid.       |
|                |                                                           |
|                |     Verify the accuracy of the IP address and other       |
|                |     network parameters for the VM host.                   |
|                |                                                           |
|                | 5.  From the management console, ensure that the          |
|                |     appliance network settings are accurate.              |
|                |                                                           |
|                | 6.  Examine the hypervisor performance data. If the       |
|                |     appliance is running at 100% utilization, restart the |
|                |     hypervisor.                                           |
+----------------+-----------------------------------------------------------+

: Troubleshooting recommendations

csstart errors
--------------

troubleshoot
csstart errors using ESXi environment
ESXi
troubleshooting installation
troubleshoot
csstart errors using KVM environment
KVM
troubleshooting installation
The log file is the best resource for identifying the type of error that
occurred. Check the deploy.log file first to narrow down error
possibilities. You can also review the problems and recommendations
listed below.

> **Important**
>
> Command line options passed to `csstart` always override the
> `deployer.conf` settings. For example, if you disable the security
> check in `deployer.conf` by setting **security-checking = disabled**
> but use the secure option when running `csstart`
> `(./csstart –auto-accept-cert)`, then SSL certificates are used and
> the `deployer.conf` file on the Foundation base appliance is updated
> to **security-checking = enabled**.

+------------------+---------------------------------------------------------+
| Symptom          | Possible cause and recommendation                       |
+==================+=========================================================+
| **`csstart `fail | 1.  Log in to vCenter Server.                           |
| s                |                                                         |
| to install       | 2.  Add the privilege for clone operations to the role  |
| CloudSystem      |     that is running `csstart`.                          |
| virtual          |                                                         |
| appliances in    |     This operation allows users to allocate space in    |
| vCenter Server   |     the datastore, create virtual machines, power up    |
| and you see the  |     and down virtual machines and delete virtual        |
| error message    |     machines on the management cluster.                 |
| `[Intlmpl-ESX] c |                                                         |
| loneFromTemplate | 3.  From the Host and Cluster view, select the          |
| ,                |     management cluster.                                 |
| com.vmware.vim25 |                                                         |
| .No Permission`* | 4.  Right-click the management cluster and select Add   |
| *                |     Permissions.                                        |
|                  |                                                         |
|                  |     The Assign Permissions window opens.                |
|                  |                                                         |
|                  | 5.  In the left pane, select the role that is           |
|                  |     running` csstart`.                                  |
|                  |                                                         |
|                  |     This is the role that receives the new permission.  |
|                  |                                                         |
|                  | 6.  In the right pane, scroll down to Virtual machine   |
|                  |     and expand Provisioning.                            |
|                  |                                                         |
|                  | 7.  Select the clone virtual machine permission.        |
|                  |                                                         |
|                  | 8.  Click OK to save the new permission for the role.   |
+------------------+---------------------------------------------------------+
| **Security check | 1.  Press CTRL-C to interrupt `csstart`.                |
| fails when       |                                                         |
| running          | 2.  Query the hypervisor where vCenter Server is        |
| `csstart `and    |     installed:                                          |
| you see the      |                                                         |
| message          |         # keytool –printcert –rfc –sslserver servername |
| `Warning: Differ | [:port]                                                 |
| ent certificates |                                                         |
|  are being used  | 3.  Copy everything from -----BEGIN CERTIFICATE-----    |
| for              |     to -----END CERTIFICATE----- into a new file.       |
| SSL and Solution |                                                         |
|  users. Manual i | 4.  Add a name to the file:                             |
| ntervention is r |                                                         |
| equired.`**      |         --os-cert option <filename>                     |
| **Security       |                                                         |
| checks fail when | 5.  Move the file to the same directory where `csstart` |
| running          |     is located.                                         |
| `csstart` and    |                                                         |
| you see the      | 6.  Retry the procedure ?.                              |
| message          |                                                         |
| `Using certifica |                                                         |
| te file:         |                                                         |
| No File Found Er |                                                         |
| ror: Failed to v |                                                         |
| alidate your vCe |                                                         |
| nter using ssl.` |                                                         |
| **               |                                                         |
+------------------+---------------------------------------------------------+
| **Security       | 1.  Use the Add CA Cert option in the vCenter Server    |
| checks fail      |     Registration screen to add the new SSL certificate. |
| because the SSL  |                                                         |
| certificate      | 2.  Retry the procedure ?.                              |
| expired or is    |                                                         |
| invalid due to a |                                                         |
| hypervisor host  |                                                         |
| name change**    |                                                         |
+------------------+---------------------------------------------------------+
| **You see the    | 1.  Generate a new certificate for vCenter Server.      |
| message          |                                                         |
| `Certificates do | 2.  Retry the procedure ?.                              |
|  not conform to  |                                                         |
| algorithm constr | <!-- -->                                                |
| aints`**         |                                                         |
|                  | 1.  Log on to the Foundation base appliance.            |
|                  |                                                         |
|                  | 2.  Open                                                |
|                  |     `/usr/lib/jvm/jre-1.7.0-openjdk.x86_64/lib/security |
|                  | /java.security`                                         |
|                  |                                                         |
|                  | 3.  Comment out the following line:                     |
|                  |                                                         |
|                  |          jdk.certpath.disabledAlgorithms=MD2, RSA keySi |
|                  | ze < 1024                                               |
|                  |                                                         |
|                  | > **Important**                                         |
|                  | >                                                       |
|                  | > Make sure that you understand the security            |
|                  | > implications of using shorter keys before you modify  |
|                  | > the java.security file.                               |
+------------------+---------------------------------------------------------+
| **The            | 1.  Delete the Foundation base appliance that was       |
| CloudSystem      |     created when you ran `csstart`.                     |
| virtual          |                                                         |
| appliance did    | 2.  Run `csstart` using the DHCP recommendations in ?.  |
| not respond to a |                                                         |
| network          |                                                         |
| request**        |                                                         |
+------------------+---------------------------------------------------------+

: ESXi troubleshooting tips

+------------------+---------------------------------------------------------+
| Symptom          | Possible cause and recommendation                       |
+==================+=========================================================+
| **RHEL default   | 1.  Find the driver and firmware here: [HP Support      |
| drivers are not  |     Center](http://h20566.www2.hp.com/portal/site/hpsc/ |
| able to manage   | template.PAGE/public/psi/swdDetails/?sp4ts.oid=5226971& |
| VLANs**          | spf_p.tpst=swdMain&spf_p.prp_swdMain=wsrp-navigationalS |
|                  | tate%3Didx%253D%257CswItem%253DMTX_549a762a22594c7eaa42 |
|                  | e95612%257CswEnvOID%253D4103%257CitemLocale%253D%257Csw |
|                  | Lang%253D%257Cmode%253D%257Caction%253DdriverDocument&j |
|                  | avax.portlet.begCacheTok=com.vignette.cachetoken&javax. |
|                  | portlet.endCacheTok=com.vignette.cachetoken).           |
|                  |                                                         |
|                  | 2.  Install the upgrade and retry the procedure ?.      |
+------------------+---------------------------------------------------------+
| **Security       | 1.  Log on to Foundation base appliance.                |
| checks fail when |                                                         |
| running          | 2.  Edit the `known_hosts` file with the SSH key value. |
| `csstart` and    |                                                         |
| you see the      | 3.  Run `csstart` again.                                |
| message          |                                                         |
| `Using certifica |                                                         |
| te file: No File |                                                         |
|  Found Error: Fa |                                                         |
| iled             |                                                         |
| to validate your |                                                         |
|  vCenter using s |                                                         |
| sl.`**           |                                                         |
+------------------+---------------------------------------------------------+
| **The            | 1.  Delete the Foundation base appliance that was       |
| CloudSystem      |     created when you ran `csstart`.                     |
| virtual          |                                                         |
| appliance did    | 2.  Run `csstart` using the DHCP recommendations in ?.  |
| not respond to a |                                                         |
| network          |                                                         |
| request**        |                                                         |
+------------------+---------------------------------------------------------+

: KVM troubleshooting tips

Cloud networking errors
-----------------------

troubleshoot
cloud networking errors
networks
troubleshooting
+------------------+---------------------------------------------------------+
| Symptom          | Possible cause and recommendation                       |
+==================+=========================================================+
| **You see the    | 1.  Generate a correct certificate for the vCenter      |
| error            |     Server.                                             |
| `Unable to apply |                                                         |
|  cloud network s |     The vCenter Server certificate must contain the     |
| ettings. Status  |     correct common name and subject alternative         |
| code:            |     names. Refer to the instructions provided in the    |
| 500. {"details": |     [VMware knowledge                                   |
| "VI SDK invoke ` |     base](http://kb.vmware.com/selfservice/microsites/m |
| `exception: java | icrosite.do) if                                         |
| x.net.ssl. SSL H |     you need more information on how to replace a       |
| andshake Excepti |     certificate in vCenter Server.                      |
| on:              |                                                         |
| java.security.ce |     If you are not able to generate a correct           |
| rt. Certificate  |     certificate, turn off security checking in          |
| Exception: ``No  |     `deployer.conf` by using the setting                |
| subject alternat |     `security-checking=disabled`.                       |
| ive names matchi |                                                         |
| ng IP address 16 |                                                         |
| .125.108.132     |                                                         |
| found", ``"error |                                                         |
| Source":null,    |                                                         |
| "nested Errors": |                                                         |
| [], "recommended |                                                         |
| Actions": ["Chec |                                                         |
| k                |                                                         |
| the support dump |                                                         |
|  for more inform |                                                         |
| ation."],``"erro |                                                         |
| r Code": null, " |                                                         |
| data": {},"messa |                                                         |
| ge":"Failed      |                                                         |
| to create the VM |                                                         |
| : Unable to dete |                                                         |
| rmine any availa |                                                         |
| ble cores on the |                                                         |
|  hypervisor."}`* |                                                         |
| *                |                                                         |
+------------------+---------------------------------------------------------+
| On the           | 1.  Retry the action by re-entering the Cloud           |
| SettingsEdit     |     Management Network settings and clicking OK again.  |
| Cloud Networking |     When you retry the configuration, the virtual       |
| screen in the    |     machines are removed and recreated. It is often     |
| CloudSystem      |     faster to create the virtual machines the second    |
| Console, **you   |     time because the images used to create the virtual  |
| see the message  |     machines may not need to be copied.                 |
| `Unable to setup |                                                         |
|  Cloud Managemen | 2.  If retrying right away does not work, wait until    |
| t network: Timed |     the hypervisor, storage system, and networks are    |
|  out             |     less busy, then retry again.                        |
| waiting for ...` |                                                         |
| **               | 3.  Ensure that your hardware meets the requirements    |
|                  |     specified in the HP CloudSystem 8.1 Installation    |
|                  |     and Configuration Guide.                            |
+------------------+---------------------------------------------------------+
| On the           | 1.  Log in to the vSphere Client hosting your vCenter   |
| SettingsEdit     |     Server.                                             |
| Cloud Networking |                                                         |
| screen in the    | 2.  Select InventoryHosts and Clusters and select your  |
| CloudSystem      |     management cluster.                                 |
| Console, **you   |                                                         |
| see the message  | 3.  Select the first template image.                    |
| `Process exited  |                                                         |
| with an error: 1 | 4.  Using the Edit settings, remove any networks from   |
|  (Exit value: 1) |     the image.                                          |
| `**              |                                                         |
|                  | 5.  Repeat step 4 for each template image.              |
|                  |                                                         |
|                  | 6.  In the CloudSystem Console, retry saving the Cloud  |
|                  |     Networking settings.                                |
+------------------+---------------------------------------------------------+

: Cloud networking troubleshooting tips

HP OO Studio installation errors
--------------------------------

troubleshoot
HP OO Studio installation
+-----------------+----------------------------------------------------------+
| Symptom         | Possible cause and recommendation                        |
+=================+==========================================================+
| **After         | 1.  Open OO Studio.                                      |
| installing OO   |                                                          |
| Studio, the     | 2.  Under Dependencies, click Import Content Pack.       |
| content packs   |                                                          |
| are not         | 3.  Select all the jar files extracted from **HP         |
| available**     |     CloudSystem OO Studio 8.1 – Jul 2014** and click     |
|                 |     Open.                                                |
|                 |                                                          |
|                 | 4.  Verify that the content packs display in the         |
|                 |     Dependencies section.                                |
+-----------------+----------------------------------------------------------+

Foundation upgrade errors
-------------------------

troubleshoot
CloudSystem Foundation upgrade
HP CloudSystem Foundation
troubleshooting upgrade
upgrade
troubleshooting CloudSystem Foundation
The table below contains errors that can occur during a Foundation
upgrade.

**Support dump details**: You can create a support dump from the csadmin
CLI, if you have it installed on your Windows or Linux server. It is
included in the **HP CloudSystem Tools 8.1 – Jul 2014** file. Once
`csadmin` is installed, there are two relevant commands:

-   `$csadmin appliance
    list`: lists the names of the available management virtual machines.
    This lets you find the appropriate appliance name.

-   `$csadmin appliance
    supportdump --va <appliance_name> --file <support_dump_filename>
    --os-username=<CloudSystem_Console_username> --os-password=<CloudSystem_Console_password>
    --os-auth-url=<http://<CloudSystem_appliance_IP_address>:5000/v2.0
    --os-cacert <mycert.cert>`: creates a dump of all relevant logs and
    stores it in the file on the local system where the command was
    initiated.

+-----------------+----------------------------------------------------------+
| Symptom         | Possible cause and recommendation                        |
+=================+==========================================================+
| **After an      | 1.  Reboot the Foundation base appliance using one of    |
| upgrade, some   |     the following methods, depending on your hypervisor  |
| integrated      |     type.                                                |
| tools           |                                                          |
| information and |     -   **ESXi**: Reboot the Foundation base and/or      |
| resources,      |         associated appliance by following instructions   |
| including       |         for rebooting virtual machines running on an     |
| instances and   |         ESXi cluster. See [VMware vSphere                |
| networks, are   |         documentation](http://www.vmware.com/support/pub |
| not available   | s/vsphere-esxi-vcenter-server-pubs.html).                |
| in the          |                                                          |
| CloudSystem     |     -   **KVM**: Log in to the management hypervisor on  |
| Portal**        |         which the Foundation base appliance is running   |
|                 |         and enter the commands:                          |
|                 |                                                          |
|                 |         `virsh                                           |
|                 |         destroy `                                        |
|                 |                                                          |
|                 |         `virsh start `                                   |
|                 |                                                          |
|                 | 2.  Verify upgrade success after the reboot.             |
|                 |                                                          |
|                 |     See ?.                                               |
+-----------------+----------------------------------------------------------+
| **Unable to     | 1.  Reboot the Foundation base appliance one or more     |
| access the      |     times until the boot order of the NICs is correct.   |
| Foundation base |                                                          |
| appliance using |                                                          |
| the Data Center |                                                          |
| Management      |                                                          |
| Network IP      |                                                          |
| address after   |                                                          |
| an upgrade**    |                                                          |
+-----------------+----------------------------------------------------------+

: Foundation troubleshooting tips

Enterprise upgrade errors
-------------------------

troubleshoot
CloudSystem Enterprise upgrade
HP CloudSystem Enterprise
troubleshooting upgrade
upgrade
troubleshooting CloudSystem Enterprise
The table below contains errors that can occur during an Enterprise
upgrade or when using the HP CSA management console.

**Support dump details**: You can create a support dump from the csadmin
CLI, if you have it installed on your Windows or Linux server. It is
included in the **HP CloudSystem Tools 8.1 – Jul 2014**. Once `csadmin`
is installed, there are two relevant commands:

-   `$csadmin appliance
    list`: lists the names of the available management virtual machines.
    This lets you find the appropriate appliance name.

-   `$csadmin appliance
    support-dump --va <appliance_name> --file <support_dump_filename>
    --os-username=<CloudSystem_Console_username> –-os-password=<CloudSystem_Console_password>
    --os-auth-url=<http://<CloudSystem_appliance_IP_address>:5000/v2.0
    --os-cacert <mycert.cert>`: creates a dump of all relevant logs and
    stores it in the file on the local system where the command was
    initiated.

+-----------------+----------------------------------------------------------+
| Symptom         | Possible cause and recommendation                        |
+=================+==========================================================+
| **The           | 1.  While the installation is in progress, keep your     |
| Enterprise      |     console session active.                              |
| installation    |                                                          |
| progress        |     -   Do not refresh the Enterprise screen.            |
| indicator is    |                                                          |
| not visible**   |     -   Do not log off the CloudSystem Console.          |
|                 |                                                          |
|                 |     > **Note**                                           |
|                 |     >                                                    |
|                 |     > While the installation is in progress, you can     |
|                 |     > navigate to other console screens and see the      |
|                 |     > progress indicator when you return to the          |
|                 |     > Enterprisescreen.                                  |
+-----------------+----------------------------------------------------------+
| **You see the   | 1.  For ESXi:                                            |
| message         |                                                          |
| `CloudSystem En |     -   Log in to vCenter Server and make sure the       |
| terprise instal |         `CS-Enterprise-8.1.2.0` OVA was converted to a   |
| lation failed`* |         template and saved in the datastore supporting   |
| *               |         the management cluster.                          |
|                 |                                                          |
|                 |     -   The image name must be `CS-Enterprise-8.1.2.0`.  |
|                 |                                                          |
|                 | 2.  For KVM:                                             |
|                 |                                                          |
|                 |     -   Log in to the management hypervisor and make     |
|                 |         sure the `CloudSystem-Enterprise-8.1.2.0` image  |
|                 |         is saved in `/CloudSystem/images`.               |
|                 |                                                          |
|                 | 3.  Complete the Enterprise installation procedure.      |
|                 |                                                          |
|                 |     See ?.                                               |
+-----------------+----------------------------------------------------------+
| **CloudSystem   | 1.  Log in to HP CSA.                                    |
| Enterprise      |                                                          |
| upgrade fails   | 2.  Review the topology design names and descriptions    |
| and you see the |     and shorten any that exceed 130 characters.          |
| message         |                                                          |
| `Error: /ci/etc | 3.  Retry the Enterprise upgrade.                        |
| /db-init.d/`    |                                                          |
| `87create_csa_r |     See ?.                                               |
| esource_`       |                                                          |
| `provider.sh fa |                                                          |
| iled on action  |                                                          |
| PostStart`**    |                                                          |
+-----------------+----------------------------------------------------------+
| **You see the   | 1.  Wait a few minutes. The Enterprise appliance is not  |
| message         |     ready.                                               |
| `CloudSystem En |                                                          |
| terprise instal | 2.  Retry the login action.                              |
| lation succeede |                                                          |
| d, but          |                                                          |
| could not start |                                                          |
|  up due to a co |                                                          |
| mmunication pro |                                                          |
| blem`**         |                                                          |
+-----------------+----------------------------------------------------------+
| **When logging  | 1.  Wait a few minutes. The Enterprise appliance is not  |
| in to HP CSA    |     ready and is still trying to bring up the HP CSA     |
| for the first   |     appliance or is still recovering from a reboot.      |
| time you see    |                                                          |
| the message     | 2.  Retry the login action.                              |
| `Default        |                                                          |
| organization no |                                                          |
| t found`**      |                                                          |
+-----------------+----------------------------------------------------------+
| **You cannot    | 1.  Switch to an appliance that is connected to the      |
| log in to the   |     Consumer Access Network.                             |
| MarketPlace     |                                                          |
| Portal**        | 2.  Retry the login action.                              |
+-----------------+----------------------------------------------------------+
| **In Enterprise | 1.  Do not change the time settings of the associated    |
| when you try to |     CloudSystem Foundation appliances using the vCenter  |
| create a        |     Server.                                              |
| design, images  |                                                          |
| and flavors are | 2.  Configure the Foundation appliance to synchronize    |
| not displayed   |     with either NTP servers or the VM host.              |
| and you see     |                                                          |
| `Connection err |     1.  On the CloudSystem Console Settings screen,      |
| or, status code |         click the Edit icon in the Appliance panel.      |
|  500`**         |                                                          |
|                 |     2.  In the Time and Language settings section,       |
|                 |         select the appropriate setting for your          |
|                 |         environment.                                     |
|                 |                                                          |
|                 | 3.  Configure the Enterprise appliance to synchronize    |
|                 |     with the Foundation base appliance.                  |
|                 |                                                          |
|                 |     Access the CloudSystem Enterprise appliance console  |
|                 |     from the management hypervisor console.              |
|                 |                                                          |
|                 |     1.  Edit the NTP configuration file by commenting    |
|                 |         out all time servers, then add a line for        |
|                 |         `/etc/partner_ntp.conf`:                         |
|                 |                                                          |
|                 |         `sudo vi/etc/ntp.conf`                           |
|                 |                                                          |
|                 |     2.  Modify `/etc/ntp.conf.enterprise` to point the   |
|                 |         server configuration to a resolvable IP address  |
|                 |         or FQDN for the Foundation base appliance.       |
|                 |                                                          |
|                 |         The default server line in `ntp.conf.enterprise` |
|                 |         is `serverisc.hpiscmgmt.local`. This must be     |
|                 |         updated to point to a real IP address or FQDN    |
|                 |         for the Foundation base appliance that can be    |
|                 |         reached from the Enterprise appliance.           |
|                 |                                                          |
|                 |     3.  Restart the NTP service:                         |
|                 |                                                          |
|                 |         `sudo service ntpd restart`                      |
|                 |                                                          |
|                 | 4.  Restart the Enterprise appliance using the ESXi      |
|                 |     hypervisor management software.                      |
|                 |                                                          |
|                 | When CloudSystem is installed on a **KVM** management    |
|                 | hypervisor:                                              |
|                 |                                                          |
|                 | 1.  Configure the Foundation appliance to synchronize    |
|                 |     with either NTP servers or the VM host.              |
|                 |                                                          |
|                 |     1.  On the CloudSystem Console Settings screen,      |
|                 |         click the Edit icon in the Appliance panel.      |
|                 |                                                          |
|                 |     2.  In the Time and Language settings section,       |
|                 |         select the appropriate setting for your          |
|                 |         environment.                                     |
|                 |                                                          |
|                 | 2.  Configure the Enterprise appliance to synchronize    |
|                 |     with the Foundation base appliance.                  |
|                 |                                                          |
|                 |     Access the CloudSystem Enterprise appliance console  |
|                 |     from the management hypervisor console.              |
|                 |                                                          |
|                 |     1.  Edit the NTP configuration file by commenting    |
|                 |         out all time servers, then add a line for        |
|                 |         `/etc/partner_ntp.conf`:                         |
|                 |                                                          |
|                 |         `sudo vi/etc/ntp.conf`                           |
|                 |                                                          |
|                 |     2.  Modify `/etc/ntp.conf.enterprise` to point the   |
|                 |         server configuration to a resolvable IP address  |
|                 |         or FQDN for the Foundation base appliance.       |
|                 |                                                          |
|                 |         The default server line in `ntp.conf.enterprise` |
|                 |         is `serverisc.hpiscmgmt.local`. This must be     |
|                 |         updated to point to a real IP address or FQDN    |
|                 |         for the Foundation base appliance that can be    |
|                 |         reached from the Enterprise appliance.           |
|                 |                                                          |
|                 |     3.  Restart the NTP service:                         |
|                 |                                                          |
|                 |         `sudo service ntpd restart`                      |
+-----------------+----------------------------------------------------------+

: Enterprise troubleshooting tips

Support and other resources
===========================

contacting HP
information to collect
> **Important**
>
> This product contains a technical feature that will allow an on-site
> authorized support representative to access your system, through the
> system console, to assess problems that you have reported. This access
> will be controlled by a password generated by HP that will only be
> provided to the authorized support representative. You can disable
> access at any time while the system is running.
>
> HP technical support personnel are not granted remote access to the
> appliance.

-   ?

-   ?

-   ?

-   ?

-   ?

Information to collect before contacting HP
-------------------------------------------

Be sure to have the following information available before you contact
HP:

-   Software product name

-   Hardware product model number

-   Operating system type and version

-   Applicable error message

-   Third-party hardware or software

-   Technical support registration number (if applicable)

How to contact HP
-----------------

-   To obtain HP contact information for any country, see the Contact HP
    worldwide website:

    <http://www.hp.com/go/assistance>

-   Use the **Get help from HP** link on the HP Support Center:

    <http://www.hp.com/go/hpsc>

-   To contact HP by telephone in the United States, use the Contact HP
    – Phone Assist website to determine the telephone number that
    precisely fits your needs. For continuous quality improvement,
    conversations might be recorded or monitored.

    <http://www8.hp.com/us/en/contact-hp/phone-assist.html#section1>

Registering for software technical support and update service
-------------------------------------------------------------

HP CloudSystem includes one year of 24 x 7 HP Software Technical Support
and Update Service. This service provides access to HP technical
resources for assistance in resolving software implementation or
operations problems.

The service also provides access to software updates and reference
manuals, either in electronic form or on physical media as they are made
available from HP. Customers who purchase an electronic license are
eligible for electronic updates only.

With this service, HP CloudSystem customers benefit from expedited
problem resolution as well as proactive notification and delivery of
software updates. For more information about this service, see the
following website:

<http://www.hp.com/services/insight>

Registration for this service takes place following online redemption of
the license certificate.

HP authorized resellers
-----------------------

For the name of the nearest HP authorized reseller, see the following
sources:

-   In the United States, see the U.S. HP partner and store locator
    website:

    <http://www.hp.com/service_locator>

-   In other locations, see the Contact HP worldwide website:

    <http://www.hp.com/go/assistance>

Documentation feedback
----------------------

To help us improve the documentation, send your suggestions and comments
to:

<docsfeedback@hp.com>

In your mail message, include the following information. They are
located on the front cover.

-   Document title

-   Published date

-   Edition number

Help us pinpoint your concern by posting the document title in the
Subject line of your mail message.

Related information
-------------------

Use this section to learn about available documentation for HP
CloudSystem components and related products.

### HP CloudSystem documents

The latest versions of HP CloudSystem manuals and white papers,
including HP CSA and HP Operations Orchestration, can be downloaded from
the Enterprise Information Library at
<http://www.hp.com/go/CloudSystem/docs>.

The full list of HP CSA documentation can be accessed from the HP Cloud
Service Automation tab in the [HP Helion
Documentation](https://docs.hpcloud.com/automation/) portal.

-   HP CloudSystem 8.1 Update 2 Release Notes

-   HP CloudSystem 8.1 Update 2 Installation and Configuration Guide

-   HP CloudSystem 8.1 Administrator Guide

-   HP CloudSystem Help

-   HP CloudSystem: Recommended Backup and Restore Procedures

Online help for the CloudSystem Console is available by clicking the
help control button in the Console user interface:
![](img/icon-help.jpg)

The help control button expands the help sidebar. Links in the sidebar
open UI screens for Recommended Tasks, help for the current screen (Help
on this page), and help for all tasks and procedures (Browse help).

### HP Insight Management documents

The latest versions of HP Matrix Operating Environment manuals, white
papers, and the HP Insight Management Support Matrix can be downloaded
from the HP Enterprise Information Library at
<http://www.hp.com/go/matrixoe/docs>, including the following documents:

-   HP Matrix Operating Environment Release Notes

-   HP Insight Management Support Matrix

-   HP Matrix Operating Environment Infrastructure Orchestration User
    Guide

-   Cloud bursting with HP CloudSystem Matrix infrastructure
    orchestration

### Third-party documents

CloudSystem incorporates OpenStack technology (listed below), and
interoperates with other third-party virtualization software.

-   *[OpenStack Documentation for Havana
    releases](http://docs.openstack.org/havana/)*

    With few exceptions (such as installation information), OpenStack
    documents are always set to display the current release stream on
    the OpenStack document web site. Check the OpenStack appendices in
    the HP CloudSystem Administrator Guide to learn about unsupported
    OpenStack functionality in this release.

    -   Cloud Administrator Guide

    -   Virtual Machine Image Guide

    -   API Quick Start

    -   Admin User Guide

    -   End User Guide

        -   Command reference

            -   Keystone commands

            -   Glance commands

            -   Neutron commands

            -   Nova commands

            -   Cinder commands

<!-- -->

-   [Red Hat Enterprise Linux 6
    documents](https://access.redhat.com/site/documentation/en-US/Red_Hat_Enterprise_Linux/6/index.html)

<!-- -->

-   [VMware vSphere
    documents](https://www.vmware.com/support/pubs/vsphere-esxi-vcenter-server-pubs.html)

### HP 3PAR StoreServ Storage documents

The latest versions of HP 3PAR StoreServ Storage manuals are available
from the Storage tab at the top of the [Enterprise Information
Library](http://www.hp.com/go/CloudSystem/docs).

HP 3PAR StoreServ Storage manuals can also be downloaded from the HP
Support Center, including the following documents:

-   HP 3PAR StoreServ Storage Concepts Guide

-   HP 3PAR StoreServ Storage Troubleshooting Guide

### HP ProLiant servers documents

-   The HP Integrated Lights-Out QuickSpecs contain support information
    and are available from the iLO product website:

    [<http://h18004.www1.hp.com/products/quickspecs/12362_div/12362_div.PDF>](http://h18004.www1.hp.com/products/quickspecs/12362_div/12362_div.PDF)

-   HP ProLiant servers:

    -   ProLiant BL BladeSystem servers:

        <http://www.hp.com/go/blades>

    -   ProLiant DL, ML, and SL servers:

        <http://www8.hp.com/us/en/products/servers/proliant-servers.html>

Enabling console access
=======================

Foundation base appliance
enabling console access
Enterprise appliance
enabling console access
To access the Foundation base appliance console or Enterprise console,
you must set a password and then enable console access.

The `csadmin console-users` CLI commands are used to set the password
and enable console access for cloud administrator users.

On a Windows or Linux system where `csadmin` is run, open a command
shell.

On the `csadmin` command line, enter the following command to set the
password for the cloud administrator user (`cloudadmin`):

    csadmin console-users set-password --password <password> --vm-name <VM_name> --os-username <CloudSystem_Console_username> --os-password <CloudSystem_Console_password> --os-auth-url http://<CloudSystem_appliance_IP_address>:5000/v2.0 --os-cacert <mycert.cert>

-   `<password>`–Password for `cloudadmin` on the specified appliance.

    The password should have a capital letter and a number. You should
    have a minimum of 8 characters, maximum of 40 characters. It must
    not contain any of the following characters: less than (\<), greater
    than (\>), semicolon (;), comma (,), double-quotation mark ("),
    apostrophe ('), ampersand (&), backslash (\\), slash (/), vertical
    bar (|), plus sign (+), colon (:), equal sign (=), and space.

-   `<VM
    name>`–Name of the CloudSystem appliance to be accessed by the cloud
    administrator user from a hypervisor console. This name is set in
    `csstart` or in the Foundation console during first time setup.

**Example**

``` {#v28002396}
csadmin console-users set-password --vm-name esx_iscapp01 --password mypassword --os-username administrator --os-password myospassword --os-auth-url http://<CloudSystem_appliance_IP_address>:5000/v2.0 --os-cacert <mycert.cert>
```

On the `csadmin` command line, enter the following command to enable
console access for the cloud administrator user (`cloudadmin`):

``` {#v28406387}
csadmin console-users enable --vm-name  <VM name>  --os-username <administrator> --os-password <password> --os-auth-url http://<CloudSystem_appliance_IP_address>:5000/v2.0 --os-cacert <mycert.cert>
```

`<VM name>`—Name of the CloudSystem appliance to be accessed by the
cloud administrator user from a hypervisor console. This name is set in
`csstart` or in the CloudSystem Console during first time setup.

**Example**

    csadmin console-users enable --vm-name esx_iscapp01 --os-username adminuser --os-password adminpassword --os-auth-url http://<CloudSystem_appliance_IP_address>:5000/v2.0 --os-cacert <mycert.cert>

For additional information on supported console operations for the
`cloudadmin` user, refer to the “Supported console operations on the
CloudSystem appliances” appendix in the HP CloudSystem 8.1 Administrator
Guide at the [Enterprise Information
Library](http://www.hp.com/go/CloudSystem/docs).

Command line interfaces
=======================

CLIs
about
Four command line interfaces (CLIs) are packaged in the CloudSystem
release download.

-   **csstart.exe**: provides command line access to run CloudSystem
    installation commands.

-   **csadmin.exe**: provides command line access to run CloudSystem
    administrative commands.

-   **CS-client-CLI-8.1.2.0.msi**: provides the ability to run
    CloudSystem and OpenStack command lines from a Windows command
    prompt.

-   **CS-client-CLI-8.1.2.0.rpm**: provides the ability to run
    CloudSystem and OpenStack command lines from a Linux system.

Preparing to use CLIs
---------------------

The CLIs are packaged in the **HP CloudSystem-Tools-8.1.2.0 – Dec 2014**
release file. The `csstart` and `csadmin` CLIs do not require additional
installation steps.

The OpenStack CLIs must be installed on either a Windows or Linux
workstation.

### Installing OpenStack CLIs on Windows

CLIs
installing OpenStack CLIs on Windows
**Prerequisite.**

-   If using an ESXi management hypervisor, the
    `CS-client-CLI-8.1.2.0.rpm` file is in the cluster datastore.

-   If using a KVM management hypervisor, the
    `CS-client-CLI-8.1.2.0.msi` is in the /CloudSystem directory.

From a Windows workstation, double-click the MSI file to execute it and
launch the Windows installer.

Follow the Windows installer screen instructions to complete the
installation.

The executable is installed in
`c:\Program Files\Hewlett-Packard\RemoteCli`.

Open the Windows command prompt and execute the CLI.

**See also**

-   For a list of unsupported OpenStack Havana CLI commands, see the
    Limitations on support for the OpenStack API and CLI appendix in the
    HP CloudSystem 8.1 Administrator Guide at [Enterprise Information
    Library](http://www.hp.com/go/CloudSystem/docs).

-   For a list of all OpenStack Havana CLI commands, see *[OpenStack
    Documentation for Havana
    releases](http://docs.openstack.org/havana/)*.

### Installing OpenStack CLIs on Linux

CLIs
installing OpenStack CLIs on Linux
**Prerequisite.**

-   If using an ESX management hypervisor, the
    `CS-client-CLI-8.1.2.0.rpm` file is in the cluster datastore.

-   If using a KVM management hypervisor, the
    `CS-client-CLI-8.1.2.0.msi` is in the /CloudSystem directory.

From a Linux workstation run:

    yum install CS–client–CLI–8.1.2.0.rpm

The executable is installed under `/usr/bin`.

Open an SSH client and execute the CLI.

**See also**

-   For a list of unsupported OpenStack Havana CLI commands, see the
    Limitations on support for the OpenStack API and CLI appendix in the
    HP CloudSystem 8.1 Administrator Guide at [Enterprise Information
    Library](http://www.hp.com/go/CloudSystem/docs).

-   For a list of all OpenStack Havana CLI commands, see *[OpenStack
    Documentation for Havana
    releases](http://docs.openstack.org/havana/)*.

Using CLI commands
------------------

CLIs
commands
### csstart commands

+----------------+---------------------+---------------------+---------------------+
| Task           | CLI command         | Example             | What it does        |
+================+=====================+=====================+=====================+
| View the EULA  | `save-eula`         |     csstart save-eu | This command saves  |
| before         |                     | la                  | a copy of the EULA  |
| accepting it   |                     |                     | to your local       |
|                |                     |                     | directory. Search   |
|                |                     |                     | for **eula.html**.  |
|                |                     |                     | You can open the    |
|                |                     |                     | file and read the   |
|                |                     |                     | EULA before         |
|                |                     |                     | accepting it.       |
+----------------+---------------------+---------------------+---------------------+
| Create a       | `create-config [--c |     csstart create- | This command        |
| sample         | onfig]`             | config              | creates the         |
| configuration  |                     |                     | configuration file. |
| file           |                     |                     | The default name is |
|                |                     |                     | **deployer.conf**.  |
|                |                     |                     | The `[--config]`    |
|                |                     |                     | flag allows you to  |
|                |                     |                     | create a unique     |
|                |                     |                     | name for the file,  |
|                |                     |                     | if you don’t want   |
|                |                     |                     | to use the default  |
|                |                     |                     | name.               |
+----------------+---------------------+---------------------+---------------------+
| Verify         | `verify-only [--con |     csstart verify- | This command        |
| deployer.conf  | fig]`               | only                | verifies the        |
| file before an |                     |                     | deployer.conf file  |
| upgrade        |                     |                     | before you load the |
|                |                     |                     | changes to the      |
|                |                     |                     | Foundation base     |
|                |                     |                     | appliance. This     |
|                |                     |                     | command is used     |
|                |                     |                     | during the upgrade  |
|                |                     |                     | process.            |
+----------------+---------------------+---------------------+---------------------+
| Secure start   | `start [--config] - |     csstart start - | This command must   |
| of `csstart `  | -os-cacert --eula-a | -eula-accepted      | be run from the CLI |
|                | ccepted`            |                     | and is not          |
|                |                     |                     | supported when      |
|                |                     |                     | using the `csstart` |
|                |                     |                     | setup assistant. It |
|                |                     |                     | starts the          |
|                |                     |                     | Foundation base     |
|                |                     |                     | appliance virtual   |
|                |                     |                     | machine and checks  |
|                |                     |                     | the vCenter         |
|                |                     |                     | certificate (ESXi)  |
|                |                     |                     | or SSH key (KVM)    |
|                |                     |                     | before creating the |
|                |                     |                     | base appliance.     |
|                |                     |                     | Certificates and    |
|                |                     |                     | keys are also       |
|                |                     |                     | checked before      |
|                |                     |                     | starting the other  |
|                |                     |                     | virtual appliances. |
|                |                     |                     | The `[--config]`    |
|                |                     |                     | flag allows you to  |
|                |                     |                     | specify a           |
|                |                     |                     | configuration file, |
|                |                     |                     | if you didn’t use   |
|                |                     |                     | the default         |
|                |                     |                     | deployer.conf name. |
|                |                     |                     |                     |
|                |                     |                     | The `--os-cacert`   |
|                |                     |                     | flag identifies the |
|                |                     |                     | file used to verify |
|                |                     |                     | the certificate or  |
|                |                     |                     | key.                |
|                |                     |                     |                     |
|                |                     |                     | The EULA is         |
|                |                     |                     | automatically       |
|                |                     |                     | accepted.           |
|                |                     |                     |                     |
|                |                     |                     | See ? for           |
|                |                     |                     | instructions on     |
|                |                     |                     | pointing to the     |
|                |                     |                     | certificate.        |
|                |                     |                     |                     |
|                |                     |                     | See ? for           |
|                |                     |                     | instructions on     |
|                |                     |                     | pointing to the SSH |
|                |                     |                     | key.                |
+----------------+---------------------+---------------------+---------------------+
| Semi-secure    | `start [--config] - |     csstart start - | Automatically       |
| start of       | -auto-accept-cert   | -auto-accept-cert - | accepts the vCenter |
| `csstart`      | --eula-accepted`    | -eula-accepted      | Server certificate  |
|                |                     |                     | (ESXi) or SSH key   |
|                |                     |                     | (KVM) and uses it   |
|                |                     |                     | to verify           |
|                |                     |                     | additional virtual  |
|                |                     |                     | appliances started  |
|                |                     |                     | by the Foundation   |
|                |                     |                     | base appliance.     |
|                |                     |                     | The `[--config]`    |
|                |                     |                     | flag identifies the |
|                |                     |                     | configuration file  |
|                |                     |                     | if you chose not to |
|                |                     |                     | use the default     |
|                |                     |                     | deployer.conf file  |
|                |                     |                     | name.               |
|                |                     |                     |                     |
|                |                     |                     | The EULA is         |
|                |                     |                     | automatically       |
|                |                     |                     | accepted.           |
+----------------+---------------------+---------------------+---------------------+
| Insecure start | `start [--config] - |     csstart start - | Starts the          |
| of `csstart`   | -insecure --eula-ac | -insecure --eula-ac | Foundation base     |
|                | cepted`             | cepted              | appliance without   |
|                |                     |                     | checking the        |
|                |                     |                     | vCenter certificate |
|                |                     |                     | (ESXi) or SSH key   |
|                |                     |                     | (KVM) before        |
|                |                     |                     | creating the base   |
|                |                     |                     | appliance. Virtual  |
|                |                     |                     | appliances are also |
|                |                     |                     | started without     |
|                |                     |                     | certificate checks. |
|                |                     |                     | The `[--config]`    |
|                |                     |                     | flag identifies the |
|                |                     |                     | configuration file  |
|                |                     |                     | if you chose not to |
|                |                     |                     | use the default     |
|                |                     |                     | deployer.conf file  |
|                |                     |                     | name.               |
|                |                     |                     |                     |
|                |                     |                     | The EULA is         |
|                |                     |                     | automatically       |
|                |                     |                     | accepted.           |
+----------------+---------------------+---------------------+---------------------+
| Start a web    | `gui [--listen  --p |     csstart gui [-- | The `ipaddr:port`   |
| server         | ort ]`              | listen 127.0.0.1 -- | defaults to         |
| listening on a |                     | port 5000]          | 127.0.0.1:5000      |
| specific port  |                     |                     | which means the     |
|                |                     |                     | webs server only    |
|                |                     |                     | listens to a web    |
|                |                     |                     | browser running on  |
|                |                     |                     | the local host. A   |
|                |                     |                     | very common value   |
|                |                     |                     | for the listen flag |
|                |                     |                     | is                  |
|                |                     |                     | `--listen 0.0.0.0 - |
|                |                     |                     | -port 5000`.        |
|                |                     |                     | The web server      |
|                |                     |                     | listens for         |
|                |                     |                     | connections from    |
|                |                     |                     | any host, such as   |
|                |                     |                     | your workstation.   |
+----------------+---------------------+---------------------+---------------------+

: csstart commands

### csadmin CLI and OpenStack CLI

CLIs
csadmin
CLIs
OpenStack
For an explanation of csadmin CLI commands, see the Working with the
csadmin CLI appendix in the HP CloudSystem 8.1 Administrator Guide at
[Enterprise Information Library](http://www.hp.com/go/CloudSystem/docs).

For a list of all OpenStack Havana CLI commands, see *[OpenStack
Documentation for Havana releases](http://docs.openstack.org/havana/)*.

Additional CLI tasks
--------------------

-   ?

-   ?

-   ?

### Using the csstart CLI to install the Foundation base appliance

Foundation base appliance
installing with csstart CLI
Log in to the management hypervisor.

Run the command to create the **deployer.conf** configuration file:

``` {#v27151702}
./csstart create-config
```

This will create a sample configuration file. The default name is
**deployer.conf**, but you can specify a unique name by putting it
inside the `[--config]` tag.

Open the config file:

`vi deployer.conf`

Fill in the Hypervisor section of the configuration file. The hints
provided in the configuration file explain the hypervisor entries.

Fill in the Image file location section of the configuration file.

-   If you created the `/CloudSystem/images` directory and placed images
    there, then enter **default**for each image location. The
    configuration file hints show each default location.

-   If you created a different directory, then enter the actual path to
    the image location. Example:
    `/CloudSystem/templates/CS-SDN-8.1.2.0.qcow2`

Fill in the Appliance Setup section of the configuration file.

-   Enter a new administrator password to use when accessing the
    CloudSystem Console.

-   Enter a support access option.**Enabled** allows HP support to
    access your system in the event of an error. **Disabled** will not
    allow access.

-   Enter the amount of space to allocate to the Glance disk, in GBs.

-   Enter the level of security checks you want performed when
    installing CloudSystem and when new virtual appliances are created.

Add the network configuration to the Network Mapping section. The
information below corresponds to the sample provided in the network
infrastructure section.

> **Important**
>
> The following information must match exactly the configuration you
> created in the network infrastructure section. See, ?. You may alter
> this information to fit your specific configuration needs as long as
> it corresponds to the setup you performed previously.

> **Note**
>
> Delete any trailing spaces after bridge names. The bridge names should
> not contain any white space.

    [Access Network]
    foundation_hostname = [hostname of the foundation appliance 
    on the Consumer Access Network
    ]
    enterprise_hostname = [hostname of the enterprise appliance 
    on the Consumer Access Network
    ]
    type = [static or DHCP]
    foundation_ip = [IP address of the foundation appliance 
    on the Consumer Access Network
    ]
    enterprise_ip = [IP address of the enterprise appliance 
    on the Consumer Access Network
    ]
    gateway = [Enter this only once; either on 
    Data Center Management Network or this network]
    netmask = [Enter the subnet mask for static configurations]
    bridge=”br-consumer-access”

    [Data Center Management Network]
    foundation_hostname = [hostname of the foundation appliance 
    on the Data Center Management Network
    ]
    enterprise_hostname = [hostname of the enterprise appliance 
    on the Data Center Management Network
    ]
    type = [static or DHCP]
    foundation_ip = [IP address of the foundation appliance 
    on the Data Center Management Network
    ]
    enterprise_ip = [IP address of the enterprise appliance 
    on the Data Center Management Network
    ]
    gateway = [Enter this only once; either on 
    Consumer Access Network or this network]
    netmask = [Enter the subnet mask for static configurations]
    bridge=”br-dc-mgmt”

    [Cloud Management Network]
    bridge=”br-cloud-mgmt”

    [Cloud Data Trunk]
    bridge=”br-cloud-trunk”

    [External Network]
    bridge=”br-external”

Save and close the configuration file:

`:wq`

Run the script to create the Foundation base appliance:

``` {#v27151723}
./csstart start --[type of security] --eula-accepted
```

See ? for details on the secure, semi-secure or insecure mode for
csstart.

> **Note**
>
> You can modify the above command if you want to generate a log file,
> which is helpful in the event of an error. Use
> `./csstart start —v --log-file
> <name of log file>`.

Verify that the Foundation base appliance was created on the management
hypervisor.

The SDN appliance and network node appliances are created later after
entering Cloud Networking settings in the CloudSystem Console.

> **Important**
>
> Do not move or delete images after you create the Foundation base
> appliance. In order to speed up virtual machine boot times and save
> disk space, `csstart` does not make a full copy of the image. A copy
> is shared across all of the virtual machines.

**See** ?.

**Next step:**?

### Enabling REST API for storage drivers

storage
enabling REST APIs
This is a condensed version of the OpenStack instructions. You can see
the complete instructions here: [Enabling the HP 3PAR Fibre Channel and
iSCSI
Drivers](http://docs.openstack.org/trunk/config-reference/content/enable-hp-3par-fibre-channel.html)

**Prerequisites.**

-   **HP3PARFCDriver** is installed with OpenStack software

-   **HP3PARISCSIDriver** is installed with OpenStack software

Verify that the HP 3PAR WebServices API server is enabled and running on
the HP 3PAR StoreServ storage system.

Using administrator credentials, log on to the HP 3PAR StoreServ storage
system:

    #ssh 3parad@<HP EPAR IP Address>

Check the current state of the WebServices API server:

    #showwsapi

If the WebService API server is disabled, then start it:

    #startwsapi

If the HTTP or HTTPS state is disabled, enable one of them:

    #setwsapi —http enable

    #setwsapi —https enable

> **Note**
>
> If you need a list of WebService API commands, type` setwsapi —h`. A
> list of Web Service commands will display.

### Using the CLI to access the Enterprise console

HP CloudSystem Enterprise
using the CLI to access the console
When Enterprise is installed in a KVM management environment, you can
log in to the Enterprise appliance and view configuration files and
network properties using the following commands:

-   `virsh list` displays all virtual machines

-   `virsh console <enterprise_VM_name>` with cloudadmin credentials
    gives you access to the Enterprise appliance

-   `ifconfig` shows all interfaces created for appliance

-   `Ctrl ^ ]` exits the Enterprise console

Adding a root certificate to the Foundation base appliance
==========================================================

Foundation base appliance
root certificate
certificates
adding a root certificate
You can add a root CA certificate to the Foundation base appliance to
establish the basis for a trust relationship in a certificate authority
hierarchy.

On a Windows or Linux system where `csadmin` is installed, open your
browser.

Enter the URL of the CloudSystem Console. You do not need to log in to
the console.

Click the padlock icon in the beginning of the URL field.

A dialog box stating that the identity of the URL is not verified
appears with the Connections tab selected.

Click the Certificate information link.

The Certificate dialog opens.

Select the Certification Path tab.

Select the root of the certificate path.

> **Note**
>
> You must select the root of the certificate path rather than the
> hostname of your base appliance. The root path is listed above the
> hostname of your base appliance.

Click View Certificate.

Another Certificate dialog opens.

Select the Details tab.

Click Copy to File....

The Certificate Export Wizard dialog opens.

Select Base-64 encoded X.509 (.CER) as the file export format.

Enter, or browse to, the file name where you want to save the
certificate.

Click Next, and then click Finish.

Close the certificate dialogs.

Open a command window and navigate to the directory where you saved the
certificate.

Enter a `csadmin` command with the `–-os-cacert <cert>` argument, where
`<cert>` is the name of your certificate file. For example:

``` {#v28393882}
csadmin appliance list --os-cacert mycert.cer
```

Setting static routes for manual assignment and changing the default gateway
============================================================================

Foundation base appliance
default gateway
static IP addresses
setting routes
This appendix provides instructions for

-   ?

-   ?

-   ?

-   ?

> **Important**
>
> The Foundation and Enterprise appliances must use the same network for
> the default gateway. If you change the default gateway in Foundation,
> make sure to update the default gateway in Enterprise as well.
>
> Static routes cannot be configured on the default gateway.

Foundation: Changing the default gateway
----------------------------------------

The default gateway is defined in `csstart` when installing the
Foundation base appliance. You can set the default gateway on one
network; either the Data Center Management Network or the Consumer
Access Network.

-   Configure the default gateway on the Consumer Access Network when
    most of the traffic is from cloud users.

-   Configure the default gateway on the Data Center Management Network
    when most of the traffic is from cloud administrators.

Best practice is to set the default gateway on the Consumer Access
Network.

**Prerequisites.**

-   The Data Center Management Network is already defined as the default
    gateway.

This procedure follows the best practice of configuring the default
gateway on the Consumer Access Network. If you are not following the
best practice recommendation, substitute your network information in
each step.

Log in to the CloudSystem Console.

Navigate to the Settings screen.

From the Appliance pane, click Edit.

The Edit Appliance screen opens.

Remove the default gateway from the Data Center Management Network.

From the Appliance pane, click Edit.

The Edit Appliance screen opens.

Click the arrow next to **1** to expand the fields for the Data Center
Management Network.

Scroll down to the **IPv4** section and remove the default gateway
address.

Click OK to save the changes.

Add the default gateway to the Consumer Access Network.

From the Appliance pane, click Edit.

The Edit Appliance screen opens.

Click the arrow next to**3** to expand the fields for the Consumer
Access Network.

Scroll to the **IPv4** section.

Enter the default gateway address on the Consumer Access Network.

Click OK to save the changes.

Edit the network configuration files on the appliance.

Enable console access on the Foundation base appliance. The
`csadmin console-users` CLI commands are used to set the password and
enable console access for cloud administrator users.

See ? if you need console access instructions.

From the management hypervisor, open the Foundation base appliance
console.

-   From vCenter Server, select the Foundation base appliance, then
    click the **Console** tab.

<!-- -->

-   Open a VNC viewer to the `Foundation_IP_address:vncport`

Log in to the Foundation base appliance using the **cloudadmin**
credentials.

Switch to the root (super) user:

``` {#v29448461}
sudo su
```

Enter the cloudadmin password.

Make sure the default gateway in `/etc/sysconfig/network` is set to the
Consumer Access Network.

    GATEWAY=[IP_address_on_Consumer_Access_Network]

**Example:**

``` {#v29448466}
GATEWAY=143.0.0.1
```

Enterprise and Foundation must have the default gateway configured on
the same network, which is NOT the same network you are using to assign
static routes.

Change directory to `/etc/sysconfig/network-scripts`.

Open the `ifcfg-eth0` file and set **DEFROUTE=’no’**, then save and
close the file.

This removes the default gateway identifier from the Data Center
Management Network.

Open the `ifcfg-eth6` file and set **DEFROUTE=’yes’**, then save and
close the file.

This adds the default gateway identifier to the Consumer Access Network.

Open the `route-eth0` file and remove the default gateway information.

During installation, a `route-eth0` file is created if the default
gateway was set on the Data Center Management Network. You should delete
the information in this file.

Save and close the file.

Reboot the appliance to apply the changes.

``` {#v29448483}
shutdown –r now
```

Enterprise: Changing the default gateway
----------------------------------------

The default gateway is defined in `csstart` when installing the
Foundation base appliance. You can only set the default gateway on one
network; either the Data Center Management Network or the Consumer
Access Network.

-   Configure the default gateway on the Consumer Access Network when
    most of the traffic is from cloud users.

-   Configure the default gateway on the Data Center Management Network
    when most of the traffic is from cloud administrators.

Best practice is to set the default gateway on the Consumer Access
Network. The default gateway must be on the same network in both
Foundation and Enterprise.

**Prerequisites.**

-   The Data Center Management Network is already defined as the default
    gateway (but you want to change this).

This procedure follows the best practice of configuring the default
gateway on the Consumer Access Network. If you are not following the
best practice recommendation, substitute your network information in
each step.

From the management hypervisor, open the Enterprise appliance console.

The `csadmin console-users` CLI commands are used to set the password
and enable console access for cloud administrator users. See ? if you
need console access instructions.

-   From vCenter Server, select the Enterprise appliance, then click the
    **Console** tab.

<!-- -->

-   Open a VNC viewer to the `Enterprise_IP_address:vncport`

Log in to the Enterprise appliance using the **cloudadmin** credentials.

Switch to the root (super) user:

``` {#v29448510}
sudo su
```

Enter the cloudadmin password.

Change the default gateway in `/etc/sysconfig/network` then save the
changes:

    GATEWAY=[IP_address_on_Consumer_Access_Network]

**Example using Consumer Access Network:**

``` {#v29448515}
GATEWAY=143.0.0.1
```

Enterprise and Foundation must have the default gateway configured on
the same network, which is NOT the same network you are using to assign
static routes.

Remove the original default gateway:

``` {#v29448519}
route delete -net default
```

Add the new default gateway:

``` {#v29448522}
route add –net default gw [IP_address_on_Consumer_Access_Network] dev [eth_of_network]
```

**Example on Consumer Access Network**

``` {#v29448524}
route add –net default gw 143.0.0.1 dev eth6
```

Change directory to `/etc/sysconfig/network-scripts`.

Open the `ifcfg-eth0` file and set **DEFROUTE=’no’**, then save and
close the file.

This removes the default gateway identifier from the Data Center
Management Network.

Open the `ifcfg-eth6` file and set **DEFROUTE=’yes’**, then save and
close the file.

This adds the default gateway identifier to the Consumer Access Network.

Open the `route-eth0` file and remove the default gateway information.

During installation, a `route-eth0` file is created if the default
gateway was set on the Data Center Management Network. You should delete
the information in this file.

If you see an empty `route-eth0` file, save and close the file.

Reboot the appliance to apply the changes.

``` {#v29448545}
shutdown –r now
```

Foundation: Setting static routes for manual IP addresses
---------------------------------------------------------

You can set static routes on either the Consumer Access Network or the
Data Center Management Network. There are two options:

-   Define static routes on the Data Center Management Network (default
    gateway is on Consumer Access Network)

    The Data Center Management Network is an administrative network,
    which is easier to manage and gives you better control over IP
    addresses. HP recommends this option.

-   Define static routes on the Consumer Access Network (default gateway
    is on the Data Center Management Network)

    The Consumer Access Network is open to all cloud users so
    controlling address assignment is more difficult.

**Prerequisites.**

-   Foundation and Enterprise have the default gateway set on the
    Consumer Access Network

    You cannot set static routes on the same network that contains the
    default gateway. To change the default gateway, see ?.

-   An External Network is configured.

This procedure follows the best practice of identifying static routes on
the Data Center Management Network. If you are not following this
recommendation, substitute your network information in each step.

From the management hypervisor, open the Foundation appliance console.

The `csadmin console-users` CLI commands are used to set the password
and enable console access for cloud administrator users. See ? if you
need console access instructions.

-   From vCenter Server, select the Foundation appliance, then click the
    **Console** tab.

<!-- -->

-   Open a VNC viewer to the `Foundation_IP_address:vncport`

Log in to the Foundation appliance using the **cloudadmin** credentials.

Switch to the root (super) user:

``` {#v29448332}
sudo su
```

Enter the cloudadmin password.

Navigate to `/etc/sysconfig/network-scripts` and create a new
`route-eth0` file (or edit the existing file) with the following line:

``` {#v29448336}
[netmask_of_external_network] via [gateway_on_Data_Center_Management_Network] dev eth0
```

**Example:**

``` {#v29448338}
10.0.0.1/24 via 192.0.4.1 dev eth0
```

This file identifies the External Network netmask and gateway to use
when creating routes for IP addresses. Multiple static routes can be
identified.

Save and close the file.

Make sure the default gateway in `/etc/sysconfig/network` is set to the
Consumer Access Network.

    GATEWAY=[IP_address_on_Consumer_Access_Network]

**Example:**

``` {#v29448345}
GATEWAY=143.0.0.1
```

Enterprise and Foundation must have the default gateway configured on
the same network, which is NOT the same network you are using to assign
static routes. If you need to change the default gateway, see ?.

Add static routes to the Data Center Management Network:

``` {#v29448350}
route add –net [netmask_of_external_network] gw [Data_Center_Management_Network] dev eth0
```

**Example:**

    route add –net 10.0.0.1/24 gw 192.0.4.1 dev eth0

Reboot the appliance to apply the changes.

``` {#v29448354}
shutdown –r now
```

Enterprise: Setting static routes for manual IP addresses
---------------------------------------------------------

Enterprise uses the same network settings that were defined when the
Foundation base appliance was installed with `csstart`. If you are using
manual assignment for IP addresses, then configure the static routes on
the same network used by Foundation for static routes.

Best practice is to use the Data Center Management Network for static
routes (on Foundation and Enterprise).

**Prerequisites.**

-   Foundation and Enterprise have the default gateway set on the
    Consumer Access Network.

    You cannot set static routes on the same network that contains the
    default gateway. To change the default gateway, see ?.

-   An External Network is configured.

This procedure follows the best practice of identifying static routes on
the Data Center Management Network. If you are not following the best
practice recommendation, substitute your network information in each
step.

From the management hypervisor, open the Enterprise appliance console.

The `csadmin console-users` CLI commands are used to set the password
and enable console access for cloud administrator users. See ? if you
need console access instructions.

-   From vCenter Server, select the Enterprise appliance, then click the
    **Console** tab.

<!-- -->

-   Open a VNC viewer to the `Enterprise_IP_address:vncport`

Log in to the Enterprise appliance using the **cloudadmin** credentials.

Switch to the root (super) user:

``` {#v29448377}
sudo su
```

Enter the cloudadmin password.

Navigate to `/etc/sysconfig/network-scripts` and create a new
`route-eth0` file (or edit the existing file) with the following line:

``` {#v29448381}
[netmask_for_external_network] via [gateway_on_Data_Center_Management_Network] dev eth0
```

**Example:**

``` {#v29448383}
10.0.0.1/24 via 192.0.4.1 dev eth0
```

This file identifies the External Network netmask and gateway to use
when creating routes for IP addresses. Multiple static routes can be
identified.

Save and close the file.

Make sure the default gateway in `/etc/sysconfig/network` is set to the
Consumer Access Network.

    GATEWAY=[IP_address_on_Consumer_Access_Network]

**Example:**

``` {#v29448390}
GATEWAY=143.0.0.1
```

Enterprise and Foundation must have the default gateway configured on
the same network, which is NOT the same network you are using to assign
static routes. If you need to change the default gateway, see ?.

Add static routes to the Data Center Management Network:

``` {#v29448395}
route add –net [netmask_of_external_network] gw [Data_Center_Management_Network] dev eth0
```

**Example:**

    route add –net 10.0.0.1/24 gw 192.0.4.1 dev eth0

Reboot the appliance to apply the changes.

``` {#v29448399}
shutdown –r now
```

Configuring additional providers for CloudSystem Enterprise
===========================================================

HP CloudSystem Enterprise
configuring additional providers
HP Cloud Service Automation (HP CSA) is the administrative portal for
the Enterprise appliance.

When Enterprise is installed, an HP CS Foundation provider is already
configured. This provider allows Enterprise to provision instances in
Foundation via the Topology Designer. If you want to use a different
provider with the Topology Designer, refer to the HP CSA documentation
at [Enterprise Information
Library](http://www.hp.com/go/CloudSystem/docs) for configuration
details.

If you plan to use the Sequential Designer to create service designs,
you must configure HP Operations Orchestration and HP CSA to support
Sequential Designer.

An optional Matrix OE provider can also be configured.

Use the procedures in this appendix to configure HP OO and HP CSA to
support Sequential Designer and create the optional Matrix OE provider.

-   ?

-   ?

-   ?

-   ?

You can find a list of related HP CSA documentation in the [Enterprise
Information Library](http://www.hp.com/go/CloudSystem/docs).

Configuring HP Operations Orchestration to integrate with HP CSA
----------------------------------------------------------------

OO Central is part of the CloudSystem Foundation base appliance. You can
configure OO Central to integrate with HP CSA. The required
configuration steps are listed below.

-   ?

-   ?

-   ?

> **Note**
>
> In the following instructions, `$CSA_HOME` is the directory where HP
> CSA resides. In Enterprise, `$CSA_HOME = /ci/usr/local/hp/csa/`.
>
> In CloudSystem, SSL is already configured between HP CSA and OO
> Central.

The internal user configures OO Central for HP CSA and imports the OO
flows. When importing flows, this user is configured in the OO input
file used by the process definition tool.

Log in to OO Central (`https://<cs_foundation_ip_or_hostname>/oo`).

Select System Configuration.

The System Configuration screen displays.

Select SecurityInternal Users.

Click Add.

In the User Name field, type:

    csaoouser

In the Password field, type:

    cloud

In the Roles field, type:

    ADMINISTRATOR, SYSTEM_ADMIN

Click Save.

Log out of OO Central and log back in as the internal user `csaoouser`.

Add or edit the following system accounts to support the HP CSA content
pack.

> **Note**
>
> Some content packs do not include configured system accounts and
> system properties. If system accounts and properties do not appear in
> the Configuration Items list, add the account or property by clicking
> the + button, then configure it with the information below. For more
> information, see “Setting Up System Accounts for a Content Pack” in
> the HP Operations Orchestration Central User Guide at [Enterprise
> Information Library](http://www.hp.com/go/CloudSystem/docs).

From Content Management in OO Central, select Configuration Items System
Accounts.

In the System Account Name field, select `CSA_REST_CREDENTIALS` and edit
the following fields:

In the User Name field, type:

    ooInboundUser

> **Note**
>
> The User Name configured for the CSA\_REST\_CREDENTIALS System Account
> setting must match the Override Value configured for the CSA\_OO\_USER
> System Property setting.

In the Password field type:

``` {#v27783727}
cloud
```

Click Save.

In the System Account Name field, select
`CSA_SERVICEMANAGER_CREDENTIALS` and edit the following fields:

In the User Name field, type:

    falcon

Leave the Password field blank.

Click Save.

From Content Management in OO Central, select Configuration Items System
Properties.

Select `CSA_REST_URI` and edit the following field:

In the Override Value field, type
`https://ENTERPRISE_APPLIANCE_IPADDRESS_OR_FQDN/csa/rest`.

Click Save.

Importing Operations Orchestration flows
----------------------------------------

OO flows are imported to HP CSA with the Process Definition Tool. This
tool creates an HP CSA process definition for every imported OO flow.
The process definitions are associated with a process engine, which
corresponds to the OO system containing the imported flows. HP CSA uses
the flows to perform lifecycle actions and submit delegated approvals.

-   ?

-   ?

-   ?

> **Tip**
>
> HP recommends that you generate sample database properties files and
> an input file. Use the following steps to create these files.

Log in to the Enterprise appliance console as `cloudadmin`.

See the Working with csadmin CLI appendix in the HP CloudSystem 8.1
Administrator Guide at [Enterprise Information
Library](http://www.hp.com/go/CloudSystem/docs).

Switch to the root user (`sudo su`).

Navigate to the `$CSA_HOME/Tools` (`/ci/usr/local/hp/csa/Tools`)
directory.

Run the command:

    /ci/usr/local/hp/csa/openjre/bin/java
     -jar ProcessDefinitionTool/process-defn-tool.jar -g

As the root user in the Enterprise appliance console, navigate to the
`$CSA_HOME/Tools` (`/ci/usr/local/hp/csa/Tools`) directory.

In the working directory, make a copy of the `PostgreSql` sample
database properties file, and rename the copy to `db.properties`:

    cp PostgreSqlInputSample.properties db.properties

Edit the `db.properties` file and make the following name changes:

-   Change `db.url=jdbc:postgresql://127.0.0.1:5432/csadb` to
    `db.url=jdbc:postgresql://127.0.0.1:5432/csa`

-   Change `db.user=csadbuser` to `db.user=csa`

-   Change `db.password=ENC(UUV/PSwS9If1NURGsObYPQ==)` to
    `db.password=csa`

Save and close the file.

This procedure uses the sample files that were generated when you
performed the tip above. If you did not follow the tip instructions,
complete them now.

As the root user in the Enterprise appliance console, navigate to the
`$CSA_HOME/Tools` (`/ci/usr/local/hp/csa/Tools`) directory.

Make a copy of the sample input file `HPOOInputSample.xml` and rename it
to `HPOOInfoInput.xml:`

    cp HPOOInputSample.xml HPOOInfoInput.xml

Update the following attributes and values **for all three** `ooengine`
entries in the `HPOOInfoInput.xml` file:

-   `truststore="/ci/usr/local/hp/csa/openjre/lib/security/cacerts”`

-   `uri=”https://<foundation_ipaddress_or_hostname>/PAS/services/WSCentralService”`

-   `username="csaoouser”`

-   `password="cloud”`

-   `truststorePassword=“changeit”`

Save and close the file.

> **Note**
>
> You must validate the input and make sure the changes were saved
> successfully. To verify, point a supported web browser to the URL
> shown above (step 2, bullet 2) and confirm that it receives a response
> indicating that a SOAP service is running.

Execute the following commands as a **root** user from the Enterprise
appliance to run the process definition tool:

-   `cd /ci/usr/local/hp/csa/Tools/ProcessDefinitionTool`

-   `/ci/usr/local/hp/csa/openjre/bin/java
    -jar process-defn-tool.jar -d ../db.properties -i ../HPOOInfoInput.xml`

> **Note**
>
> For additional information about the process definition tool, see HP
> Cloud Service Automation – Process Definition Tool in the [Enterprise
> Information Library](http://www.hp.com/go/CloudSystem/docs).

Importing a service design
--------------------------

HP CSA
importing a service design
Use the Cloud Service Management Console to import a service design.

Copy all content in the `CSA_HOME/CSAKit-4.1/Content
Archives` folder from the Enterprise appliance to a staging server.

Log in to the Enterprise appliance console as `cloudadmin`.

See the Working with csadmin CLI appendix in the HP CloudSystem 8.1
Administrator Guide at [Enterprise Information
Library](http://www.hp.com/go/CloudSystem/docs).

Copy the `CSA_HOME/CSAKit-4.1/Content Archives` folder to an external
device. From there it can be imported to HP CSA.

Run the following copy command:

    cd /ci/usr/local/hp/csa/CSAKit-4.1
    scp —r Content\ Archives/ user@destination:<file_path>

> **Note**
>
> In Linux commands, an escape character is needed after “Content” since
> blank spaces are not supported.

From the CloudSystem Console, select Enterprise.

From the Tools pane, select Cloud Service Management Console.

Navigate to Designs SequencedDesigner to import designs for Sequential
Designer OR DesignsTopology Designer to import designs for Topology
Designer.

Select Import and browse to the folder you copied in step 1.

Click Import.

> **Note**
>
> For additional information about HP CSA service designs, see HP Cloud
> Service Automation – Integration Pack in the [Enterprise Information
> Library](http://www.hp.com/go/CloudSystem/docs).

Configuring a Matrix OE resource provider
-----------------------------------------

HP Matrix OE
configuring a resource provider
After importing a service design to Enterprise, you are ready to
configure additional providers, such as Matrix OE.

Use the HP CSA documentation to help you complete the following steps:

-   Define additional resource providers.

-   Associate resource offerings (like the ones imported in the previous
    section) to the appropriate provider (Matrix OE resource offerings
    with Matrix OE resource providers).

> **Note**
>
> Supported versions of HP Matrix OE include 7.3.0 and 7.3.2.

Refer to “*HP CloudSystem Enterprise: Managing Matrix services from
CloudSystem Enterprise*” in the [Enterprise Information
Library](http://www.hp.com/go/CloudSystem/docs).

Managing the HP OO database
===========================

HP OO
resizing the database
HP OO
resetting database purge parameters
The default settings for the automatic HP OO database purge process are
defined below. You can change these settings by editing the parameters
listed in the `etc/cron.daily/purge-oo-history` file.

> **Note**
>
> The HP OO database size is 20 GB if you performed a fresh installation
> of CloudSystem 8.1 U2. If you performed an upgrade, you will need to
> increase the size of the virtual machine hosting the Foundation base
> appliance to 250 GB and increase the OO database size to 20 GB.
> Contact HP Support for assistance with these changes. See ?.

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Parameter                      Definition                                                                  Default setting               Additional values
  ------------------------------ --------------------------------------------------------------------------- ----------------------------- --------------------------------------------------------------------------
  pPurgeExecutionsOlderThan      The number of days to keep history.                                         No default setting.           This is a required parameter.

  pPurgeExecutionsinBatchesOf    The maximum number of flows to handle at one time.                          10000                         The minimum value is 500. You can specify a value between 500 and 10000.

  pShouldPurgeExecutionSummary   Determines if the OO\_EXECUTION\_SUMMARY table should be purged.            1 (yes)                       0 (no)

  pVerbose                       Determines the amount of output to generate.                                1 (medium amount of output)   0 (no output)
                                                                                                                                           2 (extended amount of output details)
                                                                                                                                           

  pStopPurgingProcessAfter       The maximum amount of time that the automatic purge procedure should run.   4 hours                       
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  : Default database purge settings

From the hypervisor console underlying the Foundation appliance, access
the appliance console and log in as `cloudadmin`. See ?.

Switch to the root user:

`sudo su`

Change the settings in the file.

Save and close the file.

You can use the following procedure to increase the HP OO database size
from 20 GB to 40 GB.

Log in to the Foundation base appliance console as root.

Identify the free space on the system using the command:

`#
vgdisplay`

Free space is displayed as the value of “Free PE/Size”

To increase the lv\_db partition from 20 GB to 40 GB, run each of the
following commands. Make sure you have more than 90 GB of free space
before running these commands.

    /ci/bin/cic-run-level filesys
    lvextend -L+20G /dev/vg01/lv_db_rep
    drbdsetup resize /dev/drbd2 --assume-peer-has-space
    drbdadm resize cic
    xfs_growfs /var/lib/pgsql/9.2
    /ci/bin/cic-run-level normal

**Sample output:**

    [root@ci-525400C8725B ~]# /ci/bin/cic-run-level filesys
    Waiting for DB and /ci/data file systems to be mounted...
    Waiting for DB to be stopped....
    Run level changed to filesys
    [root@ci-525400C8725B ~]# lvextend -L+20G /dev/vg01/lv_db_rep
      Extending logical volume lv_db_rep to 40.00 GiB
      Logical volume lv_db_rep successfully resized
    [root@ci-525400C8725B ~]# drbdsetup resize /dev/drbd2 --assume-peer-has-space
    [root@ci-525400C8725B ~]# drbdadm resize cic
    [root@ci-525400C8725B ~]# xfs_growfs /var/lib/pgsql/9.2
    meta-data=/dev/drbd2             isize=256    agcount=8, agsize=1310678 blks
             =                       sectsz=512   attr=2, projid32bit=0
    data     =                       bsize=4096   blocks=10485424, imaxpct=25
             =                       sunit=0      swidth=0 blks
    naming   =version 2              bsize=4096   ascii-ci=0
    log      =internal               bsize=4096   blocks=2560, version=2
             =                       sectsz=512   sunit=0 blks, lazy-count=1
    realtime =none                   extsz=4096   blocks=0, rtextents=0
    data blocks changed from 10485424 to 15728136
    [root@ci-525400C8725B ~]# /ci/bin/cic-run-level normal
    Waiting for CIC start-stop service to start...
    Waiting for all CIC services to start...
    Waiting for webapps to start...  [#############################################]  done
    Run level changed to normal

Configuring a large-scale CloudSystem deployment
================================================

HP CloudSystem
configuring a large-scale deployment
In a large-scale deployment, CloudSystem Foundation can manage over
4,000 virtual machine instances. To support this type of deployment, HP
recommends that you update the maximum heap size parameter of the
`jetty-Atlas` Java web server on the Foundation base appliance.

The best practice is to perform the procedure in this section **after**
the Foundation base appliance is successfully deployed using `cssstart`,
and **before** CloudSystem is made available for use by end users.

See also “Working with the csadmin CLI” in the HP CloudSystem 8.1
Administrator Guide at [Enterprise Information
Library](http://www.hp.com/go/CloudSystem/docs).

**Prerequisites.**

-   Minimum required privileges: Infrastructure administrator

-   The `csadmin` CLI package is installed on the CloudSystem Foundation
    base appliance.

From the `csadmin` CLI, enable the cloudadmin user access on the
Foundation base appliance.

Open the VNC Console terminal window to the Foundation base appliance.

Log in as the `cloudadmin` user.

Change the maximum heap size for the `jetty-Atlas` Java web server from
`–Xmx512m` to `–Xmx750m`.

Example:

    [cloudadmin@Basehost ~]$ sudo vi /ci/etc/jvm.d/jetty-Atlas
    [cloudadmin@Basehost ~]$ cat /ci/etc/jvm.d/jetty-Atlas
    -Xss256k
    -Xms256m
    -Xmx750m
    -XX:PermSize=128m
    -XX:ReservedCodeCacheSize=32m
    -XX:+UseCompressedOops

    -verbose:gc
    -XX:+PrintGCDetails
    -Xloggc:/ci/jetty-Atlas/logs/gc.log
    -XX:+UseGCLogFileRotation
    -XX:NumberOfGCLogFiles=2
    -XX:GCLogFileSize=1m

Save the changes.

Restart the `jetty-Atlas` Java web server:

``` {#v27199275}
[cloudadmin@Basehost ~]$ sudo crm resource restart JettyAtlas
```

Turn off `AdaptiveSizePolicy` by adding a new line to `Jetty-AtlasTRM`:

``` {#v28541808}
[cloudadmin@Basehost ~]$ cat Jetty-AtlasTRM
-XX:-UseAdaptiveSizePolicy
```

**Example**

    [cloudadmin@Basehost ~]$ cat jetty-AtlasTRM
    -Xss256k
    -Xmx1280m
    -XX:PermSize=300m
    -XX:ReservedCodeCacheSize=32m
    -XX:+UseCompressedOops
    -XX:-UseAdaptiveSizePolicy

Save the changes.

Restart the webapps:

``` {#v28541814}
/ci/bin/cic-initialize-cluster restart
```
