---
layout: default
title: "UNIX CLI for HP Helion Public Cloud Block Storage Examples"
permalink: /cli/unix/block-storage/
product: unix-cli
published: false

---
<!--PUBLISHED-->
# UNIX CLI for HP Helion Public Cloud Block Storage Examples for v12.12

___________________

###Important Notice###

On November 4, 2013, the UNIX CLI was moved into its End-of-Life Cycle process toward final deprecation. During this 6-month transition time:

* New and existing customers are encouraged to migrate to the OpenStackClient (Unified) CLIs or the OpenStack command-line clients for each respective service
* No new feature requests will be honored
* Bug reports will be accepted

HP Helion Public Cloud has contributed the Unix CLI back to the open source community, and you can get support, access the documentation, and download the source code [here](https://github.com/hpcloud/unix_cli).

_________________________________________

This page gives you a few examples of how to perform various block storage tasks using the HP Helion Public Cloud service.  This page discusses the following tasks:

* [Adding Volumes](#AddingVolumes)
* [Listing Available Volumes](#ListingAvailableVolumes)
* [Attaching New Volumes](#AttachingNewVolumes)
* [Detaching Volumes](#DetachingVolumes)
* [Removing Volumes](#RemovingVolumes)

Remember that you can get detailed help for any command/task by:

    $ hpcloud help <TASK>

##Adding Volumes## {#AddingVolumes}

To add a new volume:

    $ hpcloud volumes:add kweller 1
    Created volume 'kweller' with id '997'.

To create a bootable volume from (bootable image or raw image) image:

    $ hpcloud volumes:add bootable 10 -i 20103
    Created volume 'bootable' with id '67946'.

##Listing Available Volumes## {#ListingAvailableVolumes}

To list available volumes:

    $ hpcloud volumes
      +-----+---------+------+------+---------------------+-----------+-------------+---------+
      | id  | name    | size | type | created             | status    | description | servers |
      +-----+---------+------+------+---------------------+-----------+-------------+---------+
      | 997 | kweller | 1    |      | 2012-08-01 17:16:31 | available |             |         |
      +-----+---------+------+------+---------------------+-----------+-------------+---------+

##Attaching New Volumes## {#AttachingNewVolumes}

To attach the new volume to server `srv1` as `/dev/vdi` (device names must begin with /dev/vd):

    $ hpcloud volumes:attach kweller srv1 /dev/vdi
    Attached volume 'kweller' to 'srv1' on '/dev/vdi'.

You may also use a drive number to mount the volume instead of a device name:

    $ hpcloud volumes:attach kweller srv1 5
    Attached volume 'kweller' to 'srv1' on '/dev/vde'.

To see the attached volumes with devices:

    $ hpcloud volumes:server
      +-----+---------+--------+----------+
      | id  | name    | server | device   |
      +-----+---------+--------+----------+
      | 877 | svl1    | srv1   | /dev/vde |
      | 881 | svl3    | srv1   | /dev/vdh |
      | 997 | kweller | srv1   | /dev/vdi |
      | 879 | svl2    | srv2   | /dev/vdg |
      +-----+---------+--------+----------+

See the [knowledge base](https://community.hpcloud.com/knowledge-base) article [Mounting Additional Space](https://community.hpcloud.com/article/mounting-additional-space) to learn how to leverage your attached storage.

##Detaching Volumes## {#DetachingVolumes}

To detach the kweller volume:

    $ hpcloud volumes:detach kweller
    Detached volume 'kweller' from 'srv1'.

##Removing Volumes## {#RemovingVolumes}

To remove the kweller volume:

    $ hpcloud volumes:remove kweller
    Removed volume 'kweller'.

For complete information on all the UNIX CLI for HP Helion Public Cloud block storage commands (and all the other UNIX CLI for HP Helion Public Cloud service commands), please take a look at the [UNIX CLI for HP Helion Public Cloud Reference](/cli/unix/reference/).


##Related topics

* [Installation](/cli/unix/install/)
* [Account Configuration](/cli/unix/configuration/)
* [Advanced Account Management](/cli/unix/account-management/)
* [Compute Examples](/cli/unix/compute/)
* [Object Storage Examples](/cli/unix/object-storage/)
* [CDN Examples](/cli/unix/cdn/)
* [Volume Management](/block-storage/volume/)
* [DNS Examples](/cli/unix/dns/)
* [CLI Reference](/cli/unix/reference/)
