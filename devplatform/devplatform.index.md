---
layout: default-devplatform
title: "HP Helion 1.1 Development Platform: Documentation"
permalink: /helion/devplatform/
product: devplatform
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
role1: Systems Administrator 
role2: System Engineer
role3: Cloud Administrator
role4: Network Administrator
role5: Application Developer
Role6: Security Engineer
role7: ISV Developer 
role8: Service Developer
authors: Jayme P

---
<!--PUBLISHED-->

# HP Helion 1.1 Development Platform: Documentation


Welcome! The HP Helion Development Platform is a Platform-as-a-Service (PaaS) that helps developers build great cloud-native applications across private and public clouds.  Based on [Cloud Foundry](http://cloudfoundry.org/index.html)&#8482; and fully integrated with [HP Helion OpenStack](/helion/openstack/1.1/)&#174;, the HP Helion Development Platform is open and interoperable, ensuring that developers can focus on building the right app for any environment.

This documentation will help you get up to speed on the  Helion Development Platform as a Developer or Administrator.

##Platform Overview

The [Application Lifecycle Service (ALS)](/helion/devplatform/1.1/als/) is a Cloud Foundry-based, managed runtime environment for applications. 

- It supports [Java](/helion/devplatform/1.1/appdev/#java), [Node](/helion/devplatform/1.1/appdev/#node), [PHP](/helion/devplatform/1.1/appdev/#PHP), and other language runtimes.
- It provides easy access to services like MySQL, PostgreSQL, RabbitMQ, and Memcache.
- It allows Disk, Memory and Placement Zone constraints to be set per application.
- It provides auto-scaling and application log drains.
 
The Application Lifecycle Service is [installed](/helion/devplatform/1.1/install/#install-als) as part of the Helion Development Platform. You can easily [create and configure](/helion/devplatform/1.1/als/admin/#wizard-based-cluster-creation) Application Lifecycle Service clusters from the Horizon management console, or explore this service by setting up a [Quick Start Developer Trial](/helion/devplatform/1.1/ALS-developer-trial-quick-start/) in the public cloud.

##Application Services
The HP Helion Development Platform provides additional Application Services that integrate into the Application Lifecycle Service. These currently include:

###Database as a Service  

The [Database as a Service (DBaaS)](/helion/devplatform/1.1/databaseservice/) provides lifecycle services for MySQL database instances. Lifecycle services includes provisioning, configuration, patching, backups, restores, and monitoring that can be administered from either a CLI interface, RESTful APIs or the Horizon dashboard. 

- An implementation of [OpenStack Trove](https://wiki.openstack.org/wiki/Trove), [Database as a Service](/helion/devplatform/1.1/databaseservice/) provides scalable and reliable cloud database provisioning functionality for both relational and non-relational databases.  
- The Database service provides a simple and easy way to access and utilize features in a database without the overhead of administration.  

The [Database as a Service](/helion/devplatform/1.1/connectdatabase/) is optionally [installed and configured](/helion/devplatform/1.1/install/#install-database) as part of the Helion Development Platform. If not installed as part of the platform, you can install it and then configure it for [use from within the Application Lifecycle Service](/helion/devplatform/1.1/connectdatabase/).

<table style="vertical-align: top; width: 800px; background-color: white; border: 0px;">
<tr style="border: 0px;vertical-align: top;"><td style="border: 0px; width: 400px;"><a href="install/#install-database">Install</a><br /></td><td style="border: 0px; align: right;"><a href="databaseservice">Provision</a><br /><a href="connectdatabase">Connect with ALS</a></td></tr>
</table>
###Messaging Service

The [Messaging Service](/helion/devplatform/1.1/messageservice/)  provides developers with the ability to provision RabbitMQ clusters using a wizard-based UI directly from Horizon.

- The Messaging Service integrates with [Keystone](/helion/openstack/1.1/services/identity/overview/) to remove the need to create separate credentials for RabbitMQ access. 
- The Messaging Service allows developers to focus on building their apps without worrying about installing, configuring, and troubleshooting RabbitMQ.

The Messaging Service is optionally installed as part of the Helion Development Platform. If not installed as part of the platform, you can [install](/helion/devplatform/1.1/install/#install-messaging) it and then [configure](/helion/devplatform/1.1/messageservice/) it for [use from within the Application Lifecycle Service](/helion/devplatform/1.1/msgaas/als/).

<table style="vertical-align: top; width: 800px; background-color: white; border: 0px;">
<tr style="border: 0px;vertical-align: top;"><td style="border: 0px;width: 400px;"><a href="install/#install-messaging">Install</a><br /></td><td style="border: 0px; align: right;"><a href="messageservice">Provision</a><br /><a href="msgaas/als">Connect with ALS</a></td></tr>
</table>

###The Marketplace

The [Marketplace](/helion/devplatform/1.1/marketplace/) is a product catalog that will be used to deliver the best of breed applications and services required to support world-class, enterprise-grade applications.

- It automates installation and enablement of supported applications and services.
- Includes instructions for installing an instance of Vertica Community Edition.

The Marketplace is optionally installed as part of the Helion Development Platform. You can [install](/helion/devplatform/1.1/install/#install-marketplace) and [use](/helion/devplatform/1.1/marketplace/) it to easily install applications and services to accelerate your development efforts.

<table style="vertical-align: top; width: 800px; background-color: white; border: 0px;">
<tr style="border: 0px;vertical-align: top;"><td style="border: 0px; width: 400px;"><a href="install/#install-marketplace">Install</a><br /></td><td style="border: 0px; align: right;"><a href="marketplace">Provision</a></td></tr>
</table>

##Platform Tools
The Helion Development Platform is accessible via the following tools: 

**Helion Command-Line Interface (CLI)**<br />

Use the Helion CLI to deploy your app to the development platform through the command line. [Setup](/helion/devplatform/1.1/als/user/client/#helion-client-setup) instructions are available for here both Windows&#174; and Unix/Mac operating systems.

**Eclipse Plugin**<br />
 If your developers work in the Eclipse IDE, [install and use](/helion/devplatform/1.1/eclipse/) the Eclipse plug-in to quickly configure the Helion Development Platform as a deployment target for your app. 

##Installation Options
Most of the Helion Development Platform documentation assumes that you've already provisioned an environment where you can deploy your apps. There are two ways to deploy Development Platform technology:
 
- **Quick Start Developer Trial**: The fastest way to set up a functional Helion Development Platform environment is the [Quick Start Developer Trial](/helion/devplatform/1.1/ALS-developer-trial-quick-start/) (sandbox) on the public cloud.
- **Standard Installation**: Install a [Commercial HP Helion OpenStack](/helion/openstack/1.1/install/overview/)&#174; cloud and then [install](/helion/devplatform/1.1/install/) the Helion Development Platform.  

----------
###[Resources for Application Developers](/helion/devplatform/1.1/appdev/)
  
###[Resources for IT Ops](/helion/devplatform/1.1/sysadmin/)
  
<!--### [Resources for OpenStack Integration, Extension, and Service Development](/helion/devplatform/1.1/servicedev/) -->

----
 
