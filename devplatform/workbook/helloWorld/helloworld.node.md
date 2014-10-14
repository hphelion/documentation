---
layout: default-devplatform
title: "HP Helion Development Platform Workbook Node Hello World Sample"
permalink: /helion/devplatform/workbook/helloworld/node/
product: devplatform

---
<!--UNDER REVISION-->
#Node Hello World Sample

This very simple Node.js web app displays the text "Hello World!". This sample is a demonstration of the minimum requirements to build a functional application. Use this sample to ensure that you have set up your environment for deployment to Helion Development Platform.

##Prerequisites
If you are missing any of these items, you must [install them](/helion/devplatform/appdev/).

- Access to an Application Lifecycle Service (ALS) [Cluster](/als/v1/admin/cluster/)
- The  [Helion command-line interface (CLI)](/als/v1/user/client/) must be installed.
- Access to the web-based Helion Management console.

##Download the Application Files
[Click here to access the download directory.](https://github.com/HelionDevPlatform/helion-hello-world-node)

###About the Application Files
To create a CloudFoundry&trade; app in Node.js, the only mandatory files are:

* The main .js file
* manifest.yml
* package.json
* Procfile 

*Manifest.yml* is a configuration file used to specify settings that would otherwise be specified by a command-line tool. 

The *package.json* file is your standard metadata file. **Name** and **version** are the only required fields. 

The *Procfile* tells the Helion Development Platform how to run your Node.js application. An extremely simple one is included with this sample.

##Deploy the Application
Use the Helion client to deploy your app to Helion Development Platform.  If you have Eclipse installed, you have the option to use the [deployment plugin](/helion/devplatform/eclipse/).

1.	Open the [Helion command-line interface (CLI)](/als/v1/user/reference/client-ref/)
2.	Ensure that you are logged in to your desired environment.  <br>If you are not, execute 

		helion login

3.	Ensure that you are targeting your desired environment.  <br> If you are not, execute 

		helion target https://api.xx.xx.xx.xx.example.com

4.	If you are not already there, `cd` to the root directory of the sample.

5.	Execute 

		helion push -n

##Run the Application
1.	Open the Helion Management Console. <br> The Management Console is the web-based administrative interface that can be reached by typing the ALS endpoint URL into a browser window.
2.	Click **Applications**.
3.	If the file push was successful, you should see **hello-world-node** in the list of available applications.

##Key Code Snippets

	// Load the http module 
	var http = require('http');
	
	// The  HTTP server will respond with Hello World to all requests.
	var server = http.createServer(function (request, response) {
	  response.writeHead(200, {"Content-Type": "text/plain"});
	  response.end("\n Hello World \n");
	});
	
	// Listen to the port being used by this app. The call to process.env.PORT will
	// return the port that has been assigned to the app from the Helion Development
	// Platform.
	var port = process.env.PORT || 8888;
	server.listen(port);
	
	// Print to the terminal
	console.log("Server listening to port: " + port);

This simple Servlet prints "Hello World".

	{
	  "name": "hello-world-node",
	  "version": "1.0.0",
	  "description" : "A 'Hello World' app demonstrating Node.js running on the Helion Development Platform.",
	  "repository" : {"type": "git", "url": "git://notyetpublished"}
	}

- The `package.json` file above is used by ALS during deployment.
- This is an extremely basic manifest file. 
- Note that the **name** is always required while other fields are optional. 

##Key Learnings

- You can deploy your app using either the Helion CLI or the Eclipse [deployment plugin](/helion/devplatform/eclipse/).


[Exit Samples](/helion/devplatform/) | [Next Sample](/helion/devplatform/workbook/database/node/) 