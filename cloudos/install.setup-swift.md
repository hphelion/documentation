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
* [Swift Roles](#swift-roles)
* [Zeroing Disks](#zeroing-disks)
* [Setup Network Configuration for Swift](#setup-network-configuration-for-swift)
* [Preview of Swift Deployment Steps](#preview-of-swift-deployment-steps)
* [Next Step](#next-step)


## Swift Requirements

The Swift service requires the following:

* A single controller node, which you'll later assign to the following Swift roles: 

 * ring-compute
 * proxy
 * dispersion

* Between 2-5 storage nodes. On each storage node, Swift needs a dedicated disk that is independent of the OS disk. 
This dedicated disk must have the first and last megabyte of the disk zeroed out; this is required even for new disks. See the next section, 
[Zeroing Disks](#zeroing-disks).

## Zeroing Disks

To show the start and end megabyte, you can use the following on each Swift storage node:

Show start and end:

<p style="font-size: small; font-family: monospace;">
dd if=/dev/sdb bs=1M count=1 | hd <br/>
<nobr>size=$(fdisk -l  /dev/sdb | grep Disk | grep bytes | cut -f 5 -d" ") &amp;&amp; echo $size</nobr> <br />
skip=$(python -c "print ($size / (1024*1024)) - 1") &amp;&amp; echo $skip <br />
dd if=/dev/sdb bs=1M skip=$skip count=1 2>/dev/null | hd
</p>	

In the start and end data, look for a display of all zeros, similar to this example:

<p style="font-size: small; font-family: monospace;">
<nobr>00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|</nobr> <br />
* <br />
1+0 records in <br />
1+0 records out
</p>	

If the results show something like the following, the disk is not zeroed:

<p style="font-size: small; font-family: monospace;">
<nobr>000fbe00  a2 a0 d0 eb e5 b9 33 44  87 c0 68 b6 b7 26 99 c7  |......3D..h..&amp;..|</nobr>
</p>	

To zero out the first and last meg, use this:

<p style="font-size: small; font-family: monospace;">
dd if=/dev/zero of=/dev/sdb bs=1M count=1 <br />
<nobr>size=$(fdisk -l  /dev/sdb | grep Disk | grep bytes | cut -f 5 -d" ") && echo $size <br />
seek=$(python -c "print ($size / (1024*1024)) - 1") &amp;&amp; echo $seek</nobr> <br />
dd if=/dev/zero of=/dev/sdb seek=$seek bs=1M <br />
</p>	

## Setup Network Configuration for Swift

Again, if you elect to install Swift, the following network settings must be added prior to the "Complete Install" 
step in the HP Cloud OS Operation Dashboard's Environment tab.

Here are the network configuration steps:

1. Add a new network named "storage"

2. Assign Logical Interface "intf1"

3. Enter "192.168.125.0" as the subnet

4. Enter "255.255.255.0" as the Netmask

5. Enter "200" as the VLAN id

6. Enter "192.168.125.1" as the router address

7. Next, click on the down arrow to the right of the storage network and select the Edit "Address Ranges" item.

8. In the Edit Address Ranges dialog, click "Add Range" and specify the range as:

  * Node Type: host 
  * IPV4 Start Addr: 192.168.125.81
  * IPV4 End Addr: 192.168.125.160

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

4. Assign the controller node to the Swift ring-compute, proxy and dispersion roles. For background information, see the next section, [Swift Roles](#swift-roles). 

5. Assign between 2-5 nodes to the Swift storage role. 

6. All the other defaults should be adequate.

7. Click the Apply button to deploy Swift in your cloud. 


## Swift Roles

### Proxy

The proxy server is responsible for tying together the Swift storage architecture. For each request sent to the proxy server, 
it will look up the location of the account, container, or object in the ring (see below) and route the request accordingly. The 
proxy server also exposes the public API. 

A large number of failures are also handled in the proxy server. For example, if a server is unavailable for an object PUT, 
it will ask the ring for a handoff server and route there instead.

When objects are streamed to (or from) an object server, they are streamed directly through the proxy server to (or from) the user.  The 
proxy server does not spool them.

### Ring-compute

In a Swift environment, a ring represents a mapping between the names of entities stored on disk and their physical location. 
There are separate rings for accounts, containers, and objects. When other components need to perform any operation on an object, 
container, or account, they need to interact with the appropriate ring to determine its location in the cluster.

The Ring maintains this mapping using zones, devices, partitions, and replicas. Each partition in the ring is replicated, by default, 
three times across the cluster.  The locations for a partition are stored in the mapping maintained by the ring. The ring is 
also responsible for determining which devices are used for handoff in failure scenarios.

Data can be isolated with the concept of zones in the ring. Each replica of a partition is guaranteed to reside in a different zone. 
A zone could represent a drive, a server, a cabinet, a switch, or even a datacenter. The partitions of the ring are equally divided 
among all the devices in the Swift installation. When partitions need to be moved around (for example if a device is added to the cluster), 
the ring ensures that a minimum number of partitions are moved at a time, and only one replica of a partition is moved at a time.

Weights can be used to balance the distribution of partitions on drives across the cluster. This can be useful, for example, 
when different sized drives are used in a cluster. The ring is used by the proxy server and several background processes (like replication).

### Dispersion

The Swift dispersion role is used for cluster health monitoring. 

There is a swift-dispersion-report tool that you can use to measure the overall cluster health. This is accomplished by checking if a 
set of deliberately distributed containers and objects are currently in their proper places within the cluster. 

For instance, a common deployment has three replicas of each object. The health of that object can be measured by checking if each 
replica is in its proper place. If only two of the three is in place, the object's health can be said to be at 66.66%.

A single object's health, especially an older object, usually reflects the health of that entire partition the object is in. 
If you make enough objects on a distinct percentage of the partitions in the cluster, you can get a valid estimate of the overall 
cluster health. In practice, about 1% partition coverage seems to balance well between accuracy and the amount of time 
it takes to gather results.



## Next Step

Proceed to the next topic, [Complete Admin Node Installation (Required)](/cloudos/install/complete-admin-node-installation/).

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

