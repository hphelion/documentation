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

#Performance of HP Helion Openstack

This section determines the performance of HP Helion OpenStack in terms of responsiveness and stability under a various workload. Scalability, reliability, and resource usage are the quality attributes of the system which are being measured for performance testing of this product. 

This page outlines a suggested order in which you can proceed and provides a table of maximum supported configuration values that you can use to plan your hypervisor. 




<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th>Parameters</th>
	<th><center>Maximum Numbers</center></th>
    </tr>
<tr style="background-color: white; color: black;">
	<td>Managed virtual machine instances  </td>
	<td>3,000</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Managed hypervisor hosts 
</td>
	<td>19
</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Managed virtual machine instances per hypervisor host 
</td>
	<td>50</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Number of Clusters per vCenter
</td>
	<td>10</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Number of vCenters
</td>
	<td>1</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Number of total self service portal users
</td>
	<td>25</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Number of simultaneous self service portal users 
</td>
	<td>25</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Number of projects
</td>
	<td>25</td>
</tr><tr style="background-color: white; color: black;">
	<td>Number of VMs per projects
</td>
	<td>358</td>
</tr><tr style="background-color: white; color: black;">
	<td>Number of images
</td>
	<td>2</td>
</tr><tr style="background-color: white; color: black;">
	<td>Number of flavors
</td>
	<td>2</td>
</tr><tr style="background-color: white; color: black;">
	<td>Number of external networks
</td>
	<td>1</td>
</tr><tr style="background-color: white; color: black;">
	<td>Number of Tenant private networks
</td>
	<td>25</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Number of private IP addresses
</td>
	<td>2929</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Number of floating IP addresses
</td>
	<td>2929</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Number of VMs belonging to a single security group
</td>
	<td>358</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Number of disk arrays
</td>
	<td>1</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Number of VMFS storage volumes (Created)
</td>
	<td>3850</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Number of VMFS storage volumes (Attached)
</td>
	<td>2946</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Instance creation speed in VMs/minute per region
</td>
	<td>25</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Delay in between Operations
</td>
	<td>10 second </td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Delay in between Cycles
</td>
	<td>0</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Number of VMs belonging to a single security group
</td>
	<td>358</td>
</tr>

The performance, scale and reliability of HP Helion OpenStack is tested in the following ESX environment:

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




 