---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade: Back Up and Restore"
permalink: /helion/openstack/carrier/backup.restore/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
product-version2: HP Helion OpenStack 1.0
product-version2: HP Helion OpenStack 1.01
role1: System Engineer
role2: Systems Administrator

---
<!--UNDER REVIEW-->
	

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--
<p style="font-size: small;"> <a href="/helion/openstack/carrier/install/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/carrier/install-overview/">&#9650; UP</a> | <a href="/helion/openstack/carrier/install/esx/">NEXT &#9654;</a> </p>
-->

# HP Helion OpenStack&#174; Carrier Grade: Back Up and Restore

The default HP Helion OpenStack environment consists of a three-node cluster for most of the services plus other services such as RabbitMQ and MySQL. It is resilient to individual node failures as well as network split-brain situations.

However, as part of your maintenance of the environment, you should create a back up of each component and be prepared to restore any component, should it become necessary.

* **Undercloud.** The undercloud is a critical component that runs the centralized Logging, Monitoring, and Orchestration engines for deployment and automated configuration of the overcloud. It also provides a DHCP Server for all nodes of the overcloud. 

	If the undercloud server fails, it must be rebuilt and restored as soon as possible.

* **Overcloud.** The overcloud includes three overcloud controllers. 

	If either of the servers that host the two overcloud controllers (controller1 and controller2) fails, the overcloud controller must be rebuilt and reconnected into the cluster as soon as possible.

	The management controller, called controller0, is similar to the overcloud controller nodes, but it also executes various additional services, including Compute, Sherpa, Telemetry, Reporting, and Block Storage services. If the server that hosts the overcloud management controller fails, the management controller must be rebuilt and restored as soon as possible.

* **Overcloud database** The MySQL database or entire cluster on the overcloud Controllers may become corrupted. To prevent data loss, you will need back up and restore capability for the databases. 

The following instructions describe how to back up and restore the seed VM, undercloud, and overcloud:

