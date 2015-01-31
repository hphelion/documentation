---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/dotnet/getstarted/
published: false
title: "Getting Started With The .NET SDK"
---
<!--PUBLISHED-->

# HP Helion Development Platform: Getting Started With The .NET SDK

The .NET SDK library is built on top of HP Helion OpenStack&reg; APIs, which removes many of the
complexities of working with the APIs so that developers can focus on writing applications.

The library is designed to be pulled into a .NET application that interacts with HP Helion OpenStack&reg; services through the use of .NET objects, methods, and functions.

The .NET SDK library is available via [Github](https://github.com/stackforge/openstack-sdk-dotnet) and [Nuget](https://www.nuget.org/packages/OpenStack-SDK-DotNet).

Using Nuget, you can include the library by running the following command in the [Package Manager Console](http://docs.nuget.org/docs/start-here/using-the-package-manager-console)

Code-block: yaml

    PM> Install-Package OpenStack-SDK-DotNet

If you aren't using Nuget you can download the library from [Github](https://github.com/stackforge/openstack-sdk-dotnet).

##A Quick Example

For example, we can write a console application that lists all of the storage containers in a user's storage account.

Code-block: csharp

       using System;
       using OpenStack;
       using OpenStack.Identity;
       using OpenStack.Storage;
    
       namespace ConsoleSample
       {
      class Program
      {
     static void Main(string[] args)
     {
    //First we need to create a credential for connecting to the remote services.
    var authUri = new Uri("https://region.identity.host.com:12345/v2.0");
    var userName = "user name";
    var password = "password";
    var tenantId = "XXXXXXXXXXXXXX-Project";
    var credential = new OpenStackCredential(authUri, userName, password, tenantId);
    
    //Next we create a client, and connect it.
    var client = OpenStackClientFactory.CreateClient(credential);
    var connectTask = client.Connect();
    connectTask.Wait();
    
    //Then we create a storage client for working with the object storage service.
    //and get the default storage account.
    var storageServiceClient = client.CreateServiceClient<IStorageServiceClient>();
    var storageAccountTask = storageServiceClient.GetStorageAccount();
    storageAccountTask.Wait();
    
    //Once we have the default storage account, simply loop through the containers.
    //and output them to the console.
    var storageAccount = storageAccountTask.Result;
    foreach (var container in storageAccount.Containers)
    {
       Console.WriteLine(container.Name);
    }
    Console.ReadLine();
    }
    }

Leveraging the .NET SDK library, the code above creates a credential for authentication; creates and connects
a client; uses the client to create a storage service client to get the users account; and enumerates
through all of the containers in the account, printing the name of each one to the console.
