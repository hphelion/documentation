---
layout: default
title: "HP Cloud OS for Moonshot for Moonshot Patch Notes"
permalink: /cloudos/moonshot/prepare/patchnotes-two/
product: moonshot
---
<!--PUBLISH--> 

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/cloudos/moonshot/prepare/">&#9664; PREV | <a href="/cloudos/moonshot/prepare/">&#9650; UP</a> | <a href="/cloudos/moonshot/prepare/releasenotes/">NEXT &#9654;</a> </p>

# HP Cloud OS for Moonshot 1.21 Patch Notes 

HP Cloud OS for Moonshot Patch release 1.21 covers the following information:

* [Features in HP Cloud OS for Moonshot Patch](#features)

* [Procedure to apply HP Cloud OS for Moonshot Patch 1.21](#apply-patch)

* [Resolved issues](#resolved-issues)

* [Known issues](#known-issues) 

<!---* [Bash vulnerability](#bash-vulnerability)-->

* [For further information](#for-further-information)

These Patch Notes include updates to information presented in the HP Cloud OS for Moonshot 1.10 [Release Notes](/cloudos/moonshot/prepare/releasenotes).

## Features in HP Cloud OS for Moonshot Patch 1.21 {#features}


**Enabled license in the product** &mdash; With this release, the user has the option to upgrade to the licensed version of HP Cloud OS for Moonshot. The HP Cloud OS for Moonshot license is a chassis based license.The license comes with two Stock Keeping Units(SKUs) one for a 1year term and the other for a 3year term. Each license has an expiry date and capacity associated with it. The capacity is the number of chassis units that are managed by the product license. A unit from the imported license is consumed when a chassis is added and a unit is released when the chassis is deleted.


## Procedure to apply the HP Cloud OS for Moonshot Patch 1.21 {#apply-patch}

**Note:** Before you apply patch 1.21, ensure no operations are being performed using the Administration Dashboard or log out of the Administration Dashboard. 

Perform the following steps to apply the patch 1.21:

1. Launch the [HP Cloud OS for Moonshot Operational Dashboard](/cloudos/moonshot/install/install-setup-admin-node/).  

2. Login with the credentials. 

3. Select  **Updates and Extensions** to display the Updates and Extensions page. <br> The patch *Cloud OS for Moonshot Patch* is listed here.</br>

4. Click **Download** displayed against *Cloud OS for Moonshot Patch* to download *hp-cos4ms-patch1.21* file. Once the patch successfully downloads, you can install it.
</br>
5. Click **Install**. <br>Once the installation completes, the status changes to installed. 

**Note:** Wait for five minutes for the changes to be implemented on all the managed nodes (Admin node, Controller node and Baremetal host).

## Resolved issues {#resolved-issues}

The following issues have been resolved:


### Bash Vulnerability

The Bash vulnerability issue is fixed with this patch release. 


###Installation

You can now successfully create compute region. The Create Compute Region command no longer fails due to the failure of GET &#095;SERVER&#095;CERTIFICATE verification.

### Provisioning ###


The de-provisioning of a bulk node topology is fixed and does not display "PROCESSING" for a lengthy period of time. 


## Known issues  {#known-issues}

The following is a known issue:

### Provisioning ###

Provisioning may fail in the following scenarios:

* when two cartridges are swapped in an already registered chassis
* when a cartridge is removed from its original slot and placed in a different slot in the same chassis or a different chassis which is already registered

<!---This happens because the MAC address of the two swapped cartridges is not in sync when two cartridges are swapped. In case the cartridge is removed from its original slot to another slot, the new slot is not able to sync with the MAC address of the cartridge.--> To resolve this issue, do the following:

1. From the Single Chassis view, get the MAC address of the cartridges to be swapped or the cartridge that is to be moved to a different slot.

2. Swap the cartridges or move the cartridge as the case maybe.

3. In the Controller node, do the following:

	* Enter the following command:
	  
            Source /root/.openrc
	
	* Enter the following command to display the nova baremetal database entries:  
	
            nova baremetal-node-list
	* Check the ID in the list against the MAC addresses of the cartridges. 
	
    * Type the following command to delete the cartridge(s): 
    
            nova baremetal-node-delete <ID> 

4. In the Single Chassis View, click force refresh icon to restart Moonshot discovery.

5. Wait for 5-10 minutes for Nova database to update. 


<!---##Bash vulnerability {#bash-vulnerability}


Bash and the Operating System keep track of the set of environment variables.The bash vulnerability is related to how Bash processes environmental variables passed by the operating system or by a program calling a Bash-based script. By crafting an environment variable with a specific structure, the bash security can be broken.


To protect system from bash vulnerability, perform the following steps:

1. Ensure that no  operations are being performed on any of the nodes.

2. To get the IP address of the nodes, do the following:
 
       - In the Operational Dashboard, click **Manage Nodes** to open the Manage Nodes page.
  
       - Click each node to view the node details.

	  **Note**: By default, the IP address of the Admin Node is *192.168.124.10*. This should be accessible from the Windows or Linux client.

3. Download the bash package from the following URL to your Windows or Linux client.
	
	[http://archive.ubuntu.com/ubuntu/pool/main/b/bash/bash_4.2-2ubuntu2.5&#095;_amd64.deb](http://archive.ubuntu.com/ubuntu/pool/main/b/bash/bash_4.2-2ubuntu2.5_amd64.deb)

4. On each of the nodes (Admin Node, Controller Node and Baremetal Host(s)), perform the following steps: 

	- Copy the previously downloaded bash package

    		scp <location of the package> <user home directory>
	

	- Login as root
 
	     	sudo -i 
   
	- Verify the current version of bash 

			dpkg -s bash

        The above command looks for the information on your bash package and displays the version that you are using. If the version displayed is  previous thanthe `bash_4.2-2ubuntu2.5` version, install the bash package by performing  next steps else you do not need to install the bash package.

	- Install the bash package 

	  		dpkg -i <location of the bash package>

	- Verify the bash version again after installation.

			dpkg -s bash

		
        If the displayed package version is bash_4.2-2ubuntu2.5, bash is successfully upgraded.

5.After successful upgrade on all the nodes, you can start working with your cloud.-->


##For further information## {#for-further-information}

For additional related information on HP Cloud OS for Moonshot, see:

* [HP Cloud OS for Moonshot documentation web site](/cloudos/moonshot/): 
* Provides the topics listed below, plus FAQs, video tutorials, and more.

* [Building Images](/cloudos/moonshot/manage/image-builder/): Provides the steps to build the images for Linux and Windows.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

