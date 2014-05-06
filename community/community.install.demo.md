---
layout: default
title: "HP Helion OpenStack Community Installation and Configuration"
permalink: /cloudos/community/install-virtual/
product: community

---


<p style="font-size: small;"> <a href="/cloudos/community/">&#9664; PREV</a> | <a href="/cloudos/community/">&#9650; UP</a> | <a href="/cloudos/community/">NEXT &#9654;</a> </p>

# HP Helion OpenStack&reg; Community Installation and Configuration

This document provides instructions on how to install the HP Helion OpenStack Community edition preview onto a suitably specified and prepared single-node system. Note that this is an early phase demonstration of functionality and is only intended to give an impression of the installation process and of the overall structure of a deployed HP Helion OpenStack Community system. The demonstrated functionality is nearly identical to the virtualized test environments that the engineering team uses in its automated QA pipeline for basic functional testing.

The following topics explain how to install and configure HP Helion OpenStack Community edition preview. It is important to read through these topics before starting your installation.

* [Overview](#overview)

* [Prerequisites](#prerequisites)

   * [Hardware requirements](#hardware-requirements)

   * [System preparation](#system-preparation)

* [Installing your preview edition](#install)

   * [Downloading and unpacking installation file](#getinstall)

   * [Starting the seed VM](#startvm)

   * [Starting the undercloud, overcloud and test guest VM](#startclouds)

* [Verifying your installation](#verifying-your-installation)

   * [Connecting to test guest VM](#connectvm)

   * [Connecting to Horizon console](#connectconsole)

   * [Connecting remotely to Horizon console](#remoteconnect)

* [Troubleshooting](#troubleshooting)

## Overview

<p>HP Helion OpenStack Community is installed using <a href ="https://wiki.openstack.org/wiki/TripleO">TripleO</a>
which uses three linked installation phases to deploy a complete OpenStack cloud. In this preview installation, TripleO simulates the deployment of OpenStack by creating and configuring a set of VMs that play the roles that baremetal machines would in a real deployment, as shown in the <a href="javascript:window.open('/content/documentation/media/community.install.deployment.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack Community deployment diagram</a>.</p>

* Seed &mdash; The seed VM is started as a VM from a specific seed VM image. It contains a number of self-contained OpenStack components that are used to deploy the undercloud. The seed deploys the undercloud by using Nova baremetal to deploy a specific undercloud machine image.

* Undercloud &mdash; In a typical HP Helion OpenStack Community deployment, the undercloud is a baremetal server, but in this preview deployment the undercloud is simulated as a VM. The undercloud is a complete OpenStack installation, which is then used to deploy the overcloud.

* Overcloud &mdash; The overcloud is the end-user OpenStack cloud. In a typical HP Helion OpenStack Community deployment, the overcloud comprises several baremetal servers. In this preview deployment, the overcloud is simulated as two VMs:

    * One contains all of the control plane and management elements (the controller VM)
    * The other behaves as a single compute node (the compute VM)

    Each VM is deployed from a specific machine image.

## Prerequisites
You must meet the following hardware and system requirements.

### Hardware requirements

TripleO creates several large VMs as part of the preview deployment process, so you must use a system that meets or exceeds the following hardware specification:

* At least 16 GB of RAM
* At least 200 GB of available disk space
* Virtualization support that is **enabled** in the BIOS

### System requirements

Your system must meet the following requirements:

* You must have an Ubuntu 13.10 or 14.04 host operating system installed. Other host operating systems might work but have not been tested. Also, this system will **not** currently install within a virtual machine.

* The system should be running openssh server and the firewall configuration must allow access to the ssh ports.

* Network devices are named `eth0`, `eth1`, and so on because this is what the installation process is expecting. Naming schemes such as `em1`, `em2`, or any other `biosdevname` will **not** work.

* The following packages must be installed.
     
    **Note:** If they are missing, the installation script attempts to install these packages; however, we suggest you install them beforehand.

      `$ sudo apt-get install -y libvirt-bin openvswitch-switch python-libvert qemu-system-x86 qemu-kvm openssh-server`

* After you install the `libvirt` packages, you must reboot or restart `libvirt`:

        $ sudo /etc/init.d/libvirt-bin restart

* Ensure that the root user has a private/public keypair. 
    1. Login as root:

            $ sudo su -

    2. Determine if .ssh/id_rsa exists:

            # ls ~root/.ssh/id_rsa

    3. If the key does not exist, create one, omitting a passphrase and accepting the defaults by pressing Enter:

            # ssh-keygen -t rsa

## Installing your preview edition ## {#install}

### Downloading and unpacking installation file ## {#getinstall}

The HP Helion OpenStack Community edition preview is provided as a compressed tar file. This is a large file because it contains all of the machine images required for the seed VM, the undercloud, the overcloud, and a guest VM image.

You can download the tar file from the following (temporary) URL:

    http://tripz400.emea.hpqcorp.net/ce_demo/demo_20140502_1.tar.gz

**Note:** This tarball file is around 4GB and will not fit on a memory stick formatted as FAT32. If you are planning to store the installation files on removable media, use something like NTFS.

To begin the installation, log in to your system as root and unpack the tar file into root's home directory:

    $ sudo su - 
     # tar zxvf <pathname-of-.tar.gz-file>

This will create and populate a `tripleo/` directory within root's home directory.

### Starting the seed VM ### {#startvm}

Start the seed VM using the following command:

  `# HP_VM_MODE=y bash -x ~root/tripleo/tripleo-incubator/scripts/hp_ced_start_seed.sh`

The process of starting the seed takes about ten minutes, depending on the capabilities of your system, and there are numerous logging messages generated by the script. The first time the script is run, it will check for and attempt to install any missing required packages, as described in [System requirements](#system-requirements). If you are prompted, accept all package installations.

If the seed startup is successful, you will see a message similar to the following:

    Wed Apr 23 11:25:10 UTC 2014 --- completed setup seed

**Note:** The seed VM continues its self-initialization after the startup script has terminated.

### Starting the undercloud, overcloud, and test guest VM ### {#startclouds}

This section will show you how to deploy and configure the undercloud and overcloud, and to start a test guest VM in the overcloud compute node.

1. Log in to the seed VM; it might take a few moments for the VM to become reachable:

        # ssh 192.0.2.1

2. Type `yes` to allow the ssh connection to proceed when prompted for host authentication.

3. Start the deployment of the undercloud and overcloud:

      `root@hLinux:~# bash -x ~root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh`

     This script waits, if necessary, for the seed to complete its initialization. Then, it will create, image, and start the VMs for the undercloud and overcloud, as well as create a test guest VM in the overcloud. This takes about 10 minutes and includes two pauses while services and VMs are set up in the background.

4. If the deployment completes successfully, you will see a message similar to the following:

        HP - completed -Wed May 07 16:20:02 UTC 2014

<!--Verify that the seed has completed its self-initialization by confirming that no further logging messages are being appended to the `os-collect-config` log:

    root@hLinux:~# tail -f /var/log/upstart/os-collect-config.log

If the initialization process has completed, it will usually be indicated by a concluding log entry like:

    [2014-04-23 11:38:52,892] (os-refresh-config) [INFO] Completed phase migration

You can then break out of the tail command using CTRL-C.-->


## Verifying your installation

### Connecting to test guest VM ### {#connectvm}

From within the seed VM, you should be able to connect to the test guest VM created.

1. Set up your environment to access the overcloud, and list the running instances:

        root@hLinux:~# source ~root/tripleo/tripleo-overcloud-passwords
        root@hLinux:~# TE_DATAFILE=tripleo/testenv.json
        root@hLinux:~# source ~root/tripleo/tripleo-incubator/overcloudrc-user
        root@hLinux:~# nova list

    Ensure you note the IP address of the demo VM from the output of 'nova list' command. 

2. Of the two IP addresses shown for each instance, use the `192.x.x.x` IP address to ping the VM:

        root@hLinux:~# ping <ip of demo vm>

3. Verify you can ssh into the VM:

        root@hLinux:~# ssh ubuntu@<ip of demo vm>

### Connecting to Horizon console ### {#connectconsole}

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

4. Log in as `demo` or `admin` using the corresponding passwords obtained in step 2.

**Note:** If you cannot connect to the Horizon console, check your proxy settings to make sure access to the controller VM is not being unsuccessfully redirected through a proxy.

### Connecting remotely to Horizon console ### {#remoteconnect}

For remote system installations where you cannot open a browser on the remote system, you can ssh tunnel from a local system to your remote one. This will require ssh access from the local system to the remote system. 

1. Establish the tunnel by issuing the command below on the local system:

      `$ ssh -L 9999:<IP of overcloud controller>:80 <hostname or IP of remote system>`

2. Point the web browser of the local system to the link below:

        http://localhost:9999

3. Use the user names and passwords obtained in [Connecting to the Horizon console](#connectconsole) to access the console.

## Issues and troubleshooting

* The package `qemu-kvm` is required, but not installed automatically by the scripts. To correct this:

        sudo apt-get install -y qemu-kvm

* If the `unsupported locale setting` is returned when issuing Neutron commands from within the seed VM, correct this by setting the following in the environment:

        export LANG=C

* If the `hp_ced_start_seed` script fails to start the seed, run the script again.


### Other Notes

* The virtual installation does not currently persist across system reboots.

* To cleanup: 
    * Delete the KVM VMs and their storage volumes using `virsh` commands.
    * Delete `/tmp/seed_options`.
    * Uninstall any packages that you no longer require.




<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
