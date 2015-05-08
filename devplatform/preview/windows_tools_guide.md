---
layout: default-devplatform
title: "HP Helion 1.2 Development Platform: Windows and .NET Applications Tools Guide"
permalink: /helion/devplatform/preview/tools_guide
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

# HP Helion 1.2 Development Platform: Windows and .NET Tools Guide 

*Windows is either a registered trademark or trademark of Microsoft Corporation in the United States and/or other countries.*

<span style="color:red">**Note**: Helion Development Platform 1.2 is currently only available on HP Helion Public Cloud as part of the Deveoper Preview</span>

Helion Development Platform (HDP) 1.2 adds tooling support for deploying Windows images and .NET Framework HTTP-based applications. This document describes how to install and use these tools.



This document contains the following sections:

###.NET tools:
* [Cloud Foundry Explorer](#cloudfoundryexplorer)
* [Cloud Foundry MSBuild Tasks](#msbuild)
* [Cloud Foundry .NET SDK](#sdk)

### Setup tools:
* [ALS Cluster Management (cf-mgmt)](#ALS)
* [Helion client (helion)](#helion)
 
## .NET tools
### Cloud Foundry Explorer {#cloudfoundryexplorer}

This Visual Studio 2013 plugin is used to deploy and manage .NET applications. The plugin can be used in any edition of VS 2013, including the Community (free) edition.

#### Installation

Follow these steps to install the Cloud Foundry Explorer:

1. Open the *Extensions and Updates* panel in Visual Studio 2013.
2. Search for the **Cloud Foundry Explorer** extension.
3. Install the extension from the search results.

#### The Cloud Foundry Explorer Window

The explorer can be opened in Visual Studio under View -&gt;Other Windows -&gt;Cloud Foundry Explorer. The explorer window shows endpoints that you have successfully connected to:

<img src="media/windows_cf_explorer.PNG" />

The Cloud Foundry Explorer Window displays the following types of nodes:

* **Cloud Foundry Target**: Lists version, URL, login credentials, and whether to ignore SSL errors (e.g. from using self-signed certificates).
* **Organization**: Lists current roles in organization, organization name, and creation date
* **Space**: Lists current roles in space, space name, and creation date
* **Apps**: The deployed applications
* **App**: Each deployed application. Shows creation date, application name, buildpack, max memory, and instance count.
* **Service**: Shows current roles in service, service name, creation date
* **Route**: Shows the domain for the route, and which applications bind to it
* **AppFiles**: A collection of files used by an application
* **File**: Files are listed in an AppFiles collection. Shows the filename for the file.
* **Services**: Shows details for the service collection
* **Routes**: Shows details for the route collection

#### Deploying an application

For an example of how to deploy an application from Visual Studio, see <a href="/helion/devplatform/preview/deployingnet">Deploying your first .NET Application</a>.

### Cloud Foundry MSBuild Tasks {#msbuild}

These MSBuild processes allow you to build and deploy .NET applications to Cloud Foundry instances as part of the usual build process for your application. 

The MSBuild tasks can be installed using NuGet:

* Right-click the project in **Solution Explorer** and select **Manage NuGet Packages**.
* Search for **Cloud Foundry MSBuild Tasks**
* Click **Install**
 

### Cloud Foundry .NET SDK {#sdk}

The SDK is used for programmatic access to controlling Windows images and .NET applications. Using the SDK, developers can create build and deployment automation.

The Cloud Foundry .NET SDK can be installed using NuGet:

* Right-click the project in **Solution Explorer** and select **Manage NuGet Packages**.
* Search for **Cloud Foundry .NET SDK**
* Click **Install**

## Setup Tools

### Helion Client {#helion}

This tool is used to deploy applications from the command line. The same tool is used for deploying applications to Windows and Linux instances.

**Note:** .NET applications are built on the server using **MSBuild**. You should verify that your application builds with **MSBuild** before deploying.

To deploy a .NET application to a Windows instance, use the following syntax from the same folder as your <code>manifest.yml</code> file:

		helion push --stack win2012r2 

For more information on the Helion client, see <a href="http://docs.hpcloud.com/helion/devplatform/1.1/als/user/reference/client-ref">Application Lifecycle Service Client Command Reference</a>

The Helion client tool can be downloaded from the following location: <a href="http://docs.hpcloud.com/helion/devplatform/1.1/als/client/download">Download</a>

---
<div align="center"><a href="/helion/devplatform/preview/">Windows Overview</a>
</div>
 <div align="center"><a href="/helion/devplatform/preview/deployingnet">Deploying your first .NET Application</a> | Windows and .NET Tools Guide</div>


















		
