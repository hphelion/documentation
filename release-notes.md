---
layout: default
title: "HP Cloud Release Notes"
permalink: /release-notes/

---
# HP Cloud Release Notes

You know the problem:  you see the phrase "release notes" and you immediately think "boring bug list".  But you're in luck!  This page--the release notes for the HP Public Cloud software--<i>does</i> contain list of bugs, but we have worked hard to keep it from being boring, and to make it easier for you to navigate and locate the information you're looking for.  We have also included information about the new features for each release, links to the most current release, and a few other items here and there that we hope will be helpful for you.  And if you have any genius ideas for making it easier to use, please tell us; we <i>want to know</i>. 

This page contains the following information on our software package:

* [Release information for version 13.5](#v135Info)
* [For further information](#SeeAlso)

<!--Moving forward, there will be more bulleted items for each release-->

##Information for version 13.5## {#v135Info}

This section includes the following information for version 13.5 of the HP Cloud services software:

* [New features in version 13.5](#v135features)
* [Known issues in version 13.5](#v135issues)

<!--* [Resolved issues in version 13.5](#v135resolved)-->


###New Features in Version 13.5### {#v135features}

The following are new features in version 13.5 of the HP Public Cloud software:

* *Larger compute instances for big data and high-performance computing is now supported*.  Access to new larger instance types allows you to run big data, analytics and high performance computing (HPC) workloads in the public cloud.  You can access instances with up to 120 GB of RAM and up to 16 virtual cores. The new instance types allow you to choose the virtual machine size that best fits your application's needs.
* *New virtual private cloud (VPC) networking capabilities*.  The new VPC functionality provides you with advanced security in the public cloud by allowing you to create your own isolated virtual network within the HP Cloud compute service. Using a Software Defined Networking (SDN) stack, this service allows you to select whether or not your public cloud network instances are also accessible from the internet. This network isolation offers an additional layer of security to cloud deployments. You can also connect your public cloud network to your on-premise network, treating private and public infrastructures as a single connected system.
* *Faster and simpler custom image upload*.  Increases productivity by offering simplified set up and deployment of new instances. You can now create your own images outside of the HP Cloud and upload them to the HP Cloud image management service to use as a starting point for creating new instances. HP Cloud services also provide a wide variety of preconfigured images, allowing you to create images from your running instances to produce new instances.
* *Faster data upload to the cloud*.  A new bulk import service reduces the time to market for applications requiring existing data by allowing you to quickly and easily load your data into HP Cloud block storage or HP Cloud object storage. The new service bypasses the process of transferring large amounts of information over the Internet and allows you to provide hard drives directly to HP's data centers where your data can be rapidly transferred.


###Known issues in version 13.5### {#v135issues}

The following are known issues and limitation for version 13.5 of the HP Public Cloud software:

* If attempting to simultaneously launch a larger number of instances, some instances may go into an error state. Currently, we recommend you stagger your launch of multiple instances to batches of 30-40 at a time for best performance.
* When passing through a router to move off your local network, your throughput speed is limited to approximately 1500 megabits per second.
* Snapshot support is not yet available for `standard.4xlarge` and `standard.5xlarge` instances.
* Do not delete egress rules from your security group; this removes the ability of your VM to access any external nodes (including fetching metadata required by your SSH key), causing newly-booted VMs to be unusable.
* Snapshot support for a virtual machine (VM) booted from a block volume is not yet available.<br>
    *Workaround*: Shut down the virtual machine (VM), then delete the VM and wait until the volume is marked as "available". Take a snapshot of the volume using, for instance, the python cinder binding. Once the snapshot is complete, re-create the VM from the volume, and re-attach the original floating IP if necessary. **Note**: The port/fixed-IP associated to the new VM may be different from the original one.
* Jclouds is supported for Keystone version 2 API and earlier only.
* In rare cases, after successfully launching an instance `SSH` may not function. <br>
    *Workaround*: Reboot the instance.
* Windows instances with attached volumes in US East are not accessible directly or via `ssh`. <br>
    *Workaround*: Use Windows instances without attached volumes.
* In some cases, you may be unable to connect to a VNC URL. <br>
    *Workaround*: Connect using other clients such as `ssh`, `putty`, or RDP.

<!--##Resolved Issues in Version 13.5## {#v135resolved}

The following are resolved issues in version 13.5 of the HP Public Cloud software:

* items
-->

##For further information## {#SeeAlso}

* See [HP Cloud version 13.5 overview](/version-overview/) for an overview of the 13.5 release set
* See [HP Cloud Service APIs (v13.5)](/api/v13/) for an overview of the 13.5 API specifications
* See [migration overview page](/migration-overview/) for information on migrating from version 12.12 to 13.5
* See [Getting Started with Compute 13.5](https://community.hpcloud.com/article/getting-started-compute-135) for information on how to get started with the compute service in version 13.5
* Speaking of which, the overall [Getting Started Guide](https://community.hpcloud.com/article/getting-started-guide/) is a great resource for getting yourself up and running with the various HP Cloud services in general
* See the [main HP Cloud web site](https://www.hpcloud.com/#) for a discussion of our various products and services
* See the [Management console overview](/mc/) for details on the web-based management console interface
* Go to our [support page](https://www.hpcloud.com/support) if you are seeking support information

While these release notes contain information information for the software package as a whole, we also provide you with release notes for individual products and services:

* [Ruby Fog Bindings](/binding/fog/release-notes/)
* [UNIX command-line interface (CLI)](/cli/unix/release-notes/)
* [Windows PowerShell CLI](/cli/windows/release-notes/)
