.. index:: PHP
.. _develop-in-php:

Developing In PHP
=================

Whether you're deploying an application to the HP Helion Development Platform, a
Cloud Foundry based Platform as a Service (PaaS), or writing applications that take
advantage of HP Helion OpenStack® to manage infrastructure or software services, tools
to enable successful development are available in PHP.

Application Lifecycle Services
------------------------------
Cloud Foundry provides a means to execute PHP applications on a managed platform, controlling
application lifecycle through a PaaS tier, as an Application Lifecycle Service (ALS). Deploying
applications to this platform is as easy as adding details to a YAML configuration file and using
a console application to push the application to ALS.

At its simplest form, the configuration file, ``stackato.yml``, located at the root of a project
would look like::


    name: php-web-app
    framework:
        type: php

This will set the ALS framework typr for a PHP web application.

To create a worker non-http application set the web process to **null** (~) and specify
the command to **run**. For example:

.. code-block:: yaml

    name: php-app
    framework: php
    command: php worker.php
    processes:
        web: ~


Management of the deployed application and its services happens through a web application or
a console application.

To learn more see:

* `Working with applications in PHP <http://docs.hpcloud.com/als/v1/user/deploy/languages/php/>`_
* `The stackato.yml reference <http://docs.hpcloud.com/als/v1/user/deploy/stackatoyml/>`_

HP Helion SDK
-------------
PHP applications can communicate directly with the `HP Helion APIs <http://docs.hpcloud.com/api>`_ through a REST client
or use the SDK. The SDK is designed to provide a well-documented API to simplify working with the
services.

As an example, here is one way of writing and reading from object storage:

.. code-block:: php

    <?php
    // Use the composer autoloader.
    require_once '/vendor/autoload.php';

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

    // Create a new file and write it to the object store.
    $newfile = fopen('swift://mycontainer/my_file.txt', 'w');
    fwrite($newfile, "Good Morning!");
    fclose($newfile);

    // Check for an object:
    if (file_exists('swift://mycontainer/my_file.txt')) {
      print "Found my_file.txt." . PHP_EOL;
    }

    // Get an entire object at once:
    $file = file_get_contents('swift://mycontainer/my_file.txt');
    print 'File: ' . $file . PHP_EOL;

The example above uses PHP `stream wrappers <http://www.php.net/manual/en/book.stream.php>`_. Access to
the low level API is available in the SDK as well. For example,

.. code-block:: php

    <?php
    // Set up.
    require_once '/vendor/autoload.php';
    use \HPCloud\Bootstrap;

    // Authenticate to HP Cloud
    $username = 'YOUR_USERNAME';
    $password = 'YOUR_PASSWORD';
    $tenantId = 'ADD TENANT ID HERE';
    $endpoint = 'ADD ENDPOINT URL HERE';

    $idService = new \HPCloud\Services\IdentityServices($endpoint);
    $token = $idService->authenticateAsUser($username, $password, $tenantId);

    // Connect to Object Storage.
    $catalog = $idService->serviceCatalog();
    $store = ObjectStorage::newFromServiceCatalog($catalog, $token);

    // Create a Container.
    $store->createContainer('Example');
    $container = $store->container('Example');

    // Create an Object.
    $name = 'hello.txt';
    $content = 'Hello World';
    $mime = 'text/plain';
    $localObject = new Object($name, $content, $mime);

    // Put the Object in the Container.
    $container->save($localObject);

    // And get the Object back out again.
    $object = $container->proxyObject('hello.txt');

    printf("Name: %s \n", $object->name());
    printf("Size: %d \n", $object->contentLength());
    printf("Type: %s \n", $object->contentType());
    print $object->content() . PHP_EOL;

To learn more about getting and using the SDK:

* :ref:`Get Started With The PHP Library <get-started-php-sdk>`
* :ref:`Identity Service, Authentication, and the Service Catalog <auth-php-sdk>`
* :ref:`Working With Object Storage in PHP <object-store-php-sdk>`