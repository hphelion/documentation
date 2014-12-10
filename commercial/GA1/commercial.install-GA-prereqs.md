---
layout: default
title: "HP Helion OpenStack&#174; Installation Prerequisites"
permalink: /helion/openstack/install/prereqs/
product: commercial.ga

---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--
<p style="font-size: small;"> <a href="/helion/openstack/install-overview/">&#9664; PREV</a> | <a href="/helion//"openstack>&#9650; UP</a> | <a href="/helion/openstack/install/kvm/">NEXT &#9654;</a> </p>
-->
# HP Helion OpenStack&#174; Installation: Prerequisites

Before you begin the installation process, take a few minutes to read this page for information about: 

* [Hardware and software requirements](#hardware)
* [Required tasks](#required)
	- [Preparing your network](#network_prepare)
		- [Preparing all networks](#network)
		- [Preparing the network for a KVM installation](#network_KVM)
		- [Preparing the network for an ESX installation](#network_ESX)
	- [Preparing the seed cloud host](#installer)
		- [Install Ubuntu 14.04 LTS](#ubuntu)
		- [Configure SSH](#ssh)
		- [Obtain a public key](#pub-key)
		- [Install Debian/Ubuntu packages](#packages)
		- [Install and configure NTP](#ntp)
		- [Download the installation packages](#getinstall)
		- [Editing the JSON Environment Variables File for Installation](#envars)
		- [Create the baremetal.csv file](#csv)
		- **OPTIONAL:** [Integrating LDAP (Lightweight Directory Access Protocol)](#ldap)
* [Next Steps](#nextstep)
* [For more information](#moreinfo)
<!--[Downloading installation packages](#install-pkg)-->

## Hardware and software requirements {#hardware}

For supported hardware and hardware requirements, and software requirements, see the [HP Helion OpenStack Support Matrix](/helion/openstack/support-matrix/).

## Required tasks {#required}

Make sure the following required tasks are completed before you begin the installation.

- [Preparing your network](#network_prepare)
	- [Preparing all networks](#network)
	- [Preparing the network for a KVM installation](#network_KVM)
	- [Preparing the network for an ESX installation](#network_ESX)
- [Preparing the seed cloud host](#installer)
	- [Install Ubuntu 14.04 LTS](#ubuntu)
	- [Configure SSH](#ssh)
	- [Obtain a public key](#pub-key)
	- [Install Debian/Ubuntu packages](#packages)
	- [Install and configure NTP](#ntp)
	- [Download the installation packages](#getinstall)
	- [Editing the JSON Environment Variables File for Installation](#envars)
	- [Create the baremetal.csv file](#csv)
	- **OPTIONAL:** [Integrating LDAP (Lightweight Directory Access Protocol)](#ldap) 

### Preparing the network {#network_prepare}

Before installing HP Helion OpenStack, you are responsible for preparing the network for all installations. You must also prepare the network based on the type of hypervisor you are installing, KVM or ESX. 

The network is not installed or managed by the cloud. You must install and manage the network and make sure there is a route to the Management network as described in this section.

#### Preparing all networks {#network}

To ensure a successful installation, you must satisfy these network configuration requirements:

* The machine hosting the seed VM, and all baremetal systems have to be connected to a management network. 

* Nodes on this management network must be able to reach the ILOS of the baremetal systems to enable host reboots as part of the install process.

* The Helion OpenStack architecture required that the IPMI network is a separate network and a route exists from management network to the IPMI network for ILO access as explained above.

* Ensure network interfaces that are not used for PXE boot are disabled from BIOS to prevent PXE boot attempts from those devices.

* If you have other DHCP servers on the same network as your system, you must ensure that the DHCP server does not hand out IP addresses to your physical nodes as they PXE boot.

* The network interface intended as the bridge interface should be configured and working before running the installer. The installer creates a network bridge on the system running the installer, attaching the bridge interface to the network bridge. The installer uses the IP address of the bridge interface for the network bridge.

In addition to preparing all HP Helion OpenStack cloud networks, you need perform additional  tasks based on which hypervisor you are using: [KVM](#network_KVM) or [ESX](#network_ESX).

#### Preparing the network for a KVM installation {#network_KVM}

If you are installing HP Helion OpenStack with KVM hypervisor support, you must configure your network as shown in the following diagram.

<a href="javascript:window.open('/content/documentation/media/topology_kvm.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack architecture diagram for KVM network architecture.</a>(opens in a new window)

You are responsible for providing the internal and external customer router and making sure the external, IPMI, and service networks are routed to and from the management network.

**Notes:**

- Distributed Virtual Routing (DVR) is used to route traffic between VMs and outside the cloud. As such, every Compute Node has a connection to the external network.
- Access to OpenStack service APIs is from the management network.
- The network path for platform service log messages is from the VM, to the service network (installed as a second vNIC), to the Customer Router, to  the management network, to the undercloud RabbitMQ, to LogStash.

#### Preparing the network for an ESX installation {#network_ESX}

If you are installing HP Helion OpenStack for ESX hypervisor support, you must configure your network as shown in the following diagram.

<a href="javascript:window.open('/content/documentation/media/topology_esx.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack architecture diagram for ESX network architecture.</a>(opens in a new window)

##### Installing networks for ESX ##### {#install_network_ESX}

For ESX deployments, you must install and configure two specific networks:

1. The **ESX network**. This network must be installed and configured for the VMware vCenter environment. The network is used for communication between specific aspects of vCenter:

	- the OVSvApp communicates with the Networking Operations service (Neutron) message queue 

	- the Compute service communicates with the vCenter Proxy

	- the vCenter Proxy communicates with the message queue for the Compute and Volume Operations services. 

	- the EON service sub-component communicates with the vCenter server.

<!-- Remove per Satya; move to KVM??
2. The **Service network**. This network is for trusted VMs in overcloud to communicate with cloud infrastructure components in undercloud. The service network is used by all services for accessing the logging, monitoring, and customer-provided network services such as NTP and LDAP. VMs will need to add a NIC and attach a VLAN address to get access. Authentication is through the Identity Management service, where this Neutron Provider Network is defined for a single project. 
-->

#### Other customer responsibilities and requirements for ESX {#other_network_ESX}

You are responsible for the following before beginning the HP Helion OpenStack installation:

- installing and configuring VMWare vSphere version 5.5;

- providing the customer router and making sure the external, IPMI, and service networks are routed to and from the management network;

- installing and managing the ESX network and for assigning IP addresses on it to the OVSvApp and vCenter Proxy nodes;

- providing a route for traffic between the Compute and Volume Operations services running on the vCenter Proxy node and the RabbitMQ and mySQL on the Cloud Controller:

	- The target IP addresses should be limited the ip addresses of the MySQL cluster nodes and RabbitMQ cluster nodes in the Over Cloud.
	- The Port numbers shall be limited to 5672 (RabbitMQ) and 3306 (MySQL)

- providing a route from the service subnet in the overcloud to the RabbitMQ on the undercloud controller:

	- The target IP addresses should be limited the ip addresses of the RabbitMQ cluster nodes in the undercloud.
	- The port numbers shall be limited to 5672 (RabbitMQ)

- providing a route from the EON service on the undercloud and the vCenter server;

- enabling VLAN trunking and native VLAN on the private network. This is to cater to untagged PXE traffic with the tenant.


### Preparing the seed cloud host {#installer}

The following tasks need to be performed on the seed cloud host, where the seed VM will be installed. The seed cloud host is alternatively known as the installer system.

- [Install Ubuntu 14.04 LTS](#ubuntu)
- [Configure SSH](#ssh)
- [Obtain a public key](#pub-key)
- [Install Debian/Ubuntu packages](#packages)
- [Install and configure NTP](#ntp)
- [Download the installation packages](#getinstall)
- [Create the JSON environment variables file](#envars)
- [Create the baremetal.csv file](#csv)
- [Integrating LDAP (Lightweight Directory Access Protocol)](#ldap)

#### Install Ubuntu 14.04 LTS {#ubuntuLTS}

The seed cloud host must have Ubuntu 14.04 LTS installed before performing the HP Helion OpenStack installation.

#### Configure SSH {#ssh}

On the seed cloud host, the OpenSSH server must be running and the firewall
 configuration should allow access to the SSH ports.

#### Obtain a public key {#pub-key}

On the seed cloud host, the user `root` must have a public key, for example:

	/root/.ssh/id_rsa
	/root/.ssh/id_rsa.pub

If user `root` does not have a public key, you can create one using the `ssh-keygen -t rsa -N ""` command.

#### Install Debian/Ubuntu packages {#packages}

Before starting the installation, you must first install Ubuntu 14.04 and the following required Debian/Ubuntu packages on the system running the installer:

- xrdp 
- xfce4 
- qemu-kvm 
- libvirt-bin 
- openvswitch-switch 
- openvswitch-common 
- python-libvirt 
- libssl-dev 
- libffi-dev 
- virt-manager 
- chromium-browser


Use the following command to install these packages:

	sudo apt-get install -y xrdp xfce4 libvirt-bin openvswitch-switch openvswitch-common python-libvirt qemu-kvm libssl-dev libffi-dev virt-manager chromium-browser

After you install the `libvirt` packages, you must reboot or restart `libvirt`: 

	sudo /etc/init.d/libvirt-bin restart

#### Install and configure NTP {#ntp}

NTP is a networking protocol for clock synchronization between computer systems. 

Before you start the installation, you must install NTP on the seed cloud host (installation system) and configure it as a NTP server. You will configure the undercloud and overcloud systems as NTP clients during the installation process.

For information on installing NTP on the seed cloud host, see HP Helion [OpenStack Installation: NTP Server](/helion/openstack/install/ntp/).

#### Download and unpack the installation package {#getinstall}

Before you begin, you must download the required HP Helion OpenStack installation package(s):


1. Register and then log in to download the required installation package(s) from [HP Helion OpenStack product installation](https://helion.hpwsportal.com/#/Product/%7B%22productId%22%3A%221247%22%7D/Show).

	* **For KVM installs**

		<table style="text-align:left; vertical-align:top; width:650px;">
	
		<tr style="background-color: lightgrey; color: black;">
		<td><b> Installation package </b></td><td><b>File name</b></td></tr>

		<tr>
		<td>HP Helion OpenStack</td><td>HP_Helion_OpenStack_1.0.1.tgz</td></tr>
		</table>

	* **For ESX installs**

		<table style="text-align: left; vertical-align: top; width:650px;">
	<tr style="background-color: lightgrey; color: black;">
	<td><b> Installation package </b></td><td><b>File name</b></td>
	<tr>
 	<td>HP Helion OpenStack</td><td>HP_Helion_OpenStack_1.0.1.tgz</td></tr>
	<tr>
	<td>HP Helion OpenStack vCenter Proxy Appliance</td>
	<td>overcloud_vcenter_compute_proxy_1.0.1.ova</td></tr>
 	<td>HP Helion OpenStack VCN Agent Appliance</td>
	<td>ovsvapp_1.0.1.tgz</td></tr>
	</table>

2. Log in to your seed cloud host as root:

        sudo su -

3. Copy the installation package to the seed cloud host.

4.  Extract the HP Helion OpenStack installation package to the `root` directory:

		tar zxvf /root/HP_Helion_OpenStack_1.0.1.tgz

	This creates and populates a `tripleo/` directory within the `root' directory.


#### Editing the JSON Environment Variables File for Installation #### {#envars}

To make the HP Helion OpenStack installation process easier, you can enter all of the environment variables required by the installer into a JSON file that will be executed automatically. A JSON file is included in the installation package that you can modify with your environment variables.

For information on editing the JSON environment variables file, see [Editing the JSON Environment Variables File for Installation](/helion/openstack/install/envars/).

#### Create the baremetal.csv file {#csv}

During the installation process after the seed VM is installed, the installer script looks for information about the baremetal systems. Specifically, it looks for this information in a file called `baremetal.csv`. Before you begin the installation process, you must create this file and upload the file to the installer system (called the seed cloud host) at the appropriate installation step. 

The baremetal.csv file informs the installer of the size of the Computer that each node will be installed into.

Specify the MAC address, CPU, memory, local disk size, IPMI address, and IPMI password values for each baremetal system you intend to install.

There must be one entry in this file for each baremetal system you intend to install. 

**Notes:** 

- The first line of the baremetal.csv file is the undercloud node. 
- The second line is what TripleO uses to construct the flavor for baremetal deployment. If your servers are not all the same size, specify the smallest sized server in the second position so it uses that size as the flavor for all of the overcloud nodes being deployed.The second entry must be the smallest sized disc.

Use the following format in the `baremetal.csv` file.

`<mac_address>,<ipmi_user>,<ipmi_password>,<ipmi_address>,<no_of_cpus>,<memory_MB>,<diskspace_GiB>`

Where `<mac_address>` is the MAC address of the network interface from which to boot. Do not use the iLO NIC interface.

**Important** The diskspace size value must be specified in Gibibytes, not Gigabytes.  For example:<br>
- 900GB = 838 GiB<br>
- 1TB = 1000GB = 931 GiB

**Example:** 

Your file should look similar to the following:

	78:e7:d1:22:5d:58,administrator,password,192.168.11.1,12,32768,1900
	78:e7:d1:22:52:9b,administrator,password,192.168.11.6,12,16384,800
	78:e7:d1:22:5d:10,administrator,password,192.168.11.5,12,32768,1900
	78:e7:d1:22:52:90,administrator,password,192.168.11.3,12,32768,1900
	78:e7:d1:22:5d:c0,administrator,password,192.168.11.2,12,32768,1900
	78:e7:d1:22:5d:a8,administrator,password,192.168.11.4,12,32768,1900
	78:e7:d1:22:52:9e,administrator,password,192.168.11.7,12,16384,800

When creating this file, keep in mind the following:

* The IPMI user and password **must have** ADMINISTRATOR privilege; it is not sufficient to have OPERATOR privilege
* Memory must be at least 32 GB
* Disk size must be greater than 512GiB
* The disk size specified should never exceed the physical disk size

**Important**: Make sure that the information specified is correct. If any node fails to install, you must restart the installation from the beginning.

#### Integrating LDAP (Lightweight Directory Access Protocol) {#ldap}
	
**OPTIONAL** The HP Helion OpenStack Identity service can use Lightweight Directory Access Protocol (LDAP)to integrate your organization's existing directory service and user account management processes. LDAP intergration must be performed during the HP Helion OpenStack installation process.

For information on integrating LDAP, see [HP Helion OpenStack&reg;: Integrating LDAP](/helion/openstack/install/ldap/).

## Next steps {#nextstep}
* [Installing and configuring on a KVM hypervisor](/helion/openstack/install/kvm)
* [Installing and configuring on an ESX hypervisor](/helion/openstack/install/esx/)
 
## For more information {#moreinfo}
For more information on HP Helion OpenStack, see:

* [Support matrix](/helion/openstack/support-matrix/) 
* [FAQ](/helion/openstack/faq/) 
* [Release notes](/helion/openstack/release-notes/) 

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---
