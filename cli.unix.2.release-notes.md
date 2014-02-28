---
layout: default
title: "Release Notes for the HP Cloud UNIX CLI"
permalink: /cli/unix/2/release-notes/
product: unix-cli

---
#HP Cloud UNIX CLI Release Notes

The current release number for the [UNIX CLI software](/cli/unix) is version 2.0.0, released on 08/28/13.

* [Release 2.0.0 Features](#v2_0_0)
* [Release 1.9.0 Features](#v1_9_0)
* [Release 1.8.0 Features](#v1_8_0)
* [Release 1.7.0 Features](#v1_7_0)
* [Release 1.6.0 Features](#v1_6_0)
* [Release 1.5.0 Features](#v1_5_0)

##Release 2.0.0 Features## {#v2_0_0}

The 2.0.0 release is available for download from [https://docs.hpcloud.com/file/hpcloud-2.0.0.gem](/file/hpcloud-2.0.0.gem) and contains the following new features:

* Support for additional networking functionality, including the following commands:
  - `networks` commands
  - `routers` commands
  - `ports` commands
  - `subnets` commands
* Support for load balancer as a service (LBaaS) with the `lb` commands
* Personality support for `servers:add`
* Extended command functionality:
  - The `containers:sync` command now takes a container or location for destination
  - The `servers:limits` command is now available to print compute limits
  - The `servers:ratelimits` command in now available to print compute limits
  - `metadata` and `metadata:set` can now show and set object metadata 
  - The `--userpass option` is now available to `account:setup` and `account:edit`, allowing authentication via user name and password rather than authentication keys

###Known Issues###

* The `volumes` (list) command no longer contains the `--bootable option` 
* The v3 identity servers are not supported by this release
* The cdn:containers:get method now prints name and value rather than just value.

##Release 1.9.0 Features## {#v1_9_0}

The 1.9.0 release is available for download from [https://docs.hpcloud.com/file/hpcloud-1.9.0.gem](/file/hpcloud-1.9.0.gem).  This release was made available on 5/15/2013 and contains the following new features:

* Support for domain name service (DNS)
* New `account:catalog` command dumps the service catalog for the given account
* Default availability zone is now the alphabetically-first zone in the service catalog.

###Known Issues###

* Support for availability zones in the `config.yml` file is deprecated.  Support for that future will be removed in the future.  There are no longer any hard-coded default zones in the configuration.

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
