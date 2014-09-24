---
layout: default-devplatform
title: "HP Helion Development Platform Workbook Java Database Sample"
permalink: /helion/devplatform/workbook/database/java/
product: devplatform

---
#JAVA Database

This is a simple Servlet-based Java webapp that uses MySQL. 

This is the **second** sample in the Workbook; if you have not already examined the [HelloWorld](/helion/devplatform/workbook/helloworld/java/) sample, please do that one first.


## Prerequisites
**MySQL**

If the MySQL service is not enabled on your cluster, or if you are not sure, follow these steps:

- Go to the Administrative console (e.g. *https://api.15.126.212.172.xip.io*, substitute your own instance's link)
- On the **Admin** tab, click **Cluster**.
- Click the **Settings** icon (a gear icon in the upper right corner)
- The **MySQL** check box should be checked. If it is not, check it.
- Click **Save**.

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
[Download](https://gitlab.gozer.hpcloud.net/developer-experience/mysql-java) the application files. 
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
3. If the file push was successful, you should see the new app in the list of available applications. 
4. The status of the application should be **Online**. Click the name of the application to launch it. 
5. In the upper right-hand corner, click **View App**.
6. The result should be a page displaying some text after your app has connected to MySQL and executed a query.

[Exit Workbook](/helion/devplatform/) | [Previous Sample](/helion/devplatform/workbook/helloworld/java/) | [Next Sample](/helion/devplatform/workbook/messaging/java/)