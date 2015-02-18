---
layout: default
title: "HP Helion OpenStack&#174; Community Virtual Installation and Configuration"
permalink: /helion/community/install-virtual-old/
product: community

---
<!--PUBLISHED-->


<p style="font-size: small;"> <a href="/helion/community/install/">&#9664; PREV</a> | <a href="/helion/community/install-overview/">&#9650; UP</a> | <a href="/helion/community/">NEXT &#9654;</a> </p>

# HP Helion OpenStack&reg; 1.0 Community Virtual Installation and Configuration

<!--meaningless change to fix merge issue -->

This page provides instructions on how to perform a virtual installation of HP Helion OpenStack Community onto a suitably specified and prepared single server. This cloud-in-a-box is designed to let you test the functionality of HP Helion OpenStack Community. It is not intended to be used in a production environment to run real workloads, and therefore no support is available. 

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

* [Issues and troubleshooting](#troubleshooting)

## Overview

<p>HP Helion OpenStack Community is installed using <a href ="https://wiki.openstack.org/wiki/TripleO">TripleO</a> which uses three linked installation phases to deploy a complete OpenStack cloud. In this virtual installation, TripleO simulates the deployment of OpenStack by creating and configuring a set of virtual machines (VMs) that play the roles that baremetal machines would in a real deployment.</p> <!-- , as shown in the <a href="javascript:window.open('/content/documentation/media/community.install.deployment.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack Community deployment diagram</a>.</p> -->

* Seed &mdash; The seed VM is started as a VM from a specific seed VM image. It contains a number of self-contained OpenStack components that are used to deploy the undercloud. The seed deploys the undercloud by using the HP Ironic service to deploy a specific undercloud machine image.

* Undercloud &mdash; In a typical HP Helion OpenStack Community deployment, the undercloud is a baremetal server, but in this preview deployment the undercloud is simulated as a VM. The undercloud is a complete OpenStack installation, which is then used to deploy the overcloud.

* Overcloud &mdash; The overcloud is the end-user OpenStack cloud. In a typical HP Helion OpenStack Community deployment, the overcloud comprises several baremetal servers. In this virtual deployment, the overcloud comprises 4 nodes:

    * 1 overcloud controller
    * 2 overcloud Object operation (Swift) nodes
    * 1 overcloud Compute (Nova) node


## Hardware and system requirements {#virtual}
TripleO creates several large VMs as part of this virtual deployment process, so you must use a system that meets or exceeds the following hardware requirements:

* At least 48GB of RAM
* At least 200GB of available disk space
* Virtualization support **enabled** in the BIOS
* One of the following operating systems installed:

    * Ubuntu 13.10
    * Ubuntu 14.04

### Software requirements
The following Debian/Ubuntu packages are required:

* qemu
* openvswitch
* libvirt
* python-libvirt
* openssh-server

**Note:** Ensure that the firewall configuration allows access to the ssh ports.

Even though these packages are added to the system if they are not already installed, we recommend you install them beforehand using the following command:

  `$ sudo apt-get install -y libvirt-bin openvswitch-switch python-libvirt qemu-system-x86 qemu-kvm openssh-server`

After you install the `libvirt` packages, you must reboot or restart `libvirt`:

    $ sudo /etc/init.d/libvirt-bin restart

## Before you begin
Before you begin the installation process, the user root must have a public key, for example:

    `/root/.ssh/id_rsa`
    `/root/.ssh/id_rsa.pub`

If you do not have a public key, you can create one as follows:
 
1. Login as root:

    `$ sudo su -`

2. Determine if .ssh/id_rsa exists:

    `# ls ~root/.ssh/id_rsa`

3. If the key does not exist, create one, omitting a passphrase and accepting the defaults by pressing Enter:

    `# ssh-keygen -t rsa`


Additionally, to enable full VM functionality, install the required `qemu-kvm` package using the following command:
    `sudo apt-get install -y qemu-kvm`

**Note:** On Ubuntu 14.04, you must also install qemu-kvm before starting the seed.

## Installing HP Helion OpenStack Community ## {#install}

### Unpacking the installation file ## {#getinstall}

The virtual installation of HP Helion OpenStack Community for a single server is provided as a compressed tar file. This is a large file because it contains all of the machine images required for the seed VM, the undercloud, the overcloud, and a guest VM image.

You can register and download the package from the following URL:

[HP Helion OpenStack Community edition Installation Package](https://helion.hpwsportal.com/#/Product/%7B%22productId%22%3A%221320%22%7D/Show)

**Note:** This install file is approximately 4GB and does not fit on a memory stick formatted as FAT32. If you are planning to store the installation files on removable media, use something like NTFS.

To begin the installation:

1. Log in to your system as root. 

	sudo su -

2. Register and then log in to download the HP Helion OpenStack Community virtual package from this site:

	[HP Helion OpenStack Community edition Installation Package ](https://helion.hpwsportal.com/#/Product/%7B%22productId%22%3A%221320%22%7D/Show)

	The download file is named Helion_Openstack_Community.tar.gz.

3. Create a directory named `work`:

	`mkdir /root/work`

	`cd /root/work`

4.  Extract the kit to the `work` directory:

	`tar zxvf /root/Helion_Openstack_Community.tar.gz`

This creates and populates a `tripleo/` directory within root's home directory.


### Starting the seed VM ### {#startvm}

Start the seed VM using the following command:

  `# HP_VM_MODE=y bash -x ~root/tripleo/tripleo-incubator/scripts/hp_ced_start_seed.sh`

The process of starting the seed takes approximately ten minutes, depending on the capabilities of your system, and there are numerous logging messages generated by the script. The first time the script is run, it checks for and attempts to install any missing required packages, as described in [System requirements](#system-requirements). If you are prompted, accept all package installations.

If the seed VM is successful, a message similar to the following is displayed:

    Wed Apr 23 11:25:10 UTC 2014 --- completed setup seed

**Note:** The seed VM continues its self-initialization after the startup script has terminated. 

### Starting the undercloud, overcloud, and test guest VM ### {#startclouds}

This section explains to you how to deploy and configure the undercloud and overcloud, and to start a test guest VM in the overcloud compute node.

1. Log in to the seed VM; it might take a few moments for the VM to become reachable:

        # ssh 192.0.2.1

2. Type `yes` to allow the ssh connection to proceed when prompted for host authentication.

3. Start the deployment of the undercloud and overcloud:

      `root@hLinux:~# bash -x ~root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh`

     This script waits, if necessary, for the seed to complete its initialization. Then, it creates, images, and starts the VMs for the undercloud and overcloud, as well as create a test guest VM in the overcloud. This takes approximately 10 minutes and includes two pauses while services and VMs are set up in the background.

4. If the deployment completes successfully, a message similar to the following is displayed:

        HP - completed -Wed May 07 16:20:02 UTC 2014

<!--Verify that the seed has completed its self-initialization by confirming that no further logging messages are being appended to the `os-collect-config` log:

    root@hLinux:~# tail -f /var/log/upstart/os-collect-config.log

If the initialization process has completed, it will usually be indicated by a concluding log entry like:

    [2014-04-23 11:38:52,892] (os-refresh-config) [INFO] Completed phase migration

You can then break out of the tail command using CTRL-C.-->


## Verifying your installation

### Connecting to test guest VM ### {#connectvm}

If the installation is successful, you will see a message similar to:

	"HP - completed - Tue Apr 22 16:20:20 UTC 2014"

From within the seed VM, you should be able to connect to the test guest or demo VM created.

**Note** It may take a few minutes for the demo vm to become sshable after finishing installation. The install will run until the demo completes loading the demo VM.

1. Set up your environment to access the overcloud, and list the running instances:

        root@hLinux:~# source ~root/tripleo/tripleo-overcloud-passwords
        root@hLinux:~# TE_DATAFILE=tripleo/testenv.json
        root@hLinux:~# source ~root/tripleo/tripleo-incubator/overcloudrc-user
        root@hLinux:~# nova list

    Ensure you note the IP address of the demo VM from the output of 'nova list' command. 

2. Of the two IP addresses shown for each instance, use the `192.x.x.x` IP address to ping the VM:

        root@hLinux:~# ping <ip of demo vm>

3. Verify you can ssh into the VM:

        root@hLinux:~# ssh root@<ip of demo vm>

### Connecting to the Horizon console ### {#connectconsole}

From the physical system you are running the install on, you should be able to connect to the overcloud Horizon console.

1. From within the seed VM, set your environment to access the undercloud, then list the overcloud instances and find the IP address of the overcloud controller node:

        root@hLinux:~# source ~root/tripleo/tripleo-undercloud-passwords
        root@hLinux:~# TE_DATAFILE=tripleo/testenv.json
        root@hLinux:~# source ~root/tripleo/tripleo-incubator/undercloudrc
        root@hLinux:~# nova list

    Ensure you note the IP address of the 'overcloud-controller' node in the output from 'nova list' command. 

2. Obtain the passwords for the `demo` and `admin` users:

      `root@hLinux:~# grep OVERCLOUD_DEMO_PASSWORD ~root/tripleo/tripleo-overcloud-passwords`
      `root@hLinux:~# grep OVERCLOUD_ADMIN_PASSWORD ~root/tripleo/tripleo-overcloud-passwords`

3. Point your web browser on the physical host system to the overcloud Horizon console:

        http://<IP of overcloud controller>

4. Log in as `demo` or `admin` using the corresponding passwords obtained in step 2.hp_ced_start_seed.sh

**Note:** If you cannot connect to the Horizon console, check your proxy settings to make sure access to the controller VM is not being unsuccessfully redirected through a proxy.

### Connecting remotely to the Horizon console ### {#remoteconnect}

For remote system installations where you cannot open a browser on the remote system, you can ssh tunnel from a local system to your remote one. This requires ssh access from the local system to the remote system. 

1. Establish the tunnel by issuing the command below on the local system:

      `$ ssh -L 9999:<IP of overcloud controller>:80 <hostname or IP of remote system>`

2. Point the web browser of the local system to the link below:

        http://localhost:9999

3. Use the user names and passwords obtained in the [Connecting to the Horizon console](#connectconsole) section to access the console.

## Issues and troubleshooting {#troubleshooting}

* If the `hp_ced_start_seed` script fails to start the seed, run the script again.

* There are stalls loading images (1-2 mins) and building the undercloud (12 or more mins) and overcloud.

* NEVER run hp_ced_start_seed.sh WITHOUT HP_VM_MODE=y or you may need to reboot as it resets your networking for baremetal.

* The installer script will wait for os-collect-config to complete on the seed, but will time out after 10 minutes of waiting.

* The virtual installation does not persist across system reboots. When you reboot your system, be sure to start a new VM installation.

* There are no restrictions imposed on external device name on the host system in virtual mode as the external interface is not used.

* For best performance, cleanup any VMs using excess space using the following commands: 
    * Delete the KVM VMs and their storage volumes using `virsh` commands.
    * Delete `/var/lib/libvirt/images/`.
    * Uninstall any packages that you no longer require.

* To avoid an `unsupported locale setting` error when issuing Neutron commands from within the seed VM, set the following environment variable:

        export LANG=C

 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----

