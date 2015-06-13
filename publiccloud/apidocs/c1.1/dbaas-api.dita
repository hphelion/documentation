---
layout: page
permalink: /publiccloud/api/dbaas/
title: "HP Helion Public Cloud Relational Database API"
description: "HP Helion Public Cloud Relational Database API Documentation."
keywords: "MySQL, RDB, DBaaS"
product: dbaas

---
<!--PUBLISHED-->
# HP Helion Public Cloud Relational Database API

**Date:** June 2014

**Document Version:** 1.5

## 1. Overview

This document describes the HP Helion Public Cloud Relational Database API, which allows you to manage database instances and backups that you can then interact with using your favorite database client.

We will be referring to HP Helion Public Cloud Relational Database in this document as simply Relational Database.

### 1.1 API Maturity Level

**Maturity Level**: Public Beta

**Version API Status**: The Relational Database API is based on OpenStack Trove v1.0. 

### 1.2 Document Revision History

|Document Version|Date|Description|
|:---------------|:-------|:--------------|
|1.0|08/01/2013|Initial creation|
|1.1|03/18/2013|Updated backup section to clarify that backups taken persist until deleted (Section 4.5.4)|
|1.2|April 2014|Added section 4.1.4 for pagination |
|1.3|April 2014|Added call for List Limits |
|1.4|May 2014|HP Helion updates |
|1.5|June 2014|Added sections 4.5.5.9, 4.5.5.10, 4.5.5.11, 4.5.5.12, 4.5.8.4, 4.5.11, 4.5.12 for new functionality |

## 2. Architecture View

### 2.1 Overview
Relational Database (RDB-MySQL) allows users to create database instances on demand. This document is intended for software developers interested in developing applications that utilize the Relational Database API.

This guide assumes the reader is familiar with RESTful web services,
HTTP/1.1, and JSON serialization formats.

### 2.2 Concepts

**Database Instance** - A database instance is an isolated MySQL instance in a single project environment on a shared physical host machine.

**Database** - A MySQL database contained within a database instance.

**Flavor** - A flavor is an available hardware configuration for a database instance. Each flavor has a unique combination of memory capacity, vCPU, and storage.

**Backup** - A hot, non-blocking backup of all MySQL databases on a database instance. Backups are securely streamed to and stored in Object Storage in the same region as the database instance.

---

## 3. Account-level View
Like all HP Helion offerings, authentication is achieved through the Identity service, which will return an X-Auth-Token that is used for subsequent requests to individual services.

### 3.1 Accounts
For additional details on the Identity service, please refer to https://docs.hpcloud.com/identity

### 3.2 Regions and Availability Zones

**Region(s)**: region-a (US West)

**Availability Zone(s)**: dbaas-aw2az1-v1, dbaas-aw2az2-v1, dbaas-aw2az3-v1

**Future Expansion**: region-b

### 3.3 Service Catalog
The service is exposed in the service catalog, as shown in the following fragment:

    {
          "name": "Relational DB MySQL",
          "type": "hpext:dbaas",
          "endpoints": [
            {
              "tenantId": "29072817266119",
              "publicURL": "https://region-a.geo-1.database.hpcloudsvc.com/v1.0/29072817266119",
              "publicURL2": "",
              "region": "region-a.geo-1",
              "versionId": "v13.6",
              "versionInfo": "https://region-a.geo-1.database.hpcloudsvc.com/v1.0",
              "versionList": "https://region-a.geo-1.database.hpcloudsvc.com"
            },
          ]
    },

---

## 4. REST API Specifications

The Relational Database API is implemented using a RESTful web service interface. All requests to authenticate and operate against the Relational Database API should be performed using SSL over HTTP (HTTPS) on TCP port 443.

### 4.1 API Conventions

The Relational Database API provides a RESTful JSON interface.

Each REST resource contains a canonically unique identifier (ID) defined by the
Database service implementation and is provided as the `id` attribute; Resource
ID's are strings of non-zero length.

The resource paths of all collections are plural and are represented at the
root of the API (e.g. `/v1/entities`).

#### 4.1.1 Required Attributes

Headers:

 - `X-Auth-Token`

   This header is used to convey the authentication token when accessing
   Database APIs.

For collections:

- `links` (object)

  Specifies a list of relational links to the collection.

  - `self` (url)

    A self-relational link provided as an absolute URL. This attribute is
    provided by the database service implementation.

  - `previous` (url)

    A relational link to the previous page of the list, provided as an absolute
    URL. This attribute is provided by the database service implementation. May
    be null.

  - `next` (url)

    A relational to the next page of the list, provided as an absolute URL.
    This attribute is provided by the database service implementation. May be
    null.

For members:

- `id` (string)

  Globally unique resource identifier. This attribute is provided by the
  database service implementation.

- `links` (object)

  Specifies a set of relational links relative to the collection member.

  - `self` (url)

    A self-relational link provided as an absolute URL. This attribute is
    provided by the database service implementation.

#### 4.1.2 CRUD Operations

Unless otherwise documented, all resources provided by Relational Database support basic CRUD operations (create, read, update, delete).

The examples in this section utilize a resource collection of Entities on
`/v1/entities` which is not actually a part of the Relational Database API, but is used for illustrative purposes only.

##### 4.1.2.1 Create an Entity

When creating an entity, you must provide all required attributes (except those
provided by the Relational Database service implementation, such as the resource ID):

Request:

    POST /entities

    {
        "entity": {
            "name": string,
            "description": string,
            "enabled": boolean
        }
    }

