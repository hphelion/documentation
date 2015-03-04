---
layout: default
title: "HP Helion OpenStack&#174; Community Baremetal Installation and Configuration"
permalink: /helion/community/install/
product: community

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/community/install-overview/">&#9664; PREV</a> | <a href="/helion/community/install-overview/">&#9650; UP</a> | <a href="/helion/community/install-virtual/">NEXT &#9654;</a> </p>
-->
# HP Helion OpenStack&#174; Community Baremetal Installation and Configuration

This page explains how to install and configure HP Helion OpenStack Community baremetal multi-node deployment &#8212; ideal for a small-scale, private cloud. 

This installation, which is launched on an installer system, deploys to a minimum of 7 baremetal servers, to which you can add up to 36 compute nodes:

* 1 undercloud
* 3 overcloud controllers
* 2 overcloud Swift nodes 
* At least 1 overcloud compute node 

It is important to read through this page before starting your installation. 

* [Installation requirements](#hardware-and-network-requirements)

	* [Hardware requirements](#hardware)
	* [Software requirements](#software)
	* [Network configuration](#network)

* [Before you begin](#before-you-begin)
   * [Obtaining a public key](#pub-key)
   * [Creating the baremetal configuration file](#baremetalcfg)
   * [About the installation process](#install-notes)

* [Installing HP Helion OpenStack Community](#install)
   * [Downloading and unpacking installation file](#getinstall)
   * [Starting the seed and building your cloud](#startseed)

## Installation requirements {#hardware-and-network-requirements}

Before starting the installation, make sure your hardware, software, and networking meet the minimum requirements and are properly configured.

### Hardware requirements {#hardware}

To install a HP Helion OpenStack Community multi-node baremetal configuration, you must meet the hardware requirements described in [Community Hardware and Software Requirements](/helion/community/hwsw-requirements/).

### Software requirements {#software}

To ensure a successful installation, you must meet the software requirements described in the [Software configuration](/helion/community/hwsw-requirements/#software) section in Community Hardware and Software Requirements.

### Network configuration {#network}

To ensure a successful installation, you must meet the network requirements described in [Community Network Architecture and Configuration](/helion/community/network-requirements/).

##Before you begin

Before you begin the installation process, ensure you have read the following and completed any required tasks:

* [Obtaining a public key](#pub-key)
* [Creating the baremetal configuration file](#baremetalcfg)
* [Set DNS servers by default](#name-resolution)
* [About the installation process](#install-notes)

### Obtain a public key ### {#pub-key}

Before you begin the installation process, the root user must have private and public RSA keys. You can determine this by issuing the following commands:
 
1. Log in as root:
    
    	sudo su -

2. Determine if .ssh/id_rsa exists:
    
    	ls -l ~root/.ssh/id_rsa

	NOTE: The output should look like the example below:

     	drwxr-x--- . 4096 May 11 09:23
    	-rwxr-x--- ..4096 May 11 09:23
    	-rwxr-x--- id_rsa1455 May 11 09:24
    	-rwxr-x--- id_rsa.pub 1455 May 11 09:24

3. If the key does not exist, create one, omitting a passphrase and accepting the defaults by pressing Enter:

		ssh-keygen -t rsa -N

### Creating the baremetal configuration file ### {#baremetalcfg}

During the installation process after the seed VM is installed, the installer script looks for information about the baremetal systems. Specifically, it looks for this information in a file called baremetal.csv. Before you begin the installation process, you must create this file and upload the file to the installer system (seed VM) at the appropriate installation step.

The baremetal.csv file informs the installer of the size of the computer that each node will be installed into.

**Notes:**
- The first line of the baremetal.csv file is the undercloud node.
- The second line is what TripleO uses to construct the flavor for baremetal deployment. If your servers are not all the same size, specify the smallest sized server in the second position so it uses that size as the flavor for all of the overcloud nodes being deployed.

There must be one entry in this file for each baremetal system you intend to install.
    `<mac_address>,<ilouser>,<ilopassword>,<iloipaddress>,<#cpus>,<memory_MB>,<diskspace>`

**Important:** The diskspace size value must be specified in Gibibytes, not Gigabytes. For example:

    900GB = 838 GiB
    1TB = 1000GB = 931 GiB

**Example:**

	78:e7:d1:22:5d:58,administrator,password,192.168.11.1,12,32768,1900
	78:e7:d1:22:52:9b,administrator,password,192.168.11.6,12,16384,800
	78:e7:d1:22:5d:10,administrator,password,192.168.11.5,12,32768,1900
	78:e7:d1:22:52:90,administrator,password,192.168.11.3,12,32768,1900
	78:e7:d1:22:5d:c0,administrator,password,192.168.11.2,12,32768,1900
	78:e7:d1:22:5d:a8,administrator,password,192.168.11.4,12,32768,1900
	78:e7:d1:22:52:9e,administrator,password,192.168.11.7,12,16384,800

To make creating this file easier during installation, we recommend that you gather this required information before you begin your installation, keeping in mind the following:

* The IPMI user and password **must have** ADMINISTRATOR privilege; it is not sufficient to have OPERATOR privilege
* The disk size specified should never exceed the physical disk size

### Set DNS servers by default {#name-resolution}

To set a default DNS name server for your HP Helion OpenStack Community cloud, refer to [Enabling name resolution from tenant VMs in the overcloud](/helion/community/name-resolution/) before installation.

### About the installation process ### {#install-notes}

There are a few things you should be aware of before you begin your HP Helion OpenStack Community baremetal installation.

* Loading images is slow, so be patient.

* The seed must remain booted while the undercloud and overcloud are up.

* These files contain credentials for the undercloud and the overcloud; you should make sure that they are securely stored separately from the seed.

		/root/stackrc
		/root/work/tripleo/tripleo_passwords


* Filesystem checking on reboot is disabled by default for the seed, undercloud and overcloud nodes. We recommend periodically manually running fsck to verify filesystem integrity.

* In the event you have trouble with the installation, review the [Issues and troubleshooting](/helion/community/troubleshooting/) and [FAQ](/helion/community/faq/) pages.


## Installing HP Helion OpenStack Community {#install}
Once you have met all of the hardware requirements and have completed the required tasks, you can begin your installation. The following two sections will walk you through:

   * [Downloading and unpacking installation file](#getinstall)

   * [Starting the seed and building your cloud](#startseed)

**IMPORTANT:** During the installation process, **DO NOT RESTART** the seed cloud host (the system running the installer and seed VM). Restarting this system disrupts the baremetal bridge networking configuration and disables both the undercloud and overcloud. If the system is inadvertently restarted, you must complete the installation process again.

### Downloading and unpacking installation file ## {#getinstall}

The HP Helion OpenStack Community baremetal installation is provided as a compressed TAR file. To download and unpack this file, complete the following steps.

**Note:** This install file does not fit on a memory stick formatted as FAT32. If you are planning to store the installation files on removable media, use something like NTFS.


1. Log in to your install system as root:

	`sudo su -`

2. Register and then log in to download the HP Helion OpenStack Community baremetal package from this site:

	[HP Helion OpenStack Community edition Installation Package](https://helion.hpwsportal.com/#/Product/%7B%22productId%22%3A%221320%22%7D/Show)

	The download file is named: `Helion_Openstack_Community.tar.gz`

3. Create a directory named `work` and extract the kit to the `work` directory:

		`mkdir /root/work`
		`cd /root/work`
		`tar zxvf /root/Helion_Openstack_Community_V1.4.tar.gz`

	This creates and populates a `tripleo/` directory within **root/work/** directory.

5. **Optional:** To use an interface other than 'eth0' on the HOST as the bridge interface, for example eth3, use the following command:

		export BRIDGE_INTERFACE=eth3

6. **Optional:** To use an IP address for the seed VM other than the default (192.0.2.1), use the following command:

		export BM_NETWORK_SEED_IP=192.168.10.1
		export BM_NETWORK_CIDR=192.168.0.0/16

6. **Optional:** To use a host other than the seed as the gateway, use the following command:

		export BM_NETWORK_GATEWAY=192.168.10.254

	**Note:** This must also be set on the seed during `hp_ced_installer` as detailed in the next section


### Starting the seed and building your cloud ### {#startseed}


Start the seed using the following command: 

	bash -x /root/work/tripleo/tripleo-incubator/scripts/hp_ced_host_manager.sh --create-seed

The process of starting the seed takes approximately ten minutes, depending on the capabilities of your system, and there are numerous logging messages generated by the script. The first time the script is run, it checks for and attempts to install any missing required packages, as described in [Software configuration](/helion/community/hwsw-requirements/#software) section in Community Hardware and Software Requirements. If you are prompted, accept all package installations.

When the seed VM install completes, you should see a message similar to the following:

		"Wed Oct 23 11:25:10 IST 2014 --- completed setup seed"

**Note:** The seed VM continues its self-initialization after the startup script has terminated. 


### Starting the undercloud, overcloud, and test guest VM ### {#startclouds}

This section explains how to deploy and configure the undercloud and overcloud, and to start a demo VM in the overcloud compute node.

1. To build the cloud, start by logging in to the seed. Run the following command from /root:

		ssh debian@192.0.2.1

2. Using your favorite editor, create a file in /root called `baremetal.csv`.

3. Make sure the information in the `baremetal.csv` configuration file file is correct and upload the file to /root.

	**Note:** For more information on creating this file, refer back to the [Creating the baremetal configuration file](#baremetalcfg).

4. Manually power off each baremetal system specified in the `baremetal.csv` file before proceeding with the installation. 

	**IMPORTANT:** Ensure that each system is configured in the BIOS to stay powered off in the event of being shutdown rather than automatically restarting. Refer to the [Network configuration](#additional-hardware-configuration) section.

5. Set the IP address of an NTP server accessible on the public interface for overcloud and undercloud hosts using the following commands 

	**Example:**

	The example sets the NTP server address. Do not copy this address.

	`export OVERCLOUD_NTP_SERVER=192.0.1.128`
<br />	`export UNDERCLOUD_NTP_SERVER=192.0.1.128`


6. If required, set the following environmental variables, which can affect your installation. Some of these variables set public, or floating, IP addresses. The floating IP addresses cannot be in the same range as the private network addresses (by default, 10.x.x.x)

	**Important**  The environment variable `NeutronPublicInterfaceIP` is no longer supported. The install will exit with an error message if this variable is set.

	* `OVERCLOUD_NeutronPublicInterface` - Use this variable to set the value of the name of the interface that carries the neutron external traffic on your overcloud. The default value is `eth2`. If this is correct, you do not need to set this variable.

		To set this variable:

		`export OVERCLOUD_NeutronPublicInterface=eth2`

	* `UNDERCLOUD_NeutronPublicInterface` - Use this variable to set the value of the name of the interface that carries the neutron external traffic on your undercloud. The default value is `eth2`. If this is correct, you do not need to set this variable.

		To set this variable:

		`export UNDERCLOUD_NeutronPublicInterface=eth2`

	* `FLOATING_START`, `FLOATING_END`, and `FLOATING_CIDR` - Use these variables to control the range of IP addresses available for user VMs in the overcloud. The defaults are currently set as below but can be changed if desired.

		To set these variables:

			export FLOATING_START=192.0.2.45
			export FLOATING_END=192.0.2.254
			export FLOATING_CIDR=192.0.2.0/24

		Note the following:

		- If you choose a pool of addresses outside the baremetal subnet, you should make sure those addresses are accessible.

		- The range defined by the variables `FLOATING_START`, `FLOATING_END` and `FLOATING_CIDR` cannot be in conflict with the address range of the default private network. By default the range of the default private network is between 10.0.0.1 and 10.255.255.254 (CIDR 10.0.0.0/8). Then the `FLOATING_START`, `FLOATING_END`, and `FLOATING_CIDR` cannot be anything in the form of 10.x.y.z.  The address range of the default private network isdefined by the variable OVERCLOUD_FIXED_RANGE_CIDR.

		- The overcloud neutron external network (ext-net) assumes the gateway IP is the lowest non-zero host IP address in the FLOATING_CIDR range.

	* `OVERCLOUD_VIRTUAL_INTERFACE` - Use this variable to set the interface that the overcloud virtual IP (used for accessing API services) will be assigned to. This is required.

		The interface must exist on the two overcloud controller nodes and the overcloud management controller node.

		To set this variable:

			export OVERCLOUD_VIRTUAL_INTERFACE=eth0

	* **OPTIONAL**: You can optionally configure a second network for API traffic and for the floating IP pool by setting `OVERCLOUD_NeutronPublicInterface` to a physically configured VLAN. For example:

			export OVERCLOUD_NeutronPublicInterface=vlan101
			export NeutronPublicInterfaceIP=192.0.8.2/21
			export NeutronPublicInterfaceRawDevice=eth0
			export NeutronPublicInterfaceDefaultRoute=192.0.8.1
			export FLOATING_START=192.0.8.20
			export FLOATING_END=192.0.15.254
			export FLOATING_CIDR=192.0.8.0/21

	* `OVERCLOUD_COMPUTESCALE` - Use this variable to set the number overcloud compute nodes to deploy. 
	
		If you do not specify a value, the value is derived based on the number of lines remaining in the `baremetal.csv` file once the undercloud, overcloud control, and overcloud swift nodes are removed.

		To set this variable:

			export OVERCLOUD_COMPUTESCALE=3

	* `OVERCLOUD_CINDER_LVMLOOPDEVSIZE` - This is the size of the loopback device on your partition on the overcloud control node used to hold Cinder volumes, and it is set by default to 50000 MB. You can set it to a higher value if, for example, you plan to create snapshots of large bootable volumes. The partition is a shared device, so the loopback device should not occupy the entire partition. The partition size is calculated as (approximately) `diskspace` from the baremetal.csv file minus the root partition size of 30 GB.

		To set this variable: 

			export OVERCLOUD_CINDER_LVMLOOPDEVSIZE=50000

	* `OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID` - HP Helion OpenStack Community  uses keepalived to manage virtual IPs. keepalived uses a unique id to synchronise its activities. If you plan to run multiple installations of HP Helion OpenStack Community edition on the same network, each installation must be configured with a unique id by setting the environment variable `OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID` to a unique number (from 0 to 255) before running the installation. The default value, if unset, is 51.

		To set this variable: 

			export OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID=99

7. By [default](#NetworkDefault), the bridge interface, the seed VM IP address, and the gateway host are configured during the installation process. To change any or all of those configurations, complete the following steps:
 

	* **OPTIONAL:** Change the IP address range to administer undercloud nodes by entering the starting and ending IP addresses for the range, for example:
  
			export BM_NETWORK_SEED_RANGE_START=192.168.10.2`
			export BM_NETWORK_SEED_RANGE_END=192.168.10.20`

		This IP address range must be on the same subnet as the Seed VM, as configured in [Changing the Default Network Interface](#NetworkInt).

	* **OPTIONAL:** Change the IP address range to administer overcloud nodes from the undercloud by entering the starting and ending IP addresses for the range, for example:
  
			export BM_NETWORK_UNDERCLOUD_RANGE_START=192.168.10.2`
			export BM_NETWORK_UNDERCLOUD_RANGE_END=192.168.10.20`

		This IP address range must be on the same subnet as the Seed VM, as configured in [Changing the Default Network Interface](#NetworkInt).

	* **OPTIONAL**: If you modified the gateway host, execute:

			export BM_NETWORK_GATEWAY=192.168.10.254`

	* **OPTIONAL**: Modify the IP address range for the private network assigned by default to each virtual instance in the overcloud, for example:

			export OVERCLOUD_FIXED_RANGE_CIDR=10.20.240.0/20`

	* **OPTIONAL**: `OVERCLOUD_NEUTRON_DVR` - Use this variable to disable Distributed Virtual Routers (DVR). By default, the overcloud is configured for Distributed Virtual Routers. You can disable DVR by setting the value to 'False'.

		**Example:**

			export OVERCLOUD_NEUTRON_DVR=False


8. From `/root`, install and configure the undercloud and overcloud by running the following command. 

	`bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh`

10. When the deployment completes, a message displays asking you to submit information on the install to HP. Enter Y to submit or any other key to not submit.


	When the deployment completes, message similar to the following is displayed:

		"HP - completed - Wed Oct 23 16:20:20 UTC 2014"

## Next Step

Verify that the installation completed successfully by connecting to the demo VM, Horizon dashboard and the monitoring interface. See [Verifying your installation](/helion/community/verify/).




<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;">Return to Top &#8593; </a>

----
