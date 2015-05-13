---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade: Overview"
permalink: /helion/openstack/carrier/overview/
product: carrier-grade

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"><a href="/helion/openstack/carrier/home/">&#9650; Documentation Home</a> | <a href="/helion/openstack/carrier/hlm/overview/"> Helion Lifecycle Management (HLM) Overview &#9654;</a></p>

# HP Helion OpenStack&#174; Carrier Grade: Overview

<!-- From Helion-CSP-Edition.pptx  https://wiki.hpcloud.net/download/attachments/32052622/Helion-CSP-Edition.pptx?version=1&modificationDate=1426628637000&api=v2 -->

HP Helion OpenStack Carrier Grade integrates Wind River Linux with HP Helion OpenStack to enable carrier grade network functions virtualization (NFV) capabilities. 

HP Helion OpenStack Carrier Grade is based on [HP Helion Openstack 1.1](/helion/openstack/1.1/) but with significantly enhanced and optimized functionality, availability, scale and  performance to meet the needs of NFV cloud deployments.

HP Helion OpenStack Carrier Grade uses multi-core HP Proliant rack-mounted servers with storage and networking along with the [Wind River Titanium Server](http://www.windriver.com/products/titanium-server/), [HP Distributed Cloud Networking](http://www8.hp.com/us/en/products/networking-switches/product-detail.html?oid=7268885), Kernel-based Virtual Machine (KVM), and virtual switch software for reliable and accelerated data plane.

HP will contribute enhancements and optimizations made to HP Helion OpenStack Carrier Grade for NFV to upstream Openstack.

HP Helion OpenStack Carrier Grade is sold, and supported as a separate software entity from HP Helion Openstack.


## Focus areas for HP Helion OpenStack Carrier Grade

<!-- From Helion-CSP-Edition.pptx  https://wiki.hpcloud.net/download/attachments/32052622/Helion-CSP-Edition.pptx?version=1&modificationDate=1426628637000&api=v2 -->

* Central control plane but resources are distributed across geography interconnected by WAN
* VNF resource requirement definition, policy based resource scheduling & placement
* VNF Orchestration - Policy based Auto-scaling
* Integrated Physical and Virtual resource monitoring and self-healing
* Highly Resilient and hitless upgrades
* High performance data plane 
* Integration with Opensource SDN controllers and service chaining

## Major Components in HP Helion OpenStack Carrier Grade

Hp Helion OpenStack Carrier Grade incorporates a number of proven technologies into a single environment. 

### Helion Lifecycle Management (HLM)

Helion Lifecycle Management (HLM) is an application that is used to deploy HP Helion OpenStack Carrier Grade and can be used for ongoing operations and maintenance of the system.

For more information, see [Helion Lifecycle Management (HLM) Overview](/helion/openstack/carrier/hlm/overview/).

### HP Helion OpenStack 

HP Helion OpenStack is a commercial-grade distribution of OpenStack, the leading open source cloud computing platform. This distribution, backed by HP, enables customers to more easily build, manage, and use open-source based hybrid cloud.

For more information, see [HP Helion OpenStack Overview](/helion/openstack/carrier/helion/overview/).

**Note:** The servers that comprise the HP Helion OpenStack cloud are referred to as hLinux servers in the HP Helion OpenStack Carrier Grade documentation.

### Wind River Linux

Wind River&#174; Linux is a Network Functions Virtualization (NFV) software platform, providing ultra-reliability and exceptional performance efficiencies for telecommunications networks.

For more information, see [Wind River Linux Overview](/helion/openstack/carrier/wr/overview/).


### Distributed Cloud Networking (DCN)

Distributed Cloud Networking (DCN) is a Software-Defined Networking (SDN) solution that provides data center (DC) network virtualization and automatically establishes connectivity between compute resources upon their creation.

For more information, see [Distributed Cloud Networking Overview](/helion/openstack/carrier/dcn/overview/).

HP Helion OpenStack offers many services based on the different OpenStack projects to provide the functionality you need. Visit the [HP Helion OpenStack Services Overview page](/helion/openstack/carrier/services/overview/) for a complete list of services. 


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