- [Create a configuration file for restoring the seed VM and undercloud](#config)
- [Back up and restore the seed VM](#seed)
- [Back up and restore the undercloud](#under)
- [Back up and restore the overcloud](#over)
- [Backup command options](#options)
- [Restore command options](#roptions)
- [Undercloud password issues](#underpass)

Note that the seed cloud host server is where the seed VM is installed and the installation files are located.

If you need help, see [Back up and Restore Script Help](#help).

## Create a configuration file for restoring the seed VM and undercloud {#config}

During restore process for the seed VM and undercloud, a configuration file is required. The configuration file contains exported parameters used during the installation.

Use the following steps to back up the seed VM:

1. Log in to the seed cloud host. 

2. Create a configuration file that contains all of the following information:

		export BRIDGE_INTERFACE=<interface>
		export OVERCLOUD_NTP_SERVER=<ntp.server.ip>
		export UNDERCLOUD_NTP_SERVER=<ntp.server.ip>
		export OVERCLOUD_CODN_HTTP_PROXY=http://<proxy.server.ip>
		export OVERCLOUD_CODN_HTTPS_PROXY=http://<proxy.server.ip>
		export UNDERCLOUD_CODN_HTTP_PROXY=http://<proxy.server.ip>
		export UNDERCLOUD_CODN_HTTPS_PROXY=http://<proxy.server.ip>

	Where:

		- BRIDGE_INTERFACE is the name of the device connected to the private network that connects all baremetal nodes. By default `eth0`.
		- OVERCLOUD_NTP_SERVER is the IP address of the NTP server for the overcloud.
		- UNDERCLOUD_NTP_SERVER is the IP address of the NTP server for the undercloud.
		- OVERCLOUD_CODN_HTTP_PROXY is the
		- OVERCLOUD_CODN_HTTPS_PROXY is the
		- UNDERCLOUD_CODN_HTTP_PROXY is the
		- UNDERCLOUD_CODN_HTTPS_PROXY is the

## Back up and restore the seed VM {#seed}

The following sections describe how and when to [back up](#backseed) and [restore](#seedrest) the seed VM.

### Backing up the seed VM {#seedback} 

You should create a backup from the seed VM when any of the following events happen:

- When the installation process is complete.
- When any change is make in the undercloud from the seed cloud host
- When the undercloud restore process is performed (a new seed VM is created)

Use the following steps to back up the seed VM:

1. Log in to the seed VM host. 

2. Change to the `/root/tripleo/tripleo-incubator/scripts/` directory.

		cd /root/tripleo/tripleo-incubator/scripts/

3.	Execute the following script:

		./hp_ced_backup.sh --seed -f /root/backup

	A message similar to the following displays:

		HP Helion Community Edition Version Backup Procedure
 
		Destination Host Folder: /root/backup/
		Starting backup procedure for Seed...
		Backup files stored at /root/backup/backup_14-09-02-15-25/seed
		Backup spec file now
		Backup seed.qcow2 now
		Backup ssh keys now
		Backup Seed Finished.
		Backup Procedure Completed

All required files are backed-up to the specified folder:
	`/<destination folder>/backup_YY-MM-DD-HH-MM/seed` 

### Restoring the seed VM {#seedrest}

You should restore the seed VM when there is any problem with the node, for example:

- If the server where the VM is located fails (from a hardware or software issue).
- If there is any problem with the VM.
- If there is any problem in the operating system level.
- If there is any problem with the installation that cannot be corrected.

**Important: During the restore process the original seed VM will be deleted from the server.**

Use the following steps to restore the seed VM:

1.	Log in to the seed cloud host. 

2. Create a [configuration file](#config) with all the parameters exported during the installation of the seed VM (for example: /root/export.prop).

3. Change to the `/root/tripleo/tripleo-incubator/scripts/` directory.

		cd /root/tripleo/tripleo-incubator/scripts/

3.	Execute the following script:

		./hp_ced_restore.sh --seed -f <location of the backup files> -c /root/export.prop

	When the process is complete, a message similar to the following displays:

		Restore Seed Finished.
		Restore Procedure Completed

	**Example**

		root@kvmhost:~/tripleo/tripleo-incubator/scripts# ./hp_ced_restore.sh --seed -f /root/backup/backup_14-09-02-12-32 -c /root/export.prop

		HP Helion Community Edition Version Restore Procedure

		Source Host Folder: /root/backup/backup_14-09-02-12-32
		Backup from local host. Local Backup Folder is set to: /root/backup/backup_14-09-02-12-32
		Starting restore procedure for Seed...
		Restore spec file from /root/backup/backup_14-09-02-12-32/seed
		...
		...
		Seed VM created with MAC AB:CD:EF:GH:IJ:LM
		...
		...
		Wait for seed up
		...
		...
		Restore seed finished.
		Restore procedure completed

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Back up and restore the undercloud {#under}

The following sections describe how and when to [back up](#underback) and [restore](#underrest) the undercloud.

### Backing up the undercloud {#underback} 

You should create a backup from undercloud as soon as the overcloud is deployed and configured the first time.

Also you should create a backup when any change is made in the overcloud from the undercloud server.

**Important: During the backup process the undercloud server will be unavailable.**

Use the following steps to back up the undercloud:

1.Log in to the seed cloud host.

2. Change to the `/root/tripleo/tripleo-incubator/scripts/` directory:

		cd /root/tripleo/tripleo-incubator/scripts/

3. Execute the following script: 

		`./hp_ced_backup.sh --undercloud -f <destination folder>`

	When the process is complete, a message similar to the following displays:

		Backup undercloud finished.
		Backup procedure completed.

**Example**


		root@kvmhost:~/tripleo/tripleo-incubator/scripts# ./hp_ced_backup.sh --undercloud -f /root/backup/

		HP Helion Community Edition Version (unknown) Backup Procedure
 
		Destination Host Folder: /root/backup/
		Starting of Backup procedure for undercloud...
		The backup will be written to /root/backup//backup_14-09-03-12-17
		Temporary folder: /tmp/backup_14-09-03-12-17
		Backing up seed Files...
		...
		...
		Deleting temporary undercloud backup files...
		Warning: Permanently added '192.0.2.2' (ECDSA) to the list of known hosts.
		Backup undercloud finished.
		Backup procedure completed.

All required files are backed up to the specified folder:

	/<destination folder>/backup_YY-MM-DD-HH-MM/uc
 
### Restoring the undercloud {#underrest}

You should restore the undercloud when there is any problem with the node, for example:

- If the server where the node was located fails (from a hardware or software issue)
- If there is any problem in the OS level
- If there is any problem with the installation that cannot be corrected

**Important:**

- During the restore of the undercloud, the seed VM will be deployed again. You should [create a new backup from seed](#seedback) after the undercloud is restored.
- If the resource files are stored locally, the source files must be located in the `/tmp/` directory.
- If the admin user password was changed from the original password created during the installation process, see [undercloud password issues](#underpass) before beginning the restore.

Use the following steps to restore the undercloud:

1. Log in to the seed cloud host.

2. Create a [configuration file](#config) with all the parameters that was exported during before the installation of the undercloud node.

3. Change to the `/root/tripleo/tripleo-incubator/scripts/` directory:

		cd /root/tripleo/tripleo-incubator/scripts/

4. Create a file called `baremetal.csv` and save to the same location where the backup and restore scripts are located.

	**Example**

		/root/tripleo/tripleo-incubator/scripts

5. Edit the `baremental.csv` file to include only the line from your initial baremetal installation for your undercloud node. This is the first line in the initial `baremetal.csv` file.

	**Example**

		 78:e7:d1:22:5d:58,administrator,password,192.168.11.1,12,32768,1900

	For more information on the `baremetal.csv` file, see the [Installation Prerequisites](http://docs.hpcloud.com/helion/openstack/carrier/install/prereqs#csv).

6. Execute the following script:

		./hp_ced_restore.sh --undercloud -f <source folder> -c &#60;config file>

	When the process is complete, a message similar to the following displays:

		"Restore undercloud finished."
		"Restore procedure completed"

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Back up and restore the overcloud ## {#over}

The following sections describe how and when to back up and restore the overcloud.

You can [back up](#sherpaback) and [restore](#sherparest) an overcloud server or [back up](#databack) and [restore](#datarest) the overcloud database.

### Backing up an overcloud server ### {#sherpaback} 

You should create a backup of the overcloud servers when any Update and Extension is download to the system.

Use the following steps to back up the overcloud:

1. Log in to the seed cloud host.

2. Change to the `/root/tripleo/tripleo-incubator/scripts/` directory:

		cd /root/tripleo/tripleo-incubator/scripts/

3. Execute the following script: 

		./hp_ced_backup.sh --overcloud -f <destination folder>

	When the process is complete, a message similar to the following displays:

		Backup overcloud finished.
		Backup procedure completed

	**Example**

		./hp_ced_backup.sh --overcloud -f /root/backup/
 
		HP Helion Community Edition Version Backup Procedure

		Destination Host Folder: /root/backup/
		Starting of Backup procedure for overcloud...
		The backup will be written to /root/backup/backup_14-09-03-12-30
		...
		...
		Deleting temporary overcloud backup files...
		Backup overcloud finished.
		Backup procedure completed

All required files are backed-up to the specified folder:

	/<destination folder>/backup_YY-MM-DD-HH-MM/oc

### Restoring the Sherpa overcloud {#sherparest}

Use the following steps to restore the Sherpa overcloud:

1. Log in to the seed cloud host.

2. Change to the `/root/tripleo/tripleo-incubator/scripts/` directory:

		cd /root/tripleo/tripleo-incubator/scripts/

3. Execute the following script: 

		./hp_ced_restore.sh --overcloud -f <location of the backup files>

	When the process is complete, a message similar to the following displays:

		Restore overcloud finished.
		Restore procedure completed

	**Example**

		./hp_ced_restore.sh --overcloud -f /root/backup/backup_14-09-03-12-30

		HP Helion Community Edition Version Restore Procedure

		Source Host Folder: /root/backup/backup_14-09-03-12-30
		Backup from local host. Local Backup Folder is set to: /root/backup/backup_14-09-03-12-30
		Starting restore procedure for overcloud...
		Restore source folder: /root/backup/backup_14-09-03-12-30
		Restore name: backup_14-09-03-12-30
		...
		...
		Restore overcloud finished.
		Restore procedure completed

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

### Backing up the overcloud database {#sherpaback}

You should create a backup from the overcloud database on a regular basis as determined by the administrator or your organization's policies.

Use the following steps to back up the overcloud database:

1. Log in to the seed cloud host.

2. Change to the `/root/tripleo/tripleo-incubator/scripts/` directory:

		cd /root/tripleo/tripleo-incubator/scripts/

3. Execute the following script: 

		./hp_ced_backup.sh --database -f <destination folder>

	When the process is complete, a message similar to the following displays:

		Backup overcloud database finished.
		Backup procedure completed

	**Example**

		./hp_ced_backup.sh --database -f /root/backup/
 
		HP Helion Community Edition Version Backup Procedure
 
		Destination Host Folder: /root/backup/
		Starting of Backup procedure for overcloud database...
		The backup will be written to /root/backup/backup_14-09-03-12-46 temporary folder /tmp/backup_14-09-03-12-46
		...
		...
		Deleting temporary overcloud database backup files...
		Backup overcloud database finished.
		Backup procedure completed

All required files are backed-up to the specified folder:

		/<destination folder>/backup_YY-MM-DD-HH-MM/db

### Restoring the overcloud database {#sherparest}

You should restore the overcloud database when there is any problem with the node, for example:

- If the overcloud server fails (from a hardware or software issues)
- If the database becomes corrupted for any reason
- If an old database needs to be recovered for any reason


**Important:**

- During the backup process of the overcloud database the server won't be affected.
- Every time that the overcloud database restore procedure is executed a backup of the current database will be created inside each node and will be located at `/mnt/state/var/lib/mysql_YY-MM-DD-HH-MM`.
- If any problem happens during the restore, the operator can go and manually bring the MySQL cluster back and execute `os-refresh-config` in all the nodes

 
Use the following steps to restore the overcloud database:

1. Log in to the seed cloud host.

2. Change to the `/root/tripleo/tripleo-incubator/scripts/` directory.

		cd /root/tripleo/tripleo-incubator/scripts/

3. Execute the following script: 

		./hp_ced_restore.sh --database -f <location of the backup files>

	When the process is complete, a message similar to the following displays:

		Restore overcloud database finished.
		Restore procedure completed

	**Example**

		./hp_ced_restore.sh --database -f /root/backup/backup_14-09-03-12-46
 
		HP Helion Community Edition Version Restore Procedure
 
		Source Host Folder: /root/backup/backup_14-09-03-12-46
		Backup from local host. Local Backup Folder is set to: /root/backup/backup_14-09-03-12-46
		Starting restore procedure for overcloud database...
		...
		...
		INFO:os-refresh-config:Completed phase migration
		Restore Procedure Completed

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

<!--
### Rebuilding the Overcloud Management Controller ### {#mgmt}

If the overcloud management controller goes down for a period of time or fails, you need to rebuild the overcloud management controller and any Volume Operation (Cinder) storage volume that were affected. 

During the period that the server is re-building, you can temporarily restart the storage volumes using the following steps:

1.  SSH to the undercloud controllers.

2. Execute the following commands

		os-svc-enable-upstart cinder-volume enable
		service cinder-volume start

After the management controller is rebuilt, use the following steps below to disable the temporary solution:

1. SSH to the same undercloud controllers where cinder-volume was enable before

2. Execute the following commands

		service cinder-volume stop
		os-svc-enable-upstart cinder-volume disable

**Important:** After manually enabling and starting the storage volumes on controller0 or controller1, if you run the `os-refresh-config` command, the Volume Operations service stops and is disabled again. You must make sure that you enables the service again.
-->

## Back up and restore help ## {#help}

Use the following sections as needed.

### Backup command options {#options}

The following lists all of the command options for the backup script, `hp_ced_backup.sh`.

		root@kvmhost:~/tripleo/tripleo-incubator/scripts# ./hp_ced_backup.sh --help
		HP Helion Community Edition Version Backup Procedure
		Usage: hp_ced_backup.sh [options]

		"The Backup tool can backup following"
			1. Seed"
			2. UnderCloud"
			3. OverCloud"
			4. OverCloud Database"	
		
		"Options:"
		[Required]"
			-S|--seed             - backups seed"
			-U|--undercloud       - backups undercloud"
			-O|--overcloud        - backups overcloud"
			-D|--database         - backups overcloud database"
			-f|--dest-host-folder - folder path to which to backup"
		[Optional]"
			-H|--dest-host-ip     - ip of host to which to backup"
			-u|--dest-host-user   - username of host to which to backup"
			-i|--identity-file    - selects a file from which the identity (private key) for public key authentication is read"
			-t|--temp-uc-backup-folder - folder path to which to store temporary backup files while backing up the undercloud (default: /mnt/tmp)"
			-e|--exclude-uc-backup     - excludes specified files while backing up the /mnt folder in undercloud. (e.g. state/var/log or state/var/lib/elasticsearch)"
    

### Restore command options {#roptions}

The following lists all of the command options for the backup script, `hp_ced_restore.sh`.

		root@kvmhost:~/tripleo/tripleo-incubator/scripts# ./hp_ced_restore.sh --help
 
		HP Helion Community Edition Version Restore Procedure
 
		Usage: hp_ced_restore.sh [options]
 

		"The Restore tool can restore the following from a previous restore"
			1. Seed"
			2. UnderCloud"
			3. OverCloud"
			4. OverCloud Database"

		"Options:"
		[Required]"
			-S|--seed               - restores seed"
			-U|--undercloud         - restores undercloud"
			-O|--overcloud          - restores overcloud"
			-D|--database           - restores overcloud database"
			-f|--source-host-folder - folder path from which to restore"
		[Optional]"
			-H|--source-host-ip     - ip of host from which to restore"
			-u|--source-host-user   - username of host from which to restore"
			-i|--identity-file      - selects a file from which the identity (private key) for public key authentication is read"
			-c|--config-file        - will source this file on the host and/or Seed(Mandatory for --seed and --undercloud options)"
			-t|--temp-uc-restore-folder - folder path from which to restore backup files while restoring the undercloud (default: /mnt/tmp)"
			-e|--exclude-uc-restore     - excludes specified files while restoring the /mnt folder in undercloud. (e.g. state/var/log or state/var/lib/elasticsearch)"
			-v|--vm-plan                - given a file which specifies node spec when HP_VM_MODE=y (Mandatory for --undercloud options)"
    

Other optional options that can be used during the backup/restore process, as:

- Backup/Restore the files in/from a remote server (using option H)
- Backup seed + undercloud + ... all at once using all the parameters at the same time (--seed, --undercloud --overcloud)

## Undercloud password issues {#underpass}

If the admin user password was changed from the original password created during the installation process, you need to update the password in some files before performing the undercloud backup or restore process. If this process has been done and the files contain the correct password, you do not need to edit the files.

1. Log in to the seed cloud host.
2. SSH to the seed VM
3. Open the `/root/tripleo/tripleo-undercloud-passwords` file.
4. Update the `UNDERCLOUD_ADMIN_PASSWORD=` line with the new password and save the file.
5. Open the file `/root/tripleo/ce_env.json`. 
6. Update the `undercloud` line with the new password and save the file.
7. SSH to the undercloud server.
8. Open the `/root/stackrc` file.
9. Update the `OS_PASSWORD=` line with the new password and save the file.


## For more information ##

For information on Disaster Recovery (DR) and Business Continuity Planning (BCP) plans, see [Disaster Recovery](/helion/openstack/carrier/disaster/recovery/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
