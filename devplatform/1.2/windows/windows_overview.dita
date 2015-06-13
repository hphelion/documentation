---
layout: default-devplatform
title: "HP Helion 1.2 Development Platform: Windows Overview"
permalink: /helion/devplatform/1.2/windows/
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
<!--PUBLISH-->

# HP Helion 1.2 Development Platform: Windows Overview

<span style="font-size:70%">*Windows, .NET, SQL Server, and IIS are either registered trademarks or trademarks of Microsoft Corporation in the United States and/or other countries.*</span>

Helion Development Platform version 1.2 includes a full end-to-end solution for creating and deploying .NET Framework applications. Windows developers can now leverage their knowledge and use the tools they are accustomed to in order to leverage the power of the Helion Development Platform. HTTP-based .NET applications that follow the <a href="http://docs.cloudfoundry.org/devguide/deploy-apps/prepare-to-deploy.html">Cloud Foundry application model</a> are a great fit for this feature support.

This document contains the following sections:

* [Overview](#overview)
* [Supported .NET Application Types](#apps)
* [SQL Server Support](#sql)
* [Windows Tools](#tools)
* [Process](#process)
* [Software Requirements](#softwarerequirements)
* [Windows Instance Licensing](#licensing)
* [Next Steps](#nextsteps)

## Overview {#overview}

Helion Development Platform version 1.2 adds tools for creating instances of Windows Server 2012 R2 to a Helion OpenStack environment, and Visual Studio components for deploying .NET HTTP-based applications to those server instances. Benefits of Windows/.NET support include:

* Organizations can run their .NET server applications in the same Helion OpenStack environment as their Linux applications.
* A consistent tooling experience for deploying Windows and Linux applications: The same <a href="/helion/devplatform/1.2/windows/tools_guide#helion">application deployment tools</a> can be used for both Windows and Linux deployments.
* Additional developer tools, including an SDK for programmatic access to services, and a <a href="/helion/devplatform/1.2/windows/tools_guide#cloudfoundryexplorer">Visual Studio extension</a> for deploying and managing applications.
* Feature-rich application sandboxing, including memory and CPU management, and application isolation. This allows applications to coexist within a single ALS cluster, saving the overhead of running a separate operating system for each application.
* Support for creating Windows instances that include Microsoft SQL Server Express. 
* Integrated buildpack support for building applications with dependencies and services.

Windows and .NET support is enabled by adding this functionality to an existing Helion Development Platform 1.2 installation.

For the 1.2 release, we support creating the following types of instances:

* Windows Server 2012 R2 with DEA (Droplet Execution Agent) role
* Windows Server 2012 R2 with SQL Server 2012 Express
* Windows Server 2012 R2 with SQL Server 2014 Express

Helion Development Platform treats deployment of .NET applications in the same way as Linux applications (such as Java or PHP appplications). .NET applications require a <a href="/helion/devplatform/1.2/windows/buildpack/">buildpack</a> to specify the dependencies and <a href="/helion/devplatform/1.2/windows/adding_services/">services</a> that can be bound to the application. .NET applications are deployed into a sandbox environment similar to Warden in Cloud Foundry. 

## Supported .NET Application Types {#apps}

Helion Development Platform supports HTTP-based applications, including ASP.NET and WCF. Design considerations for Windows DEA applications are the same as for <a href="http://docs.cloudfoundry.org/devguide/deploy-apps/prepare-to-deploy.html">Cloud Foundry</a> applications. 

Helion Development Platform also provides an integrated IIS buildpack which supports the following technologies:

* IIS 8
* .NET 2.0-4.5.2
* ASP.NET Web Forms
* ASP.NET WebAPI v1 and v2
* ASP.NET MVC 2 through 5 with Entity Framework 6
* ASP.NET SignalR
* WCF services

## SQL Server Support {#sql}

The Helion Development Platform 1.2 supports SQL Server Express 2012 and SQL Server Express 2014. SQL Server support is enabled by creating a SQL Server service using the SQL Server broker. Each application that binds to the SQL Server service will create a new database and service credentials. The service credentials get created and can be accessed either from the <code>web.config</code> file, or programmatically through the <code>VCAP_SERVICES</code> environment variable.

## Windows Tools {#tools}

In order to run .NET framework applications, Helion Development Platform requires that Windows DEA nodes be deployed. The tools used to create and deploy Windows DEA nodes, and to deploy .NET Framework applications, include the following:

### Imaging tool

* Glazier: This tool creates Windows images for deployment to Helion OpenStack. This tool is not needed for using Windows images in HP Helion Public Cloud.

### Management tool set:

* ALS Cluster management (*cf-mgmt*): This tool adds Windows DEAs and SQL Server services to your cluster.
* ALS Client (*helion*): This tool deploys .NET applications (run with the <code>--stack win2012r2</code> switch). The ALS client can deploy Windows applications from Windows, Linux, or MacOS X environments.

### .NET tool set: 

* Cloud Foundry Explorer: This Visual Studio extension performs simple management tasks such as starting or stopping an application, deleting a service, or renaming a route.
* Cloud Foundry MSBuild tasks: These MSBuild processes allow you to build and deploy .NET applications as part of the usual build process for your application.
* Cloud Foundry .NET SDK: These libraries allow you to programmatically interact with the Cloud Foundry APIs.

For more information about downloading and using these tools, see <a href="/helion/devplatform/1.2/windows/tools_guide">Windows and .NET Tools Guide</a>.

## Process {#process}

At a high level, running .NET applications in Helion Development Platform involves the following process:

### Enabling Windows (Installation) {#enablingwindows}

1. Obtain a Windows 2012 R2 server license and ISO image.
2. Download the <a href="http://clients.als.hpcloud.com/glazier-1.2.0-posix_x86_64.zip">Glazier</a> tool.
3. Use the Glazier tool to create and upload your Windows images.
4. Add Windows DEAs to your cluster
5. Add SQL Server services to your cluster.

### Application development and deployment {#development}

1. Download the <a href="/helion/devplatform/1.2/als/client/download">Helion client tool</a>.
2. Install the Cloud Foundry Explorer and Cloud Foundry MSBuild tasks in Visual Studio.
3. Optionally, install the Cloud Foundry .NET SDK (for programmatic access to services.)
4. Build your application.
5. Deploy your application using either Visual Studio or the Helion client.

## Software Requirements {#softwarerequirements}

Windows support has software requirements including the following:

* A deployment of Helion OpenStack 1.1.1 or an HP Helion Public Cloud account. To try HP Helion Public Cloud, see <a href="http://www.hpcloud.com/cloud-credit">HP Cloud Signup</a>. Helion Development Platform 1.2 is not supported on Helion OpenStack 1.0 or 1.1.
* A licensed, retail, English-language Windows 2012 R2 ISO image. Evaluation versions and non-English versions are not supported. This image can be obtained through a MSDN subscription for development and test purposes, but images for use in a production environment must be obtained through the OEM channel. See [Windows Instance Licensing](#licensing) for details.
* Virtual Box version 4.3.26 or later: <a href="https://www.virtualbox.org/wiki/Downloads">Download</a>
* Virtio drivers version 0.1-81: <a href="https://fedorapeople.org/groups/virt/virtio-win/deprecated-isos/stable/virtio-win-0.1-81.iso">Download</a>
* The Glazier tool: <a href="http://clients.als.hpcloud.com/glazier-1.2.0-posix_x86_64.zip">Download</a>
* If applications are to be deployed and managed from the development environment, any edition of Visual Studio 2013, including the Community (free) edition.
* The <a href="/helion/devplatform/1.2/windows/deployingnet">Cloud Foundry Explorer Visual Studio extension</a>. This extension can be found by searching for **Cloud Foundry Explorer** in the *Extensions and Updates* module of Visual Studio.
*  Helion OpenStack supports .NET applications created with .NET versions 2.0 through 4.5.2.

## Windows Instance Licensing {#licensing}

You will need to provide your own Windows licensing for use with Windows instances; Microsoft's licensing requires customers to create their own images using their own licensed software. During image creation, temporary instances of Windows Server are created, so a volume license is required. 

Windows Server licensing for Windows DEAs and Windows SQL Server instances consists of two components:

* Licensing agreements. These are paid contracts with Microsoft, which include the legal right to run a software package and support agreements. Since Helion OpenStack is a <a href="http://www.windowsservercatalog.com/svvp.aspx">certified SSVP provider</a>, customers can use Microsoft support with their own licensing agreements. 
* Activation. Your Windows instances can be activated by using your KVM server, or by connecting to the Windows instance directly using Remote Desktop, and providing product keys manually.

For more information on licensing Windows Server, see <a href="https://www.microsoft.com/en-us/licensing/product-licensing/windows-server-2012-r2.aspx">Windows Server 2012 Volume Licensing</a>, or contact your Microsoft licensing representative.

## Next Steps {#nextsteps}

* <a href="/helion/devplatform/1.2/growcluster">Growing and Renaming Clusters Using Horizon</a>
* <a href="/helion/devplatform/1.2/windows/building_windows/">Building and Deploying Windows DEA and SQL Server Express Images</a>
* <a href="/helion/devplatform/1.2/windows/deployingnet/">Deploying your first .NET application</a> 
* <a href="/helion/devplatform/1.2/windows/glazier/">Glazier Reference Guide</a>
* <a href="/helion/devplatform/1.2/windows/buildpack/">Understanding IIS Buildpack</a>
* <a href="/helion/devplatform/1.2/windows/adding_services/">Connecting Services to a Windows Application</a>
* <a href="/helion/devplatform/1.2/windows/tools_guide/">Windows and .NET Tools Guide</a>









