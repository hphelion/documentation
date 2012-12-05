---
layout: default
title: "Introduction to the HP Cloud Identity Service"
permalink: /node/38
product: identity

---
# Introduction to the HP Cloud Identity Service

<!--This is a comment. Comments are not displayed in the browser-->
<!--<iframe src="LINK" width="640" height="464" frameborder="0"> </iframe>-->

Based on [Keystone, the OpenStack Identity Service](http://keystone.openstack.org/), the HP Cloud Identity Service provides one-stop authentication for all HP Cloud Service offerings.  The Identity Service allows clients to obtain tokens that can be used to access cloud services.  (If you are unfamiliar with the Keystone terminology, the [HP Cloud Identity Service Overview](/identity) page contains a list of key terms.)

## Identity Service Information Flow

The following figure shows you how the HP Cloud Identity Service works and how your requests are authenticated. 

<center><img src="media/identity%20process.png" width="580" height="422" alt="" /></center>

<br>
As you can see in the illustration, the authentication process goes like this:

<!--I'd like to take out those parentheticals and replace them with links to the definitions, but perhaps not; is there some programmatic way we can pull up definitions without the user having to surf to the glossary page?-->
1. A User sends an authentication request to the Identity Service.  You can send access keys or your username and password combination to prove that you are who you say you are.<br><strong>Note</strong>:  HP Cloud Services recommends you perform authentication using the access key method.  Most importantly, a breach of access keys is far more recoverable than one involving username/password.  In addition, Tenant IDs don’t change, whereas Tenant names can be modified, so if you use Tenant IDs you guarantee a modified Tenant name won’t cause authentication errors or breakdowns.<br>
2. The Identity Service responds and the response contains an _Authentication Token_ (a string which must be used for subsequent requests to other services) and a _Service Catalog_ (a list of services and their endpoints for which the Authentication Token is valid).
3. A User sends requests to the services from the Service Catalog, passing along the Authentication Token.  All HP Cloud Services are integrated with the Identity Service so that the Authentication Token can correctly identify a User and provide the appropriate access.

## Key Identity Service Concepts

When working with the HP Cloud Identity Services, it's critical to understand the concept of Tenants, Tokens (Scoped and Unscoped), and the REST API.

### Tenants
A Tenant is a collection of HP Cloud Services subscriptions and/or resources.  Think of a Tenant as a set of Compute, Storage and/or other resources that you might use for a given project.  Currently your account only has one Tenant and all your HP Cloud resources are managed within that Tenant.  Over time, we’ll add the ability to manage multiple Tenants so that you can group resources by project or in any other manner you like.  Associated with a Tenant is a catalog of services that are available to that Tenant called a Service Catalog.  As you dig deeper and start to use the Identity Service more, you’ll come across the Tenant ID and associated Service Catalog concepts.

### Scoped and Unscoped Tokens
A Scoped Token is one that is associated with a Tenant and can be used to access HP Cloud Services  or resources managed within that Tenant. In other words, you need a Scoped Token to access the services and other resources within your account.  A Service Catalog returned with a Scoped Token includes all the services that are available to you.

An Unscoped Token is not associated with a Tenant, and you cannot use it to access the services or resources within your account.  You can only use Unscoped Tokens to access the Identity Service itself.  That is, you can use Unscoped Tokens to make Identity Service API calls.  For example, if you need to determine information about your Tenant then you would use an Unscoped Token to call the Identity Service.

With a Scoped Token request, the service catalog that gets returned includes endpoints to the service that are available to you, as well as generally-available endpoints (such as for the Identity Service).  With an Unscoped Token request, the service catalog only includes generally-available endpoints.   Because you need a Scoped Token to access your services, you can see why using Tenant IDs for your calls is important.

### REST API

The Identity Service REST API allows you to authenticate Users, list Tenants available to your User, rescope an existing Authentication Token to an available Tenant, and invalidate an existing Authentication token.  

## Identity Service Example
Suppose we had a User named falken@wg.com who has activated the HP Cloud Compute service only.  His own Tenant is the same as his login name and he’d like to obtain a Scoped Authentication Token for his Tenant.  How would he do this?

__NOTE__:  The examples below authenticate with username, password and Tenant name for clarity purposes.  We'd just like to remind you again that we recommend authenticating with access keys and Tenant IDs.

<center><img src="media/identity%20service%20ex-1.png" width="580" height="278" alt="" /></center>

1. The User authenticates with his username, the password and the Tenant Name.  
2. The response: the Authentication Token <font face="courier">XYZ</font> and a Service Catalog that contains a list of the services activated for the Tenant.  <font face="courier">XYZ</font> is a Scoped Token for both the HP Cloud Identity Service and HP Cloud Compute.  If you don't send a Tenant Name with this request, <font face="courier">XYZ</font> is an Unscoped Token whose Service Catalog contains only the Identity Service.
