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

1. Run `ceph_client_setup` script (available at [CODN](https://helion.hpwsportal.com)) on each of the controller/compute node. Go through the README file on to run the script and what files to be copied from ceph cluster node to the respective directory.

2. Ensure ceph health is ok. Execute the following command:

	 `ceph health`

3. If you reboot your controller and compute node after running the `ceph_client_setup` script, the patch update on `glance-api.conf`, `nova.conf`, `cinder.conf` might be defaulted to the original state. In this case perform the following.

	From each of the controller and compute node, go to

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
<td>1. Login to <a href =" https://helion.hpwsportal.com"> CODN</a>. <br> 2. Click the workloads category on the left side. <br> 3. Click the storage subcategory to find all the Ceph related files. <br> <b>Filename</b>  **Required this infor** ?
</td>
</tr>
<tr>
<td>Compute node</td>
<td>/etc/nova/nova.conf</td>
<td>1. Login to <a href =" https://helion.hpwsportal.com"> CODN</a>. <br> 2. Click the workloads category on the left side. <br> 3. Click the storage subcategory to find all the Ceph related files. <br> <b>Filename</b>  **Required this infor** ?
</tr>
  </table>


##Useful tips

Following tips are helpful for you to troubleshoot if you an error occurs:

* Ensure proper http proxy settings in both `/etc/environment` and `/etc/apt/apt.conf` for connecting to external resources.

* Firefly version of Ceph packages has default replication set to 3x. Therefore have a minimum of 3 OSDs.

* If `Decrypt error` occurs from any of the Helion node with glance, cinder, nova, ensure all the ceph cluster nodes are in same time zone. If needed have a NTP server specified in `/etc/ntp.conf` file on all the ceph cluster nodes.  After making changes restart NTP [`/etc/init.d/ntp restart`]. Install `ntp` package, if it is not there.

* Ensure Ceph cluster to be on the same IP range as Helion OpenStack overcloud nodes. Ensure IP range for Ceph cluster does not conflict with those used Helion setup.

* Log files in `/var/log/ceph/` in each node is a good place for troubleshooting.

* Any changes to Ceph configuration file must be followed by restarting Ceph services for changes to take affect.

* You cannot change the default Cephx Authentication to `None` once the cluster is up and running. You will have to purge and reinstall the ceph packages again and build the cluster. 

* Enable logging if problem is encountered in any of the steps
	
	To do this, edit `glance-api.conf`, `cinder.conf` and `nova.conf` files with the following in the default section.

		debug = True
		verbose = True

	Restart Glance,  Cinder, and Nova services respectively.

	On HP Helion Commercial, logs for Glance and Cinder by default are stored in following directory structure

		Glance - /var/log/glance
		Cinder - /var/log/upstart

Gather these logs and contact HP support team for inputs. 

* If any PG[Placement Group] related issue occurs in the ceph cluster. Refer the following link:

	[http://docs.ceph.com/docs/master/rados/operations/placement-groups/](http://docs.ceph.com/docs/master/rados/operations/placement-groups/)

###Choosing  the number of the placement group

If there are more than 50 OSDs, we recommend approximately 50-100 placement groups per OSD to balance out resource usage, data durability and distribution. For a single pool of objects, you can use the following formula to get a baseline:
		
<img src="media/commercial-ceph-formula-placement-group.png"/)>


Where pool size is either the number of replicas for replicated pools or the K+M sum for erasure coded pools (as returned by ceph osd erasure-code-profile get).
The result must be rounded up to the nearest power of two. Rounding up is optional, but recommended for CRUSH to evenly balance the number of objects among placement groups.

For example, for a cluster with 200 OSDs and a pool size of 3 replicas, you would estimate your number of PGs as follows:

	(200 * 100)
	----------- = 6667. Nearest power of 2: 8192
     3



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>