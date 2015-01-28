---
layout: default
title: "HP Helion OpenStack&#174; Edition: HP Helion Ceph"
permalink: /helion/openstack/ceph-hp-helion-openstack-ceph-configuration/
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
<p style="font-size: small;"> <a href="/helion/openstack/install-beta/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/esx/">NEXT &#9654;</a> </p>
-->


##HP Helion OpenStack Ceph Configuration

This section describes the integration of HP Helion OpenStack Enterprise Edition 1.1 and Ceph Firefly 80.7 on hlinux3.14.6-2 kernel.

Before configuring Helion OpenStack Ceph ensure that HP Helion OpenStack Enterprise Edition 1.1 is installed successfully. 

###Ceph Client Install <**not clear what exactly trying to convey**>

The Helion Overcloud Controller and compute nodes are consumers of the storage services provided by the Ceph cluster. In order for it to act as a Ceph client, perform the following steps (either the automated or manual process):

####Automated Install

The `ceph_client_setup.tar` contains Debian packages, Helion OpenStack Ceph configuration scripts, and the patch file to make required alteration to the Nova, Glance, and Cinder configuration file. These debian packages must be installed while installing the Ceph firefly 80.7 client packages on the HP Helion overcloud controller and compute nodes. The script present in the tar files helps to automate the install process.

