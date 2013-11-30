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

**Enhanced identity management** - When you create a new project, you can:  Activate a new compute, object storage or platform service; list the project permissions; and manage the project role assignments.  Once you've activated services, you can set the Project Permissions for Compute Admin, Compute Network Admin, Block Storage Admin, Network Admin, and Image Management Admin, and more.   You can add and remove groups to each role, and assign users to specific roles for each project.

As a domain admin, you can manage each user's projects, roles, and groups.
You can manage the membership of each group, and manage the user assignment within each role. 

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


##Known issues and limitations in version 13.5## {#v135issues}

The following are known issues and limitations for version 13.5 of the HP Public Cloud software:

* ["Classic" management console](/mc/) is required - Because the HP Public Cloud Console is a Horizon Preview Edition, you must manage your service account information through the classic console.  Specifically, you need to use the classic console for:
    1. Changing/updating credit card information.
    2. Managing account details and billing information.
    3. Creating/accessing Support Cases.<br>
  Navigating back to the classic management console requires you to re-login to the HP Public Cloud Horizon Preview console if you do not currently have an open session.
    
* Latest OpenStack Version supported - The new Horizon-based console is based on the OpenStack Icehouse release.  If you need to manage services that are built from pre-Havana OpenStack instances, you cannot take advantage of the preview edition of the new HP Public Cloud Console built on Horizon software. 

* If you attempt to simultaneously launch a large number of instances, some instances might not be pingable or accessible via ssh. HP recommends staggering your launch of multiple instances to batches of at most 100 at a time for the best performance.

* When passing through a router to move off your local network, your throughput is limited to approximately 1500 megabits per second.

* Do not delete egress rules from your security group as doing so removes the ability of your instance to access any external nodes (including fetching metadata required by your SSH key) and causes newly-booted instances to be unusable.

* Identity Service - Role-based access control (RBAC) is not implemented at the panel level, so you may be presented with actions and services options you do not have permission to invoke. The error messages reported for limitations on user role permissions will be improved while development changes are adopted.

* Relational Database MySQL service - This service provides core functionality aligned with the latest [OpenStack Trove client](https://wiki.openstack.org/wiki/Trove).

* Jclouds is supported for Keystone version 2 API and earlier only.

* Because all flavors larger than `xsmall` require a root disk size of 30GB, you cannot boot an `xsmall` instance from an instance snapshot of a larger flavor. 
	
* Instances are not able to resolve their own names.
      
* Windows typically requires at least 4GB of memory, so Windows instances do not fit into the 10GB root disk used for `xsmall` instances even if the root partition is sufficient. DOUG 

* The command `nova image-meta` does not change the `image name`. Instead, it adds a new attribute called `name` to the metadata. If you want to change the name of an instance snapshot (private image), use the image management utilities ("Glance"). Please refer to the [API documentation](http://api.openstack.org/api-ref-compute.html) from Openstack.

* In rare cases, you might not be able to see the private IP in the networks section of a Windows instance. Use the VNC console to see the private IP for the Windows instance.

* The size limit of bootable volumes is 1.4TB, rather than the maximum volume size of 2TB. 

* Accessing the VNC console as soon as the instance gets active might cause the Windows instance to stop responding, and display an empty console log.

* We recommend that you use the Neutron interface for any network quota checks.

* The ec2 API and euca-tools are not supported in this release.

* Cinder backup-restore gives an unnecessary attribute error but the restore completes.
	
* Neutron port-update does not support attaching an instance to a port. You must use nova boot to attach a precreated port to an instance.

* Windows instances booted using the `highmem` flavor are unusable.

* Use the OpenStack Python CLI to create a server rather than the personality option to create a server. 
	
* We recommend that you use the [management console](/mc/) rather than the Windows CLI to attach or detach a volume.

* In the Windows CLI, the reset password feature is not currently available. 

* In the Windows CLI, the server ID in the attached volume column sometimes does not display.  
 
* When using the windows CLI, if the Flavors Details section is blank, retrieve the information using the [management console](/mc/).

* A Windows instance of a large size can sometimes become stuck in the rebooting state.

* When your VM `libvirt` state is `in shutdown`, Nova delete may not remove the VM.
	
* You should detach a volume before you delete it; performing a detach and delete simultaneously causes the volume to enter an inconsistent state.
	
* Always make sure that your volumes are unmounted--or offline for Windows instances--before you detach a volume.
* You may run into a quota issue for network tasks when using the Horizon Preview Edition for tasks such as floating IP creation. 
    *Workaround*: Use the [classic console](/mc/) for the task.

* Snapshot support for a virtual machine (VM) booted from a block volume is not yet available.<br>
    *Workaround*: Shut down the virtual machine (VM), then delete the VM and wait until the volume is marked as `available`. Take a snapshot of the volume using, for example, the python cinder binding. Once the snapshot is complete, re-create the instance from the volume, and re-attach the original floating IP, if necessary. **Note**: The port/fixed-IP associated with the new instance might be different from the original one.
    
* In rare cases, after successfully launching an instance, `ssh` might not function. <br>
    *Workaround*: Reboot the instance.

* In some cases, you might be unable to connect to a VNC URL. <br>
    *Workaround*: Connect using other clients such as `ssh`, `putty`, or RDP.

* In rare cases, an instance might be created with two rather than one single fixed IP. <br>
    *Workaround*: Delete and recreate the instance. 

* `ssh` access to your instance might unexpectedly cease functioning.<br>
    *Workaround*: Contact customer support.
	
* The Ext-Gateway field might not be populated in the CLI. <br>
    *Workaround*: You can confirm the status via the management console. 

* When using the Windows CLI, the Assigned Network Addresses section does not display the network information.<br>
    *Workaround*: Use the Horizon console to find the network address.
	
* When using the Windows CLI, you cannot download a file larger than 700MB.<br>
    *Workaround*: Use another CLI or the [management console](/mc/) to download a file that is larger than 700MB.
	
* Large file upload (5GB) with the Windows CLI may have issues. 
	*Workaround*: Use another tool to upload your file, e.g. the [management console](/mc/) or the Openstack CLIs. 
	
<!--##Resolved Issues in Version 13.5## {#v135resolved}


The following are resolved issues in version 13.5 of the HP Public Cloud software:

* items
-->

##For further information## {#SeeAlso}

For additional related information on HP Cloud:

* See [Getting Started with HP Public Cloud Console] (http:docs.hpcloud.com/hpcloudconsole) for detailed console information.
* See [HP Cloud version 13.5 overview](/version-overview/) for an overview of the 13.5 release set.
* See [HP Cloud Service APIs] (v13.5)](/api/v13/) for an overview of the 13.5 API specifications.
* See [migration overview page](/migration-overview/) for information on migrating from version 12.12 to 13.5n.
* See [Getting Started with Compute 13.5].(https://community.hpcloud.com/article/getting-started-compute-135) for information on how to get started with the compute service in version 13.5.
* Speaking of which, the [Getting Started Guide](https://community.hpcloud.com/article/getting-started-guide/) is a great resource for getting yourself up and running with the various HP Cloud services in general.
* See the [main HP Cloud web site](https://www.hpcloud.com/#) for a discussion of our various products and services.
* Go to our [support page](https://www.hpcloud.com/support) if you are seeking support information.

While these release notes contain information information for the software package as a whole, we also provide you with release notes for individual products and services:

* [Ruby Fog Bindings](/bindings/fog/release-notes/)
* [UNIX command-line interface (CLI)](/cli/unix/release-notes/)
* [Windows PowerShell CLI](/cli/windows/release-notes/)
