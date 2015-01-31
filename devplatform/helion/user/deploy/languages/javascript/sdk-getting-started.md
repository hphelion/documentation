---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/javascript/getstarted/
title: "Getting Started with the Javascript SDK"
---
<!--PUBLISHED-->
.. _get-started-javascript-sdk:

# HP Helion Development Platform: Getting Started with the Javascript SDK

The HP Cloud Javascript library is built on top of HP Helion APIs; taking away many of the
complexities of working with the APIs to instead focus on writing applications in Nodejs.
The library is designed to be pulled into nodejs applications where, through the use of
PHP objects, methods, and functions, you can interact with HP Cloud services.

Getting The Library
-------------------
The HP Cloud Javascript Library is available on `Github <https://github.com/pkgcloud/pkgcloud>`_
and `npm <https://www.npmjs.org/package/pkgcloud>`_. npm, for those
who don't already know, is the package library for nodejs.

Using npm you can include the library by adding the following to your `package.json <https://www.npmjs.org/doc/json.html>`_ file:

.. code-block:: json

    "dependencies": {
        "pkgcloud": "~0.9.5"
    }

Run 'npm install' or 'npm update' from command line/terminal in your application
directory to download the dependency into your application.

Including The Library
-------------------------------------
To include the library in your application, include this line in your source file.

.. code-block:: javascript

    var pkgcloud = require('pkgcloud');


Debugging
^^^^^^^^^
Debugging is an important part of working with APIs.
Any client you create with createClient can emit logging events.
If you're interested in more detail from the internals of pkgcloud,
you can wire up an event handler for log events.
This will help us see the calls being made to the APIs and the responses we are getting back.

.. code-block:: javascript

  var client = pkgcloud.storage.createClient(options);
  client.on('log::*', function(message, object) {
  if (object) {
   console.log(this.event.split('::')[1] + ' ' + message)
   console.dir(object);
  }
  else {
    console.log(this.event.split('::')[1]  + ' ' + message);
  }});
