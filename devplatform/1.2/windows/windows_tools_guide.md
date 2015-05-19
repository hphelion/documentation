---
layout: default-devplatform
title: "HP Helion 1.2 Development Platform: Windows and .NET Applications Tools Guide"
permalink: /helion/devplatform/1.2/windows/tools_guide/
product: devplatform2.0
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

# HP Helion 1.2 Development Platform: Windows and .NET Tools Guide 

<span style="font-size:70%">*Windows, .NET, SQL Server, and IIS are either registered trademarks or trademarks of Microsoft Corporation in the United States and/or other countries.*</span>

Helion Development Platform 1.2 adds tooling support for deploying Windows images and .NET Framework HTTP-based applications. This document describes how to install and use these tools.

This document contains the following sections:

###.NET tools:
* [Cloud Foundry Explorer](#cloudfoundryexplorer)
* [Cloud Foundry MSBuild Tasks](#msbuild)
* [Cloud Foundry .NET SDK](#sdk)

### Setup tools:
* [ALS Cluster Management (cf-mgmt)](#ALS)
* [Helion client (helion)](#helion)

### Windows Image Tool:
* [Glazier](#glazier)
 

## .NET tools
### Cloud Foundry Explorer {#cloudfoundryexplorer}

This Visual Studio 2013 extension is used to deploy and manage .NET applications. The extension can be used in any edition of VS 2013, including the Community (free) edition.

#### Installation

Follow these steps to install the Cloud Foundry Explorer:

1. Select **Tools-&gt;Extensions and Updates** in Visual Studio 2013.
2. In the **Extensions and Updates** panel, search for the **Cloud Foundry Explorer** extension in the **Online** section.
3. Install the extension from the search results.

The Cloud Foundry Explorer page on Visual Studio Gallery can be found <a href="https://visualstudiogallery.msdn.microsoft.com/4cad4d95-099c-449e-9d90-7d4da5c4a0c0?SRC=Home">here</a>.

#### The Cloud Foundry Explorer Window

The explorer can be opened in Visual Studio under **View -&gt;Other Windows -&gt;Cloud Foundry Explorer**. The explorer window shows endpoints that you have successfully connected to:

<img src="media/windows_cf_explorer.PNG" />

The Cloud Foundry Explorer Window displays the following types of nodes:

<table>
 <tr>
  <th><p>Node Type</p></th>
  <th><p>Supported Actions</p></th>
  <th><p>Description</p></th>
 </tr>
 <tr>
  <td><p><strong>Target</strong></p></td>
  <td><p>Refresh, Remove</p></td>
  <td><p>Lists version, URL, login credentials, and whether to ignore SSL errors (e.g. from using self-signed certificates).</p></td>
 </tr>
 <tr>
  <td><p><strong>Organizations</strong></p></td>
  <td><p>Refresh, Remove</p></td>
  <td><p>Lists current roles in organization, organization name, and creation date</p></td>
 </tr>
 <tr>
  <td><p><strong>Spaces</strong></p></td>
  <td><p>Refresh, Remove</p></td>
  <td><p>Lists current roles in space, space name, and creation date</p></td>
 </tr>
 <tr>
  <td><p><strong>Applications</strong></p></td>
  <td><p>Refresh, Remove</p></td>
  <td><p>The deployed applications</p></td>
 </tr>
 <tr>
  <td><p><strong>Application</strong></p></td>
  <td><p>View App in Browser, Start, Restart, Stop and Delete</p></td>
  <td><p>Each deployed application. Shows creation date, application name, buildpack, max memory, and instance count.</p></td>
 </tr>
 <tr>
  <td><p><strong>Services</strong></p></td>
  <td><p>Refresh, Remove</p></td>
  <td><p>Shows details for the service collection</p></td>
 </tr>
 </tr>
 <tr>
  <td><p><strong>Service</strong></p></td>
  <td><p>Delete</p></td>
  <td><p>Shows current roles in service, service name, creation date</p></td>
 </tr>
 <tr>
  <td><p><strong>Routes</strong></p></td>
  <td><p>Refresh, Remove</p></td>
  <td><p>Shows details for the route collection</p></td>
 </tr>
 <tr>
  <td><p><strong>Route</strong></p></td>
  <td><p>Delete</p></td>
  <td><p>Shows the domain for the route, and which applications bind to it</p></td>
 </tr>
</table>

#### Deploying an application

For an example of how to deploy an application from Visual Studio, see <a href="/helion/devplatform/preview/deployingnet">Deploying your first .NET Application</a>.

**Note:** Currently, only Web Application Projects can be deployed from Cloud Foundry Explorer; Web Site Projects are not supported. Web Site Projects can still be deployed from the command line.

### Cloud Foundry MSBuild Tasks {#msbuild}

These MSBuild processes allow you to build and deploy .NET applications to Cloud Foundry instances as part of the usual build process for your application. 

The MSBuild tasks can be installed using NuGet:

* Right-click the project in **Solution Explorer** and select **Manage NuGet Packages**.
* Search for **Cloud Foundry MSBuild Tasks** in the **Online** section
* Click **Install**
 
The MSBuild Tasks NuGet package can be found <a href="http://www.nuget.org/packages/cf-msbuild-tasks/">here</a>.

For more information on MSBuild, see <a href="https://msdn.microsoft.com/en-us/library/dd393574.aspx">MSBuild on MSDN</a>.

### Cloud Foundry .NET SDK {#sdk}

The SDK is used for programmatic access to controlling Windows images and .NET applications. Using the SDK, developers can create build and deployment automation and tools that interact with the ALS APIs.

The Cloud Foundry .NET SDK can be installed using NuGet:

* Right-click the project in **Solution Explorer** and select **Manage NuGet Packages**.
* Search for **Cloud Foundry .NET SDK**
* Click **Install**

The CloudFoundry NuGet package can be found <a href="http://www.nuget.org/packages/cf-dotnet-sdk/">here</a>.

## Setup Tools

### ALS Cluster Management Tool (cf-mgmt) {#ALS}

This tool is used to add services to new ALS clusters. The same tool is used for Linux and Windows instances.

To add a DEA role to a Windows instance, use the following syntax:

		cf-mgmt add-role dea --load <file name>.yml

To add a SQL Server role to a Windows instance, use the following syntax:

		cf-mgmt add-service mssql2014 --load <file name>.yml

For more information on the ALS cluster management tool, see <a href="http://docs.hpcloud.com/helion/devplatform/1.2/als/client/reference">HP Helion ALS Cluster Management Tool Reference</a>.

The ALS cluster management tool can be downloaded from the following location: <a href="http://docs.hpcloud.com/helion/devplatform/1.2/als/client/download">Download</a>

### Helion Client {#helion}

This tool is used to deploy applications from the command line. The same tool is used for deploying applications to Windows and Linux instances.

**Note:** .NET applications are built on the server using **MSBuild**. You should verify that your application builds with **MSBuild** before deploying.

To deploy a .NET application to a Windows instance, use the following syntax from the same folder as your <code>manifest.yml</code> file:
		helion target <cluster URL>
		helion login
		helion push --stack win2012r2 

For more information on the Helion client, see <a href="/helion/devplatform/1.2/als/user/reference/client-ref">HP Helion 1.2 Development Platform: Application Lifecycle Service Client Command Reference</a>

The Helion client tool can be downloaded from the following locations: 

<ul>
<li><a href="http://clients.als.hpcloud.com/helion-1.2.0-win32-ix86.zip">Windows&#174;</a></li>
<li><a href="http://clients.als.hpcloud.com/helion-1.2.0-linux-glibc2.3-x86_64.zip">Linux x64</a></li>
<li><a href="http://clients.als.hpcloud.com/helion-1.2.0-macosx10.5-i386-x86_64.zip">Mac OS X&#174;</a></li>
</ul>

## Windows Image Tool

### Glazier {#glazier}

Glazier is the tool used to create Windows images for deployment to Helion OpenStack (HOS) Application Lifecycle Service (ALS) clusters. 

Glazier can be downloaded from the following location: <a href="http://clients.als.hpcloud.com/glazier-1.2.0-posix_x86_64.zip">Download</a> 

For information on Glazier, see <a href="/helion/devplatform/1.2/windows/glazier/">Glazier Reference Guide</a>.



---
<div align="center"><a href="/helion/devplatform/1.2/windows/">Windows Overview</a> </div>
<div align="center"> <a href="/helion/devplatform/1.2/windows/deployingnet/">Deploying your first .NET Application</a> | Windows and .NET Tools Guide </div>
<div align="center"> <a href="/helion/devplatform/1.2/windows/building_windows/">Building and Deploying Windows DEA and SQL Server Express Images</a> | <a href="/helion/devplatform/1.2/windows/glazier/">Glazier Reference Guide</a></div>
<div align="center"><a href="/helion/devplatform/1.2/windows/adding_services/">Adding Services to a Windows Application</a> | <a href="/helion/devplatform/1.2/windows/buildpack/">Deploying Windows Applications with the IIS Buildpack</a></div>




















		
