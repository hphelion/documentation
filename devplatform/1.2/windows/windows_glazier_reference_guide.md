---
layout: default-devplatform
title: "HP Helion 1.2 Development Platform: Glazier Reference Guide"
permalink: /helion/devplatform/1.2/windows/glazier/
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

# HP Helion 1.2 Development Platform: Glazier Reference Guide

<span style="font-size:70%">*Windows, .NET, SQL Server, and IIS are either registered trademarks or trademarks of Microsoft Corporation in the United States and/or other countries.*</span>

Glazier is a collection of scripts used for building Windows images for deployment to a Helion OpenStack environment. The image that the tool creates can be configured either by using command-line switches, or by using a Glazier profile.

* [Downloading the Glazier Tool](#downloading)
* [Prerequisites](#prerequisites)
* [Usage](#usage)
* [Command-Line Arguments](#commandline)
* [Glazier Profiles](#profile)

## Downloading the Glazier tool {#downloading}

The Glazier tool can be found here: <a href="https://drive.google.com/a/hp.com/folderviewid=0By3HV5Aek7gYfjg3TUVGT1RxeGhhZTBvN2JBR3Y4UWZZWXkycEprUGhSc0J3a19XcHJaTXM&usp=sharing">Download</a>

## Prerequisites {#prerequisites}

Glazier can run in either Ubuntu or OSX.

* <a href="http://download.virtualbox.org/virtualbox/4.3.26/VirtualBox-4.3.26-98988-OSX.dmg">Virtual box 4.3.26</a>
* A retail, English Windows 2012R2 image. Images for a development or test environment can be downloaded from MSDN; for a production environment, you must obtain an image through your OEM channel.
* <a href="http://alt.fedoraproject.org/pub/alt/virtio-win/stable/virtio-win-0.1-81.iso">Windows VirtIO Image 0.1-81</a>

## Usage {#usage}

To use the script, you need to have the following OpenStack environment variables set:

* OS\_TENANT\_NAME
* OS\_USERNAME
* OS\_PASSWORD
* OS\_REGION\_NAME
* OS\_TENANT\_ID
* OS\_AUTH\_URL

It is recommended to set these environment variables using the OpenStack RC file from the target environment. This can be obtained in Horizon, under Project-&gt;Compute-&gt;Access & Security-&gt;API Access-&gt;**Download OpenStack RC File**.



For an example on how to use Glazier to create a Windows image, see <a href="/helion/devplatform/1.2/windows/enabling_windows">Enabling Windows</a>.

## Command-line arguments {#commandline}

Syntax: <code>create-glazier</code>

Available options:

<pre>
--windows-iso /path/to/windows_iso_kit      
    - specifies the location of the Windows iso image

--sql-server-iso /path/to/sqlserver_iso_kit 
    - specifies the location of the SQL Server iso image

--virtio-iso /path/to/virtio_iso_kit        
    - specifies the path to the Virtio iso image

--profile PATH                              
    - (optional) path to a glazier profile. Can be used multiple times. If not supplied, 
    - a subdirectory named "profile" will be searched by default, and all profiles found will be used. <span style="color:red">Is this accurate?</span>

--vm-path PATH                              
    - (optional) path to a directory where VBox files will be saved. The default is ~/.glazier

--with-sql-server {none|2012|2014}      
    - if this is set, you also have to set --sql-server-iso

--product-key KEY               
    - Windows product key; leave empty if you're using a VL Windows iso with a KMS server

--os-network-id
    - OpenStack network id used for building the OpenStack image. Can be found 
    - in Horizon interface under Project-&gt;Network-&gt;Networks-&gt;(network name)-&gt;ID

--os-key-name
    - OpenStack name of the key used for building the OpenStack image. Can be found
    - in Horizon interface under Project-&gt;Compute-&gt;Access & Security-&gt;Key Pairs

--os-security-group
    - OpenStack security group used for building the OpenStack image
 
--os-flavor
    - OpenStack flavor used for building the OpenStack image. Example: standard.medium

--insecure
	- (optional) create a Windows image for a Development Platform installation that doesn't have an HTTPS certificate

--windows-update-proxy
	- (optional) proxy used for Windows Updates on image
  
--dry-run                   
    - (optional) run but don't make any changes

--verbosity verbosity_level         
    - verbosity level is an interger between 1-3, with 1 being the least verbose and 3 being the most verbose. 
    - The default is 3.

--use-colors {yes|no}               
    - Should the script display colors or not. The default is yes.

--version
	- (optional) show the Glazier version

--help                      
    - shows this message
</pre>

## Creating a Glazier Profile {#profile}

A profile can be used to configure Glazier. By default we provide the profiles you need to create the images you need to enable working with Windows. However, you can create a custom profile. Use the following template:

<span style="color:red">Vlad, need profile template.</span>

After creating the profile, use the <code>--profile</code> command-line switch (above).

<div align="center"><a href="/helion/devplatform/1.2/windows/">Windows Overview</a> </div>
<div align="center"> <a href="/helion/devplatform/1.2/windows/deployingnet/">Deploying your first .NET Application</a> | <a href="/helion/devplatform/1.2/windows/tools_guide">Windows and .NET Tools Guide</a> </div>
<div align="center"> <a href="/helion/devplatform/1.2/windows/building_windows/">Building and deploying Windows images</a> | Glazier Reference Guide</div>
<div align="center"><a href="/helion/devplatform/preview/adding_services/">Adding Services to a Windows Application</a> | <a href="/helion/devplatform/1.2/windows/buildpack/">Deploying Windows Applications with the IIS Buildpack</a></div>