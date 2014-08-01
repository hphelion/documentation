---
layout: default-devplatform
title: "HP Helion OpenStack Development Platform Installation"
permalink: /helion/devplatform/community/install-dev-platform/
product: devplatform

---
<!--PUBLISHED-->
 
<p style="font-size: small;"> <a href="/helion/devplatform/community/release-notes/">&#9664; PREV</a> | <a href="/helion/devplatform/">&#9650; UP</a> | <a href="/helion/devplatform/community/related-topics/">NEXT &#9654;</a> </p>

# HP Helion Development Platform Community Installation and Configuration

The HP Helion Development Platform currently installs two products: Application Lifecycle Service (ALS) and Database Service.  

Installing the Application Lifecycle Service registers two images in Glance.  The first image is the 'Installer'. Users wanting to deploy an Application Lifecycle Cluster for their tenant will need to boot an instance of this image using Nova. The second image is the 'Seed'. This contains the control plane for the Application Lifecycle Cluster. The `Installer` boots instances of the `Seed` images as directed by the user during the [Application Lifecycle Service installation process](http://docs.hpcloud.com/helion/devplatform/community/install-als/).

Installing the Database Service will create five virtual machines in the overcloud.  These virtual machines compose the Database Service control plane. The installer also creates two tenant/user pairs: the `trove` tenant creates and owns all resources of the control plane; the `trove-pool` tenant/user will own and manage all compute hosts containing the guest database instances. Finally, the installer registers the Database Service in Keystone. From there, users of HP Helion OpenStack Community Edition can now provision their own guest database instances through the OpenStack Dashboard (Horizon) or the [Trove Python Client](https://community.hpcloud.com/article/python-troveclient-cli-linux-installation).  

The following topics explain how to install and configure the HP Helion Development Platform.

* [Prerequisites](#prerequisites)

* [Before you begin](#before-you-begin)

* [Installing the HP Helion Development Platform](#installing-the-hp-helion-development-platform)

* [After you install](#after-you-install)

* [Advanced Configuration](#advanced-configuration)

* [Uninstalling the HP Helion Development Platform](#uninstalling-the-hp-helion-development-platform)


## Prerequisites<a name="prerequisites"></a>

The HP Helion Development Platform is installed in the overcloud of HP Helion OpenStack Community Edition - Baremetal.  The HP Helion Development Platform has the same prerequisites as HP Helion OpenStack Community Edition - Baremetal.

The system running the installer needs to have Python 2.7. Most modern operating systems include this as part of their base toolkit. This document is geared toward a Linux operating system but this does not preclude the installer from running on other operating systems with some minor modifications to the command-line statements herein.
 
The installer requires the following packages. If they are not found, it will prompt you to install them.

* python-dev 
* libffi-dev 
* libssl-dev 

For ALS to install dependencies for deployed applications, you must provide ALS with outbound Internet connectivity. This process is documented in Step 7 of ["Starting the seed and building your cloud"](http://docs.hpcloud.com/helion/community/install/#startseed) in the baremetal installation instructions.  If an HTTP Proxy is required for Internet downloads, follow the instructions in the [Administration Guide](http://docs.hpcloud.com/als/v1/admin/server/configuration/#http-proxy).

## Before you begin<a name="before-you-begin"></a>

Before you install the HP Helion Development Platform ensure that you perform the following checks:

### Credentials and connectivity

The purpose of this section is to ensure that you have credentials for an admin user in the overcloud and that you have network connectivity to it.

To test that you have the necessary access, perform the following steps:

1. Ensure `python-novaclient` exists. The following should output a version number:
	
		# nova --version

2. If the command cannot be found, install it using:
	
		# sudo apt-get install -y python-novaclient
		
3. Create a stackrc file:
 
    	# vi stackrc
    	
    Add the following content:
    
    	export OS_USERNAME={your_admin_user}
    	export OS_TENANT_NAME={your_admin_tenant}
    	export OS_PASSWORD={your_admin_password}
    	export OS_AUTH_URL={auth_url_endpoint}
    	   
4. Export variables to your local environment:
    
        # source stackrc

5. Check connectivity and admin role:
    
        # nova credentials

6. Validate that you see the following in the output: 
    
        roles            | [{u'name': u'admin'} ...
    
At this point, you have confirmed that you can connect to an overcloud endpoint, your credentials are valid and you have the 'admin' role.

### SSH Keys (optional)<a name="ssh-keys"></a>

The Database Service control plane consists of five virtual machines.  If issues arise, it is likely that you will want to gain access to them via SSH in order to do troubleshooting. To make this possible, you will need an SSH public/private key-pair.  There are two approaches for obtaining these: 

1. allow the installer to create a public/private key-pair (automatic) 
2. provide the installer with the path and file name of your public key

If you choose option #1, you can skip to [Installing the HP Helion Development Platform](#installing-the-hp-helion-development-platform) and ignore the `ssh_public_key` configuration. Otherwise, follow the steps below.

#### Creating your own public/private key<a name="generate-ssh-keys"></a>

To generate the key pair, perform the following steps:

1.  First, ensure that you do not already have ssh keys. The following command should not return the files `id_rsa` nor `id_rsa.pub`. If it does and these are the keys you want to use, skip to step #5. Alternatively, you can produce a new pair in an alternate location but that is outside the scope of this document.

		# ls -l ~/.ssh
		
2.  Generate the public and private key, omitting a passphrase and accepting the defaults by pressing Enter:

        # ssh-keygen -t rsa
    
3. Validate that the key exists:

        # ls -l ~/.ssh
    
4. You should see the following two files shown in the output on the command line:
    
        -rw-------   1 username  group   1766 Nov  8  2012 id_rsa
        -rw-r--r--   1 username  group    409 Nov  8  2012 id_rsa.pub
    
5. Later, in the installation you will specify the public key configuration in this manner:

    ssh_public_key=/home/username/.ssh/id_rsa.pub

    
## Installing the HP Helion Development Platform<a name="installing-the-hp-helion-development-platform"></a>

### Downloading and unpacking the installation file

The installation of the HP Helion Development Platform for the HP Helion OpenStack Community is provided as a single compressed tar file.  This is a large file because it contains all of the machine images required for the Database Service and Application Lifecycle Service.

You can register and download the package from the following URL:

[HP Helion Development Platform](https://helion.hpwsportal.com/#/Product/%7B%22productId%22%3A%221245%22%7D/Show)

**Note**: This install file is over 4GB and does not fit on a memory stick formatted as FAT32. If you are planning to store the installation files on removable media use a formatting that supports large files, like NTFS.

To begin the installation, unpack the tar file:

    # tar -zxvf hp_helion_devplatform_community.tar.gz.csu
    
This creates and populates a `dev-platform-tools` directory.

    # cd dev-platform-tools
    
### Preparing to run the installer

Run this command to prepare the installer and ensure prerequisites are met:

    # ./install_installer.sh
    
After this command completes, you should see the following output from the command:

    *****************************************************************************************************
    Configure Development Platform Installer at ./etc/dbaas-installer.conf and ./etc/als-installer.conf
    run `source .env/bin/activate`
    and then run `devplatform-installer --config-dir ./etc [install|install-dbaas|install-als]`
    *****************************************************************************************************

### Editing the Database Service configuration

The installation has the following options that can be configured by editing the dbaas-installer.conf file. To edit the file, run the following command:

    # vi etc/dbaas-installer.conf
    
#### Default Section \[DEFAULT\]

In this section, you must provide the credentials for an admin user and keystone endpoint for the overcloud. This information is necessary so that the installer can create users for the Database Service and upload Images to Glance. 

|  Configuration    | Description                                           |Default Value  |
|:------------------|:------------------------------------------------------|:--------------|
|auth_url           |Keystone Auth URL (http://<host_ip>:/5000/v2)          |None           |
|target_region_name |Region name given to endpoints in service catalog      |None           |
|target_username    |Username that will create resources, has admin role    |None           |
|target_password    |Password associated with username                      |None           |
|target_tenant_name |Tenant name for which user belongs                     |None           |

#### Trove Section \[trove\]

This section contains the minimum configuration needed in order to install the Database Service. **Note**: `ssh_public_key` is required only if chose option #2 for handling [SSH Keys](#ssh-keys).

|  Configuration    | Description                                                                 |Default Value       |
|:------------------|:----------------------------------------------------------------------------|:-------------------|
|ssh_public_key     |Local path of file containing public key - *only* if you are using [pre-generated keys](#generate-ssh-keys), otherwise remove this configuration|None                |
|service_password   |Password for `trove` user which owns the Database Service control plane                                             |None                |
|pool_password      |Password for `trove-pool` user which owns the compute hosts for guest Database Instances|None                |

#### Horizon Section \[horizon\]

In this section, you must provide credentials and location of Horizon in overcloud.  This information is used to patch the stock HP Helion OpenStack Community Edition of Horizon so that it better supports the Database Service.

|  Configuration    | Description                                                                 |Default Value       |
|:------------------|:----------------------------------------------------------------------------|:-------------------|
|private_key_path   |Local path of file containing private key for the overcloud Horizon server. This key can be secure-copied (scp) from the root user on the seed cloud, typically `192.0.2.1`|None                |
|host_ip            |IP Address of overcloud controller which hosts Horizon. This is typically the same IP in the `auth_url`|None               |


### Editing Application Lifecycle Service Configuration

    # vi etc/als-installer.conf
    
#### Default Section \[DEFAULT\]

In this section, you must provide the credentials for an admin user and keystone endpoint for the overcloud. This information is necessary so that the installer can upload Images to Glance. **Note**: If you are also installing Database Service these configurations *must* be identical.

|  Configuration     | Description                                          |Default Value      |
|:-------------------|:-----------------------------------------------------|:------------------|
|auth_url            |Keystone Auth URL (http://<host_ip>:/5000/v2)         |None               |
|target_region_name  |Region name given to endpoints in service catalog     |None               |
|target_username     |Username that will create resources, has admin role   |None               |
|target_password     |Password associated with username                     |None               |
|target_tenant_name  |Tenant name for which user belongs                    |None               |


### Activating the Installer

You need to ensure that the script and environment to run this installer are activated.  To do so, run the following:

    # source .env/bin/activate
    
### Running the Installer

You can install both the Database Service and Application Lifecycle Service in one command or install them separately.

Install the Database Service and Application Lifecycle Service by running the following command:

    # devplatform-installer --config-dir ./etc --log-file install.log install

Or install the Database Service by running the following command:

    # devplatform-installer --config-file ./etc/dbaas-installer.conf --log-file install-dbaas.log install-dbaas
    
Or install the Application Lifecycle Service by running the following command:

    # devplatform-installer --config-file ./etc/als-installer.conf --log-file install-als.log install-als
    
Once the installation is complete, you should see the following output:

    2014-06-17 16:53:19.765       INFO Install Complete


## After you install<a name="after-you-install"></a>

In order to verify that the installation was successful perform the following steps as an admin user.

1. Run this command to get the list of keystone tenants. You should see two (2) tenants created by the installer in the output: `trove` and `trove-pool`. 

        # keystone tenant-list
    
2. Run this command to get the list of compute instances of the control plane. You should see five (5) compute instances: `trove-rmq`, `trove-mysql`, `trove-api`, `trove-tm` and `trove-conductor`

        # nova list --all-tenants=1
    
3. Run this command to get the list of Application Lifecycle Service images. You should see the two (2) images: `HP Helion Development Platform CE - Application Lifecycle Service Installer` and `HP Helion Development Platform CE - Application Lifecycle Service Seed Node`

        # nova image-list
    
4. Finally, do not forget your keys.  If you had the installer create the SSH keys, save the private key to a secure place. You will need this key if you ever want to gain access to the Database Service Control Plane. By default, the key can be found here

        # ls ${installer-home}/trove-kp


## Advanced Configuration<a name="advanced-configuration"></a>

This section provides you with additional configurations that may be set. These only need to be changed in cases where your environment does not match the standard environment created by the HP Helion OpenStack Community Edition. In most situations, you will not need to change these.

### Database Service configuration

#### Trove Section \[trove\]

|  Configuration      | Description                                                                                  |Default Value       |
|:--------------------|:---------------------------------------------------------------------------------------------|:-------------------|
|templates_path       |Local path of directory containing Heat Templates                                             |./templates         |
|images_path          |Local path of directory containing disk images (.qcow2)                                       |./images            |
|keyname              |Name of keypair as it will be created in Nova                                                 |trove-kp            |
|ssh_private_key_path |Local path of directory where private key will be placed. Used if `ssh_public_key` is not set |.                   |
|stack_name           |Name Heat gives to Database Service control plane stack                                       |trove               |
|stack_rollback       |Whether the stack is deleted when an error occurs during or after the stack creation          |True                |
|service_name         |Name of Service as it will appears in Keystone                                                |trove               |
|service_tenant       |Tenant Name for owner of the Database Service control plane. Installer will create this Tenant|trove               |
|service_user         |User Name for the owner of the Database Service control plane. Installer will create this User|trove               |
|pool_tenant          |Tenant Name for the owner of compute hosts for guest Database Instances. Installer will create this Tenant|trove   |
|pool_user            |User Name for the owner of the compute hosts for guest Database Instances. Installer will create this User|trove-pool |
|quota_instances      |Quota of compute instances for the `trove-pool` user. Maximum number of guest Database Instances across all tenants|35|
|ext_net_id           |Network ID for the network that has external network access. For HP Helion OpenStack Community Edition this network is named 'ext-net'|Network ID for 'ext-net'|


#### Cinder Section \[cinder\]

|  Configuration      | Description                                                         |Default Value  |
|:--------------------|:--------------------------------------------------------------------|:--------------|
|endpoint             |Override endpoint for Cinder service                                 |None           |
|endpoint_type        |One of the three endpoint types in Keystone service catalog          |publicURL      |
|service_type         |Service type associated to endpoint in Keystone service catalog      |volume         |
|insecure             |Whether the connection to Cinder is insecure                         |False          |


#### Keystone Section \[keystone\]

|  Configuration      | Description                                                         |Default Value  |
|:--------------------|:--------------------------------------------------------------------|:--------------|
|endpoint             |Override endpoint for Keystone service                               |None           |
|insecure             |Whether the connection to Keystone is insecure                       |False          |


#### Glance Section \[glance\]

|  Configuration      | Description                                                         |Default Value  |
|:--------------------|:--------------------------------------------------------------------|:--------------|
|endpoint             |Override endpoint for Glance service                                 |None           |
|endpoint_type        |One of the three endpoint types in Keystone service catalog          |publicURL      |
|service_type         |Service type associated to endpoint in Keystone service catalog      |image          |
|insecure             |Whether the connection to Glance is insecure                         |False          |
|protect_images       |Prevents images from being deleted by non-admin users                |True           |


#### Heat Section \[heat\]

|  Configuration      | Description                                                         |Default Value  |
|:--------------------|:--------------------------------------------------------------------|:--------------|
|endpoint             |Override endpoint for Heat service                                   |None           |
|endpoint_type        |One of the three endpoint types in Keystone service catalog          |publicURL      |
|service_type         |Service type associated to endpoint in Keystone service catalog      |orchestration  |
|insecure             |Whether the connection to Heat is insecure                           |False          |


#### Neutron Section \[neutron\]

|  Configuration      | Description                                                         |Default Value  |
|:--------------------|:--------------------------------------------------------------------|:--------------|
|endpoint             |Override endpoint for Neutron service                                |None           |
|endpoint_type        |One of the three endpoint types in Keystone service catalog          |publicURL      |
|service_type         |Service type associated to endpoint in Keystone service catalog      |network        |
|insecure             |Whether the connection to Neutron is insecure                        |False          |


#### Swift Section \[swift\]

|  Configuration      | Description                                                         |Default Value  |
|:--------------------|:--------------------------------------------------------------------|:--------------|
|endpoint             |Override endpoint for Swift service                                  |None           |
|endpoint_type        |One of the three endpoint types in Keystone service catalog          |publicURL      |
|service_type         |Service type associated to endpoint in Keystone service catalog      |object-store   |


### Application Lifecycle Service configuration

#### Glance Section \[glance\]

|  Configuration      | Description                                                         |Default Value  |
|:--------------------|:--------------------------------------------------------------------|:--------------|
|endpoint             |Override endpoint for Glance service                                 |None           |
|endpoint_type        |One of the three endpoint types in Keystone service catalog          |publicURL      |
|service_type         |Service type associated to endpoint in Keystone service catalog      |image          |
|insecure             |Whether the connection to Glance is insecure                         |False          |
|protect_images       |Disallows the image from being deleted                               |True           |


## Uninstalling the HP Helion Development Platform<a name="uninstalling-the-hp-helion-development-platform"></a>

To remove the components installed by the HP Helion Development Platform, follow the steps below. **Note**: This process does not delete any guest Database Instances nor Application Lifecycle Service clusters. It only removes those components that were created by the installer.

### Uninstall the Database Service

1. Due to the numerous components created by the installer, it is advised to use the `uninstall-dbaas` option. Run this command to do so.

		# devplatform-installer --config-file ./etc/dbaas-installer.conf  uninstall-dbaas
	
### Uninstall the Application Lifecycle Service

There are two images installed for the Application Lifecycle Service. There are two steps that need to be performed in order to remove them.

1. First, the image needs to be 'unprotected'. This is a feature in Glance that prevents deletion of images. Run the following command to disable protection for that image.

		# glance image-update <image_name_or_id> --is-protected False
	
2. Now you can delete the image from Glance.

		# glance image-delete <image_name_or_id>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
  
