---
layout: default-devplatform
title: "HP Helion OpenStack Development Platform Application Lifecycle Service Installation"
permalink: /helion/devplatform/community/install-als/
product: devplatform

---
<!--PUBLISHED-->

<p style="font-size: small;"> <a href="/helion/als/install/">&#9664; PREV</a> | <a href="/helion/als/install/">&#9650; UP</a> | <a href="/helion/als/install/">NEXT &#9654;</a> </p>

# HP Helion 1.0 Development Platform: Application Lifecycle Service (ALS) Installation and Configuration
This document explains the process to install and configure Helion Development Platform Application Lifecycle Service (ALS). Application Lifecycle Service Cluster creation is enabled by using an ALS Constructor, a Virtual Machine (VM) image pre-loaded with configuration and orchestration software.

After you start an ALS Constructor, connect to it through the SSH. You are prompted to perform the installation steps.  Once the ALS Constructor VM has finished creating your cluster, you can safely terminate it. The document covers the following sections:

* [Prerequisites](#prerequisites)
* [Before you begin](#before-you-begin)
* [Installing your cluster](#installing-your-cluster)
* [After you install](#after-you-install)

## Prerequisites {#prerequisites}

Before you start the installation and configuration process, ensure the following:

* A user account on a Helion OpenStack cloud where Helion OpenStack Development Platform is installed.  
* Determine if the Application Lifecycle Service is available by searching for ALS named images in the OpenStack Horizon Compute panel.
* Request more compute quota from your cloud administrator based on the size of ALS cluster you wish to deploy.
* Obtain the OpenStack Identity Auth URL located in the **User Roles and API Endpoints** panel in the Horizon dashboard. Also obtain the username and password that you would use to login to the OpenStack Horizon dashboard.


## Before you begin {#before-you-begin}

Before you start the cloud installation, do the following:

* Determine the size of ALS cluster you would like to deploy. ALS cluster is made up of:

	*  a core node
	*  one or more Droplet Execution Agent(DEA) nodes
	*  one or more service nodes.  
   
    In case the load balancers are also present, in addition to these nodes, multiple routers can be run to provide higher availability.

DEAs provide space for applications to run, so a small test environment may require 3 DEAs of a medium flavor, such as one with 4 gigabytes of RAM.  A larger environment will use more.  

* Provision one of the following service types on nodes other than the DEAs nodes: 

	* **mysql**
	* **filesystem**
	* **memcached**
	* **redis**
	* **postgresql** 
	* **rabbitmq**.  

    **Note**: For each service selected, an additional node is created.

* Configure a SSH keypair in OpenStack to connect to your cluster nodes after setting up the cluster. The new cluster that you create must have a DNS valid name (a-z, .'s and dashes only), an administrative email address and password and an initial administrative organization name. The password is used to login to your cluster.


## Installing your cluster {#installing-your-cluster}

To install a cluster, do the following:

1. Start a new VM using the ALS Constructor Image in your OpenStack cloud.  

2. Assign a floating IP address to the VM.

3. SSH into it with the user 'hlinux' and the SSH key you selected when you started the virtual machine.

4. Once you login, you are prompted to activate the Helion ALS Installer. Execute the following command.

    `/opt/helion/als/assembler/install.sh`

5. Run the configuration script to create your cluster.conf configuration file using the following command.

    `python ./configure.py`
    
6. Once the cluster.conf configuration file has been created, you can edit it or proceed with setting up the cluster using the following command.

    `python ./assemble.py`

7. After the assemble script creates the cluster, it presents you with the ALS Console URL with which you can login to your browser.

    If an error occurs or you want to terminate the cluster, run the following command:

    `python ./assemble.py -D`

This deletes your VMs, releases the floating IP addresses and removes the cluster security groups.

Once your install is complete, and you do not want to use the automated tear-down capabilities of the Constructor, you can terminate the Constructor VM.

## After you install {#after-you-install}

Once the installation completes, you can load the ALS Console at the URL provided at the end of the `assemble.py script`. After you log into the Console, you can access the ALS User Documentation for instructions to create users and deploy applications.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
