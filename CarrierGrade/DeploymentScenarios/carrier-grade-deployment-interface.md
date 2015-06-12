---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): VM Network Interface Options"
permalink: /helion/openstack/carrier/deploy/interface/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: All

authors: Paul F

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/openstack/1.1/3rd-party-license-agreements/">&#9664; PREV</a> | <a href="/helion/openstack/1.1/">&#9650; UP</a> | NEXT &#9654; </p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): VM Network Interface Options

The Wind River Linux server supports both virtio and performance-optimized AVP network interface drivers.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

* **virtio** -  The standard interface type for I/O virtualization in Linux. This type can be used with the Linux bridge application or the router application described in these scenarios.

* **Accelerated Virtual Port (AVP)** - A high-performance virtual network interface available exclusively on the Wind River Linux server. This type can be used with the Linux bridge application, the DPDK-accelerated bridge application, or the router application
described in these scenarios.

The deployment scenarios demonstrate the use of AVP interfaces with three types of virtualized network functions (VNFs): a Linux bridge, a DPDK-accelerated bridge, and a router. This illustrates the flexibility provided by the HP Helion OpenStack Carrier Grade to adapt to different deployment scenarios.

The port assignments for the interfaces are based on the order in which the interfaces are arranged in the web administration interface, or defined in the command-line interface, when the instance is launched. The type of virtual network interface for each port is selected from a list in the web administration interface, or encoded in a `vif-model` attribute on the command line.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----