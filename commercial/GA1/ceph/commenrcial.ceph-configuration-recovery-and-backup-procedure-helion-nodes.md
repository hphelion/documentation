---
layout: default
title: "HP Helion OpenStack&#174; Edition: HP Helion Ceph"
permalink: /helion/openstack/ceph-configuration-recovery-and-backup-procedure-HP-Helion-nodes/
product: commercial

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--
<p style="font-size: small;"> <a href="/helion/openstack/install-beta/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/esx/">NEXT &#9654;</a> </p>--->


##Ceph Configuration Recovery and Backup Procedure HP Helion Nodes

The following steps ensure the recovering of the lost configuration.

1. Run the  `ceph_client_setup` script (available at [CODN](https://helion.hpwsportal.com)) on each of the controller/compute nodes. (For information on what files need to be copied from  the Ceph cluster node to their respective directories, refer to the script's README file.)
2. To confirm ceph health, run:

	 `ceph health`

3. If you reboot your controller and compute node after running the `ceph_client_setup` script, the patch update for `glance-api.conf`, `nova.conf`, `cinder.conf` might default to the original state. In this case, from each controller and compute node, go to:


		/home/ceph_client_setup/setup_scripts

	1. Execute `sh patch_config_files.sh`

	2. Execute `sh helion_service_restarts.sh`


####Sample files

<table>
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th > Helion Node</th>
	<th > Service/File name</th>	
	<th>File Attachment </th>
</tr>
	<tr>
<td>Controller node</td>
<td>/etc/glance/glance-api.conf /etc/cinder/cinder.conf /etc/nova/nova.conf</td>
<td>1. Login to <a href =" https://helion.hpwsportal.com"> CODN</a>. <br> 2. Click the workloads category on the left side. <br> 3. Click the storage subcategory to find all the Ceph related files. <br> <b>Filename</b>  **need ?**
</td>
</tr>
<tr>
<td>Compute node</td>
<td>/etc/nova/nova.conf</td>
<td>1. Login to <a href =" https://helion.hpwsportal.com"> CODN</a>. <br> 2. Click the workloads category on the left side. <br> 3. Click the storage subcategory to find all the Ceph related files. <br> <b>Filename</b>  **need ?**
</tr>
  </table>


##Useful tips

The following tips will help you troubleshoot errors:

* Verify that the http proxy settings are correct in both `/etc/environment` and `/etc/apt/apt.conf` for connecting to external resources.

* The Firefly version of Ceph packages has a default replication set to 3x (three times). Therefore you need a minimum of three OSDs.

* If a `Decrypt error` occurs from any of the Helion nodes with glance, cinder, or nova, make sure that all the Ceph cluster nodes are in same time zone. HP recommends that you configure a NTP server in the `/etc/ntp.conf` file on all Ceph cluster nodes.  After making changes, restart NTP [`/etc/init.d/ntp restart`]. Install the `ntp` package, if it is not there.

* Make sure the Ceph cluster uses the same IP range as the Helion OpenStack overcloud nodes. Also, make sure the IP range for the Ceph cluster does not conflict with those used by Helion set up.

* Be sure to check the log files in `/var/log/ceph/` for each node. Any errors or exceptions are useful for troubleshooting.

* Any changes you make to the Ceph configuration file requires a restart for the changes to take affect.

* You cannot change the default Cephx Authentication to `None` once the cluster is up and running. You will have to purge and reinstall the Ceph packages and build the cluster. 

* Enable logging if you encounter a problem at any of these steps:
	
	To do this, edit `glance-api.conf`, `cinder.conf` and `nova.conf` files with the following in the default section.

		debug = True
		verbose = True

	Restart Glance, Cinder, and Nova services respectively.

	On HP Helion Commercial, the logs for Glance and Cinder are stored by default in the following directories:

		Glance - /var/log/glance
		Cinder - /var/log/upstart

Gather these logs and contact HP support team. 

* If any Placement Group (PG)-related issues occur in the Ceph cluster, refer to the following link:

	[http://docs.ceph.com/docs/master/rados/operations/placement-groups/](http://docs.ceph.com/docs/master/rados/operations/placement-groups/)

###Choosing the number of the placement group

If there are more than 50 OSDs, we recommend approximately 50-100 PGs per OSD to balance resource usage, data durability and distribution. To get a baseline for a single pool of objects, use the following formula:
		
<img src="media/commercial-ceph-formula-placement-group.png"/)>


Where pool size is either the number of replicas for replicated pools or the K+M sum for erasure coded pools (as returned by `ceph osd erasure-code-profile get`).
Round up the results to the nearest power of two. Rounding up is optional, but recommended for CRUSH to evenly balance the number of objects among PGs.

For example, for a cluster with 200 OSDs and a pool size of 3 replicas, estimate the number of PGs as follows:

	(200 * 100)
	----------- = 6667. Nearest power of 2: 8192
     3



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>