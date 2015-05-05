---
layout: default
title: "HP Helion OpenStack&#174; Community FAQ"
permalink: /helion/community/faq/
product: commmunity
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: All
authors: JaymeP

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/community/">&#9664; PREV</a> | <a href="/helion/community/">&#9650; UP</a> | <a href="/helion/community/">NEXT &#9654;</a> </p> -->

# HP Helion OpenStack&#174; Community FAQ #

This page answers many common questions about what HP Helion OpenStack is, how the Community edition works, and what it can do for your enterprise. 

###About HP Helion OpenStack Community Edition
* [What is HP Helion OpenStack Community edition?](#whatcommunity)
* [Is there a cost associated with this distribution?](#distrocost)
* [What support options are available?](#supportoptions)
* [Does HP Helion OpenStack Community edition work with hybrid or public cloud projects?](#hybridorpubliccloud)
* [What is TripleO?](#TripleO)
	* [What is a seed?](#whatisseed)  
	* [What is the undercloud?](#whatisundercloud) 
	* [What is the overcloud?](#whatisovercloud)

###Specifications
* [How many nodes does the Community edition support?](#nodes)
* [How can I update to the latest version?](#softwareupdate)
* [Does it include an operating system (OS)?](#includeOS)
* [Is HP Helion OpenStack Community edition upgradeable?](#upgrade)
* [Can HP Helion OpenStack Community edition be run on non-HP hardware?](#nonhphardware)

###More Information
* [Is there an alternative to the Community Edition?](#alternative)
* [Where can I find more information?](#MoreInfo)
* [Is the release localized for non-English speaking markets?](#localized)  

##About HP Helion OpenStack Community Edition

###What is HP Helion OpenStack Community edition? {#whatcommunity}

HP Helion OpenStack is a commercial-grade distribution of [OpenStack](http://www.openstack.org), the leading open source cloud computing platform. This distribution, backed by HP, enables customers to more easily build, manage, and use open-source based hybrid clouds in a resilient, maintainable platform. 

The HP Helion OpenStack Community edition is a free-to-license distribution that speeds deployment and simplifies management of small-scale open cloud environments and infrastructure services. It supports up to 30 physical nodes and 600 virtual nodes making it ideal for small-scale, evaluation, and proof of concept deployments.

The Community edition enables customers to evaluate HP Helion OpenStack, build a better proof-of-concept, or deploy small-scale private clouds.

To expand to larger, enterprise-grade installations, upgrade to the [full version](/helion/openstack/) of HP Helion OpenStack.

###Is there a cost associated with this distribution? #### {#distrocost} 

It is free to download. Optional technical support packages are available to purchase from HP. 

###Will HP Helion OpenStack Community edition work with hybrid or public cloud projects? {#hybridorpubliccloud}

HP Helion OpenStack Community edition is API-compatible with HP Helion Public Cloud, allowing workloads developed on one to be deployed on the other.  Compatibility with non-HP clouds will depend on which OpenStack platform features they choose to support.

###What is TripleO? {#TripleO}

OpenStack-on-OpenStack, or TripleO, is an official  OpenStack project for deployment of OpenStack systems. It builds on the core resource-provisioning strengths of OpenStack technology. It enables you to administer your cloud or deploy and maintain virtual and baremetal installations of OpenStack using the same APIs you are familiar with for deploying workloads on an OpenStack cloud. A template-based deployment engine (using OpenStack Heat) allows for rigorous testing and reliable, repeatable deployments of known configurations.

A TripleO installation includes a [seed](#whatisseed), the [undercloud](#whatisundercloud) and the [overcloud](#whatisovercloud).
 
####What is a seed? {#whatisseed}  

A seed VM is a bootable KVM VM image provided as part of HP Helion OpenStack and is deployed in a VM instance. This instance provisions physical hardware and deploys the undercloud. It also contains the minimum services required for OpenStack to function: Nova, Neutron, Glance, Keystone, Ironic & Heat.

This is the first phase of the HP Helion OpenStack installation.

####What is the undercloud? {#whatisundercloud} 

The undercloud server is a basic single-node OpenStack installation running on a single physical server used to deploy, test, manage, and update the overcloud servers. There is no HA configuration for the undercloud. 

The undercloud contains a strictly limited sub-set of services; just enough to interact with the overcloud. The services running on the undercloud are Nova, Neutron, Glance, Keystone, Ironic, Heat, Horizon & Ceilometer. This server also contains the HP Helion content distribution catalog service, which provides a mechanism for downloading and installing content and updates for the overcloud.

The undercloud also hosts images for various server types which will form the functional cloud environment - the [overcloud](#whatisovercloud). These images are overcloud Controller, overcloud Compute, overcloud Swift & overcloud Compute Proxy (required for clouds that support VMWare ESX as a hypervisor).

Creating the undercloud is the second phase of the HP Helion installation process. 

####What is the overcloud? {#whatisovercloud}

The overcloud is the functional cloud available to run guest virtual machines and workloads. It offers access to the Nova, Neutron, Glance, Keystone, Cinder, Swift, Ironic, Heat, Horizon, and Ceilometer services.  

Creating and configuring the overcloud completes the overall Helion OpenStack installation process. 

##Specifications

###How many nodes does the Community edition support? {#nodes}

Up to 30 nodes with up to 600 virtual machines, subject to the size of the VMs and hardware capacity.
  
###How can I update to the latest version? {#softwareupdate}

HP OpenStack Helion does not support an update utility to update from previous releases. For help with updating, visit the [HP Customer Support](http://www.hpcloud.com/about/contact) page and choose your preferred method of contact.

###Does HP Helion OpenStack include an Operating System (OS)? {#includeOS}

Yes. It includes an integrated Linux&#174; host OS hardened and tested for this distribution. All supported hardware and software configurations are laid out in the [Support Matrix](/helion/openstack/support-matrix/).

###Which OpenStack release does this distribution include? {#releaseversion}

All of the [HP Helion OpenStack services](/helion/openstack/services/overview/#OpenStack) have been updated to [OpenStack Juno](http://www.openstack.org/software/juno/). [Learn more](http://www.hpcloud.com/learning-center) about HP's commitment to OpenStack and how we're making it even better.
 
###Is the HP Helion OpenStack Community edition upgradable? {#upgrade}

To expand to larger, enterprise-grade installations, upgrade to the [full version](/helion/openstack/) of HP Helion OpenStack.

###Can HP Helion OpenStack Community edition be run on non-HP hardware? {#nonhphardware}

HP Helion OpenStack does not require HP-branded hardware. All supported hardware and software configurations are laid out in the [Support Matrix](/helion/openstack/support-matrix/).  

##More Information

###Is there an alternative to the Community Edition? {#alternative}
[HP Helion OpenStack](/helion/openstack/) is a commercial-grade distribution of OpenStack, the leading open source cloud computing platform. This distribution, backed by HP, enables customers to more easily build, manage, and use open-source based hybrid clouds in a resilient, maintainable platform. HP Helion OpenStack enables cost-effective scalability of IT services and business agility.

###Where can I find more information? {#MoreInfo}

* [HP Helion OpenStack Community Portal](http://www8.hp.com/us/en/cloud/hphelion-openstack-community.html)
* [HP Helion OpenStack Community Documentation](https://docs.hpcloud.com/helion/community) 
* [HP Helion OpenStack Support Forum](https://ask.openstack.org/en/questions/scope:all/sort:activity-desc/tags:hphelion) (Tag your questions with 'HPHelion')
* [HP Customer Support](http://www.hpcloud.com/about/contact)
* [Consult with a Cloud Specialist](http://go.hpcloud.com/Consultation)

###Is the release localized for non-English speaking markets? #### {#localized}

No. The 2014 release is English only.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
