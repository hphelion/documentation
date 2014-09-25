---
layout: default-devplatform
title: "HP Helion Development Platform Workbook Java Messaging Sample"
permalink: /helion/devplatform/workbook/messaging/java/
product: devplatform

---
#JAVA Messaging Sample
This is a simple Servlet-based Java webapp that uses RabbitMQ. 

This is the **third** sample in the Workbook; if you have not already examined the [HelloWorld](/helion/devplatform/workbook/helloworld/java/) sample and the [Database](/helion/devplatform/workbook/database/java/) sample, please do those two first.


## Prerequisites
**ALS**

1. You must have a [ALS instance](/helion/devplatform/community/install-als/) available. 
2. The  [ALS command-line interface (CLI)](http://docs.stackato.com/user/client/index.html#client) must be installed. 
3. The RabbitMQ service must be enabled. <br> ALS 3.4 appears have it enabled by default, but ALS 3.2 does not. 
	- Open the Administrative console.
	- On the **Admin** tab, click **Cluster**.
	- Click the **Settings** icon (a gear icon in the upper right corner)
	- Both of the **Rabbit** and **Rabbit3** check boxes should be checked. If they are not, check them.
	- Click **Save**.

**JDK**

Maven requires you to have the Java Development Kit (JDK) installed. The JDK can be installed with the following command:

	sudo apt-get install default-jdk

**Maven**

[Maven](http://maven.apache.org/ "Maven") must be installed. 
The simplest way to install Maven is:

	sudo apt-get install maven 
##Download the Application Files
Download the files [here](https://gitlab.gozer.hpcloud.net/developer-experience/rabbitmq-java)
###About the Application Files
 The `pom.xml` file 
in the root directory is used by Maven to build the application.
##Build the Application

The specific commands listed below are intended for Unix-like machines.

 *cd* into this app's root directory and execute:

	mvn clean package

This will create the .war file within the `target` directory.


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
3. If the file push was successful, you should see the name of this application in the list of available applications. 
4. The status of the application should be **Online**. Click the name of the application to launch it.
	- If there are still any issues, please check the **Log Stream** link on the app’s page to see a real-time stream of what’s going on with the app.    
5. In the upper right-hand corner, click **View App**.
6. You should see a page that will accept a user's message.


[Exit Workbook](/helion/devplatform/) | [Previous Sample](/helion/devplatform/workbook/database/java/) 