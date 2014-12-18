---
layout: default
title: "HP Helion OpenStack&#174; Community Virtual Installation and Configuration"
permalink: /helion/community/install-virtual/
product: community

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/community/install/">&#9664; PREV</a> | <a href="/helion/community/install-overview/">&#9650; UP</a> | <a href="/helion/community/">NEXT &#9654;</a> </p>
-->

# HP Helion OpenStack&#174; Community Virtual Installation and Configuration

This page provides instructions on how to perform a virtual installation of HP Helion OpenStack Community onto a suitably specified and prepared single server. This cloud-in-a-box is designed to let you test the functionality of HP Helion OpenStack Community. It is not intended to be used in a production environment to run real workloads; therefore, no support is available. 

It is important to read through this page before starting your installation. Before you begin your installation, we recommend you review the complete [Hardware and Software Requirements](/helion/community/hwsw-requirements/) page. Note, however, that we have included the basic requirements on this page.

* [Installation requirements](#hardware-and-network-requirements)

	* [Hardware requirements](#hardware)
	* [Software requirements](#software)

* [Before you begin](#before-you-begin)

* [About the installation process](#install-notes)

* [Installing HP Helion OpenStack Community](#install)

	* [Downloading and unpacking installation file](#getinstall)
	* [Starting the seed VM](#startvm)
	* [Starting the undercloud, overcloud and test guest VM](#startclouds)

## Installation requirements {#hardware-and-network-requirements}

Before starting the installation, make sure your hardware and software the minimum requirements and are properly configured.

### Hardware and system requirements {#virtual}
TripleO creates several large VMs as part of this virtual deployment process, make sure you meet the hardware requirements described in [Community Hardware and Software Requirements](/helion/community/hwsw-requirements/).

### Software requirements {#software}

To ensure a successful installation, you must meet the software requirements described in the [Software configuration](/helion/community/hwsw-requirements/#software) section in Community Hardware and Software Requirements.

## Before you begin

Before you begin the installation process, ensure you have read the following and completed any required tasks:

* [Obtaining a public key](#pub-key)
* [Set DNS servers by default](#name-resolution)
* [About the installation process](#install-notes)

### Obtain a public key ### {#pub-key}

Before you begin the installation process, the root user must have private and public RSA keys. You can determine this by issuing the following commands:
 
1. Log in as root:
    
    	sudo su -

2. Determine if .ssh/id_rsa exists:
    
    	ls -l ~root/.ssh/id_rsa

	NOTE: The output should look like the example below:

		-rw------- 1 root root 1679 Oct 23 09:24 /root/.ssh/id_rsa

3. If the key does not exist, create one, omitting a passphrase and accepting the defaults by pressing Enter:

		ssh-keygen -t rsa

### Set DNS servers by default {#name-resolution}

After the installation, you can specify DNS servers on a per-subnet basis using the neutron subnet-create --dns-nameserver command.

Before installing, it is necessary to configure the DNS servers that will be used by dnsmasq as forwarders. Refer to [Enabling name resolution from tenant VMs in the overcloud](/helion/community/name-resolution/)for instructions.

## About the installation process ### {#install-notes}

There are a few things you should be aware of before you begin your HP Helion OpenStack Community virtual installation.

* The install will run until the demo completes loading the demo VM.

* There are stalls loading images (1-2 mins) and building the undercloud (12 or more mins) and overcloud (at least that again). You can use a tool such as [Virtual Machine Manager](http://virt-manager.org/) to monitor the installation of the nodes.

* There are no restrictions imposed on external device name on the host system in virtual mode as the external interface is not used.

* Filesystem checking on reboot is disabled by default for the seed, undercloud and overcloud nodes. We recommend periodically manually running fsck to verify filesystem integrity.


## Installing HP Helion OpenStack Community ## {#install}

Once you have met all of the hardware requirements and have completed the required tasks, you can begin your installation.

In the event you have trouble with the installation, review the [Issues and troubleshooting](/helion/community/troubleshooting/) and [FAQ](/helion/community/faq/) pages.

### Unpacking the installation file ## {#getinstall}

The virtual installation of HP Helion OpenStack Community for a single server is provided as a compressed TAR file. This is a large file because it contains all of the machine images required for the seed VM, the undercloud, the overcloud, and a guest VM image.

**Note:** This install file does not fit on a memory stick formatted as FAT32. If you are planning to store the installation files on removable media, use something like NTFS.

To begin the installation:

1. Log in to your system as root. 

    	sudo su -

2. Register and then log in to download the HP Helion OpenStack Community virtual package from this site:

	[HP Helion OpenStack Community Edition Installation Package](https://helion.hpwsportal.com/#/Product/%7B%22productId%22%3A%221320%22%7D/Show)

	The download file is named: `Helion_Openstack_Community_V1.4.tar.gz`

3. In the root user's home directory, create the `work` directory and extract the installation software to the `work` directory:

		mkdir work
		cd /work
		tar zxvf /{full path to downloaded file from step 2}/Helion_Openstack_Community_V1.4.tar.gz

This creates and populates a `tripleo/` directory within the **root/work/** directory.


### Starting the seed VM ### {#startvm}

Start the seed VM using the following command:

	HP_VM_MODE=y bash -x ~root/work/tripleo/tripleo-incubator/scripts/hp_ced_host_manager.sh --create-seed

The process of starting the seed takes approximately ten minutes, depending on the capabilities of your system, and there are numerous logging messages generated by the script. The first time the script is run, it checks for and attempts to install any missing required packages, as described in [Software configuration](/helion/community/hwsw-requirements/#software) section in Community Hardware and Software Requirements. If you are prompted, accept all package installations.

When the seed VM install completes, a message similar to the following is displayed:

	Wed Oct 23 11:25:10 UTC 2014 --- completed setup seed

**Note:** The seed VM continues its self-initialization after the startup script has terminated. 

### Starting the undercloud, overcloud, and test guest VM ### {#startclouds}

This section explains how to deploy and configure the undercloud and overcloud, and to start a demo VM in the overcloud compute node.

1. Log in to the seed VM; it might take a few moments for the VM to become reachable:

		ssh 192.0.2.1

2. Set the following environment variables:

	`OVERCLOUD_NTP_SERVER` - Use this variable to set the IP address of an NTP server accessible on the public interface for overcloud hosts. Determine the time server that works best based on your environment. The NTP server can be on the local system, if needed.

	**Example:**

	The following example sets the NTP server address. Do not copy this adddress. 

		export OVERCLOUD_NTP_SERVER=192.0.1.128

	`UNDERCLOUD_NTP_SERVER` - Use this variable to set the IP address of an NTP server accessible on the public interface for undercloud hosts. Determine the time server that works best based on your environment. The NTP server can be on the local system, if needed.

	**Example:**

	The following example sets the NTP server address. Do not copy this adddress. 

		export UNDERCLOUD_NTP_SERVER=192.0.1.128

	`OVERCLOUD_NEUTRON_DVR` - Use this variable to disable Distributed Virtual Routers (DVR). By default, the overcloud is configured for Distributed Virtual Routers. If your network requires DVR disabled, you can disable DVR by setting the value to 'False'.

	**Example:**

		export OVERCLOUD_NEUTRON_DVR=False

	**Note:** The environment variable `NeutronPublicInterfaceIP` is no longer supported. The install will exit with an error message if this variable is set.

3. Start the deployment of the undercloud and overcloud from the root directory using the following command:

		bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh

	This script waits, if necessary, for the seed to complete its initialization. Then, it creates, images, and starts the VMs for the undercloud and overcloud, as well as create a test guest VM in the overcloud. This takes approximately 60 minutes and includes pauses while services and VMs are set up in the background.

4. When the deployment completes, a message displays asking you to submit information on the install to HP. Enter `Y` to submit or any other key to not submit.

5. The installer lists several IP addresses of various HP Helion OpenStack components. Make note of the following IP addresses for use when verifying the install:

		OVERCLOUD_IP_ADDRESS
		UNDERCLOUD_IP_ADDRESS


## Next Step

Verify that the installation completed successfully by connecting to the demo VM, Horizon dashboard and the monitoring interface. See [Verifying your installation](/helion/community/verify/).


 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----

