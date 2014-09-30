.. index:: Javascript
.. _develop-in-javascript:

Developing In Javascript
==============================

Whether you're deploying an application to the HP Helion Development Platform, a
Cloud Foundry based Platform as a Service (PaaS), or writing applications that take
advantage of HP Helion OpenStack® to manage infrastructure or software services, tools
to enable successful development are available in JavaScript.

Application Lifecycle Services
------------------------------
Application Lifecycle Services (ALS), a cloud foundry based Platform as a Service,
has a built in 'node' framework with multiple versions of the Node.js runtime.
NPM is used to install Node packages automatically.
Deploying applications to the platform is as simple as adding configuration to
a YAML configuration file and using a console application to push the application to ALS.

Management of the deployed application and its services happens through a web application or
a console application.

To learn more see:

* `Working with applications in node <http://docs.hpcloud.com/als/v1/user/deploy/languages/node/>`_
* `The stackato.yml reference <http://docs.hpcloud.com/als/v1/user/deploy/stackatoyml/>`_

HP Helion SDK
-------------
Javascript applications can communicate directly with the `Helion APIs <http://docs.hpcloud.com/api>`_ through a REST client
or use the SDK. The SDK is designed to have a simple well documented API to simplify working with the
services.

To understand how it works, here is an example of uploading and downloading from object storage:

.. code-block:: javascript

    var pkgcloud = require('pkgcloud');
    var hpStorageClient = pkgcloud.storage.createClient({
        provider: 'hp',
        username: 'your-user-name',
        apiKey: 'your-api-key',
        region: 'region of identity service',
        authUrl: 'https://your-identity-service' });
    hpStorageClient.upload({
     container: 'my-container',
     remote: 'remote-file-name',
     local: 'path/to/local/file'
     },
     function(err, result) {
        if(err) {
          console.dir(err);
          return;
        }
        console.log("File uploaded successfully");
    });
    hpStorageClient.download({
         container: 'my-container',
         remote: 'my-file',
         local: '/path/to/my/file'
       },
       function( err, result) {
        if(err) {
         console.dir(err);
         return;
        }
       console.log("File downloaded successfully");
    });

The example above uploads a local file from the file system into object storage,
and downloads a file onto the local file system.
You can also work with streams for upload and download operations.

.. code-block:: javascript

    var fs = require('fs'),
    var pkgcloud = require('pkgcloud');
    var hpStorageClient = pkgcloud.storage.createClient({
        provider: 'hp',
        username: 'your-user-name',
        apiKey: 'your-api-key',
        region: 'region of identity service',
        authUrl: 'https://your-identity-service' });
    var myFile = fs.createReadStream('/my/local/file');
    myFile.pipe(hpStorageClient.upload({
        container: 'my-container',
        remote: 'remote-file-name'
        },
        function(err, result) {
            if(err) {
              console.dir(err);
              return;
        }
    ));
    var writableFile = fs.createWriteStream('/path/to/my/file');
    hpStorageClient.download({
    container: 'my-container',
    remote: 'remote-file-name'
    },
    function(err, result) {
         if(err) {
           console.dir(err);
           return;
    })).pipe(writableFile);

To learn more about getting and using the SDK see:

* :ref:`Get Started With The Javascript Library <get-started-javascript-sdk>`
* :ref:`Authentication in Javascript <auth-javascript-sdk>`
* :ref:`Working With Object Storage in Javascript <object-storage-javascript-sdk>`
