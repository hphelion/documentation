---
layout: default-devplatform
title: "HP Helion Development Platform Workbook PHP Hello World Sample"
permalink: /helion/devplatform/workbook/helloworld/php/
product: devplatform

---
<!—UNDER REVISION-->
#PHP Hello World Sample

This very simple PHP web app displays the text "Hello World!". This is a demonstration of the minimum requirements to build a functional application.  Use this sample to ensure that you have set up your environment for deployment to Helion Development Platform.

##Prerequisites
If you are missing any of these items, you must [install them](/helion/devplatform/appdev/).

- Access to an Application Lifecycle Service (ALS) [Cluster](/als/v1/admin/cluster/)
- The  [Helion command-line interface (CLI)](/als/v1/user/client/) must be installed.
- Access to the web-based Helion Management console.
##Download the Application Files
[Click here to access the download directory.](https://github.com/HelionDevPlatform/helion-hello-world-phps)

### About the Application Files
To create a CloudFoundry&trade; app in PHP, the only mandatory files are the *index.php* and *manifest.yml* files. 

*Manifest.yml* is a configuration file used to specify settings that would otherwise be specified by a command-line tool. For PHP, only the **name** and **buildpack** fields are required. The **buildpack** field is a URL for the buildpack that supports the necessary language and/or framework.

The *composer.json* file is completely optional; however, certain buildpacks may issue a warning if the file is not present.
##Deploy the Application
Use the Helion client to deploy your app to Helion Development Platform.  If you have Eclipse installed, you have the option to use the [deployment plugin](/helion/devplatform/eclipse/).

1.	Open the [Helion command-line interface (CLI)](/als/v1/user/reference/client-ref/)
2.	Ensure that you are logged in to your desired environment.  <br>If you are not, execute `helion login` 
3.	Ensure that you are targeting your desired environment.  <br> If you are not, execute `helion target https://api.xx.xx.xx.xx.example.com`
4.	If you are not already there, `cd` to the root directory of the sample.
5.	Execute `helion push -n`

##Run the Application
1.	Open the Helion Management Console. <br> The Management Console is the web-based administrative interface that can be reached by typing the ALS endpoint URL into a browser window.
2.	Click **Applications**.
3.	If the file push was successful, you should see **hello-world-php** in the list of available applications.

##Key Code Snippets
	package org.hp.samples;
	<?php
	
	echo "\n Hello World \n";
	
	?>

This simple PHP script prints "Hello World".

	---
	applications:
	- name: hello-world-php  
	  buildpack: https://github.com/cloudfoundry/php-buildpack.git

The *manifest.yaml* file is the configuration information used by ALS to set up the environment. <br>
The *buildpack* element provides ALS with the correct buildpack to use for PHP, which ensures the correct tools and runtimes are installed in the application environment.


[Exit Samples](/helion/devplatform/) | [Next Sample](/helion/devplatform/workbook/database/php/) 

