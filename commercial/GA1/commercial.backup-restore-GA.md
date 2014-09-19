---
layout: default
title: "HP Helion OpenStack&#174; Edition: VSA Support"
permalink: /helion/openstack/ga/backup.restore/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/helion/openstack/install/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-overview/">&#9650; UP</a> | <a href="/helion/openstack/install/esx/">NEXT &#9654;</a> </p>


# HP Helion OpenStack&#174; Back Up and Restore

The following are instructions for how to back up and restore the seed, undercloud, and overcloud.

- [Back up and restore best practices](#best)
- [Back up and restore the seed VM](#seed)
- [Back up and restore the overcloud](#overcloud)
- [Back up and restore the undercloud](#undercloud)
- [Back up and restore script Help](#help)


## Back up and restore best practices ## {#best}

Is recommended to create a backup from seed when any of the events below happen:

Other optional options that can be used during the backup/restore process, as:

		Backup/Restore the files in/from a remote server (using option H)
		Backup Seed + Undercloud + … all at once using all the parameters at the same time (--seed, --undercloud --overcloud)

The backup structure will always be:

		/<destination folder>/backup_YY-MM-DD-HH-MM/seed (For Seed)
		/<destination folder>/backup_YY-MM-DD-HH-MM/uc (For UnderCloud)
		/<destination folder>/backup_YY-MM-DD-HH-MM/oc (For OverCloud)
	/<destination folder>/backup_YY-MM-DD-HH-MM/db (For OverCloud Database)
The scripts will always be executed in the KVM Server, this mean:

    Where seed VM is installed
    Where the installation files are located

During restore process, the config file parameter is required for seed and UnderCloud only. In this file all the exported parameters used during the installation need to be there in this format:

Example of config file

		export BRIDGE_INTERFACE=<interface>
		export OVERCLOUD_NTP_SERVER=<ntp.server.ip>
		export UNDERCLOUD_NTP_SERVER=<ntp.server.ip>
		export OVERCLOUD_CODN_HTTP_PROXY=http://<proxy.server.ip>
		export OVERCLOUD_CODN_HTTPS_PROXY=http://<proxy.server.ip>
		export UNDERCLOUD_CODN_HTTP_PROXY=http://<proxy.server.ip>
		export UNDERCLOUD_CODN_HTTPS_PROXY=http://<proxy.server.ip>

 
## Back up and restore the seed VM ## {#seed}

The following sections describe how and when to [back up]{#backseed} and [restore]{#seedrest} the seed VM.

### Backing up the seed VM ### {#seedback} 

You should create a backup from seed VM when any of the events below happen:

- The seed backup should be done as soon as the whole installation is finished (seed/UnderCloud/overcloud)
- When any change is make in the UnderCloud from the seed server
- When UnderCloud restore process is executed (a new seed will be created)
 
Use the following steps to back up the seed VM:

1. Log in to the seed VM. 

2. Change to the `/root/work/tripleo/tripleo-incubator/scripts/` directory.

		cd /root/work/tripleo/tripleo-incubator/scripts/

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

You should restore the seed node when there is any problem with the node, for example:

- The KVM host where the VM was located crashed (hardware/software problem)
- There is any problem with the VM
- There is any problem in the OS level
- There is any problem with the installation that is not fixable

**Important:**

- During the restore process the original seed VM will be deleted from the KVM Host.
- During the backup process of the Seed VM won’t be affected.

Use the following steps to restore the seed VM:

1.	Log in the seed VM. 

2. Create a configuration file with all the parameters that was exported during before the installation of the Seed node (e.g.: /root/export.prop)

3. Change to the `/root/work/tripleo/tripleo-incubator/scripts/` directory.

		cd /root/work/tripleo/tripleo-incubator/scripts/

3.	Execute the following script:

		./hp_ced_restore.sh --seed -f <location of the backup files>

	When the process is complete, a message similar to the following displays:

		Restore Seed Finished.
		Restore Procedure Completed

	**Example**

	If you enter the command:

		root@kvmhost:~/work/tripleo/tripleo-incubator/scripts# ./hp_ced_restore.sh --seed -f /root/backup/backup_14-09-02-12-32

	The seed VM will respond as follows:


		HP Helion Community Edition Version Restore Procedure

		Source Host Folder: /root/backup/backup_14-09-02-12-32
		Backup from local host. Local Backup Folder is set to: /root/backup/backup_14-09-02-12-32
		Starting restore procedure for Seed...
		Restore spec file from /root/backup/backup_14-09-02-12-32/seed
		…
		…
		Seed VM created with MAC AB:CD:EF:GH:IJ:LM
		…
		…
		Wait for seed up
		…
		…
		Restore Seed Finished.
		Restore Procedure Completed

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Back up and restore the undercloud ## {#under}

The following sections describe how and when to [back up]{#underback} and [restore]{#underrest} the undercloud.

### Backing up the undercloud ### {#underback} 

You should create a backup from undercloud when any of the events below happen:

- The UnderCloud backup should be done as soon as overcloud is deployed and configured the first time.
- Also when any change is make in the OverCloud from the UnderCloud server

Use the following steps to back up the seed VM:

1.Log in the KVM server.

2. Change to the `/root/work/tripleo/tripleo-incubator/scripts/` directory.

		cd /root/work/tripleo/tripleo-incubator/scripts/

3. Execute the following script: 

		`./hp_ced_backup.sh --undercloud -f <destination folder>`

	When the process is complete, a message similar to the following displays:

		Backup UnderCloud Finished.
		Backup Procedure Completed

**Example**

If you enter the following command:

		root@kvmhost:~/work/tripleo/tripleo-incubator/scripts# ./hp_ced_backup.sh --undercloud -f /root/backup/

The seed VM will respond as follows:
 
		HP Helion Community Edition Version (unknown) Backup Procedure
 
		Destination Host Folder: /root/backup/
		Starting of Backup procedure for Undercloud...
		The backup will be written to /root/backup//backup_14-09-03-12-17
		Temporary folder: /tmp/backup_14-09-03-12-17
		Backing up Seed Files...
		…
		…
		Deleting temporary Undercloud Backup files...
		Warning: Permanently added '192.0.2.2' (ECDSA) to the list of known hosts.
		Backup UnderCloud Finished.
		Backup Procedure Completed

 
### Restoring the undercloud ### {#underrest}

Use the following steps to restore the seed VM:

- The server where the node was located crashed (hardware/software problem)
- There is any problem in the OS level
- There is any problem with the installation that is not fixable

**Important:**

- During the restore of the UnderCloud the Seed VM will be deploy again, so is high recommend to create a new backup from seed after this procedure.
- During the backup process of the UnderCloud server will be unavailable.
- If the admin user password was changed from the original password created during the installation process, see [Undercloud password issues](#underpass).

Use the following steps to restore the seed VM:

1. Log in the KVM server.

2. Create a configuration file with all the parameters that was exported during before the installation of the undercloud node (for example: `/root/export.prop`).

3. Change to the `/root/work/tripleo/tripleo-incubator/scripts/` directory.

		cd /root/work/tripleo/tripleo-incubator/scripts/

4. Create a file called `baremetal.csv` and save to the same location where the script is located.

5. Edit the `baremetal.csv file` and add the line of the physical server that will be used to restore the undercloud.

6. Execute the following script:

		./hp_ced_restore.sh --undercloud -f <source folder> -c <config file>

	When the process is complete, a message similar to the following displays:

		“Restore UnderCloud Finished.”
		“Restore Procedure Completed”

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Back up and restore the overcloud ## {#over}

The following sections describe how and when to [back up]{#overback} and [restore]{#overrest} the overcloud.

### Backing up the overcloud ### {#overback} 

You should create a backup from the overcloud if the event below happens:

- When any Update and Extension is download to the system.

Use the following steps to back up the overcloud:

1. Log in the KVM server.

2. Change to the `/root/work/tripleo/tripleo-incubator/scripts/` directory.

		cd /root/work/tripleo/tripleo-incubator/scripts/

3. Execute the following script: 

		./hp_ced_backup.sh --overcloud -f <destination folder>

	When the process is complete, a message similar to the following displays:

		Backup OverCloud Finished.
		Backup Procedure Completed

	**Example**

		./hp_ced_backup.sh --overcloud -f /root/backup/
 
		HP Helion Community Edition Version Backup Procedure

		Destination Host Folder: /root/backup/
		Starting of Backup procedure for Overcloud...
		The backup will be written to /root/backup/backup_14-09-03-12-30
		…
		…
		Deleting temporary Overcloud Backup files...
		Backup OverCloud Finished.
		Backup Procedure Completed



### Restoring the undercloud ### {#underrest}

Use the following steps to restore the seed VM:


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## Back up and restore help ## {#help}




### Undercloud password issues ### {#underpass}

If the admin user password was changed from the original password created during the installation process, before performing the undercloud backup or restore process, you need to update the password in some files. If this process has been done and the files contain the correct password, you do not need to edit the files.

1. Log in the KVM server.
2. SSH to the Seed VM
3. Open the `/root/tripleo/tripleo-undercloud-passwords` file.
4. Update the `UNDERCLOUD_ADMIN_PASSWORD=` line with the new password and save the file.
5. Open the file `/root/tripleo/ce_env.json`. 
6. Update the the `undercloud` line with the new password and save the file.
7. SSH to the undercloud server.
8. Open the `/root/stackrc` file.
9. Update the `OS_PASSWORD=` line with the new password and save the file.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
