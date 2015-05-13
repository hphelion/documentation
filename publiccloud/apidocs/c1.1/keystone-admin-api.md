---
layout: page
permalink: /api/v13/identity/admin/
title: "Identity Services Admin API"
description: "HP Cloud Identity Services Admin API documentation."
keywords: "Keystone, Identity Services"
product: identity
publish: false

---
<!--PUBLISHED-->
# Identity Services Admin API

Date: May 2013

Document Version: 1.3

## 1. Overview

*Brief introduction and overview of the service and its intended use.*

### 1.1 API Maturity Level

**Maturity Level**: GA

**Version API Status**: CURRENT

#### 1.2 Document Revision History ###

|Document Version|Date            |Description|
|:--------       | :------------  | :------ |
|1.0             |February 2013|Initial creation|
|1.1             |March 2013   |Submitted changes for Token and Project api documentation. |
|1.2             |April 2013   |Submitted changes for Domain, Credentials, Version and updates for Token and Project api documentation.|
|1.3             |May 2013     |Submitted changes for Roles, Group and updates to Token, Domain and Credentials api documentation. |


## 2. Account-level View

## 3. REST API Specifications

### 3.1 Admin API Operations


**Host**: https://az-1.region-a.geo-1.compute.hpcloudsvc.com

**BaseUri**: {Host}/v2.0

**HPKeystoneExtensionBaseURI**: {BaseUri}/HP-IDM/v1.0

**Admin URI**: N/A

| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? | Privilege Level |
| :------- | :------------------- | :---------- | :--------------------- | :---------------- | :-------------: |
| Credentials | [Create Or Import Credential](#create_or_import_credential) | POST | /credentials | Y/Y | SS |
| Credentials | [List Credentials](#list_credentials) | GET | /credentials | Y/Y | SS |
| Credentials | [Delete A Credential](#delete_a_credential) | DELETE | /credentials/{credential_id} | Y/Y | SS |
| Credentials | [Get A Credential](#get_a_credential) | GET | /credentials/{credential_id} | Y/Y | SS |
| Credentials | [Update A Credential](#update_a_credential) | PATCH | /credentials/{credential_id} | Y/Y | SS |
| Domains | [Check For Existence Of Domain Name](#check_for_existence_of_domain_name) | HEAD | /HP-IDM/v1.0/domains | Y/Y | Anonymous |
| Domains | [Create A Domain](#create_a_domain) | GET | /HP-IDM/v1.0/domains  | Y/Y | System Adminstrator (SA) |
| Domains | [Delete A Domain](#delete_a_domain) | DELETE | /HP-IDM/v1.0/domains/{domainId}  | Y/Y | System Adminstrator (SA) |
| Domains | [Get A Domain](#get_a_domain) | GET | /HP-IDM/v1.0/domains/{domainId}  | Y/Y | System Adminstrator (SA), Domain Admin (DA), Domain User (DU) |
| Domains | [Get All Domains](#get_all_domains) | GET | /HP-IDM/v1.0/domains | Y/Y | System Adminstrator (SA) |
| Domains | [Get Groups For A Domain](#get_groups_for_a_domain) | GET | /HP-IDM/v1.0/domains/{domainId}/groups | Y/Y | System Adminstrator (SA), Domain Admin (DA), Domain User (DU) |
| Domains | [Get Subscribe Able Services For A Domain](#get_subscribe_able_services_for_a_domain) | GET | /HP-IDM/v1.0/domains/{domainId}/subscribeableServices | Y/Y | System Adminstrator (SA), Domain Admin (DA), Domain User (DU) |
| Domains | [Get Service Activations For A Domain](#get_service_activations_for_a_domain) | GET | /HP-IDM/v1.0/domains/{domainId}/services | Y/Y | System Adminstrator (SA), Domain Admin (DA), Domain User (DU) |
| Domains | [Get Tenants For A Domain](#get_tenants_for_a_domain) | GET | /HP-IDM/v1.0/domains/{domainId}/tenants | Y/Y | System Adminstrator (SA), Domain Admin (DA), Domain User (DU) |
| Domains | [Get Users For A Domain](#get_users_for_a_domain) | GET | /HP-IDM/v1.0/domains/{domainId}/tenants | Y/Y | System Adminstrator (SA), Domain Admin (DA) |
| Domains | [List Role Definitions (Deprecated)](#list_role_definitions_(deprecated)) | GET | /HP-IDM/v1.0/domains/{domainId}/roles | Y/Y | System Adminstrator (SA), Domain Admin (DA), Domain User (DU) |
| Domains | [Transfer Ownership Of A Domain](#transfer_ownership_of_a_domain) | PUT | /HP-IDM/v1.0/domains/{domainId}/owner/{userId}	 | Y/Y | System Adminstrator (SA) |
| Domains | [List Role Definitions](#list_role_definitions) | GET | /HP-IDM/v1.0/domains/{domainId}/roleDefs | Y/Y | System Adminstrator (SA), Domain Admin (DA), Domain User (DU) |
| Domains | [Check For Existence Of Non Tenant Role For A Given User](#check_for_existence_of_non_tenant_role_for_a_given_user) | HEAD | /HP-IDM/v1.0/domains/{domainId}/users/{userId}/roles/{roleId} | Y/Y | System Adminstrator (SA), Domain Admin (DA), Domain User (DU) |
| Domains | [Delete A Non Tenant Role Assignment In The Specified Domain For The Specified User](#delete_a_non_tenant_role_assignment_in_the_specified_domain_for_the_specified_user) | DELETE | /HP-IDM/v1.0/domains/{domainId}/users/{userId}/roles/{roleId} | Y/Y | System Adminstrator (SA), Domain Admin (DA) |
| Domains | [Assign A Non Tenant Role Assignment In The Specified Domain For The Specified User](#assign_a_non_tenant_role_assignment_in_the_specified_domain_for_the_specified_user) | PUT | /HP-IDM/v1.0/domains/{domainId}/users/{userId}/roles/{roleId} | Y/Y | System Adminstrator (SA), Domain Admin (DA) |
| Domains | [List Role Definitions For A Domain And User](#list_role_definitions_for_a_domain_and_user) | GET | /HP-IDM/v1.0/domains/{domainId}/users/{userId}/roles | Y/Y | System Adminstrator (SA), Domain Admin (DA), Domain User (DU) |
| Group | [List Groups](#list_groups) | GET | /HP-IDM/v1.0/domains/{domainId}/users/{userId}/roles | Y/Y | SS |
| Projects | [List User Projects](#list_user_projects) | GET | /users/{user_id}/projects | Y/Y | Self Service (SS), System Adminstrator (SA), Domain Admin (DA), L1/L2/L3/L3+ Support |
| Projects | [Get Project](#get_project) | GET | /projects/{project_id} | Y/Y | Self Service (SS), System Adminstrator (SA), Domain Admin (DA), L1/L2/L3/L3+ Support |
| Projects | [Get Project](#get_project) | GET | /projects/{project_id} | Y/Y | Domain Admin (DA), L3+ Support, System Adminstrator (SA) |
| Projects | [Get Project](#get_project) | GET | /projects/{project_id} | Y/Y | Domain Admin (DA), L3 Support, L3+ Support, System Adminstrator (SA) |
| Projects | [Get Project](#get_project) | GET | /projects/{project_id} | Y/Y | Domain Admin (DA), L3 Support, L3+ Support, System Adminstrator (SA) |
| Role Assignment | [Grant Role To A User On Project](#grant_role_to_a_user_on_project) | PUT | /projects/{project_id}/users/{user_id}/roles/{role_id} | Y/Y | SA, DA |
| Role Assignment | [Check If User Has Role On Project](#check_if_user_has_role_on_project) | HEAD | /projects/{project_id}/users/{user_id}/roles/{role_id} | Y/Y | SA, DA, DU |
| Role Assignment | [List User's Roles On Project](#list_users_roles_on_project) | GET | /projects/{project_id}/users/{user_id}/roles | Y/Y | SA, DA, DU |
| Role Assignment | [Revoke Role From User On Project](#revoke_role_from_user_on_project) | DELETE | /projects/{project_id}/users/{user_id}/roles/{role_id} | Y/Y | SA, DA |
| Role Assignment | [Assign A Domain (non-project) Role Assignment In The Specified Domain For The Specified User](#assign_a_domain_(non-project)_role_assignment_in_the_specified_domain_for_the_specified_user) | PUT | /domains/{domain_id}/users/{user_id}/roles/{role_id} | Y/Y | System Adminstrator (SA), Domain Admin (DA) |
| Role Assignment | [Check For Existence Of Domain (non-project) Role Assignment For A Given User](#check_for_existence_of_domain_(non-project)_role_assignment_for_a_given_user) | HEAD | /domains/{domain_id}/users/{user_id}/roles/{role_id} | Y/Y | System Adminstrator (SA), Domain Admin (DA), Domain User (DU) |
| Role Assignment | [List User's Roles On A Domain](#list_users_roles_on_a_domain) | GET | /domains/{domain_id}/users/{user_id}/roles | Y/Y | System Adminstrator (SA), Domain Admin (DA), Domain User (DU) |
| Role Assignment | [Revoke Role From User On Domain](#revoke_role_from_user_on_domain) | DELETE | /domains/{domain_id}/users/{user_id}/roles/{role_id} | Y/Y | System Adminstrator (SA), Domain Admin (DA) |
| Roles | [Create Role Definition](#create_role_definition) | POST | /roles | Y/Y | SA, SVC, DA |
| Roles | [Get A Role Definition](#get_a_role_definition) | GET | /roles/{role_id} | Y/Y | SA, SVC |
| Roles | [List Role Definitions](#list_role_definitions) | GET | /roles | Y/Y | SA, SVC |
| Roles | [Update Role Definition](#update_role_definition) | PUT | /roleDefs/{role_id} | Y/Y | SA, SVC, DA |
| Roles | [Delete A Role Definition](#delete_a_role_definition) | DELETE | /roles/{role_id} | Y/Y | SA, SVC, DA |
| Tokens | [Authenticate](#authenticate) | POST | /v3/auth/tokens | Y/Y | Anon |
| Tokens | [Rescope Token](#rescope_token) | POST | /v3/auth/tokens | Y/Y | SS |
| Tokens | [Revoke Token](#revoke_token) | DELETE | /v3/auth/tokens | Y/Y | SA,DA,SS |
| Tokens | [Validate Token](#validate_token) | GET | /v3/auth/tokens/HP-IDM-serviceId=110,global,130&HP-IDM-endpointTemplateId=110,111 | Y/Y | Anon |
| Tokens | [Quick Token Validation](#quick_token_validation) | HEAD | /v3/auth/tokens | Y/Y | Anon |
| Versions | [List Versions](#list_versions) | GET | / | Y/Y | Anon |

### 3.2 Common Request Headers
*List the common response headers i.e. X-Auth-Token, Content-Type, Content-Length, Date etc.*

### 3.3 Common Response Headers
*List the common response headers i.e. Content-Type, Content-Length, Connection, Date, ETag, Server, etc.*

### 3.4 Admin API Operation Details
*The following section, enumerates each resource and describes each of its API calls as listed in the Service API Operations section, documenting the naming conventions, request and response formats, status codes, error conditions, rate limits, quota limits, and specific business rules.*


#### 3.4.1 Credentials

Credentials are user authentication credentials. A user may have up to three (3) active credentials at a time. An HTTP code 403 will be returned if an operation (i.e. create/import/update) will exceed the maximum number of active credentials.

Credential consist of the following fields:

| Attribute | Type | Description |
| :---------| :----| :-----------|
| id | string | credential ID |
| user_id | string | user ID of the user who ownes of the credential |
| type | string | credential type |
| blob | string | credential data |

HP supports credential type `HP-IDM:access-key`.

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

HP supports the following key staus:

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

Credentials are uniquely identified by access key ID, which is the same as credential ID.

When SA or DA performing CRUD operations on behalf of another user, the user ID of the affected user must be present in either the request body or in the query parameter.

**Differences Between HP and OpenStack Keystone**

HP does not support credential type `ec2`. Instead, HP supports credential type `HP-IDM:access-key` with additional functionalities. HP access keys can be used to perform EC2 operations.

HP allows maximum of three (3) active credentials at any given time. OpenStack Keystone has no limit on the number of credential a user can own. When listing credentials, you may use `status` query parameter to list the active credentials only. i.e. `status=active`. Otherwise, all credentials are returned. An HTTP code 403 will be returned if an operation (i.e. create/import/update) will exceed the maximum number of active credentials.

OpenStack Keystone supports optionally scoping a credential to a project by providing an `project_id` field. HP does not support project scoping. If `project_id` is present during credential creation/import, it will be ignored.

HP will enforce key length during import. If the given `secret` field is less than the minimum 64 bits or greater than the maximum of 512 bits, an HTTP code 400 will be returned.

HP support both credential creation and credential import while OpenStack Keystone only supports credential import. Credential creation is a mechanism to have the system to generate the credential on behalf of the user.

HP supports self-service model for credential import and creation while OpenStack Keystone does not. For self-service model, `user_id` is optional. If absent, it will be default to the user ID associated with the caller`s token.


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
*Privilege Level: SS*

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
*Privilege Level: SS*

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
*Privilege Level: SS*

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
*Privilege Level: SS*

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
*Privilege Level: SS*

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


#### 3.4.2 Domains

The entity that serves as a collection of users, groups, roles, and tenants. It represents the primary relationship between the customer and HP.  A Domain can be an individual or company.

**Status Lifecycle**

N/A

**Rate Limits**

N/A

**Quota Limits**

N/A

**Business Rules**

None.


##### 3.4.2.1 Check For Existence Of Domain Name ##### {#check_for_existence_of_domain_name}
##### HEAD /HP-IDM/v1.0/domains
*Privilege Level: Anonymous*

This API does case insensitive domainName lookup in system. It returns http status code 200 (Ok) when provided domainName exists and returns 404 (not found) when provided domainName is not found in the system. If provided domainName is blank or missing, then it returns 204 (No content). The domain name with extra spaces is converted to single space in-between words and then look up is done for its existence. So domain name " Abc Corp" and "ABC    Corp" are treated as same and will be found if entry is there in system. In system, the corresponding name is going to be stored as "abc corp" in a separate field.    
  
As this API just checks for existence of provided domainName, it does not do look into status (or any other entity attribute) for case when matching domain is found.

**Request Data**

This API does not require http header X-Auth-Token and is protected by client certificate authentication. There is no response body returned in API response data. 

**URL Parameters**

* *name* - string - name of the domain to look for existence (required)

**Data Parameters**

This call does not require a request body

JSON

    HEAD https://localhost:35357/v2.0/HP-IDM/v1.0/domains?name=DoMaiN_2012_08_21_11_01_30_565 HTTP/1.1  
    Accept-Encoding: gzip,deflate  
    Accept: application/json  

XML

Case-insensitive lookup of above domainName

    HEAD https://localhost:35357/v2.0/HP-IDM/v1.0/domains?name=domain_2012_08_21_11_01_30_565 HTTP/1.1  
    Accept-Encoding: gzip,deflate  
    Accept: application/xml  

Optional:

JSON 

When provided domainName not found

    HEAD https://localhost:35357/v2.0/HP-IDM/v1.0/domains?name=DoMaiN_2012_08_21565 HTTP/1.1  
    Accept-Encoding: gzip,deflate  
    Accept: application/json  

When missing domainName in request

    HEAD https://localhost:35357/v2.0/HP-IDM/v1.0/domains HTTP/1.1  
    Accept-Encoding: gzip,deflate  
    Accept: application/xml  

**Success Response**

There is no response body returned. Status code indicates the result where 200 indicates that provided name exists and 404 indicates when name does not exist.

**Status Code**

200 - OK , 404 - NOT FOUND

**Response Data**

This call does not return a response body and result is determined through returned http status code. Response body is present only in case of errors.

JSON

    HTTP/1.1 200 OK  
    Server: Apache-Coyote/1.1  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Length: 0  
    Date: Tue, 21 Aug 2012 19:15:56 GMT  

XML

Response for case-insensitive lookup of above domainName

    HTTP/1.1 200 OK  
    Server: Apache-Coyote/1.1  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Length: 0  
    Date: Tue, 21 Aug 2012 19:17:00 GMT  

**Error Response**

Status code 204 is returned when either domain name is missing or blank.

**Status Code**

| Status Code | Description | Reasons |  
| :-----------| :-----------| :-------|  
| 204 | No Content | When domainName is missing or blank |  
| 400 | Bad Request | Malformed request in URI |  
| 500 | Internal Server Error | The server encountered a problem while processing the request|  
| 503 | Service Unavailable | The server is unavailable to process the request |  


**Response Data**

JSON

When provided domainName is not found

    HTTP/1.1 404 Not Found  
    Server: Apache-Coyote/1.1  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: \-1  
    Content-Type: text/html;charset=utf-8  
    Content-Length: 952  
    Date: Tue, 21 Aug 2012 19:17:43 GMT  

When missing domainName in request

    HTTP/1.1 204 No Content  
    Server: Apache-Coyote/1.1  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: \-1  
    Date: Tue, 21 Aug 2012 19:18:23 GMT  


**Curl Example**

    curl -k  --cert dev_hpmiddleware.pem  -I -H "Accept: application/json" "https://localhost:35357/v2.0/HP-IDM/v1.0/domains?name=DoMaiN_2012_08_21565"  

**Additional Notes**




##### 3.4.2.2 Create A Domain ##### {#create_a_domain}
##### GET /HP-IDM/v1.0/domains 
*Privilege Level: System Adminstrator (SA)*

Creates a domain using the specified request body. A response body is also returned with the new domain information with a service generated domainId.

**Request Data**

A valid token must be presented in the *X-Auth-Token* HTTP header. Otherwise, a 401 will be returned.

**URL Parameters**



**Data Parameters**

See schema file, domain.xsd, for more details on the request and response data structure.



* *name* - string - Name of the domain to be created
* *description* - (Optional) - string - description of domain
* *addressLine1* (Optional) - string - 
* *addressLine2* (Optional) - string - 
* *city* (Optional) - string - 
* *state* (Optional) - string - 
* *zip* (Optional) - string - 
* *country* (Optional) - string - 
* *phone* (Optional) - string - 
* *company* (Optional) - string - 
* *website* (Optional) - string - 
* *emailAddress* (Optional) - string -
* *billToAddress" (Optional) - Bill to Address 



JSON

    POST https://localhost:35357/v2.0/HP-IDM/v1.0/domains HTTP/1.1  
    Accept-Encoding: gzip,deflate  
    Accept: application/json  
    X-Auth-Token: HPAuth_769bcc02e0bf775aee3c7c5bbc647087a29e3da7103e2dde0d95beabb61f07e3  
    Content-Type: application/json  
    Content-Length: 495  
    Host: localhost:35357  
    Connection: Keep-Alive  
    User-Agent: Apache-HttpClient/4.1.1 (java 1.5)  
    
    {  
      "domain" : {  
        "description" : "See's Candies Domain",  
        "anies" : null,  
        "addressLine1" : "128, Market Blvd",  
        "addressLine2" : null,  
        "city" : "San Francisco",  
        "company" : null,  
        "country" : "USA",  
        "domainId" : "50277849949620",  
        "emailAddress" : "owner@sees.com",  
        "name" : "Sees Candies",  
        "otherAttributes" : {  
        },  
        "phone" : "1-800-555-1212",  
        "state" : "CA",  
        "status" : "enabled",  
        "website" : "www.sees.com",  
        "zip" : "90210"  
      }  
    }  

XML

    POST /v2.0/HP-IDM/v1.0/domains HTTP/1.1  
    Accept: application/xml  
    Content-Type: application/xml  
    User-Agent: Wink Client v1.1.2  
    X-Auth-Token: HPAuth_4f47d0b12cdc8b1c3905dbda  
    Host: localhost:9999  
    Connection: keep-alive  
    Content-Length: 617  
     
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>  
    <domain xmlns="http://docs.openstack.org/identity/api/ext/hp/v1.0" xmlns:ns2="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" xmlns:ns3="http://docs.openstack.org/identity/api/v2.0" xmlns:ns4="http://www.w3.org/2005/Atom" xmlns:ns5="http://docs.openstack.org/common/api/v1.0" name="HP Private Cloud Domain" emailAddress="hp-private-cloud-6@hp.com" addressLine1="1, HP Way" city="Cupertino" state="CA" zip="90210" country="USA" website="www.hp.com" company="HP" phone="1-888-555-1212" status="enabled">  
      <description>Hp's Private Cloud Domain</description>  
      <billToAddress addressLine1="123 Smoke Test Lane" city="The Smoky City" state="SmokyState" zip="90909" country="USA">  
       </billToAddress>   
    </domain>  

Optional:


**Success Response**

The response body contains data for newly created domain with http status code of 201.

**Status Code**

201 - CREATED

**Response Data**

Response data structure is same as input domain data

JSON

    HTTP/1.1 201 Created  
    Server: Apache-Coyote/1.1  
    Set-Cookie: JSESSIONID=5A0C0E3AD8FBB574807901C3F1FB5741; Path=/; Secure  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/json  
    Content-Length: 426  
    Date: Tue, 30 Oct 2012 20:19:32 GMT  
    
    {  
      "domain" : {  
        "description" : "See's Candies Domain",  
        "addressLine1" : "128, Market Blvd",  
        "city" : "San Francisco",  
        "country" : "USA",  
        "domainId" : "25279093386747",  
        "emailAddress" : "owner@sees.com",  
        "name" : "Sees Candies",  
        "otherAttributes" : {  
        },  
        "phone" : "1-800-555-1212",  
        "state" : "CA",  
        "status" : "enabled",  
        "website" : "www.sees.com",  
        "zip" : "90210"  
      }  
    }  

XML

    HTTP/1.1 201 Created  
    Server: Apache-Coyote/1.1  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/xml  
    Content-Length: 643  
    Date: Fri, 24 Feb 2012 18:02:43 GMT  
     
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>  
    <domain xmlns="http://docs.openstack.org/identity/api/ext/hp/v1.0" xmlns:ns2="http://docs.openstack.org/identity/api/v2.0" xmlns:ns3="http://docs.openstack.org/common/api/v1.0" xmlns:ns4="http://www.w3.org/2005/Atom" xmlns:ns5="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" domainId="80354991891807" name="HP Private Cloud Domain" emailAddress="hp-private-cloud-6@hp.com" addressLine1="1, HP Way" city="Cupertino" state="CA" zip="90210" country="USA" website="www.hp.com" company="HP" phone="1-888-555-1212" status="enabled">  
      <description>Hp's Private Cloud Domain</description>  
      <billToAddress addressLine1="123 Smoke Test Lane" city="The Smoky City" state="SmokyState" zip="90909" country="USA">  
       </billToAddress>   
    </domain>  

**Error Response**

Please refer to error response body for additional details.

**Status Code**


| Status Code | Description | Reasons |  
| :-----------| :-----------| :-------|  
| 400 | Bad Request | Malformed request in URI or request body   |  
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation   |  
| 403 | Forbidden | Disabled or suspended user making the request |  
| 409 | Identity Fault | A Domain with the required parameters already exist in the system  |  
| 500 | Internal Server Error | The server encountered a problem while processing the request|  
| 503 | Service Unavailable | The server is unavailable to process the request |  



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

In case domain name already exists
    HTTP/1.1 409 Conflict  
    Server: Apache-Coyote/1.1  
    Set-Cookie: JSESSIONID=8AD5634E0DBA2968E3136CDB8F3C6EB5; Path=/; Secure  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/json  
    Content-Length: 154  
    Date: Tue, 30 Oct 2012 20:20:32 GMT  
    
    {  
      "IdentityFault" : {  
        "message" : "Identity fault",  
        "details" : "Domain already exists",  
        "code" : 409,  
        "otherAttributes" : {  
        }  
      }  
    }  

XML

    <?xml version="1.0" encoding="UTF-8" standalone="yes"?><unauthorized xmlns="http://docs.openstack.org/identity/api/v2.0" xmlns:ns2="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" xmlns:ns3="http://docs.openstack.org/common/api/v1.0" xmlns:ns4="http://www.w3.org/2005/Atom" code="401"><message>UNAUTHORIZED</message><details>Invalid credentials</details></unauthorized>  

**Curl Example**

    curl -k --cert dev_hpmiddleware.pem  -XPOST -H "X-Auth-Token: HPAuth_769bcc02e0bf775aee3c7c5bbc647087a29e3da7103e2dde0d95beabb61f07e3" -H "Content-type: application/json" -d '{  "domain" : {  "name" : "Sees Candies 6" } }'  https://localhost:35357/v2.0/HP-IDM/v1.0/domains  

**Additional Notes**



##### 3.4.2.3 Delete A Domain ##### {#delete_a_domain}
##### DELETE /HP-IDM/v1.0/domains/{domainId} 
*Privilege Level: System Adminstrator (SA)*

Deletes the specified domain by its {domainID}. This API deletes the Users, Tenants, Groups, Roles, RoleRefs and Grants associated to the Domain.

**Request Data**

A valid token must be presented in the *X-Auth-Token* HTTP header. Otherwise, a 401 will be returned.

**URL Parameters**



**Data Parameters**

This call does not require a request body

JSON

    DELETE https://localhost:35357/v2.0/HP-IDM/v1.0/domains/27999842874196 HTTP/1.1  
    Accept-Encoding: gzip,deflate  
    Accept: application/json  
    X-Auth-Token: HPAuth_769bcc02e0bf775aee3c7c5bbc647087a29e3da7103e2dde0d95beabb61f07e3  
    Host: localhost:35357  
    Connection: Keep-Alive  
    User-Agent: Apache-HttpClient/4.1.1 (java 1.5)  

XML

Now trying to delete previously deleted domain, expecting error.

    DELETE https://localhost:35357/v2.0/HP-IDM/v1.0/domains/27999842874196 HTTP/1.1  
    Accept-Encoding: gzip,deflate  
    Accept: application/xml  
    X-Auth-Token: HPAuth_769bcc02e0bf775aee3c7c5bbc647087a29e3da7103e2dde0d95beabb61f07e3  
    Host: localhost:35357  
    Connection: Keep-Alive  
    User-Agent: Apache-HttpClient/4.1.1 (java 1.5)  

Optional:



**Success Response**

There is no respone body and respons code of 204 is returned after successful deletion of domain.

**Status Code**

204 - No Content

**Response Data**

This call does not have a response body other than in case of errors.

JSON

    HTTP/1.1 204 No Content  
    Server: Apache-Coyote/1.1  
    Set-Cookie: JSESSIONID=38FAFEF8E7816E6B717B1328FC6AFF49; Path=/; Secure  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Date: Tue, 30 Oct 2012 21:30:16 GMT  

XML

Response for deleting previously deleted domain.

    HTTP/1.1 404 Not Found  
    Server: Apache-Coyote/1.1  
    Set-Cookie: JSESSIONID=5E50B7163151DDF072B2B0E5AF5B33BF; Path=/; Secure  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/xml  
    Content-Length: 368  
    Date: Tue, 30 Oct 2012 21:31:04 GMT  
    
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?><itemNotFound xmlns="http://docs.openstack.org/identity/api/v2.0" xmlns:ns2="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" xmlns:ns3="http://docs.openstack.org/common/api/v1.0" xmlns:ns4="http://www.w3.org/2005/Atom" code="404"><message>Not found</message><details>Domain does not exist</details></itemNotFound>  

**Error Response**

Please refer to error response body for additional details.

**Status Code**

| Status Code | Description | Reasons |  
| :-----------| :-----------| :-------|  
| 400 | Bad Request | Malformed request in URI or request body   |  
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation    |  
| 403 | Forbidden | Disabled or suspended user making the request. This error is also returned when there is dependent data that needs to be removed as well |  
| 404 | Not Found | The Domain for domainId does not exist    |  
| 500 | Internal Server Error | The server encountered a problem while processing the request|  
| 503 | Service Unavailable | The server is unavailable to process the request |  

**Response Data**

JSON

Response for deleting previously deleted domain.

    HTTP/1.1 404 Not Found  
    Server: Apache-Coyote/1.1  
    Set-Cookie: JSESSIONID=E58C6550A98478BD88C3392EB379F734; Path=/; Secure  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/json  
    Content-Length: 148  
    Date: Tue, 30 Oct 2012 21:43:21 GMT  
    
    {  
      "itemNotFound" : {  
        "code" : 404,  
        "details" : "Domain does not exist",  
        "message" : "Not found",  
        "otherAttributes" : {  
        }  
      }  
    }  

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

    curl -k --cert dev_hpmiddleware.pem  -XDELETE -H "X-Auth-Token: HPAuth_769bcc02e0bf775aee3c7c5bbc647087a29e3da7103e2dde0d95beabb61f07e3" -H "Content-type: application/json" https://localhost:35357/v2.0/HP-IDM/v1.0/domains/27999842874196  

**Additional Notes**



##### 3.4.2.4 Get A Domain ##### {#get_a_domain}
##### GET /HP-IDM/v1.0/domains/{domainId} 
*Privilege Level: System Adminstrator (SA), Domain Admin (DA), Domain User (DU)*

Get a domain based on the {domainId} specified. DomainId's are opaque values returned with get domain list operations. 

**Request Data**

A valid token must be presented in the *X-Auth-Token* HTTP header. Otherwise, a 401 will be returned.

**URL Parameters**


**Data Parameters**

See schema file for more details on the request and response data structure.

This call does not require a request body

JSON

    GET https://localhost:35357/v2.0/HP-IDM/v1.0/domains/63283648950838 HTTP/1.1  
    Accept-Encoding: gzip,deflate  
    Accept: application/json  
    X-Auth-Token: HPAuth_5032ad14957cb3caab6c33eb  

XML

    GET https://localhost:35357/v2.0/HP-IDM/v1.0/domains/81132865245171 HTTP/1.1GET https://localhost:35357/v2.0/HP-IDM/v1.0/domains/63283648950838 HTTP/1.1  
    Accept-Encoding: gzip,deflate  
    Accept: application/xml  
    X-Auth-Token: HPAuth_5032ad14957cb3caab6c33eb  

Optional:



**Success Response**

The domain data is returned with http status code of 200 for provided domainId.

**Status Code**

200 - OK

**Response Data**

See schema file, domain.xsd, for more details on the domain response data structure.

JSON

    HTTP/1.1 200 OK  
    Server: Apache-Coyote/1.1  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/json  
    Content-Length: 603  
    Date: Mon, 20 Aug 2012 23:07:59 GMT  
     
    {  
      "domain" : {  
        "description" : "Hp's Private Cloud Domain",  
        "anies" : null,  
        "addressLine1" : "1, HP Way",  
        "addressLine2" : null,  
        "billingId" : "4028e69737163f4e013732dc605210ba",  
        "city" : "Cupertino",  
        "company" : "HP",  
        "contactId" : "001Q000000TU4q4IAD",  
        "country" : "USA",  
        "domainId" : "63283648950838",  
        "emailAddress" : "hp-private-cloud-6@hp.com",  
        "name" : "HP Private Cloud Domain",  
        "otherAttributes" : {  
        },  
        "phone" : "1-888-555-1212",  
        "state" : "CA",  
        "status": "suspended:2",  
        "statusCode": "21"  
        "website" : "www.hp.com",  
        "zip" : "90210"  
      }  
    }  

XML

    HTTP/1.1 200 OK  
    Server: Apache-Coyote/1.1  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/xml  
    Content-Length: 719  
    Date: Mon, 20 Aug 2012 23:06:39 GMT  
     
    <domain domainId="63283648950838" name="HP Private Cloud Domain" emailAddress="hp-private-cloud-6@hp.com" addressLine1="1, HP Way" city="Cupertino" state="CA" zip="90210" country="USA" website="www.hp.com" company="HP" phone="1-888-555-1212" status="suspended:2" statusCode="21" billingId="4028e69737163f4e013732dc605210ba" contactId="001Q000000TU4q4IAD" xmlns="http://docs.openstack.org/identity/api/ext/hp/v1.0" xmlns:ns2="http://docs.openstack.org/identity/api/v2.0" xmlns:ns3="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" xmlns:ns4="http://docs.openstack.org/common/api/v1.0" xmlns:ns5="http://www.w3.org/2005/Atom">  
       <description>Hp's Private Cloud Domain</description>  
       <billToAddress addressLine1="123 Smoke Test Lane" city="The Smoky City" state="SmokyState" zip="90909" country="USA">  
       </billToAddress>   
    </domain>  

**Error Response**

Please refer to error response body for additional details.


**Status Code**

| Status Code | Description | Reasons |  
| :-----------| :-----------| :-------|  
| 400 | Bad Request | Malformed request in URI or request body   |  
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.    |  
| 403 | Forbidden | Disabled or suspended user making the request |  
| 404 | Not Found | The Domain for domainId does not exist    |  
| 500 | Internal Server Error | The server encountered a problem while processing the request|  
| 503 | Service Unavailable | The server is unavailable to process the request |  

**Response Data**

JSON

When provided domainId is not found in the system

    HTTP/1.1 404 Not Found  
    Server: Apache-Coyote/1.1  
    Set-Cookie: JSESSIONID=FFE0355EF1D55E4EC60754298955D53C; Path=/; Secure  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/json  
    Content-Length: 148  
    Date: Tue, 30 Oct 2012 23:32:45 GMT  
    
    {  
      "itemNotFound" : {  
        "code" : 404,  
        "details" : "Domain does not exist",  
        "message" : "Not found",  
        "otherAttributes" : {  
        }  
      }  
    }  

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

    curl -k --cert dev_hpmiddleware.pem  -XGET -H "X-Auth-Token: HPAuth_769bcc02e0bf775aee3c7c5bbc647087a29e3da7103e2dde0d95beabb61f07e3" -H "Accept: application/json" https://localhost:35357/v2.0/HP-IDM/v1.0/domains/27999842874196  

**Additional Notes**


##### 3.4.2.5 Get All Domains ##### {#get_all_domains}
##### GET /HP-IDM/v1.0/domains
*Privilege Level: System Adminstrator (SA)*

Allows reading a list of all domains. This API supports pagination through 'limit' and 'marker' usage. The returned list may be filtered to allow only those domains which the caller has access to. 

**Request Data**

A valid token must be presented in the *X-Auth-Token* HTTP header. Otherwise, a 401 will be returned.


**URL Parameters**


* *limit (Optional)* - integer - represents the maximum number of elements which will be returned in the request. Default is 100.
* *marker (Optional)* - string - the resource Id of the last item in the previous list
* *name* (Optional)} - string - filter by domain name

**Data Parameters**

This call does not require a request body

JSON

With limit parameter provided

    GET https://localhost:35357/v2.0/HP-IDM/v1.0/domains?limit=2 HTTP/1.1  
    Accept-Encoding: gzip,deflate  
    Accept: application/json  
    X-Auth-Token: HPAuth_769bcc02e0bf775aee3c7c5bbc647087a29e3da7103e2dde0d95beabb61f07e3  
    Host: localhost:35357  
    Connection: Keep-Alive  
    User-Agent: Apache-HttpClient/4.1.1 (java 1.5)  
    
    

XML

    GET https://localhost:35357/v2.0/HP-IDM/v1.0/domains HTTP/1.1  
    Accept-Encoding: gzip,deflate  
    Accept: application/xml  
    X-Auth-Token: HPAuth_769bcc02e0bf775aee3c7c5bbc647087a29e3da7103e2dde0d95beabb61f07e3  
    Host: localhost:35357  
    Connection: Keep-Alive  
    User-Agent: Apache-HttpClient/4.1.1 (java 1.5)  
    

Optional:

JSON

With marker and parameter both set


    GET https://localhost:35357/v2.0/HP-IDM/v1.0/domains?limit=2&marker=23213441623236 HTTP/1.1  
    Accept-Encoding: gzip,deflate  
    Accept: application/json  
    X-Auth-Token: HPAuth_769bcc02e0bf775aee3c7c5bbc647087a29e3da7103e2dde0d95beabb61f07e3  
    Host: localhost:35357  
    Connection: Keep-Alive  
    User-Agent: Apache-HttpClient/4.1.1 (java 1.5)  


**Success Response**

Returns list of domains for given input with http status code 200.

**Status Code**

200 - OK

**Response Data**



JSON

Listing all domains response

    HTTP/1.1 200 OK  
    Server: Apache-Coyote/1.1  
    Set-Cookie: JSESSIONID=9CE7501B1B4C569F720C15B6692C7DD2; Path=/; Secure  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/json  
    Content-Length: 2353  
    Date: Tue, 30 Oct 2012 23:53:11 GMT  
    
    {  
      "domains" : {  
        "domain" : [ {  
          "owners" : {  
            "owner" : [ {  
              "otherAttributes" : {  
              },  
              "userId" : "00000000003001"  
            } ]  
          },  
          "domainId" : "00000000001001",  
          "name" : "HP Cloud System Domain",  
          "otherAttributes" : {  
          },  
          "status" : "enabled"  
        }, {  
          "domainId" : "23213441623236",  
          "name" : "Sees Candies 6",  
          "otherAttributes" : {  
          },  
          "status" : "enabled"  
        }, {  
          "description" : "See's Candies Domain",  
          "addressLine1" : "128, Market Blvd",  
          "city" : "San Francisco",  
          "country" : "USA",  
          "domainId" : "25279093386747",  
          "emailAddress" : "owner@sees.com",  
          "name" : "Sees Candies",  
          "otherAttributes" : {  
          },  
          "phone" : "1-800-555-1212",  
          "state" : "CA",  
          "status" : "enabled",  
          "website" : "www.sees.com",  
          "zip" : "90210"  
        }, {  
          "domainId" : "45548920306336",  
          "name" : "Sees Candies 5",  
          "otherAttributes" : {  
          },  
          "status" : "enabled"  
        }, {  
          "description" : "See's Candies Domain",  
          "addressLine1" : "128, Market Blvd",  
          "city" : "San Francisco",  
          "country" : "USA",  
          "domainId" : "53584481318159",  
          "emailAddress" : "owner@sees.com",  
          "name" : "Sees Candies 2",  
          "otherAttributes" : {  
          },  
          "phone" : "1-800-555-1212",  
          "state" : "CA",  
          "status" : "enabled",  
          "website" : "www.sees.com",  
          "zip" : "90210"  
        }, {  
          "owners" : {  
            "owner" : [ {  
              "otherAttributes" : {  
              },  
              "userId" : "77641675774128"  
            } ]  
          },  
          "domainId" : "69985299710130",  
          "emailAddress" : "test@test.com",  
          "name" : "69985299710130-DOMAIN",  
          "otherAttributes" : {  
          },  
          "status" : "enabled"  
        }, {  
          "domainId" : "82997401317216",  
          "name" : "Sees Candies 4",  
          "otherAttributes" : {  
          },  
          "status" : "enabled"  
        }, {  
          "owners" : {  
            "owner" : [ {  
              "otherAttributes" : {  
              },  
              "userId" : "74110440977688"  
            } ]  
          },  
          "domainId" : "95403455987464",  
          "emailAddress" : "test@test.com",  
          "name" : "95403455987464-DOMAIN",  
          "otherAttributes" : {  
          },  
          "status" : "enabled"  
        } ],  
        "otherAttributes" : {  
        }  
      }  
    }  

Listing response with marker and parameter both set
    HTTP/1.1 200 OK  
    Server: Apache-Coyote/1.1  
    Set-Cookie: JSESSIONID=587724ABE90EFF995115B4C07680F1F5; Path=/; Secure  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/json  
    Content-Length: 658  
    Date: Tue, 30 Oct 2012 23:51:42 GMT  
    
    {  
      "domains" : {  
        "domain" : [ {  
          "description" : "See's Candies Domain",  
          "addressLine1" : "128, Market Blvd",  
          "city" : "San Francisco",  
          "country" : "USA",  
          "domainId" : "25279093386747",  
          "emailAddress" : "owner@sees.com",  
          "name" : "Sees Candies",  
          "otherAttributes" : {  
          },  
          "phone" : "1-800-555-1212",  
          "state" : "CA",  
          "status" : "enabled",  
          "website" : "www.sees.com",  
          "zip" : "90210"  
        }, {  
          "domainId" : "45548920306336",  
          "name" : "Sees Candies 5",  
          "otherAttributes" : {  
          },  
          "status" : "enabled"  
        } ],  
        "otherAttributes" : {  
        }  
      }  
    }  

XML

    HTTP/1.1 200 OK  
    Server: Apache-Coyote/1.1  
    Set-Cookie: JSESSIONID=68E1E45A984F2747A98E2DF07E95B3E5; Path=/; Secure  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/xml  
    Content-Length: 1625  
    Date: Tue, 30 Oct 2012 23:54:44 GMT  
    
    <domains xmlns="http://docs.openstack.org/identity/api/ext/hp/v1.0" xmlns:ns2="http://docs.openstack.org/identity/api/v2.0" xmlns:ns3="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" xmlns:ns4="http://docs.openstack.org/common/api/v1.0" xmlns:ns5="http://www.w3.org/2005/Atom">  
       <domain domainId="00000000001001" name="HP Cloud System Domain" status="enabled">  
          <owners>  
             <owner userId="00000000003001"/>  
          </owners>  
       </domain>  
       <domain domainId="23213441623236" name="Sees Candies 6" status="enabled"/>  
       <domain domainId="25279093386747" name="Sees Candies" emailAddress="owner@sees.com" addressLine1="128, Market Blvd" city="San Francisco" state="CA" zip="90210" country="USA" website="www.sees.com" phone="1-800-555-1212" status="enabled">  
          <description>See's Candies Domain</description>  
          <billToAddress addressLine1="123 Smoke Test Lane" city="The Smoky City" state="SmokyState" zip="90909" country="USA">  
          </billToAddress>   
       </domain>  
       <domain domainId="45548920306336" name="Sees Candies 5" status="enabled"/>  
       <domain domainId="53584481318159" name="Sees Candies 2" emailAddress="owner@sees.com" addressLine1="128, Market Blvd" city="San Francisco" state="CA" zip="90210" country="USA" website="www.sees.com" phone="1-800-555-1212" status="enabled">  
          <description>See's Candies Domain</description>  
       </domain>  
       <domain domainId="69985299710130" name="69985299710130-DOMAIN" emailAddress="test@test.com" status="enabled">  
          <owners>  
             <owner userId="77641675774128"/>  
          </owners>  
       </domain>  
       <domain domainId="82997401317216" name="Sees Candies 4" status="enabled"/>  
       <domain domainId="95403455987464" name="95403455987464-DOMAIN" emailAddress="test@test.com" status="enabled">  
          <owners>  
             <owner userId="74110440977688"/>  
          </owners>  
       </domain>  
    </domains>  

**Error Response**

Please refer to error response body for additional details.

**Status Code**

| Status Code | Description | Reasons |  
| :-----------| :-----------| :-------|  
| 400 | Bad Request | Malformed request in URI   |  
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.    |  
| 403 | Forbidden | Disabled or suspended user making the request |  
| 404 | Not Found | When invalid marker is provided    |  
| 500 | Internal Server Error | The server encountered a problem while processing the request|  
| 503 | Service Unavailable | The server is unavailable to process the request |  

**Response Data**

JSON

When invalid marker is provided

    HTTP/1.1 404 Not Found  
    Server: Apache-Coyote/1.1  
    Set-Cookie: JSESSIONID=D3AC697EC1B71E03C6250E8EFDE8996E; Path=/; Secure  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/json  
    Content-Length: 154  
    Date: Tue, 30 Oct 2012 23:56:58 GMT  
    
    {  
      "itemNotFound" : {  
        "code" : 404,  
        "details" : "Marker in request not found",  
        "message" : "Not found",  
        "otherAttributes" : {  
        }  
      }  
    }  

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

    curl -k --cert dev_hpmiddleware.pem  -XGET -H "X-Auth-Token: HPAuth_769bcc02e0bf775aee3c7c5bbc647087a29e3da7103e2dde0d95beabb61f07e3" -H "Accept: application/json" https://localhost:35357/v2.0/HP-IDM/v1.0/domains  

**Additional Notes**


##### 3.4.2.6 Get Groups For A Domain ##### {#get_groups_for_a_domain}
##### GET /HP-IDM/v1.0/domains/{domainId}/groups
*Privilege Level: System Adminstrator (SA), Domain Admin (DA), Domain User (DU)*

This API is used to get list of groups for a given domain. Api results can be filtered by using parameters. Query parameters "marker" and "limit" can be used for pagination


**Request Data**

A valid token must be presented in the *X-Auth-Token* HTTP header. Otherwise, a 401 will be returned.

**URL Parameters**

* *limit (Optional)* - integer - represents the maximum number of elements which will be returned in the request. Default is 100.
* *marker (Optional)* - string - the resource Id of the last item in the previous list

Following filters can be used to filter the response data.

*Inclusion Filters*

* *groupId (Optional)* - string - include results for given groupId. Filters groupId and groupName are mutually exclusive. You can filter either using groupId or using groupName.
* *groupName (Optional)* - string - include results for given groupName. Filters groupId and groupName are mutually exclusive. You can filter either using groupId or using groupName  
* *tenantId (Optional)* - string - include results for given tenantId. Filters tenantId and tenantName are mutually exclusive. You can filter either using tenantId or using tenantName
* *tenantName (Optional)* - string - include results for given tenantName. Filters tenantId and tenantName are mutually exclusive. You can filter either using tenantId or using tenantName    

*Exclusion Filters*

* *excludeRoles (Optional)* - string - comma separated roleId to exclude 
* *excludeUsers (Optional)* - string - comma separated userId to exclude

**Data Parameters**

See schema file for more details on the request and response data structure.

This call does not require a request body

JSON

Request without filters
    GET https://localhost:35357/v2.0/HP-IDM/v1.0/domains/66751536630361/groups HTTP/1.1  
    Accept-Encoding: gzip,deflate  
    X-Auth-Token: HPAuth_b4d1cf88adb2b9eb97766444958a24ff2ee8b2f8e7d2e26500c5133f9e8ec776  
    Host: localhost:35357  
    Connection: Keep-Alive  
    User-Agent: Apache-HttpClient/4.1.1 (java 1.5)  

XML

Request with marker and groupName

    GET https://localhost:35357/v2.0/HP-IDM/v1.0/domains/66751536630361/groups?marker=20249143710988&groupName=Domain%20Administrators HTTP/1.1  
    Accept-Encoding: gzip,deflate  
    Accept: application/xml  
    X-Auth-Token: HPAuth_b4d1cf88adb2b9eb97766444958a24ff2ee8b2f8e7d2e26500c5133f9e8ec776  
    Host: localhost:35357  
    Connection: Keep-Alive  
    User-Agent: Apache-HttpClient/4.1.1 (java 1.5)  

Optional:

XML

Request with filters groupId and excludeRoles

    GET http://haneef-desktop.americas.hpqcorp.net:8080/v2.0/HP_IDM/v1.0/domains/641564254582/groups/groupId=1234&excludeRoles=roleId1,roleId2 HTTP/1.1  
    Connection: close  
    Accept: application/xml  
    User-Agent: Jakarta Commons-HttpClient/3.1  
    Host: haneef-desktop.americas.hpqcorp.net:8080  

Request with filters excludeUsers

    GET http://haneef-desktop.americas.hpqcorp.net:8080/v2.0/HP_IDM/v1.0/domains/641564254582/groups?excludeUsers=userId1,userId2 HTTP/1.1  
    Connection: close  
    Accept: application/xml  
    User-Agent: Jakarta Commons-HttpClient/3.1  
    Host: haneef-desktop.americas.hpqcorp.net:8080  

Request with filters tenantId and excludeRoles

    GET http://haneef-desktop.americas.hpqcorp.net:8080/v2.0/HP_IDM/v1.0/domains/641564254582/groups/tenantId=1234&excludeRoles=roleId1,roleId2 HTTP/1.1  
    Connection: close  
    Accept: application/xml  
    User-Agent: Jakarta Commons-HttpClient/3.1  
    Host: haneef-desktop.americas.hpqcorp.net:8080  

**Success Response**

List groups for domain for given filter criteria and marker if there with http status code 200.

**Status Code**

200 - OK

**Response Data**


JSON

    HTTP/1.1 200 OK  
    Server: Apache-Coyote/1.1  
    Set-Cookie: JSESSIONID=8DD402CDD89EF3A61D73B915F4B8BE42; Path=/; Secure  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/json  
    Content-Length: 474  
    Date: Wed, 31 Oct 2012 15:42:34 GMT  
    
    {  
      "groups" : {  
        "group" : [ {  
          "description" : "Sees Candies   3 Domain Administrators",  
          "domainId" : "66751536630361",  
          "id" : "20249143710988",  
          "name" : "Domain Administrators",  
          "otherAttributes" : {  
          }  
        }, {  
          "description" : "Sees Candies   3 Users",  
          "domainId" : "66751536630361",  
          "id" : "80305392769921",  
          "name" : "Users",  
          "otherAttributes" : {  
          }  
        } ],  
        "otherAttributes" : {  
        }  
      }  
    }  

XML

Request with marker and groupName

    HTTP/1.1 200 OK  
    Server: Apache-Coyote/1.1  
    Set-Cookie: JSESSIONID=10C0D5531A322E76410588242947F78D; Path=/; Secure  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/xml  
    Content-Length: 332  
    Date: Wed, 31 Oct 2012 16:44:21 GMT  
    
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?><groups xmlns="http://docs.openstack.org/identity/api/ext/hp/v1.0" xmlns:ns2="http://docs.openstack.org/identity/api/v2.0" xmlns:ns3="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" xmlns:ns4="http://docs.openstack.org/common/api/v1.0" xmlns:ns5="http://www.w3.org/2005/Atom"/>  


**Error Response**

Please refer to error response body for additional details.

**Status Code**

| Status Code | Description | Reasons |  
| :-----------| :-----------| :-------|  
| 400 | Bad Request | Malformed request in URI   |  
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.    |  
| 403 | Forbidden | Disabled or suspended user making the request |  
| 404 | Not Found | The specified domainId or groupId within the marker was not found. Or both groupId and groupName is specified   |  
| 500 | Internal Server Error | The server encountered a problem while processing the request|  
| 503 | Service Unavailable | The server is unavailable to process the request |  

**Response Data**

JSON

    {  
      "badRequest" : {  
        "code" : 400,  
        "details" : "Bad input request : Filters groupId and groupName are mutually exclusive.  You can't use both at the same time",  
        "message" : "Bad request",  
        "otherAttributes" : {  
        }  
      }  
    }  

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

    curl -k --cert dev_hpmiddleware.pem  -XGET -H "X-Auth-Token: HPAuth_769bcc02e0bf775aee3c7c5bbc647087a29e3da7103e2dde0d95beabb61f07e3" -H "Accept: application/json" https://localhost:35357/v2.0/HP-IDM/v1.0/domains/27999842874196/groups  

**Additional Notes**


##### 3.4.2.7 Get Subscribe Able Services For A Domain ##### {#get_subscribe_able_services_for_a_domain}
##### GET /HP-IDM/v1.0/domains/{domainId}/subscribeableServices
*Privilege Level: System Adminstrator (SA), Domain Admin (DA), Domain User (DU)*

This API returns all subscribe able services that are available for the given {domainId} . It can also filter the result based on service name or endpoint template id. In request, either 'serviceName' filter or 'serviceEndpointId' filter is to be used. If both of filter values are provided, then error is returned back. This is essentially endpoint template data with some additional subscription specific attributes.
Domain user can only list subcribeable services but cannot subscribe services so "canSubscribe" flag is returned as false. DA and SA both can list and subscribe services.

**Request Data**

A valid token must be presented in the *X-Auth-Token* HTTP header. Otherwise, a 401 will be returned.

**URL Parameters**


* *serviceName (Optional)* - string - Use service name if need to get subscrible data for all endpoints within that service.

* *endpointTemplateId (Optional)* - string - User endpoint template Id to get specific endpoint subscrible able data

**Data Parameters**

See schema file for more details on the response data structure.

This call does not require a request body.


JSON

    GET https://localhost:35357/v2.0/HP-IDM/v1.0/domains/66751536630361/subscribeableServices HTTP/1.1  
    Accept-Encoding: gzip,deflate  
    Accept: application/json  
    X-Auth-Token: HPAuth_b4d1cf88adb2b9eb97766444958a24ff2ee8b2f8e7d2e26500c5133f9e8ec776  
    Host: localhost:35357  
    Connection: Keep-Alive  
    User-Agent: Apache-HttpClient/4.1.1 (java 1.5)  

XML

    GET https://localhost:8443/v2.0/HP-IDM/v1.0/domains/64521341789596/subscribeableServices HTTP/1.1  
    Accept-Encoding: gzip,deflate  
    X-Auth-Token: HPAuth_4f46a309b0bebb59e36f663f  
    Accept: application/xml  
    User-Agent: Jakarta Commons-HttpClient/3.1  
    Host: localhost:8443  

Optional:

JSON

With serviceName filter
    GET https://localhost:35357/v2.0/HP-IDM/v1.0/domains/66751536630361/subscribeableServices?serviceName=Compute HTTP/1.1  
    Accept-Encoding: gzip,deflate  
    Accept: application/json  
    X-Auth-Token: HPAuth_b4d1cf88adb2b9eb97766444958a24ff2ee8b2f8e7d2e26500c5133f9e8ec776  
    Host: localhost:35357  
    Connection: Keep-Alive  
    User-Agent: Apache-HttpClient/4.1.1 (java 1.5)  


**Success Response**

The response is a list of subscribe able services for the domain. Results are filtered by serviceName if serviceName is provided. Result will include single subscribe able service as identified endpoint template id if its provided in query.

**Status Code**

200 - OK

**Response Data**


JSON

    {"subscribeableServices": {  
       "otherAttributes": {},  
       "subscribeableService":    [  
                {  
             "adminURL": "https://nv-aw2az1-manage0009.uswest.hpcloud.net/v1.1/",  
             "canSubscribe": true,  
             "enabled": true,  
             "endpointReleaseState": "public",  
             "global": false,  
             "id": "100",  
             "name": "Compute",  
             "otherAttributes": {},  
             "publicURL": "https://az-1.region-a.geo-1.compute.hpcloudsvc.com/v1.1/",  
             "publicURL2": "https://az-1.region-a.geo-1.ec2-compute.hpcloudsvc.com/services/Cloud/",  
             "region": "az-1.region-a.geo-1",  
             "releaseState": "public",  
             "type": "compute",  
             "version":          {  
                "id": "1.1",  
                "list": "https://az-1.region-a.geo-1.compute.hpcloudsvc.com",  
                "otherAttributes": {}  
             }  
          },  
                {  
             "adminURL": "https://nv-aw2az2-manage0009.uswest.hpcloud.net/v1.1/",  
             "canSubscribe": true,  
             "enabled": true,  
             "endpointReleaseState": "public",  
             "global": false,  
             "id": "110",  
             "name": "Compute",  
             "otherAttributes": {},  
             "publicURL": "https://az-2.region-a.geo-1.compute.hpcloudsvc.com/v1.1/",  
             "publicURL2": "https://az-2.region-a.geo-1.ec2-compute.hpcloudsvc.com/services/Cloud/",  
             "region": "az-2.region-a.geo-1",  
             "releaseState": "public",  
             "type": "compute",  
             "version":          {  
                "id": "1.1",  
                "list": "https://az-2.region-a.geo-1.compute.hpcloudsvc.com",  
                "otherAttributes": {}  
             }  
          },  
                {  
             "adminURL": "https://nv-aw2az3-manage0009.uswest.hpcloud.net/v1.1/",  
             "canSubscribe": true,  
             "enabled": true,  
             "endpointReleaseState": "public",  
             "global": false,  
             "id": "111",  
             "name": "Compute",  
             "otherAttributes": {},  
             "publicURL": "https://az-3.region-a.geo-1.compute.hpcloudsvc.com/v1.1/",  
             "publicURL2": "https://az-3.region-a.geo-1.ec2-compute.hpcloudsvc.com/services/Cloud/",  
             "region": "az-3.region-a.geo-1",  
             "releaseState": "public",  
             "type": "compute",  
             "version":          {  
                "id": "1.1",  
                "list": "https://az-3.region-a.geo-1.compute.hpcloudsvc.com",  
                "otherAttributes": {}  
             }  
          },  
                {  
             "adminURL": "https://region-a.geo-1.objects.hpcloudsvc.com/v1.0/",  
             "canSubscribe": true,  
             "enabled": true,  
             "endpointReleaseState": "public",  
             "global": false,  
             "id": "120",  
             "name": "Object Storage",  
             "otherAttributes": {},  
             "publicURL": "https://region-a.geo-1.objects.hpcloudsvc.com/v1.0/%tenant_id%",  
             "region": "region-a.geo-1",  
             "releaseState": "public",  
             "type": "object-store",  
             "version":          {  
                "id": "1.0",  
                "otherAttributes": {}  
             }  
          },  
                {  
             "adminURL": "https://region-a.geo-1.identity.hpcloudsvc.com/v2.0/",  
             "canSubscribe": true,  
             "enabled": true,  
             "endpointReleaseState": "public",  
             "global": true,  
             "id": "130",  
             "internalURL": "https://region-a.geo-1.identity-internal.hpcloudsvc.com/v2.0/",  
             "name": "Identity",  
             "otherAttributes": {},  
             "publicURL": "https://region-a.geo-1.identity.hpcloudsvc.com/v2.0/",  
             "region": "region-a.geo-1",  
             "releaseState": "public",  
             "type": "identity",  
             "version":          {  
                "id": "2.0",  
                "list": "https://region-a.geo-1.identity.hpcloudsvc.com/extension",  
                "otherAttributes": {}  
             }  
          },  
                {  
             "adminURL": "https://nv-aw2az1-manage0009.uswest.hpcloud.net/v1.1/",  
             "canSubscribe": true,  
             "enabled": true,  
             "endpointReleaseState": "public",  
             "global": false,  
             "id": "140",  
             "name": "Block Storage",  
             "otherAttributes": {},  
             "publicURL": "https://az-1.region-a.geo-1.compute.hpcloudsvc.com/v1.1/",  
             "region": "az-1.region-a.geo-1",  
             "releaseState": "public",  
             "type": "volume",  
             "version":          {  
                "id": "1.1",  
                "list": "https://az-1.region-a.geo-1.compute.hpcloudsvc.com",  
                "otherAttributes": {}  
             }  
          },  
     
                {  
             "canSubscribe": true,  
             "enabled": true,  
             "endpointReleaseState": "public",  
             "global": false,  
             "id": "150",  
             "name": "CDN",  
             "otherAttributes": {},  
             "publicURL": "https://region-a.geo-1.cdnmgmt.hpcloudsvc.com/v1.0/",  
             "region": "region-a.geo-1",  
             "releaseState": "public",  
             "type": "hpext:cdn",  
             "version":          {  
                "id": "1.0",  
                "otherAttributes": {}  
             }  
          },  
                {  
             "adminURL": "https://glance1.uswest.hpcloud.net:9292/v1.0",  
             "canSubscribe": true,  
             "enabled": true,  
             "endpointReleaseState": "public",  
             "global": false,  
             "id": "160",  
             "name": "Image Management",  
             "otherAttributes": {},  
             "region": "az-1.region-a.geo-1",  
             "releaseState": "public",  
             "type": "image",  
             "version":          {  
                "id": "1.0",  
                "otherAttributes": {}  
             }  
          },  
                {  
             "adminURL": "https://glance2.uswest.hpcloud.net:9292/v1.0",  
             "canSubscribe": true,  
             "enabled": true,  
             "endpointReleaseState": "public",  
             "global": false,  
             "id": "170",  
             "name": "Image Management",  
             "otherAttributes": {},  
             "region": "az-2.region-a.geo-1",  
             "releaseState": "public",  
             "type": "image",  
             "version":          {  
                "id": "1.0",  
                "otherAttributes": {}  
             }  
          },  
                {  
             "adminURL": "https://nv-aw2az2-manage0009.uswest.hpcloud.net/v1.1/",  
             "canSubscribe": true,  
             "enabled": true,  
             "endpointReleaseState": "public",  
             "global": false,  
             "id": "113",  
             "name": "EC2",  
             "otherAttributes": {},  
             "publicURL": "https://az-2.region-a.geo-1.ec2-compute.hpcloudsvc.com/services/Cloud/",  
             "region": "az-2.region-a.geo-1",  
             "releaseState": "public",  
             "type": "ec2",  
             "version":          {  
                "id": "1.1",  
                "list": "https://az-2.region-a.geo-1.compute.hpcloudsvc.com",  
                "otherAttributes": {}  
             }  
          },  
                {  
             "adminURL": "https://nv-aw2az3-manage0009.uswest.hpcloud.net/v1.1/",  
             "canSubscribe": true,  
             "enabled": true,  
             "endpointReleaseState": "public",  
             "global": false,  
             "id": "114",  
             "name": "EC2",  
             "otherAttributes": {},  
             "publicURL": "https://az-3.region-a.geo-1.ec2-compute.hpcloudsvc.com/services/Cloud/",  
             "region": "az-3.region-a.geo-1",  
             "releaseState": "public",  
             "type": "ec2",  
             "version":          {  
                "id": "1.1",  
                "list": "https://az-3.region-a.geo-1.compute.hpcloudsvc.com",  
                "otherAttributes": {}  
             }  
          }  
       ]  
    }}  

XML

    HTTP/1.1 200 OK  
    Server: Apache-Coyote/1.1  
    Set-Cookie: JSESSIONID=4ADA3703B5E45F3C198E4E4F0CC9A4D8; Path=/; Secure  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/xml  
    Content-Length: 5128  
    Date: Thu, 23 Feb 2012 20:37:58 GMT  
     
    <subscribeableServices xmlns="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" xmlns:ns2="http://docs.openstack.org/identity/api/ext/hp/v1.0" xmlns:ns3="http://docs.openstack.org/identity/api/v2.0" xmlns:ns4="http://docs.openstack.org/common/api/v1.0" xmlns:ns5="http://www.w3.org/2005/Atom">  
       <subscribeableService releaseState="public" endpointReleaseState="public" canSubscribe="true" id="100" type="compute" name="Compute" region="az-1.region-a.geo-1" publicURL="https://az-1.region-a.geo-1.compute.hpcloudsvc.com/v1.1/" publicURL2="https://az-1.region-a.geo-1.ec2-compute.hpcloudsvc.com/services/Cloud/" adminURL="https://nv-aw2az1-manage0009.uswest.hpcloud.net/v1.1/" global="false" enabled="true">  
          <version id="1.1" list="https://az-1.region-a.geo-1.compute.hpcloudsvc.com"/>  
          <subscribedInfo subscribedOn="2011-10-21T22:04:11.000Z" tenantId="36733265821255" status="deleted"/>  
          <subscribedInfo subscribedOn="2011-10-21T22:05:43.000Z" tenantId="79402136023481" status="enabled"/>  
       </subscribeableService>  
       <subscribeableService releaseState="public" endpointReleaseState="public" canSubscribe="true" id="110" type="compute" name="Compute" region="az-2.region-a.geo-1" publicURL="https://az-2.region-a.geo-1.compute.hpcloudsvc.com/v1.1/" publicURL2="https://az-2.region-a.geo-1.ec2-compute.hpcloudsvc.com/services/Cloud/" adminURL="https://nv-aw2az2-manage0009.uswest.hpcloud.net/v1.1/" global="false" enabled="true">  
          <version id="1.1" list="https://az-2.region-a.geo-1.compute.hpcloudsvc.com"/>  
       </subscribeableService>  
       <subscribeableService releaseState="public" endpointReleaseState="public" canSubscribe="true" id="111" type="compute" name="Compute" region="az-3.region-a.geo-1" publicURL="https://az-3.region-a.geo-1.compute.hpcloudsvc.com/v1.1/" publicURL2="https://az-3.region-a.geo-1.ec2-compute.hpcloudsvc.com/services/Cloud/" adminURL="https://nv-aw2az3-manage0009.uswest.hpcloud.net/v1.1/" global="false" enabled="true">  
          <version id="1.1" list="https://az-3.region-a.geo-1.compute.hpcloudsvc.com"/>  
       </subscribeableService>  
       <subscribeableService releaseState="public" endpointReleaseState="public" id="120" type="object-store" name="Object Storage" region="region-a.geo-1" publicURL="https://region-a.geo-1.objects.hpcloudsvc.com/v1.0/%tenant_id%" adminURL="https://region-a.geo-1.objects.hpcloudsvc.com/v1.0/" global="false" enabled="true">  
          <version id="1.0"/>  
          <subscribedInfo subscribedOn="2011-10-25T20:51:49.000Z" tenantId="72290583996765"/>  
       </subscribeableService>  
       <subscribeableService releaseState="public" endpointReleaseState="public" canSubscribe="true" id="130" type="identity" name="Identity" region="region-a.geo-1" publicURL="https://region-a.geo-1.identity.hpcloudsvc.com/v2.0/" internalURL="https://region-a.geo-1.identity.hpcloudsvc.com/v2.0/" adminURL="https://region-a.geo-1.identity.hpcloudsvc.com/v2.0/" global="true" enabled="true">  
          <version id="2.0" list="https://region-a.geo-1.identity.hpcloudsvc.com/extension"/>  
       </subscribeableService>  
       <subscribeableService releaseState="public" endpointReleaseState="public" canSubscribe="true" id="140" type="hpext:block-store" name="Block Storage" region="az-1.region-a.geo-1" publicURL="https://az-1.region-a.geo-1.compute.hpcloudsvc.com/v1.1/" adminURL="https://nv-aw2az1-manage0009.uswest.hpcloud.net/v1.1/" global="false" enabled="true">  
          <version id="1.1" list="https://az-1.region-a.geo-1.compute.hpcloudsvc.com"/>  
       </subscribeableService>  
       <subscribeableService releaseState="public" endpointReleaseState="public" canSubscribe="true" id="141" type="hpext:block-store" name="Block Storage" region="az-2.region-a.geo-1" publicURL="https://az-2.region-a.geo-1.compute.hpcloudsvc.com/v1.1/" adminURL="https://nv-aw2az2-manage0009.uswest.hpcloud.net/v1.1/" global="false" enabled="true">  
          <version id="1.1" list="https://az-2.region-a.geo-1.compute.hpcloudsvc.com"/>  
       </subscribeableService>  
       <subscribeableService releaseState="public" endpointReleaseState="public" canSubscribe="true" id="142" type="hpext:block-store" name="Block Storage" region="az-3.region-a.geo-1" publicURL="https://az-3.region-a.geo-1.compute.hpcloudsvc.com/v1.1/" adminURL="https://nv-aw2az3-manage0009.uswest.hpcloud.net/v1.1/" global="false" enabled="true">  
          <version id="1.1" list="https://az-3.region-a.geo-1.compute.hpcloudsvc.com"/>  
       </subscribeableService>  
       <subscribeableService releaseState="preview" endpointReleaseState="public" canSubscribe="false" id="150" type="hpext:cdn" name="CDN" region="region-a.geo-1" publicURL="https://region-a.geo-1.cdnmgmt.hpcloudsvc.com/v1.0/" global="false" enabled="true">  
          <version id="1.0"/>  
       </subscribeableService>  
       <subscribeableService releaseState="public" endpointReleaseState="public" canSubscribe="true" id="160" type="image" name="Image Management" region="az-1.region-a.geo-1" adminURL="https://glance1.uswest.hpcloud.net:9292/v1.0" global="false" enabled="true">  
          <version id="1.0"/>  
       </subscribeableService>  
       <subscribeableService releaseState="public" endpointReleaseState="public" canSubscribe="true" id="170" type="image" name="Image Management" region="az-2.region-a.geo-1" adminURL="https://glance2.uswest.hpcloud.net:9292/v1.0" global="false" enabled="true">  
          <version id="1.0"/>  
       </subscribeableService>  
       <subscribeableService releaseState="public" endpointReleaseState="public" canSubscribe="true" id="180" type="image" name="Image Management" region="az-3.region-a.geo-1" adminURL="https://glance3.uswest.hpcloud.net:9292/v1.0" global="false" enabled="true">  
          <version id="1.0"/>  
       </subscribeableService>  
    </subscribeableServices>  

Optional

JSON

With serviceName filter

    HTTP/1.1 200 OK  
    Server: Apache-Coyote/1.1  
    Set-Cookie: JSESSIONID=57031777BBA23809F2B7B172E342A8F9; Path=/; Secure  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/json  
    Content-Length: 2265  
    Date: Wed, 31 Oct 2012 18:13:14 GMT  
    
    {  
      "subscribeableServices" : {  
        "otherAttributes" : {  
        },  
        "subscribeableService" : [ {  
          "adminURL" : "https://nv-aw2az1-manage0009.uswest.hpcloud.net/v1.1/",  
          "canSubscribe" : true,  
          "enabled" : true,  
          "endpointReleaseState" : "public",  
          "global" : false,  
          "id" : "100",  
          "name" : "Compute",  
          "otherAttributes" : {  
          },  
          "publicURL" : "https://az-1.region-a.geo-1.compute.hpcloudsvc.com/v1.1/",  
          "publicURL2" : "https://az-1.region-a.geo-1.ec2-compute.hpcloudsvc.com/services/Cloud/",  
          "region" : "az-1.region-a.geo-1",  
          "releaseState" : "public",  
          "type" : "compute",  
          "version" : {  
            "id" : "1.1",  
            "list" : "https://az-1.region-a.geo-1.compute.hpcloudsvc.com",  
            "otherAttributes" : {  
            }  
          }  
        }, {  
          "adminURL" : "https://nv-aw2az2-manage0009.uswest.hpcloud.net/v1.1/",  
          "canSubscribe" : true,  
          "enabled" : true,  
          "endpointReleaseState" : "public",  
          "global" : false,  
          "id" : "110",  
          "name" : "Compute",  
          "otherAttributes" : {  
          },  
          "publicURL" : "https://az-2.region-a.geo-1.compute.hpcloudsvc.com/v1.1/",  
          "publicURL2" : "https://az-2.region-a.geo-1.ec2-compute.hpcloudsvc.com/services/Cloud/",  
          "region" : "az-2.region-a.geo-1",  
          "releaseState" : "public",  
          "type" : "compute",  
          "version" : {  
            "id" : "1.1",  
            "list" : "https://az-2.region-a.geo-1.compute.hpcloudsvc.com",  
            "otherAttributes" : {  
            }  
          }  
        }, {  
          "adminURL" : "https://nv-aw2az3-manage0009.uswest.hpcloud.net/v1.1/",  
          "canSubscribe" : true,  
          "enabled" : true,  
          "endpointReleaseState" : "public",  
          "global" : false,  
          "id" : "111",  
          "name" : "Compute",  
          "otherAttributes" : {  
          },  
          "publicURL" : "https://az-3.region-a.geo-1.compute.hpcloudsvc.com/v1.1/",  
          "publicURL2" : "https://az-3.region-a.geo-1.ec2-compute.hpcloudsvc.com/services/Cloud/",  
          "region" : "az-3.region-a.geo-1",  
          "releaseState" : "public",  
          "type" : "compute",  
          "version" : {  
            "id" : "1.1",  
            "list" : "https://az-3.region-a.geo-1.compute.hpcloudsvc.com",  
            "otherAttributes" : {  
            }  
          }  
        } ]  
      }  
    }  


**Error Response**

Please refer to error response body for additional details.

**Status Code**

| Status Code | Description | Reasons |  
| :-----------| :-----------| :-------|  
| 400 | Bad Request | Malformed request in URI; If present, non-numeric endpoint template id is provided; If present, invalid endpoint template id is provided.; If present, invalid service name is provided.; If both serviceName and endpointTemplateId values are provided. |  
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.    |  
| 403 | Forbidden | Disabled or suspended user making the request |  
| 404 | Not Found | The specified domainId or tenantId filter is not found   |  
| 500 | Internal Server Error | The server encountered a problem while processing the request|  
| 503 | Service Unavailable | The server is unavailable to process the request |  


**Response Data**

JSON

    HTTP/1.1 400 Bad Request  
    Server: Apache-Coyote/1.1  
    Set-Cookie: JSESSIONID=670399F2C2059BD56F33D988AE8A2712; Path=/; Secure  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/json  
    Content-Length: 181  
    Date: Wed, 31 Oct 2012 18:16:24 GMT  
    Connection: close  
    
    {  
      "badRequest" : {  
        "code" : 400,  
        "details" : "Invalid service name specified, serviceName = Computer",  
        "message" : "BAD_REQUEST",  
        "otherAttributes" : {  
        }  
      }  
    }  

    HTTP/1.1 404 Not Found  
    Server: Apache-Coyote/1.1  
    Set-Cookie: JSESSIONID=274CFEB4593E9BB8D00C8DED21E3E75B; Path=/; Secure  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/json  
    Content-Length: 193  
    Date: Wed, 31 Oct 2012 18:15:44 GMT  
    
    {  
      "itemNotFound" : {  
        "code" : 404,  
        "details" : "Domain with domainId : 66751536630362 does not exist in the System",  
        "message" : "NOT_FOUND",  
        "otherAttributes" : {  
        }  
      }  
    }  

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

    curl -k --cert dev_hpmiddleware.pem  -XGET -H "X-Auth-Token: HPAuth_b4d1cf88adb2b9eb97766444958a24ff2ee8b2f8e7d2e26500c5133f9e8ec776" -H "Accept: application/json" https://localhost:35357/v2.0/HP-IDM/v1.0/domains/66751536630361/subscribeableServices?serviceName=Compute   

**Additional Notes**



##### 3.4.2.8 Get Service Activations For A Domain ##### {#get_service_activations_for_a_domain}
##### GET /HP-IDM/v1.0/domains/{domainId}/services
*Privilege Level: System Adminstrator (SA), Domain Admin (DA), Domain User (DU)*

This API returns all services that have been activated for the given {domainId} . It can also filter the result based on tenantId. 

**Request Data**

A valid token must be presented in the *X-Auth-Token* HTTP header. Otherwise, a 401 will be returned.

**URL Parameters**


* *tenantId (Optional)* - string - tenantId to list service activation for that tenant
* *limit (Optional)* - integer - represents the maximum number of elements which will be returned in the request. Default is 100.
* *marker (Optional)* - string - the resource Id of the last item in the previous list. 'id' value in 'activatedService' response

**Data Parameters**

See schema file for more details on the response data structure.

This call does not require a request body.


JSON

Request with tenantId 

    GET https://localhost:35357/v2.0/HP-IDM/v1.0/domains/90681825319071/services?tenantId=24290042003272 HTTP/1.1  
    Accept-Encoding: gzip,deflate  
    Accept: application/json  
    X-Auth-Token: HPAuth_a46a8b6ddef111f44d569089564e2ee6efbe11f91cc04e0f7f3d26048e04df2d  
    Host: localhost:35357  
    Connection: Keep-Alive  
    User-Agent: Apache-HttpClient/4.1.1 (java 1.5)  

XML

List all activated services

    GET https://localhost:35357/v2.0/HP-IDM/v1.0/domains/90681825319071/services HTTP/1.1  
    Accept-Encoding: gzip,deflate  
    Accept: application/xml  
    X-Auth-Token: HPAuth_a46a8b6ddef111f44d569089564e2ee6efbe11f91cc04e0f7f3d26048e04df2d  
    Host: localhost:35357  
    Connection: Keep-Alive  
    User-Agent: Apache-HttpClient/4.1.1 (java 1.5)  

Optional:

JSON

When limit is specified without any marker (4 total documents)

    GET https://localhost:35357/v2.0/HP-IDM/v1.0/domains/90681825319071/services?limit=4 HTTP/1.1  
    Accept-Encoding: gzip,deflate  
    Accept: application/json  
    X-Auth-Token: HPAuth_a46a8b6ddef111f44d569089564e2ee6efbe11f91cc04e0f7f3d26048e04df2d  
    Host: localhost:35357  
    Connection: Keep-Alive  
    User-Agent: Apache-HttpClient/4.1.1 (java 1.5)  

XML

When limit is specified with marker (4 total documents)

    GET https://localhost:35357/v2.0/HP-IDM/v1.0/domains/90681825319071/services?limit=2&marker=50a2a2ee957c4415121a2417 HTTP/1.1  
    Accept-Encoding: gzip,deflate  
    Accept: application/xml  
    X-Auth-Token: HPAuth_a46a8b6ddef111f44d569089564e2ee6efbe11f91cc04e0f7f3d26048e04df2d  
    Host: localhost:35357  
    Connection: Keep-Alive  
    User-Agent: Apache-HttpClient/4.1.1 (java 1.5)  

XML 

When no activated services are there for a domain

    GET https://localhost:35357/v2.0/HP-IDM/v1.0/domains/88812793023919/services HTTP/1.1  
    Accept-Encoding: gzip,deflate  
    Accept: application/xml  
    X-Auth-Token: HPAuth_a46a8b6ddef111f44d569089564e2ee6efbe11f91cc04e0f7f3d26048e04df2d  
    Host: localhost:35357  
    Connection: Keep-Alive  
    User-Agent: Apache-HttpClient/4.1.1 (java 1.5)  

**Success Response**

The response is a list of activated services for the domain (filtered by tenantId if tenantId is provided)

**Status Code**

200 - OK

**Response Data**


JSON

Response with tenantId filter

    HTTP/1.1 200 OK  
    Server: Apache-Coyote/1.1  
    Set-Cookie: JSESSIONID=94C8007DACBD6F746B211CEF012F4E4A; Path=/; Secure  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/json  
    Content-Length: 472  
    Date: Tue, 13 Nov 2012 22:16:51 GMT  
    
    {  
      "activatedServices" : {  
        "activatedService" : [ {  
          "endpointTemplateId" : "120",  
          "id" : "50a2a2ee957c4415121a241c",  
          "otherAttributes" : {  
          },  
          "region" : "region-a.geo-1",  
          "serviceId" : "110",  
          "serviceName" : "Object Storage",  
          "serviceType" : "object-store",  
          "status" : "enabled",  
          "subscribedOn" : "2012-11-13T19:43:42.992Z",  
          "tenantId" : "24290042003272"  
        } ],  
        "otherAttributes" : {  
        }  
      }  
    }  

XML

Response for all activated services

    HTTP/1.1 200 OK  
    Server: Apache-Coyote/1.1  
    Set-Cookie: JSESSIONID=4C4529A54A66517449F10A8F083E5570; Path=/; Secure  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/xml  
    Content-Length: 1402  
    Date: Tue, 13 Nov 2012 22:24:47 GMT  
    
    <ns1:activatedServices xmlns:ns1="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" xmlns:ns2="http://docs.openstack.org/identity/api/ext/hp/v1.0" xmlns:ns3="http://docs.openstack.org/identity/api/v2.0" xmlns:ns4="http://docs.openstack.org/common/api/v1.0" xmlns:ns5="http://www.w3.org/2005/Atom">  
       <ns1:activatedService id="50a2a2ee957c4415121a2412" serviceId="110" serviceName="Object Storage" serviceType="object-store" region="region-a.geo-1" subscribedOn="2012-11-13T19:43:42.283Z" tenantId="45289935905449" status="enabled" endpointTemplateId="120"/>  
       <ns1:activatedService id="50a2a2ee957c4415121a2417" serviceId="110" serviceName="Object Storage" serviceType="object-store" region="region-a.geo-1" subscribedOn="2012-11-13T19:43:42.422Z" tenantId="28729687685789" status="enabled" endpointTemplateId="120"/>  
       <ns1:activatedService id="50a2a2ee957c4415121a241c" serviceId="110" serviceName="Object Storage" serviceType="object-store" region="region-a.geo-1" subscribedOn="2012-11-13T19:43:42.992Z" tenantId="24290042003272" status="enabled" endpointTemplateId="120"/>  
       <ns1:activatedService id="50a2a2ef957c4415121a2421" serviceId="110" serviceName="Object Storage" serviceType="object-store" region="region-a.geo-1" subscribedOn="2012-11-13T19:43:43.221Z" tenantId="35383765754307" status="enabled" endpointTemplateId="120"/>  
    </ns1:activatedServices>  

Optional



JSON

When limit is specified without any marker (4 total documents)

    {"activatedServices": {  
       "activatedService":    [  
                {  
             "endpointTemplateId": "120",  
             "id": "50a2a2ee957c4415121a2412",  
             "otherAttributes": {},  
             "region": "region-a.geo-1",  
             "serviceId": "110",  
             "serviceName": "Object Storage",  
             "serviceType": "object-store",  
             "status": "enabled",  
             "subscribedOn": "2012-11-13T19:43:42.283Z",  
             "tenantId": "45289935905449"  
          },  
                {  
             "endpointTemplateId": "120",  
             "id": "50a2a2ee957c4415121a2417",  
             "otherAttributes": {},  
             "region": "region-a.geo-1",  
             "serviceId": "110",  
             "serviceName": "Object Storage",  
             "serviceType": "object-store",  
             "status": "enabled",  
             "subscribedOn": "2012-11-13T19:43:42.422Z",  
             "tenantId": "28729687685789"  
          },  
                {  
             "endpointTemplateId": "120",  
             "id": "50a2a2ee957c4415121a241c",  
             "otherAttributes": {},  
             "region": "region-a.geo-1",  
             "serviceId": "110",  
             "serviceName": "Object Storage",  
             "serviceType": "object-store",  
             "status": "enabled",  
             "subscribedOn": "2012-11-13T19:43:42.992Z",  
             "tenantId": "24290042003272"  
          },  
                {  
             "endpointTemplateId": "120",  
             "id": "50a2a2ef957c4415121a2421",  
             "otherAttributes": {},  
             "region": "region-a.geo-1",  
             "serviceId": "110",  
             "serviceName": "Object Storage",  
             "serviceType": "object-store",  
             "status": "enabled",  
             "subscribedOn": "2012-11-13T19:43:43.221Z",  
             "tenantId": "35383765754307"  
          }  
       ],  
       "otherAttributes": {}  
    }}  

XML

When limit is specified with marker (4 total documents)

    HTTP/1.1 200 OK  
    Server: Apache-Coyote/1.1  
    Set-Cookie: JSESSIONID=6AE817EEDD2D62CF0217FD840AEC5393; Path=/; Secure  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/xml  
    Content-Length: 888  
    Date: Tue, 13 Nov 2012 22:13:36 GMT  
    
    <ns1:activatedServices xmlns:ns1="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" xmlns:ns2="http://docs.openstack.org/identity/api/ext/hp/v1.0" xmlns:ns3="http://docs.openstack.org/identity/api/v2.0" xmlns:ns4="http://docs.openstack.org/common/api/v1.0" xmlns:ns5="http://www.w3.org/2005/Atom">  
       <ns1:activatedService id="50a2a2ee957c4415121a241c" serviceId="110" serviceName="Object Storage" serviceType="object-store" region="region-a.geo-1" subscribedOn="2012-11-13T19:43:42.992Z" tenantId="24290042003272" status="enabled" endpointTemplateId="120"/>  
       <ns1:activatedService id="50a2a2ef957c4415121a2421" serviceId="110" serviceName="Object Storage" serviceType="object-store" region="region-a.geo-1" subscribedOn="2012-11-13T19:43:43.221Z" tenantId="35383765754307" status="enabled" endpointTemplateId="120"/>  
    </ns1:activatedServices>  

XML

When no activated services are there for a domain
    TTP/1.1 200 OK  
    Server: Apache-Coyote/1.1  
    Set-Cookie: JSESSIONID=14E953B8EA880BC9A80AB77B9CE5F22B; Path=/; Secure  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/xml  
    Content-Length: 351  
    Date: Tue, 13 Nov 2012 22:30:03 GMT  
    
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?><ns1:activatedServices xmlns:ns1="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" xmlns:ns2="http://docs.openstack.org/identity/api/ext/hp/v1.0" xmlns:ns3="http://docs.openstack.org/identity/api/v2.0" xmlns:ns4="http://docs.openstack.org/common/api/v1.0" xmlns:ns5="http://www.w3.org/2005/Atom"/>  

**Error Response**

Please refer to error response body for additional details.

**Status Code**

| Status Code | Description | Reasons |  
| :-----------| :-----------| :-------|  
| 400 | Bad Request | Malformed request in URI   |  
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.    |  
| 403 | Forbidden | Disabled or suspended user making the request |  
| 404 | Not Found | The specified domainId, tenantId filter or marker is not found   |  
| 500 | Internal Server Error | The server encountered a problem while processing the request|  
| 503 | Service Unavailable | The server is unavailable to process the request |  


**Response Data**

JSON

    {  
      "itemNotFound" : {  
        "code" : 404,  
        "details" : "Domain with domainId : 66751536630362 does not exist in the System",  
        "message" : "NOT_FOUND",  
        "otherAttributes" : {  
        }  
      }  
    }  

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

XML

Invalid marker error

    <itemNotFound code="404" xmlns="http://docs.openstack.org/identity/api/v2.0" xmlns:ns2="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" xmlns:ns3="http://docs.openstack.org/common/api/v1.0" xmlns:ns4="http://www.w3.org/2005/Atom">  
       <message>NOT_FOUND</message>  
       <details>Marker in request not found</details>  
    </itemNotFound>  

**Curl Example**

    curl -k --cert dev_hpmiddleware.pem  -XGET -H "X-Auth-Token: HPAuth_b4d1cf88adb2b9eb97766444958a24ff2ee8b2f8e7d2e26500c5133f9e8ec776" -H "Accept: application/json" https://localhost:35357/v2.0/HP-IDM/v1.0/domains/66751536630361/services  

**Additional Notes**



##### 3.4.2.9 Get Tenants For A Domain ##### {#get_tenants_for_a_domain}
##### GET /HP-IDM/v1.0/domains/{domainId}/tenants
*Privilege Level: System Adminstrator (SA), Domain Admin (DA), Domain User (DU)*

This REST API returns all tenants of a {domainId} and takes a "marker" and "limit" parameter to limit the number of Tenants in the response. The Api results can be filtered using filters which are specified as query parameters.

**Request Data**

A valid token must be presented in the *X-Auth-Token* HTTP header. Otherwise, a 401 will be returned.

**URL Parameters**

* *limit (Optional)* - integer - represents the maximum number of elements which will be returned in the request. Default is 100.
* *marker (Optional)* - string - the resource Id of the last item in the previous list

Following filters can be used to filter the response data.

* *tenantId (Optional)* - string - include results for given tenantId. Filters tenantId and name are mutually exclusive. You can filter either using tenantId or using name.
* *name (Optional)* - string - include results for given tenant name. Filters tenantId and name are mutually exclusive. You can filter either using tenantId or using name.  

**Data Parameters**

See schema file for more details on the response data structure.  

This call does not require a request body

JSON

    GET /v2.0/HP-IDM/v1.0/domains/29649421790262/tenants HTTP/1.1  
    Accept: application/json  
    Content-Type: application/json  
    User-Agent: Wink Client v1.1.2  
    X-Auth-Token: HPAuth_4e8f7d182cdcb96406c8c61b  
    Host: localhost:9999  
    Connection: keep-alive  

XML

    GET /V2.0/HP-IDM/v1.0/domains/798477662343/tenants HTTP/1.1  
    Accept: application/xml  
    Content-Type: application/xml  
    User-Agent: Wink Client v1.1.2  
    Host: localhost:9999  
    Connection: keep-alive  

Optional:

JSON

Request with tenantId filter

    GET /v2.0/HP-IDM/v1.0/domains/29649421790262/tenants?tenantId=12345 HTTP/1.1  
    Accept: application/json  
    Content-Type: application/json  
    User-Agent: Wink Client v1.1.2  
    X-Auth-Token: HPAuth_4e8f7d182cdcb96406c8c61b  
    Host: localhost:9999  
    Connection: keep-alive  

XML

Request with name filter

    GET /V2.0/HP-IDM/v1.0/domains/798477662343/tenants?name=TENANTNAME1 HTTP/1.1  
    Accept: application/xml  
    Content-Type: application/xml  
    User-Agent: Wink Client v1.1.2  
    Host: localhost:9999  
    Connection: keep-alive  

**Success Response**

The response is a list of tenant resources for the domain. 

**Status Code**

200 - OK

**Response Data**


JSON

    HTTP/1.1 200 OK  
    Server: Apache-Coyote/1.1  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/json  
    Content-Length: 367  
    Date: Fri, 07 Oct 2011 22:45:44 GMT  
     
    {  
      "tenants": {  
        "anies": null,  
        "otherAttributes": {  
     
        },  
        "tenant": [  
          {  
            "description": "Tenant for hosting Time Warner Applications & services",  
            "domainId": "29649421790262",  
            "name": "Time Warner Tenant Services",  
            "otherAttributes": {  
     
            },  
            "status": "enabled",  
            "tenantId": "96488406679080"  
          }  
        ]  
      }  
    }  

XML

    HTTP/1.1 200 OK  
    Server: Apache-Coyote/1.1  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/xml  
    Content-Length: 525  
    Date: Tue, 16 Aug 2011 21:24:54 GMT  
     
    <?xml version="1.0" encoding="utf-8" standalone="yes"?>  
    <tenants xmlns="http://docs.openstack.org/identity/api/ext/hp/v1.0"  
    xmlns:ns2="http://www.w3.org/2005/Atom"  
    xmlns:ns3="http://docs.openstack.org/identity/api/v2.0">  
      <tenant status="enabled" domainId="798477662343"  
      tenantId="842515505915"  
      description="Tenant for Sales service"  
      name="Forecasting Tenant" />  
      <tenant status="enabled" domainId="798477662343"  
      tenantId="225260164476"  
      description="Tenant for Forecasting service"  
      name="Sales Tenant" />  
    </tenants>  

**Error Response**

Please refer to error response body for additional details.

**Status Code**

| Status Code | Description | Reasons |  
| :-----------| :-----------| :-------|  
| 400 | Bad Request | Malformed request in URI   |  
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.    |  
| 403 | Forbidden | Disabled or suspended user making the request |  
| 404 | Not Found | The specified domainId or marker is not found   |  
| 500 | Internal Server Error | The server encountered a problem while processing the request|  
| 503 | Service Unavailable | The server is unavailable to process the request |  


**Response Data**

JSON

    {  
      "itemNotFound" : {  
        "code" : 404,  
        "details" : "Domain does not exist",  
        "message" : "Not found",  
        "otherAttributes" : {  
        }  
      }  
    }  

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

    curl -k --cert dev_hpmiddleware.pem  -XGET -H "X-Auth-Token: HPAuth_b4d1cf88adb2b9eb97766444958a24ff2ee8b2f8e7d2e26500c5133f9e8ec776" -H "Accept: application/json" https://localhost:35357/v2.0/HP-IDM/v1.0/domains/66751536630362/tenants?tenantId=12345  

**Additional Notes**


##### 3.4.2.10 Get Users For A Domain ##### {#get_users_for_a_domain}
##### {HTTP Verb: GET, POST, DELETE, PUT} [HPKeystoneExtensionBaseURI]/domains/{domainId}/users?limit=pagesize&marker=userId&excludeGroups=groupid1,groupdid2&excludeRoles=roleId1,roleId2&userId=userId&userName=userName&tenantId=t1&groupId=12345&excludeTenantId=tenantid1,tenantId2
*Privilege Level: System Adminstrator (SA), Domain Admin (DA)*

This API returns all users of a {domainId} .  The Api results can be filtered using filters which are specified as query parameters.

**Request Data**

A valid token must be presented in the *X-Auth-Token* HTTP header. Otherwise, a 401 will be returned.

**URL Parameters**

* *limit (Optional)* - integer - represents the maximum number of elements which will be returned in the request. Default is 100.
* *marker (Optional)* - string - the resource Id of the last item in the previous list

Following filters can be used to filter the response data.

*Inclusion-Filters*
* *userId (Optional)* - string - include results for given userId. Filters userId and userName are mutually exclusive. You can filter either using userId or using userName.
* *userName (Optional)* - string - include results for given userName. Filters userId and userName are mutually exclusive. You can filter either using userId or using userName.  
* *tenantId (Optional)* - string - include results for given tenantId. 
* *groupId (Optional)* - string - include results for given groupId. 

*Exclusion Filters*
* *excludeRoles (Optional)* - string - comma separated roleId to exclude 
* *excludeGroups (Optional)* - string - comma separated groupId to exclude 
* *excludeTenantId (Optional)* - string - tenantId to exclude


**Data Parameters**

See schema file for more details on the response data structure.

This call does not require a request body

JSON

    GET /v2.0/HP-IDM/v1.0/domains/53615830984009/users HTTP/1.1  
    Accept: application/json  
    Content-Type: application/json  
    User-Agent: Wink Client v1.1.2  
    X-Auth-Token: HPAuth_4e8ccde52cdc999e9328f761  
    Host: localhost:9999  
    Connection: keep-alive  

XML

    GET /v2.0/HP-IDM/v1.0/domains/798477662343/users HTTP/1.1  
    Accept: application/xml  
    Content-Type: application/xml  
    User-Agent: Wink Client v1.1.2  
    Host: localhost:9999  
    Connection: keep-alive  

Optional:

JSON

Request with excludeRoles
    GET /v2.0/HP-IDM/v1.0/domains/53615830984009/users?excludeRoles=RoleId1,RoleId2 HTTP/1.1  
    Accept: application/json  
    Content-Type: application/json  
    User-Agent: Wink Client v1.1.2  
    X-Auth-Token: HPAuth_4e8ccde52cdc999e9328f761  
    Host: localhost:9999  
    Connection: keep-alive  

Request with excludeGroups
    GET /v2.0/HP-IDM/v1.0/domains/53615830984009/users?excludeGroups=GroupId1,GroupId22 HTTP/1.1  
    Accept: application/json  
    Content-Type: application/json  
    User-Agent: Wink Client v1.1.2  
    X-Auth-Token: HPAuth_4e8ccde52cdc999e9328f761  
    Host: localhost:9999  
    Connection: keep-alive  

XML

Request with exclusion filter
    GET /v2.0/HP-IDM/v1.0/domains/798477662343/users?excludeGroups=000002002,000002001 HTTP/1.1  
    Accept: application/xml  
    Content-Type: application/xml  
    User-Agent: Wink Client v1.1.2  
    Host: localhost:9999  
    Connection: keep-alive  


Request with userId filter
    GET /v2.0/HP-IDM/v1.0/domains/798477662343/users?userId=12345 HTTP/1.1  
    Accept: application/xml  
    Content-Type: application/xml  
    User-Agent: Wink Client v1.1.2  
    Host: localhost:9999  
    Connection: keep-alive  


Request with tenantId and groupId filter
    GET /v2.0/HP-IDM/v1.0/domains/798477662343/users?tenantId=1234&groupId=123455 HTTP/1.1  
    Accept: application/xml  
    Content-Type: application/xml  
    User-Agent: Wink Client v1.1.2  
    Host: localhost:9999  
    Connection: keep-alive  

**Success Response**

List of users returned for given input criteria with http status code 200.

**Status Code**

200 - OK

**Response Data**

JSON

    HTTP/1.1 200 OK  
    Server: Apache-Coyote/1.1  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/json  
    Content-Length: 716  
    Date: Wed, 05 Oct 2011 21:37:04 GMT  
     
    {  
      "users" : {  
        "anies" : null,  
        "otherAttributes" : {  
        },  
        "user" : [ {  
          "roles" : null,  
          "addressLine1" : "128, Hollywood Blvd",  
          "addressLine2" : null,  
          "city" : "Los Angeles",  
          "company" : null,  
          "country" : "USA",  
          "domainId" : "53615830984009",  
          "emailAddress" : "larryking@timewarner.com",  
          "firstName" : "Larry",  
          "lastName" : "King",  
          "otherAttributes" : {  
          },  
          "password" : null,  
          "phone" : "1-800-555-1212",  
          "state" : "CA",  
          "status" : "enabled",  
          "userId" : "27000063617046",  
          "username" : "larryking@timewarner.com",  
          "website" : "http://www.timewarner.com",  
          "zip" : "90210"  
        } ]  
      }  
    }  

XML

    HTTP/1.1 200 OK  
    Server: Apache-Coyote/1.1  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/xml  
    Content-Length: 822  
    Date: Wed, 10 Aug 2011 19:35:24 GMT  
     
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>  
    <users xmlns="http://docs.openstack.org/identity/api/ext/hp/v1.0" xmlns:ns2="http://docs.openstack.org/identity/api/v2.0" xmlns:ns3="http://www.w3.org/2005/Atom">  
      <user domainId="798477662343" status="enabled" isDomainOwner="true" emailAddress="johndoe@papsi.com" website="http://www.pepsi.com" phone="1-800-555-1212" zip="89072" country="USA" state="GA" city="Atlanta" addressLine1="1, Pepsi Way" accountId="627893056455" username="johndoe@papsi.com" name="John Doe"/>  
      <user domainId="798477662343" status="enabled" emailAddress="amymiller@papsi.com" website="http://www.pepsi.com" phone="1-800-555-1212" zip="89072" country="USA" state="GA" city="Atlanta" addressLine1="1, Pepsi Way" accountId="968754602297" username="amymiller@papsi.com" name="Amy Miller"/>  
    </users>  

**Error Response**

Please refer to error response body for additional details.

**Status Code**

| Status Code | Description | Reasons |  
| :-----------| :-----------| :-------|  
| 400 | Bad Request | Malformed request in URI   |  
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.    |  
| 403 | Forbidden | Disabled or suspended user making the request |  
| 404 | Not Found | The specified domainId or marker is not found   |  
| 500 | Internal Server Error | The server encountered a problem while processing the request|  
| 503 | Service Unavailable | The server is unavailable to process the request |  


**Response Data**

JSON

    {  
      "itemNotFound" : {  
        "code" : 404,  
        "details" : "Domain does not exist",  
        "message" : "Not found",  
        "otherAttributes" : {  
        }  
      }  
    }  

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

    curl -k --cert dev_hpmiddleware.pem  -XGET -H "X-Auth-Token: HPAuth_b4d1cf88adb2b9eb97766444958a24ff2ee8b2f8e7d2e26500c5133f9e8ec776" -H "Accept: application/json" https://localhost:35357/v2.0/HP-IDM/v1.0/domains/798477662343/users?userId=12345  

**Additional Notes**



##### 3.4.2.11 List Role Definitions (Deprecated) ##### {#list_role_definitions_(deprecated)}
##### GET /HP-IDM/v1.0/domains/{domainId}/roles
*Privilege Level: System Adminstrator (SA), Domain Admin (DA), Domain User (DU)*

This API is used to list all the roles defined in the domain and takes a "marker" and "limit" parameter to limit the number of roles in the response.

**Request Data**

A valid token must be presented in the *X-Auth-Token* HTTP header. Otherwise, a 401 will be returned.

**URL Parameters**

* *limit (Optional)* - integer - represents the maximum number of elements which will be returned in the request. Default is 100.
* *marker (Optional)* - string - the resource Id of the last item in the previous list

**Data Parameters**

See schema file for more details on the response data structure.

This call does not require a request body

JSON

    GET /v2.0/HP-IDM/v1.0/domains/641564254582/roles HTTP/1.1  
    Connection: close  
    Accept: application/json  
    User-Agent: Jakarta Commons-HttpClient/3.1  
    Host: haneef-desktop.americas.hpqcorp.net:8080  

XML

    GET /v2.0/HP-IDM/v1.0/domains/641564254582/roles HTTP/1.1  
    Connection: close  
    Accept: application/xml  
    User-Agent: Jakarta Commons-HttpClient/3.1  
    Host: haneef-desktop.americas.hpqcorp.net:8080  

Optional:



**Success Response**

List of roles with http status code 200.

**Status Code**

200 - OK

**Response Data**


JSON

    {"roles": {"role": [  
          {  
          "roleId": "xxxxxxxxxxxxxx",  
          "roleName": "role01",  
          "description": "role01- description",  
          "serviceId" : "xxxxxxxxxxxxxx",  
          "domainId": "xxxxxxxxxxxxxx",  
          "tenantId": "12345678909876"  
       }, {  
          "roleId": "xxxxxxxxxxxxxx",  
          "roleName": "role02",  
          "description": "role02- description",  
          "serviceId" : "xxxxxxxxxxxxxx",  
          "domainId": "xxxxxxxxxxxxxx",  
          "tenantId": "12345678909876"  
       }, {  
          "roleId": "xxxxxxxxxxxxxx",  
          "roleName": "role03",  
          "description": "role03- description",  
          "serviceId" : "xxxxxxxxxxxxxx",  
          "domainId": "xxxxxxxxxxxxxx",  
          "tenantId": "12345678909876"  
       },  
    ]}  

XML

    <roles xmlns="http://hpcloud.hp.com/identity/api/ext/hp/v1.0">  
       <role>  
          <roleId>xxxxxxxxxxxxxx</roleId>  
          <roleName>role01</roleName>  
          <description>role01- description</description>  
          <serviceId>xxxxxxxxxxxxxx</serviceId>  
          <domainId>xxxxxxxxxxxxxx</domainId>  
          <tenantId>12345678909876</tenantId>  
       </role>  
       <role>  
          <roleId>xxxxxxxxxxxxxx</roleId>  
          <roleName>role02</roleName>  
          <description>role02- description</description>  
          <serviceId>xxxxxxxxxxxxxx</serviceId>  
          <domainId>xxxxxxxxxxxxxx</domainId>  
          <tenantId>12345678909876</tenantId>  
       </role>  
       <role>  
          <roleId>xxxxxxxxxxxxxx</roleId>  
          <roleName>role03</roleName>  
          <description>role03- description</description>  
          <serviceId>xxxxxxxxxxxxxx</serviceId>  
          <domainId>xxxxxxxxxxxxxx</domainId>  
          <tenantId>12345678909876</tenantId>  
       </role>  
    </roles>  

**Error Response**

Please refer to error response body for additional details.

**Status Code**

| Status Code | Description | Reasons |  
| :-----------| :-----------| :-------|  
| 400 | Bad Request | Malformed request in URI   |  
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.    |  
| 403 | Forbidden | Disabled or suspended user making the request |  
| 404 | Not Found | The specified domainId or marker is not found   |  
| 500 | Internal Server Error | The server encountered a problem while processing the request|  
| 503 | Service Unavailable | The server is unavailable to process the request |  

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

    curl -k --cert dev_hpmiddleware.pem  -XGET -H "X-Auth-Token: HPAuth_b4d1cf88adb2b9eb97766444958a24ff2ee8b2f8e7d2e26500c5133f9e8ec776" -H "Accept: application/json" https://localhost:35357/v2.0/HP-IDM/v1.0/domains/27999842874196/roles  

**Additional Notes**



##### 3.4.2.12 Transfer Ownership Of A Domain ##### {#transfer_ownership_of_a_domain}
##### PUT /HP-IDM/v1.0/domains/{domainId}/owner/{userId}	
*Privilege Level: System Adminstrator (SA)*

A Domain has a owner, it is usually the first user of the Domain or the self registered user during the self registration process. This REST API transfers the domain ownership from one valid User of that Domain to another valid User of the Domain. 

**Request Data**

A valid token must be presented in the *X-Auth-Token* HTTP header. Otherwise, a 401 will be returned.

* *domainId* - string - {domainId} of the Domain for which the ownership transfer should happen.
* *userId* - string - {userId} of the new owner of the Domain.

**URL Parameters**


**Data Parameters**

See schema file for more details on the response data structure.

This call does not require a request body


JSON

    PUT /v2.0/HP-IDM/v1.0/domains/29649421790262/owner/60414337132139 HTTP/1.1  
    Accept: application/json  
    Content-Type: application/json  
    User-Agent: Wink Client v1.1.2  
    X-Auth-Token: HPAuth_4e8f7d182cdcb96406c8c61b  
    Host: localhost:9999  
    Connection: keep-alive  

XML

    PUT /v2.0/HP-IDM/v1.0/domains/662648896689/owner/129024620458 HTTP/1.1  
    Accept: application/xml  
    account_id: 000000003001  
    Content-Type: application/xml  
    domain_id: 000000001001  
    User-Agent: Wink Client v1.1.2  
    Host: localhost:9999  
    Connection: keep-alive  

Optional:


**Success Response**

Transfer ownership of a Domain with http status code 200

**Status Code**

200 - OK

**Response Data**


JSON

    HTTP/1.1 200 OK  
    Server: Apache-Coyote/1.1  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/json  
    Content-Length: 603  
    Date: Fri, 07 Oct 2011 22:55:55 GMT  
     
    {  
      "user": {  
        "roles": null,  
        "addressLine1": "128, Hollywood Blvd",  
        "addressLine2": null,  
        "city": "Los Angeles",  
        "company": null,  
        "country": "USA",  
        "domainId": "29649421790262",  
        "emailAddress": "larryking3@timewarner.com",  
        "firstName": "Larry",  
        "lastName": "King III",  
        "otherAttributes": {  
     
        },  
        "password": null,  
        "phone": "1-800-555-1212",  
        "state": "CA",  
        "status": "enabled",  
        "userId": "60414337132139",  
        "username": "larryking3@timewarner.com",  
        "website": "http://www.timewarner.com",  
        "zip": "90210"  
      }  
    }  

XML

    HTTP/1.1 200 OK  
    Server: Apache-Coyote/1.1  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/xml  
    Content-Length: 437  
    Date: Tue, 30 Aug 2011 00:06:02 GMT  
     
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>  
    <user xmlns="http://docs.openstack.org/identity/api/ext/hp/v1.0" name="Tom Riddle" username="tomriddle@timewarner.com" userId="129024620458" addressLine1="128, Hollywood Blvd" city="Los Angeles" state="CA" country="USA" zip="90210" phone="1-800-555-1212" website="http://www.timewarner.com" emailAddress="tomriddle@timewarner.com" status="enabled" domainId="662648896689"/>  

**Error Response**

Please refer to error response body for additional details.

**Status Code**

| Status Code | Description | Reasons |  
| :-----------| :-----------| :-------|  
| 400 | Bad Request | Malformed request in URI   |  
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.    |  
| 403 | Forbidden | Disabled or suspended user making the request |  
| 404 | Not Found | The specified domainId or userId is not found   |  
| 500 | Internal Server Error | The server encountered a problem while processing the request|  
| 503 | Service Unavailable | The server is unavailable to process the request |  

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

    curl -k --cert dev_hpmiddleware.pem  -XGET -H "X-Auth-Token: HPAuth_b4d1cf88adb2b9eb97766444958a24ff2ee8b2f8e7d2e26500c5133f9e8ec776" -H "Accept: application/json" https://localhost:35357/v2.0/HP-IDM/v1.0/domains/662648896689/owner/129024620458   

**Additional Notes**


##### 3.4.2.13 Update A Domain ##### {#update_a_domain}
##### PUT /HP-IDM/v1.0/domains/{domainId}
*Privilege Level: System Adminstrator (SA), Domain Admin (DA**)

Allows update of an existing domain using the {domainId} and request body. Does not allow update or change of domainID.

DA* indicates that only attributes returned on the list operation as defined by Domain-Tenant-User-Group Model can be edited


**Request Data**

A valid token must be presented in the *X-Auth-Token* HTTP header. Otherwise, a 401 will be returned.

**URL Parameters**


**Data Parameters**

See schema file for more details on the request and response data structure.

The request requires the updated Domain resource.  
The response is the updated Domain resource.


JSON

    PUT /v2.0/HP-IDM/v1.0/domains/91177319722637 HTTP/1.1  
    Accept: application/json  
    Content-Type: application/json  
    User-Agent: Wink Client v1.1.2  
    X-Auth-Token: HPAuth_4e83a4532cdcb4bf5faa76ce  
    Host: localhost:9999  
    Connection: keep-alive  
    Content-Length: 40  
     
    {  
      "domain": {  
        "phone": "1-800-NO-DISNEY"  
      }  
    }  

XML

    PUT /v2.0/HP-IDM/v1.0/domains/26856794720485 HTTP/1.1  
    Accept: application/xml  
    Content-Type: application/xml  
    User-Agent: Wink Client v1.1.2  
    X-Auth-Token: HPAuth_4ef385b32cdc64f2eead137c  
    Host: localhost:9999  
    Connection: keep-alive  
    Content-Length: 384  
     
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>  
    <domain xmlns="http://docs.openstack.org/identity/api/ext/hp/v1.0" xmlns:ns2="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" xmlns:ns3="http://docs.openstack.org/identity/api/v2.0" xmlns:ns4="http://www.w3.org/2005/Atom" xmlns:ns5="http://docs.openstack.org/common/api/v1.0" phone="1-800-NO-DISNEY" addressLine2="Studio Lanes"/>  

Optional:


**Success Response**

Updated domain resource is returned with http status code 200

**Status Code**

200 - OK

**Response Data**



JSON

    HTTP/1.1 200 OK  
    Server: Apache-Coyote/1.1  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/json  
    Content-Length: 461  
    Date: Wed, 28 Sep 2011 22:49:56 GMT  
     
     
    {  
      "domain" : {  
        "anies" : null,  
        "addressLine1" : "128, Hollywood Blvd",  
        "addressLine2" : null,  
        "city" : "Los Angeles",  
        "company" : null,  
        "country" : "USA",  
        "domainId" : "91177319722637",  
        "emailAddress" : "owner@timewarner.com",  
        "name" : "Time Warner Inc",  
        "otherAttributes" : {  
        },  
        "phone" : "1-800-NO-DISNEY",  
        "state" : "CA",  
        "status" : "enabled",  
        "website" : "Time Warner",  
        "zip" : "90210"  
      }  
    }  

XML

    HTTP/1.1 200 OK  
    Server: Apache-Coyote/1.1  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Type: application/xml  
    Content-Length: 508  
    Date: Thu, 22 Dec 2011 19:51:00 GMT  
     
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>  
    <domain xmlns="http://docs.openstack.org/identity/api/ext/hp/v1.0" xmlns:ns2="http://docs.openstack.org/identity/api/v2.0" xmlns:ns3="http://docs.openstack.org/common/api/v1.0" xmlns:ns4="http://www.w3.org/2005/Atom" xmlns:ns5="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" domainId="26856794720485" name="action-king-DOMAIN" emailAddress="actionking@hp.com" addressLine2="Studio Lanes" company="action-king" phone="1-800-NO-DISNEY" status="enabled">  
    <billToAddress addressLine1="123 Smoke Test Lane" city="The Smoky City" state="SmokyState" zip="90909" country="USA">  
     </billToAddress>   
    </domain>  

**Error Response**

Please refer to error response body for additional details.

**Status Code**

| Status Code | Description | Reasons |  
| :-----------| :-----------| :-------|  
| 400 | Bad Request | Malformed request in URI   |  
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation.    |  
| 403 | Forbidden | Disabled or suspended user making the request |  
| 404 | Not Found | The specified {domainId} in request URI is not found   |  
| 409 | Conflict | The updated domain name already exists in the system   |  
| 500 | Internal Server Error | The server encountered a problem while processing the request|  
| 503 | Service Unavailable | The server is unavailable to process the request |  

**Response Data**

JSON

    {  
      "IdentityFault" : {  
        "message" : "Conflict",  
        "details" : "Domain already exists",  
        "code" : 409,  
        "otherAttributes" : {  
        }  
      }  
    }  

    {  
      "itemNotFound" : {  
        "code" : 404,  
        "details" : "Domain does not exist",  
        "message" : "Not found",  
        "otherAttributes" : {  
        }  
      }  
    }  

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

    curl -k --cert dev_hpmiddleware.pem  -XPUT -H "X-Auth-Token: HPAuth_b4d1cf88adb2b9eb97766444958a24ff2ee8b2f8e7d2e26500c5133f9e8ec776" -H "Accept: application/json" -H "Content-type: application/json" -d '{  "domain" : {  "name" : "Sees Candies 61", "phone": "1-800-NO-DISNEY"} }' https://localhost:35357/v2.0/HP-IDM/v1.0/domains/66751536630361  

**Additional Notes**


##### 3.4.2.14 List Role Definitions ##### {#list_role_definitions}
##### GET /HP-IDM/v1.0/domains/{domainId}/roleDefs
*Privilege Level: System Adminstrator (SA), Domain Admin (DA), Domain User (DU)*

This API is used to list all the roles defined in the specified {domainId} and takes several parameters including "marker", "limit", "serviceId", "tenantId", "roleId", and "public" to limit the number of role definitions in the response.

**Request Data**

A valid token must be presented in the *X-Auth-Token* HTTP header. Otherwise, a 401 will be returned.

**URL Parameters**

* *domainId* - string - The domainId representing the domain to return role definitions for.
* *limit (Optional)* - integer - Represents the maximum number of elements which will be returned in the request. Default is 100.
* *marker (Optional)* - string - The resource Id of the last item in the previous list.
* *tenantId (Optional)* - string - Limit role definitions to the specified tenant id if provided.
* *serviceId (Optional)* - string - Limit role definitions to the specified service id if provided.
* *roleId (Optional)* - string - Limit role definitions to the specified role id if provided.
* *public (Optional)* - boolean - If true, return only public role definitions.  If false, return only domain specific role definitions.  If not provided, return both.

**Data Parameters**

See schema file for more details on the response data structure.

This call does not require a request body

JSON

    GET /v2.0/HP-IDM/v1.0/domains/641564254582/roleDefs HTTP/1.1  
    Connection: close  
    Accept: application/json  
    User-Agent: Jakarta Commons-HttpClient/3.1  
    Host: haneef-desktop.americas.hpqcorp.net:8080  

XML

    GET /v2.0/HP-IDM/v1.0/domains/641564254582/roleDefs HTTP/1.1  
    Connection: close  
    Accept: application/xml  
    User-Agent: Jakarta Commons-HttpClient/3.1  
    Host: haneef-desktop.americas.hpqcorp.net:8080  

Optional:


**Success Response**

List of roles with http status code 200.

**Status Code**

200 - OK

**Response Data**


JSON

    {"roles": {"role": [  
          {  
          "roleId": "xxxxxxxxxxxxxx",  
          "roleName": "role01",  
          "description": "role01 - description",  
          "serviceId" : "xxxxxxxxxxxxxx",  
          "domainId": "xxxxxxxxxxxxxx",  
       }, {  
          "roleId": "xxxxxxxxxxxxxx",  
          "roleName": "role02",  
          "description": "role02 - description",  
          "serviceId" : "xxxxxxxxxxxxxx",  
          "domainId": "xxxxxxxxxxxxxx",  
       }, {  
          "roleId": "xxxxxxxxxxxxxx",  
          "roleName": "role03",  
          "description": "role03 - description",  
          "serviceId" : "xxxxxxxxxxxxxx",  
          "domainId": "xxxxxxxxxxxxxx",  
       },  
    ]}  

XML

    <roles xmlns="http://hpcloud.hp.com/identity/api/ext/hp/v1.0">  
       <role>  
          <roleId>xxxxxxxxxxxxxx</roleId>  
          <roleName>role01</roleName>  
          <description>role01 - description</description>  
          <serviceId>xxxxxxxxxxxxxx</serviceId>  
          <domainId>xxxxxxxxxxxxxx</domainId>  
       </role>  
       <role>  
          <roleId>xxxxxxxxxxxxxx</roleId>  
          <roleName>role02</roleName>  
          <description>role02 - description</description>  
          <serviceId>xxxxxxxxxxxxxx</serviceId>  
          <domainId>xxxxxxxxxxxxxx</domainId>  
       </role>  
       <role>  
          <roleId>xxxxxxxxxxxxxx</roleId>  
          <roleName>role03</roleName>  
          <description>role03 - description</description>  
          <serviceId>xxxxxxxxxxxxxx</serviceId>  
          <domainId>xxxxxxxxxxxxxx</domainId>  
       </role>  
    </roles>  

**Error Response**

Please refer to error response body for additional details.

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 403 | Forbidden | Disabled or suspended user making the request. |
| 404 | Not Found | The specified domainId, marker, serviceId or tenantId is not found. |
| 500 | Internal Server Error | The server encountered a problem while processing the request. |
| 503 | Service Unavailable | The server is unavailable to process the request. |

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

    curl -k --cert dev_hpmiddleware.pem  -XGET -H "X-Auth-Token: HPAuth_b4d1cf88adb2b9eb97766444958a24ff2ee8b2f8e7d2e26500c5133f9e8ec776" -H "Accept: application/json" https://localhost:35357/v2.0/HP-IDM/v1.0/domains/27999842874196/roleDefs  

**Curl Example** (public role definitions only)

    curl -k --cert dev_hpmiddleware.pem  -XGET -H "X-Auth-Token: HPAuth_b4d1cf88adb2b9eb97766444958a24ff2ee8b2f8e7d2e26500c5133f9e8ec776" -H "Accept: application/json" https://localhost:35357/v2.0/HP-IDM/v1.0/domains/27999842874196/roleDefs?public=true  

**Curl Example** (domain specific role definitions only)

    curl -k --cert dev_hpmiddleware.pem  -XGET -H "X-Auth-Token: HPAuth_b4d1cf88adb2b9eb97766444958a24ff2ee8b2f8e7d2e26500c5133f9e8ec776" -H "Accept: application/json" https://localhost:35357/v2.0/HP-IDM/v1.0/domains/27999842874196/roleDefs?public=false  

##### 3.4.2.15 Check For Existence Of Non Tenant Role For A Given User ##### {#check_for_existence_of_non_tenant_role_for_a_given_user}
##### HEAD /HP-IDM/v1.0/domains/{domainId}/users/{userId}/roles/{roleId}
*Privilege Level: System Adminstrator (SA), Domain Admin (DA), Domain User (DU)*

This API will check for the existence of the specified role for the specified user in the specified domain.

**Request Data**

A valid token must be presented in the *X-Auth-Token* HTTP header. Otherwise, a 401 will be returned.  There is no response body returned in API response data. 

**URL Parameters**

* *domainId* - string - the id of the domain to look for the role/user in (required)
* *userId* - string - the id of the user to check for the role for (required)
* *roleId* - string - the id of the role to check for (required)

**Data Parameters**

This call does not require a request body.

JSON

    HEAD https://localhost:35357/v2.0/HP-IDM/v1.1/domains/69784881406703/users/89309563001447/roles/00000000004004 HTTP/1.1  
    Accept-Encoding: gzip,deflate  
    Accept: application/json  

XML

    HEAD https://localhost:35357/v2.0/HP-IDM/v1.1/domains/69784881406703/users/89309563001447/roles/00000000004004 HTTP/1.1  
    Accept-Encoding: gzip,deflate  
    Accept: application/xml  

**Success Response**

There is no response body returned. Status code indicates the result where 200 indicates that specified role exists and 404 indicates when it does not exist.

**Status Code**

200 - OK , 404 - NOT FOUND

**Response Data**

This call does not return a response body and result is determined through returned http status code.  Response body is present only in case of errors.

JSON

    HTTP/1.1 200 OK  
    Server: Apache-Coyote/1.1  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Length: 0  
    Date: Tue, 21 Aug 2012 19:15:56 GMT  

XML

    HTTP/1.1 200 OK  
    Server: Apache-Coyote/1.1  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Content-Length: 0  
    Date: Tue, 21 Aug 2012 19:17:00 GMT  

**Error Response**

Status code 204 is returned when the role does not exist for the domain/user.

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 204 | No Content | When the role does not exist for the domain/user |
| 400 | Bad Request | Malformed request in URI |
| 500 | Internal Server Error | The server encountered a problem while processing the request |
| 503 | Service Unavailable | The server is unavailable to process the request |


**Response Data**

JSON

When role does not exist for the domain/user.

    HTTP/1.1 204 No Content  
    Server: Apache-Coyote/1.1  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: \-1  
    Date: Tue, 21 Aug 2012 19:18:23 GMT  

**Curl Example**

    curl -k  --cert dev_hpmiddleware.pem  -I -H "Accept: application/json" "https://localhost:35357/v2.0/HP-IDM/v1.1/domains/69784881406703/users/89309563001447/roles/00000000004004"  

**Additional Notes**


##### 3.4.2.16 Delete A Non Tenant Role Assignment In The Specified Domain For The Specified User ##### {#delete_a_non_tenant_role_assignment_in_the_specified_domain_for_the_specified_user}
##### DELETE /HP-IDM/v1.0/domains/{domainId}/users/{userId}/roles/{roleId}
*Privilege Level: System Adminstrator (SA), Domain Admin (DA)*

Deletes the specified role association by its {roleID}, in the specfied {domainId} for the specfied {userId}.

**Request Data**

A valid token must be presented in the *X-Auth-Token* HTTP header.  Otherwise, a 401 will be returned.

**URL Parameters**

* *domainId* - string - the id of the domain to delete the role from (required)
* *userId* - string - the id of the user to delete the role for (required)
* *roleId* - string - the id of the role to delete (required)

**Data Parameters**

This call does not require a request body.

JSON

    DELETE https://localhost:35357/v2.0/HP-IDM/v1.1/domains/69784881406703/users/89309563001447/roles/00000000004004 HTTP/1.1  
    Accept-Encoding: gzip,deflate  
    Accept: application/json  
    X-Auth-Token: HPAuth_769bcc02e0bf775aee3c7c5bbc647087a29e3da7103e2dde0d95beabb61f07e3  
    Host: localhost:35357  
    Connection: Keep-Alive  
    User-Agent: Apache-HttpClient/4.1.1 (java 1.5)  

XML

    DELETE https://localhost:35357/v2.0/HP-IDM/v1.1/domains/69784881406703/users/89309563001447/roles/00000000004004 HTTP/1.1  
    Accept-Encoding: gzip,deflate  
    Accept: application/xml  
    X-Auth-Token: HPAuth_769bcc02e0bf775aee3c7c5bbc647087a29e3da7103e2dde0d95beabb61f07e3  
    Host: localhost:35357  
    Connection: Keep-Alive  
    User-Agent: Apache-HttpClient/4.1.1 (java 1.5)  

**Success Response**

There is no response body and response code of 204 is returned after successful deletion of the role.

**Status Code**

204 - No Content

**Response Data**

This call does not have a response body other than in case of errors.

JSON

    HTTP/1.1 204 No Content  
    Server: Apache-Coyote/1.1  
    Set-Cookie: JSESSIONID=38FAFEF8E7816E6B717B1328FC6AFF49; Path=/; Secure  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Date: Tue, 30 Oct 2012 21:30:16 GMT  

XML

    HTTP/1.1 204 No Content  
    Server: Apache-Coyote/1.1  
    Set-Cookie: JSESSIONID=38FAFEF8E7816E6B717B1328FC6AFF49; Path=/; Secure  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Date: Tue, 30 Oct 2012 21:30:16 GMT  

**Error Response**

Refer to error response body for additional details.

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body   |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation    |
| 403 | Forbidden | Disabled or suspended user making the request |
| 404 | Not Found | The specified domainId, userId, or roleId does not exist |
| 500 | Internal Server Error | The server encountered a problem while processing the request|
| 503 | Service Unavailable | The server is unavailable to process the request |

**Response Data**

This call does not have a response body other than in case of errors.

**Curl Example**

    curl -k --cert dev_hpmiddleware.pem  -X DELETE -H "X-Auth-Token: HPAuth_769bcc02e0bf775aee3c7c5bbc647087a29e3da7103e2dde0d95beabb61f07e3" -H "Content-type: application/json" "https://localhost:35357/v2.0/HP-IDM/v1.1/domains/69784881406703/users/89309563001447/roles/00000000004004"  

**Additional Notes**


##### 3.4.2.17 Assign A Non Tenant Role Assignment In The Specified Domain For The Specified User ##### {#assign_a_non_tenant_role_assignment_in_the_specified_domain_for_the_specified_user}
##### PUT /HP-IDM/v1.0/domains/{domainId}/users/{userId}/roles/{roleId}
*Privilege Level: System Adminstrator (SA), Domain Admin (DA)*

Assigns the specified role association by its {roleID}, in the specfied {domainId} for the specfied {userId}.

**Request Data**

A valid token must be presented in the *X-Auth-Token* HTTP header.  Otherwise, a 401 will be returned.

**URL Parameters**

* *domainId* - string - the id of the domain to assign the role from (required)
* *userId* - string - the id of the user to assign the role for (required)
* *roleId* - string - the id of the role to assign (required)

**Data Parameters**

This call does not require a request body.

JSON

    PUT https://localhost:35357/v2.0/HP-IDM/v1.1/domains/69784881406703/users/89309563001447/roles/00000000004004 HTTP/1.1  
    Accept-Encoding: gzip,deflate  
    Accept: application/json  
    X-Auth-Token: HPAuth_769bcc02e0bf775aee3c7c5bbc647087a29e3da7103e2dde0d95beabb61f07e3  
    Host: localhost:35357  
    Connection: Keep-Alive  
    User-Agent: Apache-HttpClient/4.1.1 (java 1.5)  

XML

    PUT https://localhost:35357/v2.0/HP-IDM/v1.1/domains/69784881406703/users/89309563001447/roles/00000000004004 HTTP/1.1  
    Accept-Encoding: gzip,deflate  
    Accept: application/xml  
    X-Auth-Token: HPAuth_769bcc02e0bf775aee3c7c5bbc647087a29e3da7103e2dde0d95beabb61f07e3  
    Host: localhost:35357  
    Connection: Keep-Alive  
    User-Agent: Apache-HttpClient/4.1.1 (java 1.5)  

**Success Response**

There is no response body and response code of 204 is returned after successful deletion of the role.

**Status Code**

201 - Created

**Response Data**

This call does not have a response body other than in case of errors.

JSON

    HTTP/1.1 201 Created  
    Server: Apache-Coyote/1.1  
    Set-Cookie: JSESSIONID=38FAFEF8E7816E6B717B1328FC6AFF49; Path=/; Secure  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Date: Tue, 30 Oct 2012 21:30:16 GMT  

XML

    HTTP/1.1 201 Created  
    Server: Apache-Coyote/1.1  
    Set-Cookie: JSESSIONID=38FAFEF8E7816E6B717B1328FC6AFF49; Path=/; Secure  
    Cache-Control: no-cache  
    Pragma: no-cache  
    Expires: -1  
    Date: Tue, 30 Oct 2012 21:30:16 GMT  

**Error Response**

Refer to error response body for additional details.

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation |
| 403 | Forbidden | Disabled or suspended user making the request |
| 404 | Not Found | The specified domainId, userId, or roleId does not exist |
| 500 | Internal Server Error | The server encountered a problem while processing the request |
| 503 | Service Unavailable | The server is unavailable to process the request |

**Response Data**

This call does not have a response body other than in case of errors.

**Curl Example**

    curl -k --cert dev_hpmiddleware.pem  -X PUT -H "X-Auth-Token: HPAuth_769bcc02e0bf775aee3c7c5bbc647087a29e3da7103e2dde0d95beabb61f07e3" -H "Content-type: application/json" "https://localhost:35357/v2.0/HP-IDM/v1.1/domains/69784881406703/users/89309563001447/roles/00000000004004"  

**Additional Notes**

##### 3.4.2.18 List Role Definitions For A Domain And User ##### {#list_role_definitions_for_a_domain_and_user}
##### GET /HP-IDM/v1.0/domains/{domainId}/users/{userId}/roles
*Privilege Level: System Adminstrator (SA), Domain Admin (DA), Domain User (DU)*

This API is used to list all the roles defined in the specified {domainId} for the specified {userId} and takes several parameters including "marker" and "limit" to limit the number of role definitions in the response.

**Request Data**

A valid token must be presented in the *X-Auth-Token* HTTP header.  Otherwise, a 401 will be returned.

**URL Parameters**

* *domainId* - string - The domainId representing the domain to return role definitions for.
* *userId* - string - The userId representing the user to return role definitions for.
* *limit (Optional)* - integer - Represents the maximum number of elements which will be returned in the request. Default is 100.
* *marker (Optional)* - string - The resource Id of the last item in the previous list.

**Data Parameters**

See schema file for more details on the response data structure.

This call does not require a request body

JSON

    GET /v2.0/HP-IDM/v1.1/domains/69784881406703/users/89309563001447/roles HTTP/1.1  
    Connection: close  
    Accept: application/json  
    User-Agent: Jakarta Commons-HttpClient/3.1  
    Host: haneef-desktop.americas.hpqcorp.net:8080  

XML

    GET /v2.0/HP-IDM/v1.1/domains/69784881406703/users/89309563001447/roles HTTP/1.1  
    Connection: close  
    Accept: application/xml  
    User-Agent: Jakarta Commons-HttpClient/3.1  
    Host: haneef-desktop.americas.hpqcorp.net:8080  

Optional:


**Success Response**

List of roles with http status code 200.

**Status Code**

200 - OK

**Response Data**


JSON

    {"roles": {"role": [  
          {  
          "roleId": "xxxxxxxxxxxxxx",  
          "roleName": "role01",  
          "description": "role01 - description",  
          "serviceId" : "xxxxxxxxxxxxxx",  
          "domainId": "xxxxxxxxxxxxxx",  
       }, {  
          "roleId": "xxxxxxxxxxxxxx",  
          "roleName": "role02",  
          "description": "role02 - description",  
          "serviceId" : "xxxxxxxxxxxxxx",  
          "domainId": "xxxxxxxxxxxxxx",  
       }, {  
          "roleId": "xxxxxxxxxxxxxx",  
          "roleName": "role03",  
          "description": "role03 - description",  
          "serviceId" : "xxxxxxxxxxxxxx",  
          "domainId": "xxxxxxxxxxxxxx",  
       },  
    ]}  

XML

    <roles xmlns="http://hpcloud.hp.com/identity/api/ext/hp/v1.0">  
       <role>  
          <roleId>xxxxxxxxxxxxxx</roleId>  
          <roleName>role01</roleName>  
          <description>role01 - description</description>  
          <serviceId>xxxxxxxxxxxxxx</serviceId>  
          <domainId>xxxxxxxxxxxxxx</domainId>  
       </role>  
       <role>  
          <roleId>xxxxxxxxxxxxxx</roleId>  
          <roleName>role02</roleName>  
          <description>role02 - description</description>  
          <serviceId>xxxxxxxxxxxxxx</serviceId>  
          <domainId>xxxxxxxxxxxxxx</domainId>  
       </role>  
       <role>  
          <roleId>xxxxxxxxxxxxxx</roleId>  
          <roleName>role03</roleName>  
          <description>role03 - description</description>  
          <serviceId>xxxxxxxxxxxxxx</serviceId>  
          <domainId>xxxxxxxxxxxxxx</domainId>  
       </role>  
    </roles>  

**Error Response**

Please refer to error response body for additional details.

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 403 | Forbidden | Disabled or suspended user making the request. |
| 404 | Not Found | The specified domainId, marker or userId is not found. |
| 500 | Internal Server Error | The server encountered a problem while processing the request. |
| 503 | Service Unavailable | The server is unavailable to process the request. |

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

    curl -k --cert dev_hpmiddleware.pem  -X GET -H "X-Auth-Token: HPAuth_b4d1cf88adb2b9eb97766444958a24ff2ee8b2f8e7d2e26500c5133f9e8ec776" -H "Accept: application/json" "https://localhost:35357/v2.0/HP-IDM/v1.1/domains/69784881406703/users/89309563001447/roles"  

**Additional Notes**

#### 3.4.3 Group

**Group is a collection or a subset of Users owned by a Domain**. 

A role grant on a group essentially is the same as a granting the role to individual users in that group with the specified role. Adding a user to a group automatically grants the user with the specified roles currently associated with that group. Thus, removing a user from a group revokes the roles associated with the group from that user.

**Note**: *_The following document is based on the current reference implementation of Keystone - v3. Deviations from the reference implementation will be noted and this document updated to reflect such differences in behavior and/or implementation._**

**Status Lifecycle**

N/A

**Rate Limits**

N/A

**Quota Limits**

N/A

**Business Rules**

None.


##### 3.4.3.1 List Groups ##### {#list_groups}
##### `GET /v3/groups?page=pageNum&per_page=perPage&domain_id=domainId`

This API returns a listing of all groups for which the holder of the provided token is authorized to view. If the user is not a valid, an error is returned. The API allows for several optional query parameters to support pagination and an optional filter as described below.

*Privilege Level: SS*

**Request Data**

This API supports pagination. See Pagination for more details.

This API also supports an optional *`domain_id`* filter. Pagination and *`domain_id`* filter are mutually exclusive.

**URL Parameters**

* *`page`* (Optional) - integer - The page number.
* *`per_page`* (Optional, Default = 30) - integer - Maximum number of group records per page to be returned.
* *`domain_id`* (Optional) - string - return groups belonging to the specified domain, else return all groups. **_Note, An error will be returned if a domain with the specified *`domain_id`* does not exist - this differs in behavior from what the keystone reference implementation returns (reference implementation returns a `200 OK` status)._**

**Data Parameters**

See schema file for more details on the request and response data structure.

A valid token must be presented in the `X-Auth-Token` HTTP header. Otherwise, a `401 Unauthorized` will be returned.

This call does not require a request body.

**JSON**

> `curl -s -k -H 'X-Auth-Token: ADMIN' http://localhost:35357/v3/groups`

<pre>
GET /v3/groups HTTP/1.1
Host: localhost:35357
Accept: */*
X-Auth-Token: ADMIN

HTTP/1.1 200 OK
Vary: X-Auth-Token
Content-Type: application/json
Content-Length: 380
Date: Fri, 05 Apr 2013 20:00:09 GMT

{
    "links": {
        "self": "http://localhost:5000/v3/groups",
        "previous": null,
        "next": null
    },
    "groups": [{
        "domain_id": "default",
        "description": "{}",
        "id": "default",
        "links": {
            "self": "http://localhost:5000/v3/groups/default"
        },
        "name": "Default"
    },
    {
        "domain_id": "test1",
        "description": "{}",
        "id": "test1",
        "links": {
            "self": "http://localhost:5000/v3/groups/test1"
        },
        "name": "Test1"
    }]
}
</pre>

**XML**

> `curl -s -k -v -H 'X-Auth-Token: ADMIN' -H 'Content-type: application/xml'  -H 'Accept: application/xml' http://localhost:35357/v3/groups`

<pre>
GET /v3/groups HTTP/1.1
Host: localhost:35357
X-Auth-Token: ADMIN
Content-type: application/xml
Accept: application/xml

HTTP/1.1 200 OK
Vary: X-Auth-Token
Content-Type: application/xml
Content-Length: 585
Date: Fri, 05 Apr 2013 20:31:47 GMT

(XML output here below may not display due to Markdown format limitations).

<?xml version="1.0" encoding="UTF-8"?>
<groups xmlns="http://docs.openstack.org/identity/api/v2.0">
  <group id="default" name="Default" domain_id="default">
    <links>
      <link rel="self" href="http://localhost:5000/v3/groups/default"/>
    </links>
    <description>{}</description>
  </group>
  <group id="test1" name="Test1" domain_id="test1">
    <links>
      <link rel="self" href="http://localhost:5000/v3/groups/test1"/>
    </links>
    <description>{}</description>
  </group>
  <group id="dcc6841dd78e49d9918314c1a9e781b2" name="test-grp-1" domain_id="default">
    <links>
      <link rel="self" href="http://localhost:5000/v3/groups/dcc6841dd78e49d9918314c1a9e781b2"/>
    </links>
    <description></description>
  </group>
  <links>
    <link rel="self" href="http://localhost:5000/v3/groups"/>
  </links>
</groups>

</pre>

**Optional**:

**JSON**

> With `domain_id` and pagination filters:
> `curl -s -k -v -H 'X-Auth-Token: ADMIN' 'http://localhost:35357/v3/groups?page=1&per_page=1&domain_id=test1`

<pre>
GET /v3/groups?page=1&per_page=1&domain_id=test1 HTTP/1.1
Host: localhost:35357
Accept: */*
X-Auth-Token: ADMIN

HTTP/1.1 200 OK
Vary: X-Auth-Token
Content-Type: application/json
Content-Length: 235
Date: Fri, 05 Apr 2013 20:47:09 GMT
{
    "links" : {
        "self" : "http://localhost:5000/v3/groups",
        "previous" : null,
        "next" : null
    },
    "groups" : [{
            "domain_id" : "test1",
            "description" : "{}",
            "id" : "test1",
            "links" : {
                "self" : "http://localhost:5000/v3/groups/test1"
            },
            "name" : "Test1"
        }
    ]
}
</pre>

**JSON**

> **Specified domain does not exist**

>> **Note**: ***The Keystone v3 reference implementation does not return an error and instead the returns the following. The CS implementation will return an error in case the specified domain does not exist. (The CS sample output will be noted below when implementation is complete)***

> `curl -s -k -v -H 'X-Auth-Token: ADMIN' 'http://localhost:35357/v3/groups?domain_id=test2'`

**Keystone reference (v3) sample output**:

<pre>
GET /v3/groups?domain_id=test2 HTTP/1.1
Host: localhost:35357
Accept: */*
X-Auth-Token: ADMIN

HTTP/1.1 200 OK
Vary: X-Auth-Token
Content-Type: application/json
Content-Length: 100
Date: Mon, 08 Apr 2013 14:04:48 GMT
 
{
    "links" : {
        "self" : "http://localhost:5000/v3/groups",
        "previous" : null,
        "next" : null
    },
    "groups" : []
}
</pre>

**Control Services Keystone (v3) implementation sample output**:

> **To be filled in**

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Not Authorized | The caller does not have the privilege required to perform the operation. |
| 403 | Forbidden | Disabled or suspended user making the request. |
| 500 | Internal Server Error | The server encountered a problem while processing the request. |
| 503 | Service Unavailable | The server is unavailable to process the request.   |


**Example Error Responses**

**JSON**

> `401 Not Authorized`
> **Invalid or expired token**

<pre>
GET /v3/groups HTTP/1.1
Host: localhost:35357
X-Auth-Token: ssss
Content-type: application/json
 
HTTP/1.1 401 Not Authorized
Vary: X-Auth-Token
Content-Type: application/json
Content-Length: 195
Date: Sun, 07 Apr 2013 20:19:34 GMT

{
    "error": {
        "message": "The request you have made requires authentication.",
        "code": 401,
        "title": "Not Authorized"
    }
}
</pre>

> `403 Not Authorized` 
> **User does not have privileges**

>> **Note that standard HTTP error code 403 refers to  it as _Forbidden_ instead of _Not Authorized_**

> `curl -s -k -v -H 'X-Auth-Token: f7274bd3ca6a4bc0af1a577adda910f7' http://localhost:35357/v3/groups`

<pre>
GET /v3/groups HTTP/1.1
Host: localhost:35357
Accept: */*
X-Auth-Token: f7274bd3ca6a4bc0af1a577adda910f7
 
HTTP/1.1 403 Not Authorized
Vary: X-Auth-Token
Content-Type: application/json
Content-Length: 142
Date: Thu, 11 Apr 2013 18:44:36 GMT

{
    "error": {
        "message": "You are not authorized to perform the requested action: identity:list_groups",
        "code": 403,
        "title": "Not Authorized"
    }
}
</pre>

**Curl Examples**

Please refer to the examples above for curl sample commands and outputs.


**Additional Notes**


##### 3.4.3.2 Create Group ##### {#create_group}
##### `POST /v3/groups`

This API supports creation of a group within a specified domain. If a domain is not specified then the "default" domain will be used. *This operation is not idempotent (see output from Keystone (v3) reference implementation below).*

**_Note the request below - the reference keystone v3 impl request body requires that the "group" key be specified while the documentation indicates otherwise._**

**Request Data**

This API takes the group specification as the body of the request. 

* `name` (Required) - string - The name for the new group being created.
* `domain_id` (_Required_) - string - The domain to which group will belong to.
* `description` - (Optional) - string - an optional description for the group.

**URL Parameters**

None

**Data Parameters**

See schema file for more details on the request and response data structure.

A valid token must be presented in the `X-Auth-Token` HTTP header. Otherwise, a `401 Unauthorized` will be returned.

>>**Note**: **_Keystone (v3) reference implementation and the specification does not require `domain_id`. Control Services implementation requires `domain_id` to be specified._**

##### Curl Examples:

**JSON**

> `curl -v -k -X POST -H "X-Auth-Token: ADMIN" -H "Content-type: application/json" -d '{ "group" : {"name" : "test-grp-1"}}' http://localhost:35357/v3/groups`

<pre>
POST /v3/groups HTTP/1.1
Host: localhost:35357
Accept: */*
X-Auth-Token: ADMIN
Content-type: application/json
Content-Length: 36
 
HTTP/1.1 201 Created
Vary: X-Auth-Token
Content-Type: application/json
Content-Length: 205
Date: Sun, 07 Apr 2013 21:37:14 GMT

{
    "group": {
        "domain_id": "default",
        "description": "",
        "id": "dcc6841dd78e49d9918314c1a9e781b2",
        "links": {
            "self": "http://localhost:5000/v3/groups/dcc6841dd78e49d9918314c1a9e781b2"
        },
        "name": "test-grp-1"
    }
}
</pre>

**Example Error Responses**

> `401 Not Authorized`

> **Invalid or expired token**

> `curl -v -k -X POST -H "X-Auth-Token:" -H "Content-type: application/json" -d '{ "group" : {"name" : "test-grp-1"}}' http://localhost:35357/v3/groups`

<pre>
POST /v3/groups HTTP/1.1
Host: localhost:35357
Accept: */*
Content-type: application/json
Content-Length: 36

HTTP/1.1 401 Not Authorized
Vary: X-Auth-Token
Content-Type: application/json
Content-Length: 116
Date: Mon, 08 Apr 2013 15:54:27 GMT

{
    "error" : {
        "message" : "The request you have made requires authentication.",
        "code" : 401,
        "title" : "Not Authorized"
    }
}
</pre>

> `403 Not Authorized`

> **User does not have privileges**

> `curl -v -k -X POST -H "X-Auth-Token: 523a5266a14146229109454f2a5f81a9" -H "Content-type: application/json"  -d '{ "group" : {"name" : "Group 12"}}' http://localhost:35357/v3/groups`

<pre>
POST /v3/groups HTTP/1.1
Host: localhost:35357
Accept: */*

X-Auth-Token: 523a5266a14146229109454f2a5f81a9
Content-type: application/json
Content-Length: 34

HTTP/1.1 403 Not Authorized
Vary: X-Auth-Token
Content-Type: application/json
Content-Length: 143
Date: Thu, 11 Apr 2013 20:04:47 GMT

{
    "error": {
        "message": "You are not authorized to perform the requested action: identity:create_group",
        "code": 403,
        "title": "Not Authorized"
    }
}
</pre>

> `409 Conflict`

> **Group with the specified name already exists**

> `curl -v -k -X POST -H "X-Auth-Token: ADMIN" -H "Content-type: application/json"  -d '{ "group" : {"name" : "test-grp-1"}}' http://localhost:35357/v3/groups`

<pre>
POST /v3/groups HTTP/1.1
Host: localhost:35357
Accept: */*
X-Auth-Token: ADMIN
Content-type: application/json
Content-Length: 36

HTTP/1.1 409 Conflict
Vary: X-Auth-Token
Content-Type: application/json
Content-Length: 143
Date: Mon, 08 Apr 2013 16:11:55 GMT

{
    "error" : {
        "message" : "Conflict occurred attempting to store group. columns domain_id, name are not unique",
        "code" : 409,
        "title" : "Conflict"
    }
}
</pre>

##### 3.4.3.3 Delete Group ##### {#delete_group}
##### `DELETE /v3/groups/`

This API supports the deletion of a group using the groupId. The user calling this must have the privileges to perform deletion on the specified group. *This operation is not idempotent (see output from Keystone (v3) reference implementation below.*

**_Note the request below - the reference keystone v3 impl request body requires that the "group" key be specified while the documentation indicates otherwise._**

**Request Data**

Not supported by HTTP `DELETE`

**URL Parameters**

None

**Data Parameters**

See schema file for more details on the request and response data structure.

A valid token must be presented in the `X-Auth-Token` HTTP header. Otherwise, a `401 Unauthorized` will be returned.

##### Curl Examples:

**JSON**

> `curl -v -k -X DELETE -H 'X-Auth-Token: ADMIN' http://localhost:35357/v3/groups/51e7e4d9582c40488824bd69ea43bc2b`

<pre>
DELETE /v3/groups/51e7e4d9582c40488824bd69ea43bc2b HTTP/1.1
User-Agent: curl/7.22.0 (x86_64-pc-linux-gnu) libcurl/7.22.0 OpenSSL/1.0.1 zlib/1.2.3.4 libidn/1.23 librtmp/2.3
Host: localhost:35357
Accept: */*
X-Auth-Token: ADMIN
 
HTTP/1.1 204 No Content
Vary: X-Auth-Token
Content-Length: 0
Date: Mon, 08 Apr 2013 15:23:35 GMT
</pre>

**Example Error Responses**

> `404 Not Found`

> **Group with the specified id could not be found**

> `curl -v -k -X DELETE -H 'X-Auth-Token: ADMIN' http://localhost:35357/v3/groups/51e7e4d9582c40488824bd69ea43bc2b`

<pre>
DELETE /v3/groups/51e7e4d9582c40488824bd69ea43bc2b HTTP/1.1
Host: localhost:35357
Accept: */*
X-Auth-Token: ADMIN
 
HTTP/1.1 404 Not Found
Vary: X-Auth-Token
Content-Type: application/json
Content-Length: 115
Date: Mon, 08 Apr 2013 16:16:49 GMT

{
    "error" : {
        "message" : "Could not find group: 51e7e4d9582c40488824bd69ea43bc2b",
        "code" : 404,
        "title" : "Not Found"
    }
}
</pre>

#### 3.4.4 Projects

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


##### 3.4.4.1 List User Projects ##### {#list_user_projects}
##### GET /users/{user_id}/projects
*Privilege Level: Self Service (SS), System Adminstrator (SA), Domain Admin (DA), L1/L2/L3/L3+ Support*

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


**Additional Notes**


##### 3.4.4.2 Get Project ##### {#get_project}
##### GET /projects/{project_id}
*Privilege Level: Self Service (SS), System Adminstrator (SA), Domain Admin (DA), L1/L2/L3/L3+ Support*

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
    ```# Project  
    
    Project is a collection of services, and associated with zero or more users who have access to these services via role references.  
    
    A Project consists of the following fields:  
    
    | Attribute	| Type	| OpenStack	| HP-IDM	| Description	|  
    | :---------	| :-----------	| :-----------	| :-----------	| :-----------	|  
    | id	| string	| Mandatory	| Mandatory	| A globally unique project identifier	|  
    | name	| string	| Mandatory	| Mandatory	| A globally unique username	|  
    | domain_id	| string	| Optional	| Mandatory	| References the domain where project is defined	|  
    | enabled	| boolean	| Optional	| Optional	| Boolean true or false to indicate project is enabled or not. If not provided, defaults to true	|   
    | description	| string	| Optional	| Optional	| Descriptive text about project	|  
    | status	| string	| -	| Optional	| HP status values e.g. enabled, disabled, canceled, terminated etc.	|  
    | state	| string	| -	| Optional	| The users state (postal address)	|  
    | addressLine1	| string	| -	| Optional	| First line of the project's sold to address	|  
    | addressLine2	| string	| -	| Optional	| Second line of the project's sold to address	|  
    | city	| string	| -	| Optional	| The project's sold to address city	|  
    | zip	| string	| -	| Optional	| The project's sold to address zip code	|  
    | country	| string	| -	| Optional	| The project's sold to address country	|   
    | createdOn	| string	| -	| Optional	| Timestamp when project was created in system (read-only as cannot be updated by client)	|  
    | lastModifiedOn	| string	| -	| Optional	| Timestamp when project was last modified (read-only as cannot be updated by client)	|  
    
    Example entity:  
    
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
    
    **Differences Between HP and OpenStack Keystone**  
    
    HP requires various extension parameters detailed in the attribute table above.   
    1. 'enabled' and 'status' are two fields for indicating project entity status. 'enabled' is keystone boolean attribute whereas 'status' is HP specific field which can have one of multiple values e.g. 'enabled' , 'disabled', 'suspended:2', 'suspended:3', 'canceled', 'terminated'.  
    1. 'domain_id' is a required input parameter while creating a new project.  
    
    **Status Lifecycle**  
    
    N/A  
    
    **Rate Limits**  
    
    N/A  
    
    **Quota Limits**  
    
    N/A  
    
    **Business Rules**  
    
    1. 'name' value is expected to be globally unique.  
    1. Optional query parameter 'timeOut' value is expected to be non-zero positive integer. Otherwise system defined default timeOut value is used. Suggested timeOut value is 60 seconds. Don't make 'timeOut' value too small as that can result in http 408 error for client while requested action may still complete at server side.  
    1. A new project is always created with enabled status so 'enabled and 'status' field input value is not used in that API. Still 'enabled' field value, if passed, is expected to be true or false only.  
    1. If 'enabled' field is true, then HP specific 'status' field is set to 'enabled'. If 'enabled' field is set to false in update, then HP specific 'status' field is set to 'disabled'.  
    1. If both 'enabled' and 'status' field values are provided, then 'status' field values takes the precedance.  
    1. Address fields are not a mandatory parameter but if provided it should have all the required components (e.g. state and country).As per requirement addressLine1, addressLine2, city and zip are optional address fields.  
    1. If no address is provided in parameter this action will use the domain's soldTo address to map to tenant's soldTo address,if soldTo address in CS domains is not present we use the soldTo contact's address from Zuora domain account.  
    1. If ticket id is present in error response, further details can be obtained via CS action service API 'Get A Job Ticket'.  
    1. homeRegion (extension input data) can be specified in request body to indicate specific region where project entity needs to created. Current valid values are 'region-a.geo-1' and 'region-b.geo-1'. By default, if its missing then project is created in same region as input domain_id. This input data is applicable only for create project API and will not have any impact on update project API.  
    
    #### Create Project: `POST /projects`  
    *Privilege Level: Domain Admin (DA), L3+ Support, System Adminstrator (SA)*  
    
    Creates a new project in 'enabled' status.   
    
    **URL Parameters**  
    
    * *timeOut* (Optional)} - integer - non-zero positive value represents the request should wait at least the given length of time in seconds to complete - either successfully or due to error. If request does not complete with time period, timeout error is returned.  
    
    **Data Parameters**  
    
    1. name and domain_id is required data in request body.  
    1. homeRegion, an optional data, can be specified to indicate region where project entity needs to created. Current valid values are 'region-a.geo-1' and 'region-b.geo-1'. By default, if its missing then project is created in same region as input domain_id.  
    
    See schema file for more details on the request and response data structure.  
    
    A valid token must be presented in the *X-Auth-Token* HTTP header. Otherwise, a 401 will be returned.  
    
    Request:   
    Content-Type header is needed to indicate format of request body.  
    
    JSON  
    
POST https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects?timeOut=60 HTTP/1.1
Accept-Encoding: gzip,deflate
X-Auth-Token: HPAuth10_1aa07de4f94afd2cc8f236fdca256f2798cc360047c851e343e9aa60c2bacdb6
Content-Type: application/json

{"project": {
   "name": "tenantName_264792591811201316035699",
   "description": "new compute project",
   "HP-IDM":    {
      "homeRegion": "region-a.geo-1",
      "soldToAddress":       {
         "city": "Sunnyvale",
         "zip": "94089",
         "country": "USA",
         "state": "CA",
         "addressLine2": "Building F",
         "addressLine1": "1140 Enterprise Way"
      }
   },
   "domain_id": "10490535946101"
}}
    
    XML  
POST https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects?timeOut=60 HTTP/1.1
Accept-Encoding: gzip,deflate
X-Auth-Token: HPAuth10_1aa07de4f94afd2cc8f236fdca256f2798cc360047c851e343e9aa60c2bacdb6
Content-Type: application/xml

<project enabled="true" domain_id="10490535946101" name="tenantName_262392591811201316035699">
   <description>Compute3</description>
   <HP-IDM>
      <soldToAddress city="Sunnyvale" zip="94089" country="USA" state="CA" addressLine2="Building F" addressLine1="1140 Enterprise Way"/>
   </HP-IDM>
</project>
    
    **Success Response**  
    
    Returns newly created project with id. Response format is derived from 'Accept' header otherwise default response content type is 'application/json'  
    
    **Status Code**  
    
    201 - OK  
    
    **Response Data**  
    
    JSON  
    
HTTP/1.1 201 Created
Vary: X-Auth-Token
Content-Type: application/json
Content-Length: 486
Date: Wed, 04 Dec 2013 21:42:04 GMT
Connection: keep-alive

{"project": {
   "name": "tenantName_264792591811201316035699",
   "links": {"self": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10437604990146"},
   "enabled": true,
   "id": "10437604990146",
   "HP-IDM":    {
      "status": "enabled",
      "lastModifiedOn": "2013-12-04T21:49:48.389000",
      "createdOn": "2013-12-04T21:49:47.082000",
      "soldToAddress":       {
         "city": "Sunnyvale",
         "zip": "94089",
         "country": "USA",
         "state": "CA",
         "addressLine2": "Building F",
         "addressLine1": "1140 Enterprise Way"
      }
   },
   "domain_id": "10490535946101"
}}
    
    XML  
    
HTTP/1.1 201 Created
Vary: X-Auth-Token
Content-Type: application/xml
Content-Length: 577
Date: Wed, 04 Dec 2013 21:52:54 GMT
Connection: keep-alive

<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://docs.openstack.org/identity/api/v3" name="tenantName_26346692591811201316035699" enabled="true" id="10426111970584" domain_id="10490535946101">
  <links>
    <link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10426111970584"/>
  </links>
  <HP-IDM status="enabled" lastModifiedOn="2013-12-04T21:52:53.616000" createdOn="2013-12-04T21:52:52.084000">
    <soldToAddress city="Sunnyvale" zip="94089" country="USA" state="CA" addressLine2="Building F" addressLine1="1140 Enterprise Way"/>
  </HP-IDM>
</project>
    
    **Error Response**  
    
    **Status Code**  
    
    | Status Code | Description | Reasons |  
    | :-----------| :-----------| :-------|  
    | 400 | Bad Request | Malformed request in URI or request body. When 'enabled' value is not boolean or timeOut param has non-integer value  |  
    | 401 | Unauthorized | Missing required authentication data i.e. X-Auth-Token header |  
    | 401 | Unauthorized | Disabled or suspended user making the request. |  
    | 403 | Forbidden | The caller does not have the privilege required to perform the operation. |  
    | 404 | Not Found | When input domain_id is not found in system. |  
    | 408 | Request Timeout | When request processing took more than specified timeout or system default timeout. |  
    | 409 | Conflict | When input name already exists in system. |  
    | 500 | Internal Server Error | The server encountered a problem while processing the request. |  
    | 503 | Service Unavailable | The server is unavailable to process the request.   |  
    
    **Response Data**  
    
    JSON  
    
{"error": {
   "message": "The request you have made requires authentication.",
   "code": 401,
   "title": "Unauthorized"
}}
    
{"error": {
   "message": "You are not authorized to perform the requested action, identity:hpidm_create_project.",
   "code": 403,
   "title": "Forbidden"
}}
    
{"error": {
   "message": "Could not find domain, 104905359461012.",
   "code": 404,
   "title": "Not Found"
}}
    
{"error": {
   "message": "Conflict occurred attempting to store project. Project with name [tenantName_26946692591811201316035699] already in the System",
   "code": 409,
   "title": "Conflict"
}}
    
{"error": {
   "message": "CreateTenant reported status as TimedOut for ticket id =10ba30875b878b472988fc7479fa40a373. ErrorMessage : Request timed out",
   "code": 408,
   "title": "Request Timeout"
}}
    
    
    XML  
    
<error xmlns="http://docs.openstack.org/identity/api/v3" message="CreateTenant reported status as TimedOut for ticket id =1085d6aa8d854d414bb1de8e4d96c39689. ErrorMessage : Request timed out" code="408" title="Request Timeout"/>
    
    **Curl Example**  
    
curl -k -X POST -H "X-Auth-Token: HPAuth10_1aa07de4f94afd2cc8f236fdca256f2798cc360047c851e343e9aa60c2bacdb6" -H "Content-Type: application/json" -H "Accept: application/json" --data '{"project": { "name": "tenantname_279466925431811201316035699", "description": "new compute project2", "HP-IDM": { "soldToAddress": { "city": "Sunnyvale", "zip": "94089", "country": "USA", "state": "CA",        "addressLine2": "Building F", "addressLine1": "1140 Enterprise Way"} }, "domain_id": "10490535946101"}}' "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects?timeOut=60"
    
    #### Update project: `PATCH /projects/{project_id}`  
    *Privilege Level: Domain Admin (DA), L3 Support, L3+ Support, System Adminstrator (SA)*  
    
    Updates existing project data.  
    
    **URL Parameters**  
    
    * *timeOut* (Optional)} - integer - non-zero positive value represents the request should wait at least the given length of time in seconds to complete - either successfully or due to error. If request does not complete with time period, timeout error is returned.  
    
    
    **Data Parameters**  
    
    1. project_id is needed as part of request URI.  
    1. domain_id is not needed in request body and is ignored if present.  
    1. 'id' in request body need to match project_id specified in URI otherwise error is returned.  
    
    See schema file for more details on the request and response data structure.  
    
    A valid token must be presented in the *X-Auth-Token* HTTP header. Otherwise, a 401 will be returned.  
    
    Request:  
    Content-Type header is needed to indicate format of request body.  
    
    JSON  
    
PATCH https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10249239463039 HTTP/1.1
Accept-Encoding: gzip,deflate
Accept: application/xml
X-Auth-Token: HPAuth10_1aa07de4f94afd2cc8f236fdca256f2798cc360047c851e343e9aa60c2bacdb6
Accept: application/json
Content-Type: application/json

{"project": {
   "name": "tenantName_222392591811201316035699",   
   "enabled": false,
   "id": "10249239463039",
   "HP-IDM":    {
      "soldToAddress":       {
         "city": "Sunnyvale",
         "zip": "94089",
         "country": "USA",
         "state": "CA",
         "addressLine2": "Building F",
         "addressLine1": "1140 Enterprise Way"
      }     
   },
   "description": "Compute2",
   "domain_id": "10490535946101"
}}
    
    XML  
    
PATCH https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10249239463039 HTTP/1.1
Accept-Encoding: gzip,deflate
Accept: application/xml
X-Auth-Token: HPAuth10_1aa07de4f94afd2cc8f236fdca256f2798cc360047c851e343e9aa60c2bacdb6
Accept: application/json
Content-Type: application/xml

<project enabled="false" id="10249239463039" name="tenantName_222392591811201316035699">
   <description>Compute2</description>
   <HP-IDM status="disabled">
      <soldToAddress city="Sunnyvale" zip="94089" country="USA" state="CA" addressLine2="Building F" addressLine1="1140 Enterprise Way"/>
   </HP-IDM>
</project>
    
    **Success Response**  
    
    Returns updated project. Response format is derived from 'Accept' header otherwise default response content type is 'application/json'  
    
    **Status Code**  
    
    200 - OK  
    
    **Response Data**  
    
    JSON  
    
HTTP/1.1 200 OK
Vary: X-Auth-Token
Content-Type: application/json
Content-Length: 515
Date: Wed, 04 Dec 2013 22:46:07 GMT
Connection: keep-alive


{"project": {
   "description": "Compute2",
   "links": {"self": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10249239463039"},
   "enabled": false,
   "id": "10249239463039",
   "HP-IDM":    {
      "status": "disabled",
      "lastModifiedOn": "2013-12-04T20:07:56.784000",
      "createdOn": "2013-12-04T16:41:55.896000",
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
   "name": "tenantName_222392591811201316035699"
}}
    
    XML  
    
HTTP/1.1 200 OK
Vary: X-Auth-Token
Content-Type: application/xml
Content-Length: 615
Date: Wed, 04 Dec 2013 22:48:48 GMT
Connection: keep-alive

<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://docs.openstack.org/identity/api/v3" enabled="false" id="10249239463039" domain_id="10490535946101" name="tenantName_222392591811201316035699">
  <description>Compute2</description>
  <links>
    <link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10249239463039"/>
  </links>
  <HP-IDM status="disabled" lastModifiedOn="2013-12-04T20:07:56.784000" createdOn="2013-12-04T16:41:55.896000">
    <soldToAddress city="Sunnyvale" zip="94089" country="USA" state="CA" addressLine2="Building F" addressLine1="1140 Enterprise Way"/>
  </HP-IDM>
</project>
    
    **Error Response**  
    
    **Status Code**  
    
    | Status Code | Description | Reasons |  
    | :-----------| :-----------| :-------|  
    | 400 | Bad Request | Malformed request in URI or request body. When 'enabled' value is not boolean or timeOut param has non-integer value  |  
    | 401 | Unauthorized | Missing required authentication data i.e. X-Auth-Token header |  
    | 401 | Unauthorized | Disabled or suspended user making the request. |  
    | 403 | Forbidden | The caller does not have the privilege required to perform the operation. |  
    | 404 | Not Found | When input project_id is not found in system. |  
    | 408 | Request Timeout | When request processing took more than specified timeout or system default timeout. |  
    | 409 | Conflict | When input name already exists in system. |  
    | 500 | Internal Server Error | The server encountered a problem while processing the request. |  
    | 503 | Service Unavailable | The server is unavailable to process the request.   |  
    
    **Response Data**  
    
    JSON  
    
{"error": {
   "message": "Cannot change ID",
   "code": 400,
   "title": "Bad Request"
}}
    
{"error": {
   "message": "The request you have made requires authentication.",
   "code": 401,
   "title": "Unauthorized"
}}
    
{"error": {
   "message": "Could not find project, 102492394630391.",
   "code": 404,
   "title": "Not Found"
}}
    
{"error": {
   "message": "Conflict occurred attempting to store project. Project with name [tenantName_26946692591811201316035699] already in the System",
   "code": 409,
   "title": "Conflict"
}}
    
{"error": {
   "message": "UpdateTenant reported status as TimedOut for ticket id =10ba30875b878b472988fc7479fa40a373. ErrorMessage : Request timed out",
   "code": 408,
   "title": "Request Timeout"
}}
    
    XML  
    
<error xmlns="http://docs.openstack.org/identity/api/v3" message="UpdateTenant reported status as TimedOut for ticket id =1085d6aa8d854d414bb1de8e4d96c39689. ErrorMessage : Request timed out" code="408" title="Request Timeout"/>
    
    **Curl Example**  
    
    
curl -k -X PATCH -H "X-Auth-Token: HPAuth10_1aa07de4f94afd2cc8f236fdca256f2798cc360047c851e343e9aa60c2bacdb6" -H "Content-Type: application/json" -H "Accept: application/json" --data '{"project": { "name": "tenantname_279466925431811201316035699", "description": "new compute project2", "HP-IDM": { "status": "enabled", "soldToAddress": { "city": "Sunnyvale", "zip": "94089", "country": "USA", "state": "CA",        "addressLine2": "Building F", "addressLine1": "1160 Enterprise Way"} }, "domain_id": "10490535946101"}}' "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10249239463039?timeOut=60"
    
    #### Delete Project: `DELETE /projects/{project_id}`  
    *Privilege Level: Domain Admin (DA), L3 Support, L3+ Support, System Adminstrator (SA)*  
    
    Deletes the specified project.  
    
    **URL Parameters**  
    
    * *timeOut* (Optional)} - integer - non-zero positive value represents the request should wait at least the given length of time in seconds to complete - either successfully or due to error. If request does not complete with time period, timeout error is returned.  
    
    **Data Parameters**  
    
    project_id is needed in URI. There is no request body for this request.  
    
    A valid token must be presented in the *X-Auth-Token* HTTP header. Otherwise, a 401 will be returned.  
    
    Request:  
    
    
    JSON  
    
DELETE https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10461632972865 HTTP/1.1
Accept-Encoding: gzip,deflate
X-Auth-Token: HPAuth10_1aa07de4f94afd2cc8f236fdca256f2798cc360047c851e343e9aa60c2bacdb6
    
    XML  
    
DELETE https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10461632972865 HTTP/1.1
Accept-Encoding: gzip,deflate
X-Auth-Token: HPAuth10_1aa07de4f94afd2cc8f236fdca256f2798cc360047c851e343e9aa60c2bacdb6
    
    **Success Response**  
    
    Returns http code 204 indicating successful deletion.  
    
    **Status Code**  
    
    204 - No Content  
    
    **Response Data**  
    
    JSON  
    
HTTP/1.1 204 No Content
Vary: X-Auth-Token
Content-Length: 0
Date: Wed, 04 Dec 2013 23:00:18 GMT
Connection: keep-alive
    
    XML  
    
HTTP/1.1 204 No Content
Vary: X-Auth-Token
Content-Length: 0
Date: Wed, 04 Dec 2013 23:00:18 GMT
Connection: keep-alive
    
    **Error Response**  
    
    **Status Code**  
    
    | Status Code | Description | Reasons |  
    | :-----------| :-----------| :-------|  
    | 400 | Bad Request | Malformed request in URI or request body. When timeOut param has non-integer value  |  
    | 401 | Unauthorized | Missing required authentication data i.e. X-Auth-Token header |  
    | 401 | Unauthorized | Disabled or suspended user making the request. |  
    | 403 | Forbidden | The caller does not have the privilege required to perform the operation. |  
    | 404 | Not Found | When input project_id is not found in system. |  
    | 408 | Request Timeout | When request processing took more than specified timeout or system default timeout. |  
    | 500 | Internal Server Error | The server encountered a problem while processing the request. |  
    | 503 | Service Unavailable | The server is unavailable to process the request.   |  
    
    **Response Data**  
    
    JSON  
    
    
{"error": {
   "message": "The request you have made requires authentication.",
   "code": 401,
   "title": "Unauthorized"
}}
    
{"error": {
   "message": "Could not find project, 102492394630391.",
   "code": 404,
   "title": "Not Found"
}}
    
{"error": {
   "message": "PurgeTenant reported status as TimedOut for ticket id =10dd0f6cbb551f4540a2926f2ed596d707. ErrorMessage : Request timed out",
   "code": 408,
   "title": "Request Timeout"
}}
    
    XML  
    
<error xmlns="http://docs.openstack.org/identity/api/v3" message="PurgeTenant reported status as TimedOut for ticket id =1085d6aa8d854d414bb1de8e4d96c39689. ErrorMessage : Request timed out" code="408" title="Request Timeout"/>
    
    **Curl Example**  
    
    
curl -k -X DELETE -H "X-Auth-Token: HPAuth10_1aa07de4f94afd2cc8f236fdca256f2798cc360047c851e343e9aa60c2bacdb6" "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/projects/10249239463039?timeOut=60"
#### 3.4.5 Role Assignment
    
    API to create, update, list and delete role assignments, both at the domain and project levels.  
    
    **Status Lifecycle**  
    
    N/A  
    
    **Rate Limits**  
    
    N/A  
    
    **Quota Limits**  
    
    N/A  
    
    **Business Rules**  
    
    None.  
    
##### 3.4.5.1 Grant Role To A User On Project ##### {#grant_role_to_a_user_on_project}
    #### PUT /projects/{project_id}/users/{user_id}/roles/{role_id}  
    *Privilege Level: SA, DA*  
    
    This API is used to create a project role assignment for user.  
    
    Constraints:  
    
    This is a privileged operation, only superadmin or domainadmin can create a role assignment.  
    Only super admin is allowed to make a role assignment for "System" scoped roles.  
    All the entities in the context should be valid (User, Domain, Role)  
    Non-project role assignment is not allowed with this API (see domain role assignment API).  
    Role assignment should be made on project's domain.  
    Service must be activated on the project.  
    
    **Request Data**  
    
    See examples below.  
    
    **URL Parameters**  
    
    The following parameters need to be specified in the resource path  
    
    * *project_id* - string - the unique id of the project  
    * *user_id* - string - the unique id of the user  
    * *role_id* - string - the unique id of the role  
    
    No query parameters are required for this call  
    
    **Data Parameters**  
    
    The following HTTP headers must be specified.  
    
    * *X-Auth-Token* - token ID  
    
    This call does not require a request body  
    
PUT /projects/xxx/users/yyy/roles/00000000004023 HTTP/1.1
Accept: application/json
X-Auth-Token: HPAuth_TOKEN
    
    **Success Response**  
    
    **Status Code**  
    
    200 - OK (if role assignment already exists)  
    201 - Created  
    
    **Response Data**  
    
HTTP/1.1 201 Created
Server: Apache-Coyote/1.1
    
    **Error Response**  
    
    **Status Code**  
    
    | Status Code | Description | Reasons |  
    | :-----------| :-----------| :-------|  
    | 400 | Bad Request | Malformed request in URI or request body |   
    | 401 | Unauthorized | The caller does not have the privilege required to perform the operation |   
    | 403 | Forbidden | Disabled or suspended project making the request |  
    | 404 | Not Found | The specified project, user or role was not found |  
    | 500 | Internal Server Error | The server encountered a problem while processing the request |  
    | 503 | Service Unavailable | The server is unavailable to process the request |  
    
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
    
<?xml version="1.0" encoding="UTF-8" standalone="yes"?><unauthorized xmlns="http://docs.openstack.org/identity/api/v3.0" xmlns:ns2="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" xmlns:ns3="http://docs.openstack.org/common/api/v1.0" xmlns:ns4="http://www.w3.org/2005/Atom" code="401"><message>UNAUTHORIZED</message><details>Invalid credentials</details></unauthorized>
    
    **Curl Example**  
    
curl -s --cert <CERT_FILE> --cacert <CACERT_FILE> -X PUT -H "X-Auth-Token: HPAuth_TOKEN" https://localhost:35357/v3/projects/xxx/users/yyy/roles/00000000004023
    
    **Additional Notes**  
    
    None  
    
##### 3.4.5.2 Check If User Has Role On Project ##### {#check_if_user_has_role_on_project}
    #### HEAD /projects/{project_id}/users/{user_id}/roles/{role_id}  
    *Privilege Level: SA, DA, DU*  
    
    This API does not return any content.  
    
    Constraints:  
    
    All the id's should represent a valid entity (user_id, role_id).  
    Domain (non-project) level role assignments are not associated with a project.  
    
    **Request Data**  
    
    See examples below.  
    
    **URL Parameters**  
    
    The following parameters need to be specified in the resource path  
    
    * *project_id* - string - the unique id of the project  
    * *user_id* - string - the unique id of the user  
    * *role_id* - string - the unique id of the role  
    
    **Data Parameters**  
    
    The following HTTP headers must be specified.  
    
    * *X-Auth-Token* - token ID  
    
    This call does not require a request body  
    
HEAD /projects/xxx/users/yyy/roles/00000000004026 HTTP/1.1
X-Auth-Token: HPAuth_TOKEN
Accept: application/json
    
    **Success Response**  
    
    **Status Code**  
    
    200 - OK  
    204 - No content  
    
    **Response Data**  
    
    JSON  
    
HTTP/1.1 200 OK
Server: Apache-Coyote/1.1
Set-Cookie: JSESSIONID=20DD4F9E1E3D2B0485DC81D93609DE30; Path=/; Secure
Cache-Control: no-cache
Pragma: no-cache
Expires: -1
Content-Length: 0
Date: Wed, 26 Sep 2012 17:58:59 GMT
    
    XML  
    
HTTP/1.1 200 OK
Server: Apache-Coyote/1.1
Set-Cookie: JSESSIONID=20DD4F9E1E3D2B0485DC81D93609DE30; Path=/; Secure
Cache-Control: no-cache
Pragma: no-cache
Expires: -1
Content-Length: 0
Date: Wed, 26 Sep 2012 17:58:59 GMT
    
    **Error Response**  
    
    **Status Code**  
    
    | Status Code | Description | Reasons |  
    | :-----------| :-----------| :-------|  
    | 400 | Bad Request | Malformed request in URI or request body |   
    | 401 | Unauthorized | The caller does not have the privilege required to perform the operation |   
    | 403 | Forbidden | Disabled or suspended project making the request |  
    | 500 | Internal Server Error | The server encountered a problem while processing the request |  
    | 503 | Service Unavailable | The server is unavailable to process the request |  
    
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
    
<?xml version="1.0" encoding="UTF-8" standalone="yes"?><unauthorized xmlns="http://docs.openstack.org/identity/api/v3.0" xmlns:ns2="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" xmlns:ns3="http://docs.openstack.org/common/api/v1.0" xmlns:ns4="http://www.w3.org/2005/Atom" code="401"><message>UNAUTHORIZED</message><details>Invalid credentials</details></unauthorized>
    
    **Curl Example**  
    
curl -s --cert <CERT_FILE> --cacert <CACERT_FILE> -X HEAD -H "X-Auth-Token: HPAuth_TOKEN" https://localhost:35357/v3/projects/xxx/users/yyy/roles/00000000004026
    
    **Additional Notes**  
    
    None  
    
##### 3.4.5.3 List User's Roles On Project ##### {#list_users_roles_on_project}
    #### GET /projects/{project_id}/users/{user_id}/roles  
    *Privilege Level: SA, DA, DU*  
    
    This API returns all the role assignments on a particular project for a user (filtered by serviceId).  
    
    Constraints:  
    
    List a users project role assignments is not a privileged operation so far.  
    ServiceId is not a mandatory field, if provided response should be filtered.  
    
    **Request Data**  
    
    See examples below.  
    
    **URL Parameters**  
    
    The following parameters need to be specified in the resource path  
    
    * *project_id* - string - the unique id of the project  
    * *user_id* - string - the unique id of the user  
    
    The following are the supported list of query parameters to filter the results  
    
    * *serviceId* (Optional) - string - list roles specific to the service identified by this id  
    * *page (Optional)* - integer - page number  
    * *per_page (Optional)* - integer - represents the maximum number of elements which will be returned in the request.  Default is 100.  
    
    **Data Parameters**  
    
    The following HTTP headers must be specified.  
    
    * *X-Auth-Token* - token ID  
    
    This call does not require a request body  
    
GET /projects/xxx/users/yyy/roles?serviceId=120 HTTP/1.1
X-Auth-Token: HPAuth_TOKEN
Accept: application/json
    
    **Success Response**  
    
    **Status Code**  
    
    200 - OK  
    204 - No content  
    
    **Response Data**  
    
    JSON  
    
HTTP/1.1 200 OK
Server: Apache-Coyote/1.1
Cache-Control: no-cache
Pragma: no-cache
Expires: -1
Content-Type: application/json
Content-Length: 380
Date: Thu, 25 Aug 2011 23:33:19 GMT

{"roles": {"role": [
    {
    "roleAssignmentId": "000",
    "id": "001",
    "name": "role01",
      "description": "role01-description",
      "serviceId" : "xxxxxxxxxxxxxx",
      "domain_id": "xxxxxxxxxxxxxx",
    "project_id": "xxxxxxxxxxxxxx",
    "subjectName": "user-1",
    "subjectType": "User",
    "subjectId": "xxxxxxxxxxxxxx",
    "isCrossDomain": false,
      "links": {
          "self": "https://www.hpcloud.com:35357/v3/roles/001"
      }
    },
    {
    "roleAssignmentId": "111",
      "id": "002",
      "name": "role02",
      "description": "role02-description",
      "serviceId" : "xxxxxxxxxxxxxx",
      "domain_id": "xxxxxxxxxxxxxx",
    "project_id": "xxxxxxxxxxxxxx",
    "subjectName": "user-1",
    "subjectType": "User",
    "subjectId": "xxxxxxxxxxxxxx",
    "isCrossDomain": false,
      "links": {
          "self": "https://www.hpcloud.com:35357/v3/roles/002"
      }
    }
]}}
    
    XML  
    
HTTP/1.1 200 OK
Server: Apache-Coyote/1.1
Cache-Control: no-cache
Pragma: no-cache
Expires: -1
Content-Type: application/xml
Content-Length: 380
Date: Thu, 25 Aug 2011 23:33:19 GMT

<roles xmlns="http://www.hp.com/identity/api/ext/HP-IDM/v1.0">
    <role>
        <roleAssignmentId>000</roleAssignmentId>
        <id>001</id>
        <name>role01</name>
        <subjectName>user-1</subjectName>
        <subjectType>User</subjectType>
        <description>role01-description"</description>
        <subjectId>xxxxxxxxxxxxxx</subjectId>
        <domainId>xxxxxxxxxxxxxx</domainId>
        <serviceId>xxxxxxxxxxxxxx</serviceId>
        <project_id>xxxxxxxxxxxxxx</project_id>
        <isCrossDomain>false</isCrossDomain>
        <links>
          <self>https://www.hpcloud.com:35357/v3/roles/001</self>
      </links>
    </role>
    <role>
    <roleAssignmentId>111</roleAssignmentId>
    <id>002</id>
    <name>role02</name>
    <subjectName>user-1</subjectName>
    <subjectType>User</subjectType>
    <description>role02-description"</description>
    <subjectId>xxxxxxxxxxxxxx</subjectId>
    <domainId>xxxxxxxxxxxxxx</domainId>
    <serviceId>xxxxxxxxxxxxxx</serviceId>
    <project_id>xxxxxxxxxxxxxx</project_id>
    <isCrossDomain>false</isCrossDomain>
      <links>
          <self>https://www.hpcloud.com:35357/v3/roles/002</self>
      </links>
    </role>
    <links>
       <previous>https://www.hpcloud.com:35357/v3/projects/xxx/users/yyy/roles?page=1</previous>
       <next>https://www.hpcloud.com:35357/v3/projects/xxx/users/yyy/roles?page=3</next>
   </links>
</roles>
    
    **Error Response**  
    
    **Status Code**  
    
    | Status Code | Description | Reasons |  
    | :-----------| :-----------| :-------|  
    | 400 | Bad Request | Malformed request in URI or request body |   
    | 401 | Unauthorized | The caller does not have the privilege required to perform the operation |   
    | 403 | Forbidden | Disabled or suspended user making the request |  
    | 500 | Internal Server Error | The server encountered a problem while processing the request |  
    | 503 | Service Unavailable | The server is unavailable to process the request |  
    
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
    
<?xml version="1.0" encoding="UTF-8" standalone="yes"?><unauthorized xmlns="http://docs.openstack.org/identity/api/v3.0" xmlns:ns2="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" xmlns:ns3="http://docs.openstack.org/common/api/v1.0" xmlns:ns4="http://www.w3.org/2005/Atom" code="401"><message>UNAUTHORIZED</message><details>Invalid credentials</details></unauthorized>
    
    **Curl Example**  
    
curl -s --cert <CERT_FILE> --cacert <CACERT_FILE> -X HEAD -H "X-Auth-Token: HPAuth_TOKEN" https://localhost:35357/v3/projects/xxx/users/yyy/roles
    
    **Additional Notes**  
    
    None  
    
##### 3.4.5.4 Revoke Role From User On Project ##### {#revoke_role_from_user_on_project}
    #### DELETE /projects/{project_id}/users/{user_id}/roles/{role_id}  
    *Privilege Level: SA, DA*  
    
    This API is used to revoke a project role assignment for a user.   
    
    Constraints:  
    
    This is a privileged operation.  
    
    **Request Data**  
    
    See examples below.  
    
    **URL Parameters**  
    
    The following parameters need to be specified in the resource path  
    
    * *project_id* - string - the unique id of the project  
    * *user_id* - string - the unique id of the user  
    * *role_id* - string - the unique id of the role  
    
    No query parameters are required for this call  
    
    **Data Parameters**  
    
    The following HTTP headers must be specified.  
    
    * *X-Auth-Token* - token ID  
    
    This call does not require a request body  
    
DELETE /projects/xxx/users/yyy/roles/00000000004023 HTTP/1.1
X-Auth-Token: HPAuth_TOKEN
Accept: application/json
    
    **Success Response**  
    
    **Status Code**  
    
    200 - OK  
    
    **Response Data**  
    
HTTP/1.1 204 No Content
Server: Apache-Coyote/1.1
Cache-Control: no-cache
Pragma: no-cache
Expires: -1
Date: Tue, 09 Aug 2011 22:20:25 GMT
    
    **Error Response**  
    
    | Status Code | Description | Reasons |  
    | :-----------| :-----------| :-------|  
    | 400 | Bad Request | Malformed request in URI or request body |   
    | 401 | Unauthorized | The caller does not have the privilege required to perform the operation |   
    | 403 | Forbidden | Disabled or suspended project making the request |  
    | 404 | Not Found | The specified project, user or role was not found |  
    | 500 | Internal Server Error | The server encountered a problem while processing the request |  
    | 503 | Service Unavailable | The server is unavailable to process the request |  
    
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
    
<?xml version="1.0" encoding="UTF-8" standalone="yes"?><unauthorized xmlns="http://docs.openstack.org/identity/api/v3.0" xmlns:ns2="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" xmlns:ns3="http://docs.openstack.org/common/api/v1.0" xmlns:ns4="http://www.w3.org/2005/Atom" code="401"><message>UNAUTHORIZED</message><details>Invalid credentials</details></unauthorized>
    
    **Curl Example**  
    
curl -s --cert <CERT_FILE> --cacert <CACERT_FILE> -X DELETE -H "X-Auth-Token: HPAuth_TOKEN" https://localhost:35357/v3/projects/xxx/users/yyy/roles/00000000004023
    
    **Additional Notes**  
    
    None  
    
##### 3.4.5.5 Assign A Domain (non-project) Role Assignment In The Specified Domain For The Specified User ##### {#assign_a_domain_(non-project)_role_assignment_in_the_specified_domain_for_the_specified_user}
    #### PUT /domains/{domain_id}/users/{user_id}/roles/{role_id}  
    *Privilege Level: System Adminstrator (SA), Domain Admin (DA)*  
    
    Assigns the specified role association by its {role_id}, in the specfied {domain_id} for the specfied {user_id}.  
    
    **Request Data**  
    
    A valid token must be presented in the *X-Auth-Token* HTTP header.  Otherwise, a 401 will be returned.  
    
    **URL Parameters**  
    
    * *domain_id* - string - the id of the domain to assign the role from (required)  
    * *user_id* - string - the id of the user to assign the role for (required)  
    * *role_id* - string - the id of the role to assign (required)  
    
    **Data Parameters**  
    
    This call does not require a request body.  
    
    JSON  
    
PUT https://localhost:35357/v3/domains/xxx/users/yyy/roles/00000000004004 HTTP/1.1
X-Auth-Token: HPAuth_TOKEN
Accept: application/json
    
    XML  
    
PUT https://localhost:35357/v3/domains/xxx/users/yyy/roles/00000000004004 HTTP/1.1
X-Auth-Token: HPAuth_TOKEN
Accept: application/xml
    
    **Success Response**  
    
    There is no response body and response code of 204 is returned after successful creation of the role assignment.  
    
    **Status Code**  
    
    201 - Created  
    
    **Response Data**  
    
    This call does not have a response body other than in case of errors.  
    
    JSON  
    
HTTP/1.1 201 Created
Server: Apache-Coyote/1.1
Set-Cookie: JSESSIONID=38FAFEF8E7816E6B717B1328FC6AFF49; Path=/; Secure
Cache-Control: no-cache
Pragma: no-cache
Expires: -1
Date: Tue, 30 Oct 2012 21:30:16 GMT
    
    XML  
    
HTTP/1.1 201 Created
Server: Apache-Coyote/1.1
Set-Cookie: JSESSIONID=38FAFEF8E7816E6B717B1328FC6AFF49; Path=/; Secure
Cache-Control: no-cache
Pragma: no-cache
Expires: -1
Date: Tue, 30 Oct 2012 21:30:16 GMT
    
    **Error Response**  
    
    Refer to error response body for additional details.  
    
    **Status Code**  
    
    | Status Code | Description | Reasons |  
    | :-----------| :-----------| :-------|  
    | 400 | Bad Request | Malformed request in URI or request body |  
    | 401 | Unauthorized | The caller does not have the privilege required to perform the operation |  
    | 403 | Forbidden | Disabled or suspended user making the request |  
    | 404 | Not Found | The specified domain_id, user_id, or role_id does not exist |  
    | 500 | Internal Server Error | The server encountered a problem while processing the request |  
    | 503 | Service Unavailable | The server is unavailable to process the request |  
    
    **Response Data**  
    
    This call does not have a response body other than in case of errors.  
    
    **Curl Example**  
    
curl -s --cert <CERT_FILE> --cacert <CACERT_FILE> -X PUT -H "X-Auth-Token: HPAuth_TOKEN" https://localhost:35357/v3/domains/xxx/users/yyy/roles/00000000004004
    
    **Additional Notes**  
    
    None  
    
##### 3.4.5.6 Check For Existence Of Domain (non-project) Role Assignment For A Given User ##### {#check_for_existence_of_domain_(non-project)_role_assignment_for_a_given_user}
    #### HEAD /domains/{domain_id}/users/{user_id}/roles/{role_id}  
    *Privilege Level: System Adminstrator (SA), Domain Admin (DA), Domain User (DU)*  
    
    This API will check for the existence of the specified role for the specified user in the specified domain.  
    
    **Request Data**  
    
    A valid token must be presented in the *X-Auth-Token* HTTP header. Otherwise, a 401 will be returned.  There is no response body returned in API response data.   
    
    **URL Parameters**  
    
    * *domain_id* - string - the id of the domain to look for the role/user in (required)  
    * *user_id* - string - the id of the user to check for the role for (required)  
    * *role_id* - string - the id of the role to check for (required)  
    
    **Data Parameters**  
    
    This call does not require a request body.  
    
    JSON  
    
HEAD https://localhost:35357/v3/domains/xxx/users/yyy/roles/00000000004004 HTTP/1.1
Accept-Encoding: gzip,deflate
Accept: application/json
    
    XML  
    
HEAD https://localhost:35357/v3/domains/xxx/users/yyy/roles/00000000004004 HTTP/1.1
Accept-Encoding: gzip,deflate
Accept: application/xml
    
    **Success Response**  
    
    There is no response body returned. Status code indicates the result where 200 indicates that specified role exists and 404 indicates when it does not exist.  
    
    **Status Code**  
    
    200 - OK , 404 - NOT FOUND  
    
    **Response Data**  
    
    This call does not return a response body and result is determined through returned http status code.  Response body is present only in case of errors.  
    
    JSON  
    
HTTP/1.1 200 OK
Server: Apache-Coyote/1.1
Cache-Control: no-cache
Pragma: no-cache
Expires: -1
Content-Length: 0
Date: Tue, 21 Aug 2012 19:15:56 GMT
    
    XML  
    
HTTP/1.1 200 OK
Server: Apache-Coyote/1.1
Cache-Control: no-cache
Pragma: no-cache
Expires: -1
Content-Length: 0
Date: Tue, 21 Aug 2012 19:17:00 GMT
    
    **Error Response**  
    
    Status code 204 is returned when the role does not exist for the domain/user.  
    
    **Status Code**  
    
    | Status Code | Description | Reasons |  
    | :-----------| :-----------| :-------|  
    | 204 | No Content | When the role does not exist for the domain/user |  
    | 400 | Bad Request | Malformed request in URI |  
    | 500 | Internal Server Error | The server encountered a problem while processing the request |  
    | 503 | Service Unavailable | The server is unavailable to process the request |  
    
    
    **Response Data**  
    
    JSON  
    
    When role does not exist for the domain/user.  
    
HTTP/1.1 204 No Content
Server: Apache-Coyote/1.1
Cache-Control: no-cache
Pragma: no-cache
Expires: \-1
Date: Tue, 21 Aug 2012 19:18:23 GMT
    
    **Curl Example**  
    
curl -s --cert <CERT_FILE> --cacert <CACERT_FILE> -H "X-Auth-Token: HPAuth_TOKEN" -I https://localhost:35357/v3/domains/xxx/users/yyy/roles/00000000004004
    
    **Additional Notes**  
    
    None  
    
##### 3.4.5.7 List User's Roles On A Domain ##### {#list_users_roles_on_a_domain}
    #### GET /domains/{domain_id}/users/{user_id}/roles  
    *Privilege Level: System Adminstrator (SA), Domain Admin (DA), Domain User (DU)*  
    
    This API is used to list all the roles defined in the specified {domain_id} for the specified {user_id} and takes several parameters including "page" and "per_page" to limit the number of role definitions in the response.  
    
    **Request Data**  
    
    A valid token must be presented in the *X-Auth-Token* HTTP header.  Otherwise, a 401 will be returned.  
    
    **URL Parameters**  
    
    * *domain_id* - string - The domain_id representing the domain to return role definitions for.  
    * *user_id* - string - The user_id representing the user to return role definitions for.  
    * *page (Optional)* - integer - page number  
    * *per_page (Optional)* - integer - represents the maximum number of elements which will be returned in the request.  Default is 100.  
    
    **Data Parameters**  
    
    See schema file for more details on the response data structure.  
    
    This call does not require a request body  
    
    JSON  
    
GET /domains/xxx/users/yyy/roles HTTP/1.1
X-Auth-Token: HPAuth_TOKEN
Accept: application/json
    
    XML  
    
GET /domains/xxx/users/yyy/roles HTTP/1.1
X-Auth-Token: HPAuth_TOKEN
Accept: application/xml
    
    Optional:  
    
    **Success Response**  
    
    List of roles with http status code 200.  
    
    **Status Code**  
    
    200 - OK  
    
    **Response Data**  
    
    JSON  
    
{"roles": {"role": [
      {
      "id": "001",
      "name": "role01",
      "description": "role01-description",
      "serviceId" : "xxxxxxxxxxxxxx",
      "domain_id": "xxxxxxxxxxxxxx",
      "links": {
          "self": "https://www.hpcloud.com:35357/v3/roles/001"
      }
   }, {
      "id": "002",
      "name": "role02",
      "description": "role02-description",
      "serviceId" : "xxxxxxxxxxxxxx",
      "domain_id": "xxxxxxxxxxxxxx",
      "links": {
          "self": "https://www.hpcloud.com:35357/v3/roles/002"
      }
   }, {
      "id": "003",
      "name": "role03",
      "description": "role03-description",
      "serviceId" : "xxxxxxxxxxxxxx",
      "domain_id": "xxxxxxxxxxxxxx",
      "links": {
          "self": "https://www.hpcloud.com:35357/v3/roles/003"
      }
   }
   ]
   "links": {
        "previous": "https://www.hpcloud.com:35357/v3/domains/xxx/users/yyy/roles?page=1"
        "next": "https://www.hpcloud.com:35357/v3/domains/xxx/users/yyy/roles?page=3"
    }
}
    
    XML  
    
<roles xmlns="http://hpcloud.hp.com/identity/api/ext/hp/v1.0">
   <role>
      <id>001</id>
      <name>role01</name>
      <description>role01-description</description>
      <serviceId>xxxxxxxxxxxxxx</serviceId>
      <domain_id>xxxxxxxxxxxxxx</domain_id>
      <links>
          <self>https://www.hpcloud.com:35357/v3/roles/001</self>
      </links>
   </role>
   <role>
      <id>002</id>
      <name>role02</name>
      <description>role02-description</description>
      <serviceId>xxxxxxxxxxxxxx</serviceId>
      <domain_id>xxxxxxxxxxxxxx</domain_id>
      <links>
          <self>https://www.hpcloud.com:35357/v3/roles/002</self>
      </links>
   </role>
   <role>
      <id>003</id>
      <name>role03</name>
      <description>role03-description</description>
      <serviceId>xxxxxxxxxxxxxx</serviceId>
      <domain_id>xxxxxxxxxxxxxx</domain_id>
      <links>
          <self>https://www.hpcloud.com:35357/v3/roles/003</self>
      </links>
   </role>
   <links>
       <previous>https://www.hpcloud.com:35357/v3/domains/xxx/users/yyy/roles?page=1</previous>
       <next>https://www.hpcloud.com:35357/v3/domains/xxx/users/yyy/roles?page=3</next>
   </links>
</roles>
    
    **Error Response**  
    
    Please refer to error response body for additional details.  
    
    **Status Code**  
    
    | Status Code | Description | Reasons |  
    | :-----------| :-----------| :-------|  
    | 400 | Bad Request | Malformed request in URI. |  
    | 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |  
    | 403 | Forbidden | Disabled or suspended user making the request. |  
    | 404 | Not Found | The specified domain_id, marker or user_id is not found. |  
    | 500 | Internal Server Error | The server encountered a problem while processing the request. |  
    | 503 | Service Unavailable | The server is unavailable to process the request. |  
    
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
    
<?xml version="1.0" encoding="UTF-8" standalone="yes"?><unauthorized xmlns="http://docs.openstack.org/identity/api/v3.0" xmlns:ns2="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" xmlns:ns3="http://docs.openstack.org/common/api/v1.0" xmlns:ns4="http://www.w3.org/2005/Atom" code="401"><message>UNAUTHORIZED</message><details>Invalid credentials</details></unauthorized>
    
    **Curl Example**  
    
curl -s --cert <CERT_FILE> --cacert <CACERT_FILE> -X GET -H "X-Auth-Token: HPAuth_TOKEN" -H "Accept: application/json" https://localhost:35357/v3/domains/xxx/users/yyy/roles
    
    **Additional Notes**  
    
    None  
    
##### 3.4.5.8 Revoke Role From User On Domain ##### {#revoke_role_from_user_on_domain}
    #### DELETE /domains/{domain_id}/users/{user_id}/roles/{role_id}  
    *Privilege Level: System Adminstrator (SA), Domain Admin (DA)*  
    
    Deletes the specified role association by its {role_id}, in the specfied {domain_id} for the specfied {user_id}.  
    
    **Request Data**  
    
    A valid token must be presented in the *X-Auth-Token* HTTP header.  Otherwise, a 401 will be returned.  
    
    **URL Parameters**  
    
    * *domain_id* - string - the id of the domain to delete the role from (required)  
    * *user_id* - string - the id of the user to delete the role for (required)  
    * *role_id* - string - the id of the role to delete (required)  
    
    **Data Parameters**  
    
    This call does not require a request body.  
    
    JSON  
    
DELETE https://localhost:35357/v3/domains/xxx/users/yyy/roles/00000000004004 HTTP/1.1
X-Auth-Token: HPAuth_TOKEN
Accept: application/json
    
    XML  
    
DELETE https://localhost:35357/v2.0/HP-IDM/v1.1/domains/xxx/users/yyy/roles/00000000004004 HTTP/1.1
X-Auth-Token: HPAuth_TOKEN
Accept: application/xml
    
    **Success Response**  
    
    There is no response body and response code of 204 is returned after successful deletion of the role.  
    
    **Status Code**  
    
    204 - No Content  
    
    **Response Data**  
    
    This call does not have a response body other than in case of errors.  
    
    JSON  
    
HTTP/1.1 204 No Content
Server: Apache-Coyote/1.1
Set-Cookie: JSESSIONID=38FAFEF8E7816E6B717B1328FC6AFF49; Path=/; Secure
Cache-Control: no-cache
Pragma: no-cache
Expires: -1
Date: Tue, 30 Oct 2012 21:30:16 GMT
    
    XML  
    
HTTP/1.1 204 No Content
Server: Apache-Coyote/1.1
Set-Cookie: JSESSIONID=38FAFEF8E7816E6B717B1328FC6AFF49; Path=/; Secure
Cache-Control: no-cache
Pragma: no-cache
Expires: -1
Date: Tue, 30 Oct 2012 21:30:16 GMT
    
    **Error Response**  
    
    Refer to error response body for additional details.  
    
    **Status Code**  
    
    | Status Code | Description | Reasons |  
    | :-----------| :-----------| :-------|  
    | 400 | Bad Request | Malformed request in URI or request body   |  
    | 401 | Unauthorized | The caller does not have the privilege required to perform the operation    |  
    | 403 | Forbidden | Disabled or suspended user making the request |  
    | 404 | Not Found | The specified domain_id, user_id, or role_id does not exist |  
    | 500 | Internal Server Error | The server encountered a problem while processing the request|  
    | 503 | Service Unavailable | The server is unavailable to process the request |  
    
    **Response Data**  
    
    This call does not have a response body other than in case of errors.  
    
    **Curl Example**  
    
curl -s --cert <CERT_FILE> --cacert <CACERT_FILE> -X DELETE -H "X-Auth-Token: HPAuth_TOKEN" -H "Accept: application/json" https://localhost:35357/v3/domains/xxx/users/yyy/roles/00000000004004
    
    **Additional Notes**  
    
    None  
    
#### 3.4.6 Roles
    
    Roles entities are named identifiers used to map a collection of actions from a user to either a specific project or across an entire domain.  
    
    **Status Lifecycle**  
    
    N/A  
    
    **Rate Limits**  
    
    N/A  
    
    **Quota Limits**  
    
    N/A  
    
    **Business Rules**  
    
    None.  
    
##### 3.4.6.1 Create Role Definition ##### {#create_role_definition}
    #### POST /roles  
    *Privilege Level: SA, SVC, DA*  
    
    This API is used to create a new role definition in system, and associate the role with a project or domain.  
    
    **Request Data**  
    
    A valid token must be presented in the X-Auth-Token HTTP header. Otherwise, a 401 will be returned.  
    
    **URL Parameters**  
    
    **Data Parameters**  
    
    See schema file for more details on the request and response data structure.  
    
    * *name* - String - Human readable name of the role definition.  
    * *domainId* - String - Domain id for which this role definition is valid.  
    * *tenantId* (Optional) - String - Tenant id for which this role definition is valid.  
    * *serviceId* (Optional) - String - Service id for which this role definition is valid.  
    * *description* (Optional) - String - description of the role definition.  
    
    JSON  
    
POST https://localhost:35357/v3/roles HTTP/1.1
Accept: application/json
Content-Type: application/json
X-Auth-Token: HPAuth_4ee243692b88f9f72b19c1a3
{
  "role": {
    "name": "db-admin",
    "tenantId": "222",
    "domainId": "123",
    "serviceId": "140"
    "description": "db-admin for xyz tenant"
  }
}
    
    XML  
    
POST https://localhost:35357/v3/roles HTTP/1.1
Accept: application/xml
Content-Type: application/xml
X-Auth-Token: HPAuth_4ee243692b88f9f72b19c1a3
 
<role xmlns="http://www.hp.com/identity/api/ext/HP-IDM/v1.0">
   <name>db-admin</name>
   <description>db-admin for xyz tenant</description>
   <domainId>123</domainId>
   <serviceId>140</serviceId>
   <tenantId>222</tenantId>
</role>
    
    Optional:  
    
    **Success Response**  
    
    The response body contains data for newly created role definition with http status code of 201.  
    
    **Status Code**  
    
    201 - CREATED  
    
    **Response Data**  
    
    Response data should look as below  
    
    JSON  
    
{
  "role": {
    "id": "001"
    "name": "db-admin",
    "tenantId": "222",
    "domainId": "123",
    "serviceId": "140"
    "description": "db-admin for xyz tenant",
    "links": {
        "self": "https://www.hpcloud.com:35357/v3/roles/001"
    }
  }
}
    
    XML  
    
<role xmlns=" http://www.hp.com/identity/api/ext/HP-IDM/v1.0">
   <id>001</id>
   <name>db-admin</name>
   <description>db-admin for xyz tenant</description>
   <domainId>123</domainId>
   <serviceId>140</serviceId>
   <tenantId>222</tenantId>
   <links>
       <self>https://www.hpcloud.com:35357/v3/roles/001</self>
   </links>
</role>
    
    **Error Response**  
    
    Please refer to error response body for additional details.  
    
    **Status Code**  
    
    | Status Code | Description | Reasons |  
    | :-----------| :-----------| :-------|  
    | 400 | Bad Request | Malformed request in URI or request body |  
    | 401 | Unauthorized | The caller does not have the privilege required to perform the operation |  
    | 403 | Forbidden | Disabled or suspended user making the request |  
    | 404 | Item not found | Token is not valid |  
    | 409 | Conflict  | Duplicate role definition |   
    | 500 | Internal Server Error | The server encountered a problem while processing the request |  
    | 503 | Service Unavailable | The server is unavailable to process the request |  
    
    
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
    
<?xml version="1.0" encoding="UTF-8" standalone="yes"?><unauthorized xmlns="http://docs.openstack.org/identity/api/v3.0" xmlns:ns2="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" xmlns:ns3="http://docs.openstack.org/common/api/v1.0" xmlns:ns4="http://www.w3.org/2005/Atom" code="401"><message>UNAUTHORIZED</message><details>Invalid credentials</details></unauthorized>
    
    **Curl Example**  
    
curl -k -s --cert <CERT_FILE> --cacert <CACERT_FILE>  -XPOST -H "X-Auth-Token: HPAuth_TOKEN" -H "Content-type: application/json" -d '{"role":{"name":"db-admin","tenantId":"58046189288043","domainId":"40527047618047","serviceId":"120","description":"role for db admin"}}'   https://localhost:35357/v3/roles
    
    **Additional Notes**  
       * Role creation is a privileged operation.   
       * Only superadmin can create global role where the domainId=*.  
       * Only superadmin can create role on behalf of any domain.  
       * Domain Admin are allowed to create role definitions within their own domain, which means domainId filed should be set to their own domain.  
       * Roles cannot be created for non-existing domain, tenant, service etc..  
       * Role are create with default roleScope=Public. Role scope provide visibility to the role (e.g. Roles with System scope should not be visible to customer)  
       * Name is mandatory field and must be unique within a domain per service, there may be duplicate role name across domains.  
       * DomainId is a mandatory field.  
       * ServiceId is a mandatory field, if serviceId is 100 then tenantId field should be empty or if serviceId is not equal to 100 then there must be a tenantId  provided in request.  
    
##### 3.4.6.2 Get A Role Definition ##### {#get_a_role_definition}
    #### GET /roles/{role_id}  
    *Privilege Level: SA, SVC*  
    
    This API is used to get a role definition specified by a id.  
    
    **Request Data**  
    
    A valid token must be presented in the X-Auth-Token HTTP header. Otherwise, a 401 will be returned.  
    
    **URL Parameters**  
    
    **Data Parameters**  
    
    This call does not require a request body  
    
    **Success Response**  
    
    The role definition will be returned.   
    
    **Status Code**  
    
    200 - OK  
    
    **Response Data**  
    
    JSON  
    
{
  "role": {
    "id": "001",
    "name": "db-admin",
    "description": "db-admin for abc tenant",
    "tenantId": "xxxxxxxxxxxx",
    "domainId": "xxxxxxxxxxxx",
    "serviceId": "xxxxxxxxxxxx",
    "links": {
        "self": "https://www.hpcloud.com:35357/v3/roles/001"
    }
  }
}
    
    XML  
    
<role xmlns="http://www.hp.com/identity/api/ext/HP-IDM/v1.0">
    <id>001</id>
    <name>db-admin</name>
    <description>db-admin for abc tenant</description>
    <tenantId>xxxxxxxxxxxx</tenantId>
    <serviceId>xxxxxxxxxxxxxx</serviceId>
    <domainId>xxxxxxxxxxxx</domainId>
    <links>
       <self>https://www.hpcloud.com:35357/v3/roles/001</self>
    </links>
</role>
    
    **Error Response**  
    
    Please refer to error response body for additional details.  
    
    **Status Code**  
    
    | Status Code | Description | Reasons |  
    | :-----------| :-----------| :-------|  
    | 400 | Bad Request | Malformed request in URI or request body |  
    | 401 | Unauthorized | The caller does not have the privilege required to perform the operation |  
    | 403 | Forbidden | Disabled or suspended user making the request |  
    | 404 | Item not found | Token is not valid |  
    | 500 | Internal Server Error | The server encountered a problem while processing the request |  
    | 503 | Service Unavailable | The server is unavailable to process the request |  
    
    **Response Data**  
    
    JSON  
    
HTTP/1.1 404 Not Found
Server: Apache-Coyote/1.1
Set-Cookie: JSESSIONID=3CF024C732444A0434F6632CA7C3C80A; Path=/; Secure
Cache-Control: no-cache
Pragma: no-cache
Expires: -1
Content-Type: application/json
Content-Length: 160
Date: Wed, 31 Oct 2012 21:18:51 GMT

{
  "identityFault" : {
    "code" : "BAD_REQUEST",
    "message" : "No role found for id 2312312",
    "details" : "No role found for id 2312312"
  }
}

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
    
<?xml version="1.0" encoding="UTF-8" standalone="yes"?><unauthorized xmlns="http://docs.openstack.org/identity/api/v3.0" xmlns:ns2="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" xmlns:ns3="http://docs.openstack.org/common/api/v1.0" xmlns:ns4="http://www.w3.org/2005/Atom" code="401"><message>UNAUTHORIZED</message><details>Invalid credentials</details></unauthorized>
    
    **Curl Example**  
    
curl -s --cert <CERT_FILE> --cacert <CACERT_FILE>  -XGET -H "X-Auth-Token: HPAuth_TOKEN" https://localhost:35357/v3/roles/001
    
    **Additional Notes**  
    * Superadmin can get a role from any domain.  
    * Domain admin and domain users are not allowed to access roles from other domains, except system defined public global roles (domainId=*).  
    
##### 3.4.6.3 List Role Definitions ##### {#list_role_definitions}
    #### GET /roles  
    
    *Privilege Level: SA, SVC*  
    
    This API is used to get a list of role definitions defined in system and is reserved for admin use only. Filer options (domainId, tenantId, serviceId name) are provided with this API to get the manageable size of response list.  
    
    **Request Data**  
    
    A valid token must be presented in the X-Auth-Token HTTP header. Otherwise, a 401 will be returned.  
    
    **URL Parameters**  
    
    * *page (Optional)* - integer - page number  
    * *per_page (Optional)* - integer - represents the maximum number of elements which will be returned in the request.  Default is 30.  
    * *domainId* (Optional)} - string - filter by domainId  
    * *tenantId* (Optional)} - string - filter by tenant  
    * *serviceId* (Optional)} - string - filter by serviceId  
    * *name* (Optional)} - string - filter by role name  
    
    **Data Parameters**  
    
    This call does not require a request body  
    
    **Success Response**  
    
    Returns list of role definitions for given input with http status code 200.  
    
    **Status Code**  
    
    200 - OK  
    
    **Response Data**  
    
    JSON  
    
{"roles": {"role": [
      {
      "id": "001",
      "name": "role01",
      "description": "role01-description",
      "serviceId" : "100",
      "domainId": "123",
      "tenantId": "",
      "links": {
          "self": "https://www.hpcloud.com:35357/v3/roles/001"
      }
   }, {
      "id": "002",
      "name": "role02",
      "description": "role02-description",
      "serviceId" : "140",
      "domainId": "123",
      "tenantId": "*",
      "links": {
          "self": "https://www.hpcloud.com:35357/v3/roles/002"
      }
   }, {
      "id": "003",
      "name": "role03",
      "description": "role03-description",
      "serviceId" : "150",
      "domainId": "123",
      "tenantId": "xxxxxxxxxxxx",
      "links": {
          "self": "https://www.hpcloud.com:35357/v3/roles/003"
      }
   }
   ]
   "links": {
        "previous": "https://www.hpcloud.com:35357/v3/roles?page=1"
        "next": "https://www.hpcloud.com:35357/v3/roles?page=3"
    }
}
    
    XML  
    
<roles xmlns="http://www.hp.com/identity/api/ext/v3.0">
    <role >
       <id>001</id>
       <name>Role001</name>
       <description>some desc</description>
       <domainId>123</domainId>
       <serviceId>100</serviceId>
       <tenantId></tenantId>
       <links>
           <self>https://www.hpcloud.com:35357/v3/roles/001</self>
       </links>
    </role>
    <role >
       <id>002</id>
       <name>Role001</name>
       <description> some desc </description>
       <domainId>123</domainId>
       <serviceId>140</serviceId>
       <tenantId>*</tenantId>
       <links>
           <self>https://www.hpcloud.com:35357/v3/roles/002</self>
       </links>
    </role>
    <role >
       <id>003</id>
       <name>Role003</name>
       <description>Some desc</description>
       <domainId>123</domainId>
       <serviceId>150</serviceId>
       <tenantId>xxxxxxxxxxxx</tenantId>
       <links>
           <self>https://www.hpcloud.com:35357/v3/roles/003</self>
       </links>
    </role>
    <links>
        <previous>https://www.hpcloud.com:35357/v3/roles?page=1</previous>
        <next>https://www.hpcloud.com:35357/v3/roles/002?page=3</next>
    </links>
</roles>
    
    **Error Response**  
    
    Please refer to error response body for additional details.  
    
    **Status Code**  
    
    | Status Code  | Description  | Reasons |   
    | :----------- | :----------- | :-------|  
    | 400 | Bad Request | Malformed request in URI or request body |  
    | 401 | Unauthorized | The caller does not have the privilege required to perform the operation |  
    | 403 | Forbidden | Disabled or suspended user making the request |  
    | 404 | Item not found | Token is not valid |  
    | 500 | Internal Server Error | The server encountered a problem while processing the request |  
    | 503 | Service Unavailable | The server is unavailable to process the request |  
    
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
    
<?xml version="1.0" encoding="UTF-8" standalone="yes"?><unauthorized xmlns="http://docs.openstack.org/identity/api/v3.0" xmlns:ns2="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" xmlns:ns3="http://docs.openstack.org/common/api/v1.0" xmlns:ns4="http://www.w3.org/2005/Atom" code="401"><message>UNAUTHORIZED</message><details>Invalid credentials</details></unauthorized>
    
    **Curl Example**  
    
curl -s --cert <CERT_FILE> --cacert <CACERT_FILE>  -XGET -H "X-Auth-Token: HPAuth_TOKEN" https://localhost:35357/v3/roles/001
    
    **Additional Notes**  
    
    * This is a privileged operation and only reserved for admin use .  
    * This APi will display roles defined in system, to get roles for specific domain appropriate filter should be used (e.g. domainId=* should be use to get global roles).  
    * Response can be filtered by domainId, tenantId, serviceId and serviceName.  
    
##### 3.4.6.4 Update Role Definition ##### {#update_role_definition}
    #### PUT /roleDefs/{role_id}  
    *Privilege Level: SA, SVC, DA*  
    
    This API is used to update an existing role definition. role_id is used to uniquely identify a role definition in the system.  
    
    **Request Data**  
    
    A valid token must be presented in the X-Auth-Token HTTP header. Otherwise, a 401 will be returned.  
    
    **URL Parameters**  
    
    **Data Parameters**  
    
    See schema file for more details on the request and response data structure.  
    
    * *name* - String - Human readable name of the role definition.  
    * *description* (Optional) - String - description of the role definition.  
    
    JSON  
    
PUT https://localhost:35357/v3/roles/001 HTTP/1.1
X-Auth-Token: HPAuth_4ee243692b88f9f72b19c1a3
Accept: application/json
Content-Type: application/json
{
  "role": {
    "name": "mongo-db-admin",
    "description": "mongo-db-admin for abc tenant"
  }
}
    
    XML   
    
PUT https://localhost:35357/v3/roles/001 HTTP/1.1
X-Auth-Token: HPAuth_4ee243692b88f9f72b19c1a3
Accept: application/xml
Content-Type: application/xml

<role xmlns=" http://www.hp.com/identity/api/ext/HP-IDM/v1.0">
   <name>mongo-db-admin</name>
   <description>mongo-db-admin for xyz tenant</description>
</role>
    
    **Success Response**  
    
    {Specify the status code and any content that is returned.}  
    
    **Status Code**  
    
    200 - OK  
    
    **Response Data**  
    
    JSON  
    
{
  "role": {
    "id": "001"
    "name": "mongo-db-admin",
    "tenantId": "222",
    "domainId": "123",
    "serviceId": "140",
    "description": "mongo-db-admin for xyz tenant",
    "links": {
         "self": "https://www.hpcloud.com:35357/v3/roles/001"
    }
  }
    
    XML  
    
<role xmlns="http://www.hp.com/identity/api/ext/HP-IDM/v1.0">
   <id>001</id>
   <name>mongo-db-admin</name>
   <description>mongo-db-admin for xyz tenant</description>
   <domainId>123</domainId>
   <serviceId>140</serviceId>
   <tenantId>222</tenantId>
   <links>
        <self>https://www.hpcloud.com:35357/v3/roles/001</self>
   </links>
</role>
    
    **Error Response**  
    
    Please refer to error response body for additional details.  
    
    **Status Code**  
    
    | Status Code | Description | Reasons |  
    | :-----------| :-----------| :-------|  
    | 400 | Bad Request | Malformed request in URI or request body |  
    | 401 | Unauthorized | The caller does not have the privilege required to perform the operation |  
    | 403 | Forbidden | Disabled or suspended user making the request |  
    | 404 | Item not found | Token is not valid |  
    | 409 | Conflict  | In case of existing role name or role assignment for the role |  
    | 500 | Internal Server Error | The server encountered a problem while processing the request |  
    | 503 | Service Unavailable | The server is unavailable to process the request |  
    
    **Response Data**  
    
    JSON  
    
HTTP/1.1 404 Not Found
Server: Apache-Coyote/1.1
Set-Cookie: JSESSIONID=42CC6D3F833AAB14A6E7B83B2267F251; Path=/; Secure
Cache-Control: no-cache
Pragma: no-cache
Expires: -1
Content-Type: application/json
Content-Length: 162
Date: Wed, 31 Oct 2012 21:04:36 GMT

{
  "identityFault" : {
    "code" : "BAD_REQUEST",
    "message" : "Role not found for id 001",
    "details" : "Role not found for id 001"
  }
}

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
    
<?xml version="1.0" encoding="UTF-8" standalone="yes"?><unauthorized xmlns="http://docs.openstack.org/identity/api/v3.0" xmlns:ns2="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" xmlns:ns3="http://docs.openstack.org/common/api/v1.0" xmlns:ns4="http://www.w3.org/2005/Atom" code="401"><message>UNAUTHORIZED</message><details>Invalid credentials</details></unauthorized>
    
    **Curl Example**  
    
curl -k -s --cert <CERT_FILE> --cacert <CACERT_FILE>  -XPUT -H "X-Auth-Token: HPAuth_TOKEN" -H "Content-type: application/json" '{"role":{"name":"mongo-db-admin","description":"mongo-db-admin for abc tenant"}}' https://localhost:35357/v3/roles/001
    
    **Additional Notes**  
    
    * Role update is privileged operation.  
    * Superadmin can update a role defined within system domain or in customer domain.  
    * Only superadmin can update the domainId of the role definition unless there is no role association exist for the role.  
    * Domain admin are not allowed to change the domainId field of role definition.  
    * Domain admin are not allowed update system defined roles or roles from other domains.  
    * Update on certain (domainId, tenantId, serviceId) field are not allowed if there are existing role assignments in the system for the role.   
    * Update on name and description is allowed even if there exist a role assignment.  
    * Update role should also adhere to the constraints defined in create role.  
    
##### 3.4.6.5 Delete A Role Definition ##### {#delete_a_role_definition}
    #### DELETE /roles/{role_id}  
    *Privilege Level: SA, SVC, DA*  
    
    This API is used to delete a role definition identified by id.   
    
    **Request Data**  
    
    A valid token must be presented in the X-Auth-Token HTTP header. Otherwise, a 401 will be returned.  
    
    **URL Parameters**  
    
    * *cascadeDelete* (Optional) - boolean - if true, delete any existing role assignments in addition to deleting the role definition (requires either SA or L3Plus permissions).  
    
    **Data Parameters**  
    
    This call does not require a request body  
    
    **Success Response**  
    
    **Status Code**  
    
    204 - No Content  
    
    **Response Data**  
    
    This call does not require a request body.  
    
    **Error Response**  
    
    Please refer to error response body for additional details.  
    
    **Status Code**  
    
    | Status Code | Description | Reasons |  
    | :-----------| :-----------| :-------|  
    | 400 | Bad Request | Malformed request in URI or request body |  
    | 401 | Unauthorized | The caller does not have the privilege required to perform the operation |  
    | 403 | Forbidden | Disabled or suspended user making the request |  
    | 404 | Item not found | Token is not valid |  
    | 409 | Conflict  | Existing role assignment for the role (and cascadeDelete parameter not provided) |  
    | 500 | Internal Server Error | The server encountered a problem while processing the request |  
    | 503 | Service Unavailable | The server is unavailable to process the request |  
    
    **Response Data**  
    
    JSON  
    Response for deleting previously deleted domain.  
    
HTTP/1.1 404 Not Found
Server: Apache-Coyote/1.1
Set-Cookie: JSESSIONID=FE74A50121DBE8B200CCA95E9B759EED; Path=/; Secure
Cache-Control: no-cache
Pragma: no-cache
Expires: -1
Content-Type: application/json
Content-Length: 176
Date: Wed, 31 Oct 2012 20:35:12 GMT

{
  "identityFault" : {
    "code" : "BAD_REQUEST",
    "message" : "Role not found for id 001",
    "details" : "Role not found for id 001"
  }
}

HTTP/1.1 403 Forbidden
Server: Apache-Coyote/1.1
Set-Cookie: JSESSIONID=DCCE78AA6D9D3EF884E81979DC381898; Path=/; Secure
Content-Type: application/json;charset=UTF-8
Content-Length: 54
Date: Wed, 31 Oct 2012 20:38:22 GMT

{
  "forbidden": {
    "message": "Invalid token",
    "code": 403
  }
}

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
    
<forbidden code="403" xmlns="http://docs.openstack.org/identity/api/v3.0">
   <message>Invalid token</message>
</forbidden>

<?xml version="1.0" encoding="UTF-8" standalone="yes"?><unauthorized xmlns="http://docs.openstack.org/identity/api/v3.0" xmlns:ns2="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" xmlns:ns3="http://docs.openstack.org/common/api/v1.0" xmlns:ns4="http://www.w3.org/2005/Atom" code="401"><message>UNAUTHORIZED</message><details>Invalid credentials</details></unauthorized>
    
    **Curl Example**  
    
curl -s --cert <CERT_FILE> --cacert <CACERT_FILE> -XDELETE -H "X-Auth-Token: HPAuth_TOKEN" https://localhost:35357/v3/roles/001
    
    **Curl Example** (also deleting role assignments)  
    
curl -s --cert <CERT_FILE> --cacert <CACERT_FILE> -XDELETE -H "X-Auth-Token: HPAuth_TOKEN" https://localhost:35357/v3/roles/001?cascadeDelete=true
    
    **Additional Notes**  
    * Role deletion is a privileged operation.  
    * Superadmin can delete roles from customer domain as well as from system domain.  
    * Domain admin can only delete roles defined in their own domain.  
    * Deleting a role is not allowed if there exist a role assignment for the role (unless cascadeDelete flag is provided).  
    
#### 3.4.7 Tokens
    
    Tokens are used to represent user's authenticated identity with a time-based validity. Tokens data contain authorization information via roles related to a project or domain. A token is used to gain access to a HP Cloud Service offering. Tokens can be scoped to a project, domain or can be requested as unscoped. Unscoped token means that the token is essentially scoped to user's domain.  
    
    Tokens are generated by identity service after successful authentication. Token can be validated, re-scoped to another project or domain and/or can be revoked before its expiration.  
    
    Tokens can be requested by sending credentials as part of the request. HPCS currently supports  username/password and user acessskey credentials for v3  
    
    AccessKey credentials are the preferred credentials for programmatic access for the following reason  
    
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
    
    
##### 3.4.7.1 Authenticate ##### {#authenticate}
    #### POST /v3/auth/tokens  
    *Privilege Level: Anon*  
    
    This API is used to authenticate a user to be able to use HP OpenStack service. The result of a successful authentication is a token to be used with service requests. A credential is used to obtain a token. HP currently support username/password and  user access key credentials. If authentication succeeds, the response will include an authentication token and service catalog ( list of available services for that user ). Tokens are valid for 12 hours. Issued tokens can become invalid in following cases:  
    
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
    
    
    Authenticate using password credential,scoped to a project using project id.  
    
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
            "id": "94710780204290"
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
    
    
    Authenticate using access key credential.  
    
{
   "auth":{
      "identity":{
         "methods":[
            "accessKey"
         ],
         "accessKey":{
            "accessKey":"VCAVE3Y6RL9K8ADVKMY5",
            "secretKey":"quyNVz7gMtpG9QsLz0DUrqGocYbr5X+KGbkJsqzs"
         }
      }
   }
}
    
    
    Rescope token.  
    
{
   "auth":{
      "identity":{
         "methods":[
            "token"
         ],
         "token":{
            "id":"HPAuth_a6f32cefceb798cedd3183c71c07a3d169c8ad613e0c951ae5f426c015dd3210"
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
    
curl -X POST -H "Content-Type: application/json"
     https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/auth/tokens
     -d '{"auth": {"identity": {	"methods": ["password"],"password": {"user": {"id": "342343232432", "password": "Super secret"	}}},"scope": {  "project": {"id": "453454354"} }} }'

    
    ***Authenticate with Access Keys and Project ID***  
    

    
    **Additional Notes**  
    
    
##### 3.4.7.2 Rescope Token ##### {#rescope_token}
    #### POST /v3/auth/tokens  
    *Privilege Level: SS*  
    
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
    
    **Additional Notes**  
    
    
##### 3.4.7.3 Revoke Token ##### {#revoke_token}
    #### DELETE /v3/auth/tokens  
    *Privilege Level: SA,DA,SS*  
    
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
    
    200 - OK  
    
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
    
    Keystone doesn't require X-Auth-Token headers. HP keystone implementation requires X-Auth-Token header for authorization purpose.  
    
##### 3.4.7.4 Validate Token ##### {#validate_token}
    #### GET /v3/auth/tokens/HP-IDM-serviceId=110,global,130&HP-IDM-endpointTemplateId=110,111  
    *Privilege Level: Anon*  
    *Client cert Required : Yes*  
    
    This API is used to validate a token. Validation includes checking that  
    the token belongs to a particular user and it has not expired.  On  
    successful validation, the response contains permissions relevant to a  
    particular client.   
    Unscoped token is not scoped to any tenant and is primarily used for interacting with some of   
    CS APIs. In the event a token is not valid, a 404 (item not found) will be returned.  
    
    Filter Roles:  
    
    For scoped token validation, optional query parameter **HP-IDM-serviceId  
    and/or **HP-IDM-endpointTemplateId** can be used to include only  
    specific subset of roles in response. If the parameter values are  
    provided and there are no specific roles found, then 401 (unauthorized)  
    error is generated. Both HP-IDM-serviceId and HP-IDM-endpointTemplateId  
    parameter can be used in a validate token request.  
     In HP-IDM-serviceId and HP-IDM-endpointTemplateId  parameter  
    values, multiple ids can be specified as comma separated values.  
    If both of query parameters are not specified or has empty values,   
    then response include all roles available for that scoped token.   
    In case of unscoped token validation, only global roles  
    are returned and HP-IDM-serviceId and HP-IDM-endpointTemplateId query  
    parameter, if there, is ignored.  
     In case HP-IDM-endpointTemplateId value is provided for scoped token  
    validation, system looks into existing tenant endpointTemplate  
    association and uses that to filter matching endpoint specific roles. As  
    a service can have multiple endpoints (i.e. endpointTemplate), so if  
    both a serviceId and its endpointTemplateId are provided as input, then  
    endpointTemplateId takes precedence and we ignore the provided  
    serviceId. This is done to find more granular role data which in this  
    case is endpoint template id.  
    
    In case of scoped token validation, if that tenant has swift account  
    hash available in CS system, then its value is returned as a response  
    header with name 'X-HP-IDM-swift-account-hash'.  
    
    Note: This request does not expect X-Auth-Token header but if its  
    provided, then it needs to be have a valid token value otherwise  
    unauthorized (401) error is returned.  
    
    **HTTP Headers**  
    
    | Header Name | Description | Required | Comments |  
    | :-----------| :-----------| :------- | :--------|   
    | X-Subject-Token    | Token to be validated       |  Y  | |  
    | Accept		   | Content Type of response    |  N  |Defaults to Json |  
    
    **Request Data**  
    
    See examples below.  
    
    **URL Parameters**  
    
    * *HP-IDM-serviceId* (Optional) - list of IDs (strings) - filter service specific roles  
    * *HP-IDM-endpointTemplateId* (Optional) - list of IDs (strings) - filter endpoint template specific roles  
    
    **Data Parameters**  
    
    See schema file for more details on the request and response data structure.  
    
    This call does not require a request body.  
    
    JSON  
    
GET https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/auth/tokens HTTP/1.1
Accept-Encoding: gzip,deflate
Accept: application/json
X-Subject-Token : HPAuth_4f5a7fe06a25ab00f896bee4
User-Agent: Jakarta Commons-HttpClient/3.1
Host: region-a.geo-1.identity.hpcloudsvc.com:35357
    
    XML  
    
GET https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/auth/tokens HTTP/1.1
Accept-Encoding: gzip,deflate
Accept: application/xml
X-Subject-Token : HPAuth_4f5a7fe06a25ab00f896bee4
User-Agent: Jakarta Commons-HttpClient/3.1
Host: region-a.geo-1.identity.hpcloudsvc.com:35357
    
    Optional:  
    
    JSON  
    
    ValidateToken  Request for JSON (unscoped token where HP-IDM-serviceId parameter value is ignored)  
    
GET https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/auth/tokens?HP-IDM-serviceId=110 HTTP/1.1
Accept-Encoding: gzip,deflate
Accept: application/json
X-Subject-Token : HPAuth_4f5a7fe06a25ab00f896bee4
User-Agent: Jakarta Commons-HttpClient/3.1
Host: region-a.geo-1.identity.hpcloudsvc.com:35357
    
    ValidateToken JSON Request ( HP-IDM-serviceId parameter with 120 service id value)  
    
GET https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/auth/tokens?HP-IDM-serviceId=120 HTTP/1.1
Accept-Encoding: gzip,deflate
Accept: application/json
X-Subject-Token : HPAuth_4f5a7fe06a25ab00f896bee4
User-Agent: Jakarta Commons-HttpClient/3.1
Host: region-a.geo-1.identity.hpcloudsvc.com:35357
    
    ValidateToken XML Request  (HP-IDM-serviceId parameter with 110 (Object Storage service) value and HP-IDM-endpointTemplateId parameter with 110 (Compute - AZ2) value)  
    
GET https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/auth/tokens?HP-IDM-serviceId=110&HP-IDM-endpointTemplateId=110 HTTP/1.1
Accept-Encoding: gzip,deflate
Accept: application/xml
X-Subject-Token: HPAuth10_727ed1d52a4a5e838aa4bb342b87191b40894afcaff644ebaec2e14da543161f
User-Agent: Jakarta Commons-HttpClient/3.1
Host: region-a.geo-1.identity.hpcloudsvc.com:35357
    
    XML  
    
    ValidateToken  XML Request ( HP-IDM-serviceId parameter with 'global' only)  
    
GET https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/auth/tokens?HP-IDM-serviceId=global HTTP/1.1
Accept-Encoding: gzip,deflate
Accept: application/xml
X-Subject-Token : HPAuth_4f5a7fe06a25ab00f896bee4
User-Agent: Jakarta Commons-HttpClient/3.1
Host: region-a.geo-1.identity.hpcloudsvc.com:35357
    
    **Success Response**  
    
    **Status Code**  
    
    200 - OK  
    
    **Response Data**  
    
    
    JSON  
    
HTTP/1.1 200 OK
Server: Apache-Coyote/1.1
Set-Cookie: JSESSIONID=D63D9FAC8FA835321F36E51CE07F2485; Path=/; Secure
Cache-Control: no-cache
Pragma: no-cache
Expires: -1
Content-Type: application/json
Content-Length: 454
Date: Fri, 09 Mar 2012 22:16:50 GMT
X-Subject-Token: HPAuth10_727ed1d52a4a5e838aa4bb342b87191b40894afcaff644ebaec2e14da543161f

{
  "token": {
    "expires_at": "2013-05-24T03:39:53.428Z",
    "issued_at": "2013-05-23T15:39:53.428Z",
    "user": {
      "domain": {
        "links": {
          "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/domains/91787284686850"
        },
        "hpext":          {
            "domainStatus": "enabled",
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
    "domain": {},
    "methods": [
      "password"
    ],
    "project": {
      "domain": {
        "links": {
          "self": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/domains/91787284686850"
        },
        "hpext":          {
            "domainStatus": "enabled",
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
    ]
  }
}


    
    XML  
    
HTTP/1.1 200 OK
Server: Apache-Coyote/1.1
Set-Cookie: JSESSIONID=451446B2BE922152AD41799AC7453A0B; Path=/; Secure
X-Subject-Token: HPAuth10_727ed1d52a4a5e838aa4bb342b87191b40894afcaff644ebaec2e14da543161f
Cache-Control: no-cache
Pragma: no-cache
Expires: -1
Content-Type: application/xml
Content-Length: 608
Date: Fri, 09 Mar 2012 22:38:55 GMT



<?xml version="1.0" encoding="UTF-8"?>
<token xmlns="http://docs.openstack.org/identity/api/v3.0" xmlns:ns2="http://www.w3.org/2005/Atom" xmlns:ns3="http://docs.openstack.org/common/api/v1.0">
    <expires_at>2013-05-24T04:03:37.115Z</expires_at>
    <issued_at>2013-05-23T15:39:53.428Z</issued_at>
    <methods>
        <method>password</method>
    </methods>
    <domain />
    <project id="61226762742230" name="HPCSDemoProject">
        <domain id="91787284686850" name="HPCSDemoDomain">
            <links>
                <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/domains/91787284686850" />
            </links>
            <hpext>
                <domainStatus>suspended:2</domainStatus>
                <domainStatusCode>21</domainStatusCode>
            </hpext>            
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
        <domain id="91787284686850" name="HPCSDemoDomain">
            <links>
                <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/domains/91787284686850" />
            </links>
        </domain>
        <links>
            <ns2:link rel="self" href="https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/users/35571560187320" />
        </links>
    </user>
</token>
 
    
    **Error Response**  
    
    **Status Code**  
    
    * 400 - Bad Request  
    * 401 - Unauthorized  
    * 404 - Item Not Found  
    
    **Response Data**  
    
    JSON  
    
{"error": {
   "details": "Invalid token",
   "code": 404,
   "message": "NOT_FOUND",
   "otherAttributes": {},
   "title": "NOT_FOUND"
}}

    
    XML  
    
<?xml version="1.0" encoding="UTF-8"?>
<error xmlns="http://docs.openstack.org/identity/api/v3.0" xmlns:ns2="http://www.w3.org/2005/Atom" xmlns:ns3="http://docs.openstack.org/common/api/v1.0" code="404" message="NOT_FOUND" title="NOT_FOUND">
   <details>Invalid token</details>
</error>
    
    **Curl Example**  
    
curl -k --cacert ca.pem --cert hpmiddleware.pem --key hpmiddleware.pem -H "Accept: application/json" -H "X-Subject-Token : HPAuth_fd6f4f19c0bbf7bb0d500aac3bfe21b621073f22b8a92959cabfdc5c4b3f234c" "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/auth/tokens"
    
    **Additional Notes**  
    
    
    This call is not exposed to public. This call requires a valid Client Cert  
    
    
##### 3.4.7.5 Quick Token Validation ##### {#quick_token_validation}
    #### HEAD /v3/auth/tokens  
    *Privilege Level: Anon*  
    
    This API is used to do a quick token validation. Validation includes checking that the token belongs to a particular user and it has not expired. If there is no tenantId then it is globally scoped. In the event a token is not valid, a 404 (item not found) will be returned.  This call won't return any roles associated with the token.  
    In case of scoped token validation, if that tenant has swift account hash available in CS system, then its value is returned as a response header with name 'X-HP-IDM-swift-account-hash'.  
    Note: This request does not expect X-Auth-Token header but if its provided, then it needs to be have a valid token value otherwise unauthorized (401) error is returned.  
    
    **HTTP Headers**  
    
    | Header Name | Description | Required | Comments |  
    | :-----------| :-----------| :------- | :--------|   
    | X-Subject-Token    | Token to be validated       |  Y  | |  
    
    
    **Request Data**  
    
    See examples below.  
    
    **URL Parameters**  
    
    
    **Data Parameters**  
    
    See schema file for more details on the request and response data structure.  
    
    This call does not require a request body.  
    
    JSON  
    
HEAD https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/auth/tokens HTTP/1.1
Accept-Encoding: gzip,deflate
X-Subject-Token: HPAuth10_727ed1d52a4a5e838aa4bb342b87191b40894afcaff644ebaec2e14da543161f
Accept: application/json
User-Agent: Jakarta Commons-HttpClient/3.1
Host: region-a.geo-1.identity.hpcloudsvc.com:35357
    
    XML  
    
HEAD https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/auth/tokens HTTP/1.1
Accept-Encoding: gzip,deflate
X-Subject-Token: HPAuth10_727ed1d52a4a5e838aa4bb342b87191b40894afcaff644ebaec2e14da543161f
Accept: application/xml
User-Agent: Jakarta Commons-HttpClient/3.1
Host: region-a.geo-1.identity.hpcloudsvc.com:35357
    
    Optional:  
    
    
    **Success Response**  
    
    **Status Code**  
    
    204 - OK  
    
    **Response Data**  
    
    This call does not return a response body.  
    
    **Error Response**  
    
    **Status Code**  
    
    * 400 - Bad Request  
    * 401 - Unauthorized  
    * 404 - Item Not Found  
    
    **Response Data**  
    
    JSON & XML  
    
HTTP/1.1 401 Unauthorized
Server: Apache-Coyote/1.1
Set-Cookie: JSESSIONID=B344819C37ABA356D0FB85946D4B9D76; Path=/; Secure
Content-Type: application/xml;charset=UTF-8
Content-Length: 158
Date: Tue, 02 Apr 2013 21:48:06 GMT

    
    
    **Curl Example**  
    
curl -k --cacert ca.pem --cert hpmiddleware.pem -H "X-Subject-Token:HPAuth_fd6f4f19c0bbf7bb0d500aac3bfe21b621073f22b8a92959cabfdc5c4b3f234c" -X HEAD "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v3/auth/tokens"
    
    **Additional Notes**  
    
    Keystone requires X-Auth-Token whereas in HPCS case, it is optional  
    
#### 3.4.8 Users
    
    User represents a user of the system.  
    
    A User consists of the following fields:  
    
    | Attribute	| Type	| OpenStack	| HP-IDM	| Description	|  
    | :---------	| :-----------	| :-----------	| :-----------	| :-----------	|  
    | name	| string	| Mandatory	| Mandatory	| A globally unique username	|  
    | default_project_id	| string	| Optional	| Optional	| References the user's default project against which to authorize	|  
    | domain_id	| string	| Optional	| Mandatory	| References the domain which owns the user	|  
    | email	| string	| Optional	| Mandatory	| The users email address	|  
    | password	| string	| Optional	| Mandatory	| The users password	|  
    | enabled	| boolean	| Optional	| Optional	| The user is enabled or disabled	|  
    | state	| string	| -	| Optional	| The users state (postal address)	|  
    | addressLine1	| string	| -	| Optional	| First line of the users address	|  
    | addressLine2	| string	| -	| Optional	| Second line of the users address	|  
    | city	| string	| -	| Optional	| The users city	|  
    | zip	| string	| -	| Optional	| The users zip code	|  
    | country	| string	| -	| Optional	| The users country	|  
    | phone	| string	| -	| Optional	| The users phone number	|  
    | company	| string	| -	| Optional	| The users company	|  
    | website	| string	| -	| Optional	| The users website	|  
    | firstName	| string	| -	| Optional	| The users first name	|  
    | lastName	| string	| -	| Optional	| The users last name	|  
    | displayName	| string	| -	| Optional	| The users display name	|  
    | homeRegion	| string	| -	| Optional	| The users home region	|  
    
    Example entity:  
    
        {  
            "user": {  
                "default_project_id": "263fd9",  
                "domain_id": "1789d1",  
                "email": "joe@example.com",  
                "enabled": true,  
                "id": "0ca8f6",  
                "name": "Joe"  
            }  
        }  
    
    **Differences Between HP and OpenStack Keystone**  
    
    HP requires various extension parameters detailed in the attribute table above.  
    **Status Lifecycle**  
    
    N/A  
    
    **Rate Limits**  
    
    N/A  
    
    **Quota Limits**  
    
    N/A  
    
    **Business Rules**  
    
    None.  
    
    #### Create user: `POST /users`  
    
    Request:  
    
        {  
            "default_project_id": "...",  
            "description": "...",  
            "domain_id": "--optional--",  
            "email": "...",  
            "enabled": "...",  
            "name": "...",  
            "password": "--optional--"  
        }  
    
    Response:  
    
        Status: 201 Created  
        Location: http://identity:35357/v3/users/--user-id--  
    
        {  
            "default_project_id": "--default-project-id--",  
            "description": "a user",  
            "domain_id": "1789d1",  
            "email": "...",  
            "enabled": true,  
            "id": "--user-id--",  
            "link": {  
                "href": "http://identity:35357/v3/users/--user-id--",  
                "rel": "self"  
            },  
            "name": "admin"  
        }  
    
    #### List users: `GET /users`  
    
    query_string: page (optional)  
    query_string: per_page (optional, default 30)  
    query filter for "domain_id", "email", "enabled", "name" (optional)  
    
    Response:  
    
        Status: 200 OK  
    
        [  
            {  
                "default_project_id": "--default-project-id--",  
                "description": "a user",  
                "domain_id": "1789d1",  
                "email": "...",  
                "enabled": true,  
                "id": "--user-id--",  
                "link": {  
                    "href": "http://identity:35357/v3/users/--user-id--",  
                    "rel": "self"  
                },  
                "name": "admin"  
            },  
            {  
                "default_project_id": "--default-project-id--",  
                "description": "another user",  
                "domain_id": "1789d1",  
                "email": "...",  
                "enabled": true,  
                "id": "--user-id--",  
                "link": {  
                    "href": "http://identity:35357/v3/users/--user-id--",  
                    "rel": "self"  
                },  
                "name": "someone"  
            }  
        ]  
    
    #### Get user: `GET /users/{user_id}`  
    
    Response:  
    
        Status: 200 OK  
    
        {  
            "default_project_id": "--default-project-id--",  
            "description": "a user",  
            "domain_id": "1789d1",  
            "email": "...",  
            "enabled": true,  
            "id": "--user-id--",  
            "link": {  
                "href": "http://identity:35357/v3/users/--user-id--",  
                "rel": "self"  
            },  
            "name": "admin"  
        }  
    
    #### List user projects: `GET /users/{user_id}/projects`  
    
    query_string: page (optional)  
    query_string: per_page (optional, default 30)  
    query filter for "name", "enabled" on project resources (optional)  
    
    Response:  
    
        Status: 200 OK  
    
        [  
            {  
                "domain_id": "--domain-id--",  
                "enabled": true,  
                "id": "--project-id--",  
                "link": {  
                    "href": "http://identity:35357/v3/projects/--project-id--",  
                    "rel": "self"  
                },  
                "name": "a project name"  
            },  
            {  
                "domain_id": "--domain-id--",  
                "enabled": true,  
                "id": "--project-id--",  
                "link": {  
                    "href": "http://identity:35357/v3/projects/--project-id--",  
                    "rel": "self"  
                },  
                "name": "another domain"  
            }  
        ]  
    
    #### List groups of which a user is a member: `GET /users/{user_id}/groups`  
    
    query_string: page (optional)  
    query_string: per_page (optional, default 30)  
    query filter for "name" (optional)  
    
    Response:  
    
        Status: 200 OK  
    
        [  
            {  
                "description": "Developers cleared for work on all general projects"  
                "domain_id": "--domain-id--",  
                "id": "--group-id--",  
                "links": {  
                    "href": "http://identity:35357/v3/groups/--group-id--",  
                    "rel": "self"  
                },  
                "name": "Developers"  
            },  
            {  
                "description": "Developers cleared for work on secret projects"  
                "domain_id": "--domain-id--",  
                "id": "--group-id--",  
                "links": {  
                    "href": "http://identity:35357/v3/groups/--group-id--",  
                    "rel": "self"  
                },  
                "name": "Secure Developers"  
            }  
       ]  
    
    #### Update user: `PATCH /users/{user_id}`  
    
    Use this method attempt to update user password or enable/disable the user.  
    This may return a HTTP 501 Not Implemented if the back-end driver doesn't allow  
    for the functionality.  
    
    Response:  
    
        Status: 200 OK  
    
        {  
            "default_project_id": "--default-project-id--",  
            "description": "a user",  
            "domain_id": "1789d1",  
            "email": "...",  
            "enabled": true,  
            "id": "--user-id--",  
            "link": {  
                "href": "http://identity:35357/v3/users/--user-id--",  
                "rel": "self"  
            },  
            "name": "admin"  
        }  
    
    #### Delete user: `DELETE /users/{user_id}`  
    
    Response:  
    
        Status: 204 No Content  
#### 3.4.9 Versions
    
    This API returns the HP Identity Service version supported by HP Cloud. It also reports the status of each version.  
    
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
    
    
##### 3.4.9.1 List Versions ##### {#list_versions}
    #### GET /  
    *Privilege Level: Anon*  
    
    
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
