---
layout: default
title: "Release Notes for the HP Cloud Ruby Fog Binding"
permalink: /bindings/fog/release-notes/
product: fog

---
# Release Notes for the HP Cloud Ruby Fog Binding

These are the release notes for the HP Cloud Ruby Fog bindings.  The current release number for the [HP Cloud Ruby Fog software bindings](/bindings) is version 0.0.20, released on Mar. 15th, 2013.  These release notes contain the following information:

* [Release 0.0.22 Information](#v0022)
* [Release 0.0.21 Information](#v0021)
* [Release 0.0.20 Information](#v0020)
* [Release 0.0.19 Information](#v0019)
* [Release 0.0.18 Information](#v0018)
* [Release 0.0.17 Information](#v0017)
* [Release 0.0.16 Information](#v0016)
* [Release 0.0.15 Information](#v0015)

To install and use HP Cloud Ruby bindings for Fog, please install the [latest release](http://fog.io) of Fog.

##Latest Release
The HP Cloud Ruby Fog bindings has been feature-merged with upstream [Fog](http://fog.io) version 1.18.0. Note that the downloadable 'hpfog' gem versions has been **deprecated**. All further updates and issues will be maintained at the main [Fog repo](https://github.com/fog/fog).

This release was made available on 10/31/2013 and contains the following new features:

* Feature merge with upstream Fog
* Deprecated 'hpfog' gem and released HP Cloud Ruby Bindings as part of Fog release v1.18.0

###Known Issues###

None in this release.

##Release 0.0.22 Information## {#v0022}

This release was made available on 10/16/2013 and contains the following new features:

* Support for new LoadBalancer provider
* Support for new DNS provider

###Known Issues###

None in this release.

##Release 0.0.21 Information## {#v0021}

This release was made available on 06/11/2013 and contains the following new features:

* Support for new Networking (Neutron) provider (Grizzly release)
* Support for new Compute V2 provider (Grizzly release)
* Support for new BlockStorage V2 (Cinder) provider (Grizzly release)
* Support for caching auth credentials
* Support for filtering queries for all new V2 collections
* Support for side by side usage of both Compute and BlockStorage, V1/V2 providers

###Known Issues###

None in this release.

##Release 0.0.20 Information## {#v0020}

This release was made available on 03/15/2013 and contains the following new features:

* Support for `Accept` header for all requests with *application/json* added
* Support for `user_data` when creating servers using the compute service added
* Support for one and two way container synchronization in object storage service added

This version of the HP Cloud Ruby Fog bindings has been feature-merged with [Fog version 1.10.0](http://github.com/fog/fog).

###Known Issues###

None in this release.


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
