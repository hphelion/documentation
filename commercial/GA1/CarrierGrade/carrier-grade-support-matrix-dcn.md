---
layout: default
title: "HP Helion OpenStack&#174; 1.1: Support Matrix"
permalink: /helion/openstack/carrier/support-matrix/dcn/
product: carrier-grade
product-version1: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Michael B, 

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/helion/openstack/carrier/support-matrix/">&#9664; Support Matrix for HP Helion OpenStack</a> | <a href="/helion/openstack/carrier/support-matrix/">&#9650; HP Helion OpenStack Carrier Grade (Alpha): Support Matrix</a>  </p>



# HP Helion OpenStack&#174; Carrier Grade (Alpha):Support Matrix for HP Distributed Cloud Networking (DCN)

* [Infrastructure Requirements and Recommendations](#require)
* [Hardware and Software Rerquirements](#hardware)

For more information on HP Distributed Cloud Networking (DCN), see the [HP Distributed Cloud Networking 3.0.R2 
Release Notes](http://h20565.www2.hp.com/portal/site/hpsc/template.PAGE/public/psi/manualsResults/?sp4ts.oid=7268885&spf_p.tpst=psiContentResults&spf_p.prp_psiContentResults=wsrp-navigationalState%3Daction%253Dmanualslist%257Ccontentid%253DGeneral-Reference%257Clang%253Den&javax.portlet.begCacheTok=com.vignette.cachetoken&javax.portlet.endCacheTok=com.vignette.cachetoken).

## HP DCN Infrastructure Requirements and Recommendations {#require}
<!-- Taken from HP Distributed Cloud Networking 3.0.R2
Installation Guide -->

In order to make use of the HP DCN, the data center environment must meet some key requirements as described in the following sections.

### Data Center IP Network
HP VSP can be used in any data center with an IP network. HP VSC actively participates in the IP routing infrastructure. HP VSCs can run OSPF or IS-IS for the IGP in addition to BGP, but integration with the IGP is not mandatory.

BGP is used to form a federation of HP VSCs and synchronize the HP VSP network information. In addition, BGP is also used to exchange routing information with the data center provider edge router.

### NTP Infrastructure

Because HP VSP is a distributed system, it is important that the different elements have a reliable reference clock to ensure the messages exchanged between the elements have meaningful timestamps. HP VSP relies on each of the elements having clocks synchronized with
NTP.

The HP VSD and HP VRS applications rely on the NTP facilities provided by the host operating system. The HP VSC, which is based on HP DCN OS, has an NTP client.

HP recommends having at least three NTP reference clocks configured for each system.

### Domain Name System

In scaled HP VSP deployments, the HP VSD functional elements can be distributed across machines into clusters of machines where the failover and load sharing mechanisms for the clusters rely on being referenced as a single DNS entity.

###Certificate Authority

The northbound ReST API on HP VSD is accessed within an SSL session. The HP VSD is able to use a self-signed certificate, but having a certificate from a certificate authority will enable client applications to avoid processing security warnings about unrecognized certificate authorities.

## Hardware and Software Rerquirements {#hardware}
<!-- From DCN 3.0.R2 Release Notes http://h20565.www2.hp.com/hpsc/doc/public/display?sp4ts.oid=7268885&docId=emr_na-c04495116&docLocale=en_US -->

### HP VSD Hardware and Software Requirements

The HP VSD software can run in one or more servers depending on performance and availability requirements. The following table describes the requirements for a single system server configuration. Contact HP for 
guidance on larger scale deployments.


<table style="text-align: left; vertical-align: top;">

<tr style="background-color: #C8C8C8; text-align: left; vertical-align: top;">
<th>Item</th><th>Requirements</th>
<tr>
<td>Platform</td><td>Physical machine or virtual machine</td></tr>
<tr>
<td>Hypervisor</td><td>* KVM
<br>* VMware vSphere 5.1, 5.5</td></tr>
<tr>
<td>Installed Platform</td><td>* Linux distribution: CentOS 6.5 (64-bit)
<br>* RHEL Server 6.5</td></tr>
<tr>
<td>CPU</td><td>Intel x86-64 processor with six or more logical cores, each with a speed of 2.6 GHz or higher.</td></tr>
<tr>
<td>RAM</td><td>24 GB or more</td></tr>
<tr>
<td>Mass Storage</td><td>100 GB for HP VSD software and supporting software packages. If VM statistics will be used, a separate partition or virtual disk is required to store the statistical data. Contact HP for 
details and recommended sizing based on the number of 
VMs and frequency of statistics collection.</td></tr>
<tr>
<td>
NTP</td><td>The server must run NTP to ensure the event notifications passed between the DCN elements have proper timestamps.</td>
</table>

### HP VSC Hardware and Software Requirements




<table style="text-align: left; vertical-align: top;">

<tr style="background-color: #C8C8C8; text-align: left; vertical-align: top;">
<th>Item</th><th>Requirement</th></tr>
<tr>
<td>Platform</td><td>HP VSC must run on a dedicated hardware server as the only virtual machine process.</td></tr>
<tr>
<td>Hypervisor and Installed Platform</td><td>* KVM on RHEL 6.5, CentOS 6.5
<br>* VMware vSphere ESXi 5.1, 5.5</td></tr>
<tr>
<td>CPU</td><td>HP VSC currently requires a processor from one of the following:
<br>Any AMD Opteron or Intel E5/E7 series Xeon processor or better with:
<br>* Four or more physical cores required
Recommended: processors with higher cores
Note: Hyperthreading must be disabled to achieve the 
best use of the physical cores.
<br>* Higher L3 cache and higher clock speed versions 
achieve the best performance. </td></tr>
<tr>
<td>Physical Memory</td><td>8 GB of ECC memory with higher speed RAM (DDR3 133/1600) recommended. </td></tr>
<tr>
<td>HP VSC Virtual Machine Memory</td><td>4 GB - Any memory beyond 4 GB will not be used by the HP VSC.</td></tr>
<tr>
<td>Ethernet Chipset</td><td>Any Ethernet (1Gb/s minimum, 10Gb/s strongly recommended) NIC supported by the hypervisor (two physical NICs recommended).

HP VSC requires two emulated E1000 NICs to be provided 
by the hypervisor.</td></tr>
<tr>
<td>
Operating System</td><td>Linux distributions:
<br>* CentOS 6.5 (64-bit)
<br>* RHEL Server 6.5 (2.6.32 kernel) (64-bit)

QEMU + KVM versions from the above distributions are 
supported.

Intel Extended Page Tables (EPT) disabled in the KVM kernel module.</td></tr>
<tr>
<td>Mass Storage</td><td>2 GB of available mass storage (CompactFlash, SSD or hard drive) for use by the HP VSC VM as emulated disks.</td></tr>
<tr>
<td>NTP</td><td>The server must run NTP to ensure the event notifications passed between the HP DCN elements have proper timestamps.</td></tr>
</table>



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
