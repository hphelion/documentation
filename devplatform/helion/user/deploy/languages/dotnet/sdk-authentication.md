---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/dotnet/authentication/
published: false
title: "Identity Service, Authentication, and the Service Catalog in .NET"
---
<!--PUBLISHED-->

# HP Helion Development Platform: Identity Service, Authentication, and the Service Catalog in .NET
=================================================================
The [Identity Service API](https://docs.hpcloud.com/identity) is central to using the
APIs for the HP Helion OpenStack&reg; services. The Identity Service not only addresses authentication
but also supplies a catalog of information around the activated and available services.
In other words, the Identity Service API provides the communication API endpoints for services Object Storage, Network, and Compute within the different regions that are available.

The HP Helion .NET SDK provides functionality for basic authentication with the identity service.

Authentication and Tokens
-------------------------
Your first step is to authenticate as a user with the username and password used to log in to the console.

Since services are associated with tenants you need to use a tenantId to
get a valid token for a set of services.

Authenticate as a user by first creating a credential. This example shows how to create a new credential object that can be used by a client to authenticate the user. 

Code-block: csharp

       var authUri = new Uri("https://region.identity.host.com:12345/v2.0");
       var userName = "user name";
       var password = "password";
       var tenantId = "XXXXXXXXXXXXXX-Project";
       var credential = new OpenStackCredential(authUri, userName, password, tenantId);

The next step in the process is to create a client and connect it:

Code-block: csharp

       var client = OpenStackClientFactory.CreateClient(credential);
       await client.Connect();

If authentication failed or there was another error an exception is thrown. There are a
number of exceptions that can be caught depending on the type of error that occurred.

If authentication is successful, the client can be used to access individual service clients for each of the supported services. The client retains all of the authentication details and passes them along to the requested service clients. The actual authentication token is stored in the AccessTokenId property of the client.

## Service Catalog

The service catalog lists the available services. Accessing the catalog, which includes
the API endpoints, is fairly simple through the use of the ServiceCatalog property on the client. The following example demonstrates the use of the ServiceCatalog property in order to list out each of the names of all the available services in a region called "RegionOne". 

Code-block: csharp

       var services = client.Credential.ServiceCatalog.Where(s => s.Endpoints.Any(e => e.Region == "RegionOne"));
       foreach (var service in services)
       {
      Console.WriteLine(service.Name);
       }
