---
layout: default
title: "Setup Swift (Optional)"
permalink: /cloudos/install/setup-swift/
product: cloudos

---

<a name="_top"> </a>

<script> 
 
function PageRefresh { 
onLoad="window.refresh" 
} 
 
PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/install/customize-network-settings/">&#9664; PREV</a> | <a href="/cloudos/install/">&#9650; UP</a> | <a href="/cloudos/install/complete-admin-node-installation/">NEXT &#9654;</a> </p>

# Setup Swift (Optional) 

Swift is the OpenStack object/blob storage service for cloud computing. You can use Swift to store lots of data efficiently, safely, and cheaply.

**Important**: Swift is an optional service. However, if you want to use it in your cloud, you **must** manually setup Swift as described 
in this topic **before completing** the Admin Node installation. Once you click the Complete Install button on the Environment tab of 
the HP Cloud OS Operational Dashboard, you cannot go back and setup Swift. 

* [Swift Requirements](#swift-requirements)
* [Zeroing Disks](#zeroing-disks)
* [Setup Network Configuration for Swift](#setup-network-configuration-for-swift)
* [Preview of Swift Deployment Steps](#preview-of-swift-deployment-steps)
* [Next Steps](#next-steps)


## Swift Requirements

The Swift service requires the following:

* A single controller node, which will perform the following roles:

 * ring-compute
 * proxy
 * dispersion

* Between 2-5 storage nodes. On each storage node, Swift needs a dedicated disk that is independent of the OS disk. 
This dedicated disk must have the first and last megabyte of the disk zeroed out; this is required even for new disks. 

## Zeroing Disks

To show the start and end megabyte, you can use the following on each Swift storage node:

Show start and end:

    dd if=/dev/sdb bs=1M count=1 | hd
    size=$(fdisk -l  /dev/sdb | grep Disk | grep bytes | cut -f 5 -d" ") && echo $size
    skip=$(python -c "print ($size / (1024*1024)) - 1") && echo $skip
    dd if=/dev/sdb bs=1M skip=$skip count=1 2>/dev/null | hd

In the start and end data, look for a display of all zeros, similar to this example:

    00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    *
    1+0 records in
    1+0 records out

If the results show something like the following, the disk is not zeroed:

    000fbe00  a2 a0 d0 eb e5 b9 33 44  87 c0 68 b6 b7 26 99 c7  |......3D..h..&..|

To zero out the first and last meg, use this:

    dd if=/dev/zero of=/dev/sdb bs=1M count=1
    size=$(fdisk -l  /dev/sdb | grep Disk | grep bytes | cut -f 5 -d" ") && echo $size
    seek=$(python -c "print ($size / (1024*1024)) - 1") && echo $seek
    dd if=/dev/zero of=/dev/sdb seek=$seek bs=1M

## Setup Network Configuration for Swift

Again, if you elect to install Swift, the following network settings must be added prior to the "Complete Install" 
step in the HP Cloud OS Operation Dashboard's Environment tab.

Here are the network configuration steps:

1. Add a new network named "storage"

2. Assign Logical Interface "intf1"

3. Enter "192.168.125.0" as the subnet

4. Enter "255.255.255.0" as the Netmask

5. Enter "200" as the VLAN id

Keep all the other default values.

The next set of steps are to:

1. Click the Complete Install button in the Environment tab.

2. Click the Create Cloud button in the newly enabled Cloud tab. (An alternative to using the automated dialogs that follow the Create Cloud launch 
is to configure the install modules yourself, as noted in [Advanced Cloud Setup](/cloudos/install/advanced-cloud-setup).)  

3. Define one or more compute regions.

For instructions on the automated steps (Create Cloud button and related tasks), see [Create a Cloud](/cloudos/install/create-cloud).

## Preview of Swift Deployment Steps

After creating the cloud and defining your compute region(s), you can deploy Swift in your cloud by following these steps:

1. Launch the HP Cloud OS Installation Dashboard. Its URL is http://192.168.124.10:3000.  The login is crowbar / crowbar. 

2. The Swift barclamp is pre-installed with a default proposal created (without assigned nodes).

3. From the UI's top menu, select Barclamps > Cloud Infrastructure > Hp Cos Swift 100.

4. Click the Edit button for the pre-existing Swift proposal.

4. Assign a controller node to the Swift ring-compute, proxy and dispersion roles.

5. Assign between 2-5 nodes to the Swift storage role

6. All the other defaults should be adequate.

7. Click the Apply button to deploy Swift in your cloud. 

## Next Step

Proceed to the next topic, [Complete Admin Node Installation (Required)](/cloudos/install/complete-admin-node-installation/).

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

