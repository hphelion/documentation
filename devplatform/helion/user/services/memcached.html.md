---
layout: default-devplatform
permalink: /als/v1/user/services/memcached/
product: devplatform
title: "Memcached Service"
---
<!--PUBLISHED-->

# HP Helion 1.0 Development Platform: Memcached Service[](#memcached-service "Permalink to this headline")
=====================================================================

Memcached is an in-memory key-value store used for caching by many web
applications and frameworks. It is available in Application Lifecycle Service as a service
which can be shared by application instances.

Using the Service[](#using-the-service "Permalink to this headline")
---------------------------------------------------------------------

As with other [*data services*](/als/v1/user/services/data-services/#data-services), the
location and port of the memcached service is exposed to the application
via environment variables: MEMCACHE\_URL or VCAP\_SERVICES.

The easiest way to connect an application to a Memcached service is to
use the MEMCACHE\_URL environment variable. It contains the location and
port of the service created for the application. For example:

    MEMCACHE_URL=10.13.0.6:11000

Using MEMCACHE\_URL will only work if `sasl_enabled`
is set to `False` in the memcached\_node
configuration (default). To enable SASL for Memcached, an Application Lifecycle Service
administrator can run the following commands on the Cloud Controller:

    $ kato config set memcached_node sasl_enabled true
    $ kato restart memcached_node

With SASL enabled, applications must parse the[*VCAP\_SERVICES*](/als/v1/user/services/data-services/#database-services-vcap-services)
environment variables to extract the `name`, `user`, and `password`
strings from the memcached `credentials` list. Using SASL with Memcached
requires client libraries/modules in the application which support
authentication via SASL.

**Warning:** Running Memcached **without** SASL enabled is insecure and should only be done if all system users are trusted. Any Application Lifecycle Service user can connect to the provisioned service instance if the IP address and port is discovered.

Django Example using Memcached[](#django-example-using-memcached "Permalink to this headline")
-----------------------------------------------------------------------------------------------

The [Django GTD](https://github.com/Stackato-Apps/django-gtd) sample
application uses the simpler VCAP\_SERVICES method for connecting to the
Memcached service without authentication.

The relevant configuration in this example:

1.  specifies the location of memcache using the MEMCACHE\_URL in
    *settings.py*:

        CACHES = {
            'default': {
            'BACKEND': 'django.core.cache.backends.memcached.MemcachedCache',
            'LOCATION': os.getenv('MEMCACHE_URL'),
            }
        }

2.  adds the cache to middleware classes:

        MIDDLEWARE_CLASSES = (
            'django.middleware.cache.UpdateCacheMiddleware',
            'django.middleware.cache.FetchFromCacheMiddleware',
            ...
        )

3.  adds the python-memcached module and a memcached service in
    *manifest.yml*:

        requirements:
            pip:
            - python-memcached
            ...
        services:
            memcached-gtd: memcached
            ...
