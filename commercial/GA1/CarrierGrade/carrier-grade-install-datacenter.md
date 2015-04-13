---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade: Create the DNS/NTP Data Center Network Management VM"
permalink: /helion/openstack/carrier/install/datacenter/
product: carrier-grade

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

# HP Helion OpenStack&#174; Carrier Grade: Create a Virtual Data center for DNS/NTP Network Management

You can configure a virtual data center for DNS and NTP for your cloud using an installer file in the installation kit.

To configure a virtual datacenter:

1. Copy the `dns-ntp-server.qcow2` to /var/lib/libvirt/images folder on your kvm host.

		virsh define dns-ntp-server.xml
		virsh autostart dns-ntp-server
		virsh start dns-ntp-server

The VM should be up in few min. Login to virt-manager to get to the VM or use “virsh console <vm>” from kvm host.
Make sure if your NIC1 has br-ctl
 
You can login using root/cghelion
Run “ntpd –q” and check the output
Run “ntpq –p” command to see if the ntp servers are listed.



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---


