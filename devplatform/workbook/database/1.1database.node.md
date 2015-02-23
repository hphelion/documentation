---
layout: default-devplatform
title: "HP Helion Development Platform Node Database Sample"
permalink: /helion/devplatform/1.1/workbook/database/node/
product: devplatform
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
role1: Application Developer
role2: Security Engineer
role3: ISV Developer 
role4: Service Developer
authors: Jayme P
SME1: Sam C

---
<!--PUBLISHED-->

# HP Helion Development Platform: Node MySQL Database Sample

This very simple Node.js app displays the text "Executed query "SELECT "Hello World!"".", and then the result of that query: "Hello World". This is a demonstration of the minimum requirements to build an application that can connect to a MySQL database provided by ALS and run queries against it. Use this sample to ensure that you have set up your environment for connecting to and working with MySQL on the Helion Development Platform. 

## Prerequisites
If you are missing any of these items, you will need to [install them](/helion/devplatform/1.1/appdev/).

- Access to an Application Lifecycle Service (ALS) [Cluster](/helion/devplatform/1.1/als/admin/cluster/)
- The  [Helion command-line interface (CLI)](/helion/devplatform/1.1/als/user/client/) must be installed.
- Access to the web-based [Helion Management Console](/helion/devplatform/1.1/als/user/console/).

###MySQL

If the MySQL service is not enabled on your cluster, or if you are not sure, follow these steps:

1. Go to the Administrative console for your ALS cluster. <br>For example: *https://api.xx.xx.xx.xx.xip.io*, substitute your own cluster's link.
2. On the **Admin** tab, click **Cluster**.
3. Click the **Settings** icon (a gear icon in the upper right corner)
4. The **MySQL** check box should be checked. If it is not, check it.
5. Click **Save**.

**Note**: If a more durable or scalable MySQL database service is needed, configure your ALS cluster to use a database instance or master/slave pair provided by the Database Service. For more information, refer to [Using the Database Service](/helion/devplatform/1.1/databaseservice/) and [Connecting the Database Service with ALS](/helion/devplatform/1.1/connectdatabase/). 

##Download the Application Files
[Click here to access the code repository](https://github.com/HelionDevPlatform/helion-mysql-node/).

##Deploy the Application
**Note**: Application Lifecycle Service clusters that require an upstream HTTP proxy to access the internet will need to be [made aware of the proxy](/helion/devplatform/1.1/als/admin/server/configuration/#staging-cache-app-http-proxy). The sample applications require access to the Internet in order to download dependent packages.

Use the Helion client to deploy your app to Helion Development Platform.  If you have Eclipse installed, you have the option to use the [plugin](/helion/devplatform/1.1/eclipse/).

1.	Open the [Helion command-line interface (CLI)](/helion/devplatform/1.1/als/user/reference/client-ref/)
3.	Ensure that you are targeting your desired environment.  <br> If you are not, execute
	
		helion target https://api.xx.xx.xx.xx.example.com2.	


1. Ensure that you are logged in to your desired environment.  <br>If you are not, execute
	
		helion login
	 
4.	If you are not already there, `cd` to the root directory of the sample.
5.	Deploy the application by using the command:
	
		helion push
	
6.	Accept any default values that you may be prompted for.
	<br>	**Note**: By default ALS clusters are configured with two domains (private and public). In some situations the Helion CLI may prompt you to select a target domain. If prompted, select the public domain from the given list (i.e. *<app-name>.xxx.xxx.xxx.xxx.xip.io*)

##Key Code Snippets
The first line in this section of the Server.js file shows how to retrieve the connection information for the MySQL instance from the application's environment variables. The connection information is represented using JSON. The rest of the code shown here parses the JSON string that was retrieved, connects to the database, execute a query, and prints the response.

	var services = process.env.VCAP_SERVICES;

  	// Parse the JSON so that we can extract the individual components needed for
 	 // using MySQL
	  services = JSON.parse(services);
	
	  // Since there's only one service, we grab the only node which is for MySQL.
	  var credentials = services.mysql[0].credentials;
	
	  // The credentials node has a lot of fields, but we are only concerned with
	  // the ones below for this MySQL sample.
	  var dbname = credentials.name;
	  var hostname = credentials.hostname;
	  var user = credentials.user;
	  var password = credentials.password;
	  var port = credentials.port;
	
	  response.write("\n Connecting to MySQL...");
	
	  // Create a connection to MySQL
	  var connection = mysql.createConnection({
	    database : dbname,
	    host : hostname,
	    port : port,
	    user : user,
	    password : password
	  });
	
	  connection.connect();
	
	  response.write("\n Connected to MySQL!");
	
	  // Create a query to be executed against a MySQL database.
	  var queryResult = '';
	  connection.query('SELECT \"Hello World\" AS result', function(err, rows, fields) {
	    if (err) {
	      throw err;
	    }
	
	    queryResult = rows[0].result;
	
	    response.write("\n Executed \'SELECT \"Hello World\" AS result\' ");
	    response.write("\n Result =  " + queryResult);
	
	    // Close the connection
	    connection.end(function(err){
	      console.log("\n Closing the MySQL connection");
	   });
	      }

The *manifest.yml* file is the configuration information used by ALS to set up the environment. The **services** element instructs ALS how to bind to the MySQL service provided by the ALS cluster to the application.

	---
	applications:
	- name: mysql-node
	  mem: 128M
	  services:
	    ${name}-db:
	      type: mysql

##Run the Application
1.	Open the Helion Management Console. <br> The Management Console is the web-based administrative interface that can be reached by typing the ALS endpoint URL into a browser window.
2.	Click **Applications**.
3.	If the file push was successful, you should see **mysql-node** in the list of available applications.
4.	The status of the application should be **Started**. Click the name of the application to launch it. 
5. In the upper right-hand corner, click **View App**.


##Key Learnings
1.	You need to provide configuration information so that ALS can bind to a MySQL service. Configuration information is contained in the *manifest.yml* file.
2.	You need to retrieve connection information for MySQL from the application's environment variables, and parse the information into a JDBC compliant connection string.
3.	You interact with and deploy your app using the Helion CLI or the Eclipse [plugin](/helion/devplatform/1.1/eclipse/).

[Exit Samples](/helion/devplatform/1.1/appdev) | [Previous Sample](/helion/devplatform/1.1/workbook/helloworld/node/) | [Next Sample](/helion/devplatform/1.1/workbook/messaging/node/)