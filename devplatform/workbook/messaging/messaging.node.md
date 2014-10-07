---
layout: default-devplatform
title: "HP Helion Development Platform Workbook Node Messaging Sample"
permalink: /helion/devplatform/workbook/messaging/node/
product: devplatform

---
#Node Messaging Sample
Before you can begin working with the samples, ensure that you have met the technical prerequisites.

This is the **third** sample in the series; if you have not already examined the [HelloWorld](/helion/devplatform/workbook/helloworld/node/) sample and the [Database sample](/helion/devplatform/workbook/database/node/), please do those two first.
##Prerequisites
**Stackato**

1. You must have a Stackato instance available. 
2. The  [Stackato command-line interface (CLI)](http://docs.stackato.com/user/client/index.html#client) must be installed. 
3. The RabbitMQ service must be enabled. <br> Stackato 3.4 appears have it enabled by default, but Stackato 3.2 does not. 
	- Go to the Administrative console (e.g. *https://api.15.126.212.172.xip.io*, substitute your own instance's link)
	- On the **Admin** tab, click **Cluster**.
	- Click the **Settings** icon (a gear icon in the upper right corner)
	- Both of the **Rabbit** and **Rabbit3** check boxes should be checked. If they are not, check them.
	- Click **Save**.
##Download the Application Files
Download the files [here](https://gitlab.gozer.hpcloud.net/developer-experience/rabbitmq-node).


##Deploy the Application

To deploy the application, make sure you are logged in successfully for your desired target environment; for example, *https://api.yourapp.com*.

1. Open the  [Stackato command-line interface (CLI)](http://docs.stackato.com/user/client/index.html#client).

2. *cd* into the app's root directory.
3. Execute `stackato push -n` 

##Run the Application

1. Open the Management Console. This is the web-based administrative interface.
2. Click **Applications**.
3. If the file push was successful, you should see Hello World in the list of available applications. 
4. The status of the application should be **Online**. Click the name of the application to launch it. 
5. In the upper right-hand corner, click **View App**.
6.You should see a page that has a text field to accept a brief message. Enter text into the field and click **Enter** to send the message. The text of the message should appear.

[Exit Samples](/helion/devplatform/) | [Previous Sample](/helion/devplatform/workbook/database/node/)