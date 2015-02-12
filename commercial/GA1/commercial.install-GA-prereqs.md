---
layout: default
title: "HP Helion OpenStack&#174; Installation Prerequisites"
permalink: /helion/openstack/install/prereqs/
product: commercial.ga
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

<p style="font-size: small;"><a href="/helion/openstack/technical-overview/">&#9664; Technical Overview | <a href="/helion/openstack/install/overview/test/">&#9650; Installation Overview</a> | <a href="/helion/openstack/install/kvm">Installing on a KVM hypervisor &#9654;</a> OR <a href="/helion/openstack/install/esx"> Installing on an ESX hypervisor&#9654;</a> </p> 


# HP Helion OpenStack&#174;: Installation Prerequisites

Before you begin the installation process, take a few minutes to read this page for information about: 

Make sure the following required tasks are completed before you begin the installation.

- Review the hardware and software requirements
- Preparing your network
- Preparing the seed cloud host:
	- Install Ubuntu 14.04 LTS
	- Configure SSH
	- Obtain a public key
	- Install Debian/Ubuntu packages
	- Install and configure NTP
	- Configure proxy information 
	- Download the installation packages
	- Create the JSON environment variables file
	- Create the baremetal.csv file
	- Set DNS servers name-resolution
	- Integrating LDAP (Lightweight Directory Access Protocol)

## Hardware and software requirements {#hardware}

Before you start, if you have not done so already, make sure your environment meets the hardware and software requirements. See the [HP Helion OpenStack Support Matrix](/helion/openstack/support-matrix/).


## Preparing the network {#network_prepare}

Before installing HP Helion OpenStack, you are responsible for preparing the network for all installations. You must also prepare the network based on the type of hypervisor you are installing, KVM or ESX. 

The network is not installed or managed by the cloud. You must install and manage the network and make sure there is a route to the Management network as described in this section.

See [Preparing the Networkp](/helion/openstack/install/prereqs/network/).


## Preparing the seed cloud host {#seed}

The following tasks need to be performed on the seed cloud host, where the seed VM will be installed. The seed cloud host is alternatively known as the installer system.

- Install Ubuntu 14.04 LTS
- Configure SSH
- Obtain a public key
- Install Debian/Ubuntu packages
- Install and configure NTP
- Configure proxy information 
- Download the installation packages
- Create the JSON environment variables file
- Create the baremetal.csv file
- Set DNS servers name-resolution
- Integrating LDAP (Lightweight Directory Access Protocol)

### Install Ubuntu 14.04 LTS {#ubuntu}

The seed cloud host must have Ubuntu 14.04 LTS installed before performing the HP Helion OpenStack installation.

### Configure SSH {#ssh}

On the seed cloud host, the OpenSSH server must be running and the firewall
 configuration should allow access to the SSH ports.

### Obtain a public key {#pub-key}

On the seed cloud host, the user `root` must have a public key, for example:

	/root/.ssh/id_rsa
	/root/.ssh/id_rsa.pub

If user `root` does not have a public key, you can create one using the `ssh-keygen -t rsa -N ""` command.

### Install Debian/Ubuntu packages {#packages}

Before starting the installation, you must first install Ubuntu 14.04 and the following required Debian/Ubuntu packages on the system running the installer:

- qemu-kvm 
- libvirt-bin 
- openvswitch-switch 
- openvswitch-common 
- python-libvirt 

Optionally, we recommend that you can install the following packages, which will enable to you interact with the installed nodes:
- xrdp 
- xfce4 
- libssl-dev 
- libffi-dev 
- virt-manager 
- chromium-browser


Use the following command to install these packages:

	sudo apt-get install -y xrdp xfce4 libvirt-bin openvswitch-switch openvswitch-common python-libvirt qemu-kvm libssl-dev libffi-dev virt-manager chromium-browser

After you install the `libvirt` packages, you must reboot or restart `libvirt`: 

	sudo /etc/init.d/libvirt-bin restart

### Install and configure NTP {#ntp}

NTP is a networking protocol for clock synchronization between computer systems. 

You must install NTP on the seed cloud host (installation system) and configure it as a NTP server. You will configure the undercloud and overcloud systems as NTP clients during the installation process.

For information on installing NTP on the seed cloud host, see HP Helion [OpenStack Installation: NTP Server](/helion/openstack/install/ntp/).

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
		provider_Network is your ESX management network

3. Log out and re-login to the seed cloud host to activate the proxy configuration.


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


### Editing the JSON Environment Variables File for Installation #### {#envars}

To make the HP Helion OpenStack installation process easier, you can enter all of the environment variables required by the installer into a JSON file that will be executed automatically. A JSON file is included in the installation package that you can modify with your environment variables.

For information on editing the JSON environment variables file, see [Editing the JSON Environment Variables File for Installation](/helion/openstack/install/envars/).


### Prepare baremetal.csv file ### {#csv}

Before installing, make sure you have created the `baremetal.csv` file that is required for installation.

The `baremetal.csv` file informs the installer of the size of each server that each node will be installed into.

For more information, see [Creating the baremetal.csv file](/helion/openstack/install/csv/) in *HP Helion OpenStack&reg; Installation: Prerequisites*.

### Set a default DNS name server {#name-resolution}

To set a default DNS name server for your HP Helion OpenStack Commercial cloud, refer to [Enabling Name Resolution from Tenant VMs in the Overcloud](/helion/openstack/name-resolution/) before installation.


### Integrating LDAP (Lightweight Directory Access Protocol) {#ldap}
	
**OPTIONAL** The HP Helion OpenStack Identity service can use Lightweight Directory Access Protocol (LDAP)to integrate your organization's existing directory service and user account management processes. LDAP intergration must be performed during the HP Helion OpenStack installation process.

For information on integrating LDAP, see [HP Helion OpenStack&reg;: Integrating LDAP](/helion/openstack/install/ldap/).

## Next step {#nextstep}

Depending upon your environment, click the appropriate link for the next step in the installation.

* [Installing and configuring on a KVM hypervisor](/helion/openstack/install/kvm)
* [Installing and configuring on an ESX hypervisor](/helion/openstack/install/esx/)
 
<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---
