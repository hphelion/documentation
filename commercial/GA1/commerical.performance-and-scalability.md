---
layout: default
title: "HP Helion OpenStack&#174; Object Operations Service Overview"
permalink: /helion/openstack/GA1/performance-and-scalability/
product: commercial.ga

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

# HP Helion 1.0 OpenStack&#174;: Measuring Performance of HP Helion OpenStack&reg;

Performance of HP Helion OpenStack is determined in terms of responsiveness and stability under various workloads. Scalability, reliability, and resource usage are the quality attributes of the system which are measured during performance testing. 

## ESX
 
The performance, scalability, and reliability of HP Helion OpenStack is tested using the following ESX environment:


* 19 ESXi servers (9 Clusters)
* 3000 VM Instances
* 2930 Floating Point IPs
* 3000 Volume Attaches and Detaches
* 25 Concurrent Operations


##Resource requirements
The following resources are required to perform the test: <!-- do we need to mention the resources?? -->

##Maximum supported configuration values for HP Helion OpenStack

The following table list the maximum supported configuration value for HP Helion OpenStack with respect to ESX.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th>Parameters</th>
	<th><center>Maximum Numbers</center></th>
    </tr>
<tr style="background-color: white; color: black;">
	<td>Managed virtual machine instances  </td>
	<td>3000</td>
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
	<td>Clusters per vCenter
</td>
	<td>10</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Number of vCenters supported
</td>
	<td>???</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Self Service Portal users
</td>
	<td>32</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Self Service Portal simultaneous   users 
</td>
	<td>25</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Projects
</td>
	<td>256</td>
</tr><tr style="background-color: white; color: black;">
	<td>Virtual Machine Instance per projects
</td>
	<td>500</td>
</tr><tr style="background-color: white; color: black;">
	<td>Images
</td>
	<td>512</td>
</tr><tr style="background-color: white; color: black;">
	<td>Flavors
</td>
	<td>32</td>
</tr><tr style="background-color: white; color: black;">
	<td>External networks
</td>
<td>1</td>
</tr>
</tr><tr style="background-color: white; color: black;">
	<td>Provider networks
</td>
	<td>32</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Private IP addresses
</td>
	<td>3000</td>
</tr>
</tr>
<tr style="background-color: white; color: black;">
	<td>Floating IP addresses
</td>
	<td>3000</td>
</tr>
</tr><tr style="background-color: white; color: black;">
	<td>Private (tenant)networks
</td>
	<td>25</td>

<tr style="background-color: white; color: black;">
	<td>Virtual machine instances belonging to a single security group
</td>
	<td>500</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Disk arrays
</td>
	<td>1</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>ESX volumes attached to all virtual machine instances in an ESX cluster
</td>
	<td>3000</td>
</tr>
</table>


##KVM
 
The performance, scalability, and reliability of HP Helion OpenStack is tested using the following KVM environment:

<!-- **Please provide the details** -->


##Resource requirements
The following resources are required to perform the test:

<do we need to mention the resources??>



The following table list the maximum supported configuration value for HP Helion OpenStack with respect to KVM.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th>Parameters</th>
	<th><center>Maximum Numbers</center></th>
    </tr>
<tr style="background-color: white; color: black;">
	<td>Managed virtual machine instances  </td>
	<td></td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Managed hypervisor hosts 
</td>
	<td>
</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Managed virtual machine instances per hypervisor host 
</td>
	<td></td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Clusters per vCenter
</td>
	<td></td>
</tr>
</tr>
<tr style="background-color: white; color: black;">
	<td>Self Service Portal users
</td>
	<td></td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Self Service Portal simultaneous   users 
</td>
	<td></td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Projects
</td>
	<td></td>
</tr><tr style="background-color: white; color: black;">
	<td>Virtual Machine Instance per projects
</td>
	<td></td>
</tr><tr style="background-color: white; color: black;">
	<td>Images
</td>
	<td></td>
</tr><tr style="background-color: white; color: black;">
	<td>Flavors
</td>
	<td></td>
</tr><tr style="background-color: white; color: black;">
	<td>External networks
</td>
<td></td>
</tr>
</tr><tr style="background-color: white; color: black;">
	<td>Provider networks
</td>
	<td></td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Private IP addresses
</td>
	<td></td>
</tr>
</tr>
<tr style="background-color: white; color: black;">
	<td>Floating IP addresses
</td>
	<td></td>
</tr>
</tr><tr style="background-color: white; color: black;">
	<td>Private (tenant)networks
</td>
	<td></td>

<tr style="background-color: white; color: black;">
	<td>Virtual machine instances belonging to a single security group
</td>
	<td></td>
</tr>
<tr style="background-color: white; color: black;">
	<td>Disk arrays
</td>
	<td></td>
</tr>
<tr style="background-color: white; color: black;">
	<td>KVM volumes attached to all virtual machine instances in a single KVM host
</td>
	<td></td>
</tr>
</table>





