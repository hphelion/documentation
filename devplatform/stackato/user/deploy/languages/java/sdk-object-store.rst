.. _object-storage-java-sdk:

Working With Object Storage in Java
===========================================

`Object Storage <http://docs.hpcloud.com/object-storage>`_ is a web scale storage system.
It provides private and public access and is accessible through a simple API. Within
the Java Library a few ways to access this Object Storage are provided.

Create, Read, Update, and Delete
--------------------------------
Create, Read, Update, and Delete operations happen on storage objects and are fairly straight forward. For example:

.. code-block:: java

    BlobStoreContext context =
      ContextBuilder.newBuilder("hpcloud-objectstorage")
        .credentials(identity, credential)
        .buildView(BlobStoreContext.class);
    BlobStore blobStore = context.getBlobStore();
    // Creating a new file or object into an existing directory or container:
    Blob testBlob = blobStore.blobBuilder("testblob").payload("<content>").name("<name>").build();
    String etag = blobStore.putBlob(<container>, testBlob); // the creation of the blob returns the etag value

    // Get an existing blob
    Blob retrievedBlob = blobStore.getBlob(<container>, blob);

    // Delete a blob
    blobStore.removeBlob(<container>, blob);
