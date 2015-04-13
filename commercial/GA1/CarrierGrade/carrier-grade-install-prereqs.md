---
layout: default
title: "HP Helion OpenStack&#174; 1.1: Installation Prerequisites"
permalink: /helion/openstack/carrier/install/prereqs/
product: carrier-grade
product-version1: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Michael B, 

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"><a href="/helion/openstack/1.1/technical-overview/">&#9664; Technical Overview</a> | <a href="/helion/openstack/1.1/install/overview/">&#9650; Installation Overview</a> | <a href="/helion/openstack/1.1/install/kvm">Installing on a KVM hypervisor &#9654;</a> OR <a href="/helion/openstack/1.1/install/esx"> Installing on an ESX hypervisor&#9654;</a> </p> 


# HP Helion OpenStack&#174; 1.1: Installation Prerequisites
[See the Helion OpenStack 1.0 version of this page](/helion/openstack/install/prereqs/)

Before you begin the installation process, take a few minutes to read this page for information about: 

Make sure the following required tasks are completed before you begin the installation.

- Review the hardware and software requirements
- Preparing your network
- Preparing the baremetal systems
- Preparing the seed cloud host:
	- Install Ubuntu Debian 8.
	- Configure SSH
	- Obtain a public key
	- Install Debian/Ubuntu packages
	- Install and configure NTP
	- Configure proxy information 
 	- Set DNS servers name-resolution
	- Disabling SR-IOV
	<!--
	- Download the installation packages
	- Create the JSON environment variables file
	- Create the baremetal.csv file
	- Integrating LDAP (Lightweight Directory Access Protocol) -->

## Hardware and software requirements {#hardware}

Before you start, if you have not done so already, make sure your environment meets the hardware and software requirements. See the [HP Helion OpenStack Support Matrix](/helion/openstack/1.1/support-matrix/).

<!-- hiding
## Preparing the network {#network_prepare}

Before installing HP Helion OpenStack, you are responsible for preparing the network for all installations. You must also prepare the network based on the type of hypervisor you are installing, KVM or ESX. 

The network is not installed or managed by the cloud. You must install and manage the network and make sure there is a route to the Management network as described in this section.

See the [Preparing the Network](/helion/openstack/1.1/install/prereqs/network/) page.
-->

## Preparing the baremetal systems {#prepbare}

Perform the following tasks on each baremetal system before starting the install:

- Configure the boot order with Network/PXE boot as the first option:
	- For example, to set the boot order for a HP SL390, from the iLO prompt enter `set system1/bootconfig1/bootsource5 bootorder=1`.
	- To unset, enter `set system1/bootconfig1/bootsource5 bootorder=5`.

- Configure the BIOS: 
	- to the correct date and time
	- seed cloud host configured in UTC (Coordinated Universal Time)
	- with only one network interface enabled for PXE/network boot and any additional interfaces should have PXE/network boot disabled
	- to stay powered off in the event of being shutdown rather than automatically restarting

- Update to the latest firmware recommended by the system vendor for all system components, including the BIOS, BMC firmware, disk controller firmware, drive firmware, network adapter firmware, and so forth.


## Preparing the seed cloud host {#seed}

The following tasks need to be performed on the seed cloud host, where the seed VM will be installed. The seed cloud host is alternatively known as the installer system.

- Install Ubuntu Debian 8.
- Configure SSH
- Obtain a public key
- Install Debian/Ubuntu packages
- Install and configure NTP
- Configure proxy information 
- Set DNS servers name-resolution
- Disabling SR-IOV
	<!--
	- Download the installation packages
	- Create the JSON environment variables file
	- Create the baremetal.csv file
	- Integrating LDAP (Lightweight Directory Access Protocol) -->

### Install Ubuntu or Debian 8  {#ubuntu}

The seed cloud host must have Ubuntu or Debian 8 installed before performing the HP Helion OpenStack installation.

### Configure SSH {#ssh}

On the seed cloud host, the OpenSSH server must be running and the firewall configuration should allow access to the SSH ports.

### Obtain a public key {#pub-key}

On the seed cloud host, the user `root` must have a public key, for example:

	/root/.ssh/id_rsa
	/root/.ssh/id_rsa.pub

If user `root` does not have a public key, you can create one using the `ssh-keygen -t rsa -N ""` command.

### Install Debian or Ubuntu packages {#packages}

Before starting the installation, you must first install Debian or Ubuntu. 

Run the following all in one command to install packages:

	sudo su -l -c "apt-get install -y ntp firefox gedit xrdp xfce4 qemu-kvm libvirt-bin openvswitch-switch openvswitch-common python-libvirt qemu-system-x86 libssl-dev libffi-dev git python-virtualenv python-dev virt-manager xorg gnome-core gnome-system-tools gnome-app-install vlan sudo"

<!--
For more information about the Debian or Ubuntu packages that are required for the seed cloud host, see [Support Matrix](/helion/openstack/carrier/support-matrix/).
-->

## Configure the xrdp display

When you connect to xrdp from some remote desktop applications, the xrdp display might appear gray. Use the following steps before starting the HP Helion OpenStack Carrier Grade installation to prevent the problem.

1. Update the startwm.sh file to point to the `xsession` file. The xsession program is a session manager.

	a. Open the `startwm.sh` file:

		vi /etc/xrdp/startwm.sh

	b. Modify the file as follows:

		!/bin/sh

		if [ -r /etc/default/locale ]; then
		. /etc/default/locale
		export LANG LANGUAGE
		fi

		. /etc/X11/Xsession
		. /usr/bin/startxfce4

	c. Save and close the file.

2. Restart the xrdp service:

	sudo /etc/init.d/xrdp restart


### Install and configure NTP {#ntp}

