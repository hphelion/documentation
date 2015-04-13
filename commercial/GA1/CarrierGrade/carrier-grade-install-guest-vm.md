---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade: Create the DNS/NTP Data Center Network Management VM"
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

Login to horizon, VSD dashboard is done from this Guest VM only.
Copy the Ubuntu-Test.qcow2 to /var/lib/libvirt/images folder on your kvm host.
•	virsh define Ubuntu-Test.xml
•	virsh autostart Ubuntu-Test
•	virsh start Ubuntu-Test

The VM should be up in few min. Login to virt-manager to get to the VM or use “virsh console <vm>” from kvm host. From virt-manager, make sure your nic1 is br-kvm and nic2 is br-ctl
 
 
Update /etc/network/interfaces file to have CLM interface. You should see 2 interfaces, one for br-kvm which will be on eth0 and br-ctl[CLM] on eth1. Eth0 will be getting DHCP IP and eth1 is static. Update eth1 interface as shown in the snapshot.
  


Update /etc/resolv.conf file with dns server  
Install the packages on your guest VM to get the browser and Gnome tools
You can install the below list of packages on your guestVM to get xrdp session and other packages if you don’t see them from UbuntuTest qcow2 and if you are planning to bringup guest VM using Ubuntu ISO yourself. 

export http_proxy=http://proxy.houston.hp.com:8080
export https_proxy=http://proxy.houston.hp.com:8080

•	sudo su -l -c "apt-get install -y ntp firefox gedit xrdp xfce4 xorg gnome-core gnome-system-tools gnome-app-install"
•	Reboot the VM

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

•	vi /etc/apt/sources.list
add this line
deb http://dl.google.com/linux/deb/ stable non-free main

From Google Site:
Command line key installation for APT
On an APT-based system (Debian, Ubuntu, etc.), download the key and then use apt to install it.
•	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
Recent versions of apt-get will automatically attempt to verify packages on download. If an appropriate key is not found or if the package is corrupted, you will get a message like the following:
WARNING: The following packages cannot be authenticated!
packagename
•	apt-get update
•	apt-get install google-chrome-stable

                 If you are seeing issue with above step, download the bits and install.
                 wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
                 Deb package is also available in FTC Jump Server 15.242.209.6/D/DCN/Tools[ Login with CDL lab 
                 credentials]
                 then:  
•	“sudo dpkg -i ./google-chrome*.deb”
•	  sudo apt-get install -f
              
Now from FTC Jump server you should be able to  XRDP to guest session,  get to Browser and login to the VSD dashboard  once your VSD node is up.
URL: https://10.10.10.10:8443/  [IP of VSD]






<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---


