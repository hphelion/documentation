---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Reference Deployment Scenarios"
permalink: /helion/openstack/carrier/deploy/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Reference Deployment Scenarios

You can use the deployment scenarios to familiarize yourself with the Wind River Linux server and evaluate its performance.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

Two deployment scenarios are described: a Bridging Scenario that uses two virtual L2 switches, and a Routing Scenario that uses two virtual L3 switches. In each scenario, two VM instances are launched, and a test path is established between them for performance evaluations.

Both scenarios use AVP network drivers for the test path. For each VM, an additional connection is established, using Linux virtio drivers, to a management network used for provisioning.
With each scenario in place, you can attach testing equipment to the private tenant networks in order to evaluate throughput, latency, and other statistics of interest. Traffic generators can be used to send packets along the test path to exercise the different virtual applications and networks. For more information, see Running Traffic Through the Test Paths on page 60.

The scenarios demonstrate several aspects of the Wind River Linux server, including:

* a multi-tenant environment
* vlan-tagged tenant networks
* use of huge pages for high-performance networking
* use of unmodified virtio network drivers
* use of accelerated AVP Kernel network drivers
* use of accelerated AVP Poll Mode network drivers for DPDK
* use of virtual routers to connect tenant networks
* metadata server access for distributing configuration data


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----
