---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade: Create the Guest VM"
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

# HP Helion OpenStack&#174; Carrier Grade: Create the Guest VM 

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

Configure XRDP for the remote desktop connection to access the server remotely as follows.

Increase # of sessions
•	vi /etc/xrdp/sesman.ini
update the MaxSessions=1 to 50
echo "xfce4-session" > ~/.xinitrc
•	sudo /etc/init.d/xrdp restart
•	sudo –i

Update the below file to get your xrdp GUI display works as expected [to fix the gray screen display]

vi /etc/xrdp/startwm.sh

#!/bin/sh

if [ -r /etc/default/locale ]; then
  . /etc/default/locale
  export LANG LANGUAGE
fi

#. /etc/X11/Xsession
. /usr/bin/startxfce4
[ make sure you add a space after “.”]

               sudo /etc/init.d/xrdp restart

Install Google Chrome Browser

	vi /etc/apt/sources.list
add this line
deb http://dl.google.com/linux/deb/ stable non-free main

From Google Site:
Command line key installation for APT
On an APT-based system (Debian, Ubuntu, etc.), download the key and then use apt to install it.
		wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
Recent versions of apt-get will automatically attempt to verify packages on download. If an appropriate key is not found or if the package is corrupted, you will get a message like the following:
WARNING: The following packages cannot be authenticated!
packagename
		apt-get update
		apt-get install google-chrome-stable

                 If you are seeing issue with above step, download the bits and install.
                 wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
                 Deb package is also available in FTC Jump Server 15.242.209.6/D/DCN/Tools[ Login with CDL lab 
                 credentials]
                 then:  
	"sudo dpkg -i ./google-chrome*.deb"
	sudo apt-get install -f
              
Now from FTC Jump server you should be able to  XRDP to guest session,  get to Browser and login to the VSD dashboard  once your VSD node is up.
URL: https://10.10.10.10:8443/  [IP of VSD]






<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---


