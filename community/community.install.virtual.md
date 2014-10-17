---
layout: default
title: "HP Helion OpenStack&#174; Community Virtual Installation and Configuration"
permalink: /helion/community/install-virtual/
product: community

---
<!--PUBLISHED-->


<p style="font-size: small;"> <a href="/helion/community/install/">&#9664; PREV</a> | <a href="/helion/community/install-overview/">&#9650; UP</a> | <a href="/helion/community/">NEXT &#9654;</a> </p>

# HP Helion OpenStack&trade; Community Virtual Installation and Configuration

This page provides instructions on how to perform a virtual installation of HP Helion OpenStack Community onto a suitably specified and prepared single server. This cloud-in-a-box is designed to let you test the functionality of HP Helion OpenStack Community. It is not intended to be used in a production environment to run real workloads; therefore, no support is available. 

It is important to read through this page before starting your installation. Before you begin your installation, we recommend you review the complete [Hardware and Software Requirements](/helion/community/hwsw-requirements/) page. Note, however, that we have included the basic requirements on this page.


* [Overview](#overview)

* [Hardware and system requirements](#virtual)

	* [Software requirements](#software-requirements)

* [Before you begin](#before-you-begin)

* [Installing HP Helion OpenStack Community](#install)

	* [Downloading and unpacking installation file](#getinstall)

	* [Starting the seed VM](#startvm)

	* [Starting the undercloud, overcloud and test guest VM](#startclouds)

* [Verifying your installation](#verifying-your-installation)

	* [Connecting to test guest VM](#connectvm)

	* [Connecting to Horizon console](#connectconsole)

	* [Connecting remotely to Horizon console](#remoteconnect)

* [Enable name resolution from tenant VMs in the overcloud](#dnsmasq)

* [Issues and troubleshooting](#troubleshooting)

## Overview

<p>HP Helion OpenStack Community is installed using <a href ="https://wiki.openstack.org/wiki/TripleO">TripleO</a> which uses three linked installation phases to deploy a complete OpenStack cloud. In this virtual installation, TripleO simulates the deployment of OpenStack by creating and configuring a set of virtual machines (VMs) that play the roles that baremetal machines would in a non-cloud deployment.</p> 

* Seed &mdash; The seed VM is started as a VM from a specific seed VM image. It contains a number of self-contained OpenStack components that are used to deploy the undercloud. The seed deploys the undercloud by using the HP Ironic service to deploy a specific undercloud machine image.

* Undercloud &mdash; In a typical HP Helion OpenStack Community deployment, the undercloud is a baremetal server, but in this preview deployment the undercloud is simulated as a VM. The undercloud is a complete OpenStack installation, which is then used to deploy the overcloud.

* Overcloud<a name="overcloud"></a> &mdash; The overcloud is the end-user OpenStack cloud. In a typical HP Helion OpenStack Community deployment, the overcloud comprises several baremetal servers. In this virtual deployment, the overcloud comprises 6 nodes:

    * 3 overcloud controllers (2 controllers and 1 management controller)
    * 2 overcloud Object operation (Swift) nodes
    * 1 overcloud Compute (Nova) node

	Two of the overcloud controllers provide for high availability failover. You can use the **Icinga Dashboard** as described in [Using the Icinga Service](/helion/openstack/services/icinga/).

**Important:** When installing make sure there is no wildcard DHCP server on your network. The wildcard DHCP server will likely reply to the booting under/overcloud servers before the seed VM, which will cause the PXE boot process to fail.


## Hardware and system requirements {#virtual}
TripleO creates several large VMs as part of this virtual deployment process, so you must use a system that meets or exceeds the following hardware requirements:

* At least 64GB of RAM
* At least 200GB of available disk space
* Virtualization support **enabled** in the BIOS
* The Ubuntu 13.10 operating system installed


### Software requirements
The following Debian/Ubuntu packages are required:

* qemu
* openvswitch
* libvirt
* python-libvirt
* openssh-server

**Note:** Make sure that the firewall configuration allows access to the SSH ports.

Even though these packages are added to the system if they are not already installed, before starting the installation, first install the following required Debian/Ubuntu packages on the system running the installer:

    $ sudo apt-get install -y libvirt-bin openvswitch-switch python-libvirt qemu-system-x86 qemu-kvm openssh-server

After you install the `libvirt` packages, you must reboot or restart `libvirt`:

    $ sudo /etc/init.d/libvirt-bin restart

## Before you begin

Before you begin the installation process, the root user must have private and public RSA keys. You can determine this by issuing the following commands:
 
1. Log in as root:
    
    	$ sudo su -

2. Determine if .ssh/id_rsa exists:
    
    	# ls ~root/.ssh/id_rsa

NOTE: The output should look like the example below:

     	drwxr-x--- . 4096 May 11 09:23
    	-rwxr-x--- ..4096 May 11 09:23
    	-rwxr-x--- id_rsa1455 May 11 09:24
    	-rwxr-x--- id_rsa.pub 1455 May 11 09:24

3. If the key does not exist, create one, omitting a passphrase and accepting the defaults by pressing Enter:

		# ssh-keygen -t rsa -N

**Note:** Filesystem checking on reboot is disabled by default for the seed, undercloud and overcloud nodes. We recommend periodically manually running fsck to verify filesystem integrity.

## Installing HP Helion OpenStack Community ## {#install}

### Unpacking the installation file ## {#getinstall}

The virtual installation of HP Helion OpenStack Community for a single server is provided as a compressed TAR file. This is a large file because it contains all of the machine images required for the seed VM, the undercloud, the overcloud, and a guest VM image.

You can register and download the package from the following URL:

[HP Helion OpenStack Community Edition Installation Package](https://helion.hpwsportal.com/#/Product/%7B%22productId%22%3A%221320%22%7D/Show)

**Note:** This install file is approximately 4GB and does not fit on a memory stick formatted as FAT32. If you are planning to store the installation files on removable media, use something like NTFS.

To begin the installation:

1. Log in to your system as root. 

    	$ sudo su -

2. Register and then log in to download the HP Helion OpenStack Community virtual package from this site:

	[HP Helion OpenStack Community Edition Installation Package](https://helion.hpwsportal.com/#/Product/%7B%22productId%22%3A%221320%22%7D/Show)

	The download file is named: `ce_installer.gz`

3. In the root user's home directory, create the `work` directory and extract the installation software to the `work` directory:

		mkdir work
		cd /work
		tar zxvf /{full path to downloaded file from step 2}/ce_installer.gz

This creates and populates a `tripleo/` directory within root's home directory.


### Starting the seed VM ### {#startvm}

Start the seed VM using the following command:

		HP_VM_MODE=y bash -x ~root/tripleo/tripleo-incubator/scripts/hp_ced_host_manager.sh --create seed

The process of starting the seed takes approximately ten minutes, depending on the capabilities of your system, and there are numerous logging messages generated by the script. The first time the script is run, it checks for and attempts to install any missing required packages, as described in [System requirements](#system-requirements). If you are prompted, accept all package installations.

When the seed VM install completes, a message similar to the following is displayed:

	Wed Oct 23 11:25:10 UTC 2014 --- completed setup seed

**Note:** The seed VM continues its self-initialization after the startup script has terminated. 

### Starting the undercloud, overcloud, and test guest VM ### {#startclouds}

This section explains how to deploy and configure the undercloud and overcloud, and to start a demo VM in the overcloud compute node.

1. Log in to the seed VM; it might take a few moments for the VM to become reachable:

		ssh 192.0.2.1

2. Set the following environment variables:

	`OVERCLOUD_NTP_SERVER` - Use this variable to set the IP address of an NTP server accessible on the public interface for overcloud hosts.

	**Example:**

		export OVERCLOUD_NTP_SERVER=192.0.1.128

	`UNDERCLOUD_NTP_SERVER` - Use this variable to set the IP address of an NTP server accessible on the public interface for undercloud hosts.

	**Example:**

		export OVERCLOUD_NTP_SERVER=192.0.1.128

	`OVERCLOUD_NEUTRON_DVR` - Use this variable to disable Distributed Virtual Routers (DVR). By default, the overcloud is configured for Distributed Virtual Routers. You can disable DVR by setting the value to 'False'.

	**Example:**

		export OVERCLOUD_NEUTRON_DVR=False

	**Note:** The environment variable `NeutronPublicInterfaceIP` is no longer supported. The install will exit with an error message if this variable is set.

3. Start the deployment of the undercloud and overcloud:

		cd /root
		bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh

	This script waits, if necessary, for the seed to complete its initialization. Then, it creates, images, and starts the VMs for the undercloud and overcloud, as well as create a test guest VM in the overcloud. This takes approximately 10 minutes and includes pauses while services and VMs are set up in the background.

	When the deployment completes, a message similar to the following is displayed:

		HP - completed -Wed Oct 23 16:20:02 UTC 2014


## Verifying your installation

From within the seed cloud host, you should be able to connect to the test guest or demo VM created.

### Connecting to test guest VM ### {#connectvm}

From the seed cloud host, you can connect to the demo VM using the following steps:

1. Export the overcloud passwords:

	`. /root/tripleo/tripleo-overcloud-passwords`

2. Export the overcloud users:

	`TE_DATAFILE=/root/tripleo/ce_env.json . /root/tripleo/tripleo-incubator/overcloudrc-user`

3. Verify you can view the nova instances:

	`nova list`

4. Assign the demo VM IP address to a variable:

	`DEMO_IP=$(nova list | grep " demo " | awk ' { print $13 } ')`

5. Connect to the demo vm:

	`ssh debian@${DEMO_IP}`

**Note:** It may take a few minutes for the demo vm to become reachable after the installation is complete. The install runs until the demo VM is loaded.

### Connecting to the Horizon console ### {#connectconsole}

From the seed cloud host, connect to the overcloud Horizon console.

1. Obtain the passwords for the `demo` from `/root/tripleo/tripleo-overcloud-passwords`.

2. Point your web browser on the seed cloud host to the overcloud Horizon console:

		http://192.0.2.24

	If you did not retrieve the overcloud IP from the end of the install, enter the following command:

		. /root/tripleo/tripleo-undercloud-passwords
		TE_DATAFILE=/root/tripleo/ce_env.json . /root/tripleo/tripleo-incubator/undercloudrc
		OVERCLOUD_IP=$(heat output-show overcloud KeystoneURL | cut -d: -f2 | sed s,/,,g )
		echo $OVERCLOUD_IP

4. Log in as `demo` or `admin` using the corresponding passwords obtained in step 1.

### Connecting to the monitoring interface ### {#connectmonitor}

HP Helion OpenStack Community includes a monitoring interface. You can access this with the following steps:

1. Point your web browser on the seed cloud host to the undercloud monitoring console:

		http://192.0.2.2

	If you did not retrieve the overcloud IP from the end of the install, enter the following command:

		. /root/stackrc
		UNDERCLOUD_IP=$(nova list | grep "undercloud" | awk ' { print $12 } ' | sed s/ctlplane=// )
		echo $UNDERCLOUD_IP

2. Login as user `icingaadmin` with password `icingaadmin`.

## Issues and troubleshooting {#troubleshooting}

* The install will run until the demo completes loading the demo VM.
* There are stalls loading images (1-2 mins) and building the undercloud (12 or more mins) and overcloud (at least that again).
* If the `hp_ced_host_manager` fails to start the seed run the command again.
* There are no restrictions imposed on external device name on the host system in virtual mode as the external interface is not used.
* The installer now includes an interactive query before running a hardware census script at the end of the install. This script is optional.
* ElasticSearch indexes are not deleted automatically. Log data will build up over time, potentially filling the space available, unless managed. To see the indexes, SSH to the undercloud node and run:

		curl "localhost:9200/_cat/indices?v"

	To remove indexes, run the following command on the undercloud node:

		curl -XDELETE "localhost:9200/logstash-<DATE>"

	where <DATE> is in the format `YYYY.MM.DD`"; for example: `2014.09.09`.



## Enable name resolution from tenant VMs in the overcloud {#dnsmasq}

To enable name resolution from tenant VMs in the overcloud, it is necessary to configure the DNS servers which will be used by `dnsmasq`.

Edit the `overcloud_neutron_dhcp_agent.json file` in the `ce-installer/tripleo/hp_passthrough` directory to add the desired `dnsmasq_dns_servers`
items.  

The `overcloud_neutron_dhcp_agent.json` file should also be copied over to a new file named `undercloud_neutron_dhcp_agent.json` to configure the same forwarders for the undercloud.

Use the following commands:

	{"dhcp_agent":
		{"config":
			[
				{"section":"DEFAULT",
					"values":
						[
							{"option":"dhcp_delete_namespaces","value":"True"},
							{"option":"dnsmasq_dns_servers", "value":"0.0.0.0"}
						]
					}
				]
			}
		}

Where `value` is the IP address of the DNS server to use.  Multiple DNS servers can be specified as a comma separated list.

 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

