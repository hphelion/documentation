---
layout: default
title: "Release Notes for the HP Cloud Services UNIX CLI"
permalink: /cli/unix/release-notes/
product: unix-cli

---
These are the release notes for the HP Cloud services UNIX CLI.  The current release number for the [UNIX CLI software](/cli/unix) is version 1.5.0, released on 01/14/13.

* [Release 1.5.0 Features](#v1_5_0)
* [Release 1.4.0 Features](#v1_4_0)
* [Release 1.3.0 Features](#v1_3_0)
* [Release 1.2.0 Features](#v1_2_0)
* [Release 1.1.0 Features](#v1_1_0)
* [Release 1.0.1 Features](#v1_0_1)
* [Release 0.0.15 Features](#v0_0_15)

##Release 1.5.0 Features## {#v1_5_0}

The 1.5.0 release is available for download from https://docs.hpcloud.com/file/hpcloud-1.5.0.gem.  This release was made available on 1/18/2013 and contains the following new features:

* Command `complete` to install a bash completion file to allow you to tab complete hpcloud commands
* Option `--debug` added to most commands to produce verbose trace
* Option `--source-account` added to the `copy` command to allow files to be copied from one account to another.
* Command `migrate` added to allow object store migration from different providers.
* Option `--provider` added to the `account:setup` command to allow you to supply providers other than HP for migration.

###Known Issues###

* None at this time

##Release 1.4.0 Features## {#v1_4_0}

The 1.4.0 release is available for download from https://docs.hpcloud.com/file/hpcloud-1.4.0.gem.  This release was made available on 12/11/2012 and contains the following new features:

* Command `servers:console` added to display the console of a server
* Command `servers:ssh` added to allow you to log in via secure shell to a server
* Command `keypairs:private` added to display the private keys known to the CLI
* Command `keypairs:private` added to display the private keys known to the CLI
* Command `keypairs:private:add` added to allow you to add a private key pair to the CLI
* Command `keypairs:private:location` added to display the physical location of a private key file
* Command `keypairs:private:remove` added to allow you to remove a private key
* Command `account:verify` added to allow you to verify an account file
* Command `account:edit` and `account:update` commands combined

###Known Issues###

* When the `-o` option is used to `keypairs:add` the private key is now stored in `~/.hpcloud/keypairs` directory instead of the current directory.

##Release 1.3.0 Features## {#v1_3_0}

This release was made available on 12/6/2012 and contains the following new features:

* Command `servers:rebuild` added
* Option `-m` added to the `copy` command to allow you to override the mime type
* Option `-s` added to the `cdn:containers:location` command to print the SSL and non-SSL URLs for CDN objects
* Commands `cdn:containers:add` and `cdn:containers:remove` now accept multiple arguments
* CLI help text significantly updated
* Default account can be set to any configured account
* Commands `acl:grant` and `acl:revoke` added to provide support for cross-tenant access control lists (ACLs)
* Command `volumes:add` added to provide support for bootable volume creation
* Command `servers:add` added to provide support for creating a server from a bootable volume

**Note**: This release of the UNIX CLI requires the [Ruby Fog v0.0.18](https://docs.hpcloud.com/bindings/fog/install) binding.

###Known Issues###

* The syntax of the `servers:add` command has changed; you must pass in an image or volume with the `-i` or `-v` option, respectively
* Command `acl` displays data as a table


##Release 1.2.0 Features## {#v1_2_0}

This release was made available on 10/22/2012 and contains the following new features:

* Support for adding Windows servers from existing windows images 
* Support for creating and removing server image snapshots
* Support for creating a [Temporary URL](https://docs.hpcloud.com/cli/unix/object-storage#TmpurlCommand) for a file or object for sharing purposes
* Generated reports and CLI arguments have been standardized for the following:
  - addresses
  - flavors
  - keypairs
  - security groups
  - servers
  - object store commands
  
**Note**: This release of the UNIX CLI requires the [Ruby Fog v0.0.17](https://docs.hpcloud.com/bindings/fog/install) binding.

###Known Issues###

* None for this release.


##Release 1.1.0 Features## {#v1_1_0}

This release contains the following new features:

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
* Fixed mime type detection error, which could cause a non-text file (for example a `.js` file) to be incorrectly identified as text file, has been fixed
* Copy/move operation now functional in Ruby v1.8.7


###Known Issues###

* None for this release.


##Release 1.0.1 Features## {#v1_0_1}

This release contains the following new features:

* Support for listing, adding, attaching, detaching and removing block volumes
* Progress bar added for file copy local to remote and remote to local
* Support for adding, updating, and deleting metadata for images and servers
* Support for recursive copy of directories from local to remote, from remote to local, and from remote to remote
* Support for specifying multiple files on a copy command line using wildcards
* Some performance improvements with storage container access
* Removed deprecation message for ruby-progressbar by using version 0.0.10. If running hpcloud v1.0.0, need to manually uninstall ruby-progressbar gem before installing hpcloud v1.0.1 - *gem uninstall ruby-progressbar*

###Known Issues###

* Copy/move operation not functional in Ruby v1.8.7


##Release 0.0.15 Features## {#v0_0_15}

This release contains the following new features:

* Optional switch added to all commands to specify availability zone
* New command config added to list the existing configuration settings
* Support for availability zone 3 (AZ3) and future availability zones for all services added
* Option to add a security group rule by using a source group added
* When either storage or compute is deactivated, you can now connect to the account using the `hpcloud account:setup` command.

###Known Issues###

* None for this release.
