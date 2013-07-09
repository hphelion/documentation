---
layout: default
title: "HP Cloud Release Notes"
permalink: /release-notes/

---
# HP Cloud Release Notes

You know the problem:  you see the phrase "release notes" and you immediately think "boring bug list".  But you're in luck!  This page--the release notes for the HP Public Cloud software--<i>does</i> contain list of bugs, but we have worked hard to keep it from being boring, and to make it easier for you to navigate and locate the information you're looking for.  We have also included information about the new features for each release, links to the most current release, and a few other items here and there that we hope will be helpful for you.  And if you have any genius ideas for making it easier to use, please tell us; we <i>want to know</i>. 

This page contains the following information on our software package:

* [New features in version 13.5](#v135limitations)
* [Known issues in version 13.5](#v135issues)
* [Resolved issues in version 13.5](#v135resolved)
* [Release notes for individual products and services](#otherReleaseNotes)
* [For further information](#seealso)


##New Features in Version 13.5## {#v135features}

The following are new features in version 13.5 of the HP Public Cloud software:

* items


##Known issues and limitations in version 13.5 (beta)## {#v135issues}

The following are known issues and limitation for version 13.5 of the HP Public Cloud software:

* **Limitation**: When simultaneously launching instances, you are limited to 49 instances or less.  We recommend that you stagger your launch of multiple instances for best performance.
* **Limitation**: When passing through a router to move off your local network, your throughput speed is limited to approximately 150 megabits per second.
* **Limitation**: Snapshot support is not yet available for `standard.4xlarge` and `standard.5xlarge` instances.
* **Limitation**: Do not delete egress rules from your security group; this removes the ability of your VM to access any external nodes (including fetching metadata required by your SSH key), causing newly-booted VMs to be unusable.
* **Issue**: In rare cases, after successfully launching an instance `SSH` may not function. 
    *Workaround*: Reboot the instance.


###Resolved Issues in Version 13.5## {v135resolved}

The following are resolved issues in version 13.5 of the HP Public Cloud software:

* items


##Release notes for individual products and services## {#otherReleaseNotes}

While these release notes contain information information for the software package as a whole, we also provide you with release notes for individual products and services:

* [Ruby Fog Bindings](/binding/fog/release-notes/)
* [UNIX command-line interface (CLI)](/cli/unix/release-notes/)
* [Windows PowerShell CLI](/cli/windows/release-notes/)


##For further information## {#seealso}

* pointers to other key places in the doc set
