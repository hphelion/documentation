---
layout: default
title: "HP Helion OpenStack&#174; Object Operations Service Overview"
permalink: /helion/openstack/ga/services/swift/diagnosis-disk-health/hpssacli/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href=" /helion/openstack/ga/services/object/overview/scale-out-swift/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/overview/"> NEXT &#9654</a> </p>-->

#Diagnosis of disk health using hpssacli utility for HP servers

The health of the disk  of the HP servers can be diagnosed using hpsacli utility.


##HP Smart Storage Administrator CLI 2.0.22.0(HPSSACLI)

The HP Smart Storage Administrator CLI (HPSSACLI) is a commandline-based disk configuration program for Smart Array Controllers.

##Deployment of utility on servers

The hpssacli utility is deployed onto the servers wherever the disks are to be monitored. For example: Swift, VSA, and Compute nodes. This page explains about the collection of diagnostic report of disks in the servers where the utility is loaded.

###Download the hpssacli utility into the KVM host

TBD

Where should the user login??

###Copy the utility to seed and to the servers where the disks has to be monitored

Use scp to copy the utility package on to the servers and install it.

1. Copy the package from KVM host to SEED.

		scp hpssacli.tar.gz root@1<IP address of Seed>

2. Copy the package from SEED to machine where the disks to be monitored.

		scp hpssacli.tar.gz heat-admin@192.0.2.34:

3. Login to the server where the utility is copied and install the package.

		
		root@hLinux:~# ssh heat-admin@192.0.2.34
		
		The package will be available in /home/heat-admin/
		
		cd /home/heat-admin/
		
		Install the package. For now, tar ball will be extracted.
		
		tar -xvf hpssacli.tar.gz
		
		The binary hpssacli will be in /home/heat-admin/hp/hpssacli/bld
		
		The diagnostics can be done either in the server or from SEED through ssh.



 
<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*