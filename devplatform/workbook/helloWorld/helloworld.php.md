---
layout: default-devplatform
title: "HP Helion Development Platform Workbook PHP Hello World Sample"
permalink: /helion/devplatform/workbook/helloworld/php/
product: devplatform

---
#PHP Sample: Hello World

This sample displays the text "Hello World!". This is a demonstration of the minimum requirements to build a functional application.


##Prerequisites

- HP Helion OpenStack&reg; cloud or micro-cloud deployed
	- [Community](/helion/community/install/)
	- [Commercial](/helion/openstack/install/overview/)
- Application Lifecycle Service [Cluster](/als/v1/admin/cluster/) available
- Logon and password credentials for the cluster.
- Access to  [Helion command-line interface (CLI)](/als/v1/user/client/); this is part of the Helion Developer Platform installation.
##Download the Application Files
[Click here to access the download directory.](https://gitlab.gozer.hpcloud.net/developer-experience/sampleapps) There are several sets of files here; download only the Hello-World-PHP sample files.

### About the Application Files
To create a CloudFoundry&trade; app in PHP, the only mandatory files are the `index.php` and `manifest.yml` files. 

`Manifest.yml` is a configuration file used to specify settings that would otherwise be specified by a command-line tool. For PHP, only the **name** and **buildpack** fields are required. The **buildpack** field is a URL for the `buildpack` that supports the necessary language and/or framework.

The `composer.json` file is completely optional; however, certain buildpacks may issue a warning if the file is not present.
##Deploy the Application

To deploy the application, make sure you are logged in successfully for your desired target environment; for example, *https://api.yourapp.com*.

1. Open the  [Stackato command-line interface (CLI)](http://docs.stackato.com/user/client/index.html#client).

2. If you are not already there, `cd` to the root directory of the sample.
3. Execute `helion push -n` 

##Run the Application

1. Open the Management Console. This is the web-based administrative interface.
2. Click **Applications**.
3. If the file push was successful, you should see Hello World in the list of available applications. 
4. The status of the application should be **Online**. Click the name of the application to launch it. 
5. In the upper right-hand corner, click **View App**.
6. You should see a simple text message: Hello World!

[Exit Samples](/helion/devplatform/) | [Next Sample](/helion/devplatform/workbook/database/php/) 

