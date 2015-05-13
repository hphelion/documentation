---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Create the Guest VM"
permalink: /helion/openstack/carrier/install/guest-vm/
product: carrier-grade

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

# HP Helion OpenStack&#174; Carrier Grade (Beta): Create the Guest VM 

In order to configure and work with the Virtualized Services Directory (VSD), you must create a guest VM in the HP Helion OpenStack Carrier Grade cloud.

VSD is a module of the HP Distributed Cloud Networking Virtualized Services Platform (VSP) that serves as a policy, business logic and analytics engine for the abstract definition of network services.

On the KVM Host:

1. Copy the `Ubuntu-Test.qcow2` to the `/var/lib/libvirt/` images directory.

2. Execute the following commands:

		virsh define Ubuntu-Test.xml
		virsh autostart Ubuntu-Test
		virsh start Ubuntu-Test

	The VM should be up in few minutes. 

3. Use a tool, such as Virtual Machine Manager, to make sure that the network is configured with `br-kvm` for `NIC1` and `br-ctl` for `NIC2`.

4. Modify the `/etc/network/interfaces` file to add the CLM interface. 


	You should see two interfaces: one for `br-kvm` which will be on `eth0` and one for `br-ctl[CLM]` on `eth1`. The `eth0` interface receives DHCP IP and `eth1` is static, similar to the following:

		auto eth0
		iface eth0 inet dhcp

		auto eth1
		iface eth0 inet static
		address 10.10.20.50
		netmask 255.255.255.0
		up route add -net 10.20.20.50 netmask 255.255.255.0 gw 10.20.20.1

5. Update `/etc/resolv.conf` file to add IP address of the DNS server.

	**Example:**
		nameserver     191.72.1.1

## Install the packages on the guest VM to get the browser and Gnome tools

You can install the below list of packages on your guest VM to get xrdp session and other packages:

* Firefox browser
* GNOME editor
* xrdp remote desktop utility
* xfce4 desktop utility
* xorg X Window System
* GNOME desktop and tools

1. On the guest VM, set the HTTP proxy:

		export http_proxy=<ip_address>
		export https_proxy=<ip_address>

2. Use the following command to install the packages:

		sudo su -l -c "apt-get install -y ntp firefox gedit xrdp xfce4 xorg gnome-core gnome-system-tools gnome-app-install"

3. Reboot the VM

## Configure XRDP for the remote desktop connection to access the server remotely as follows.

1. Increase the maximum number of simultaneous session on terminal server to 50 by editing the `sesman.ini` file.

		vi /etc/xrdp/sesman.ini

		MaxSessions=1 to 50

2. Configure xfce4 to launch when starting Xorg, put xfce4-session in the ~/.xinitrc file: 

	echo "xfce4-session" > ~/.xinitrc

3. Restart xrdp:

	sudo /etc/init.d/xrdp restart

4. Switch to the root user:

	sudo -i

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

## Install Google Chrome Browser

Use the following commands to install Google Chrome browser on the guest VM.

1. Add the Google repository to your sources by adding the following line to the `sources.list` file:

		vi /etc/apt/sources.list

		deb http://dl.google.com/linux/deb/ stable non-free main

2. Download a repository key then use apt to install it.

		wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

3. Update your sources:
		sudo apt-get update

4. Install the package:

		sudo apt-get install google-chrome-stable

5. Verify that the guest VM is installed completely: 

	a. From the KVM host, use XRDP to guest VM  

	b. Launch the Google Chrome browser 

	c. Login to the VSD dashboard using the following URL when your VSD node is available:

		https://<VSD_IP_Address>:8443/  


## Next Step

 [Create the VSD Node](/helion/openstack/carrier/install/vsd-node/)


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---


