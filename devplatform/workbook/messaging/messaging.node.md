---
layout: default-devplatform
title: "HP Helion Development Platform Node Messaging Sample"
permalink: /helion/devplatform/workbook/messaging/node/
product: devplatform

---
<!--PUBLISHED-->
# HP Helion 1.0 1.0 Development Platform: Node RabbitMQ Messaging Sample
This  very simple Node.js web app displays a simple form that takes a string from the user, adds the message to a queue, reads it from the queue and prints the message back to the screen. This is a demonstration of the minimum requirements to build an application that can connect to a RabbitMQ cluster provided by ALS and interact with it. Use this sample to ensure that you have set up your environment correctly for connecting to, and working with RabbitMQ on the Helion Development Platform.

##Prerequisites
If you are missing any of these items, you must [install them](/helion/devplatform/appdev/).

- Access to an Application Lifecycle Service (ALS) [Cluster](/als/v1/admin/cluster/)
- The  [Helion command-line interface (CLI)](/als/v1/user/client/) must be installed.
- Access to the web-based [Helion Management Console](/als/v1/user/console/).

##RabbitMQ

If the RabbitMQ service is not enabled on your cluster, or if you are not sure, follow these steps:

1. Go to the Administrative console for your ALS cluster. (e.g. *https://api.xx.xx.xx.xx.xip.io*);  substitute your own cluster's link)
1. On the **Admin** tab, click **Cluster**.
1. Click the **Settings** icon (a gear icon in the upper right corner)
1. Both of the **Rabbit** and **Rabbit3** check boxes should be checked. If they are not, check them.
1. Click **Save**.

**Note**: If an application needs increased message throughput and/or increased availability beyond the single-instance, unmanaged RabbitMQ service provided by ALS, please follow [these instructions](/helion/devplatform/messageservice) to create and manage a RabbitMQ cluster in the Messaging Service and link that instance to your ALS cluster.

##Download the Application Files
[Click here to access the code repository](https://github.com/HelionDevPlatform/helion-rabbitmq-node).

##Deploy the Application
**Note**: Application Lifecycle Service clusters that require an upstream HTTP proxy to access the internet will need to be [made aware of the proxy](/als/v1/admin/server/configuration/#staging-cache-app-http-proxy). The sample applications require access to the Internet in order to download dependent packages.

Use the Helion client to deploy your app to Helion Development Platform.  If you have Eclipse installed, you have the option to use the [plugin](/helion/devplatform/eclipse/).

1.	Open the [Helion command-line interface (CLI)](/als/v1/user/reference/client-ref/)
3.	Ensure that you are targeting your desired environment.  <br> If you are not, execute
	
		helion target https://api.xx.xx.xx.xx.example.com2	


1. Ensure that you are logged in to your desired environment.  <br>If you are not, execute
	
		helion login
		
4.	If you are not already there, `cd` to the root directory of the sample.
5.	Deploy the application by using the command:
	
		helion push
	
6.	Accept any default values that you may be prompted for. <br>**Note**: By default, ALS clusters are configured with two domains (private and public). In some situations, the Helion CLI may prompt you to select a target domain. If prompted, select the public domain from the given list (i.e. *<app-name>.xxx.xxx.xxx.xxx.xip.io*)


##Key Code Snippets
This section of the messaging.js file shows how to retrieve the connection information for the RabbitMQ cluster from the application's environment variables. The code then creates a connection to the cluster and publishes a message to a queue.
		
	//get the rabbitMQ connection string from the environment variables.
	var connectionString = process.env.RABBITMQ_URL || "amqp://localhost";

	//Connect to RabbitMQ.
	var rabbitMqConnection = amqp.createConnection({ url: connectionString });
	
	...

	rabbitMqConnection.once('ready', function() {
    	rabbitMqConnection.queue('msg-queue', {} , function(queue) {
    	  rabbitMqConnection.publish('msg-queue', { message: newMessage });

This section of the messaging.js file shows how to create a connection to the RabbitMQ cluster then subscribe to a message queue and extract the message text.

	//Connect to RabbitMQ.
	var rabbitMqConnection = amqp.createConnection({ url: connectionString });
	
	...
	
	rabbitMqConnection.once('ready', function() {
    	rabbitMqConnection.queue('msg-queue', {} , function(queue) {
    	  queue.subscribe(function(msg) {
        	var message = msg.message;

The *manifest.yml* file is the configuration information used by ALS to set up the environment. The *services* element listed below instructs ALS on how to bind the RabbitMQ service provided by the ALS cluster to the application.

	---
	applications:
	  .:    framework:
	      name: node
  	 name: rabbitmq-node
  	 mem: 128M
  	 services:
     	 rabbitmq:
     	   type: rabbitmq3
    	instances: 1

##Run the Application
1.	Open the Helion Management Console. This is the web-based administrative interface.
2.	Click **Applications**.
3.	If the file push was successful, you should see **rabbitmq-node** in the list of available applications.
4.	The status of the application should be **Started**. Click the name of the application to launch it.
5.  In the upper right-hand corner, click **View App**.

##Key Learnings
1.	You will need to provide configuration information so that ALS can bind to a RabbitMQ service.
2.	You will need to retrieve connection information for RabbitMQ from the application's environment variables.
3.	You interact with and deploy your app using the Helion CLI or the [Eclipse deployment plugin](/helion/devplatform/eclipse/).

[Exit Samples](/helion/devplatform/appdev) | [Previous Sample](/helion/devplatform/workbook/database/node/) | [Next Sample](/helion/devplatform/workbook/helloworld/node/)
