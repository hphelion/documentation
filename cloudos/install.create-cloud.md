---
layout: default
title: "Create a Cloud"
permalink: /cloudos/install/create-cloud/
product: cloudos

---

<a name="_top"> </a>

<script> 

function PageRefresh { 
 onLoad="window.refresh"
 }
 
 PageRefresh();
 
</script>


# Create a Cloud

Now that the Admin Node is installed, it's time to create your cloud. 

This topic explains how to set up a cloud with a Cloud Controller node (Cloud, Network, Storage, and Compute Controllers) 
and the separate Compute node(s). 

As indicated in the [Installation Overview](/cloudos/install/overview) topic, you have a choice at this point: 

* You can follow the wizard-based steps presented in this topic (recommended)
* Or you can perform the [Advanced Cloud Setup](/cloudos/install/advanced-cloud-setup) to apply and configure the install modules yourself.

When you create a cloud using the process defined in this topic, a number of OpenStack and Cloud OS 
install modules are automatically configured and deployed for you. In most cases, the automated deployment of install modules will suffice. 
However, should you need to customize values in the install modules that are not exposed in the Create Cloud Attributes tab, 
this advanced section, along with [Install Modules Reference](/cloudos/install/install-modules-reference/), are provided to assist 
you in the process of customizing and deploying the individual install modules. 

## Introduction

If you elected to use the wizard-based steps described in this topic (recommended), read on.

You'll continue to use the HP Cloud OS Operational Dashboard to execute these steps. Follow these procedures in order.

