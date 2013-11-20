---
layout: default
title: "HP Cloud Services: Overview of Transitioning from Version 12.12 to 13.5"
permalink: /migration-overview/

---
# HP Cloud Services 12.12 to 13.5 transition overview

This page provides you with information to help you transition from version 12.12 to 13.5 of the HP Cloud services.  This overview covers the following topics and tasks:

* [Before you begin](#BeforeYouBegin)
* [Transitioning data for ephemeral instances](#Ephemeral)
* [Transitioning data for persistent instances](#Persistent)
* [Block volumes](#BlockVolumes)
* [Key pairs](#KeyPairs)
* [Managing security groups](#SecurityGroups)
* [Note on ongoing CLI support](#CLIdeprecation)
* [For further information](#MoreInfo)

<!--**Note**:  Use this overview in conjunction with the information on the [assisted transition](/migration-details/) page if you are planning on performing a customer support-assisted transition. -->  


## Before you begin ## {#BeforeYouBegin}

Before you transition to version 13.5, we recommend:

* Purge any data you no longer need
* Remove any unnecessary log files


##Transitioning data for ephemeral instances## {#Ephemeral}

To transition the data for an ephemeral instance:

1. Create a 13.5 instance using either the command-line interface (CLI) for [UNIX](/cli/unix/compute/) or [the Windows PowerShell](/cli/windows/compute/), or the [management console](/mc/compute/) interface
2. Copy the data from your version 12.12 instance to your new 13.5 instance, using the tool transfer program of your choice (for example, SCP or FTP)

For information on moving data:

* For Windows instance, see our Knowledge Base article [Using SFTP to Transfer Files between Windows Instances](https://community.hpcloud.com/article/using-sftp-transfer-files-between-windows-instances)
* For Linux Instances, see our Knowledge Base article [Uploading files to a Linux instance from Linux or Mac OSX using rsync](https://community.hpcloud.com/article/uploading-files-linux-instance-linux-or-mac-osx-using-rsync)


##Transitioning data for persistent instances## {#Persistent}

To transition the data for a persistent instance:

1. Create a bootable block volume and persistent instance in your version 13.5 environment; see the [knowledge base article on block volume creation](https://community.hpcloud.com/article/creating-your-first-instance-135) for more details
2. Copy the data from your version 12.12 instance to your new 13.5 instance, using the tool transfer program of your choice (for example, SCP or FTP)

For information on moving data:

* For Windows instance, see our Knowledge Base article [Using SFTP to Transfer Files between Windows Instances](https://community.hpcloud.com/article/using-sftp-transfer-files-between-windows-instances)
* For Linux Instances, see our Knowledge Base article [Uploading files to a Linux instance from Linux or Mac OSX using rsync](https://community.hpcloud.com/article/uploading-files-linux-instance-linux-or-mac-osx-using-rsync)

<!--For information on persistent instances while performing a support services assisted transition, please see the [snapshots](/migration-details/) section of the [assisted transition](/migration-details/) page. -->


##Block volumes## {#BlockVolumes}

To transition the data for block volumes:

1. Create a 13.5 block volume using either the command-line interface (CLI) for [UNIX](/cli/unix/block-storage/) or [the Windows PowerShell](/cli/windows/block-storage/), or the [management console](/mc/) interface
2. Attach the volume from Step 1 to an ephemeral instance in your version 13.5 environment; see the [knowledge base article](https://community.hpcloud.com/article/managing-your-block-storage-135) for more details
3. Copy the data from your version 12.12 instance attached volume to your new version 13.5 instance, using the tool transfer program of your choice (for example, SCP or FTP)

For information on moving data:

* For Windows instance, see our Knowledge Base article [Using SFTP to Transfer Files between Windows Instances](https://community.hpcloud.com/article/using-sftp-transfer-files-between-windows-instances)
* For Linux Instances, see our Knowledge Base article [Uploading files to a Linux instance from Linux or Mac OSX using rsync](https://community.hpcloud.com/article/uploading-files-linux-instance-linux-or-mac-osx-using-rsync)

<!--For information on persistent instances, snapshots, and moving block volumes, please see the appropriate section of the [assisted transition](/migration-details/) page.  -->


##Key pairs## {#KeyPairs}

The process for transitioning key pairs varies according to your platform.  Check out our Knowledge Base article [Managing or Transferring Your Key Pairs](https://community.hpcloud.com/article/migrating-or-transferring-your-key-pairs) to see what way works best for you:

* [via the API](https://community.hpcloud.com/article/migrating-or-transferring-your-key-pairs#keyapi)
* [Windows Users](https://community.hpcloud.com/article/migrating-or-transferring-your-key-pairs#keywin)
* [Linux Users](https://community.hpcloud.com/article/migrating-or-transferring-your-key-pairs#keylinux)


##Managing security group creation## {#SecurityGroups}

Managing security groups has changed significantly between versions 12.12 (and earlier) and version 13.5 of the HP Cloud software.  For information on security groups in version 13.5, please see the knowledge base article [Managing Your Security Groups](https://community.hpcloud.com/article/managing-your-security-groups-135) for details.


## Note on ongoing CLI support ## {#CLIdeprecation}

On November 4, 2013, the UNIX CLI moved into its End-of-Life Cycle process toward final deprecation. During this 6-month transition time until May 4, 2014:

* New and existing customers are encouraged to migrate to the OpenStackClient (Unified) CLIs or leverage the OpenStack command-line clients for each respective service.
* No new feature requests will be honored
* Bug reports will be accepted

After 6-months, access to online resources will still be available, but no support will be offered from HP Public Cloud, and the software download will be disabled—although you are most welcome to continue development at your discretion.


## For further information ## {#MoreInfo}

For more information on transitioning to version 13.5, as well as general information about version 13.5:

* Our [release notes for version 13.5](/release-notes/) of the HP Cloud software
* The [version overview](/version-overview/) provides a look at the different software versions available
* The [version 13.5 API specs](/api/v13/)
* The [technical support knowledge base](https://community.hpcloud.com/knowledge-base)

<!--* If you need to perform an assisted transition with the aid of our Support organization, please read through the [transition details](/migration-details/) page, and [contact our Support team](https://www.hpcloud.com/contact_us):
    - [live chat from hpcloud.com](https://account.hpcloud.com/cases#support_chat)
    - [open a support case](https://account.hpcloud.com/cases)
    - [email support@hpcloud.com](mailto:support@hpcloud.com)
    - call at 1-855-61CLOUD (1-855-612-5683) in the U.S. or +1-678-745-9010 internationally.
-->
