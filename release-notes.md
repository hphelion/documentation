---
layout: default
title: "HP Cloud Release Notes"
permalink: /release-notes/

---
# HP Cloud Release Notes

You know the problem:  you see the phrase "release notes" and you immediately think "boring bug list".  But you're in luck!  This page--the release notes for the HP Cloud software--<i>does</i> contain list of bugs, but we have worked hard to keep it from being boring, and to make it easier for you to navigate and locate the information you're looking for.  We have also included information about the new features for each release, links to the most current release, and a few other items here and there that we hope will be helpful for you.  And if you have any genius ideas for making it easier to use, please tell us; we <i>want to know</i>. 

These release notes contains information on the following topics; click on the links to scroll down:

* [Ruby Fog Bindings](#RubyFogBindings)
* [UNIX Command-Line Interface (CLI)](#UNIXCLI)
* [Windows PowerShell CLI](#WindowsPowerShellCLI)
* [Compute Images Information](#ComputeImagesInformation)

<!--Doug: section for APIs?-->

<h2 id="RubyFogBindings">Ruby Fog Bindings</h2>

The current release number for the [HP Cloud Services Ruby Fog software bindings](/bindings) is version 0.0.15, released on 6/8/2012.  ([Download the current software for Ruby Fog](/bindings/fog/install))

###New Features in Version 0.0.15

* <i>Availability Zones</i>: You are required to set an availability zone to establish a connection; there is no default availability zone.
* <i>MetaData</i>: The following features related to metadata have been added:
    - New metadata attribute added in the server and image models to help manage metadata
    - New metadata model and request layer functionality with mocking support
    - New metadata tests- upgrade to excon 0.13.0 to take advantage of ssl passthru functionality
* New <font family="Courier">security_groups</font> attribute added to the server model
* Support for future availability zones for all HP services added
* The parameter <font family="Courier">hp_avl_zone</font> is now a required parameter for all HP services
* Support for console output in the [Compute](compute) service has been added
* A helper method for the [CDN](cdn) public SSL URL has been added
* Tests added for [Storage](object-storage), [Compute](compute) and [CDN](cdn) services
* Quality of mocks modified to match implementation

###Known Issues

None in this release.

###Resolved Issues in Version 0.0.15

None in this release.


<h2 id="UNIXCLI">UNIX Command-Line Interface (CLI)</h2>
The current release number for the [UNIX CLI software](/cli/unix) is version 0.0.15, released on 6/8/2012.  ([Download the current software](/cli/unix/install))

###New Features in Version 0.0.15

* Optional switch added to all commands to specify availability zone
* New command config added to list the existing configuration settings
* Support for availability zone 3 (AZ3) and future availability zones for all services added
* Option to add a security group rule by using a source group added

###Known Issues

None in this release.

###Resolved Issues in Version 0.0.15

* When either storage or compute is deactivated, you can not connect to the account using the <font face="Courier">hpcloud account:setup</font> command.

<h2 id="WindowsPowerShellCLI">Windows PowerShell (CLI)</h2>
The current release number for the [Windows PowerShell CLI software](/cli/windows) is version 1.2.0.1, released on 5/16/2012.  ([Download the current software](/cli/windows/installation))

###New Features in Version 1.2.0.6
This release of the Windows PowerShell CLI includes the following new functionality:

* <i>Migrate-Drive</i>: This object storage command gives you the capability to migrate existing stores of data from external sources like S3, Dropbox and Skydrive to a target Container within HP Object Storage, saving you the trouble of having to do it by hand or (worse) one file at a time.  Take a look at [Travis' blog post](http://h30529.www3.hp.com/t5/HP-Scaling-the-Cloud-Blog/Migrating-your-files-with-the-Windows-CLI/ba-p/523) on this feature for more info.

###New Features in Version 1.2.0.1
This release of the Windows PowerShell CLI includes the following new functionality:

* <i>Nova compute</i>: Full access to the OpenStack Nova compute infrastructure via the Windows command line, allowing you to manage and manipulate servers, flavors, images, keypairs, security groups, and so on.
* <i>CDN</i>: Support through the CLI for the HP Cloud Services content delivery network (CDN), providing you with distributed caching of object storage objects on geographically dispersed caching servers. Copies of the object are stored at a location more convenient to the end user system, allowing for better performance.

###Known Issues
<b>Issue</b>: You cannot access the keypair information from the command-line interface (CLI). <br>
<i>WorkAround</i>:  Access the keypair information through the [management console](https://console.hpcloud.com/dashboard).

###Resolved Issues in Version 1.2.0.6

None in this release.


<!--#jclouds Bindings
The current release number for the [HP Cloud Services jclouds bindings](/bindings) is version XX, released on DATE.  ([Download the current software for jclouds](https://region-a.geo-1.objects.hpcloudsvc.com/v1.0/89388614989714/build-downloadables/jclouds-hpcloud-alpha1.zip))

###New Features in Version XX
List of features.

###Known Issues
List of bugs and workarounds


#Management Console
The current release number for the Management Console is version XX, released on DATE.  ([Access the Management Console](https://console.hpcloud.com/))

###New Features in Version XX
List of features.

###Known Issues
List of bugs and workarounds-->

<h2 id="ComputeImagesInformation">Compute Images Information</h2>

When you create a server through the compute [management console](https://console.hpcloud.com/compute), you need to select which software image you want to install and use when you create a new server instance.  This section provides you with some details of the various compute images available.

The images you can currently install are available by the drop-down menu on the compute page.  Follow the links to get more information on the image in which you are interested:

* [CentOS 5.6 Server 64-bit](http://wiki.centos.org/Manuals/ReleaseNotes/CentOS5.6)
* [CentOS 6.2 Server 64-bit](http://wiki.centos.org/Manuals/ReleaseNotes/CentOS6.2)
* [Debian Squeeze 6.0.3 Server 64-bit](http://www.debian.org/releases/squeeze/amd64/release-notes)
* [Fedora 16 Server 64-bit](http://docs.fedoraproject.org/en-US/Fedora/16/html/Release_Notes/index.html)

For information on the other images displayed in the menu (including the "Partner Images"), please see the appropriate third-party documentation or the [Knowledge Base](https://community.hpcloud.com/) for more information.
