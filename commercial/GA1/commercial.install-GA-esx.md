---
layout: default
title: "HP Helion OpenStack: Installing and Configuring the ESX Hypervisor"
permalink: /helion/openstack/install/esx/
product: commercial.ga

---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--
<p style="font-size: small;"> <a href="/helion/openstack/install/vsa/">&#9664; PREV</a> | <a href="/helion/openstack/install-overview/">&#9650; UP</a> | <a href="/helion/openstack/install/ovsvapp/">NEXT &#9654;</a> </p>
-->
# HP Helion OpenStack&reg;: Installation and Configuration for ESX Hypervisor

HP Helion OpenStack allows you to manage the ESX hypervisor, manage the VMware vCenter, and provision virtual machines. This document provides installation instructions for HP Helion OpenStack on a suitably specified and prepared system.

## Installing HP Helion OpenStack<a name="install"></a>

The installation and configuration process for ESX consists of the following general steps:

* [Preparing for installation](#prepare)
	* [Verify Prerequisites](#pre)
	* [Review the ESX deployment architecture](#deploy-arch)
	* [Edit the JSON environment variables file](#envvars)
	* [Prepare baremetal.csv file](#csv)
	* [Set DNS servers](#name-resolution)
	* [Preparing seed cloud host to run seed VM](#prepseed)
* [Download and extracting the installation packages](#getinstall)
* [Installing HP Helion OpenStack](#install)
   * [Configure proxy information](#proxy)
   * [Install the seed VM and building your cloud](#startseed)
* [Verifying the installation](#verifying-your-installation)
   * [Connect to the Overcloud Horizon console](#connectconsole)
   * [Connect to the Undercloud Horizon console](#monitoring)
   * [Create projects for LDAP users](#ldap)
* [Next steps](#next-steps) 

## Preparing for installation {#prepare}

Before starting the installation, review the following sections.

### Verify Prerequisites {#pre}

To ensure a successful installation, please read through the following topics before you start.

* Review the [support matrix](/helion/openstack/support-matrix/) for information on the supported hardware and software.
* Make sure your environment meets the [hardware and network configuration requirements](/helion/openstack/install/prereqs/). 
* [Perform required pre-installation tasks](/helion/openstack/install/prereqs/).

### Review the ESX deployment architecture {#deploy-arch}

The following diagram depicts the required network topology for a ESX installation.

<a href="javascript:window.open('/content/documentation/media/topology_esx.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack architecture diagram for ESX (opens in a new window)</a>

For detailed network requirements, see [Installation: Prerequisites](/helion/openstack/install/prereqs/#network_prepare).

### Edit the JSON environment variables file ### {#envvars}

Before installing, make sure you have edited the JSON environment variables file that is required for installation.

For more information, see [Editing the JSON Environment Variables File for Installation](/helion/openstack/install/envars/).

### Prepare baremetal.csv file ### {#csv}

Before installing, make sure you have created the `baremetal.csv` file that is required for installation.

For more information, see [Creating the baremetal.csv file](/helion/openstack/install/prereqs/#csv/) in *HP Helion OpenStack&reg; Installation: Prerequisites*.

### Set DNS servers {#name-resolution}

To set a default DNS name server for your HP Helion OpenStack Commercial cloud, refer to [Enabling Name Resolution from Tenant VMs in the Overcloud](/helion/openstack/name-resolution/) before installation.


### Prepare the seed cloud host to create the seed VM {#prepseed}

On the server identified to run the seed VM, called the seed VM host (or installation system), make sure that Ubuntu 14.04 LTS Server edition is installed and operating, as listed in [Installation: Prerequisites](/helion/openstack/install/prereqs/#ubuntu).


## Downloading and extracting the installation packages {#getinstall}
Before you begin, you must have downloaded and extracted the required HP Helion OpenStack installation packages. See [Installation: Prerequisites](/helion/openstack/install/prereqs/).

## Installing HP Helion OpenStack {#install}

Make sure you have met all the hardware requirements and have completed the required tasks before you begin your installation. The following sections walk you through the steps to be executed on the seed VM host:

* [Configure proxy information](#proxy)
* [Installing the seed VM and building your cloud](#startseed)


### Configure proxy information {#proxy}

Before you begin your installation on the seed VM host, if necessary configure the proxy information for your environment using the following steps:

1. Launch a terminal and log in to your seed VM host as root:

		sudo su -

2. Add the following lines to `/etc/environment`:

		export http_proxy=http://<web_proxy_IP>/
		export https_proxy=<http://web_proxy_IP>/
		export no_proxy=localhost,127.0.0.1,<your 10.x IP address>,<provider_network>
	
	Where:

		web_proxy_IP is your web proxy IP address.
		provider_Network is your ESX management network

3. Log out and re-login to the seed VM host to activate the proxy configuration.

### Install the seed VM and build your cloud {#startseed}

1. Make sure you are logged into the seed VM host as root. If not:
 
		sudo su -

2. Execute the `esx-custom-ips.json` file using the `source` command. The `source` command executes the content of the file passed as argument, in the current shell.

		source tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh tripleo/configs/esx-custom-ips.json

3. Start the seed VM installation by entering the following command:

		bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_host_manager.sh --create-seed

	**Note**:The installation process takes approximately 10 minutes to complete.

	When the seed VM startup is complete, you should see a message similar to the following:

		"Wed OCt 23 11:25:10 IST 2014 --- completed setup seed" 

	**Note:** If `hp_ced_host_manager.sh` fails to start the seed, restart the installation (step 1) and then follow the rest of the steps.

3. To build the cloud, start by logging in to the seed VM. Run the following command from `/root` using the IP address of seed VM as defined in the `esx-custom_ips.json` environment variables file:

		ssh root@<seed_VM_IP_address>

	**Note**: It might take a few moments for the seed VM to become reachable. 

4. When prompted for host authentication, type `yes` to allow the SSH connection to proceed.

5. Make sure the information in the [`baremetal.csv` configuration file](/helion/openstack/install/prereqs/#req-info) file is correct and upload the file to `/root`.

	**Note:** For more information on creating this file, refer to [Creating the baremetal.csv file](/helion/openstack/install/prereqs/#req-info) on the *Prerequisites* page.

6. If you are integrating LDAP into your environment, copy the configuration files, as described in [Integrating LDAP](/helion/openstack/install/ldap/), to the seed VM host.

	a. Copy the `tripleo-overcloud-password` file to the `/root/tripleo` folder.

		scp tripleo-overcloud-passwords root@192.0.2.1:/root/tripleo/tripleo-overcloud-passwords

	b. Copy the `overcloud_keystone_ldap.json` file to the `/root/tripleo/hp_passthrough` folder.

		scp overcloud_keystone_ldap.json root@192.0.2.1:/root/tripleo/hp_passthrough/overcloud_keystone_ldap.json 

7. [Optional] Use **ipmitool** to verify that network connectivity from the seed VM to the baremetal servers in your `baremetal.csv` is working.

8. Manually power off each baremetal system specified in your `baremetal.csv` before proceeding with the installation. 
    
	**IMPORTANT:** Make sure that each system is configured in the BIOS to stay powered off in the event of being shut down rather than automatically restarting.

14. Execute the `esx-custom-ips.json` file for the undercloud and overcloud nodes using the `source` command. The `source` command executes the content of the file passed as argument, in the current shell.

		source tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh tripleo/configs/esx-custom-ips.json 

9. Install and configure the undercloud and overcloud by running the following command from /root. 

		bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh |& tee cloud_install.log 

	If your installation is successful, a message similar to the following is displayed:
 
		"HP - completed - Tue Oct 23 16:20:20 UTC 2014"

	**Note:** If the installation does not complete properly, refer to the [Troubleshooting](/helion/openstack/services/troubleshooting/) document.

## Verify your installation {#verifying-your-installation}

To verify that the installation is successful, connect to the HP Helion OpenStack dashboard and the undercloud dashboard as follows.

### Connect to the undercloud Horizon console {#monitoring}

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

### Connect to the overcloud Horizon console {#connectconsole}

Make sure you can access the overcloud Horizon dashboard. To do this, follow the steps below:

1. From the seed, export the overcloud passwords.

		. /root/tripleo/tripleo-overcloud-passwords

2. Export the overcloud users.

		TE_DATAFILE=/root/tripleo/ce_env.json . /root/tripleo/tripleo-incubator/overcloudrc

3. Assign the overcloud IP address to a variable.

		OVERCLOUD_IP=$(jq '.overcloud.endpointhost' /root/tripleo/ce_env.json)

	<!-- Remove per Divaker
	4. With the IP address and root password, log in as the main user, root using the following command 

		ssh root@${DEMO_IP}

	If the optional second network was configured, the overcloud controller IP is the value set for `NeutronPublicInterfaceIP`. -->

4.	Obtain the overcloud admin password using the following command:

		OVERCLOUD_ADMIN_PASSWORD=$(grep OVERCLOUD_ADMIN_PASSWORD /root/tripleo/tripleo-overcloud-passwords | sed 's/OVERCLOUD_ADMIN_PASSWORD=//'); echo $OVERCLOUD_ADMIN_PASSWORD

5. From your install system, open a web browser and point to:

		http://<overcloud_IP>/

6. Log in to the overcloud as user `admin` with the password you obtained in step 4.

	**Note:** If you are unable to connect to the Horizon console, check your proxy settings to ensure that access to the controller VM is successfully redirected through a proxy.

### Create projects for LDAP users {#ldap}

If you are integrating LDAP into your environment, you need to configure the Horizon dashboard for users. For more information, see *Configure Horizon* on the [Integrating LDAP page](/helion/openstack/install/ldap/#horizon).

## Next Steps {#next-steps}


- Deploy vCenter ESX Compute Proxy **(REQUIRED)**

	The HP Helion OpenStack vCenter ESX compute proxy is a driver that enables the Compute service to communicate with a VMware vCenter server that manages one or more ESX hosts. The HP Helion OpenStack Compute service (Nova) requires this driver to interface with VMWare ESX hypervisor APIs.

	See [Deploy vCenter ESX compute proxy](/helion/openstack/install/esx/proxy/).

- Deploy the Open vSwitch vApp **(REQUIRED)**. 

	HP Virtual Cloud Networking's Open vSwitch vApp (OVSvApp) must be installed for HP Helion OpenStack environment to provision VMs in your VMware vCenter environment. Once deployed, OVSvApp appliance enables networking between the tenant Virtual Machines (VMs).

	For installation intructions, see the [Deploying and configuring OVSvApp for HP Virtual Cloud Networking (VCN) on ESX hosts](/helion/openstack/install/ovsvapp/) document for complete instructions. 

- Install DNS as a Service (DNSaaS) (Optional).

	Our managed DNS service, based on the OpenStack Designate project, is engineered to help you create, publish, and manage your DNS zones and records securely and efficiently to either a public or private DNS server network.

	<!---For installation intructions, see [DNSaaS Beta Installation and Configuration]( /helion/openstack/install/dnsaas/).--->

	See [HP Helion OpenStack&#174;: DNSaaS Installation and Configuration]( /helion/openstack/install/dnsaas/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*