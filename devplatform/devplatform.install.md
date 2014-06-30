---
layout: default-devplatform
title: "HP Helion OpenStack Development Platform Installation"
permalink: /helion/devplatform/community/install-dev-platform/
product: devplatform

---
<!-- -->
<p style="font-size: small;"> <a href="/helion/devplatform/community/release-notes/">&#9664; PREV</a> | <a href="/helion/devplatform/">&#9650; UP</a> | <a href="/helion/devplatform/community/related-topics/">NEXT &#9654;</a> </p>

# HP Helion Development Platform: Installation and configuration 

This preview edition of HP Helion Development Platform installs two products: Database Service and Application Lifecycle Service(ALS).

Installation of Application Lifecycle Service registers the following  two (2) images in Glance:

* `Installer` image &#45; You can boot an instance of this image using Nova if you want to deploy the Application Lifecycle cluster in your tenant space. 
* `Seed`image &#45; This contains the control plane for the Application Lifecycle Cluster. 

The `Installer`image boots the instances of the `Seed`images as specified by you during the [Application Lifecycle Service installation process](/helion/devplatform/community/install-als/).


Installation of Database Service  creates five virtual machines(VM) in the overcloud.  These virtual machines compose the control plane for the Database Service.  The Installer also creates two tenant/user pairs: the `trove` tenant creates and owns all resources of the control plane; the `trove-pool` tenant/user  owns and manages all the compute hosts containing the guest database instances. Once the Installer registers Database Service in Keystone, the users of HP Helion Community Edition can provision their own guest database instances either through OpenStack Dashboard (Horizon) or through the [Trove Python Client](http://community.hpcloud.com/article/python-troveclient-cli-linux-installation). 


The following topics explain the process to install and configure the HP Helion Development Platform.

* [Prerequisites](#prerequisites)
* [Before you begin](#before-you-begin)
* [Installing the HP Helion Development Platform](#installing-the-hp-helion-development-platform)
* [After you install](#after-you-install)
* [Advanced Configuration](#advanced-configuration)


## Prerequisites {#prerequisites}

The HP Helion Development Platform installs in the overcloud of the HP Helion Community Edition.  The HP Helion Development Platform has the same prerequisites <!---**WHAT ARE THOSE??**--> as the HP Helion OpenStack Community Edition-Baremetal.

The system running the installer must have Python 2.7 installed.  Most modern operating systems include this as a part of their base toolset. 

This document is geared toward a Linux operating system but it does not preclude the installer from running on other operating systems with some minor modifications to the command-line statements.

The installer requires the following packages to be installed. 
 
* `python-dev `
* `libffi-dev` 
* `libssl-dev` 

Your are prompted to install them if they are not already installed.

## Before you begin {#before-you-begin}

Before you start the installation of HP Helion Development Platform, check the following:

* Credentials and Connectivity
* SSH Key (Optional)

### Credentials and connectivity

For proper connectivity, do the following:

* Ensure that you have the OpenStack credentials of Admin user to  access the overcloud.
* Check your access to the endpoints for services in the overcloud. 
* Run the environment on the system which has `Python OpenStack clients` installed  on it.(e.g. python-novaclient).

To test that you have the necessary access, perform the following steps:
	
1. Ensure that `python-novaclient` exists. Run the following command to display a version number:

    `# nova --version`

2. If the command <!---**VERSION NUMBER??**--> is not displayed, install `python-novaclient` using:

    `# sudo apt-get install -y python-novaclient`

3. Create a stackrc file using the following command.

    `# vi stackrc`

    Add the following content to the file:

		export OS_USERNAME={your_admin_user}
		export OS_TENANT_NAME={your_admin_tenant}
		export OS_PASSWORD={your_admin_password}
		export OS_AUTH_URL={auth_url_endpoint}

4. Export variables to your local environment using the following command.
	
	`# source stackrc`

5. Check connectivity and admin role.
	
	`# nova credentials`

6. Validate the following message in the output. 
	
	`roles            | [{u'name': u'admin'} ...`
	
This confirms that you have the Admin role assigned to you,your credentials are valid and you can connect to an overcloud endpoint.

### SSH Keys {#ssh-keys} (optional)

The control plane for Database as a Service (Trove) consists of five VMs.  SSH key provides you the access to VMs to investigate and debug any issue that occurs on these VMs. You can get the SSH key in one of the following ways:

* Allow the installer to create a public/private keypair. <!---**Do we need to tell the user how to proceed with this???**-->

     OR

* Provide the installer with the path and file name of your public key.

If you choose option #1, you can skip Installing the HP Helion Development Platform and ignore the ssh_public_key configuration else follow the steps below.


#### Creating your own public/private key

To generate the keypair, perform the following steps:

1. Ensure that the ssh keys are not already present using the following command. 

    `# ls -l ~/.ssh`
 
    The command should not return the files `id_rsa` or `id_rsa.pub`

2.  Generate the public and private key using the following command.

	`# ssh-keygen -t rsa`

3. Omit the passphrase and accept the defaults by pressing **Enter**.
	
4. Validate that the key exists by running the following command.

	`# ls -l ~/.ssh`
	
    The following files are displayed as the output on the command line:
	
		-rw-------   1 username  group   1766 Nov  8  2012 id_rsa
		-rw-r--r--   1 username  group    409 Nov  8  2012 id_rsa.pub
	
During the installation you specify the public key in the configuration in the following format:

   `ssh_public_key=/home/username/.ssh/id_rsa.pub`
	
## Installing the HP Helion Development Platform {#installing-the-hp-helion-development-platform}

### Downloading and unpacking the installation file

The installation of HP Helion Development Platform for the HP Helion OpenStack Community is provided as a single compressed tar file.  This is a large file as it contains all the machine images required for Database Service and Application Lifecycle Service.

Register and download the package from the following URL:

[HP Helion Development Platform](https://helion.hpwsportal.com/#/Product/{"productId":"1245"}/Show)

**Note**: This install file is over 4GB and does not fit on a memory stick formatted as FAT32. If you are planning to store the installation files on removable media use a formatting that supports large files, like NTFS.

To begin the installation, log into your system and unpack the tar file:

  `# tar zxvf <pathname-of-.tar.gz-file>`
	
This creates and populates a `dev-platform-tools` directory.

`# cd dev-platform-tools`
	

### Preparing to run the installation

Ensure all the prerequisites have been met and run the following command to prepare the installer. 

`# ./install_installer.sh`
	
The following output is displayed.

	*****************************************************************************************************
	Configure Development Platform Installer at ./etc/dbaas-installer.conf and ./etc/als-installer.conf
	run `source .env/bin/activate`
	and then run `devplatform-installer --config-dir ./etc [install|install-dbaas|install-als]`
	*****************************************************************************************************
<!--**
<THE ABOVE APPEAR TO BE THE INSTALLATION COMMANDS.IF THEY ARE COMMANDS, THEN SHOULD'NT WE BE TELLING THE USER TO RUN THESE COMMANDS FOR COMPLETE INSTALLATIONS??>**
-->

### Editing the Database Service configuration

The installation has the following options that can be configured by editing the dbaas-installer.conf file. To edit the file, run the following command:

  `# vi etc/dbaas-installer.conf`
	
#### Default Section

<!---This section allows you to create new tenants, users, images, services and endpoints for the Database Service using your admin credentials:-->

In this section, you must provide the credentials for an admin user and keystone endpoint for the overcloud. This information is necessary so that the installer can create users for the Database Service and upload images to Glance.

<table style="text-align: left; vertical-align: top; width:650px;">
	
	<tr style="background-color: lightgrey; color: black;">
	
	 <td><b>Configuration</b></td> <td><b> Description </b></td><td><b>Default Value</b></td>
	
	<tr style="background-color: white; color: black;">
	<td>auth_url</td> <td>Keystone Auth URL (http://<host_ip>:/5000/v2)</td><td>None</td></tr>
	
	<tr style="background-color: white; color: black;">
	<td>target_region_name</td> <td>Region name given to endpoints in service catalog</td><td>None</td></tr>
	
    <tr style="background-color: white; color: black;">
	<td>target_username</td> <td>Username that has the admin role and creates resources</td><td>None</td></tr>
	
    <tr style="background-color: white; color: black;">
	<td>target_password</td> <td>Password associated with the username</td><td>None</td></tr> 

     <tr style="background-color: white; color: black;">
	<td>target_tenant_id</td> <td>Tenant name to which the user belongs</td><td>None</td></tr></table>



#### Trove Section

<!---This section helps you to define the deployment of Database Service.-->

This section contains the minimum configuration needed in order to install the Database Service. 

**Note**: ssh&#95;public_key is required only if you chose option #2 for handling [SSH Keys](#ssh-keys).


<table style="text-align: left; vertical-align: top; width:650px;">
	
	<tr style="background-color: lightgrey; color: black;">
	
	 <td><b>Configuration</b></td> <td><b> Description </b></td><td><b>Default Value</b></td>
	
	<tr style="background-color: white; color: black;">
	<td>ssh_public_key</td> <td>Local path of file containing public key only if you are using pre-generated keys, otherwise remove this configuration</td><td>None</td></tr>
	
	<tr style="background-color: white; color: black;">
	<td>service_password</td> <td>Password for `trove` user which owns the Database Service control plane</td><td>None</td></tr>
	
    <tr style="background-color: white; color: black;">
	<td>pool_password </td> <td>Password for `trove-pool` user who owns the compute hosts for guest Database instances </td><td>None</td></tr></table>


#### Horizon Section \[horizon\]

In this section, you must provide credentials and location of Horizon in overcloud.  This information is used to patch the stock HP Helion OpenStack Community Edition of Horizon so that it supports the Database Service.

<table style="text-align: left; vertical-align: top; width:650px;">
	
	<tr style="background-color: lightgrey; color: black;">
	
	 <td><b>Configuration</b></td> <td><b> Description </b></td><td><b>Default Value</b></td>
	
	<tr style="background-color: white; color: black;">
	<td>private_key_path</td> <td>Local path of file containing public key only if you are using pre-generated keys, otherwise remove this configuration</td><td>None</td></tr>   

### Editing Application Lifecycle Service Configuration

The installation has the following options that can be configured by editing the als-installer.conf file. To edit the file, run the following command:

 `# vi etc/als-installer.conf`
	
#### Default Section

This section allows you to upload new images to Glance using your admin credentials.  If you are also installing Database Service the configurations must be identical.

<table style="text-align: left; vertical-align: top; width:650px;">
	
	<tr style="background-color: lightgrey; color: black;">
	
	 <td><b>Configuration</b></td> <td><b> Description </b></td><td><b>Default Value</b></td>
	
	<tr style="background-color: white; color: black;">
	<td>auth_url</td> <td>Keystone Auth URL (http://<host_ip>:/5000/v2)</td><td>None</td></tr>
	
	<tr style="background-color: white; color: black;">
	<td>target_region_name</td> <td>Region name given to endpoints in service catalog</td><td>None</td></tr>
	
    <tr style="background-color: white; color: black;">
	<td>target_username</td> <td>Username that has the admin role and creates resources</td><td>None</td></tr>
	
    <tr style="background-color: white; color: black;">
	<td>target_password</td> <td>Password associated with the username</td><td>None</td></tr> 

     <tr style="background-color: white; color: black;">
	<td>target_tenant_id</td> <td>Tenant name to which the user belongs</td><td>None</td></tr></table>

### Activating the Installer

Ensure that the script and environment to run the installer is activated by executing the following command.

`# source .env/bin/activate`
	
### Running the Installer

Once you edit the configurations, you are ready to run the installer. You can either install both the Database Service and Application Lifecycle Service using a single command or you can install each of them individually.


* To install the Database Service and Application Lifecycle Service together, run  the following command.

    `# devplatform-installer --config-dir ./etc --log-file install.log install`

* To install the Database Service only, run the following command.

	`# devplatform-installer --config-file ./etc/dbaas-installer.conf --log-file install-dbaas.log install-dbaas`
	
* To install the Application Lifecycle Service only, run the following command:

    `# devplatform-installer --config-file ./etc/als-installer.conf --log-file install-als.log install-als`
	
Once the installation completes, the following output is displayed:

	2014-06-17 16:53:19.765       INFO Install Complete

## After you install {#after-you-install}

To verify that the install is successful, perform the following steps as an Admin user.

1. Run the following command to get the list of keystone tenants. 

	`# keystone tenant-list`
	
    The two (2) tenants created by the install in the output- `trove` and `trove-pool` are displayed. 

2. Run the following command to get the list of compute instances of the control plan. 

    `# nova list --all-tenants=1`

    The five (5) compute instances- `rmq`, `mysql`, `api`, `tm` and `conductor`are displayed.
	
3. Run the following command to get the list of Application Lifecycle Service images. 

	`# nova image-list`

    The two (2) images- `als-seed` and `als-assembler`are displayed.

4. If you generate ssh key through the installer, save the private key as you need this to log in to the Database Service Control Plane.  By default, the key located at the following location:

    `# ls ${installer-home}/trove-kp`

## Advanced Configuration {#advanced-configuration}

This section helps you to define additional configurations that you can set as per your requirement.These can be changed when your environment does not meet the standard environment setup by the HP Helion Community Edition.  

**Note**: In most cases, you may not need to change these.


### Database Service configuration

#### Trove Section {#

<table style="text-align: left; vertical-align: top; width:650px;">
	
	<tr style="background-color: lightgrey; color: black;">
	
	 <td><b>Configuration</b></td> <td><b> Description </b></td><td><b>Default Value</b></td>
	
	<tr style="background-color: white; color: black;">
	<td>templates_path </td> <td>Local path of directory containing Heat Templates</td><td>./templates</td></tr>
	
	<tr style="background-color: white; color: black;">
	<td>images_path</td> <td>Local path of directory containing disk images (.qcow2)</td><td>./images</td></tr>
	
    <tr style="background-color: white; color: black;">
	<td>keyname</td> <td>Name of keypair as it is created in Nova</td><td>trove-kp</td></tr>
	
    <tr style="background-color: white; color: black;">
	<td>ssh_private_key_path</td> <td>Local path of directory where private key is placed if ssh_public_key is not provided</td><td>.</td></tr> 

     <tr style="background-color: white; color: black;">
	<td>stack_name </td> <td>The name Heat gives to Database Service control plane stack</td><td>dbaas</td></tr>

    <tr style="background-color: white; color: black;">
	<td>stack_rollback</td> <td>If error occurs during or after the stack creation should it be deleted</td><td>True</td></tr>
	
    <tr style="background-color: white; color: black;">
	<td>service_name</td> <td>Name of Service as it exists in Keystone</td><td>trove</td></tr> 

     <tr style="background-color: white; color: black;">
	<td> <a name="service_tenant"></a></td> <td>Tenant Name that owns the Database Service Control Plane. Installer creates this Tenant</td><td>trove</td></tr>

    <tr style="background-color: white; color: black;">
	<td>service_user</td> <td>User Name that owns the Database Service Control Plane. Installer creates this User</td><td>trove</td></tr> 

    <tr style="background-color: white; color: black;">
	<td>quota_instances<a name="service-tenant"></a> </td> <td>Quota for instances the `trove-pool` user can create. Maximum number of Database Service Instances</td><td>35</td></tr>

    <tr style="background-color: white; color: black;">
	<td>ext_net_id  <a name="service-tenant"></a> </td> <td>Network ID for the network that has external network access. For Helion the network is 'ext-net'</td><td>ID of 'ext-net'</td></tr></table>

#### Cinder Section (Optional)

You can override the entries that were created in the Keystone Service Catalog using this section.Edit this section only if you are sure of the information details.

<table style="text-align: left; vertical-align: top; width:650px;">

     <tr style="background-color: lightgrey; color: black;">
	
	 <td><b>Configuration</b></td> <td><b> Description </b></td><td><b>Default Value</b></td>
	
	<tr style="background-color: white; color: black;">
	<td>endpoint </td> <td>Override endpoint for Cinder service </td><td>None</td></tr>
	
	<tr style="background-color: white; color: black;">
	<td>endpoint_type</td> <td>One of the three endpoint types in Keystone service catalog</td><td>publicURL</td></tr>
	
    <tr style="background-color: white; color: black;">
	<td>service_type</td> <td>Service type associated to endpoint in Keystone service catalog</td><td>volume</td></tr>
	
    <tr style="background-color: white; color: black;">
	<td>insecure</td> <td>Whether the connection to Cinder is insecure</td><td>False</td></tr></table> 


#### Keystone Section (Optional)

You can override entries that were created in the Keystone Service Catalog using this section. Edit this section only if you are sure of the information details.

<table style="text-align: left; vertical-align: top; width:650px;"> 
<tr style="background-color: lightgrey; color: black;">

<td><b>Configuration</b></td> <td><b> Description </b></td><td><b>Default Value</b></td>
	
	<tr style="background-color: white; color: black;">
	<td>endpoint </td> <td>Override endpoint for Keystone service </td><td>None</td></tr>
	
	<tr style="background-color: white; color: black;">
	<td>insecure</td> <td>Whether the connection to Keystone is insecure</td><td>False</td></tr></table> 


#### Glance Section (Optional)

You can override entries that were created in the Keystone Service Catalog using this section. Edit this section only if you are sure of the information details.

<table style="text-align: left; vertical-align: top; width:650px;">
	<tr style="background-color: lightgrey; color: black;">
	
	 <td><b>Configuration</b></td> <td><b> Description </b></td><td><b>Default Value</b></td>
	
	<tr style="background-color: white; color: black;">
	<td>endpoint </td> <td>Override endpoint for Glance service </td><td>None</td></tr>
	
	<tr style="background-color: white; color: black;">
	<td>endpoint_type</td> <td>One of the three endpoint types in Keystone Service Catalog</td><td>publicURL</td></tr>
	
    <tr style="background-color: white; color: black;">
	<td>service_type</td> <td>Service type associated to endpoint in Glance service catalog</td><td>image</td></tr>
	
    <tr style="background-color: white; color: black;">
	<td>insecure</td> <td>Whether the connection to Glance is insecure</td><td>False</td></tr>

	<tr style="background-color: white; color: black;">
	<td>protect_images</td> <td>Prevents images from being deleted by non-admin users</td><td>True</td></tr> </table>



#### Heat Section (Optional)

You can override entries that were created in the Keystone Service Catalog using this section. Edit this section only if you are sure of the information details.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: lightgrey; color: black;">
	
	 <td><b>Configuration</b></td> <td><b> Description </b></td><td><b>Default Value</b></td>
	
	<tr style="background-color: white; color: black;">
	<td>endpoint </td> <td>Override endpoint for Heat service </td><td>None</td></tr>
	
	<tr style="background-color: white; color: black;">
	<td>endpoint_type</td> <td>One of the three endpoint types in Keystone service catalog</td><td>publicURL</td></tr>
	
    <tr style="background-color: white; color: black;">
	<td>service_type</td> <td>Service type associated to endpoint in Keystone service catalog</td><td>orchestration</td></tr>
	
    <tr style="background-color: white; color: black;">
	<td>insecure</td> <td>Whether the connection to Heat is insecure</td><td>False</td></tr></table>


#### Neutron Section (Optional)

You can override entries that were created in the Keystone Service Catalog using this section. Edit this section only if you are sure of the information details.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: lightgrey; color: black;">
	
	 <td><b>Configuration</b></td> <td><b> Description </b></td><td><b>Default Value</b></td>
	
	<tr style="background-color: white; color: black;">
	<td>endpoint </td> <td>Override endpoint for Neutron service </td><td>None</td></tr>
	
	<tr style="background-color: white; color: black;">
	<td>endpoint_type</td> <td>One of the three endpoint types in Keystone service catalog</td><td>publicURL</td></tr>
	
    <tr style="background-color: white; color: black;">
	<td>service_type</td> <td>Service type associated to endpoint in Keystone service catalog</td><td>network</td></tr>
	
    <tr style="background-color: white; color: black;">
	<td>insecure</td> <td>Whether the connection to Neutron is insecure</td><td>False</td></tr></table>


#### Swift Section

You can override entries that were created in the Keystone Service Catalog using this section. Edit this section only if you are sure of the information details.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: lightgrey; color: black;">
	
	 <td><b>Configuration</b></td> <td><b> Description </b></td><td><b>Default Value</b></td>
	
	<tr style="background-color: white; color: black;">
	<td>endpoint </td> <td>Override endpoint for Swift service </td><td>None</td></tr>
	
	<tr style="background-color: white; color: black;">
	<td>endpoint_type</td> <td>One of the three endpoint types in Keystone service catalog</td><td>publicURL</td></tr>
	
    <tr style="background-color: white; color: black;">
	<td>service_type</td> <td>Service type associated to endpoint in Keystone service catalog</td><td>object-store</td></tr></table>

#### Horizon Section

This section helps you provide some**<WHAT DO YOU MEAN BY SOME??>** credentials and location of Horizon in overcloud.  This information is used to patch Horizon so that it better supports the Database Service.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: lightgrey; color: black;">
	
	 <td><b>Configuration</b></td> <td><b> Description </b></td><td><b>Default Value</b></td>
	
	<tr style="background-color: white; color: black;">
	<td>private_key_path  </td> <td>Local path of file containing private key for the overcloud Horizon server. This key can be secure-copied (scp) from the root user on the undercloud controller, typically `192.0.2.1` </td><td>None</td></tr>

<tr style="background-color: white; color: black;">
	<td>host_ip</td> <td>IP Address of overcloud controller which hosts Horizon. This is usually the same node as the `auth_url`.</td><td>None</td></tr></table>


### Application Lifecycle Service configuration

#### Glance Section (Optional)

You can override entries that were created in the Keystone Service Catalog using this section. Edit this section only if you are sure of the information details.


<table style="text-align: left; vertical-align: top; width:650px;"><tr style="background-color: lightgrey; color: black;">
	
	 <td><b>Configuration</b></td> <td><b> Description </b></td><td><b>Default Value</b></td>
	
	<tr style="background-color: white; color: black;">
	<td>endpoint </td> <td>Override endpoint for Glance service </td><td>None</td></tr>
	
	<tr style="background-color: white; color: black;">
	<td>endpoint_type</td> <td>One of the three endpoint types in Keystone service catalog</td><td>publicURL</td></tr>
	
    <tr style="background-color: white; color: black;">
	<td>service_type</td> <td>Service type associated to endpoint in Keystone service catalog</td><td>object-store</td></tr>

    <tr style="background-color: white; color: black;">
	<td>insecure</td> <td>Whether the connection to Glance is insecure</td><td>False</td></tr>

     <tr style="background-color: white; color: black;">
	<td>protect_images</td> <td>Prevents images from being deleted by non-admin users</td><td>True</td></tr></table>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
  
