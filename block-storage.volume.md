---
layout: default
title: "HP Cloud Services UNIX CLI Volume Management"
permalink: /block-storage/volume/
product: block-storage

---
# HP Cloud Services UNIX CLI Volume Management

Once you have created a new storage volume, you can manipulate it just as you would any memory storage object.  This page discusses the following tasks:

* [Partitioning a Volume](#PartitioningaVolume)
* [Mounting a Volume](#MountingaVolume)
* [Volume Management Example (Ruby Fog)](#VolumeManagementExample)

<!-- what other options are there? backing up volumes, maybe? what else? -->

Partitioning and mounting a volume with the `fdisk` command is very similar across different operating systems.  For example, the differences between partitioning using `fdisk` in Ubuntu vs. performing the same task in CentOS are very slight.  This page uses the process for Ubuntu (versions 10.10, 11.04, and 11.10); for the process on other operating systems, please see the [Mounting Additional Space](https://community.hpcloud.com/article/mounting-additional-space) page in our [Knowledge Base](https://community.hpcloud.com/knowledge-base), which contains specifics for [Ubuntu 10.10, 11.04, 11.10](https://community.hpcloud.com/article/mounting-additional-space#Ubuntu), [CentOS 5.6](https://community.hpcloud.com/article/mounting-additional-space#CentOS5.6), and [CentOS 6.2](https://community.hpcloud.com/article/mounting-additional-space#CentOS6.2).

##Partitioning a Volume## {#PartitioningaVolume)

By default, only the initial ~10GB root partition is created and your additional storage space is left unpartitioned and is customizable by you.  To create a partition, first see how much space you have available:

    sudo fdisk -l

To partition a volume, follow these steps:

1. Prepare to configure the volume `/dev/vdb`:

        sudo fdisk /dev/vdb
        Command (m for help):

2. At the command prompt, select **n** to create a new partition:

        Command (m for help): n
        Command action
           e   extended
           p   primary partition (1-4)

3. Select `p` to create the primary partition:

           p   primary partition (1-4)
        p
        Partition number (1-4, default 1):

4. Section the partition number you want to create; in this example, we use partition `1`:

        Partition number (1-4, default 1): 1

5. To partition the space as a single volume, press `Enter` twice to accept the default values for the first and last cylinder of the virtual disk in order to create a single partition:

        First sector (2048-41943039, default 2048):
        Using default value 2048
        Last sector, +sectors or +size{K,M,G} (2048-41943039, default 41943039):
        Using default value 41943039
        Command (m for help):

**Note**: If you want to partition multiple volumes, choose a different first and last cylinder value for your virtual disk rather than the defaults.  

6. Enter `t` (to select the partition you just created) and `83` (to change your partition type to Linux).

        Command (m for help): t
        Selected partition 1
        Hex code (type L to list codes): 83 

7. Enter `p` to display the new disk partitioning:

        Command (m for help): p
        Display TBD

    **Note**: The first partition is denoted as `/dev/vda1` in your instance.

8. Enter `w` to write the partition table and exit fdisk upon completion.

        Command (m for help): w

    A warning is displayed asking if you want to reboot.  

9. Reboot your volume instance.

To create additional partitions, run through the same steps above, but use different beginning and ending cylinder values for your virtual volume.

##Mounting a Volume## {#MountingaVolume)

To mount a partition, follow these steps:

1. Create a file system on your partition:

        sudo mkfs.ext3 /dev/vdb1

2. Mount the partition:

        sudo mkdir /extraspace 
        sudo mount /dev/vdb1 /extraspace

    **Note**: You may see the following warning:
    
        sudo: unable to resolve host (none)

    You can ignore this warning; the mount command proceeds normally.

3. Add the mount command to the `fstab` file:

        sudo nano /etc/fstab

    Add the following line to the end of the file:

        /dev/vdb1       /extraspace     auto    defaults

5. Exit and save the file.

**Note**: When you mount a volume, the name of the volume is changed.

##Volume Management Example (Ruby Fog)## {#VolumeManagementExample)

Once you have created a new block storage volume, you can manipulate it just as you would any memory storage object. 

**Note**: After you create a volume, the device name is changed from the one you specified during the volume creation.  You can see the new name by listing the partitions with the `fdisk -l`command. 
**Note**: You can only attach a volume to one instance at a time.

The following is an example of creating the volume, attaching it to a server instance, and then listing the partitions. The following example uses the Ruby fog bindings.

        # Creating a volume
        new_volume = conn.volumes.create(
       :name => "TestVolume",
       :description => "My Test Volume",
       :size => 1)

        # Attach volume to an existing server with id 1234
        new_volume.attach(1234, "/dev/sdf")

Use `ssh` to access the server with ID `1234` and list the partitions:

<!-- language: bsh -->

        # inside the vm we list the partitions
         ubuntu@myserver:~$ sudo fdisk -l

        Disk /dev/vda: 10.7 GB, 10737418240 bytes
        16 heads, 63 sectors/track, 20805 cylinders
        Units = cylinders of 1008 * 512 = 516096 bytes
        Sector size (logical/physical): 512 bytes / 512 bytes
        I/O size (minimum/optimal): 512 bytes / 512 bytes
        Disk identifier: 0x00000000

        Disk /dev/vda doesn't contain a valid partition table

        Disk /dev/vdb: 21.5 GB, 21474836480 bytes
        16 heads, 63 sectors/track, 41610 cylinders
        Units = cylinders of 1008 * 512 = 516096 bytes
        Sector size (logical/physical): 512 bytes / 512 bytes
        I/O size (minimum/optimal): 512 bytes / 512 bytes
        Disk identifier: 0x00000000

        Disk /dev/vdb doesn't contain a valid partition table

        Disk /dev/vdc: 1073 MB, 1073741824 bytes     <===== This is our newly created volume. 
        16 heads, 63 sectors/track, 2080 cylinders
        Units = cylinders of 1008 * 512 = 516096 bytes
        Sector size (logical/physical): 512 bytes / 512 bytes
        I/O size (minimum/optimal): 512 bytes / 512 bytes
        Disk identifier: 0x00000000

        Disk /dev/vdc doesn't contain a valid partition table

By default, only an initial approximately 10GB root partition is created; you can customize any additional storage space as needed. You can identify the partition by seeing that the size 1073MB, which is close to the volume size of 1GB that was specified while creating it. 

**Note**: The device name changed from `/dev/sdf` to `/dev/vdc`.

For additional information on this topic, you should take a look at the [Mounting Additional Space](https://community.hpcloud.com/article/mounting-additional-space) page in our [Knowledge Base](https://community.hpcloud.com/knowledge-base).