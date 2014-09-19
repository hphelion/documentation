---
layout: default
title: "HP Helion OpenStack&#174; Installation and Configuration"
permalink: /helion/openstack/ga/install/prereqs/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/helion/openstack/install-overview/">&#9664; PREV</a> | <a href="/helion//"openstack>&#9650; UP</a> | <a href="/helion/openstack/install/kvm/">NEXT &#9654;</a> </p>

# HP Helion OpenStack&#174; Installation: Prerequisites

Before you begin the installation process, take a few minutes to read this page because it contains information about:

* [Hardware configuration](#hardware)
* [Required tasks](#required)
* [Downloading installation packages](#install-pkg)
* [For more information](#for-more-information)

## Hardware configuration ## {#hardware}

To install a HP Helion OpenStack baremetal multi-node configuration, you must have the following hardware configuration.

* At least 9 and up to 100 baremetal systems with the following configuration:

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

* An installer system to run the baremetal install and host the seed VM with the following configuration:

    * A minimum of 16 GB of physical memory
    * A minimum of 100 GB of disk space
    * Virtualization enabled 
    * Ubuntu 14.04 installed

    
* **Important** 
    * **Installer system** &mdash; The installer system (also called seed VM) might be reconfigured during the installation process so a dedicated system is recommended. Reconfiguration might include installing additional software packages, and changes to the network or visualization configuration.
    
    * **Installer package** &mdash; The installer currently uses only the first available disk; servers with RAID controllers need to be pre-configured to present their storage as a single logical disk. RAID across multiple disks is strongly recommended for both performance and resilience.

    * **Physical servers** &mdash; When installing HP Helion OpenStack, it is your responsibility to track the physical location (slot number and rack) and associated identifiers (such as MAC addresses) for each physical server to aid in future hardware maintenance. This is necessary because when HP Helion OpenStack is installed on physical servers, the TripleO automation tracks only the MAC network addresses of servers; the physical locations of servers are not tracked. This means there is no automated way to inform a service technician which slot or rack to go to when service is needed on a particular physical server. 

## Required tasks {#required}

On the installer system, ensure the following required tasks are completed before you begin the installation.

- [Preparing your network](#network_prepare)
- [Obtain a public key](#pub-key)
- [Install Debian/Ubuntu packages](#packages)
- [Install and configure NTP](#ntp)
- [Create the baremetal.csv file](#csv)

### Preparing the network {#network_prepare}

Before installing HP Helion OpenStack, you are responsible for [preparing the network](#network) for all installations. You must also prepare the network based on the type of hypervisor you are installing, [KVM](#network_KVM) or [ESX](#network_ESX). 

The network is not installed or managed by the cloud. You must install and manage the network and make sure there is a route to the Management network as described in this section.

#### Preparing all networks #### {#network}

To ensure a successful installation, you must satisfy these network configuration requirements:

* The seed VM, the baremetal systems and the IPMI controller for all systems must be on the same network

* Ensure network interfaces that are not used for PXE boot are disabled from BIOS to prevent PXE boot attempts from those devices.

* If you have other DHCP servers on the same network as your system, you must ensure that the DHCP server does not hand out IP addresses to your physical nodes as they PXE boot.

* The network interface intended as the bridge interface should be configured and working before running the installer. The installer creates a network bridge on the system running the installer, attaching the bridge interface to the network bridge. The installer uses the IP address of the bridge interface for the network bridge.

#### Preparing the network for a KVM instalation {#network_KVM}

If you are installing HP Helion OpenStack in a KVM deployment, you must configure your network as shown in the following diagram.

<a href="javascript:window.open('/content/documentation/media/topology_kvm.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack architecture diagram for KVM network architecture.</a>(opens in a new window)

You are responsible for providing the internal and external customer router and making sure the external, IPMI, and service networks are routed to and from the management network.

**Notes:**

- The HP Helion OpenStack installation installs the two initial Object Storage nodes. You can install additional Object Storage nodes after the initial install. 
- The Block Storage nodes are installed for deployments using the [StoreVirtual VSA driver](/helion/openstack/ga/install/vsa/) with the Object Storage service (Cinder). Object Storage can be configured to use drivers one or more of the following: StoreVirtual VSA, 3PAR, LVM.
- DVR is used to route traffic between VMs and outside the cloud. Thus, every Compute Node has a connection to the external network.
- Access to OpenStack service APIs is from the management network.
- The network path for Platform service log messages is from the VM, to the service network installed as a second vnic, to the Customer Router, to the management network, to the Under Cloud RabbitMQ, to LogStash.
<-- What does this mean?? -->

#### Preparing the network for an ESX installation {#network_ESX}

If you are installing HP Helion OpenStack in a ESX deployment, you must configure your network as shown in the following diagram.

<a href="javascript:window.open('/content/documentation/media/topology_esx.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack architecture diagram for ESX network architecture.</a>(opens in a new window)

##### Installing networks for ESX #####

For ESX deployments, you must install and configure two specific networks:

1. The **ESX network**. This network must be installed and configured for the VMware vCenter environment. The network is used for communication between specific aspects of vCenter:

	- the OVSvApp communicates with the Networking Operations service (Neutron) message queue 

	- the Compute service communicates with the vCenter Proxy

	- the vCenter Proxy communicates with the message queue for the Compute and Volume Operations services. 

	- the EON service sub-component communicates with the vCenter server.

2. The **Service network**. This network is for trusted VMs in overcloud to communicate with cloud infrastructure components in undercloud. The service network is used by all services for accessing the logging, monitoring as well as customer provided network services such as NTP and LDAP. VMs will need to add a NIC and attach a VLAN address to get access. Authentication is through the Identity Management service, where this Neutron Provider Network is defined for a single project. 

##### Other customer responsibilities and requirements for ESX #####

You are responsible for the following before beginning the HP Helion OpenStack installation:

- installing and configuring VMWare vSphere version 5.5; VMware vCenter management must be a part of the private network (192.0.2.x)

- providing the Customer Router and making sure the external, IPMI, and ESX networks are routed to/from the management network;

- providing the Customer Router and making sure the external, IPMI, and service networks are routed to and from the management network;

- installing and managing the ESX network and for assigning IP addresses on it to the OVSvApp and vCenter Proxy nodes;

- providing a route for traffic between the Compute and Volume Operations services running on the vCenter Proxy node and the RabbitMQ and mySQL on the Cloud Controller:
	- The target IP addresses should be limited the ip addresses of the MySQL cluster nodes and RabbitMQ cluster nodes in the Over Cloud.
	- The Port numbers shall be limited to 5672 (RabbitMQ) and 3306 (MySQL)

- providing a route from the service subnet in the overcloud to the RabbitMQ on the undercloud controller:

	- The target IP addresses should be limited the ip addresses of the RabbitMQ cluster nodes in the Under Cloud.
	- The Port numbers shall be limited to 5672 (RabbitMQ)

- providing a route from the EON service on the Under Cloud and the vCenter server;

- enabling VLAN trunking and native VLAN on the private network. This is to cater to untagged PXE traffic with the tenant.
 
##### Storage nodes installed during installation #####

The initial installation of the cloud will install two initial Object Storage nodes. All additional Object Storage nodes will be installed using customer procedures after the initial install. 


### Preparing the installer system ### {#installer}

The following tasks need to be performed on the seed VM, known as the installer system.

- [Obtaining a public key](#pub-key)
- [Configuring SSH](#ssh)
- [Installing Debian/Ubuntu packages](#packages)
- [Install and configure NTP](#ntp)
- [Creating the baremetal.csv file](#csv)

#### Configuring SSH #### {#ssh}

On the installer system, the OpenSSH server must be running and the firewall
 configuration should allow access to the SSH ports.

#### Obtaining a public key #### {#pub-key}

On the installer system (seed VM), the user `root` must have a public key, for example:

    `/root/.ssh/id_rsa`
    `/root/.ssh/id_rsa.pub`

If user `root` does not have a public key, you can create one using the `ssh-keygen -t rsa -N ""` command.

#### Installing Debian/Ubuntu packages #### {#packages}

Before starting the installation, you must first install the following required Debian/Ubuntu packages on the system running the installer:

* qemu
* openvswitch
* libvirt
* python-libvirt

On systems running Ubuntu 14.04, qemu-kvm is also required.

Use the following command to install these packages:

  `$ sudo apt-get install -y libvirt-bin openvswitch-switch python-libvirt qemu-system-x86 qemu-kvm`

After you install the `libvirt` packages, you must reboot or restart `libvirt`:

    $ sudo /etc/init.d/libvirt-bin restart


#### Install and configure NTP #### {#ntp}

NTP is a networking protocol for clock synchronization between computer systems. 

Before you start the installation, you must install NTP on the installer system (seed VM) and configure it as a NTP server. You will configure the undercloud and overcloud systems as NTP clients during the installation process.

For information on installing NTP on the seed VM, see HP Helion [OpenStack Installation: NTP Server](/helion/openstack/ga/install/ntp/).


#### Creating the baremetal.csv file #### {#csv}

**Note:** This section is for baremetal installations only.

During the installation process after the seed VM is installed, the installer script looks for information about the baremetal systems. Specifically, it looks for this information in a file called `baremetal.csv`. Before you begin the installation process, you must create this file and upload the file to the installer system (seed VM) at the appropriate installation step. 

There must be one entry in this file for each baremetal system you intend to install. The file must contain exactly five lines for the installation. 

`<mac_address>,<ipmi_user>,<ipmi_password>,<ipmi_address>,<no_of_cpus>,<memory_MB>,<diskspace_GB>`

**Example:** 

Your file should look similar to the following:

	78:e7:d1:22:5d:10,administrator,password,192.168.11.5,12,32768,2048
	78:e7:d1:22:5d:58,administrator,password,192.168.11.1,8,16384,2048
	78:e7:d1:22:52:90,administrator,password,192.168.11.3,12,32768,2048
	78:e7:d1:22:5d:c0,administrator,password,192.168.11.2,12,32768,2048
	78:e7:d1:22:5d:a8,administrator,password,192.168.11.4,12,32768,2048
	78:e7:d1:22:52:9b,administrator,password,192.168.11.6,12,32768,2048

When creating this file, keep in mind the following:

* The IPMI user and password **must have** ADMINISTRATOR privilege; it is not sufficient to have OPERATOR privilege
* Memory must be at least 32 GB
* Disk size should be at least 2 TB
* The disk size specified should never exceed the physical disk size

**Important**: Make sure that the information specified is correct. If any node fails to install, you must restart the installation from the beginning.

## Downloading installation packages ## {#install-pkg}

**PROCESS WILL CHANGE FOR GA!!!!!**

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



## Next steps
* [Installing and configuring on a KVM hypervisor](/helion/openstack/ga/install/kvm)
* [Installing and configuring on an ESX hypervisor](/helion/openstack/ga/install/esx/)
 
## For more information
For more information on HP Helion OpenStack Community, see:

* [Support matrix](/helion/openstack/ga/support-matrix/) 
* [FAQ](/helion/openstack/ga/faq/) 
* [Release notes](/helion/openstack/ga/release-notes/) 

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*