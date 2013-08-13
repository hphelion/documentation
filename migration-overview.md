---
layout: default
title: "HP Cloud Services: Overview of Migrating from Version 12.12 to 13.5"
permalink: /migration-overview/

---
# HP Cloud Services 12.12 to 13.5 self-migration overview

<!--deploying us east to west

* tell everyone they can move, rebuild, or take an image snapshot and ask support for help
* top 70 customers consume 60% of the cloud units
* assistive migration vs. rebuilding
* overview guide vs. details self-migration guide
* if you dont want to move your data over 
* if you don't want to rebuild your image
* tom mixes kb stuff with docs.hpcloud.com content
* assisted migration is west to west only

New document structure (refer to photo of whiteboard outline--in photo "w" refers to "already written")

"Overview of 13.5 migration process -- include links from each section to appropriate "details" section "in case you run into trouble and need to call support" or some such
- Ephermeral instances 
- Personal instances
  - block volumes
conceptual/overview/background info on:
- keypairs
- security groups
- floating IPs

Migration Process details (or something)
- image snapshots
- copy your 12.12 instance
  - take snapshot
  - make new volume
  - move volume
- move volume to 13.5

-->

If you are using a previous version of the HP Cloud software, there are a few tasks you need to perform to migrate to version 13.5.  This page discusses the following migration topics:

* [Before you begin](#BeforeYouBegin)
* [Generating new security groups and migrating your key pairs](#GeneratingandMigrating)
* [Deploying an instance snapshot in version 13.5](#Updating)
* [For further information](#MoreInfo)

## Before you begin ## {#BeforeYouBegin}

Before you migrate to version 13.5, we recommend:

* Purge any data you no longer need
* Remove any unnecessary log files

For each instance image, you need to determine if you want to move a snapshot of the root partition of that instance to version 13.5, or if you prefer to just create a new instance.


## Generating new security groups and migrating your key pairs ## {#GeneratingandMigrating}

To create a new security group, follow these steps:

1. Log in to your account and select the availability zone (AZ) in US West for your new instance.

2. From the menu bar, choose `Security Groups`, then click `Create new security group`, and add rules as needed.

For more details and options, read our Knowledge Base article [Managing Your Security Groups](https://community.hpcloud.com/article/managing-your-security-groups-135).

The process for migrating key pairs varies according to your platform.  Check out our Knowledge Base article [Managing or Transferring Your Key Pairs](https://community.hpcloud.com/article/migrating-or-transferring-your-key-pairs) to see what way works best for you:

* [via the API](https://community.hpcloud.com/article/migrating-or-transferring-your-key-pairs#keyapi)
* [Windows Users](https://community.hpcloud.com/article/migrating-or-transferring-your-key-pairs#keywin)
* [Linux Users](https://community.hpcloud.com/article/migrating-or-transferring-your-key-pairs#keylinux)


## Deploying an instance snapshot in version 13.5 ## {#Updating}

The process for deploying a snapshot of your instance to version 13.5 includes taking a snapshot of your current instance, and saving and moving the data residing in block storage to the new environment. 

**Note**: This process is  specific to ephemeral instances (those not created by a bootable volume).

### Taking a snapshot of your current instance ### {#Snapshot}

You have many ways to create a snapshot, so use a method you are familiar with. Here are the basic directions for creating a snapshot using the [management console](/mc/).

**Note**: If you have a Windows instance, be sure to shut down the instance before taking your snapshot. You can do this using the shutdown feature from the `Start` button:

1. Go to the Availability Zone where your server exists.

2. Click `Images` in the menu bar.

3. In the `From server` box, select the image that you want to snapshot.

4. Fill in an `Image Name` and a `Description`.

5. Click `Create`. Your new image appears under `Inventory`.

<img src="media/migration-01" width="580" alt="" />

For other methods, read [Creating a Snapshot of an Instance](https://community.hpcloud.com/article/creating-snapshot-instance) in our knowledge base, or refer to the applicable [CLI](/cli/) or [management console](/mc/) instructions.

**Note**: The snapshot only includes the root partition.

### Notifying support of your readiness ### {#Notifying}

You need to submit a ticket to our support team requesting your new image be made available in Compute 13.5:

1. In the management console, select `Support Cases` from the `Support` menu and then click `Create New Case`.

    <img src="media/migration-02" width="580" alt="" />

2. Support contacts you when the image is transferred to the new environment.

Log in to your account, select your AZ, and use your new image to relaunch your instance.  


## For further information ## {#MoreInfo}

For more information on migrating your services, as well as general information about version 13.5:

* Our [release notes for version 13.5](/release-notes/) of the HP Cloud software
* The [version overview](/version-overview/) provides a look at the different software versions available
* The [technical support knowledge base](https://community.hpcloud.com)
* [UNIX command-line interface migration information](/cli/unix/articles/migration/)
