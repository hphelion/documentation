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


2. Copy ceph.conf file and keyring from admin node to install directories (***name of the directory?***)

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

As a sanity-check, cross check with the attached “dpkg –l” output after ceph package install:

<table>
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th > Description</th>
	<th > Description</th>	
	<th>File Location </th>
</tr>
	<tr>
<td>Controller node</td>
<td>DPKG –l output after ceph package install</td>
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


##Helion OpenStack Glance-Ceph Interoperability

Glance images along with Cinder and Nova are stored on Ceph RADOS Block Device (RBD). The benefit of storing Glance image, Cinder volume, and Nova nodes on RDB are as follows:

* Snapshots
* Live migration
* Recovery
* Copy-on-write Clones from Glance images to Cinder volumes


For Glance-Ceph integration, the Helion OpenStack Ceph Configuration service performs the following steps.

On the Helion controller and compute nodes, once the Ceph client script is installed and run the following steps.

1. Create a new Ceph pool to store Glance images

		ceph osd pool create <glance pool name> <pg-num>

	Example:

		ceph osd pool create helion-ceph-glance 100

2. Change `glance-api.conf` to reference the Ceph rbd storage only on overcloud controller nodes. 

	The following sample displays the `glance-api.conf` references to the Ceph rbd storage only on overcloud controller nodes. 

		# For ceph integration
		
		default_store = rbd
		rbd_store_user = glance
		rbd_store_pool = helion-ceph-glance
		show_image_direct_url = True
		known_stores = glance.store.filesystem.Store, glance.store.swift.Store, glance.store.rbd.Store
		
		#Enable debug for troubleshooting only
		#debug = True
		#verbose = True

3. Create symbolic or softlinks to the relevant files on overcloud controller nodes.

		ln -s /usr/lib/python2.7/dist-packages/rados* /opt/stack/venvs/openstack/lib/python2.7/site-packages/.
		ln -s /usr/lib/python2.7/dist-packages/rbd* /opt/stack/venvs/openstack/lib/python2.7/site-packages/.

4. Edit `rbd.py` in `glance/store/`on the overcloud controller nodes.

		In function, def __init__(self, name, store), change
		self.chunk_size = store.chunk_size to
		self.chunk_size = store.READ_CHUNKSIZE

5. Restart glance services on all the overcloud controller nodes.

		service glance-api restart
		service glance-reg restart
		glance-manage db_sync

