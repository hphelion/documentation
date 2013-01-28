---
layout: default
title: "HP Cloud Fog Binding CDN Examples"
permalink: /bindings/fog/cdn/
product: fog

---
# Ruby Fog Bindings CDN Examples

The HP Cloud services provides CDN support via the request layer abstraction.  In the request abstraction, you can CDN-enable a container, get a list of the CDN-enabled containers, list the metadata for a CDN-enabled container, update the metadata for a CDN-enabled container, and CDN-disable a container.

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

For information on connecting to the service, please see the [Connecting to the HP Cloud Service](/bindings/fog/connect) page.

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

* X-CDN-Enabled <Boolean> - cdn status for container  
* X-CDN-URI <String> - cdn url for this container  
* 'X-TTL'<~String> - integer seconds before data expires, defaults to 86400 (1 day), in 900 (15 min.) to 1577836800 (50 years) 
* X-Log-Retention <Boolean>  

So for example, if you want to modify the X-TTL metadata information so that the value becomes 3600, the command would be:

        conn.post_container("fog-rocks", {'X-Ttl' => 3600 })

##Disabling a CDN Container## {#DisablingaCDNContainer}

To CDN-disable container:

        conn.delete_container("fog-rocks")