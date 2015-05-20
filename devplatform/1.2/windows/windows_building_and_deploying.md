---
layout: default-devplatform
title: "HP Helion 1.2 Development Platform: Building and Deploying Windows DEA and SQL Server Express Images"
permalink: /helion/devplatform/1.2/windows/building_windows/
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

# HP Helion 1.2 Development Platform: Building and Deploying Windows DEA and SQL Server Express Images

<span style="font-size:70%">*Windows, .NET, SQL Server, and IIS are either registered trademarks or trademarks of Microsoft Corporation in the United States and/or other countries.*</span>

This document demonstrates how to create and deploy a Windows image in an HP Helion OpenStack environment to be used in Helion Development Platform. Image creation is needed to enable Windows support. This process can take several hours (approximately 7 hours, depending on hardware and network) and in most cases can be left unattended once the scripts begin execution.

## Prerequsites

### Host Prerequisites

The following requirements pertain to the system where the Windows image will be created.

* MacOS X or Linux (Ubuntu recommended) non-virtualized environment. (i.e. the image cannot be created in a virtual machine).
* Virtualization support enabled
* 16 GB RAM recommended.
* 100 GB available disk space
* Connectivity to the Internet and the Helion OpenStack environment where the Windows image will be deployed

### Software Prerequisites

* A Windows Server 2012R2 ISO image (Volume-licensed images can be obtained through MSDN for development or test; volume-licensed production images must be obtained through the OEM channel).
	* The ISO must be a retail or volume licensed (non-evaluation) image
	* The ISO must be an English-language version.
	* The tool verifies that the name of the ISO image contains the following:
		*  <code>en</code>
		*  <code>2012</code>
		*  <code>x64</code>
		*  File extension <code>.iso</code>
* Virtual Box version 4.3.26 or later: <a href="https://www.virtualbox.org/wiki/Downloads">Download</a>
* The latest stable Virtio driver: <a href="https://fedorapeople.org/groups/virt/virtio-win/deprecated-isos/stable/virtio-win-0.1-81.iso">Download</a>
* Download and extract the Glazier tool: <a href="http://clients.als.hpcloud.com/glazier-1.2.0-posix_x86_64.zip">Download</a>. For more information about Glazier, see the <a href="/helion/devplatform/1.2/windows/glazier/">Glazier Reference Guide</a>.



### Setup Information Needed

* A Windows product key for Windows Server 2012R2. A multiple activation key is strongly recommended, as temporary instances will be created that need product keys.
* The RC file for the target Helion OpenStack environment. This can be downloaded from the Horizon interface, under **Project-&gt;Compute-&gt;Access & Security-&gt;API Access-&gt;Download OpenStack RC File**.
* The certificate for the target Helion OpenStack environment. To retrieve this certificate, do the following:
 	1. Find the IP address for <code>controller0</code>:
 		
			OVERCLOUD_CONTROLLER=$(ssh root@192.0.2.1 -C ' export TE_DATAFILE=~/tripleo/ce_env.json; source ~/tripleo/tripleo-incubator/undercloudrc; nova list |grep controller0 |cut -d= -f2 |cut -d" " -f1')

	2. Copy the CA Certificate locally:
 			
			scp -o StrictHostKeyChecking=no $OVERCLOUD_CONTROLLER:/usr/local/share/ca-certificates/ephemeralca-cacert.crt /root/ephemeralca-cacert.crt. 
The path to the certificate must be set in the OS_CACERT environment variable.

## Creating and uploading images 
<p><b>Note:</b> A Windows DEA and a SQL Server <b>cannot</b> both exist on the same image. You will need to create an image for each one.</p>
### Step 1: Create a Glazier Virtual Machine

This VM is used to create the images for the guest OS.

1. Open Terminal and change to the Glazier directory where you extracted the tool.
2. Run the <code>create-glazier</code> command (To verify your parameters before starting the tool, you can use the <code>--dry-run</code> command line switch.)

	<pre>
	./create-glazier \
		--windows-iso &lt;path to Windows Server 2012R2 iso&gt; \
		--virtio-iso &lt;path to VirtIO iso&gt; \
		--product-key &lt;Windows Product Key&gt; \
		--os-network-id &lt;os network ID; found in Horizon on the Network Detail page under Project -&gt; Network -&gt; Networks -&gt; (select network name) &gt; \
		--os-key-name &lt;os region name; e.g. RegionOne&gt; 
		--os-security-group &lt;os security group; e.g Default&gt; \
		--os-flavor &lt;os flavor name: e.g. m1.small&gt; \
	</pre>
