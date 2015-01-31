---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/php/objectstore/
title: "Working With Object Storage in PHP"
---
<!--PUBLISHED-->

# HP Helion Development Platform: Working With Object Storage in PHP

`Object Storage <http://docs.hpcloud.com/object-storage>`_ is a web scale storage system.
It provides private and public access and is accessible through a simple API. Within
the PHP Library a few ways to access this Object Storage are provided.

Stream Wrappers
---------------
The simplest method to access object storage is through stream wrappers and there are
currently provide two of them. To setup the stream wrappers is fairly simple.

.. code-block:: php

    <?php
    require_once 'vendor/autoload.php';
    use \HPCloud\Bootstrap;
    Bootstrap::useStreamWrappers();

    // Provide credentials
    $settings = array(
      'username' => YOUR_USERNAME,
      'password' => YOUR_PASSWORD,
      'tenantid' => YOUR_TENANT_ID,
      'endpoint' => IDENTITY_SERVICES_URL,
    );

    Bootstrap::setConfiguration($settings);

This example includes the bootstrap, sets up the autoloader, enables the stream wrappers,
and provides the credentials to use.

Calling ``Bootstrap::useStreamWrappers()`` sets up the ``swift`` and ``swiftfs`` stream wrappers.
According to the PHP Stream Wrapper documentation a stream should only implement the features
used. This is what the swift stream wrapper provides. Since there are use cases to treat a
container like a file system and, technically speaking, object storage doesn't support all
those features the ``swiftfs`` stream was created to mimic those features.

To access a file with stream wrappers registered the existing file system utilities can be used. For example:

.. code-block:: php

    $newfile = fopen('swift://mycontainer/foo.txt', 'w');
    fwrite($newfile, "Hello World!");
    fclose($newfile);

The new file can then be read:

.. code-block:: php

    print file_get_contents('swift://mycontainer/foo.txt');

In this case the ``swift`` stream wrapper was used. ``mycontainer`` is the name of the container and
``foo.txt`` is the name of the file stored in the container. Just like a local file it can be opened,
read, write to, and deleted.

Using The PHP Library Internals
-------------------------------
The stream wrappers are powered by a lower level API that can be used. It starts with identity services.

.. code-block:: php

    use \HPCloud\Bootstrap;
    use \HPCloud\Storage\ObjectStorage;

    $identity = Bootstrap::identity();
    $storage = ObjectStorage::newFromIdentity($identity);

``ObjectStorage::newFromIdentity`` is a factory for creating ``ObjectStorage`` objects from identities.
There are other factories that can be used as well.

From here a container can be accessed. For example,

.. code-block:: php

    $container = $storage->container('mycontainer');

The following snippet obtains a file (a.k.a object) from within a container:

.. code-block:: php

    try {
        $object = $container->proxyObject('foo.txt');
    }
    catch (\HPCloud\Transport\FileNotFoundException $nf) {
        // React because the requested object was not found.
    }
    catch (\HPCloud\Exception $e) {
        // Uh-oh, we have a problem.
    }

When fetching objects there are two methods to use in proxyObject and object. The object
method returns a full object with all of its contents. For large files this can take some time.
If you don't need the content or don't know if you will we have the proxyObject method that
grabs the meta data around an object without grabbing the content immediately. If a call is
made for the content it will be loaded at that time.

Creating New Objects
^^^^^^^^^^^^^^^^^^^^
When objects are retrieved from storage they are the class ``\HPCloud\Storage\ObjectStorage\RemoteObject``.
When a new local object it created it is done with the class ``\HPCloud\Storage\ObjectStorage\Object``.
Creating a new object looks like:

.. code-block:: php

    use \HPCloud\Storage\ObjectStorage\Object;
    $object = new Object('bar.txt');
    $object->setContent('Hello World!', 'text/plain');

When using ``setContent`` the MIME type can optionally be set as the as the second parameter.
This can be done later using ``setContentType``. The file is saved through the container object. For example,

.. code-block:: php

    $container->save($object);

CRUD
^^^^
Create, Read, Update, and Delete operations happen on container objects and are fairly simple. For example,

.. code-block:: php

    // Get an object and its content
    $object = $container->proxyObject('foo.txt');
    print $object->content();

    // Create/Update an object
    $container->save($object);

    // Delete an object
    $container->delete('bar.txt');
