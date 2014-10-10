---
layout: default-devplatform
title: "HP Helion Development Platform Workbook Java Messaging Sample"
permalink: /helion/devplatform/workbook/messaging/java/
product: devplatform
---
<!—UNDER REVISION-->
#Java RabbitMQ Messaging Sample
This very simple Servlet-based Java web app displays a simple form that takes a string from the user, adds the message to a queue, reads it from the queue and prints the message back to the screen.

This is a demonstration of the minimum requirements to build an application that can connect to and interact with a RabbitMQ cluster provided by ALS. Use this sample to ensure that you have set up your environment correctly for connecting to and working with RabbitMQ on the Helion Development Platform.

This is the **third** sample in the series; if you have not already examined the [HelloWorld](/helion/devplatform/workbook/helloworld/java/) sample and the [Database sample](/helion/devplatform/workbook/database/java/), please do those two first.
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
###JDK
You must have the Java Development Kit (JDK) installed before you can install the other prerequisites.

On a Mac/UNIX environment, the JDK can be installed with the following command:

    sudo apt-get install default-jdk


On a PC environment, the simplest way to install the JDK is to visit the [JDK installation page](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html/) and run the appropriate installer for your chosen platform.

###Maven

[Maven](http://maven.apache.org/ "Maven") must be installed. 
The simplest way to install Maven on a Mac/UNIX environment is:

	sudo apt-get install maven 

The simplest way to install Maven on a PC environment is to [download the latest version of Maven](http://maven.apache.org/download.cgi) and then follow the [installation directions](http://maven.apache.org/guides/getting-started/windows-prerequisites.html).

##Download the Application Files
[Click here to access the download directory.](https://github.com/HelionDevPlatform/helion-rabbitmq-java).

##Build the Application
If you are not already there, `cd` to the root directory of the sample and execute:

	mvn clean package

This builds the application with Maven. It will create the *hello-world-java-1.0.war* file within the target directory. 

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
3.	If the file push was successful, you should see **rabbitmq-java** in the list of available applications.

##Key Code Snippets
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

This first line in this section of the RabbitServlet.java file shows how to retrieve the connection information for the RabbitMQ cluster from the application’s environment variables. The rest of the code makes a connection to the cluster, creates a channel, and defines a message queue called **hello**.

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

This section of the ProcessMessage.java file shows how to publish to a message queue, retrieve the published message, convert the message from a byte array to a string, and print it out to the user.

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

The POM.xml file is the configuration information generated by Maven and used by ALS to set up the environment. You can see that it has added a dependency for the amqp-client.
	
	applications: 
	- name: rabbitmq-java
	  mem: 512M
	  path: target/rabbitmq-java-1.0
	  services:
	    rabbitmq:
	      type: rabbitmq3

The *manifest.yaml* file is the configuration information used by ALS to set up the environment. The *services* element instructs ALS on how to bind the RabbitMQ service provided by the ALS cluster to the application.

##Key Learnings
1.	You need to provide configuration information so that ALS can bind to a RabbitMQ service.
2.	You need to provide configuration information so that ALS can create an environment for you app.  Tools like Maven generate the *pom.xml* files for you.
3.	You need to retrieve connection information for RabbitMQ from the application’s environment variables.
4.	You interact with and deploy your app using the Helion CLI or the Eclipse [deployment plugin](/helion/devplatform/eclipse/).

[Exit Samples](/helion/devplatform/) | [Previous Sample](/helion/devplatform/workbook/database/java/) 