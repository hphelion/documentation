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

* [Hardware configuration](#hardware)
* [Required tasks](#required)
* [Next Steps](#nextstep)
* [For more information](#moreinfo)
<!--[Downloading installation packages](#install-pkg)-->

## Hardware and software requirements<a name="hardware"></a>

For supported hardware and hardware requirements, and software requirements, see the [HP Helion OpenStack Support Matrix](/helion/openstack/support-matrix/).

## Required tasks<a name="required"></a>

Make sure the following required tasks are completed before you begin the installation.

- [Preparing your network](#network_prepare)
- [Obtain a public key](#pub-key)
- [Install Debian/Ubuntu packages](#packages)
- [Install and configure NTP](#ntp)
- [Create the baremetal.csv file](#csv)

### Preparing the network<a name="network_prepare"></a>

Before installing HP Helion OpenStack, you are responsible for [preparing the network](#network) for all installations. You must also prepare the network based on the type of hypervisor you are installing, [KVM](#network_KVM) or [ESX](#network_ESX). 

The network is not installed or managed by the cloud. You must install and manage the network and make sure there is a route to the Management network as described in this section.

#### Preparing all networks<a name="network"></a>

To ensure a successful installation, you must satisfy these network configuration requirements:

* The seed VM, the baremetal systems and the IPMI controller for all systems must be on the same network

* Ensure network interfaces that are not used for PXE boot are disabled from BIOS to prevent PXE boot attempts from those devices.

* If you have other DHCP servers on the same network as your system, you must ensure that the DHCP server does not hand out IP addresses to your physical nodes as they PXE boot.

* The network interface intended as the bridge interface should be configured and working before running the installer. The installer creates a network bridge on the system running the installer, attaching the bridge interface to the network bridge. The installer uses the IP address of the bridge interface for the network bridge.

#### Preparing the network for a KVM installation <a name="network_KVM"></a>

If you are installing HP Helion OpenStack with KVM hypervisor support, you must configure your network as shown in the following diagram.

<a href="javascript:window.open('/content/documentation/media/topology_kvm.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack architecture diagram for KVM network architecture.</a>(opens in a new window)

You are responsible for providing the internal and external customer router and making sure the external, IPMI, and service networks are routed to and from the management network.

**Notes:**

- Distributed Virtual Routing (DVR) is used to route traffic between VMs and outside the cloud. As such, every Compute Node has a connection to the external network.
- Access to OpenStack service APIs is from the management network.
- The network path for platform service log messages is from the VM, to the service network (installed as a second vNIC), to the Customer Router, to  the management network, to the undercloud RabbitMQ, to LogStash.

#### Preparing the network for an ESX installation <a name="network_ESX"></a>

If you are installing HP Helion OpenStack for ESX hypervisor support, you must configure your network as shown in the following diagram.

<a href="javascript:window.open('/content/documentation/media/topology_esx.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack architecture diagram for ESX network architecture.</a>(opens in a new window)

##### Installing networks for ESX #####

For ESX deployments, you must install and configure two specific networks:

1. The **ESX network**. This network must be installed and configured for the VMware vCenter environment. The network is used for communication between specific aspects of vCenter:

	- the OVSvApp communicates with the Networking Operations service (Neutron) message queue 

	- the Compute service communicates with the vCenter Proxy

	- the vCenter Proxy communicates with the message queue for the Compute and Volume Operations services. 

	- the EON service sub-component communicates with the vCenter server.

<!-- Remove per Satya; move to KVM??
2. The **Service network**. This network is for trusted VMs in overcloud to communicate with cloud infrastructure components in undercloud. The service network is used by all services for accessing the logging, monitoring, and customer-provided network services such as NTP and LDAP. VMs will need to add a NIC and attach a VLAN address to get access. Authentication is through the Identity Management service, where this Neutron Provider Network is defined for a single project. 
-->
##### Other customer responsibilities and requirements for ESX

You are responsible for the following before beginning the HP Helion OpenStack installation:

- installing and configuring VMWare vSphere version 5.5;

- providing the customer router and making sure the external, IPMI, and ESX networks are routed to and from the management network;

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
 
##### Storage nodes installed during installation

The initial installation of the cloud will install two initial Object Storage nodes. All additional Object Storage nodes will be installed using customer procedures after the initial install. 


### Preparing the seed cloud host<a name="installer"></a>

The following tasks need to be performed on the seed VM, known as the installer system.

- [Install Ubuntu 14.04 LTS](#ubuntu)
- [Obtain a public key](#pub-key)
- [Configure SSH](#ssh)
- [Install Debian/Ubuntu packages](#packages)
- [Install and configure NTP](#ntp)
- [Create the environment variables file](#envars)
- [Create the baremetal.csv file](#csv)

#### Install Ubuntu 14.04 LTS<a name="ubuntuLTS"></a>

The seed cloud host must have Ubuntu 14.04 LTS installed before performing the HP Helion OpenStack installation.

#### Configure SSH<a name="ssh"></a>

On the installer system, the OpenSSH server must be running and the firewall
 configuration should allow access to the SSH ports.

#### Obtain a public key <a name="pub-key"></a>

On the installer system (seed VM), the user `root` must have a public key, for example:

	/root/.ssh/id_rsa
	/root/.ssh/id_rsa.pub

If user `root` does not have a public key, you can create one using the `ssh-keygen -t rsa -N ""` command.

#### Install Debian/Ubuntu packages<a name="packages"></a>

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


#### Install and configure NTP<a name="ntp"></a>

NTP is a networking protocol for clock synchronization between computer systems. 

Before you start the installation, you must install NTP on the seed cloud host (installation system) and configure it as a NTP server. You will configure the undercloud and overcloud systems as NTP clients during the installation process.

For information on installing NTP on the seed cloud host, see HP Helion [OpenStack Installation: NTP Server](/helion/openstack/install/ntp/).

#### Create the environment variables file #### {#envars}

To make the HP Helion OpenStack installation process easier, you can enter all of the environment variables required by the installer into a file that will be executed automatically.

For information on creating the environment variables file, see [Creating an Environment Variables File for Installation](/helion/openstack/install/envars/).

#### Create the baremetal.csv file<a name="csv"></a>

During the installation process after the seed VM is installed, the installer script looks for information about the baremetal systems. Specifically, it looks for this information in a file called `baremetal.csv`. Before you begin the installation process, you must create this file and upload the file to the installer system (seed VM) at the appropriate installation step. 

The baremetal.csv file informs the installer of the size of the Computer that each node will be installed into.

There must be one entry in this file for each baremetal system you intend to install. 

`<BRIDGE_INTERFACEmacaddress>,<ipmi_user>,<ipmi_password>,<ipmi_address>,<no_of_cpus>,<memory_MB>,<diskspace_GiGB>`

Where `<BRIDGE_INTERFACE_mac_address>` is the MAC address of the bridge interface on the seed cloud host, for example `em2` or `eth2`.

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
* Disk size must be between 500GB/512GiB and 2TiB
* The disk size specified should never exceed the physical disk size

**Important**: Make sure that the information specified is correct. If any node fails to install, you must restart the installation from the beginning.

#### Integrating LDAP (Lightweight Directory Access Protocol)
	
The HP Helion OpenStack Identity service can use Lightweight Directory Access Protocol (LDAP)to integrate your organization's existing directory service and user account management processes. LDAP intergration must be performed during the HP Helion OpenStack installation process.

For information on integrating LDAP, see [HP Helion OpenStack&reg;: Integrating LDAP](/helion/openstack/install/ldap/).
<!--
## Downloading installation packages<a name="install-pkg"></a>

**PROCESS WILL CHANGE FOR GA!!!!!**???

The following packages are available to download from [HP Helion OpenStack product installation](https://helion.hpwsportal.com/#/Product/%7B%22productId%22%3A%221247%22%7D/Show) web site. Register, and then log in to download the required packages.


<table style="text-align: left; vertical-align: top;">


<tr style="background-color: #C8C8C8; text-align: left; vertical-align: top;">
<th width=25%>File name</th>
<th width=30%>Description</th>
<th width=10%>Contents</th>
<th>Size</th>
<th width=10%>Required</th>
</tr>


<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>HPHelionOpenStack_June30.tgz </td>
<td> HP Helion OpenStack install package </td>
<td>installation scripts and images </td>
<td> 5.3 GB </td>
<td> Yes </td>
</tr>

<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td>HPStoreVirtual_VSA_11.5.tgz</td>
<td>
HP StoreVirtual VSA package </td>
<td>HP_StoreVirtual_VSA_Installer_for_KVM.tgz</br></br>
CMC_11.5.01.0023.0_Installer_Linux.bin</br></br>
Linux ISO - hlinux-vsa-blaster-20140619.iso</br></br>
Automation scripts - pyVins.tgz</td>
<td> 1.8 GB</td>
<td>Yes - if you are using KVM hypervisor</td>
</tr>


<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td> HP_OVSvApp.zip
 </td>
<td> HP Virtual Cloud Networking (VCN) application package</td>
<td> OVS vApp ova file </br></br>Automation Scripts </td>
<td> 600 MB </td>
<td>Yes - if you are using ESX hypervisor </td>
</tr>


<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
<td> HP_dnsaas-installer_0.0.4b11.tar.gz
</td>
<td>HP Helion OpenStack DNSaaS package  </td>
<td> DNSaaS workload image </td>
<td> 2.5 GB </td>
<td>No - only if you require DNSaaS support</td>
</tr>

</table>

-->

## Next steps<a name="nextstep"></a>
* [Installing and configuring on a KVM hypervisor](/helion/openstack/install/kvm)
* [Installing and configuring on an ESX hypervisor](/helion/openstack/install/esx/)
 
## For more information<a name="moreinfo"></a>
For more information on HP Helion OpenStack Community, see:

* [Support matrix](/helion/openstack/support-matrix/) 
* [FAQ](/helion/openstack/faq/) 
* [Release notes](/helion/openstack/release-notes/) 

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*