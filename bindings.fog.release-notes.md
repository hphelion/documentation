---
layout: default
title: "Release Notes for the HP Cloud Services Ruby Fog Binding"
permalink: /bindings/fog/release-notes/
product: fog

---
# Release Notes for the HP Cloud Services Ruby Fog Binding

These are the release notes for the HP Cloud services Ruby Fog bindings.  The current release number for the [HP Cloud Services Ruby Fog software bindings](/bindings) is version 0.0.19, released on Jan. 25th, 2013.  These release notes contain the following information:

* [Release 0.0.19 Information](#v0019)
* [Release 0.0.18 Information](#v0018)
* [Release 0.0.17 Information](#v0017)
* [Release 0.0.16 Information](#v0016)
* [Release 0.0.15 Information](#v0015)

[You can download the latest version of the Ruby Fog bindings software here](/file/hpfog-0.0.19.gem)!

##Release 0.0.19 Information## {#v0019}

This release was made available on 01/25/2013 and contains the following new features:

* Block Storage namespace updated to `Fog::HP::BlockStorage` instead of `Fog::BlockStorage::HP`
* Variable `:hp_account_id` deprecated in favor of `:hp_access_key` in the service connection call
* Issue with a temporary URL to use a signer that is backward compatible to 1.8.7 fixed
* Issue in the storage provider with a service catalog having an invalid CDN endpoint fixed
* Updated to include the upstream changes from `fog v1.9.0`

###Known Issues###

None in this release.


##Release 0.0.18 Information## {#v0018}

This release was made available on 12/3/2012 and contains the following new features:

* Support for using access control lists (ACLs) to share objects and containers
* Support for bootable volumes and persistent instances

###Known Issues###

None in this release.


##Release 0.0.17 Information## {#v0017}

This release was made available on 10/19/2012 and contains the following new features:

* Support for creating a temporary URL for a file or object for sharing purposes
* Support for creating a new Windows server instance

###Known Issues###

None in this release.


##Release 0.0.16 Information## {#v0016}

This release contains the following new features:

* Support for `user_agent` string in the header added.  You can use a client application to set a User-Agent via the provider, so that the calling client can be identified.
* Block storage support added.  See [the block storage examples](/bindings/fog/block-storage) page for details.
* Snapshot support in block storage added. 
* Volume support in block storage added.
* `put_object` and `get_object` updated to accept blocks for block storage. You can create and retrieve storage objects in smaller chunks and display the progress of the operation.
* Method for gathering information about storage containers using the headers (rather than retrieving container contents) added. 
* Software updated to include `excon` version 0.14.3 to take advantage of instrumentation.  You can pass in a Instrumentor to provide instrumentation information about each call made via the hpfog library.  

###Known Issues###

None in this release.


##Release 0.0.15 Information## {#v0015}

This release contains the following new features:

* <i>Availability Zones</i>: You are required to set an availability zone to establish a connection; there is no default availability zone.
* <i>MetaData</i>: The following features related to metadata have been added:
    - New metadata attribute added in the server and image models to help manage metadata
    - New metadata model and request layer functionality with mocking support
    - New metadata tests- upgrade to excon 0.13.4 to take advantage of SSL pass-through functionality
* New `security_groups` attribute added to the server model.
* Support for future availability zones for all HP services added.
* Parameter `hp_avl_zone` is now a required parameter for all HP services.
* Support for console output in the [Compute](/bindings/fog/compute) service added.
* Helper method for the [CDN](/bindings/fog/cdn) public SSL URL added.
* Tests added for [Storage](/bindings/fog/object-storage), [Compute](/bindings/fog/compute) and [CDN](/bindings/fog/cdn) services.
* Quality of mocks modified to match implementation.

###Known Issues###

None in this release.
