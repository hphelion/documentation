---
layout: default
title: "Unix CLI Block Storage Examples"
permalink: /cli/unix/block-storage/

---
# Unix CLI Block Storage Examples

This page gives you a few examples of how to perform various block storage tasks using the HP Cloud service.  This page discusses the following tasks:

* [Adding Volumes](#AddingVolumes)
* [Listing Available Volumes](#ListingAvailableVolumes)
* [Attaching New Volumes](#AttachingNewVolumes)
* [Detaching Volumes](#DetachingVolumes)
* [Removing Volumes](#RemovingVolumes)

Remember that you can get detailed help for any command/task by:

    $ hpcloud help <TASK>

<h2 id="AddingVolumes">Adding Volumes## {#blah}

To add a new volume:

    $ hpcloud volumes:add kweller 1
    # => Created volume 'kweller' with id '997'.

<h2 id="ListingAvailableVolumes">Listing Available Volumes## {#blah}

To list available volumes:

    $ hpcloud volumes
    # =>   +-----+---------+------+------+---------------------+-----------+-------------+---------+
    # =>   | id  | name    | size | type | created             | status    | description | servers |
    # =>   +-----+---------+------+------+---------------------+-----------+-------------+---------+
    # =>   | 997 | kweller | 1    |      | 2012-08-01 17:16:31 | available |             |         |
    # =    +-----+---------+------+------+---------------------+-----------+-------------+---------+

##Attaching New Volumes## {#AttachingNewVolumes}

To attach the new volume to server `srv1` as `/dev/sdi` (device names must begin with /dev/sd):

    $ hpcloud volumes:attach kweller srv1 /dev/sdi
    # => Attached volume 'kweller' to 'srv1' on '/dev/sdi'.

To see the attached volumes with devices:

    $ hpcloud volumes:server
    # =>   +-----+---------+--------+----------+
    # =>   | id  | name    | server | device   |
    # =>   +-----+---------+--------+----------+
    # =>   | 877 | svl1    | srv1   | /dev/sdf |
    # =>   | 881 | svl3    | srv1   | /dev/sdh |
    # =>   | 997 | kweller | srv1   | /dev/sdi |
    # =>   | 879 | svl2    | srv2   | /dev/sdg |
    # =>   +-----+---------+--------+----------+

See the [knowledge base](https://community.hpcloud.com/knowledge-base) article [Mounting Additional Space](https://community.hpcloud.com/article/mounting-additional-space) to learn how to leverage your attached storage.

##Detaching Volumes## {#DetachingVolumes}

To detach the kweller volume:

    $ hpcloud volumes:detach kweller
    # => Detached volume 'kweller' from 'srv1'.

##Removing Volumes## {#RemovingVolumes}

To remove the kweller volume:

    $ hpcloud volumes:remove kweller
    # => Removed volume 'kweller'.

For complete information on all the UNIX CLI block storage commands (and all the other UNIX CLI HP Cloud service commands), please take a look at the [HP Cloud UNIX CLI Reference](/cli/unix/reference).