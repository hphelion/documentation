---
layout: default-devplatform
title: "HP Helion Development Platform Workbook Hello World Sample"
permalink: /helion/devplatform/workbook/database/java/
product: devplatform

---
#JAVA Database


This is the **second** sample in the Workbook; if you have not already examined the [HelloWorld](/helion/devplatform/workbook/helloWorld/java/) sample, please do that one first.


## Prerequisites
**Stackato**

1. You must have a Stackato instance available. 
2. The  [Stackato command-line interface (CLI)](http://docs.stackato.com/user/client/index.html#client) must be installed. 
3. You must have access to the web-based Administration console.

**JDK**

Maven requires you to have the Java Development Kit (JDK) installed. The JDK can be installed with the following command:

	sudo apt-get install default-jdk

**Maven**

[Maven](http://maven.apache.org/ "Maven") must be installed. 
The simplest way to install Maven is:

	sudo apt-get install maven 
##Download the Application Files
Download the files 
###About the Application Files
 The `pom.xml` file 
in the root directory is used by Maven to build the application.
##Build the Application

The specific commands listed below are intended for Unix-like machines.

 *cd* into this app's root directory and execute:

	mvn clean package

This will create the .war file within the `target` directory.


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
6. You should see a page that will 

[Exit Workbook](/helion/devplatform/) | [Previous Sample](/helion/devplatform/workbook/helloworld/java/) | [Next Sample](/helion/devplatform/workbook/messaging/java/)