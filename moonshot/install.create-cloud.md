---
layout: default
title: "Create a Cloud"
permalink: /cloudos/moonshot/install/create-cloud/
product: moonshot

---


<script> 

function PageRefresh { 
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/install/complete-admin-node-installation/">&#9664; PREV</a> | <a href="/cloudos/moonshot/install/">&#9650; UP</a> | <a href="/cloudos/moonshot/install/create-compute-regions/">NEXT &#9654;</a> </p>

# Create a Cloud

Now that the Admin Node is installed, it's time to create your cloud. 

This topic explains how to set up a cloud with a Cloud Controller node (Cloud, Network, Storage, and Compute Controllers) 
and the separate Compute node(s). Optional: This topic also explains how to setup a Swift Controller node (Ring-compute, Proxy,  and Dispersion) and the separate Swift Storage Node(s).

* [Manage Controller and Compute Nodes](#manage-controller-and-compute-nodes)

* [Complete Storage Configuration](#complete-storage-configuration)

* [Create Cloud](#create-cloud)

## Manage Controller and Compute Nodes

Before you begin, make sure:

* You have remote console access to all the virtual and bare-metal servers. This is required to power on the servers to trigger Network (PXE) boot, monitor operating system installation, and if need be provide additional firmware drivers when prompted.

* The Network and Storage Infrastructures are set up correctly. For the post-install of the operating system, a few steps are required to configure and mount the folder on an additional storage resource.

* (Optional) The Swift infrastructure is set up correctly. For the post-install of the operating system, a few steps are required to zero out the first and last megabyte of the disk.

**Note:** Ensure that the boot order on all nodes is configured to boot from the network first (this only occurs once as the PXE service will not try to network boot a node again if it has already
done so).

1. Power ON the Controller and Compute nodes.

2. In the HP Cloud OS for Moonshot Operational Dashboard, select the Cloud tab > Manage Nodes. Once the Controller and Compute Nodes have booted, each node displays in the table, indicating the Alias Name set to the node's MAC address (of the NIC associated
with the Administration Network). Each node will be in the Not Allocated state.

3. For a node, click More > Edit Node to rename the MAC address in the Alias column to a more meaningful name such as controllercompute, cloudcontroller, compute1, compute2. **Note:** The node name can only be letters (capitalization is allowed) and numbers with no spaces. The node table then displays with the new alias names.

4. For a node, click More > Allocate Nodes. The node allocation process completes the setup and configuration of the nodes so that OpenStack services can be deployed to them.

As the Controller and Compute Nodes are being allocated, they progress through these different states: 

* Not Allocated
* Hardware Installed
* Installing
* Installed
* Readying
* Finalizing
* Allocated
 
When the nodes are ready for cloud deployment, their status ends with Allocated. 

**Tip:** Access the bare-metal node's remote console to monitor the operating system installation. Some of your hardware requires non-free firmware files to operate. The firmware can be loaded from removable media, such as a USB stick or CD/DVD. 
If a dialog box displays prompting you to load missing firmware, provide the appropriate drive.

**Tip:** In the case where a node results in status = Off, select the More > Reboot Node action for the node.

<!-- US1896, removed from UI
Note: To de-allocate a Compute or Controller node from your Admin Node, click the Delete
Node option from the drop-down menu on the Manage Node dialog. This action sets the
identified node to a de-allocated state.
**Note**: If a node is part of a compute region, its state is Deployed, and you cannot perform the Delete Node action on it. 
If you were to delete the compute region, the node's state would become Not Allocated; then if desired, you could use 
Delete Node to delete it. 
--> 

## Complete Storage Configuration

### Block Storage

Cinder requirements:

At this point, based on your previously determined [Storage Infrastructure](/cloudos/moonshot/install/before-you-install#storage-infrastructure) layout, you can configure the additional storage on the nodes.

The default root partitioning scheme is to reserve the first 255 MB for the boot partition, and then allocate the entire rest 
of the disk to the LVM partition, with the Ubuntu OS calculating how much goes to swap space and how goes to the root file system.

For details, see the Ubuntu configuration documentation:

<a href="https://help.ubuntu.com/lts/installation-guide/i386/preseed-contents.html" title="Ubuntu topic opens in new tab or window" target="ubuntu"> Contents of the Ubuntu Preconfiguration File </a> <br />

<a href="https://help.ubuntu.com/community/DiskSpace" title="Ubuntu topic opens in new tab or window" target="ubuntu2"> Ubuntu Disk Space - community discussion </a>

### Object Storage

Swift requirements:

On each storage node, Swift needs a dedicated disk that is independent of the OS disk. This dedicated disk must have the first and last 
megabyte of the disk zeroed out; this is required even for new disks. 

If you have not already done so, execute the following steps to zero out the disks.  

To show the start and end megabyte, you can use the following on each Swift storage node:

Show start and end:

<pre>
dd if=/dev/sdb bs=1M count=1 | hd <br/>
<nobr>size=$(fdisk -l  /dev/sdb | grep Disk | grep bytes | cut -f 5 -d" ") &amp;&amp; echo $size</nobr> <br />
skip=$(python -c "print ($size / (1024*1024)) - 1") &amp;&amp; echo $skip <br />
dd if=/dev/sdb bs=1M skip=$skip count=1 2>/dev/null | hd
</pre>	

In the start and end data, look for a display of all zeros, similar to this example:

<pre>
<nobr>00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|</nobr> <br />
* <br />
1+0 records in <br />
1+0 records out
</pre>	

If the results show something like the following, the disk is not zeroed:

<pre>
<nobr>000fbe00  a2 a0 d0 eb e5 b9 33 44  87 c0 68 b6 b7 26 99 c7  |......3D..h..&amp;..|</nobr>
</pre>	

To zero out the first and last meg, use this:

<pre>
dd if=/dev/zero of=/dev/sdb bs=1M count=1 <br />
<nobr>size=$(fdisk -l  /dev/sdb | grep Disk | grep bytes | cut -f 5 -d" ") && echo $size <br />
seek=$(python -c "print ($size / (1024*1024)) - 1") &amp;&amp; echo $seek</nobr> <br />
dd if=/dev/zero of=/dev/sdb seek=$seek bs=1M <br />
</pre>	

In addition, you will need to login to the Swift storage nodes from the remote console.  For the credentials, go to the 
<a href="https://cloudos.hpwsportal.com" target="new"> HP Cloud OS for Moonshot Catalog</a> portal, and see the topic about the dashboard credentials.

## Create Cloud

You are now ready to create your cloud. 

To create a cloud:

1. In the Operational Dashboard, select the Cloud tab > Manage Clouds.

2. Click Create Cloud to open the Create Cloud dialog.

3. Specify a Cloud Name. This will be the Domain name that is used to initialize Keystone and will be displayed in the Administration Dashboard. **Note:** A cloud name must contain only letters and numbers. It cannot contain spaces or special characters.

4. Select the Controllers tab and specify which node will have the Cloud Controller, Network Controller, and Storage Controller respective services. You install all these core controller services on different nodes or on the same Cloud Controller.

5. Select the Attributes tab to specify property values required to create a Cloud.

* Keystone Signing &mdash; Set the Keystone Signing method based upon the authentication
scheme: UUID or PKI.  PKI (the default setting) is a large token that contains token information such as the user ID
and user roles. UUID is the alternative 32-character token choice.

* Networking mode &mdash; Specify gre (default setting). Local and Flat are not supported.

* Local Volume File Name &mdash; Name of the file to be created on the target node's file system
and used with `losetup` when creating the logical volume group.  

* Maximum Volume File Size (GB) &mdash; Specify the maximum size of the file created on the
target node's file system to represent the size of the cinder volume. If the file size is too big
for the file system, the size of the file will be capped at 90% of the free space in that file
system (at the time of creation). Best practice is to adjust the size to a value appropriate for
the file-system associated with the Local Volume File.

* Admin User Password &mdash; Admin user's password for a granted administrator role on an
Admin project in the Administration Dashboard.

* Arch User Password &mdash; Architect user's password for a granted architect role on an Admin
project in the Administration Dashboard.

* Trash User Password &mdash; Trash user's password for a granted user's role on a trash project
in the Administration Dashboard.

**Remember the passwords** &mdash; You will use them to log into the HP Cloud OS for Moonshot Administration Dashboard.

When you're ready, click **Create Cloud**. The cloud will go through a series of steps to create an active cloud, showing the percent (%) completed.

> **Note:** When creating a cloud or a compute region, all of the nodes involved are first checked to ensure they can be resolved on the network. This verification process can take (up to) approximately five minutes.  During this time, the progress percentage will remain at 1%. If any of the nodes fail to resolve during the verification process, the cloud or region creation will fail. 

<!-- If this happens, check that you correctly entered the nodes' network settings in a prior step. 
If that's the cause of the Create Cloud failure, you will need to start over with the Admin Node installation process.  
--> 


## Next Step

Proceed to the next topic, [Create Compute Regions](/cloudos/moonshot/install/create-compute-regions).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

