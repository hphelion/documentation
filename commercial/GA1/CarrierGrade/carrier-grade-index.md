---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade: Documentation Home"
permalink: /helion/openstack/carrier/
product: carrier-grade

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

# HP Helion OpenStack&#174; Carrier Grade: Documentation Home

<!-- From Helion-CSP-Edition.pptx  https://wiki.hpcloud.net/download/attachments/32052622/Helion-CSP-Edition.pptx?version=1&modificationDate=1426628637000&api=v2 -->

Helion CSP is HP's Cloud Management SW for NFV Cloud in a Telco network environment

Helion CSP is based on HP Helion Openstack EE but with significantly enhanced and optimized functionality, availability, scale and  performance to meet the needs of NFV Cloud deployments

Helion CSP leverages (includes) WindRiver Linux, KVM and virtual switch SW for reliable and accelerated data plane

HP will contribute enhancements and optimizations made to Helion CSP for NFV to upstream Openstack

Helion CSP is sold, and supported as a separate SW entity from HP Helion Openstack EE

## Focus areas for Helion CSP

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

CGH-NVF-Env.png

vCPE scenario example
VNF A = vRouter (vPE)
VNF B = vFirewall
VNF C = vWanOpt


vEPC scenario example
VNF A = vPGW/vSGW (vEPC)
VNF B = URL Enrichment Engine
VNF C = Video Optimizer


CGH-VNF-zoom.png

* A Single composite VNF can consist of multiple sub-component VNFs with their own specialized functionality (e.g. control plane, service plane, data plane)
* Each sub-component VNF can have multiple VMs utilized in a load-balanced fashion for scaling capacity 

	Example -
		VNFc A = VMs - A1, A2, A3, A4
		VNFc B = VMs - B1, B2, B3, B4
		VNFc C = VMs - C1, C2, C3, C4

* Some VNFs will want to pin user sessions to the same VM while some other VNFs will not care
* Each VM may have multiple vNICs and on multiple networks (intra-VNF, storage, external, management etc.)
* Some vNICs of a VNF could be using SR-IOV while others are connected to the vSwitch 

CGH-NVF-Global.png

HP Helion OpenStack offers many services based on the different OpenStack projects to provide the functionality you need. Visit the [HP Helion OpenStack Services Overview page](/helion/openstack/1.1/services/overview/) for a complete list of services. 


##Get Started with HP Helion OpenStack {#getstart}

Use the following links and tools to begin working with HP Helion OpenStack:




<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
