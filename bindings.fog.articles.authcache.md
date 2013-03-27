---
layout: default
title: "HP Ruby Fog Binding: Authentication Caching"
permalink: /bindings/fog/articles/authcache
product: fog
categories: fog
tags: fog authentication caching
---
#HP Ruby Fog Binding: Authentication Caching#

Your application can run up to 40% faster if you cache the authentication information.  The authentication token is typically valid for a day or more and if you save it in a safe place, you can reuse it.  If you pass the authentication information to Fog, it will not have to reauthenticate.

For example if you save your credentials:

    @storage = Fog::Storage.new(options)
    @storage_credentials = @storage.credentials

The next time you go to create a storage connection, pass in the credentials:

    options[:credentials] = @storage_credentials
    @storage = Fog::Storage.new(options)
    @storage_credentials = @storage.credentials

It is best to always update your cached credentials.  If they expire, they will automatically be updated.  When you create the new connection with the credentials, you should still pass in your normal authentication information in the options.

The contents of the credentials should be treated like a blob of data.  The contents of this object will likely change in the future.

This feature is also available for block storage, CDN, and compute connections.
