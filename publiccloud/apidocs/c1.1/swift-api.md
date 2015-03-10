---
layout: page
permalink: /publiccloud/api/object-storage/
title: "HP Helion Public Cloud Object Storage API"
description: "HP Helion Public Cloud Object Storage API Specifications"
keywords: "swift, object storage"
product: object-storage

---
<!--PUBLISHED-->
# HP Helion Public Cloud Object Storage API Specification

**Date:** May 2014 

**Document Version:** 1.9

## 1. Overview

HP Helion Public Cloud Object Storage is an affordable, redundant, scalable, and dynamic storage service. The core storage system is designed to provide a safe, secure, network accessible way to store data. You can store an unlimited number of files and each file can be as large as 5GB.  With segmented objects,
you can upload and store objects of virtually any size.

HP Helion Public Cloud Object Storage allows you to store and retrieve files and content via a simple Web Service Representational State Transfer (ReST) interface.

We will be referring to HP Helion Public Cloud Object Storage in this document as simply Object Storage or the Object Storage service.

### 1.1 API Maturity Level

This section describes the maturity level of the functions and features described in this document.

#### 1.1.1 Maturity Level Definitions

The maturity levels are as follows:

* Beta. The functions and features are available publically. While HP Helion expects the feature to operate as advertised, we do not offer a Service Level Agreement (SLA) for the service or feature.

* Release to General Availability (GA). At this level of maturity, all features and functions are expected to operate as advertised. In particular, there is a Service Level Agreement (SLA) defined and in place.

#### 1.1.2 Maturity Level #### {#maturity_level}

Except as noted below, this is the maturity level of this API:

**Maturity Level**: Object Storage is General Availability (GA).

**Version API Status**: CURRENT

##### 1.1.2.1 Features in Public Beta

