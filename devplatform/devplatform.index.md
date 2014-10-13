---
layout: default-devplatform
title: "HP Helion Development Platform Documentation"
permalink: /helion/devplatform/
product: devplatform

---
<!--UNDER REVISION-->

# HP Helion Development Platform Documentation

Welcome! The HP Helion Development Platform is a Platform-as-a-Service (PaaS) that helps developers build great cloud-native applications across private and public clouds.  Based on [Cloud Foundry](http://cloudfoundry.org/index.html)&trade; and fully integrated with [HP Helion OpenStack](/helion/openstack/)&reg;, the HP Helion Development Platform is open and interoperable, ensuring that developers can focus on building the right app for any environment. 

This documentation will help you get up to speed on the  Helion Development Platform as a Developer or Administrator.

##Platform Overview

The [Application Lifecycle Service (ALS)](/als/v1/) is a Cloud Foundry-based, managed runtime environment for applications. 

- ALS supports [Java](/helion/devplatform/appdev/#java), [Node](/helion/devplatform/appdev/#node), [PHP](/helion/devplatform/appdev/#php), and other language runtimes.
- ALS provides easy access to services like MySQL, PostgreSQL, RabbitMQ, and Memcache.
- ALS allows Disk, Memory and Placement Zone constraints to be set per application.
- ALS provides auto-scaling and application log drains.
 
The Application Lifecycle Service is installed as part of the Helion Development Platform. You can explore this service by setting up a [Quick Start Developer Trial](/helion/devplatform/ALS-developer-trial-quick-start/) in the public cloud.

##Application Services
The HP Helion Development Platform provides additional Application Services that integrate into the the Application Lifecycle Service. These currently include:

###Database as a Service 
The Database as a Service is optionally [installed](/helion/devplatform/install/#database) as part of the Helion Development Platform. If not installed as part of the platform, you can install it and then [configure](/helion/devplatform/connectdatabase/#configure) it for [use from within the Application Lifecycle Service](/helion/devplatform/connectdatabase/).

- An implementation of Openstack Trove, [Database as a Service](/helion/devplatform/createdatabase/) provides scalable and reliable cloud database provisioning functionality for both relational and non-relational databases.  
- The Database service provides a simple and easy way to access and utilize features in a database without the overhead of administration.  

The Database as a Service is optionally installed as part of the Helion Development Platform; you can install it and then configure it for [use from within the Application Lifecycle Service](/helion/devplatform/connectdatabase/).

###Messaging Service (Beta)
The [The Messaging Service](/helion/devplatform/messageservice/)  provides developers with the ability to provision RabbitMQ clusters using a wizard-based UI directly from Horizon.

- The Messaging Service integrates with Keystone to remove the need to create separate credentials for RabbitMQ access. 
- The Messaging Service allows developers to focus on building their apps without worrying about installing, configuring, and troubleshooting RabbitMQ.

The Messaging Service is optionally installed as part of the Helion Development Platform. If not installed as part of the platform, you can [install](/helion/devplatform/install/#message) it and then [configure](/helion/devplatform/messageservice/) it for [use from within the Application Development Platform](/helion/devplatform/msgaas/als).

###The Marketplace (Beta)
The [Marketplace](/helion/devplatform/marketplace/) (Beta) is a product catalog that will be used to deliver the best of breed applications and services required to support world class, enterprise grade applications.

- It automates installation and enablement of supported applications and services.
- The Beta version allows you to install an instance of Vertica Community Edition.

The Marketplace is optionally installed as part of the Helion Development Platform, you can [install](/helion/devplatform/install/#marketplace) it and then use it to easily install applications and services to accelerate your development efforts.

##Platform Tools
The Helion Development Platform is accessible via the following tools: 

**Helion Command-Line Interface (CLI)**<br>
[Install](/als/v1/user/client/) and use the Helion CLI to deploy your app to the development platform through the command line. [Setup](/als/v1/user/client/#helion-client-setup) instructions are available for both Windows&reg; and Unix/Mac operating systems.

**Eclipse Plugin**<br>
 If your developers work in the Eclipse IDE, [install and use](/helion/devplatform/eclipse/) the Eclipse plug-in to quickly configure the Helion Development Platform as a deployment target for your app. 

##Installation Options
Most of the Helion Developer Platform documentation assumes that you've already provisioned an environment where you can deploy your apps. There are two ways to deploy Development Platform technology:
 
- **Quick Start Developer Trial**: The fastest way to set up a functional Helion Development Platform environment is the [Quick Start Developer Trial](/helion/devplatform/ALS-developer-trial-quick-start/) (sandbox) on the public cloud.
- **Standard Installation**: Install a [Commercial HP Helion OpenStack](/helion/openstack/install/overview/)&reg; cloud and then [install](/helion/devplatform/install/) the Helion Development Platform. 

----------
###[Resources for Application Developers](/helion/devplatform/appdev/)
  
###[Resources for Sysadmins and Installers](/helion/devplatform/sysadmin/)
  
<!--### [Resources for OpenStack Integration, Extension, and Service Development](/helion/devplatform/servicedev/) -->
----------

###Legal###
* [Open source license and software license agreements](/helion/openstack/3rd-party-license-agreements/)
* [End User License Agreement (EULA)](/helion/openstack/eula/)

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
 
