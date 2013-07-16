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

* items


##Known issues and limitations in version 13.5 (beta)## {#v135issues}

The following are known issues and limitation for version 13.5 of the HP Public Cloud software:

* **Limitation**: When simultaneously launching instances, you are limited to 49 instances or less.  We recommend that you stagger your launch of multiple instances for best performance.
* **Limitation**: When passing through a router to move off your local network, your throughput speed is limited to approximately 150 megabits per second.
* **Limitation**: Snapshot support is not yet available for `standard.4xlarge` and `standard.5xlarge` instances.
* **Limitation**: Do not delete egress rules from your security group; this removes the ability of your VM to access any external nodes (including fetching metadata required by your SSH key), causing newly-booted VMs to be unusable.
* **Limitation**: Snapshot support for a virtual machine (VM) booted from a block volume is not yet available.<br>
    *Workaround*: Shut down the volume and start a new instance to take your snapshot.
* **Limitation**: Instances are not currently able to access a DNS server as their default.<br>
    *Workaround*: To resolve an external address, provide the IP address of an appropriate DNS server when you create or update a subnet.  You can use any external DNS server; HP also provides the server at IP address `206.164.176.34` in AE1 for your use.  **Note**: If you are using the [command-line interface (CLI) tools](/cli/), you must set this address manually.  If you are using the [management console](/mc/), this is set by default.
* **Issue**: In rare cases, after successfully launching an instance `SSH` may not function. <br>
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

* For an overview of our technical documentation set, take a look at the [Getting started with HP Cloud services page](/)
* For a discussion of our various products and services, see [the main HP Cloud web site](https://www.hpcloud.com/#)
* For more information on the CLI, please see the [HP Cloud CLI overview page](/cli/)
* For details on the management console, see the [Management console overview](/mc/)
* For a full list of available technical documentation, see [our site map](/sitemap/)
* For HP Cloud support, go to our [support page](https://www.hpcloud.com/support)