The following features do not have the same maturity level as described
in [Maturity Level](#maturity_level):

* [Container Synchronization](#container_synchronization)
* [Bulk Delete](#bulk_delete)
* [Archive Auto Extraction](#tarball_upload)

**Maturity Level**: Public Beta.

**Version API Status**: BETA

### 1.2 Document Revision History ###

|Document Version|Date            |Description|
|:--------       | :------------  | :------ |
|1.0             |December 2012|Initial creation|
|1.1             |March 2013   |Added [Object Versioning](#object_versioning) |
|                |             |Added [Scheduled Deletion of Objects](#expiring_objects) |
|                |             |[Container and Object Naming](#naming) now restricts the "/./", "/../", "/." and "/.." substrings. This was always true, but not documented. |
|                |             |The description of the [Range](#range_request) request header has been updated.  |
|1.2             |April 2013   |The section on [FormPost](#formpost) was missing a description of how signatures are constructed and used. This has been fixed.|
|1.3             |May 2013     |Added a description of [StaticWeb](#staticweb)|
|                |             |Added end_marker query parameter to [List containers](#account_get) and [List objects](#container_get) operations. Also added prefix and delimiter to [List containers](#account_get).|
|                |             |Updated [Signature Based Authentication](#signature_auth) to be more specific about handling of UTF-8 and URL-encoding in the string-to-sign.|
|1.4             |August 2013  |Updated [Large Object Creation](#large_objects) to include [Static Large Object Creation](#slo)|
|                |             |Added [Archive Auto Extraction](#tarball_upload)|
|                |             |Added [Bulk Delete](#bulk_delete)|
|                |             |Replaced "tenant" with "project/tenant" throughout the document. In OpenStack, "project" is replacing "tenant". In both cases, the _Id_ is the same as the HP Helion Cloud Object Storage service _account_.|
|                |             |Removed references to Beta program account names that were prefixed with "AUTH_". Your service catalog now contains the project/tenant Id. However, legacy references that use the older "AUTH_" account will still work.|
|                |             |Added a section on [End to end integrity](#end_to_end_integrity).|
|1.5             |October 2013 |Clarified that URL-encoding is also needed for headers that contain container and object names (such as X-Object-Manifest)|
|1.6             |January 2014 |Clarified that [FormPOST](#formpost) and [Temporary URLs](#temp_url) cannot be used for [Large Objects](#large_objects)|
|1.7             |January 2014 |Clarified that [FormPOST](#formpost) and [Temporary URLs](#temp_url) cannot be used for [Auto Archive Extract](#tarball_upload)|
|1.8 | April 2014 | Updated sections 2.7.5, 2.7.6.2, and 2.7.7.1 to reflect locations in Horizon Console |
||| Updated references to Project instead of Tenant |
||| Updated curl examples to reflect format in other HP Helion Cloud API documents. |
| 1.9 | May 2014 | HP Helion updates |
 
## 2. Architectural View

The Object Storage API is implemented as a set of ReSTful web services. All account, container and object operations can be performed with standard HTTP calls. See the [Wikipedia article](http://en.wikipedia.org/wiki/REST) for more information about ReST.

### 2.1 Resources

The Object Storage API allows the management of the following resources:

* [Account](#account_resource)
* [Container](#container_resource)
* [Object](#object_resource)

#### 2.1.1 Object Storage Accounts #### {#account_resource}

The account is the top level resource in the hierarchy. There is a one-to-one relationship between an account and the _project_. However, we recommend you 
use the endpoint from the service catalog that the Identity Service supplies when authenticating yourself instead of constructing your own path to the account.

You may set custom metadata on an account.

There is more about [projects and accounts](#projects_accounts) later in this document. There is more about using the [Identity Service](#using_tokens) later in this document.

#### 2.1.2 Object Storage Containers #### {#container_resource}

A container provides a way for you to organize your objects. You can pick any name that is meaningful to you. However, see [Container and Object Naming](#naming) for restrictions on container names.

You may also set custom metadata on a container.

#### 2.1.3 Object Storage Objects #### {#object_resource}

An object provides a way for you to store any arbitrary data. This may be a document, image, video, backup file or anything else required by your application. You can pick any name that is meaningful to you. However, see [Container and Object Naming](#naming) for restrictions on object names.

Objects have a size limit of 5 gigabytes. However, objects larger than 5GB can be segmented and then concatenated together so that you can upload 5GB segments and download a single concatenated object of any size. You can work with the segments and manifests directly with API requests. 

In addition to storing the content of an object, you may also associate metadata with an object. 

While the primary organizational structure in Object Storage is the container, you may use object names as a way to further organize your data. A common usage of this is to include a delimiter character such as slash ('/') character in the object name. For example, you could use `/vacation/pic1.jpg` as the name of an object. If this object is stored in a container called `photos`, the URI for the object would be `/v1/{project_id}/photos/vacation/pic1.jpg`.

While this appears to allow hierarchies similar to a file system's directory structure, it is important to understand that there is no such hierarchy in Object Storage. For example, if you simply created a container called `photos` and then created a single object called `vacation/pic1.jpg`, you cannot access `/v1/12345678912345/photos/vacation/` -- there is no such object in the system. For more, see [Pseudo-Hierarchical Folders/Directories](#pseudo_hierarchies).

### 2.2 Container and Object Naming ### {#naming}

Container and object names should be UTF-8 encoded. If the names are stored using a different encoding (e.g., Unicode), they must be converted to UTF-8 encoding.

To interact with the ReST API, the UTF-8 string should then be URL-encoded. This is normal HTTP practice is URLs (i.e., in the path of a request). However, where a container or object name appears in a header (such as
[X-Object-Manifest](#dlo), you must also URL-encode the value.

A common mistake is to directly URL-encode characters. For example, if an object name is comprised of the single chracter "&yuml;" (small y with umlaut), a direct URL-encoding is "%FF". However, this is an illegal UTF-8 encoded string. The correct URL-Encoding is "%C3%BF". 

Container names must not contain the slash ('/'), double-quote ('"'), less-than ('\<') or greater-than ('\>') characters. The container name length is limited to 256 bytes. The name length restriction applies to the URL-encoded string.

Object names must not contain the double-quote ('"'), less-than ('\<') or
greater-than ('\>') characters. While object names may contain the '/' character, the substrings '/./' and '/../' are not allowed in object names.
Object names may not end with '/.' or '/..'. The object name length is limited to 1024 bytes. The name length restriction applies to the URL-encoded string.

Although you use URL-encoding to specify the URI of a container or object, when the API returns names (as in listing a container), the displayed names are not URL-encoded (i.e., they are the UTF-8 encoded names).

### 2.3 Consistency

The HP Helion Object Storage service is based on OpenStack Swift. This provides an "eventual consistency" model. This means that when you update the system in some way, you are not necessarily guaranteed to have the update propagated to all parts of the system at once. This is a consequence of how the system operates. The HP Public Cloud Object Storage system comprises 100s of servers, uses multiple copies of data and multiple availability zones to achieve very high scalability (in terms of objects stored) and very high availability for the data. In such a design, consistency is traded off to achieve high scale and availability.

As the name implies, the eventual consistency means that after updates, the update will be *eventually* visible to all parts of the system. In practice, you can rely on read-after-create consistency. That it, immediately after creating an object, you will be able to read or access that object. However, if you replace an object with a new copy, there are situations where the system might return the original object. This requires a specific sequence of server failures to end up in this situation and is unlikely to occur very often.

A much more common inconsistency you may observe is that after you create, replace or delete an object, the container may not be updated to list the object -- or may have the timestamp of an older object. So when you list the contents of a container, it's possible the list contains objects that were deleted just before you performed the list operation. Similarly, the [X-Account-Object-Count](#x_account_object_count_response) metadata may take some time to update after objects are created or deleted.

As far as possible, you should design applications to account for such possible inconsistencies. 

### 2.4 End to end integrity ### {#end_to_end_integrity}

There are many pieces of network, server and disk drive infrastructure involved in storing and retreiving objects. These are both on the public network and within HP Helion's data centers. The system has mechanisms to detect and correct errors. The primary mechanism Object Storage has for detecting and correcting corruption is the ETag metadata associated with an object. This contains the MD5 checksum of the object content. For example, the system performs a periodic scan of all files in the system comparing the MD5 checksum of the file against the ETag metadata of the object. If a file is detected as corrupt, the system isolates the file and retrieves a good copy from one of the other redundant copies.

However, this ETag mechanism is ineffective unless you also check the MD5 checksum when you upload or download objects. A common source of corruption is that the body of a reqeust or response is short (i.e., missing some data). The HTTP protocol places the success/error code at the start of a response. So even if the Object Storage system detected an error, it has no way to change the success/error code that has already been sent. You must perform checks on all operations as described in this section to ensure that data is not lost at any stage in the process.

We suggest you use the following strategy to ensure end-to-end integrity of data:

* When uploading an object, calculate the MD5 checksum in advance and include it in the [ETag request header](#etag_request).

* If you cannot calculate the MD5 checksum in advance, calculate the MD5 checksum as you upload the object. The [PUT object](#object_put) operation returns an ETag response header. You can check this header against your MD5 checksum. At this stage, the object has been created; you should now delete it since you know that it is corrupt.

* For objects larger than 5GB, we recommend you use [Static Large Objects](#slo) instead of [Dynamic Large Objects](#dlo).

* At a minimum, check the Content-Length when downloading objects. This will protect against the most common form of corruption -- a short response body.

* We recommend you also calculate the MD5 checksum while or after downloading an object and compare this with the ETag response header.

* When you download either a [Static Large Object](#slo) or [Dynamic Large Object](#dlo), the ETag response header is not the MD5 checksum of the downloaded content, but is instead the MD5 checksum of the ETag values of each segment object concatenated together. In practice, this makes it difficult to compare against the data you have downloaded. We recommend that when you create a large object, you should calculate the MD5 checksum of the complete object and set custom metadata (for example, "X-Object-Meta-MD5-Content") on the manifest object. On download, you can now compare the downloaded content against a known checksum.

* The [Auto Archive Extract](#tarball_upload) feature does not check the ETag request header when you upload the tar(1) archive so it is not possible to check the integrity of the resulting objects.
 
### 2.5 Success and Error Handling

Handling a HTTP success code is straight forward - any of the 200, 201, 202 and 204 codes indicate a success. Once you see this, you can assume the operation has completed and any expected response body or response headers are available for use.

Handling failures is obviously more difficult. You need to examine the HTTP code to see how to respond. However, in many cases you should not simply abandon the task, but consider retrying. In particular, the following HTTP error codes might be recoverable as follows:

* 401 Unauthorized. This can mean that you are not authorized to perform an operation. However, it might also mean that your [authentication token](#using_tokens) has expired. You should attempt to get a new token by contacting the Identity Service (it's also worth retrying failures on the Identity service).

* 403 Forbidden. As with 401 Unauthorized, it is worth getting a new token before attempting to retry the operation.

* 404 Request Timeout. Please try the request again later.

* 429 Too Many Requests. The system is busy and is asking that you slow down the rate at which you make requests. You should sleep or pause for a short period, and then attempt the operation again.

* 500 Internal Error. This is an unusual situation, but can occur if the system is being reconfigured. You should sleep or pause for a short period and retry the operation. If the error persists, contact Public Cloud support.

* 503 Service Unavailable. This is an unusual situation, but can occur if the system is being reconfigured. You should sleep or pause for a short period and retry the operation. If the error persists, contact Public Cloud support.

In addition, you may get socket errors such as connection refused or connection reset by peer. These can happen either because of transient failures in the path between your client system and the HP Helion system or because we are reconfiguring the system. For example, when we install new software, we will perform a rolling restart of the software. This might break an individual operation. We use load balancers, so your next attempt to perform the operation will be directed to a different server and will work.

In the above scenarios, it has been suggested that you retry operations. The suggestion is that you sleep for one second and then retry. If this fails, you
should sleep for a longer period before retrying. If after several retries (on the order of 5 attempts) your operation continues to fail, you can then
consider the failure as unrecoverable.

#### 2.5.1 HTTP Status Codes #### {#http_codes}

The following HTTP codes are used by Object Storage.

|Code      | Description    | Notes   |
|:-------- | :------------  | :------ |
|200 OK    | Standard response for successful requests. | The actual response will depend on the specific operation. The HTTP code is transferred before the body of a request, so you should check that the body has not been truncated by comparing with the [Content-Length](#content_length_response) and [ETag](#etag_response) response headers. |
|201 Created| Standard response for successful create of a container. Object creation usualy returns this code, even if an object of the same name already exists. In terms of how the service works, this is correct since you are creating a new copy of the object. However, when creating an object in a version-enabled container, 200 OK is returned if an object of the same name already exists.| The actual response will depend on the specific operation. |
|202 Accepted | Standard response for successful updates to account, container or object. | The actual response will depend on the specific operation. |
|204 No Content | Standard response to HEAD operations. It is also the response when listing an account or container and there are no names in the list.| The response is in the response headers, there is no body in the response. The object HEAD response does not use this code. It uses 200 OK instead.|
|400 Bad Request | The request cannot be fulfilled due to bad syntax. | Check your code. |
|401 Unauthorized | This usually means that the [authorization token in X-Auth-Token](#using_tokens) is invalid (or missing). | If, the token was valid at some stage and you then get this error, it has probably expired and you simply need to get a new authorization token.|
|403 Forbidden | The request was a valid request, you do not have the appropriate access rights to the resource. | |
|404 Not Found | The requested resource (account, container or object) could not be found. | Generally, either the resource never existed or has been deleted in the meantime. |
|405 Method Not Allowed| A request was made of a resource using a request method not supported by that resource| Check your code. |
|409 Conflict |You are not allowed to perform the requested operation. | For example, you cannot delete a container that contains objects.|
|411 Length Required | A Content-Length request header was not specified. | Check your code. |
|412 Precondition Failed | The server does not meet one of the preconditions that the requester put on the request. | See [Conditional Get of Objects](#conditional_get) and [Object Versioning](#object_versioning). |
|413 Request Entity Too Large|The request is larger than the server is willing or able to process.| For objects, see [Large Object Creation](#large_objects) |
|414 Request-URI Too Long | The URI provided was too long for the server to process. | See [Arbitrary Limits](#uri_limits) |
|416 Requested Range Not Satisfiable | The client has asked for a portion of the file, but the server cannot supply that portion.| For example, if the client asked for a part of the file that lies beyond the end of the file.|
|418 I'm a teapot| Described in [RFC 2324](http://www.ietf.org/rfc/rfc2324.txt) | Please contact Public Cloud support if you get this error. |
|422 Unprocessable Entity | The MD5 checksum of an uploaded object body does not match the value supplied in the [ETag](#etag_request) request header. | This indicates that some form of corruption occurred in the transfer. Retry the operation. |
|429 Too Many Requests | The user has sent too many requests in a given amount of time. | Sleep for a short period and retry the operation. |
|431 Request Header Fields Too Large | Either an individual header field, or all the header fields collectively, are too large. | See [Arbitrary Limits](#uri_limits) |
|500 Internal Server Error | An unexpected internal error occurred. | Sleep for a short period and retry the operation. For persistent failure, contact Public Cloud support |
|503 Service Unavailable | An unexpected internal error occurred. | Sleep for a short period and retry the operation. For persistent failure, contact Public Cloud support |

### 2.6 Arbitrary Limits ### {#uri_limits}

The following constraints apply to the API's HTTP requests:

* Maximum number of HTTP headers per request: 90

* Maximum length of all HTTP headers: 4096 bytes

* Maximum length per HTTP request line: 8192 bytes

* Maximum length of HTTP request: 5 gigabytes

* Maximum length of container name: 256 bytes

* Maximum length of object name: 1024 bytes

### 2.7 Authentication and Access Controls

#### 2.7.1 Overview

The Object Storage system provides a number of ways to control who can access and change data in an account, container or object. Authentication services are provided by the [Identity Service](https://docs.hpcloud.com/identity). You use this service to manage your passwords and access keys. Object Storage interacts with the Identity Service to verify who you are.

In conjunction with the Identity Service, the Object Storage service provides a number of ways to control access to the system as follows:

* Authentication tokens. Using the Identity service API, you can authenticate yourself for a specific project. The Identity service returns a token. In subsequent operations, you include this token in the X-Auth-Token request header. The value of the token is used to identify you. If you are associated with the project, you now have full access to the Object Storage account. See [Using Authentication Tokens](#using_tokens) for more information.

* General Access Control Lists (ACLs). You can apply an ACL as metadata on a container. This allows you to make the container and it's objects world readable or writable. See [General Access Control Lists](#general_acls) for more information.

* Cross-project Access Control Lists (ACLs). This allows you to make the container and its objects readable or writeable by specific users. See [Cross-project Access Control Lists](#cross_project_acls) for more information.

* Temporary URLs. This allows you to create a URL that encodes the Access Key information needed to get or put an object. The resulting URL contains enough information to allow it to be used without reference the Identity service. Specifically, since it does not require you to use the X-Auth-Token request header it is suitable for embedding in HTML pages and useable by standard browsers. The URL has an expiry date, hence the URL is temporary. Temporary URLs cannot be used to upload Large Objects. See [Temporary URLs](#temp_url) for more information.

* FormPOST. This is similar in concept to Temporary URLs except the encoding is done in a HTML form. This makes it possible to upload objects directly using a standard web browser. FormPOST cannot be used to upload Large Objects. See [FormPOST](#formpost) for more information.

* Signature Based Authentication. This allows a client to use Identity service _Access Keys_ to "sign" the URL and headers of a request. Since the client has the Access Keys, it does not need to refer to the Identity service to authenticate itself. Instead, a valid signature in the request allows Object Storage to authenticate the request and identify the user. See [Signature Based Authentication](#signature_auth)
 
#### 2.7.2 Using Authentication Tokens #### {#using_tokens}

The Object Storage service is not responsible for authenticating the identity of users. Instead, the Identity service is responsible for authentication and identity management. 

To identify that a request is issued on behalf of or by a user, the user first makes a request to the Identity service. In this request, the user gives their credentials and gets an authorization token in response.  In subsequent requests to the Object Storage service, the authentication token is included in the request. The [X-Auth-Token](#x_auth_token_request)
request header is used by the API to include the token in the request.

With this authentication token, the Object Storage service can identify the user and decide whether the user is allowed to perform the operation.

##### 2.7.2.1 Getting an authentication token.

To make a request to the Identity service, you need:

* Your credentials
* Your project Id or project Name.

The credentials can either be:

* Username and password, i.e., the same username and password they would use to log into the Public Cloud Console

* Access Key ID and Access Key Secret. You can see your Access Keys on the *API Keys* section under you *Account* information in the Public Cloud Console. Access Keys are more suitable for use in APIs because you can create them for use in a specific application. However, if you suspect that an application's Access Keys have been compromised, you can delete the Access Key. This is more convenient than changing your password credentials. However, not all API bindings support Access Keys.

In addition, to credentials, you also specify a project -- either the Id or project Name. With your credentials and project, the Identity service checks to see whether you have activated the Object Storage service. If so, it returns an authentication token and the endpoints to all regions of the Object Storage service that you are activated for. See [Service Catalog](#service_catalog) for an example of how the authentication token and endpoints are returned.

There are legacy OpenStack Object Store APIs that used TempAuth or Swauth as their identity server. The Identity service offers a compatible interface. You use your username, password and project Id as shown in the following example. This example uses curl. The X-Storage-Url response header contains the Object Storage endpoint (including your account) and the X-Auth-Token response header contains your authentication token.

    $ curl -i https://region-a.geo-1.identity.hpcloudsvc.com:35357/auth/v1.0/ -X GET -H 'x-auth-user: 12345678912345:sally' -H 'x-auth-key: MyPassword'

    HTTP/1.1 200 OK
    X-Storage-Url: https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345
    X-Auth-Token: HPAuth_1234

The authentication that you receive is known as a "scoped" token, i.e., it is specific for the project and the Object Storage account associated with the project.

##### 2.7.2.2 Admin Role

When a user has a scoped token (as explained earlier), the user has the *Admin* role for the associated Object Storage [account](#account_resource).
The Admin role allows full create, modify and read access to all containers, metadata and objects in the account. If a user does not have Admin role for an account, they cannot create, modify or read any of the metadata or contents of data in the account unless you provide access via other mechanisms such General Access Control Lists or Temporary URLs.

##### 2.7.2.3 Unscoped Tokens

If when requesting an authentication token you do not specify a project, or you specify a different project than the project associated with the [account](#account_resource), then the authentication token is not "scoped" for that account. This means that the user will not have the Admin role for the account and will not be able to access the account metadata or data. However, this authentication token can be used to *identify* the username of the requesting user. If [Cross-project Access Control Lists](#cross_project_acls) are used, that the user is allowed appropriate access to the container.

#### 2.7.3 General Access Control Lists #### {#general_acls}

Normally, only a user with Admin role can access a container and objects. This role is associated with a project as is assigned when you activate a user for Object Storage. To indicate that you have the Admin role, users must
supply a X-Auth-Token in their requests. This is explained in [Using Authentication Tokens](#using_tokens).

However, sometimes you want to provide global read or write access to a container. You can use the X-Container-Read and X-Container-Write container metadata to enable this. As the names imply, X-Container-Read allows read access and X-Container-Write enables write access.

The value in X-Container-Read and X-Container-Write is an access control list (ACL). There are two possible entry values:

* `.r:*` - this allows anybody to access the objects in the container
* `.rlistings` - this allows anybody to list the contents of a container

To allow anybody to both list objects in a container and access the objects, use both values separated by a ','. For example, if you want to allow anybody complete read access to a container, set the X-Container-Read request header as follows:

    X-Container-Read: .r:*,.rlistings

> Note: the `.r` in the ACL value is named for 'referrer' -- not 'read'

> Note: the `*` in the ACL value is a literal `*`; it does not mean that user or hostnames can be specified in this piece of the ACL string.

#### 2.7.4 Cross-project Access Control Lists #### {#cross_project_acls}

In [General Access Control Lists](#general_acls) you could not specify (or limit to) specific users. The Cross-project Access Control Lists allow you to specify specific users.

Users of Object Storage can share containers with one another by providing a user name (or names) with the X-Container-Read and X-Container-Write container metadata. The ACL value provides access to both list the objects in the container as well as access to the individual objects in the container.

For example, to grant access to user Sally for read access you can set the X-Container-Read as follows:

    X-Container-Read: *:sally

To allow user Sally to also write to objects in a contains, you should also
set the X-Container-Write request header as follows:

    X-Container-Read: *:sally
    X-Container-Write: *:sally

If there are several users, use a comma separated list as shown in the following example:

    X-Container-Read: *:sally,*:joe@hp.com

> Note: use the *username* in the ACL. In many cases, the username is the same as your email address. In this example, `joe@hp.com` is the user's username.

#### 2.7.5 Temporary URLs #### {#temp_url}

The TempURL feature allows the creation of URLs to provide temporary access to objects. A website owner may wish to provide a link to download a large object in Object Storage, but the account has no public access. The website owner can generate a URL that will provide GET access for a limited time to the resource.

When the web browser user clicks on the link, the browser will download the object directly from Object Storage, obviating the need for the
website to act as a proxy for the request.

If the user were to share the link with all his friends, or accidentally post it on a forum, etc. the direct access would be limited to the expiration time set when the website created the link.

To create the URL, you need to know the following information:

* The Project ID. You see your Project ID by going to the Identity section of the Horizon Console.

* Access Key ID and Secret Key. You can see this information by going to the Manage Access Keys option in the user menu in the Horizon Console. If you have several Access Keys, you can pick any one of them. However, if you subsequently deactivate or delete the Access Keys, the URL will become invalid.

* The HTTP method to allow (GET or PUT)

* The Unix timestamp the access should be allowed until. When this timestamp expires, the URL cannot be used to access the object.

* The full path to the object.

Temporary URLs cannot be used to upload [Large Objects](#large_objects) or perform the [Archive Auto Extraction](#tarball_upload) operation.

##### 2.7.5.1 Supported Methods

TempURL is designed to support GET, PUT, and HEAD requests only. POST is expected to be handled by [FormPost](#formpost).

##### 2.7.5.2 Differences Between Object Storage and OpenStack Swift TempURL Signature Generation

There are two differences between Object Storage and OpenStack Swift TempURL signature generation:

* OpenStack Swift Temporary URLs (TempURL) required the X-Account-Meta-Temp-URL-Key header be set on the Swift account. In Object Storage you do not need to do this. Instead we use Access Keys to provide similar functionality.

* Object Storage Temporary URLs require the user's Project ID and Access Key ID to be prepended to the signature. OpenStack Swift does not.

##### 2.7.5.3 Creating Signatures for Temporary URLs (TempURL)

A signature is created using the following values concatenated together with a colon (":") separating them:

* The Project ID

* The Access Key ID

* An HMAC-SHA1 (RFC 2104) signature. This is generated using:
  - The HTTP method to allow (GET or PUT)
  - The Unix timestamp the access should be allowed until
  - The full path to the object
  - The Secret Key

For example, here is code generating the signature for a GET, valid for the next 60 seconds, on /v1/12345678912345/container/object:

    import hmac
    from hashlib import sha1
    from time import time
    method = 'GET'
    expires = int(time() + 60)
    path = '/v1/12345678912345/container/object'
    project_id = '12345678912345'
    access_key_id = 'GP54NNRN2TKBVWH449AG'
    secret_key = 'EHLzysK9S1QRWkwvVpVHsGZyM715OH4S2kJ'
    hmac_body = '%s\n%s\n%s' % (method, expires, path)
    sig = project_id + ':' + access_key_id + ':' + hmac.new(secret_key, hmac_body,
        sha1).hexdigest()

##### 2.7.5.4 Using Temporary URLs

Let's say the signature ends up equaling "12345678912345:GP54NNRN2TKBVWH449AG:da39a3ee5e6b4b0d3255bfef95601890afd80709" and expires ends up "1323479485". Then, for example, the website could provide a link to:

    https://swift-cluster.example.com/v1/12345678912345/container/object?temp_url_sig=12345678912345%3AGP54NNRN2TKBVWH449AG%3Ada39a3ee5e6b4b0d3255bfef95601890afd80709&temp_url_expires=1323479485

Any alteration of the resource path or query arguments will cause an "401 Unauthorized" error to be returned. Similarly, a PUT where GET was the allowed method will also fail. HEAD is allowed if GET or PUT is allowed.

#### 2.7.6 FormPOST #### {#formpost}
##### 2.7.6.1 FormPOST Overview #####

FormPost is designed to allow web browsers to upload files directly into Object Storage by using signature-based authentication. In effect a browser form post becomes a regular Object Storage object PUT.

FormPOST cannot be used to upload [Large Objects](#large_objects) or [Auto Archive Extract](#tarball_upload) objects.

The format of the form is shown in this example:

    <form action="{object-store-url}" method="POST"
                   enctype="multipart/form-data">
    <input type="hidden" name="redirect" value="{redirect-url}" />
    <input type="hidden" name="max_file_size" value="{bytes}" />
    <input type="hidden" name="max_file_count" value="{count}" />
    <input type="hidden" name="expires" value="{unix-timestamp}" />
    <input type="hidden" name="signature" value="{project_id}:{access_key_id}:{hmac}" />
    <input type="file" name="{object-name}" />
    <input type="submit" />
    </form>

> Note: The form method must be POST and the enctype must be set as
> multipart/form-data

The object-store-url is the URL to the Object Storage destination,
such as:

    https://region-b.geo-1.objects.hpcloudsvc.com/v1/12345678912345/photos/
        
The name of each object uploaded will be appended to the object-store-url given. In the above example, the object is uploaded to the photos container. To upload to a pseudo-directory, include the full name including the slash ("/")
character as shown in this example:

    https://region-b.geo-1.objects.hpcloudsvc.com/v1/12345678912345/photos/2013/vacation/

The object-store-url is really a prefix for the object name, so if the name of the file input type attribute is "one", the following URL...

    https://region-b.geo-1.objects.hpcloudsvc.com/v1/12345678912345/photos/2013/vacation/venice-

... would create an object called 2013/vacation/venice-one in the photos
container.

##### 2.7.6.2 FormPOST Attributes #####

The following attributes are used with FormPOST. These are included in the
form as shown above. Their values must be included in the signature as explained below.
 
* redirect. This is the URL to redirect the browser to after the upload completes. The URL will have status and message query parameters added to it, indicating the HTTP status code for the upload (2xx is success) and a possible message for further information if there was an error (such as "max_file_size exceeded").

* max_file_size. This must be included and indicates the largest single file
upload that can be done, in bytes.

* max_file_count. This must be included and indicates the maximum number
of objects that can be uploaded with the form.

* expires. This is the Unix timestamp before which the form must be submitted
before it is invalidated.

* signature. The value is the Project ID, Access Key ID and HMAC-SHA1 signature
concatenated together with a colon (":") character between them. Creating this
signature is explained in more detail later. You can see your Project Id in the Identity section of the Horizon Console.  Your Access Keys can be viewed in the Manage Access Keys option under the user menu in the Horizon Console.

* Object name input element(s). You must have at least one input element of type file such as `<input type="file" name="objxx" />`. If you want to upload several objects, include additional file input elements.

> The file input element(s) must be specified _after_ the redirect, max_file_size, max_file_count, expires and signature attributes.

##### 2.7.6.3 Differences Between Object Storage and OpenStack Swift FormPOST Signature Generation

There are two differences between Object Storage and OpenStack Swift FormPOST signature generation:

* OpenStack Swift FormPOST requires the X-Account-Meta-Temp-URL-Key header be
set on the Swift account. In Object Storage you do not need to do this. Instead we use Access Keys to provide similar functionality.

* Object Storage FormPOST requires the user's Project ID and Access Key ID to be prepended to the signature. OpenStack Swift does not.

##### 2.7.6.4 Creating Signatures for FormPOST #####

A signature is created using the following values concatenated together with a colon (":") separating them:

* The Project ID

* The Access Key ID

* An HMAC-SHA1 (RFC 2104) signature. This is generated using:
  - The full path to where the objects are stored
  - The value of the redirect attribute
  - The value of the max_file_size attribute
  - The value of the max_file_count attribute 
  - The Unix timestamp the access should be allowed until
  - The Secret Key

For example, here is code generating a signature valid for the next 600
seconds:

    import hmac
    from hashlib import sha1
    from time import time
 
    path = '/v1/12345678912345/container/object_prefix'
    redirect = 'https://myserver.com/some-page'
    max_file_size = 104857600
    max_file_count = 10
    expires = int(time() + 600)
    project_id = '12345678912345'
    access_key_id = 'GP54NNRN2TKBVWH449AG'
    secret_key = 'EHLzysK9S1QRWkwvVpVHsGZyM715OH4S2kJ'
    hmac_body = '%s\n%s\n%s\n%s\n%s' % (path, redirect,
        max_file_size, max_file_count, expires)
    signature = project_id + ':' + access_key_id + ':' + hmac.new(secret_key, hmac_body, sha1).hexdigest()

> Note: Be certain to use the full path, from the /v1/ onward.

#### 2.7.7 Signature Based Authentication #### {#signature_auth}

Signature based authentication provides an alternate way of authenticating your request. Normally, you obtain a token from the Identity service and include the token in the  X-Auth-Token header. With signature based authentication you use an Access Key to "sign" a request. The resulting signature is then included in the Authorization header (instead of X-Auth-Token).

##### 2.7.7.1 Creating a Signature for the Authorization Header

To create a signature you need a Project Id and Access Key. You can see your Project Id in the Identity section of the Horizon Console.  Your Access Keys can be viewed in the Manage Access Keys option under the user menu in the Horizon Console. You may create additional Access Keys. You may also delete Access Keys. This can be used if you suspect that an Access Key has been compromised. When you delete an Access Key, signature based authentication requests that were signed using the deleted Access Key will fail.

An Access Key has two parts - an Access Key ID and a Secret Key. As you can see below, the Access Key ID appears in the Authorization header. However, the Secret Key does not. Obviously, you should only reveal the Secret Key to trusted parties.

The value for the Authorization header is constructed as follows:

    Authorization = "HP" + " " + ProjectID + ":" + AccessKeyId + ":" + Signature;
 
    Signature = Base64( HMAC-SHA1( SecretKey, UTF-8-Encoding-Of( StringToSign ) ) );
 
    StringToSign = HTTP-Verb + "\n" +
        Content-MD5 + "\n" +
        Content-Type + "\n" +
        Date + "\n" +
        CanonicalizedResource;
 
    CanonicalizedResource = (described below)

The CanonicalizedResource is the path of the account, container or object you are accessing. However, you must observe some conventions in constructing the path used in the signing process. Specifically:

* The CanonicalizedResource must start with the same path as your Object Storage endpoint (i.e., to include the version and account). For example, if your service endpoint is `https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345`, your CanonicalizedResource  must start with `/v1/12345678912345`.

* The remaining path up to but not including a query is included in your CanonicalizedResource. For example, if your path is `/v1/12345678912345/images?prefix=snow`, then your CanonicalizedResource is `/v1/12345678912345/images`.

> Note: You must include a [Date](#date_request) header in your request.

##### 2.7.7.2 Using Signature Based Authentication

Here's an example of using signature based authentication in a request:

    GET /v1/12345678912345/images/January/snow.jpg HTTP/1.1
    Host: region-a.geo-1.objects.hpcloudsvc.com
    Date: Mon, 26 Mar 2007 19:37:58 +0000
    Authorization: HP 971350225483156:GP54NNRN2TKBVWH449AG:frJIUN8DYpKDtOLCwo//yllqDzg=

### 2.8 Retrieving large number of container or object names ### {#pagination}

When doing a GET request against an account or container, the service returns a maximum of 10,000 names per request. To retrieve subsequent names, you must make another request with a *marker* parameter. The marker indicates where the last list left off; the system returns  names greater than this marker, up to
10,000 again. Note that the marker value should be URL-encoded prior to sending the HTTP request.

If 10,000 is larger than desired, a *limit* parameter may be given.

If the number of names returned equals the limit given (or 10,000 if no limit is given), it can be assumed there are more names to be listed. If the name list is exactly divisible by the limit, the last request has no content.

For example, let's use a listing of five names

    apples
    bananas
    kiwis
    oranges
    pears

We'll use a limit of two to show how things work:

    GET /v1/1234567891012345?limit=2

    apples
    bananas

Since two items were received, you can assume there are more
names to list, so you make another request with a marker of the last
item returned:

    GET /v1/1234567891012345?limit=2&marker=bananas
     
    kiwis
    oranges

Again, two items are returned; there may be more:

    GET /v1/1234567891012345?limit=2&marker=oranges
      
    pears

With this one-item response we received less than the limit number of names, indicating that this is the end of the list.

### 2.9 Hierarchical Folders or Directories ### {#pseudo_hierarchies}

You can simulate a hierarchical structure in Object Storage by following a few guidelines. Object names must contain a delimiter character to indicate the hierarchical structure.

By default `GET /v1/{project_id}/{container}` returns all objects in the container. You can search for a subset of names using query parameters. This allows you to "navigate" the hierarchical structure. There are techniques you can use as follows:

* Use prefix/delimiter.  
The names of the objects contain the pseudo-hierarchical structure, but here are no real objects to represent a folder or directory. To navigate, use the prefix and delimiter query parameters as explained below. By convention, the slash ('/') character is usually used. For example, an object name could be `photos/2012/image-1.jpg`

* Use path.  
Create placeholder objects to represent folders or directories. The objects are also named to include the hierarchy. For example, for an object called `photos/2012/image-1.jpg`, there would also be two placeholder  objects called `photos/` and `photos/2012/`. To navigate, use the path query parameter as explained below.

While both achieve similar results, there are differences:

* With prefix/delimiter, you may use any delimiter character. For example you could use the colon character (':'). With path, you must use the slash ('/') character.

* With prefix/delimiter you do not need to manage (create/delete) placeholder objects

* Conversely, with prefix/delimiter, there is no way to represent an empty folder or directory.

#### 2.9.1 Using prefix and delimiter query parameters #### {#prefix_delimiter}

To show how to construct and navigate through a hierarchy, we will use a container containing 7 objects. In this example, we will use the slash ('/') character as the delimiter.

Here is a full listing of the container in plain text:

    GET /v1/12345678912345/test_container
    X-Container-Object-Count: 7

    dir1/obj1
    dir2/dir3/obj2
    dir2/dir3/obj3
    dir4/obj4
    dir4/obj5
    obj6
    obj7

Notice that there are 7 objects. The first object has a name of `dir1/obj1` -- not `obj1`, i.e., the name contains the hierarchical structure.

By adding the `format=json` query parameter, we can see the objects in more detail.

    GET /v1/12345678912345/test_container?format=json
    X-Container-Object-Count: 7

    [
        {"name":"dir1/obj1","hash":"b917968b8ad501a40af22c0bf4d83ee0","bytes":377,"content_type":"application/octet-stream", "last_modified":"2012-11-22T15:18:09.788760"},
        {"name":"dir2/dir3/obj2","hash":"b917968b8ad501a40af22c0bf4d83ee0","bytes":377,"content_type":"application/octet-stream", "last_modified":"2012-11-22T15:40:48.596260"},
        {"name":"dir2/dir3/obj3","hash":"b917968b8ad501a40af22c0bf4d83ee0","bytes":377,"content_type":"application/octet-stream", "last_modified":"2012-11-22T15:41:04.902890"},
        {"name":"dir4/obj4","hash":"b917968b8ad501a40af22c0bf4d83ee0","bytes":377,"content_type":"application/octet-stream", "last_modified":"2012-11-22T15:41:20.756000"},
        {"name":"dir4/obj5","hash":"b917968b8ad501a40af22c0bf4d83ee0","bytes":377,"content_type":"application/octet-stream", "last_modified":"2012-11-22T15:42:49.804350"},
        {"name":"obj6","hash":"b917968b8ad501a40af22c0bf4d83ee0","bytes":377,"content_type":"application/octet-stream", "last_modified":"2012-11-22T15:19:26.524310"},
        {"name":"obj7","hash":"b917968b8ad501a40af22c0bf4d83ee0","bytes":377,"content_type":"application/octet-stream", "last_modified":"2012-11-22T15:19:33.865370"}
    ]

To list only the objects in the first "level" of our pseudo hierarchy, we can use the `delimiter=/` query parameter as follows:

    GET https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/test_container?format=json&delimiter=/
    X-Container-Object-Count: 7

    [
        {"subdir":"dir1/"},
        {"subdir":"dir2/"},
        {"subdir":"dir4/"},
        {"name":"obj6","hash":"b917968b8ad501a40af22c0bf4d83ee0","bytes":377,"content_type":"application/octet-stream", "last_modified":"2012-11-22T15:19:26.524310"},
        {"name":"obj7","hash":"b917968b8ad501a40af22c0bf4d83ee0","bytes":377,"content_type":"application/octet-stream", "last_modified":"2012-11-22T15:19:33.865370"}
    ]

The effect of delimiter is to examine all object names up to the `/` character and to collapse all common or duplicate elements. Where common/duplicate name parts are found, it uses the "subdir" JSON element. The same happens for XML. Notice that X-Container-Object-Count is still 7, even though there are only 5 names shown. The "subdir" elements are *not* objects -- an attempt to `GET /v1/12345678912345/test_container/dir1/` would fail with `403 Not Found`.

To descend into one of the "directories", we use the `prefix` query parameter as follows. Note the slash ("/") at the end of the prefix:

    GET https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/test_container?format=json&delimiter=/&prefix=dir2/
    X-Container-Object-Count: 7

    [
        {"subdir":"dir2/dir3/"}
    ]

Descending further, we add `dir3/` to the `prefix` as follows:

    GET https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/test_container?format=json&delimiter=/&prefix=dir2/dir3
    X-Container-Object-Count: 7

    [
        {"name":"dir2/dir3/obj2","hash":"b917968b8ad501a40af22c0bf4d83ee0","bytes":377,"content_type":"application/octet-stream", "last_modified":"2012-11-22T15:40:48.596260"},
        {"name":"dir2/dir3/obj3","hash":"b917968b8ad501a40af22c0bf4d83ee0","bytes":377,"content_type":"application/octet-stream", "last_modified":"2012-11-22T15:41:04.902890"}
    ]

#### 2.9.2 Using path query parameter

To use path effectively, we must create placeholder objects with the names of the folders or directories. By convention these are zero length with a [Content-Type](#content_type_request) of `application/directory`. 

> Note: these objects must a have trailing `/` in their names, i.e., `dir1/`, not `dir1`.

If we do this for each of the "directories" in the [prefix/delimiter](#prefix_delimiter) example, and then list the contents of the container, we get:

    GET https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/test_container?format=json
    X-Container-Object-Count: 11

    [
        {"name":"dir1/","hash":"d41d8cd98f00b204e9800998ecf8427e","bytes":0,"content_type":"application/directory", "last_modified":"2012-11-22T16:45:47.669580"},
        {"name":"dir1/obj1","hash":"b917968b8ad501a40af22c0bf4d83ee0","bytes":377,"content_type":"application/octet-stream", "last_modified":"2012-11-22T15:18:09.788760"},
        {"name":"dir2/","hash":"d41d8cd98f00b204e9800998ecf8427e","bytes":0,"content_type":"application/directory", "last_modified":"2012-11-22T16:46:14.239280"},
        {"name":"dir2/dir3/","hash":"d41d8cd98f00b204e9800998ecf8427e","bytes":0,"content_type":"application/directory", "last_modified":"2012-11-22T16:46:14.239280"},
        {"name":"dir2/dir3/obj2","hash":"b917968b8ad501a40af22c0bf4d83ee0","bytes":377,"content_type":"application/octet-stream", "last_modified":"2012-11-22T15:40:48.596260"},
        {"name":"dir2/dir3/obj3","hash":"b917968b8ad501a40af22c0bf4d83ee0","bytes":377,"content_type":"application/octet-stream", "last_modified":"2012-11-22T15:41:04.902890"},
        {"name":"dir4/","hash":"d41d8cd98f00b204e9800998ecf8427e","bytes":0,"content_type":"application/directory", "last_modified":"2012-11-22T16:46:41.420930"},
        {"name":"dir4/obj4","hash":"b917968b8ad501a40af22c0bf4d83ee0","bytes":377,"content_type":"application/octet-stream", "last_modified":"2012-11-22T15:41:20.756000"},
        {"name":"dir4/obj5","hash":"b917968b8ad501a40af22c0bf4d83ee0","bytes":377,"content_type":"application/octet-stream", "last_modified":"2012-11-22T15:42:49.804350"},
        {"name":"obj6","hash":"b917968b8ad501a40af22c0bf4d83ee0","bytes":377,"content_type":"application/octet-stream", "last_modified":"2012-11-22T15:19:26.524310"},
        {"name":"obj7","hash":"b917968b8ad501a40af22c0bf4d83ee0","bytes":377,"content_type":"application/octet-stream", "last_modified":"2012-11-22T15:19:33.865370"}
    ]

Now `dir1/`, `dir2/`, `dir2/dir3/`, and `dir4/` are real objects. The [X-Container-Object-Count](#x_container_object_count_response) response header now shows 10 objects in the system.

Here we query to top level of the container (where path is empty sting):

    GET https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/test_container?format=json&path=
    X-Container-Object-Count: 11

    [
        {"name":"dir1/","hash":"d41d8cd98f00b204e9800998ecf8427e","bytes":0,"content_type":"application/directory", "last_modified":"2012-11-22T16:45:47.669580"},
        {"name":"dir2/","hash":"d41d8cd98f00b204e9800998ecf8427e","bytes":0,"content_type":"application/directory", "last_modified":"2012-11-22T16:45:47.669580"},
        {"name":"dir4/","hash":"d41d8cd98f00b204e9800998ecf8427e","bytes":0,"content_type":"application/directory", "last_modified":"2012-11-22T16:46:41.420930"},
        {"name":"obj6","hash":"b917968b8ad501a40af22c0bf4d83ee0","bytes":377,"content_type":"application/octet-stream", "last_modified":"2012-11-22T15:19:26.524310"},
        {"name":"obj7","hash":"b917968b8ad501a40af22c0bf4d83ee0","bytes":377,"content_type":"application/octet-stream", "last_modified":"2012-11-22T15:19:33.865370"}
    ]

Here we descend into `dir4/`:

    GET https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/test_container?format=json&path=dir4
    X-Container-Object-Count: 10

    [
        {"name":"dir4/obj4","hash":"b917968b8ad501a40af22c0bf4d83ee0","bytes":377,"content_type":"application/octet-stream", "last_modified":"2012-11-22T15:41:20.756000"},
        {"name":"dir4/obj5","hash":"b917968b8ad501a40af22c0bf4d83ee0","bytes":377,"content_type":"application/octet-stream", "last_modified":"2012-11-22T15:42:49.804350"}
    ]

Notice that path was set to `dir4`. It could also have been set to `dir4/` -- the effect is the same.

### 2.10 Conditional GET of objects ### {#conditional_get}

You can perform conditional GET requests of an object by using certain HTTP
headers as documented in [RFC 2616](http://www.ietf.org/rfc/rfc2616.txt](http://www.ietf.org/rfc/rfc2616.txt).  Object Storage supports the following headers:

* If-Match
* If-None-Match
* If-Modified-Since
* If-Unmodified-Since

### 2.11 Retrieving a portion of object data ### {#range_request}

It is also possible to fetch a portion of an object's data using the
HTTP _Range_ header. Object Storage supports "bytes" as the range unit.

A range is specified in two basic ways:

* `first-byte-position - last-byte-position` -- this retrieves the content starting at `first-byte-position` and ending at `last-byte-position`. The byte offsets start at zero (so 0 starts at first byte) and bytes positions are inclusive (so 0-0 is the first byte of content).

* `- length` -- this retrieves the final `length` bytes of the content.

You may omit the `last_byte_position`.
If so, it defaults to be the last byte of the file.

The following examples show examples of the Range header in use. In these examples, the data comprises 10 bytes of data containing "0123456789".

* Range: bytes=0-0 -- The first byte of data; returns "0"

* Range: bytes=1-1 -- The second byte of data; returns "1"

* Range: bytes=0-1 -- The first and second byte of data; returns "01"

* Range: bytes=2-5 -- Bytes 2 to 5 inclusive; returns "2345"

* Range: bytes=5- -- All data after and including byte 5; returns "56789" 

* Range: bytes=-3 -- The last three bytes of the object; returns "789" 

When you specify a range, the GET request returns a 206 Partial Content
code (instead of the usual 200 OK). In addition, a Content-Range response header is added. For example, in response to `Range: bytes=-3`, the response header is as follows:

    Content-Range: bytes 7-9/10

You may also specify several ranges in the _Range_ header.  In this example, the first two and final three bytes of the content are being requested:

    $ curl -i -H 'x-auth-token: HPAuth_1234' https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/www/0123 -X GET -H 'range: bytes=0-1,-3'

    HTTP/1.1 206 Partial Content
    Content-Length: 263
    Accept-Ranges: bytes
    Etag: 781e5e245d69b566979b86e28d23f2c7
    Content-Type: multipart/byteranges;boundary=d103b85868e4567035e3148996623809

    --d103b85868e4567035e3148996623809
    Content-Type: application/octet-stream
    Content-Range: bytes 0-1/10

    01
    --d103b85868e4567035e3148996623809
    Content-Type: application/octet-stream
    Content-Range: bytes 7-9/10

    789
    --d103b85868e4567035e3148996623809--

As you can see the data is transmitted as a multipart message using the
_multipart/byteranges_ content type.

### 2.12 Large Object Creation ### {#large_objects}

The content of an object cannot be larger than 5GB. However, you can store larger content using two types of objects:

* Divide your content into pieces and upload each piece into its own object. These objects are known as segment objects.

* Create a manifest object. A manifest object "points to" the segment objects.

Segment objects do not have any special features and can be created, updated, downloaded and deleted as described elsewhere in this document. However, a manifest object is special -- when you download, the system concatenates the contents of the segment objects and returns this in the response body of the request. This behavior extends to the response headers returned by GET and HEAD operations. The Content-Length is the total size of all segment objects and the ETag is calculated by taking the ETag value of each segment, concatenating them together and then returning the MD5 checksum of the result.

> Note: If you use the COPY operation using a manifest object as the source, the new object is a "normal" object (not segmented). If the total size of the source segment objects exceeds 5GB, the COPY operation will fail. However, as explained later, you can make a duplicate of the manifest object. This new object may be larger than 5GB.

There are two types of manifest object as follows:

* Static Large Objects. The manifest object content is an ordered list of the names of the segment objects in json format.

* Dynamic Large Objects. The manifest object has no content. However, it has X-Object-Manifest metadata. The value of this is {container}/{prefix}, where {container} is the name of the container where the segment objects are stored and {prefix} is a string that all the segment objects have in common.

While both types of manifest objects have similar behavior, there are differences as explained in the following table.

|Feature     |Static Large Object      |Dynamic Large Object|
|:---------  |:------------------      |:-------------------|
|End-to-end integrity|Mostly assured. The list of segments includes the MD5 checksum (ETag) of each segment. You cannot upload the manifest object if the ETag in the list differs from the segment object already uploaded. If a segment is somehow lost, an attempt to download the manifest object will result in an error. However, on download, the ETag response header does not contain the MD5 checksum of the object. This makes it harder to check the integrity of the download operation.|Not guaranteed. The eventual consistency model means that although you have uploaded a segment object, it may not appear in the container listing until later. If you download the manifest before it appears in the container, it will not form part of the content returned in response to a GET request.|
|Upload order|The segment objects must be uploaded before the manifest object.|You can upload manifest and segment objects in any order. You are recommended to upload the manifest object after the segments in case a premature download of the manifest occurs. However, this is not enforced.|
|Removal or addition of segment objects|You cannot add or remove segment objects from the manifest. However, you can create a completely new manifest object of the same name with a different manifest list.|You can upload new segment objects or remove existing segments --- the names must simply match the <prefix> supplied in X-Object-Manifest.|
|Segment object size and number|Segment objects must be at least 1MB in size (by default). The final segment object can be any size. At most 1000 segments are supported (by default).|Segment objects can be of any size.|
|Segment object container name|The manifest list includes the container name of each object, i.e., segment objects may be in different containers.|All segment objects must be in the same container.|
|Manifest Object Metadata|The object has X-Static-Large-Object set to true. You do not set this metadata directly. Instead the system sets it when you PUT a static manifest object.|The X-Object-Manifest value is the {container}/{prefix} indicating where the segment objects are located. You supply this request header in the PUT operation|
|Making a copy of the manifest object|To make a copy of the manifest object, include the ?multipart-manifest=get query string with the COPY operation. The new object contains the same manifest as the original. The segment objects are not copied. Instead, both the original and new manifest objects share the same set of segment objects.|The COPY operation does not create a manifest object. To duplicate a manifest object, use the GET operation to read the value of X-Object-Manifest and use this value in the X-Object-Manifest request header in a PUT operation. This creates a new manifest object that shares the same set of segment objects as the original manifest object.|

#### 2.12.1 Static Large Object Creation #### {#slo}

A Static Large Object is created in two steps:

1. Divide your content into pieces and create (i.e., upload) a segment object to contain each piece. You must record the ETag response header returned by the PUT operation. Alternatively, you can calculate the MD5 checksum of the segment prior to uploading and include this in the ETag request header. This is preferable because it ensures that the upload cannot corrupt your data.

2. List the name of each segment object along with its size and MD5 checksum in order. Create a manifest object. You indicate that this is a manifest object by including the ?multipart-manifest=put query string at the end of the manifest object name.

The body of the PUT request on the manifest object comprises a json list, where each element contains the following:

* path - this is the container and object name in the following format: {container-name}/{object-name}

* etag - this is the MD5 checksum of the content of the segment object. This must match the ETag of that object.

* size_bytes - this is the size of the segment object. This must match the Content-Length of that object

This is an example of a static large object manifest containing three segment objects. In this example, we illustrate that in contrast to dynamic large objects, you can use a number of containers and the object names do not have to conform to a specific pattern.

    [
      {
        "path": "/mycontainer/objseg1",
        "etag": "0228c7926b8b642dfb29554cd1f00963",
        "size_bytes": 1468006
      },
      {
        "path": "/mycontainer/pseudodir/seg-obj2",
        "etag": "5bfc9ea51a00b790717eeb934fb77b9b",
        "size_bytes": 1572864
      },
      {
        "path": "/other-container/seg-final",
        "etag": "b9c3da507d2557c1ddc51f27c54bae51",
        "size_bytes": 256
      }
    ]

The [Content-Length](#content_length_request) request header must contain the length of the json content -- not the length of the segment objects. However, after the PUT operation completes, the Content-Length metadata is set to the total length of all the object segments. A similar situation applies to the [ETag](#etag_request). If used in the PUT operation, it must contain the MD5 checksum of the json content. The ETag metadata value is then set to be the MD5 checksum of the concatenated ETag values of the object segments. You may also set the [Content-Type](#content_type_request) request header and custom object metadata.

When the PUT operation sees the ?multipart-manifest=put query string, it reads the request body and verifies that each segment object exists and that the sizes and ETags match. If there is a mismatch, the PUToperation will fail.

If everything matches, the manifest object is created. The X-Static-Large-Object metadata is set to true indicating that this is a static object manifest.

When you perform a GET operation on the manifest object, the system concatenates the contents of all the segment objects together into one large download.

> Note: the MD5 checksum in the [ETag](#etag_response) header is the MD5 checksum of the concatenated string of MD5 checksums/ETags for each of the segments in the manifest - not the MD5 checksum of the content that was downloaded. Also the value is enclosed in double-quote characters.

To download the manifest list, use the query string ?multipart-manifest=get with a GET operation. The resulting list will not be identically formatted as the manifest you originally used in the PUT operation.

If you use the DELETE operation on a manifest object, the manifest object is deleted -- the segment objects are not affected. However, if you add the query parameter ?multipart-manifest=delete, the segment objects are deleted and if all are successfully deleted, the manifest object is also deleted.

To change the manifest, use a PUT operation with the ?multipart-manifest=put query string. This will create a new manifest object. You may also update the object metadata in the usual way.

##### 2.12.1.1 Static Large Object Example ##### {#slo_example}

In this example, we will place the segment objects into the "segments" container and the manifest object into the "images" container. We are not required to do this, but using a dedicated container for segment objects is convenient.

As explained in [End to end integrity](#end_to_end_integrity) it can be useful to add an MD5 checksum as custom metadata. In this example, we add custom metadata called "X-Object-Meta-MD5-Content". However, please be aware that the system does not understand this metadata item and other than storing it, no processing or checking takes place.

Assuming we've already divided our image into three files, let's upload them.

Uploading first segment:

    $ curl -X PUT -i -H "X-Auth-Token: {Auth_Token}" -T ./piece1 https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/segments/terrier-jpg-one
    HTTP/1.1 201 Created
    Content-Length: 4000000
    Etag: f7365c1419b4f349592c00bd0cfb9b9a

Uploading second segment:

    $ curl -X PUT -i -H "X-Auth-Token: {Auth_Token}" -T ./piece2 https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/segments/terrier-jpg-two
    HTTP/1.1 201 Created
    Content-Length: 2000000
    Etag: ad81e97b10e870613aecb5ced52adbaa

Uploading final segment:

    $ curl -X PUT -i -H "X-Auth-Token: {Auth_Token}" -T ./piece3 https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/segments/terrier-jpg-three
    HTTP/1.1 201 Created
    Content-Length: 1000
    Etag: 00b046c9d74c3e8f93b320c5e5fdc2c3

At this stage we are ready to create the manifest listing. Notice that the size and ETag are copied from uploads above. Lets use an editor to create a file called manifest.json with the following content:

    [
        {
            "path": "segments/terrier-jpg-one",
            "etag": "f7365c1419b4f349592c00bd0cfb9b9a",
            "size_bytes": 4000000
        },
        {
            "path": "segments/terrier-jpg-two",
            "etag": "ad81e97b10e870613aecb5ced52adbaa",
            "size_bytes": 2000000
        },
            "path": "segments/terrier-jpg-three",
            "etag": "00b046c9d74c3e8f93b320c5e5fdc2c3",
            "size_bytes": 1000
        {
        }
    ]

The final operation is to upload this content into a manifest object. To indicate that this is a manifest object, you need to specify the ?multipart-manifest=put query string.

    $ curl -X PUT -i -H "X-Auth-Token: {Auth_Token}" -T ./manifest.json https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345//images/terrier-jpg?multipart-manifest=put -H 'x-object-meta-md5-content: afa2d672e75ef34aa9cf17e615f61a44'

We can now examine our static large object. Notice that the size is the total size of all the segments.

    $ curl -X HEAD -i -H "X-Auth-Token: {Auth_Token}" https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/images/terrier-jpg
    HTTP/1.1 200 OK
    Content-Length: 6001000
    Etag: "0c922c37f915efb1c9b97e6328b3e660"
    X-Object-Meta-Md5-Content: afa2d672e75ef34aa9cf17e615f61a44

#### 2.12.2 Dynamic Large Object Creation #### {#dlo}

File or data content larger than 5GB must be segmented prior to upload. You
upload the segments as individual objects and create a manifest object telling Object Storage how to find the segments of the large object. The segments remain individually addressable, but retrieving the manifest object streams all the segments concatenated. There is no limit to the number of segments that can be a part of a single large object.

In order to ensure the download works correctly, you must upload all the object segments to the same container and ensure each object name has a common prefix where their names sort in the order they should be concatenated. You also must create and upload a manifest object. The manifest object is simply a zero length object with the extra 'X-Object-Manifest' request header. The value is the container and prefix in this format: `{container}/{prefix}` , where `{container}` is the container the object segments are in and `{prefix}` is the common prefix for all the segments.

> Note: The container and prefix in the 'X-Object-Manifest' request header must be UTF-8 encoded and then URL-encoded.

It is best to upload all the segments first and then create or update the manifest. With this method, the full object is not available for downloading until the upload is complete. Also, you can upload a new set of segments to a second location and then update the manifest to point to this new location. During the upload of the new segments, the original manifest is still available to download the first set of segments.

> Note: When you create an object manifest, the system does not check that
the object segments are already uploaded.

If you perform a GET or HEAD operation on the object manifest, the [Content-Length](#content_type_response) is the total length of all object segments.

> Note: When use the [COPY operation](#object_copy) on a manifest object, the new object is a "normal" object -- not a copy of the manifest. Instead it is a concatenation of all the segment objects. This means that you cannot copy objects larger than 5GB in size.

The following shows an example of uploading a segmented object called maps/world.jpg. The object is in the `images` container. For illustrative purposes, the object segments are stored in the `image-segments` container. The final operation is to download the segmented object. Note the [Content-Length](#content_length_response) and [ETag](#etag_response) response headers.

    $ curl -i -H 'x-auth-token: {Auth_Token}' https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/image-segments/world-seg-1 -X PUT -T world-seg.1
    HTTP/1.1 201 Created
    Content-Length: 100
    Content-Type: application/octet-stream
    Etag: 9eee6548e45382ffa8f93d574d35274f

    $ curl -i -H 'x-auth-token: {Auth_Token}' https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/image-segments/world-seg-2 -X PUT -T world-seg.2
    HTTP/1.1 201 Created
    Content-Length: 200
    Content-Type: application/octet-stream
    Etag: 318ea6d6a0aa0567246f2de90c470fcd

    $ curl -i -H 'x-auth-token: {Auth_Token}' https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/images/maps/world.jpg -X PUT -H 'content-length: 0' -H 'x-object-manifest: image-segments/world-seg-' -H 'content-type: image/jpeg'
    HTTP/1.1 201 Created

    $ curl -i -H 'x-auth-token: {Auth_Token}' https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/images/maps/world.jpg -X GET
    HTTP/1.1 200 OK
    X-Object-Manifest: image-segments/world-seg-
    Content-Type: image/jpeg
    Content-Length: 300
    ETag: "4e12eb0effb78728966205d154967a67"

    [ .. ]

> Note: the MD5 checksum in the [ETag](#etag_response) header is the MD5 checksum of the concatenated string of MD5 checksums/ETags for each of the segments in the manifest - not the MD5 checksum of the content that was downloaded. Also the value is enclosed in double-quote characters.

### 2.13 Chunked Transfer Encoding ### {#transfer_encoding_request}

When you create an object, you normally specify the size of the content being uploaded with the [Content-Length](#content_length_request) request header. Alternatively you can use the Transfer-Encoding request header and set it to a value of `chunked`.

With Chunked Transfer Encoding, you do not need to know the total size of the object in advance. Instead, you can start to transfer "chunks" of content. You need to know the size of each chunk. To indicate that you have finished transferring chunks, you specify a size of 0. 

If you attempt to upload more that 5GB with this method, the service closes the
TCP/IP connection after 5GB and purges the object from the system. For large
objects, use [object segments](#large_objects).

In the following example, the object is uploaded in two chunks. As you can see
the size is given before each chunk of data. The size is expressed as the number of octets of the data expressed in hexadecimal. The final chunk has a size of 0, indicating the end of content.

      PUT /v1/12345678912345/{container}/{object} HTTP/1.1
      Transfer-Encoding: chunked                     

      19
      A bunch of data broken up
      D
       into chunks.
      0

> Note: the chunk size only indicates the size of the chunk data. This does not include the trailing CRLF ("\r\n")

### 2.14 Enabling File Compression with the Content-Encoding Header ### {#content_encoding_header}

The Content-Encoding header allows a file to be compressed without
losing the identity of the underlying media type of the file, for
example, a video.

In the example, the content-encoding header is assigned with an
attachment type that indicates how the file should be downloaded:

    $ curl -i -H 'x-auth-token: {Auth_Token}' https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/test_container_1/vid -X PUT -T vid -H 'Content-Type: video/mp4' -H 'Content-Encoding: gzip'
    HTTP/1.1 201 Created
    ETag: 4281c348eaf83e70ddce0e07221c3d28

### 2.15 Enabling Browser Bypass with the Content-Disposition Header ### {#content_disposition_header}

When an object is assigned the Content-Disposition header you can override a browser's default behavior for a file so that the downloader saves the file rather than displaying it using default browser settings.

In the example, the content-encoding header is assigned with an attachment type that indicates how the file should be downloaded.

    $ curl -i -H 'x-auth-token: {Auth_Token}' https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/test_container_1/image.tif -X PUT -T image1.tif -H 'Content-Type: image/tiff' -H 'Content-Disposition: attachment; filename=image.tif'
    HTTP/1.1 201 Created
    ETag: 4281c348eaf83e70ddce0e07221c3d28

### 2.16 Archive Auto Extraction ### {#tarball_upload}

With the Archive Auto Extraction feature, you can upload a tar(1) archive file.
The system will extract the files from the archive and create an objects.

#### 2.16.1 Archive Auto Extraction PUT Operation ####

The upload is performed using a [PUT operation](#object_put). You add the
the query parameter`?extract-archive=<format>` to indicate that you are
uploading a tar(1) archive file instead of normal content. The `<format>`
is one of "tar", "tar.gz", and "tar.bz2".

The path you specify with the PUT operation is a prefix for the resulting
object names. For example, if the first object in the tar(1) archive is `/home/file1.txt`, a path of `/v1/12345678912345/mybackup/castor/` results in an object name of `castor/home/file1.txt` in the `mybackup` container in the `12345678912345` account. The path you specify can be for an account, a specific container or a specific object prefix. The following table shows various combinations:

|Path specified in PUT operation|Archive member name|Resulting path to first object|Notes|
|:------------------            |:------------      |:-----------------            |:----|
|/v1/12345678912345             |/home/file1.txt|/v1/12345678912345/home/file1.txt|Upload to root of account. Containers (in this example, "home")are autocreated as required.|
|/v1/12345678912345/mycontainer|/home/file1.txt|/v1/12345678912345/mycontainer/home/file1.txt|Upload to the root of a container. The object name (in this exmple "home/file1.txt") is taken from the member name.|
|/v1/12345678912345/mycontainer/castor/|/home/file1.txt|/v1/12345678912345/mycontainer/castor/home/file1.txt|Upload to a container, where each object name is prefixed by the prefix in the path. In this example, the container is `mycontainer` and the prefix is `castor`. In this example, the resulting object name is `castor/home/file1.txt|

When making an object name based on the archive member name, a slash (`/`) character is always added after the prefix path -- unless this would cause a double slash. It does not matter if the archive member name has an absolute path (such as `/home/file1.txt`) or realtive path (such as `./home/file1.txt`) -- a single slash is added before the member names. However, note that `../` is not allowed.

#### 2.16.2 Creating an Archive for Auto Extraction ####

The tar(1) archive must be created using the tar(1) utility. The following
features and restrictions apply:

* Only regular files will be uploaded.

* Anything else (empty directories , symlinks, etc.) will not be uploaded.

* The member names must be valid UTF-8 encoded character strings.

* The member names are restricted as described in [Container and Object Naming](#naming). Specifically, `../` or `/../` must not appear in the member name since the resulting object name would then contain `/../`. However, the member name
may start with `./` since this is removed when forming the object name.

* The POSIX.1-1988 (ustar) format is supported.

* The GNU tar format including longname and longlink extensions and the sparse extension are supported

* The POSIX.1-2001 (pax) format is supported

* The archive may be compressed with gzip(1) or bzip2(1). Specify the format used with the `extract-archive` query string (use `tar`, `tar.gz` or `tar.bz2` to indicate the format).

#### 2.16.3 Response to Archive Auto Extract ####

When the request is processed by the system, you are in effect performing multiple operations. The system returns results as follows:

* If there are problems with the upload of the archive (Content-Length missing, ETag missmatch, account does not exist), you will receive an appropriate error status and response.

* If the system succeeds in creating all objects, you get a 201 Created status.

* If any object fails to create, you will get a failure status. You need to examine the [response body](#archive_response_body) to determine which members failed to result in an object creation.

#### 2.16.4 Body of Archive Auto Extract Response #### {#archive_response_body}

The response body contains the following information:

* The number of files created. This is the number of objects that were successfully created.

* Errors. This is a list of object name and associated error status for the objects that failed to create. The format depends on the Accept header.

You can use the `Accept` header to indicate the format of the response body as follows:

* text/plain. Plain text. This is the default if the `Accept` header is not specified.

* application/json. Format as JSON

* application/xml or text/xml. Format as XML. This option is not supported at
this time.

The following example shows a text/plain response body where there are
no failures:

     Number Files Created: 10
     Errors:

The following example shows a text/plain response where there are some failures:

     Number Files Created: 8 
     Errors:
     /v1/12345678912345/mycontainer/home/xx%3Cyy, 400 Bad Request
     /v1/12345678912345/mycontainer/../image.gif, 400 Bad Request

This is the same failure response in application/json format. This example output has been reformatted with whitespace to make it clearer -- the actual response has no such whitespace.

     {
         "Number Files Created": 1,
         "Errors": [
             ["/v1/12345678912345/mycontainer/home/xx%3Cyy", "400 Bad Request"],
             ["/v1/12345678912345/mycontainer/../image.gif", "400 Bad Request"]
         ]
    }

#### 2.16.5 Archive Auto extract Example ####

The following shows an archive being uploaded. In this example, a container called "www" is created containing two objects -- "index.html" and "images/flower.gif". The `-t` option is used to demonstrate the archive member names.

    $ tar -tf tarball.tar
    ./www
    ./www/index.html
    ./www/images
    ./www/images/flower.gif

    $ curl https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345?extract-archive=tar -H 'x-auth-token: {Auth_Token}' -X PUT -T tarball.tar -H 'accept: application/json'
    HTTP/1.1 201 Created
    Content-Length: 41
    Content-Type: application/json

    {"Number Files Created": 2, "Errors": []}

We can demonstrate that the www container now contains two objects as follows.
Note since the archive member `./www/images` is a directory (not a regular file)
it is not uploaded; there is no object called `images`.

    $ curl https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/www -H 'x-auth-token: {Auth_Token}' -X GET
    HTTP/1.1 200 OK
    Content-Length: 29
    X-Container-Object-Count: 2

    images/flower.gif
    index.html

### 2.17 Bulk Delete ### {#bulk_delete}

With bulk delete you can  delete up to 10,000 objects or containers in one request. The objects to be deleted are listed in the body of a [DELETE operation](#object_delete). The `?bulk-delete` query paramater is used to indicate that you are performing a bulk delete operation instead of a normal delete. 

#### 2.17.1 Bulk Delete Request Body #### {#bulk_delete_request_body}

To indicate that you are performing a bulk delete operation, add the `?bulk-delete` query paramater to the path. The path should be the account (e.g., `/v1/12345678912345`) containing the objects and containers. The [Content-Type](#content_type_request) request header must be set to `text/plain`.

The request body comprises a list of object or container names, separated by a newline character. In addition:

* The names must be UFT-8 encoded and then URL-encoded.

* To indicate an object, specify the container and object name as follows:

    {container-name}/{object-name}

* To indicate a container, specify the container name as follows:

    {container-name}

* A container must be empty. If it contains objects, the container will not be deleted.

* At most 10,000 items can be in the list

#### 2.17.2 Bulk Delete Response #### {#bulk_delete_response}

When the request is processed by the system, you are in effect performing multiple operations. The system returns results as follows:

* If there are problems with the delete operation itself (e.g., invalid Content-Type) you will receive an appropriate error status and response.

* If the system succeeds in deleting all items in the list or the items were already deleted, you get a success status.

* If any object or container fails to delete, you will get a failure status. You need to examine the response body the to determine which items were not deleted.

The response body contains the following information:

* Number deleted. This is the number of items that were actually deleted by this operation.

* Number not found. This is the number of items that were not found (i.e., were already deleted)

* Errors. This is a list of names and associated error status values for the items that failed to delete. The format depends on the Accept header.

You can use the `Accept` header to indicate the format of the response body as follows:

* text/plain. Plain text. This is the default if the `Accept` header is not specified.

* application/json. Format as JSON

* application/xml or text/xml. Format as XML.

The following example shows a text/plain response body where there are no failures:

    Number Deleted: 2
    Number Not Found: 0
    Errors:

The following example shows an XML response where there is one error. In this example, the mycontainer is not empty:

    <?xml version="1.0" encoding="UTF-8"?>
    <delete>
    <number_deleted>2</number_deleted>
    <number_not_found>4</number_not_found>
    <errors>
    <object>&#60;name>/v1/12345678912345/mycontainer</name><status>409 Conflict</status></object></errors>
    </delete>

The following shows a JSON response. This text has been reformatted for clarity:

    {
        "Number Not Found": 4,
        "Number Deleted": 2,
        "Errors": [
            ["/v1/12345678912345/mycontaine", "409 Conflict"]
        ]
    }

#### 2.17.3 Bulk Delete Example

The following example shows two objects and a container being deleted using the bulk delete operation. The items to be deleted are listed in the body.txt file. A JSON response body is requested using the Accept header. 

    $ echo body.txt
    mycontainer/object1
    mycontainer/subdir1/object2
    www

    $ curl https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345?bulk-delete -H 'X-Auth-Token: {Auth_Token}' -X DELETE -T body.txt -H 'content-type: text/plain' -H 'accept: application/json'
    HTTP/1.1 200 OK
    Content-Length: 58
    Content-Type: application/json

    {"Number Not Found": 0, "Number Deleted": 3, "Errors": []}

### 2.18 Container Synchronization ### {#container_synchronization}

#### 2.18.1 Overview of Container Synchronization

Container Synchronization allows you to automatically synchronize the objects between containers in different Object Storage regions. The containers must be in different regions. The containers do not need to be in the same swift account i.e., users associated with two different projects can share objects.

Container Synchronization works by making a copy of objects in a "source" container and sending the objects to a "destination" container. The object is copied in such a way as to retain its metadata -- such as [Last-Modified](#last_modified_response) and any custom metadata you may have on the object. If you delete an object in the source container, it is also deleted from the destination container.

The synchronization is done as a background action. When you put an object into the source container, it will take some time before it becomes visible in the destination container. Storage Services will not necessarily copy objects in any particular order. Specifically, they may be transferred in a different order to which they were created.

> Note: [Segmented objects](#large_objects) (objects larger than 5GB) will not work seamlessly with Container Synchronization. If the manifest object is copied to the destination container before the object segments, when you perform a GET operation on the manifest object, the system may fail to find some or all of the object segments. If your manifest and object segments are in different containers, don't forget that both containers must be synchonized and that the container name of the object segments must be the same on both source and destination.

You may operate on the destination container just like any other container -- adding or deleting objects -- including the objects that are in the destination container because they were copied from the source container. To decide how to handle object creation, replacement or deletion, the system uses timestamps to determine what to do. In general, the latest timestamp "wins" i.e., if you create an object, replace it, delete it and the re-create it, the destination container will eventually contain the most recently created object. However, if you also create and delete objects in the destination container, you get some subtle behaviours as follows:

* If an object is copied to the destination container and then deleted, it remains deleted in the destination even though there is still a copy in the source container. Of course, if you modify the object (replace or change its metadata) in the source container, it will reappear in the destination again.
* The same applies to a replacement or metadata modification of an object in the destination container -- the object will remain as-is unless there is a replacement or modification in the source container.
* If you replace or modify metadata of an object in the destination container and then delete it in the source container, it is _not_ deleted from the destination. This is because your modified object has a later timestamp than the object you deleted at source.
* If you create an object in the source container and before the system has a chance to copy it to the destination, you also create an object of the same name in the destination, then the object in the destination is _not_ overwritten by the source container's object.

So far, the discussion has been about synchronizing between a source and destination container. What happens if you make the "destination" a "source" for another container? There are three situations:

* The new destination is yet another container. i.e., there is a chain of three containers
* The new destination is actually the original source container. This is two-way synchronization. In effect, objects placed into either container will be copied to the other container.
* Two or more source containers could copy data to a single destination

#### 2.18.2 Configuring Containers to Synchronize #### {#container_sync}

This section describes how to set up synchronization between a source and destination container. To set up a chain, or two-way synchronization, simply repeat the operation for the new source and destination. To set up synchronization between containers you need to know or agree:

* The full pathname of the destination container  -- to include system name, account and container name (e.g., https://region-b.geo-1.objects.hpcloudsvc.com/v1/12345987654321/dest). As with all URLs, the container name must be UTF-8 encoded and then URL-encoded.
* The full pathname of the source container  -- to include system name, account and container name (e.g., https://region-b.geo-1.objects.hpcloudsvc.com/v1/12345987654321/src)
* Select and agree on a secret string -- in effect, this is a shared password. Only if both sides have the same password will the system synchronize containers. Obviously, you should keep this secret. If this becomes known to someone else, they could overwrite the contents of the destination container (but not copy the source container).

You then:

1. Set the following metadata on the source container:
  * X-Container-Sync-To. This is the full path name of the destination, e.g.  https://region-b.geo-1.objects.hpcloudsvc.com/v1/12345987654321/dest
  * X-Container-Sync-Key. This is the value of the shared secret value, e.g. "our-secret"

2. Set the following metadata on the destination container:
  * X-Container-Sync-Key. This is the value of the shared secret value, e.g. "our-secret"

Notice that you do not need to tell the destination container the name of the source container.

Here is an example of setting up a simple one-way synchronization between two containers. In this example, we are setting up synchronization between containers in two different projects -- hence the authorization token is different. These commands are either run by two different people, or one 
person must have the credentials for both projects. In a simpler scenario, where the containers are both in the same project, the authorization token would be the same.

Here, the source is set up:

    $ curl https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/src -H 'x-auth-token: {Auth_Token}' -X PUT -H 'x-container-sync-to: https://region-b.geo-1.objects.hpcloudsvc.com/v1/12345987654321/dest' -H 'x-container-sync-key: our-secret'

Here, the destination is setup with a secret value:

    $ curl https://region-b.geo-1.objects.hpcloudsvc.com/v1/12345987654321/dest -H 'x-auth-token: {Auth_Token}' -X PUT -H 'x-container-sync-key: our-secret'

The following example shows setting up two-way synchronization where the account and container names are the same on both systems.
Notice that the commands are nearly identical except for the "region-a" and "region-b" strings in the paths.

    $ curl https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/photos -H 'x-auth-token: {Auth_Token}' -X PUT -H 'x-container-sync-to: https://region-b.geo-1.objects.hpcloudsvc.com/v1/12345678912345/photos' -H 'x-container-sync-key: my-secret'

    $ curl https://region-b.geo-1.objects.hpcloudsvc.com/v1/12345678912345/photos -H 'x-auth-token: {Auth_Token}' -X PUT -H 'x-container-sync-to: https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/photos' -H 'x-container-sync-key: my-secret'

### 2.19 Object Versioning ### {#object_versioning}

#### 2.19.1 Object Versioning Overview ####

Object versioning is enabled at the container level. To specifiy that objects
should be versioned, set the [X-Versions-Location](#x_versions_location)
metadata on the container.

The value of X-Versions-Location is the name of another container -- this
is a container that will hold old versions of the objects. It is recommended that you use a different versions-location container for each version-enabled container.

> Note: the name of the container must be UTF-8 encoded and then URL-encoded in the X-Versions-Location request header.

> Note: A [Large Object](#large_objects) manifest object cannot be versioned. However, a manifest object may point to versioned segment objects.

Once you enable versions on a container, the system behaves as follows:

* When you first set the X-Versions-Location metadata, nothing happens to the objects already in the container.

* If you PUT a new object (i.e., an object of that name does not already exist) into the version-enabled container, the PUT behaves as normal; the versions-location container is not involved.

* If you now PUT an object of the same name into the container, two actions are performed:

 * A copy of the original object is made and placed in the versions-location container. This copy contains the contents and metadata of the original object.

  - A new object is created in the version-enabled container. The content and metadata of the object are specified in the PUT operation. Specifically, the matadata of the original object is not preserved or copied to the new object.

* A PUT of yet another object of the same name repeats the above process; a
copy is made in the versions-location container. At this stage, there are now
three objects in the system -- one in the version-enabled container and two
in the versions-location container.

* A POST operation on an object in the version-enabled container updates the metadata of the object in the normal way. The metadata of the objects in the versions-location container is not changed. No new object is created in the versions-location container. This only happens when you change the _content_ of an exising object.

* If you delete an object in the version-enabled container, the system finds the most recent object in the versions-location container and moves it into the version-enabled container. The result is that we have restored the object to the state of its prior version. This includes content and metadata. At this stage there are two objects in the system -- one in the version-enabled container and one in the versions-location container.

* Another DELETE operation will operate in the same way. We are now back to
the first, original, object.

* A DELETE at this stage will cause the object in the version-enabled
container to be deleted.

#### 2.19.2 Enabling Versioning on a Container #### {#x_versions_location}

To enable versioning on a container, set the X-Versions-Location metadata.
The value is the name of a container. The container must already exist. If the versions-location container does not exist, the PUT/POST operation will not fail. However, when you first attempt to replace an object in the version-enabled container, the PUT operation will fail with a 412 Precondition Failed error.

This example shows the _mywork_ container being enabled using _priorwork_ container as the versions-location container; it first creates the versions-location container:

    $ curl -i -H 'x-auth-token: {Auth_Token}' https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/priorwork -X PUT
    HTTP/1.1 201 Created

    $ curl -i -H 'x-auth-token: {Auth_Token}' https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/mywork -X POST -H 'x-versions-location: priorwork'
    HTTP/1.1 204 No Content

To disable versioning, perform a POST operation to the version-enabled
container with a blank or empty value for the X-Versions-Location request
header.

This example shows how to disable versioning on a container. Note: you need
a recent version of curl that sets headers to an empty string using the ";"
character.

    $ curl -i -H 'x-auth-token: {Auth_Token}' https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/mywork -X POST -H 'x-versions-location;'

When you disable versioning nothing happens to the objects in the version-enabled or versions-location container. However, the next time you perform a PUT operation to an object that already exists, it is simply replaced and no copy is made to the versions-location container.

You may reenable versioning on a container. If you use the original versions-location container, a DELETE operation will restore the prior version.

#### 2.19.3 Accessing the versions-location Container Directly ####

The versions-location container is all respects a normal container. It is
possible to list it's contents, get, put, modify and delete objects. This is not generally recommended because you may break the versioning semantics of the system with unpredictable results.

However, if you are disabling versioning or deleting a version-enabled container, it is acceptable to delete all objects from the versions-location container. Of course, you now have no possability of restoring prior versions of an object.

### 2.20 Scheduled Deletion of Objects ### {#expiring_objects}

Objects can be scheduled for deletion at a designated time, known as
the _delete-at_ time. You specify the delete-at time with either the X-Delete-At or X-Delete-After request headers during an object PUT or POST.

Before the delete-at time, the object behaves normally. However, when the delete-at time has passed, the following occurs:

* An attempt to retrieve the object (GET or HEAD operation), will return
404 Not Found error; in effect the object will appear to have been deleted.

* However, if you get a list of the objects in the container (GET container),
the object may still be listed -- as though it still exists.

* This may persist for a short period. The system makes no guarantees about when it will remove the object from the container listing. It may be as short
as a few minutes but usually does not exceed two hours.

#### 2.20.1 Setting the Delete-At Time #### {#x_delete_at}

The delete-at time is stored in an object's X-Delete-At metadata. The time is
expressed as a Unix Epoch timestamp. You can set the X-Delete-At metedata
in a PUT or POST operation using one of these request headers:

* X-Delete-At. This specifies the Unix Epoch time at which the object should
be deleted. For example, to request that the object be deleted on 1st March 2013 at 13:30 GMT, the value should be 1362144600. If you specifiy a time in the past, an attempt to retrieve the object will immediately return a 404 Not Found error -- although as explained above, the object may continue to appear in container listings.

* X-Delete-After. This specifies the number of seconds (from time of request) until the object is deleted. Internally, the system adds this value to the current UTC time and stores it in the X-Delete-At metadata.

The following example shows an example of using the X-Delete-At request header:

    $ curl -i -H 'x-auth-token: {Auth_Token}' https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/mycontainer/myobj_1 -X POST -H 'x-delete-at: 1362144600'
    HTTP/1.1 202 Accepted

The following example shows an example of using the X-Delete-After request
header. In this example, we demonstrate that an attempt to retrieve the
object after the delete-at time returns 404 Not Found. We also show that
the object continues to appear in the container for some time
after the delete-at time.

    $ curl -i -H 'x-auth-token: {Auth_Token}' https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/mycontainer/myobj_2 -X POST -H 'x-delete-after: 30'
    HTTP/1.1 202 Accepted

    $ sleep 31 

    $ curl -i -H 'x-auth-token: {Auth_Token}' https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/mycontainer/myobj_2 -X GET
    HTTP/1.1 404 Not Found

    $ curl -i -H 'x-auth-token: {Auth_Token}' https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/mycontainer -X GET
    HTTP/1.1 200 OK
    X-Container-Object-Count: 2
    X-Container-Bytes-Used: 2000

    myobj_1
    myobj_2

    $ sleep 3600

    $ curl -i -H 'x-auth-token: {Auth_Token}' https://region-a.geo-1.objects.hpcloudsvc.com/v1/12345678912345/mycontainer -X GET
    HTTP/1.1 200 OK
    X-Container-Object-Count: 1 
    X-Container-Bytes-Used: 1000

    myobj_1

### 2.21 StaticWeb ### {#staticweb}

#### 2.21.1 StaticWeb Overview ####

Normally, a [GET operation on a container](#container_get) causes the system to list the objects in the container. However, if you set StaticWeb metadata on the container, you can change the way the system responds to GET and HEAD requests. This makes the container more suitable for serving static web content as follows:

* You can configure a default page. This applies to both the root of the container and [pseudo-directories](#pseudo_hierarchies). For example, a path of "mycontainer/images" can respond with the contents of "mycontainer/images/index.htm".

* You can configure a custom error page. For example if you attempt to access an object that does not exist, the system can respond with the contents of "404error.htm" instead of the normal error message.

* You can enable directory listings. For example, a path of "mycontainer/images" would respond with a HTML page containing a list of objects with "mycontainer/images/" as a prefix to their name. You can also supply a custom CSS file for this HTML page.

* If the path ends in "/", the system will respond with a redirect removing the "/". For example, if the path contained "mycontainer/images/", the system will respond with a redirect to "mycontainer/images". Browsers will then make a request on "mycontainer/images". The system will respond with either the
default page or a HTML directory listing.

To respond with StaticWeb content, the container must:

* Have either X-Container-Meta-Web-Index or X-Container-Meta-Web-Listings metadata set on the container.

* Be accessed without an [authentication token](#using_tokens). In practice, this means that you also need to set the [X-Container-Read](#general_acls) metadata so the container is public.

#### 2.21.2 Content Delivery Network ####

The StaticWeb feature is best used in conjunction with the Content Delivery Network (CDN). In fact, when you CDN-enable a container, the container is also automatically given StaticWeb metadata and assigned an [ACL](#general_acls) that makes it public.

See the CDN API for more details.

#### 2.21.3 StaticWeb Metadata ####

The following table describes the metadata that controls the StaticWeb features.

| Metadata Name | Description |
| :-------     | :------   |
| X-Container-Meta-Web-Index | Sets the name of a default page. This name applies to the container root and all pseudo-directories in the container. |
| X-Container-Meta-Web-Error | Sets the suffix of the name of an error page. The system will prefix either "401" or "404" to this name, depending on the error. For example, if X-Container-Meta-Web-Error is set to "error.htm" and a user attempts to access an object that does not exist, the system will respond with the contents in "404error.htm". |
| X-Container-Meta-Web-Listings | If "true", the system will respond with a HTML page listing the contents of the container or pseudo-directory.|
| X-Container-Meta-Web-Listings-CSS |Specifies a style sheet to use with X-Container-Meta-Web-Listings. This allows you to customize the appearance of directory listings. |
| X-Container-Meta-Web-Directory-Type | When X-Container-Meta-Web-Listings is set to true and you access a pseudo-directory, the system will respond with a listing. This always works for path-style pseudo-directories. However, if you use directory-objects, the listing only works if the Content-Type of the object is "application/directory". If you use a different content type (for example, "folder") for pseudo-directories, you must set X-Container-Meta-Web-Directory-Type. StaticWeb will then recognize this as a pseudo-directory. |

### 2.22 Notable Differences from OpenStack ###

The Object Storage API is an implementation of OpenStack Object
Storage (Swift). OpenStack Object Storage has core and optional features; specifically, there are a number of optional middleware components. Object Storage only supports the features described in this document. In addition, there are some differences to be aware of:

* Object Storage naming conventions are slightly more restrictive than those described in the OpenStack documentation referenced here. Specifically, containers and object names may not contain the following:   

- the double-quote character (")
- the greater-than chracter (\>)
- the less-than character (\<)
- the substrings "/./", "/../", "/." and "/.."

* Cross-project ACLs are only supported by Object Storage

* General ACLs do not support specifying a username or hostname.

* Temporary URLs do not use the X-Account-Meta-Temp-URL-Key metadata to store the secret key. Instead we use the Identity services _Access Keys_.
See [Temporary URLs](#temp_url) for more information.

* FormPOST. The key used in FormPOST uses the Identity services _Access Keys_. See [FormPost](#formpost) for more information. 

* Signature Based Authentication. This is an alternative to the [X-Auth-Token](#x_auth_token_request) request header. See [Signature Based Authentication](#signature_auth) for more information.

## 3. Account-level View

### 3.1 Projects and Storage accounts ### {#projects_accounts}

There is a one-to-one relationship between an account and the _project_. The Storage account and project ID are the same.

### 3.2 Regions

Object Storage has the following service instances in these regions:

* region-a-geo-1 - US West   
* region-b.geo-1 - US East

Each region is a distinct storage entity. Each contains its own set of containers and objects -- there is no shared data between the regions.

In each region, Object Storage has servers physically located in multiple availability zones. It also automatically keeps multiple copies of data in multiple availability zones. The system transparently manages this for you -- you have a single endpoint through which you access Object Storage services for a region.

### 3.3 Service Catalog ### {#service_catalog}

The Identity service is used to authenticate users. See [Using Authentication Tokens](#using_tokens) for more information.

For additional details on the Identity Service, please refer to
[https://docs.hpcloud.com/identity](https://docs.hpcloud.com/identity).

The service is exposed in the service catalog, as shown in the following fragment. Note the user has the Admin role and is activated for two regions of the Object Storage service.

    {"access": {
        "token": {
            "expires": "2012-11-21T23:14:30.559Z",
            "id": "HPAuth_1234",
            "tenant": {
                "id": "12345678912345",
                 "name": "sally"
             }
        },
        "user": {
            "id": "4321987654321",
            "name": "sally",
            "roles": [
            .
            .
            .
                {
                    "id": "00000000004022",
                    "serviceId": "110",
                    "name": "Admin",
                    "tenantId": "87135022548315"
                },
            .
            .
            .
            ]
        },
        "serviceCatalog": [
        .
        .
        .
            {
                "name": "Object Storage",
                "type": "object-store",
                "endpoints": [
                    {
                        "tenantId": "12345678912345",
                        "publicURL": "https:\/\/region-a.geo-1.objects.hpcloudsvc.com\/v1\/12345678912345",
                        "region": "region-a.geo-1",
                        "versionId": "1.0",
                        "versionInfo": "https:\/\/region-a.geo-1.objects.hpcloudsvc.com\/v1.0\/",
                        "versionList": "https:\/\/region-a.geo-1.objects.hpcloudsvc.com"
                    },
                    {
                        "tenantId": "1234567891234",
                        "publicURL": "https:\/\/region-b.geo-1.objects.hpcloudsvc.com:443\/v1\/12345678912345",
                        "region": "region-b.geo-1",
                        "versionId": "1",
                        "versionInfo": "https:\/\/region-b.geo-1.objects.hpcloudsvc.com:443\/v1\/",
                        "versionList": "https:\/\/region-b.geo-1.objects.hpcloudsvc.com:443"
                    }
                ]
            },
        .
        .
        .

## 4. REST API Specifications

### 4.1 Service API Operations

**Host US West Region**: https://region-a.geo-1.objects.hpcloudsvc.com

**Host US East Region**: https://region-b.geo-1.objects.hpcloudsvc.com

**BaseURI**: {Host}

| Resource                         | Operation                                      | HTTP Method | Path                               | JSON/XML?   | Privilege Level |
| :-------                         | :--------------------------                    | :---------- | :---------------------             | :--------   | :-------------  |
| [Account](#account_resource)     | [List containers](#account_get)                | GET         | /v1/{project_id}                      | Y/Y         | Admin |
| [Account](#account_resource)     | [Update account metadata](#account_post)       | POST        | /v1/{project_id}                      | n/a         | Admin |
| [Account](#account_resource)     | [Retrieve account metadata](#account_head)     | HEAD        | /v1/{project_id}                      | n/a         | Admin |
| [Container](#container_resource) | [List objects](#container_get)                 | GET         | /v1/{project_id}/{container}          | Y/Y         | Admin |
| [Container](#container_resource) | [Retrieve container metadata](#container_head) | HEAD        | /v1/{project_id}/{container}          | n/a         | Admin |
| [Container](#container_resource) | [Create/Update container](#container_put)      | PUT         | /v1/{project_id}/{container}          | n/a         | Admin |
| [Container](#container_resource) | [Update container metadata](#container_post)   | POST        | /v1/{project_id}/{container}          | n/a         | Admin |
| [Container](#container_resource) | [Delete container](#container_delete)          | DELETE      | /v1/{project_id}/{container}          | n/a         | Admin |
| [Object](#object_resource)       | [Retrieve object](#object_get)                 | GET         | /v1/{project_id}/{container}/{object} | n/a         | Admin |
| [Object](#object_resource)       | [Retrieve object metadata](#object_head)       | HEAD        | /v1/{project_id}/{container}/{object} | n/a         | Admin |
| [Object](#object_resource)       | [Create/Replace Object](#object_put)           | PUT         | /v1/{project_id}/{container}/{object} | n/a         | Admin |
| [Object](#object_resource)       | [Copy Object](#object_copy)           | PUT/COPY         | /v1/{project_id}/{container}/{object} | n/a         | Admin |
| [Object](#object_resource)       | [Update object metadata](#object_post)         | POST        | /v1/{project_id}/{container}/{object} | n/a         | Admin |
| [Object](#object_resource)       | [Delete object](#object_delete)                | DELETE      | /v1/{project_id}/{container}/{object} | n/a         | Admin |
| [Container](#container_resource) [Object](#object_resource)       | [Archive Auto Upload](#tarball_put)          | PUT         | /v1/{project_id}/{optional-path}?extract-archive={format} | N/N         | Admin |
| [Container](#container_resource) [Object](#object_resource)       | [Bulk delete](#bulkop_delete)                | DELETE      | /v1/{project_id}?bulk-delete | N/N         | Admin |

### 4.2 Common Request Headers

Many operations accept request headers. This section provides an overview of each request header. Consult the specific operation to determine if the header applies to the operation and any other notes that are of interest.

#### 4.2.1 Accept #### {#accept_request}

Where applicable, this determines how the response body is formatted. For example, you can use this to list the objects in a container as:
* text (text/plain)
* JSON (application/json)
* XML (text/xml, application/xml)

#### 4.2.2 Content-Length #### {#content_length_request}

Where applicable, this is the length in bytes of the body of the request.
For objects, you may use the [Transfer-Encoding](#transfer_encoding_request) instead of a Content-Length.

#### 4.2.3 Content-Type #### {#content_type_request}

Where applicable, this indicates the MIME type of an object.

When applied to object resources, the Content-Type request header is optional. If not specified, Object Storage will attempt to identify the content type and assign a MIME type. If this fails, the type is set to application/octet-stream. If you specify a value in the request header, when you next do a HEAD or GET operation on the object, the Content-Type response header is set to the specified value.

#### 4.2.4 Date #### {#date_request}

When specified, this is the date and time at which the operation request is made. The value should be expressed as shown in one of the following examples:

      Sun, 06 Nov 1994 08:49:37 +0000 ; RFC 2822
      Sun, 06 Nov 1994 08:49:37 GMT   ; RFC 822, updated by RFC 1123
      Sunday, 06-Nov-94 08:49:37 GMT  ; RFC 850, obsoleted by RFC 1036
      Sun Nov  6 08:49:37 1994        ; ANSI C's asctime() format

As you can see, the date and time is expressed in GMT or UTC time. The first example ("Sun, 06 Nov 1994 08:49:37 +0000") is the preferred format. However, Object Storage uses the second example ("Sun, 06 Nov 1994 08:49:37 GMT") when displaying dates.

#### 4.2.5 X-Auth-Token #### {#x_auth_token_request}

When specified, this identifies the user making the request. In addition, if this token is being used by a user with Admin privilege level, the token must be scoped to the project associated with the account. If no token is specified, the request will fail unless you have been granted access to the resource by some other mechanism such as ACLs. See [Using Authentication Tokens](#using_tokens) for more information about tokens.

#### 4.2.6 X-Container-Meta-{name} #### {#x_container_meta_request}

This allows you to set custom metadata on a container using a header name with a prefix of X-Container-Meta-. After this prefix, you can pick any name meaningful to you. For example, X-Container-Meta-Reviewed could be used indicate that the contents of a container had been reviewed.

Any valid UTF-8 http header value is allowed for metadata, however we recommend that you URL-encode any non-ASCII values

#### 4.2.7 X-Container-Read #### {#x_container_read_request}

Sets the access control list (ACL) that grants read access to a container and its objects.

#### 4.2.8 X-Container-Write #### {#x_container_write_request}

Sets the access control list (ACL) that grants write access to a container and its objects.

#### 4.2.9 ETag #### {#etag_request}

Object Storage does not use the Content-MD5 request header - use ETag as a request header instead. Use this header to ensure that an upload of an object does not suffer from a data corruption. 

For objects smaller than 5GB and [manifest objects](#large_objects), this is the MD5 checksum of the request body.

See [End to end integrity](#end_to_end_integrity) for more information.

#### 4.2.10 X-Account-Meta-{name} #### {#x_account_meta_request}

This allows you to set custom metadata on an account using a header name with a prefix of X-Account-Meta-. After this prefix, you can pick any name meaningful to you.

#### 4.2.11 X-Remove-Account-Meta-{name} #### {#x_remove_account_meta_request}

This allows you to remove custom metadata on an account using a headers name with a prefix of X-Account-Meta-. After this prefix, you specify the metadata item you wish to remove.

#### 4.2.12 X-Object-Meta-{name} #### {#x_object_meta_request}

This allows you to set custom metadata on an object using a header name with a prefix of X-Object-Meta-. After this prefix, you can pick any name meaningful to you.

### 4.3 Common Response Headers

#### 4.3.1 Date #### {#date_response}

When supplied, the Date header is the time of the operation expressed in GMT (effectively UTC) as shown in the following example:
 
      HTTP/1.1 200 OK
      Date: Sun, 06 Nov 1994 08:49:37 GMT

#### 4.3.2 Last-Modified #### {#last_modified_response}

This is the date and time that the container or object was created or the last time that the metadata was changed.

#### 4.3.3 Content-Length #### {#content_length_response}

When the response includes a body, this indicates the length of the body in bytes.

> Note: For HEAD operations against an object, the Content-Length response header contains the size of the object. Normally, in HTTP HEAD operations, the Content-Length would be zero since no content is returned. This exception might confuse your client if it waits for more content in the response.

#### 4.3.4 Content-Type #### {#content_type_response}

When the response includes a body, this indicates the MIME type of the response. For listing operations (account/container), you can use the [Accept](#accept_request) request header to request JSON or XML. For a GET or HEAD against an object, the Content-Type is whatever value was set when the object was uploaded.

#### 4.3.5 X-Container-Meta-{name} #### {#x_container_meta_response}

This contains the value of X-Container-Meta-{name} metadata that was previously set on a container, where {name} is an arbitrary name meaningful to you.

#### 4.3.6 X-Account-Object-Count #### {#x_account_object_count_response}

The total number of objects in all containers associated with the account.

#### 4.3.7 X-Account-Bytes-Used #### {#x_account_bytes_used_response}

The total size in bytes of all objects in all containers associated with the account.

#### 4.3.8 X-Account-Container-Count #### {#x_account_container_count_response}

The number of containers in the account

#### 4.3.9 X-Container-Read #### {#x_container_read_response}

The access control list (ACL) that grants read access to a container and its objects.

#### 4.3.10 X-Container-Write #### {#x_container_write_response}

The access control list (ACL) that grants write access to a container and its objects.

#### 4.3.11 X-Container-Object-Count #### {#x_container_object_count_response}

The number of objects in the container.

#### 4.3.12 X-Container-Bytes-Used #### {#x_container_bytes_used_response}

The total number of bytes used by all objects in the container.

#### 4.3.13 ETag #### {#etag_response}

For objects smaller than 5GB and [manifest objects](#large_objects), this is the MD5 checksum of the response body.

For [manifest objects](#large_objects), this is the MD5 checksum of the concatenated string of MD5 checksums/ETags for each of the segments in the manifest - not the MD5 checksum of the content that was downloaded. Also the value is enclosed in double-quote characters.

See [End to end integrity](#end_to_end_integrity) for more information.

#### 4.3.14 X-Account-Meta-{name} #### {#x_account_meta_response}

This contains the value of X-Account-Meta-{name} metadata that was previously set on an account, where {name} is an arbitrary name meaningful to you.

#### 4.3.15 X-Object-Meta-{name} #### {#x_object_meta_response}

This contains the value of X-Object-Meta-{name} metadata that was previously set on an object, where {name} is an arbitrary name meaningful to you.

#### 4.3.16 X-Static-Large-Object #### {#x_static_large_object_response}

If present and set to true, it indicates that this is a static object manifest.
See [Static Large Object Creation](#slo) for more information.

### 4.4 Service API Operation Details

#### 4.4.1 Account ####

**Status Lifecycle**   
N/A

**Rate Limits**   
N/A

**Quota Limits**   
N/A

**Business Rules**   
None.

##### 4.4.1.1 List Containers in an Account ##### {#account_get}
##### GET /v1/{project_id}

This operation returns a listing of the containers in the designed account.

**Request Data**

The path specifies the account.

**URL Parameters**

By default up to 10,000 names are returned. To retrieve more or fewer names, use the *limit* and *marker* query parameters.
See [Retrieving large number of container or object names](#pagination) for more information.

* *limit* - (Optional) - Number - For an integer value of _N_, limits the number of results to at most _N_ values.

* *marker* - (Optional) - String - Given a string value _x_, return container names greater in value than the specified marker.

* *end_marker* - (Optional) - String - Given a string value _x_, return container names up to, but not including _x_.

* *format* - (optional) - String - Specify either `json` or `xml` to return the respective serialized response.
You may alternatively specify the required type in the *Accept* request header.

* *prefix* - (Optional) - String - For a string value *x*, causes the results to be limited to container names beginning with the substring *x*.

* *delimiter* - (Optional) - String - For a character *c*, return a portion of the name up to and including the *c* character. Duplicate results are eliminated. For example, for names "abc:123" and "abc:456", a "delimiter=:", would return a single entry of "abc:".

> Note: the value of these query strings must be URL-encoded in the request 

**Data Parameters**

This operation does not require a request body.

**Success Response**

On success, the response body contains a list of the containers.
A 204 (No Content) HTTP return code is passed back if the account
has no containers.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Response Data**

The following response headers are returned:

* [X-Account-Object-Count](#x_account_object_count_response)
* [X-Account-Bytes-Used](#x_account_bytes_used_response)
* [X-Account-Container-Count](#x_account_container_count_response)
* [X-Account-Meta-{name}](#x_account_meta_response)

A list of containers is returned in the response body. With JSON and XML formats, you can also see the number (count)
and size (bytes) of all objects in the listed container.

Text/Plain                         

     test_container_1  
     test_container_2   

JSON

     [
         {"name":"test_container_1", "count":2, "bytes":78},
         {"name":"test_container_2", "count":1, "bytes":17}  
     ]   
                          

XML
                          
     <?xml version="1.0" encoding="UTF-8"?>  

     <account name="12345678912345">  
       <container>
         &#60;name>test_container_1</name>
         <count>2</count>
         <bytes>78</bytes>
       </container>
       <container>
         &#60;name>test_container_2</name>
         <count>1</count>
         <bytes>17</bytes>
       </container>
     </account>

**Error Response**

If an error occurs, the response body contains a description of the error.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v1/{project_id}

##### 4.4.1.2 Update Account Metadata ##### {#account_post}
##### POST /v1/{project_id}

This operation updates custom metadata on an account.

You can set custom metadata on an account using a request header name with a prefix of X-Account-Meta-. After this prefix, you can pick any name meaningful to you. For example, X-Account-Meta-Reviewed could be used indicate that the contents of an account had been reviewed.

Any valid UTF-8 http header value is allowed for metadata, however we recommend that you URL-encode any non-ASCII values.

You only need to specify the metadata item you wish to set or change i.e., the POST operation leaves existing X-Account-Meta-{name} metadata intact.

To remove a metadata item, use a request header name with a prefix of X-Remove-Account-Meta-. After this prefix, you give the name of the item to remove. For example, X-Remove-Account-Meta-Reviewed would indicate that the "reviewed" metadata should be deleted. The value field can be any value; however, there must be *some* value for the request to take effect.

**Request Data**

The path specifies the account.

**URL Parameters**

None.
      
**Data Parameters**

This operation does not require a request body.

The following request headers apply to this operation:

* [X-Account-Meta-{name}](#x_account_meta_request) - Optional - Specifies custom metadata for the container
* [X-Remove-Account-Meta-{name}](#x_remove_account_meta_request) - Optional - Specifies custom metadata to remove
* [X-Auth-Token](#x_auth_token_request) - Optional - Authentication token
* [Authorization](#signature_auth) - Optional - Use Signature Based Authentication instead of [X-Auth-Token](#x_auth_token_request)

**Success Response**

This operation does not return a response body.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Response Data**

None

**Error Response**

If an error occurs, the response body contains a description of the error.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -H 'X-Account-Meta-{name}: {value}' -H 'X-Remove-Account-Meta-{name}: {value}' {BaseURI}/v1/{project_id}

##### 4.4.1.3 Retrieve Account Metadata ##### {#account_head}
##### HEAD /v1/{project_id}

This operation gets the metadata associated with the account.

**Request Data**

The path specifies the account.

**URL Parameters**

None
      
**Data Parameters**

This operation cannot contain a request body.

**Success Response**

On success the response headers are populated. 

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Response Data**

The following response headers are returned:

* [X-Account-Object-Count](#x_account_object_count_response)
* [X-Account-Bytes-Used](#x_account_bytes_used_response)
* [X-Account-Container-Count](#x_account_container_count_response)
* [X-Account-Meta-{name}](#x_account_meta_response)

**Error Response**

If an error occurs, the response body contains a description of the error.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Curl Example**

    curl -i -k -X HEAD -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v1/{project_id}

#### 4.4.2 Container

**Status Lifecycle**   
N/A

**Rate Limits**   
N/A

**Quota Limits**   
N/A

**Business Rules**   
None.

##### 4.4.2.1 Create/Update Container ##### {#container_put}
##### PUT /v1/{project_id}/{container}

This operation creates a container or updates the metadata associated with an existing container. You are free to pick a container name that is meaningful to you. See [Container and Object Naming](#naming) for restrictions on container names.

You don't need to check if a container already exists before doing the PUT operation because the operation is idempotent (i.e., it will create a new container or update an existing container as appropriate). 

You can set custom metadata on a container using a header name with a prefix of X-Container-Meta-. After this prefix, you can pick any name meaningful to you. For example, X-Container-Meta-Reviewed could be used indicate that the contents of a container had been reviewed. You only need to specify the metadata item you wish to set or change i.e., the POST operation leaves existing X-Account-Meta-{name} metadata intact.

Any valid UTF-8 http header value is allowed for metadata, however we recommend that you URL-encode any non-ASCII values.

**Request Data**

The path specifies the account and the name of the container to create.

The following request headers apply to this operation:

* [X-Container-Meta-{name}](#x_container_meta_request) - Optional - Specifies custom metadata for the container
* [X-Auth-Token](#x_auth_token_request) - Optional - Authentication token
* [Authorization](#signature_auth) - Optional - Use Signature Based Authentication instead of [X-Auth-Token](#x_auth_token_request)
* [X-Container-Read](#x_container_read_request) - Optional - Sets an ACL that grants read access
* [X-Container-Write](#x_container_write_request) - Optional - Sets an ACL that grants write access
* [X-Container-Sync-To](#container_sync) - Optional - See [Container Synchronization](#container_sync)
* [X-Container-Sync-Key](#container_sync) - Optional - See [Container Synchronization](#container_sync)
* [X-Versions-Location](#x_versions_location) - Optional - Enables or disables [Object Versioning](#object_versioning)

**URL Parameters**

None  
                          
**Data Parameters**

This operation does not require a request body.

**Success Response**

On success, the container is created.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Response Data**

A description of the HTTP Status Code.

**Error Response**

If an error occurs, the response body contains a description of the error.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Curl Example**

    curl -i -k -X PUT -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v1/{project_id}/{container}

##### 4.4.2.2 Update Container Metadata ##### {#container_post}
##### POST /v1/{project_id}/{container}

This operation updates the metadata associated with an existing container. 

You can set custom metadata on a container using a header name with a prefix of X-Container-Meta-. After this prefix, you can pick any name meaningful to you. For example, X-Container-Meta-Reviewed could be used indicate that the contents of a container had been reviewed. You only need to specify the metadata item you wish to set or change i.e., the POST operation leaves existing X-Account-Meta-{name} metadata intact.

Any valid UTF-8 http header value is allowed for metadata, however we recommend that you URL-encode any non-ASCII values.

**Request Data**

The path specifies the account and the name of the container to create.

The following request headers apply to this operation:

* [X-Container-Meta-{name}](#x_container_meta_request) - Required - Specifies custom metadata for the container
* [X-Auth-Token](#x_auth_token_request) - Optional - Authentication token
* [Authorization](#signature_auth) - Optional - Use Signature Based Authentication instead of [X-Auth-Token](#x_auth_token_request)
* [X-Container-Read](#x_container_read_request) - Optional - Sets an ACL that grants read access
* [X-Container-Write](#x_container_write_request) - Optional - Sets an ACL that grants write access
* [X-Container-Sync-To](#container_sync) - Optional - See [Container Synchronization](#container_sync)
* [X-Container-Sync-Key](#container_sync) - Optional - See [Container Synchronization](#container_sync)
* [X-Versions-Location](#x_versions_location) - Optional - Enables or disables [Object Versioning](#object_versioning)

**URL Parameters**

None  
                          
**Data Parameters**

This operation does not require a request body.

**Success Response**

On success, the container is updated.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Response Data**

A description of the HTTP Status Code.

**Error Response**

If an error occurs, the response body contains a description of the error.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Curl Example**

    curl -i -k -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -H 'X-Container-Meta-{name}: {value}' {BaseURI}/v1/{project_id}/{container}

##### 4.4.2.3 List Objects in a Container ##### {#container_get}
##### GET /v1/{project_id}/{container}                  

Retrieve a list of objects stored in a container.

**Request Data**

The path specifies the account and container name.

The following request headers apply to this operation.

* [Accept](#accept_request) - Optional - Specifies the format for listing the names. Alternatively use the *format* parameter.
* [X-Auth-Token](#x_auth_token_request) - Optional - Authentication token
* [Authorization](#signature_auth) - Optional - Use Signature Based Authentication instead of [X-Auth-Token](#x_auth_token_request)

**URL Parameters**

By default up to 10,000 names are returned. To retrieve more or fewer names, use the *limit* and *marker* query parameters. See [Retrieving large number of container or object names](#pagination) for more information.

By default, the names of all objects are returned. You can control which names are retrieved using the *prefix*, *delimiter* and *path* query parameters.
See [Pseudo-Hierarchical Folders or Directories](#pseudo_hierarchies) for more information.

The following query parameters are available:

* *limit* - (Optional) - Number - For an integer value of _N_, limits the number of results to at most _N_ values.

* *marker* - (Optional) - String - Given a string value _x_, return container names greater in value than the specified marker.

* *end_marker* - (Optional) - String - Given a string value _x_, return object names up to, but not including _x_.

* *format* - (optional) - String - Specify either `json` or `xml` to return the respective serialized response. You may alternatively specify the required type in the *Accept* request header.

* *prefix* - (Optional) - String - For a string value *x*, causes the results to be limited to object names beginning with the substring *x*.

* *path* - (Optional) - String - For a string value *x*, return the object names nested in the pseudo path.

* *delimiter* - (Optional) - String - For a character *c*, return all the object names nested in the container (without the need for placeholder objects).

> Note: the values of there query parameters should be URL-encoded.

**Data Parameters**

This operation does not require a request body.

**Success Response**

If the container contains objects, their names are returned in the requested format in the response body. If there are no objects in the container, 204 (No Content) is returned.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Response Data**

If there are objects, their names are returned in the response body in the requested format. The JSON and XML formats
list additional data about each object as follows:
* hash - The MD5 checksum for the contents on the object
* bytes -- The size in bytes of the object
* content_type - The MIME type of the object
* last_modified - The date and time the object was created or the time at which the object metadata was last updated. 

Text/Plain

     test_obj_1
     test_obj_2

JSON

    [
       {
         "name": "test_obj_1",
         "hash": "4281c348eaf83e70ddce0e07221c3d28",
         "bytes": 14,
         "content_type": "application/octet-stream",
         "last_modified": "2009-02-03T05:26:32.612278"
       },
       {
         "name": "test_obj_2",
         "hash": "b039efe731ad111bc1b0ef221c3849d0",
         "bytes": 64,
         "content_type": "application/octet-stream",
         "last_modified": "2009-02-03T05:26:32.612278"
       }
     ]

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <container name="test_container_1">
        <object>
            &#60;name>test_object_1</name>
            <hash>4281c348eaf83e70ddce0e07221c3d28</hash>
            <bytes>14</bytes>
            <content_type>application/octet-stream</content_type>
            <last_modified>2009-02-03T05:26:32.612278</last_modified>
        </object>
        <object>
            &#60;name>test_object_2</name>
            <hash>b039efe731ad111bc1b0ef221c3849d0</hash>
            <bytes>64</bytes>
            <content_type>application/octet-stream</content_type>
            <last_modified>2009-02-03T05:26:32.612278</last_modified>
        </object>
    </container>

The following response headers are returned:

* [X-Container-Read](#x_container_read_response)
* [X-Container-Write](#x_container_write_response)
* [X-Container-Meta-{name}](#x_container_meta_response)
* [X-Container-Object-Count](#x_container_object_count_response)
* [X-Container-Bytes-Used](#x_container_bytes_used_response)
* [X-Container-Sync-To](#container_sync)
* [X-Container-Sync-Key](#container_sync)
* [X-Versions-Location](#x_versions_location)

**Error Response**

If an error occurs, the response body contains a description of the error.

**Status Response**

See [HTTP Status Codes](#http_codes) for more information.

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v1/{project_id}/{container}

##### 4.4.2.4 Retrieve the Metadata of a Container ##### {#container_head}
##### HEAD /v1/{project_id}/{container}                  

Retrieve the metadata of a container.

**Request Data**

The path specifies the account and container name.

The following request headers apply to this operation.

* [X-Auth-Token](#x_auth_token_request) - Optional - Authentication token
* [Authorization](#signature_auth) - Optional - Use Signature Based Authentication instead of [X-Auth-Token](#x_auth_token_request)

**URL Parameters**

None.

**Data Parameters**

This operation does not require a request body.

**Success Response**

The metadata is returned in the response headers.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Response Data**

The following response headers are returned:

* [X-Container-Object-Count](#x_container_object_count_response)
* [X-Container-Meta-{name}](#x_container_meta_response)
* [X-Container-Bytes-Used](#x_container_bytes_used_response)
* [X-Container-Sync-To](#container_sync)
* [X-Container-Sync-Key](#container_sync)
* [X-Versions-Location](#x_versions_location)
      
**Error Response**

If an error occurs, the response body contains a description of the error.

**Status Response**

See [HTTP Status Codes](#http_codes) for more information.

**Curl Example**

    curl -i -k -X HEAD -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v1/{project_id}/{container}

##### 4.4.2.5 Delete a Container ##### {#container_delete}
##### DELETE /v1/{project_id}/{container}                  

Delete a container.

You cannot delete a container if it has any objects in it.

See also [Bulk Delete](#bulk_delete) for an alternate way of deleting containers.

**Request Data**

The path specifies the account and container name.

The following request headers apply to this operation.

* [X-Auth-Token](#x_auth_token_request) - Optional - Authentication token
* [Authorization](#signature_auth) - Optional - Use Signature Based Authentication instead of [X-Auth-Token](#x_auth_token_request)

**URL Parameters**

None.

**Data Parameters**

This operation does not require a request body.

**Success Response**

The container is deleted.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Response Data**

None
      
**Error Response**

If an error occurs, the response body contains a description of the error.

**Status Response**

See [HTTP Status Codes](#http_codes) for more information.

**Curl Example**

    curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v1/{project_id}/{container}

#### 4.4.3 Object

**Status Lifecycle**   
N/A

**Rate Limits**   
N/A

**Quota Limits**   
N/A

**Business Rules**   
None.

##### 4.4.3.1 Retrieve Object ##### {#object_get}
##### GET /v1/{project_id}/{container}/{object}

Retrieve the contents of an object.

In its simplest form, the GET operation returns the object contents in the response body and retrieves the object's metadata and places the names and values into response headers. However, you there are additional capabilities:

* You can perform conditional GET requests by using certain HTTP
headers as documented in [RFC 2616](http://www.ietf.org/rfc/rfc2616.txt](http://www.ietf.org/rfc/rfc2616.txt). See [Conditional GET of objects](#conditional_get) for more information.

* It is also possible to fetch a portion of data using basic support of the HTTP [Range](#range_request) header.

* If the object name is the name of an object manifest, the operation concatenates all the segments into one stream. See [Large Object Creation](#large_objects) for more information.

* If the object has the [X-Static-Large-Object](#x_static_large_object_response) set to `true`, you may add the `?multipart-manifest=get` query string to the
request. This causes the _manifest_ to be downloaded instead of the concatenated segment objects.

**Request Data**

The path specifies the account, container name and object name.

The following request headers apply to this operation.

* [X-Auth-Token](#x_auth_token_request) - Optional - Authentication token
* [Authorization](#signature_auth) - Optional - Use Signature Based Authentication instead of [X-Auth-Token](#x_auth_token_request)
* [If-Match](#conditional_get) - Optional - See [Conditional GET of objects](#conditional_get) for more information.
* [If-None-Match](#conditional_get) - Optional - See [Conditional GET of objects](#conditional_get) for more information.
* [If-Modified-Since](#conditional_get) - Optional - See [Conditional GET of objects](#conditional_get) for more information.
* [If-Unmodified-Since](#conditional_get) - Optional - See [Conditional GET of objects](#conditional_get) for more information.
* [Range](#range_request) - Optional - See [Retrieving a portion of object data](#range_request) for more information.

**URL Parameters**

None.

**Data Parameters**

This operation does not require a request body.

**Success Response**

The object content is returned in the response body and metadata is returned in the response headers. Since the HTTP Success code is written to the response stream before the response body and headers are returned, it is possible that you will see a 200 Success code even though the transfer of headers or body had a failure. You should check that the length of the actual body is the same as the [Content-Length](#content_length_response) response header.

Ideally for objects of less than 5GB, you should also perform an MD5 checksum over the response body and compare with the [ETag](#etag_response) response header. See [End to end integrity](#end_to_end_integrity) for more information.

For manifest objects (objects over 5GB) the ETag value is not the MD5 checksum of the body -- see [Large Object Creation](#large_objects) for more information.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Response Data**

The following response headers are returned:

* [Last-Modified](#last_modified_response)
* [Content_Length](#content_length_response)
* [Content_Type](#content_type_response)
* [ETag](#etag_response)
* [Content-Encoding](#content_encoding_header)
* [Content-Disposition](#content_disposition_header)
* [X-Delete-At](#x_delete_at)
* [X-Object-Meta-{name}](#x_object_meta_response)
* [X-Static-Large-Object](#x_static_large_object_response)

**Error Response**

If an error occurs, the response body contains a description of the error.

**Status Response**

See [HTTP Status Codes](#http_codes) for more information.

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v1/{project_id}/{container}/{object}

##### 4.4.3.2 Retrieve the Metadata of an Object ##### {#object_head}
##### HEAD /v1/{project_id}/{container}/{object}

Retrieve the metadata of an object.

**Request Data**

The path specifies the account, container name and object name.

The following request headers apply to this operation.

* [X-Auth-Token](#x_auth_token_request) - Optional - Authentication token
* [Authorization](#signature_auth) - Optional - Use Signature Based Authentication instead of [X-Auth-Token](#x_auth_token_request)

**URL Parameters**

None.

**Data Parameters**

This operation does not require a request body.

**Success Response**

The object metadata is returned in the response headers.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Response Data**

The following response headers are returned. Note since this is a HEAD operation, the Content-Length
is not the length of the response body but is the size in bytes of the object content.

* [Last-Modified](#last_modified_response)
* [Content_Length](#content_length_response)
* [Content_Type](#content_type_response)
* [ETag](#etag_response)
* [Content-Encoding](#content_encoding_header)
* [Content-Disposition](#content_disposition_header)
* [X-Delete-At](#x_delete_at)
* [X-Object-Meta-{name}](#x_object_meta_response)
* [X-Static-Large-Object](#x_static_large_object_response)

**Error Response**

If an error occurs, the response body contains a description of the error.

**Status Response**

See [HTTP Status Codes](#http_codes) for more information.

**Curl Example**

    curl -i -k -X HEAD -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v1/{project_id}/{container}/{object}

##### 4.4.3.3 Create/Replace Object ##### {#object_put}
##### PUT /v1/{project_id}/{container}/{object}

Creates an object with the supplied data content and metadata.

You also use this operation to update an existing object (i.e. PUT to the same object name twice). You should think of this as replacing the previous object's content and metadata.

In its simplest form, the PUT operation creates or replaces an existing object
with up to 5GB of data content. However, there are other features available as
follows:

* You can upload object content in chunks. This allows you to start an upload before you know the total size of the object. You use the [Transfer-Encoding](#transfer_encoding_request) request header and omit the [Content-Length](#content_length_request) request header.

* For objects greater than 5GB, you can upload a number of *object segments*. When all segments are uploaded, you upload a *manifest object* telling Object Storage how to find the segments of the large object. See [Large Object Creation](#large_objects) for more information.

* You can create [Pseudo-Hierarchical Folders or Directories](#pseudo_hierarchies). For a pseudo folder or directory, a good practice is to create a zero-sized placeholder object with a [Content-Type](#content_type_request) of "application/directory".

* You can use the [Content-Encoding](#content_encoding_header) request header to indicate that the object contents are compressed without losing the identity of the underlying media type of the file as specified by the [Content-Type](#content_type_request) request header.

* You can override a browser's default behavior for a file so that the downloader saves the file rather than displaying it using default browser settings by setting the [Content-Disposition](#content_disposition_header).

* You can ensure end-to-end data integrity by including an MD5 checksum of
your object's data in the ETag header. You are not required to include
the ETag header, but it is recommended to ensure that the storage system
successfully stored your object's content. See [End to end integrity](#end_to_end_integrity) for more information.

* You can set custom metadata on an object using a header name with a prefix of [X-Object-Meta-](#x_object_meta_request). After this prefix, you can pick any name meaningful to you. For example, X-Object-Meta-Reviewed could be used indicate that the contents of an object had been reviewed. Any valid UTF-8 http header value is allowed for metadata, however we recommend that you URL-encode any non-ASCII values.

* You can preserve prior versions of an object by enabling object versioning
on the container. See [Object Versioning](#object_versioning) for more information.

**Request Data**

The path specifies the account, container name and object name.

The following request headers apply to this operation.

* [X-Auth-Token](#x_auth_token_request) - Optional - Authentication token
* [Authorization](#signature_auth) - Optional - Use Signature Based Authentication instead of [X-Auth-Token](#x_auth_token_request)
* [Content-Length](#content_length_request) - Optional - The length in bytes of the request body. This is required unless you use the [Transfer-Encoding](#transfer_encoding_request) header.
* [Transfer-Encoding](#transfer_encoding_request) - Optional - Allows upload of an object in "chunks".
* [Content-Type](#content_type_request) - Optional - The MIME type of the object.
* [ETag](#etag_request) - Optional - The MD5 checksum of the request body
* [Content-Encoding](#content_encoding_header) - Optional - Indicate that the contents are compressed
* [Content-Disposition](#content_disposition_header) - Optional - Override default download behaviour of browsers
* [X-Object-Meta-{name}](#x_object_meta_request) - Optional - Sets custom metadata on the object
* [X-Object-Manifest](#large_objects) - Optional - Specifies that this object is an object manifest and "points" to the object segments.
* [X-Delete-At](#x_delete_at) - Optional - Specifies the time at which the
object is automaticically deleted from the system
* [X-Delete-After](#x_delete_at) - Optional - Specifies the number of
seconds until the object is automaticically deleted from the system

**URL Parameters**

None.

**Data Parameters**

The request body is the contents (i.e., file) data of the object.

**Success Response**

The [ETag](#etag_response) response header contains the MD5 checksum of the data written to the
storage system. If you do not send the ETag as a request header, ideally you should
compare the value returned with your content's MD5 locally to perform
an end-to-end integrity check.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Response Data**

The following response headers may be returned:

* [ETag](#etag_response)
      
**Error Response**

If an error occurs, the response body contains a description of the error.
If the MD5 checksum of the data written to the storage system does
NOT match the (optionally) supplied ETag value, a 422 (Unprocessable Entity) response is
returned.

**Status Response**

See [HTTP Status Codes](#http_codes) for more information.

**Curl Example**

*Creating a pseudo directory in a container*

    curl -i -k -X PUT -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -H 'Content-Type: application/directory' -H 'Content-Length: 0' {BaseURI}/v1/{project_id}/{container}/{object}

*Uploading an object to a container*

    curl -i -k -X PUT -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -T {local_file_path} {BaseURI}/v1/{project_id}/{container}/{object}

##### 4.4.3.4 Copy Object ##### {#object_copy}
##### PUT /v1/{project_id}/{target-container}/{target-object}
##### COPY /v1/{project_id}/{source-container}/{source-object}

Creates an object using another object as the source for the content and metadata. Using an existing object means that the content is copied inside the Object Storage service (i.e., at the server side). This means that the operation will be quicker because you do not need to transfer the object contents over the public internet. In addition, you will not be charged for any network transfer of the object contents (however, you may be charged for the operation itself).

> Note: When you copy a [manifest object](#large_objects), the new object is a "normal" object -- not a copy of the manifest. Instead it is a concatenation of all the segment objects. This means that you cannot copy objects larger than 5GB in size.

The target container must exist before you perform the copy object operation.

All metadata is preserved during the object copy. If you specify metadata on the request to copy the object (either the PUT or the COPY), the metadata overwrites any conflicting keys on the target (new) object. 
 
You can pick any name that is meaningful to you. However, see [Container and Object Naming](#naming) for restrictions on container names. In addition, the target and source object names may be the same name. This allows you to change the metadata of individual items without having to specify the values of all the other metadata items in the request.

**Request Data**

The path specifies the account, container name and object name of either the
source or target object as follows:

* PUT -- the container and object names are the name of the new object. The following request headers
must be set:
 - X-Copy-From - this designates the source of the data. The header value must be the container and object name of the source object in the form of "/{container}/{object}". The container and object names must be UTF-8 encoded and then URL-encoded.
 - [Content-Length](#content_length_request) - this must be present and set to a value of zero (0).

* COPY -- the container and object names are the names of an existing object. The following
request header must be set:
  - Destination - this designates the target of the operation. The value must be the container and object name of the new (target) object in the form of "/{container}/{object}".

The following request headers apply to both PUT and COPY operations.

* [X-Auth-Token](#x_auth_token_request) - Optional - Authentication token
* [Authorization](#signature_auth) - Optional - Use Signature Based Authentication instead of [X-Auth-Token](#x_auth_token_request)
* [Content-Type](#content_type_request) - Optional - Specifies a new Content-Type for the new object
* [Content-Encoding](#content_encoding_header) - Optional - Indicate that the contents are compressed
* [Content-Disposition](#content_disposition_header) - Optional - Override default download behaviour of browsers
* [X-Object-Meta-{name}](#x_object_meta_request) - Optional - Sets custom metadata on an object

**URL Parameters**

None.

**Data Parameters**

This operation does not require a request body.

**Success Response**

On success, the object is created.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Response Data**

No response body is returned. The following response headers are returned:

* [ETag](#etag_response)
* X-Copied-From - the name of the container/object used as source for the new object
* X-Copied-From-Last-Modified - the time and date that the source object was last updated
      
**Error Response**

If an error occurs, the response body contains a description of the error.

**Status Response**

See [HTTP Status Codes](#http_codes) for more information.

**Curl Example**

    curl -i -k -X COPY -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -H 'Destination: {container}/{object}' {BaseURI}/v1/{project_id}/{container}/{object}

    curl -i -k -X PUT -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -H 'X-Copy-From: {container}/{object}' -H 'Content-Length: 0' {BaseURI}/v1/{project_id}/{container}/{object}

##### 4.4.3.5 Delete an object ##### {#object_delete}
##### DELETE /v1/{project_id}/{container}/{object} 

Delete an object.

**Request Data**

The path contains the account, container and object name.

The following request headers apply to this operation.

* [X-Auth-Token](#x_auth_token_request) - Optional - Authentication token
* [Authorization](#signature_auth) - Optional - Use Signature Based Authentication instead of [X-Auth-Token](#x_auth_token_request)

**URL Parameters**

None.

**Data Parameters**

None.

**Success Response**

The object is deleted.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Response Data**

None.
 
**Error Response**

If an error occurs, the response body contains a description of the error.

**Status Response**

See [HTTP Status Codes](#http_codes) for more information.

**Curl Example**

    curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v1/{project_id}/{container}/{object}

##### 4.4.3.6 Update Object Metadata ##### {#object_post}
##### POST /v1/{project_id}/{container}/{object}

The POST operation is used in two modes:
* Updates the metadata of an object. This is the operation documented here.
* FormPOST. With specific query parameters, the POST operaiton allows you to 
upload files directly into Object Storage by using signature-based authentication. See [FormPOST](#formpost) for more information about this mode.

You cannot use the POST operation to change any of the following metadata:

* [Content-Length](#content_length_request)
* [ETag](#etag_request)
* [Last-Modified](#last_modified_response)

To set custom metadata on an object use a header name with a prefix of [X-Object-Meta-](#x_object_meta_request). After this prefix, you can pick any name meaningful to you. For example, X-Object-Meta-Reviewed could be used indicate that the contents of an object had been reviewed. Any valid UTF-8 http header value is allowed for metadata, however we recommend that you URL-encode any non-ASCII values.

All existing  metadata, with the exception of [Content-Type](#content_type_request) is overwritten by the POST operation. This means you must specify _all_ of the  metadata in the request. For example, if an object already has a Content-Encoding of gzip and you plan to also set X-Object-Meta-One, both must be specified in a single request. If you only set X-Container-Meta-One, when you later do a HEAD operation, only X-Container-Meta-One would exist -- in effect Content-Encoding is lost. 

However, [Content-Type](#content_type_request) is unchanged (unless included in the request). You cannot use the [Content-Length](#content_length_request) request header since the object content is not changed by this operation.

A POST operation with no metadata changes will cause *all* the metadata with the exception of [Content-Type](#content_type_request), [Content-Length](#content_length_request), [ETag](#etag_response) and [Last-Modified](#last_modified_response) to be cleared.

An easier way to change object metadata is to use the [Copy Object](#object_copy) operation since it only changes metadata that you update 
in the request.

**Request Data**

The path specifies the account, container name and object name.

The following request headers apply to this operation.

* [X-Auth-Token](#x_auth_token_request) - Optional - Authentication token
* [Authorization](#signature_auth) - Optional - Use Signature Based Authentication instead of [X-Auth-Token](#x_auth_token_request)
* [Content-Type](#content_type_request) - Optional - The MIME type of the object
* [Content-Encoding](#content_encoding_header) - Optional - Indicate that the contents are compressed
* [Content-Disposition](#content_disposition_header) - Optional - Override default download behaviour of browsers
* [X-Container-Meta-{name}](#x_container_meta_request) - Optional - Sets custom metadata on the container
* [X-Delete-At](#x_delete_at) - Optional - Specifies the time at which the
object is automaticically deleted from the system
* [X-Delete-After](#x_delete_at) - Optional - Specifies the number of
seconds until the object is automaticically deleted from the system

**URL Parameters**

Without query parameters, the operation operates as described in this section. With _signature_ and related options, the operation
behaves as described in [FormPost](#formpost)

**Data Parameters**

None.

**Success Response**

No response body is returned.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Response Data**

No response body is returned.
      
**Error Response**

If an error occurs, the response body contains a description of the error.

**Status Response**

See [HTTP Status Codes](#http_codes) for more information.

**Curl Example**

    curl -i -k -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -H 'X-Object-Meta-{name}: {value}' {BaseURI}/v1/{project_id}/{container}/{object}

#### 4.4.4 Bulk Operations

**Status Lifecycle**   
N/A

**Rate Limits**   
N/A

**Quota Limits**   
N/A

**Business Rules**   
None.

##### 4.4.4.1 Archive Auto Extraction ##### {#tarball_put}
##### PUT /v1/{project_id}/{optional-path}?extract-archive={format}

Upload a tar(1) archive file. The system will extract the files from the archive and create containers and objects. See [Archive Auto Extraction](#tarball_upload) for more information.

> The ETag request header is not used by this operation so there is no integrity check for the tar(1) archive.

**Request Data**

The path specifies the account. In addition, you can optionaly specify:

* A container name
* An object prefix

The following request headers apply to this operation.

* [X-Auth-Token](#x_auth_token_request) - Optional - Authentication token
* [Authorization](#signature_auth) - Optional - Use Signature Based Authentication instead of [X-Auth-Token](#x_auth_token_request)
* [Content-Length](#content_length_request) - Optional - The length in bytes of the request body. This is required unless you use the [Transfer-Encoding](#transfer_encoding_request) header.

**URL Parameters**

The `?extract-archive` query paramater must be present. The value must be one of:

* tar
* tar.gz
* tar.bz2

**Data Parameters**

None.

**Success Response**

The response body contains the actual status the delete requests.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Response Data**

The following response headers are returned:

* [Content_Length](#content_length_response)
* [Content_Type](#content_type_response)

See [Body of Archive Auto Extract Response](#archive_response_body) for more information about the response body.
      
**Error Response**

If an error occurs, the response body contains a description of the error.

**Status Response**

See [HTTP Status Codes](#http_codes) for more information.

**Curl Example**

    curl -i -k -X PUT -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -T tarball.tar {BaseURI}/v1/{project_id}?extract-archive=tar

##### 4.4.4.2 Bulk Delete ##### {#bulkop_delete}
##### DELETE /v1/{project_id}?bulk-delete

Delete up to 10,000 objects or containers in one request.
See [Bulk Delete](#bulk_delete) for more information.

**Request Data**

The path specifies the account.

The following request headers apply to this operation.

* [X-Auth-Token](#x_auth_token_request) - Optional - Authentication token
* [Authorization](#signature_auth) - Optional - Use Signature Based Authentication instead of [X-Auth-Token](#x_auth_token_request)

**URL Parameters**

The `?bulk-delete` query paramater must be present.

**Data Parameters**

The request body contains a list of objects or containers to delete.
See [Bulk Delete Request Body](#bulk_delete_request_body) for more
information.

**Success Response**

The response body contains the actual status the delete requests.

**Status Code**

See [HTTP Status Codes](#http_codes) for more information.

**Response Data**

The following response headers are returned:

* [Content_Length](#content_length_response)
* [Content_Type](#content_type_response)

See [Bulk Delete Response](#bulk_delete_response) for more information about the response body.
      
**Error Response**

If an error occurs, the response body contains a description of the error.

**Status Response**

See [HTTP Status Codes](#http_codes) for more information.

**Curl Example**

    curl https://region-a.geo-1.objects.hpcloudsvc.com/v1/{project_id}?bulk-delete -H 'x-auth-token: {auth_token}' -X DELETE -T body.txt -H 'content-type: text/plain' -H 'accept: application/json'
