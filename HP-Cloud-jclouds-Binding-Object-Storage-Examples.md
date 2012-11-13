---
layout: default
title: "HP Cloud jclouds Binding Object Storage Examples"
permalink: /bindings/jclouds/object-storage/

---
# HP Cloud jclouds Binding Object Storage Examples

This page provides you with examples of how to use the jclouds binding to perform object storage tasks.  

*Note*: In examples, text in angle brackets indicates a variable:  

        <This_is_a_variable>  

##Preparing to Use the jclouds BlobStore API## {#PreparingtoUsethejcloudsBlobStoreAPI}  

Before you can execute the object storage commands, you need to perform the following steps: 

Instantiate the context with the `hpcloud-objectstorage` provider:

        BlobStoreContext context = 
          ContextBuilder.newBuilder("hpcloud-objectstorage")
            .credentials(identity, credential)
            .buildView(BlobStoreContext.class);

        BlobStore blobStore = context.getBlobStore(); 

When you have completed your clouds object storage operations, you need to finish by closing the context:

       context.close(); 

##Using the BlobStore API## {#UsingtheBlobStoreAPI}

Listing all directories/containers for the given account:

        PageSet<? extends StorageMetadata> objects = blobStore.list();

Creating a new directory/container (in the default location):

        boolean created = blobStore.createContainerInLocation(null, <container>);

Viewing the contents of a directory or container:

        PageSet<? extends StorageMetadata> containerObjects = blobStore.list(<container>);

Creating a new file or object into an existing directory or container:

        Blob testBlob = blobStore.blobBuilder("testblob").payload("<content>").name("<name>").build();
        String etag = blobStore.putBlob(<container>, testBlob); // the creation of the blob returns the etag value

Viewing a file or object from an existing directory or container:

        Blob retrievedBlob = blobStore.getBlob(<container>, blob);

Deleting a file/object from an existing directory/container:

        blobStore.removeBlob(<container>, blob);

Deleting an existing directory/container:

        # Note: directory needs to be empty before it can be deleted!
        blobStore.deleteContainer(<container>);

##Using the Provider-Specific API## {#UsingtheProviderSpecificAPI}

        HPCloudObjectStorageClient hpcloudClient =
                HPCloudObjectStorageClient.class.cast(context.getProviderSpecificContext().getApi());

##Using the Object Storage CLI with the Provider-Specific API## {#UsingObjectStoragewiththeProviderSpecificAPI}


Listing all directories/containers for the given account:

        Set<ContainerMetadata> containerMetadataSet = hpcloudClient.listContainers();

Creating a container with public access but not CDN-enabled:

        boolean recreated = hpcloudClient.createContainer(<container>, withPublicAccess());

Checking to see if a container exists:

        boolean containerExists = hpcloudClient.containerExists(<container>);

Viewing the details of the public container:

        ContainerMetadata cm = hpcloudClient.getContainerMetadata(<container>);

Viewing the metadata information for the storage account:

        AccountMetadata accountMetadata = hpcloudClient.getAccountStatistics();

Putting an object in a container:

        SwiftObject object = hpcloudClient.newSwiftObject();
        object.setPayload("test object");
        object.getInfo().setName("testObject");
        System.out.println("object created");
        hpcloudClient.putObject(<container>, object);

Listing a container's objects:

        PageSet<ObjectInfo> objectInfos =
                hpcloudClient.listObjects(<container>, ListContainerOptions.NONE);
        
Retrieving an object from a container:

        SwiftObject obj =
                hpcloudClient.getObject(<container>, "testObject", GetOptions.NONE);
        System.out.println("retrieved object " + obj.getInfo().getName());

Removing an object from a container:

        hpcloudClient.removeObject(<container>, "testObject");
        System.out.println("object removed");

Deleting an existing directory or container:

        boolean deleted = hpcloudClient.deleteContainerIfEmpty(<container>);
        if(deleted) {
                System.out.println("the container was deleted");
        } else {
                System.out.println("the container could not be deleted");
        }