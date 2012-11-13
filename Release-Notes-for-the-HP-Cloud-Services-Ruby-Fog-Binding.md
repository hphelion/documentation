---
layout: default
title: "Release Notes for the HP Cloud Services Ruby Fog Binding"
permalink: /bindings/fog/release-notes/

---
# Release Notes for the HP Cloud Services Ruby Fog Binding

These are the release notes for the HP Cloud services Ruby Fog bindings.  The current release number for the [HP Cloud Services Ruby Fog software bindings](/bindings) is version 0.0.17, released on Oct. 19th, 2012.  These release notes contain the following information:

* [Release 0.0.17 Information](#0.0.17)
* [Release 0.0.16 Information](#0.0.16)
* [Release 0.0.15 Information](#0.0.15)

##Release 0.0.17 Information## {#0.0.17}

###New Features in This Release###

* Support for creating a temporary URL for a file or object for sharing purposes
* Support for creating a new Windows server instance from an existing keypair

###Known Issues###

None in this release.

###Resolved Issues in Version 0.0.16###

None in this release.

##Release 0.0.16 Information## {#0.0.16}

###New Features in This Release###

* Support for `user_agent` string in the header added.  You can use a client application to set a User-Agent via the provider, so that the calling client can be identified.
* Block storage support added.  See [the block storage examples](/bindings/fog/block-storage) page for details.
* Snapshot support in block storage added. 
* Volume support in block storage added.
* `put_object` and `get_object` updated to accept blocks for block storage. You can create and retrieve storage objects in smaller chunks and display the progress of the operation.
* Method for gathering information about storage containers using the headers (rather than retrieving container contents) added. 
* Software updated to include `excon` version 0.14.3 to take advantage of instrumentation.  You can pass in a Instrumentor to provide instrumentation information about each call made via the hpfog library.  

###Known Issues### 

None in this release.

###Resolved Issues in Version 0.0.16###

None in this release.

##Release 0.0.15 Information## {#0.0.15}

###New Features in This Release###

* <i>Availability Zones</i>: You are required to set an availability zone to establish a connection; there is no default availability zone.
* <i>MetaData</i>: The following features related to metadata have been added:
    - New metadata attribute added in the server and image models to help manage metadata
    - New metadata model and request layer functionality with mocking support
    - New metadata tests- upgrade to excon 0.13.4 to take advantage of SSL pass-through functionality
* New `security_groups` attribute added to the server model.
* Support for future availability zones for all HP services added.
* Parameter `hp_avl_zone` is now a required parameter for all HP services.
* Support for console output in the [Compute](compute) service added.
* Helper method for the [CDN](cdn) public SSL URL added.
* Tests added for [Storage](object-storage), [Compute](compute) and [CDN](cdn) services.
* Quality of mocks modified to match implementation.

###Known Issues###

None in this release.

###Resolved Issues in Version 0.0.15###

None in this release.
