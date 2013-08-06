---
layout: default
title: "HP Cloud Services: Overview of Migrating from Version 12.12 to 13.5"
permalink: /migration-overview/

---
# HP Cloud Services 12.12 to 13.5 migration overview

Intro paragraph.

This page discusses the following migration topics:

* [Before you begin](#BeforeYouBegin)
* [Generating new security groups and migrating your key pairs](#GeneratingandMigrating)
* [Updating your instance](#Updating)
* [For further information](#MoreInfo)


## Before you begin ## {#BeforeYouBegin}

Before you upgrade your system and migrate to version 13.5, we recommend:

* Purge any data you no longer need
* Remove any unnecessary log files

Look at your instance images and decide if moving these to the new 13.5 service or creating a new instance in v13.5 makes the most sense for your images.


## Generating new security groups and migrating your key pairs ## {#GeneratingandMigrating}

To create a new security group, follow these steps:

1. Log in to your account, and select the Availability Zone in US West where you want to locate your new instance.

2. From the menu bar, choose Security Groups, then click Create new security group and add rules as needed.

For more details and options, read our Knowledge Base article [Managing Your Security Groups](https://community.hpcloud.com/article/managing-your-security-groups-135).

The process for migrating key pairs varies according to your platform.  Check out our Knowledge Base article [Managing or Transferring Your Key Pairs](https://community.hpcloud.com/article/migrating-or-transferring-your-key-pairs) to see what way works best for you:

* [via the API](https://community.hpcloud.com/article/migrating-or-transferring-your-key-pairs#keyapi)
* [Windows Users](https://community.hpcloud.com/article/migrating-or-transferring-your-key-pairs#keywin)
* [Linux Users](https://community.hpcloud.com/article/migrating-or-transferring-your-key-pairs#keylinux)


## Updating your instance ## {#Updating}

The process for migrating your instance includes taking a snapshot of your current instance and then saving and moving your ephemeral data stored in block storage to the new environment and reattaching to your new instance. Again, this is a good time to take a look at your instances and see if they would be easy to replicate in v13.5 rather than migrate.

### Taking a snapshot of your current instance ### {#Snapshot}

You have many ways to create a snapshot, so use a method you are familiar with. Here are the basic directions for creating a snapshot using the management console.

*IMPORTANT*: If you have a Windows instance, shut down the instance before taking the snapshot. You can do this using the shutdown feature from the `Start` button.

1. Go to the Availability Zone where your server exists.

2. Click `Images` in the menu bar.

3. In the `From server` box, select the image that you want to snapshot.

4. Fill in an `Image Name` and a `Description`.

5. Click `Create`. Your new image appears under `Inventory`.

IMAGE TBD

For other methods, read [Creating a Snapshot of an Instance](https://community.hpcloud.com/article/creating-snapshot-instance)

### Notifying support of your readiness ### {#Notifying}

You need to submit a ticket to our support team requesting your new image be made available in Compute 13.5:

1. Select `Support Cases` from the `Support` menu and then click `Create New Case`.

        Image TBD

2. Support contacts you when the image has been transferred to the new environment.

Log in to your account, select your Availability Zone and use your new image to relaunch your instance.  You are now fully upgraded.


## For further information ## {#MoreInfo}

For more information on migrating your services, as well as general information about version 13.5:

* Release notes
* Support pages
* other important pages