Use the tar file to install the Ceph client bits on the Helion cluster. Once the Ceph cluster is fully operational, run the tar file on the Helion controller nodes ((occ0, occ1, and oc mgmt nodes) and the compute node. And at the final stage of installation process Ceph client extends to the Ceph cluster to confirm the connectivity.


#####Procedure to run an automated script

Perform the following steps to run the automated scripts on the Helion overcloud controller nodes and the compute nodes.

For more details about the Ceph storage cluster with Glance integration, refer to [http://ceph.com/docs/master/rbd/rbd-openstack/?highlight=openstack%20glance ](http://ceph.com/docs/master/rbd/rbd-openstack/?highlight=openstack%20glance )


1. Untar `ceph_client_setup.tar` in root home on each of the Helion overcloud controller and compute nodes where Ceph client must be installed.

		/home

	A directory named `ceph_client_setup` is created. There are six or seven other sub directories under `ceph_client_setup` directory. (name of all the directories are required?)


2. Copy `ceph.conf` file and keyring from admin node to install directories (***name of the directory?***)

		command is required?

3. Copy Ceph cluster config files  from the ceph admin node in the ceph_cluster_config_files directory.

		command required?

4. In the setup_scripts directory there is a script (`fixuuid.sh`) which modifies the Helion configuration file patches with the new UUID from the cephx authentication process. Execute the 
`fixuuid.sh` as follows:

		fixuuid.sh THE-NEW-UUID-TO-BE-USED


	The new Cephx UUID is passed as an argument to the `fixuuid.sh` script. This will patch the new UUID into the patch files that will be used to modify the helion config files (**exact name of the configuration files**).

5. Execute `ceph_client_install.sh` on the controller nodes or compute nodes.

	**Note**: The installer script is present at `/home/ceph_client_setup/setup_scripts/ceph_client_install.sh`


The installation script verifies the following:

1. It checks whether the file is untarred in the correct location ( /home/ceph_client_setup) and exits if the script is not available. 
2. It checks whether ceph cluster ceph.conf and the keyring files are copied in the correct location (/home/ceph_client_setup/ceph_cluster_config_files/) and exit if they are not present. If they are present in the correct location, the `/etc/ceph` directory is created and the `ceph.conf` and the keyring files are copied in `/etc/ceph` directory.
3. The script will search the following files in `/home/ceph_client_setup/ceph_cluster_config_files/`

	a. ceph.conf - main ceph configuration file

	b. ceph.client.nova.keyring - nova user authorization key file

	c. ceph.client.cinder.keyring - cinder user authorization key file

	d. ceph.client.cinder-backup.keyring - cinder backup user authorization key file

	e. ceph.client.glance.keyring - glance user authorization key file

	f. ceph.client.admin.keyring - admin user authorization key file

	g. ceph.client.radosgw.keyring - radosgw authorization key file


 
	**NOTE**: if a Rados gateway is not going to be used for this installation, just touch an empty file with this name in the /home/ceph_client_setup/ceph_cluster_config_files/ directory so the script will still find a file with the expected name. (**need to re-word**)

4. It checks the availability of the Ceph client Debian packages in `/ceph_client_setup/ceph_client_debs/` and exits the script if it is unavailable.

6. It checks whether the system is a hLinux system and the existence of `/etc/apt/sources.list` file. If it meets all this requirement then a backup copy of the original `sources.list` file is created in `/home/ceph_client_setup/orig_backup/` and then the local ceph packages location is added to the file as a valid local repository.

7. Once the repository is added to the `apt sources.list` file, the system does an `apt-get update` and `apt-get install` of the Ceph client packages. If `apt-get update` and `apt-get install` of the Ceph client packages is successful without errors then `dpkg` is executed to verify installation of correct packages.

8. The Ceph command is checked to verify whether it is available and executable. If the Ceph command is available and executable then it is executed to verify whether the health of the Ceph clusterit can be determined. If the ceph cluster health shows as HEALTH_OK, the script displays the status and continues. 

The following sub-scripts runs on the successful completion of the above steps:

**`copy_icinga_monscripts.sh`**- copies the Ceph cluster monitoring scripts in the icinga script directory on the Helion overcloud controller nodes only.

**`patch_config_files.sh`** - patches the Helion configuration files with the changes required for the Ceph communication.

**`ceph_pythonlinks_create.sh`** - creates softlinks to the necessary Ceph python library files in the Helion python directories.

**`create_helion_pools.sh`** - creates the required Helion pools in the Ceph storage (only runs on overcloud controller node and management node)

**`helion_service_restarts.sh`** - restarts the Helion services.



####Availability of Ceph Client script

<table>
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th > Description</th>
	<th>File Location </th>
</tr>
	<tr>
<td>Ceph client package file to be installed on the running Controller and Compute nodes in 
HP Helion OpenStack commercial build</td>
<td>https://helion.hpwsportal.com Click on the workloads category on the left side and then you click on the storage subcategory to find all the Ceph related files.<br> Filename: ?</td>
</tr>
  <table>

As a sanity-check, cross check with the attached "dpkg -l" output after ceph package install:

<table>
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th > Description</th>
	<th > Description</th>	
	<th>File Location </th>
</tr>
	<tr>
<td>Controller node</td>
<td>DPKG -l output after ceph package install</td>
<td>https://helion.hpwsportal.com Click on the workloads category on the left side and then you click on the storage subcategory to find all the Ceph related files. File Name:<tdt>
</tr>
<tr>
<td>Compute node</td>
<td>DPKG -l output after Ceph package install</td>
<td>https://helion.hpwsportal.com Click on the workloads category on the left side and then you click on the storage subcategory to find all the Ceph related files. File Name:<tdt>
</tr>
  </table>

####Verify Ceph version

* Execute the following command to verify the Ceph version on the overcloud nova compute node:

		# dpkg -l|grep ceph

The following example displays the ceph version:

	root@overcloud-novacompute0-c6y5lbj2hvlu:/home# dpkg -l|grep ceph
	ii ceph 0.80.7-1+hLinux amd64
	[hLinux]distributed storage and file system
	ii ceph-common 0.80.7-1+hLinux amd64
	[hLinux]common utilities to mount and interact with a ceph storage cluster
	ii libcephfs1 0.80.7-1 amd64
	Ceph distributed file system client library
	ii python-ceph 0.80.7-1+hLinux amd64
	[hLinux]Python libraries for the Ceph distributed filesystem





<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>