6. Create a sample glance RAW image on any of the controller node. 

		glance image-create --name RImg --is-public=true --disk-format=raw --container-format=bare --file cirros-0.3.2-x86_64-disk.raw


	Raw data format is used with RBD for instant image snapshots and protection. For more details, refer [http://ceph.com/docs/master/rbd/qemu-rbd/?highlight=raw](http://ceph.com/docs/master/rbd/qemu-rbd/?highlight=raw)

	Conversion tool like qemu-img is used to convert one image format to another. 
	For example –

		qemu-img convert -f {source-format} -O {output-format} {source-filename} {output-filename}
		
		qemu-img convert -f qcow2 -O raw cirros-0.3.2-x86_64-disk.img cirros-0.3.2-x86_64-disk.raw
		
		glance image-create --name RImg --is-public=true --disk-format=raw --container-format=bare --file cirros-0.3.2-x86_64-disk.raw

7. Ensure that the uploaded glance image is available in the Horizon UI and is correctly stored in the appropriate pool in Ceph.

		rbd ls –l <glance pool name>
		
		glance image-list

8. If problem occurs in any of the above steps, do the following:
	* Enable logging in `glance-api.conf`  
	* Restart glance services and re-run problem step. 
	* Collect g.lance debug logs in `/var/log/glance` directory 
	* Contact HP support team for inputs. 



###Ceph Glance Clone Copy On Write

Ceph implements Clone Copy on Write built off the Protected Snapshot to clone an image quickly and easily. During the image import in glance, images are snapshotted and protected, clones are quickly created from the snapshot and a volume is created from an image. For more details, [refer http://ceph.com/docs/master/dev/rbd-layering/?highlight=rbd%20layering](refer http://ceph.com/docs/master/dev/rbd-layering/?highlight=rbd%20layering)

If the Ceph client script is successfully installed and ran on the Helion controller and compute nodes then the following steps are automatically performed.

1. Edit `cinder.conf` file on all overcloud controller nodes.

		glance_api_version=2

2. Restart Cinder services on all overcloud controller nodes.

		service cinder-volume restart
		service cinder-scheduler restart
		service cinder-api restart

3. Execute the command to create glance image.

		glance image-create

	Note that Clone COW is achieved when image is in RAW format. Conversion tool like qemu-img is used to convert from one format to another. 

	For example:

		qemu-img convert -f {source-format} -O {output-format} {source-filename} {output-filename}
		qemu-img convert -f qcow2 -O raw cirros-0.3.2-x86_64-disk.img cirros-0.3.2-x86_64-disk.raw
		glance image-create --name RImg --is-public=true --disk-format=raw --container-format=bare --file cirros-0.3.2-x86_64-disk.raw

4. Create cinder volume from glance image created on step 1 on any of the controller node

		cinder create –image-id <glance image id> --display-name RVol 2

5. Ensure that Cinder volume which is created is available at `rbd` pool

		rbd ls –l <cinder pool name>
		
		cinder list

6. Track clones to demonstrate copy-on-write feature by first listing snapshots of glance image  and then listing the children of the snapshot

		rbd --pool <glance pool name> snap ls <glance image id>
		
		rbd --pool <glance pool name> children --image <glance image id> --snap <snap name>
		
		rbd children <glance pool name>/<glance-image id>@<snap name>

7.  If the problem occurs in any of the above steps, do the following:

	* Enable logging in `glance-api.conf` and `cinder.conf`. 
	* Restart Glance and Cinder services and re-run problem step. 
	* Collect Glance debug logs in `/var/log/glance` directory and cinder debug logs in `/var/log/upstart` directory.
	*  Contact HP support team for inputs.

##Helion OpneStack Cinder Ceph Storage

If the Ceph client script is successfully installed and ran on the Helion controller and compute nodes then the following steps are automatically performed.

1.  Verify the Ceph health

		ceph health
	
	Output:	
	
		HEALTH_OK

2. Create a new pool for Cinder volume

		ceph osd pool create <cinder pool name> <pg-num>

	For example:
		
		ceph osd pool create helion-ceph-cinder 100

4.  Execute the following command to verify a new pool creation

		rados lspools
		
	Output:
		
		rbd ls helion-ceph-cinder

4. Create symbolic or softlinks to the relevant files on overcloud controller nodes.

		ln -s /usr/lib/python2.7/dist-packages/rados* /opt/stack/venvs/openstack/lib/python2.7/site-packages/.
		ln -s /usr/lib/python2.7/dist-packages/rbd* /opt/stack/venvs/openstack/lib/python2.7/site-packages/.

###Configure Cinder

HP Helion OpenStack requires the `rbd` driver to interact with Ceph block devices. The pool name must be specified for the block device. To specify the pool name on the overcloud controller nodes edit `/etc/cinder/cinder.conf` and add the following:

	[DEFAULT]
	
	# For ceph integration
	
	volume_driver=cinder.volume.drivers.rbd.RBDDriver
	rbd_pool=helion-ceph-cinder
	rbd_ceph_conf=/etc/ceph/ceph.conf
	rbd_flatten_volume_from_snapshot=false
	rbd_max_clone_depth=5
	
You can also insert a comment on the `lvm` backend in the `cinder.conf` file for your reference.

	# LVM thin provision. This way we don't dd the disk
	
	#enabled_backends = lvm-1


Now, restart the Cinder service

		service cinder-volume restart
		service cinder-scheduler restart
		service cinder-api restart


Once the cinder service is restarted you can create a volume. There are two ways to create a volume:

* Horizon UI dashboard (**how to create from volume in horizon UI is similar to the one which we create for normal volume?if so we can give a link,else we need steps?**)
* Using CLI from the overcloud controller node running the ceph client

**Using the Horizon UI Dashboard**

You can use the HP Helion OpenStack Dashboard to work with the Cinder service.
<need to rewrite>

To back up the volume from Horizon, perform the following steps:

1. Click on the More menu next to your volume and choose Create Backup:
2. Enter in the required information in the next screen and click Create Backup:
3. Required Fields: Backup Name - choose a name for your backup

Optional Fields: 

Description - you can enter in a description here 

Container Name - If no container name is provided, a default container named volumebackups will be provisioned for you. Backups will be the same size as the volume they originate from.

**Using the CLI**

To create a volume using command-line interface (CLI) execute the following command from the overcloud controller node running the ceph client

	Cinder create –display-name <name of the volume> <volume size>

For example:

	# cinder create --display-name vol2-RBD 1 

Output:

			+---------------------+-----------------------------------------------------------------+
			| Property			  | Value                                                           |     
			+---------------------+-----------------------------------------------------------------+
			| attachments  	      | []                     											|
			| availability_zone   | nova														    |
			| bootable            | false                                         					|
			| created_at          |  2014-08-01T14:56:21.423821                                     |
			| display_description |  None                                                      		|
			| display_name        | vol2-RBD 														|
			| encrypted     	  | False 															|
			| id    		      |d6064822-d1c1-4e72-b496-ee807174ef96  							|
			| metadata            | {}  															|
			| size				  |	1																|									
			| snapshot_id    	  | None 															|
			| source_volid 	      | None 															|
			| status              | creating                                     					|  
			|volume_type      	  | None                                                     		|
			+--------------+------------------------------------------------------------------------+


##Helion OpenStack Cinder Backup Ceph Storage

The Ceph backup driver performs the data backup operation on the volume to a Ceph RDB. Backups can be performed between different ceph pools and ceph clusters. This section explains the backup and restore procedure of cinder volume.

If the Ceph client software's are installed and the ceph configuration and keyring files are copied on the Helion controller and compute nodes then Helion OpenStack Ceph Configuration service performs the following steps:


1. Verify Ceph health status

		ceph health
		
	Output:

		HEALTH_OK

2. Create a new pool for cinder backup

		ceph osd pool create <cinder backup pool name> <pg-num>

	For example:

		ceph osd pool create helion-ceph-backups 100



3. Execute the following command to verify a new backup pool is created

		rados lspools
	
	Output:

		rbd ls helion-ceph-backups

4. Create symbolic or softlinks to the relevant files on overcloud controller nodes. If the following links are already created for other services then ignore it.

		ln -s /usr/lib/python2.7/dist-packages/rados* /opt/stack/venvs/openstack/lib/python2.7/site-packages/.
		
		ln -s /usr/lib/python2.7/dist-packages/rbd* /opt/stack/venvs/openstack/lib/python2.7/site-packages/.

###Configure Cinder backup

Perform the following steps to enable Ceph backup driver:

1. Edit `/etc/cinder/cinder.conf` and add the following options in all the 3 controller nodes [OCC mgmt, OCC0, OCC1].


		[DEFAULT]
		
		# For cinder backup
			backup_driver=cinder.backup.drivers.ceph
		backup_ceph_conf=/etc/ceph/ceph.conf
		backup_ceph_user=cinder-backup
		backup_ceph_chunk_size=134217728
		backup_ceph_pool=helion-ceph-backups
		backup_ceph_stripe_unit=0
		backup_ceph_stripe_count=0
		restore_discard_excess_bytes=true

	The following table provides the description of the parameters.

	<table>
	<table style="text-align: left; vertical-align: top; width:650px;">
	<tr style="background-color: #C8C8C8;">
		<th> Parameters</th>
	<th>Descriptions </th>
		</tr>
		<tr>
	<td>backup_ceph_chunk_size = 134217728</td>
	<td>The chunk size, in bytes, that a backup is broken into before transfer to the Ceph object store.</td>
	</tr>
	<tr>
	<td>backup_ceph_conf = 
	/etc/ceph/ceph.conf</td>
	<td>Ceph configuration file to use.</td>
	</tr>
	<tr>
	<td>backup_ceph_pool = helion-ceph-backups</td>
	<td>The Ceph pool where volume backups are stored.</td>
	</tr>
	<tr>
	<td>backup_ceph_stripe_count = 0</td>
	<td>RBD stripe count to use when creating a backup image.</td>
	</tr>
	<tr>
	<td>backup_ceph_stripe_unit = 0</td>
	<td>RBD stripe unit to use when creating a backup image.</td>
	</tr>
	<tr>
	<td>backup_ceph_user = cinder</td>
	<td>The Ceph user to connect with. Default here is to use the same user as for Cinder volumes. If not using cephx this should be set to None.</td>
	</tr>
	<tr>
	<td>restore_discard_excess_bytes = True</td>
	<td>If True, always discard excess bytes when restoring volumes i.e. pad with zeroes.</td>
	</tr>
	  </table>


2. Restart the Cinder service

		service cinder-backup restart

	**Note**: For Cinder backup, the Cinder volume whose backup is required must be in a detached state. The volume should not be attached to any of the instances or virtual machines.

	Once the cinder service is restarted you can create a backup of a Cinder volume. There are two ways to create a backup:

	* Horizon UI dashboard (**how to create from volume in horizon UI is similar to the one which we create for normal volume?if so we can give a link,else we need steps?**)
	* Using CLI from the overcloud controller node running the ceph client

	**Using the Horizon UI Dashboard**

	To create a volume back from the Horizon UI, do the following.

	1. Log in to the overcloud Horizon dashboard.
	2. From the left panel, click the **Projects** and then select Compute.
	3. Click **Volumes**. 
	3. Click More drop down list and select Create Backup. Create Volume Backup page is displayed.
	4. In the **Backup Name** box, enter the name for the backup.
	5. In the **Description** box, enter the description.
	6. In the **Container Name** box, enter the name of the container. If no name is entered, a default container named *volumebackups*  is  provisioned. The volume backup remains the same size of the volume.
	7. Click **Volume Backup**. A volume backup is created.


	To attach volume to an instance: <need verification?>

	* Select the instance and provide a device a name 


	**Using the CLI**

	Execute the following command to create a backup.
	 
		cinder backup-create [--container <container>] [--display-name <display-name>] [--display-description <display-description>] <volume>

	The following example shows how to create a backup with the name of **deb7rawbackup** for an existing Cinder volume with the ID **0a2c6c62-627f-42d3-9b66-e4ba56db0ba7**, run:

			# cinder backup-create --display-name deb7rawbackup 0a2c6c62-627f-42d3-9b66-e4ba56db0ba7.

	**Detailed procedure to create a backup using CLI**

	1. Login to overcloud controllermanagement and execute the following command:

			cinder list

		Output:

			+--------------------------------------+-----------+-----------------------+------+-------------+----------+--------------------------------------+
			|                  ID                  |   Status  |      Display Name     | Size | Volume Type | Bootable |             Attached to              |
			+--------------------------------------+-----------+-----------------------+------+-------------+----------+--------------------------------------+
			| 0219d66e-d69d-4e28-bf4f-cb5f096696e3 | available |       Rsmallvol4      |  1   |     None    |  false   |                                      |
			| 0285ee63-4ebd-4cd1-915c-933c48503d00 |   in-use  |         Rvol1         |  10  |     None    |  false   | 54938de0-49dd-4b01-931e-dafcddc41518 |
			| 054bfa98-1d69-4cb8-b195-9b9481f5b8c7 |   in-use  |   Rwin2012Cowrawvol1  |  26  |     None    |   true   | 0bf98387-b0c9-4814-a2ef-f81c1ef1322e |
			| f628002a-6cc4-4e70-a98f-d575e36fca75 |   in-use  |    Rdeb7Cowrawvol3    |  10  |     None    |   true   | 54938de0-49dd-4b01-931e-dafcddc41518 |
			| ff8d13a5-3083-424b-a626-0b75cbe8cf66 | available |  cindervol_forbackup  |  15  |     None    |  false   |                                      |
			+--------------------------------------+-----------+-----------------------+------+-------------+----------+--------------------------------------+

		
	2. Create cinder backup

			cinder backup-create --display-name cindervol_backup ff8d13a5-3083-424b-a626-0b75cbe8cf66

		Output:

				+-----------+--------------------------------------+
				|  Property |                Value                 |
				+-----------+--------------------------------------+
				|     id    | 60764712-c456-465a-828b-5f45d3a14ff5 |
				|    name   |           cindervol_backup           |
				| volume_id | ff8d13a5-3083-424b-a626-0b75cbe8cf66 |
				+-----------+--------------------------------------+
				

	3. View a list of Cinder backup 

			cinder backup-list

		Output:

			+--------------------------------------+--------------------------------------+-----------+-------------------+------+--------------+---------------------+
			|                  ID                  |              Volume ID               |   Status  |        Name       | Size | Object Count |      Container      |
			+--------------------------------------+--------------------------------------+-----------+-------------------+------+--------------+---------------------+
			| 244aa3a1-b291-4cfe-9999-438f7611da2b | eb170c5e-d227-40ef-b515-b84b82c38eb0 | available |    Rvol6backup    |  15  |     None     | helion-ceph-backups |
			| 32ea7668-9179-433c-8fe3-44b98cd9d85b | 8aefafcc-4171-4c11-b900-362fbda40015 | available | ubuntu1404-backup |  10  |     None     | helion-ceph-backups |
			| 60764712-c456-465a-828b-5f45d3a14ff5 | ff8d13a5-3083-424b-a626-0b75cbe8cf66 |  creating |  cindervol_backup |  15  |     None     |         None        |
			| beeccb71-81e7-4860-8d38-add05a2e610d | eb170c5e-d227-40ef-b515-b84b82c38eb0 | available |    Rvol6backup    |  15  |     None     | helion-ceph-backups |
			+--------------------------------------+--------------------------------------+-----------+-------------------+------+--------------+---------------------+

	4. Execute the following command to view a details of a selected volume.

	 		cinder backup-show 60764712-c456-465a-828b-5f45d3a14ff5

		Output:

			+-------------------+--------------------------------------+
			|      Property     |                Value                 |
			+-------------------+--------------------------------------+
			| availability_zone |                 None                 |
			|     container     |                 None                 |
			|     created_at    |      2014-10-01T18:14:50.000000      |
			|    description    |                 None                 |
			|    fail_reason    |                 None                 |
			|         id        | 60764712-c456-465a-828b-5f45d3a14ff5 |
			|        name       |           cindervol_backup           |
			|    object_count   |                 None                 |
			|        size       |                  15                  |
			|       status      |               creating               |
			|     volume_id     | ff8d13a5-3083-424b-a626-0b75cbe8cf66 |
			+-------------------+--------------------------------------+

	5. Execute the following command:

			rbd ls -l helion-ceph-backups

		Output:

				NAME                                                                                                                     SIZE PARENT FMT PROT LOCK
				volume-0a2c6c62-627f-42d3-9b66-e4ba56db0ba7.backup.base                                                                10240M          2
				volume-0a2c6c62-627f-42d3-9b66-e4ba56db0ba7.backup.base@backup.02c6df2c-d03a-44ad-847a-ce03b580ee23.snap.1412106395.75 10240M          2
				volume-0a2c6c62-627f-42d3-9b66-e4ba56db0ba7.backup.base@backup.c9c20a09-403e-4011-a3f8-2fea11a560ee.snap.1412042130.16 10240M          2
				volume-3adf1c83-2efa-4a1e-bef6-cdaffd13b489.backup.base                                                                 3072M          2
				volume-3adf1c83-2efa-4a1e-bef6-cdaffd13b489.backup.base@backup.cdd27130-1791-45f6-8b6e-cc284922b02e.snap.1412041965.31  3072M          2 


	6. To view cluster utilization

			rados df

		Output:

			pool name       category                 KB      objects       clones     degraded      unfound           rd        rd KB           wr        wr KB
			.rgw            -                       9411        51459            0            0           0       110460        85700       130906        51952
			.rgw.buckets    -                      20004       188711            0            0           0      6466145      4329147      8000069      1563078
			helion-ceph-backups -                   54343272        13300         2190            0           0        16295     40106569        38157     70071922


####Mount the volume and copy new image

Now, mount the volume and copy the new image file from VM. To do so, perform the following steps:
	
1. Login as a root user.
2. List the block devices.
	
		lsblk
	
	Output:

		NAME                     MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
		vda                      254:0    0    10G  0 disk
		aavda1                   254:1    0   243M  0 part /boot
		aavda2                   254:2    0     1K  0 part
		aavda5                   254:5    0   7.8G  0 part
		  aadebian-root (dm-0)   253:0    0   7.4G  0 lvm  /
		  aadebian-swap_1 (dm-1) 253:1    0   376M  0 lvm  [SWAP]
		vdb                      254:16   0    26G  0 disk
		vdc                      254:32   0    10G  0 disk
		vdd                      254:48   0    10G  0 disk
		vde                      254:64   0    10G  0 disk
		vdf                      254:80   0    10G  0 disk
		vdg                      254:96   0    10G  0 disk
		vdi                      254:128  0    15G  0 disk
		vdj                      254:144  0    15G  0 disk

3. Execute the following command to mount `dev` to `vol`:

		mount /dev/vdj /mnt/vol

	Output:

		mount: mount point /mnt/vol does not exist

4. Execute the following command to mount `dev` to `vol1`

		mount /dev/vdj /mnt/vol1 

5. Change the directory 
 
		cd /mnt/vol1

6. List all the sub-directories

		ls -ltr

7. Execute the following command to view the disk usage.

		df -h

	Output:

		Filesystem               Size  Used Avail Use% Mounted on
		rootfs                   7.3G  6.7G  248M  97% /
		udev                      10M     0   10M   0% /dev
		tmpfs                    397M  208K  397M   1% /run
		/dev/mapper/debian-root  7.3G  6.7G  248M  97% /
		tmpfs                    5.0M     0  5.0M   0% /run/lock
		tmpfs                    794M     0  794M   0% /run/shm
		/dev/vda1                228M   18M  199M   9% /boot
		/dev/vdj                  15G  847M   14G   6% /mnt/vol1

8. Execute the following command to mount.

		mount

	Output:

		sysfs on /sys type sysfs (rw,nosuid,nodev,noexec,relatime)
		proc on /proc type proc (rw,nosuid,nodev,noexec,relatime)
		udev on /dev type devtmpfs (rw,relatime,size=10240k,nr_inodes=506385,mode=755)
		devpts on /dev/pts type devpts (rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=000)
		tmpfs on /run type tmpfs (rw,nosuid,noexec,relatime,size=406364k,mode=755)
		/dev/mapper/debian-root on / type ext4 (rw,relatime,errors=remount-ro,user_xattr,barrier=1,data=ordered)
		tmpfs on /run/lock type tmpfs (rw,nosuid,nodev,noexec,relatime,size=5120k)
		tmpfs on /run/shm type tmpfs (rw,nosuid,nodev,noexec,relatime,size=812720k)
		/dev/vda1 on /boot type ext2 (rw,relatime,errors=continue)
		/dev/vdj on /mnt/vol1 type ext4 (rw,relatime,user_xattr,barrier=1,data=ordered)


	Now cinder volume has additional file system changes within the volume.	

9. To list the additional file system changes

		ls-ltr

	Output:

		total 6328752
		drwx------ 2 root root      16384 Oct  1 05:22 lost+found
		-rwxr-x--- 1 root root  702939136 Oct  1 05:23 CentOS_65.qcow2
		-rw-r--r-- 1 root root   10870593 Oct  1 05:24 initrd.img-3.2.0-4-amd64
		-rw-r--r-- 1 root root 5766807552 Oct  2 00:34 Debian_7.raw


10. Execute the following command to view the disk usage

		df -h

	Output:

		Filesystem               Size  Used Avail Use% Mounted on
		rootfs                   7.3G  6.7G  248M  97% /
		udev                      10M     0   10M   0% /dev
		tmpfs                    397M  208K  397M   1% /run
		/dev/mapper/debian-root  7.3G  6.7G  248M  97% /
		tmpfs                    5.0M     0  5.0M   0% /run/lock
		tmpfs                    794M     0  794M   0% /run/shm
		/dev/vda1                228M   18M  199M   9% /boot
		/dev/vdj                  15G  6.2G  8.6G  42% /mnt/vol1


11. Execute the following command to unmount the volume:

		umount /dev/vdj

12. Execute the following command:

		mount

	Output:

		sysfs on /sys type sysfs (rw,nosuid,nodev,noexec,relatime)
		proc on /proc type proc (rw,nosuid,nodev,noexec,relatime)
		udev on /dev type devtmpfs (rw,relatime,size=10240k,nr_inodes=506385,mode=755)
		devpts on /dev/pts type devpts (rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=000)
		tmpfs on /run type tmpfs (rw,nosuid,noexec,relatime,size=406364k,mode=755)
		/dev/mapper/debian-root on / type ext4 (rw,relatime,errors=remount-ro,user_xattr,barrier=1,data=ordered)
		tmpfs on /run/lock type tmpfs (rw,nosuid,nodev,noexec,relatime,size=5120k)
		tmpfs on /run/shm type tmpfs (rw,nosuid,nodev,noexec,relatime,size=812720k)
		/dev/vda1 on /boot type ext2 (rw,relatime,errors=continue)
		

#####Restore of data from Cinder backup

You can restore the volume to a new volume or an existing volume.

In the following example a new volume is created and then the data is restored.

Perform the following steps to create a new volume and to restore data backup.

1. Execute the following command to create a volume.

		 cinder create --display-name restore_volume1 15 

	Output:

			+---------------------+--------------------------------------+
			|       Property      |                Value                 |
			+---------------------+--------------------------------------+
			|     attachments     |                  []                  |
			|  availability_zone  |                 nova                 |
			|       bootable      |                false                 |
			|      created_at     |      2014-10-01T21:48:42.727440      |
			| display_description |                 None                 |
			|     display_name    |           restore_volume1            |
			|      encrypted      |                False                 |
			|          id         | 1b4614f8-8069-4211-8a3e-797be5641964 |
			|       metadata      |                  {}                  |
			|         size        |                  15                  |
			|     snapshot_id     |                 None                 |
			|     source_volid    |                 None                 |
			|        status       |               creating               |
			|     volume_type     |                 None                 |
			+---------------------+--------------------------------------+


2. Execute the following command to cinder backup restore


		cinder backup-restore --volume-id restore_volume1 60764712-c456-465a-828b-5f45d3a14ff5


3. View Cinder backup

		cinder backup-list

	Output:

		+--------------------------------------+--------------------------------------+-----------+-------------------+------+--------------+---------------------+
		|                  ID                  |              Volume ID               |   Status  |        Name       | Size | Object Count |      Container      |
		+--------------------------------------+--------------------------------------+-----------+-------------------+------+--------------+---------------------+
		| 02c6df2c-d03a-44ad-847a-ce03b580ee23 | 0a2c6c62-627f-42d3-9b66-e4ba56db0ba7 | available |   deb7rawbackup   |  10  |     None     | helion-ceph-backups |
		| 244aa3a1-b291-4cfe-9999-438f7611da2b | eb170c5e-d227-40ef-b515-b84b82c38eb0 | available |    Rvol6backup    |  15  |     None     | helion-ceph-backups |
		| 32ea7668-9179-433c-8fe3-44b98cd9d85b | 8aefafcc-4171-4c11-b900-362fbda40015 | available | ubuntu1404-backup |  10  |     None     | helion-ceph-backups |
		| 60764712-c456-465a-828b-5f45d3a14ff5 | ff8d13a5-3083-424b-a626-0b75cbe8cf66 | restoring |  cindervol_backup |  15  |     None     | helion-ceph-backups |
		| beeccb71-81e7-4860-8d38-add05a2e610d | eb170c5e-d227-40ef-b515-b84b82c38eb0 | available |    Rvol6backup    |  15  |     None     | helion-ceph-backups |
		| c9c20a09-403e-4011-a3f8-2fea11a560ee | 0a2c6c62-627f-42d3-9b66-e4ba56db0ba7 | available |  RDebian7_backup  |  10  |     None     | helion-ceph-backups |
		| cdd27130-1791-45f6-8b6e-cc284922b02e | 3adf1c83-2efa-4a1e-bef6-cdaffd13b489 | available |      Rbackup1     |  3   |     None     | helion-ceph-backups |
		+--------------------------------------+--------------------------------------+-----------+-------------------+------+--------------+---------------------+



4. View Cinder list

		cinder list

	Output:

		+--------------------------------------+------------------+-----------------------+------+-------------+----------+--------------------------------------+
		|                  ID                  |      Status      |      Display Name     | Size | Volume Type | Bootable |             Attached to              |
		+--------------------------------------+------------------+-----------------------+------+-------------+----------+--------------------------------------+
		| 0219d66e-d69d-4e28-bf4f-cb5f096696e3 |    available     |       Rsmallvol4      |  1   |     None    |  false   |                                      |
		| 0285ee63-4ebd-4cd1-915c-933c48503d00 |      in-use      |         Rvol1         |  10  |     None    |  false   | 54938de0-49dd-4b01-931e-dafcddc41518 |
		| 054bfa98-1d69-4cb8-b195-9b9481f5b8c7 |      in-use      |   Rwin2012Cowrawvol1  |  26  |     None    |   true   | 0bf98387-b0c9-4814-a2ef-f81c1ef1322e |
		| 1b4614f8-8069-4211-8a3e-797be5641964 | restoring-backup |    restore_volume1    |  15  |     None    |  false   |                                      |
		+--------------------------------------+------------------+-----------------------+------+-------------+----------+--------------------------------------+
		
	Once the backup is created the volume name remains the same as the cinder-backup name.


5. Verify the volume name

		cinder list

	Output:

		+--------------------------------------+-----------+-------------------------------------+------+-------------+----------+--------------------------------------+
		|                  ID                  |   Status  |             Display Name            | Size | Volume Type | Bootable |             Attached to              |
		+--------------------------------------+-----------+-------------------------------------+------+-------------+----------+--------------------------------------+
		| 0219d66e-d69d-4e28-bf4f-cb5f096696e3 | available |              Rsmallvol4             |  1   |     None    |  false   |                                      |
		| 0285ee63-4ebd-4cd1-915c-933c48503d00 |   in-use  |                Rvol1                |  10  |     None    |  false   | 54938de0-49dd-4b01-931e-dafcddc41518 |
		| 1b4614f8-8069-4211-8a3e-797be5641964 | available |         cindervol_forbackup         |  15  |     None    |  false   |                                      |
		+--------------------------------------+-----------+-------------------------------------+------+-------------+----------+--------------------------------------+



####Volume Snapshots

Volume snapshots are saved in Cinder pool.

######Creating a Volume Snapshot for Backup

You can create a new and identical volumes by taking snapshot of the volume.  

**Notes**

Ensure the following things while taking snapshot:

a) The volume must be detached and must be in available status to take a snapshot of it. An error occurs if you try to snapshot a used volume.

b) Keep the original volume, whose snapshot is taken, to function properly. If the original volume is deleted then the snapshot becomes unusable.

Perform the following steps to create a snapshot:

1. Execute the following command to create a snapshot

		nova volume-snapshot-create --force [TRUE or FALSE] --display_name [DISPLAY_NAME] --display_description [DISPLAY_DESCRIPTION] [VOLUME_ID]

2. Execute the following command to view the snapshot

		nova volume-snapshot-list

3. From Horizon, you can create snapshot of instances and can view the snapshot as below. (**need to update this section?**)

















