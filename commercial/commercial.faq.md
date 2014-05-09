---
layout: default
title: "HP Helion OpenStack: FAQs"
permalink: /cloudos/commercial/faqs/
product: commercial

---

<p style="font-size: small;"> <a href="/cloudos/commercial/">&#9664; PREV</a> | <a href="/cloudos/commercial/">&#9650; UP</a> | <a href="/cloudos/commercial/">NEXT &#9654;</a> </p>

<h1>HP OpenStack&#174; commercial: Frequently Asked Questions</h1> 

Welcome! You've got questions. We have answers.  

##Understanding the HP Helion OpenStack  

* [What is the HP Helion OpenStack?](#Whatisthecommercial)
* [How is HP Helion OpenStack different from other OpenStack-based clouds?](#Howdifferent)
* [What are the key features and components in the HP Helion OpenStack?](#Keycomponents)
* [How do I benefit from using the HP Helion OpenStack?](#Benefitscommercial)
* [Where can I see a list of use cases supported by the HP Helion OpenStack?](#usecases)
* [Is the HP Helion OpenStack secure?](#Commuinitysecure)
* [How do I get started with the HP Helion OpenStack?](#GetStarted) 
* [Where can I deploy the HP Helion OpenStack?](#WhereDeploy)
* [Is the HP Helion OpenStack integrated with other HP Cloud products and solutions?](#IntegratedwithOtherProducts)
* [What OpenStack components are supported in the HP Helion OpenStack?](#SupportedComponents)
* [How much does the HP Helion OpenStack cost?](#commercialcost) 
* [Will the HP Helion OpenStack work with hybrid or public cloud projects?](#hybridorpubliccloud) 
* [Does the HP Helion OpenStack come with any images?](#ComeWithImages) 
* [How many nodes does the HP Helion OpenStack support?](#Howmanynodes) 
* [Will the HP Helion OpenStack work with hybrid or public cloud projects](#WorkWithHybrid)
* [How many virtual machines does the HP Helion OpenStack support?](#Howmanyvirtualmachines)
* [Is the HP Helion OpenStack?  What if I want to grow my cloud beyond 30 nodes and 600 VMs?](#commercialScalable)
* [Does the HP Helion OpenStack include an operating system (OS)?](#includeOS)
* [Does the distro distribution include non-OpenStack tools?](#distrodistribution) 
* [Does this distro include the OpenStack ICEHOUSE release?](#OpenStackICEHOUSE)

##Installing and Configuring the HP Helion OpenStack 

### Getting Started  
* [What are the prerequisites for installing and configuring the HP Helion OpenStack?](#prerequisites)
* [How do I install the HP Helion OpenStack, and what’s included?](#HowdoIinstall)
* [What are the minimum and maximum number of configurations allowed?](#minimumandmaximumconfigs)
* [How do I install and set up the HP Helion OpenStack Admin Node](#installandsetup)
* [I’ve installed the HP Helion OpenStack. Now what?](#NowWhat)
* [What is TripleO?](#WhatisTripleO)
* [How long does it take to complete the installation and configuration of the HP Helion OpenStack?](#Howlonginstallation)
* [Should I reboot after installation?](#rebootafterinstallation)

### Setting up the seed cloud 
* [What is a seed?](#Whatisseed)
* [How do I create a VM for the Seed Cloud based on the CloudOS specifications?](#createVM) 
* [How do I load a under cloud image into the seed cloud?](#imageseedcloud) 
* [How do I log into the seed cloud and deploy the undercloud?](#deployUC) 

### Setting up the undercloud and overcloud
* [What is an undercloud?](#Whatisundercloud)
* [What is an overcloud?](#Whatisovercloud) 
* [How do I set up the disk configurations of the undercloud and overcloud servers?](#UCOCservers) 
* [How do I configure the physical network connecting the undercloud and overcloud servers?](#physicalnetwork) 
* [How do I install the overcloud?](#installOC) 
* [How do I verify the functionality of the overcloud?](#verifyOC) 
* [How do I deploy a software update to the overcloud?](#updateOC)
* [How do I add a compute node to the overcloud?](#computenode)  
 
### Checking configuration status 
* [How do I verify that the configuration has succeeded?](verifyconfigsucceed) 
* [Should I reboot after configuring the HP Helion OpenStack?](#rebootafterconfig)
* [How do I launch the HP Helion OpenStack Dashboard?](#launchtheDashboard)
* [What are the key actions I can perform within the Dashboard?](#DashboardActions) 
* [How do I shut down and restart the HP Helion OpenStack?](#ShutdownRestart)

## Managing the overcloud

### Getting started with overcloud
* [What are the identity operations (Keystone) that I need to perform?]()
* [What are the compute operations (Nova) I need to perform?]()  

### Managing the overcloud: Users 
* [How do I create a VM?](#createVM)
* [How do I create a VM that boots from a volume?]() 
* [How do I reboot a VM?]() 
* [How do I rebuild a VM?]() 
* [How do I start a VM?]()
* [How do I stop a VM?]() 
* [How do I create a snapshot of a VM?]()
* [How do I rescue a VM?]() 
* [How do I unrescue a VM?]()
* [How do I delete a VM?]() 
* [How do I attach a volume to or from a VM?]() 
* [How do I detach a volume to or from a VM?]() 
* [How do I get the console log of a VM?]() 
* [How do I get the VNC connection to a VM?]() 
* [How do I create a security group?]()
* [How do I edit or delete security group?]()
* [How do I create a key pair?]()
* [How do I edit or delete a key pair?]()
* [How do I associate or disassociated a floating IP address?]() 

### Managing the overcloud: Administrators 
* [How do I create a flavor?]()
* [How do I edit or delete a flavor?]()
* [How do I modify the ACL of a flavor?]()
* [How do I modify the quota of a project?]()
* [How do I modify the quota of a user within a project?]()
* [How do I create an availability zone?]()  
* [How do I edit or delete an availability zone?]() 
* [How do I create an aggregate?]() 
* [How do I edit or delete an aggregate?]() 
* [How do I enable or disable a service?]() 
* [How do I lock or unlock a VM?]() 
* [How do I pause or unpause a VM?]()
* [How do I suspend or Resume a VM?]()<b><font color="red">(Is this a different use case from the one above?)</font>

## Managing the network operations
* [How do i create a network?]()
* [How do I edit or delete a network?]()
* [How do I add a router?]()
* [How do I edit or delete a router?]() 
* [How do I add subnet to a network?]() 
* [How do I remove a subnet from a network?]()
* [How do I add a network to a router?]()
* [How do I remove a network from a router?]()
* [How do I add an external network to a router?]()
* [How do I remove an external network from a router?]()
* [How do I create a port on a network?]() 
* [How do I edit or delete a port on a network?]() 
* [How do I allocate a floating IP address?]() 
* [How do I deallocate a floating IP address?]()
* [How do I associate a floating IP address to a Fixed IP address?]()
* [How do I disassociate a floating IP address from a Fixed IP address?]()
* [How do i create a security group?]() 
* [How do i edit or delete a security group?]() 
* [How do I create a security group rule?]()
* [How do I edit or delete a security group rule?]()  

### Managing the network operations: Administrators 
* [How do create an external network?]()
* [How do I edit the quota values of a project?]()
* [How do I add a network to a DHCP agent?]() 
* [How do I remove a network from a DHCP agent?]() 
* [How do I add a router to a L3 agent?]() 
* [How do I remove a router from a L3 agent?]() 

## Managing Collections and Reports 

### Managing Collections 
* [How do I record metering data?]()
* [How do I create an alarm?]()
* [How do I edit or delete an alarm?]() 
* [How do I record alarm change?]()
* [How do I record a metering event?]() 
* [How do I clear expired metering data?]() 

### Managing Reports 
* [What types of measurements do I have access to?]()
* [Where can I get usage data for a specific meter?]()
* [Where can I find the computed statistics for a sample within a specific time range?]()
* [Where can I access a list of resources?]() 
* [Where can I find the resource details?]()
* [Where can I see the API capabilities supported by the current driver?]() 
* [How can I filter and view alarms?]()
* [Where can I find the details on a specific alarm?]()
* [Where can I Get the history of a specific alarm?]() 
* [Where can I find alarm status?]()  

## Managing Image Operations

### Managing Image operations: Users
* [How do I create a private image?]()
* [How to I edit or delete a private image?]()
* [How do I add or update metadata for a private image?]()   

### Managing Image operations: Administrators 
* [How do I create a public image?]()
* [How do I edit or delete a public image?]()
* [How do I add or update metadata for a public image?]()

## Managing Volume Operations (Cinder)

### Managing Volume Operations: Users
* [How do I create a volume?]()
* [How do I delete a volume?]()
* [How do I create a bootable volume from an image in glance?]()
* [How do I create a snapshot of a volume?]() 
* [How do I delete a snapshot of a volume?]()
* [How do I create a backup of a volume in swift?]()
* [How do I delete a backup of a volume in swift?]()
* [How do I create a volume from a backup in swift?]()
* [How do I update the metadata of a volume?]() 
* [How do I create an image in glance from a volume?]() 
* [How do I rename a volume?]()
* [How do I extend a volume?]()
* [How do I transfer a volume between users?]()
 
### Managing Volume Operations: Administrators 
* [How do I modify the quota values of a project?]()
* [How do I enable or disable a service?]()

## Managing Object operations (swift)

### Managing Object operations:Users
* [How do I create a container?]()
* [How do I edit or delete a container?]()
* [How do I upload files into a container?]()
* [How do I download files from a container?]() 
* [How do I delete files in a container?]()

##Upgrading the HP Helion OpenStack 

* [How can I update the HP Cloud software?](#updatesoftware)
* [What will future releases of HP Helion OpenStack include?](#FutureReleases)
* [Where can I access release notes?](#ReleaseNotes) 

##Support and Troubleshooting  

* [I'm stuck. Where can I get more help?](#gethelp) 
* [Are HP support services included?](#supportservices)
* [Where can I go to find more information?](#moreinformation)
* [How can I contact HP Cloud Customer Support?](contactcs) 

## Understanding the HP Helion OpenStack 

####What is the HP Helion OpenStack? #### {#Whatisthecommercial}

The HP Helion OpenStack is the ideal launch pad for your small-scale open cloud environment or proof-of-concept cloud services. It’s a pure, free-to-license OpenStack distribution that provides a common architecture across private, public, and hybrid clouds.

It addresses enterprise confidence and consistency with:

* Enterprise-grade reliability that offers resiliency, high availability, scalability, security, and support
* Simple, fast creation of cloud environwhatments and applications to speed business value
* Manageability that keeps the cloud up while keeping down administrative time and costs

It addresses open source/OpenStack choice with:

* Workload flexibility to enable the design and provisioning of multi-tier infrastructure services to run across multiple cloud delivery models – private, managed, public – depending on capacity, cost, or capability requirements
* No vendor lock in with open, non-proprietary cloud architecture that enables innovation and cost control

####How is HP Helion OpenStack different from other OpenStack-based clouds? #### {#Howdifferent}

####What are the key features and components in the HP Helion OpenStack? #### {#Keycomponents}

####How do I benefit from using the HP Helion OpenStack? #### {#Benefitscommercial}

**Choice: Open, standards-based, and extensible to enable hybrid cloud delivery**

* An OpenStack distro that’s free to license and download which you can try without risk.  
* HP Helion OpenStack is a pure distribution leveraging commercial standards with no mix of proprietary or non-OpenStack tools
* It leverages the latest commercial innovations with close to trunk releases to ensure you are always using the most up-to-date code
* Released under open source license for true open source value proposition HP is a top contributor to OpenStack providing continued hardening and innovation

**Consistency: Speeds cloud service delivery**

* Simple installation and configuration process: from 1,200+ manual configurations to a few automated steps
* accelerates time to value: 
* Supports POC and small scale production: up to 30 nodes and 600 VMs, 
* Accelerate the move to large, enterprise grade production with a workload upgrade to HP OpenStack Enterprise

**Confidence: Enterprise-grade reliability that simplifies management**

* Simplifies management with automated-live distribution of updates 
* Offers a simplified admin user console
* Paid support options available
* Includes integrated HP Linux host OS for better speed, support and control across full solution stack (for compute and controller node hypervisors)

####Where can I see a list of use cases supported by the HP Helion OpenStack? #### {#usecases} 

####Is the HP Helion OpenStack secure? #### {#Commuinitysecure}

####How do I get started with the HP Helion OpenStack? #### {GetStarted} 

####Where can I deploy the HP Helion OpenStack? {WhereDeploy}

####Is the HP Helion OpenStack integrated with other HP cloud products and solutions? #### {#IntegratedwithOtherProducts}
Yes. These products will reference “Powered by HP OpenStack.”

####What OpenStack components are supported in the HP Helion OpenStack? #### {#SupportedComponents}

####How much does the Edition HP Helion OpenStack cost? #### {#commercialcost}
It is completely free to license and download.

####Will the HP Helion OpenStack work with hybrid or public cloud projects? #### {#hybridorpubliccloud}
No. HP Helion OpenStack is tested and supported by HP for enterprise-grade, small-scale, private cloud deployments.

####Does the HP Helion OpenStack come with any images? #### {#ComeWithImages} 

####How many nodes does the HP Helion OpenStack support? #### {#Howmanynodes}

####Will the HP Helion OpenStack work with hybrid or public cloud projects? #### {#WorkWithHybrid} 

####How many virtual machines does the HP Helion OpenStack support? #### {#Howmanyvirtualmachines}
The HP Helion OpenStack supports up to 600 virtual machines.

####Is the HP Helion OpenStack scalable?  What if I want to grow my cloud beyond 30 nodes and 600 VMs? #### {#commercialScalable}

####Does the HP Helion OpenStack include an operating system (OS)? #### {#includeOS}
Yes. It includes an integrated HP Linux host OS for better speed, support, and control across the full solution stack (for compute and controller node hypervisors).

####Does the distro distribution include non-OpenStack tools? #### {#distrodistribution}
No. The HP Helion OpenStack is a pure distro that leverages OpenStack commercial standards with no mix of proprietary or non-OpenStack tools.

####Does this distro include the OpenStack ICEHOUSE release? #### {#OpenStackICEHOUSE}
Yes, and HP is one of the first vendors to release a supported, productized distro for ICEHOUSE.

##Installing and Configuring the HP Helion OpenStack

###Getting Started 

####What are the prerequisites for installing and configuring the HP Helion OpenStack? #### {#prerequisites}

HP Helion OpenStack is installed using TripleO, which uses three linked installation phases to deploy a complete OpenStack cloud. 

**Hardware Requirements**

TripleO creates several large VMs as part of the demo deployment process, hence it is essential to use a system that meets the following hardware specification:

* At least 16GB of RAM
* At least 200GB of available disk space
* Virtualization support, enabled in the BIOS

**Software System Preparation**

1. Ubuntu 13.10 host operating system installed. Other host OSes may work but have not been tested.
Note that this demo will not currently install into a virtual machine.
2. The following packages must be installed:
$ sudo apt-get install -y libvirt-bin openvswitch-switch openvswitch-common pythonlibvirt
qemu-system-x86 qemu-kvm
3. If you’ve just installed the libvirt packages above, you will need to restart libvirt:
$ sudo /etc/init.d/libvirt-bin restart
4. Ensure that the root user has a public key. Login as root:
$ sudo su -<br>
	Check whether .ssh/id_rsa exists:
	$ ls~root/.ssh/id_rsa
If the key does not exist, create one, omitting a passphrase (just hit return):
$ ssh-keygen -t rsa 

####How do I install the HP Helion OpenStack, and what’s included? #### {#HowdoIinstall}

1. Login as root and unpack the tar file into root’s home directory:
	$ sudo su -
	$ tar xvf <location-of-.tar.gz-file>

2. This will create and populate a tripleo/ directory within root’s home directory.

3. Ensure that no LC_ variables are set:
$ env | grep ^LC_

4. If any variables are set, unset them using a blank export for each variable:
$ export <LC_VARIABLE_NAME>=

5. Start the seed VM:
$ HP_VM_MODE=y bash -x ~root/tripleo/tripleo-incubator/scripts/hp_ced_start_seed.sh

The process of starting the seed will take 5-10 minutes, or possibly longer depending on the capabilities of your system. There is currently a substantial amount of script/debug output that will be disabled in the final
customer version.

Allow the process to continue; you may need to ignore a password prompt for a few minutes, then just hit return until the seed setup continues.

Once the seed has completed its setup processing, you can proceed to the second stage, which is to deploy and configure the undercloud and overcloud, and to start a test guest VM in the overcloud compute node.

$ ssh 192.0.2.1 bash -x ~root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh

####What are the minimum and maximum number of configurations allowed? #### {#minimumandmaximumconfigs}

The minimum configuration is seven physical servers:

* One VM for the Seed Cloud
* One Undercloud Server
* Three Overcloud Management Servers
* Two Swift Object Servers
* One compute Server

The maximum supported configuration is 36 servers. 

####How do I install and set up the HP Helion OpenStack Admin Node? #### {#installandsetup}

You are recommended to only install the Admin Node on a virtual machine. 
Here are general guidelines for creating a virtual machine in an existing or new hypervisor infrastructure:

1. Configure the hypervisor host's network. The host must provide connectivity to the virtual machine Admin Node on an isolated private network 
to all the bare-metal nodes' port eth0. And the virtual machine Admin Node must also have connectivity to a routable network for Internet access.

2. Create a virtual machine Admin Node with the suggested hardware configuration. The following configuration must be reviewed during this step:

    a. Ensure the virtual machine Admin Node's primary NIC is bridged or connected to the admin network and the second NIC is bridged or connected to a routable network for Internet access.

    b. For the disk configuration, the default Disk bus type/controller uses proprietary technology. Ensure you set that to the IDE/SCSI type.
 
    c. If your hypervisor is KVM, ensure the virt type is set to KVM.
 
3. Download the HP Cloud OS ISO to the host's local file system or data store.

4. Configure the virtual machine Admin Node to point to the ISO as a CD/DVD drive or install media ISO image. 

####I’ve installed the HP Helion OpenStack. Now what? #### {#NowWhat}

####What is TripleO? #### {#WhatisTripleO}
 
TripleO is an OpenStack program aimed at installing, upgrading and operating OpenStack clouds using OpenStack itself as the installation mechanism. We recommend that you use TripleO as the basis for creating and installing HP Helion OpenStack. 

Engineers working on HP Helion OpenStack will typically use TripleO to deploy and redeploy their CE dev/test environment. TripleO includes a script for bringing up dev/test environments called devtest.sh - you will typically use that to create/recreate your test environment. 

The following sections document how to use this tool within the HP Corporate Network. TripleO is under active development - you can the latest open bugs in launchpad.

The description of TripleO as compared to HP Cloud, TripleO Overview for those coming from HP Public Cloud, may help you understand the terminology used in the rest of this page. TripleO Software Components also gives an overview of the various components of TripleO.

####How long does it take to install the HP Helion OpenStack? #### {#Howlonginstallation} 

<b><font color="red">Need list of steps from Raj / Gavin</font></b>

####Should I reboot after installation? #### {#rebootafterinstallation} 

<b><font color="red">Need list of steps from Raj / Gavin</font></b>

## Setting up the seed cloud 

####What is a seed? #### {#Whatisseed}

The seed machine is a single node that is effectively just an installer.  It's sole purpose is to create the undercloud, and that is all.  This is the equivalent of your workstation, laptop, or maybe staff-shell (if you ever used it).  It uses nova, glance and heat to install the undercloud.

This is not a full OpenStack installation, it is a cut-down installation providing only the software required in order to enable the installation of the undercloud onto physical systems in the data center.

####How do I create a VM for the Seed Cloud based on the CloudOS specifications? #### {#createVM} 

####How do I load a under cloud image into the seed cloud? #### {#imageseedcloud} 

####How do I log into the seed cloud and deploy the undercloud? #### {#deployUC}   

### Setting up the undercloud and overcloud

####What is an undercloud? #### {#Whatisundercloud}

The undercloud is what you use as an administer to maintain the hardware.  It installs physical machines using nova and the baremetal or ironic driver (in the same way that it was installed from the seed).  This is analogous to what Holly does in HP Public Cloud.  It then uses heat to deploy and configure the resulting booted systems, which is analogous to the use of Chef in HP Public Cloud.  The sole purpose of the undercloud is to administer the physical machines in the data center for the purpose of making them run an OpenStack cloud.

This is not a full OpenStack installation, it is a cut-down installation providing only the software required in order to enable the installation of the overcloud onto physical systems in the data center.
Overcloud

This is the HP Public Cloud.  This is the OpenStack installation that customers and consumers will interact with in all of the normal ways they would interact with the HP Public Cloud.  This is where the web interface (Horizon) will be, and the cloud in which all instances will be created/objects stored/volumes created/etc.

This is a full and feature-rich OpenStack installation.

####What is an overcloud? #### {#Whatisovercloud}

This is the HP Public Cloud.  This is the OpenStack installation that you will interact with in the same way you interact with the HP Public Cloud.  This is where the web interface will be housed, and the cloud in which all instances will be created/objects stored/volumes created etc.

This is a full and feature-rich OpenStack installation.

####How do I set up the disk configurations of the undercloud and overcloud servers? #### {#UCOCservers}

####How do I configure the physical network connecting the undercloud and overcloud servers? #### {#physicalnetwork}

####How do I install the overcloud? #### {#installOC}

####How do I verify the functionality of the overcloud?? #### {#verifyOC}

####How do I deploy a software update to the overcloud? #### {#updateOC}

####How do I add a compute node to the overcloud? #### {#computenode}

### Checking configuration status 

####How do I verify that the configuration has succeeded? #### {#verifyconfigsucceed}

####Should I reboot after configuring the HP Helion OpenStack? #### {#launchtheDashboard}

####How do I launch the HP Helion OpenStack Dashboard? #### {#DashboardActions}

####How do I shut down and restart the HP Helion OpenStack? #### {#ShutdownRestart}

## Managing the HP Helion OpenStack

####How do I launch the HP Helion OpenStack Dashboard? #### {#launchtheDashboard}

After you boot from the HP Cloud OS ISO, you are ready to launch the Operational Dashboard to set up the Admin Node.

To launch the Operational Dashboard:

1. From the virtual machine Admin Node, open a Mozilla Firefox or Google Chrome browser that has the following IP addresses 
set as proxy exceptions:  

  	10.\*;192.\*;localhost;127.\* 

2. In the browser, enter **http://192.168.124.10:9000** to launch the Operational Dashboard user interface. 

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

<b><font color="red">We need to add more FAQs on how to use the Dashboard and the list out the many different actions that user can take within the UI. Get Info from Raj / Gavin / Peter. </font></b>  

####What are the key actions I can perform within the Dashboard? ####{#DashboardActions} 

####How do I shut down and restart the HP Helion OpenStack? #### {#ShutdownRestart}

##Upgrading the HP Helion OpenStack 

####How can I update the HP Cloud software? #### {#updatesoftware}

HP provides automated, live distribution of updates. 

##Getting help

####I'm stuck. Where can I get more help? #### {#gethelp} 

<b><font color="red">Need more info Raj / Gavin</font></b> 

Please visit http:/commercial.hpcloud.com or  …

####Are HP support services included? #### {#supportservices}

No. But an optional paid support contract from HP is available.

####Where can I go to find more information? #### {#moreinformation}

<b><font color="red">Need more info from Raj / Gavin</font></b>

* HP Cloud sales portal  
* [HP Hybrid Cloud Management](https://hp.com/go/cloudmanagement) 
* Download the white paper
* Download the customer-facing presentation
* Watch the video 

####How can I contact HP Cloud Customer Support? #### {#contactcs}