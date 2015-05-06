---
layout: default-devplatform
title: "HP Helion 1.2 Development Platform: Windows and .NET Applications Tools Guide"
permalink: /helion/devplatform/1.2/windows/tools_guide
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

Helion Development Platform (HDP) 1.2 adds tooling support for deploying Windows images and .NET Framework HTTP-based applications. This document describes how to obtain and use these tools.

This document contains the following sections:

###.NET tools:
* [Cloud Foundry Explorer](#cloudfoundryexplorer)
* [MSBuild scripts](#msbuild)
* [Helion Development Platform .NET SDK](#sdk)

### Setup tools:
* [ALS Cluster Management (cf-mgmt)](#ALS)
* [Helion client (helion)](#helion)

### Windows Image Tool:
* [Glazier](#glazier)
 

## .NET tools
### Cloud Foundry Explorer

This Visual Studio 2013 plugin is used to deploy and manage .NET applications. The plugin can be used in any edition of VS 2013, including the Community (free) edition.

#### Installation

Follow these steps to install the Cloud Foundry Explorer:

1. Open the *Extensions and Updates* panel in Visual Studio 2013.
2. Search for the **Cloud Foundry Explorer** extension.
3. Install the extension from the search results.

#### Deploying an application

For an example of how to deploy an application from Visual Studio, see <a href="/helion/devplatform/1.2/windows/deployingnet">Deploying your first .NET Application</a>.

### MSBuild scripts {#msbuild}

<span style="color:red">To be determined</a>

### Cloud Foundry .NET SDK {#sdk}

The SDK is used for programmatic access to controlling Windows images and .NET applications. Using the SDK, developers can create build and deployment automation.

<span style="color:red">To be determined</a>

## Windows Image tool
### Glazier {#glazier}

Glazier is the tool used to create Windows images for deployment to Helion OpenStack (HOS) Application Lifecycle Service (ALS) clusters. 

Glazier can be downloaded from the following location: <a href="">Download</a> <span style="color:red">(Need final link)

For information on Glazier, see <a href="/helion/devplatform/1.2/windows/glazier/">Glazier Reference Guide</a>.

## Setup Tools
### ALS Cluster Management Tool (cf-mgmt) {#ALS}

This tool is used to add services to new ALS clusters. The same tool is used for Linux and Windows instances.

To add a DEA role to a Windows instance, use the following syntax:

		cf-mgmt add-role dea --load <file name>.yml

To add a SQL Server role to a Windows instance, use the following syntax:

		cf-mgmt add-service mssql2014 --load <file name>.yml

For more information on the ALS cluster management tool, see <a href="http://docs.hpcloud.com/helion/devplatform/1.2/als/client/reference">HP Helion ALS Cluster Management Tool Reference</a>.

The ALS cluster management tool can be downloaded from the following location: <a href="http://docs.hpcloud.com/helion/devplatform/1.1/als/client/download">Download</a>

### Helion Client {#helion)

This tool is used to deploy applications from the command line. The same tool is used for deploying applications to Windows and Linux instances.

To deploy a .NET application to a Windows instance, use the following syntax from the same folder as your <code>manifest.yml</code> file:

		helion push --stack win2012r2 

For more information on the Helion client, see <a href="http://docs.hpcloud.com/helion/devplatform/1.2/als/user/reference/client-ref">HP Helion 1.2 Development Platform: Application Lifecycle Service Client Command Reference</a>

The Helion client tool can be downloaded from the following location: <a href="http://docs.hpcloud.com/helion/devplatform/1.1/als/client/download">Download</a>




















		
