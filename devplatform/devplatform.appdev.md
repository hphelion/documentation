---
layout: default-devplatform
title: "HP Helion Development Platform Documentation for Application Developers"
permalink: /helion/devplatform/appdev/
product: devplatform
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1

---
<!--PUBLISHED-->
# HP Helion Development Platform: Resources for Application Developers

HP has created a series of small, simplified sample applications to help you understand and exercise the Development Platform services.

Each sample builds on the previous one and all source code is provided for you to build, deploy, and take apart. Each sample is provided in multiple languages.
 
##Prerequisites - Before you begin
In order to download and deploy these sample applications, you must have the necessary framework installed and configured.

- HP Helion OpenStack&reg; [cloud deployed](/helion/openstack/install/overview/)
- Application Lifecycle Service [Cluster](/helion/devplatform/deploy) available with MySQL and RabbitMQ enabled.
	- You can also quickly setup a cluster in the free and publicly available Helion cloud as part of the [Quick Start Developer Trial](/helion/devplatform/ALS-developer-trial-quick-start/): 
- Logon and password credentials for the cluster.
- Access to the [Helion command-line interface (CLI)](/als/v1/user/client/)
- (Optional) Access to the [Eclipse](/helion/devplatform/eclipse/) deployment plugin.

##Sample code {#sample}
For best results, work with each sample in the order in which they are provided, as each one builds on the knowledge provided in the previous sample. 
###Java {#java}
1. [Hello World](/helion/devplatform/workbook/helloworld/java/) <br>
The Hello World sample is as simple as it gets: Hello World! 

2. [Working with Databases](/helion/devplatform/workbook/database/java/) <br>
Create a database and execute a query against it. <br>

3. [Working with Messaging](/helion/devplatform/workbook/messaging/java/)<br> Enter, send, and display a brief message.<br> 

More Helion [Java](/als/v1/user/deploy/languages/java/) references.

###Node {#node}
1.  [Hello World](/helion/devplatform/workbook/helloworld/node/)<br>
The Hello World sample is as simple as it gets: Hello World! 

2. [Working with Databases](/helion/devplatform/workbook/database/node/) <br>
Create a database and execute a query against it.<br> 


3. [Working with Messaging](/helion/devplatform/workbook/messaging/node/)<br> Enter, send, and display a brief message.<br> 

More Helion [Node](/als/v1/user/deploy/languages/node/) references.
 
###PHP {#PHP}
1.  [Hello World](/helion/devplatform/workbook/helloworld/php/) <br>
The Hello World sample is as simple as it gets: Hello World! 

2. [Working with Databases](/helion/devplatform/workbook/database/php/) <br>
Create a database and execute a query against it.<br>

3. [Working with Messaging](/helion/devplatform/workbook/messaging/php/)<br> Enter, send, and display a brief message.<br> 

More Helion [PHP](/als/v1/user/deploy/languages/php/) references.

###Other references
- [Installing the Marketplace](/helion/devplatform/marketplace)
- [ALS command-line interface (CLI) reference](/als/v1/user/reference/client-ref/#command-ref-client)
- [Application Lifecycle Service (ALS) User's Guide](/als/v1/user/)
- [Remote Debugging](/als/v1/user/deploy/app-debug/)
- [The Management Console](/als/v1/user/console/)
- [Logs, Streams, and Drains](/als/v1/user/deploy/app-logs/)

###Best practices

- [The 12-Factor App](http://12factor.net/)
- [Tips from Cloud Foundry&trade;](http://docs.cloudfoundry.org/devguide/deploy-apps/prepare-to-deploy.html)

----
