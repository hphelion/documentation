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


## Best practices ###

Is recommended to create a backup from seed when any of the events below happen:

* The seed backup should be done as soon as the whole installation is finished (seed/UnderCloud/overcloud)

* When any change is make in the UnderCloud from the seed server


Is recommended to restore the seed node when there is any problem with the node, for example: 

* The KVM host where the VM was located crashed
* There is any problem with the VM
* There is any problem with the OS

## Backing up the seed VM ## {#seed}

1. Log in to the seed VM. 

2. Change to the `/root/work/tripleo/tripleo-incubator/scripts/` directory.

		cd /root/work/tripleo/tripleo-incubator/scripts/

3.	Execute the following script:

		./hp_ced_backup.sh --seed -f <destination folder>

	When the process is complete, a message similar to the following displays:

		Backup Seed Finished.
		Backup Procedure Completed

	All required files are backed-up to the specified folder:
	`/<destination folder>/backup_YY-MM-DD-HH-MM/seed` 

	**Example:**

	If you enter the command:

		root@kvmhost:~/work/tripleo/tripleo-incubator/scripts# ./hp_ced_backup.sh --seed -f /root/backup

	The seed VM will respond as follows:

		HP Helion Community Edition Version Backup Procedure

		Destination Host Folder: /root/backup/
		Starting backup procedure for Seed...
		@ Backup files stored at /root/backup/backup_14-09-02-15-25/seed
		@ Backup spec file now
		@ Backup seed.qcow2 now
		@ Backup ssh keys now
		Backup Seed Finished.
		Backup Procedure Completed

### Restoring the seed VM:

1.	Log in the seed VM. 

2. Change to the `/root/work/tripleo/tripleo-incubator/scripts/` directory.

		cd /root/work/tripleo/tripleo-incubator/scripts/


2.	CD to “/root/work/tripleo/tripleo-incubator/scripts/” directory

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

The backup structure will always be:
/<destination folder>/backup_YY-MM-DD-HH-MM/seed (For Seed)
/<destination folder>/backup_YY-MM-DD-HH-MM/uc (For UnderCloud)
/<destination folder>/backup_YY-MM-DD-HH-MM/oc (For OverCloud)
