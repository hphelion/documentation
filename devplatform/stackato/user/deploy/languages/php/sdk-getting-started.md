---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/php/getstarted/
---
<!--UNDER REVISION-->
#Getting Started With The PHP SDK

The HP Cloud PHP library is built on top of HP Helion APIs; taking away many of the
complexities of working with the APIs to instead focus on writing applications in PHP.
The library is designed to be pulled into PHP applications where, through the use of
PHP objects, methods, and functions, you can interact with HP Helion OpenStack®.

Getting The Library
-------------------
The HP Cloud PHP Library is available on [Github](https://github.com/hpcloud/HPCloud-PHP) and [Packegist](https://packagist.org/packages/hpcloud/hpcloud-php). Packegist, for those
who don't already know, is the package library for PHP commonly used with [Composer](http://getcomposer.org/).

Using Composer you can include the library by adding the following to your *composer.json* file:

.. code-block:: json

    "require": {
        "hpcloud/hpcloud-php": "1.*"
    }

If you aren't using composer you can download the `library from Github <https://github.com/hpcloud/HPCloud-PHP/tags>`_.

Including The Library and Autoloading
-------------------------------------
The library is designed to work with a `PSR-0 <https://github.com/php-fig/fig-standards/blob/master/accepted/PSR-0.md>`_
autoloader. If you are using the autoloader in composer the library will be available through that.

If you are not using composer or another autoloader one is included with the library.
You can use it by including something like the following:

.. code-block:: php

    <?php
    require_once 'path/to/HPCloud-PHP/src/HPCloud/Bootstrap.php';
    use \HPCloud\Bootstrap;
    Bootstrap::useAutoloader();

This includes the bootstrap process and registers the included autoloader with PHP.

Bootstrapping The Library
-------------------------
While you can use the entire library without bootstrapping, we do have a small bootstrap
process that sets up some nice to have components and lets you set some global options.
For example, you can authenticate once and reuse that with the different services. Let's
take a look at a few of these.

Registering Stream Wrappers
^^^^^^^^^^^^^^^^^^^^^^^^^^^
Wouldn't it be nice to work with remote files through the normal file system calls?
That would be stream wrappers and we provide some right out of the box.

.. code-block:: php

    <?php
    require_once 'vendor/autoload.php';
    use \HPCloud\Bootstrap;
    Bootstrap::useStreamWrappers();

    // Provide credentials
    $settings = array(
        'account' => YOUR_ACCESS_KEY_ID,
        'secret' => YOUR_SECRET_KEY,
        'tenantid' => YOUR_TENANT_ID,
        'endpoint' => IDENTITY_SERVICES_URL,
    );
    Bootstrap::setConfiguration($settings);

This bootstrap code registers a PHP stream wrapper to your object storage. For example,
a URI in the format of ``swift://foo/bar.baz`` would be to an object named ``bar.baz`` in the
container ``foo`` of your object storage. You can read this object, write to this object,
and so much more. All of this through file system functions like ``fopen``.

Transport Layers
^^^^^^^^^^^^^^^^
The transport layer for making API calls to the HP Cloud services is pluggagle and
out of the box provides curl and native PHP support. By default curl (with a tuned configuration)
is used because it is significantly faster. If you are in an environment where curl is not an
option you can specify the PHP transport layer be used.

.. code-block:: php

    $settings = array(
        'transport' => '\HPCloud\Transport\PHPStreamTransport',
    );

In the settings array passed to ``Bootstrap::setConfiguration()`` tell the API calls to use the
PHPStreamTransport plugin and that will be used instead.

Debugging
^^^^^^^^^
Debugging is an important part of working with APIs. We've built in debugging into
the transport layer that can be globally enabled via the bootstrap process. This will
help us see the calls being made to the APIs and the responses we are getting back.

.. code-block:: php

    $settings = array(
        'transport.debug' => TRUE,
    );

In the settings array passed to ``Bootstrap::setConfiguration()`` tell the transport
layer to work in debug mode. For example, when working with the curl transport layer
this will enable ``CURLOPT_VERBOSE`` which will write out verbose details to
`STDERR <http://us.php.net/manual/en/wrappers.php.php>`_.

Glogal Context Configurations
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Through the codebase there are a number of configuration options that can be contextually set.
For example, If you are using stream wrappers and CDN on your object storage should the ssl
or non-ssl URL be returned? Or, what should the timeout on the transport layer be? While, options
like these can all be configured or overridden at the different class levels in the codebase
they can also be configured globally through the bootstrap process by passing them into
``Bootstrap::setConfiguration()``.

As these configuration options are discovered working with the codebase the bootstrap process
provides a place to set them globally.

A Quick Example
^^^^^^^^^^^^^^^
As a quick example we can write a file to object storage using the library.

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

    $newfile = fopen('swift://mycontainer/foo.txt', 'w');
    fwrite($newfile, "Hello World!");
    fclose($newfile);

This code includes the PHP library, configures it for authentication, then uses file
system functions to create a new object.
