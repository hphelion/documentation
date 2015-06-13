---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Performing a System Data Backup"
permalink: /helion/openstack/carrier/admin/backup/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: All

authors: Paul F

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/openstack/1.1/3rd-party-license-agreements/">&#9664; PREV</a> | <a href="/helion/openstack/1.1/">&#9650; UP</a> | NEXT &#9654; </p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): Performing a System Data Backup

A system data backup captures core system information needed to restore a fully operational HP Helion OpenStack Carrier Grade cluster.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

System data backups include:
* platform configuration details
* system databases
* patching and package repositories
* home directory for the wrsroot user and all LDAP user accounts. 

System data backups do not include:

* Modifications manually made to the file systems, such as configuration changes on the /etc directory. After a restore operation has been completed, these modification have to be reapplied.
* Home directories and passwords of local user accounts. They must be backed up manually by the system administrator.
* The /root directory. Use the wrsroot account instead when root access is needed.

To perform a system backup:

1. Log in as user wrsroot to the active controller.

	You can log in directly on the console or remotely using ssh.

2. Use the following command to execute the system backup.

		sudo config_controller --backup <name>

	Where &lt;name> is an arbitrary identifier to use for the backup

	Upon successful execution of the command, the following two files are available on the controller's file system:
	
	* /opt/backups/backup_20140918_system.tgz
	* /opt/backups/backup_20140918_images.tgz

	Together, these two files represent the entire system data.

3. Transfer the backup files to an external storage resource.

	You can use a command such as scp to transfer the backup files to a server reachable over the OAM network.

	You can also copy them to a locally attached storage device, such as an external USB drive.

	4. Optional: Delete the backup files.

	You may want to free up disk space on the controller to accommodate upcoming Cinder volume backups.

The system data backup is now complete. The backup files must be kept in a secured location, probably holding multiple copies of them for redundancy purposes.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
