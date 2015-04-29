---
layout: page
permalink: /publiccloud/api/CDN/
title: "HP Helion Public Cloud CDN API Specifications"
description: "HP Helion Public Cloud CDN API"
keywords: "content data network, cdn, object storage"
product: cdn

---
<!--PUBLISHED-->
# HP Helion Public Cloud CDN API Specifications

**Date:** June 2014

**Document Version:** 1.5

## 1. Overview

Using the HP Helion Public Cloud Content Delivery Network (CDN) service, content inside HP Helion Public Cloud Object Storage can easily be cached on servers in metropolitan areas all over the world to speed client access to them by removing much of the network latency. Once a container created in the Object Storage service has been enabled with the CDN service, all objects within that container are automatically distributed to servers on the worldwide Content Delivery Network.

The HP Helion Public Cloud CDN API described in this document lets you turn on and off the CDN capability of an Object Storage container. The API also allows you to change CDN attributes of the CDN-enabled container.

We will be referring to the HP Helion Public Cloud CDN service in this document as simply the CDN service and the HP Helion Public Cloud Object Storage service as simply the Object Storage service.

### 1.1 API Maturity Level

**Maturity Level**: *GA*

**Version API Status**: *CURRENT*

### 1.2 Document Revision History

|Document Version|Date |Description|
|:--------       |:----| :------ |
|1.0|December 2012|Initial creation|
|1.1|May 2013|Added [StaticWeb](#staticweb) description|
|1.2|April 2014|Updated references to Project instead of Tenant|
|   |Updated references to account to reflect project in examples|
|1.3|May 2014|HP Helion updates|
|1.4|June 2014|Clarified the StaticWeb settings when a container is already public when you CDN-Enable a container. See [Customizing StaticWeb Metadata](#staticweb_metadata)|

## 2. Architecture View
### 2.1 Overview
#### 2.1.1 CDN Enabled Containers #### {#cdn_uri}

When you CDN-enable an Object Storage container, the service creates a
CNAME corresponding to the container. The CDN service returns this CNAME to you in the [X-Cdn-Uri](#x_cdn_uri_response) response header. You can then access objects in the container using this endpoint -- bypassing the normal Object Storage service access point.
 
For example, you could could have a container called `animals`. Using the Object Storage API, you would access an object called `mose.jpg` with a URL such as the following:

    https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/animals/mose.jpg

When you CDN-enable the 'animals' container, the system assigns a CNAME and returns it in the [X-CDN-URI](#x_cdn_uri_response) response header. Here is an example of such a response:

    http://h1dbbb5c59541c721905ae1a7a433b50c.cdn.hpcloudsvc.com`

In this example, the CNAME `h1dbbb5c59541c721905ae1a7a433b50c.cdn.hpcloudsvc.com` has been assigned to this container. To access the object via the CDN service, use this URL:

    http://h1dbbb5c59541c721905ae1a7a433b50c.cdn.hpcloudsvc.com/mose.jpg

> Note: It can take up to 20 minutes for the CNAME to propagate to the DNS servers. During that time the CDN URLs will not resolve.

If you prefer to use SSL (i.e., HTTPS) to access the object, the CDN service also assigns a URI to the [X-CDN-SSL-URI](#x_cdn_ssl_uri_response) attribute. This has a different format than the X-CDN-URI attribute, but is otherwise used in the same way i.e., append your object name to the URI to access it.

When you CDN-enable a container, all objects in the container become public when accessed via the X-CDN-URI endpoint; there are no authentication tokens or other access controls needed to give read access to the consumers of the object contents. However, you cannot list the contents of an Object Storage container via the X-CDN-URI endpoint.

#### 2.1.2 Time to Live #### {#ttl}

When a container is CDN-enabled, any objects stored in that container are publicly accessible over a Content Delivery Network. When you first access an object, the CDN will fetch and cache the object from the Object Storage service. The object is cached for the Time to Live (TTL) attribute specified for the CDN-enabled container.

The Time to Live (TTL) is specified in seconds. The default is 24 hours or 86400 seconds. The minimum TTL that can be set is 15 minutes (900 seconds); the maximum TTL is 50 years (range of 900 to 1577836800 seconds).

On the next access after the TTL expiration, the CDN service will re-fetch the object and cache it again for another TTL (value) seconds. 

To specify the TTL, use the [X-TTL](#x_ttl_request) request header when enabling or updating a CDN-enabled container. Setting the TTL is the same as setting the HTTP Expires and Cache-Control headers for the cached object. Setting a TTL for a long time, such as 5 years, does not guarantee that the content will stay populated on the CDN edge servers for the entire five-year period. The most popular objects stay cached based on the edge servers logic. 

If you change the Time to Live (TTL), disable or delete a CDN-enabled container, objects will remain in the cache until the TTL has expired. Contact the Support Team if you have an urgent need to purge objects from the CDN service.

> Note: The Content Data Network also sets the Time to Live (TTL) in the Cache-Control response header. This means that browsers may cache content for an additional time beyond the Content Delivery Network cache TTL. 

#### 2.1.3 Accessing Objects via the Content Data Network #### {#cdn_response}

As mentioned above, when an Object Storage container is CDN-enabled, the URI is in the [X-CDN-URI](#x_cdn_uri_response) (HTTP) and [X-CDN-SSL-URI](#x_cdn_ssl_uri_response) (HTTPS) response headers. You can append the object name to create a URL for the object. For example, if X-CDN-SSL-URI is:

    https://a248.e.akamai.net/cdn.hpcloudsvc.com/hfca975d1c4bdcd674a70d36b24552607/prodaw2

If your object is called `mose.jpg`, the resulting URL is:

    https://a248.e.akamai.net/cdn.hpcloudsvc.com/hfca975d1c4bdcd674a70d36b24552607/prodaw2/mose.jpg

You may embed this URL in web pages. When a browser opens this URL, it is accessing the Content Data Network -- not the underlying Object Storage service.

When you access the object via the Content Data Network, the GET operation includes the following response headers:

* Last-Modified. This is the date and time at which the object was last modified
 
* ETag. This is the MD5sum checksum of the contents of the object. You can compare this to the body of the response (i.e. to the downloaded content) to verify end-to-end integrity.

* Content-Length. This is the length of the object contents.

* Content-Type. This is the type of content.

* Cache-Control. This contains a value such as `public, max-age=86392`, where the `max-age` is the [Time to Live (TTL)](#ttl) of the CDN-enabled container.

* Expires. If you access the object after this date and time, the Content Data Network will fetch a new copy from the Object Storage service. 

The following example, shows how you could use curl to download an object from a CDN-enabled container.

    curl -i http://h1dbbb5c59541c721905ae1a7a433b50c.cdn.hpcloudsvc.com/mose.jpg -X GET
    HTTP/1.1 200 OK
    Last-Modified: Wed, 12 Dec 2012 18:12:38 GMT
    ETag: "d82f932e50cec6c5b2c5a502dc3840bf"
    Content-Length: 21
    Content-Type: text/plain; charset=UTF-8
    Cache-Control: public, max-age=86392
    Expires: Wed, 12 Dec 2012 18:27:48 GMT

### 2.2 CDN Interaction with Object Storage StaticWeb ### {#staticweb}
#### 2.2.1 StaticWeb Overview ####

The combination of CDN and Object Storage StaticWeb provides the following features for building a static web site hosted on the CDN service.

* Default pages
* A custom error page
* Automatic directory listing. This is disabled by default.

When you CDN-enable a container and the container exists in Object Storage, the CDN service automatically configures the container with StaticWeb metadata.

The default values we use are described in [Customizing StaticWeb Metadata](#staticweb_metadata). If the default values do not not suit your application, you are free to change the StaticWeb metadata using the Object Storage API. You do not change this metadata using the CDN API.

#### 2.2.2 Step by Step StaticWeb Example #### {#staticweb-example}

In this example, our web site will have two HTML pages ("index.html", "about/index.html") and an image ("mose.jpg") in our CDN-enabled container. The homepage ("index.html") looks like this:

    <html>
    <title1>Home Page</title>
    <p>There is more information in this <a href="/about/">sub page</a></p>

The subpage ("about/html") looks like this:

    <html>
    <title>Subpage</title>
    <p>This is what a <a hef="/mose.jpg">Mose</a> looks like.</p>

Upload the files into the "animals" container. The Object Storage URLs for these objects are now:

    https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/animals/index.html
    https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/animals/about/index.html
    https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/animals/mose.jpg

You can use the Public Cloud Console to upload these files. Alternatively can also use the Object Storage API directly. For example, to upload the "about/index.html" object, use a command such as the following:

    $ curl -H "X-Auth-Token: {Auth_Token}" https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/animals/about/index.html -X PUT -T ./about/index.html

Next CDN-enable the "animals" container [see CDN-Enable a Container](#container_put)). You can use the Public Cloud Console to CDN-enable the container. Alternatively can also Use the CDN API as shown in this example:

    $ curl -H "X-Auth-Token: {Auth_Token}" https://region-a.geo-1.cdnmgmt.hpcloudsvc.com/v1.0/12345678912345/animals -X PUT 
    HTTP/1.1 201 Created
    X-Cdn-Uri: http://h1dbbb5c59541c721905ae1a7a433b50c.cdn.hpcloudsvc.com

As you can see, the enable operation returns the X-CDN-URI that allows you to access the content through the CDN service. The full URL's for the three objects are as follows:

    http://h1dbbb5c59541c721905ae1a7a433b50c.cdn.hpcloudsvc.com/index.html
    http://h1dbbb5c59541c721905ae1a7a433b50c.cdn.hpcloudsvc.com/about/index.html
    http://h1dbbb5c59541c721905ae1a7a433b50c.cdn.hpcloudsvc.com/mose.jpg

Notice that the container name ("animals") does not appear in the URL.
The CNAME (h1dbbb5c59541c721905ae1a7a433b50c.cdn.hpcloudsvc.com) assigned to you is not very convenient. Assuming you owned the example.com domain, you could create a CNAME called mose.example.com pointing to h1dbbb5c59541c721905ae1a7a433b50c.cdn.hpcloudsvc.com. The URL for the "index.html" object now becomes simply:  

    http://mose.example.com

As you can see, you don't need to specify the path to the "index.html" object because we have automatically configured this as the default page. This also applies to [pseudo-directories](#pseudo_directtories]. For completeness, here is a full list of the URLs that all resolve to the "about/index.html" page:

    http://mose.example.com/about
    http://mose.example.com/about/
    http://mose.example.com/about/index.html
    http://h1dbbb5c59541c721905ae1a7a433b50c.cdn.hpcloudsvc.com/about
    http://h1dbbb5c59541c721905ae1a7a433b50c.cdn.hpcloudsvc.com/about/
    http://h1dbbb5c59541c721905ae1a7a433b50c.cdn.hpcloudsvc.com/about/index.html
    https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/animals/about
    https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/animals/about/
    https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/animals/about/index.html

The last three URLs bypass the CDN service and provide direct access to the objects. Normally, you would not give these URLs to your users. However, these URLs can be useful to test your web site since any changes are immediately visible whereas with the CDN changes only become visible after the Time to Live (TTL) expires.

> Note: the paths ending in "/" (e.g., "/about/") cause the system to respond with a "redirect" -- not the actual page.

> Note: in this example, "about/" does not actually exist as an object in the Object Storage system. This is known as a pseudo-directory. See later for restrictions on [pseudo-directories](#pseudo_directories).

#### 2.2.3 Customizing StaticWeb Metadata #### {#staticweb_metadata}

The following table describes the StaticWeb metadata and describes the defaults applied when you CDN-enable a container. As mentioned earlier, this metadata is set on the Object Storage container and is **not** seen or modified through the CDN API.

As described in the table, some settings depend on whether the container is
already public through the HP Helion Object Storage API. A container is
public if the X-Container-Read metadata has a value such as ".r:*, .rlistings". The general principal is that if you could list the container contents through the Object Storage API, you should also be able to list the contents via the CDN endpoint. Otherwise, automatic container listings is disabled.

|Metadata|Original X-Container-Read|Value assigned to metadata|Notes|
|:---- |:---- |:---- |:---- |
|X-Container-Read|Not set (private)|The X-Container-Read value is set to ".r:*, .rlistings". This makes the container publically visible to everybody through the Object Storage API (in addition to being also publically available through the CDN).||
|X-Container-Read|Set (public)|The X-Container-Read value is not changed.||
|X-Container-Meta-Web-Index|N/A|If an object called "index.htm" exists in the container, the value of X-Container-Meta-Web-Index is set to "index.htm". If not, the value is set to "index.html".|This is the default page for the root of the container and also for all [pseudo-directories](#pseudo_directories) in the container. If you do not upload object(s) of this name, you will receive a 404 Not Found error for any requests that do not explicitly name the object in the path. This is because the system cannot find the default page.|
|X-Container-Meta-Web-Error|N/A|Set to "error.html".|This allows you to customize the error messages. If you upload objects called "401error.html" and "404error.html", their contents will be used instead of the system&#39;s error message for 401 Unauthorized and 404 Not Found respectively. As you can see, the system prefixes either "401" or "404" to the value of X-Container-Meta-Web-Error.|
|X-Container-Meta-Web-Listings|Not set|Not set.|By default, we do not enable automatic directory listings for containers that were not public at the time they were CDN-Enabled.|
|X-Container-Meta-Web-Listings|Set to ".r:*, .rlistings" (public)|Set to true.|If the container is already public, that is, you can list the contents via the HP Helion Object Storage API, when you CDN-Enable it, you can also list the contents via the CDN network.|
|X-Container-Meta-Web-Listings-CSS|N/A|This provides the name of a style file used for automatic directory listings.|We do not set this value. If you use automatic web listings, you can upload the style file to the container and set this metadata to contain the style file object name.|

You may use the Object Storage API to change any of this metadata.

#### 2.2.4 Pseudo-Dirctory Notes #### {#pseudo_directories}

As explained in the Object Storage API Specification, there are two ways to implement directory-like structures within a container. These are referred to pseudo-directories because there is no real directory structure within a container. However, you can search for pseudo-directories as follows:

- Use prefix/delimiter searching. The names of the objects contain the pseudo-hierarchical structure, but here are no real objects to represent a folder or directory. The "about/index.html" object described above in [Step by Step StaticWeb Example](#staticweb-example) is an example of this. There is no object called "about/"; instead the name of the object ("about/index.html") contains the pseudo-directory.

- Use path searching. Create placeholder objects to represent folders or directories. The objects are also named to include the hierarchy. For example, you would create an object called "about/" in addition the "about/index.html" object.

> Note: at this time, automatic directory listing (Container-Meta-Web-Listings=true) does not support path-style pseudo directories.

#### 2.2.5 StaticWeb and HTTPS (SSL) Access ####

At this time, the default page and automatic directory listing features do not work for HTTPS accesses to the root of a container. They work as expected for access to pseudo-directories.

### 2.3 Relationship between CDN and Object Storage Container ###

A container does not need to exist in the Object Storage service when you use the CDN service to enable a container (see [CDN-Enable a Container](#container_put)). A side effect of CDN-enabling a container is that the underlying container is also created in the Object Storage service.

At this time, the system will not stop you from deleting the underlying container from the Object Storage service. We may change this behaviour in a future release, so we recommend you do not delete the Object Storage container until you have also deleted the container from the CDN service.

[Deleting a CDN service container](#container_delete) does not delete the underlying Object Storage container. It simply means that the CDN will no longer contain objects (this is subject to the Time to Live (TTL) value -- the objects may not be flushed from the Content Data Network until the TTL expires). The underlying data remains intact in the Object Storage service.

You can re-enable a previously deleted CDN container.

### 2.4 Authentication ###

Using the Identity Service API, you can authenticate yourself for a specific project. The Identity Service returns a token. In subsequent operations, you include this token in the 'X-Auth-Token' request header. The value of the token is used to identify you. If you are associated with the project, you now have full access to the CDN services for that Object Storage *account*. See [Using Authentication Tokens](#using_tokens) for more information.

####  2.4.1 Using Authentication Tokens #### {#using_tokens}

The CDN service is not responsible for authenticating the identity of users. Instead, the Identity Service is responsible for authentication and identity management.

To identify that a request is issued on behalf of or by a user, the user first makes a request to the Identity Service. In this request, the user gives their credentials and gets an authorization token in response. In subsequent requests to the CDN service, the authentication token is included in the request. The X-Auth-Token request header is used by the API to include the token in the request.

#### 2.4.2 Getting an authentication token ####

To make a request to the Identity Service, you need:

Your credentials   
Your project Id or project Name.

The credentials can either be:

* Username and password, i.e., the same username and password they would use to log into the Public Cloud Console

* Access Key ID and Access Secret Key. You can see your Access Keys on the Manage Access Keys option in the user menu of the Public Cloud Console. Access Keys are more suitable for use in APIs because you can create them for use in a specific application. However, if you suspect that an application's Access Keys have been compromised, you can delete the Access Key. This is more convenient than changing your password credentials. However, not all API bindings support Access Keys.

In addition, to credentials, you also specify a project -- either the Id or Name. With your credentials and project, the Identity Service checks to see whether you have activated the CDN service. If so, it returns an authentication token and the endpoints to all instances of the CDN service that you are activated for. See [Service Catalog](#service_catalog) for an example of how the authentication token and endpoints are returned.

### 2.5 Arbitrary Limits ### {#uri_limits}

The following constraints apply to the API's HTTP requests:

* Maximum number of HTTP headers per request: 90
* Maximum length of all HTTP headers: 4096 bytes
* Maximum length per HTTP request line: 8192 bytes
* Maximum length of HTTP request: 5 gigabytes
* Maximum length of container name: 256 bytes
* Maximum length of object name: 1024 bytes

Container and object names should be properly URL-encoded and the container and
object names must be UTF-8 encoded. The length restrictions should be checked against the URL encoded string.

### 2.6 HTTP Status Codes ### {#http_codes}

The following HTTP codes are used by the CDN service.

|Code      | Description    | Notes   |
|:-------- | :------------  | :------ |
|200 OK    | Standard response for successful requests. | The actual response will depend on the specific operation. |
|201 Created| Standard response for successful enabling of a container. | The actual response will depend on the specific operation. |
|202 Accepted | Standard response for successful updates to container or object. | The actual response will depend on the specific operation. |
|204 No Content | Standard response to HEAD operations. It is also the response when listing an account used to have CDN-enabled containers but no longer does. | The response is in the response headers, there is no body in the response. |
|401 Unauthorized | This usually means that the [authorization token in X-Auth-Token](#using_tokens) is invalid (or missing). | If, the token was valid at some stage and you then get this error, it has probably expired and you simply need to get a new authorization token.|
|403 Forbidden | The request was a valid request, you do not have the appropriate access rights to the resource. | |
|404 Not Found | The requested resource account or container could not be found. It is also used when an account never has any containers CDN-enabled. | |
|414 Request-URI Too Long | The URI provided was too long for the server to process. | See [Arbitrary Limits](#uri_limits) |

## 3. Account-level View
### 3.1 Accounts

There is a one-to-one relationship between an account and the _project_. The CDN service account and project ID are the same. There is a one-to-one correspondence between the CDN and Object Storage service accounts. The CDN service endpoint in the [Service Catalog] contains the *account* in the URL.

### 3.2 Regions and Availability Zones

The CDN service has the following service instances in these regions:

* region-a-geo-1 - US West   
* region-b.geo-2 - US East

Each instance or region is a distinct storage entity. Each contains its own set of containers and objects -- there is no shared data between the regions.

### 3.3 Service Catalog ### {#service_catalog}

The Identity Service is used to authenticate users. See [Using Authentication Tokens](#using_tokens) for more information.

For additional details on the Identity Service, please refer to
[http://docs.hpcloud.com/api/v13/identity](http://docs.hpcloud.com/api/v13/identity).

The service is exposed in the service catalog, as shown in the following fragment. Note the user is activated for two instances of the CDN service. Use the `publicURL` to perform all CDN API operations described in this document.

    {
        "name": "CDN",
        "type": "hpext:cdn",
        "endpoints": [
          {
            "tenantId": "87135022548315",
            "publicURL": "https:\/\/region-a.geo-1.cdnmgmt.hpcloudsvc.com\/v1.0\/12345678912345",
            "region": "region-a.geo-1",
            "versionId": "1.0",
            "versionInfo": "https:\/\/region-b.geo-1.cdnmgmt.hpcloudsvc.com\/v1.0\/",
            "versionList": "https:\/\/region-b.geo-1.cdnmgmt.hpcloudsvc.com\/"
          },
          {
            "tenantId": "87135022548315",
            "publicURL": "https:\/\/region-b.geo-1.cdnmgmt.hpcloudsvc.com\/v1.0\/12345678912345",
            "region": "region-b.geo-1",
            "versionId": "1.0",
            "versionInfo": "https:\/\/region-b.geo-1.cdnmgmt.hpcloudsvc.com\/v1.0\/",
            "versionList": "https:\/\/region-b.geo-1.cdnmgmt.hpcloudsvc.com\/"
          }
        ]
    }

## 4. REST API Specifications
### 4.1 Service API Operations

**Host - US West Region**: https://region-a.geo-1.cdnmgmt.hpcloudsvc.com

**Host - US East Region**: https://region-b.geo-1.cdnmgmt.hpcloudsvc.com

**BaseURI**: {Host}

**Admin URI**: N/A

| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? | Privilege Level |
| :------- | :------------------- | :---------- | :--------------------- | :---------------- | :-------------: |
| Account    | [List CDN-Enabled Containers](#account_get) | GET | /v1.0/{project_id} | Y  |  | 
| Container  | [CDN-Enable a Container](#container_put) | PUT | /v1.0/{project_id}/{container} | n/a  |  | 
| Container  | [Retrieve CDN-Enabled Container Metadata](#container_head) | HEAD | /v1.0/{project_id}/{container} | n/a  |  | 
| Container  | [Update CDN-Enabled Container Metadata](#container_post) | POST | /v1.0/{project_id}/{container} | n/a  |  | 
| Container  | [Delete CDN-Enabled Container](#container_delete) | DELETE | /v1.0/{project_id}/{container} | n/a  |  | 

### 4.2 Common Request Headers

#### 4.2.1 X-CDN-Enabled #### {#x_cdn_enabled_request}

This can be used to temporarily disable a CDN-enabled container. Setting the value to 'False', disables the container. Setting to 'True', re-enables the container.
 
#### 4.2.2 X-Auth-Token #### {#x_auth_token_request}

An authentication token must be presented to the service. This identifies the user and determimes whether they are allowed to perform the request. See [Using Authentication Tokens](#using_tokens) for more information.

#### 4.2.3 X-TTL #### {#x_ttl_request}

This is the value of the [Time to Live (TTL)](#ttl). The value is in seconds.

### 4.3 Common Response Headers

#### 4.3.1 X-CDN-URI #### {#x_cdn_uri_response}

The URI of the CDN-Enabled container. Objects stored in that container are publicly accessible over the CDN service by combining the 
container's CDN URI with the object name. See [Accessing Objects via the Content Data Network](#cdn_response) for more information.

#### 4.3.2 X-CDN-SSL-URI #### {#x_cdn_ssl_uri_response}

The SSL (HTTPS) URI of the CDN-Enabled container. Objects stored in that container are publicly accessible over the CDN service by combining the container's CDN URI with the object name. See [Accessing Objects via the Content Data Network](#cdn_response) for more information.

#### 4.3.3 X-TTL #### {#x_ttl_response}

The Time to Live (TTL) attribute of the CDN-enabled container. See [Time to Live (TTL)](#ttl) for more information.

### 4.4 Service API Operation Details
#### 4.4.1 Account

**Status Lifecycle**   
N/A

**Rate Limits**   
N/A

**Quota Limits**   
N/A

**Business Rules**   
None.

##### 4.4.1.1 List CDN-Enabled Containers ##### {#account_get}  
##### GET /v1.0/{project_id}

Retrieve a list of existing CDN-enabled containers.

There is also support for filtering the list to return only the list of containers that are currently CDN-enabled. Passing in a query parameter of `?enabled_only=true` will suppress containers that have X-CDN-Enabled set to `False` so they will not appear appear in the list.

When doing a GET request against an account or container, the service returns a maximum of 10,000 names per request. To retrieve subsequent names, you must make another request with a *marker* parameter. The marker indicates where the last list left off; the system returns  names greater than this marker, up to
10,000 again. Note that the marker value should be URL-encoded prior to sending the HTTP request.

If 10,000 is larger than desired, a *limit* parameter may be given.

If the number of names returned equals the limit given (or 10,000 if no limit is given), it can be assumed there are more names to be listed. If the name list is exactly divisible by the limit, the last request has no content.

**Request Data**

The path specifies the account.

**URL Parameters**

By default up to 10,000 names are returned. To retrieve more or fewer names, use the *limit* and *marker* query parameters.

The following query parameters are available:

* *limit* - (Optional) - Number - For an integer value of _N_, limits the number of results to at most _N_ values.

* *marker* - (Optional) - String - Given a string value _x_, return container names greater in value than the specified marker.

* *format* - (Optional) - String - Specify either `json` or `xml` to return the respective serialized response.

* *enabled_only* - (Optional) - true/false - Set to true to return only CDN-enabled containers whose [X-CDN-Enabled](#x_cdn_enabled_request) flag is set to true. When set to false, the listing will return all CDN-enabled containers, even those whose X-CDN-Enabled attribute is set to False.

**Data Parameters**

This operation does not require a request body.

**Success Response**

If the account contains CDN-Enabled containers, their names are returned in the requested format in the response body.
If there are no CDN-Enabled containers currently in the account (but there were some at one stage), 204 (No Content) is returned.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Response Data**

If there are containers, their names are returned in the response body in the requested format as
shown in the following examples. The JSON and XML formats return additional information
about the container as follows:
* cdn_enabled - Whether the container is currently CDN-Enabled or not
* ttl - The Time to Live (TTL) for objects in the container
* x-cdn-uri - The CDN URI you can use to access objects in the container
* x-cdn-ssl-uri - The CDN USI you can use to access objects in the container via SSL (HTTPS)
* log_retention - Reserved for future use

Text/Plain

    beets
    animals
    surveillance

JSON

    {
      "name":"beets",
      "cdn_enabled":true,
      "ttl":86400,
      "x-cdn-uri":"http://h1dbbb5c59541c721905ae1a7a433b50c.cdn.hpcloudsvc.com",
      "x-cdn-ssl-uri" : "https://a248.e.akamai.net/cdn.hpcloudsvc.com/h1dbbb5c59541c721905ae1a7a433b50c/prodaw2",
      "log_retention":false
    },
    {
      "name":"animals",
      "cdn_enabled":true,
      "ttl":86400,
      "x-cdn-uri":"http://abcbbb5c59541c721905ae1a7a433b50c.cdn.hpcloudsvc.com",
      "x-cdn-ssl-uri" : "https://a248.e.akamai.net/cdn.hpcloudsvc.com/abcbbb5c59541c721905ae1a7a433b50c/prodaw2",
      "log_retention":false
    },
    {
      "name":"surveillance",
      "cdn_enabled":false,
      "ttl":1024,
      "x-cdn-uri":"http://defbbb5c59541c721905ae1a7a433b50c.cdn.hpcloudsvc.com",
      "x-cdn-ssl-uri" : "https://a248.e.akamai.net/cdn.hpcloudsvc.com/defbbb5c59541c721905ae1a7a433b50c/prodaw2",
      "log_retention":false
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <account name="12345678912345">
      <container>
        <name>beets</name>
        <cdn_enabled>True</cdn_enabled>
        <ttl>86400</ttl>
        <x-cdn-uri>http://h1dbbb5c59541c721905ae1a7a433b50c.cdn.hpcloudsvc.com</x-cdn-uri>
        <x-cdn-ssl-uri>https://a248.e.akamai.net/cdn.hpcloudsvc.com/h1dbbb5c59541c721905ae1a7a433b50c/prodaw2</<x-cdn-ssl-uri>
        <log_retention>False</log_retention>
      </container>
      <container>
      <container>
        <name>animals</name>
        <cdn_enabled>True</cdn_enabled>
        <ttl>86400</ttl>
        <x-cdn-uri>http://abcbbb5c59541c721905ae1a7a433b50c.cdn.hpcloudsvc.com</x-cdn-uri>
        <x-cdn-ssl-uri>https://a248.e.akamai.net/cdn.hpcloudsvc.com/abcbbb5c59541c721905ae1a7a433b50c/prodaw2</x-cdn-ssl-uri>
        <log_retention>False</log_retention>
      </container>
        <name>surveillance</name>
        <cdn_enabled>False</cdn_enabled>
        <ttl>1024</ttl>
        <x-cdn-uri>http://defbbb5c59541c721905ae1a7a433b50c.cdn.hpcloudsvc.com</x-cdn-uri>
        <x-cdn-ssl-uri>https://a248.e.akamai.net/cdn.hpcloudsvc.com/defbbb5c59541c721905ae1a7a433b50c/prodaw2</x-cdn-ssl-uri>
        <log_retention>False</log_retention>
      </container>
    </account>

**Error Response**

If there were never any CDN-Enabled containers in the account, a 404 Not Found error is returned.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Response Data**

If an error occurs, the response body contains a description of the error.

**Curl Example**

    curl -i -k -X GET -H "X-Auth-Token: {Auth_Token}" {BaseURI}/v1.0/{project_id}?enabled_only=true

#### 4.4.2 Container #### {#container_resource}

**Status Lifecycle**   
N/A

**Rate Limits**   
N/A

**Quota Limits**   
N/A

**Business Rules**   
None.

##### 4.4.2.1 CDN-Enable a Container ##### {#container_put}  
##### PUT /v1.0/{project_id}/{container}

This operation is used to initially CDN-enable the container and optionally set its [Time to Live (TTL)](#ttl) attribute. If the container is already CDN-enabled, this operation simple changes the Time to Live (TTL) attribute.

If the container does not exist in the Object Storage service, the container is also created there.

The response contains the [CDN URI](#cdn_uri) that is assigned when you CDN-enable the container.

> Note: It can take up to 20 minutes for the CNAME in the CDN URI to propagate to the DNS servers. During that time the CDN URLs will not resolve.

**Request Data**

The path specifies the account and the name of the CDN-enabled container.

The following request headers apply to this operation.

* [X-Auth-Token](#x_auth_token_request) - Required - Authentication token
* [X-TTL](#x_ttl_request) - Optional - The Time to Live (TTL) in seconds

This operation does not require a request body.

**URL Parameters**

None.

**Data Parameters**

This operation does not require a request body.

**Success Response**

A status code of 201 (Created) indicates that the container was
CDN-enabled as requested. If the container is already CDN-enabled, a 202 (Accepted) response is returned and the TTL is adjusted.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Response Data**

The following response headers are returned:

* [X-CDN-URI](#x_cdn_uri_response) - The URI for the CDN-Enabled container
* [X-CDN-SSL-URI](#x_cdn_ssl_uri_response) - The SSL (HTTPS) URI for the CDN-Enabled container

No response body is returned.

**Error Response**

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Response Data**

If an error occurs, the response body contains a description of the error.

**Curl Example**

    curl -i -k -X PUT -H "X-Auth-Token: {Auth_Token}" {BaseURI}/v1.0/{project_id}/animals

##### 4.4.2.2 Retrieve CDN-Enabled Container Metadata ##### {#container_head}
##### HEAD /v1.0/{project_id}/{container}

This operation retrieves the CDN attributes of a CDN-enabled container.
The attributes are returned in response headers.

**Request Data**

The path specifies the account and the name of the CDN-enabled container.

**URL Parameters**

None.

**Data Parameters**

The following request headers apply to this operation.

* [X-Auth-Token](#x_auth_token_request) - Required - Authentication token

This operation does not require a request body.

**Success Response**

A status code of 204 No Content indicates that the container CDN attributes were retrieved.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Response Data**

The following response headers are returned:

* [X-CDN-URI](#x_cdn_uri_response) - The URI for the CDN-Enabled container
* [X-CDN-SSL-URI](#x_cdn_ssl_uri_response) - The SSL (HTTPS) URI for the CDN-Enabled container
* [X-TTL](#x_ttl_response) - The Time to Live (TTL) value

No response body is returned.

**Error Response**

If the container was never CDN-Enabled, a 404 Not Found error is returned.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Response Data**

No response data is returned.

**Curl Example**

    curl -i -k -X HEAD -H "X-Auth-Token: {Auth_Token}" {BaseURI}/v1.0/{project_id}/animals

##### 4.4.2.3 Update Metadata of a CDN-Enabled Container ##### {#container_post}  
##### POST /v1.0/{project_id}/{container}

This operation updates the CDN attributes of a CDN-enabled container.

To temporarily disable a CDN enabled container, update the X-CDN-Enabled attribute to a value of `False`. The container will no longer be CDN enabled and when the [Time to Live (TTL)](#ttl) expires the content will no longer be in the CDN service. 

To re-enable the container set the value to `True`.

You should use the X-CDN-Enabled attribute to disable a container when you expect to re-enable the container later. If you do not plan to CDN re-enable the container, use the [Delete CDN-Enabled Container](#container_delete) operation instead.

You can also update the [Time to Live (TTL)](#ttl) attribute.

If you have content currently cached in the CDN service, disabling your container or changing the Time to Live (TTL) attribute will *not* purge the CDN cache; you will have to wait for the original TTL to expire.
Contact the Support Team if you urgently need to purge the CDN cache.

**Request Data**

The path specifies the account and the name of the CDN-enabled container.

**URL Parameters**

None.

**Data Parameters**

The following request headers apply to this operation.

* [X-Auth-Token](#x_auth_token_request) - Required - Authentication token
* [X-CDN-Enabled](#x_cdn_enabled_request) - Optional - Contains `True` or `False`
* [X-TTL](#x_ttl_request) - Optional - The Time to Live (TTL) in seconds 

This operation does not require a request body.

**Success Response**

A status code of 202 Accepted indicates that the container CDN attributes were updated.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Response Data**

The following response headers are returned:

* [X-CDN-Uri](#x_cdn_uri_response) - The URI for the CDN-Enabled container
* [X-CDN-SSL-URI](#x_cdn_ssl_uri_response) - The SSL (HTTPS) URI for the CDN-Enabled container

No response body is returned.

**Error Response**

If the container was never CDN-Enabled, a 404 Not Found error is returned.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Response Data**

No response data is returned.

**Curl Example**

    curl -i -k -X POST -H "X-Auth-Token: {Auth_Token}" {BaseURI}/v1.0/{project_id}/animals -H "x_ttl: 1024"

##### 4.4.2.4 Delete a CDN-Enabled Container ##### {#container_delete}  
##### DELETE /v1.0/{project_id}/{container}

This operation removes an outdated or unwanted container from the list of CDN-enabled containers. Use this operation when you do not expect to CDN-enable the container at a later time. Instead if you anticipate CND-enabling the container, you can temporarily disable it with the [Update CDN Metadata](#container_post) operation.

When you delete a CDN-enabled container, the operation will only take effect on any content cached by the CDN service when the [Time to Live (TTL)](#ttl) has expired. Contact the Support Team if you urgently need to purge the CDN cache.

This operation does not delete the underlying container in the Object Storage service.

**Request Data**

The path specifies the account and the name of the CDN-enabled container.

**URL Parameters**

None.

**Data Parameters**

The following request headers apply to this operation.

* [X-Auth-Token](#x_auth_token_request) - Required - Authentication token

This operation does not require a request body.

**Success Response**

A status code of 204 No Content indicates that the container is no longer CDN-enabled.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Response Data**

No response body is returned.

**Error Response**

If the container was never CDN-Enabled, a 404 Not Found error is returned.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Response Data**

No response data is returned.

**Curl Example**

    curl -i -k -X DELETE -H "X-Auth-Token: {Auth_Token}" {BaseURI}/v1.0/{project_id}/animals
