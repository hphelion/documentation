---
layout: default
title: "HP Helion OpenStack: Installation and Configuration"
permalink: /helion/openstack/ga/install/kvm/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/openstack/install-beta/prereqs/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/vsa/">NEXT &#9654;</a> </p>
-->

# HP Helion OpenStack&reg;:  Installation and Configuration for KVM Hypervisor 

HP Helion OpenStack allows you to manage the KVM hypervisor and provision virtual machines. This document provides installation instructions for HP Helion OpenStack on a suitably specified and prepared system.

## Installing HP Helion OpenStack <a name="install"></a>

The installation and configuration process for ESX consists of the following general steps: 

* [Preparing for installation](#prepare)
	* [Verify Prerequisites](#pre)
	* [KVM deployment architecture](#deploy-arch)
	* [Create and identify environment variables file](#envvars)
	* [Prepare baremetal.csv file](#csv)
	* [Preparing cloud seed host to run seed VM](#prepseed)
* [Downloading the installation packages](#getinstall)
* [Create and identify environment variables file](#envvars)
* [Installing HP Helion OpenStack](#install)
   * [Configuring proxy information](#proxy)
   * [Unpacking installation file](#unpackinstall)
   * [Installing the seed VM and building your cloud](#startseed)
* [Verifying your installation](#verifying-your-installation)
   * [Connecting to Horizon Undercloud console](#connectconsoleunder)
   * [Connecting to Horizon Overcloud console](#connectconsoleover)
* [Create projects for LDAP users](#ldap)
* [Next steps](#next-steps)

## Preparing for installation<a name="prepare"></a>

Before starting the installation, review the following sections.

### Verify Prerequisites<a name="pre"></a>

To ensure successful installation, please read through the following topics before you start.

* Review the [support matrix](/helion/openstack/ga/support-matrix/) for information on the supported hardware and software.
* Make sure your environment meets the [hardware and network configuration requirements](/helion/openstack/ga/install/prereqs/). 
* [Perform required pre-installation tasks](/helion/openstack/ga/install/prereqs/).


### Review the KVM deployment architecture<a name="deploy-arch"></a>

The following diagram depicts the required network topology for a KVM installation.

<a href="javascript:window.open('/content/documentation/media/topology_kvm.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">KVM deployment of HP Helion OpenStack beta (opens in a new window)</a>

For detailed network requirements, see [HP Helion OpenStack&#174; Installation: Prerequisites](/helion/openstack/ga/install/prereqs/#network_prepare).

### Create and identify environment variables file ### {#envvars}

Before installing, make sure you have created the environment variables file that is required for installation.

For more information, see [HP Helion OpenStack&reg;: Creating an Environment Variables File for Installation](/helion/openstack/ga/install/envars/).

### Prepare baremetal.csv file ### {#csv}

Before installing, make sure you have created the `baremetal.csv` file that is required for installation.

For more information, see [Creating the baremetal.csv file](/helion/openstack/ga/install/prereqs/#csv/) in *HP Helion OpenStack&reg; Installation: Prerequisites*.


### Preparing cloud seed host to run seed VM ### {#prepseed}
On the server identified to run the seed VM, make sure that Ubuntu 14.04 LTS Server edition is installed and operating, as listed in [HP Helion OpenStack® Installation: Prerequisites](/helion/openstack/ga/install/prereqs/#ubuntu).

## Downloading the installation packages<a name="getinstall"></a>

Before you begin, you must download the required HP Helion OpenStack installation packages:

1. Log in to your install system as root:

    `sudo su -`

2. Register and then log in to download the required installation packages from [HP Helion OpenStack product installation](https://helion.hpwsportal.com/#/Product/%7B%22productId%22%3A%221247%22%7D/Show).

	<table style="text-align: left; vertical-align: top; width:650px;">
	
<tr style="background-color: lightgrey; color: black;">
<td><b> Installation package </b></td><td><b>File name</b></td>

<tr style="background-color: white; color: black;">
<td>HP Helion OpenStack beta </td><td>HPHelionOpenStack.tgz</td></tr>
</td></tr>

</table>

## Installing HP Helion OpenStack<a name="install"></a>

Make sure you have met all the hardware requirements and have completed the required tasks before you begin your installation. The following sections walk you through the steps to be executed on the seed KVM host:

* [Configuring proxy information](#proxy)
* [Unpacking installation file](#unpackinstall)
* [Installing the seed VM and building your cloud](#startseed)


### Configure proxy information<a name="proxy"></a>

Before you begin your installation on the seed VM host, if necessary configure the proxy information for your environment using the following steps:

1. Launch a terminal and log in to your seed VM host as root:

		sudo su -

2. Add the following lines to `/etc/environment`:

		export http_proxy=http://<web_proxy_IP>/
		export https_proxy=<http://web_proxy_IP>/
		export no_proxy=localhost,127.0.0.1,<your 10.x IP address>
	
	Where `web_proxy_IP` is your web proxy IP address.

3. Log out and re-login to your baremetal server to activate the proxy configuration.

### Unpack the installation file <a name ="unpackinstall"></a>

1. Make sure you are logged into the seed VM host as root. If not:

		sudo su -

2. Create a directory named `work`:

		mkdir /root/work
		cd /root/work

3. Extract the installation package to the `work` directory:

		tar zxvf /root/HPHelionOpenStack.tgz

	This creates and populates a `tripleo/` directory within root's home directory.

### Install the seed VM and build your cloud<a name="startseed"></a>

1. Make sure you are logged into the seed VM host as root. If not:
 
		sudo su -

2. Execute the `env_vars` file using the `source` command. The `source` command executes the content of the file passed as argument, in the current shell.

		source env_vars

5. Start the seed VM installation by entering the following command:

		bash -x /root/work/tripleo/tripleo-incubator/scripts/hp_ced_start_seed.sh

	**Note**:The installation process takes approximately 10 minutes to complete.

	When the seed VM startup is complete, you should see a message similar to the following:

		"Wed Apr 23 11:25:10 IST 2014 --- completed setup seed" 

6. To build the cloud, start by logging in to the seed VM. Run the following command from /root:

		ssh root@192.0.2.1 

	**Note**: It might take a few moments for the seed VM to become reachable. 

7. When prompted for host authentication, type `yes` to allow the ssh connection to proceed.

8. Copy the `env_vars` file to `/root`. You can use the `scp` to copy the file from seed VM host to the seed VM.

9. Execute the `env_vars` file using the `source` command. The `source` command executes the content of the file passed as argument, in the current shell.

		source env_vars

10. Make sure the information in the [`baremetal.csv` configuration file](/helion/openstack/ga/install/prereqs/#req-info) file is correct and upload the file to `/root`.

	**Note:** For more information on creating this file, refer to [Creating the baremetal.csv file](/helion/openstack/ga/install/prereqs/#req-info) on the *Prerequisites* page.

11. If you are integrating LDAP into your environment, copy the configuration files to the seed VM host, as described in [HP Helion OpenStack&reg;: Integrating LDAP](/helion/openstack/ga/install/ldap/).

	a. Copy the `tripleo-overcloud-password` file to the /root/tripleo folder.

		scp tripleo-overcloud-passwords root@192.0.2.1:/root/tripleo/tripleo-overcloud-passwords

	b. Copy the `overcloud_keystone_ldap.json` file to the /root/tripleo/hp_passthrough folder.

		scp overcloud_keystone_ldap.json root@192.0.2.1:/root/tripleo/hp_passthrough/overcloud_keystone_ldap.json 

12. [Optional] If you have installed the IPMItool, use it to verify that network connectivity from the seed VM to the baremetal servers in your `baremetal.csv` is working.

13. Manually power off each baremetal system specified in /root/baremetal.csv before proceeding with the installation. 

	**IMPORTANT:** Make sure that each system is configured in the BIOS to stay powered off in the event of being shutdown rather than automatically restarting.

14. To install and configure the undercloud and overcloud, run the following command from /root. 

		bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh

	If your installation is successful, a message similar to the following is displayed:

		"HP - completed - Tue Apr 22 16:20:20 UTC 2014"

	**Note:** If `hp_ced_start_seed` fails to start the seed, need to restart the installation (step 1) and then follow the rest of the steps.

## Verify your installation<a name="verifying-your-installation"></a>

Once your installation is complete, you should ensure you can connect to your HP Helion OpenStack baremetal cloud.


### Connect to the undercloud Horizon console <a name="connectconsoleunder"></a>

Make sure you can access the undercloud Horizon dashboard. To do this, follow the steps below:

1. From the seed, run the following command.

		. /root/stackrc

2. Assign the undercloud IP address to a variable.

		UNDERCLOUD_IP=$(nova list | awk '/\| undercloud/{print $12}' | sed 's/ctlplane=//'); echo $UNDERCLOUD_IP

3. Determine the undercloud IP from the output of step 2 using the following command. It is in the last line returned.
  
		echo ${UNDERCLOUD_IP}

4. Obtain the undercloud admin password using the following command:

		UNDERCLOUD_ADMIN_PASSWORD=$(grep UNDERCLOUD_ADMIN_PASSWORD /root/tripleo/tripleo-undercloud-passwords | sed 's/UNDERCLOUD_ADMIN_PASSWORD=//'); echo $UNDERCLOUD_ADMIN_PASSWORD

5. From your install system, open a web browser and point to:

		http://<undercloud_IP>

6. Log in as user 'admin' with the admin password from step 4.

### Connect to the overcloud Horizon console <a name="connectconsoleover"></a>

Make sure you can access the overcloud Horizon dashboard. To do this, follow the steps below:

1. From the seed, export the undercloud passwords.

		. /root/tripleo/tripleo-overcloud-passwords

2. Export the undercloud users.

		TE_DATAFILE=/root/tripleo/ce_env.json . /root/tripleo/tripleo-incubator/overcloudrc

3. Assign the overcloud IP address to a variable.

		OVERCLOUD_IP=$(jq '.overcloud.endpointhost' /root/tripleo/ce_env.json)

	<!-- Remove per Divaker
	4. With the IP address and root password, log in as the main user, root using the following command 

		ssh root@${DEMO_IP}

	If the optional second network was configured, the overcloud controller IP is the value set for `NeutronPublicInterfaceIP`. -->

5. From your install system, open a web browser and point to.

		http://<overcloud_IP>/

6. Log in to the overcloud Horizon dashboard as user `admin` with the password you obtained from the `/root/tripleo/tripleo-overcloud-passwords` file in step 1.


	**Note:** If you are unable to connect to the Horizon console, check your proxy settings to ensure that access to the controller VM is successfully redirected through a proxy.

### Create projects for LDAP users<a name="ldap"></a>

If you are integrating LDAP into your environment, you need to configure the Horizon dashboard for users. For more information, see *Include the configuration files in the installation* on the [HP Helion OpenStack&reg;: Integrating LDAP page](/helion/openstack/ga/install/ldap/).


## Next Steps<a name="next-steps"></a>

- Configure HP StoreVirtual VSA. 

	HP StoreVirtual VSA Software is a Virtual Storage Appliance that provides the complete array functionality on top of Linux KVM environment without an external array hardware. It eliminates the need for external shared storage required to implement block storage features. It uses scale-out, distributed clustering to provide a pool of storage with enterprise storage features and simple management.

	For intructions, see the [Configuring HP StoreVirtual VSA for Block Storage](/helion/openstack/ga/install/vsa/) document. 

- Configure a Swift Scale-Out cluster

	An optional Swift Scale-Out cluster instance of between two and twelve servers that is used for production cloud Object storage use (Scale-Out Swift extends the Starter Swift Cluster enabling greater capacity while maintaining any initial data present in Starter Swift).

	For intructions, see the [HP Helion OpenStack® Scale-out Swift](/helion/openstack/ga/services/object/overview/scale-out-swift/) document. 

- Configure an HP 3Par storage array 

	An optional HP 3Par storage array that can be used to provide high performance Cinder block storage 

	For intructions, see the [HP Helion OpenStack&#174;: HP StoreServ (3PAR) Support](/helion/openstack/ga/install/3par/) document.

- Install DNS as a service (DNSaaS) (Optional).

	Our managed DNS service, based on the OpenStack Designate project, is engineered to help you create, publish, and manage your DNS zones and records securely and efficiently to either a public or private DNS server network.

	For installation intructions, see [DNSaaS Installation and Configuration](/helion/openstack/ga/install/dnsaas/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
