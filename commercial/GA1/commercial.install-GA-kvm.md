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


<p style="font-size: small;"> <a href="/helion/openstack/install-beta/prereqs/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/vsa/">NEXT &#9654;</a> </p>

# HP Helion OpenStack&reg;:  Beta Installation and Configuration for KVM Hypervisor

HP Helion Openstack beta allows you to manage the KVM hypervisor and provision virtual machines. This document provides installation instructions for HP Helion OpenStack Edition preview on a suitably specified and prepared system.

## Installing HP Helion OpenStack ## {#install}

The installation and configuration process for ESX consists of the following general steps: 

* [Verify Prerequisites](#pre)
* [KVM deployment architecture](#deploy-arch)
* [Downloading the installation packages](#getinstall)
* [Installing HP StoreVirtual Virtual Storage Appliance](#vsa)
* [Installing HP Helion OpenStack](#install)
   * [Configuring proxy information](#proxy)
   * [Unpacking installation file](#unpackinstall)
   * [Installing the seed VM and building your cloud](#startseed)
* [Verifying your installation](#verifying-your-installation)
   * [Connecting to Horizon console](#connectconsole)
   * [Connecting to Monitoring UI](#monitoring)
* [Installing DNS as a service](#configure)
* [Next steps](#next-steps)

## Verify Prerequisites ## {#pre}

To ensure successful installation, please read through the topics before you start.

* Review the [support matrix](/helion/openstack/ga/support-matrix/) for information on the supported hardware and software.
* Make sure your environment meets the [hardware and network configuration requirements](/helion/openstack/ga/install/prereqs/). 
* [Perform required pre-installation tasks](/helion/openstack/ga/install/prereqs/).


## Review the KVM deployment architecture {#deploy-arch}

The following diagram depicts the required network topology for a KVM installation.

<a href="javascript:window.open('/content/documentation/media/topology_kvm.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">KVM deployment of HP Helion OpenStack beta (opens in a new window)</a>

For detailed network requirements, see [HP Helion OpenStack&#174; Installation: Prerequisites](/helion/openstack/ga/install/prereqs/#network_prepare).

## Downloading the installation packages {#getinstall}

Before you begin, you must download the required HP Helion OpenStack installation packages:

1. Log in to your install system as root:

    `sudo su -`

2. Register and then log in to download the required installation packages from [HP Helion OpenStack product installation](https://helion.hpwsportal.com/#/Product/%7B%22productId%22%3A%221247%22%7D/Show).

***QUESTION: New files names?***
<table style="text-align: left; vertical-align: top; width:650px;">
	
<tr style="background-color: lightgrey; color: black;">
<td><b> Installation package </b></td><td><b>File name</b></td>

<tr style="background-color: white; color: black;">
<td>HP Helion OpenStack beta </td><td>HPHelionOpenStack_BetaJune30.tgz</td></tr>
</td></tr>

</table>


## Installing HP Helion OpenStack {#install}
After you have installed HP StoreVirtual VSA, make sure you have met all the hardware requirements and have completed the required tasks before you begin your installation. The following sections walk you through:

* [Configuring proxy information](#proxy)
* [Unpacking installation file](#unpackinstall)
* [Installing the seed VM and building your cloud](#startseed)

**IMPORTANT:** During the installation process, **DO NOT RESTART** the system running the installer and seed VM. Restarting this system disrupts the baremetal bridge networking configuration and disables both the undercloud and overcloud. If the system is inadvertently restarted, you must initiate the installation process again.


### Configure proxy information {#proxy}

***QUESTION: This was in beta install. Still needed in GA???***

Before you begin your installation, if necessary, configure the proxy information for your environment using the following steps:

1. Log in to your install system as root:

		sudo su -

2. Add the following lines to `/etc/environment`:

		export http_proxy=http://<web proxy IP/
		export https_proxy=http://web proxy IP/
		export no_proxy=localhost,127.0.0.1,<your 10.x IP address>

3. Log out and re-login to your baremetal server to activate the proxy configuration.

### Unpack the installation file ## {#unpackinstall}

1. Log in to your install system as root:

		sudo su -

2. Create a directory named `work`:

		mkdir /root/work
		cd /root/work

3. Extract the installation package to the `work` directory:

		tar zxvf /root/<baremetal kit name>.tgz

	This creates and populates a `tripleo/` directory within root's home directory.

### Install the seed VM and build your cloud ### {#startseed}

1. To start the seed VM installation, enter the following command:

		bash -x /root/work/tripleo/tripleo-incubator/scripts/hp_ced_start_seed.sh

	**Note**:The installation process takes approximately 10 minutes to complete.

	If the seed startup is successful, you should see a message similar to the following:

		"Wed Apr 23 11:25:10 IST 2014 --- completed setup seed"

2. To build the cloud, start by logging in to the seed VM. Run the following command from /root:

		ssh root@192.0.2.1 

	**Note**: It might take a few moments for the seed VM to become reachable. 

3. When prompted for host authentication, type `yes` to allow the ssh connection to proceed.

4. Make sure the information in the [`baremetal.csv` configuration file](/helion/openstack/ga/install/prereqs/#req-info) file is correct and in the following format and upload the file to `/root`.

	***QUESTION: Must use IPMI user vs ILO user in beta?***

		<mac_address>,<ipmi_user>,<ipmi_password>,<ipmi_address>,<no_of_cpus>,<memory_MB>,<diskspace_GB>

	**Notes**: 

	- There must be one entry in this file for each baremetal system you intend to install.
	- The first entry is used for the undercloud.
	- The second entry is the node with the lowest-specifications (CPU/RAM/Disk size) node in the overcloud.

	For example, your file should look similar to the following:

		78:e7:d1:22:5d:10,administrator,password,192.168.11.5,12,32768,2048   
		78:e7:d1:22:5d:58,administrator,password,192.168.11.1,8,16384,2048
		78:e7:d1:22:52:90,administrator,password,192.168.11.3,12,32768,2048
		78:e7:d1:22:5d:c0,administrator,password,192.168.11.2,12,32768,2048
		78:e7:d1:22:5d:a8,administrator,password,192.168.11.4,12,32768,2048
		78:e7:d1:22:52:9b,administrator,password,192.168.11.6,12,32768,2048

	**Note:** For more information on creating this file, refer to [Creating the baremetal.csv file](/helion/openstack/ga/install/prereqs/#req-info) on the *Prerequisites* page.

4. [Optional] If you have installed the IPMItool, use it to verify that network connectivity from the seed VM to the baremetal servers in your `baremetal.csv` is working.

	***QUESTION: Still optional? Not in https://rndwiki2.atlanta.hp.com/confluence/display/cloudos/ee_ga_ironic_quick_start#ee_ga_ironic_quick_start-BaremetalInstall.***

6. Manually power off each baremetal system specified in /root/baremetal.csv before proceeding with the installation. 

	**IMPORTANT:** Make sure that each system is configured in the BIOS to stay powered off in the event of being shutdown rather than automatically restarting.

7. Set the IP address of an NTP server accessible on the public interface for overcloud and undercloud hosts using the following commands.

	To set these variables:

		export OVERCLOUD_NTP_SERVER=192.0.1.128
		export UNDERCLOUD_NTP_SERVER=192.0.1.128

4. The `BRIDGE_INTERFACE` must be set to the name of the device connected to the private network that connects all baremetal nodes. This private network is also where these nodes PXE boot. The installation script assumes this device name is `eth0`. If your device is NOT named `eth0`, then determine its name and set the environment variable as shown below:

	***QUESTION: Still required? Not in https://rndwiki2.atlanta.hp.com/confluence/display/cloudos/ee_ga_ironic_quick_start#ee_ga_ironic_quick_start-BaremetalInstall.***

	To set this variable:

		export BRIDGE_INTERFACE=<devicename>

	For example:

		export BRIDGE_INTERFACE=eth5

8. The `FLOATING_START`, `FLOATING_END`, and `FLOATING_CIDR` variables control the range of IP addresses available for user VMs in the overcloud. You cannot have any active IP addresses within the Floating IP range. Complete the following steps to ensure the VSA IP does not land in this range.

	Currently, the defaults are set as below and can be changed with the `export` command.

	To set this variable:

		export FLOATING_START=192.0.2.45
		export FLOATING_END=192.0.2.254
		export FLOATING_CIDR=192.0.2.0/24

	*** QUESTION: Are statements in A, B and C accurate?***

	A. VSA uses 192.0.2.253. change the `FLOATING_END` to 192.0.2.200. If necessary, also change the `FLOATING_START` and `FLOATING_CIDR`. 

	B. Ensure the VSA system IP address is on the same network.

	C. Ensure the Floating IP range does not include the IP addresses that have been used for systems running VSA.

	**IMPORTANT**: If the VSA IP is within the Floating IP range, the last step of the installation fails.

9. Set `OVERCLOUD_NeutronPublicInterface` and `UNDERCLOUD_NeutronPublicInterface` to the name of the interface that carries Networking Operations service external traffic on your overcloud and undercloud. By default, it is `eth2`. The following example sets the value of the variable to `eth0`.

	To set these variables:

		export OVERCLOUD_NeutronPublicInterface=eth0
		export UNDERCLOUD_NeutronPublicInterface=eth0   

10. [Optional] You can configure a second network for API traffic and for the floating IP pool by setting `OVERCLOUD_NeutronPublicInterface` to a physically configured VLAN. 

	To set these variables:

		export OVERCLOUD_NeutronPublicInterface=vlan101 (ID of physically configured VLAN)
		export NeutronPublicInterfaceIP=192.0.8.2/21
		export NeutronPublicInterfaceRawDevice=eth0
		export NeutronPublicInterfaceDefaultRoute=192.0.8.1
		export FLOATING_START=192.0.8.20
		export FLOATING_END=192.0.15.254
		export FLOATING_CIDR=192.0.8.0/21

11. Set `OVERCLOUD_COMPUTESCALE` to the number of overcloud compute nodes to deploy. 

	If you do not specify a value, the value is derived based on the number of lines remaining in `/root/baremetal.csv` once the undercloud, overcloud controller, and overcloud swift nodes are removed.

	To set this variable:

		export OVERCLOUD_COMPUTESCALE=<nodes>

13. Set `OVERCLOUD_CINDER_LVMLOOPDEVSIZE` to change the size of the loopback device on your partition on the overcloud control node used to hold Volume Operations service volumes. For example, set this value higher if you plan to create snapshots of large bootable volumes. 

	The partition is a shared device, so the loopback device should not occupy the entire partition. The partition size is calculated as (approximately) diskspace_GB (from baremetal.csv) less root partition size of 30GB.

	The default Cinder LVM LOOP device size is set to 50000 (MB). 

	To set this variable:

		export OVERCLOUD_CINDER_LVMLOOPDEVSIZE=<size_MB>

14. Set `OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID` to assign a unique identifier. If you plan to run multiple installations of HP Helion OpenStack on the same network, each installation must be configured with a unique ID. The default value, if unset, is 51.

	HP Helion OpenStack uses keepalived to manage virtual IPs. keepalived uses these unique IDs to synchronise its activities. 

	To set this variable:

		export OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID=<ID>

15. Set `OVERCLOUD_VSASTORAGESCALE` to determine the number of VSA nodes configured.

	To set this variable:

		export OVERCLOUD_VSASTORAGESCALE=5

12. To enable HP StoreVirtual VSA, update the `tripleo/tripleo-incubator/scripts/configure_installer.sh` file in the seed with the VSA cluster information. You must change the configuration based on your specifications.

	***QUESTION: Still required? Not in https://rndwiki2.atlanta.hp.com/confluence/display/cloudos/ee_ga_ironic_quick_start#ee_ga_ironic_quick_start-BaremetalInstall.***

	To set these variables:

		export ENABLE_VSA="True"
		export VSA_API_URL="https://XXX.XXX.XXX.XXX:8081/lhos"
		export VSA_USERNAME="<user name>"
		export VSA_PASSWORD="<password>"
		export VSA_NAME="<cluster name>"
		export VSA_ISCSI_CHAP_ENABLED="False"
		export VSA_DEBUG="False"

    * **ENABLE_VSA** - Change to `True` to enable HP StoreVirtual VSA configuration. By default the value is `False`.
    
    * **VSA_API_URL** - Enter the IP address used to access your VSA cluster. 
    
    * **VSA_USERNAME** - Enter the cluster user name.
    
    * **VSA_PASSWORD** - Enter the cluster password.
    
    * **VSA_NAME** - Enter the name of the cluster.
    
    * **VSA&#95;ISCSI&#95;CHAP_ENABLED** - Change to `True` if you want to enable CHAP authentication.
    
    * **VSA_DEBUG** - By default the value is `False`; to enable debugging, change to `True`.

13. To install and configure the undercloud and overcloud, run the following command from /root. 

		bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh

	If your installation is successful, a message similar to the following is displayed:

		"HP - completed - Tue Apr 22 16:20:20 UTC 2014"

	**Note:** If `hp_ced_start_seed` fails to start the seed, need to restart the installation (step 1) and then follow the rest of the steps.

## Verify your installation

Once your installation is complete, you should ensure you can connect to your HP Helion OpenStack baremetal cloud.


### Verify the demo VM

Make sure you can access the demo VM. To do this, follow the steps below:

1. From the seed, export the overcloud passwords:

		. /root/tripleo/tripleo-overcloud-passwords

2. Export the undercloud users:

		TTE_DATAFILE=/root/tripleo/ce_env.json . /root/tripleo/tripleo-incubator/overcloudrc-user

3. Verify that the server is present:

		nova list

3. Assign the overcloud IP address to a variable:

		DEMO_IP=$(nova list | awk '/\| demo \|/{print $13}') 

4. With the IP address and root password, log in as the main user, root using the following command 

		ssh root@${DEMO_IP}


### Connect to the undercloud Horizon console ### {#monitoring}

Make sure you can access the undercloud Horizon dashboard. To do this, follow the steps below:

1. From the seed, run the following command.

		. /root/stackrc

2. Assign the undercloud IP address to a variable.

		UNDERCLOUD_IP=$(nova list | awk '/\| undercloud/{print $12}' | sed 's/ctlplane=//'); echo $UNDERCLOUD_IP

3. Determine the undercloud IP from the output of step 2 using the following command. It is in the last line returned.

		echo ${UNDERCLOUD_IP}

4. Obtain the undercloud admin password using the following command:

		UNDERCLOUD_ADMIN_PASSWORD=$(grep UNDERCLOUD_ADMIN_PASSWORD /root/tripleo/tripleo-undercloud-passwords | sed 's/UNDERCLOUD_ADMIN_PASSWORD=//'); echo $UNDERCLOUD_ADMIN_PASSWORD

4. From your install system, open a web browser and point to:

		http://<undercloud_IP>/

5. Log in as user 'admin' with the admin password.

		echo ${UNDERCLOUD_ADMIN_PASSWORD}

### Connect to the overcloud Horizon console ### {#connectconsole}

Make sure you can access the overcloud Horizon dashboard. To do this, follow the steps below:

1. From the seed, export the undercloud passwords.

		. /root/tripleo/tripleo-undercloud-passwords

2. Export the undercloud users.

		TE_DATAFILE=/root/tripleo/ce_env.json . /root/tripleo/tripleo-incubator/undercloudrc

3. Assign the overcloud IP address to a variable.

		OVERCLOUD_IP=$(nova list | grep "overcloud-controller" | awk ' { print $12 } ' | sed s/ctlplane=// ); echo $OVERCLOUD_IP

4. Obtain the overcloud admin password using the following command:

		OVERCLOUD_ADMIN_PASSWORD=$(cat /root/tripleo/tripleo-overcloud-passwords | grep OVERCLOUD_ADMIN_PASSWORD | sed s/OVERCLOUD_ADMIN_PASSWORD=//); echo $OVERCLOUD_ADMIN_PASSWORD

5. Determine the overcloud IP from the output of step 3 using the following command. It is in the last line returned.
  
		echo ${OVERCLOUD_IP}

7. From your install system, open a web browser and point to.

		http://<overcloud_IP>/

8. Log in to the overcloud Horizon dashboard as user `demo` with the password you obtained.


## Next Steps

- Configure HP StoreVirtual VSA. 

	HP StoreVirtual VSA Software is a Virtual Storage Appliance that provides the complete array functionality on top of Linux KVM environment without an external array hardware. It eliminates the need for external shared storage required to implement block storage features. It uses scale-out, distributed clustering to provide a pool of storage with enterprise storage features and simple management.

	For intructions, see the [Configuring HP StoreVirtual VSA for Block Storage](/helion/openstack/ga/install/vsa/) document. 

- Configure a Swift Scale-Out cluster

	An optional Swift Scale-Out cluster instance of between two and twelve servers that is used for production cloud Object storage use (Scale-Out Swift extends the Starter Swift Cluster enabling greater capacity while maintaining any initial data present in Starter Swift).

	For intructions, see the [Configuring HP StoreVirtual VSA for Block Storage](/helion/openstack/ga/install/vsa/) document. 

- Configure an HP 3Par storage array
- 
	An optional HP 3Par storage array that can be used to provide high performance Cinder block storage 

	For intructions, see the [HP Helion OpenStack&#174;: HP StoreServ (3PAR) Support](/helion/openstack/install/3par/) document.





- Install DNS as a service (DNSaaS) (Optional).

	Our managed DNS service, based on the OpenStack Designate project, is engineered to help you create, publish, and manage your DNS zones and records securely and efficiently to either a public or private DNS server network.

	For installation intructions, see [DNSaaS Beta Installation and Configuration](/helion/openstack/ga/install/dnsaas/).



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
