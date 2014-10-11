---
layout: default-devplatform
title: "Using the Messaging Service"
permalink: /helion/devplatform/install/
product: devplatform

---
<!--UNDER REVISION-->

#HP Helion Development Platform Installation and Configuration

The HP Helion Development Platform installs four additional services:

- Messaging Service
- Application Lifecycle Service (ALS)
- Database Service
- Marketplace Service

The following topics explain how to install and configure each section of the HP Helion Development Platform:

- [Prerequisites](#prereq)
- [Installing the HP Helion Development Platform](#install)
- [Installing the Messaging Service](#message)
- [Installing the Application Lifecycle Service (ALS)](#als)
- [Installing the Database Service](#database)
- [Installing the Marketplace Service](#marketplace) 

##Prerequisites<a name="prereq"></a>
The HP Helion Development Platform  has the same prerequisites as HP Helion OpenStack&reg;. 

The system running the Installer must have Python 2.7.

Most modern operating systems include Python as part of their base toolkit. The information presented here is geared toward a Linux operating system; however, the Installer will also run on other operating systems with some minor modifications to the command-line statements (provided).

The Installer requires the following packages:

- python-dev
- libffi-dev
- libssl-dev
- python-virtualenv
- python-pip

If the packages are not found, the Installer prompts you to install them.

##Installing the HP Helion Development Platform<a name="install"></a>
This section provides instructions to:

- [Download and unpack the installation file](#unpack)
- [Prepare to run the Installer](#prepare)
- Edit the Development Platform configuration
- Activate the Installer
- Run the Installer

###Downloading and Unpacking the Installation file<a name="unpack"></a>
The installation of the HP Helion Development Platform for the HP Helion OpenStack is provided as a small compressed *tar* file. The images for the actual services are downloaded at the Installer's request.

You can register and download the package from the following URL:
HP Helion Development Platform

To begin the installation:

1.	Unpack the tar file:

    	# tar -zxvf hp_helion_devplatform_commercial.tar.gz.csu

3.	Verify the creation (and population) of a dev-platform-installer directory.

    	# cd dev-platform-installer

###Preparing to Run the Installer<a name="prepare"></a>
1.	To prepare the Installer and to ensure that prerequisites are met, use this command:

    	# ./install_installer.sh -p {admin_user_password} -a {auth_host_ip_address}

3.	Optionally, you can specify the Username, Tenant, and Region.
The defaults to use for this option are:
	- **Username** = admin
	- **Tenant** **name** = admin
	- **Region** = regionOne 

    		#./install_installer.sh -p {admin_user_password} -a {auth_host_ip_address} -u {username} -t {tenant_name} -r {region name}

1.	Use the Help feature if you need additional information about the installation script:
	
		 #./install_installer.sh -h
    
2.	After the install command completes, verify the following output:

		2014-06-17 16:53:19.765 INFO Install Complete

##Installing the Messaging Service<a name="message"></a>
This section provides the steps to install the Messaging Service from the Development Platform.

###Connecting to the Download Service

To connect to the Download Service:


1. Open the Horizon console and log in as an Admin user.
2.	Click the **Admin** tab and then click the **Development Platform** tab.
4.	Click the **Configure Services** sub-tab and then click **Connect**.
6.	Click **Sign-up** and complete the sign-up process if you do not yet have an account.
7.	Enter your username and password for the HP Cloud OS Content Delivery Network.
###Downloading and Configuring the Messaging Service
To download and configure the Messaging Service:


1. In the **Configure Services** tab, go to the **Configure Services** table and locate the** Messaging Service**.
2.	Select **Download Service** and wait for the download to complete.
3.	Once the download is complete, click **Configure Service**.
4.	Wait for the configuration step to complete.
5.	Log out from the Horizon console.
6.	Log back into the Horizon console as a non-admin user.
7.	Under the current project, click the **Messaging** tab to begin using the Messaging Service.

##Installing the Application Lifecycle Service (ALS)<a name="als"></a>
This section provides the steps to install the Application Lifecycle Service from the Development Platform.

###Connecting to the Download Service
To connect to the Download Service:


1. Open the Horizon console and log in as an Admin user.
2.	Click the **Admin** tab and then click the **Development Platform** tab.
4.	Click the **Configure Services** sub-tab and then click **Connect**.
6.	Click **Sign-up** and complete the sign-up process if you do not yet have an account.
7.	Enter your username and password for the HP Cloud OS Content Delivery Network.
###Downloading and Configuring the Application Lifecycle Service
To download and configure the Application Lifecycle Service:


1. In the **Configure Services** tab, go to the **Configure Services** table and locate the **Application Lifecycle Service**.
2.	Select **Download Service **and wait for the download to complete.
3.	Once the download is complete, click **Configure Service**.
4.	Wait for the configuration step to complete.
5.	Log out from the Horizon console.
6.	Log back into the Horizon console as a non-admin user.
7.	Under the current project, click the Application Lifecycle Service tab to begin using the Application Lifecycle Service.
##Installing the Database Service<a name="database"></a>
This section provides the steps to install the Application Lifecycle Service from the Development Platform.
###Prerequisites
There are two prerequisites to install the Database Service: 


- Availability Zones
- Quotas

##Creating Availability Zones

To configure the Database Service in a highly available manner, you must create Availability Zones for the compute hosts in the service.

The following steps describe how to create three Availability Zones and then assign a compute host to the zone:



1. Connect to an overcloud controller node and execute the following commands to create three Availability Zones named: AZ-1, AZ-2, and AZ-3 

		nova aggregate-create aggregate-AZ-1 AZ-1 
		nova aggregate-create aggregate-AZ-2 AZ-2 
		nova aggregate-create aggregate-AZ-3 AZ-3
	 
1.	Validate that the Availability Zones were correctly created by issuing the following command to list them:
	
		nova aggregate-list

2.	Add a compute host to your newly created Availability Zone by issuing the following command:
	
		nova aggregate-add-host <id> <hostname>
	**NOTE**: Perform this step for each compute host that you want to associate with an Availability Zone.
1.	Verify the Availability Zones by issuing the following command to list all zones and the compute hosts associated with them:

    	nova availability-zone-list

###Quotas
The Database Service is installed in the Admin Tenant of the HP Helion OpenStack installation. 

The Admin Tenant must have sufficient quota available and unused for the resources that the Database Service uses.
To check the existing quota availability:


1. Log on to Horizon as the Admin.
2.	Click the **Compute** tab and then open the **Overview** panel.
3.	If you are not configuring the Database Service to be highly available, you must have the following quotas available:
	- Instances: 6
	- RAM: 24GB
	- Floating IPs: 6
	- Volumes: 4
	- Volume Storage: 160GB

4. If you have set up Availability Zones and plan to install the Database Service in a highly available configuration, you must have the following quotas available:
	- Instances: 16 
	- RAM 64GB 
	- Floating IPs: 16 
	- Volumes: 4 
	- Volume Storage: 160GB

###Connecting to the Download Service
To connect to the Download Service:


1. Open the Horizon console and log in as an Admin user.
2.	Click the **Admin** tab and then click the **Development Platform** tab.
4.	Click the **Configure Services** sub-tab and then click **Connect**.
6.	Click **Sign-up** and complete the sign-up process if you do not yet have an account.
7.	Enter your username and password for the HP Cloud OS Content Delivery Network.
###Downloading and Configuring the Database Service
To download the Database Service:


1. In the **Configure Services** tab, go to the **Configure Services** table and locate the Database Service.
2. Click **Download Service** and wait for the download to complete.
3. Once the download is complete, click **Configure Service**.
2.	In the Configuration dialog, specify the following configuration options:
	- **Key Pair** (Required) -The Key Pair to install on all instances created as part of the Database Service. An Admin can use the public key to get SSH access to all instances.
	- **External Network** (Required) -The Network Name for the network that has external network access. For HP Helion OpenStack Commercial Edition, this network is named ext-net.
	- **NTP Server IP **-The IP Address to an NTP server to use if instances will not have outbound access to the Internet.
	- **Service User Password **(Required) -The password for the Admin user that is currently logged in. This password MUST match the password used to log in to Horizon.
	- **Pool User Password** (Required) -Specify a password for the pool user that is created as part of the installation. Keep this password for future use.
	- **Icinga User Password** (Required) -Specify a password for the Icinga Service that is created as part of the installation. Keep this password for future use.
	- **Volume Type** (Required) -The volume type to use when creating database instances.
	- **Enable HA** -Specify if the Database Service is to be setup in an HA configuration. If selected, each component of the service will have three instances created, and will be active at all times.
	- **RabbitMQ IP Address** (Required) -Specify the IP address of the central Helion OpenStack Logstash Server.
3.	After you provide the information for all of the configuration options, click **Configure**. Wait for the configuration status to change to **Configured**.

##Configuring the Load Balancer for the Database Service<a name=""></a>
The steps in this section configure the Load Balancer to take advantage of the highly available Database Service.

Perform these steps **only** if you have configured the Availability Zones and configured the Database Service with the *Enable HA* option.

You must be connected to the undercloud node to perform the following steps:

1. Identify the API server IPs on the SVC network by running this command:
 
		$ nova list | awk '/trove[0-9]*_api/{print $12 }' | cut -d "=" -f 2

	You should have as many API servers (and IPs) as you have Available Zones in your HP Helion OpenStack installation.
1.	Identify the Virtual IP that the controller nodes use to load balance the Helion OpenStack services by running this command:

		$ keystone endpoint-list | awk '/8779/{print $6}' | egrep -0 "[0-9]+.[0-9]+.[0-9]+.[0-9]+."

2.	Update the configuration on each of the Helion OpenStack controller nodes by connecting to the controller and performing these steps:

	A.	Edit the */etc/haproxy/manual/paas.cfg* file. <br>Add the following lines, repeating the last line once for each API server you identified in Step 1:

    		listen trove_api
    		bind <Virtual IP from step 2>:8779
    		server trove-trove<n>_api <API server ns IP Address> check
    		inter 2000 rise 2 fall 5

	B. Edit the */etc/iptables/iptables* file.<br>Add to the end of it:
	
			-I INPUT -p -tcp --dport 8779 -j ACCEPT

  	C. Run the following command as *root*:
  		
			$ iptables -I INPUT -p tcp --dport 8779 -j ACCEPT

1.	Log out from the Horizon panel.
2.	Log back into the Horizon panel as a non-admin user.
3.	Under the current project, click the Database tab to begin using the Database Service.

##Installing the Marketplace Service<a name="marketplace"></a>
This section provides the steps to install the Marketplace Service from the Development Platform.

###Quotas
The Messaging Service is installed in the Admin Tenant of the HP Helion OpenStack installation. The Admin Tenant must have sufficient quota available and unused for the resources that the Messaging Service uses.

To check the existing quota availability:

1. Log on to Horizon as Admin.
2.	Click the **Compute** tab and then open the **Overview** panel.
3.	Ensure that the Admin Tenant has enough quota available to create four small instances.
###Connecting to the Download Service

To connect to the Download Service:


1. Open the Horizon console and log in as an Admin user.
2.	Click the **Admin** tab and then click the **Development Platform** tab.
4.	Click the **Configure Services** sub-tab and then click **Connect**.
6.	Click **Sign-up** and complete the sign-up process if you do not yet have an account.
7.	Enter your username and password for the HP Cloud OS Content Delivery Network.
###Downloading and Configuring the Marketplace Service
To download the Marketplace Service:


1. In the **Configure Services** tab, go to the **Configure Services** table and locate the Application Lifecycle Service For HP Helion OpenStack.
2.	Click **Download Service** and wait for the download to complete.
3. Once the download is complete, click **Configure Service**.
2.	In the configuration dialog, specify the following configuration options:
	- **Key Pair** (Required) -- The Key Pair to install on all instances created as part of the Marketplace Service. An Admin can use the public key to get SSH access to all instances.
	- **External Network** (Required) -- The Network Name for the network that has external network access. For HP Helion OpenStack Commercial Edition, this network is named ext-net.
	- **NTP Server IP** -- The IP Address to an NTP server to use if instances will not have outbound access to the Internet.
	- **Service User Password** (Required) -- The password for the Admin user that is currently logged in. This password MUST match the password used to log in to Horizon.
	- **Subnet Range** -- The subnet to use for the Marketplace Service.

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

