---
layout: default-devplatform
title: "HP Helion Development Platform Workbook Node Database Sample"
permalink: /helion/devplatform/workbook/database/node/
product: devplatform

---
#Database Node Sample
This is the **second** sample in the Workbook; if you have not already examined the [HelloWorld](/helion/devplatform/workbook/helloworld/node/) sample, please do that one first.

This is a simple Node.js app that uses MySQL. 
# Prerequisites
**ALS**

1. You must have an [ALS instance](/helion/devplatform/community/install-als/) available. 
2. The  [ALS command-line interface (CLI)](http://docs.stackato.com/user/client/index.html#client) must be installed. 
3. You must have access to the web-based Administration console.

##Download the Application Files
[Download the Node files](https://gitlab.gozer.hpcloud.net/developer-experience/mysql-node/) from the code repository.

##Deploy the Application

To deploy the application, make sure you are logged in successfully for your desired target environment; for example, *https://api.example.com*.

1. Open the  [ALS command-line interface (CLI)](http://docs.stackato.com/user/client/index.html#client).
2.	Execute <br>`stackato target https://api.example.com`<br>substituting your own instance's link.
3.	Execute <br>`stackato login`<br> using the Stackato management console username and password.
4. Change directory (`cd`) the app's root directory.
5. Execute <br>`stackato push -n`  

##Run the Application

1. Open the Management Console. This is the web-based administrative interface.
2. Click **Applications**.
3.  If the file push was successful, you should see the name of this application in the list of available applications. 
4. The status of the application should be **Online**. Click the name of the application to launch it. 
5. In the upper right-hand corner, click **View App**.
	- If there are still any issues, click the **Log Stream** link on the app's page to see a real-time stream of what's going on with the app. 
6. The result should be a page displaying some text after the app has connected to MySQL and executed a query. 



[Exit Workbook](/helion/devplatform/) | [Previous Sample](/helion/devplatform/workbook/helloworld/node/) | [Next Sample](/helion/devplatform/workbook/messaging/node/)