---
layout: default-devplatform
title: "HP Helion 1.2 Development Platform:  Deploying Windows Applications with the IIS Buildpack"
permalink: /helion/devplatform/1.2/windows/buildpack/
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
<!--PUBLISHED-->

# HP Helion 1.2 Development Platform Preview: Deploying Windows Applications with the IIS Buildpack

<span style="font-size:70%">*Windows, .NET, SQL Server, and IIS are either registered trademarks or trademarks of Microsoft Corporation in the United States and/or other countries.*</span>

A **Buildpack** is a collection of scripts that specify what frameworks and runtimes are to be deployed with an application. 

When you build and deploy a Windows application, the following steps take place:

1. You will be prompted for connection data (Endpoint, login, and password), and whether to ignore SSL errors. You should check "Ignore SSL errors" in the dialog if your deployment environment uses self-signed SSL certificates (such as HP Helion Public Cloud).

	<img src="media/windows_publish_credentials.png" />
2. Application settings are collected from <code>manifest.yml</code>.
3. If a local build is requested, projects in the solution directory are deployed to a temporary folder and compiled with **MSBuild**.
4. Projects are deployed using the **CloudFoundry MS Build Tasks**.

After the project is deployed, the IIS Buildpack performs the following tasks:

5. If there is no solution or project file present, the application is simply copied to the "Build Path" directory (This is a directory determined internally by the Buildpack).
6. If a project file is present, but no solution file, the application is built with **MSBuild** with no parameters, and the built application is copied to the "Build Path" directory.
7. If a solution file is present, NuGet packages listed in the solution file will be restored, and the application will be built with **MSBuild**, and the application is copied to the "Build Path" directory.


This process can fail if any of the following are true:

1. There is more than one solution file present
2. The number of folders in the deployed site is not correct
3. There is no <code>Web.Config</code> file in the root of the "Build Path" directory after deployment

For more information, please refer to the <a href="https://github.com/hpcloud/cf-iis8-buildpack">Buildpack git project</a>.


---
<div align="center"><a href="/helion/devplatform/1.2/windows/">Windows Overview</a> </div>
<div align="center"> <a href="/helion/devplatform/1.2/windows/deployingnet/">Deploying your first .NET Application</a> | <a href="/helion/devplatform/1.2/windows/tools_guide/">Windows and .NET Tools Guide</a> </div>
<div align="center"> <a href="/helion/devplatform/1.2/windows/building_windows/">Building and Deploying Windows DEA and SQL Server Express Images</a> | <a href="/helion/devplatform/1.2/windows/glazier/">Glazier Reference Guide</a></div>
<div align="center"><a href="/helion/devplatform/1.2/windows/adding_services/">Adding Services to a Windows Application</a> | Deploying Windows Applications with the IIS Buildpack</div>

