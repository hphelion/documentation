---
layout: default
title: "HP Cloud Release Notes"
permalink: /release-notes/

---
# HP Public Cloud Release Notes

This page contains the following information on our software package:

* [Release information for version 13.5](#v135Info)
* [New features in version 13.5](#v135features)
* [Known issues and limitation in version 13.5](#v135issues)
* [For further information](#SeeAlso)

<!--Moving forward, there will be more bulleted items for each release-->


##New features in version 13.5## {#v135features}

The following are new features in version 13.5 of the HP Public Cloud software:

**New look and feel** - Based on the OpenStack Horizon project, the HP Public Cloud Console interface is significantly different from the original classic console.  Dashboards and their respective service navigation panels are vertically displayed on the left-hand side of the console, while documentation is provided in-line and embedded throughout on various forms.  See [Getting Started with HP Public Cloud Console](http://docs.hpcloud.com/hpcloudconsole) for more information.

**Larger compute instances for big data and high-performance computing is now supported** -  Access to new larger instance types allows you to run big data, analytics, and high performance computing (HPC) workloads in the public cloud.  You can access instances with up to 120 GB of RAM and up to 16 virtual cores. The new instance types allow you to choose the virtual machine size that best fits your application's needs.

**New virtual private cloud (VPC) networking capabilities** - The new VPC functionality provides advanced security in the public cloud by allowing you to create your own isolated virtual network within the HP Cloud compute service. Using a Software Defined Networking (SDN) stack, this service allows you to select whether or not your public cloud network instances are also accessible from the internet. This network isolation offers an additional layer of security to cloud deployments. You can also connect your public cloud network to your on-premise network, treating private and public infrastructures as a single connected system.

**Networking topology visualization** - Interactively build and manage your network through a 2-D visualization dashboard in the Horizon Console .

**Faster data upload to the Cloud** - A new bulk import service reduces the time to market for applications requiring existing data by allowing you to quickly and easily load your data into HP Public Cloud block storage or object storage. The new service bypasses the process of transferring large amounts of information over the Internet and allows you to provide hard drives directly to HP's data centers where your data can be rapidly transferred.

**Cross-region replication** - HP Public Cloud Console users can setup and control object storage container synchronization across multiple regions. 

**Object storage container versioning** - HP Public Cloud Console users can now toggle on or off the ability to duplicate and synchronize objects within storage containers.

**Upload improvements** - The Horizon console is no longer limited to a 50MB file upload size.  If you upload through the Cloud Console you are limited to a size of 5GB. HP recommends that you upload anything larger than 1GB the CLI/API.  

**Relational Database MySQL service support** - The HP Cloud RDB MySQL service provides core functionality aligned with the latest [OpenStack Trove client](https://wiki.openstack.org/wiki/Trove).

**Jclouds support** - Jclouds support is provided for the Keystone version 2 (and earlier) API.

**Enhanced identity management** - When you create a new project, you can:  Activate a new compute, object storage or platform service; list the project permissions; and manage the project role assignments.  Once you've activated services, you can set the Project Permissions for Compute Admin, Compute Network Admin, Block Storage Admin, Network Admin, and Image Management Admin, and more.   You can add and remove groups to each role, and assign users to specific roles for each project.

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

* [Software recommendations](#Recommendations) for best functionality and performance
* [Limitations](#Limitations) of version 13.5
* [Known issues](#Issues) and workarounds with version 13.5


###Recommendations## {#Recommendations} 

<!-- recommendations instead of limitations? 
Make known issues a sub-head?-->

For maximum utility and functionality with this software version, use the ["Classic" management console](/mc/) for a very few of the basic account transactions (changing or updating billing or credit card information, managing account details, creating and accessing support cases) rather than the OpenStack [Horizon Preview Edition](/hpcloudconsole/) interface.   <!-- move this down to bury it-->

For best performance and reliability with multiple instances, stagger your instance launches to batches of 100 or less.

Allow egress rules to remain as part of their security groups; HP recommends against deleting them.

Boot instance snapshots from an instance using the same flavor.  For example, if you have created a snapshot of an `xsmall` instance, boot it from an instance that also has flavor `xsmall`.

For maximum flexibility, use flavors of `small` or larger for Windows instances. 

Use the image management ("Glance") tools to effect image name changes.

To get the most timely and accurate results for your quota checks, use the [Neutron networking interface](/hpcloudconsole#ManageHPPublicCloud).

Use the Nova boot utility to attach pre-created ports to instances.

Use large standard flavors (`standard.large`, `standard.xlarge`, etc.) rather than highmem flavors for your larger Windows instances.

For speed and ease-of-use, use the [management console](/mc/) rather than the Windows command-line interface (CLI) to attach or detach a volume.

For best results when deleting a volume, unmount the volume (or for Windows instances take it offline) and detach it prior to deleting it.

When transferring large files (greater than 700MB for downloads and 5GB for uploads), use either the [classic management console](/mc/) or the [UNIX CLI](/cli/unix/) utilities.

For best results, use the [Horizon Preview Edition](/hpcloudconsole/) interface or the [classic management console](/mc/) to reset your password.

Use the Nova boot utility to attach a pre-created instance to a port.

To create a snapshot for an instance booted from a block volume, follow these steps for best results:
* Shut down the instance
* Delete the instance and wait until the volume is marked as `available`
* Take a snapshot of the volume using a utility such as the python cinder binding
* When the snapshot is complete, re-create the instance from the volume
* Re-attach the original floating IP (if necessary) 
Note that the port (fixed-IP address) associated with the new instance might have changed.


###Limitations### {#Limitations}

Version 13.5 of the HP Public Cloud software has the following minor limitations:

* Instances with flavors larger than `xsmall` require a root disk size of 30GB.
* Windows instances require at least 4GB of memory.
* The bootable volume size limit is 1.4TB.
* In the Windows CLI, the maximum file size is 700MB for downloads and 5GB for uploads. 
* The EC2 API and AWS Eucalyptus toolset are not supported in this release.


###Known issues### {#Issues}

The following are the known issues (and workarounds) for Version 13.5 of the HP Public Cloud software:

* Deleting an egress rule from a security group may limit the ability of your instance to access external nodes (including the capability to fetch metadata required by your SSH key), and may cause issues in newly-booted instances.
* If you use the Identity service role-based access control (RBAC) at the panel level, you may see action and service options that exceed your permission levels.
* An instance cannot resolve its own name.
* In you are unable to see the private IP in the networks section of a Windows instance, display it using the [VNC console](https://community.hpcloud.com/article/using-vnc-console-access-your-instance).
* If your VNC console log appears empty immediately after instance activation, just wait a few moments and try again; it sometimes takes a moment for the instance information to be recorded in the log file.
* During backups and restores you may see an `Unnecessary attribute` error; this is a spurious error that has no effect on successfully completing the backup and can be ignored.
* You cannot use Neutron `port-update` to attach an instance to a port; use Nova boot.
* If you don't see information displayed for `Flavors Details` when using the Windows CLI, you can retrieve the information using the [classic management console](/mc/).
* If you encounter a quota issue when performing network tasks while using the [Horizon Preview Edition](/hpcloudconsole), use the [classic management console](/mc/).
* After successfully launching an instance if you find `ssh` not functioning properly, just relaunch the instance.
* When using a VNC URL if you find yourself unable to connect, use an alternative client such as `ssh`, `putty`, or remote desktop protocol (RDP).
* In the rare case where an instance is created with two fixed IPs, simply delete and recreate the instance to clear the additional IP.
* The reset password feature is currently available in the UNIX CLI and through the [Horizon Preview Edition](/hpcloudconsole/) interface or the [classic management console](/mc/) only. 

<!-- Open items where additional details have been requested:

* When the `libvirt` state of your instance is `in shutdown`, Nova delete may not remove the instance.  DOUG: When and where is this encountered exactly?  What can the user do to avoid it?  What is the workaround?

* In the Windows CLI, the server ID in the attached volume column sometimes does not display.  Doug: Under what circumstances?  After which command is executed?  Do we have screen shots of what it looks like when it is correct, and when it is incorrect?  What is the workaround; to use the console?  Which console?
Possible reword: On rare occasions, when you view instance information using the Windows CLI, the server ID information in the `Attached volume` column does not display properly.  Re-execute the display command? 
    
* `ssh` access to your instance might unexpectedly cease functioning.<br>
    *Workaround*: Contact customer support.  DOUG: we got *hammered* on this; what is a *real* workaround? 
	
* The Ext-Gateway field might not be populated in the CLI. <br>
    *Workaround*: You can confirm the status via the management console. DOUG: under what circumstances would this happen?  When *what* is being done in the CLI?  Which CLI; UNIX or Windows?  Which management console; classic or Horizon?  Where can you get the status information in the console *exactly*?

* When using the Windows CLI, the Assigned Network Addresses section does not display the network information.<br>
    *Workaround*: Use the Horizon console to find the network address.  DOUG: the assigned network address section *of what*?  When does this come up?  After what command is executed?
    
* A Windows instance of a large size can sometimes become stuck in the rebooting state.  DOUG: *All* large sizes, or just some?  What are the exact parameters of "large"?  What is the workaround?


-->
    
	
<!--##Resolved Issues in Version 13.5## {#v135resolved}


The following are resolved issues in version 13.5 of the HP Public Cloud software:

* items
-->

##For further information## {#SeeAlso}

For additional related information on HP Cloud:

* See [Getting Started with HP Public Cloud Console](http:docs.hpcloud.com/hpcloudconsole) for detailed console information.
* See [HP Cloud version 13.5 overview](/version-overview/) for an overview of the 13.5 release set.
* See [HP Cloud Service APIs (v13.5)](/api/v13/) for an overview of the 13.5 API specifications.
* See [migration overview page](/migration-overview/) for information on migrating from version 12.12 to 13.5n.
* See [Getting Started with Compute 13.5](https://community.hpcloud.com/article/getting-started-compute-135) for information on how to get started with the compute service in version 13.5.
* Speaking of which, the [Getting Started Guide](https://community.hpcloud.com/article/getting-started-guide/) is a great resource for getting yourself up and running with the various HP Cloud services in general.
* See the [main HP Cloud web site](https://www.hpcloud.com/#) for a discussion of our various products and services.
* Go to our [support page](https://www.hpcloud.com/support) if you are seeking support information.

While these release notes contain information information for the software package as a whole, we also provide you with release notes for individual products and services:

* [Ruby Fog Bindings](/bindings/fog/release-notes/)
* [UNIX command-line interface (CLI)](/cli/unix/release-notes/)
* [Windows PowerShell CLI](/cli/windows/release-notes/)
