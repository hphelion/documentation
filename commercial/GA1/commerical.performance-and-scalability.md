---
layout: default
title: "HP Helion OpenStack&#174; Object Operations Service Overview"
permalink: /helion/openstack/GA1/performance-and-scalability/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

#Performance of HP Helion OpenStack&reg;

Performance of HP Helion OpenStack is determined in terms of responsiveness and stability under various workloads. Scalability, reliability, and resource usage are the quality attributes of the system which are measured during performance testing. 

 
The performance, scalability, and reliability of HP Helion OpenStack is tested in the following ESX environment:

* 18 ESXi servers (9 Clusters)
* 3000 VM Instances
* 100 VLANs (no VXLAN support in ESX)
* 1000 Floating Point IPs
* 3000 Volume Attaches and Detaches
* 25 Concurrent Operations


##Resource requirements
The following resources are required to perform the test:

* Bare metal servers 
* 3PAR storage
* ESX compute clusters and vCenter
* hLinux ISO - hlinux-vsa-blaster-20140619.iso
* CE Installer Builds
* vCenter OVA
* OVSVAPP OVA
* Integrated Scripts