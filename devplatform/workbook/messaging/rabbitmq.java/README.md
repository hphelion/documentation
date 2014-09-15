Hello World Java 
================

This is a very simple Servlet-based Java webapp. 

Building the Application
------------------------
The specific command listed below are intended for Unix-like machines.

Build the application with Maven. Maven requires you to have the Java Development Kit (JDK) installed. The JDK can be installed with the following command:

	sudo apt-get install default-jdk

### Maven

Make sure you have [Maven](http://maven.apache.org/ "Maven") installed.
The simplest way to install Maven is:

	sudo apt-get install maven 

Then, *cd* into the root directory and execute:

	mvn clean package

This will create the *hello-world-java-1.0.war* file within the 'target' directory. The pom.xml file in the root directory is used by Maven to build the application.

Running the Application
-----------------------

To run the application, make sure you have the Stackato client installed and that you are logged in successfully for your desired target environment (e.g. http://api.stackato.local).

Then execute:

	stackato push -n 

Notice that it detected the app type as "Java Web Application". 

The result when visiting the application page and clicking 'View App' should be "Hello World".	

