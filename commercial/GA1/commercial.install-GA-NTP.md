---
layout: default
title: "HP Helion OpenStack&#174; Edition: VSA Support"
permalink: /helion/openstack/ga/install/vsa/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/helion/openstack/install/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-overview/">&#9650; UP</a> | <a href="/helion/openstack/install/esx/">NEXT &#9654;</a> </p>


# HP Helion OpenStack&#174; Installation: NTP Server

This page provides detailed information on configuring the seed VM as a Network Time Protocol (NTP) server. NTP is a networking protocol for clock synchronization between computer systems. You will configure the undercloud and overcloud systems as NTP clients during the installation process.



Configure NTP:

Install ntp package
sudo apt-get install ntp

Verify if there are broadcasting ntp servers:
ntpq -pd
Note: stratum must be 10 or higher in order to use as a source

Add ntp servers to /etc/ntp.conf

Configure system timezone
/usr/bin/tzselect

The output should be placed in /etc/profile and executed on the command line

Note: if your ntp source is less than a stratum 10 you are effectively not syncing
so you must setup your host as the time source by fudging a stratum 10

Configure host as a time source
Add the following to /etc/ntp.conf to force a stratum 10

server 127.127.1.0
fudge 127.127.1.0 stratum 10

Restart ntp service
service ntp restart

Verify that your server is broacasting (you shoud see "*LOCAL(0)")
ntpq -pd

You can now point clients to your ntp server

Add your ntp server ip to the clinets "/etc/ntp.conf" file

Configure system timezone
/usr/bin/tzselect

The output should be placed in /etc/profile and executed on the command line

Restart ntp service
service ntp restart

Verify that you have a connection to the ntp server
ntpq -pd

Verify that your server shows client connections
ntpdc -c monlist

Troubleshooting
If your client (including your ntp server) has trouble syncing time you can try the following

Sync system time with system clock (and vice versa):

hwclock [--utc | --localtime] -s --hctosys (update system time based on hardware clock)
hwclock [--utc | --localtime] -w --systohc (update hardware clock based on system time)
hwclock [--utc | --localtime] --systz (update system time based on timezone)

Verify hardware clock time
hwclock -r

Verify system time
date

 

Check if NTP ports are blocked

sudo apt-get install nmap

sudo nmap -p123 -sU -P0 <localhost | known ntp host>
