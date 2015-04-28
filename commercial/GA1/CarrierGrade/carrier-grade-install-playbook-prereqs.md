---
layout: default
title: "HP Helion OpenStack&#174; Installation Overivew"
permalink: /helion/openstack/carrier/install/pb/prereqs/
product: carrier-grade

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Installation Prerequisites

This document describes the prerequisite steps and one time setup on your KVM host required to install HP Helion OpenStack Carrier Grade in a baremetal environment.

## Hardware and software requirements {#hardware}

Before you start, if you have not done so already, make sure your environment meets the hardware and software requirements. See the [HP Helion OpenStack Support Matrix](/helion/openstack/1.1/support-matrix/).

## Preparing the baremetal systems {#prepbare}

Perform the following tasks on each baremetal system before starting the install:

- Configure the boot order with Network/PXE boot as the first option:
	- For example, to set the boot order for a HP SL390, from the iLO prompt enter `set system1/bootconfig1/bootsource5 bootorder=1`.
	- To unset, enter `set system1/bootconfig1/bootsource5 bootorder=5`.

- Configure the BIOS: 
	- to the correct date and time
	- KVM host configured in UTC (Coordinated Universal Time)
	- with only one network interface enabled for PXE/network boot and any additional interfaces should have PXE/network boot disabled
	- to stay powered off in the event of being shutdown rather than automatically restarting

- Update to the latest firmware recommended by the system vendor for all system components, including the BIOS, BMC firmware, disk controller firmware, drive firmware, network adapter firmware, and so forth.


## Preparing the KVM host {#kvm}

The following tasks need to be performed on the KVM host, the system where the you will launch the HP Helion OpenStack Carrier Grade installation. 

- Install Ubuntu Server 14.04.2 LTS
- Configure SSH
- Obtain a public key
- Install Debian/Ubuntu packages
- Configure the xrdp display
- Install and configure NTP
- Configure proxy information 
- Set DNS servers name-resolution
- Disabling SR-IOV
	<!--
	- Download the installation packages
	- Create the JSON environment variables file
	- Create the baremetal.csv file
	- Integrating LDAP (Lightweight Directory Access Protocol) -->

### Install Ubuntu Server 14.04.2 LTS  {#ubuntu}

The KVM host must have Ubuntu Server 14.04.2 LTS installed before performing the HP Helion OpenStack Carrier Grade installation.

### Configure SSH {#ssh}

On the KVM host, the OpenSSH server must be running and the firewall configuration should allow access to the SSH ports.

### Obtain a public key {#pub-key}

On the KVM host, the user `root` must have a public key, for example:

	/root/.ssh/id_rsa
	/root/.ssh/id_rsa.pub

If user `root` does not have a public key, you can create one using the `ssh-keygen -t rsa -N ""` command.

### Install Ubuntu packages {#packages}

Before starting the installation, you must first install  Ubuntu. 

1. Run the following all in one command to install packages:

	sudo su -l -c "apt-get install -y ntp firefox gedit xrdp xfce4 qemu-kvm libvirt-bin openvswitch-switch openvswitch-common python-libvirt qemu-system-x86 libssl-dev libffi-dev git python-virtualenv python-dev virt-manager xorg gnome-core gnome-system-tools gnome-app-install vlan sudo ansible

2. Reboot the server

### Configure proxy information {#proxy}

Before you begin your installation on the KVM host, if necessary configure the proxy information for your environment using the following steps:

1. Launch a terminal and log in to your KVM host as root:

		sudo su -

2. Edit the `/etc/environment` file to add the following lines, using values specific to your environment:

		PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
		export http_proxy=http://<web_proxy_IP>/
		export https_proxy=http://<web_proxy_IP>/
		export no_proxy=localhost,127.0.0.1,<your 10.x IP address>,<provider_network>
	
	Where:

		web_proxy_IP is your web proxy IP address.
		provider_network is your ESX management network

3. Source the `environments` file:

		source /etc/environment

4. Log out and re-login to the KVM host to activate the proxy configuration.

### Configure the XRDP remote desktop display

Configure XRDP for the remote desktop connection to access the server remotely as follows.

1. Edit the `sesman` file:

	vi /etc/xrdp/startwm.sh

	a. Update the `MaxSessions=1` to `MaxSessions=50`.

	b. Configure the system to use XRDP:

		echo "xfce4-session" > ~/.xinitrc

	c. Save and close the file.

2. Restart the xrdp service:

	sudo /etc/init.d/xrdp restart

### Install and configure NTP {#ntp}

NTP is a networking protocol for clock synchronization between computer systems. 

The HP Helion OpenStack cloud nodes must be configured as NTP clients and point to the same NTP server.

You can install NTP on the KVM host and configure it as an NTP server. Or, you can use a pre-existing NTP server that is reachable from the management network.  You will also need to configure the undercloud and overcloud systems as NTP clients pointing to the NTP server you have chosen to use during the installation process.

For information on installing NTP on the KVM host, see [Installing an NTP Server](/helion/openstack/carrier/install/ntp/).

### Download and unpack the installation package {#getinstall}

Before you begin, you must download the required HP Helion OpenStack installation package(s):

1. Download and extract the `infra-ansible-playbook` file to the `/root` directory.  

		cd /root
		tar xjf /tmp/cg-hos-infraplaybooks.tar.bz2

	This will create the /root/infra-ansible-playbooks directory and extract the contents into the directory.

2. Copy the `cg-hos.tar.gz.gpg` and `cg-hos-dcn.tar.gz.gpg` to the `/root/infra-ansible-playbooks/roles/HLM-CFG/` directory.

3. Update `/root/infra-ansible-playbooks/group_vars/all` file to specify the location of your `libvirt` images folder. 

		imagelocation=<libvirt_images_folder_location>

4. Edit the `\ansible-playbooks\roles\HLM-PRE-REQ\defaults\main.yml` file to specify the KVM host primary interface IP under, in case of Static IP on KVM Host

5. Check hosts file under /root/infra-ansible-playbooks, make sure your hlm_kvm_host ip is correct

		[hlm_kvm_host]

		192.168.122.1

6. Create `br-ctl` bridge and virtual network by running:

		ansible-playbook -i hosts hlm-kvm-pre-req.yml

	This will drop an extra file under `/etc/network/`.  

7. Do following via iLO console interface

	* If your KVM host has a DHCP IP, edit the `dhcpipinterface` file as needed, and save the file as `interfaces`.
	
	* If your KVM host has a STATIC IP, edit the `staticipinterface` file as needed, and save the file as `interfaces`.

8. Use the `ifconfig -a` command to output OVS bridge details. If the bridge is not present, execute the following commands to restart the bridge:

		ifdown br-ctl
		ifdown << yourinterface >>
		ifup br-ctl
		ifup << yourinterface >>

9. Run the following command to make sure `br-ctl` has the IP address that was earlier set to the primary interface.

		`ifconfig | more`

9. Reboot the setup.

10. Run the following command to make sure `br-ctl` has the IP address that was earlier set to the primary interface and primary interface does not have an IP address.

		`ifconfig | more`

11. Use the following command to view the results of the routing configuration:

		route -n
 
	The routing table should appear similar to the following:

	<img src="media/CGH-install-route-table.png" />

## Next Step

[Create the HLM Virtual Machine](/helion/openstack/carrier/install/pb/hlm-vm/)

----
