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

# HP Helion OpenStack&#174; Carrier Grade: Overview

<!-- From Helion-CSP-Edition.pptx  https://wiki.hpcloud.net/download/attachments/32052622/Helion-CSP-Edition.pptx?version=1&modificationDate=1426628637000&api=v2 -->

HP Helion OpenStack Carrier Grade integrates Wind River technologies with HP Helion OpenStack to enable carrier grade network functions virtualization (NFV) capabilities. 
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

## Role of SDN in NFV

<!-- From Helion-CSP-Edition.pptx  https://wiki.hpcloud.net/download/attachments/32052622/Helion-CSP-Edition.pptx?version=1&modificationDate=1426628637000&api=v2 -->

<img src="media/CGH-NVF-Env.png" />

	vCPE scenario example
		VNF A = vRouter (vPE)
		VNF B = vFirewall
		NF C = vWanOpt


	vEPC scenario example
		VNF A = vPGW/vSGW (vEPC)
		VNF B = URL Enrichment Engine
		VNF C = Video Optimizer

<img src="media/CGH-VNF-zoom.png" />

* A Single composite VNF can consist of multiple sub-component VNFs with their own specialized functionality (e.g. control plane, service plane, data plane)
* Each sub-component VNF can have multiple VMs utilized in a load-balanced fashion for scaling capacity 

	Example -
		VNFc A = VMs - A1, A2, A3, A4
		VNFc B = VMs - B1, B2, B3, B4
		VNFc C = VMs - C1, C2, C3, C4

* Some VNFs will want to pin user sessions to the same VM while some other VNFs will not care
* Each VM may have multiple vNICs and on multiple networks (intra-VNF, storage, external, management etc.)
* Some vNICs of a VNF could be using SR-IOV while others are connected to the vSwitch 

<img src="media/CGH-NVF-Global.png" />

HP Helion OpenStack offers many services based on the different OpenStack projects to provide the functionality you need. Visit the [HP Helion OpenStack Services Overview page](/helion/openstack/1.1/services/overview/) for a complete list of services. 


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
