---
layout: default-devplatform
title: "HP Helion 1.2 Development Platform: Java RabbitMQ Messaging Sample"
permalink: /helion/devplatform/1.2/workbook/messaging/java/
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
# HP Helion 1.2 Development Platform: Java RabbitMQ Messaging Sample
[See the Helion 1.0 Development Platform version of this page](/helion/devplatform/workbook/messaging/java/)
This very simple Servlet-based Java web app displays a simple form that takes a string from the user, adds the message to a queue, reads it from the queue and prints the message back to the screen. This is a demonstration of the minimum requirements to build an application that can connect to a RabbitMQ cluster provided by ALS and interact with it. Use this sample to ensure that you have set up your environment correctly for connecting to and working with RabbitMQ on the Helion Development Platform.

## Prerequisites
If you are missing any of these items, please [install them](/helion/devplatform/1.2/appdev/).

1.	You must have access to an [ALS cluster](/helion/devplatform/1.2/als/admin/cluster/).
2.	The [Helion command-line interface](/helion/devplatform/1.2/als/user/client/) (CLI) must be installed.
3.	You must have access to the web-based [Helion Management console](/helion/devplatform/1.2/als/user/console/).

###RabbitMQ

If the RabbitMQ service is not enabled on your cluster, or if you are not sure, follow these steps:

