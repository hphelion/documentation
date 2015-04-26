---
layout: default
title: "Ruby Fog Bindings for HP Helion Public Cloud CDN Examples"
permalink: /bindings/fog/cdn/
product: fog
published: false

---
<!--PUBLISHED-->
# Ruby Fog Bindings for HP Helion Public Cloud CDN Examples


##Important Notice##

Over the past two years, we have been a leading contributor of the Ruby Fog binding and have contributed to features that span Folsom to Havana. On November 4, 2013, the HP Helion Public Cloud extensions for Ruby Fog Bindings became a part of the standard Fog download available from the main [Fog repository](https://github.com/fog/fog).  This 'hpfog' gem contribution means you no longer need a special download to work with our cloud. We are working on transitioning all of our current documentation to the Ruby Fog community to be directly available in the Fog GitHub repository.
 
The Ruby Fog community has 100s of [active contributors](https://github.com/fog/fog/graphs/contributors) and we are looking forward to the further enhancements and features that are generated from this healthy community; a community that encourages collaboration and support.
 
Read our [blog post](http://www.hpcloud.com/blog/releasing-ruby-bindings-wild) to learn more about our work with Ruby Fog.

_______________

The HP Helion Public Cloud services provides CDN support via the request layer abstraction.  In the request abstraction, you can CDN-enable a container, get a list of the CDN-enabled containers, list the metadata for a CDN-enabled container, update the metadata for a CDN-enabled container, and CDN-disable a container.

The examples on this page can be executed from within a Ruby console (IRB):

        irb

This page discusses the following topics:

* [Connecting to the Service](#ConnectingtotheService)
* [CDN-Enabling an Existing Container](#CDN-EnablinganExistingContainer)
* [Listing CDN-Enabled Containers](#ListingCDN-EnabledContainers)
* [Listing the Metadata for a CDN-Enabled Container](#ListingtheMetadataforaCDN-EnabledContainer)
* [Updating the Metadata for a CDN-Enabled Container](#UpdatingtheMetadataforaCDN-EnabledContainer)
* [Disabling a CDN Container](#DisablingaCDNContainer)

<!--Be sure to add a menu/right-hand nav pane item to the appropriate pages-->
<!--Details on a container?-->

##Connecting to the Service## {#ConnectingtotheService}

For information on connecting to the service, please see the [Connecting to the HP Helion Public Cloud Service](/bindings/fog/connect/) page.

##CDN-Enabling an Existing Container## {#CDN-EnablinganExistingContainer}

To CDN-enable an existing container:

        conn.put_container("fog-rocks")

##Listing CDN-Enabled Containers## {#ListingCDN-EnabledContainers}

To generate a list of CDN-enabled containers:

        conn.get_containers

##Listing the Metadata for a CDN-Enabled Container## {#ListingtheMetadataforaCDN-EnabledContainer}

To list the metadata (or header information) for a CDN-enabled container:

        conn.head_container("fog-rocks")

##Updating the Metadata for a CDN-Enabled Container## {#UpdatingtheMetadataforaCDN-EnabledContainer}

To update or modify the metadata for a CDN-enabled container, use the command

> conn.post_container("fog-rocks", {**option**})

Where _option_ can be any of the following: 

* X-CDN-Enabled <Boolean\> - cdn status for container  
* X-CDN-URI <String\> - cdn url for this container  
* 'X-TTL'<~String\> - integer seconds before data expires, defaults to 86400 (1 day), in 900 (15 min.) to 1577836800 (50 years) 
* X-Log-Retention \<Boolean>  

So for example, if you want to modify the X-TTL metadata information so that the value becomes 3600, the command would be:

        conn.post_container("fog-rocks", {'X-Ttl' => 3600 })

##Disabling a CDN Container## {#DisablingaCDNContainer}

To CDN-disable container:

        conn.delete_container("fog-rocks")
