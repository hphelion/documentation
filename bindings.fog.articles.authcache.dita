---
layout: default
title: "Ruby Fog Bindings for HP Helion Public Cloud: Using authentication caching"
permalink: /bindings/fog/articles/authcache
product: fog
categories: fog
tags: fog authentication caching
published: false
---
<!--PUBLISHED-->
# Ruby Fog bindings for HP Helion Public Cloud: Using authentication caching#


##Important Notice##

Over the past two years, we have been a leading contributor of the Ruby Fog binding and have contributed to features that span Folsom to Havana. On November 4, 2013, the HP Helion Public Cloud extensions for Ruby Fog Bindings became a part of the standard Fog download available from the main [Fog repository](https://github.com/fog/fog).  This 'hpfog' gem contribution means you no longer need a special download to work with our cloud. We are working on transitioning all of our current documentation to the Ruby Fog community to be directly available in the Fog GitHub repository.
 
The Ruby Fog community has 100s of [active contributors](https://github.com/fog/fog/graphs/contributors) and we are looking forward to the further enhancements and features that are generated from this healthy community; a community that encourages collaboration and support.
 
Read our [blog post](http://www.hpcloud.com/blog/releasing-ruby-bindings-wild) to learn more about our work with Ruby Fog.

_______________

Your application can run up to 40% faster if you cache the authentication information.  The authentication token is typically valid for a day or more and if you save it in a safe place, you can reuse it.  If you pass the authentication information to Fog, it does not have to reauthenticate.

For example if you save your credentials:

    @storage = Fog::Storage.new(options)
    @credentials = @storage.credentials

The next time you go to create a storage connection, pass in the credentials:

    options[:credentials] = @credentials
    @storage = Fog::Storage.new(options)
    @credentials = @storage.credentials

It is best to always update your cached credentials.  If they expire, they are automatically updated.  When you create the new connection with the credentials, you should still pass in your normal authentication information in the options.

The contents of the credentials should be treated like a set of data.  The contents of this object are likely to change in the future.

The same credentials may be used to create connections for block storage, CDN, compute connections, and other services.
