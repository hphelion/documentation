---
layout: default
title: "HP Cloud Environment CLI Software for Windows PowerShell Block Storage Examples"
permalink: /cli/windows/block-storage/
product: win-cli

---
# HP Cloud Environment CLI Software for Windows PowerShell Block Storage Examples

This page provides you some examples of how to use the various commands (sometimes called "cmdlets") for HP Cloud environment CLI software for Windows PowerShell implementation of Compute.

* [Navigation](#Navigation)
* [Volume Management](#VolumeManagement)
* [Snapshot Management](#Snapshots)

##Navigation## {#Navigation}

To execute HP cloud commands in Windows PowerShell, first open a Windows PowerShell window; under the Start menu, it is typically under `All Programs > Accessories > Windows PowerShell`.  Select the shell appropriate to your system, either the 64-bit or 32-bit version.  Enter the HP Cloud Services CLI by entering:

    PS C:> cd HPCS:

Once in the HPCS area, you can move around as if you were in a standard directory structure.  For example, entering the **ls** command:

    PS HPCS:\> ls

Generates the following output:

    ===============================================================
    Account Associations
    ===============================================================
    
    WARNING: column "Path" does not fit into the display and was removed.
    
    Name          Description
    ____          __________
    Servers       A place to manage Servers across the Account.
    Flavors       Manage additional hardware configurations for Servers.
    Images        Manage collections of files used to create or rebuild Servers.
    Security      Manage Key Pair and Security Group Rules here.
    Networking    A place to manage dynamic IP addresses assigned to your Servers.
    BlockStorage  A place to manage Block Storage Volumes and Snapshots

To execute commands and perform operations in each area, just **cd** to the appropriate location and run the command.  For example, if you want to execute BlockStorage commands:

    PS HPCS:\\> cd BlockStorage

Using the **ls** command shows Volumes and Snapshots directories. You can then **cd** into those directories to see your available Volumes and Snapshots using the **ls** command.

##Volume Management## {#VolumeManagement}

The first thing you want to do is create a new block storage volume.  To do this, execute the following command:

    PS HPCS:\\> New-Volume "MyNewVolume" "MyNewVolume Description" 10

This creates a new volume with the name `MyNewVolume`, a description of  `MyNewVolume Description` and a volume size of 10 gigabytes.  You can also assign metadata to a volume when you create it:

    PS HPCS:\\> New-Volume "MyNewVolume" "MyNewVolume Description" 10 "some|metadata"

Next you might want to attach your volume to an existing server.  Taking the volume that we created above, you can attach it to a server with the following command:

    PS HPCS:\\> Attach-Volume 99 31415 "/dev/vdp" 

This attaches your server ID `99` to the volume with the ID of `31415` with an assigned device name of `/dev/vpd`.  (To get the server and volume ID values, use the [**ls**](/cli/windows/reference#ls) command.)

See the following knowledge base article to learn how to leverage your attached storage: [Mounting Additional Space](https://community.hpcloud.com/article/mounting-additional-space)

Of course, you may also need to detach a volume from a server, in which case you use the following command

    PS HPCS:\\> Detach-Volume 99 31415

This detaches your server ID `99` from the volume with the ID of `31415`.

Finally, you may want to remove a volume.  You can do this with the following command:

    PS HPCS:\\> Remove-Volume 31415

This removes your volume `31415`.

##Snapshot Management## {#Snapshots}

You can take snapshots of your block storage volumes.  To create a snapshot, use the following command:

    PS HPCS:\\> New-Snapshot "PrimarySnapshot" "Primary Backup Snapshot" 31415

This creates a new snapshot named `PrimarySnapshot` of volume ID 31415, with the descriptive phrase `Primary Backup Snapshot` attached.

And of course you can also delete snapshots using the following command:

    PS HPCS:\\> Remove-Snapshot 1111

This removes the snapshot with the ID of 1111.

For more details on the block storage commands, see the [Block Storage](/cli/windows/reference#BlockStorage) section of the [Windows CLI Reference](/cli/windows/reference) page and [Getting Help](/cli/windows/help).
