---
layout: default-devplatform
title: "HP Helion OpenStack Development Platform Community Installation"
permalink: /helion/devplatform/install/community/
product: devplatform

---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--
<p style="font-size: small;"> <a href="/helion/openstack/install/esx/">&#9664; PREV</a> | <a href="/helion/openstack/install-overview/">&#	9650; UP</a> | <a href="/helion/openstack/install/dnsaas/">NEXT &#9654;</a> </p>
-->

# HP Helion Development Community Installation and Configuration

The HP Helion Development Platform currently contains four products: Application Lifecycle Service (ALS), Marketplace Service, Messaging Service and Database Service.

The following topics explain how to install and configure the HP Helion Development Platform.

* [Prerequisites](#prerequisites)
* [Installing the HP Helion Development Platform](#installing-the-hp-helion-development-platform)
* [Install the Messaging Service](#messaging-install)
* [Install the Application Lifecycle Service](#als-install)
* [Install the Database Service](#database-install)
* [Install the Marketplace Service](#marketplace-install)
* [Troubleshooting](#troubleshooting)

## Prerequisites {#prerequisites}

The HP Helion Development Platform is installed in the overcloud of HP Helion OpenStack Community Edition.  The HP Helion Development Platform has the same prerequisites as HP Helion OpenStack Community Edition.

The system running the installer needs to have Python 2.7. Most modern operating systems include this as part of their base toolkit. This document is geared toward a Linux operating system but this does not preclude the installer from running on other operating systems with some minor modifications to the command-line statements herein.
 
The installer requires the following packages. If they are not found, it will prompt you to install them.

* python-dev 
* libffi-dev 
* libssl-dev 
* python-virtualenv
* python-pip

    
## Installing the HP Helion Development Platform {#installing-the-hp-helion-development-platform}

This section describes how to download and install the HP Helion Development Platform.

* [Downloading and unpacking the installation file](#download)
* [Preparing to run the installer](#prepare)

### Downloading and unpacking the installation file {#download}

The installation of the HP Helion Development Platform for the HP Helion OpenStack Community Edition is provided as a small compressed tar file.  The images for the actual services will be downloaded at the installers request.

You can register and download the package from the following URL:

[HP Helion Development Platform](https://helion.hpwsportal.com/#/Product/%7B%22productId%22%3A%221245%22%7D/Show)

To begin the installation, unpack the tar file:

	tar -zxvf hp_helion_devplatform_community.tar.gz.csu

This creates and populates a `dev-platform-installer` directory.

	cd dev-platform-installer

### Preparing to run the installer {#prepare}

If your network uses a proxy, it may be necessary to set the proxy shell variable.

	export https_proxy=<ip address or url of http proxy> 

Run this command to prepare the installer and ensure prerequisites are met. By default the Username is "admin", the Tenant Name is "admin" and the Region is "regionOne":

	./DevelopmentPlatform_Setup.sh -p {admin_user_password} -a {auth_host_ip_address}

Optionally, you can specify the Username, Tenant and Region
    
	./DevelopmentPlatform_Setup.sh -p {admin_user_password} -a {auth_host_ip_address} -u {username} -t {tenant_name} -r {region_name}

The install script also has a help feature

	./DevelopmentPlatform_Setup.sh -h

After the install command completes, you should see the following output from the command:

Once the installation is complete, you should see the following output:

	2014-06-17 16:53:19.765       INFO Install Complete

## Install the Messaging Service {#messaging-install}

This section provides details on installing the Messaging service from the Development Platform.

* [Connect to the Download Service](#marketplace-connect)
* [Download and Configure the Messaging Service](#messaging-download)

### Connect to the Download Service {#marketplace-connect}

1. Open Horizon and login as the "admin" user. Then click on the **Admin** panel in Horizon and select **Development Platform**. Finally, click **Configure Services**.

2. Click the **Connect** button on the **Configure Services** screen and enter your username and password for the HP Cloud OS Content Delivery Network. Click the **Sign-up** button if you do not have an account.

### Download and Configure the Messaging Service {#messaging-download}

1. Open Horizon and login as the "admin" user. Then click on the **Admin** panel in Horizon and select **Development Platform**. Finally, click **Configure Services**.

2. In the **Configure Services** panel locate the Messaging (Beta) item in the Configure Services table and select **Download Service** and wait for the download to complete.

2. Once the download is complete, click the **Configure Service** button to configure the Messaging Service and wait for the configuration step to complete.

3. Log out from the Horizon dashboard. Log back into the Horizon dashboard as a non-admin user and click on the **Messaging** panel under the current Project to begin using the Messaging Service.

## Install the Application Lifecycle Service (ALS) {#als-install}
This section provides details on installing the Application Lifecycle service from the Development Platform.

* [Prerequisites](als-pre)
* [Connect to the Download Service](#als-connect)
* [Download and Configure the Application Lifecycle Service](#als-download)

### Prerequisites {als-pre}

For Application Lifecycle Service to install dependencies for deployed applications, you must provide Application Lifecycle Service with outbound Internet connectivity. 

This process is documented in Step 7 of ["Starting the seed and building your cloud"](http://docs.hpcloud.com/helion/community/install/#startseed) in the baremetal installation instructions.  If an HTTP Proxy is required for Internet downloads, follow the instructions in the [Administration Guide](http://docs.hpcloud.com/als/v1/admin/server/configuration/#http-proxy).

### Connect to the Download Service {#als-connect}

1. Open Horizon and login as the "Admin" user. Then click on the **Admin** panel in Horizon and select **Development Platform**. Finally, click on **Configure Services**.

2. Click the **Connect** button on the **Configure Services** panel and enter your username and password for the HP Cloud OS Content Delivery Network. Select the Sign-up button if you do not have an account.

### Download and Configure the Application Lifecycle Service {#als-download}

1. In the **Configure Services** panel locate the Application Lifecycle Service item in the Configure Services table and select **Download Service** and wait for the download to complete.

2. Once the download is complete, click the **Configure Service** button to configure the Application Lifecycle Service and wait for the configuration step to complete.

3. Log out from the Horizon dashboard. Log back into the Horizon dashboard as a non-admin user and click on the **Application Lifecycle Service** panel under the current Project to being using Application Lifecycle Services.

## Install the Database Service {#databse-install}

This section provides details on installing the Database Service from the Development Platform.

* [Prerequisites](#database-pre)
* [Connect to the Download Service](#database-connect)
* [Download and Configure the Database Service](#database-connect)

### Prerequisites {#database-pre}

#### Service Network {#databse-service}

To configure the **Database Service** it needs an additional network for administrative purposes. This network is currently not used in Community Edition but nevertheless must exist in order for **Database Service** to properly install.

1. Open Horizon and login as the "Admin" user.

2. Click on **Project**

3. Click on **Network** and then the **Networks** tab

4. Click **Create Network**

5. In **Network Name** field, enter `SVC` for the name of the netowrk.

6. Click **Next**

7. In the **Network Address** field, enter a CIDR that does not conflict with other services (e.g. 172.10.0.0/24)

6. Click **Next**

7. Click **Create**

#### Quotas {#databse-quota}

The **Database Service** will be installed into the admin tenant of the Helion OpenStack overcloud and the admin tenant must have sufficient quota available and unused resources for the service to use. To check existing quota availability, log-in to Horizon as the **admin** user and open the **Overview** panel under the **Compute** tab.

For Community Edition, Database Service requires that you have the following quota available:

	
	|Resource           | Usage |
	|-------------------|------:|
	|Floating IPs       |      6|
	|Instances	        |      6|
	|Networks           |      2|
	|RAM (GB)           |     24|
	|Routers            |      2|
	|Security Groups    |      6|
	|Volumes            |      4|
	|Volume Storage (GB)| 160|
	
In addition to the quota mentioned above, for every database instance that is created by a user, the necessary resources to create that instance will be deducted from the admin tenant quota. The users database service quota will also be affected.

### Connect to the Download Service {#database-connect}

1. Open Horizon and login as the "Admin" user. Then click on the admin panel in Horizon and select the **Development Platform** panel under Admin. Then click on the **Configure Services** sub-panel.

2. Click the **Connect** button on the **Configure Services** panel and enter your username and password for the HP Cloud OS Content Delivery Network. Select the Sign-up button if you do not have an account.

### Download and Configure the Database Service {#database-connect}

In the **Configure Services** panel locate the Database Service item in the Configure Services table and select **Download Service** and wait for the download to complete.

#### Configuring the Database Service {#database-configure}

1. Once the download is complete, click the **Configure Service** button to begin configuration of the service. In the configuration dialog, specify the following configuration options:

	**Key Pair (Required)** - Key Pair to install on all instances created as part of the Database Service. The public key can be used by an admin to get SSH access to all instances.

	**External Network (Required)** - Network Name for the network that has external network access. For HP Helion OpenStack Community edition this network is named 'ext-net'

	**NTP Server IP** - IP Address to an NTP server to use if instances will not have outbound access to the internet. 

	**Service User Password (Required)** - The password for the Admin user that is currently logged in. This password **MUST** match the password used to login to Horizon.

	**Icinga User Password (Required)** - While Icinga is not available in HP Helion Development Platform Community Edition, this value is still required. Any value can be used.

	**Volume Type (Required)** - The volume type to use when creating database instances.

	**Service Network (Required)** - Select the 'SVC' network (see **Prerequisites** Section)
	
	**RabbitMQ IP Address (Required)** - Use '127.0.0.1' for this parameter.

2. After all configuration options have been provided, select the **Configure** button to complete the configuration step. Wait for the configuration step to complete and the status to change to **Configured**.

3. Attach a Floating IP to API Service
	1. Click on **Compute**
	2. Click on **Instances**
	3. Click on **More/Associate Floating IP** for the `trove-trove0_api...` Instance
		a. Select an available IP or allocate a new one from the `ext-net` Network
		b. Select the port for `trove-trove0_api...` on the `trove_mgmt_network`
		c. Click **Associate**
	
4. Recreate the Service Endpoint for Database Service. This step is best performed from the command line on the controller management node or the based node.  You will need the admin credentials and network connectivity to the overcloud.
	
5. Delete the old service endpoint and create with Floating IP address from above

		floating_ip=replace_with_floating_ip_allocated_above; service_id=`keystone service-get database | grep id | awk '{print $4}'`; endpoint_id=`keystone endpoint-list | grep $service_id | awk '{print $2}'`;keystone endpoint-delete $endpoint_id; keystone endpoint-create --service-id $service_id --region regionOne --publicurl "http://$floating_ip:8779/v1.0/\$(tenant_id)s" --adminurl "http://$floating_ip:8779/v1.0/\$(tenant_id)s" --internalurl "http://$floating_ip:8779/v1.0/\$(tenant_id)s"

6. Log out from the Horizon dashboard. Log back into the Horizon dashboard as a non-admin user and click on the **Database** panel under the current Project to being using Database Service.

## Install the Marketplace Service {#marketplace-install}
This section provides details on installing the Marketplace service from the Development Platform.

* [Prerequisites](#marketplace-install)
* [Connect to the Download Service](#marketplace-download-c)
* [Configuring the Marketplace Service](#marketplace-config)

### Prerequisites {#marketplace-install}

The **Marketplace Service** will be installed into the admin tenant of the Helion OpenStack overcloud and the admin tenant must have sufficient quota available and unused for the resources the service uses. To check existing quota availability, log-in to Horizon as the **admin** user and open the **Overview** panel under the **Compute** tab.

|Resource       | Usage      | 
|---------------|-----------:|
|Floating IPs   |          16|
|Instances      |           4|         
|Networks       |           1|
|RAM (GB)       |           8|
|Routers        |           2|
|Security Groups|           4|

### Connect to the Download Service {#marketplace-download-c}

1. Open Horizon and login as the "admin" user. Then click on the admin panel in Horizon and select the **Development Platform** Panel under Admin. Then click on the **Configure Services** sub-panel.

2. Click the **Connect** button on the **Configure Services** panel and enter your username and password for the HP Cloud OS Content Delivery Network. Select the Sign-up button if you do not have an account.

### Download and Configure the Marketplace Service {#marketplace-download}

In the **Configure Services** panel locate the Marketplace item in the Configure Services table and select **Download Service** and wait for the download to complete.

#### Configuring the Marketplace Service {#marketplace-config}

1. Once the download is complete, click the **Configure Service** button to begin configuration of the service. In the configuration dialog, specify the following configuration options:

	**Key Pair (Required)** - Key Pair to install on all instances created as part of the marketplace service. The public key can be used by an admin to get SSH access to all instances.

	**External Network (Required)** - Network Name for the network that has external network access. For HP Helion OpenStack Community Edition this network is named 'ext-net'

	**NTP Server IP** - IP Address to an NTP server to use if instances will not have outbound access to the internet. 

	**Service User Password (Required)** - The password for the Admin user that is currently logged in. This password **MUST** match the password used to login to Horizon.

	**Subnet Range** - The subnet to use for Marketplace
	
## Troubleshooting {#troubleshooting}

Refer to the following topics if you experience problems with the installation.


### Service is stuck in download {#troubleshooting-service}

There are several situations in which a download will not complete.  One cause which is documented, is because the `tmp` directory ran out of space. There is a prerequisite to mount the `tmp` directory to a larger partition.  If you have completed this and it is still failing to download then we will need to reset the download. In the current release, this requires a manual process.

As the "admin" user, in the "admin" tenant, click on **Project**, then **Object Store**. Open the "sherpa-cache" folder and delete the wscatalog.<id> folder which contains the cached download. The service should now be available to download again.



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
