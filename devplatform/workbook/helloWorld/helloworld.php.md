---
layout: default-devplatform
title: "HP Helion Development Platform Workbook PHP Hello World Sample"
permalink: /helion/devplatform/workbook/helloworld/php/
product: devplatform

---
# Hello World PHP

**ALS**

1. You must have an [ALS instance](/helion/devplatform/community/install-als/) available. 
2. The  [ALS command-line interface (CLI)](
3. ://docs.stackato.com/user/client/index.html#client) must be installed. 
3. You must have access to the web-based Administration console.
##Download the Application Files
[Click here to access the download directory.](https://gitlab.gozer.hpcloud.net/developer-experience/sampleapps) There are several sets of files here; download only the Hello-World-PHP sample files.

### About the Application Files
To create a CloudFoundry&trade; app in PHP, the only mandatory files are the `index.php` and `manifest.yml` files. 

`Manifest.yml` is a configuration file used to specify settings that would otherwise be specified by a command-line tool. For PHP, only the **name** and **buildpack** fields are required. The **buildpack** field is a URL for the `buildpack` that supports the necessary language and/or framework.

The `composer.json` file is completely optional; however, certain buildpacks may issue a warning if the file is not present.
##Install Dependencies
Run the following command to install dependencies **after** you have downloaded the application files:
  
    php composer.phar install 

Or, if you have a global install of Composer:

	composer install

##Deploy the Application

To deploy the application, make sure you are logged in successfully for your desired target environment; for example, *https://api.example.com*.

1. Open the  [ALS command-line interface (CLI)](http://docs.stackato.com/user/client/index.html#client).
2.	Execute <br>`stackato target https://api.example.com`<br>substituting your own instance's link.
3.	Execute <br>`stackato login`<br> using the Stackato management console username and password.
4. Change directory (`cd`) the app's root directory.
5. Execute <br>`stackato push -n`  

##Run the Application

1. Open the Management Console. This is the web-based administrative interface.
2. Click **Applications**.
3.  If the file push was successful, you should see the name of this application in the list of available applications.
4. The status of the application should be **Online**. Click the name of the application to launch it.
	- If there are still any issues, click the **Log Stream** link on the app’s page to see a real-time stream of what’s going on with the app.    
5. In the upper right-hand corner, click **View App**.
6. You should see a simple text message: Hello World!

[Exit Workbook](/helion/devplatform/) | [Next Sample](/helion/devplatform/workbook/database/php/) 

