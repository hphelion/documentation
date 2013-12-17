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


##New and Updated in version 13.5## {#v135features}

**New look and feel for the Management Console** - Based on the [OpenStack Horizon project](http://docs.openstack.org/developer/horizon/), the new HP Public Cloud Console interface and user experience is significantly improved from the original classic management console.  This new user interface provides you with project dashboards that display group-related services for easier availability and service management.  Documentation is  provided in-line and embedded throughout the console on many forms, reducing your clicks and improving your console experience. Although workflows may look different, you can still manage your standard functions through the console, including initializing instances, creating volumes, launching images and snapshots, and creating security groups and key pairs.  See [Getting Started with HP Public Cloud Console](/hpcloudconsole) for more information.

**Larger compute instances for big data and high-performance computing** -  New larger instance types allow you to run big data, analytics, and high performance computing (HPC) workloads in the public cloud.  You can access instances with up to 120 GB of RAM and up to 16 virtual cores. The new instance types allow even greater flexibility to choose the virtual machine size that best fits your application's compute resource needs.

**New virtual private cloud (VPC) networking capabilities** - The new VPC functionality provides the ability to deploy your workloads with even greater security within the public cloud for hybrid delivery or public cloud only by enabling you to create  isolated virtual networks within the HP Cloud compute service. UsingSoftware Defined Networking (SDN), VPC  allows you to create a wide variety of network configurations specific to your individual workloads needs with a variety of public Internet accessibility options. You can also connect your public cloud network to your on-premise network, enabling true hybrid delivery through private and public infrastructures with a secure VPN connection performing as a single integrated system.

**Networking topology visualization** - The new [Horizon-based public cloud console](/hpcloudconsole) inherits network topology infographics.  In addition to visualizing network relationships, you can perform dynamic network management, interactively creating networks and routers, and launching instances through a 2-D visualization scene.

**Faster data upload to the Cloud** - A new bulk import service reduces the time to market for applications requiring existing data by allowing you to quickly and easily load your data into HP Public Cloud block storage or object storage. The new service bypasses the process of transferring large amounts of information over the Internet and allows you to provide hard drives directly to HP's data centers where your data can be rapidly transferred.

**More object storage options** - HP Public Cloud Console users can now setup and control object storage container synchronization across multiple regions. Cross-region replication contributes to a more achievable business continuity plan for disaster recovery options which are often at the forefront of most enterprise organizations priorities.  Public Cloud Console users also have the ability to store duplicate versions of content within these storage containers, to restore from unintended failures or deletions, or for the purpose of data archiving, among others. 

**Larger file size transfers via the CLI** - You can now use the Windows CLI to transfer files up to 700MB for downloads and 5GB for uploads, a significant increase in the file size ceiling for transfers via the Windows CLI.

**Enhanced identity management** - Particularly attractive for administrators in the enterprise, this release provides more flexibility and options when managing roles, domains, users and groups in the new Horizon-based public cloud console. Specifically, roles can now be assigned to groups of users, or domain administrators can be defined for managing domains and respective users.   In addition, you can assign roles around the latest platform services, such as the new HP Cloud [Relational Database](/dbaas/) service.

As a domain admin, you can manage each user's projects, roles, and groups.  You can manage the membership of each group, and manage the user assignment within each role. 

**Hybrid cloud focus** - In response to significant feedback received from our rapidly growing open source developer community, and the notably modest usage of the AWS EC2 API in the open HP Cloud environment, support for the AWS EC2 API and Eucalyptus API have been discontinued at this time.

**Jclouds support** - Jclouds support is provided for the Keystone version 2 (and earlier) API.

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

This section of the release notes describes the HP recommendations for best performance, utility, and functionality with this software version.   We have also provided information about some limitations and known issues for reference purposes.  This section contains

* [Best practices recommendations](#Recommendations) for best functionality and performance
* [Known issues](#Issues) and workarounds with version 13.5


###Recommendations## {#Recommendations} 

The following are our best-practices recommendations for versions 13.5.

####Cloud Compute####
* For best performance and reliability with multiple instances, launch instances in batches of at most 100.
* Boot instance snapshots from an instance using the same flavor.  For example, if you have created a snapshot of an `xsmall` instance, boot it from an instance that also has flavor `xsmall`.
* To ensure proper operation, do not delete an instance in `shutdown` state; reboot the instance to ensure it it is in `Active` or `Error` state prior to deletion.
* Please use a root disk size of 30GB for instances with flavors larger than `xsmall`.
* For improved performance, keep the size of your bootable volumes to less than 1.4TB

####Cloud Networking###

* To ensure full external node access, HP recommends that you do not delete  egress rules and allow those rules to remain part of their security groups.
* To get the most timely and accurate results for your quota checks, use the [Neutron networking interface](/hpcloudconsole#ManageHPPublicCloud).
* To ensure that your Linux instance is able to resolve its own hostname, add an entry to the `/etc/hosts` file that matches the hostname.  This can be accomplished by running the command:
    echo "*hostname* -l" | sudo tee -a /etc/hosts

####Command-line Interface####

* For best performance when transferring large files (greater than 700MB for downloads and 1GB for uploads), use either the [classic management console](/mc/) or the [UNIX CLI](/cli/unix/) utilities.
* For easiest password reset, use the [Horizon Preview Edition](/hpcloudconsole) interface or the [classic management console](/mc/) or the [UNIX CLI](/cli/unix/) utilities.
* Use the [classic management console](/mc/) to display the `Flavors Details` information rather than the Windows CLI.
* To create a snapshot for an instance booted from a block volume, follow these steps for best results:<br>
    - Shut down the instance
    - Delete the instance and wait until the volume is marked as `available`
    - Take a snapshot of the volume using a utility such as the python cinder binding
    - When the snapshot is complete, re-create the instance from the volume
    - Re-attach the original floating IP (if necessary) 
    Note that the port (fixed IP address) associated with the new instance might have changed.

####Windows####

* For best ease-of-use, use the [management console](/mc/) rather than the Windows command-line interface (CLI) to attach or detach a volume.
* For best results when deleting a volume, unmount the volume (or for Windows instances take it offline) and detach the volume prior to deleting it.
* For optimum performance and reliability when running Windows instances, HP recommends you use flavors with sizes of 4GB or greater.
* For full functionality when creating instances using the Windows CLI, use flavors of `small` or greater. 
* For best reliability, reboot instances of sizes `standard.2xlarge`, `standard.4xlarge`, and `standard.8xlarge` from within the instance.


###Known issues### {#Issues}

The following are the known issues for Version 13.5 of the HP Public Cloud software.

####Cloud Compute####

* Use the standard rather than `highmem` family of flavors (`standard.large`, `standard.xlarge`, etc.) for creating Windows instances.
* If the console log appears empty immediately after instance activation, wait a few moments and try again; it can take some time for the instance information to be recorded in the log file.

####Cloud Block Storage####

* During backups and restores you may see an `Unnecessary attribute` error; this is a spurious error that has no effect on successfully completing the backup and can be ignored.

####Command-line Interface####

* After successfully launching an instance if you find `ssh` not functioning properly, just relaunch the instance.
* Sometimes under certain circumstances in the Windows CLI, the `ls` command displays some fields as blank.  To view the contents of these fields, display the information using the [Horizon Preview Edition](/hpcloudconsole) interface or the [classic management console](/mc/) or the [UNIX CLI](/cli/unix/) utilities. The fields are:
    - The `Attached To` and `Server Attached To` fields are may display as blank after you attach a server to a volume using the `[Attach-Volume](/cli/windows/reference#Attach-Volume)` command
    - The `Ext Gateway` field may display as blank after you execute the `[Update-Router](/cli/windows/reference#Update-Router)` command
    - The `Assigned Network Addresses` field may display as blank after you execute the `[New-Server](/cli/windows/reference#New-Server)` command<br>
    

####Horizon Preview Edition Console###

* If you use the Identity service role-based access control (RBAC) at the panel level in the [Horizon Preview Edition](/hpcloudconsole), you may see action and service options that exceed your permission levels.  You can access these features through the CLI or the the [classic management console](/mc/).
* If you encounter a quota issue when performing network tasks while using the [Horizon Preview Edition](/hpcloudconsole), use the [classic management console](/mc/).


<!--##Resolved Issues in Version 13.5## {#v135resolved}


The following are resolved issues in version 13.5 of the HP Public Cloud software:

* items
-->

##For further information## {#SeeAlso}

For additional related information on HP Cloud:

* [Getting Started with HP Public Cloud Console](http:docs.hpcloud.com/hpcloudconsole) for detailed console information.
* [HP Cloud version 13.5 overview](/version-overview/) for an overview of the 13.5 release set.
* [HP Cloud Service APIs (v13.5)](/api/v13/) for an overview of the 13.5 API specifications.
* [migration overview page](/migration-overview/) for information on migrating from version 12.12 to 13.5.
* [Getting Started with Compute 13.5](https://community.hpcloud.com/article/getting-started-compute-135) for information on how to get started with the compute service in version 13.5.
* The [Getting Started Guide](https://community.hpcloud.com/article/getting-started-guide/) is a great resource for getting yourself up and running with the various HP Cloud services in general.
* [HP Cloud web site](https://www.hpcloud.com/#) for a discussion of our various products and services. 
* Our [support page](https://www.hpcloud.com/support) provides support information.

While these release notes contain information information for the software package as a whole, we also have release notes for individual products and services:

* [Ruby Fog Bindings](/bindings/fog/release-notes/)
* [UNIX command-line interface (CLI)](/cli/unix/release-notes/)
* [Windows PowerShell CLI](/cli/windows/release-notes/)