The full entity is returned in a successful response (including the new
resource's ID and a self-relational link), keyed by the singular form of the
resource name:

    201 Created

    {
        "entity": {
            "id": string,
            "name": string,
            "description": string,
            "enabled": boolean,
            "links": {
                "self": url
            }
        }
    }

##### 4.1.2.2 List Entities

Request the entire collection of entities:

    GET /entities

A successful response includes a list of anonymous dictionaries, keyed by the
plural form of the resource name (identical to that found in the resource URL):

    200 OK

    {
        "entities": [
            {
                "id": string,
                "name": string,
                "description": string,
                "enabled": boolean,
                "links": {
                    "self": url
                }
            },
            {
                "id": string,
                "name": string,
                "description": string,
                "enabled": boolean,
                "links": {
                    "self": url
                }
            }
        ],
        "links": {
            "self": url,
            "next": url,
            "previous": url
        }
    }

##### 4.1.2.3 Get an Entity

Request a specific entity by ID:

    GET /entities/*entity_id*

The full resource is returned in response:

    200 OK

    {
        "entity": {
            "id": string,
            "name": string,
            "description": string,
            "enabled": boolean,
            "links": {
                "self": url
            }
        }
    }

##### 4.1.2.4 Update an Entity

Partially update an entity (unlike a standard `PUT` operation, only the
specified attributes are replaced):

    PATCH /entities/*entity_id*

    {
        "entity": {
            "description": string,
        }
    }

The full entity is returned in response:

    200 OK

    {
        "entity": {
            "id": string,
            "name": string,
            "description": string,
            "enabled": boolean,
            "links": {
                "self": url
            }
        }
    }

##### 4.1.2.5 Delete an Entity

Delete a specific entity by ID:

    DELETE /entities/*entity_id*

A successful response does not include a body:

    204 No Content

#### 4.1.3 HTTP Status Codes

The Database API uses a subset of the available HTTP status codes to
communicate specific success and failure conditions to the client.

| HTTP Code | Name                  | Description           |
| :-------- | :-------------------- | :-------------------- |
| 200       | OK                    | Response to successful `GET` and `PATCH` operations. |
| 201       | Created               | Response to successful `POST` operations. |
| 204       | No Content            | Response to successful `HEAD`, `PUT` and `DELETE` operations. |
| 300       | Multiple Choices      | Returned by the root identity endpoint, with references to one or more Database API versions (such as ``/v1/``). |
| 400       | Bad Request           | The RDB service failed to parse the request as expected. A required attribute is missing, a disallowed attribute is specified (such as an `id` on `POST`), or an attribute is provided of an unexpected data type. The client is assumed to be in error. |
| 401       | Unauthorized          | Either authentication has not been performed, the provided X-Auth-Token is invalid or authentication credentials are invalid. |
| 403       | Forbidden             | The request is successfully authenticated but not authorized to perform the requested action. |
| 404       | Not Found             | Returned in response to failed `GET`, `HEAD`, `POST`, `PUT`, `PATCH` and `DELETE` operations when a referenced entity cannot be found by ID. In the case of a `POST` request, the referenced entity may be in the request body as opposed to the resource path. |
| 500       | Internal Server Error | Returned when an unexpected error has occurred in the Database service implementation. |
| 501       | Not Implemented       | Returned when the RD-MYSQL implementation is unable to fulfill the request because it is incapable of implementing the entire API as specified. |
| 503       | Service Unavailable   | Returned when the RD-MYSQL service is unable to communicate with a backend service, or by a proxy in front of it unable to communicate with the service itself. |

#### 4.1.4 Pagination {#pagination}

To reduce load on the service, list operations limit the number of items that can be returned by a single call.

To navigate a collection, the parameters `limit` and `marker` can be set in the URI (e.g.?`limit`=5&`marker`=1234). The `marker` parameter is the ID of
the last item in the previous list. Items are sorted by create time in descending order. When a create time is not available they are sorted by ID. The `limit` parameter sets the page size. A maximum of 20 items are returned by a single call. Setting `limit` to a value greater than 20 has no effect.

### 4.2 Common Request Headers
Many operations accept request headers. This section provides an overview of each request header. Consult the specific operation to determine if the header applies to the operation and any other notes that are of interest.

#### 4.2.1 Accept {#accept_request}

Where applicable, this determines how the response body is formatted. For example, you can use this to list the objects in a container as:
* text (text/plain)
* JSON (application/json)

#### 4.2.2 X-Auth-Token {#x_auth_token_request}

When specified, this identifies the user making the request. In addition, if this token is being used by a user with Admin privilege level, the token must be scoped to the project associated with the account. If no token is specified, the request will fail unless you have been granted access to the resource by some other mechanism such as ACLs. For more information, see [Using Authentication Tokens](http://docs.hpcloud.com/api/v13/identity/#3.4.3Tokens).

### 4.3 Common Response Headers
#### 4.3.1 Date {#date_response}

When supplied, the Date header is the time of the operation expressed in GMT (effectively UTC) as shown in the following example:

      HTTP/1.1 200 OK
      Date: Sun, 06 Nov 1994 08:49:37 GMT

#### 4.3.2 Last-Modified {#last_modified_response}

This is the date and time that the object was created or the last time that the object was modified.

### 4.4 Service API Operations

**Host**: https://region-a.geo-1.database.hpcloudsvc.com

**BaseUri**: {Host}/v1.0/{project_id}

**Admin URI**: N/A

####Database Instance Operations

| Resource                       | Operation                                                            | HTTP Method | Path                                                               | JSON Support? | Privilege Level |
| :----------------------------- | :------------------------------------------------------------------- | :---------- | :----------------------------------------------------------------- | :---------------- | :-------------- |
| **Limits** | [List limits](#list_limits) | GET | /limits | Y | |
| **Instance** | [List all database instances](#instance_list) | GET | /instances | Y | |
| | [Create a new database instance](#instance_create) | POST | /instances | Y | |
| | [Get information about a specific database instance](#instance_get) | GET | /instances/{instance_id} | Y | |
| | [Delete a database instance](#instance_delete) | DELETE | /instances/{instance_id} | Y | |
| **Action** | [Restart a specific database instance](#instance_restart) | POST | /instances/{instance_id}/action | Y | |
| | [Resize a specific database instance](#instance_resize) | POST | /instances/{instance_id}/action | Y | |
| **Database** | [Create a new database on an instance](#database_create) | POST | /instances/{instance_id}/databases | Y | |
| | [List Databases on a instance](#database_list) | GET | /instances/{instance_id}/databases | Y | |
| | [Delete a database on an instance](#instance_action)| DELETE | /.../databases/*database_name* | Y | |
| **User** | [Create a new user](#user_create) | POST | /instances/{instance_id}/users | Y | |
| | [List users](#user_list) | GET | /instances/{instance_id}/users | Y | |
| | [Get details for a user](#user_get) | GET | /.../users/{username} | Y | |
| | [Change user's password](#user_change_pw) | PUT | /instances/{instance_id}/users | Y | |
| | [List users' databases](#user_database_list) | GET | /.../users/{username}/databases | Y | |
| | [Add database privileges to user](#user_add_db) | PUT | /.../users/{username}/databases | Y | |
| | [Remove database privileges for user](#user_remove_db) | DELETE | /.../users/{username}/databases/{databaseName} | Y | |
| | [Delete user](#user_delete) | DELETE | /.../users/{username} | Y | |
| **Root** | [Enable root user](#root_create) | POST | /instances/{instance_id}/root | Y | |
| | [Get root enabled status](#root_get) | GET | /instances/{instance_id}/root | Y | |
| **Configuration Defaults** | [Show default configuration for Instance](#instance_default_params) | GET | /instances/{instance_id}/configuration | Y | |
| **Configuration** | [Attach configuration to an instance](#instance_config_attach) | PUT | /instances/{instance_id} | Y | |
| | [Detach configuration from an instance](#instance_config_detach) | PUT | /instances/{instance_id} | Y | |

####Flavor Operations

| Resource                   | Operation                                          | HTTP Method | Path                            | JSON Support? | Privilege Level |
| :------------------------- | :------------------------------------------------- | :---------- | :------------------------------ | :---------------- | :-------------- |
| **Flavor** | [List all flavors](#flavor_list) | GET | /flavors | Y | |
| | [Get a specific flavor](#flavor_get) | GET | /flavors/{flavor_id} | Y | |

####Security Group Operations

| Resource                       | Operation                                                | HTTP Method | Path                            | JSON Support? | Privilege Level |
| :----------------------------- | :------------------------------------------------------- | :---------- | :------------------------------ | :---------------- | :-------------- |
| **Security Group** | [List all security groups](#sg_list) | GET | /security-groups | Y | |
| | [Get details for a specific security group](#sg_get) | GET | /security-groups/{secgroup_id} | Y |
| | [Create a new rule for a security group](#rule_create) | POST | /security-group-rules | Y | |
| | [Delete a specific security group rule](#rule_delete) | DELETE | /security-group-rules/{rule_id} | Y | |

####Backup Operations

| Resource                   | Operation                                          | HTTP Method | Path                 | JSON Support? | Privilege Level |
| :------------------------- | :------------------------------------------------- | :---------- | :------------------- | :---------------- | :-------------- |
| **Backup** | [List all backups](#backup_list) | GET | /backups | Y | |
| | [Get details for a specific backup](#backup_get) | GET | /backups/{backup_id} | Y | |
| | [Create a full backup for an instance](#backup_create)  | POST | /backups | Y | |
| | [Create an incremental backup for an instance](#backup_create_incremental)  | POST | /backups | Y | |
| | [Restore a backup to an instance](#backup_restore) | POST | /instances | Y | |
| | [Delete a backup](#backup_delete) | DELETE | /backups/{backup_id} | Y | |

####Version Operations

| Resource                      | Operation                                                     | HTTP Method | Path                            | JSON Support? | Privilege Level |
| :---------------------------- | :------------------------------------------------------------ | :---------- | :------------------------------ | :---------------- | :-------------- |
| **Version** | [List all API versions](#version_list)                         | GET | / | Y | |
| | [Get a specific version specified by version_id](#version_get) | GET | /version_id | Y | |

####Datastore Operations

| Resource | Operation | HTTP Method | Path | JSON Support? | Privilege Level |
| :----------------------------- | :------------------------------------------------------- | :---------- | :------------------------------------------------- | :---------------- | :-------------- |
| **Datastore** | [List all datastores](#ds_list) | GET | /datastores | Y | |
| | [Get details for a specific datastore](#ds_get) | GET | /datastores/{datastore_id} | Y | |
| | [List all versions for a datastore](#ds_version_list) | GET | /datastores/{datastore_name}/versions | Y |
| | [Get details for a datastore version](#ds_version_get) | GET | /datastores/{datastore_name}/versions/{version_id} | Y | |

####Configuration Operations

| Resource | Operation | HTTP Method | Path | JSON Support? | Privilege Level |
| :----------------------------- | :------------------------------------------------------- | :---------- | :------------------------------------------------- | :---------------- | :-------------- |
| **Configurations** | [List all configuration groups](#cg_list) | GET | /configurations | Y | |
| | [Create configuration group](#cg_post) | POST | /configurations | Y | |
| | [Get details for a configuration group](#cg_get) | GET | /configurations/{configId} | Y | |
| | [Update some parameters within a configuration group](#cg_patch) | PATCH | /configurations/{configId} | Y | 
| | [Replace all parameters within a configuration group](#cg_patch) | PUT | /configurations/{configId} | Y | |
| | [Delete a configuration group](#cg_delete) | DELETE | /configurations/{configId} | Y | |
| | [List instances associated with a configuration group](#cg_associated) | GET | /configurations/{configId}/instances | Y | |

####Configuration Parameter Operations

| Resource | Operation | HTTP Method | Path | JSON Support? | Privilege Level |
| :----------------------------- | :------------------------------------------------------- | :---------- | :------------------------------------------------- | :---------------- | :-------------- |
| **Configuration Parameters** | [List configuration parameters ](#cp_list) | GET | /datastores/{datastoreId}/versions/{versionId}/parameters | Y | |
| | [Show configuration parameter details](#cp_get) | POST | /datastores/{datastoreId}/versions/{versionId}/parameters/{parameterId} | Y | |

### 4.5 Service API Operation Details

#### 4.5.1 Limits
##### 4.5.1.1 List Limits {#list_limits}
##### GET /limits

Returns current limits for the project.

**Request Data**   
This call does not require a request body

**URL Parameters**   
N/A

**Success Response**

**Status Code**

200 - OK

**Response Data**

    {
    limits: [5]
        0:  {
        max_backups: 50
        verb: "ABSOLUTE"
        max_instances: 10
        }
        1:  {
        regex: ".*"
        nextAvailable: "2014-04-30T18:02:56Z"
        uri: "*"
        value: 9
        verb: "POST"
        remaining: 9
        unit: "MINUTE"
        }
        2:  {
        regex: ".*"
        nextAvailable: "2014-04-30T18:02:56Z"
        uri: "*"
        value: 9
        verb: "PUT"
        remaining: 9
        unit: "MINUTE"
        }
        3:  {
        regex: ".*"
        nextAvailable: "2014-04-30T18:02:56Z"
        uri: "*"
        value: 99
        verb: "DELETE"
        remaining: 99
        unit: "MINUTE"
        }
        4:  {
        regex: ".*"
        nextAvailable: "2014-04-30T18:02:56Z"
        uri: "*"
        value: 200
        verb: "GET"
        remaining: 199
        unit: "MINUTE"
        }
    }

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/limits

#### 4.5.2 Database Instances {#instance_resource}

A database instance is an isolated MySQL instance in a single project environment on a shared physical host machine. Also referred to as instance.

Additional required attributes:

- `name` (string)

  Name of the instance to create. The length of the name is limited to 255
  characters and any characters are permitted.

- `flavorRef` (integer)

  Reference (href) to a flavor as specified in the response from the List
  Flavors API call. This is the actual URI as specified by the href field in the link. Refer to the List Flavors response examples that follow for an example of the flavorRef.

Optional attributes:

- `databases` (list)

    - `Name` (string)

      Specifies database names for creating databases on instance creation.

    - `character_set` (string)

      Set of symbols and encodings. The default character set is utf8.

    - `collate` (string)

      Set of rules for comparing characters in a character set. The default
      value for collate is utf8_general_ci.

- `users` (list)

    - `Name` (string)

      Specifies user name for the database on instance creation.

    - `password` (string)

      Specifies password for those users on instance creation.

    - `databases` (list)

        - `name` (string)

        Specifies names of databases that those users can access on instance creation.

Example entity:

    {
        "instance": {
            "databases": [
                {
                    "character_set": "utf8",
                    "collate": "utf8_general_ci",
                    "name": "sampledb"
                },
                {
                    "name": "nextround"
                }
            ],
            "flavorRef": "https://region-a.geo-1.database.hpcloudsvc.com/v1.0/1234/flavors/1001",
            "name": "json_instance",
            "users": [
                {
                    "databases": [
                        {
                            "name": "sampledb"
                        }
                    ],
                    "name": "demouser",
                    "password": "demopassword"
                }
            ]
        }
    }

##### 4.5.2.1 Returns a list of all database instances {#instance_list}
##### GET /instances

This operation lists the status and information for all database instances.

**Request Data**   
This call does not require a request body

**URL Parameters**   
You can utilize pagination to filter your response.  *See: [Pagination](http://docs.hpcloud.com/api/v13/dbaas/#4.1.4Pagination) for more details*

**Success Response**

**Status Code**

200 - OK

**Response Data**

    {
        "instances": [
            {
                "flavor": {
                    "id": "1001",
                    "links": [
                        {
                            "href": "https://region-a.geo-1.database.hpcloudsvc.com/v1.0/1234/flavors/1001",
                            "rel": "self"
                        },
                        {
                            "href": "https://region-a.geo-1.database.hpcloudsvc.com/flavors/1001",
                            "rel": "bookmark"
                        }
                    ]
                },
                "id": "28d1b8f3-172a-4f6d-983d-36021508444a",
                "links": [
                    {
                        "href": "https://region-a.geo-1.database.hpcloudsvc.com/v1.0/1234/instances/28d1b8f3-172a-4f6d-983d-36021508444a",
                        "rel": "self"
                    },
                    {
                        "href": "https://region-a.geo-1.database.hpcloudsvc.com/instances/28d1b8f3-172a-4f6d-983d-36021508444a",
                        "rel": "bookmark"
                    }
                ],
                "name": "instance1",
                "status": "ACTIVE"
            },
            {
                "flavor": {
                    "id": "1002",
                    "links": [
                        {
                            "href": "https://region-a.geo-1.database.hpcloudsvc.com/v1.0/1234/flavors/1002",
                            "rel": "self"
                        },
                        {
                            "href": "https://region-a.geo-1.database.hpcloudsvc.com/flavors/1002",
                            "rel": "bookmark"
                        }
                    ]
                },
                "id": "8fb081af-f237-44f5-80cc-b46be1840ca9",
                "links": [
                    {
                        "href": "https://region-a.geo-1.database.hpcloudsvc.com/v1.0/1234/instances/8fb081af-f237-44f5-80cc-b46be1840ca9",
                        "rel": "self"
                    },
                    {
                        "href": "https://region-a.geo-1.database.hpcloudsvc.com/instances/8fb081af-f237-44f5-80cc-b46be1840ca9",
                        "rel": "bookmark"
                    }
                ],
                "name": "instance2",
                "status": "ACTIVE"
            }
        ]
    }

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/instances

##### 4.5.2.2 Create a new database instance {#instance_create}
##### POST /instances

This operation asynchronously provisions a new database instance. This call
requires the user to specify a flavor and a volume size. The service then
provisions the instance with the requested flavor with the needed storage for
the database instance. You may also optionally specify the databases and users
to be created on the new instance.

**Request Data**

	{
	    "instance": {
	        "users": [
	            {
	                "password": "password",
	                "name": "sample_user@%",
	                "databases": [
	                    {
	                        "name": "sample_db"
	                    }
	                ]
	            }
	        ],
	        "flavorRef": "1002",
	        "databases": [
	            {
	                "name": "sample_db"
	            }
	        ],
	        "datastore": {
	            "type": "ab9b396f-9095-436f-903d-e302ff1a52f9"
	        },
	        "configuration": "40e0909a-0ca8-4864-952a-109edc886049",
	        "name": "my_instance"
	    }
	}

**Success Response**

**Status Code**

201 - Created

**Response Data**

	{
	    "instance": {
	        "status": "BUILD",
	        "updated": "2014-06-21T21:01:41",
	        "name": "my_instance",
	        "links": [
	            {
	                "href": "https://region-a.geo-1.database.hpcloudsvc.com/v1.0/38728063898723/instances/95794609-31cf-4439-ab29-566710b53e75",
	                "rel": "self"
	            },
	            {
	                "href": "https://region-a.geo-1.database.hpcloudsvc.com/instances/95794609-31cf-4439-ab29-566710b53e75",
	                "rel": "bookmark"
	            }
	        ],
	        "created": "2014-06-21T21:01:41",
	        "id": "95794609-31cf-4439-ab29-566710b53e75",
	        "flavor": {
	            "id": "1002",
	            "links": [
	                {
	                    "href": "https://region-a.geo-1.database.hpcloudsvc.com/v1.0/38728063898723/flavors/1002",
	                    "rel": "self"
	                },
	                {
	                    "href": "https://region-a.geo-1.database.hpcloudsvc.com/flavors/1002",
	                    "rel": "bookmark"
	                }
	            ]
	        },
	        "configuration": {
	            "id": "40e0909a-0ca8-4864-952a-109edc886049",
	            "links": [
	                {
	                    "href": "https://region-a.geo-1.database.hpcloudsvc.com/v1.0/38728063898723/configurations/40e0909a-0ca8-4864-952a-109edc886049",
	                    "rel": "self"
	                },
	                {
	                    "href": "https://region-a.geo-1.database.hpcloudsvc.com/configurations/40e0909a-0ca8-4864-952a-109edc886049",
	                    "rel": "bookmark"
	                }
	            ],
	            "name": "sample_config_group"
	        },
	        "datastore": {
	            "version": "5.5",
	            "type": "mysql"
	        }
	    }
	}

**Curl Example**

    curl -X POST -H "Content-Type: application/json" -H "X-Auth-Token: {Auth_Token}" -d '{"instance":{"name": "{name}","flavorRef": "https://region-a.geo-1.database.hpcloudsvc.com/v1.0/38728063898723/flavors/1002"}}' {BaseURI}/instances

**Additional Notes**

The hostname/ip of the instance will be populated once the database is in a
'running' state. To get the hostname, poll the 'Get a database instance'
operation until the field is not empty and the status is 'ACTIVE'"

##### 4.5.2.3 Get information about a specific database instance {#instance_get}
##### GET /instances/{instance_id}

Returns information about the database instance specified by {instance_id}

**Request Data**

This call does not require a request body

**Success Response**

**Status Code**

200 - OK

**Response Data**

    {
       "instance":{
          "status":"ACTIVE",
          "updated":"2013-08-28T16:33:50",
          "name":"my_instance",
          "links":[
             {
                "href":"https://region-a.geo-1.database.hpcloudsvc.com/v1.0/38728063898723/instances/dd745f4a-9333-417e-bb89-9c989c84c068",
                "rel":"self"
             },
             {
                "href":"https://region-a.geo-1.database.hpcloudsvc.com/instances/dd745f4a-9333-417e-bb89-9c989c84c068",
                "rel":"bookmark"
             }
          ],
          "created":"2013-08-28T16:33:48",
          "ip":[
             "10.9.xx.xxx",
             "15.125.xx.xxx"
          ],
          "local_storage":{
             "used":1.16
          },
          "flavor":{
             "id":"1003",
             "links":[
                {
                   "href":"https://region-a.geo-1.database.hpcloudsvc.com/v1.0/38728063898723/flavors/1003",
                   "rel":"self"
                },
                {
                   "href":"https://region-a.geo-1.database.hpcloudsvc.com/flavors/1003",
                   "rel":"bookmark"
                }
             ]
          },
          "id":"dd745f4a-9333-417e-bb89-9c989c84c068"
       }
    }

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/instances/{instance_id}

##### 4.5.2.4 Delete a database instance {#instance_delete}
##### DELETE /instances/{instance_id}

Deletes the database instance specified by {instance_id}

**Request Data**

This call does not require a request body.

**Success Response**

**Status Code**

202 - Accepted

**Response Data**

Response body will be empty

**Curl Example**

    curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/instances/{instance_id}

#### 4.5.3 Instance Actions {#instance_action}
##### 4.5.3.1 Restart a specific instance {#instance_restart}
##### POST /instances/{instance_id}/action

Restarts the database instance specified by {instance_id}
Restarting MySQL will erase any dynamic configuration settings that you
have made within MySQL.

**Request Data**

    {
        "restart": {}
    }

**Success Response**

**Status Code**

202 - Accepted

**Response Data**

Response body will be empty

**Curl Example**

    curl -i -k -X POST -H "Content-Type: application/json" -H "X-Auth-Token: {Auth_Token}" -d '{"restart":{}}' {BaseURI}/instances/{instance_id}/action

##### 4.5.3.2 Resize a specific instance {#instance_resize}
##### POST /instances/{instance_id}/action

This operation changes the size of the instance, assuming a valid
flavorRef is provided. It restarts MySQL in the process.

**Request Data**

    {
        "resize": {
            "flavorRef": "https://<TBD>/v1.0/1234/flavors/1002"
        }
    }

**Success Response**

**Status Code**

202 - Accepted

**Response Data**

Response body will be empty

**Curl Example**

    curl -i -k -X POST -H "Content-Type: application/json" -H "X-Auth-Token: {Auth_Tokens}" -d '{"resize": {"flavorRef": "https://<TBD>/v1.0/1234/flavors/1003"}}' {BaseURI}/instances/{instance_id}/action

#### 4.5.4 Databases {#database_resource}
##### 4.5.4.1 Create Database {#database_create}
##### POST /instances/{instance_id}/databases

Creates a new database(s)/schema(s) within the specified instance.

**Request Data**

    {
        "databases": [
            {
                "character_set": "utf8",
                "collate": "utf8_general_ci",
                "name": "testingdb"
            },
            {
                "name": "sampledb"
            }
        ]
    }

**Success Response**

**Status Code**

202 - Accepted

**Response Data**

Response body will be empty

**Curl Example**

    curl -i -X POST -H "Content-Type: application/json" -H "X-Auth-Token: {Auth_Token}" -d '{"databases": [{"name": "mydb"}]}' {BaseURI}/instances/{instance_id}/databases 

##### 4.5.4.2 List Databases {#database_list}
##### GET /instances/{instance_id}/databases

Lists all databases within the specified instance.  The response will be limited to twenty (20) results.  *See: [Pagination](http://docs.hpcloud.com/api/v13/dbaas/#4.1.4Pagination) for more details*

**Request Data**   
This call does not require a request body.

**URL Parameters**   
You can utilize pagination to filter your response.  *See: [Pagination](http://docs.hpcloud.com/api/v13/dbaas/#4.1.4Pagination) for more details*

**Success Response**

**Status Code**

200 - OK

**Response Data**

    {
        "databases": [
            {
                "name": "anotherexampledb"
            },
            {
                "name": "exampledb"
            },
            {
                "name": "nextround"
            },
            {
                "name": "sampledb"
            },
            {
                "name": "testingdb"
            }
        ]
    }

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/instances/{instance_id}/databases

##### 4.5.4.3 Delete Database {#database_delete}
##### DELETE /instances/{instance_id}/databases/{database_name}

Deletes the requested database within the specified database instance. Note that all data associated with the database is also deleted.

**Request Data**

This call does not require a request body.

**Success Response**

**Status Code**

202 ACCEPTED

**Response Data**

Response body will be empty

**Curl Example**

    curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/instances/{instance_id}/databases/{database_name}

#### 4.5.5 Users {#user_resource}
##### 4.5.5.1 Create User {#user_create}
##### POST /instances/{instance_id}/users

Creates a new user(s) within the specified instance.

**Request Data**

    {
        "users": [
            {
                "databases": [
                    {
                        "name": "databaseA"
                    }
                ],
                "name": "dbuser3",
                "password": "password"
            },
            {
                "databases": [
                    {
                        "name": "databaseB"
                    },
                    {
                        "name": "databaseC"
                    }
                ],
                "name": "dbuser4",
                "password": "password"
            }
        ]
    }

**Success Response**

**Status Code**

202 ACCEPTED

**Response Data**

Response body will be empty

**Curl Example**

    curl -i -k -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"users": [{"databases": [{"name": "databaseA"}],"name": "dbuser3","password": "password"},{"databases": [{"name": "databaseB"},{"name": "databaseC"}],"name": "dbuser4","password": "password"}]}' {BaseURI}/instances/{instance_id}/users

##### 4.5.5.2 List Users {#user_list}
##### GET /instances/{instance_id}/users

Lists users for the specified instance.

**Request Data**

This call does not require a request body.

**Success Response**

**Status Code**

200 OK

**Response Data**

    {
        "users": [
            {
                "databases": [
                    {
                        "name": "databaseA"
                    }
                ],
                "name": "dbuser3"
            },
            {
                "databases": [
                    {
                        "name": "databaseB"
                    },
                    {
                        "name": "databaseC"
                    }
                ],
                "name": "dbuser4"
            }
        ]
    }

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/instances/{instance_id}/users

##### 4.5.5.3 Get User {#user_get}
##### GET /instances/{instance_id}/users/{username}

Show a single user and the databases to which this user has privileges.

**Request Data**

This call does not require a request body.

**Success Response**

**Status Code**

200 OK

**Response Data**

    {
        "user": {
            "name": "username",
            "databases": [
                {
                    "name": "databaseB"

                },
                {
                    "name": "databaseC"
                }
            ]
        }
    }

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/instances/{instance_id}/users/{username}

##### 4.5.5.4 Modify user password {#user_change_pw}
##### PUT /instances/{instance_id}/users

Changes the password of the specified user(s).

**Request Data**

    {
        "users": [
            {
                "name": "dbuser3",
                "password": "password"
            },
            {
                "name": "dbuser4",
                "password": "password"
            }
        ]
    }

**Success Response**

**Status Code**

202 ACCEPTED

**Response Data**

Response body will be empty

**Curl Example**

    curl -i -k -X PUT -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"users": [{"name": "dbuser3","password": "{password}"},{"name": "dbuser4","password": "{password}"}]}' {BaseURI}/instances/{instance_id}/users

##### 4.5.5.5 List users' databases {#user_database_list}
##### GET /instances/{instance_id}/users/{username}/databases

Lists databases for which a user has access.

**Request Data**

This call does not require a request body.

**Success Response**

**Status Code**

200 OK

**Response Data**

    {
        "databases": [
            {
                "name": "databaseB"
            },
            {
                "name": "databaseC"
            }
        ]
    }

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/instances/{instance_id}/users/{username}/databases

##### 4.5.5.6 Add database privileges {#user_add_db}
##### PUT /instances/{instance_id}/users/{username}/databases

Grants privileges on the specified database(s) to the user.

**Request Data**

    {
    "databases": [
            {
                "name": "databaseB"
            },
            {
                "name": "databaseC"
            }
        ]
    }

**Success Response**

**Status Code**

202 ACCEPTED

**Response Data**

Response body will be empty

**Curl Example**

    curl -i -k -X PUT -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"databases": [{"name": "databaseB"},{"name": "databaseC"}]}' {BaseURI}/instances/{instance_id}/users/{username}/databases

##### 4.5.5.7 Remove database privileges {#user_remove_db}
##### DELETE /instances/{instance_id}/users/{username}/databases/{databaseName}

Removes privileges on the specified database(s) to the user.

**Request Data**

This call does not require a request body.

**Success Response**

**Status Code**

202 ACCEPTED

**Response Data**

Response body will be empty

**Curl Example**

    curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/instances/{instance_id}/users/{username}/databases/{databaseName}

##### 4.5.5.8 Delete user {#user_delete}
##### DELETE /instances/{instance_id}/users/{username}

Deletes the requested user within the specified instance.

**Request Data**

This call does not require a request body.

**Success Response**

**Status Code**

202 ACCEPTED

**Response Data**

Response body will be empty

**Curl Example**

    curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/instances/{instance_id}/users/{username}
    

##### 4.5.5.9 Enable root user {#root_create}
##### POST /instances/{instance_id}/root

Enables the root user for a given instance.

**Note:** Changes made against the database instance as a root user could impact your ability to manage the instance via the API.  When enabling the root user, you accept that we may no longer be able to support your database instance.  

**Request Data**

This call does not require a request body.

**Success Response**

**Status Code**

201 CREATED

**Response Data**

	{
	    "user": {
	        "password": "C8whvrWCj8JPcmmQYg6dbuufYkBwash3nhfh",
	        "name": "root"
	    }
	}

**Curl Example**

    curl -i -k -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/instances/{instance_id}/root

##### 4.5.5.10 Get root enabled status {#root_get}
##### GET /instances/{instance_id}/root

Show the root enabled status on a given instance.
  
**Request Data**

This call does not require a request body.

**Success Response**

**Status Code**

200 OK

**Response Data**

	{
	    "rootEnabled": true
	}

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/instances/{instance_id}/root

##### 4.5.5.11 Show default configuration parameters for instance {#instance_default_params}
##### GET /instances/{instance_id}/parameters

Lists the default configuration parameters on a given instance.

**Request Data**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

	{
	    "instance": {
	        "configuration": {
	            "tmp_table_size": "128",
	            "innodb_blocking_buffer_pool_restore": "1",
	            "innodb_write_io_threads": "1",
	            "max_heap_table_size": "128",
	            "max_connections": "1024",
	            "myisam-recover": "BACKUP",
	            "server_id": "333489",
	            "innodb_buffer_pool_size": "2868M",
	            "auto_increment_offset": "1",
	            "innodb_flush_method": "O_DIRECT",
	            "lower_case_table_names": "1",
	            "innodb_flush_log_at_trx_commit": "0",
	            "max_allowed_packet": "64M",
	            "innodb_log_buffer_size": "64M",
	            "innodb_support_xa": "0",
	            "table_open_cache": "1024",
	            "table_definition_cache": "1024",
	            "query_cache_type": "0",
	            "innodb_log_file_size": "512",
	            "auto_increment_increment": "10",
	            "innodb_thread_concurrency": "0",
	            "thread_stack": "256K",
	            "wait_timeout": "300",
	            "thread_cache_size": "1024",
	            "innodb_file_format": "Barracuda",
	            "query_cache_size": "0",
	            "binlog_format": "row",
	            "innodb_data_file_path": "ibdata1:10M:autoextend:max:55296M",
	            "event_scheduler": "ON",
	            "innodb_buffer_pool_instances": "1",
	            "innodb_buffer_pool_restore_at_startup": "1",
	            "innodb_read_io_threads": "2",
	            "innodb_io_capacity": "200",
	            "innodb_file_per_table": "0",
	            "innodb_open_files": "1024",
	            "key_buffer_size": "16M"
	        }
	    }
	}

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/instances/{instance_id}/parameters
    

##### 4.5.5.12 Attach configuration to an instance {#instance_config_attach}
##### PUT /instances/{instance_id}

Attaches a configuration resource to an instance.

**Request Data**

	{
	    "instance": {
	        "configuration": "40e0909a-0ca8-4864-952a-109edc886049"
	    }
	}
	

**Success Response**

**Status Code**

200 - OK

**Response Data**

None.

**Curl Example**

    curl -i -k -X PUT -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/instances/{instance_id} -d '{"instance": {"configuration": "40e0909a-0ca8-4864-952a-109edc886049"}}'

##### 4.5.5.13 Detach configuration from an instance {#instance_config_detach}
##### PUT /instances/{instance_id}

Detaches a configuration resource from an instance.

**Request Data**

	{
	    "instance": {}
	}
	

**Success Response**

**Status Code**

200 - OK

**Response Data**

None.

**Curl Example**

    curl -i -k -X PUT -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/instances/{instance_id} -d '{"instance": {}}'
    

#### 4.5.6 Flavor Operations {#flavor_resource}
##### 4.5.6.1 List all flavors {#flavor_list}
##### GET /flavors

Returns a list of all available flavors

**Request Data**

This call does not require a request body

**Success Response**

**Status Code**

200 - OK

**Response Data**

    {
        "flavors": [
            {
                "id": 1001,
                "links": [
                    {
                        "href": "https://region-a.geo-1.database.hpcloudsvc.com/v1.0/38728063898723/flavors/1001",
                        "rel": "self"
                    },
                    {
                        "href": "https://region-a.geo-1.database.hpcloudsvc.com/flavors/1001",
                        "rel": "bookmark"
                    }
                ],
                "local_storage": 15,
                "name": "db.xsmall",
                "ram": 1024
            },
            {
                "id": 1002,
                "links": [
                    {
                        "href": "https://region-a.geo-1.database.hpcloudsvc.com/v1.0/38728063898723/flavors/1002",
                        "rel": "self"
                    },
                    {
                        "href": "https://region-a.geo-1.database.hpcloudsvc.com/flavors/1002",
                        "rel": "bookmark"
                    }
                ],
                "local_storage": 30,
                "name": "db.small",
                "ram": 2048
            },
            {
                "id": 1003,
                "links": [
                    {
                        "href": "https://region-a.geo-1.database.hpcloudsvc.com/v1.0/38728063898723/flavors/1003",
                        "rel": "self"
                    },
                    {
                        "href": "https://region-a.geo-1.database.hpcloudsvc.com/flavors/1003",
                        "rel": "bookmark"
                    }
                ],
                "local_storage": 60,
                "name": "db.medium",
                "ram": 4096
            },
            {
                "id": 1004,
                "links": [
                    {
                        "href": "https://region-a.geo-1.database.hpcloudsvc.com/v1.0/38728063898723/flavors/1004",
                        "rel": "self"
                    },
                    {
                        "href": "https://region-a.geo-1.database.hpcloudsvc.com/flavors/1004",
                        "rel": "bookmark"
                    }
                ],
                "local_storage": 120,
                "name": "db.large",
                "ram": 8192
            },
            {
                "id": 1005,
                "links": [
                    {
                        "href": "https://region-a.geo-1.database.hpcloudsvc.com/v1.0/38728063898723/flavors/1005",
                        "rel": "self"
                    },
                    {
                        "href": "https://region-a.geo-1.database.hpcloudsvc.com/flavors/1005",
                        "rel": "bookmark"
                    }
                ],
                "local_storage": 240,
                "name": "db.xlarge",
                "ram": 16384
            },
            {
                "id": 1006,
                "links": [
                    {
                        "href": "https://region-a.geo-1.database.hpcloudsvc.com/v1.0/38728063898723/flavors/1006",
                        "rel": "self"
                    },
                    {
                        "href": "https://region-a.geo-1.database.hpcloudsvc.com/flavors/1006",
                        "rel": "bookmark"
                    }
                ],
                "local_storage": 480,
                "name": "db.2xlarge",
                "ram": 32768
            },
        ]
    }

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/flavors

##### 4.5.6.2 Get a flavor {#flavor_get}
##### GET /flavors/{flavor_id}

Gets more detailed information about a given flavor.

**Request Data**

This call does not require a request body

**Success Response**

**Status Code**

200 - OK

**Response Data**

    {
        "flavor": {
            "id": 1002,
            "links": [
                {
                    "href": "https://region-a.geo-1.database.hpcloudsvc.com/v1.0/38728063898723/flavors/1002",
                    "rel": "self"
                },
                {
                    "href": "https://region-a.geo-1.database.hpcloudsvc.com/flavors/1002",
                    "rel": "bookmark"
                }
            ],
            "local_storage": 30,
            "name": "db.small",
            "ram": 2048
        }
    }

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/flavors/{flavor_id}

#### 4.5.7 Security Group Operations {#sg_resource}

A security group is automatically provisioned for each instance, and network access to the database instance can be managed via its rules. Only CRUD operations on security group rules are supported. Security groups themselves cannot be modified or deleted.

##### 4.5.7.1 List all security groups {#sg_list}
##### GET /security-groups

Lists all of the Security Groups, with details of which instances they
are attached to.

**Request Data**

This call does not require a request body

**Success Response**

**Status Code**

200 - OK

**Response Data**

    {
        "security_groups": [
            {
                "created": "2013-08-28T16:33:48",
                "description": "Security Group for dd745f4a-9333-417e-bb89-9c989c84c068",
                "id": "111275",
                "instance_id": "dd745f4a-9333-417e-bb89-9c989c84c068",
                "links": [
                    {
                        "href": "https://region-a.geo-1.database.hpcloudsvc.com/v1.0/38728063898723/security-groups/111275",
                        "rel": "self"
                    }
                ],
                "name": "SecGroup_dd745f4a-9333-417e-bb89-9c989c84c068",
                "rules": [
                    {
                        "cidr": "0.0.0.0/0",
                        "from_port": 3306,
                        "id": "103511",
                        "protocol": "tcp",
                        "to_port": 3306
                    }
                ],
                "updated": "2013-08-28T16:33:48"
            },
            {
                "created": "2013-09-06T18:03:32",
                "description": "Security Group for 18eb9700-8015-4b1e-b2cc-cecb84cc1b8e",
                "id": "235538",
                "instance_id": "18eb9700-8015-4b1e-b2cc-cecb84cc1b8e",
                "links": [
                    {
                        "href": "https://region-a.geo-1.database.hpcloudsvc.com/v1.0/38728063898723/security-groups/235538",
                        "rel": "self"
                    }
                ],
                "name": "SecGroup_18eb9700-8015-4b1e-b2cc-cecb84cc1b8e",
                "rules": [],
                "updated": "2013-09-06T18:03:32"
            }
        ]
    }

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/security-groups

##### 4.5.7.2 Get a specific security group {#sg_get}
##### GET /security-groups/{security_group_id}

Returns a specific security group specified by *security_group_id*

**Request Data**

This call does not require a request body

**Success Response**

**Status Code**

200 - OK

**Response Data**

    {
        "security_group": {
            "created": "2013-08-28T16:33:48",
            "description": "Security Group for dd745f4a-9333-417e-bb89-9c989c84c068",
            "id": "111275",
            "instance_id": "dd745f4a-9333-417e-bb89-9c989c84c068",
            "links": [
                {
                    "href": "https://region-a.geo-1.database.hpcloudsvc.com/v1.0/38728063898723/security-groups/111275",
                    "rel": "self"
                }
            ],
            "name": "SecGroup_dd745f4a-9333-417e-bb89-9c989c84c068",
            "rules": [
                {
                    "cidr": "0.0.0.0/0",
                    "from_port": 3306,
                    "id": "103511",
                    "protocol": "tcp",
                    "to_port": 3306
                }
            ],
            "updated": "2013-08-28T16:33:48"
        }
    }

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/security-groups/{security_group_id}

##### 4.5.7.3 Create a security group rule {#rule_create}
##### POST /security-group-rules

Create a new security group rule. 

**Request Data**

    {
        "security_group_rule": {
            "cidr": "0.0.0.0/0",
            "from_port": "3306",
            "group_id": "111275",
            "protocol": "tcp",
            "to_port": "3306"
        }
    }

**Success Response**

**Status Code**

202 ACCEPTED

**Response Data**

Response body will be empty

**Curl Example**

    curl -i -k -X POST -H "Content-Type: application/json" -H "X-Auth-Token: {Auth_Token}" -d '-d '{"security_group_rule": {"to_port": "3306", "cidr": "0.0.0.0/0", "group_id": "111275", "protocol": "tcp", "from_port": "3306"}}'' {BaseURI}/security-group-rules

##### 4.5.7.4 Delete a security group rule {#rule_delete}
##### DELETE /security-group-rules/{rule_id}

Deletes the security group rule specified by *rule_id*

**Request Data**

This call does not require a request body

**Success Response**

**Status Code**

204 - No Content

**Response Data**

Empty Response Body

**Curl Example**

    curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/security-group-rules/{rule_id}

#### 4.5.8 Backup Operations {#backup_resource}

Database backups operations enable all databases on a database instances to be backed up to Object Storage at standard storage rates. Backups are hot and non-blocking, meaning no downtime will be incurred on the database instance itself during a backup. A backup can then be used to perform a database restore via the instance create command.

**Note:** Database backups persist in Object Storage until they are deleted.

##### 4.5.8.1 List all Backups {#backup_list}
##### GET /backups

Shows detailed information about all backups for a project.

**Request Data**

This call does not require a request body

**Success Response**

**Status Code**

200 - OK

**Response Data**

    {
        "backups":
        [
            {
                "created": "2013-05-01T00:00:00",
                "description": null,
                "id": "aeb6fa4c-932d-4acc-a339-cccfb9f300b2",
                "instance_id": "d6338c9c-3cc8-4313-b98f-13cc0684cf15",
                "locationRef": null,
                "name": "testback-backup",
                "status": "COMPLETED",
                "updated": "2013-05-01T00:00:00"
            },
            {
                "created": "2013-09-06T18:47:05",
                "description": null,
                "id": "8ff8a6f3-1a48-4f9d-a75a-6c5214b0195d",
                "instance_id": "dd745f4a-9333-417e-bb89-9c989c84c068",
                "locationRef": "https://region-a.geo-1.objects.hpcloudsvc.com/v1/38728063898723/database_backups/8ff8a6f3-1a48-4f9d-a75a-6c5214b0195d.xbstream.gz.enc",
                "name": "my_backup",
                "size": 1.16,
                "status": "COMPLETED",
                "updated": "2013-09-06T18:47:09"
            }
        ]
    }

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/backups

##### 4.5.8.2 Get details for a specific backup {#backup_get}
##### GET /backups/{backup_id}

Shows detailed information about the specified backup

**Request Data**

This call does not require a request body

**Success Response**

**Status Code**

200 - OK

**Response Data**

    {
        "backup": {
            "created": "2013-09-06T18:47:05",
            "description": null,
            "id": "8ff8a6f3-1a48-4f9d-a75a-6c5214b0195d",
            "instance_id": "dd745f4a-9333-417e-bb89-9c989c84c068",
            "locationRef": "https://region-a.geo-1.objects.hpcloudsvc.com/v1/38728063898723/database_backups/8ff8a6f3-1a48-4f9d-a75a-6c5214b0195d.xbstream.gz.enc",
            "name": "my_backup",
            "parent_id": null,
            "size": 1.16,
            "status": "COMPLETED",
            "updated": "2013-09-06T18:47:09"
        }
    }

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/backups/{backup_id}

##### 4.5.8.3 Create a full backup for an instance {#backup_create}
##### POST /backups

Creates a new, full backup of an existing instance. All databases within the instance are backed up.

Backups are stored in your Object Storage account, and the location is available via locationRef.

**Request Data**

    {
        "backup":
        {
            "description": null,
            "instance": "d6338c9c-3cc8-4313-b98f-13cc0684cf15",
            "name": "full-backup"
        }
    }

**Success Response**

**Status Code**

202 ACCEPTED

**Response Data**
	
	{
	    "backup": {
	        "instance_id": "d6338c9c-3cc8-4313-b98f-13cc0684cf15",
	        "status": "NEW",
	        "updated": "2014-06-21T21:27:15",
	        "locationRef": null,
	        "name": "full_backup",
	        "parent_id": null,
	        "created": "2014-06-21T21:27:15",
	        "size": null,
	        "id": "cccee609-8969-4747-bd55-0bb6b27a6917",
	        "description": null
	    }
	}

**Curl Example**

    curl -i -k -X POST -H "Content-Type: application/json" -H "X-Auth-Token: {Auth_Token}" -d '{"backup": {"description": null, "instance": "d6338c9c-3cc8-4313-b98f-13cc0684cf15", "name": "full-backup"}}' {BaseURI}/backups
    

##### 4.5.8.4 Create an incremental backup for an instance {#backup_create_incremental}
##### POST /backups

Creates a new, incremental backup of an existing instance. The incremental backup will be created from the point in time specified by the parent backup.  All databases within the instance are backed up.

Backups are stored in your Object Storage account, and the location is available via locationRef.

**Request Data**

	{
	    "backup": {
	        "instance": "95794609-31cf-4439-ab29-566710b53e75",
	        "name": "incremental_backup",
	        "parent_id": "cccee609-8969-4747-bd55-0bb6b27a6917"
	    }
	}

**Success Response**

**Status Code**

202 ACCEPTED

**Response Data**
	
	{
	    "backup": {
	        "instance_id": "95794609-31cf-4439-ab29-566710b53e75",
	        "status": "NEW",
	        "updated": "2014-06-21T21:31:40",
	        "locationRef": null,
	        "name": "incremental_backup",
	        "parent_id": "cccee609-8969-4747-bd55-0bb6b27a6917",
	        "created": "2014-06-21T21:31:40",
	        "size": null,
	        "id": "85f0b573-7b8c-44a2-83b0-b13b2e730298",
	        "description": null
	    }
	}

**Curl Example**

    curl -i -k -X POST -H "Content-Type: application/json" -H "X-Auth-Token: {Auth_Token}" -d '{"backup": {"instance": "95794609-31cf-4439-ab29-566710b53e75", "name": "incremental_backup", "parent_id": "cccee609-8969-4747-bd55-0bb6b27a6917"}}' {BaseURI}/backups

##### 4.5.8.5 Restore a backup to an instance {#backup_restore}
##### POST /instances

This operation asynchronously provisions a new database instance. This call
requires the user to specify a flavor. The service then provisions the
instance with the requested flavor and sets up a volume of the
specified size, which is the storage for the database instance.

Finally, this will restore a copy of the database based on the specified
backup id.

**Request Data**

	{
	    "instance": {
	        "restorePoint": {
	            "backupRef": "85f0b573-7b8c-44a2-83b0-b13b2e730298"
	        },
	        "flavorRef": "1002",
	        "configuration": "40e0909a-0ca8-4864-952a-109edc886049",
	        "name": "restored_from_backup",
	        "datastore": {
	            "type": "ab9b396f-9095-436f-903d-e302ff1a52f9"
	        }
	    }
	}

**Success Response**

**Status Code**

201 - Created

**Response Data**

	{
	    "instance": {
	        "status": "BUILD",
	        "updated": "2014-06-21T21:40:19",
	        "name": "restored_from_backup",
	        "links": [
	            {
	                "href": "https://region-a.geo-1.database.hpcloudsvc.com/v1.0/38728063898723/instances/e3db804d-6727-46b7-aa68-6256ad970890",
	                "rel": "self"
	            },
	            {
	                "href": "https://region-a.geo-1.database.hpcloudsvc.com/instances/e3db804d-6727-46b7-aa68-6256ad970890",
	                "rel": "bookmark"
	            }
	        ],
	        "created": "2014-06-21T21:40:19",
	        "id": "e3db804d-6727-46b7-aa68-6256ad970890",
	        "flavor": {
	            "id": "1002",
	            "links": [
	                {
	                    "href": "https://region-a.geo-1.database.hpcloudsvc.com/v1.0/38728063898723/flavors/1002",
	                    "rel": "self"
	                },
	                {
	                    "href": "https://region-a.geo-1.database.hpcloudsvc.com/flavors/1002",
	                    "rel": "bookmark"
	                }
	            ]
	        },
	        "configuration": {
	            "id": "40e0909a-0ca8-4864-952a-109edc886049",
	            "links": [
	                {
	                    "href": "https://region-a.geo-1.database.hpcloudsvc.com/v1.0/38728063898723/configurations/40e0909a-0ca8-4864-952a-109edc886049",
	                    "rel": "self"
	                },
	                {
	                    "href": "https://region-a.geo-1.database.hpcloudsvc.com/configurations/40e0909a-0ca8-4864-952a-109edc886049",
	                    "rel": "bookmark"
	                }
	            ],
	            "name": "staging_config_group"
	        },
	        "datastore": {
	            "version": "5.5",
	            "type": "mysql"
	        }
	    }
	}

**Curl Example**

    curl -i -k -X POST -H "Content-Type: application/json" -H "X-Auth-Token: {Auth_Token}" -d '{"instance": {"restorePoint": {"backupRef": "85f0b573-7b8c-44a2-83b0-b13b2e730298"}, "flavorRef": "1002", "configuration": "40e0909a-0ca8-4864-952a-109edc886049", "name": "restored_from_backup", "datastore": {"type": "ab9b396f-9095-436f-903d-e302ff1a52f9"}}}' {BaseURI}/instances

##### 4.5.8.6 Delete a backup {#backup_delete}
##### DELETE /backups/{backup_id}

Deletes the backup specified by {backup_id}

**Request Data**

This call does not require a request body

**Success Response**

**Status Code**

204 - No Content

**Response Data**

Empty Response Body

**Curl Example**

    curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/backups/{backup_id}

#### 4.5.9 Version Operations {#version_resource}
##### 4.5.9.1 List all API versions {#version_list}
##### GET /

Returns a list of all API versions
This call does not require a request body

**Success Response**

**Status Code**

200 or 204

**Response Data**

    {
       "versions": [
       {
          "id": "v1.0",
          "status": "CURRENT",
          "updated": "2012-09-25T00:00:00Z",
          "links" : [
            {
              "href": "https://region-a.geo-1.database.hpcloudsvc.com/v1.0",
              "rel": "self"
            }
           ]
       }]
    }

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}

##### 4.5.9.2 Get a specific version {#version_get}
##### GET /{version_id}

Get a specific version specified by *version_id*

**Request Data**

This call does not require a request body

**Success Response**

**Status Code**

200 - OK

**Response Data**

    {
       "version": {
          "id": "v1.0",
          "status": "CURRENT",
          "updated": "2012-09-25T00:00:00Z",
          "links" : [
            {
              "href": "https://region-a.geo-1.database.hpcloudsvc.com/v1.0",
              "rel": "self"
            }
           ]
       }
    }

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/{version_id}

#### 4.5.10 Datastore Operations {#ds_resource}

Only GET operation is supported at this time. Datastore names, id, version name, version id cannot be modified or deleted. 

##### 4.5.10.1 List all datastores {#ds_list}
##### GET /datastores

List all datastores, with the name and id shown for each datastore

**Request Data**

This call does not require a request body

**Success Response**

**Status Code**

200 - OK 

**Response Data**

    {
        "datastores": [
            {
                "id": "ab02955a-2ae6-42fa-82bd-66f01b9a292c",
                "links": [
                    {
                        "href": "https://15.125.4.51:8779/v1.0/38355481723476/datastores/ab02955a-2ae6-42fa-82bd-66f01b9a292c",
                        "rel": "self"
                    },
                    {
                        "href": "https://15.125.4.51:8779/datastores/ab02955a-2ae6-42fa-82bd-66f01b9a292c",
                        "rel": "bookmark"
                    }
                ],
                "name": "mysql"
            }
        ]
    }

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/datastores
  
##### 4.5.10.2 Get a specific datastore {#ds_get}
##### GET /datastores/{datastore_id}

Returns a specific datastore speicified by {datastore_id}

**Request Data**

This call does not require a request body

**Success Response**

**Status Code**

200 - OK 

**Response Data**

    {
        "datastore": {
            "id": "ab02955a-2ae6-42fa-82bd-66f01b9a292c",
            "links": [
                {
                    "href": "https://15.125.4.51:8779/v1.0/38355481723476/datastores/ab02955a-2ae6-42fa-82bd-66f01b9a292c",
                    "rel": "self"
                },
                {
                    "href": "https://15.125.4.51:8779/datastores/ab02955a-2ae6-42fa-82bd-66f01b9a292c",
                    "rel": "bookmark"
                }
            ],
            "name": "mysql"
        }
    }

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/datastores/{datastore_id}
  
##### 4.5.10.3 List all version for a datastore {#ds_version_list}
##### GET /datastores/{datastore_name}/versions

List all versions for a specific datastores, specified by {datastore_name}

**Request Data**

This call does not require a request body

**Success Response**

**Status Code**

200 - OK 

**Response Data**

    {
        "versions": [
            {
                "id": "b94005a7-52e2-4748-860c-3492c233f9a3",
                "links": [
                    {
                        "href": "https://15.125.4.51:8779/v1.0/38355481723476/datastores/versions/b94005a7-52e2-4748-860c-3492c233f9a3",
                        "rel": "self"
                    },
                    {
                        "href": "https://15.125.4.51:8779/datastores/versions/b94005a7-52e2-4748-860c-3492c233f9a3",
                        "rel": "bookmark"
                    }
                ],
                "name": "5.5"
            }
        ]
    }

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/datastores/{datastore_name}/versions
  
##### 4.5.10.4 Get a specific version for a datastore {#ds_version_get}
##### GET /datastores/{datastore_name}/versions/{version_id}

List a specific version for a specific datastores, specified by {datastore_name} and *version_id*

**Request Data**

This call does not require a request body

**Success Response**

**Status Code**

200 - OK 

**Response Data**

        {
            "version": {
                "id": "b94005a7-52e2-4748-860c-3492c233f9a3",
                "links": [
                    {
                        "href": "https://15.125.4.51:8779/v1.0/38355481723476/datastores/versions/b94005a7-52e2-4748-860c-3492c233f9a3",
                        "rel": "self"
                    },
                    {
                        "href": "https://15.125.4.51:8779/datastores/versions/b94005a7-52e2-4748-860c-3492c233f9a3",
                        "rel": "bookmark"
                    }
                ],
                "name": "5.5"
            }
        }

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/datastores/{datastore_name}/versions/{version_id}

#### 4.5.11 Configuration Operations {#cg_resource}

A configuration group is a collection of settings that can be saved and applied to one or more database instances.

A configuration group consists or one or more configuration parameters, which represent options that can be applied to a datastore (the database running in an instance). For example, a configuration group could have a configuration parameter of *max_connections* set to 80, or could set the default time zone for the instance with the *default_time_zone* parameter.

##### 4.5.11.1 List all configuration groups {#cg_list}
##### GET /configurations

List all configuration groups

**Request Data**

This call does not require a request body

**Success Response**

**Status Code**

200 - OK 

**Response Data**

    {
        "configurations": [
            {
                "description": "sample configuration group",
                "id": "62303a89-1ad3-493e-9664-5590cd0bd72c",
                "datastore_version_id": "b94005a7-52e2-4748-860c-3492c233f9a3",
                "name": "my_config_group_1"
            }
        ]
    }

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/configurations
    

##### 4.5.11.2 Create configuration group {#cg_create}
##### POST /configurations

Create a new configuration group

**Request Data**

    {
        "configuration": {
            "datastore": {
                "type": "a00000a0-00a0-0a00-00a0-000a000000aa", 
                "version": "b00000b0-00b0-0b00-00b0-000b000000bb"
            }, 
            "description": "sample description", 
            "name": "sample-configuration-name", 
            "values": {
                "max_connections": 50, 
                "connect_timeout": 600
            }
        }
    }
    

**Success Response**

201 - CREATED

**Status Code**

200 - OK 

**Response Data**

    {
        "configuration": {
            "datastore_version_id": "b00000b0-00b0-0b00-00b0-000b000000bb", 
            "description": "sample description", 
            "id": "b01a233a-d17e-4603-ae3b-eb19660dbd2e", 
            "name": "sample-configuration-name", 
            "values": {
                "max_connections": 50, 
                "connect_timeout": 600
            }
        }
    }

**Curl Example**

    curl -i -k -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/configurations -d '{"configuration": {"datastore": {"type": "ab9b396f-9095-436f-903d-e302ff1a52f9"}, "values": {"connect_timeout": 600, "max_connections": 20}, "name": "sample-configuration"}}'

##### 4.5.11.3 Get details for a configuration group {#cg_get}
##### GET /configurations/{configId}

Get details for a specific configuration group.

**Request Data**

This call does not require a request body

**Success Response**

**Status Code**

200 - OK 

**Response Data**

    {
        "configuration": {
            "description": null,
            "values": {
                "connect_timeout": 600,
                "max_connections": 20
            },
            "id": "40e0909a-0ca8-4864-952a-109edc886049",
            "datastore_version_id": "c77e3e21-29c5-43f8-9abd-caa438ea252b",
            "name": "sample-configuration"
        }
    }

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/configurations/{configId}
    
    

##### 4.5.11.4 Update some parameters within a configuration group {#cg_patch}
##### PATCH /configurations/{configId}

Updates ome of the parameters in a configuration group.

**Request Data**

    {
        "configuration": {
            "values": {
                "max_connections": 1024
            }
        }
    }
    

**Success Response**
200 - OK

**Status Code**

200 - OK 

**Response Data**

None.

**Curl Example**

    curl -i -k -X PATCH -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/configurations/{configId} -d '{"configuration": {"values": {"max_connections": 1024}}}'
    

##### 4.5.11.5 Replace parameters within a configuration group {#cg_put}
##### PUT /configurations/{configId}

Replaces all parameters within a configuration group.

**Request Data**

    {
        "configuration": {
            "values": {
                "innodb_log_buffer_size": 10485760,
                "max_connections": 90
            },
            "name": "new_name_config_group"
        }
    }
    

**Success Response**
202 - ACCEPTED

**Status Code**

200 - OK 

**Response Data**

None.

**Curl Example**

    curl -i -k -X PUT -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/configurations/{configId} -d '{"configuration": {"values": {"innodb_log_buffer_size": 10485760, "max_connections": 90}, "name": "new_name_config_group"}}'

##### 4.5.11.6 Delete a configuration group {#cg_delete}
##### DELETE /configurations/{configId}

Delete a configuration group, that is not currently attached to running database instances.

**Request Data**

No request data required.
    
**Success Response**

202 - ACCEPTED

**Status Code**

200 - OK 

**Response Data**

None.

**Curl Example**

    curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/configurations/{configId}

##### 4.5.11.7 List instances associated with a configuration group {#cg_associated}
##### DELETE /configurations/{configId}/instances

List all instances that are associated with a specific configuration group.

**Request Data**

No request data required.
    
**Success Response**

200 - OK

**Status Code**

200 - OK 

**Response Data**

    {
        "instances": [
            {
                "id": "7810b896-5fe8-406c-8676-e0a7941ec859",
                "name": "instance-123"
            }
        ]
    }

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/configurations/{configId}/instances

#### 4.5.12 Configuration Parameter Operations {#cp_resource}

Configuration Parameters are settings that can be changed for a datastore.  

Configuration parameters should be used to make up the values within Configuration, which can be associated with one or more instances. 

##### 4.5.12.1 List all configuration parameters {#cp_list}
##### GET /datastores/{datastoreId}/versions/{versionId}/parameters

List all parameters that can be configured for a given datastore version.  These parameters can be toggled within a Configuration resource and attached to an instance.

**Request Data**

This call does not require a request body

**Success Response**

**Status Code**

200 - OK 

**Response Data**

    {
        "configuration-parameters": [
            {
                "max": 1,
                "min": 0,
                "type": "integer",
                "name": "autocommit",
                "restart_required": false
            },
            {
                "max": 4294967296,
                "min": 0,
                "type": "integer",
                "name": "key_buffer_size",
                "restart_required": false
            },
            {
                "max": 65535,
                "min": 1,
                "type": "integer",
                "name": "connect_timeout",
                "restart_required": false
            },
            {
                "max": 4294967296,
                "min": 0,
                "type": "integer",
                "name": "join_buffer_size",
                "restart_required": false
            },
            {
                "max": 18446744073709548000,
                "min": 32768,
                "type": "integer",
                "name": "sort_buffer_size",
                "restart_required": false
            },
            {
                "max": 68719476736,
                "min": 0,
                "type": "integer",
                "name": "innodb_buffer_pool_size",
                "restart_required": true
            },
            {
                "max": 2,
                "min": 0,
                "type": "integer",
                "name": "innodb_flush_log_at_trx_commit",
                "restart_required": false
            },
            {
                "max": 4294967296,
                "min": 1048576,
                "type": "integer",
                "name": "innodb_log_buffer_size",
                "restart_required": true
            },
            {
                "max": 4294967296,
                "min": 10,
                "type": "integer",
                "name": "innodb_open_files",
                "restart_required": true
            },
            {
                "max": 1000,
                "min": 0,
                "type": "integer",
                "name": "innodb_thread_concurrency",
                "restart_required": false
            },
            {
                "max": 65535,
                "min": 1,
                "type": "integer",
                "name": "auto_increment_increment",
                "restart_required": false
            },
            {
                "max": 65535,
                "min": 1,
                "type": "integer",
                "name": "auto_increment_offset",
                "restart_required": false
            },
            {
                "max": 18446744073709548000,
                "min": 0,
                "type": "integer",
                "name": "bulk_insert_buffer_size",
                "restart_required": false
            },
            {
                "max": 65535,
                "min": 1,
                "type": "integer",
                "name": "expire_logs_days",
                "restart_required": false
            },
            {
                "max": 65535,
                "min": 1,
                "type": "integer",
                "name": "interactive_timeout",
                "restart_required": false
            },
            {
                "max": 1073741824,
                "min": 1024,
                "type": "integer",
                "name": "max_allowed_packet",
                "restart_required": false
            },
            {
                "max": 18446744073709548000,
                "min": 1,
                "type": "integer",
                "name": "max_connect_errors",
                "restart_required": false
            },
            {
                "max": 65535,
                "min": 1,
                "type": "integer",
                "name": "max_connections",
                "restart_required": false
            },
            {
                "max": 18446744073709548000,
                "min": 4,
                "type": "integer",
                "name": "myisam_sort_buffer_size",
                "restart_required": false
            },
            {
                "max": 100000,
                "min": 1,
                "type": "integer",
                "name": "max_user_connections",
                "restart_required": false
            },
            {
                "max": 31536000,
                "min": 1,
                "type": "integer",
                "name": "wait_timeout",
                "restart_required": false
            }
        ]
    }

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/datastores/{datastoreId}/versions/{versionId}/parameters
    

##### 4.5.12.1 Get details for a configuration parameter {#cp_get}
##### GET /datastores/{datastoreId}/versions/{versionId}/parameters/{parameterId}

Get details about configuration parameter

**Note:** any configuration parameter with *restart_required=true* will not be applied until a restart of the instance is performed.

**Request Data**

This call does not require a request body

**Success Response**

**Status Code**

200 - OK 

**Response Data**

    {
        "max": 65535,
        "min": 1,
        "type": "integer",
        "name": "auto_increment_increment",
        "restart_required": false
    }

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/datastores/{datastoreId}/versions/{versionId}/parameters/auto_increment_increment
    

---
