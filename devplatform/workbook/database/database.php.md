---
layout: default-devplatform
title: "HP Helion Development Platform Workbook PHP Database Sample"
permalink: /helion/devplatform/workbook/database/php/
product: devplatform

---
<!—UNDER REVISION-->
#PHP MySQL Database Sample
This very simple Node.js web application displays the text "Executed query "SELECT "Hello World!"".", and then the result of that query: "Hello World". This is a demonstration of the minimum requirements to build an application that can connect to a MySQL database provided by ALS and run queries against it. Use this sample to ensure that you have set up your environment for connecting to and working with MySQL on the Helion Development Platform. 

This is the **second** sample in the series; if you have not already examined the [HelloWorld](/helion/devplatform/workbook/helloworld/php/) sample, please do that one first.
## Prerequisites
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

##Download the Application Files
[Download the PHP files](https://gitlab.gozer.hpcloud.net/developer-experience/mysql-php/) from the code repository.

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
3.	If the file push was successful, you should see **mysql-php** in the list of available applications.

##Key Learnings
1.	You need to provide configuration information so that ALS can bind to a MySQL service.
2.	You need to retrieve connection information for MySQL from the application’s environment variables, and parse the information into a JDBC compliant connection string.
3.	You interact with and deploy your app using the Helion CLI or the Eclipse [deployment plugin](/helion/devplatform/eclipse/).


[Exit Samples](/helion/devplatform/) | [Previous Sample](/helion/devplatform/workbook/helloworld/php/) | [Next Sample](/helion/devplatform/workbook/messaging/php/)

