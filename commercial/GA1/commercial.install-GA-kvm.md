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


<p style="font-size: small;"> <a href="/helion/openstack/install/prereqs/">&#9664; PREV</a> | <a href="/helion/openstack/install-overview/">&#9650; UP</a> | <a href="/helion/openstack/install/vsa/">NEXT &#9654;</a> </p>

# HP Helion OpenStack&reg;: Installation and Configuration for KVM Hypervisor

HP Helion Openstack allows you to manage the KVM hypervisor and provision virtual machines. 
 
HP Helion OpenStack can be installed on a VMware ESX bare-metal or virtual hypervisor. This document provides installation instructions for HP Helion OpenStack Edition preview on a suitably specified and prepared system.

HP Helion OpenStack on an ESX hypervisor allows you to manage the VMware vCenter and provision virtual machines.


## Installing HP Helion OpenStack ## {#install}

The installation and configuration process for ESX consists of the following general steps: 

* [Downloading the installation packages](#getinstall)
* [Starting the installation](#install)
   * [Configuring proxy information](#proxy)
   * [Unpacking installation file](#unpackinstall)
   * [Installing the seed VM and building your cloud](#startseed)
* [Verifying your installation](#verifying-your-installation)
   * [Connecting to Horizon console](#connectconsole)
   * [Connecting to to Monitoring UI](#monitoring)
* [Deploying Open vSwitch vApp](#ovsvapp)
* [Installing DNS as a service](#configure)
* [Next steps](#next-steps)
 

## Verify Prerequisites ## {#pre}

To ensure successful installation, please read through the topics before you start.

* Review the [support matrix](/helion/openstack/ga/support-matrix/) for information on the supported hardware and software.
* Make sure your environment meets the [hardware and network configuration requirements](/helion/openstack/ga/install/prereqs/). 
* [Perform required pre-installation tasks](/helion/openstack/ga/install/prereqs/)

##Review the ESX deployment architecture ## {#deploy-arch}

The following diagram depicts the required network topology for a KVM installation.

<a href="javascript:window.open('/content/documentation/media/topology_kvm.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack architecture diagram for ESX (opens in a new window)</a>

For detailed network requirements, see [HP Helion OpenStack&#174; Installation: Before you begin](/helion/openstack/ga/install/prereqs/#network_prepare).

## Perform additional network requirements ## {#networkreq}

***QUESTION: Is this information OK? Accurate? Useful?***

These additional network components are required for an ESX installation:
 
* VLAN trunking and native VLAN should be enabled on the private network. This is to cater to untagged PXE traffic with the tenant.<!--- Private network that caters to the PXE traffic needs to be a VLAN trunk line with a default VLAN (native) tag at the switch port side for all systems that are part of the environment.-->
 
* VMware vCenter management must be a part of the private network (192.0.2.x)

## Download the installation packages {#getinstall}
Before you begin, you must download the required HP Helion OpenStack installation packages:

***QUESTION: New files names?***
<table style="text-align: left; vertical-align: top; width:650px;">
	
<tr style="background-color: lightgrey; color: black;">
	
<td><b> Installation package </b></td><td><b>File name</b></td>
<tr style="background-color: white; color: black;">
 <td>HP Helion OpenStack</td><td>HPHelionOpenStack_June30.tgz</td></tr>

<tr style="background-color: white; color: black;">
<td>HP Helion OpenStrack DNSaaS (Optional) </td><td>HP_dnsaas-installer_0.0.4b11.tar.gz</td></tr>
</td></tr>
</table>

1. Log in to your install system as root:

        sudo su -

2. Register and then log in to download the required installation packages from this site:

    [HP Helion OpenStack product installation](https://helion.hpwsportal.com/#/Product/%7B%22productId%22%3A%221247%22%7D/Show)


## Install HP Helion Openstack ## {#install}

Make sure you have met all the hardware requirements and have completed the required tasks before you begin your installation. The following sections walk you through:

* [Configuring proxy information](#proxy)
* [Unpacking installation file](#unpackinstall)
* [Installing the seed VM and building your cloud](#startseed)

**IMPORTANT:** During the installation process, **DO NOT RESTART** the system running the installer and seed VM. Restarting this system disrupts the baremetal bridge networking configuration and disables both the undercloud and overcloud. If the system is inadvertently restarted, you must initiate the installation process again.

### Configure proxy information {#proxy}

***QUESTION: This section is not in https://rndwiki2.atlanta.hp.com/confluence/display/cloudos/ee_ga_ironic_quick_start. Still required??***

Before you begin your installation, if necessary, configure the proxy information for your environment using the following steps:

1. Ensure you are logged into your install system as root; otherwise, log in as root: 

        sudo su -

2. Add the following lines to `/etc/environment`:

        export http_proxy=http://<web proxy IP/
        export https_proxy=http://web proxy IP/
        export no_proxy=localhost,127.0.0.1,<your 10.x IP address>
 
3. Log out and re-login to your baremetal server to activate the proxy configuration.

### Unpack the installation file ## {#unpackinstall}

1. Ensure you are logged into your install system as root; otherwise, log in as root:

        sudo su -

2. Create a directory named `work`:

         mkdir /root/work
         cd /root/work

3.  Extract the kit to the `work` directory:

         tar zxvf /root/work/<baremetal kit name>.tgz

    This creates and populates a `tripleo/` directory within `work' directory.

4. If the external device name on the host system (the one through which the host, and indirectly the seed, accesses the IPMI network) is **NOT** named `eth0`, then determine the device name before executing the next step:

        $ export BRIDGE_INTERFACE=<devicename>

    Examples:

        $ export BRIDGE_INTERFACE=em1  
        $ export BRIDGE_INTERFACE=eth5


### Install the seed VM and build your cloud ### {#startseed}

1. To start the seed VM installation, enter the following command:

		bash -x /root/work/tripleo/tripleo-incubator/scripts/hp_ced_host_manager.sh --create-seed

    If the seed startup is successful, you should see a message similar to the following:

        "Wed Sept 09 11:25:10 IST 2014 --- completed setup seed"

    **Note**:The installation process takes approximately 10 minutes to complete.

2. To build the cloud, start by logging in to the seed VM. Run the following command from /root:

        ssh root@192.0.2.1 

    **Note**: It might take a few moments for the seed VM to become reachable. 
  
3. When prompted for host authentication, type `yes` to allow the ssh connection to proceed.
***QUESTION: Still required??***

4. Ensure the information in the [`baremetal.csv` configuration file](/helion/openstack/qa/install/prereqs/#req-info) file is correct and in the following format and upload THE FILE to `/root`.
	<mac_address>,<ipmi_user>,<ipmi_password>,<ipmi_address>,<no_of_cpus>,<memory_MB>,<diskspace_GB>

	***QUESTION: Must use IPMI user vs ILO used in beta?***

	**Important**: There must be one entry in this file for each baremetal system you intend to install. The file must contain exactly five lines for the ESX installation. For example, your file should look similar to the following:

		78:e7:d1:22:5d:10,administrator,password,192.168.11.5,12,32768,2048
		78:e7:d1:22:5d:58,administrator,password,192.168.11.1,8,16384,2048
		78:e7:d1:22:52:90,administrator,password,192.168.11.3,12,32768,2048
		78:e7:d1:22:5d:c0,administrator,password,192.168.11.2,12,32768,2048
		78:e7:d1:22:5d:a8,administrator,password,192.168.11.4,12,32768,2048
		78:e7:d1:22:52:9b,administrator,password,192.168.11.6,12,32768,2048
    
	**Note:** For more information on creating this file, refer to [Creating the baremetal.csv file](/helion/openstack/ga/install/prereqs/#req-info) on the *Before you begin* page.

5. [Optional] If you have installed the IPMItool, use it to verify that network connectivity from the seed VM to the baremetal servers in your baremetal.csv is working.

	***QUESTION: Still optional? Not in https://rndwiki2.atlanta.hp.com/confluence/display/cloudos/ee_ga_ironic_quick_start.***

6. Manually power off each baremetal system specified in /root/baremetal.csv before proceeding with the installation. 
    
    **IMPORTANT:** Ensure that each system is configured in the BIOS to stay powered off in the event of being shutdown rather than automatically restarting.

7. Set `OVERCLOUD_NeutronPublicInterface` and `UNDERCLOUD_NeutronPublicInterface` to the name of the interface that carries Neutron external traffic on your overcloud and undercloud. By default, it is *eth2*. The following example sets the value of the variable to *eth0*.

		$ export OVERCLOUD_NeutronPublicInterface=eth0
		$ export UNDERCLOUD_NeutronPublicInterface=eth0 

8. Set `OVERCLOUD_COMPUTESCALE` to 1, which is the currently supported limit. If you do not specify a value, the value is derived based on the number of lines remaining in `/root/baremetal.csv` once the undercloud, overcloud control, and overcloud swift nodes are removed.

	To set this variable:

		$ export OVERCLOUD_COMPUTESCALE=1

9. Release floating IP addresses for networking.

	The installation creates a pool of floating IP addresses that you can assign to virtual machines.

	By default, the floating IP range is between 192.0.2.129 - 192.0.2.254. You can change the floating IP range by exporting the following variables:

		export FLOATING_START=<Start IP Address>
		export FLOATING_END=<End IP Address>
		export FLOATING_CIDR=<CIDR in 192.x.x.x/24 format>

    **For example**:

		export FLOATING_START=192.0.2.129
		export FLOATING_END=192.0.2.200
		export FLOATING_CIDR=192.0.2.0/24

	**Note:** If the above settings are changed, set the 'NeutronPublicInterfaceDefaultRoute' variable to the actual gateway for the customized IP range.

10. Set OVERCLOUD_NTP_SERVER to the IP address of the NTP server accessible on the public interface for OVERCLOUD hosts. 

	To set this variable:

		export OVERCLOUD_NTP_SERVER=<IP_address>

11. Set UNDERCLOUD_NTP_SERVER to the IP address of the NTP server accessible on the public interface for OVERCLOUD hosts. 

	To set this variable:

		export UNDERCLOUD_NTP_SERVER=<IP_address>

12. Set OVERCLOUD_CINDER_LVMLOOPDEVSIZE to determine the size of the loopback device on your partition on the overcloud control node used to hold Volume Opeartion sedrvice volumes. Set it to a higher value, for
example if you plan to create snapshots of large bootable volumes. The partition is a shared device, so the loopback device should not occupy the entire partition. The partition size is calculated as (approximately) diskspace_GB (from baremetal.csv) less root partition size of 30GB. The default is 50000MB.

	To set this variable:

		export OVERCLOUD_CINDER_LVMLOOPDEVSIZE=55000

13. Set OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID to set a unique ID for keepalived from 0 to 255. HP Helion OpenStack uses keepalived to manage virtual using unique IDs to synchronize its activities. If you plan to run multiple installations of HP Helion OpenStack on the same network, each installation must be configured with a unique id by setting the environment variable to a unique number before running the installation. The default value, if unset, is 51.

	To set this variable:

		export OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID=99

14. Set OVERCLOUD_VSASTORAGESCALE to determine the number of VSA nodes to install.

	To set this variable:

		export OVERCLOUD_VSASTORAGESCALE=5


15. **OPTIONAL:** You can configure a second network for API traffic and for the floating ip pool by setting OVERCLOUD_NeutronPublicInterface to a physically configured VLAN. The VLAN name used as the OVERCLOUD_NeutronPublicInterface is expected to be of the form "vlan" followed by the VLAN id (for example: `vlan101` ).

	For example:

		$ export OVERCLOUD_NeutronPublicInterface=vlan101
		$ export NeutronPublicInterfaceIP=192.0.8.2/21
		$ export NeutronPublicInterfaceRawDevice=eth0
		$ export NeutronPublicInterfaceDefaultRoute=192.0.8.1
		$ export FLOATING_START=192.0.8.20
		$ export FLOATING_END=192.0.15.254
		$ export FLOATING_CIDR=192.0.8.0/21

	It is assumed in the above that the seed VM has been configured with a route to the external VLAN subnet.


16. Install and configure the undercloud and overcloud, run the following command from /root. 

		bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh

	If your installation is successful, a message similar to the following is displayed:
 
		"HP - completed - Tue Apr 22 16:20:20 UTC 2014"

After you receive the *completed* message, you should verify the installation by connecting to the overcloud and undercloud dashboards.

## Verify your installation {#verifying-your-installation}

To verify that the installation is successful, connect to the HP Helion Openstack dashboard and the undercloud dashboard as follows.

### Connect to the Horizon console ### {#connectconsole}

Ensure you can access the overcloud Horizon dashboard. To do this, follow the steps below:

1. From the seed, export the undercloud passwords:

		. /root/tripleo/tripleo-overcloud-passwords

2. Export the undercloud users:

		TE_DATAFILE=/root/tripleo/ce_env.json . /root/tripleo/tripleo-incubator/overcloudrc-user

3. Assign the overcloud IP address to a variable:

		DEMO_IP=$(nova list | awk '/\| demo \|/{print $13}')

4. Determine the overcloud controller IP from the output of step 3 using the following command. It is in the last line returned.
  
		ssh root@${DEMO_IP}

	If the optional second network was configured, the overcloud controller IP is the value set for NeutronPublicInterfaceIP.

5. From your install system, open a web browser and point to:

		http://<overcloud_IP>/

6. Log in to the overcloud Horizon dashboard as user `admin` with the password you obtained from the `/root/tripleo/tripleo-overcloud-passwords` file in step 4.


**Note:** If you are unable to connect to the Horizon console, check your proxy settings to ensure that access to the controller VM is successfully redirected through a proxy.

### Connect to the undercloud Horizon console ### {#monitoring}

1. From the seed, run the following command:

		. /root/stackrc

2. Assign the undercloud IP address to a variable:

		UNDERCLOUD_IP=$(nova list | awk '/\| undercloud/{print $12}' | sed 's/ctlplane=//'); echo $UNDERCLOUD_IP

3. Determine the undercloud IP from the output of step 2 using the following command. It is in the last line returned.
  
		echo ${UNDERCLOUD_IP}

4. Obtain the undercloud admin password using the following command:

		UNDERCLOUD_ADMIN_PASSWORD=$(grep UNDERCLOUD_ADMIN_PASSWORD /root/tripleo/tripleo-undercloud-passwords | sed 's/UNDERCLOUD_ADMIN_PASSWORD=//'); echo $UNDERCLOUD_ADMIN_PASSWORD

5. From your install system, open a web browser and point to:

		http://<undercloud_IP>/icinga/

6. Log in as user 'admin' with the admin password.


## Next Steps

- Deploy the Open vSwitch vApp **(REQUIRED)**. 

	HP Virtual Cloud Networking's Open vSwitch vApp (OVSvApp) must be installed for HP Helion OpenStack environment to provision VMs in your VMware vCenter environment. Once deployed, OVSvApp appliance enables networking between the tenant Virtual Machines (VMs).

	For installation intructions, see the [Deploying and configuring OVSvApp for HP Virtual Cloud Networking (VCN) on ESX hosts](/helion/openstack/ga/install/ovsvapp/) document for complete instructions. 

- Install DNS as a service (DNSaaS) (Optional).

	Our managed DNS service, based on the OpenStack Designate project, is engineered to help you create, publish, and manage your DNS zones and records securely and efficiently to either a public or private DNS server network.

	For installation intructions, see [DNSaaS Beta Installation and Configuration](/helion/openstack/ga/install/dnsaas/).


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

