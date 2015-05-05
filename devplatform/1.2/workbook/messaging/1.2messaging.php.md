---
layout: default-devplatform
title: "HP Helion 1.2 Development Platform: PHP RabbitMQ Messaging Sample"
permalink: /helion/devplatform/workbook/messaging/php/
product: devplatform2.0
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
role1: Application Developer
role2: Security Engineer
role3: ISV Developer 
role4: Service Developer
authors: Jayme P
SME1: Sam C

---
<!--UNDER REVISION-->

# HP Helion 1.2 Development Platform: PHP RabbitMQ Messaging Sample
[See the Helion 1.0 Development Platform version of this page](/helion/devplatform/workbook/messaging/php/)

This very simple PHP web app displays a simple form that takes a string from the user, adds the message to a queue, reads it from the queue and prints the message back to the screen. This is a demonstration of the minimum requirements to build an application that can connect to a RabbitMQ cluster provided by ALS and interact with it. Use this sample to ensure that you have set up your environment correctly for connecting to and working with RabbitMQ on the Helion Development Platform. 

## Prerequisites {#prereq}

- An installation of the [HP Helion Development Platform](/helion/devplatform/install/).
- Access to an Application Lifecycle Service (ALS) [Cluster](/helion/devplatform/als/admin/cluster/)
- Access to the [Helion command-line client (CLI)](/helion/devplatform/als/user/client/).
- Access to the web-based [ALS Management Console](/helion/devplatform/als/user/console/).
- The RabbitMQ service is not enabled by default. Check and [make sure it is enabled](#rabbitmq).
- Register for access to the [HP Helion Development Platform](https://helion.hpwsportal.com/catalog.html#/Home/Show) (HDN).

<!--## One-Button Deployment to HP Helion

You can deploy this app automatically with the button below or with the manual 
instructions further down. But before you push the button, ensure that you have taken care of the [prerequisites](#prereq).

<a href="https://deploynow.hpcloud.com/?repoUrl=https://github.com/HelionDevPlatform/helion-rabbitmq-php"><img src="media/deploynow.png"/></a>
-->
## Deployment Steps

### Enable the RabbitMQ Service {#rabbitmq}
If the RabbitMQ service is not enabled, or you are not sure, follow these steps:

1. Go to the Administrative console for your ALS cluster. (e.g. *https://api.xx.xx.xx.xx.xip.io*);  substitute your own cluster's link)
1. On the **Admin** tab, click **Cluster**.
2. Click **Cluster Nodes** on the left side of the page.
1. Click the **Settings** icon (a gear icon in the upper right corner)
1. Both of the **Rabbit** and **Rabbit3** check boxes should be checked. If they are not, check them.
1. Click **Save**.

**NOTE:** If an application needs increased message throughput and/or increased availability beyond the single-instance, unmanaged RabbitMQ service provided by ALS, please follow these instructions to [create and manage a RabbitMQ cluster](/helion/devplatform/messageservice/) in the Messaging Service, and link that instance to your [ALS cluster](/helion/devplatform/msgaas/als/).

### Download the Application Files
[Click here to access the code repository](https://github.com/HelionDevPlatform/helion-rabbitmq-php/).

*Manifest.yml* is a configuration file used to specify settings. For PHP, only the **name** and **buildpack** fields are required. The **buildpack** field is a URL for the buildpack that supports the necessary language and/or framework.

This app uses the [Cloud Foundry PHP buildpack](https://github.com/cloudfoundry/php-buildpack). For more technical details about buildpacks and the *composer.json* file, please see the README included in the [download package](https://github.com/HelionDevPlatform/helion-rabbitmq-php/).

### Deploy the Application
**Note**: Application Lifecycle Service clusters that require an upstream HTTP proxy to access the internet will need to be [made aware of the proxy](/helion/devplatform/als/admin/server/configuration/#staging-cache-app-http-proxy). The sample applications require access to the Internet in order to download dependent packages. 

Use the Helion client to deploy your app to Helion Development Platform.  If you have Eclipse installed, you have the option to use the [plugin](/helion/devplatform/eclipse/).

1.	Open the [ALS command-line interface (CLI)](/helion/devplatform/als/user/reference/client-ref/)
3.	Ensure that you are targeting your desired environment.  <br /> If you are not, execute
	
		helion target https://api.xx.xx.xx.xx.xip.io	


1. Ensure that you are logged in to your desired environment.  <br />If you are not, execute
	
		helion login
		
4.	If you are not already there, `cd` to the root directory of the sample. The 
  root directory contains the *manifest.yml* file which helps automate deployment.
5.	Deploy the application by using the command:
	
		helion push
	
6.	Press Enter to accept any default values that you may be prompted for. <br />**Note**: By default, ALS clusters are configured with two domains (private and public). In some situations, the Helion CLI may prompt you to select a target domain. If prompted, select the public domain from the given list (i.e. *<app-name>.xxx.xxx.xxx.xxx.xip.io*)

### View and Run the Application
1. Open the **ALS Management Console**.  <br /> The Management Console is the web-based administrative interface that can be reached by typing the ALS endpoint URL into a browser window.
1. Click **Applications**.
1. If the file push was successful, you should see **Rabbit MQ** in the list of available applications. Note that the name, along with other variable values, was supplied through the *manifest.yml* file.
1. In the upper right-hand corner, click **View App** to see the app in action.
	-  This application provides a page that accepts a message from the user and then displays it.

##Key Code Snippets
This section of the ProcessForm.php file shows how to retrieve the connection information for the RabbitMQ cluster from the application's environment variables. The code then creates a queue, an exchange, post the message to the queue, reads the message from the queue then writes it back out to the user.

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

 The *manifest.yml* file is the configuration information used by ALS to set up the environment. The **services** element informs ALS on how to bind the RabbitMQ service provided by the ALS cluster to the application. <br />The file also provides the **buildpack** element used by ALS to configure the application environment for using PHP.<br />In addition to specifying a buildpack, the file includes a pre-staging hook that directs the ALS cluster to download and install the Composer Dependency Manager package for PHP. 

	---
	applications:
	- name: rabbitmq-php
	buildpack: https://github.com/cloudfoundry/php-buildpack.git
	services:
	rabbitmq:
	type: rabbitmq3 

##Key Learnings

- You need to provide configuration information so that ALS can bind to the RabbitMQ service. Configuration information is contained in the *manifest.yml* file.
- ALS requires configuration information to create an environment for your app, including buildpack information for PHP. Configuration information is contained in the *manifest.yml* file.
- You will need to retrieve connection information for RabbitMQ from the application's environment variables.
- You interact with and deploy your app using the [ALS command line client](/helion/devplatform/als/user/reference/client-ref/) or the web-based [ALS Management Console](/helion/devplatform/als/user/console/).

[Exit Samples](/helion/devplatform/appdev/) | [Previous Sample](/helion/devplatform/workbook/database/php/) | [Next Sample](/helion/devplatform/workbook/helloworld/php/)
 
