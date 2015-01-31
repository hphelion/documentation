---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/javascript/authentication/
title: "Authentication"

---
<!--PUBLISHED-->

# HP Helion Development Platform: Authentication
==========================================================
The `Identity Service API <https://docs.hpcloud.com/identity>`_ is central to using the
APIs for the services by HP Helion. Identity Service not only deals with authentication
but also supplies the catalog of information around the activated and available services.
For example, this API is where the API endpoints for services like the different compute regions,
Object Storage, and everything else is available.

The HP Helion Javascript SDK provides functionality to interact with identity service and authentication
to simply authenticate commonly and use it everywhere.

Authenticating with username & password
---------------------------------------
To create a client that authenticates using your HP Public Cloud account,
specify the same login credentials as used to login to the public console.

.. code-block:: javascript

    var pkgcloud = require('pkgcloud');

    var hpClient = pkgcloud.storage.createClient({
       provider: 'hp',
       username: 'your-user-name',
       password: 'your-password',
       region: 'region-a.geo-1',
       authUrl: 'https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/'
    });



Authenticating with access key & token
---------------------------------------
You can provision `Access keys & tokens <https://community.hpcloud.com/article/understanding-hp-cloud-authentication>`_
that are scoped to services on a per-key basis and manage them individually.
To create a client that uses an access key and secret key pair,

.. code-block:: javascript

    var pkgcloud = require('pkgcloud');

    var hpClient = pkgcloud.storage.createClient({
       provider: 'hp',
       username: 'your-user-name',
       apiKey: 'your-api-key',
       region: 'region-a.geo-1',
       authUrl: 'https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/'
    });
