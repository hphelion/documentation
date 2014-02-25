---
layout: default
title: "HP Cloud OS for Moonshot: Backing Up Your Cloud"
permalink: /cloudos/moonshot/manage/backup-process/
product: moonshot

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/prepare/releasenotes">&#9664; PREV</a> | <a href="/cloudos/moonshot/">&#9650; UP</a> | NEXT &#9654; </p>
 
# HP Cloud OS for Moonshot: Backing Up Your Cloud # {#moon-image-builder}
The three key components of HP Cloud OS for Moonshot are the Admin Node, the Controller Node, and the Baremetal Host. Since these key functional components vary from node to node, an HP Cloud OS for Moonshot would need to be backed up in different ways with intricate backup/restore policy designs. 

However, a simpler approach is to take the backup at the system level rather than at the file level. Being virtualized guests, a system-level backup is easier to implement and the same policy can be applied across all of your HP Cloud OS for Moonshot components.

This document describes how to back up and restore your HP Cloud OS for Moonshot running an ESXi hypervisor and a KVM hypervisor.

## Backing up and restoring VMWare guest ##

If you are running your HP Cloud OS for Moonshoton VMWare's ESXi Hypervisor, you can use multiple tools for backing up the your nodes, such as:

* VMware vSphere Data Protection Advanced
* Veeam Backup & Replication
* XSIBackup

This section describes how to create a backup of your HP Cloud OS for Moonshot  that is running on VMWare's ESXi Hypervisor using XSIBackup.

**Note:** You can find more information on the [XSIBackup man page](http://33hops.com/xsibackup-help-man-page.html).

* [Backing up your cloud with XSIBackup](#cloud-xsibackup)

### Using XSIBackup ### {#cloud-xsibackup}

XSIBackup uses the ESXi built-in command line options to create fully unattended backup solutions. This means that you can create a backup schema that will, for example backup all your running virtual machines each night. You can choose to carry out a ‘hot backup’ or a ‘cold backup’.

Usage

xsibackup --backup-point=/vmfs/volumes/backup --backup-type=custom --backup-vms=AdminVM,CtrlVM,bmVM --mail-from=email.sender@yourdomain.com --mail-to=email.recipient@anotherdomain.com --smtp-srv=smtp.cloudos.local --smtp-port=25 --smtp-usr=username --smtp-pwd=password

Options: 
--backup-point 

Full path to the backup mount point in the local server where it will typically be under /vmfs/volumes, i.e. /vmfs/volumes/backup. 

--backup-how (hot | cold) 

Hot backup is the default method, which takes a backup while the VM is on. You can chose to make a cold backup and the VM will be cleanly shutdown before backup and switched on right after the backup is taken.

--backup-type (custom | all | running) 

Custom: if this method is chosen then a list of the VMs to backup must be passed to the --backup-vms option. 

All: backup -all- VMS. 

Running:  backup only running virtual machines. They will be cleanly shutdown and backed up then switched on again. --backup-vms List of virtual machines to backup as a colon separated list, i.e.: 

--backup-vms=VM1,VM2,VM3

Only needed if "custom" is selected as the --backup-type. 
Please do remember to double quote this string if there are any VMs with spaces in their names. 

--mail-from 

E-mail address from where the HTML e-mail report will be sent. 

--mail-to 

E-mail address to which the HTML e-mail report will be sent.

--subject

You can set your own subject

--smtp-srv 

SMTP server that we will use to send the HTML e-mail report. 

--smtp-port 

SMTP server port. 

--smtp-usr 

SMTP username we will use in the plain text SMTP authentication. Please note this is the only authentication method supported by esxbackup as of now. 

--smtp-pwd 

SMTP password used for authentication against the SMTP server.

CRON SETUP 
To accomplish this, you need to do the following: 

1.	Edit /etc/rc.local.d/local.sh, the system's startup script to get the cron service pid and to kill the process before writing anything to the crontab. 

2.	Edit /etc/rc.local.d/local.sh, the system's startup script to inject the cron line you will need into the ESXi 5.1 root's crontab located at /var/spool/cron/crontabs/root 

3.	Start the cron service again. 
To accomplish, this do the following: 
root# vi /etc/rc.local.d/local.sh 
At the end of the file right before the "exit 0" statement write the following: 
/BIN/KILL $(CAT /VAR/RUN/CROND.PID) 	#Gets the cron service pid and simply kills it. 

4.	The next line writes a typical cron line to the crontab, in this example we execute "xsibackup" passing it some arguments to backup all running virtual machines to /vmfs/volumes/backup 

//BIN/ECHO "5 0 * * * /VMFS/VOLUMES/DATASTORE1/XSIBACKUP --BACKUP-POINT=/VMFS/VOLUMES/BACKUP --BACKUP-TYPE=RUNNING --MAIL-FROM=FROMUSER@YOURDOMAIN.COM --MAIL-TO=RECIPIENT@YOURDOMAIN.COM --SMTP-SRV=SMTP.YOURSERVER.COM --SMTP-PORT=25 --SMTP-USR=YOURUSERNAME --SMTP-PWD=YOURPASSWORD
5.	Finally, we start the cron service again
/USR/LIB/VMWARE/BUSYBOX/BIN/BUSYBOX CROND

Restore

In the event of failure, replace the failed VM’s folder with the files backed up by XSIBackup. 

## Backing up and restoring KVM ##

Like other hypervisors, KVM also has different tools and methods to backup running virtualized machines. Some of them are:

•	vzdump
•	Livebackup
•	Writing scripts to backup
•	LVM Snapshots

This section describes in detail the process to use vzdump & vzrestore utilities provided in Ubuntu for backup of HP Cloud OS for Moonshot.

### Using vzdump

Vzdump is a utility to make consistent snapshots of running VMs. It basically creates a tar archive of the VM private area and configuration files. It supports OpenVZ and QEMUServer virtualized machines.

Usage


VZDUMP  OPTIONS [--ALL | <VMID>]

--exclude VMID		

Exclude VMID (assumes --all)

--exclude-path REGEX	

Exclude certain files/directories. You can use this option more than once to specify multiple exclude paths

--stdexcludes	
	
Exclude temporary files and logs

--compress		

Compress dump file (gzip)

--storage STORAGE_ID
	
Store resulting files to STORAGE_ID (PVE only)

--script	
		
Execute hook script

--dumpdir DIR	
	
Store resulting files in DIR

--maxfiles N	
	
Maximum number of backup files per VM.

--tmpdir DIR	
	
Store temporary files in DIR. --suspend and –stop use this directory to store a copy of the VM.

--mailto EMAIL	

Send notification mail to EMAIL. You can use this option more than once to specify multiple receivers.

--stop		
	
Stop/Start VM if running

--suspend		

Suspend/Resume VM when running

--snapshot		

Use LVM snapshot when running

--size MB		

LVM snapshot size (default 1024)

--bwlimit KBPS	

Limit I/O bandwidth; KBytes per second

--lockwait MINUTES	

Maximum waiting  time for the global lock. vzdump uses a global lock file to ensure that only one instance is running (running several instances put too much load on a server). The default is 180 minutes (3 hours).

--stopwait MINUTES 
   
 Maximum time to wait until a VM is stopped.

Vzrestore 

This utility is used to restore OpenVZ vzdump archives to virtual machine

Usage

	VZRESTORE <ARCHIVE> <VMID>
