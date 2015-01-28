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
