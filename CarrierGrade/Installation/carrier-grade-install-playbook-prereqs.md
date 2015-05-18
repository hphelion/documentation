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

<p style="font-size: small;"><a href="/helion/openstack/carrier/support-matrix/">&#9664; Support Matrix</a> | <a href="/helion/openstack/carrier/install/bm/overview/">&#9650; Installation Overview</a>  | <a href="/helion/openstack/carrier/install/pb/network/prepare/"> Preparing the Network for Installation &#9654;</a> </p> 


# HP Helion OpenStack&#174; Carrier Grade (Beta): Installation Prerequisites

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

### Obtain a public key {#pub-key}

On the KVM host, the user `root` must have a public key, for example:

	/root/.ssh/id_rsa
	/root/.ssh/id_rsa.pub

If user `root` does not have a public key, you can create one using the `ssh-keygen -t rsa -N ""` command.

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


### Install Ubuntu packages {#packages}

Before starting the installation, you must first install  Ubuntu. 

1. Run the following all in one command to install packages:

	sudo su -l -c "apt-get install -y ntp firefox gedit xrdp xfce4 qemu-kvm libvirt-bin openvswitch-switch openvswitch-common python-libvirt qemu-system-x86 libssl-dev libffi-dev git python-virtualenv python-dev virt-manager xorg gnome-core gnome-system-tools gnome-app-install vlan sudo ansible"

2. Reboot the server


4. Log out and re-login to the KVM host to activate the proxy configuration.

### Configure the XRDP remote desktop display

Configure XRDP for the remote desktop connection to access the server remotely as follows.

1. Edit the `sesman.ini` file:

	vi /etc/xrdp/sesman.ini

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



### Download and unpack the installation packages {#getinstall}

Before you begin, you must download the required HP Helion OpenStack installation package(s):

1. Download and extract the `cg-hlm.qcow2` and `VSD qcow2` files to the images folder. 

2. Download and extract the `cg-infra-playbooks.tar.gz.gpg` file to the `/root` directory.  

		cd /root
		tar xjf /tmp/cg-infra-playbooks.tar.gz.gpg

	This will create the `/root/cg` directory and extract the contents into the directory.

2. Copy the `cg-hos.tar.gz.gpg` and `cg-hos-dcn.tar.gz.gpg` to the `/root/cg/` directory.

	The password to decrypt the files is `cghelion`.

### Update the Ansible group variables

Update Ansible variable file for your environment. 

1. Change to the Ansible group variables directory.

		cd /root/infra-ansible-playbooks/group_vars/

2. Edit the `all` file.

	a. Specify variables for HLM KVM network setup for BM Cloud 

	If your HLM KVM has static IP set this variable to 1 and 0 if you have DHCP IP:

		kvm_has_staticip: 0

	b. Specify your HLM KVM's primary interface name:

		cust_interfacename_kvmhost: em1

	c. Specify the static assigned IP for the HLM KVM:

		cust_staticip_kvmhost: 10.1.72.145
		cust_netmask_kvmhost: 255.255.255.0

	d. If you have a gateway for your KVM, uncomment the following line and change the IP to the correct gateway IP

		cust_gateway_kvmhost: 10.1.72.1

		vlan tag ids for various networks on base KVM
		clm_vlan_id: 1690
		bls_vlan_id: 1692
		dcm_vlan_id: 1550

	e. Leave the following setting as `0`:

		ovs_cloud_only:  0

	f. Optionally, change the user ID and password:

		hlm_login_id:       root
		hlm_password:       cghelion

	g. Configure the following variables are for CLM network IP details for HLM

		hlm_clmstaticip:    10.20.20.100
		hlm_clmnetmask:     255.255.255.0
		hlm_clmgateway:     10.20.20.1

	h. Specify the following variables starting with cobbler_ are inputs that are usually given to initcobbler.sh. Set accordingly.
		cobbler_pxestartip: 192.168.100.100
		cobbler_pxeendip:   192.168.100.200
		cobbler_pxestaticip: 192.168.100.2
		cobbler_pxenetmask: 255.255.255.0

	i. Set the location of your images that will be used by libvirt

		imagelocation:  /home/images

	j. Set the location of your infra-ansible-playbooks

		ansible_dir: ~/infra-ansible-playbooks

	k. Specify the following variables for VSD configuration

		dns_domain_name: helion.cg
		dns_address: 10.200.50.10
		vsd_address: 10.200.50.7
		vsd_gateway: 10.200.50.1
		vsd_netmask: 255.255.255.0
		vsd_name: vsd
		vsdimagename: VSD-3.0.0_HP_r3.0_16
		upstream_ntp_servers:
		   - 10.1.64.20
			- ""
	l. Save and close the file

### Configure SSH {#ssh}

On the KVM host, the OpenSSH server must be running and the firewall configuration should allow access to the SSH ports.

1. Enable root login:

		/etc/ssh/sshd_config set following: 
		PermitRootLogin yes

2. Disable strict host key checking:

	a. Navigate to the `config` file:

		cd ~/.ssh/config

	b. Set the `StrictHostKeyChecking` variable to No:

		StrictHostKeyChecking no

3. Restart SSH service

4. Configure the public key and passwordless SSH access. 

	a. Enter the following command:

		ssh-keygen -t rsa 

	b. Press Enter to use default path (/root/.ssh/id_rsa)

	c. Press enter for passphrase

	d. Press enter again to confirm the empty passphrase

	The output of the public key will display, similar to the following:

		ssh-copy-id 192.168.122.1 

	If you get a permission denied error, make sure you are logged in as root. 


## Next Step

[Prepare the Network for Installation](/helion/openstack/carrier/install/pb/network/prepare/)

----
