---
layout: default
title: "HP Cloud Extensions to Ruby Fog Binding"
permalink: /bindings/fog/
product: fog

---
# HP Cloud Extensions to Ruby Fog Binding

HP provides a native Ruby library through an HP Cloud developed extension to the Ruby Fog provider. By using the HP Cloud Ruby library, developers can write applications using Ruby that interacts with the HP Public Cloud without having to deal with the underlying REST API or XML document formats.

This library is an extension of [Fog](http://github.com/fog/fog), a Ruby open-source multi-cloud computing library. 

<!--Currently we are maintaining a running branch of the Fog library that contains all HP-specific support. Very soon, we intend to return our contributions to the primary open-source library.-->

##Version 12.12 Extensions to Ruby Fog Binding

The HP Cloud Ruby library currently supports HP Cloud Compute, HP Cloud Object Storage, HP Cloud CDN, and HP Cloud Block Storage. Support for other services will be added as they become available.

* [Installation Instructions](/bindings/fog/install)
* [Connecting to the Service](/bindings/fog/connect)
* [Compute Examples](/bindings/fog/compute)
* [Object Storage Examples](/bindings/fog/object-storage)
* [CDN Examples](/bindings/fog/cdn)
* [Block Storage Examples](/bindings/fog/block-storage)
* [Release Notes](/bindings/fog/release-notes)
* [FAQ](/faq#RubyFogBindings)

##Version 13.5 Extensions to Ruby Fog Binding

For the release of HP Cloud v13.5, the HP Cloud Ruby library added new examples for HP Cloud Networking and changes were made to the HP Cloud Compute and HP Cloud Block Storage examples. All other examples are compatible with v13.5.

* [Compute v2.0 Examples](/v13/bindings/fog/compute)
* [Block Storage v2.0 Examples](/v13/bindings/fog/block-storage)
* [Networking Examples](/v13/bindings/fog/networking)
* Load Balancer Examples (coming soon)
* DNS Examples (coming soon)

##Reference Materials

For our release-by-release information, take a look at [our release notes](/bindings/fog/release-notes)!  And if you want to look at the main Fog reference documents, surf on over to the [Documentation for fog/fog (master) Alphabetic Index](http://rubydoc.info/github/fog/fog/frames/index); the ReadMe file might be a good place for you to start.

To install and use HP Cloud Ruby bindings for Fog, please install the [latest release](http://fog.io) of Fog.

<!-- To help you out a bit, here are some articles on how to use the HP cloud Ruby Fog binding:

* [Using authentication caching](/bindings/fog/articles/authcache/) -->
