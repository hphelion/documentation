---
layout: default
title: "Unix CLI Block Storage Examples"
permalink: /cli/unix/2/block-storage/
product: unix-cli

---
# Unix CLI v13.5 Block Storage Examples

If you are using v12.12, click [here](https://docs.hpcloud.com/cli/unix/block-storage) for documentation.
___________________

###Important Notice###

On November 4, 2013, the UNIX CLI was moved into its End-of-Life Cycle process toward final deprecation. During this 6-month transition time:

* New and existing customers are encouraged to migrate to the OpenStackClient (Unified) CLIs or the OpenStack command-line clients for each respective service
* No new feature requests will be honored
* Bug reports will be accepted

After 6-months, access to online resources will still be available, but no support will be offered from HP Public Cloud, and the software download will be disabled—although you are most welcome to continue development at your discretion! HP Cloud has contributed the Unix CLI back to the open source community, and you can access the source code, documentation, and downloads [here](https://github.com/hpcloud/unix_cli).

_________________________________________

This page discusses the tasks below and shows some examples of how to perform them using HP Cloud:

* [Adding Volumes](#AddingVolumes)
* [Listing Available Volumes](#ListingAvailableVolumes)
* [Attaching New Volumes](#AttachingNewVolumes)
* [Detaching Volumes](#DetachingVolumes)
* [Removing Volumes](#RemovingVolumes)

Get detailed help for any command/task with the following command:

    $ hpcloud help <TASK>

##Adding Volumes## {#AddingVolumes}

To add a new volume, run:

    $ hpcloud volumes:add kweller 1
    Created volume 'kweller' with id '038d0e77'.

To create a bootable volume from (bootable image or raw image) image, run:

    $ hpcloud volumes:add bootable 10 -i d6a89a5d
    Created volume 'bootable' with id '3407653b'.

##Listing Available Volumes## {#ListingAvailableVolumes}

To list available volumes, run:

    $ hpcloud volumes
      +----------+---------+------+------+---------------------+-----------+-------------+---------+
      | id       | name    | size | type | created             | status    | description | servers |
      +----------+---------+------+------+---------------------+-----------+-------------+---------+
      | 038d0e77 | kweller | 1    |      | 2012-08-01 17:16:31 | available |             |         |
      +----------+---------+------+------+---------------------+-----------+-------------+---------+

##Attaching New Volumes## {#AttachingNewVolumes}

*Note: Device names must begin with `/dev/vd`*

To attach the new volume `kweller` to server `srv1` as `/dev/vdi`, run:

    $ hpcloud volumes:attach kweller srv1 /dev/vdi
    Attached volume 'kweller' to 'srv1' on '/dev/vdi'.

You can also use a drive number to mount the volume instead of a device name by running the following:

    $ hpcloud volumes:attach kweller srv1 5
    Attached volume 'kweller' to 'srv1' on '/dev/vde'.

To list the attached volumes with devices, run:

    $ hpcloud volumes:server
      +----------+---------+--------+----------+
      | id       | name    | server | device   |
      +----------+---------+--------+----------+
      | a5ecfc52 | svl1    | srv1   | /dev/vde |
      | 9991ef64 | svl3    | srv1   | /dev/vdh |
      | 038d0e77 | kweller | srv1   | /dev/vdi |
      | 160591f3 | svl2    | srv2   | /dev/vdg |
      +----------+---------+--------+----------+

See the [knowledge base](https://community.hpcloud.com/knowledge-base) article [Mounting Additional Space](https://community.hpcloud.com/article/mounting-additional-space) to learn how to leverage your attached storage.

##Detaching Volumes## {#DetachingVolumes}

To detach volume `kweller`, run:

    $ hpcloud volumes:detach kweller
    Detached volume 'kweller' from 'srv1'.

##Removing Volumes## {#RemovingVolumes}

To remove volume `kweller`, run:

    $ hpcloud volumes:remove kweller
    Removed volume 'kweller'.

For complete information on all the UNIX CLI block storage commands (and all the other UNIX CLI HP Cloud service commands), please see [HP Cloud UNIX CLI Reference](/cli/unix/2/reference) page.
