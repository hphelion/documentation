---
layout: default-devplatform
title: "HP Helion Development Platform Workbook PHP Database Sample"
permalink: /helion/devplatform/workbook/database/php/
product: devplatform

---
<!--UNDER REVISION-->
#PHP MySQL Database Sample
This sample displays the text "Executed query "SELECT "Hello World!"".", and then the result of that query “Hello World!” This is a demonstration of the minimum requirements to build an application that can connect to a MySQL database provided by ALS, and run queries against it. This is a very simple PHP web app.  Use this sample to ensure that you have set up your environment for connecting to, and working with MySQL on the Helion Development Platform. 
 

## Prerequisites

1.	You must have access to an ALS cluster.
2.	The Helion command-line interface (CLI) must be installed.
3.	You must have access to the web-based Helion Management console.

If you are missing any of these items, you will need to [install them](/helion/devplatform/appdev/).

###MySQL

If the MySQL service is not enabled on your cluster, or if you are not sure, follow these steps:

1. Go to the Administrative console for your ALS cluster. <br>For example: *https://api.xx.xx.xx.xx.xip.io*, substitute your own cluster’s link.
2. On the **Admin** tab, click **Cluster**.
3. Click the **Settings** icon (a gear icon in the upper right corner)
4. The **MySQL** check box should be checked. If it is not, check it.
5. Click **Save**.

**Note**: If a more durable or scalable MySQL database service is needed, configure your ALS cluster to use a database instance or master/slave pair provided by the Database Service. For more information, refer to [Creating a Database Instance in the Database Service](/helion/devplatform/createdatabase/) and [Connecting the Database Service with ALS](/helion/devplatform/connectdatabase/). 

##Download the Application Files
[Click here to access the download directory](https://github.com/HelionDevPlatform/helion-mysql-php/).

##Deploy the Application
Use the Helion client to deploy your app to Helion Development Platform.  If you have Eclipse installed, you have the option to use the [plugin](/helion/devplatform/eclipse/).

1.	Open the [Helion command-line interface (CLI)](/als/v1/user/reference/client-ref/)
2.	Ensure that you are logged in to your desired environment.  <br>If you are not, execute `helion login` 
3.	Ensure that you are targeting your desired environment.  <br> If you are not, execute `helion target https://api.xx.xx.xx.xx.example.com`
4.	If you are not already there, `cd` to the root directory of the sample.
5.	Execute `helion push -n`
6.	Accept any default values that you may be prompted for.
	<br>	**Note**: By default ALS clusters are configured with two domains (private and public). In some situations the Helion CLI may prompt you to select a target domain. If prompted, select the public domain from the given list (i.e. <app-name>.xxx.xxx.xxx.xxx.xip.io)

##Key Code Snippets


	$services = getenv('VCAP_SERVICES');

	$json = json_decode($services, TRUE);

	// Parse the json string that we got from VCAP_SERVICES
	// The only top-level node will be mysql since it's the only service bound to
	// this sample app.
	// Note that some of the fields are optional but are included for reference
	$dbname = $json['mysql'][0]['credentials']['name'];
	$hostname = $json['mysql'][0]['credentials']['hostname'];
	$user = $json['mysql'][0]['credentials']['user'];
	$password = $json['mysql'][0]['credentials']['password'];
	$port = $json['mysql'][0]['credentials']['port'];

	// Create a connection to MySQL
	echo "\n <br> Connecting to MySQL...";
	$connection = mysqli_connect($hostname, $user, $password, $dbname, $port);
		
	// Check connection 
	if (mysqli_connect_errno()) { 
	echo "\n <br> Failed to connect to MySQL: " . mysqli_connect_error(); 
	echo "\n <br>Connected to MySQL!"; } 
	
	// Execute a simple query to grab a string 
		$queryString = "SELECT \"Hello World!\" AS result"; 
		$result = mysqli_query($connection, $queryString); 
		echo "\n <br> Executed $queryString"; 
	
	// Get the result 
	$row = mysqli_fetch_assoc($result); 
	echo "\n <br> Result: " . $row['result']; 
	echo "\n <br> Error: Result of query is NULL!"; 

	// Free up the memory that was allocated to the result 
	mysqli_free_result($result); 
	
	// Finally, close the MySQL connection. 
	mysqli_close($con); 

This first Line in this section of the index.php file shows how to retrieve the connection information for the MySQL instance from the application’s environment variables. The connection information is represented using JSON. The rest of the code shown here parses the JSON string that was retrieved, and builds the appropriate connection string. Once the connection has been made, the code executes a query, reads the results, and closes the connection. 

	--- 

	applications: 
		- name: mysql-php
		buildpack: https://github.com/cloudfoundry/php-buildpack.git 
		services: 
			${name}-db: 
				type: mysql 

The manifest.yaml file is the configuration information used by ALS to set up the environment. The services element listed above instructs ALS on how to bind to the MySQL service provided by the ALS cluster to the application. The file also uses the buildpack element that is used by ALS to configure the application environment for using PHP.  


##Run the Application
1. Open the Helion Management Console. This is the web-based administrative interface. 
2. Click **Applications**. 
3. If the file push was successful, you should see **Hello World** in the list of available applications. 
4. The status of the application should be **Online**. Click the name of the application to launch it. 
5. In the upper right-hand corner, click **View App**. 


##Key Learnings
1. You will need to provide configuration information so that ALS can bind to a MySQL service. 
1. You will need to provide information about which build pack to use for PHP, so that ALS can create an environment for you app 
1. You will need to retrieve connection information for MySQL from the application’s environment variables, and parse the information into a connection string that can be used by PHP.
1. You interact and deploy your app using the Helion CLI or the Eclipse [plugin](/helion/devplatform/eclipse/).

[Exit Samples](/helion/devplatform/appdev) | [Previous Sample](/helion/devplatform/workbook/helloworld/php/) | [Next Sample](/helion/devplatform/workbook/messaging/php/)