---
layout: public-cloud
title: "HP Helion Public Cloud: Binding Support"
permalink: /publiccloud/bindings/
product: public-cloud

---
<!--PUBLISHED-->
# HP Helion Public Cloud Binding Support

One of the advantages of being active with OpenStack is that there is a healthy community of developers working on language bindings.  HP augments those in strategic areas and recommends others for your general use.  Take a gander at the choices you have at your disposal below.  Don't see what you need?  Don't be shy. [Get involved and create something for submittal back to OpenStack](http://openstack.org/community).

## Available open source bindings
We created this set of bindings and have them available as open source.  While not actively supported, we use these ourselves for various use cases and anyone in the public is free to expand upon them.

###Java/Clojure
Java access to HP Helion Public Cloud Compute and HP Helion Public Cloud Objects is accomplished using the [jclouds multi-cloud library](https://jclouds.apache.org).  This easy to use library abstracts common cloud functionality into a simple interface.  HP has contributed a provider for both HP Helion Public Cloud Compute and Object Storage back to the jclouds community to make our services accessible to Java programmers.

To get started, take a look at the [OpenStack - Getting Started Guide](http://jclouds.apache.org/guides/openstack) which walks you through the installation process and some sample code.

For more elaborate examples, take a look at the [jclouds-examples repository over at GitHub](https://github.com/jclouds/jclouds-examples).

###PHP Bindings for HP Helion Public Cloud
HP Cloud has contributed our PHP bindings extensions to [Openstack](http://hpcloud.github.com/HPCloud-PHP). We use this on our own Drupal-based sites, like the one you're reading right now.

###Drupal Module
OK, so technically this isn't a binding but it's some open source that we use ourselves that we're making available to the public.  Take a look at our [HPCloud drupal module](http://drupal.org/project/hpcloud), which lets you use Object Storage and CDN to offload files (typically images) from your Drupal site to our services.

###.NET
For our friends on the Microsoft platform, [we have a .NET open source binding over at CodePlex](http://hpcloud.codeplex.com/) that supports Object Storage, CDN, and Compute.  As you might guess, our own [Windows CLI](/publiccloud/cli/windows/) is built on this codebase.

###Javascript (node.js)
The [HP Helion Public Cloud Javascript bindings](http://hpcloud.github.io/hpcloud-js/) support our identity services and object storage functionality. We use this in our own applications.

###Ruby Fog bindings for HP Helion Public Cloud
HP Helion Public Cloud has contributed our extensions of Ruby Fog back to the open source Ruby Fog community. Please [check here to download the bindings](http://rubygems.org/gems/fog), see [new enhancements](https://github.com/fog/fog/blob/master/lib/fog/hp/README.md), and contribute back yourself!
