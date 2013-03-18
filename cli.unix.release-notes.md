---
layout: default
title: "Release Notes for the HP Cloud Services UNIX CLI"
permalink: /cli/unix/release-notes/
product: unix-cli

---
These are the release notes for the HP Cloud services UNIX CLI.  The current release number for the [UNIX CLI software](/cli/unix) is version 1.7.0, released on 03/18/13.

* [Release 1.7.0 Features](#v1_7_0)
* [Release 1.6.0 Features](#v1_6_0)
* [Release 1.5.0 Features](#v1_5_0)
* [Release 1.4.0 Features](#v1_4_0)
* [Release 1.3.0 Features](#v1_3_0)

#HP Cloud Services UNIX CLI Release Notes

##Release 1.7.0 Features## {#v1_7_0}

The 1.7.0 release is available for download from https://docs.hpcloud.com/file/hpcloud-1.7.0.gem.  This release was made available on 3/1/2013 and contains the following new features:

* Support for large file uploads greater than 5 gigabytes added
* Option `-r` (retry) for large file uploads added
* Option `-c` option added to most reports so you can specify the columns they want to see
* Option `-d` option added to most reports so you can specify the column delimiter for reports
* Option `-l` added to provide a long listing for containers and their contents
* New containers:sync command for container replication

###Known Issues###

* None for this release.

##Release 1.6.0 Features## {#v1_6_0}

The 1.6.0 release is available for download from https://docs.hpcloud.com/file/hpcloud-1.6.0.gem.  This release was made available on 1/30/2013 and contains the following new features:

* Compatibility with the 0.0.19 Ruby Fog release included
* Command `servers:ssh` supports using an IP address in addition to the server name or ID added
* Several minor bug fixes included

###Known Issues###

* None for this release.

##Release 1.5.0 Features## {#v1_5_0}

The 1.5.0 release is available for download from https://docs.hpcloud.com/file/hpcloud-1.5.0.gem.  This release was made available on 1/18/2013 and contains the following new features:

* Command `complete` added to install a bash completion file to allow you to tab complete hpcloud commands
* Option `--debug` added to most commands to produce verbose trace
* Option `--source-account` added to the `copy` command to allow files to be copied from one account to another.
* Command `migrate` added to allow object store migration from different providers.
* Option `--provider` added to the `account:setup` command to allow you to supply providers other than HP for migration.

###Known Issues###

* None for this release.

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
