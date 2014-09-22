---
layout: default-devplatform
title: "HP Helion OpenStack Development Platform Installation"
permalink: /helion/devplatform/community/install-dev-platform/
product: devplatform

---
<!--UNDER REVISION-->
 
<p style="font-size: small;"> <a href="/helion/devplatform/community/release-notes/">&#9664; PREV</a> | <a href="/helion/devplatform/">&#9650; UP</a> | <a href="/helion/devplatform/community/related-topics/">NEXT &#9654;</a> </p>

# HP Helion Development Platform Community Installation and Configuration

The HP Helion Development Platform installs four products: 


- Messaging Service
- Application Lifecycle Service (ALS) 
- Database Service
- Marketplace Service  


The following topics explain how to install and configure the HP Helion Development Platform.

* [Prerequisites](#prerequisites)

* [Installing the HP Helion Development Platform](#installing-the-hp-helion-development-platform)

* [Installing the Messaging Service](#installing-the-messaging-service)

* [Installing the Application Lifecycle Service (ALS)](#installing-the-application-lifecycle-service-(ALS))

* [Installing the Database Service](#installing-the-database-service)

* [Installing the Marketplace Service](#installing-the-marketplace-service)

## Prerequisites<a name="prerequisites"></a>

The HP Helion Development Platform is installed in the [overcloud](/helion/community/install-virtual/#overcloud/) of HP Helion OpenStack Community Edition - Baremetal, and has the same prerequisites (as the Community Edition - Baremetal).

The system running the Installer must have Python 2.7. 

Most modern operating systems include Python as part of their base toolkit. The information presented here is geared toward a Linux operating system. However, it does not prevent the Installer from running on other operating systems with some minor modifications to the command-line statements (found in these sections).
 
The Installer requires the following packages: 

* python-dev 
* libffi-dev 
* libssl-dev 

If the packages are not found, the Installer prompts you to install them.

To enable ALS to install dependencies for deployed applications, you must provide it with outbound Internet connectivity. For more information, see the baremetal installation instructions, [Starting the seed and building your cloud](/helion/community/install/#startseed/), Step 7.

If an [HTTP Proxy](als/v1/admin/server/configuration/#http-proxy) is required for Internet downloads, follow the instructions in the Administration Guide.
    
## Installing the HP Helion Development Platform<a name="installing-the-hp-helion-development-platform"></a>

This section provides the details to:

- Download and unpack the installation file
- Prepare and run the Installer
- Edit the Development Platform configuration
- Activate the Installer
- Run the Installer

### Downloading and Unpacking the Installation file

The installation of the HP Helion Development Platform for the HP Helion OpenStack Community is provided as a single compressed tar file.  The images for the actual services are downloaded at the Installer's request.

You can register and download the package from the following URL:

[HP Helion Development Platform](https://helion.hpwsportal.com/#/Product/%7B%22productId%22%3A%221245%22%7D/Show)


To begin the installation:

1.  Unpack the tar file:

    # tar -zxvf hp_helion_devplatform_community.tar.gz.csu
    

1. Verify the creation (and population) of a `dev-platform-tools` directory.

    # cd dev-platform-tools
    
### Preparing to Run the Installer


1. To prepare the Installer and to ensure that prerequisites are met, use this command:

    # ./install_installer.sh
    


1. After this command completes, verify the output:

    *****************************************************************************************************
    Configure Development Platform Installer at ./etc/dev-platform-installer.conf  
    run `source .env/bin/activate`
    and then run `devplatform-installer [install]
    *****************************************************************************************************

### Editing the Development Platform Configuration

The installation has options that you can configure in the [DEFAULT] section by editing the dev-platform-installer.conf file. 

To edit the file, use this command:

    # vi etc/dev-platform-installer.conf
    
#### Default Section \[DEFAULT\]

In this section, you must provide the credentials for an Admin user and the Keystone endpoint for the overcloud. This information is necessary so that the Installer can create the service endpoint in Keystone. 

|  Configuration    | Description                                           |Default Value  |
|:------------------|:------------------------------------------------------|:--------------|
|auth_url           |Keystone Auth URL (http://<host_ip>:/5000/v2)          |None           |
|target_region_name |Region name given to endpoints in service catalog      |None           |
|target_username    |Username that will create resources, has admin role    |None           |
|target_password    |Password associated with username                      |None           |
|target_tenant_name |Tenant name for which user belongs                     |None           |


### Activating the Installer

Activate the script and the environment to run the Installer using this command:

    # source .env/bin/activate
    
### Running the Installer

To run the installer: 

1. Install the Development Platform using this command:

    # devplatform-installer -install


1. Once the installation is complete, verify the following output:

    2014-06-17 16:53:19.765       INFO Install Complete

## Installing the Messaging Service<a name="installing-the-messaging-service"></a>

This section provides the steps to install the Messaging Service from the Development Platform.

### Connecting to the Download Service

To connect to the Download Service:

1.  Open Horizon and log in as the Admin user. 

2.  In Horizon, click the Admin tab. 

3.  Under Admin, click the **Development Platform** tab. 

4.  Click the **Configure Services** sub-tab.

2. In the Configure Services window, click the **Connect** button.
3. Enter your username and password for the HP Cloud OS Content Delivery Network.

4.  Click the **Sign-up** button *if* you do not have an account.

### Downloading and Configuring the Messaging Service

To download and configure the Messaging Service:

1. In the Configure Services tab, go to the Configure Services table and locate the Messaging (Beta) Service.

2. Select **Download Service** and wait for the download to complete.

2. Once the download is complete, click the **Configure Service** button to configure the Messaging Service.

3. Wait for the configuration step to complete.

3. Log out from the Horizon tab. 

4. Log back into the Horizon tab as a non-admin user.

5. Under the current project, click the **Messaging (Beta)** tab to begin using the Messaging Service.

## Installing the Application Lifecycle Service (ALS)<a name="installing-the-application-lifecycle-service-(als)"></a>
This section provides the steps to install the Application Lifecycle Service from the Development Platform.

### Connecting to the Download Service

To connect to the Download Service:

1. Open Horizon and log in as the Admin user. 

2. In Horizon, click the Admin tab.

3. Under Admin, select the **Development Platform** tab.
 
4. Click the **Configure Services** sub-tab.

5. In the Configure Services window, click the **Connect** button.

3. Enter your username and password for the HP Cloud OS Content Delivery Network.

4.  Click the **Sign-up** button *if* you do not have an account.

### Downloading and Configuring the Application Lifecycle Service

To download and configure the Application Lifecycle Service:

1. In the Configure Services tab, go to the Configure Services table and locate the Application Lifecycle Service.

2. Select **Download Service** and wait for the download to complete.

2. Once the download is complete, click the **Configure Service** button to configure the Application Lifecycle Service.

3. Wait for the configuration step to complete.

3. Log out from the Horizon tab. 

4. Log back into the Horizon tab as a non-admin user.

5. Under the current project, click the **Application Lifecycle Service** tab to begin using the Application Lifecycle Service.

## Installing the Database Service<a name="installing-the-database-service"></a>
This section provides the steps to install the Application Lifecycle Service from the Development Platform.

### Connecting to the Download Service

To connect to the Download Service:

1. Open Horizon and log in as the Admin user. 

2. In Horizon, click the Admin tab.

3. Under Admin, click the **Development Platform** tab. 

4. Click the **Configure Services** sub-tab.

5. In the Configure Services window, click the **Connect** button.

3. Enter your username and password for the HP Cloud OS Content Delivery Network.

4.  Click the **Sign-up** button *if* you do not have an account.


### Downloading and Configuring the Database Service

To download the Database Service:

1. In the Configure Services tab, go to the Configure Services table and locate the Database Service.

2. Click **Download Service** and wait for the download to complete.

#### Configuring the Database Service

To configure the Database Service:

1. Once the download is complete, click the **Configure Service** button to begin configuration of the service.
 
2. In the Configuration dialog, specify the following configuration options:

	**Key Pair (Required)** -- The Key Pair to install on all instances created as part of the Database Service. An Admin can use the public key to get SSH access to all instances.

	**External Network (Required)** -- The Network Name for the network that has external network access. For HP Helion OpenStack Commercial Edition, this network is named **ext-net**.

	**NTP Server IP** -- The IP Address to an NTP server to use if instances will not have outbound access to the Internet. 

	**Service User Password (Required)** -- The password for the Admin user that is currently logged in. This password **MUST** match the password used to log in to Horizon.

	**Pool User Password (Required)** -- Specify a password for the pool user that is created as part of the installation. Keep this password for future use.

	**Icinga User Password (Required)** -- Specify a password for the Icinga Service that is created as part of the installation. Keep this password for future use.

	**Volume Type (Required)** -- The volume type to use when creating database instances.

	**Enable HA** -- Specify if the Database Service is to be setup in an HA configuration. If selected, each component of the service will have three instances created, and will be active at all times.

	**API Certificate (Required)** -- Specify the certificate that the Database Service API will use to encrypt access to the API.

	**API Key (Required)** -- Specify the API Key that the Database Service API will use to encrypt access to the API.

	**RabbitMQ Certificate (Required)** -- Specify the certificate that the RabbitMQ Service API will use to encrypt access to the API.

	**RabbitMQ Key (Required)** -- Specify the RabbitMQ Key that the Database Service API will use to encrypt access to the API.

2. After you provide the information for all of the configuration options, click the **Configure** button to complete the configuration step. 

3. Wait for the configuration step to complete by seeing the status change to **Configured**.

3. Log out from the Horizon tab. 

4. Log back into the Horizon tab as a non-admin user.

5. Under the current project, click the **Database** tab to begin using the Database Service.

## Installing the Marketplace Service<a name="install-marketplace"></a>
This section provides the steps to install the Marketplace Service from the Development Platform.

### Connecting to the Download Service

To connect to the Download Service:

1. Open Horizon and log in as the Admin user. 

2. In Horizon, click the Admin tab.

3. Under Admin, select the **Development Platform** tab.
 
4. Click the **Configure Services** sub-tab.

5. In the Configure Services window, click the **Connect** button.

3. Enter your username and password for the HP Cloud OS Content Delivery Network.

4.  Click the **Sign-up** button *if* you do not have an account.


### Downloading and Configuring the Marketplace Service

To download the Marketplace Service:

1. In the Configure Services tab, go to the Configure Services table and locate the Application Lifecycle Service For HP Helion OpenStack.

2. Click **Download Service** and wait for the download to complete.

#### Configuring the Marketplace Service

To configure the Marketplace Service:

1. Once the download is complete, click the **Configure Service** button to begin configuration of the Marketplace Service. 

2. In the configuration dialog, specify the following configuration options:

	**Key Pair (Required)** -- The Key Pair to install on all instances created as part of the Marketplace Service. An Admin can use the public key to get SSH access to all instances.

	**External Network (Required)** -- The Network Name for the network that has external network access. For HP Helion OpenStack Commercial Edition, this network is named **ext-net**.

	**NTP Server IP** -- The IP Address to an NTP server to use if instances will not have outbound access to the Internet. 

	**Service User Password (Required)** -- The password for the Admin user that is currently logged in. This password **MUST** match the password used to log in to Horizon.
   
