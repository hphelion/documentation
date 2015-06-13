---
layout: page
permalink: /publiccloud/api/identity/
title: "HP Helion Public Cloud Identity Services v3 API"
description: "HP Helion Public Cloud v3 Identity Services API documentation."
keywords: "Keystone, Identity Services"
product: identity

---
<!--PUBLISHED-->
# HP Helion Public Cloud Identity Services v3 API

*If you are using the v2 Identity Services API, click [here for those API references](/publiccloud/api/v2identity/).*

Date: May 2014

Document Revision: 1.9

## 1. Overview

The HP Helion Identity Service exposes the OpenStack Keystone V3 API specification. Specifically, it supports token and credential based operations. A few things to note about the HP Identity Service are:

 * Token created via v2 API can be validated via v3 API
 * Token created via v3 API can be validated via v2 API.
 * v3 token can be created via HP User access key pair.
 * HP Helion Identity service will return a service catalog upon token response that only includes services and endpoints for which the token may be used.
 * Support for request and response in xml format.
 * Introduction of rate limiting.

We will be referring to HP Helion Public Cloud Identity Services in this document as simply Identity or the Identity service.

### 1.1 API Maturity Level

**Maturity Level**: GA

**Version API Status**: CURRENT

### 1.2 Document Revision History ###

|Document Version|Date            |Description|
|:--------       | :------------  | :------ |
| 1.0 | February 2013 |Initial creation|
| 1.1 | March 2013 |Submitted changes for Token, Project API documentation. |
| 1.2 | April 2013 |Submitted changes for Version and updates for Token and Project API documentation.|
| 1.3 | May 2013 |Submitted updates to Token, Version and Project API documentation. |
| 1.4 | June 2013 |Credential API is made public. |
| 1.5 | October 2013 |Submitted updates to Token API documentation. |
| 1.6 | December 2013 |Submitted updates to Credential API documentation. |
| 1.7 | February 2014 |Submitted updates to Project API documentation. |
| 1.8 | April 2014 |Submitted updates for Token API documentation. |
| 1.9 | May 2014 | HP Helion updates |
 
## 2. Account-level View

### 2.1 Accounts
Each user has an account. Every user belongs to a single domain. Groups can be used to group users. Projects are resource collections and user is assoicated with one or more projects via roles. The terms 'project' and 'tenant' are used interchangeably.

### 2.2 Regions and Availability Zones

The Identity Service is currently available in two regions which can be accessed via standard RESTful clients. As HP Helion Public Cloud accounts are global, either region can be used for conducting identity operations. Choose the region closest to you for improved performance.

US-West: https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/

US-East: https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/

**Region(s)**: US-West(region-a.geo-1), US-East(region-b.geo-1)

### 2.3 Service Catalog

The service catalog provides the service information with its region specific endpoints. Returned service endpoint depends on token scoping and user roles associated with a project. The interface in endpoint data indicates if that endpoint is in public, beta or preview release state.

The service catalog is returned as part of create and validate token operations. When an unscoped token is requested, the service catalog contains only global service endpoints ( e.g. identity). When a project scoped token is requested, the service catalog contains the services and endpoints for which the token may be used when interacting. If a service or endpoint is not present in the service catalog, it typically means that either the service has not been activated or the user does not have the appropriate roles defined that grant them access for the service on the given project

    {
    "catalog":[
         {
            "type":"identity",
            "id":"100",
            "otherAttributes":{
            },
            "endpoints":[
               {
                  "links":{
                     "self":"https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/130_P"
                  },
                  "id":"130_P",
                  "interface":"public",
                  "region":"region-a.geo-1",
                  "url":"https://hostname:35357/v2.0/",
                  "service_Id":"100",
                  "otherAttributes":{
                  }
               },
               {
                  "links":{
                     "self":"https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/131_P"
                  },
                  "id":"131_P",
                  "interface":"public",
                  "region":"region-a.geo-1",
                  "url":"https://hostname:35357/v3/",
                  "service_Id":"100",
                  "otherAttributes":{
                  }
               }
            ]
         }
    ]
    }

## 3. REST API Specifications
### 3.1 Service API Operations

**Host**: https://region-a.geo-1.identity.hpcloudsvc.com:35357

**BaseUri**: {Host}/v3

**Admin URI**: N/A

| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? |
| :------- | :------------------- | :---------- | :--------------------- | :---------------- |
| Credentials | [Create Or Import Credential](#create_or_import_credential) | POST | /credentials | Y/Y |
| Credentials | [List Credentials](#list_credentials) | GET | /credentials | Y/Y |
| Credentials | [Delete A Credential](#delete_a_credential) | DELETE | /credentials/{credential_id} | Y/Y |
| Credentials | [Get A Credential](#get_a_credential) | GET | /credentials/{credential_id} | Y/Y |
| Credentials | [Update A Credential](#update_a_credential) | PATCH | /credentials/{credential_id} | Y/Y |
| Projects | [List User Projects](#list_user_projects) | GET | /users/{user_id}/projects | Y/Y |
| Projects | [Get Project](#get_project) | GET | /projects/{project_id} | Y/Y |
| Tokens | [Authenticate](#authenticate) | POST | /v3/auth/tokens | Y/Y |
| Tokens | [Rescope Token](#rescope_token) | POST | /v3/auth/tokens | Y/Y |
| Tokens | [Revoke Token](#revoke_token) | DELETE | /v3/auth/tokens | Y/Y |
| Versions | [List Versions](#list_versions) | GET | / | Y/Y |

### 3.2 Common Request Headers

1. Content-Type : Denotes the request content type.  Supported Content-Types are  application/xml and application/json
2. Accept : Denotes the response content type that the caller can understand.  Supported Content-Types are application/xml and application/json. Default type is application/json
3. X-Auth-Token : Contains authentication token of the user who is invoking the REST API 
4. X-Subject-Token : This is used only in token operations. Token operations such as DELETE/HEAD/GET are done against the value in this header

### 3.3 Common Response Headers

1. Content-Type : Denotes the response content type.  Supported Content-Types are application/xml and application/json.
2. X-Subject-Token : This is used only in token operations. Users token is returned via this header

### 3.4 Service API Operation Details
#### 3.4.1 Credentials

Credentials are user authentication credentials. A user may have up to three (3) active credentials at a time. An HTTP code 403 will be returned if an operation (i.e. create/import/update) will exceed the maximum number of active credentials.

Credential consist of the following fields:

| Attribute | Type | Description |
| :---------| :----| :-----------|
| id | string | credential ID |
| user_id | string | user ID of the user who ownes of the credential |
| type | string | credential type |
| blob | string | credential data |

The Identity service supports credential type `HP-IDM:access-key`.

`blob` is a string-encoded JavaScript Object Notation (JSON) object with the following members:

| Name | Type | Description |
| :----| :----| :-----------|
| access | string | access key ID |
| secret | string | secret key. Base64 encoded. |
| algorithm | string | key algorithm. Value is one of (HmacSHA1, HmacSHA224, HmacSHA256). |
| key_length | integer | key size, in bits, depending on the key algorithm. Minimum length is 64, and maximum length is 512. Default lenght is 240. |
| created_on | string | creation date. Format is ISO8601 date with micro second precision. |
| domain_id | string | domain ID |
| status | string | key status. Value is one of (active, inactive, expired, revoked, deleted, purged). |
| valid_from | integer | validity start date. Format is ISO8601 date with micro second precision. |
| valid_to | integer | validity end date. Format is ISO8601 date with micro second precision. |

For example,

    {  
        "credential": {  
            "blob": "{\"access\":\"KAKH35XE76JSE196XE4R\",\"secret\":\"Yi2KML9ODCflkyLPfJ8fgITsjOsmTSC5fXMqmLca\",\"algorithm\":\"HmacSHA1\",\"key_length\":240,\"created_on\":\"2012-09-20T19:51:28.000278Z\",\"domain_id\":\"91641150119921\",\"status\":\"active\",\"valid_from\":\"2012-09-20T19:51:28.000000Z\",\"valid_to\":\"2022-09-18T19:51:28.000000Z\"}",   
            "id": "KAKH35XE76JSE196XE4R",   
            "links": {  
                "self": "https://localhost:35357/v3/credentials/KAKH35XE76JSE196XE4R"  
            },   
            "otherAttributes": {},   
            "type": "HP-IDM:access-key",   
            "user_id": "36968991407691"  
        }  
    }  

The Identity service supports the following key status:

| Key Status | Meaning |
| :----------| :-------|
| active | the give key is enabled and ready to use |
| inactive | the given key is disabled. The status must be updated to active before it can be used. |
| expired | the given key has expired and cannot be used again |
| revoked | the given key has been revoked and cannot be used again |
| deleted | the given key has been deleted and cannot be used again |
| purged | the given key has been permanently deleted |

*Note:*   
Status ``expired``, ``revoked``, ``deleted``, and ``purged`` are generated by
the system and therefore immutable. They cannot be updated by the client.

By default, key validity is 10 years.

**Differences Between Identity service and OpenStack Keystone**

The Identity service does not support credential type `ec2`. Instead, it supports credential type `HP-IDM:access-key` with additional functionalities. Identity service access keys can be used to perform EC2 operations.

The Identity service allows maximum of three (3) active credentials at any given time. OpenStack Keystone has no limit on the number of credential a user can own. When listing credentials, you may use `status` query parameter to list the active credentials only. i.e. `status=active`. Otherwise, all credentials are returned. An HTTP code 403 will be returned if an operation (i.e. create/import/update) will exceed the maximum number of active credentials.

OpenStack Keystone supports optionally scoping a credential to a project by providing an `project_id` field. The Identity service does not support project scoping. If `project_id` is present during credential creation/import, it will be ignored.

The Identity service will enforce key length during import. If the given `secret` field is less than the minimum 64 bits or greater than the maximum of 512 bits, an HTTP code 400 will be returned.

The Identity service supports both credential creation and credential import while OpenStack Keystone only supports credential import. Credential creation is a mechanism to have the system to generate the credential on behalf of the user.

The Identity service supports self-service model for credential import and creation while OpenStack Keystone does not. For self-service model, `user_id` is optional. If absent, it will be default to the user ID associated with the caller`s token.

**Status Lifecycle**

N/A

**Rate Limits**

| Operation | Rate Limit per second | Rate Limited By | Path |
| :---------| :---------------------| :---------------| :----|
| Create credential | 20 | X-Auth-Token in request header | /v3/credentials |
| Delete a credential | 20 | X-Auth-Token in request header | /v3/credentials/{credentialId} |
| Get a credential | 50 | X-Auth-Token in request header | /v3/credentials/{credentialId} |
| Import credential | 20 | X-Auth-Token in request header | /v3/credentials |
| Update credential status | 20 | X-Auth-Token in request header | /v3/credentials/{credentialId} |

*Note:*   
If a request is invalid (doesn't present the required headers or credentials), the request is rate limited by the source IP Address using same limits in the table above

If the limit is exceeded, the request will be failed with following message:

JSON

    {  
     "TooManyRequests":  
      {  
       "message": "This request was rate-limited",  
       "code": 429,  
       "details": "Exceeded the number of requests that can be made to {PATH} per SECOND"  
      }  
    }  
    

XML

    <TooManyRequests>  
         <message>This request was rate-limited</message>  
         <code>429</code>  
         <details>Exceeded the number of requests that can be made to {PATH} per SECOND</details>  
    </TooManyRequests>  

In addition, a response header "RetryAfter" will be returned with value specifying the seconds after which a retry could be attempted

**Quota Limits**

N/A

**Business Rules**

None.

##### 3.4.1.1 Create Or Import Credential ##### {#create_or_import_credential}
##### POST /credentials

This API can be utilized to either generate or import a credential for the user.

**Request Data**

Caller must specify `type`. Optionally, caller may specify the `secret` and its required members in the `blob` to import a credential. If `secret` is absent, the system will generate a credential for the given user.

`user_id` is optional. If absent, it will be default to the user ID associated with the caller`s token.

`secret` must be the base64 encoding of the secret key. Secret key must be at least 64 bits and cannot exceed 512 bits. Otherwise, an HTTP code 400 will be returned.

if `blob` is absent, or it does not contain the `secret` member, a 240 bit secret will be generated and returned to the caller.

`access` is optional for credential creation. If `access` member is absent, one will be generated and returned to the caller. For credential import, `access` is required. If absent, an HTTP code 400 will be returned.

`domain_id`, `access`, `key_length`, `status`, `valid_from`, and `valid_to` are optional are optional for credential creation. However, `status` must be present whenever `blob` is present.

`access`, `status`, `algorithm`, and `secret` are required for credential import.

User may elect to have the system generate the key by supplying the key parameters, which are `algorithm` and `key_length`, in the `blob` field.

Supported algorithms are `HmacSHA1`, `HmacSHA224`, and `HmacSHA256`.

`key_length` must be at least 64 and no more than 512. If absent, it will be default to 240. On credential creation, if `key_length` is less than 64, credential will be generated with the default key length, which is 240.

**URL Parameters**

There are no URL parameters for this operation.

**Data Parameters**

See schema file for more details on the request and response data structure.

* *type* - String - credential type. Must be `HP-IDM:access-key`.
* *user_id* (optional) - String - user ID of the user who owns the credential. If absent, it will be default to the caller`s user ID.
* *blob* (Optional) - Blob - credential data

A valid token must be present in the *X-Auth-Token* HTTP header. Otherwise, an HTTP code 401 will be returned.

JSON

To import a `HP-IDM:access-key` credential.

    POST https://localhost:35357/v3/credentials HTTP/1.1  
    Accept: application/json  
    Content-Type: application/json  
    X-Auth-Token: HPAuth_4e7b748be4b0600fec3d2a24  
    
    { "credential": {  
        "user_id": "0000ABCDEFG",  
        "type": "HP-IDM:access-key",  
        "blob": "{  
            \"access\": \"pXmYG556MjD\",  
            \"secret\": \"pXmYG556MjDgSEVSer2SD67SGHhac798SVwSAT15\",  
            \"algorithm\": \"HmacSHA1\",  
            \"key_length\": 240,  
            \"status\": \"active\"  
        }"  
    }}  

To create a `HP-IDM:access-key` credential.

    POST https://localhost:35357/v3/credentials HTTP/1.1  
    Accept: application/json  
    Content-Type: application/json  
    X-Auth-Token: HPAuth_4e7b748be4b0600fec3d2a24  
    
    { "credential": {  
        "user_id": "0000ABCDEFG",  
        "type": "HP-IDM:access-key"  
    }}  

To create a `HP-IDM:access-key` credential with specific key length.

    POST https://localhost:35357/v3/credentials HTTP/1.1  
    Accept: application/json  
    Content-Type: application/json  
    X-Auth-Token: HPAuth_4e7b748be4b0600fec3d2a24  
    
    { "credential": {  
        "user_id": "0000ABCDEFG",  
        "type": "HP-IDM:access-key",  
        "blob": "{  
            \"algorithm\" : \"HmacSHA1\",  
            \"keyLength\" : 400,  
            \"status\" : \"active\"  
        }"  
    }}  

XML

To create a `HP-IDM:access-key` credential.

    POST https://localhost:35357/v3/credentials HTTP/1.1  
    Accept: application/xml  
    Content-Type: application/xml  
    X-Auth-Token: HPAuth_4e7b748be4b0600fec3d2a24  
    
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>  
    <ns2:credential xmlns="http://www.w3.org/2005/Atom" xmlns:ns2="http://docs.openstack.org/identity/api/v3" xmlns:ns3="http://docs.openstack.org/common/api/v1.0" id="KAKH35XE76JSE196XE4R" user_id="36968991407691" type="HP-IDM:access-key">   
    </ns2:credential>  

**Success Response**

**Status Code**

201 - Created

**Response Data**

JSON

    HTTP/1.1 201 Created  
    Content-Type: application/json  
    
    {  
        "credential": {  
            "blob": "{\"access\":\"KAKH35XE76JSE196XE4R\",\"secret\":\"Yi2KML9ODCflkyLPfJ8fgITsjOsmTSC5fXMqmLca\",\"algorithm\":\"HmacSHA1\",\"key_length\":240,\"created_on\":\"2012-09-20T19:51:28.000278Z\",\"domain_id\":\"91641150119921\",\"status\":\"active\",\"valid_from\":\"2012-09-20T19:51:28.000000Z\",\"valid_to\":\"2022-09-18T19:51:28.000000Z\"}",   
            "id": "KAKH35XE76JSE196XE4R",   
            "links": {  
                "self": "https://localhost:35357/v3/credentials/KAKH35XE76JSE196XE4R"  
            },   
            "otherAttributes": {},   
            "type": "HP-IDM:access-key",   
            "user_id": "36968991407691"  
        }  
    }  

XML

    HTTP/1.1 201 Created  
    Content-Type: application/xml  
    
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>  
    <ns2:credential xmlns="http://www.w3.org/2005/Atom" xmlns:ns2="http://docs.openstack.org/identity/api/v3" xmlns:ns3="http://docs.openstack.org/common/api/v1.0" id="KAKH35XE76JSE196XE4R" user_id="36968991407691" type="HP-IDM:access-key" blob="{&quot;access&quot;:&quot;KAKH35XE76JSE196XE4R&quot;,&quot;secret&quot;:&quot;Yi2KML9ODCflkyLPfJ8fgITsjOsmTSC5fXMqmLca&quot;,&quot;algorithm&quot;:&quot;HmacSHA1&quot;,&quot;key_length&quot;:240,&quot;created_on&quot;:&quot;2012-09-20T19:51:28.000278Z&quot;,&quot;domain_id&quot;:&quot;91641150119921&quot;,&quot;status&quot;:&quot;active&quot;,&quot;valid_from&quot;:&quot;2012-09-20T19:51:28.000000Z&quot;,&quot;valid_to&quot;:&quot;2022-09-18T19:51:28.000000Z&quot;}">  
      <ns2:links>  
        <link rel="self" href="https://localhost:35357/v3/credentials/KAKH35XE76JSE196XE4R"/>  
      </ns2:links>  
    </ns2:credential>  

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body |
| 401 | Unauthorized | This status code is returned when either authentication has not been performed, the provided X-Auth-Token is invalid or authentication credentials are invalid (including the user, project or domain having been disabled). |
| 403 | Forbidden | The result of the operation will exceed the maximum number of active credentials. This status code is also returned when the request is successfully authenticated but not authorized to perform the requested action. |
| 500 | Internal Server Error | The server encountered a problem while processing the request  |
| 503 | Service Unavailable | The server is unavailable to process the request  |
| 429 | TooManyRequests | The request was rate limited. Please refer to the Rate Limits section for various limits |

**Response Data**

JSON

    {  
      "unauthorized" : {  
        "code" : 401,  
        "details" : "Invalid credentials",  
        "message" : "UNAUTHORIZED",  
        "otherAttributes" : {  
        }  
      }  
    }  

XML

    <?xml version="1.0" encoding="UTF-8" standalone="yes"?><unauthorized xmlns="http://docs.openstack.org/identity/api/v3" xmlns:ns2="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" xmlns:ns3="http://docs.openstack.org/common/api/v1.0" xmlns:ns4="http://www.w3.org/2005/Atom" code="401"><message>UNAUTHORIZED</message><details>Invalid credentials</details></unauthorized>  

**Curl Example**

To generate a `HP-IDM:access-key` credential:

    curl -k -X POST -H "X-Auth-Token: HPAuth_1661578e273d107d38b732849173e00d0a60d46d9bc279bee31565fd39be48a8" -H "Content-Type: application/json" -H "Accept: application/json" "https://localhost:8443/v3/credentials" -d '{  
    "credential": {  
        "type": "HP-IDM:access-key"  
    }}'  

##### 3.4.1.2 List Credentials ##### {#list_credentials}
##### GET /credentials

This API returns a list of selected user credentials.

**Request Data**

This API supports pagination. See Pagination for more details.

**URL Parameters**

The following query parameters applicable to all credentials types:

* *page* (Optional) - integer - page number
* *per_page* (Optional) - integer - represents the maximum number of elements which will be returned in the request. Default is 100.
* *type* (Optiona) - string - credential type. Select credentials matching the given type for the given user. Default is `HP-IDM:access-key`.
* *user_id* (Optional) - string - user ID. Selects credentials with matching user ID. If not specified the user ID of the requester is used.
* *domain_id* (Optional) - string - domain ID. Select credentials scoped to the given domain ID.
* *status* (Optional) - string - Key status. Selects keys with matching status. Value is one of (active, inactive, expired, revoked, deleted, purged).

**Data Parameters**

See schema file for more details on the request and response data structure.

A valid token must be presented in the *X-Auth-Token* HTTP header. Otherwise, an HTTP code 401 will be returned.

This call does not require a request body.

JSON

    GET /v3/credentials HTTP/1.1  
    Accept: application/json  
    X-Auth-Token: HPAuth_4e56db8d2cdce58d662fb351  

XML

    GET /v3/credentials HTTP/1.1  
    Accept: application/xml  
    X-Auth-Token: HPAuth_4e56db8d2cdce58d662fb351  

Optional:

JSON

With pagination.

    GET /v3/credentials?page=2&per_page=10 HTTP/1.1  
    Accept: application/json  
    X-Auth-Token: HPAuth_4e56db8d2cdce58d662fb351  

Filtered by User ID.

    GET /v3/credentials?user_id=DX4SRWF12&per_page=10 HTTP/1.1  
    Accept: application/json  
    X-Auth-Token: HPAuth_4e56db8d2cdce58d662fb351  

XML

With pagination.

    GET /v3/credentials?page=2&per_page=30 HTTP/1.1  
    Accept: application/xml  
    X-Auth-Token: HPAuth_4e56db8d2cdce58d662fb351  

Filtered by User ID.

    GET /v3/credentials?user_id=DX4SRWF12&per_page=10 HTTP/1.1  
    Accept: application/xml  
    X-Auth-Token: HPAuth_4e56db8d2cdce58d662fb351  

**Success Response**

**Status Code**

200 - OK

**Response Data**

JSON

    HTTP/1.1 200 OK  
    Content-Type: application/json  
    
    {  
        "credentials": [  
            {  
                "blob": "{\"access\":\"KAKH35XE76JSE196XE4R\",\"secret\":\"Yi2KML9ODCflkyLPfJ8fgITsjOsmTSC5fXMqmLca\",\"algorithm\":\"HmacSHA1\",\"key_length\":240,\"created_on\":\"2012-09-20T19:51:28.000278Z\",\"domain_id\":\"91641150119921\",\"status\":\"active\",\"valid_from\":\"2012-09-20T19:51:28.000000Z\",\"valid_to\":\"2022-09-18T19:51:28.000000Z\"}",   
                "id": "KAKH35XE76JSE196XE4R",   
                "links": {  
                    "self": "https://localhost:35357/v3/credentials/KAKH35XE76JSE196XE4R"  
                },   
                "otherattributes": {},   
                "type": "HP-IDM:access-key",   
                "user_id": "36968991407691"  
            },   
            {  
                "blob": "{\"access\":\"31890119180371:KAKH35XE76JSE116XE4T\",\"secret\":\"Yi2KML9ODCflkyLPfJ8fgITsjOsmTSC6fXMqmLcd\",\"algorithm\":\"HmacSHA1\",\"key_length\":240,\"created_on\":\"2012-10-01T23:39:50.000337Z\",\"domain_id\":\"91641150119921\",\"status\":\"active\",\"valid_from\":\"2012-09-20T19:51:28.000000Z\",\"valid_to\":\"2022-09-18T19:51:28.000000Z\"}",   
                "id": "31890119180371:KAKH35XE76JSE116XE4T",   
                "links": {  
                    "self": "https://localhost:35357/v3/credentials/31890119180371:KAKH35XE76JSE116XE4T"  
                },   
                "otherattributes": {},   
                "type": "HP-IDM:access-key",   
                "user_id": "36968991407691"  
            }  
        ],   
        "links": {  
            "first": "https://localhost:35357/v3/credentials?page=1&per_page=30?user_id=36968991407691&status=active",   
            "last": "https://localhost:35357/v3/credentials?page=0&per_page=30?user_id=36968991407691&status=active",   
            "self": "https://localhost:35357/v3/credentials?page=1&per_page=30?user_id=36968991407691&status=active"  
        }  
    }  

XML

    HTTP/1.1 200 OK  
    Content-Type: application/xml  
    
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>  
    <ns2:credentials xmlns="http://www.w3.org/2005/Atom" xmlns:ns2="http://docs.openstack.org/identity/api/v3" xmlns:ns3="http://docs.openstack.org/common/api/v1.0">  
      <ns2:credential id="KAKH35XE76JSE196XE4R" user_id="36968991407691" type="HP-IDM:access-key" blob="{&quot;access&quot;:&quot;KAKH35XE76JSE196XE4R&quot;,&quot;secret&quot;:&quot;Yi2KML9ODCflkyLPfJ8fgITsjOsmTSC5fXMqmLca&quot;,&quot;algorithm&quot;:&quot;HmacSHA1&quot;,&quot;key_length&quot;:240,&quot;created_on&quot;:&quot;2012-09-20T19:51:28.000278Z&quot;,&quot;domain_id&quot;:&quot;91641150119921&quot;,&quot;status&quot;:&quot;active&quot;,&quot;valid_from&quot;:&quot;2012-09-20T19:51:28.000000Z&quot;,&quot;valid_to&quot;:&quot;2022-09-18T19:51:28.000000Z&quot;}">  
        <ns2:links>  
          <link rel="self" href="https://localhost:35357/v3/credentials/KAKH35XE76JSE196XE4R"/>  
        </ns2:links>  
      </ns2:credential>  
      <ns2:credential id="31890119180371:KAKH35XE76JSE116XE4T" user_id="36968991407691" type="HP-IDM:access-key" blob="{&quot;access&quot;:&quot;31890119180371:KAKH35XE76JSE116XE4T&quot;,&quot;secret&quot;:&quot;Yi2KML9ODCflkyLPfJ8fgITsjOsmTSC6fXMqmLcd&quot;,&quot;algorithm&quot;:&quot;HmacSHA1&quot;,&quot;key_length&quot;:240,&quot;created_on&quot;:&quot;2012-10-01T23:39:50.000337Z&quot;,&quot;domain_id&quot;:&quot;91641150119921&quot;,&quot;status&quot;:&quot;active&quot;,&quot;valid_from&quot;:&quot;2012-09-20T19:51:28.000000Z&quot;,&quot;valid_to&quot;:&quot;2022-09-18T19:51:28.000000Z&quot;}">  
        <ns2:links>  
          <link rel="self" href="https://localhost:35357/v3/credentials/31890119180371:KAKH35XE76JSE116XE4T"/>  
        </ns2:links>  
      </ns2:credential>  
      <ns2:links self="https://localhost:35357/v3/credentials?page=1&amp;per_page=30?user_id=36968991407691&amp;status=active" first="https://localhost:35357/v3/credentials?page=1&amp;per_page=30?user_id=36968991407691&amp;status=active" last="https://localhost:35357/v3/credentials?page=0&amp;per_page=30?user_id=36968991407691&amp;status=active"/>  
    </ns2:credentials>  

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | This status code is returned when either authentication has not been performed, the provided X-Auth-Token is invalid or authentication credentials are invalid (including the user, project or domain having been disabled). |
| 403 | Forbidden | The request is successfully authenticated but not authorized to perform the requested action. |
| 500 | Internal Server Error | The server encountered a problem while processing the request. |
| 503 | Service Unavailable | The server is unavailable to process the request.   |
| 429 | TooManyRequests | The request was rate limited. Please refer to the Rate Limits section for various limits. |

**Response Data**

JSON

    {  
      "unauthorized" : {  
        "code" : 401,  
        "details" : "Invalid credentials",  
        "message" : "UNAUTHORIZED",  
        "otherAttributes" : {  
        }  
      }  
    }  

XML

    <?xml version="1.0" encoding="UTF-8" standalone="yes"?><unauthorized xmlns="http://docs.openstack.org/identity/api/v2.0" xmlns:ns2="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" xmlns:ns3="http://docs.openstack.org/common/api/v1.0" xmlns:ns4="http://www.w3.org/2005/Atom" code="401"><message>UNAUTHORIZED</message><details>Invalid credentials</details></unauthorized>  

**Curl Example**

    curl -k -H "X-Auth-Token: HPAuth_fd6f4f19c0bbf7bb0d500aac3bfe21b621073f22b8a92959cabfdc5c4b3f234c" -H "Accept: application/json" "https://localhost:35357/v3/credentials?per_page=5"  

##### 3.4.1.3 Delete A Credential ##### {#delete_a_credential}
##### DELETE /credentials/{credential_id}

Delete a credential.

**Request Data**

The `credential_id` url path parameter is required. The `user_id` query parameter is only required to delete a credential for a user other than the requester.

**URL Parameters**

* *credential_id* (Required) - string - credential ID

The folowing query parameters are supported.

* *user_id* (Optional) - string - user ID of the credential owner. If not specified then defaults to user ID of the requester.

**Data Parameters**

This call does not require a request body.

A valid token must be present in the *X-Auth-Token* HTTP header. Otherwise, an HTTP code 401 will be returned.

**Success Response**

**Status Code**

204 - No Content

**Response Data**

This call does not return a response body on success.

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body |
| 401 | Unauthorized | This status code is returned when either authentication has not been performed, the provided X-Auth-Token is invalid or authentication credentials are invalid (including the user, project or domain having been disabled). |
| 403 | Forbidden | The request is successfully authenticated but not authorized to perform the requested action. |
| 404 | Not Found | Specified credential ID or user ID not found   |
| 500 | Internal Server Error | The server encountered a problem while processing the request  |
| 503 | Service Unavailable | The server is unavailable to process the request  |
| 429 | TooManyRequests | The request was rate limited. Please refer to the Rate Limits section for various limits |

**Response Data**

JSON

    {  
      "unauthorized" : {  
        "code" : 401,  
        "details" : "Invalid credentials",  
        "message" : "UNAUTHORIZED",  
        "otherAttributes" : {  
        }  
      }  
    }  

XML

    <?xml version="1.0" encoding="UTF-8" standalone="yes"?><unauthorized xmlns="http://docs.openstack.org/identity/api/v2.0" xmlns:ns2="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" xmlns:ns3="http://docs.openstack.org/common/api/v1.0" xmlns:ns4="http://www.w3.org/2005/Atom" code="401"><message>UNAUTHORIZED</message><details>Invalid credentials</details></unauthorized>  

**Curl Example**

    curl -k -XDELETE -H "X-Auth-Token: HPAuth_1661578e273d107d38b732849173e00d0a60d46d9bc279bee31565fd39be48a8" "https://localhost:35357/v3/credentials/ZNFNCA1JJL3T7XY12V2F"  

##### 3.4.1.4 Get A Credential ##### {#get_a_credential}
##### GET /credentials/{credential_id}

Gets a credential.

**Request Data**

The `credential_id` URL path parameter is required.

**URL Parameters**

* *credential_id* (Required) - string - credential ID

**Data Parameters**

This call does not require a request body.

A valid token must be present in the *X-Auth-Token* HTTP header. Otherwise, an HTTP code 401 will be returned.

JSON

    GET https://localhost:35357/v3/credentials/V7TEGGSZZ4NJK9UR4UFE HTTP/1.1  
    X-Auth-Token: HPAuth_4e7bc0d2e4b0600fec3d2a4a  
    Accept: application/json  

XML

    GET https://localhost:35357/v3/credentials/V7TEGGSZZ4NJK9UR4UFE HTTP/1.1  
    X-Auth-Token: HPAuth_4e7bc0d2e4b0600fec3d2a4a  
    Accept: application/xml  

**Success Response**

**Status Code**

200 - OK

**Response Data**

JSON

    HTTP/1.1 200 OK  
    Content-Type: application/json  
    
    {  
        "credential": {  
            "blob": "{\"access\":\"KAKH35XE76JSE196XE4R\",\"secret\":\"Yi2KML9ODCflkyLPfJ8fgITsjOsmTSC5fXMqmLca\",\"algorithm\":\"HmacSHA1\",\"key_length\":240,\"created_on\":\"2012-09-20T19:51:28.000278Z\",\"domain_id\":\"91641150119921\",\"status\":\"active\",\"valid_from\":\"2012-09-20T19:51:28.000000Z\",\"valid_to\":\"2022-09-18T19:51:28.000000Z\"}",   
            "id": "KAKH35XE76JSE196XE4R",   
            "links": {  
                "self": "https://localhost:35357/v3/credentials/KAKH35XE76JSE196XE4R"  
            },   
            "otherAttributes": {},   
            "type": "HP-IDM:access-key",   
            "user_id": "36968991407691"  
        }  
    }  

XML

    HTTP/1.1 200 OK  
    Content-Type: application/xml  
    
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>  
    <ns2:credential xmlns="http://www.w3.org/2005/Atom" xmlns:ns2="http://docs.openstack.org/identity/api/v3" xmlns:ns3="http://docs.openstack.org/common/api/v1.0" id="KAKH35XE76JSE196XE4R" user_id="36968991407691" type="HP-IDM:access-key" blob="{&quot;access&quot;:&quot;KAKH35XE76JSE196XE4R&quot;,&quot;secret&quot;:&quot;Yi2KML9ODCflkyLPfJ8fgITsjOsmTSC5fXMqmLca&quot;,&quot;algorithm&quot;:&quot;HmacSHA1&quot;,&quot;key_length&quot;:240,&quot;created_on&quot;:&quot;2012-09-20T19:51:28.000278Z&quot;,&quot;domain_id&quot;:&quot;91641150119921&quot;,&quot;status&quot;:&quot;active&quot;,&quot;valid_from&quot;:&quot;2012-09-20T19:51:28.000000Z&quot;,&quot;valid_to&quot;:&quot;2022-09-18T19:51:28.000000Z&quot;}">  
      <ns2:links>  
        <link rel="self" href="https://localhost:35357/v3/credentials/KAKH35XE76JSE196XE4R"/>  
      </ns2:links>  
    </ns2:credential>  

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body |
| 401 | Unauthorized | This status code is returned when either authentication has not been performed, the provided X-Auth-Token is invalid or authentication credentials are invalid (including the user, project or domain having been disabled). |
| 403 | Forbidden | The request is successfully authenticated but not authorized to perform the requested action. |
| 404 | Not Found | Specified credential ID or user ID not found   |
| 500 | Internal Server Error | The server encountered a problem while processing the request  |
| 503 | Service Unavailable | The server is unavailable to process the request  |
| 429 | TooManyRequests | The request was rate limited. Please refer to the Rate Limits section for various limits |

**Response Data**

JSON

    {  
      "unauthorized" : {  
        "code" : 401,  
        "details" : "Invalid credentials",  
        "message" : "UNAUTHORIZED",  
        "otherAttributes" : {  
        }  
      }  
    }  

XML

    <?xml version="1.0" encoding="UTF-8" standalone="yes"?><unauthorized xmlns="http://docs.openstack.org/identity/api/v2.0" xmlns:ns2="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" xmlns:ns3="http://docs.openstack.org/common/api/v1.0" xmlns:ns4="http://www.w3.org/2005/Atom" code="401"><message>UNAUTHORIZED</message><details>Invalid credentials</details></unauthorized>  

**Curl Example**

    curl -k -H "X-Auth-Token: HPAuth_1661578e273d107d38b732849173e00d0a60d46d9bc279bee31565fd39be48a8" -H "Accept: application/json" "https://localhost:35357/v3/credentials/HAJ5LLHHTKHBXB6MK3TL"  

##### 3.4.1.5 Update A Credential ##### {#update_a_credential}
##### PATCH /credentials/{credential_id}

Update a credential.

Only the following fields are updatable:

* `status`

*Note:*   
Status ``expired``, ``revoked``, ``deleted``, and ``purged`` are generated by
the system. They cannot be updated by the client.

**Request Data**

The `credential_id` url path parameter is required.

**URL Parameters**

* *credential_id* (Required) - string - credential ID.

**Data Parameters**

See schema file for more details on the request and response data structure.

* *status* - string - credential status. One of the values (active, inactive).

A valid token must be present in the *X-Auth-Token* HTTP header. Otherwise, an HTTP code 401 will be returned.

JSON

    PATCH https://localhost:35357/v3/credentials/KAKH35XE76JSE196XE4R HTTP/1.1  
    Accept: application/json  
    Content-Type: application/json  
    X-Auth-Token: HPAuth_4e7bba89e4b0600fec3d2a3a  
     
    {"credential": {  
        "blob" : "{\"status\" : \"inactive\"}"  
    }}  

XML

    PATCH https://localhost:35357/v3/credentials/KAKH35XE76JSE196XE4R HTTP/1.1  
    Accept: application/xml  
    Content-Type: application/xml  
    X-Auth-Token: HPAuth_4e7bba89e4b0600fec3d2a3a  
    
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>  
    <ns2:credential xmlns="http://www.w3.org/2005/Atom" xmlns:ns2="http://docs.openstack.org/identity/api/v3" xmlns:ns3="http://docs.openstack.org/common/api/v1.0" blob="{&quot;status&quot;:&quot;inactive&quot;}">  
    </ns2:credential>  

**Success Response**

**Status Code**

200 - OK

**Response Data**

    HTTP/1.1 200 OK  
    Content-Type: application/json  
    
    {  
        "credential": {  
            "blob": "{\"access\":\"KAKH35XE76JSE196XE4R\",\"secret\":\"Yi2KML9ODCflkyLPfJ8fgITsjOsmTSC5fXMqmLca\",\"algorithm\":\"HmacSHA1\",\"key_length\":240,\"created_on\":\"2012-09-20T19:51:28.000278Z\",\"domain_id\":\"91641150119921\",\"status\":\"inactive\",\"valid_from\":\"2012-09-20T19:51:28.000000Z\",\"valid_to\":\"2022-09-18T19:51:28.000000Z\"}",   
            "id": "KAKH35XE76JSE196XE4R",   
            "links": {  
                "self": "https://localhost:35357/v3/credentials/KAKH35XE76JSE196XE4R"  
            },   
            "otherAttributes": {},   
            "type": "HP-IDM:access-key",   
            "user_id": "36968991407691"  
        }  
    }  

XML

    HTTP/1.1 200 OK  
    Content-Type: application/xml  
    
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>  
    <ns2:credential xmlns="http://www.w3.org/2005/Atom" xmlns:ns2="http://docs.openstack.org/identity/api/v3" xmlns:ns3="http://docs.openstack.org/common/api/v1.0" id="KAKH35XE76JSE196XE4R" user_id="36968991407691" type="HP-IDM:access-key" blob="{&quot;access&quot;:&quot;KAKH35XE76JSE196XE4R&quot;,&quot;secret&quot;:&quot;Yi2KML9ODCflkyLPfJ8fgITsjOsmTSC5fXMqmLca&quot;,&quot;algorithm&quot;:&quot;HmacSHA1&quot;,&quot;key_length&quot;:240,&quot;created_on&quot;:&quot;2012-09-20T19:51:28.000278Z&quot;,&quot;domain_id&quot;:&quot;91641150119921&quot;,&quot;status&quot;:&quot;inactive&quot;,&quot;valid_from&quot;:&quot;2012-09-20T19:51:28.000000Z&quot;,&quot;valid_to&quot;:&quot;2022-09-18T19:51:28.000000Z&quot;}">  
      <ns2:links>  
        <link rel="self" href="https://localhost:35357/v3/credentials/KAKH35XE76JSE196XE4R"/>  
      </ns2:links>  
    </ns2:credential>  

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body |
| 401 | Unauthorized | This status code is returned when either authentication has not been performed, the provided X-Auth-Token is invalid or authentication credentials are invalid (including the user, project or domain having been disabled). |
| 403 | Forbidden | The result of the operation will exceed the maximum number of active credentials. This status code is also returned when the request is successfully authenticated but not authorized to perform the requested action. |
| 404 | Not Found | Specified credential ID or user ID not found   |
| 500 | Internal Server Error | The server encountered a problem while processing the request  |
| 503 | Service Unavailable | The server is unavailable to process the request  |
| 429 | TooManyRequests | The request was rate limited. Please refer to the Rate Limits section for various limits |

**Response Data**

JSON

    {  
      "unauthorized" : {  
        "code" : 401,  
        "details" : "Invalid credentials",  
        "message" : "UNAUTHORIZED",  
        "otherAttributes" : {  
        }  
      }  
    }  

XML

    <?xml version="1.0" encoding="UTF-8" standalone="yes"?><unauthorized xmlns="http://docs.openstack.org/identity/api/v2.0" xmlns:ns2="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" xmlns:ns3="http://docs.openstack.org/common/api/v1.0" xmlns:ns4="http://www.w3.org/2005/Atom" code="401"><message>UNAUTHORIZED</message><details>Invalid credentials</details></unauthorized>  

**Curl Example**

    curl -k -X PUT -H "X-Auth-Token: HPAuth_1661578e273d107d38b732849173e00d0a60d46d9bc279bee31565fd39be48a8" -H "Content-Type: application/json" -H "Accept: application/json" "https://localhost:35357/v3/credentials/V7TEGGSZZ4NJK9UR4998" -d '{"credential": {  
        "blob" : "{\"status\" : \"inactive\"}"  
    }}'  

#### 3.4.2 Projects

Project is a collection of services, and associated with zero or more users who have access to these services via role references.

**Status Lifecycle**

N/A

**Rate Limits**

| Operation   | Rate Limit per second | Rate Limited By | Path |
| :-----------| :---------------------| :---------------| :----|
| List User Projects | 50 | X-Auth-Token in request header | /v3/users/{user_id}/projects |
| Get Project | 50 | X-Auth-Token in request header | /v3/projects/{id} |

*Note:*
If a request is invalid (doesn't present the required headers or credentials), the request is rate limited by the source IP Address using same limits in the table above.

If the limit is exceeded, the request will be failed with following message:

JSON

    {  
     "TooManyRequests":  
      {  
       "message": "This request was rate-limited",  
       "code": 429,  
       "details": "Exceeded the number of requests that can be made to {PATH} per SECOND"  
      }  
    }  

XML

    <TooManyRequests>  
        <message>This request was rate-limited</message>  
        <code>429</code>  
        <details>Exceeded the number of requests that can be made to {PATH} per SECOND</details>  
    </TooManyRequests>  

In addition, a response header "RetryAfter" will be returned with value specifying the seconds after which a retry could be attempted.

**Quota Limits**

N/A

**Business Rules**

None.

##### 3.4.2.1 List User Projects ##### {#list_user_projects}
##### GET /users/{user_id}/projects

This API returns a listing of all projects for which the provided user has a role assignment. If the user is not valid, an error is returned.

**Request Data**

This API supports pagination. See Pagination for more details.

This API also supports optional *name* and *enabled* filters.  Links returned for pagination will include whichever, if any, optional parameters were specified in the request.

The *name* and *enabled* filters can be used in any combination.

**URL Parameters**

* *page* (Optional)} - integer - represents the page number within the overall response, valid values can be in the range from 1 to (total matched projects) / per_page. Maximum value can be 1000.
* *per_page* (Optional) - integer - represents the maximum number of project elements which will be returned in the response. Default value is 100 and maximum can be 1000.
* *name* (Optional) - string - name of the project to be returned.
* *enabled* (Optional) - boolean - default behavior returns all projects with any status; this option can filter results to just enabled projects or just non-enabled projects.

**Data Parameters**

See schema file for more details on the request and response data structure.

A valid token must be presented in the *X-Auth-Token* HTTP header. Otherwise, a 401 will be returned.

This call does not require a request body.

JSON

    GET /v3/users/10219525064128/projects HTTP/1.1  
    Accept: application/json  
    X-Auth-Token: HPAuth10_1aa07de4f94afd2cc8f236fdca256f2798cc360047c851e343e9aa60c2bacdb6  

XML

    GET /v3/users/10219525064128/projects HTTP/1.1  
    Accept: application/xml  
    X-Auth-Token: HPAuth10_1aa07de4f94afd2cc8f236fdca256f2798cc360047c851e343e9aa60c2bacdb6  

Optional:

JSON

With *name* filter.

    GET /v3/users/10219525064128/projects?name=Test%20Project HTTP/1.1  
    Accept: application/json  
    X-Auth-Token: HPAuth10_1aa07de4f94afd2cc8f236fdca256f2798cc360047c851e343e9aa60c2bacdb6  

With pagination.

    GET /v3/users/10219525064128/projects?per_page=5&page=2 HTTP/1.1  
    Accept: application/json  
    X-Auth-Token: HPAuth10_1aa07de4f94afd2cc8f236fdca256f2798cc360047c851e343e9aa60c2bacdb6  

With the enabled flag to list enabled user's projects.

    GET /v3/users/10219525064128/projects?enabled=true HTTP/1.1  
    Accept: application/json  
    X-Auth-Token: HPAuth10_1aa07de4f94afd2cc8f236fdca256f2798cc360047c851e343e9aa60c2bacdb6  

**Success Response**

Returns list of matching projects as requested in 'Accept' header otherwise default response content type is 'application/json'

**Status Code**

200 - OK

**Response Data**

JSON

A list of projects in the specified format is returned.

    HTTP/1.1 200 OK  
    Vary: X-Auth-Token  
    Content-Type: application/json  
    Content-Length: 4435  
    Date: Wed, 04 Dec 2013 20:08:06 GMT  
    Connection: keep-alive  
    
    {  
       "projects":    [  
                {  
             "description": "Compute",  
             "links": {"self": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10601739620253"},  
             "enabled": true,  
             "id": "10601739620253",  
             "HP-IDM":          {  
                "status": "enabled",  
                "lastModifiedOn": "2013-12-03T18:04:41.612000",  
                "createdOn": "2013-12-03T18:04:40.559000"  
             },  
             "domain_id": "10490535946101",  
             "name": "tenantName_32119031220131004280251"  
          },  
                {  
             "description": "Compute",  
             "links": {"self": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10016404326594"},  
             "enabled": true,  
             "id": "10016404326594",  
             "HP-IDM":          {  
                "status": "enabled",  
                "lastModifiedOn": "2013-12-03T23:47:08.902000",  
                "createdOn": "2013-12-03T23:47:06.886000",  
                "soldToAddress":             {  
                   "city": "sunnyvale",  
                   "zip": "94545",  
                   "country": "USA",  
                   "state": "CA",  
                   "addressLine2": "line 2",  
                   "addressLine1": "line 1"  
                }  
             },  
             "domain_id": "10490535946101",  
             "name": "tenantName_22239259181120131603570999"  
          },  
                {  
             "description": "Compute",  
             "links": {"self": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10544137001493"},  
             "enabled": true,  
             "id": "10544137001493",  
             "HP-IDM":          {  
                "status": "enabled",  
                "lastModifiedOn": "2013-12-03T23:48:58.596000",  
                "createdOn": "2013-12-03T23:48:56.891000",  
                "soldToAddress":             {  
                   "city": "Sunnyvale",  
                   "zip": "94089",  
                   "country": "USA",  
                   "state": "CA",  
                   "addressLine2": "Building F",  
                   "addressLine1": "1140 Enterprise Way"  
                }  
             },  
             "domain_id": "10490535946101",  
             "name": "tenantName_2223925918112013160357"  
          },  
                {  
             "description": "Compute",  
             "links": {"self": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10612194815373"},  
             "enabled": true,  
             "id": "10612194815373",  
             "HP-IDM":          {  
                "status": "enabled",  
                "lastModifiedOn": "2013-12-03T23:54:39.294000",  
                "createdOn": "2013-12-03T23:54:36.908000",  
                "soldToAddress":             {  
                   "city": "Sunnyvale",  
                   "zip": "94089",  
                   "country": "USA",  
                   "state": "CA",  
                   "addressLine2": "Building F",  
                   "addressLine1": "1140 Enterprise Way"  
                }  
             },  
             "domain_id": "10490535946101",  
             "name": "tenantName_2223925918112013160358"  
          },  
                {  
             "description": "Compute",  
             "links": {"self": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10879285799074"},  
             "enabled": true,  
             "id": "10879285799074",  
             "HP-IDM":          {  
                "status": "enabled",  
                "lastModifiedOn": "2013-12-04T13:12:41.875000",  
                "createdOn": "2013-12-04T13:12:40.086000",  
                "soldToAddress":             {  
                   "city": "Sunnyvale",  
                   "zip": "94089",  
                   "country": "USA",  
                   "state": "CA",  
                   "addressLine2": "Building F",  
                   "addressLine1": "1140 Enterprise Way"  
                }  
             },  
             "domain_id": "10490535946101",  
             "name": "tenantName_22239259181120131603598"  
          },  
                {  
             "description": "Compute",  
             "links": {"self": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10059524459397"},  
             "enabled": true,  
             "id": "10059524459397",  
             "HP-IDM":          {  
                "status": "enabled",  
                "lastModifiedOn": "2013-12-04T13:13:56.475000",  
                "createdOn": "2013-12-04T13:13:55.075000",  
                "soldToAddress":             {  
                   "city": "Sunnyvale",  
                   "zip": "94089",  
                   "country": "USA",  
                   "state": "CA",  
                   "addressLine2": "Building F",  
                   "addressLine1": "1140 Enterprise Way"  
                }  
             },  
             "domain_id": "10490535946101",  
             "name": "tenantName_22239259181120131603599"  
          },  
                {  
             "description": "Compute",  
             "links": {"self": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10261626063894"},  
             "enabled": true,  
             "id": "10261626063894",  
             "HP-IDM":          {  
                "status": "enabled",  
                "lastModifiedOn": "2013-12-04T13:16:56.604000",  
                "createdOn": "2013-12-04T13:16:55.099000",  
                "soldToAddress":             {  
                   "city": "Sunnyvale",  
                   "zip": "94089",  
                   "country": "USA",  
                   "state": "CA",  
                   "addressLine2": "Building F",  
                   "addressLine1": "1140 Enterprise Way"  
                }  
             },  
             "domain_id": "10490535946101",  
             "name": "tenantName_222392591811201316035899"  
          },  
                {  
             "description": "Compute",  
             "links": {"self": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10546694787010"},  
             "enabled": true,  
             "id": "10546694787010",  
             "HP-IDM":          {  
                "status": "enabled",  
                "lastModifiedOn": "2013-12-04T14:44:32.882000",  
                "createdOn": "2013-12-04T14:44:30.427000",  
                "soldToAddress":             {  
                   "city": "Sunnyvale",  
                   "zip": "94089",  
                   "country": "USA",  
                   "state": "CA",  
                   "addressLine2": "Building F",  
                   "addressLine1": "1140 Enterprise Way"  
                }  
             },  
             "domain_id": "10490535946101",  
             "name": "tenantName_222392591811201316035999"  
          },  
                {  
             "description": "Compute2",  
             "links": {"self": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10249239463039"},  
             "enabled": false,  
             "id": "10249239463039",  
             "HP-IDM":          {  
                "status": "disabled",  
                "lastModifiedOn": "2013-12-04T20:07:56.784000",  
                "createdOn": "2013-12-04T16:41:55.896000",  
                "soldToAddress":             {  
                   "city": "Sunnyvale",  
                   "zip": "94089",  
                   "country": "USA",  
                   "state": "CA",  
                   "addressLine2": "Building F",  
                   "addressLine1": "1140 Enterprise Way"  
                }  
             },  
             "domain_id": "10490535946101",  
             "name": "tenantName_222392591811201316035699"  
          }  
       ],  
       "links":    {  
          "self": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/users/10219525064128/projects",  
          "next": null,  
          "previous": null  
       }  
    }  

With *name* filter.

    HTTP/1.1 200 OK  
    Vary: X-Auth-Token  
    Content-Type: application/json  
    Content-Length: 657  
    Date: Wed, 27 Nov 2013 17:05:32 GMT  
    Connection: keep-alive  
    
    {  
       "projects": [   {  
          "description": "Compute19",  
          "links": {"self": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10378853911529"},  
          "enabled": true,  
          "id": "10378853911529",  
          "HP-IDM":       {  
             "status": "enabled",  
             "lastModifiedOn": "2013-11-26T21:45:23.260000",  
             "createdOn": "2013-11-20T00:35:15.267000",  
             "soldToAddress":          {  
                "city": "sunnyvale",  
                "zip": "94545",  
                "country": "USA",  
                "state": "CA",  
                "addressLine2": "line 2",  
                "addressLine1": "line 1"  
             }  
          },  
          "domain_id": "10681062172200",  
          "name": "tenantName_1139259181120131603570999"  
       }],  
       "links":    {  
          "self": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/users/10154809234250/projects?name=tenantName_1139259181120131603570999",  
          "next": null,  
          "previous": null  
       }  
    }  

With pagination

    HTTP/1.1 200 OK  
    Vary: X-Auth-Token  
    Content-Type: application/json  
    Content-Length: 2076  
    Date: Wed, 27 Nov 2013 17:01:11 GMT  
    Connection: keep-alive  
    
    {  
       "projects":    [  
                {  
             "description": "Compute19",  
             "links": {"self": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10378853911529"},  
             "enabled": true,  
             "id": "10378853911529",  
             "HP-IDM":          {  
                "status": "enabled",  
                "lastModifiedOn": "2013-11-26T21:45:23.260000",  
                "createdOn": "2013-11-20T00:35:15.267000",  
                "soldToAddress":             {  
                   "city": "sunnyvale",  
                   "zip": "94545",  
                   "country": "USA",  
                   "state": "CA",  
                   "addressLine2": "line 2",  
                   "addressLine1": "line 1"  
                }  
             },  
             "domain_id": "10681062172200",  
             "name": "tenantName_1139259181120131603570999"  
          },  
                {  
             "description": "Compute",  
             "links": {"self": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10993096618252"},  
             "enabled": true,  
             "id": "10993096618252",  
             "HP-IDM":          {  
                "status": "enabled",  
                "lastModifiedOn": "2013-11-20T00:56:16.585000",  
                "createdOn": "2013-11-20T00:56:14.671000"  
             },  
             "domain_id": "10681062172200",  
             "name": "tenantName_13259181120131603570999"  
          },  
                {  
             "description": "Compute",  
             "links": {"self": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10796622882163"},  
             "enabled": true,  
             "id": "10796622882163",  
             "HP-IDM":          {  
                "status": "enabled",  
                "lastModifiedOn": "2013-11-20T01:16:16.690000",  
                "createdOn": "2013-11-20T01:16:14.749000"  
             },  
             "domain_id": "10681062172200",  
             "name": "tenantName_14259181120131603270999"  
          },  
                {  
             "description": "Compute"",  
             "links": {"self": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10164012941837"},  
             "enabled": true,  
             "id": "10164012941837",  
             "HP-IDM":          {  
                "status": "enabled",  
                "lastModifiedOn": "2013-11-20T16:04:14.769000",  
                "createdOn": "2013-11-20T16:04:13.165000"  
             },  
             "domain_id": "10681062172200",  
             "name": "tenantName_14259181120131603370999"  
          },  
                {  
             "description": "Compute",  
             "links": {"self": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10699650034584"},  
             "enabled": true,  
             "id": "10699650034584",  
             "HP-IDM":          {  
                "status": "enabled",  
                "lastModifiedOn": "2013-11-20T16:08:19.653000",  
                "createdOn": "2013-11-20T16:08:18.227000"  
             },  
             "domain_id": "10681062172200",  
             "name": "tenantName_14259181120131603470999"  
          }  
       ],  
       "links":    {  
          "self": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/users/10154809234250/projects?per_page=5",  
          "next": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/users/10154809234250/projects?page=2&per_page=5",  
          "previous": null  
       }  
    }  

With filter for enabled projects

    HTTP/1.1 200 OK  
    Vary: X-Auth-Token  
    Content-Type: application/json  
    Content-Length: 1990  
    Date: Wed, 27 Nov 2013 16:41:26 GMT  
    Connection: keep-alive  
    
    {  
       "projects":    [  
                {  
             "description": "Compute",  
             "links": {"self": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10514057891334"},  
             "enabled": true,  
             "id": "10514057891334",  
             "HP-IDM":          {  
                "status": "enabled",  
                "lastModifiedOn": "2013-11-20T16:08:39.588000",  
                "createdOn": "2013-11-20T16:08:38.201000"    
             },  
             "domain_id": "10681062172200",  
             "name": "tenantName_16259181120131603570999"  
          },  
                {  
             "description": "Compute",  
             "links": {"self": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10332143098865"},  
             "enabled": true,  
             "id": "10332143098865",  
             "HP-IDM":          {  
                "status": "enabled",  
                "lastModifiedOn": "2013-11-20T16:08:54.668000",  
                "createdOn": "2013-11-20T16:08:53.194000"  
             },  
             "domain_id": "10681062172200",  
             "name": "tenantName_17259181120131603570999"  
          },  
                {  
             "description": "Compute",  
             "links": {"self": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10914293668699"},  
             "enabled": true,  
             "id": "10914293668699",  
             "HP-IDM":          {  
                "status": "enabled",  
                "lastModifiedOn": "2013-11-20T22:55:31.645000",  
                "createdOn": "2013-11-20T22:55:29.686000"  
             },  
             "domain_id": "10681062172200",  
             "name": "tenantName_28259181120131603570999"  
          },  
                {  
             "description": "Compute",  
             "links": {"self": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10100167304809"},  
             "enabled": true,  
             "id": "10100167304809",  
             "HP-IDM":          {  
                "status": "enabled",  
                "lastModifiedOn": "2013-11-20T23:14:56.023000",  
                "createdOn": "2013-11-20T23:14:49.770000"  
             },  
             "domain_id": "10681062172200",  
             "name": "tenantName_229259181120131603570999",  
          },  
                {  
             "description": "Compute",  
             "links": {"self": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10646264998607"},  
             "enabled": true,  
             "id": "10646264998607",  
             "HP-IDM":          {  
                "status": "enabled",  
                "lastModifiedOn": "2013-11-20T23:18:11.672000",  
                "createdOn": "2013-11-20T23:18:09.794000"  
             },  
             "domain_id": "10681062172200",  
             "name": "tenantName_239259181120131603570999",  
          }  
       ],  
       "links":    {  
          "self": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/users/10154809234250/projects?enabled=true&page=2&per_page=5",  
          "next": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/users/10154809234250/projects?enabled=true&page=3&per_page=5",  
          "previous": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/users/10154809234250/projects?enabled=true&page=1&per_page=5"  
       }  
    }  

XML

A list of projects in the specified format is returned.

    HTTP/1.1 200 OK  
    Vary: X-Auth-Token  
    Content-Type: application/xml  
    Content-Length: 2499  
    Date: Wed, 27 Nov 2013 17:12:25 GMT  
    Connection: keep-alive  
    
    <?xml version="1.0" encoding="UTF-8"?>  
    <projects xmlns="http://docs.openstack.org/identity/api/v3">  
      <project name="tenantName_1139259181120131603570999" enabled="true" id="10378853911529" domain_id="10681062172200">  
        <description>Compute19</description>  
        <links>  
          <link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10378853911529"/>  
        </links>  
        <HP-IDM status="enabled" lastModifiedOn="2013-11-26T21:45:23.260000" createdOn="2013-11-20T00:35:15.267000">  
          <soldToAddress city="sunnyvale" zip="94545" country="USA" state="CA" addressLine2="line 2" addressLine1="line 1"/>  
        </HP-IDM>  
      </project>  
      <project name="tenantName_13259181120131603570999" enabled="true" id="10993096618252" domain_id="10681062172200">  
        <description>Compute</description>  
        <links>  
          <link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10993096618252"/>  
        </links>  
        <HP-IDM status="enabled" lastModifiedOn="2013-11-20T00:56:16.585000" createdOn="2013-11-20T00:56:14.671000"/>  
      </project>  
      <project name="tenantName_14259181120131603570999" enabled="true" id="10796622882163" domain_id="10681062172200">  
        <description>Compute</description>  
        <links>  
          <link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10796622882163"/>  
        </links>  
        <HP-IDM status="enabled" lastModifiedOn="2013-11-20T01:16:16.690000" createdOn="2013-11-20T01:16:14.749000"/>  
      </project>  
      <project name="tenantName_15259181120131603570999" enabled="true" id="10164012941837" domain_id="10681062172200">  
        <description>Compute</description>  
        <links>  
          <link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10164012941837"/>  
        </links>  
        <HP-IDM status="enabled" lastModifiedOn="2013-11-20T16:04:14.769000" createdOn="2013-11-20T16:04:13.165000"/>  
      </project>  
      <project name="tenantName_11259181120131603570999" enabled="true" id="10699650034584" domain_id="10681062172200">  
        <description>Compute</description>  
        <links>  
          <link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10699650034584"/>  
        </links>  
        <HP-IDM status="enabled" lastModifiedOn="2013-11-20T16:08:19.653000" createdOn="2013-11-20T16:08:18.227000"/>  
      </project>  
      <links>  
        <link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/users/10154809234250/projects?per_page=5"/>  
        <link rel="next" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/users/10154809234250/projects?page=2&amp;per_page=5"/>  
      </links>  
    </projects>  

With *name* filter

    HTTP/1.1 200 OK  
    Vary: X-Auth-Token  
    Content-Type: application/xml  
    Content-Length: 798  
    Date: Wed, 27 Nov 2013 16:37:24 GMT  
    Connection: keep-alive  
    
    <?xml version="1.0" encoding="UTF-8"?>  
    <projects xmlns="http://docs.openstack.org/identity/api/v3">  
      <project name="tenantName_1139259181120131603570999" enabled="true" id="10378853911529" domain_id="10681062172200">  
        <description>Compute19</description>  
        <links>  
          <link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10378853911529"/>  
        </links>  
        <HP-IDM status="enabled" lastModifiedOn="2013-11-26T21:45:23.260000" createdOn="2013-11-20T00:35:15.267000">  
          <soldToAddress city="sunnyvale" zip="94545" country="USA" state="CA" addressLine2="line 2" addressLine1="line 1"/>  
        </HP-IDM>  
      </project>  
      <links>  
        <link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/users/10154809234250/projects?name=tenantName_1139259181120131603570999"/>  
      </links>  
    </projects>  

With pagination.

    HTTP/1.1 200 OK  
    Vary: X-Auth-Token  
    Content-Type: application/xml  
    Content-Length: 2507  
    Date: Wed, 27 Nov 2013 17:19:05 GMT  
    Connection: keep-alive  
    
    <projects xmlns="http://docs.openstack.org/identity/api/v3">  
       <project name="tenantName_16259181120131603570999" enabled="true" id="10514057891334" domain_id="10681062172200">  
          <description>Compute</description>  
          <links>  
             <link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10514057891334"/>  
          </links>  
          <HP-IDM status="enabled" lastModifiedOn="2013-11-20T16:08:39.588000" createdOn="2013-11-20T16:08:38.201000"/>  
       </project>  
       <project name="tenantName_17259181120131603570999" enabled="true" id="10332143098865" domain_id="10681062172200">  
          <description>Compute</description>  
          <links>  
             <link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10332143098865"/>  
          </links>  
          <HP-IDM status="enabled" lastModifiedOn="2013-11-20T16:08:54.668000" createdOn="2013-11-20T16:08:53.194000"/>  
       </project>  
       <project name="tenantName_28259181120131603570999" enabled="true" id="10914293668699" domain_id="10681062172200">  
          <description>Compute</description>  
          <links>  
             <link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10914293668699"/>  
          </links>  
          <HP-IDM status="enabled" lastModifiedOn="2013-11-20T22:55:31.645000" createdOn="2013-11-20T22:55:29.686000"/>  
       </project>  
       <project name="tenantName_229259181120131603570999" enabled="true" id="10100167304809" domain_id="10681062172200">  
          <description>Compute</description>  
          <links>  
             <link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10100167304809"/>  
          </links>  
          <HP-IDM status="enabled" lastModifiedOn="2013-11-20T23:14:56.023000" createdOn="2013-11-20T23:14:49.770000"/>  
       </project>  
       <project name="tenantName_239259181120131603570999" enabled="true" id="10646264998607" domain_id="10681062172200">  
          <description>Compute</description>  
          <links>  
             <link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10646264998607"/>  
          </links>  
          <HP-IDM status="enabled" lastModifiedOn="2013-11-20T23:18:11.672000" createdOn="2013-11-20T23:18:09.794000"/>  
       </project>  
       <links>  
          <link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/users/10154809234250/projects?page=2&amp;per_page=5"/>  
          <link rel="previous" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/users/10154809234250/projects?page=1&amp;per_page=5"/>  
          <link rel="next" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/users/10154809234250/projects?page=3&amp;per_page=5"/>  
       </links>  
    </projects>  

With 'enabled' filter.

    HTTP/1.1 200 OK  
    Vary: X-Auth-Token  
    Content-Type: application/xml  
    Content-Length: 1257  
    Date: Wed, 27 Nov 2013 17:22:07 GMT  
    Connection: keep-alive  
    
    <?xml version="1.0" encoding="UTF-8"?>  
    <projects xmlns="http://docs.openstack.org/identity/api/v3">  
      <project name="tenantName_11259181120131603570999" enabled="true" id="10699650034584" domain_id="10681062172200">  
        <description>Compute</description>  
        <links>  
          <link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10699650034584"/>  
        </links>  
        <HP-IDM status="enabled" lastModifiedOn="2013-11-20T16:08:19.653000" createdOn="2013-11-20T16:08:18.227000"/>  
      </project>  
      <project name="tenantName_16259181120131603570999" enabled="true" id="10514057891334" domain_id="10681062172200">  
        <description>Compute</description>  
        <links>  
          <link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10514057891334"/>  
        </links>  
        <HP-IDM status="enabled" lastModifiedOn="2013-11-20T16:08:39.588000" createdOn="2013-11-20T16:08:38.201000"/>  
      </project>  
      <links>  
        <link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/users/10154809234250/projects?enabled=true&amp;page=3&amp;per_page=2"/>  
        <link rel="previous" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/users/10154809234250/projects?enabled=true&amp;page=2&amp;per_page=2"/>  
        <link rel="next" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/users/10154809234250/projects?enabled=true&amp;page=4&amp;per_page=2"/>  
      </links>  
    </projects>  

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | Missing required authentication data i.e. X-Auth-Token header |
| 401 | Unauthorized | Disabled or suspended user making the request. |
| 403 | Forbidden | The caller does not have the privilege required to perform the operation. |
| 404 | Not Found | When input user is not found in system. |
| 500 | Internal Server Error | The server encountered a problem while processing the request. |
| 503 | Service Unavailable | The server is unavailable to process the request.   |
| 429 | TooManyRequests | The request was rate limited. Please refer to the Rate Limits section for various limits. |

**Response Data**

JSON

    {"error": {  
       "message": "The request you have made requires authentication.",  
       "code": 401,  
       "title": "Unauthorized"  
    }}  

    {"error": {  
       "message": "Could not find user, 101548092342500.",  
       "code": 404,  
       "title": "Not Found"  
    }}  

XML

    <error message="The request you have made requires authentication." code="401" title="Unauthorized" xmlns="http://docs.openstack.org/identity/api/v3"/>  

**Curl Example**

***List Projects***

    curl -k -H "X-Auth-Token: HPAuth_fd6f4f19c0bbf7bb0d500aac3bfe21b621073f22b8a92959cabfdc5c4b3f234c" -H "Accept: application/json" "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/users/10154809234250/projects"  

***Get Project By Name***

    curl -k -H "X-Auth-Token: HPAuth_fd6f4f19c0bbf7bb0d500aac3bfe21b621073f22b8a92959cabfdc5c4b3f234c" -H "Accept: application/json" "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/users/10154809234250/projects?name=MyProject"  

***Get Projects By enabled***

    curl -k -H "X-Auth-Token: HPAuth_fd6f4f19c0bbf7bb0d500aac3bfe21b621073f22b8a92959cabfdc5c4b3f234c" -H "Accept: application/json" "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/users/10154809234250/projects?enabled=true"  

***Get Projects paginated***

    curl -k -H "X-Auth-Token: HPAuth_fd6f4f19c0bbf7bb0d500aac3bfe21b621073f22b8a92959cabfdc5c4b3f234c" -H "Accept: application/json" "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/users/10154809234250/projects?page=2&per_page=3"  

##### 3.4.2.2 Get Project ##### {#get_project}
##### GET /projects/{project_id}

This API returns a project for given project id. If id is not valid, an error is returned.

**Request Data**

Project id is specified in URI.

**URL Parameters**

**Data Parameters**

See schema file for more details on the request and response data structure.

A valid token must be presented in the *X-Auth-Token* HTTP header. Otherwise, a 401 will be returned.

This call does not require a request body.

JSON

    GET https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10059524459397 HTTP/1.1  
    Accept: application/json  
    X-Auth-Token: HPAuth10_5b566ac7b191c1a38c7cd9fa3e90f4f983fe7225a0aab1845d2d62ac25977dc1  

XML

    GET https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10059524459397 HTTP/1.1  
    Accept: application/xml  
    X-Auth-Token: HPAuth10_5b566ac7b191c1a38c7cd9fa3e90f4f983fe7225a0aab1845d2d62ac25977dc1  

**Success Response**

Returns project data as requested in 'Accept' header otherwise default response content type is 'application/json'

**Status Code**

200 - OK

**Response Data**

JSON

A project in the specified format is returned.

    HTTP/1.1 200 OK  
    Vary: X-Auth-Token  
    Content-Type: application/json  
    Content-Length: 353  
    Date: Tue, 03 Dec 2013 19:27:57 GMT  
    Connection: keep-alive  
    
    {"project": {  
       "description": "Compute",  
       "links": {"self": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10059524459397"},  
       "enabled": true,  
       "id": "10059524459397",  
       "HP-IDM":    {  
          "status": "enabled",  
          "lastModifiedOn": "2013-12-04T13:13:56.475000",  
          "createdOn": "2013-12-04T13:13:55.075000",  
          "soldToAddress":       {  
             "city": "Sunnyvale",  
             "zip": "94089",  
             "country": "USA",  
             "state": "CA",  
             "addressLine2": "Building F",  
             "addressLine1": "1140 Enterprise Way"  
          }  
       },  
       "domain_id": "10490535946101",  
       "name": "tenantName_22239259181120131603599"  
    }}  

XML

A project in the specified format is returned.

    HTTP/1.1 200 OK  
    Vary: X-Auth-Token  
    Content-Type: application/xml  
    Content-Length: 477  
    Date: Tue, 03 Dec 2013 19:33:56 GMT  
    Connection: keep-alive  
    
    <?xml version="1.0" encoding="UTF-8"?>  
    <project enabled="true" id="10059524459397" domain_id="10490535946101" name="tenantName_22239259181120131603599" xmlns="http://docs.openstack.org/identity/api/v3">  
       <description>Compute</description>  
       <links>  
          <link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10059524459397"/>  
       </links>  
       <HP-IDM status="enabled" lastModifiedOn="2013-12-04T13:13:56.475000" createdOn="2013-12-04T13:13:55.075000">  
          <soldToAddress city="Sunnyvale" zip="94089" country="USA" state="CA" addressLine2="Building F" addressLine1="1140 Enterprise Way"/>  
       </HP-IDM>  
    </project>  

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | Missing required authentication data i.e. X-Auth-Token header |
| 401 | Unauthorized | Disabled or suspended user making the request. |
| 403 | Forbidden | The caller does not have the privilege required to perform the operation. |
| 404 | Not Found | When input project id is not found in the system. |
| 500 | Internal Server Error | The server encountered a problem while processing the request. |
| 503 | Service Unavailable | The server is unavailable to process the request.   |
| 429 | TooManyRequests | The request was rate limited. Please refer to the Rate Limits section for various limits. |

**Response Data**

JSON

    {"error": {  
       "message": "The request you have made requires authentication.",  
       "code": 401,  
       "title": "Unauthorized"  
    }}  

    {"error": {  
       "message": "Could not find project, 10601739620254.",  
       "code": 404,  
       "title": "Not Found"  
    }}  

XML

    <error message="The request you have made requires authentication." code="401" title="Unauthorized" xmlns="http://docs.openstack.org/identity/api/v3"/>  

    <error message="Could not find project, 10601739620254." code="404" title="Not Found" xmlns="http://docs.openstack.org/identity/api/v3"/>  

**Curl Example**

***Get Project***

    curl -k -H "X-Auth-Token: HPAuth10_5b566ac7b191c1a38c7cd9fa3e90f4f983fe7225a0aab1845d2d62ac25977dc1" -H "Accept: application/json" "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10601739620253"  

#### 3.4.3 Tokens

Tokens are used to represent user's authenticated identity with a time-based validity. Tokens data contain authorization information via roles related to a project or domain. A token is used to gain access to a HP Helion Public Cloud Service offering. Tokens can be scoped to a project, domain or can be requested as unscoped. Unscoped token means that the token is essentially scoped to user's domain.

Tokens are generated by identity service after successful authentication. Token can be validated, re-scoped to another project or domain and/or can be revoked before its expiration.

Tokens can be requested by sending credentials as part of the request. The Identity service currently supports username/password and user acessskey credentials for v3.

AccessKey credentials are the preferred credentials for programmatic access for the following reasons:

1. If the user changes password for username/password credential, accessKey credentials won't be affected   
2. Client can have multiple acesss keys   
3. Access keys can be managed. (ie) They can have different life span

**Status Lifecycle**

N/A

**Rate Limits**

| Operation      | Rate Limit per second | Rate Limited By | Path |
| :--------------| :---------------------| :---------------| :----|
| Authenticate   | 50 | username/user ID/tenant ID/tenant Name/accesskey | /v3/auth/tokens |
| Rescope Token | 50 | X-Auth-Token in request header | /v3/auth/tokens |
| Revoke Token | 1 | X-Auth-Token in request header | /v3/auth/tokens |

*Note:*
If a request is invalid (doesn't present the required headers or credentials), the request is rate limited by the source IP Address using same limits in the table above

If the limit is exceeded, the request will be failed with following message:

JSON

    {  
     "TooManyRequests":  
      {  
       "message": "This request was rate-limited",  
       "code": 429,  
       "details": "Exceeded the number of requests that can be made to {PATH} per SECOND"  
      }  
    }  

XML

    <TooManyRequests>  
    <message>This request was rate-limited</message>  
    <code>429</code>  
    <details>Exceeded the number of requests that can be made to {PATH} per SECOND</details>  
    </TooManyRequests>  

In addition, a response header "RetryAfter" will be returned with value specifying the seconds after which a retry could be attempted

**Quota Limits**

N/A

**Business Rules**

None.

##### 3.4.3.1 Authenticate ##### {#authenticate}
##### POST /v3/auth/tokens

This API is used to authenticate a user to be able to use a service. The result of a successful authentication is a token to be used with service requests. A credential is used to obtain a token. The Identity service currently supports username/password and user access key credentials. If authentication succeeds, the response will include an authentication token and service catalog ( list of available services for that user ). Tokens are valid for 12 hours. Issued tokens can become invalid in following cases:

1. The token has expired.
2. The token has been revoked.
3. Either user or user's domain is disabled.
4. In case of scoped token, either scoped project or scoped project's domain is disabled.
5. If a user or domain is disabled, the token for the user or the users in the domain become invalid.

Besides using a username and password, another way to authenticate is using symmetric keys. Symmetric keys are user access key and secret key pairs provisioned for the user account. In this type of credential data, request body is expected to contain an access key and a secret key information belonging to the user. Once those keys are verified, a new token is created. In this type of authentication, the only change is in expected request body data (please see related example below). There is no difference in response format/content whether authentication is done using password credential data or access key credential data.

##### Service Catalog:

In case of un-scoped token request, the service catalog is going to include global active  endpoints in its data. In case of scoped token request, the service catalog is going to include project specific endpoints as well as global active endpoints.

##### Scoped Tokens:

A token can be scoped either to a domain or to a project.  ProjectId or DomainId/DomainName can be used to scope the token to project or domain respectively. ProjectName can also be used, in that case caller need to qualify the project using domain information, since project name is not globally unique. Project name is unique only in its domain

A project scoped token will also return service endpoints for other services associated with the project in question. An unscoped token will likely not contain service endpoints instead it will contain endpoints for global services such as Identity Service, Billing Service etc. Note that if project information is unknown, an unscoped token can be obtained and then a list of projects obtained. Project information can also be found in the Management Console.

##### Default Project Scoping:

In case a user has a defined default project defined on their account, scoping to that project is attempted if there is no scoping data provided in request. This scoping to default project is done provided project is in valid state and user has project specific role assignments. In the case a default project scoping cannot be achieved, then instead of returning errror, unscoped token is returned.

**Request Data**

See examples below. If input data format is not correct in request body, then bad request error is returned with http status code 400.

**URL Parameters**

None

**Data Parameters**

See schema file for more details on the request and response data structure.

JSON

Authenticate using userid/password credential for an unscoped token. Also for this request/response no default project is defined for that userId

    Accept-Encoding: gzip,deflate  
    Accept: application/json  
    Content-Type: application/json  
    Content-Length: 171  
    
    {  
    "auth": {  
        "identity": {  
            "methods": ["password"],  
            "password": {  
                "user": {  
                    "id": "21243386194835",  
                    "password": "secrete"  
                }  
            }  
        }  
    }  

Authenticate using username/password credential for an unscoped token.  User is qualified using domain name.

    Accept-Encoding: gzip,deflate  
    Accept: application/json  
    Content-Type: application/json  
    Content-Length: 171  
    
    {  
    "auth": {  
        "identity": {  
            "methods": ["password"],  
            "password": {  
                "user": {  
                    "id": "21243386194835",  
                    "password": "secrete",  
    	       "domain" : {  
                       "name" : "HPCSDemoDomain"  
                     }  
                }  
            }  
        }  
    }  

Authenticate using username/password credential for an unscoped token.  User is qualified using domain id.

    Accept-Encoding: gzip,deflate  
    Accept: application/json  
    Content-Type: application/json  
    Content-Length: 171  
    
    {  
    "auth": {  
        "identity": {  
            "methods": ["password"],  
            "password": {  
                "user": {  
                    "name": "HPCSDemoDomain_User1",  
                    "password": "secrete",  
         	       "domain" : {  
    		  "id" : "94710780204290"  
    	        }  
                }  
            }  
        }  
    }  

Authenticate using username/password credential scoped to a project using Project ID.

    Accept: application/json  
    Content-Type: application/json  
        
    {  
    "auth": {  
      "identity": {  
        "methods": ["password"],  
        "password": {  
          "user": {  
          "name": "{username}",  
          "password": "{password}"  
          }  
        }  
    },  
    "scope": {  
        "project": {  
            "id": "{project_id}"  
          }  
        }  
      }  
    }

Authenticate using password credential, scoped to a project using project name.  Project name is qualified using domain id.

    Accept-Encoding: gzip,deflate  
    Accept: application/json  
    Content-Type: application/json  
    Content-Length: 171  
    
    {  
    "auth": {  
        "identity": {  
            "methods": ["password"],  
            "password": {  
                "user": {  
                    "id": "453453453545",  
                    "password": "secrete"  
                }  
            }  
        },  
        "scope": {  
            "project": {  
                "name": "HPCSDemoDomain_dev_project",  
                "domain" : {  
    		  "id" : "94710780204290"  
    	     }  
            }  
        }  
       }  
    }  

Authenticate using password credential, scoped to a domain using domain name. 

    Accept-Encoding: gzip,deflate  
    Accept: application/json  
    Content-Type: application/json  
    Content-Length: 171  
    
    {  
    "auth": {  
        "identity": {  
            "methods": ["password"],  
            "password": {  
                "user": {  
                    "id": "453453453545",  
                    "password": "secrete"  
                }  
            }  
        },  
        "scope": {  
            "domain" : {  
    	  "name" : "HPCSDemoDomain"  
             }  
         }  
        }  
       }  
    }  

Authenticate using password credential, scoped to a doamin using domain id. 

    Accept-Encoding: gzip,deflate  
    Accept: application/json  
    Content-Type: application/json  
    Content-Length: 171  
    
    {  
    "auth": {  
        "identity": {  
            "methods": ["password"],  
            "password": {  
                "user": {  
                    "id": "453453453545",  
                    "password": "secrete"  
                }  
            }  
        },  
        "scope": {  
            "domain" : {  
    	  "id" : "94710780204290"  
             }  
         }  
        }  
       }  
    }  

Authenticate using Access Key credential scoped to a project using Project ID.

    Accept: application/json  
    Content-Type: application/json  
        
    { 
    "auth" : {
      "identity" : {
        "methods" : [
        "accessKey"
        ],
          "accessKey" : {
            "accessKey" : "{access_key}",
            "secretKey" : "{secret_key}"
            }
          },
        "scope": {
        "project": {
          "id" : "{project_id}"
          }
        }
      }
    }

XML

Authenticate using password credential for a unscoped token.

    <?xml version="1.0" encoding="UTF-8"?>  
    <auth xmlns="http://docs.openstack.org/identity/api/v3" xmlns:ns2="http://www.w3.org/2005/Atom">  
        <identity>  
             <methods>  
    	         <method>password</method>  
             </methods>  
            <password>  
                <user name="haneeftest" password="haneeftest"/>  
            </password>  
        </identity>    
    </auth>  
    
    


Authenticate using password credential for a project unscoped token.

    <?xml version="1.0" encoding="UTF-8"?>  
    <auth xmlns="http://docs.openstack.org/identity/api/v3" xmlns:ns2="http://www.w3.org/2005/Atom">  
        <identity>  
             <methods>  
    	         <method>password</method>  
             </methods>  
            <password>  
                <user name="haneeftest" password="haneeftest"/>  
            </password>  
        </identity>    
        <scope>  
            <project name="HPCSDeomonDomain_DevProject">  
                <domain name="HPCSDemonDomain"/>  
            </project>  
        </scope>  
    </auth>  
    
    

Authenticate using access key credential domain scoped

    <?xml version="1.0" encoding="UTF-8"?>  
    <auth xmlns="http://docs.openstack.org/identity/api/v3" xmlns:ns2="http://www.w3.org/2005/Atom">  
        <identity>  
             <methods>  
    	         <method>accessKey</method>  
             </methods>       
              <accessKey accessKey="quyNVz7gMtpG9QsLz0DUrqGocYbr5X+KGbkJsqzs" secretKey="VCAVE3Y6RL9K8ADVKMY5"/>  
        </identity>    
        <scope>  
            <domain name="HPCSDeomonDomain">  
            </domain>  
        </scope>  
    </auth>  

**Success Response**

**Status Code**

201 - Created

**Response Data**

JSON

Unscoped token response

    HTTP/1.1 201 Created  
    X-Subject-Token: HPAuth10_727ed1d52a4a5e838aa4bb342b87191b40894afcaff644ebaec2e14da543161f  
    Content-Type: application/json  
    Date: Tue, 12 Feb 2013 01:21:54 GMT  
    Transfer-Encoding: chunked  
     
     
    {  
       "token":{  
          "expires_at":"2013-05-23T10:03:32.085Z",  
          "issued_at":"2013-05-22T17:10:06.817Z",  
          "user":{  
             "HP-IDM": {"status": "enabled"},  
             "domain":{  
                "links":{  
                   "self":"https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/domains/91787284686850"  
                },  
             "HP-IDM":{  
                "domainStatus": "suspended:2",  
                "domainStatusCode" : "21"  
             },            
                "id":"91787284686850",  
                "name":"HPCSDemoDomain"  
             },  
             "links":{  
                "self":"https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/users/35571560187320"  
             },  
             "id":"35571560187320",  
             "name":"HPCSDemoUser"  
          },  
          "methods":[  
             "password"  
          ],  
          "roles":[  
             {  
                "links":{  
                   "self":"https:region-a.geo-1.identity.hpcloudsvc.com//:35357/v3/roles/00000000004003"  
                },  
                "id":"00000000004003",  
                "name":"domainadmin"  
             },  
             {  
                "links":{  
                   "self":"https:region-a.geo-1.identity.hpcloudsvc.com//:35357/v3/roles/00000000004004"  
                },  
                "id":"00000000004004",  
                "name":"domainuser"  
             }  
          ],  
          "catalog":[  
             {  
                "type":"identity",  
                "id":"100",  
                "endpoints":[  
                   {  
                      "links":{  
                         "self":"https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/130_P"  
                      },  
                      "id":"130_P",  
                      "interface":"public",  
                      "region":"region-a.geo-1",  
                      "url":"https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/",  
                      "service_Id":"100"  
                   },  
                   {  
                      "links":{  
                         "self":"https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/131_P"  
                      },  
                      "id":"131_P",  
                      "interface":"public",  
                      "region":"region-a.geo-1",  
                      "url":"https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/",  
                      "service_Id":"100"  
                   },  
                   {  
                      "links":{  
                         "self":"https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/10000130_P"  
                      },  
                      "id":"10000130_P",  
                      "interface":"public",  
                      "region":"region-b.geo-1",  
                      "url":"https://region-b.geo-1.identity.hpcloudsvc.com:35357/v2.0/",  
                      "service_Id":"100"  
                   },  
                   {  
                      "links":{  
                         "self":"https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/10000131_P"  
                      },  
                      "id":"10000131_P",  
                      "interface":"public",  
                      "region":"region-b.geo-1",  
                      "url":"https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/",  
                      "service_Id":"100"  
                   }  
                ]  
             }  
          ],  
          "extras": {}  
       }  
    }  
  
Project scoped tokens response

    HTTP/1.1 201 Created  
    X-Subject-Token: HPAuth10_727ed1d52a4a5e838aa4bb342b87191b40894afcaff644ebaec2e14da543161f  
    Content-Type: application/json  
    Date: Tue, 12 Feb 2013 01:21:54 GMT  
    Transfer-Encoding: chunked  
     
    {  
      "token": {  
        "expires_at": "2013-05-24T03:39:53.428Z",  
        "issued_at": "2013-05-23T15:39:53.428Z",  
        "user": {  
          "HP-IDM": {"status": "enabled"},  
          "domain": {  
            "links": {  
              "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/domains/91787284686850"  
            },  
            "HP-IDM":          {  
                "domainStatus": "enabled"  
             },        
            "id": "91787284686850",  
            "name": "HPCSDemoDomain"  
          },  
          "links": {  
            "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/users/35571560187320"  
          },  
          "id": "35571560187320",  
          "name": "HCSDemoUser"  
        },  
        "methods": [  
          "password"  
        ],  
        "project": {  
          "HP-IDM": {"status": "enabled"},  
          "domain": {  
            "links": {  
              "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/domains/91787284686850"  
            },  
            "HP-IDM":          {  
                "domainStatus": "enabled"  
             },         
            "id": "91787284686850",  
            "name": "HPCSDemoDomain"  
          },  
          "links": {  
            "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/projects/61226762742230"  
          },  
          "id": "61226762742230",  
          "name": "HPCSDemoProject"  
        },  
        "roles": [  
          {  
            "links": {  
              "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004014"  
            },  
            "id": "00000000004014",  
            "name": "cdn-admin"  
          },  
          {  
            "links": {  
              "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004003"  
            },  
            "id": "00000000004003",  
            "name": "domainadmin"  
          },  
          {  
            "links": {  
              "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004013"  
            },  
            "id": "00000000004013",  
            "name": "block-admin"  
          },  
          {  
            "links": {  
              "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004024"  
            },  
            "id": "00000000004024",  
            "name": "user"  
          },  
          {  
            "links": {  
              "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004004"  
            },  
            "id": "00000000004004",  
            "name": "domainuser"  
          },  
          {  
            "links": {  
              "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004025"  
            },  
            "id": "00000000004025",  
            "name": "sysadmin"  
          },  
          {  
            "links": {  
              "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004022"  
            },  
            "id": "00000000004022",  
            "name": "Admin"  
          },  
          {  
            "links": {  
              "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004016"  
            },  
            "id": "00000000004016",  
            "name": "netadmin"  
          }  
        ],  
        "catalog": [  
          {  
            "type": "network",  
            "id": "170",  
            "endpoints": [  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/1702_P"  
                },  
                "id": "1702_P",  
                "interface": "public",  
                "region": "az-1.region-a.geo-1",  
                "url": "",  
                "service_Id": "170"  
              },  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/1703_P"  
                },  
                "id": "1703_P",  
                "interface": "public",  
                "region": "az-2.region-a.geo-1",  
                "url": "",  
                "service_Id": "170"  
              },  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/1704_P"  
                },  
                "id": "1704_P",  
                "interface": "public",  
                "region": "az-3.region-a.geo-1",  
                "url": "",  
                "service_Id": "170"  
              }  
            ]  
          },  
          {  
            "type": "hpext:cdn",  
            "id": "150",  
            "endpoints": [  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/150_P"  
                },  
                "id": "150_P",  
                "interface": "public",  
                "region": "region-a.geo-1",  
                "url": "https://region-a.geo-1.cdnmgmt.hpcloudsvc.com/v1.0/61226762742230",  
                "service_Id": "150"  
              },  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/1502_P"  
                },  
                "id": "1502_P",  
                "interface": "public",  
                "region": "region-b.geo-1",  
                "url": "https://region-b.geo-1.cdnmgmt.hpcloudsvc.com/v1.0/61226762742230",  
                "service_Id": "150"  
              }  
            ]  
          },  
          {  
            "type": "object-store",  
            "id": "110",  
            "endpoints": [  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/120_P"  
                },  
                "id": "120_P",  
                "interface": "public",  
                "region": "region-a.geo-1",  
                "url": "https://region-a.geo-1.objects.hpcloudsvc.com/v1/61226762742230",  
                "service_Id": "110"  
              },  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/1102_P"  
                },  
                "id": "1102_P",  
                "interface": "public",  
                "region": "region-b.geo-1",  
                "url": "https://region-b.geo-1.objects.hpcloudsvc.com:443/v1/61226762742230",  
                "service_Id": "110"  
              }  
            ]  
          },  
          {  
            "type": "identity",  
            "id": "100",  
            "endpoints": [  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/130_P"  
                },  
                "id": "130_P",  
                "interface": "public",  
                "region": "region-a.geo-1",  
                "url": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/",  
                "service_Id": "100"  
              },  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/131_P"  
                },  
                "id": "131_P",  
                "interface": "public",  
                "region": "region-a.geo-1",  
                "url": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/",  
                "service_Id": "100"  
              },  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/10000130_P"  
                },  
                "id": "10000130_P",  
                "interface": "public",  
                "region": "region-b.geo-1",  
                "url": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v2.0/",  
                "service_Id": "100"  
              },  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/10000131_P"  
                },  
                "id": "10000131_P",  
                "interface": "public",  
                "region": "region-b.geo-1",  
                "url": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/",  
                "service_Id": "100"  
              }  
            ]  
          },  
          {  
            "type": "image",  
            "id": "140",  
            "endpoints": [  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/160_P"  
                },  
                "id": "160_P",  
                "interface": "public",  
                "region": "az-1.region-a.geo-1",  
                "url": "https://glance1.uswest.hpcloud.net:9292/v1.0",  
                "service_Id": "140"  
              },  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/170_P"  
                },  
                "id": "170_P",  
                "interface": "public",  
                "region": "az-2.region-a.geo-1",  
                "url": "https://glance2.uswest.hpcloud.net:9292/v1.0",  
                "service_Id": "140"  
              },  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/180_P"  
                },  
                "id": "180_P",  
                "interface": "public",  
                "region": "az-3.region-a.geo-1",  
                "url": "https://glance3.uswest.hpcloud.net:9292/v1.0",  
                "service_Id": "140"  
              }  
            ]  
          },  
          {  
            "type": "volume",  
            "id": "130",  
            "endpoints": [  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/140_P"  
                },  
                "id": "140_P",  
                "interface": "public",  
                "region": "az-1.region-a.geo-1",  
                "url": "https://az-1.region-a.geo-1.compute.hpcloudsvc.com/v1.1/61226762742230",  
                "service_Id": "130"  
              },  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/141_P"  
                },  
                "id": "141_P",  
                "interface": "public",  
                "region": "az-2.region-a.geo-1",  
                "url": "https://az-2.region-a.geo-1.compute.hpcloudsvc.com/v1.1/61226762742230",  
                "service_Id": "130"  
              },  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/142_P"  
                },  
                "id": "142_P",  
                "interface": "public",  
                "region": "az-3.region-a.geo-1",  
                "url": "https://az-3.region-a.geo-1.compute.hpcloudsvc.com/v1.1/61226762742230",  
                "service_Id": "130"  
              }  
            ]  
          },  
          {  
            "type": "compute",  
            "id": "120",  
            "endpoints": [  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/100_P"  
                },  
                "id": "100_P",  
                "interface": "public",  
                "region": "az-1.region-a.geo-1",  
                "url": "https://az-1.region-a.geo-1.compute.hpcloudsvc.com/v1.1/61226762742230",  
                "service_Id": "120"  
              },  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/110_P"  
                },  
                "id": "110_P",  
                "interface": "public",  
                "region": "az-2.region-a.geo-1",  
                "url": "https://az-2.region-a.geo-1.compute.hpcloudsvc.com/v1.1/61226762742230",  
                "service_Id": "120"  
              },  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/111_P"  
                },  
                "id": "111_P",  
                "interface": "public",  
                "region": "az-3.region-a.geo-1",  
                "url": "https://az-3.region-a.geo-1.compute.hpcloudsvc.com/v1.1/61226762742230",  
                "service_Id": "120"  
              }  
            ]  
          }  
        ],  
        "extras": {}  
      }  
    }  

XML

XML response unscoped token

    HTTP/1.1 201 Created  
    X-Subject-Token: HPAuth10_727ed1d52a4a5e838aa4bb342b87191b40894afcaff644ebaec2e14da543161f  
    Content-Type: application/xml  
    Date: Tue, 12 Feb 2013 01:21:54 GMT  
    Transfer-Encoding: chunked  
    
    <?xml version="1.0" encoding="UTF-8"?>  
    <token xmlns="http://docs.openstack.org/identity/api/v3" xmlns:ns2="http://www.w3.org/2005/Atom">  
      <expires_at>  
        2013-05-23T10:12:44.412Z  
      </expires_at>  
      <issued_at>  
        2013-05-22T17:10:06.817Z  
      </issued_at>  
      <methods>  
        <method>  
          password  
        </method>  
      </methods>  
      <catalog>  
        <service id="100" type="identity">  
          <endpoints>  
            <endpoint id="130_P" interface="public" region="region-a.geo-1" service_id="100" url="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/">  
              <links>  
                <ns2:link href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/130_P" rel="self"/>  
              </links>  
            </endpoint>  
            <endpoint id="131_P" interface="public" region="region-a.geo-1" service_id="100" url="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/">  
              <links>  
                <ns2:link href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/131_P" rel="self"/>  
              </links>  
            </endpoint>  
            <endpoint id="10000130_P" interface="public" region="region-b.geo-1" service_id="100" url="https://region-b.geo-1.identity.hpcloudsvc.com:35357/v2.0/">  
              <links>  
                <ns2:link href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/10000130_P" rel="self"/>  
              </links>  
            </endpoint>  
            <endpoint id="10000131_P" interface="public" region="region-b.geo-1" service_id="100" url="https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/">  
              <links>  
                <ns2:link href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/10000131_P" rel="self"/>  
              </links>  
            </endpoint>  
          </endpoints>  
        </service>  
      </catalog>  
      <roles>  
        <role id="00000000004003" name="domainadmin">  
          <links>  
            <ns2:link href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004003" rel="self"/>  
          </links>  
        </role>  
        <role id="00000000004004" name="domainuser">  
          <links>  
            <ns2:link href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004004" rel="self"/>  
          </links>  
        </role>  
      </roles>  
      <user id="35571560187320" name="HPCSDemoUser">  
        <HP-IDM status="enabled"/>  
        <domain id="91787284686850" name="HPCSDemoDomain">  
          <links>  
            <ns2:link href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/domains/91787284686850" rel="self"/>  
          </links>  
          <HP-IDM>  
             <domainStatus>suspended:2</domainStatus>  
             <domainStatusCode>21</domainStatusCode>  
          </HP-IDM>  
        </domain>  
        <links>  
          <ns2:link href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/users/35571560187320" rel="self"/>  
        </links>  
      </user>  
      <extras/>  
    </token>  
    

XML response project scoped token

    HTTP/1.1 201 Created  
    X-Subject-Token: HPAuth10_727ed1d52a4a5e838aa4bb342b87191b40894afcaff644ebaec2e14da543161f  
    Content-Type: application/xml  
    Date: Tue, 12 Feb 2013 01:21:54 GMT  
    Transfer-Encoding: chunked  
    
    <?xml version="1.0" encoding="UTF-8"?>  
    <token xmlns="http://docs.openstack.org/identity/api/v3" xmlns:ns2="http://www.w3.org/2005/Atom">  
        <expires_at>2013-05-24T04:03:37.115Z</expires_at>  
        <issued_at>2013-05-23T15:39:53.428Z</issued_at>  
        <methods>  
            <method>password</method>  
        </methods>  
        <project id="61226762742230" name="HPCSDemoProject">  
            <HP-IDM status="enabled"/>  
            <domain id="91787284686850" name="HPCSDemoDomain">  
                <links>  
                    <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/domains/91787284686850" />  
                </links>  
                <HP-IDM>  
                    <domainStatus>enabled</domainStatus>                
                </HP-IDM>  
            </domain>  
            <links>  
                <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/61226762742230" />  
            </links>  
        </project>  
        <catalog>  
            <service type="network" id="170">  
                <endpoints>  
                    <endpoint id="1702_P" interface="public" region="az-1.region-a.geo-1" url="" service_id="170">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/1702_P" />  
                        </links>  
                    </endpoint>  
                    <endpoint id="1703_P" interface="public" region="az-2.region-a.geo-1" url="" service_id="170">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/1703_P" />  
                        </links>  
                    </endpoint>  
                    <endpoint id="1704_P" interface="public" region="az-3.region-a.geo-1" url="" service_id="170">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/1704_P" />  
                        </links>  
                    </endpoint>  
                </endpoints>  
            </service>  
            <service type="hpext:cdn" id="150">  
                <endpoints>  
                    <endpoint id="150_P" interface="public" region="region-a.geo-1" url="https://region-a.geo-1.cdnmgmt.hpcloudsvc.com/v1.0/61226762742230" service_id="150">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/150_P" />  
                        </links>  
                    </endpoint>  
                    <endpoint id="1502_P" interface="public" region="region-b.geo-1" url="https://region-b.geo-1.cdnmgmt.hpcloudsvc.com/v1.0/61226762742230" service_id="150">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/1502_P" />  
                        </links>  
                    </endpoint>  
                </endpoints>  
            </service>  
            <service type="object-store" id="110">  
                <endpoints>  
                    <endpoint id="120_P" interface="public" region="region-a.geo-1" url="https://region-a.geo-1.objects.hpcloudsvc.com/v1/61226762742230" service_id="110">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/120_P" />  
                        </links>  
                    </endpoint>  
                    <endpoint id="1102_P" interface="public" region="region-b.geo-1" url="https://region-b.geo-1.objects.hpcloudsvc.com:443/v1/61226762742230" service_id="110">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/1102_P" />  
                        </links>  
                    </endpoint>  
                </endpoints>  
            </service>  
            <service type="identity" id="100">  
                <endpoints>  
                    <endpoint id="130_P" interface="public" region="region-a.geo-1" url="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/" service_id="100">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/130_P" />  
                        </links>  
                    </endpoint>  
                    <endpoint id="131_P" interface="public" region="region-a.geo-1" url="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/" service_id="100">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/131_P" />  
                        </links>  
                    </endpoint>  
                    <endpoint id="10000130_P" interface="public" region="region-b.geo-1" url="https://region-b.geo-1.identity.hpcloudsvc.com:35357/v2.0/" service_id="100">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/10000130_P" />  
                        </links>  
                    </endpoint>  
                    <endpoint id="10000131_P" interface="public" region="region-b.geo-1" url="https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/" service_id="100">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/10000131_P" />  
                        </links>  
                    </endpoint>  
                </endpoints>  
            </service>  
            <service type="image" id="140">  
                <endpoints>  
                    <endpoint id="160_P" interface="public" region="az-1.region-a.geo-1" url="https://glance1.uswest.hpcloud.net:9292/v1.0" service_id="140">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/160_P" />  
                        </links>  
                    </endpoint>  
                    <endpoint id="170_P" interface="public" region="az-2.region-a.geo-1" url="https://glance2.uswest.hpcloud.net:9292/v1.0" service_id="140">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/170_P" />  
                        </links>  
                    </endpoint>  
                    <endpoint id="180_P" interface="public" region="az-3.region-a.geo-1" url="https://glance3.uswest.hpcloud.net:9292/v1.0" service_id="140">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/180_P" />  
                        </links>  
                    </endpoint>  
                </endpoints>  
            </service>  
            <service type="volume" id="130">  
                <endpoints>  
                    <endpoint id="140_P" interface="public" region="az-1.region-a.geo-1" url="https://az-1.region-a.geo-1.compute.hpcloudsvc.com/v1.1/61226762742230" service_id="130">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/140_P" />  
                        </links>  
                    </endpoint>  
                    <endpoint id="141_P" interface="public" region="az-2.region-a.geo-1" url="https://az-2.region-a.geo-1.compute.hpcloudsvc.com/v1.1/61226762742230" service_id="130">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/141_P" />  
                        </links>  
                    </endpoint>  
                    <endpoint id="142_P" interface="public" region="az-3.region-a.geo-1" url="https://az-3.region-a.geo-1.compute.hpcloudsvc.com/v1.1/61226762742230" service_id="130">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/142_P" />  
                        </links>  
                    </endpoint>  
                </endpoints>  
            </service>  
            <service type="compute" id="120">  
                <endpoints>  
                    <endpoint id="100_P" interface="public" region="az-1.region-a.geo-1" url="https://az-1.region-a.geo-1.compute.hpcloudsvc.com/v1.1/61226762742230" service_id="120">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/100_P" />  
                        </links>  
                    </endpoint>  
                    <endpoint id="110_P" interface="public" region="az-2.region-a.geo-1" url="https://az-2.region-a.geo-1.compute.hpcloudsvc.com/v1.1/61226762742230" service_id="120">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/110_P" />  
                        </links>  
                    </endpoint>  
                    <endpoint id="111_P" interface="public" region="az-3.region-a.geo-1" url="https://az-3.region-a.geo-1.compute.hpcloudsvc.com/v1.1/61226762742230" service_id="120">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/111_P" />  
                        </links>  
                    </endpoint>  
                </endpoints>  
            </service>  
        </catalog>  
        <roles>  
            <role id="00000000004014" name="cdn-admin">  
                <links>  
                    <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004014" />  
                </links>  
            </role>  
            <role id="00000000004003" name="domainadmin">  
                <links>  
                    <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004003" />  
                </links>  
            </role>  
            <role id="00000000004013" name="block-admin">  
                <links>  
                    <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004013" />  
                </links>  
            </role>  
            <role id="00000000004024" name="user">  
                <links>  
                    <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004024" />  
                </links>  
            </role>  
            <role id="00000000004004" name="domainuser">  
                <links>  
                    <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004004" />  
                </links>  
            </role>  
            <role id="00000000004025" name="sysadmin">  
                <links>  
                    <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004025" />  
                </links>  
            </role>  
            <role id="00000000004022" name="Admin">  
                <links>  
                    <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004022" />  
                </links>  
            </role>  
            <role id="00000000004016" name="netadmin">  
                <links>  
                    <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004016" />  
                </links>  
            </role>  
        </roles>  
        <user id="35571560187320" name="HPCSDemoUser">  
            <HP-IDM status="enabled"/>  
            <domain id="91787284686850" name="HPCSDemoDomain">  
                <links>  
                    <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/domains/91787284686850" />  
                </links>  
            </domain>  
            <links>  
                <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/users/35571560187320" />  
            </links>  
        </user>  
        <extras/>  
    </token>  

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | This status code is returned when either authentication has not been performed, the provided X-Auth-Token is invalid or authentication credentials are invalid (including the user, project or domain having been disabled). |
| 403 | Forbidden | This status code is returned when the request is successfully authenticated but not authorized to perform the requested action. |
| 500 | Internal Server Error | The server encountered a problem while processing the request. |
| 429 | TooManyRequests | The request was rate limited. Please refer to the Rate Limits section for various limits. |

**Response Data**

JSON

    {  
    "details": "Scoped token is not allowed when scoped domain is suspended",  
    "code": 401,  
    "message": "UNAUTHORIZED",  
    "title": "UNAUTHORIZED"  
    }  

XML

    <?xml version="1.0" encoding="UTF-8"?>  
    <error xmlns="http://docs.openstack.org/identity/api/v3" xmlns:ns2="http://www.w3.org/2005/Atom" code="404" message=" Authentication Method is required" title=" Authentication Method is required">  
       <details>Supported methods are [password, token, accessKey]</details>  
    </error>  
    

**Curl Example**

***Authenticate with Username/Password and Project ID***

    curl {BaseUri}/v3/auth/tokens -s -i -k -X POST -H 'Content-type:application/json' -H 'Accept:application/json' -d '{"auth":{"identity":{"methods": ["password"],"password":{"user":{"name":"{username}","password":"{password}"}}},"scope":{"project":{"id":"{project_id}"}}}}' 

***Authenticate with Access Keys and Project ID***

    curl {BaseURI}/v3/auth/tokens -s -i -k -X POST -H "Content-Type: application/json" -d '{"auth":{"identity":{"methods":["accessKey"],"accessKey":{"accessKey":"{access_key}","secretKey":"{secret_key}"}},"scope":{"project":{"id":"{project_id}"}}}}'

##### 3.4.3.2 Rescope Token ##### {#rescope_token}
##### POST /v3/auth/tokens

This API provides the ability to re-scope a valid token with another project. An existing unexpired token, regardless of its currently scoped or not, can be scoped to another project as long as the user has valid association with that project.

Re-scoping of token can be done from 

* Unscoped token to a scoped token for specific project 
* Scoped token from one project to another project 
* Scoped token to unscoped token (with no projectId and projectName specified in request). Re-scoping of token does not alter the token expiration time. Rescoping the token returns different token.

##### Service Catalog:

In case of un-scoped token request, the service catalog is going to include global active endpoint templates as endpoints in its data. In case of scoped token request, the service catalog is going to include project specific endpoints as well as global active endpoint templates as endpoints.

**Request Data**

**URL Parameters**

None

**Data Parameters**

See schema file for more details on the request and response data structure.

JSON

Domain Scoping

    Accept-Encoding: gzip,deflate  
    Accept: application/json  
    Content-Type: application/json  
    Content-Length: 154  
    
    {  
        "auth": {  
            "identity": {  
                "methods": ["token"],  
                "token": {  
                    "id": "HPAuth_332fa874565d61c87f50cf37af955cf5e95f1e174c95776855780f584b3386e3"  
                }  
            },  
            "scope": {  
                "domain": {  
                    "id": "345435435435435"               
                }  
            }  
        }  
    }  

Project Scoping

    Accept-Encoding: gzip,deflate  
    Accept: application/json  
    Content-Type: application/json  
    Content-Length: 154  
    
    {  
        "auth": {  
            "identity": {  
                "methods": ["token"],  
                "token": {  
                    "id": "--token-id--"  
                }  
            },  
            "scope": {  
                "project": {          
                    "name": "HPCSDemoDomain_dev_Project",  
    	       "domain": {  
                           "id": "345435435435435"               
    	        }  
                }  
            }  
        }  
    }  

**Success Response**

**Status Code**

201 - Created

**Response Data**

JSON

    HTTP/1.1 201 Created  
    X-Subject-Token: HPAuth10_727ed1d52a4a5e838aa4bb342b87191b40894afcaff644ebaec2e14da543161f  
    Content-Type: application/json  
    Date: Tue, 12 Feb 2013 01:21:54 GMT  
    Transfer-Encoding: chunked  
     
    {  
      "token": {  
        "expires_at": "2013-05-24T03:39:53.428Z",  
        "issued_at": "2013-05-23T15:39:53.428Z",  
        "user": {  
          "HP-IDM": {"status": "enabled"},  
          "domain": {  
            "links": {  
              "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/domains/91787284686850"  
            },  
             "HP-IDM":{  
                "domainStatus": "enabled"  
             },         
            "id": "91787284686850",  
            "name": "HPCSDemoDomain"  
          },  
          "links": {  
            "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/users/35571560187320"  
          },  
          "id": "35571560187320",  
          "name": "HCSDemoUser"  
        },  
        "methods": [  
          "password"  
        ],  
        "project": {  
          "HP-IDM": {"status": "enabled"},  
          "domain": {  
            "links": {  
              "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/domains/91787284686850"  
            },  
             "HP-IDM":{  
                "domainStatus": "enabled"  
             },          
            "id": "91787284686850",  
            "name": "HPCSDemoDomain"  
          },  
          "links": {  
            "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/projects/61226762742230"  
          },  
          "id": "61226762742230",  
          "name": "HPCSDemoProject"  
        },  
        "roles": [  
          {  
            "links": {  
              "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004014"  
            },  
            "id": "00000000004014",  
            "name": "cdn-admin"  
          },  
          {  
            "links": {  
              "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004003"  
            },  
            "id": "00000000004003",  
            "name": "domainadmin"  
          },  
          {  
            "links": {  
              "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004013"  
            },  
            "id": "00000000004013",  
            "name": "block-admin"  
          },  
          {  
            "links": {  
              "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004024"  
            },  
            "id": "00000000004024",  
            "name": "user"  
          },  
          {  
            "links": {  
              "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004004"  
            },  
            "id": "00000000004004",  
            "name": "domainuser"  
          },  
          {  
            "links": {  
              "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004025"  
            },  
            "id": "00000000004025",  
            "name": "sysadmin"  
          },  
          {  
            "links": {  
              "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004022"  
            },  
            "id": "00000000004022",  
            "name": "Admin"  
          },  
          {  
            "links": {  
              "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004016"  
            },  
            "id": "00000000004016",  
            "name": "netadmin"  
          }  
        ],  
        "catalog": [  
          {  
            "type": "network",  
            "id": "170",  
            "endpoints": [  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/1702_P"  
                },  
                "id": "1702_P",  
                "interface": "public",  
                "region": "az-1.region-a.geo-1",  
                "url": "",  
                "service_Id": "170"  
              },  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/1703_P"  
                },  
                "id": "1703_P",  
                "interface": "public",  
                "region": "az-2.region-a.geo-1",  
                "url": "",  
                "service_Id": "170"  
              },  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/1704_P"  
                },  
                "id": "1704_P",  
                "interface": "public",  
                "region": "az-3.region-a.geo-1",  
                "url": "",  
                "service_Id": "170"  
              }  
            ]  
          },  
          {  
            "type": "hpext:cdn",  
            "id": "150",  
            "endpoints": [  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/150_P"  
                },  
                "id": "150_P",  
                "interface": "public",  
                "region": "region-a.geo-1",  
                "url": "https://region-a.geo-1.cdnmgmt.hpcloudsvc.com/v1.0/61226762742230",  
                "service_Id": "150"  
              },  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/1502_P"  
                },  
                "id": "1502_P",  
                "interface": "public",  
                "region": "region-b.geo-1",  
                "url": "https://region-b.geo-1.cdnmgmt.hpcloudsvc.com/v1.0/61226762742230",  
                "service_Id": "150"  
              }  
            ]  
          },  
          {  
            "type": "object-store",  
            "id": "110",  
            "endpoints": [  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/120_P"  
                },  
                "id": "120_P",  
                "interface": "public",  
                "region": "region-a.geo-1",  
                "url": "https://region-a.geo-1.objects.hpcloudsvc.com/v1/61226762742230",  
                "service_Id": "110"  
              },  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/1102_P"  
                },  
                "id": "1102_P",  
                "interface": "public",  
                "region": "region-b.geo-1",  
                "url": "https://region-b.geo-1.objects.hpcloudsvc.com:443/v1/61226762742230",  
                "service_Id": "110"  
              }  
            ]  
          },  
          {  
            "type": "identity",  
            "id": "100",  
            "endpoints": [  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/130_P"  
                },  
                "id": "130_P",  
                "interface": "public",  
                "region": "region-a.geo-1",  
                "url": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/",  
                "service_Id": "100"  
              },  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/131_P"  
                },  
                "id": "131_P",  
                "interface": "public",  
                "region": "region-a.geo-1",  
                "url": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/",  
                "service_Id": "100"  
              },  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/10000130_P"  
                },  
                "id": "10000130_P",  
                "interface": "public",  
                "region": "region-b.geo-1",  
                "url": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v2.0/",  
                "service_Id": "100"  
              },  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/10000131_P"  
                },  
                "id": "10000131_P",  
                "interface": "public",  
                "region": "region-b.geo-1",  
                "url": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/",  
                "service_Id": "100"  
              }  
            ]  
          },  
          {  
            "type": "image",  
            "id": "140",  
            "endpoints": [  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/160_P"  
                },  
                "id": "160_P",  
                "interface": "public",  
                "region": "az-1.region-a.geo-1",  
                "url": "https://glance1.uswest.hpcloud.net:9292/v1.0",  
                "service_Id": "140"  
              },  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/170_P"  
                },  
                "id": "170_P",  
                "interface": "public",  
                "region": "az-2.region-a.geo-1",  
                "url": "https://glance2.uswest.hpcloud.net:9292/v1.0",  
                "service_Id": "140"  
              },  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/180_P"  
                },  
                "id": "180_P",  
                "interface": "public",  
                "region": "az-3.region-a.geo-1",  
                "url": "https://glance3.uswest.hpcloud.net:9292/v1.0",  
                "service_Id": "140"  
              }  
            ]  
          },  
          {  
            "type": "volume",  
            "id": "130",  
            "endpoints": [  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/140_P"  
                },  
                "id": "140_P",  
                "interface": "public",  
                "region": "az-1.region-a.geo-1",  
                "url": "https://az-1.region-a.geo-1.compute.hpcloudsvc.com/v1.1/61226762742230",  
                "service_Id": "130"  
              },  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/141_P"  
                },  
                "id": "141_P",  
                "interface": "public",  
                "region": "az-2.region-a.geo-1",  
                "url": "https://az-2.region-a.geo-1.compute.hpcloudsvc.com/v1.1/61226762742230",  
                "service_Id": "130"  
              },  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/142_P"  
                },  
                "id": "142_P",  
                "interface": "public",  
                "region": "az-3.region-a.geo-1",  
                "url": "https://az-3.region-a.geo-1.compute.hpcloudsvc.com/v1.1/61226762742230",  
                "service_Id": "130"  
              }  
            ]  
          },  
          {  
            "type": "compute",  
            "id": "120",  
            "endpoints": [  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/100_P"  
                },  
                "id": "100_P",  
                "interface": "public",  
                "region": "az-1.region-a.geo-1",  
                "url": "https://az-1.region-a.geo-1.compute.hpcloudsvc.com/v1.1/61226762742230",  
                "service_Id": "120"  
              },  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/110_P"  
                },  
                "id": "110_P",  
                "interface": "public",  
                "region": "az-2.region-a.geo-1",  
                "url": "https://az-2.region-a.geo-1.compute.hpcloudsvc.com/v1.1/61226762742230",  
                "service_Id": "120"  
              },  
              {  
                "links": {  
                  "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/111_P"  
                },  
                "id": "111_P",  
                "interface": "public",  
                "region": "az-3.region-a.geo-1",  
                "url": "https://az-3.region-a.geo-1.compute.hpcloudsvc.com/v1.1/61226762742230",  
                "service_Id": "120"  
              }  
            ]  
          }  
        ],  
        "extras": {}  
      }  
    }  
    

XML

    HTTP/1.1 201 Created  
    X-Subject-Token: HPAuth10_727ed1d52a4a5e838aa4bb342b87191b40894afcaff644ebaec2e14da543161f  
    Content-Type: application/xml  
    Date: Tue, 12 Feb 2013 01:21:54 GMT  
    Transfer-Encoding: chunked  
    
    <?xml version="1.0" encoding="UTF-8"?>  
    <token xmlns="http://docs.openstack.org/identity/api/v3" xmlns:ns2="http://www.w3.org/2005/Atom">  
        <expires_at>2013-05-24T04:03:37.115Z</expires_at>  
        <issued_at>2013-05-23T15:39:53.428Z</issued_at>  
        <methods>  
            <method>password</method>  
        </methods>  
        <project id="61226762742230" name="HPCSDemoProject">  
            <HP-IDM status="enabled"/>  
            <domain id="91787284686850" name="HPCSDemoDomain">  
                <links>  
                    <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/domains/91787284686850" />  
                </links>  
                <HP-IDM>  
                    <domainStatus>enabled</domainStatus>                
                </HP-IDM>  
            </domain>  
            <links>  
                <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/61226762742230" />  
            </links>  
        </project>  
        <catalog>  
            <service type="network" id="170">  
                <endpoints>  
                    <endpoint id="1702_P" interface="public" region="az-1.region-a.geo-1" url="" service_id="170">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/1702_P" />  
                        </links>  
                    </endpoint>  
                    <endpoint id="1703_P" interface="public" region="az-2.region-a.geo-1" url="" service_id="170">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/1703_P" />  
                        </links>  
                    </endpoint>  
                    <endpoint id="1704_P" interface="public" region="az-3.region-a.geo-1" url="" service_id="170">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/1704_P" />  
                        </links>  
                    </endpoint>  
                </endpoints>  
            </service>  
            <service type="hpext:cdn" id="150">  
                <endpoints>  
                    <endpoint id="150_P" interface="public" region="region-a.geo-1" url="https://region-a.geo-1.cdnmgmt.hpcloudsvc.com/v1.0/61226762742230" service_id="150">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/150_P" />  
                        </links>  
                    </endpoint>  
                    <endpoint id="1502_P" interface="public" region="region-b.geo-1" url="https://region-b.geo-1.cdnmgmt.hpcloudsvc.com/v1.0/61226762742230" service_id="150">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/1502_P" />  
                        </links>  
                    </endpoint>  
                </endpoints>  
            </service>  
            <service type="object-store" id="110">  
                <endpoints>  
                    <endpoint id="120_P" interface="public" region="region-a.geo-1" url="https://region-a.geo-1.objects.hpcloudsvc.com/v1/61226762742230" service_id="110">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/120_P" />  
                        </links>  
                    </endpoint>  
                    <endpoint id="1102_P" interface="public" region="region-b.geo-1" url="https://region-b.geo-1.objects.hpcloudsvc.com:443/v1/61226762742230" service_id="110">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/1102_P" />  
                        </links>  
                    </endpoint>  
                </endpoints>  
            </service>  
            <service type="identity" id="100">  
                <endpoints>  
                    <endpoint id="130_P" interface="public" region="region-a.geo-1" url="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/" service_id="100">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/130_P" />  
                        </links>  
                    </endpoint>  
                    <endpoint id="131_P" interface="public" region="region-a.geo-1" url="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/" service_id="100">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/131_P" />  
                        </links>  
                    </endpoint>  
                    <endpoint id="10000130_P" interface="public" region="region-b.geo-1" url="https://region-b.geo-1.identity.hpcloudsvc.com:35357/v2.0/" service_id="100">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/10000130_P" />  
                        </links>  
                    </endpoint>  
                    <endpoint id="10000131_P" interface="public" region="region-b.geo-1" url="https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/" service_id="100">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/10000131_P" />  
                        </links>  
                    </endpoint>  
                </endpoints>  
            </service>  
            <service type="image" id="140">  
                <endpoints>  
                    <endpoint id="160_P" interface="public" region="az-1.region-a.geo-1" url="https://glance1.uswest.hpcloud.net:9292/v1.0" service_id="140">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/160_P" />  
                        </links>  
                    </endpoint>  
                    <endpoint id="170_P" interface="public" region="az-2.region-a.geo-1" url="https://glance2.uswest.hpcloud.net:9292/v1.0" service_id="140">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/170_P" />  
                        </links>  
                    </endpoint>  
                    <endpoint id="180_P" interface="public" region="az-3.region-a.geo-1" url="https://glance3.uswest.hpcloud.net:9292/v1.0" service_id="140">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/180_P" />  
                        </links>  
                    </endpoint>  
                </endpoints>  
            </service>  
            <service type="volume" id="130">  
                <endpoints>  
                    <endpoint id="140_P" interface="public" region="az-1.region-a.geo-1" url="https://az-1.region-a.geo-1.compute.hpcloudsvc.com/v1.1/61226762742230" service_id="130">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/140_P" />  
                        </links>  
                    </endpoint>  
                    <endpoint id="141_P" interface="public" region="az-2.region-a.geo-1" url="https://az-2.region-a.geo-1.compute.hpcloudsvc.com/v1.1/61226762742230" service_id="130">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/141_P" />  
                        </links>  
                    </endpoint>  
                    <endpoint id="142_P" interface="public" region="az-3.region-a.geo-1" url="https://az-3.region-a.geo-1.compute.hpcloudsvc.com/v1.1/61226762742230" service_id="130">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/142_P" />  
                        </links>  
                    </endpoint>  
                </endpoints>  
            </service>  
            <service type="compute" id="120">  
                <endpoints>  
                    <endpoint id="100_P" interface="public" region="az-1.region-a.geo-1" url="https://az-1.region-a.geo-1.compute.hpcloudsvc.com/v1.1/61226762742230" service_id="120">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/100_P" />  
                        </links>  
                    </endpoint>  
                    <endpoint id="110_P" interface="public" region="az-2.region-a.geo-1" url="https://az-2.region-a.geo-1.compute.hpcloudsvc.com/v1.1/61226762742230" service_id="120">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/110_P" />  
                        </links>  
                    </endpoint>  
                    <endpoint id="111_P" interface="public" region="az-3.region-a.geo-1" url="https://az-3.region-a.geo-1.compute.hpcloudsvc.com/v1.1/61226762742230" service_id="120">  
                        <links>  
                            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/111_P" />  
                        </links>  
                    </endpoint>  
                </endpoints>  
            </service>  
        </catalog>  
        <roles>  
            <role id="00000000004014" name="cdn-admin">  
                <links>  
                    <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004014" />  
                </links>  
            </role>  
            <role id="00000000004003" name="domainadmin">  
                <links>  
                    <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004003" />  
                </links>  
            </role>  
            <role id="00000000004013" name="block-admin">  
                <links>  
                    <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004013" />  
                </links>  
            </role>  
            <role id="00000000004024" name="user">  
                <links>  
                    <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004024" />  
                </links>  
            </role>  
            <role id="00000000004004" name="domainuser">  
                <links>  
                    <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004004" />  
                </links>  
            </role>  
            <role id="00000000004025" name="sysadmin">  
                <links>  
                    <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004025" />  
                </links>  
            </role>  
            <role id="00000000004022" name="Admin">  
                <links>  
                    <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004022" />  
                </links>  
            </role>  
            <role id="00000000004016" name="netadmin">  
                <links>  
                    <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/roles/00000000004016" />  
                </links>  
            </role>  
        </roles>  
        <user id="35571560187320" name="HPCSDemoUser">  
            <HP-IDM status="enabled"/>  
            <domain id="91787284686850" name="HPCSDemoDomain">  
                <links>  
                    <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/domains/91787284686850" />  
                </links>  
                <hpext>  
                    <domainStatus>enabled</domainStatus>                
                </hpext>               
            </domain>  
            <links>  
                <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/users/35571560187320" />  
            </links>  
        </user>  
        <extras/>  
    </token>  

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | This status code is returned when either authentication has not been performed, the provided X-Auth-Token is invalid or authentication credentials are invalid (including the user, project or domain having been disabled). Invalid token returns 401 |
| 403 | Forbidden | This status code is returned when the request is successfully authenticated but not authorized to perform the requested action. |
| 500 | Internal Server Error | The server encountered a problem while processing the request. |
| 503 | Service Unavailable | The server is unavailable to process the request.   |
| 429 | TooManyRequests | The request was rate limited. Please refer to the Rate Limits section for various limits. |

**Response Data**

JSON

    {  
      "error" : {  
        "details" : "Invalid token",  
        "code" : 401,  
        "message" : "Invalid token",  
        "otherAttributes" : {  
        },  
        "title" : "UNAUTHORIZED"  
      }  
    }  
    

XML

    <?xml version="1.0" encoding="UTF-8"?>  
    <error code="401" message="Invalid Token" title="UNAUTHORIZED" xmlns="http://docs.openstack.org/identity/api/v3" xmlns:ns2="http://www.w3.org/2005/Atom">  
      <details>  
        Invalid token  
      </details>  
    </error>  
    

**Curl Example**

    curl -k -H "Content-Type: application/json" -d '{"auth": {"identity": {"methods": ["token"],"token": {	"id": "HPAuth_a6f32cefceb798cedd3183c71c07a3d169c8ad613e0c951ae5f426c015dd3210"}}}}' -X POST https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/auth/tokens  

##### 3.4.3.3 Revoke Token ##### {#revoke_token}
##### DELETE /v3/auth/tokens

This API is used to revoke an authentication token. This operation does not require a request body. Once a token has been revoked,  attempts to validate the token  will fail with a 404 (item not found) as the token no longer exists. Trying to revoke a non existing token, including one which has expired will also return a 401 (Unauthorized). Users revoke only their own tokens. Domain Admin can revoke their domain users token

**HTTP Headers**

| Header Name | Description | Required | Comments |
| :-----------| :-----------| :------- | :--------| 
| X-Auth-Token       | Callers authorization token |  Y  | |
| X-Subject-Token    | Token to be deleted         |  Y  | |
| Accept		   | Content Type of response    |  N  |Defaults to Json |

**Request Data**

**URL Parameters**

None

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

204 - No Content

**Response Data**

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | This status code is returned when either authentication has not been performed, the provided X-Auth-Token is invalid or authentication credentials are invalid (including the user, project or domain having been disabled). |
| 403 | Forbidden | This status code is returned when the request is successfully authenticated but not authorized to perform the requested action. |
| 429 | TooManyRequests | The request was rate limited. Please refer to the Rate Limits section for various limits. |

**Response Data**

JSON

    {"error": {   
       "details": "Invalid credentials",   
       "code": 401,   
       "message": "UNAUTHORIZED",   
       "otherAttributes": {},   
       "title": "UNAUTHORIZED"   
    }}   

XML

    <?xml version="1.0" encoding="UTF-8"?>  
    <error code="403" message="FORBIDDEN" title="FORBIDDEN" xmlns="http://docs.openstack.org/identity/api/v3" xmlns:ns2="http://www.w3.org/2005/Atom">  
       <details>Account is inactive</details>   
    </error>  

**Curl Example**

    curl -k -X DELETE -H "X-Auth-Token:HPAuth_23423423424234" -H "X-Subject-Token: HPAuth_45345345345454534"   https://hostname/v3/auth/tokens  

**Additional Notes**

Keystone doesn't require X-Auth-Token headers. HP Helion keystone implementation requires X-Auth-Token header for authorization purpose.

#### 3.4.4 Versions

This API returns the Identity service version supported by HP Helion Public Cloud. It also reports the status of each version.

**Status Lifecycle**

N/A

**Rate Limits**

| Operation | Rate Limit per second | Rate Limited By | Path |
| :---------| :---------------------| :---------------| :----|
| Get Versions | 20 | X-Auth-Token in request header or IP | / |

*Note:*
If a request is invalid (doesn't present the required headers or credentials), the request is rate limited by the source IP Address using same limits in the table above

If the limit is exceeded, the request will be failed with following message:

JSON

    {  
     "TooManyRequests":  
      {  
       "message": "This request was rate-limited",  
       "code": 429,  
       "details": "Exceeded the number of requests that can be made to / per SECOND"  
      }  
    }  

XML

    <TooManyRequests>  
    <message>This request was rate-limited</message>  
    <code>429</code>  
    <details>Exceeded the number of requests that can be made to / per SECOND</details>  
    </TooManyRequests>  

In addition, a response header "RetryAfter" will be returned with value specifying the seconds after which a retry could be attempted

**Quota Limits**

N/A

**Business Rules**

None.

##### 3.4.4.1 List Versions ##### {#list_versions}
##### GET /

**Request Data**

**URL Parameters**

**Data Parameters**

This call does not require a request body.

**Success Response**

*Specify the status code and any content that is returned.*

**Status Code**

200 - OK

**Response Data**

A list of supported versions of identity API and its current status  are returned.

JSON

    {  
      "versions": [  
        {  
          "id": "v1.0",  
          "otherAttributes": {},  
          "updated": "2012-06-20T17:14:12.843Z",  
          "status": "stable"  
        },  
        {  
          "id": "v1.1",  
          "otherAttributes": {},  
          "updated": "2012-06-20T17:14:12.843Z",  
          "status": "stable",  
          "links": [  
            {  
              "type": "text/html",  
              "href": "https://docs.hpcloud.com/api/identity",  
              "rel": "describedby"  
            }  
          ]  
        },  
        {  
          "id": "v2.0",  
          "otherAttributes": {},  
          "updated": "2012-06-20T17:14:12.843Z",  
          "status": "stable",  
          "links": [  
            {  
              "type": "text/html",  
              "href": "https://docs.hpcloud.com/api/identity",  
              "rel": "describedby"  
            }  
          ]  
        },  
        {  
          "id": "v3.0",  
          "otherAttributes": {},  
          "updated": "2013-04-25T17:14:12.843Z",  
          "status": "stable",  
          "links": [  
            {  
              "type": "text/html",  
              "href": "https://docs.hpcloud.com/api/identity",  
              "rel": "describedby"  
            }  
          ]  
        }  
      ]  
    }  

XML

    <?xml version="1.0" encoding="UTF-8"?>  
    <versions xmlns:ns2="http://www.w3.org/2005/Atom" xmlns="http://docs.openstack.org/identity/api/v3">  
       <version id="v1.0" status="stable" updated="2012-06-20T17:15:30.511Z" />  
       <version id="v1.1" status="stable" updated="2012-06-20T17:15:30.511Z">  
          <links>  
             <ns2:link rel="describedby" type="text/html" href="https://docs.hpcloud.com/api/identity" />  
          </links>  
       </version>  
       <version id="v2.0" status="stable" updated="2012-06-20T17:15:30.511Z">  
          <links>  
             <ns2:link rel="describedby" type="text/html" href="https://docs.hpcloud.com/api/identity" />  
          </links>  
       </version>  
       <version id="v3.0" status="stable" updated="2013-04-25T17:15:30.511Z">  
          <links>  
             <ns2:link rel="describedby" type="text/html" href="https://docs.hpcloud.com/api/identity" />  
          </links>  
       </version>  
    </versions>  
    

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 429 | TooManyRequests | The request was rate limited. Please refer to the Rate Limits section for various limits. |

**Curl Example**

    curl -k https://region-b.geo-1.identity.hpcloudsvc.com:35357  

**Additional Notes**  
This API is not defined in Openstack keystone v3.
