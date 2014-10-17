---
layout: default
title: "HP Helion OpenStack&trade; Community Baremetal Installation and Configuration"
permalink: /helion/community/install/
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
<p style="font-size: small;"> <a href="/helion/community/install-overview/">&#9664; PREV</a> | <a href="/helion/community/install-overview/">&#9650; UP</a> | <a href="/helion/community/install-virtual/">NEXT &#9654;</a> </p>
-->
# HP Helion OpenStack&#174; Community Baremetal Installation and Configuration

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

   * [Starting the seed and building your cloud](#startseed)

* [Verifying your installation](#verifying-your-installation)

   * [Connecting to demo VM](#connectvm)

   * [Connecting to Horizon console](#connectconsole)

   * [Connecting remotely to Horizon console](#remoteconnect)

   * [Connecting to Monitoring UI](#monitoring)

* [Enable name resolution from tenant VMs in the overcloud](#dnsmasq)

* [Issues and troubleshooting](#issues-and-troubleshooting)


## Hardware and network requirements

To install a HP Helion OpenStack Community multi-node baremetal configuration, you must meet the hardware requirements described in [Community Hardware and Software Requirements](/helion/community/hwsw-requirements/).


### Network configuration

To ensure a successful installation, you must meet the hardware requirements described in [Community Network Architecture and Configuration](/helion/community/network-requirements/).

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

	[HP Helion OpenStack Community edition Installation Package](https://helion.hpwsportal.com/#/Product/%7B%22productId%22%3A%221320%22%7D/Show)

3. Create a directory named `work` and extract the kit to the `work` directory:

		`mkdir /root/work`
		`cd /root/work`
		`tar zxvf /root/ce_installer.gz`

	This creates and populates a `tripleo/` directory within root's home directory.

4. Shutdown any running `baremetal_n` virtual machines using the `virsh destroy` command:

	`virsh destroy baremetal_n`

5. **Optional:** To use an interface other than ‘eth0’ on the HOST as the bridge interface, for example eth3, use the following command:

		export BRIDGE_INTERFACE=eth3

6. **Optional:** To use an IP address for the seed VM other than the default (192.0.2.1), use the following command:

		export BM_NETWORK_SEED_IP=192.168.10.1
		export BM_NETWORK_CIDR=192.168.0.0/16

6. **Optional:** To use a host other than the seed as the gateway, use the following command:

		export BM_NETWORK_GATEWAY=192.168.10.254

	**Note:** This must also be set on the seed during hp_ced_installer as detailed in the next section


### Starting the seed and building your cloud ### {#startseed}
1. Start the seed using the following command:

	`bash -x /root/work/tripleo/tripleo-incubator/scripts/hp_ced_host_manager.sh --create-seed`

	If the seed startup is successful, you should see a message similar to the following:

		"Wed Oct 23 11:25:10 IST 2014 --- completed setup seed"

2. To build the cloud, start by logging in to the seed. Run the following command from /root:

		ssh debian@192.0.2.1

3. Using your favorite editor, create a file in /root called `baremetal.csv`.

4. Edit `baremetal.csv` to add the following information in the specified format for each of the your baremetal systems:
	`<mac_address>,<ipmi_user>,<ipmi_password>,<ipmi_address>,<#cpus>,<memory_MB>,<diskspace_GB>`

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

6. Set the IP address of an NTP server accessible on the public interface for overcloud and undercloud hosts using the following commands, 

	To set this variable:

	`export OVERCLOUD_NTP_SERVER=192.0.1.128`
	`export UNDERCLOUD_NTP_SERVER=192.0.1.128`

7. If required, set the following environmental variables, which can affect your installation. Some of these variables set public, or floating, IP addresses. The floating IP addresses cannot be in the same range as the private network addresses (by default, 10.x.x.x)

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

	* `OVERCLOUD_VIRTUAL_INTERFACE` - Use this variable to set the interface that the Overcloud virtual IP (used for accessing API services) will be assigned to. This is required.

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
	
		If you do not specify a value, the value is derived based on the number of lines remaining in `/root/baremetal.csv` once the undercloud, overcloud control, and overcloud swift nodes are removed.

		To set this variable:

			export OVERCLOUD_COMPUTESCALE=3

	* `OVERCLOUD_CINDER_LVMLOOPDEVSIZE` - This is the size of the loopback device on your partition on the overcloud control node used to hold Cinder volumes, and it is set by default to 50000 MB. You can set it to a higher value if, for example, you plan to create snapshots of large bootable volumes. The partition is a shared device, so the loopback device should not occupy the entire partition. The partition size is calculated as (approximately) diskspace_GB from the baremetal.csv file minus the root partition size of 30 GB.

		To set this variable: 

			export OVERCLOUD_CINDER_LVMLOOPDEVSIZE=50000

	* `OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID` - HP Helion OpenStack Community  uses keepalived to manage virtual IPs. keepalived uses a unique id to synchronise its activities. If you plan to run multiple installations of HP Helion OpenStack Community edition on the same network, each installation must be configured with a unique id by setting the environment variable `OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID` to a unique number (from 0 to 255) before running the installation. The default value, if unset, is 51.

		To set this variable: 

			export OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID=99

8. By [default](#NetworkDefault), the bridge interface, the Seed VM IP address, and the gateway host are configured during the installation process. To change any or all of those configurations, complete the following steps:
 

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


9. From /root, install and configure the undercloud and overcloud by running the following command. 

	**Important:** You must have completed any manual configuration steps listed under [Hardware requirements](#hardware-requirements) before starting the installation.

	`bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh`

	If your installation is successful, message similar to the following is displayed:

		"HP - completed - Wed Oct 23 16:20:20 UTC 2014"

**Note:** If `hp_ced_start_seed` fails to start the seed, you simply need to restart it (Step 1) and then follow the rest of the steps.


## Verifying your installation

Once your installation is complete, you should ensure you can connect to your HP Helion OpenStack Community baremetal cloud. You can accomplish this in any of the following ways:

* [Connecting to demo VM](#connectvm)

* [Connecting to Horizon console](#connectconsole)

* [Connecting to Monitoring UI](#connectmonitor)

### Connecting to the demo VM ### {#connectvm}

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

	**Note:** It might take a few minutes for the demo vm to become available using ssh after finishing the installation.

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



## Known issues and workarounds {#known}

- The following error has been intermittently observed on HP ProLiant SL390s systems on which installs are being performed:

		Fatal PCI Express Device Error PCI Slot ?
		B00/D00/F00

	To reset a system that experiences this error,
	1. Connect to the iLO using a web browser (https://<iLO IP address>)
	2. Navigate to Information / Diagnostics
	3. Reset iLO
	4. Log back into the iLO after 30 seconds
	5. Navigate to Remote Console / Remote Console
	6. Bring up integrated remote console (.NET)
	7. Click Power switch / Press and Hold
	8. Click Power switch / Momentary Press
	9. Wait for system to restart
	10. System should boot normally

- The BIOS must be set to the correct date and time on all systems.

	On HP ProLiant systems you can do the following:
	1. Power UP the server and configure the BIOS (press F9)
	2. Set Date and Time in the BIOS, and exit confirming your selection.
	3. Power the server off prior to installation

- On many HP systems, including HP servers running iLO 3 firmware, the
  iLO time can be set to propagate to the BIOS on powerup.
  You should disable propagation and set the BIOS time to the correct
  date and time on all systems.

	1. Connect to the iLO using a web browser (https://<iLO IP address>)
	2. Navigate to Network/Shared Network Port or the Network/Dedicated Network Port (Primary Time Server, Secondary Time Server, Time Zone, and Time Propagation settings are shared between all iLO Network Ports).
	3. Navigate to SNTP
	4. UNSET 'Propagate NTP Time to Host'
	5. Reset iLO
	6. Follow the steps above to set the time in the BIOS

- If the iLO time propagates to the BIOS, setting an incorrect time,
  the undercloud or overcloud may fail to initialize with the following message:

		Timing out after 60 seconds:
		11:46:38 COMMAND=wait_for_hypervisor_stats 8

	Follow the steps above to set the time in the BIOS correctly.

- The following error has also been observed on the console of a baremetal system during installation when the BIOS date/time are incorrect

		/etc/init.d/open-iscsi: 73: /etc/init.d/open-iscsi: cannot create /etc/iscsi/initiatorname.iscsi: Read-only file system

	Follow the steps above to set the time in the BIOS correctly.

- Filesystem checking on reboot is disabled by default for the seed, undercloud and overcloud nodes. We recommend periodically manually running fsck to verify filesystem integrity.

- These files contain credentials for the undercloud and the overcloud; you
  should ensure that they are securely stored separately from the seed.

		/root/stackrc
		/root/tripleo/tripleo_passwords

- On the seed cloud host (the system on which the installer is run), the seed VM's networking will be bridged onto the external LAN.

	To revert this change, reboot the system then execute this command on the console of the host:

		ovs-vsctl del-port eth0

	If you specified BRIDGE_INTERFACE as something other than eth0 then replace eth0 in the command above with that value.

- If the `hp_ced_host_manager` fails to start the seed, execute the command again (a failure could be the result of a race condition in libvirt).

- If the undercloud controller is rebooted, you must login to it and run the following command as root:

		os-refresh-config

	Failure to do this will prevent subsequent reboots of the overcloud nodes.

- The installation pauses 1-2 minutes loading images and pauses of 12 or more minutes building the undercloud and overcloud.

- The installer script will wait for os-collect-config to complete on the seed but times out after 10 minutes of waiting.

- The installer uses IPMI commands to reset nodes and change their power status. Some systems have been seen to get into a state where the Server Power status as reported by the iLO stays stuck in the "RESET" state. If this occurs, it is neccesary to physically remove power from the server for 10 seconds. If the problem persists after that, contact HP Support - there might be a defective component in the system.

- If using the seed vm as your gateway (default setting), you will need to execute the following commands after you have run `hp_ced_host_manager.sh` on the host machine.

		MAC=$(virsh dumpxml --domain seed | grep "mac address" | head -1 | awk -F "'" '{print $2}')
		VM_IP=$(arp -n | grep $MAC | awk '{print $1}')
		ip route replace <BM_NETWORK_CIDR> dev virbr0 via $VM_IP

- The installer now includes an interactive query before running a hardware
  census script at the end of the install. This script is optional.

- ElasticSearch indexes are not deleted automatically. Log data will build up over time, potentially filling the space available, unless managed. To see the indexes, ssh to the undercloud node and run:

		curl "localhost:9200/_cat/indices?v"

	To remove indexes, run this (you must be on the undercloud node):

		curl -XDELETE "localhost:9200/logstash-<DATE>"

	Where <DATE> is in the format "YYYY.MM.DD" EG "2014.09.09".


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;">Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
