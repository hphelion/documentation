---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/java/authentication/
title: "Authentication With Apache jclouds and HP Helion"
---
<!--PUBLISHED-->
 
<!--
# HP Helion 1.0 Development Platform: Authentication With Apache jclouds and HP Helion 1.0

The `Identity Service API <https://docs.hpcloud.com/identity>`_ is central to using the
APIs for the services by HP Helion. Identity Service not only deals with authentication
but also supplies the catalog of information around the activated and available services.
For example, this API is where the API endpoints for services like the different compute regions,
Object Storage, and everything else is available.

Apache jclouds provides functionality to interact with identity service and authentication
to simply authenticate commonly and use it everywhere.
-->
#Authenticating with access key and token

By default, the authentication mechanism for all OpenStack&reg; Keystone based APIs will use your
password as the credential to log in.

The following specifications may serve as a guide if you wish to set API Access Keys:


    properties.setProperty(KeystoneProperties.CREDENTIAL_TYPE, CredentialTypes.API_ACCESS_KEY_CREDENTIALS)

You can provision `Access keys & tokens <https://community.hpcloud.com/article/understanding-hp-cloud-authentication>`_
that are scoped to services on a per-key basis and manage them individually.
To create a client that uses an access key and secret key pair,

    Properties overrides = new Properties();
    properties.setProperty(KeystoneProperties.CREDENTIAL_TYPE, CredentialTypes.API_ACCESS_KEY_CREDENTIALS)

    // Get a context with hpcloud that offers the portable BlobStore API
    BlobStoreContext context = ContextBuilder.newBuilder("hpcloud-objectstorage")
                 .overrides(overrides)
                 .credentials("tenantName:accessKey", "password")
                 .buildView(BlobStoreContext.class);
