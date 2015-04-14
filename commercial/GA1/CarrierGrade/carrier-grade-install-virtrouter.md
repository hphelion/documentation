---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Create a Virtual Router During Installation"
permalink: /helion/openstack/carrier/install/virt-router/
product: carrier-grade

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Create a Virtual Router During Installation 

You can configure a virtual router for your cloud using an installer file in the installation kit.

To configure a virtual router:

1. Copy the `router.qcow2` to `/var/lib/libvirt/images` folder on the KVM host.

	* virsh define router.xml
	* virsh autostart router
	* virsh start router

	The VM should be up in few min. Login to virt-manager to get to the VM or use `virsh console <vm>` from kvm host.

2. Use a tool, such as Virtual Machine Manager, to make sure that the network is configured with `br-kvm` for `NIC1` and `br-ctl` for `NIC2`.
 
3. Make sure that you can connect to an external [NTP server](/helion/openstack/carrier/install/ntp/) and check that you can connect to an external network after exporting the proxy.

## Next Step:

[Create a Virtual Data center for DNS/NTP Network Management](/helion/openstack/carrier/install/datacenter/).


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---


