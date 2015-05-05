---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Create the DNS/NTP Data Center Network Management VM"
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

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Create a Virtual Data center for DNS/NTP Network Management

You can configure a virtual data center for DNS and NTP for your cloud using an installer file in the installation kit.

To configure a virtual datacenter:

1. Copy the `dns-ntp-server.qcow2` to /var/lib/libvirt/images folder on your kvm host.

2. Execute the following commands:

		virsh define dns-ntp-server.xml
		virsh autostart dns-ntp-server
		virsh start dns-ntp-server

	The VM should be up in few minutes. 

3. Use a tool, such as Virtual Machine Manager, to make sure that the network is configured with `br-ctl` for `NIC1`

4.  Launch the HLM Node console and log in using the following defaults:

		login: root
		Password: cghelion

5. Execute the `ntpd –q` command to synchronize the time with the NTP server.

6. Execute the `ntpq –p` command to make sure the NTP servers are listed.

## Next Step

[Create the Guest VM](/helion/openstack/carrier/install/guest-vm/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---


