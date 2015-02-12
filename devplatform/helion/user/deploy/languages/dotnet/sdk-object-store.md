---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/dotnet/objectstore/
published: false
title: "Working with Object Storage in .NET"
---
<!--PUBLISHED-->
# HP Helion 1.0 Development Platform: Working with Object Storage in .NET

[Object Storage](http://docs.hpcloud.com/object-storage) is a web scale storage system.
It provides private and public access and is accessible through a simple but robust API. Within
the .NET SDK Library, a service client is used to provide a wrapper around the raw REST API.

Storage Service Client
-----------------------
The easiest method to access object storage is through the storage service client. The following example creates a credential to use for authentication, creates a client, connects, and creates a storage service client:

Code-block: csharp

    var authUri = new Uri("https://region.identity.host.com:12345/v2.0");
    var userName = "user name";
    var password = "password";
    var tenantId = "XXXXXXXXXXXXXX-Project";
    var credential = new OpenStackCredential(authUri, userName, password, tenantId);
            
    var client = OpenStackClientFactory.CreateClient(credential);
    var connectTask = await client.Connect();
            
    var storageServiceClient = client.CreateServiceClient<IStorageServiceClient>();

From here the service client can be used for performing most of the common object storage tasks.

##Listing Containers and Objects
Listing all of the containers or objects that a user has requires the account associated with the user.

Code-block:: csharp

      var storageAccountTask = await storageServiceClient.GetStorageAccount();
    
    The Account object holds a list of containers to which the user has access. The following example iterates through all of the containers in the account, makes a request to the server to get the details of each container, and prints the names of all of the objects inside the container to the console.
    
    .. code-block:: csharp
    
      foreach (var item in storageAccount.Containers)
      {
    Console.WriteLine("Container: " + item.Name);
    var container = await storageServiceClient.GetStorageContainer(item.Name);

    foreach (var obj in container.Objects)
    {
      Console.WriteLine("\t" + obj.Name);
    }
      }

##Creating new Containers and Objects
The storage service client can be used to create new containers and objects. 

The example below creates a new container called **SampleContainer** without any meta data associated with it. The same basic pattern can be used to create new objects as well.

Code-block: csharp

      await storageServiceClient.CreateStorageContainer("SampleContainer", new Dictionary<string, string>());
    
    
This example builds on the last example, adding a new storage object called **SampleObject** with contents from a local file to the newly created **SampleContainer** that was created in the last example.

**Note:** Objects can be overwritten by creating a new object with the same name.

Code-block: csharp
    
      using (var file = new FileStream("--Path to a file--", FileMode.Open))
      {
    await storageServiceClient.CreateStorageObject("SampleContainer", "SampleObject", new Dictionary<string, string>(), file);
      }

##Updating Container and Object Meta-data

The storage service client can also be used to update the meta-data associated with containers and objects. The example below creates a new container called "SampleContainer" without adding any meta-data to it. It then demonstrates how you would retrieve the details of the container, adds some new meta-data to it, then updates the container to include the new meta-data.

Code-block: csharp

    await storageServiceClient.CreateStorageContainer("SampleContainer", new Dictionary<string, string>());
    
    var container = await storageServiceClient.GetStorageContainer("SampleContainer");
    container.Metadata.Add("Title","Sample Container");
    
    await storageServiceClient.UpdateStorageContainer(container);

The following example shows how to use the same pattern for storage objects.

Code-block: csharp

    using (var file = new FileStream("--Path to a file--", FileMode.Open))
    {
      await storageServiceClient.CreateStorageObject("SampleContainer", "SampleObject", new Dictionary<string, string>(), file);
    }
    var obj = await storageServiceClient.GetStorageObject("SampleContainer","SampleObject");
    obj.Metadata.Add("Title","Sample Object");
    
    await storageServiceClient.UpdateStorageObject(obj);

##Deleting Containers and Objects
The following example uses the storage service client to delete the **SampleContainer** container.

Code-block: csharp
    
    await storageServiceClient.DeleteStorageContainer("SampleContainer");

A similar method can be called to delete storage objects as well.

In this example, the storage server client is used to remove the **SampleObject** from the container with the name **SampleContainer**.

Code-block: csharp
    
    await storageServiceClient.DeleteStorageObject("SampleContainer", "SampleObject");

##Downloading Objects
To download the contents of a storage object, use the DowloadStorageObject method. 

This example downloads the contents of the **SampleObject** from the **SampleContainer** and writes it to the given file stream.

Code-block:: csharp
    
      using (var fs = new FileStream("--Path to a file--", FileMode.CreateNew))
      {
    await storageServiceClient.DownloadStorageObject("SampleContainer", "SampleObject", fs);
      }


