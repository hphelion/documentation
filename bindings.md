---
layout: default
title: "Bindings"
permalink: /bindings/

---
# HP Cloud binding support

One of the advantages of being active with OpenStack is that there is a healthy community of developers working on language bindings.  HP augments those in strategic areas and recommends others for your general use.  Take a gander at the choices you have at your disposal below.  Don't see what you need?  Don't be shy. [Get involved and create something for submittal back to OpenStack](http://openstack.org/community/).

## HP Cloud extended bindings
HP Cloud offers [an extension to Ruby Fog](/bindings/fog) for interacting with HP Cloud Services based on the OpenStack Ruby Fog bindings.

For details on the OpenStack implementation of Ruby Fog, see the information on the [OpenStack Object Storage Ruby binding](https://github.com/rackspace/ruby-cloudfiles) or the [OpenStack Compute Ruby binding](https://github.com/rackspace/ruby-openstack-compute). 


## Available open source bindings
We created this set of bindings and have them available as open source.  While not actively supported, we use these ourselves for various use cases and anyone in the public is free to expand upon them.

###Java/Clojure
Similar to our stance on Ruby, we like the Java/Clojure supported [jclouds multi-cloud binding](/bindings/jclouds).

###PHP
The [HPCloud-PHP bindings](http://hpcloud.github.com/HPCloud-PHP/) on our GitHub account supports Object Storage and CDN.  We use this on our own Drupal-based sites, like the one you're reading right now.

###Drupal Module
OK, so technically this isn't a binding but it's some open source that we use ourselves that we're making available to the public.  Take a look at our [HPCloud drupal module](http://drupal.org/project/hpcloud), which lets you use Object Storage and CDN to offload files (typically images) from your Drupal site to our services.

###.NET
For our friends on the Microsoft platform, [we have a .NET open source binding over at CodePlex](http://hpcloud.codeplex.com/) that supports Object Storage, CDN, and Compute.  As you might guess, our own [Windows CLI](/cli/windows) is built on this codebase.

###Javascript (node.js)
The [HP Cloud Javascript bindings](http://hpcloud.github.io/hpcloud-js/) support our identity services and object storage functionality. We use this in our own applications.

