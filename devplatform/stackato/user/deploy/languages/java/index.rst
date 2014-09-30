.. index:: Java
.. _develop-in-java:

Developing In Java
==================

Whether you're deploying an application to the HP Helion Development Platform, a
Cloud Foundry based Platform as a Service (PaaS), or writing applications that take
advantage of HP Helion OpenStack® to manage infrastructure or software services, tools
to enable successful development are available in Java.


Application Lifecycle Services
------------------------------
Application Lifecycle Services (ALS), a Cloud Foundry based Platform as a Service,
has support for multiple Java frameworks and for
`Buildpacks <http://docs.hpcloud.com/als/v1/user/deploy/buildpack/#buildpacks>`_ where
you can define your own Java environment. Supported frameworks include Java Web, Spring,
Java EE (via TomEE or JBoss), Grails, and Lift.

To learn more see:

* `Working with applications in Java <http://docs.hpcloud.com/als/v1/user/deploy/languages/java/>`_
* `The stackato.yml reference <http://docs.hpcloud.com/als/v1/user/deploy/stackatoyml/>`_

Using jclouds with HP Helion
----------------------------
Java applications can communicate directly with the `Helion APIs <http://docs.hpcloud.com/api>`_ through
a REST client or use `Apache jclouds <http://jclouds.apache.org/>`_. Apache jclouds is designed to
provide a well-documented API to simplify working with the services.

As an example, here is one way of writing and reading from object storage:

.. code-block:: java

    // Get a context with hpcloud that offers the portable BlobStore API
    BlobStoreContext context = ContextBuilder.newBuilder("hpcloud-objectstorage")
                 .credentials("tenantName:accessKey", "password")
                 .buildView(BlobStoreContext.class);

   // Create a container in the default location
   context.getBlobStore().createContainerInLocation(null, container);

   // Use the map interface for easy access to put/get things, keySet, etc.
   context.createInputStreamMap(container).put("blob.txt", inputStream);

   // When you need access to hpcloud specific features, use the provider-specific context
    HPCloudObjectStorageClient hpcloudClient =
    HPCloudObjectStorageClient.class.cast(context.getProviderSpecificContext().getApi());

   // Create a container with public access
    boolean accessibleContainer = hpcloudClient.createContainer("public-container", withPublicAccess());

    ContainerMetadata cm = hpcloudClient.getContainerMetadata("public-container");
    if (cm.isPublic()) {
       ...
    }

    // When you want to use CDN features with a container, use the provider-specific CDN client
     HPCloudCDNClient cdnClient = hpcloudClient.getCDNExtension().get();

    // Get a CDN URL for the container
     URI uri = cdnClient.enableCDN(container);

    // Get the CDN Metadata for the container
    ContainerCDNMetadata cdnMetadata = cdnClient.getCDNMetadata(container)
    if (cdnMetadata.isCDNEnabled()) {
      ...
    }

   // Be sure to close the context when done
   context.close();

To learn more about getting and using the SDK see:

* :ref:`Get Started With The Java Library <get-started-java-sdk>`
* :ref:`Authentication in Java <auth-java-sdk>`
* :ref:`Working With Object Storage in Java <object-storage-java-sdk>`
