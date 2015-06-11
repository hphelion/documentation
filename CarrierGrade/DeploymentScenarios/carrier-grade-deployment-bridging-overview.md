---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Bridging Scenario Overview"
permalink: /helion/openstack/carrier/deploy/bridging/overview/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Bridging Scenario Overview

The Bridging Scenario implements a Layer 2 test path using either Linux or DPDK-accelerated virtual bridges.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

The Bridging Scenario topology is illustrated in the following figure. The test path is shown as a red dotted line.

<img src="media/CGH-deploy-bridge-overview.jpg">

Two end users, user1 and user2, each launch an instance of the example guest image inside a virtual machine, deployed within the domain of corresponding tenants, tenant1 and tenant2. Inside each instance, a user application creates a bridge dynamically configured to operate in one of two modes:

* Layer 2 bridging in the Linux kernel
* Layer 2 bridging using an Intel DPDK-accelerated virtual switch

The selected mode of operation is passed to the instance using OpenStack user data.

To demonstrate the performance optimizations offered by the AVP and AVS features of the Wind River Linux server, the network interfaces in the test path use AVP network drivers in combination with the Linux or DPDK-accelerated bridging. You can also use standard Linux virtio network drivers in combination with standard Linux-kernel Layer 2 bridging, but this will yield poorer performance.

**Note:** To highlight DPDK and AVP performance without additional Layer 3 routing or application overhead, the Bridging Scenario uses a VM to bridge two tenant networks. This configuration can cause Spanning Tree Protocol (STP) failures in Layer 2 switches connected to the networks. Disabling STP on the switches, or on the bridged tenant network VLANs, is recommended.

See [Deploying the Bridging Scenario](/helion/openstack/carrier/deploy/bridging/deploy/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----
