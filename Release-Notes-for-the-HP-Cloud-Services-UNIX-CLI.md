---
layout: default
title: "Release Notes for the HP Cloud Services UNIX CLI"
permalink: /cli/unix/release-notes/

---
# Release Notes for the HP Cloud Services UNIX CLI

These are the release notes for the HP Cloud services UNIX CLI.  The current release number for the [UNIX CLI software](/cli/unix) is version 1.2.0, released on 10/22/2012.  These release notes contain the following information:

* [Release 1.2.0 Information](#1.2.0)
* [Release 1.1.0 Information](#1.1.0)
* [Release 1.0.1 Information](#1.0.1)
* [Release 0.0.15 Information](#0.0.15)

##Release 1.2.0 Information## {#1.2.0}

Released on 10/22/2012.

###New Features###

* Requires [Fog v0.0.17](/bindings/fog/install)
* Support for adding Windows servers from existing windows images 
* Support for creating and removing server image snapshots
* Support for creating a [Temporary URL](/cli/unix/object-storage#TmpurlCommand) for a file or object for sharing purposes
* Generated reports and CLI arguments have been standardized for the following:
  - addresses
  - flavors
  - keypairs
  - security groups
  - servers
  - object store commands

###Known Issues###

None in this release.

###Resolved Issues in Version 1.2.0###

None in this release.

##Release 1.1.0 Information## {#1.1.0}

###New Features###

* The following additions and modifications to the `config:list` command to support multiple account files:
  - `account:list` command that lists accounts and shows account settings
  - `account:update` command to modify accounts settings
  - `account:remove` command to remove accounts
  - `account:use` command to makes the specified account default
  - `account:copy` command to copy an account file
* `-a` option to select an account on which to perform tasks
* `config:set` command now accepts name value pairs
* `config:list` command added to allow you to display the current configuration
* `cdn:containers` command modified so that the `-l` option generates the long listing of containers

###Known Issues###

None in this release.

###Resolved Issues in Version 1.1.0###

* Mime type detection error, which could cause a non-text file (for example a `.js` file) to be incorrectly identified as text file, has been fixed
* Copy/move operation now functional in Ruby v1.8.7

##Release 1.0.1 Information## {#1.0.1}

###New Features###

* Support for listing, adding, attaching, detaching and removing block volumes
* Progress bar added for file copy local to remote and remote to local
* Support for adding, updating, and deleting metadata for images and servers
* Support for recursive copy of directories from local to remote, from remote to local, and from remote to remote
* Support for specifying multiple files on a copy command line using wildcards

###Known Issues###

* Copy/move operation not functional in Ruby v1.8.7

###Resolved Issues in Version 1.0.1###

* Some performance improvements with storage container access
* Removed deprecation message for ruby-progressbar by using version 0.0.10. If running hpcloud v1.0.0, need to manually uninstall ruby-progressbar gem before installing hpcloud v1.0.1 - *gem uninstall ruby-progressbar*

##Release 0.0.15 Information## {#0.0.15}

###New Features###

* Optional switch added to all commands to specify availability zone
* New command config added to list the existing configuration settings
* Support for availability zone 3 (AZ3) and future availability zones for all services added
* Option to add a security group rule by using a source group added

###Known Issues###

None in this release.

###Resolved Issues in Version 0.0.15###

* When either storage or compute is deactivated, you can not connect to the account using the `hpcloud account:setup` command.