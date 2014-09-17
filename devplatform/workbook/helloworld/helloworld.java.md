---
layout: default-devplatform
title: "HP Helion Development Platform Workbook Hello World Sample"
permalink: /helion/devplatform/workbook/helloworld/java/
product: devplatform

---
##Hello World JAVA
This is a very simple Servlet-based Java webapp.

###Pre-requisite: Maven
[Maven](http://maven.apache.org/ "Maven") must be installed. Maven requires you to have the Java Development Kit (JDK) installed. The JDK can be installed with the following command:

	sudo apt-get install default-jdk
The simplest way to install Maven is:

	sudo apt-get install maven 

###Download the Application Files
[Click here to access the download directory.](https://gitlab.gozer.hpcloud.net/developer-experience/sampleapps) There are several sets of files here; download only the Hello-World-Java sample files.
 
###Build the Application
The specific commands listed below are intended for Unix-like machines.

You will build the application with Maven.
<br> `cd` into the root directory of the sample and execute:

	mvn clean package

This will create the *hello-world-java-1.0.war* file within the `target` directory. The `pom.xml` file in the root directory of this sample is used by Maven to build the application. 

###Run the Application
To run the application, make sure you have the Stackato client installed and that you are logged in to your desired target environment (e.g. *http://api.stackato.local*).

Then execute:

	stackato push -n 

Notice that the app type was automatically detected as "Java Web Application". 

The result when visiting the application page and clicking **View App** should be "Hello World".	

[Exit Workbook](/helion/devplatform/) | [Next Sample](/helion/workbook/database/)