---
layout: default-devplatform
title: "HP Helion Development Platform Workbook Java Database Sample"
permalink: /helion/devplatform/workbook/database/java/
product: devplatform

---
<!—UNDER REVISION-->
#JAVA MySQL Database Sample
This very simple Servlet-based Java webapp displays the text "Executed query "SELECT "Hello World!"".", and then the result of that query: "Hello World". This is a demonstration of the minimum requirements to build an application that can connect to a MySQL database provided by ALS and run queries against it. Use this sample to ensure that you have set up your environment for connecting to and working with MySQL on the Helion Development Platform. 

This is the **second** sample in the series; if you have not already examined the [HelloWorld](/helion/devplatform/workbook/helloworld/java/) sample, please do that one first.


##Prerequisites
If you are missing any of these items, you will need to [install them](/helion/devplatform/appdev/).

1.	You must have access to an ALS cluster.
2.	The Helion command-line interface (CLI) must be installed.
3.	You must have access to the web-based Helion Management console.

###MySQL

If the MySQL service is not enabled on your cluster, or if you are not sure, follow these steps:

1. Go to the Administrative console for your ALS cluster. <br>For example: *https://api.xx.xx.xx.xx.xip.io*, substitute your own cluster’s link.
2. On the **Admin** tab, click **Cluster**.
3. Click the **Settings** icon (a gear icon in the upper right corner)
4. The **MySQL** check box should be checked. If it is not, check it.
5. Click **Save**.


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
Use the Helion client to deploy your app to Helion Development Platform.  If you have Eclipse installed, you have the option to use the [deployment plugin](/helion/devplatform/eclipse/).

1.	Open the [Helion command-line interface (CLI)](/als/v1/user/reference/client-ref/)
2.	Ensure that you are logged in to your desired environment.  <br>If you are not, execute `helion login` 
3.	Ensure that you are targeting your desired environment.  <br> If you are not, execute `helion target https://api.xx.xx.xx.xx.example.com`
4.	If you are not already there, `cd` to the root directory of the sample.
5.	Execute `helion push -n`

##Run the Application
1.	Open the Helion Management Console. <br> The Management Console is the web-based administrative interface that can be reached by typing the ALS endpoint URL into a browser window.
2.	Click **Applications**.
3.	If the file push was successful, you should see **mysql-java** in the list of available applications.

##Key Code Snippets

	String vcap_services = System.getenv("VCAP_SERVICES");
	
	        Connection dbConnection = null;
	
	        if (vcap_services != null && vcap_services.length() > 0) {
	            try {
	                // Use a JSON parser to get the info we need from  the
	                // VCAP_SERVICES environment variable. This variable contains
	                // credentials for all services bound to the application.
	                // In this case, MySQL is the only bound service.
	                JsonRootNode root = new JdomParser().parse(vcap_services);
	
	                JsonNode mysqlNode = root.getNode("mysql");
	                JsonNode credentials = mysqlNode.getNode(0).getNode("credentials");
	
	                // Grab login info for MySQL from the credentials node
	                String dbname = credentials.getStringValue("name");
	                String hostname = credentials.getStringValue("hostname");
	                String user = credentials.getStringValue("user");
	                String password = credentials.getStringValue("password");
	                String port = credentials.getNumberValue("port");
	
	                String dbUrl = "jdbc:mysql://" + hostname + ":" + port + "/" + dbname;
	
	                // Connect to MySQL
	                writer.println("Connecting to MySQL...");
	
	                Class.forName("com.mysql.jdbc.Driver");
	                dbConnection = DriverManager.getConnection(dbUrl, user, password);
	            } catch (Exception e) {
	                System.out.println("Caught error: ");
	                e.printStackTrace();
	            }
	        }

This first line in this section of the MysqlServlet.java file shows how to retrieve the connection information for the MySQL instance from the application’s environment variables. The connection information is represented using JSON. The rest of the code shown here parses the JSON string that was retrieved, and builds the appropriate JDBC connection string.
	
	---
	applications: 
	- name: mysql-java
	  mem: 512M
	  path: target/mysql-java-1.0
	  services:
	    ${name}-db:
	      type: mysql

The *manifest.yaml *file is the configuration information used by ALS to set up the environment. The *services* element instructs ALS how to bind to the MySQL service provided by the ALS cluster to the application.

##Key Learnings
1.	You need to provide configuration information so that ALS can bind to a MySQL service.
2.	You need to retrieve connection information for MySQL from the application’s environment variables, and parse the information into a JDBC compliant connection string.
3.	You interact with and deploy your app using the Helion CLI or the Eclipse [deployment plugin](/helion/devplatform/eclipse/).

[Exit Samples](/helion/devplatform/) | [Previous Sample](/helion/devplatform/workbook/helloworld/java/) | [Next Sample](/helion/devplatform/workbook/messaging/java/)