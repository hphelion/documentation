---
layout: default
title: "HP Helion OpenStack: Installing and Configuring the ESX Hypervisor"
permalink: /helion/openstack/ga/install/esx/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/helion/openstack/install/vsa/">&#9664; PREV</a> | <a href="/helion/openstack/install-overview/">&#9650; UP</a> | <a href="/helion/openstack/install/ovsvapp/">NEXT &#9654;</a> </p>

# HP Helion OpenStack&reg;: Installation and Configuration for ESX Hypervisor

HP Helion OpenStack allows you to manage the ESX hypervisor, manage the VMware vCenter, and provision virtual machines. 

## Installing HP Helion OpenStack<a name="install"></a>

The installation and configuration process for CLOUD_TYPE ESX consists of the following general steps:

* [Verify Prerequisites](#pre)
* [Review the ESX deployment architecture](#deploy-arch)
* [Downloading the installation packages](#getinstall)
* [Starting the installation](#install)
   * [Configuring proxy information](#proxy)
   * [Unpacking installation file](#unpackinstall)
   * [Installing the seed VM and building your cloud](#startseed)
* [Verifying the installation](#verifying-your-installation)
   * [Connecting to the overcloud Horizon console](#connectconsole)
   * [Connecting to the undercloud Horizon console](#monitoring)
* [Next steps](#next-steps) 

## Verify Prerequisites<a name="pre"></a>
To ensure successful installation, please read through the topics before you start.

* Review the [support matrix](/helion/openstack/ga/support-matrix/) for information on the supported hardware and software.
* Make sure your environment meets the [hardware and network configuration requirements](/helion/openstack/ga/install/prereqs/). 
* [Perform required pre-installation tasks](/helion/openstack/ga/install/prereqs/).

## Review the ESX deployment architecture<a name="deploy-arch"></a>

The following diagram depicts the required network topology for a KVM installation.

<a href="javascript:window.open('/content/documentation/media/topology_esx.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack architecture diagram for ESX (opens in a new window)</a>

For detailed network requirements, see [HP Helion OpenStack&#174; Installation: Prerequisites](/helion/openstack/ga/install/prereqs/#network_prepare).


## Download the installation packages<a name="getinstall"></a>
Before you begin, you must download the required HP Helion OpenStack installation packages:

1. Log in to your install system as root:

		sudo su -

2. Register and then log in to download the required installation packages from [HP Helion OpenStack product installation](https://helion.hpwsportal.com/#/Product/%7B%22productId%22%3A%221247%22%7D/Show).

<table style="text-align: left; vertical-align: top; width:650px;">
	
<tr style="background-color: lightgrey; color: black;">
	
<td><b> Installation package </b></td><td><b>File name</b></td>
<tr style="background-color: white; color: black;">
 <td>HP Helion OpenStack</td><td>HPHelionOpenStack.tgz</td></tr>
<tr style="background-color: white; color: black;">
 <td>HP Helion OpenStack vCenter Proxy Appliance</td><td>overcloud_vcenter_compute_proxy.ova</td></tr>
 <td>HP Helion OpenStack VCN Agent Appliance</td><td>overcloud-esx-ovsvapp.ova</td></tr>

</table>


## Installing HP Helion OpenStack<a name="install"></a>

Make sure you have met all the hardware requirements and have completed the required tasks before you begin your installation. The following sections walk you through:

* [Unpacking installation file](#unpackinstall)
* [Installing the seed VM and building your cloud](#startseed)

**IMPORTANT:** During the installation process, **DO NOT RESTART** the system running the installer and seed VM. Restarting this system disrupts the bridge networking configuration and disables both the undercloud and overcloud. If the system is inadvertently restarted, you must initiate the installation process again.

### Unpack the installation file<a name="unpackinstall"></a>

1.Log into your install system as root.

		sudo su -

2. Create a directory named `work`.

		mkdir /root/work
		cd /root/work

3.  Extract the installation package to the `work` directory:

		tar zxvf /root/HPHelionOpenStack.tgz

	This creates and populates a `tripleo/` directory within `work' directory.

### Install the seed VM and build your cloud<a name="startseed"></a>

1. Start the seed installation

		OVERCLOUD_CLOUD_TYPE="ESX" bash -x /root/work/tripleo/tripleo-incubator/scripts/hp_ced_host_manager.sh --create-seed

	When seed VM install is successful, you will see a message similar the following:

		"Wed Sept 23 11:25:10 IST 2014 --- completed setup seed"

2. Login to the seed VM using the following command:

		ssh root@192.0.2.1

3. Make sure the information in the [`baremetal.csv` configuration file](/helion/openstack/ga/install/prereqs/#csv/) file is correct and in the following format and upload the file to `/root`.
4. 
		<mac_address>,<ipmi_user>,<ipmi_password>,<ipmi_address>,<no_of_cpus>,<memory_MB>,<diskspace_GB>

	**Important**: There must be one entry in this file for each baremetal system you intend to install. The file must contain exactly six lines for the ESX installation. For example, your file should look similar to the following:

		78:e7:d1:22:5d:10,administrator,password,192.168.11.5,12,32768,2048
		78:e7:d1:22:5d:58,administrator,password,192.168.11.1,8,16384,2048
		78:e7:d1:22:52:90,administrator,password,192.168.11.3,12,32768,2048
		78:e7:d1:22:5d:c0,administrator,password,192.168.11.2,12,32768,2048
		78:e7:d1:22:5d:a8,administrator,password,192.168.11.4,12,32768,2048
		78:e7:d1:22:52:9b,administrator,password,192.168.11.6,12,32768,2048
    
	**Note:** For more information on creating this file, refer to [Creating the baremetal.csv file](/helion/openstack/ga/install/prereqs/#req-info) on the *Prerequisites* page.

4. [Optional] Use **ipmitool** to verify that network connectivity from the seed VM to the baremetal servers in your `baremetal.csv` is working.

5. Manually power off each baremetal system specified in your `baremetal.csv` before proceeding with the installation. 
    
	**IMPORTANT:** Make sure that each system is configured in the BIOS to stay powered off in the event of being shut down rather than automatically restarting.

	<!-- Remove per Divakar??
	6. Release floating IP addresses for networking.

	***QUESTION: More info needed on how to determine the IP range??***

	By default, the installation creates a pool of floating IP addresses that you can assign to virtual machines. However, the HP Virtual Cloud Networking's Open vSwitch vApp (OVSvApp) required by the ESX environment requires a block of IP addresses. You create more IP addresses for OVSvApp by restricting the number of floating IP addresses created.

	By default, the floating IP range is between 192.0.2.129 - 192.0.2.254. You can shrink the range by exporting the following variables:

		# export FLOATING_START=<Start IP Address>
		# export FLOATING_END=<End IP Address>

	**Note:** If the above settings are changed, set the 'NeutronPublicInterfaceDefaultRoute' variable to the actual gateway for the customized IP range. 
-->

7. Set `OVERCLOUD_NTP_SERVER` to the IP address of the NTP server accessible on the public interface for overcloud hosts. 

	To set this variable:

		export OVERCLOUD_NTP_SERVER=<IP_address>

8. Set `UNDERCLOUD_NTP_SERVER` to the IP address of the NTP server accessible on the public interface for undercloud hosts. 

	To set this variable:

		export UNDERCLOUD_NTP_SERVER=<IP_address>


9. Set the IP address of the customer router in your network.

	To set this variable:

		export CUSTOMER_ROUTER_IP=<IP_address>

	For detailed network requirements, see [HP Helion OpenStack&#174; Installation: Prerequisites](/helion/openstack/ga/install/prereqs/#network_prepare).

10. Set the `OVERCLOUD_CLOUD_TYPE` to ESX

	To set this variable:

		export OVERCLOUD_CLOUD_TYPE="ESX"

11. Use the following commands to set environment variables

	To set these variables:

		export PROVIDER_NETWORK="192.168.10.0/24"
		export OVERCLOUD_VIRTUAL_INTERFACE=br-ex
		export OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID="101"
		export VLAN_RANGE="200:300"

	**Where:**
	
	- `PROVIDER_NETWORK` is the ESX Management Network
	- `OVERCLOUD_VIRTUAL_INTERFACE` is the keep alive interface for HA 
	- `OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID` is a unique identifier. If you plan to run multiple installations of HP Helion OpenStack on the same network, each installation must be configured with a unique ID. The default value, if unset, is 51.  HP Helion OpenStack uses keepalived to manage virtual IPs. keepalived uses these unique IDs to synchronise its activities.
	- `VLAN_RANGE` is the tenant networks allocation range 

	**For example**:

		export FLOATING_START=192.0.2.129
		export FLOATING_END=192.0.2.200
		export OVERCLOUD_NTP_SERVER="16.110.135.123"
		export UNDERCLOUD_NTP_SERVER="16.110.135.123"
		export OVERCLOUD_CLOUD_TYPE="ESX"
		export PROVIDER_NETWORK="192.168.10.0/24"
		export CUSTOMER_ROUTER_IP="192.168.10.1"
		export OVERCLOUD_VIRTUAL_INTERFACE=eth0
		export OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID="101"
		export VLAN_RANGE="200:300"

12. Install and configure the undercloud and overcloud, run the following command from /root. 

		bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh

	If your installation is successful, a message similar to the following is displayed:
 
		"HP - completed - Tue Apr 22 16:20:20 UTC 2014"

## Verify your installation<a name="verifying-your-installation"></a>

To verify that the installation is successful, connect to the HP Helion OpenStack dashboard and the undercloud dashboard as follows.

### Connect to the undercloud Horizon console<a name="monitoring"></a>

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

### Connect to the overcloud Horizon console <a name="connectconsole"></a>

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

## Next Steps<a name="next-steps"></a>


- Deploy vCenter ESX Compute Proxy **(REQUIRED)**

	The HP Helion OpenStack vCenter ESX compute proxy is a driver that enables the Compute service to communicate with a VMware vCenter server that manages one or more ESX hosts. The HP Helion OpenStack Compute Service Nova (Compute) requires this driver to interface with VMWare ESX hypervisor APIs.

	See [HP Helion OpenStack&#174; Deploy vCenter ESX compute proxy](/helion/openstack/ga/install/esx/proxy/).

- Deploy the Open vSwitch vApp **(REQUIRED)**. 

	HP Virtual Cloud Networking's Open vSwitch vApp (OVSvApp) must be installed for HP Helion OpenStack environment to provision VMs in your VMware vCenter environment. Once deployed, OVSvApp appliance enables networking between the tenant Virtual Machines (VMs).

	For installation intructions, see the [Deploying and configuring OVSvApp for HP Virtual Cloud Networking (VCN) on ESX hosts](/helion/openstack/ga/install/ovsvapp/) document for complete instructions. 

- Install DNS as a Service (DNSaaS) (Optional).

	Our managed DNS service, based on the OpenStack Designate project, is engineered to help you create, publish, and manage your DNS zones and records securely and efficiently to either a public or private DNS server network.

	For installation intructions, see [DNSaaS Beta Installation and Configuration](/helion/openstack/install/dnsaas/).

	See [HP Helion OpenStack: DNSaaS Installation and Configuration](/helion/openstack/ga/install/dnsaas/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*