---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/javascript/objectstore/
title: "Working With Object Storage in Javascript"
---
<!--PUBLISHED-->
# HP Helion Development Platform: Working With Object Storage in Javascript

`Object Storage <http://docs.hpcloud.com/object-storage>`_ is a web scale storage system.
It provides private and public access and is accessible through a simple API. Within
the JavaScript Library a few ways to access this Object Storage are provided.

CRUD
^^^^
Create, Read, Update, and Delete operations happen on storage objects and are fairly straight forward. For example,

.. code-block:: javascript

    var pkgcloud = require('pkgcloud');
    var fs = require('fs');

    // get an object and its content
    var fileStream  = hpStorageClient.download({
    container: 'my-container',
    remote: 'test.json' },
     function(err, result) {
    if(err){
      console.dir(err);
    }});

    var fileContents ='';
    fileStream.on('data', function(chunk){
        fileContents += chunk;
    })
    .on('end', function(){
      console.log(fileContents);
    });

    // Create an object.
    // Create a temporary file to hold the object's content.
    var contentStream = fs.createWriteStream('temp.json', { readable: true});
    contentStream.write(new Buffer ('{ name: \"M5\", type: \"bmw \"}'));
    contentStream.end();
    // create a readable stream to the content.
    contentStream = fs.createReadStream('temp.json');
    contentStream.pipe(client.upload({
        container: 'my-container',
        remote: 'my-file'
        },
        function(err, result) {
         if(err) {
          console.dir(err);
          return;
         }
        console.log("File uploaded successfully");
        // delete the temporary file.
        fs.unlinkSync('temp.json');
    }));
    // Delete an object
    client.removeFile('my-container', 'my-file', function(err, result){
      if(err) {
        console.dir(err);
        return;
      }
      console.log('object deleted successfully');
    });
