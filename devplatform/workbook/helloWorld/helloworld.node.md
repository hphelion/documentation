---
layout: default-devplatform
title: "HP Helion Development Platform Workbook Hello World Sample"
permalink: /helion/workbook/helloWorld/node/
product: devplatform

---

#Hello World Node.js
###Pre-requisites
###Download the Application Files
[Click here to access the download directory.](https://gitlab.gozer.hpcloud.net/developer-experience/sampleapps) There are several sets of files here; download only the Hello-World-Node sample files.

###Build the Application
To create a CloudFoundry&trade; app in Node.js, the only mandatory files are:

* The main .js file
* manifest.yml
* package.json
* Procfile 

`Manifest.yml` is a configuration file used to specify settings that would otherwise be specified by a command-line tool. 

The `package.json` file is your standard metadata file. **Name** and **version** are the only required fields. 

The `Procfile` tells the Helion Development Platform how to run your Node.js application. An extremely simple one is included with this sample.





[Exit Workbook](/helion/devplatform/) | [Next Sample](/helion/workbook/database/) 