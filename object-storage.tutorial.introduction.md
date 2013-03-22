---
layout: default
title: An Introduction To Using CDN With Object Storage
permalink: /object-storage/tutorial/introduction/
product:
  - cdn
  - object-storage

---
# An Introduction To Using CDN With Object Storage
The HP Cloud CDN enables objects in HP Cloud Object Storage to be available over a [Content Delivery Network (CDN)](https://en.wikipedia.org/wiki/Content_delivery_network "Wikipedia: Content delivery network"). CDNs allow objects to be fetched from locations close to users enabling users to download the objects more quickly. This article provides an introduction into how the CDN works with object storage and some basic ways you can use it.

## Making Objects Available To The CDN
Containers within object storage are private by default, meaning that only those with API, [CLI](https://docs.hpcloud.com/cli), or [console](https://console.hpcloud.com) access to the containers can read or write to the objects within them. A container can be toggled to be public, allowing all objects within the container to be openly available. When this happens, the container and each object within the container gets a URL that can be shared.

A second and similar option available is to CDN enable a container. By enabling this the container and the objects within a container will have two public URLs pointing to a CDN to obtain the objects. The URLs are to the object via a CDN in [SSL](https://en.wikipedia.org/wiki/HTTPS "Wikipedia: HTTP Secure") and non-SSL forms.

All of these URLs are available through the console, CLIs, and the API.

## Caching On The CDN
When objects are updated and distributed over a CDN understanding how caching works is important. For example, if caching is setup for a container over the CDN for 30 days and an object is updated some users will have to wait 30 days to see the update.

When an end user requests a file off a CDN the user is directed to their closest CDN location. If the CDN has the file locally it will serve it from the local cache. If not, it will request it from object storage, cache it locally, and serve it to the user. Future requests will serve it from the cache.

An important distinction here is that the CDN locations pull objects to them when users request them. The objects are not pushed to all the edge locations beforehand.

### Web Browsers And Caching
A common web browser caching strategy is to store static assets in the browser cache and [instruct the browser to not check for updates until some point in the future](https://developers.google.com/speed/docs/best-practices/caching#LeverageBrowserCaching "Leverage browser caching"). When using a CDN this happens a little differently. Instead, the local CDN location stores the file from the time it requested it through the length of time the container is configured to cache the file.

On every page request the browser will ask the CDN if there is an update. If there has been no change the CDN will respond with a [_304 Not Modified_](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#3xx_Redirection "Wikipedia: List of HTTP status codes") and the web browser will use the version stored in cache. Since the CDN server being checked is local it is close to the user and these requests are very fast. This shifts the knowledge of how how long objects should cached from the end users web browser to the CDN.

### Configuring The Cache Time
Thought the console, API, or CLIs the length of time the CDN caches objects for can be configured from a minimum of 15 minutes through a maximum of 100 years. This configuration happens on a container level and affects all the objects within the container.

### Controlling Caching Through The URL
There are times where you want to push out an update to a particular object that is being cached in the CDN. A simple way to do that is to append a query string to the file that needs to be updated. When an update needs to be pushed out the query string is changed.

For example, take a file at `http://cdn.example.com/path/to/file.js`. Instead, use a name like `http://cdn.example.com/path/to/file.js?version=1`. When an update needs to be pushed out increment the version to 2. This will cause the CDN to deliver the new version of the file.

Controlling two versions of a file in this manner can be useful as there may be some cached pages that are still requesting the original version and changing to the new version without other changes in the page could cause a user interface to break.

## Custom Domains For CDN Servers
There is currently limited support for custom domains and you can only use them for the non-SSL version of a CDN file. SSL requires certificates associated with domain names to be delivered when files are served and currently there is no method to handle this delivery.

To setup a custom domain for a non-SSL path can happen through the use of [CDNAME](https://en.wikipedia.org/wiki/CNAME_record "Wikipedia: CNAME record") DNS records. By creating a CNAME record mapping a custom domain to the domain generated for the container users will be routed to the objects.

## More Information
For more information on HP Cloud CDN see the [documentation](https://docs.hpcloud.com/cdn) or [language libraries](https://docs.hpcloud.com/library).