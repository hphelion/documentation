---
layout: default
title: "HP Helion OpenStack&#174; Community Baremetal Installation and Configuration"
permalink: /helion/community/install-old/
product: community

---
<!--PUBLISHED-->


<p style="font-size: small;"> <a href="/helion/community/install-overview/">&#9664; PREV</a> | <a href="/helion/community/install-overview/">&#9650; UP</a> | <a href="/helion/community/install-virtual/">NEXT &#9654;</a> </p>

# HP Helion OpenStack&#174; 1.0 Community Baremetal Installation and Configuration
This page explains how to install and configure HP Helion OpenStack Community baremetal multi-node deployment &mdash; ideal for a small-scale, private cloud. This installation deploys to a minimum of 5 baremetal servers, to which you can add **up to 30 compute nodes**:

* 1 undercloud
* 1 overcloud controller
* 2 overcloud swift nodes 
* At least 1 overcloud compute nodes 

It is important to read through this page before starting your installation. Before you begin your installation, we recommend you review the complete [Hardware and Software Requirements](/helion/community/hwsw-requirements/) page. Note, however, that we have included the basic requirements on this page.


* [Hardware and network requirements](#hardware-and-network-requirements)

   * [Network configuration](#network-configuration)

* [Before you begin](#before-you-begin)
   * [Obtaining a public key](#pub-key)
   * [Installing Debian/Ubuntu packages](#packages)
   * [Obtaining required information](#req-info)
   * [About the installation process](#install-notes)

* [Installing HP Helion OpenStack Community](#install)

   * [Downloading and unpacking installation file](#getinstall)

   * [Changing the Default Network Interface](#NetworkInt)

   * [Starting the seed and building your cloud](#startseed)

* [Verifying your installation](#verifying-your-installation)

   * [Connecting to demo VM](#connectvm)

   * [Connecting to Horizon console](#connectconsole)

   * [Connecting remotely to Horizon console](#remoteconnect)

   * [Connecting to to Monitoring UI](#monitoring)

<!-- * [Post-installation configuration](#configure)

* [Next steps](#next-steps) -->

* [Issues and troubleshooting](#issues-and-troubleshooting)


## Hardware and network requirements

To install a HP Helion OpenStack Community baremetal multi-node configuration, you must have the following hardware configuration.

* At least 5 and up to 30 baremetal systems with the following configuration:

    * A minimum of 32 GB of physical memory
    * A minimum of 2 TB of disk space
    * A minimum of 1 x 10 GB NIC with PXE support

      * For systems with multiple NICs, the NICs must not be connected to the same Layer 2 network or VLAN.

    * Capable of hosting VMs
    * The boot order configured with Network/PXE boot as the first option
    * The BIOS configured: 
     
      * To the correct date and time
      * With only one network interface enabled for PXE/network boot and any additional interfaces should have PXE/network boot disabled
      * To stay powered off in the event of being shutdown rather than automatically restarting

    * Running the latest firmware recommended by the system vendor for all system components, including the BIOS, BMC firmware, disk controller firmware, drive firmware, network adapter firmware, and so on


    **Important:** The installer currently uses only the first available disk; servers with RAID controllers need to be pre-configured to present their storage as a single logical disk. RAID across multiple disks is strongly recommended for both performance and resilience.

* An additional system to run the baremetal installer and host the seed VM with the following configuration:

    * A minimum of 8 GB of physical memory
    * A minimum of 100 GB of disk space 
    * One of the following operating systems installed:

      * Ubuntu 13.10
      * Ubuntu 14.04

    **Important:** This system might be reconfigured during the installation process so a dedicated system is recommended. Reconfiguration might include installing additional software packages, and changes to the network or visualization configuration.

### Network configuration

To ensure a successful installation, you must also satisfy these network configuration requirements:

* The seed VM, the baremetal systems and the IPMI controller for all systems must be on the same network

* Ensure network interfaces that are not used for PXE boot are disabled from BIOS to prevent PXE boot attempts from those devices.

* If you have other DHCP servers on the same network as your system, you must ensure that the DHCP server does not hand out IP addresses to your physical nodes as they PXE boot.

* The network interface intended as the bridge interface should be configured and working before running the installer. The installer creates a network bridge on the system running the installer, attaching the bridge interface to the network bridge. The installer uses the IP address of the bridge interface for the network bridge.
 
### Network defaults {#NetworkDefault}

The installation process includes a number of default configurations. You can change many of these defaults during the installation, using the steps detailed in the appropriate sections.

Note the following default settings:

- The default network configuration uses a single subnet 192.0.2.0/24 for all networking. 
- The Seed VM is assigned an IP address of 192.0.2.1, in addition to the IP address assigned by the [libvirt package](#packages). 
- The external interface of HOST of the seed VM is added to a software bridge, called *brbm*, on the HOST and the IP address of the external interface is transferred to the bridge. This allows external traffic on 192.0.2.0/24 to be routed to the seed VM.
- The SEED VM is the GATEWAY for all traffic outside the baremetal network.
- IP addresses are assigned by default as follows:

	- 192.0.2.2-192.0.2.20 is used by seed cloud to administer undercloud nodes
	- 192.0.2.21-192.0.2.124 is used by undercloud to administer overcloud nodes
	- 192.0.2.129-1920.0.2.254 is used as a pool of addresses for floating IPS for virtual machines in the overcloud.

- The IP address range for the private IPs assigned to new virtual instances is 10.0.0.0/8. 

##Before you begin
Before you begin the installation process, ensure you have read the following and completed any required tasks:

   * [Obtaining a public key](#pub-key)
   * [Installing Debian/Ubuntu packages](#packages)
   * [Obtaining required information](#req-info)
   * [About the installation process](#install-notes)

### Obtaining a public key ### {#pub-key}
On the system on which the install is running, user root must have a public key, for example:

`/root/.ssh/id_rsa`

`/root/.ssh/id_rsa.pub`

If user root does not have a public key, you can create one using the `ssh-keygen -t rsa -N ""` command.

### Installing Debian/Ubuntu packages ### {#packages}
If they are not already installed, the following required Debian/Ubuntu packages are added to the system on which the installer is running:

* qemu
* qemu-kvm
* openvswitch
* libvirt
* python-libvirt

However, we recommend you install these packages before starting the installation process using the following command:

`$ sudo apt-get install -y libvirt-bin openvswitch-switch python-libvirt qemu-system-x86 qemu-kvm`

After you install the `libvirt` packages, you must reboot or restart `libvirt`:

`$ sudo /etc/init.d/libvirt-bin restart`

### Obtaining required information ### {#req-info}

During the installation process, you will need to create a file called `baremetal.csv`. This file must contain one entry for each of the seven baremetal systems; thus, the file must contain a minimum of 7 lines, and each line must contain the following information:

    `<mac_address>,<ilouser>,<ilopassword>,<iloipaddress>,<#cpus>,<memory_MB>,<diskspace_GB>`

For example: `78:e7:d1:22:5d:58,operator,password,192.168.11.1,12,32768,2048`

To make creating this file easier during installation, we recommend that you gather this required information before you begin your installation, keeping in mind the following:

* The IPMI user and password **must have** ADMINISTRATOR privilege; it is not sufficient to have OPERATOR privilege
* Memory must be at least 32 GB
* Disk size should be at least 2 TB
* The disk size specified should never exceed the physical disk size

### About the installation process ### {#install-notes}

There are a few things you should be aware of before you begin your HP Helion OpenStack Community baremetal installation.

* Loading images is slow, so be patient.

* The seed must remain booted while the undercloud and overcloud are up.

* These files contain credentials for the undercloud and the overcloud; you should ensure that they are securely stored separately from the seed.

`/root/stackrc`

`/root/tripleo/tripleo_passwords`


## Installing HP Helion OpenStack Community {#install}
Once you have ensured you meet all the hardware requirements and have completed the required tasks, you can begin your installation. The following two sections will walk you through:

   * [Downloading and unpacking installation file](#getinstall)

   * [Starting the seed and building your cloud](#startseed)

**IMPORTANT:** During the installation process, **DO NOT RESTART** the system running the installer and seed VM. Restarting this system disrupts the baremetal bridge networking configuration and disables both the undercloud and overcloud. If the system is inadvertently restarted, you must complete the installation process again.

### Downloading and unpacking installation file ## {#getinstall}

The HP Helion OpenStack Community baremetal installation is provided as a compressed tar file. To download and unpack this file, complete the following steps.


1. Log in to your install system as root:

	`sudo su -`

2. Register and then log in to download the HP Helion OpenStack Community baremetal package from this site:

    [HP Helion OpenStack Community edition Installation Package ](https://helion.hpwsportal.com/#/Product/%7B%22productId%22%3A%221320%22%7D/Show)

3. Create a directory named `work`:

	`mkdir /root/work`

	`cd /root/work`

4.  Extract the kit to the `work` directory:

	`tar zxvf /root/Helion_Openstack_Community.tar.gz`

	This creates and populates a `tripleo/` directory within root's home directory.

5. Shutdown any running 'baremetal_n' virtual machines using virsh destroy:

	`$ virsh destroy baremetal_n`

	**BEFORE you begin this step:** If the external device name on the host system (the one through which the host, and indirectly the seed, accesses the IPMI network) is **NOT** named `eth0`, then determine the device name:

	`$ export BRIDGE_INTERFACE=<devicename>`

	Two examples:

		$ export BRIDGE_INTERFACE=em1
		$ export BRIDGE_INTERFACE=eth5

### Changing the Default Network Interface ### {#NetworkInt}

The bridge interface, the Seed VM IP address, and the gateway host are configured during the installation process. To change any or all of those configurations, complete the following steps:

OPTIONAL: Modify the default bridge interface on the HOST, for example: 

`$ export BRIDGE_INTERFACE=eth3`

OPTIONAL: Modify the IP address of the Seed VM, for example:

`$export BM_NETWORK_SEED_IP=192.168.10.1`

`$export BM_NETWORK_CIDR=192.168.0.0/16`

OPTIONAL: Modify which host to use as the gateway, for example:   

`$ export BM_NETWORK_GATEWAY=192.168.10.254`

**Note:** If you change the gateway host, you must also execute this command during `hp_ced_installer` as detailed in the next section.


### Starting the seed and building your cloud ### {#startseed}
1. Start the seed using the following command:

	`bash -x /root/work/tripleo/tripleo-incubator/scripts/hp_ced_start_seed.sh`

	If the seed startup is successful, you should see a message similar to the following:

	`"Wed Apr 23 11:25:10 IST 2014 --- completed setup seed"`

2. To build the cloud, start by logging in to the seed. Run the the following command from /root:

	`ssh root@192.0.2.1`

3. Using your favorite editor, create a file in /root called `baremetal.csv`.

4. Edit `baremetal.csv` to add the following information in the specified format for each of the your baremetal systems:

	`<mac_address>,<ilouser>,<ilopassword>,<iloipaddress>,<#cpus>,<memory_MB>,<diskspace_GB>`

	For example, for a 7 baremetal system your file should look similar to this:

	`78:e7:d1:22:5d:58,administrator,password,192.168.11.1,12,32768,2048`
	`78:e7:d1:22:5d:10,administrator,password,192.168.11.5,12,32768,2048`
	`78:e7:d1:22:52:90,administrator,password,192.168.11.3,12,32768,2048`
	`78:e7:d1:22:5d:c0,administrator,password,192.168.11.2,12,32768,2048`
	`78:e7:d1:22:5d:a8,administrator,password,192.168.11.4,12,32768,2048`
	`78:e7:d1:22:5d:a8,administrator,password,192.168.11.6,12,32768,2048`
	`78:e7:d1:22:52:9e,administrator,password,192.168.11.7,12,32768,2048`

	**Note:** For more information on creating this file, refer back to the [system configuration requirements](#sys-config).

5. Manually power off each baremetal system specified in /root/baremetal.csv before proceeding with the installation. 

	**IMPORTANT:** Ensure that each system is configured in the BIOS to stay powered off in the event of being shutdown rather than automatically restarting. Refer to the [Network configuration](#additional-hardware-configuration) section.

6. Set the IP address of an NTP server accessible on the public interface for overcloud and undercloud hosts using the following commands, for example:

	`$ export OVERCLOUD_NTP_SERVER=192.0.1.128`

	`$ export UNDERCLOUD_NTP_SERVER=192.0.1.128`

7. If required, set the following environmental variables, which can affect your installation. Some of these variables set public, or floating, IP addresses. The floating IP addresses cannot be in the same range as the private network addresses (by default, 10.x.x.x)

	* `OVERCLOUD_NeutronPublicInterface` and `UNDERCLOUD_NeutronPublicInterface` - You should set these to the value of the name of the interface that carries the neutron external traffic on your overcloud and undercloud. The default value is `eth2`. If this is correct, you do not need to set this variable.

		To set this variable:

		`$ export OVERCLOUD_NeutronPublicInterface=eth2`
		`$ export UNDERCLOUD_NeutronPublicInterface=eth2`
 
	* `FLOATING_START`, `FLOATING_END`, and `FLOATING_CIDR` - These variables control the range of IP addresses available for user VMs in the overcloud. The defaults are currently set as below but can be changed if desired.

		`$ export FLOATING_START=192.0.2.45`
		`$ export FLOATING_END=192.0.2.254`
		`$ export FLOATING_CIDR=192.0.2.0/24`

	* **OPTIONAL**: You can optionally configure a second network for API traffic and for the floating IP pool by setting `OVERCLOUD_NeutronPublicInterface` to a physically configured VLAN. For example:

		`$ export OVERCLOUD_NeutronPublicInterface=vlan101`
		`$ export NeutronPublicInterfaceIP=192.0.8.2/21`
		`$ export NeutronPublicInterfaceRawDevice=eth0`
		`$ export NeutronPublicInterfaceDefaultRoute=192.0.8.1`
		`$ export FLOATING_START=192.0.8.20`
		`$ export FLOATING_END=192.0.15.254`
		`$ export FLOATING_CIDR=192.0.8.0/21`
    
    * `OVERCLOUD_COMPUTESCALE` - You should not set this to a higher value than three as a limit of 7 nodes is enforced. If you do not specify a value, the value is derived based on the number of lines remaining in `/root/baremetal.csv` once the undercloud, overcloud control, and overcloud swift nodes are removed.

		To set this variable:

		`$ export OVERCLOUD_COMPUTESCALE=3`

	* `OVERCLOUD_CINDER_LVMLOOPDEVSIZE` - This is the size of the loopback device on your partition on the overcloud control node used to hold Cinder volumes, and it is set by default to 50000 MB. You can set it to a higher value if, for example, you plan to create snapshots of large bootable volumes. The partition is a shared device, so the loopback device should not occupy the entire partition. The partition size is calculated as (approximately) diskspace_GB from the baremetal.csv file minus the root partition size of 30 GB.

		To set this variable: 

		`$ export OVERCLOUD_CINDER_LVMLOOPDEVSIZE=50000`

8. By [default](#NetworkDefault), the bridge interface, the Seed VM IP address, and the gateway host are configured during the installation process. To change any or all of those configurations, complete the following steps:
 

    * **OPTIONAL:** Change the IP address range to administer undercloud nodes by entering the starting and ending IP addresses for the range, for example:
  
		`$ export BM_NETWORK_SEED_RANGE_START=192.168.10.2`
		`$ export BM_NETWORK_SEED_RANGE_END=192.168.10.20`

		This IP address range must be on the same subnet as the Seed VM, as configured in [Changing the Default Network Interface](#NetworkInt).

    * **OPTIONAL:** Change the IP address range to administer overcloud nodes from the undercloud by entering the starting and ending IP addresses for the range, for example:
  
		`$ export BM_NETWORK_UNDERCLOUD_RANGE_START=192.168.10.2`
		`$ export BM_NETWORK_UNDERCLOUD_RANGE_END=192.168.10.20`

		This IP address range must be on the same subnet as the Seed VM, as configured in [Changing the Default Network Interface](#NetworkInt).

    * **OPTIONAL**: If you modified the gateway host, execute:

		`$ export BM_NETWORK_GATEWAY=192.168.10.254`

    * **OPTIONAL**: Modify the IP address range for the private network assigned by default to each virtual instance in the overcloud, for example:

		`$ export OVERCLOUD_FIXED_RANGE_CIDR=10.20.240.0/20`

9. From /root, install and configure the undercloud and overcloud by running the following command. 

	**Important:** You must have completed any manual configuration steps listed under [Hardware requirements](#hardware-requirements) before starting the installation.

	`bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh`

	If your installation is successful, message similar to the following is displayed:

	`"HP - completed - Tue Apr 22 16:20:20 UTC 2014"`

**Note:** If `hp_ced_start_seed` fails to start the seed, you simply need to restart it (Step 1) and then follow the rest of the steps.


## Verifying your installation

Once your installation is complete, you should ensure you can connect to your HP Helion OpenStack Community baremetal cloud. You can accomplish this in any of the following ways:

   * [Connecting to demo VM](#connectvm)

   * [Connecting to Horizon console](#connectconsole)

   * [Connecting remotely to Horizon console](#remoteconnect)

   * [Connecting to to Monitoring UI](#monitoring)


### Connecting to the demo VM ### {#connectvm}
From the seed, you can connect to the demo VM using the following steps:

1. Export the overcloud passwords:

	`. /root/tripleo/tripleo-overcloud-passwords`

2. Export the overcloud users:

	`TE_DATAFILE=/root/tripleo/testenv.json . /root/tripleo/tripleo-incubator/overcloudrc-user`

3. Verify you can view the nova instances:

	`nova list`

4. Assign the demo VM IP address to a variable:

	`DEMO_IP=$(nova list | grep " demo " | awk ' { print $13 } ')`

5. Connect to the demo vm:

	`ssh root@${DEMO_IP}`

	**Note:** It might take a few minutes for the demo vm to become available using ssh after finishing the installation.

### Connecting to Horizon console ### {#connectconsole}
Ensure you can access the overcloud Horizon dashboard. To do this, follow the steps below:

1. From the seed, export the undercloud passwords:

	`. /root/tripleo/tripleo-undercloud-passwords`

2. Export the undercloud users:

	`TE_DATAFILE=/root/tripleo/testenv.json . /root/tripleo/tripleo-incubator/undercloudrc`

3. Assign the overcloud IP address to a variable:

	`OVERCLOUD_IP=$(nova list | grep "overcloud-controller" | awk ' { print $12 } ' | sed s/ctlplane=// )`

4. Determine the overcloud controller IP from the output of **Step 3** using the following command. It is in the last line returned.

	`echo ${OVERCLOUD_IP}`

	If the optional second network was configured, the overcloud controller IP is the value set for NeutronPublicInterfaceIP.

4. Open the `/root/tripleo/tripleo-overcloud-passwords` file and make note of the demo user password.

5. From your install system, open a web browser and point to:

	http://<overcloud_IP>/

6. Log in to the overcloud Horizon dashboard as user `demo` with the password you obtained from the `/root/tripleo/tripleo-overcloud-passwords` file in step 4.

**Note:** If you cannot connect to the Horizon console, check your proxy settings to make sure access to the controller VM is not being unsuccessfully redirected through a proxy.

### Connecting remotely to Horizon console ### {#remoteconnect}

For installations where you cannot open a browser on the install system, you can set up an ssh tunnel from a local system to your remote install system. This requires ssh access from the local system to the remote system. 

1. Establish the tunnel by issuing the command below on the local system:

	`$ ssh -L 9999:<overcloud_IP>:80 <hostname or IP of remote system>`

2. From the seed, export the undercloud passwords:

	`. /root/tripleo/tripleo-undercloud-passwords`

3. Export the undercloud users:

	`TE_DATAFILE=/root/tripleo/testenv.json . /root/tripleo/tripleo-incubator/undercloudrc`

4. Assign the overcloud IP address to a variable:

	`OVERCLOUD_IP=$(nova list | grep "overcloud-controller" | awk ' { print $12 } ' | sed s/ctlplane=// )`

5. Determine the overcloud controller IP from the output of step 3 using the following command. It is in the last line returned.

	`echo ${OVERCLOUD_IP}`

	If the optional second network was configured, the overcloud controller IP is the value set for NeutronPublicInterfaceIP.2. Open the `/root/tripleo/tripleo-overcloud-passwords` file and make note of the demo user password.

6. Point the web browser of the local system to the link below:

	[http://localhost:9999](http://localhost:9999)

7. Log in to the overcloud Horizon dashboard as user `demo` with the password you obtained from the `/root/tripleo/tripleo-overcloud-passwords` file in step 5.

### Connecting to Monitoring UI ### {#monitoring}

1. From the seed, run the following command:

	`./root/stackrc`

2. Assign the undercloud IP address to a variable:

	`UNDERCLOUD_IP=$(nova list | grep "undercloud" | awk ' { print $12 } ' | sed s/ctlplane=// )`

3. Determine the undercloud IP from the output of **Step 2** using the following command. It is in the last line returned.

	echo ${UNDERCLOUD_IP}

4. From your install system, open a web browser and point to:

	http://<undercloud_IP>/icinga/

5. Log in user 'icingaadmin' with password 'icingaadmin'.

<!-- ## Post-installation configuration {#configure}

**QUESTIONS for reviewers:**

Any post-installation configuration?


## Next steps
REVIEWERS: NEED TO DISCUSS THIS SECTION. I HAD INTENDED TO TALK ABOUT AND LINK TO SOME OF THE ADMIN USE CASES. SINCE WE ARE NOT INCLUDING THE USE CASES FOR 6/12, SHOULD I JUST INCLUDE A FEW OF THE MOST 'COMMON' USE CASES HERE N THIS DOCUMENT? -->

## Issues and troubleshooting 
* When installing on HP ProLiant SL390s systems, the following error has occasionally occurred:

    `Fatal PCI Express Device Error PCI Slot ?
     B00/D00/F00`

     If you get this error, reset the system that experienced the error:

    1. Connect to the iLO using Internet Explorer:
        `https://<iLO IP address>`
    2. Navigate to Information / Diagnostics.
    3. Reset iLO.
    4. Log back into the iLO after 30 seconds.
    5. Navigate to Remote Console / Remote Console.
    6. Open the integrated remote console (.NET).
    7. Click Power switch / Press and Hold.
    8. Click Power switch / Momentary Press, and wait for the system to restart.

    The system should now boot normally.

* If the overcloud controller is rebooted (power issue, hardware upgrade, etc.), OpenStack compute tools such as `nova-list` report that the VMs are in an ERROR state, rendering the overcloud unusable. To restore the overcloud to an operational state, follow the steps below:
  1. As user root on the overcloud controller you must:
  
        A. Run the os-refresh-config scripts:

            # os-refresh-config

        B. Restart the mysql service:

            # service mysql restart

        C. Re-run the os-refresh-config scripts:

            # os-refresh-config

        D. Restart all neutron services:

            # service neutron-dhcp-agent restart
            # service neutron-l3-agent restart
            # service neutron-metadata-agent restart
            # service neutron-openvswitch-agent restart
            # service neutron-server restart

  2. On each overcloud node, restart the neutron and nova services:
  
            $ sudo service neutron-openvswitch-agent restart
            $ sudo service nova-compute restart
            $ sudo service nova-scheduler restart
            $ sudo service nova-conductor restart

* The installer uses IPMI commands to reset nodes and change their power status. Some systems change to a state where the "Server Power" status as reported by the iLO is stuck in the "RESET". If this occurs, you must physically disconnect the power from the server for 10 seconds. If the problem persists after that, contact HP Support as there might be a defective component in the system.

* On the system on which the installer is run, the seed VM's networking is bridged onto the external LAN. If you remove HP Helion OpenStack Community, the network bridge persists. To revert the network configuration to its pre-installation state, run the following commands as user root: 

        # ip addr add 192.168.185.131/16 dev eth0 scope global
        # ip addr del 192.168.185.131/16 dev brbm
        # ovs-vsctl del-port NIC

        where
        * eth0 is the external interface
        * 192.168.185.131 is the IP address on the external interface - you should replace this with your own IP address.
        * The baremetal bridge is always called 'brbm'

 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