* [Manage Controller and Compute Nodes](#manage-controller-and-compute-nodes)

* [Complete Storage Configuration](#complete-storage-configuration)

* [Create a Cloud](#create-a-cloud)

* [Create Compute Regions](#create-compute-regions)

## Manage Controller and Compute Nodes

Before you begin, make sure:

* You have remote console access to all the bare-metal nodes. This is required to trigger Network
(PXE) boot, monitor operating system installation and if need be provide additional firmware
drivers when prompted.

* The Network and Storage Infrastructures are set up correctly. For the post-install of the operating system, a few steps are required to configure and mount the folder on an additional storage resource.

**Note:** Ensure that the boot order on all nodes is configured to boot from the network first (this only occurs once as the PXE service will not try to network boot a node again if it has already
done so).

1. Power ON the Controller and Compute nodes.

2. In the HP Cloud OS Operational Dashboard, select the Cloud tab, then Manage Nodes. Once the Controller and Compute Nodes have booted, each node displays in the table, indicating the Alias Name set to the node's MAC address (of the NIC associated
with the Administration Network). Each node will be in the Not Allocated state.

3. Click Edit Node to rename the MAC address in the Alias column to a more meaningful name such as controllercompute, cloudcontroller, compute1, compute2. **Note:** The node name can only be letters (capitalization is allowed) and numbers with no spaces. The node table then displays with the new alias names.

4. Select the node, then click Allocate Nodes. The node allocation process completes the setup and configuration of the nodes so that OpenStack services can be deployed to them.

As the Controller and Compute Nodes are being allocated, they progress through these different states: 

 * Not Allocated
 * Hardware Installed
 * Installing
 * Installed
 * Readying
 * Finalizing
 * Allocated
 
When the nodes are ready for cloud deployment, their status ends with Allocated. **Tip:** Access the bare-metal node's remote console to monitor the operating system
installation. Some of your hardware requires non-free firmware files to operate. The firmware can be loaded from removable media, such as a USB stick or CD/DVD. 
If a dialog box displays prompting you to load missing firmware, provide the appropriate drive.

In the case where a node results in status = Off, select the More > Reboot Node action for the node.

Note: To de-allocate a Compute or Controller node from your Admin Node, click the Delete
Node option from the drop-down menu on the Manage Node dialog. This action sets the
identified node to a de-allocated state.

## Complete Storage Configuration

Based on your Storage Infrastructure layout (see "Storage Infrastructure" (link) ) at this point,
you can configure the additional storage on the nodes.

**Note:** The default root partition is approximately 10 GB.

You may choose between the following options:

* Extend the root partition on all the nodes to use the additional storage space.

* After creating the cloud, mount the folders suggested in the "Storage Infrastructure" ( link ) on their respective external storage.
HP recommends, for ease of installation, that you extend the root partition of all the nodes based on the Storage
Infrastructure table in the "Storage Infrastructure" (link).

## Create a Cloud

After you complete the setup of the Admin Node, you are ready to create your cloud. 

To create a cloud:

1. In the Operational Dashboard, select the Cloud tab, then Manage Clouds.

2. Click Create Cloud to open the Create Cloud dialog.

3. Specify a Cloud Name. This will be the Domain name that is used to initialize Keystone and will be displayed in the Administration Dashboard.
Note: A cloud name must contain only letters and numbers. It cannot contain spaces or special characters.

4. Select the Controllers tab and specify which node will have the Cloud Controller, Network Controller, and Storage Controller respective services.
You install all these core controller services on one Cloud Controller node.

5. (Optional) Select the Attributes tab to specify property values required to create a Cloud.

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

**Remember the passwords** &mdash; You will use them to log into the HP Cloud OS Administration Dashboard.

When you're ready, click **Create Cloud**. The cloud will go through a series of steps to create an active cloud, showing the percent (%) completed.

## Create Compute Regions

When the Create Cloud step is complete, the cloud's state displays Active. You can now create
one or more compute regions. This is the last step in the process of creating a cloud.
When the compute region is created, you have created an active cloud.

The simplest cloud has one compute region with one Compute Controller that manages all the
compute nodes. After creating an active cloud, you can go back and add more regions as your cloud
environment expands. Or, you can plan to include several compute regions in your cloud depending
on your environment.

There are multiple use cases where you would prefer to have separate compute regions, such as:

* To accommodate a heterogeneous set of hardware configured for different workloads.

* To distribute the workload across regions to get better response times. Each region can contain
dedicated endpoints with a full Nova installation including its own message queue and database.

To create a compute region:

1. In the Operational Dashboard, select the Cloud tab, then Manage Clouds.

2. For the cloud just created, click Create Compute Region to open the Create Compute
Region dialog.

3. Specify a Region Name. This will be the Region name that is used to initialize Keystone and will be displayed on the Administration Dashboard.

4. From the Compute Controller drop down list, select the node that will have the Compute Controller services. The Compute Controller service can reside on the same Cloud Controller.

5. Specify which nodes will have the Compute Nodes service. Select the Compute Node(s) in one of the following ways:

 * Choose a number from the drop-down list to auto-select check boxes for you.
 * Individually select the check boxes of the node(s) you want.
 
> **Note:** You can have a single node act as both the Compute Controller and Compute
Node. If you choose this configuration, make sure the underlying node has enough
CPU, Memory and Storage capacity to be able to run all the controller services as well
as act as the virtualization host.

At this point, you can use the Attributes tab to specify property values required to create a Compute
Region. For the Hypervisor attribute, use `kvm` (the default) if the compute nodes are baremetal
nodes. Use `qemu` if the compute nodes are VMs.

When you're ready, now select **Create Compute Region**. The compute region will go through a series of steps to create an active cloud, showing the
percent (%) completed.

Once the Create Compute Region step is complete, the name supplied for the region will be
displayed and the cloud's Status will be Active. This indicates that the cloud and compute region
have been successfully created.

You can now add additional compute regions using steps in the prior list. The added compute regions
appear on the Manage Clouds page as a comma-separated list.

To see all the cloud and compute region(s) values you configured, click the cloud name to open the
Manage Clouds Detail page.

* The created cloud details show the timestamp of the cloud creation, the nodes specified for the Cloud Controller, Network Controller, and Storage Controller.

* Each compute region is a tab with the region's name. Each region's tab shows the timestamp of that compute region creation, the nodes specified for the Compute Controller and Compute
Nodes, and the Hypervisor.

## Next Step

After successfully creating a cloud and compute region(s), you can manage your cloud environment by launching the HP Cloud OS Administration Dashboard.  To get there, click More > Launch Dashboard for the cloud you
created.  For more, see [Launch the Administration Dashboard](/cloudos/install/launch-admin-dashboard/).

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

