---
layout: default
title: "HP Cloud Release Notes"
permalink: /release-notes/

---
# HP Public Cloud Release Notes

This page contains the following information on our software package:

* [Release information for version 13.5](#v135Info)
* [New features in version 13.5](#v135features)
* [Recommendations](#Recommendations)
* [For further information](#SeeAlso)

<!--Moving forward, there will be more bulleted items for each release-->


##New features in version 13.5## {#v135features}

**New look and feel for the Management Console** - Based on the OpenStack Horizon project, the HP Public Cloud Console interface is significantly different from the original classic console.  Dashboards and their respective service navigation panels are vertically displayed on the left-hand side of the console, while documentation is provided in-line and embedded throughout on various forms.  See [Getting Started with HP Public Cloud Console](http://docs.hpcloud.com/hpcloudconsole) for more information.

**Larger compute instances for big data and high-performance computing are now supported** -  New larger instance types allows you to run big data, analytics, and high performance computing (HPC) workloads in the public cloud.  You can access instances with up to 120 GB of RAM and up to 16 virtual cores. The new instance types allow even greater flexibility to choose the virtual machine size that best fits your application's compute resource needs.

**New virtual private cloud (VPC) networking capabilities** - The new VPC functionality provides the ability to deploy your workloads with even greater security within the public cloud for public cloud only or hybrid delivery  by enabling you to create  isolated virtual networks within the HP Cloud compute service. UsingSoftware Defined Networking (SDN), VPC  allows you create a wide variety of network configurations specific to your individual workloads needs with a variety of public internet accessibility options. You can also connect your public cloud network to your on-premise network, enabling true hybrid delivery through private and public infrastructures with a secure VPN connection performing as a single integrated system.

**Networking topology visualization** - Interactively build and manage your network through a 2-D visualization dashboard in the Horizon Console.

**Faster data upload to the Cloud** - A new bulk import service reduces the time to market for applications requiring existing data by allowing you to quickly and easily load your data into HP Public Cloud block storage or object storage. The new service bypasses the process of transferring large amounts of information over the Internet and allows you to provide hard drives directly to HP's data centers where your data can be rapidly transferred.

**Cross-region replication** - HP Public Cloud Console users can setup and control object storage container synchronization across multiple regions. 

**Object storage container versioning** - HP Public Cloud Console users can now toggle on or off the ability to duplicate and synchronize objects within storage containers.

**Upload improvements** - The Horizon console is no longer limited to a 50MB file upload size.  You can also now use the Windows CLI to transfer files up to 700MB for downloads and 5GB for uploads. 

**Jclouds support** - Jclouds support is provided for the Keystone version 2 (and earlier) API.

**Enhanced identity management** - When creating new projects, youcan: Activate a new compute, object storage or platform service; list the project permissions; and manage the project role assignments. Once you've activated services, you can set the Project Permissions for Compute Admin, Compute Network Admin, Block Storage Admin, Network Admin, and Image Management Admin, and more. Users can add and remove groups to each role, and assign users to specific roles for each project.

As a domain admin, you can manage each user's projects, roles, and groups.  You can manage the membership of each group, and manage the user assignment within each role. 

**User roles** - The following user roles are available with this release (new user roles *italicized*):

* Block Storage Admin
* CDN Admin
* Compute Admin
* *Compute Network Admin*
* *Compute Project Manager*
* DNS Admin
* *Identity Domain Admin* -- Super User of the Domain; manage project role assignments including domain roles
* *Identity Domain User* -- Normal Domain User
* Image Management Admin
* Load Balancing Admin
* Messaging Admin
* Monitoring Admin
* MySQL Admin
* Network Admin
* Object Storage Admin


##Recommendations for version 13.5## {#Recommendations}

This section of the release notes describes the HP recommendations for best performance, utility, and functionality with this software version.   We have also provided information about some limitations and known issues for your reference purposes.  This section contains

* [Best practices recommendations](#Recommendations) for best functionality and performance
* [Known issues](#Issues) and workarounds with version 13.5


###Recommendations## {#Recommendations} 

The following are our best-practices recommendations for versions 13.5.

####Cloud Compute####
* For best performance and reliability with multiple instances, stagger your instance launches to batches of a maximum size of 100 instances.
* Boot instance snapshots from an instance using the same flavor.  For example, if you have created a snapshot of an `xsmall` instance, boot it from an instance that also has flavor `xsmall`.
* For reliability, use Nova delete to terminate instances only when they are in the `Active` or `Error` state.
* For reliability, make sure you have a root disk size of 30GB for instances with flavors larger than `xsmall`.
* For best reliability, reboot instances of sizes `standard.2xlarge`, `standard.4xlarge`, and `standard.8xlarge` from within the instance.
* For improved performance, keep the size of your bootable volumes to less than 1.4TB

####Cloud Networking###

* To ensure full external node access, allow egress rules to remain part of their security groups; HP recommends against deleting them.
* To get the most timely and accurate results for your quota checks, use the [Neutron networking interface](/hpcloudconsole#ManageHPPublicCloud).
* To ensure that your instance consistently resolves its own name, add an entry to the `/etc/hosts` file that matches the host name.

####Command-line Interface####

* For best performance when transferring large files (greater than 700MB for downloads and 1GB for uploads), use either the [classic management console](/mc/) or the [UNIX CLI](/cli/unix/) utilities.
* For easiest password reset, use the [Horizon Preview Edition](/hpcloudconsole) interface or the [classic management console](/mc/) or the [UNIX CLI](/cli/unix/) utilities.
* To create a snapshot for an instance booted from a block volume, follow these steps for best results:
    - Shut down the instance
    - Delete the instance and wait until the volume is marked as `available`
    - Take a snapshot of the volume using a utility such as the python cinder binding
    - When the snapshot is complete, re-create the instance from the volume
    - Re-attach the original floating IP (if necessary) 
    Note that the port (fixed-IP address) associated with the new instance might have changed.

####Windows####

* Use large standard flavors (`standard.large`, `standard.xlarge`, etc.) rather than `highmem` flavors for your larger Windows instances.
* For speed and ease-of-use, use the [management console](/mc/) rather than the Windows command-line interface (CLI) to attach or detach a volume.
* For best results when deleting a volume, unmount the volume (or for Windows instances take it offline) and detach it prior to deleting it.
* To ensure quality performance, allow at least 4GB of memory for your Windows instances.
* For full functionality when creating instances using the Windows CLI, use flavors of `small` or greater. 


###Known issues### {#Issues}

The following are the known issues (and workarounds) for Version 13.5 of the HP Public Cloud software.

####Cloud Compute####

* The EC2 API and AWS Eucalyptus toolset are not supported in this release.
* In you are unable to see the private IP in the networks section of a Windows instance, display it using the [VNC console](https://community.hpcloud.com/article/using-vnc-console-access-your-instance).
* If your VNC console log appears empty immediately after instance activation, just wait a few moments and try again; it sometimes takes a moment for the instance information to be recorded in the log file.

####Cloud Block Storage####

* During backups and restores you may see an `Unnecessary attribute` error; this is a spurious error that has no effect on successfully completing the backup and can be ignored.

####Command-line Interface####

* If you don't see information displayed for `Flavors Details` when using the Windows CLI, you can retrieve the information using the [classic management console](/mc/).
* After successfully launching an instance if you find `ssh` not functioning properly, just relaunch the instance.
* Sometimes under certain circumstances in the Windows CLI, the `ls` command displays some fields as blank:
    - The `Attached To` and `Server Attached To` fields are may display as blank after you attach a server to a volume using the `[Attach-Volume](/cli/windows/reference#Attach-Volume)` command
    - The `Ext Gateway` field may display as blank after you execute the `[Update-Router](/cli/windows/reference#Update-Router)` command
    - The `Assigned Network Addresses` field may display as blank after you execute the `[New-Server](/cli/windows/reference#New-Server)` command<br>
    To view the contents of these fields, display the information using the [Horizon Preview Edition](/hpcloudconsole) interface or the [classic management console](/mc/) or the [UNIX CLI](/cli/unix/) utilities. 

####Horizon Preview Edition Console###

* If you use the Identity service role-based access control (RBAC) at the panel level in the [Horizon Preview Edition](/hpcloudconsole), you may see action and service options that exceed your permission levels.  You can access these features through the CLI or the the [classic management console](/mc/).
* If you encounter a quota issue when performing network tasks while using the [Horizon Preview Edition](/hpcloudconsole), use the [classic management console](/mc/).


<!--##Resolved Issues in Version 13.5## {#v135resolved}


The following are resolved issues in version 13.5 of the HP Public Cloud software:

* items
-->

##For further information## {#SeeAlso}

For additional related information on HP Cloud:

* See [Getting Started with HP Public Cloud Console](http:docs.hpcloud.com/hpcloudconsole) for detailed console information.
* See [HP Cloud version 13.5 overview](/version-overview/) for an overview of the 13.5 release set.
* See [HP Cloud Service APIs (v13.5)](/api/v13/) for an overview of the 13.5 API specifications.
* See [migration overview page](/migration-overview/) for information on migrating from version 12.12 to 13.5.
* See [Getting Started with Compute 13.5](https://community.hpcloud.com/article/getting-started-compute-135) for information on how to get started with the compute service in version 13.5.
* Speaking of which, the [Getting Started Guide](https://community.hpcloud.com/article/getting-started-guide/) is a great resource for getting yourself up and running with the various HP Cloud services in general.
* See the [main HP Cloud web site](https://www.hpcloud.com/#) for a discussion of our various products and services.
* Go to our [support page](https://www.hpcloud.com/support) if you are seeking support information.

While these release notes contain information information for the software package as a whole, we also provide you with release notes for individual products and services:

* [Ruby Fog Bindings](/bindings/fog/release-notes/)
* [UNIX command-line interface (CLI)](/cli/unix/release-notes/)
* [Windows PowerShell CLI](/cli/windows/release-notes/)
