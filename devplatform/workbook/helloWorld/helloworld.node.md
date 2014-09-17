---
layout: default-devplatform
title: "HP Helion Development Platform Workbook Hello World Sample"
permalink: /helion/devplatform/workbook/helloworld/node/
product: devplatform

---

#Hello World Node.js
###Pre-requisites
* Stackato client
* Access to web-based Administration console.

###Download the Application Files
[Click here to access the download directory.](https://gitlab.gozer.hpcloud.net/developer-experience/sampleapps) There are several sets of files here; download only the Hello-World-Node sample files.

###Application Files
To create a CloudFoundry&trade; app in Node.js, the only mandatory files are:

* The main .js file
* manifest.yml
* package.json
* Procfile 

`Manifest.yml` is a configuration file used to specify settings that would otherwise be specified by a command-line tool. 

The `package.json` file is your standard metadata file. **Name** and **version** are the only required fields. 

The `Procfile` tells the Helion Development Platform how to run your Node.js application. An extremely simple one is included with this sample.


###Build the Application
1. Ensure you are logged in to your desired target environment; for example, *http://api.stackato.local*
2. To push the application files to the server, execute:

	`stackato push -n` 


Notice that the app type was automatically detected as "Java Web Application". 
 
###View the Application

1. Open the Management Console. This is the web-based administrative interface.
2. Click **Applications**.
3. If the file push was successful, you should see Hello World in the list of available applications. 
4. The status of the application should be **Online**. Click the name of the application to launch it. 
5. In the upper right-hand corner, click **View App**.
6. You should see the text Hello World! displayed.


[Exit Workbook](/helion/devplatform/) | [Next Sample](/helion/workbook/database/node/) 