1. Go to the Administrative console for your ALS cluster. (e.g. *https://api.xx.xx.xx.xx.xip.io*);  substitute your own cluster's link)
1. On the **Admin** tab, click **Cluster**.
2. Click **Cluster Nodes** on the left side of the page.
1. Click the **Settings** icon (a gear icon in the upper right corner)
1. Both of the **Rabbit** and **Rabbit3** check boxes should be checked. If they are not, check them.
1. Click **Save**.

**Note**: If an application needs increased message throughput and/or increased availability beyond the single-instance, unmanaged RabbitMQ service provided by ALS, please follow [these instructions](/helion/devplatform/1.2/messageservice/) to create and manage a RabbitMQ cluster in the Messaging Service and link that instance to your ALS cluster.

###JDK

Install the Java Development Kit (JDK) before installing other prerequisites.   

- Mac/UNIX: the JDK can be installed with the following command.

  	 	sudo apt-get install default-jdk

- PC: Navigate to the [JDK installation page](http://www.oracle.com/technetwork/java/javase/downloads/index.html) and run the appropriate JDK installer for your chosen platform.


###Maven

[Maven](http://maven.apache.org/ "Maven") must be installed. 

- Mac/UNIX: Maven can be installed with the following command: 

		sudo apt-get install maven 

- PC: Navigate to the [Maven installation page](http://maven.apache.org/download.cgi) and follow the [installation directions](http://maven.apache.org/guides/getting-started/windows-prerequisites.html).

##Download the Application Files
[Click here to access the code repository](https://github.com/HelionDevPlatform/helion-rabbitmq-java).

##Build the Application
If you are not already there, `cd` to the root directory of the sample and execute:

	mvn clean package

This builds the application with Maven. It will create the *rabbitmq-java-1.0.war* file  within the target directory. 

##Deploy the Application
**Note**: Application Lifecycle Service clusters that require an upstream HTTP proxy to access the internet will need to be [made aware of the proxy](/helion/devplatform/1.2/als/admin/server/configuration/#staging-cache-app-http-proxy). The sample applications require access to the Internet in order to download dependent packages.

Use the Helion client to deploy your app to Helion Development Platform. If you are using Eclipse, you have the option to use the [plugin](/helion/devplatform/1.2/eclipse/).

1.	Open the [Helion command-line interface (CLI)](/helion/devplatform/1.2/als/user/reference/client-ref/)
3.	Ensure that you are targeting your desired environment.  <br /> If you are not, execute
	
		helion target https://api.xx.xx.xx.xx.xip.io	


1. Ensure that you are logged in to your desired environment.  <br />If you are not, execute
	
		helion login
		
4.	If you are not already there, `cd` to the root directory of the sample.
5.	Deploy the application by using the command:
	
		helion push
	
6.	Accept any default values that you may be prompted for. <br />**Note**: By default, ALS clusters are configured with two domains (private and public). In some situations, the Helion CLI may prompt you to select a target domain. If prompted, select the public domain from the given list (i.e. *&lt;app-name&gt;.xxx.xxx.xxx.xxx.xip.io*)


##Key Code Snippets
This first Line in this section of the RabbitServlet.java file shows how to retrieve the connection information for the RabbitMQ cluster from the application's environment variables. The rest of the code makes a connection to the cluster, creates a channel, and defines a message queue called **hello**.

	String uri = System.getenv("RABBITMQ_URL");

        ConnectionFactory factory = new ConnectionFactory();
        try {
            factory.setUri(uri);
        } catch (KeyManagementException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        Connection connection = factory.newConnection();
        Channel channel = connection.createChannel();

        channel.queueDeclare("hello", false, false, false, null);

        writer.close();

This section of the ProcessMessage.java file shows how to publish to a message queue, retrieve the published message, convert the message from a byte array to a string, and print it out to the user.

	String routingKey = "thekey";
        String exchangeName = "exchange";

        // Declare an exchange and bind it to the queue
        channel.exchangeDeclare(exchangeName, "direct", true);
        channel.queueBind("hello", exchangeName, routingKey);

        // Grab the message from the HTML form and publish it to the queue
        String message = request.getParameter("message");
        channel.basicPublish(exchangeName, routingKey, null, message.getBytes());
        writer.println(" Message sent to queue '" + message + "'");

        boolean autoAck = false;

	GetResponse responseMsg = channel.basicGet("hello", autoAck);

        if (responseMsg == null) {
            // No message retrieved.
        } else {
            byte[] body = responseMsg.getBody();
            // Since getBody() returns a byte array, convert to a string for
            // the user.
            String bodyString = new String(body);
            long deliveryTag = responseMsg.getEnvelope().getDeliveryTag();

            writer.println("Message received: " + bodyString);

            // Acknowledge that we received the message so that the queue
            // removes the message so that it's not sent to us again.
            channel.basicAck(deliveryTag, false);
        }

The *POM.xml* file is the configuration information generated by Maven and used by ALS to set up the environment. You can see that it has added a dependency for the **amqp-client**.
	
	<?xml version="1.0" encoding="UTF-8"?>
	<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	        xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
	    <modelVersion>4.0.0</modelVersion>
	    <groupId>org.hp.samples</groupId>
	    <artifactId>rabbitmq-java</artifactId>
	    <version>1.0</version>
	    <packaging>war</packaging>
	    <dependencies>
	        <dependency>
	            <groupId>javax.servlet</groupId>
	            <artifactId>servlet-api</artifactId>
	            <version>2.5</version>
	            <scope>provided</scope>
	        </dependency>
	        <dependency>
	  			<groupId>com.rabbitmq</groupId>
	  			<artifactId>amqp-client</artifactId>
	  			<version>2.8.1</version>
			</dependency>
	    </dependencies>
	</project>

The *manifest.yml* file is the configuration information used by ALS to set up the environment. The **services** element informs ALS on how to bind the RabbitMQ service provided by the ALS cluster to the application.

	---
	applications: 
	- name: rabbitmq-java
	  mem: 512M
	  path: target/rabbitmq-java-1.0
	  services:
	    rabbitmq:
	      type: rabbitmq3

##Run the Application
1.	Open the Helion Management Console. <br /> The Management Console is the web-based administrative interface that can be reached by typing the ALS endpoint URL into a browser window.
2.	Click **Applications**.
3.	If the file push was successful, you should see **rabbitmq-java** in the list of available applications.
4.	The status of the application should be **Started**. Click the name of the application to launch it.
5.	In the upper right-hand corner, click **View App**.

	

##Key Learnings
1.	You will need to provide configuration information so that ALS can bind to a RabbitMQ service.
2.	You need to provide configuration information so that ALS can create an environment for your app. Tools such as Maven generate the *pom.xml* files for you.
3.	You need to retrieve connection information for RabbitMQ from the application's environment variables.
4.	You interact with and deploy your app using the Helion CLI or the [Eclipse deployment plugin](/helion/devplatform/1.2/eclipse/).

[Exit Samples](/helion/devplatform/1.2/appdev/) | [Previous Sample](/helion/devplatform/1.2/workbook/database/java/) | [Next Sample](/helion/devplatform/1.2/workbook/helloworld/java/)
