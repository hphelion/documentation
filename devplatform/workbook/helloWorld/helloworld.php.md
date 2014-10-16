---
layout: default-devplatform
title: "HP Helion Development Platform Workbook PHP Hello World Sample"
permalink: /helion/devplatform/workbook/helloworld/php/
product: devplatform

---
<!--UNDER REVISION-->
#PHP Hello World Sample

This sample displays the text "Hello World!". This is a demonstration of the minimum requirements to build a functional application. This is a very simple PHP web app. Use this sample to ensure that you have set up your environment for deployment to Helion Development Platform.

##Prerequisites
1. You must have access toa n ALS cluster.
2. The Helion [command-ine interface (CLI)](als/v1/user/reference/client-ref/) must be installed.
3. You must ahve access tot he web-based Helion Management console.

If you are missing any of these items, you must [install them](/helion/devplatform/appdev/).

##Download the Application Files
[Click here to access the download directory.](https://github.com/HelionDevPlatform/helion-mysql-php)

### About the Application Files
To create a CloudFoundry&trade; app in PHP, the only mandatory files are the *index.php* and *manifest.yml* files. 

*Manifest.yml* is a configuration file used to specify settings that would otherwise be specified by a command-line tool. For PHP, only the **name** and **buildpack** fields are required. The **buildpack** field is a URL for the buildpack that supports the necessary language and/or framework.

The *composer.json* file is completely optional; however, certain buildpacks may issue a warning if the file is not present.
##Deploy the Application
The Helion client to deploy your app to Helion Development Platform.  If you are using Eclipse, you can optionally [use the plugin](/helion/devplatform/eclipse/) to deploy.

1.	Open the [Helion command-line interface (CLI)](/als/v1/user/reference/client-ref/)
2.	Ensure that you are logged in to your desired environment.  <br>If you are not, execute `helion login` 
3.	Ensure that you are targeting your desired environment.  <br> If you are not, execute `helion target https://api.xx.xx.xx.xx.example.com`
4.	If you are not already there, `cd` to the root directory of the sample.
5.	Execute `helion push -n`

Note: By default ALS clusters are configured with two domains (private and public). In some situations the Helion CLI may prompt you to select a target domain. If prompted, select the public domain from the given list (i.e. <app-name>.xxx.xxx.xxx.xxx.xip.io)


##Key Code Snippets
	package org.hp.samples;
	<?php
	
	echo "\n Hello World \n";
	
	?>

The manifest.yaml file is the configuration information used by ALS to set up the environment. The buildpack element here instructs ALS on the correct buildpack to use for PHP, and ensures the correct tools and runtimes are installed in the application environment..

##Run the Application
1.	Open the Helion Management Console. <br> This is the web-based administrative interface.
2.	Click **Applications**.
3.	If the file push was successful, you should see **Hello World** in the list of available applications.
4.	The status o the application should be **Online**. click the name of the application to launch it.
5.	In the upper right-hand corner, click **View App**.
6.	You should see a simple text message: **Hello World!**

##Key Learnings

1. You will need to rpovide configuration informatoin, including build-pack information for PHP, so that ALS can create an environment for your application. 
2. You can deploy your app using the Helion CLI or the Eclipse Plugin.

[Exit Samples](/helion/devplatform/appdev) | [Previous Sample](/helion/devplatform/workbook/messaging/php/) | [Next Sample](/helion/devplatform/workbook/database/php/)