---
layout: default-devplatform
title: "HP Helion Development Platform Documentation for Application Developers"
permalink: /helion/devplatform/appdev/
product: devplatform

---
<!—UNDER REVISION-->
#Resources for Application Developers

HP has created a series of small, simplified sample applications to walk you through understanding and exercising the Development Platform services.

Each sample builds on the previous one and all source code is provided for you to build, deploy, and take apart. Each sample is provided in multiple languages.
 

##Prerequisites - Before you Begin
In order to download and deploy these sample applications, you must have the necessary framework installed and configured.

- HP Helion OpenStack&reg; cloud or micro-cloud deployed
	- [Community](/helion/community/install/)
	- [Commercial](/helion/openstack/install/overview/)
- Application Lifecycle Service [Cluster](/als/v1/admin/cluster/) available
- Logon and password credentials for the cluster.
- Access to  [Helion command-line interface (CLI)](/als/v1/user/client/); this is part of the Helion Developer Platform installation.

 
##Sample Code
For best results, work with each sample in the order that they are provided, as each one builds on the knowledge provided in the previous sample. 
###Java
1. [Hello World](/helion/devplatform/workbook/helloworld/java/) <br>
The Hello World sample is as simple as it gets: Hello World! 

2. [Database as a Service (DBaaS)](/helion/devplatform/workbook/database/java/) <br>
Create a database and execute a query against it.

3. [Messaging as a Service (MSGaaS)](/helion/devplatform/workbook/messaging/java/)<br> Enter, send, and display a brief message.

More Helion [Java](/als/v1/user/deploy/languages/java/) references.

###Node
1.  [Hello World](/helion/devplatform/workbook/helloworld/node/)<br>
The Hello World sample is as simple as it gets: Hello World! 

2. [Database as a Service (DBaaS)](/helion/devplatform/workbook/database/node/) <br>
Create a database and execute a query against it.

3. [Messaging as a Service (MSGaaS)](/helion/devplatform/workbook/messaging/node/)<br> Enter, send, and display a brief message.

More Helion [Node](/als/v1/user/deploy/languages/node/) references.
 
###PHP
1.  [Hello World](/helion/devplatform/workbook/helloworld/php/) <br>
The Hello World sample is as simple as it gets: Hello World! 

2. [Database as a Service (DBaaS)](/helion/devplatform/workbook/database/php/) <br>
Create a database and execute a query against it.

3. [Messaging as a Service (MSGaaS)](/helion/devplatform/workbook/messaging/php/)<br> Enter, send, and display a brief message.

More Helion [PHP](/als/v1/user/deploy/languages/php/) references.

<!-- don't want to expose this but also don't want to lose it
###Language-Specific Development

[HP Helion Buildpacks](/als/v1/user/deploy/buildpack/)

* [Clojure](/als/v1/user/deploy/languages/clojure/)
* [Go](/als/v1/user/deploy/languages/go/)

	* [Tips for Java Developers](http://docs.cloudfoundry.org/buildpacks/java/java-tips.html)
	* [The Eclipse plugin](http://docs.cloudfoundry.org/buildpacks/java/sts.html)
* [Javascript](/als/v1/user/deploy/languages/javascript/)
* [.Net](/als/v1/user/deploy/languages/dotnet/)

	* [Tips for Node Developers](http://docs.cloudfoundry.org/buildpacks/node/node-tips.html)
* [Perl](/als/v1/user/deploy/languages/perl/)

* [Python](/als/v1/user/deploy/languages/python/)
* [Ruby](/als/v1/user/deploy/languages/ruby/)
	* [Tips for Ruby Developers](http://docs.cloudfoundry.org/buildpacks/ruby/ruby-tips.html)
	* [Deploying Ruby on Rails](http://docs.cloudfoundry.org/buildpacks/ruby/gsg-ror.html)

Commands available through the developer API URL and the integration API URL.

- [Root Admin API](http://cloudstack.apache.org/docs/api/apidocs-4.4/TOC_Root_Admin.html)<br>
- [Domain Admin API](http://cloudstack.apache.org/docs/api/apidocs-4.4/TOC_Domain_Admin.html)<br>
- [User API](http://cloudstack.apache.org/docs/api/apidocs-4.4/TOC_User.html)
-->
###Other References
- [ALS command-line interface (CLI) reference](/als/v1/user/reference/client-ref/#command-ref-client)
- [Application Lifecycle Service (ALS) User's Guide](/als/v1/user/)
- [Remote Debugging](/als/v1/user/deploy/app-debug/)
- [The Management Console](/als/v1/user/console/)
- [Logs, Streams, and Drains](/als/v1/user/deploy/app-logs/)

###Best Practices

- [The 12-Factor App](http://12factor.net/)
- [Tips from CloudFoundry](http://docs.cloudfoundry.org/devguide/deploy-apps/prepare-to-deploy.html)

<!-- removed 10/3/14 
###HP Helion OpenStack Development Community
Join the [HP Helion developer forum](https://community.dev.hp.com/t5/Helion-Development-Platform/bd-p/cloud_board) or post on the [HP forums](https://connect.hpcloud.com/).
--->

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation or the OpenStack community.*
