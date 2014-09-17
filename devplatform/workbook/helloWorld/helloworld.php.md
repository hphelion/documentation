---
layout: default-devplatform
title: "HP Helion Development Platform Workbook Hello World Sample"
permalink: /helion/devplatform/workbook/helloworld/php/
product: devplatform

---
# Hello World PHP
#Hello World Node.js
###Pre-requisites
###Download the Application Files
[Click here to access the download directory.](https://gitlab.gozer.hpcloud.net/developer-experience/sampleapps) There are several sets of files here; download only the Hello-World-PHP sample files.

###Build the Application
To create a CloudFoundry&trade; app in PHP, the only mandatory files are the `index.php` and `manifest.yml` files. 

`Manifest.yml` is a configuration file used to specify settings that would otherwise be specified by a command-line tool. For PHP, only the **name** and **buildpack** fields are required. The **buildpack** field is a URL for the `buildpack` that supports the necessary language and/or framework.

The `composer.json` file is completely optional; however, certain buildpacks may issue a warning if the file is not present.

[Exit Workbook](/helion/devplatform/) | [Next Sample](/helion/workbook/database/php/) 