NTP is a networking protocol for clock synchronization between computer systems. 

The HP Helion OpenStack cloud nodes must be configured as NTP clients and point to the same NTP server.

You can install NTP on the seed cloud host and configure it as an NTP server. Or, you can use a pre-existing NTP server that is reachable from the management network.  You will also need to configure the undercloud and overcloud systems as NTP clients pointing to the NTP server you have chosen to use during the installation process.

For information on installing NTP on the seed cloud host, see [Installing an NTP Server](/helion/openstack/carrier/install/ntp/).

### Configure proxy information {#proxy}

Before you begin your installation on the seed cloud host, if necessary configure the proxy information for your environment using the following steps:

1. Launch a terminal and log in to your seed cloud host as root:

		sudo su -

2. Edit the `/etc/environment` file to add the following lines:

		export http_proxy=http://<web_proxy_IP>/
		export https_proxy=http://<web_proxy_IP>/
		export no_proxy=localhost,127.0.0.1,<your 10.x IP address>,<provider_network>
	
	Where:

		web_proxy_IP is your web proxy IP address.
		provider_network is your ESX management network

3. Log out and re-login to the seed cloud host to activate the proxy configuration.

<!-- Hiding for alpha
### Download and unpack the installation package {#getinstall}

Before you begin, you must download the required HP Helion OpenStack installation package(s):


1. Register and then log in to download the required installation package(s) from [HP Helion OpenStack product installation](https://helion.hpwsportal.com/#/Product/%7B%22productId%22%3A%221247%22%7D/Show).

	* **For KVM installs**

		<table style="text-align:left; vertical-align:top; width:650px;">
	
		<tr style="background-color: lightgrey; color: black;">
		<td><b> Installation package </b></td><td><b>File name</b></td></tr>

		<tr>
		<td>HP Helion OpenStack</td><td>HP_Helion_OpenStack_1.1.tgz</td></tr>
		</table>

	* **For ESX installs**

		<table style="text-align: left; vertical-align: top; width:650px;">
	<tr style="background-color: lightgrey; color: black;">
	<td><b> Installation package </b></td><td><b>File name</b></td>
	<tr>
 	<td>HP Helion OpenStack</td><td>HP_Helion_OpenStack_1.1.tgz</td></tr>
	<tr>
	<td>HP Helion OpenStack vCenter Proxy Appliance</td>
	<td>overcloud_vcenter_compute_proxy_1.1.ova</td></tr>
 	<td>HP Helion OpenStack VCN Agent Appliance</td>
	<td>ovsvapp_1.1.tgz</td></tr>
	</table>

2. Log in to your seed cloud host as root:

        sudo su -

3. Copy the installation package to the seed cloud host.

4.  Extract the HP Helion OpenStack installation package to the `root` directory:

		tar zxvf /root/HP_Helion_OpenStack_1.1.tgz

	This creates and populates a `tripleo/` directory within the `root' directory.

-->
<!--
### Editing the JSON Environment Variables File for Installation #### {#envars}

To make the HP Helion OpenStack installation process easier, you can enter all of the environment variables required by the installer into a JSON file that will be executed automatically. A JSON file is included in the installation package that you can modify with your environment variables.

For information, see [Editing the JSON Environment Variables File for Installation](/helion/openstack/1.1/install/envars/).
-->
<!--
### Prepare baremetal.csv file ### {#csv}

Before installing, ensure you have created the `baremetal.csv` file that is required for installation.

The `baremetal.csv` file informs the installer of the size of each server that each node will be installed into. In this file you can also specify the role (or node type) for each server so you use the right hardware for different tasks such as storage or compute.  


For more information, see [Creating the baremetal.csv file](/helion/openstack/1.1/install/csv/).
-->

### Set a default DNS name server {#name-resolution}

To set a default DNS name server for your HP Helion OpenStack Commercial cloud, refer to [Enabling Name Resolution from Tenant VMs in the Overcloud](/helion/openstack/carrier/name-resolution/) before installation.

<!--
### Integrating LDAP (Lightweight Directory Access Protocol) {#ldap}
	
**OPTIONAL** The HP Helion OpenStack Identity service can use Lightweight Directory Access Protocol (LDAP) to integrate your organization's existing directory service and user account management processes. LDAP intergration must be performed during the HP Helion OpenStack installation process.

For information on integrating LDAP, see [HP Helion OpenStack&#174;: Integrating LDAP](/helion/openstack/1.1/services/identity/integrate-ldap/).
-->

### Disabling SR-IOV ###
In the HP Helion OpenStack 1.1 release, there is a performance issue with hardware that is configured to support Single Root I/O Virtualization (SR-IOV) on undercloud nodes.

The problem appears as overcloud performance delays for certain operations, like attempting to SSH into a compute node. The problem is related to DNS performance. The DNS service for the overcloud is the dnsmasq process. Occasionally the openvswitch on the undercloud drops packets which are destined for the dnsmasq tap device. The reason the openvswitch occasionally has problems is due to it seeing the tap device MAC address as a source MAC address on eth0. This source MAC address can flap between the tap device and eth0. Properly, the source address should only be the tap device. Because SR-IOV is enabled, a broadcast from the tap device MAC address as source is being sent back by the NIC through eth0. To fix this problem, HP recommends that you disable SR-IOV in the NIC BIOS (not just in the kernel) on undercloud nodes.


## Next step {#nextstep}

[Prepare the Network for Installation](/helion/openstack/carrier/install/network/)

<!--
* [Installing and configuring on a KVM hypervisor](/helion/openstack/1.1/install/kvm)
* [Installing and configuring on an ESX hypervisor](/helion/openstack/1.1/install/esx/)
-->

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---
