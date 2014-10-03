---
layout: default-devplatform
title: "HP Helion OpenStack Development Platform Community Release Notes"
permalink: /helion/devplatform/community/release-notes/
product: devplatform

---
<!--UNDER REVISION-->
<p style="font-size: small;"> <a href="/helion/devplatform/community/">&#9664; PREV</a> | <a href="/helion/devplatform/community/">&#9650; UP</a> | <a href="/helion/devplatform/community/install/"> &#9654; NEXT</a></p>
	
# HP Helion Development Platform Community Release Notes 

Thanks for your interest in this preview edition of HP Helion Development Platform Community! The release notes cover the following topics:

* [Features in HP Helion Development Platform Community](#FeaturesDevPltCom)
* [Recommendations for HP Helion  Development Platform ](#recommendations)
* [For further information](#{#furtherinfo})
* [Feedback](#feedback)

**Note**: The HP Helion Development Platform Community Preview is not intended for production workloads, especially those that require data durability or high availability.  Be sure to take appropriate security cautions.


## Features in HP Helion Development Platform Community {#FeaturesDevPltCom}

**Application Lifecycle Service (ALS)** - provides an industry-leading runtime environment for applications and is powered by Cloud Foundry. This allows developers to build, deploy, and manage application using a single platform. ALS enables rapid iteration and easy scale-out for applications. The interactive installer provides rapid and repeatable creation of ALS clusters.

**Database Service** - provides lifecycle management of databases and automates common administration tasks including backup, restore, and scaling. The preview edition supports  MySQL 5.5 and is a direct implementation of [OpenStack Trove](https://wiki.openstack.org/wiki/Trove), the integrated database as a service project within OpenStack.  

<!--- no required to mention what language is used to develop the application

	The service supports the deployment and management of applications written in the following languages:
	- Go
	- Java
	- Node.js
	- Perl
	- PHP
	- Python
	- Ruby
--->
<!---  since this is not recommended for production, I planned to remove it
   The following data services are available as part of the Application Lifecycle Service for dev/test use cases (not recommended for production):
	- Memcache
	- MySQL
	- PostgreSQL
	- RabbitMQ
	- Redis  
--->	  

<!---
For scale out production environments that require increased stability, a less frequent release cadence, and no single points of failure, the commercial HP Helion Development Platform will soon be made available for purchase and download.--->

<!---
NOTE TO WRITERS: This section below needs to be in the install guide, not here.  After incorporating in the install guide, delete this whole section; kept temporarily for reference purposes.

## System requirements and installation {#installation}

The Development Platform installs and runs as a workload of the underlying HP Helion OpenStack Community operating environment. HP Helion OpenStack Community must be installed and available prior to installing the Development Platform. Both versions of HP Helion OpenStack Community are supported, the "cloud-in-a-box" [virtual version](https://docs.hpcloud.com/helion/community/install-virtual/) and the [baremetal version](https://docs.hpcloud.com/helion/community/install/) which requires a minimum of five physical servers.

The Development Platform installs and runs as a workload of the underlying HP Helion OpenStack Community operating environment. HP Helion OpenStack Community must be installed and available prior to installing the Development Platform. Both versions, the [virtual version](https://docs.hpcloud.com/helion/community/install-virtual/) (cloud-in-a-box) and the [baremetal version](https://docs.hpcloud.com/helion/community/install/) (with a minimum of five physical servers), of HP Helion OpenStack Community are supported. 
For complete installation instructions, refer to [HP Helion Development Platform Community Installation Guide](/helion/devplatform/install).

Upon installation, five Compute instances are created and two images are loaded into the OpenStack (Glance) image repository. This provides administrators and end users with the ability to provision and manage ALS clusters and MySQL database instances. 

To create clusters, you must modify DNS records associated  with an existing domain/subdomain or you can register a public domain name at any Domain Name Registrar. For more details on configuring DNS, refer to the ALS Administrator Guide <**need url**>
--->

##Recommendations for HP Helion Development Platform ## {#recommendations}

This section describes the HP recommendations for best performance, utility, and functionality with this software version. We have also provided information about some limitations and known issues for reference purposes. This section contains:

* [Best practices recommendations](#best-practices) for best functionality, performance and reliability
* [Known issues](#known-issues)  and workarounds with this release


###Recommendations## {#Recommendations} 

The following are our best-practices recommendations for this preview edition:

* To ensure optimum App Store functionality, we recommended that you provide ALS with outbound Internet connectivity.  This process is documented in the [installation instructions](/helion/devplatform/community/install-dev-platform/).
* To gain the ability to leverage all of the features that Database Service provides, including the ability to backup and restore your database as well as manage access with security groups, you may want to replace the default ALS MySQL service with the Database Service (OpenStack Trove).  Only an administrator for ALS is allowed to make this change.  For further details, see the [ALS administrator's guide](/als/v1/admin/).
* For best results when deploying sample apps from the ALS app store, download the apps to a client development system and then push them to the ALS cluster using the command-line interface (CLI) rather than accessing the Internet from the cluster through a proxy server.

<!--
Deleted as per Josh Berry note  (And then of course he seemed to change his mind)
* For best cluster functionality, you should not provide the domain name server (DNS) to virtual machines. This ensures that a working DNS resolver is available to virtual machines in your Helion OpenStack environment.  

-->


###Known issues### {#Issues}

The following are the known issues for this preview edition of the HP Helion Development Platform Community:

* You must select the appropriate size for your instances during instance creation; this release does not support database instance resizing.


## For further information {#furtherinfo}
For additional information on HP Helion Development Platform and OpenStack Cloud Software:

- [HP Helion Development Platform Documentation web site](/helion/devplatform/community/): Provides the topics listed below.
- [Development platform installation and configuration](/helion/devplatform/install/): A set of tasks that walk you through the installation and configuration process for the Development Platform.
- [ALS installation and configuration](/helion/devplatform/install/): A set of tasks that walk you through the installation and configuration process for ALS.
- [Application Lifecycle Service Documentation](/als/v1/):  Contains topics about the ALS user interface dialogs and options.
- [Related Topics](/helion/devplatform/related-topics): Links to pertinent HP Helion OpenStack Development Platform and OpenStack documentation.
- [Database Service API Documentation](http://docs.hpcloud.com/api/v13/dbaas/): Contains the topic about HP Helion Database Service API. 
* [OpenStack documentation home page](http://docs.openstack.org/)

<!--Removed 10/3/14 ##Feedback {#feedback}

Your feedback is very important to us. Please use the [HP Helion Developer Community Forum](https://community.dev.hp.com/t5/Board/bd-p/cloud_board) to provide your feedback, share insights, and ask questions.
-->
<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*