3. When the tool finishes, you will see a command prompt open in a Virtual Box instance. 


### Step 2: Create and Initialize the OS Windows DEA Image

1. In the Glazier VM command prompt that opens after the end of the previous step, run the following command:

		New-Image -name "windows2012r2-windea" -GlazierProfilePath "windea"
2. Once the image gets created, the image will be initialized automatically.

### Step 3: Create and Initialize the OS SQL Server Express 2012 Image (Optional)

1. In the Glazier VM command prompt, run the following command:
	
		New-Image -name "windows 2012r2-sql2012" -GlazierProfilePath "mssql2012"

2. Once the image gets created, the image will be initialized automatically.

### Step 4: Create and Initialize the OS SQL Server Express 2014 Image (Optional)

1. In the Glazier VM command prompt, run the following command:
	
		New-Image -name "windows 2012r2-sql2014" -GlazierProfilePath "mssql2014"

2. Once the image gets created, the image will be initialized automatically.

## Enabling Windows and SQL Server in your ALS cluster {#enabling}
Note that you can do this [through the Horizon console](/helion/devplatform/1.2/growcluster) instead of the command line if you prefer.
### Add Windows DEA

1. Create a yml file to add (e.g. <code>manifest.yml</code>)

		version: 1.2
		constructor-image-name: {?}
		seed-node-image-name: {Windows DEA Image Name}
		cluster-title: MyCluster
		cluster-prefix: MyCluster
		az: {az name}
		constructor-flavor: standard.medium
		flavor: standard.medium
		keypair-name: {key name}
		stack: win2012r2
		max-cluster-wait-duration: 30m
		network-name: {network name}

    The <code>cluster-title</code> and <code>cluster-prefix</code> need to match the cluster you are deploying the image to.
2. Run this command

		cf-mgmt add-role dea --load <file name>.yml

### Add SQL Server 2012 service

1. Create a yml file to add (e.g. <code>manifest.yml</code>)

		version: 1.2
		constructor-image-name: {?}
		seed-node-image-name: {SQL Image Image Name}
		cluster-title: MyCluster
		cluster-prefix: MyCluster
		az: {az name}
		constructor-flavor: standard.medium
		flavor: standard.medium
		keypair-name: {key name}
		stack: mssql2012
		max-cluster-wait-duration: 30m
		network-name: {network name}

    The <code>cluster-title</code> and <code>cluster-prefix</code> need to match the cluster you are deploying the image to.

2. Run this command for SQL Server 2012

		cf-mgmt add-service mssql2012 --load <file name>.yml

### Add SQL Server 2014 service

1. Create a yml file to add (e.g. <code>manifest.yml</code>)

		version: 1.2
		constructor-image-name: {?}
		seed-node-image-name: {SQL Image Image Name}
		cluster-title: MyCluster
		cluster-prefix: MyCluster
		az: {az name}
		constructor-flavor: standard.medium
		flavor: standard.medium
		keypair-name: {key name}
		stack: mssql2012
		max-cluster-wait-duration: 30m
		network-name: {network name}

    The <code>cluster-title</code> and <code>cluster-prefix</code> need to match the cluster you are deploying the image to

2. Run this command for SQL Server 2014

		cf-mgmt add-service mssql2014 --load <file name>.yml
## Activating Windows Images

When a Windows DEA or SQL Server image node added to an ALS server, these instances need to be activated to be compliant with <a href="https://www.microsoft.com/licensing/">Microsoft licensing</a>. You can activate by either connecting to them with Remote Desktop and activating Windows manually, or by using KVM. 

-----------------

<div align="center"><a href="/helion/devplatform/1.2/windows/">Windows Overview</a> </div>
<div align="center"> <a href="/helion/devplatform/1.2/windows/deployingnet/">Deploying your first .NET Application</a> | <a href="/helion/devplatform/1.2/windows/tools_guide/">Windows and .NET Tools Guide</a> </div>
<div align="center"> Building and Deploying Windows DEA and SQL Server Express Images | <a href="/helion/devplatform/1.2/windows/glazier/">Glazier Reference Guide</a></div>
<div align="center"><a href="/helion/devplatform/1.2/windows/adding_services/">Adding Services to a Windows Application</a> | <a href="/helion/devplatform/1.2/windows/buildpack/">Deploying Windows Applications with the IIS Buildpack</a></div>



		
