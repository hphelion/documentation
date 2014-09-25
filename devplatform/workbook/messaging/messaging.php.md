---
layout: default-devplatform
title: "HP Helion Development Platform Workbook PHP Messaging Sample"
permalink: /helion/devplatform/workbook/messaging/php/
product: devplatform

---
#PHP Messaging Sample
Before you can begin working with the samples, ensure that you have met the technical prerequisites.

This is the **third** sample in the Workbook; if you have not already examined the [HelloWorld](/helion/devplatform/workbook/helloworld/php/) sample and the [Database sample](/helion/devplatform/workbook/database/php/), please do those two first.
##Prerequisites
**ALS**

1. You must have a [ALS instance](/helion/devplatform/community/install-als/) available. 
2. The  [Helion command-line interface (CLI)](http://docs.stackato.com/user/client/index.html#client) must be installed. 
3. The RabbitMQ service must be enabled. <br> ALS 3.4 appears have it enabled by default, but ALS 3.2 does not. 
	- Open the **Management Console**.  This is the web-based administrative interface.<br> For example: *https://api.example.com*. 
	- On the **Admin** tab, click **Cluster**.
	- Click the **Settings** icon (a gear icon in the upper right corner)
	- Both of the **Rabbit** and **Rabbit3** check boxes should be checked. If they are not, check them.
	- Click **Save**.
4. You will need [Composer](https://getcomposer.org/) to install the dependencies for a PHP app.

##Download the Application Files
Download the [PHP files](https://gitlab.gozer.hpcloud.net/developer-experience/rabbitmq-php) from the code repository.

##Install Dependencies
**After** you have downloaded the application files:

1. Open your terminal and navigate to this app's root directory. The root directory is the directory that contains the *manifest.yml* file.

2. Run the following command to install dependencies
	
	`php composer.phar install` 

3. Or, if you have a global install of Composer:

	`composer install`

##Deploy the Application

To deploy the application, make sure you are logged in successfully for your desired target environment; for example, *https://api.example.com*.

1. Open the  [Helion command-line interface (CLI)](http://docs.stackato.com/user/client/index.html#client).
2.	Execute <br>`stackato target https://api.example.com`<br>substituting your own instance's link.
3.	Execute <br>`stackato login`<br> using the Stackato management console username and password.
4. Change directory (`cd`) the app's root directory.
5. Execute <br>`stackato push -n`  

##Run the Application

1. Open the **Management Console**. This is the web-based administrative interface.<br> For example: *https://api.example.com*. 
2. Click **Applications**.
3. If the file push was successful, you should see the name of this application in the list of available applications. 
4. The status of the application should be **Online**. Click the name of the application to launch it.
	- If there are still any issues, please check the **Log Stream** link on the app's page to see a real-time stream of what's going on with the app.    
5. In the upper right-hand corner, click **View App**.
6. You should see a page that will accept a user's message.

[Exit Workbook](/helion/devplatform/) | [Previous Sample](/helion/devplatform/workbook/database/php/)