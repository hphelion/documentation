---
layout: default-devplatform
title: "HP Helion Development Platform Workbook PHP Messaging Sample"
permalink: /helion/devplatform/workbook/messaging/php/
product: devplatform

---
#PHP RabbitMQ Messaging Sample
Before you can begin working with the samples, ensure that you have met the technical prerequisites.

This is the **third** sample in the series; if you have not already examined the [HelloWorld](/helion/devplatform/workbook/helloworld/php/) sample and the [Database sample](/helion/devplatform/workbook/database/php/), please do those two first.
##Prerequisites
If you are missing any of these items, you will need to [install them](/helion/devplatform/appdev/).

1.	You must have access to an ALS cluster.
2.	The Helion command-line interface (CLI) must be installed.
3.	You must have access to the web-based Helion Management console.
3. The RabbitMQ service must be enabled. If it is not enabled, or you are not sure, follow these steps: 
	- Go to the Administrative console for your ALS cluster. <br>For example: *https://api.xx.xx.xx.xx.xip.io*, substitute your own cluster’s link.
	- On the **Admin** tab, click **Cluster**.
	- Click the **Settings** icon (a gear icon in the upper right corner)
	- Both of the **Rabbit** and **Rabbit3** check boxes should be checked. If they are not, check them.
	- Click **Save**.

**Note**: If a more durable messaging service is needed, follow [these instructions](http://dbaas/docs) to set up a service binding in ALS that uses Helion Messaging as a service cluster instead of an unmanaged RabbitMQ cluster.

##Download the Application Files
Download the files [here](https://gitlab.gozer.hpcloud.net/developer-experience/rabbitmq-php).

##Deploy the Application
Use the Helion client to deploy your app to Helion Development Platform.  If you have Eclipse installed, you have the option to use the [deployment plugin].

1.	Open the [Helion command-line interface (CLI)](/als/v1/user/reference/client-ref/)
2.	Ensure that you are logged in to your desired environment.  <br>If you are not, execute `helion login` 
3.	Ensure that you are targeting your desired environment.  <br> If you are not, execute `helion target https://api.xx.xx.xx.xx.example.com`
4.	If you are not already there, `cd` to the root directory of the sample.
5.	Execute `helion push -n`

##Run the Application
1.	Open the Helion Management Console. <br> The Management Console is the web-based administrative interface that can be reached by typing the ALS endpoint URL into a browser window.
2.	Click **Applications**.
3.	If the file push was successful, you should see **rabbitmq-php** in the list of available applications.

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
	    framework:
	      name: node
	    name: rabbitmq-node
	    mem: 128M
	    url: ${name}.${target-base}
	    services:
	      rabbitmq:
	        type: rabbitmq3
	    instances: 1

The *manifest.yaml* file contains configuration information used by ALS to set up the environment. The *services* element instructs ALS on how to bind the RabbitMQ service provided by the ALS cluster to the application.

##Key Learnings
1.	You need to provide configuration information so that ALS can bind to a RabbitMQ service.
2.	You need to retrieve connection information for RabbitMQ from the application’s environment variables.
3.	You interact with and deploy your app using the Helion CLI or the Eclipse Plugin.

[Exit Samples](/helion/devplatform/) | [Previous Sample](/helion/devplatform/workbook/database/php/)