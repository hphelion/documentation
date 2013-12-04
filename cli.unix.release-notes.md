---
layout: default
title: "Release Notes for the HP Cloud UNIX CLI"
permalink: /cli/unix/release-notes/
product: unix-cli

---
#HP Cloud UNIX CLI Release Notes

###Important Notice###

On November 4, 2013, the UNIX CLI was moved into its End-of-Life (EOL) Cycle process toward final deprecation. Please be aware that this does not mean that the UNIX CLI is "going away", but simply that HP Cloud is relinquishing its ownership of this CLI and, instead, making it available on the [HPCloud Github](https://github.com/hpcloud/unix_cli) repository. We encourage our existing customers to eventually consider migrating to the OpenStackClient (Unified) CLIs. As such, during this 6-month transition timeframe, HP Cloud will be dedicating engineering efforts around the OpenStackClient CLI as the primary Unified CLI of choice for development around your OpenStack cloud services.

We wanted to ensure you were aware of the changes that may affect you during this 6-month transition time:

+ The UNIX CLI has moved to the HP Cloud Github repository

  + In order to encourage development by the community, HP Cloud is sharing it with the community as open source, hosted on [https://github.com/hpcloud/unix_cli](https://github.com/hpcloud/unix_cli). 
  + However, [links to 12.12 and 13.5 UNIX CLI downloads](/cli/unix/#downloads), and all documentation, are still currently available on docs.hpcloud.com, as usual.
+ Bugs will be addressed

  + Although the CLI has moved into the open source community, showstoppers and significant defects will be examined and addressed by the HP Cloud SDK/CLI team on a case-by-case basis.

After 6 months, access to online resources will be available through GitHub, and no support will be offered from HP Public Cloud. Of course, you are most welcome to access the install from GitHub and continue your development.

_________________________________________

These are the release notes for the HP Cloud UNIX CLI.  The current release number for the [UNIX CLI software](/cli/unix) is version 1.9.1, released on 05/15/13.

<!-- * [Release 2.0.0 Features](#v2_0_0) -->

* [Release 1.9.1 Features](#v1_9_1)
* [Release 1.8.0 Features](#v1_8_0)
* [Release 1.7.0 Features](#v1_7_0)
* [Release 1.6.0 Features](#v1_6_0)
* [Release 1.5.0 Features](#v1_5_0)
* [Release 1.4.0 Features](#v1_4_0)
* [Release 1.3.0 Features](#v1_3_0)

<!-- ##Release 2.0.0 Features## {##v2_0_0)

The 2.0.0 release is available for download from [https://docs.hpcloud.com/file/hpcloud-2.0.0.gem](/file/hpcloud-2.0.0.gem).  This release was made available on 6/15/2013 and contains the following new features:

* Support for next generation networking cloud added, including the following features:
  - `networks` commands
  - `routers` commands
  - `ports` commands
  - `subnets` commands
* Support for load balancer as a service (LBaaS) with the `lb` commands
* Personality support for `servers:add`
* The `containers:sync` command now takes a container or location for destination
* The `servers:limits` command was added to print comput limits
* The `servers:ratelimits` command was added to print comput limits
* Object metadata can now be shown and set with `metadata` and `metadata:set`
* Added --userpass option to account:setup and account:edit to allow authentication via user name and password rather than authentication keys.

###Known Issues###

* The `--bootable option` has been removed from the `volumes` (list) command
* The v3 identity servers are not supported by this release

-->

##Release 1.9.1 Features## {#v1_9_1}

The 1.9.1 release is available for download from [https://docs.hpcloud.com/file/hpcloud-1.9.1.gem](/file/hpcloud-1.9.1.gem).  This release was made available on 5/15/2013 and contains the following new features:

* Support for domain name service (DNS)
* New account:catalog command dumps the service catalog for the given account
* Default availability zone is now the alphabetically first zone in the service catalog.

###Known Issues###

* Support for availability zones in the config.yml file is deprecated.  Support for that future will be removed in the future.  There are no long hard coded default zones in the configuration.

##Release 1.8.0 Features## {#v1_8_0}

The 1.8.0 release is available for download from [https://docs.hpcloud.com/file/hpcloud-1.8.0.gem](/file/hpcloud-1.8.0.gem).  This release was made available on 4/15/2013 and contains the following new features:

* Support for the `after` and `at` options for the `remove` command added

###Known Issues###

* None for this release.


##Release 1.7.0 Features## {#v1_7_0}

The 1.7.0 release is available for download from https://docs.hpcloud.com/file/hpcloud-1.7.0.gem.  This release was made available on 3/1/2013 and contains the following new features:

* Support for large file uploads greater than 5 gigabytes added
* Option `-r` (retry) to `copy` command for large file uploads added
* Option `-c` option added to most reports so you can specify the columns they want to see
* Option `-d` option added to most reports so you can specify the column delimiter for reports
* Option `-l` added to provide a long listing for containers and their contents
* Option `-u` added to `servers:add` to pass user data to a new server for custom configuration
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
* Commands `acl:grant` and `acl:revoke` added to provide support for cross-project access control lists (ACLs)
* Command `volumes:add` added to provide support for bootable volume creation
* Command `servers:add` added to provide support for creating a server from a bootable volume

**Note**: This release of the UNIX CLI requires the [Ruby Fog v0.0.18](https://docs.hpcloud.com/bindings/fog/install) binding.

###Known Issues###

* The syntax of the `servers:add` command has changed; you must pass in an image or volume with the `-i` or `-v` option, respectively
* Command `acl` displays data as a table
