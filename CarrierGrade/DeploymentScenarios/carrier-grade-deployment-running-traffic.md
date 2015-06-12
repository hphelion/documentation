---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Running Traffic Through the Test Paths"
permalink: /helion/openstack/carrier/deploy/running-traffic/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Running Traffic Through the Test Paths

You can exercise the HP Helion OpenStack Carrier Grade components by running test traffic through the test path for the [Bridging Scenario Overview](/helion/openstack/carrier/deploy/bridging/overview/) or [Routing Scenario Overview](/helion/openstack/carrier/deploy/routing/overview/).

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

## Bridging Scenario Connections

To connect test equipment for a Bridging Scenario, you require the following:

* Access to an edge Layer 2 switch connected to the physical network on which the provider networks `provider-net-a` and `provider-net-b` are implemented. The switch must be configured for connection to the tenant networks `tenant1-net` and `tenant2-net`, realized on the provider networks.

	For switch connectivity details, consult the admin user.

* The VLAN IDs for the tenant networks on the provider network. You can obtain this information from the admin user. 

Connect a traffic generator and analyzer ports to the appropriate ports on the Layer 2 switch, using the appropriate VLANs.

Test performance is influenced substantially by the following factors:

* the type of virtual switch deployed in each tenant (Linux-native bridging or DPDK-accelerated)

* the type of virtual interface used to attach to the tenant networks (virtio or AVP)

The possible combinations are ranked from highest to lowest performance as follows:

1. DPDK-accelerated switch with AVP network interfaces (best performance)

2. Linux-native bridging with AVP network interfaces

3. Linux-native bridging with virtio network interfaces (poorest performance)

## Routing Scenario Connections

To connect test equipment for a Routing Scenario, you require the following:

* A connection to the physical network on which the provider networks provider-net-a and provider-net-b are implemented. The connection can be direct or through a Layer 3 edge router.

* The IP subnets assigned to the tenant networks `tenant1-net` and `tenant2-net`.

Connect a traffic generator and analyzer ports to the physical network,configured with IP addresses on the appropriate subnets.

Test performance is influenced by the use of virtio network interfaces or AVP network interfaces, with AVP providing better performance.

## Test Recommendations

For realistic performance figures, follow these recommendations:

* Use bidirectional test traffic. This gives the virtual switches in the test path, both Linux-native and DPDK-accelerated, as well as all other physical switches involved in the connection, the opportunity to populate the MAC address-to-port tables for both directions, minimizing the amount of flooded traffic.

One-way traffic is not typical of a real-world deployment, in which
there is always at least a small amount of traffic in each direction. One-way traffic results in CPU-intensive activity as packets are sent to all destination ports instead of one port. In addition, HP Helion OpenStack Carrier Grade server implements flooded-packet throttling to protect VMs, limiting the rate to 100Mb/s per virtual switch CPU. The effect is to reduce the overall
switching throughput substantially.

* Use at least 20 different IP-5-tuple traffic flows. The AVS switch on the compute node host and the switches of the example guest images implement software-based multi-core switching that balances traffic across multiple cores based on IP-5-tuple flows. Fewer IP-5-tuple flows translate into sub-optimal flow balancing decisions, which in turn translate into poor usage of the available cores.

* Consider the effect of packet size on performance. At the platform level, larger packets require less packet processing overhead. At the application level, larger packets may or may not require more processing overhead, depending on the nature of the application.



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----