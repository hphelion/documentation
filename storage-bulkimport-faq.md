---
layout: default
title: "Bulk Import Service for Object Storage and Block Storage FAQ"
permalink: /object-storage/bulk-importFAQ/
product:
  - block-storage
  - object-storage

---
#Bulk Import Service for Object Storage and Block Storage FAQ

The following should answer most of your questions about our Bulk Import service.

- [What file system formats do you accept?](#fileformat)
- [Are there details to how the files will come out once uploaded?](#uploaddetail)
- [What hard disk device types do you accept?](#devices)
- [Are there any restrictions on the file type?](#filerestrict)
- [Are there any restrictions on the number of partitions on the drive?](#partitions)
- [How long will it take from the time of receiving the drive?](#time)
- [Do you send the drive back to me and how is it shipped or can you destroy the disk for me?](#drivereturn)
- [How will I know the status of my bulk Import?](#status)
- [How does Bulk Import work?](#howworks)
- [How much does Bulk Import cost?](#cost)
- [How do I use the Bulk Import script, and why would I use it?](#script)
- [What happens if my disk is lost in the mail? Is the data encrypted? Can anyone read my data?](#lost)

_____________

####Q:	What file system formats do you accept?{#fileformat}

A: 	We accept NTFS, ext2, ext3, ext4, and FAT32 file system formats.

####Q:	Are there details to how the files will come out once uploaded? For example, if it’s in a Windows subfolder directory structure will the pseudo-directories be created in Swift?{#uploaddetail}

A:	Your directory structure will be maintained.

####Q:	What hard disk device types do you accept?{#devices}

A:	At this time, we accept only USB 2.0 and 3.0 devices. We plan to support SATA and eSATA in the future.

####Q:	Are there any restrictions on the file type?{#filerestrict}

A:	For object storage upload we only allow uploads of regular files and directories. No Symlinks, block devices, FIFOs, or character devices. 
	Block storage upload has no restrictions.

####Q:	Are there any restrictions on the number of partitions on the drive?{#partitions}

A:	For object storage upload we allow just one partition. There are no partition restrictions for block storage upload

####Q:	How long will it take from the time of receiving the drive?{#time}

A:	The time depends on the amount of data to be uploaded; we estimate a minimum of 12 hours to move one terabyte of data. Customer support will keep you informed on where your drive and data is during the process:  when we receive your drive, when we start uploading data from the drive, and when the upload is complete.

####Q:	Do you send the drive back to me and how is it shipped or can you destroy the disk for me?{#drivereturn}

A:	Yes, we will either ship your device back to you or destroy the drive based on your needs. Our disk destruction device is DOD rated. 

####Q:	How will I know the status of my bulk Import?{#status}

A:	HP will inform you of status via updates along the way. You will be notified when:

1.	The device arrives in the data center

2.	The data import process begins

3.	The import is complete

4.	The device has been shipped back/destroyed.


####Q:	How does Bulk Import work?{#howworks}

A:	The bulk import service works with your existing HP Cloud account. If you don’t have an account, [create one here](http://www.hpcloud.com/free-trial).
1.	Use the Management Console to contact your HP Cloud support technician. He or she will get the process started for you. 

2.	Sign a legal consent form.

3.	Fill out a form with information about your device.

4.	Copy the data to your device. Unless you want your data to be stored and retrieved encrypted, you should not encrypt your data, as HP will not decrypt it for you.

5.	Download the HP Cloud Bulk Import client script and run the script on your data to prepare your account for bulk import.

6.	You support contact will review all the logistics with respect to shipping your device to an HP Cloud data center. When we receive your data, we’ll hook up your device to a workstation that has a direct Gigabit link to our Cloud storage infrastructure. Once your data is copied, we’ll ship your device back to you or destroy it based on your directions.

####Q:	How much does Bulk Import cost?{#cost}

A:	Normally there is an $80 per device charge for Bulk Import; however we are currently offering free bulk import for any data over 500GB.

####Q:	How do I use the Bulk Import script, and why would I use it?{#script}

A:	For object storage (i.e., Swift) bulk imports the client import script makes the following changes:

Objects that are greater than 1GB in size are split into segments of 1GB on upload.  To store these segments the client script creates a <target container>_segments container in the user account.
It adds the HP Cloud bulk import user (HPCS_Bulk_Import_Export) to the container read and write ACLs for the <target container> and <target container>_segments containers.

On completion of the Swift bulk import job, the <target container>_segments container needs to be removed if empty.  In addition, the HP Cloud bulk import user needs to be removed from the container read and write ACLs.  This can be done by running the client import script and selecting the “clean-up” option (option 2).

####Q: What happens if my disk is lost in the mail? Is the data encrypted? Can anyone read my data?{#lost}



