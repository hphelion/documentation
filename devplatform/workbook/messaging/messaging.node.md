---
layout: default-devplatform
title: "HP Helion Development Platform Workbook Node Messaging Sample"
permalink: /helion/devplatform/workbook/messaging/node/
product: devplatform

---
<!--UNDER REVISION-->
#Node RabbitMQ Messaging Sample
This sample displays a simple form that takes a stirng from the user, adds the message to a queue, reads it from the queue and prints the message back to the screen. 

This is a demonstration of the minimum requirements to build an application that can connect to a RabbitMQ cluster provided by ALS, and interact with it. This is a very simple Node.js web app.  Use this sample to ensure that you have set up your environment correctly for connecting to, and working with RabbitMQ on the Helion Development Platform.

##Prerequisites

1.	You must have access to an ALS cluster.
2.	The Helion command-line interface (CLI) must be installed.
3.	You must have access to the web-based Helion Management console.

If you are missing any of these items, you will need to [install them](/helion/devplatform/appdev/).

##RabbitMQ

If the RabbitMQ service is not enabled on your cluster, or if you are not sure, follow these steps:

- Go to the Administrative console for your ALS cluster. (e.g. https://api.xx.xx.xx.xx.xip.io);  substitute your own cluster’s link)
- On the **Admin** tab, click **Cluster**.
- Click the **Settings** icon (a gear icon in the upper right corner)
- Both of the **Rabbit** and **Rabbit3** check boxes should be checked. If they are not, check them.
- Click **Save**.

**Note**: If an application needs increased message throughput and/or increased availability beyond the single instance, unmanaged RabbitMQ service provided by ALS,   please follow [these instructions](http://dbaas/docs) create and manage a RabbitMQ cluster in the Messaging Service, and link that instance to your ALS cluster.

##Download the Application Files
[Click here to access the download directory.](https://github.com/HelionDevPlatform/helion-rabbitmq-node).

##Deploy the Application
The Helion client to deploy your app to Helion Development Platform.  If you are using Eclipse, you can optionally use the [deployment plugin](/helion/devplatform/eclipse/).

1.	Open the [Helion command-line interface (CLI)](/als/v1/user/reference/client-ref/)
2.	Ensure that you are logged in to your desired environment.  <br>If you are not, execute `helion login` 
3.	Ensure that you are targeting your desired environment.  <br> If you are not, execute `helion target https://api.xx.xx.xx.xx.example.com`
4.	If you are not already there, `cd` to the root directory of the sample.
5.	Execute `helion push -n`
6.	Accept any default values that you may be prompted for.  
**Note:** By default ALS clusters are configured with two domains (private and public). In some situations the Helion CLI may prompt you to select a target domain. If prompted, select the public domain from the given list (i.e. &lt;app-name&gt;.xxx.xxx.xxx.xxx.xip.io) 


##Key Code Snippets
	app.configure(function(){
	  app.set('port', process.env.VCAP_APP_PORT || 3000);
	  app.set('views', __dirname + '/views');
	  app.set('view engine', 'jade');
	  app.use(express.bodyParser());
	  app.use(express.static(path.join(__dirname, 'public')));
	});


This section of the App.js file shows how to retrieve the connection information for the RabbitMQ cluster from the application’s environment variables.
	
	---
	applications:
	  .:
	    name: rabbitmq-node
	    mem: 128M
	    services:
	      rabbitmq:
	        type: rabbitmq3
	    instances: 1

The *manifest.yaml* file is the configuration information used by ALS to set up the environment. The *services* element listed above instructs ALS on how to bind the RabbitMQ service provided by the ALS cluster to the application.

##Run the Application
1.	Open the Helion Management Console. This is the web-based administrative interface.
2.	Click **Applications**.
3.	If the file push was successful, you should see **rabbitmq-node** in the list of available applications.
4.	The status of the application should be `Online`. Click the name of the application to launch it.
5.  In the upper right-hand corner, click **View App**.

##Key Learnings
1.	You will need to provide configuration information so that ALS can bind to a RabbitMQ service.
2.	You will need to retrieve connection information for RabbitMQ from the application's environment variables.
3.	You interact with and deploy your app using the Helion CLI or the Eclipse Plugin.