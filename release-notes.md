---
layout: default
title: "HP Cloud Release Notes"
permalink: /release-notes/

---
# HP Cloud Release Notes

You know the problem:  you see the phrase "release notes" and you immediately think "boring bug list".  But you're in luck!  This page--the release notes for the HP Public Cloud software--<i>does</i> contain list of bugs, but we have worked hard to keep it from being boring, and to make it easier for you to navigate and locate the information you're looking for.  We have also included information about the new features for each release, links to the most current release, and a few other items here and there that we hope will be helpful for you.  And if you have any genius ideas for making it easier to use, please tell us; we <i>want to know</i>. 

This page contains the following information on our software package:

* [New features in version 13.5](#v135features)
* [Known issues in version 13.5](#v135issues)
* [For further information](#seealso)

<!--* [Resolved issues in version 13.5](#v135resolved)
* [Release notes for individual products and services](#otherReleaseNotes)-->


##New Features in Version 13.5## {#v135features}

The following are new features in version 13.5 of the HP Public Cloud software:

* *Larger compute instances for big data and high-performance computing is now supported*.  Access to new larger instance types allows you to run big data, analytics and high performance computing (HPC) workloads in the public cloud.  You can access instances with up to 120 GB of RAM and up to 16 virtual cores. The new instance types allow you to choose the virtual machine size that best fits your application’s needs.
* *New virtual private cloud (VPC) networking capabilities*.  The new VPC functionality provides you with advanced security in the public cloud by allowing you to create your own isolated virtual network within the HP Cloud compute service. Using a Software Defined Networking (SDN) stack, this service allows you to select whether or not your public cloud network instances are also accessible from the internet. This network isolation offers an additional layer of security to cloud deployments. You can also connect your public cloud network to your on-premise network, treating private and public infrastructures as a single connected system.
* *Faster and simpler custom image upload*.  Increases productivity by offering simplified set up and deployment of new instances. You can now create your own images outside of the HP Cloud and upload them to the HP Cloud Image Management Service to use as a starting point for creating new instances. HP Cloud services also provide a wide variety of preconfigured images, allowing you to create images from your running instances to produce new instances.
* *Faster data upload to the cloud*.  A new bulk import service reduces the time to market for applications requiring existing data by allowing you to quickly and easily load your data into HP Cloud block storage or HP Cloud object storage. The new service bypasses the process of transferring large amounts of information over the Internet and allows you to provide hard drives directly to HP’s data centers where your data can be rapidly transferred.


##Known issues in version 13.5 (beta)## {#v135issues}

The following are known issues and limitation for version 13.5 of the HP Public Cloud software:

* When simultaneously launching instances, you are limited to 49 instances or less.  We recommend that you stagger your launch of multiple instances for best performance.  The default quota limit is 40 instances.
* When passing through a router to move off your local network, your throughput speed is limited to approximately 150 megabits per second.
* Snapshot support is not yet available for `standard.4xlarge` and `standard.5xlarge` instances.
* Do not delete egress rules from your security group; this removes the ability of your VM to access any external nodes (including fetching metadata required by your SSH key), causing newly-booted VMs to be unusable.
* Snapshot support for a virtual machine (VM) booted from a block volume is not yet available.<br>
    *Workaround*: Shut down the volume and start a new instance to take your snapshot.
* Instances are not currently able to access a DNS server as their default.<br>
    *Workaround*: To resolve an external address, provide the IP address of an appropriate DNS server when you create or update a subnet.  You can use any external DNS server; HP also provides the server at IP address `206.164.176.34` in AE1 for your use.  **Note**: If you are using the [command-line interface (CLI) tools](/cli/), you must set this address manually.  If you are using the [management console](/mc/), this is set by default.
* In rare cases, after successfully launching an instance `SSH` may not function. <br>
    *Workaround*: Reboot the instance.


<!--##Resolved Issues in Version 13.5## {#v135resolved}

The following are resolved issues in version 13.5 of the HP Public Cloud software:

* items
-->

<!--##Release notes for individual products and services## {#otherReleaseNotes}

While these release notes contain information information for the software package as a whole, we also provide you with release notes for individual products and services:

* [Ruby Fog Bindings](/binding/fog/release-notes/)
* [UNIX command-line interface (CLI)](/cli/unix/release-notes/)
* [Windows PowerShell CLI](/cli/windows/release-notes/)
-->

##For further information## {#seealso}

* For an overview of the 13.5 release set, take a look at the [HP Cloud version 13.5 overview](/version-overview/)
* For an overview of the 13.5 API specifications, see [HP Cloud Service APIs (v13.5)](/api/v13/)
* For a discussion of our various products and services, see [the main HP Cloud web site](https://www.hpcloud.com/#)
* For details on the management console, see the [Management console overview](/mc/)
* For HP Cloud support, go to our [support page](https://www.hpcloud.com/support)
