---
layout: default
title: "Release Notes for the HP Cloud Services Windows PowerShell CLI"
permalink: /cli/windows/release-notes/
product: win-cli

---
# Release Notes for the HP Cloud Services Windows PowerShell CLI

These are the release notes for the HP Cloud services Windows PowerShell CLI.  The current release number for the [Windows PowerShell CLI software](/cli/windows) is version 1.3.2.2, released on 12/3/2012.  These release notes contain the following information:

<!--* [Release 1.3.2.2 Features](#v1322)-->
* [Release 1.3.1.9 Features](#v1319)
* [Release 1.3.0.6 Features](#v1306)
* [Release 1.3.0.1 Features](#v1301)
* [Release 1.2.0.6 Features](#v1206)
* [Release 1.2.0.1 Features](#v1201)

[Please download the latest version of the Windows PowerShell CLI software here](https://docs.hpcloud.com/file/WinCLI-1.3.1.9.zip)!


<!--##Release 1.3.2.2 Features## {#v1322}

This release was made available on 12/3/2012 and contains the following new features:

* The `Connect-Server` cmdlet now works with non-Windows instances in conjunction with *putty.exe*.
* New argument for `Get-Zones` cmdlet. Adding `–v` will return more details about each zone including containers in that zone and available services. Example: `get-zones -v`.
* The `Set-Zone` cmdlet shows more details about the newly selected zone including containers in that zone and the available services.

##Known Issues##

* **Resolved**: You can now add a new security group rule to an existing security group.
* **Resolved**: The server keyname is now displayed when you list the available servers.-->

##Release 1.3.1.9 Features## {#v1319}

This release was made available on 10/29/2012 and contains the following new features:

* Support for temporary URLs via new attributes for the cmdlet `[get-uri](/cli/windows/reference#ObjectStorage)`.
* Support for wild cards for Object-Storage with the commands, `[ls, del, copy](/cli/windows/reference#ObjectStorage)`.
* Support for [Windows images](/cli/windows/compute#CreateanImageofaServer)
* Added cmdlet `[connect-server](/cli/windows/reference#Compute)` to quick-connect to Windows Instances
* Added cmdlet `[get-limits](/cli/windows/reference#Compute)` to show Compute quota information
* Added cmdlet `[ping-server](/cli/windows/reference#Compute)`.
* Added cmdlet `[get-password](/cli/windows/reference#Compute)` for recovering of Administrator password for Windows Instances
* Support for syncing Windows Administrator password for cmdlet `[reset-password](/cli/windows/reference#Compute)`

###Known Issues###

* **Issue**: You cannot add a new security group rule to an existing security group.  
    *WorkAround*: Use the [console](https://console.hpcloud.com) to make this change.

##Release 1.3.0.6 Features## {#v1306}

This release was made available on 9/6/2012 and contains the following new features:

* Support for changing the color assigned to an availability zone.

###Known Issues###

None this release.

##Release 1.3.0.1 Features## {#v1301}

This release was made available on 8/28/2012 and contains the following new features:

* Support for listing, adding, attaching, detaching and removing block volumes
* Support for creating and removing block storage snapshots

###Known Issues###

* **Resolved**: You can now access the keypair information from the command-line interface (CLI).

##Release 1.2.0.6 Features## {#v1206}

###New Features###

* *Migrate-Drive*: This object storage command gives you the capability to migrate existing stores of data from external sources like S3, Dropbox and Skydrive to a target Container within HP Object Storage, saving you the trouble of having to do it by hand or (worse) one file at a time.  Take a look at [Travis' blog post](http://h30529.www3.hp.com/t5/HP-Scaling-the-Cloud-Blog/Migrating-your-files-with-the-Windows-CLI/ba-p/523) on this feature for more info.

###Known Issues###

None this release.

##Release 1.2.0.1 Information## {#v1201}

###New Features###

* *Nova compute*: Full access to the OpenStack Nova compute infrastructure via the Windows command line, allowing you to manage and manipulate servers, flavors, images, keypairs, security groups, and so on.
* *CDN*: Support through the CLI for the HP Cloud Services content delivery network (CDN), providing you with distributed caching of object storage objects on geographically dispersed caching servers. Copies of the object are stored at a location more convenient to the end user system, allowing for better performance.

###Known Issues###

* **Issue**: You cannot access the keypair information from the command-line interface (CLI).  
    *WorkAround*: Access the keypair information through the management console.