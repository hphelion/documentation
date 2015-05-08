---
layout: default-devplatform
title: "HP Helion 1.2 Development Platform:  Deploying Windows Applications with the IIS Buildpack"
permalink: /helion/devplatform/preview/buildpack
product: devplatform
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.2
role1: Systems Administrator 
role2: System Engineer
role3: Cloud Administrator
role4: Network Administrator
role5: Application Developer
Role6: Security Engineer
role7: Application Developer 
role8: ISV Developer
role9: Service Developer
authors: Patrick F

---
<!--UNDER REVISION-->

# HP Helion 1.2 Development Platform: Deploying Windows Applications with the IIS Buildpack

*Windows and IIS are either registered trademarks or trademarks of Microsoft Corporation in the United States and/or other countries.*

A **Buildpack** is a collection of scripts that specify what frameworks and runtimes are to be deployed with an application. 

When you build and deploy a Windows application, the following steps take place:

1. You will be prompted for connection data (Endpoint, login, and password), and whether to ignore SSL errors. You should check "Ignore SSL errors" in the dialog if your deployment environment uses self-signed SSL certificates.
	<img src="/media/windows_publish_credentials.png"
2. Projects in the solution directory are compiled with **MSBuild**.
3. 
