---
layout: default-devplatform
title: "HP Helion Development Platform Workbook PHP Messaging Sample"
permalink: /helion/devplatform/workbook/messaging/php/
product: devplatform

---
<!--UNDER REVISION-->

#PHP RabbitMQ Messaging Sample

This sample displays a simple form that takes a string from the user, adds the message to a queue, reads it from the queue and prints the message back to the screen. This is a demonstration of the minimum requirements to build an application that can connect to a RabbitMQ cluster provided by ALS, and interact with it. This is a very simple PHP web app. Use this sample to ensure that you have set up your environment correctly for connecting to, and working with RabbitMQ on the Helion Development Platform. 

## Prerequisites

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

**NOTE:** If an application needs increased message throughput and/or increased availability beyond the single instance, unmanaged RabbitMQ service provided by ALS, please follow these instructions to [create and manage a RabbitMQ cluster](/helion/devplatform/messageservice/) in the Messaging Service, and link that instance to your ALS cluster follow these instructions to [use the Messaging Service with your application](/helion/devplatform/msgaas/als). 


##Download the Application Files

Download the files [here](https://gitlab.gozer.hpcloud.net/developer-experience/rabbitmq-php).

##Deploy the Application

Use the Helion client to deploy your app to Helion Development Platform.  If you have Eclipse installed, you have the option to use the [deployment plugin](/helion/devplatform/eclipse/).

1.	Open the [Helion command-line interface (CLI)](/als/v1/user/reference/client-ref/)
2.	Ensure that you are logged in to your desired environment.  <br>If you are not, execute `helion login` 
3.	Ensure that you are targeting your desired environment.  <br> If you are not, execute `helion target https://api.xx.xx.xx.xx.example.com`
4.	If you are not already there, `cd` to the root directory of the sample.
5.	Execute `helion push -n`

##Key Code Snippets

	$url = parse_url(getenv('RABBITMQ_URL'));
	$conn = new AMQPConnection($url['host'], $url['port'], $url['user'], $url['pass'], substr($url['path'], 1));
	$ch = $conn->channel();

	// Create a queue
	$queue = 'basic_get_queue';
	$ch->queue_declare($queue, false, true, false, false); 

	// Create an exchange
	$exchange = 'amq.direct';
	$ch->exchange_declare($exchange, 'direct', true, true, false);
	$ch->queue_bind($queue, $exchange);

	// Publish the user's message
	$msg_body = $_POST["message"];
	$msg = new AMQPMessage($msg_body, array('content_type' => 'text/plain', 'delivery_mode' => 2));
	$ch->basic_publish($msg, $exchange);

	// Retrieve the message that was sent
	$retrived_msg = $ch->basic_get($queue);
	$msgContents = $retrived_msg->body;
	echo $msgContents;
	$ch->basic_ack($retrived_msg->delivery_info['delivery_tag']);

	$ch->close();
	$conn->close(); 

This section of the ProcessForm.php file shows how to retrieve the connection information for the RabbitMQ cluster from the application’s environment variables. The code then creates a queue, an exchange, post the message to the queue, reads the message from the queue then writes it back out to the user. 

	---
	---
	applications:
	- name: rabbitmq-php
	buildpack: https://github.com/cloudfoundry/php-buildpack.git
	services:
	rabbitmq:
	type: rabbitmq3 

The manifest.yaml file is the configuration information used by ALS to set up the environment. The services element listed above instructs ALS on how to bind the RabbitMQ service provided by the ALS cluster to the application. The file also uses the buildpack element that is used by ALS to configure the application environment for using PHP. 


##Run the Application
1.	Open the Helion Management Console. <br> The Management Console is the web-based administrative interface that can be reached by typing the ALS endpoint URL into a browser window.
2.	Click **Applications**.
3.	If the file push was successful, you should see **rabbitmq-php** in the list of available applications.


##Key Learnings
1. You need to provide configuration information so that ALS can bind to a RabbitMQ service.
2. You will need to provide information about which build pack to use for PHP, so that ALS can create an environment for you app.
3. You need to retrieve connection information for RabbitMQ from the application’s environment variables.
4. You interact with and deploy your app using the Helion CLI or the Eclipse Plugin.

