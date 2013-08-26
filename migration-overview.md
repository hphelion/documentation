---
layout: default
title: "HP Cloud Services: Overview of Migrating from Version 12.12 to 13.5"
permalink: /migration-overview/

---
# HP Cloud Services 12.12 to 13.5 self-migration overview

This page guides you through the steps needed to perform a migration from version 12.12 to 13.5 of the HP Cloud software services.  This overview covers the following topics and tasks:

* [Before you begin](#BeforeYouBegin)
* [Migrating ephemeral instances](#Ephermeral)
* [Migrating persistent instances](#Persistent)
* [Key pair migration](#KeyPairs)
* [Security group migration](#SecurityGroups)
* [Additional migration information](#Additional)
* [For further information](#MoreInfo)

**Note**:  Use this overview in conjunction with the information on the [migration details](/migration-details/) page if you are planning on performing a customer support-assisted migration.  


## Before you begin ## {#BeforeYouBegin}

Before you migrate to version 13.5, we recommend:

* Purge any data you no longer need
* Remove any unnecessary log files

For each instance image, you need to determine if you want to move a snapshot of the root partition of that instance to version 13.5, or if you prefer to just create a new instance.


##Migrating ephemeral instances## {#Ephemeral}

TBD

For information on persistent instance migration while performing a support services assisted migration, please see the [snapshots](/migration-details/) section of the [migration details](/migration-details/) page. 


##Migrating persistent instances## {#Persistent}

TBD

###Block volume migration## {#BlockVolumes}

TBD

For information on persistent instance migration, snapshots, copying, and moving block volumes, please see the appropriate section of the [migration details](/migration-details/) page.  


##Key pair migration## {#KeyPairs}

The process for migrating key pairs varies according to your platform.  Check out our Knowledge Base article [Managing or Transferring Your Key Pairs](https://community.hpcloud.com/article/migrating-or-transferring-your-key-pairs) to see what way works best for you:

* [via the API](https://community.hpcloud.com/article/migrating-or-transferring-your-key-pairs#keyapi)
* [Windows Users](https://community.hpcloud.com/article/migrating-or-transferring-your-key-pairs#keywin)
* [Linux Users](https://community.hpcloud.com/article/migrating-or-transferring-your-key-pairs#keylinux)


##Security group migration## {#SecurityGroups}

To create a new security group, follow these steps:

1. Log in to your account and select the availability zone (AZ) in US West for your new instance.

2. From the menu bar, choose `Security Groups`, then click `Create new security group`, and add rules as needed.

For more details and options, read our Knowledge Base article [Managing Your Security Groups](https://community.hpcloud.com/article/managing-your-security-groups-135).


##Additional migration information## {#Additional}

TBD


## For further information ## {#MoreInfo}

For more information on migrating your services, as well as general information about version 13.5:

* Our [release notes for version 13.5](/release-notes/) of the HP Cloud software
* The [version overview](/version-overview/) provides a look at the different software versions available
* The [technical support knowledge base](https://community.hpcloud.com)
* [UNIX command-line interface migration information](/cli/unix/articles/migration/)
* If you need to perform an assisted migration, with the aid of our Support organization, please read through the [Migration Details](/migration-details/) page, and contact our Support Center at 1-855-61CLOUD (1-855-612-5683) in the U.S. or +1-678-745-9010 internationally.
