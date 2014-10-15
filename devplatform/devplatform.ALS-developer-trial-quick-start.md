---
layout: default-devplatform
title: "Quick Start Developer Trial"
permalink: /helion/devplatform/ALS-developer-trial-quick-start/
product: devplatform

---
<!--UNDER REVISION-->

#HP Helion Development Platform: Quick Start Developer Trial#
<a name="top"></a>
This document explains the process to install and configure Helion Development Platform Application Lifecycle Service (ALS) in the public cloud. This is the fastest way to create a sandbox environment to evaluate the HP Helion Development Platform.

ALS Cluster creation is enabled by using an ALS Constructor, a Virtual Machine (VM) image pre-loaded with configuration and orchestration software.  This image is available in every public cloud account.

After you create your public cloud account, you will use the ALS Constructor to configure and create your cluster.  At the end of the process, you will have an endpoint URL that you can use to deploy your apps.
The document covers the following sections:

- <a href="#pre">Prerequisites</a>
- <a href="#install">Installing your Quick Start Developer Trial</a>
- <a href="#after">After you install</a>

##Prerequisites<a name="pre"></a>
Before you start the installation and configuration process, ensure that you have a user account on an <a href="https://horizon.hpcloud.com/register" target="_blank">HP Helion Public Cloud</a>. Take advantage of the <a href="http://www.hpcloud.com/cloud-credit" target="_blank">trial offer</a> to get started at no cost. You will be asked to provide a phone number for verification and a credit card to keep on file. Please keep your username and password handy as you will be entering them in the steps below.

##Installing your Quick Start Developer Trial<a name="install"></a>
1. Log into the Horizon Console using the HP Helion Public Cloud username and password that you created during signup.
2. Create a new project, if you don't already have one.
3. Change to the US East Region in the Horizon Console. <br><img src="media/HorizonUSEast.png"/>
5. Create a new Compute instance in the US East region.<br><img src="media/newComputeInstance.png"/>
6. Click on + Launch Instance button to open the launch instance dialog.<br><img src="media/launchInstance.png"/>
7. On the resulting dialog, fill out the details and select **Boot from image** to enable selection of the Constructor VM.  The selections shown below are good defaults.<br><img src="media/bootFromImage.png"/>
8. Select the **HP Helion Development Platform Application Lifecycle Service Installer** option from the images list.  Note that this might be named slightly differently and might appear in the public images section.<br><img src="media/ALSinstaller.png"/>
9. Next create a keypair in the **Access & Security** section, if you don't already have one.  You can do so by clicking on the **+** (plus)  button.  If you already have one, you can ignore this step.<br><img src="media/keyPairsIgnore.png"/>
1. Create a keypair by following the instructions in the resulting dialog (pictured below).  If you are using a PC, you can use tools such as PuTTY to generate your keypair.  Follow the [instructions here](http://kb.siteground.com/how_to_generate_an_ssh_key_on_windows_using_putty/).  Once you've finished, click **Import Key Pair** and then select the **Launch** button.<br><img src="media/importKeyPair.png"/>
2. Now you can assign a floating IP address to the installer VM that you just created.  You can do that from the **More** button under **Actions**.  Choose any available IP address in the resulting dialog and make note of it for the next step. When you're done, click the **Associate** button.
3. SSH into the installer VM with the user **debian** and the SSH key you selected when you started the virtual machine. You can do that on a Mac/UNIX machine with the ssh command. In this example, you named your private key "cloud.key" and you chose an IP address of 15.126.234.185

		ssh -i cloud.key debian@15.126.234.185
1. Once you log in, you are prompted to activate the Helion ALS Installer. Execute the following command:

		/opt/helion/als/assembler/install.sh
1. Run the configuration script to create your cluster.conf configuration file using the efollowing command:

		python ./configure.py

1.  You'll be prompted for configuration information that will be used to build your developer trial.
	- **OpenStack&reg; Username** This is the username for your HP Public Cloud account.
	- **OpenStack Password** This is the password for your HP Public Cloud account.
	- **Tenant ID** If you have multiple values, select one.
	- **Availability Zone** Select **AZ1**.
	- **Network ID** If you have multiple values, select one.
	- **Image ID** If you have multiple values, select one.
	- **Cluster Title** Give your developer trial cluster a name.
	- **Cluster Prefix** Give your developer trial a prefix.
	- **Services** Enter a comma-separated list of services (e.g. mysql, redis, rabbit).
	- **First user's admin email** The login account for your new developer trial.
	- **First user's password** The password for your new developer trial.

1. Once the cluster.conf configuration file has been created, you can edit it or proceed to set up the cluster using the following command:

		python ./assemble.py
3. After the assemble script creates the cluster, it presents you with the ALS Console URL with which you can login to your browser.
4. If an error occurs or you want to terminate the cluster, run the following command. This deletes your VMs, releases the floating IP addresses and removes the cluster security groups: 

		python ./assemble.py -D 
This deletes your VMs, releases the floating IP addresses and removes the cluster security groups.
5. Once your install is complete, and if you do not want to use the automated tear-down capabilities of the Constructor, you can terminate the Constructor VM.

##After you install<a name="after"></a>

Once the installation completes, you can load the ALS Console at the URL provided at the end of the assemble.py script. After you log in to the Console, you can access the ALS User Documentation for instructions for creating users and deploying applications.
 
----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*


