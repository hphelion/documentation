---
layout: page
permalink: /publiccloud/api/v2identity/
title: "HP Helion Public Cloud Identity Services v2 API"
description: "HP Helion Public Cloud v2 Identity Services API documentation."
keywords: "Keystone, Identity Services"
product: identity

---
<!--PUBLISHED-->
# HP Helion Public Cloud Identity Services v2 API

*If you are using the v3 Identity Services API, click [here for those API references](/publiccloud/api/identity/).*

Date: November 2014

# 1. Overview

The HP Identity Service exposes the OpenStack Keystone V2 API specification. Specifically, it supports token based operations. A few things to note about the HP Identity Service are:

 * Token created via v2 API can be validated via v3 API
 * Token created via v3 API can be validated via v2 API.
 * v3 token can be created via HP User access key pair.
 * HP Identity service will return a service catalog upon token response that only includes services and endpoints for which the token may be used.
 * Support for request and response in xml format.
 * Introduction of rate limiting.

## 1.1 API Maturity Level

**Maturity Level**: GA

**Version API Status**: CURRENT

# 2. Account-level View

## 2.1 Accounts
Each user has an account. Every user belongs to a single domain. Groups can be used to group users. Projects are resource collections and user is assoicated with one or more projects via roles

## 2.2 Regions and Availability Zones
The HP Identity Service is currently available in two regions which can be accessed via standard RESTful clients. As HP accounts are global, either region can be used for conducting identity operations. Choose the region closest to you for improved performance.

US-West: https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/

US-East: https://region-b.geo-1.identity.hpcloudsvc.com:35357/v2.0/

Region(s): US-West(region-a.geo-1), US-East(region-b.geo-1)

## 2.3 Service Catalog

The service catalog provides the service information with its region specific endpoints. Returned service endpoint depends on token scoping and user roles associated with a project. The interface in endpoint data indicates if that endpoint is in public, beta or preview release state.

The service catalog is returned as part of create and validate token operations. When an unscoped token is requested, the service catalog contains only global service endpoints ( e.g. identity). When a project scoped token is requested, the service catalog contains the services and endpoints for which the token may be used when interacting. If a service or endpoint is not present in the service catalog, it typically means that either the service has not been activated or the user does not have the appropriate roles defined that grant them access for the service on the given project

The service is exposed in the service catalog, as shown in the following fragment:

    {
        "name": "Identity",
        "type": "identity",
        "endpoints": [
            {
                "publicURL": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v2.0/",
                "region": "region-b.geo-1",
                "versionId": "2.0",
                "versionInfo": "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v2.0/",
                "versionList": "https://region-b.geo-1.identity.hpcloudsvc.com:35357"
            },
            {
                "publicURL": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/",
                "region": "region-a.geo-1",
                "versionId": "2.0",
                "versionInfo": "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/",
                "versionList": "https://region-a.geo-1.identity.hpcloudsvc.com:35357"
            }
        ]
    }

---

# 3. REST API Specifications

## 3.1 Service API Operations

**Host**: https://region-a.geo-1.identity.hpcloudsvc.com:35357

**BaseUri**: {Host}/v2.0

**Admin URI**: N/A

| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? |
| :------- | :------------------- | :---------- | :--------------------- | :---------------- |
| Tenants | [List Tenants](#list_tenants) | GET | /tenants | Y/Y |
| Tokens | [Authenticate](#authenticate) | POST | /tokens | Y/Y |
| Tokens | [Rescope Token](#rescope_token) | POST | /tokens | Y/Y |
| Tokens | [Revoke Token](#revoke_token) | DELETE | /HP-IDM/v1.0/tokens/{tokenId} | Y/Y |
| Tokens | [Swift Legacy Authentication](#swift_legacy_authentication) | GET | /v1.0 | Y/Y |
| Tokens | [Swift Legacy Authentication](#swift_legacy_authentication) | GET | /v1.1 | Y/Y |
| Tokens | [Swift Legacy Authentication](#swift_legacy_authentication) | GET | /auth/v1.0 | Y/Y |
| Tokens | [Swift Legacy Authentication](#swift_legacy_authentication) | GET | /auth/v1.1 | Y/Y |
| User Access Keys | [Create User Access Key](#create_user_access_key) | POST | /HP-IDM/v1.0/accesskeys | Y/Y |
| User Access Keys | [Delete User Access Key](#delete_user_access_key) | DELETE | /HP-IDM/v1.0/accesskeys/{accesskeyId}  | Y/Y |
| User Access Keys | [Get Access Keys](#get_access_keys) | GET | /HP-IDM/v1.0/accesskeys | Y/Y |
| User Access Keys | [Get An Access Key](#get_an_access_key) | GET | /HP-IDM/v1.0/accesskeys/{accesskeyId} | Y/Y |
| User Access Keys | [Import User Access Key](#import_user_access_key) | PUT | /HP-IDM/v1.0/accesskeys | Y/Y |
| User Access Keys | [Update User Access Key](#update_user_access_key) | PUT | /HP-IDM/v1.0/accesskeys/{accesskeyId} | Y/Y |

## 3.2 Common Request Headers
1. Content-Type     : Denotes the request content type.  Supported Content-Types are  application/xml and application/json
2. Accept	  : Denotes the response content type that the caller can understand.  Supported Content-Types are  application/xml and application/json. Default type is application/json
3. X-Auth-Token     : Contains authentication token of the user who is invoking the REST API 

## 3.3 Common Response Headers
1. Content-Type     : Denotes the response content type.  Supported Content-Types are  application/xml and application/json.

### 3.4.1 Tenants

Tenant is a collection of services, and associated with zero or more users who have access to these services via role references.

**Status Lifecycle**

N/A

**Rate Limits**

| Operation | Rate Limit per second | Rate Limited By |
| :-----------| :-----------| :-------|
| List Tenants | 50 | X-Auth-Token in request header |

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

#### 3.4.1.1 List Tenants#### {#list_tenants}
#### GET /tenants

This API returns a listing of all tenants for which the holder of the provided token has a role assignment. If the user is not a valid, an error is returned.

**Request Data**

This API supports pagination. See Pagination for more details.

This API also supports an optional *name* filter for get-by-name. Pagination and *name* filter are mutually exclusive.

**URL Parameters**

* *limit* (Optional) - integer - represents the maximum number of elements which will be returned in the request. Default is 100.
* *marker* (Optional)} - string - the resource Id of the last item in the previous list
* *name* (Optional) - string - name of the tenant to be returned

**Data Parameters**

See schema file for more details on the request and response data structure.

A valid token must be presented in the *X-Auth-Token* HTTP header. Otherwise, a 401 will be returned.

This call does not require a request body.

JSON

    GET /v2.0/tenants HTTP/1.1
    Accept: application/xml
    Content-Type: application/xml
    User-Agent: Wink Client v1.1.2
    X-Auth-Token: HPAuth_4e56db8d2cdce58d662fb351
    Host: localhost:9999
    Connection: keep-alive

XML

    GET /v2.0/tenants/ HTTP/1.1
    Accept: application/xml
    Content-Type: application/xml
    User-Agent: Wink Client v1.1.2
    X-Auth-Token: HPAuth_4e56db8d2cdce58d662fb351
    Host: localhost:9999
    Connection: keep-alive

Optional:

JSON

With *name* filter.

    GET /v2.0/tenants?name=tenantName HTTP/1.1
    Accept: application/xml
    Content-Type: application/xml
    User-Agent: Wink Client v1.1.2
    X-Auth-Token: HPAuth_4e56db8d2cdce58d662fb351
    Host: localhost:9999
    Connection: keep-alive

With pagination.

    GET /v2.0/tenants?limit=10 HTTP/1.1
    Accept: application/xml
    Content-Type: application/xml
    User-Agent: Wink Client v1.1.2
    X-Auth-Token: HPAuth_4e56db8d2cdce58d662fb351
    Host: localhost:9999
    Connection: keep-alive

XML

With pagination.

    GET /v2.0/tenants?limit=100&marker=S4DFJ123SF HTTP/1.1
    Accept: application/xml
    Content-Type: application/xml
    User-Agent: Wink Client v1.1.2
    X-Auth-Token: HPAuth_4e56db8d2cdce58d662fb351
    Host: localhost:9999
    Connection: keep-alive

**Success Response**

*Specify the status code and any content that is returned.*

**Status Code**

200 - OK

**Response Data**

A list of tenants in the specified format is returned.

JSON

    HTTP/1.1 200 OK
    Server: Apache-Coyote/1.1
    Cache-Control: no-cache
    Pragma: no-cache
    Expires: -1
    Content-Type: application/json
    Content-Length: 240
    Date: Tue, 29 Nov 2011 17:17:50 GMT
    
    {
      "tenants": [
        {
          "id": "39595655514446",
          "name": "Banking Tenant Services",
          "description": "Banking Tenant Services for TimeWarner",
          "enabled": true,
          "created": "2011-11-29T16:59:52.635Z",
          "updated": "2011-11-29T16:59:52.635Z"
        }
      ]
    }

XML

    HTTP/1.1 200 OK
    Server: Apache-Coyote/1.1
    Cache-Control: no-cache
    Pragma: no-cache
    Expires: -1
    Content-Type: application/xml
    Content-Length: 380
    Date: Thu, 25 Aug 2011 23:33:19 GMT
    
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
    <tenants xmlns="http://docs.openstack.org/identity/api/v2.0" xmlns:ns2="http://www.w3.org/2005/Atom">
      <tenant id="541212460710" name="Time Warner Tenant Services" enabled="false" display-name="Time Warner Tenant Services">
        <description>Tenant for hosting Time Warner Applications & services</description>
      </tenant>
    </tenants>

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 403 | Forbidden | Disabled or suspended user making the request. |
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

Curl Example

***List Tenants***

    curl -k -H "X-Auth-Token: HPAuth_fd6f4f19c0bbf7bb0d500aac3bfe21b621073f22b8a92959cabfdc5c4b3f234c" -H "Accept: application/json" "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/tenants"

***Get Tenant By Name***

    curl -k -H "X-Auth-Token: HPAuth_fd6f4f19c0bbf7bb0d500aac3bfe21b621073f22b8a92959cabfdc5c4b3f234c" -H "Accept: application/json" "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/tenants?name=MyTenant"

**Additional Notes**


### 3.4.2 Tokens

An unique identifier which is used to identify the privilege of the user.

**Status Lifecycle**

N/A

**Rate Limits**

| Operation | Rate Limit per second | Rate Limited By | Path |
| :-----------| :-----------| :-------| :-------|
| Authenticate | 50 | username and tenant ID or tenant Name | /v2.0/tokens |
| Rescope Token | 50 | X-Auth-Token in request header | /v2.0/tokens |
| Revoke Token | 1 | X-Auth-Token in request header | /v2.0/HP-IDM/v1.0/tokens |
| Swift Legacy Authentication | 50 | X-Auth-User in request header | /v1.0 |
| Swift Legacy Authentication | 50 | X-Auth-User in request header | /v1.1 |
| Swift Legacy Authentication | 50 | X-Auth-User in request header | /auth/v1.0 |
| Swift Legacy Authentication | 50 | X-Auth-User in request header | /auth/v1.1 |

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


#### 3.4.2.1 Authenticate#### {#authenticate}
#### POST /tokens

This API is used to authenticate a user to be able to use an OpenStack service. The result of a successful authentication is a token to be used with service requests. A username and password or access/secret key credentials are given as input to this interface. If authentication succeeds, the response will include an authentication token and service catalog ( list of available services for that user ). Tokens are valid for 12 hours. Issued tokens can become invalid in two cases:

1. the token has expired
2. the token has been revoked.

Besides using a username and password, another way to authenticate is using symmetric keys. Symmetric keys are user access key and secret key pairs provisioned for user account. In this type of credential data, request body is expected to contain an access key and a secret key information belonging to the user. Once those keys are verified, a new token is created. In this type of authentication, the only change is in expected request body data (please see related example below). There is no difference in response format/content whether authentication is done using password credential data or access key credential data.

##### Service Catalog:

In case of un-scoped token request, the service catalog is going to include global active endpoint templates as endpoints in its data. In case of scoped token request, the service catalog is going to include tenant specific endpoints as well as global active endpoint templates as endpoints.

##### Scoped Tokens:

A token scoped to a tenant can be obtained by providing either a tenantName or a tenantId. This will also return service endpoints for other services associated with the tenant in question. An unscoped token will likely not contain service endpoints except for those for the Identity Service. Note that if tenant information is unknown, an unscoped token can be obtained and then a list of tenants obtained. Tenant information can also be found in the Management Console.

**Request Data**

See examples below.

**URL Parameters**

None

**Data Parameters**

See schema file for more details on the request and response data structure.

JSON

Authenticate using password credential for an unscoped token.

    Accept-Encoding: gzip,deflate
    Accept: application/json
    Content-Type: application/json
    Content-Length: 171
    
    {
        "auth":{
            "passwordCredentials":{
                "username":"arunkant",
                "password":"changeme"
            }
        }
    }

Authenticate using password credential for a scoped token.

    Accept-Encoding: gzip,deflate
    Accept: application/json
    Content-Type: application/json
    Content-Length: 171
    
    {
        "auth":{
            "passwordCredentials":{
                "username":"arunkant",
                "password":"changeme"
            },
            "tenantId":"95096564413950"
        }
    }

Authenticate using access key credential.

    POST https://localhost:8443/v2.0/tokens HTTP/1.1
    Accept-Encoding: gzip,deflate
    Accept: application/json
    Content-Type: application/json
    User-Agent: Jakarta Commons-HttpClient/3.1
    Host: localhost:8443
    Content-Length: 176
     
    {
        "auth":{
            "apiAccessKeyCredentials":{
                "accessKey":"19N488ACAF3859DW9AFS9",
                "secretKey":"vpGCFNzFZ8BMP1g8r3J6Cy7/ACOQUYyS9mXJDlxc"
            }       
        }
    }

XML

Authenticate using password credential for a scoped token.

    ccept-Encoding: gzip,deflate
    Accept: application/xml
    Content-Type: application/xml
    Content-Length: 211
    
    <auth xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://docs.openstack.org/identity/api/v2.0" tenantName="HP5 Tenant Services">
      <passwordCredentials username="arunkant" password="changeme"/>
    </auth>

Authenticate using access key credential.

    Accept-Encoding: gzip,deflate
    Accept: application/xml
    Content-Type: application/xml
    Content-Length: 219
    
    <auth xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://www.hp.com/identity/api/ext/HP-IDM/v1.0">
      <apiAccessKeyCredentials secretKey="vpGCFNzFZ8BMP1g8r3J6Cy7/ACOQUYyS9mXJDlxc" accessKey="9N488ACAF3859DW9AFS9"/>
    </auth>

**Success Response**

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
    Content-Length: 3248
    Date: Fri, 14 Oct 2011 21:17:14 GMT
     
     
    {"access": {
       "token":    {
          "expires": "2011-10-14T21:42:59.455Z",
          "id": "HPAuth_4e98a5dbb0befc448cd0454f",
          "tenant":       {
             "id": "14541255461800",
             "name": "HR Tenant Services"
          }
       },
       "user":    {
          "id": "30744378952176",
          "name": "testuser",
          "otherAttributes":       {
             "domainStatus": "suspended:2",
             "domainStatusCode": "21"
          },
          "roles":       [
                      {
                "id": "00000000004008",
                "serviceId": "120",
                "name": "nova:developer",
                "tenantId": "14541255461800"
             },
                      {
                "id": "00000000004003",
                "serviceId": "100",
                "name": "domainadmin",
                "tenantId": "14541255461800"
             },
                      {
                "id": "00000000004004",
                "serviceId": "100",
                "name": "domainuser",
                "tenantId": "14541255461800"
             },
                      {
                "id": "00000000004017",
                "serviceId": "100",
                "name": "tenant-member",
                "tenantId": "14541255461800"
             }
          ]
       },
       "serviceCatalog":    [
                {
             "name": "storage5063096349006363528",
             "type": "compute",
             "endpoints": [         {
                "adminURL": "https://localhost:8443/identity/api/v2.0/admin/0",
                "internalURL": "https://localhost:8443/identity/api/v2.0/internal/0",
                "publicURL": "https://localhost:8443/identity/api/v2.0/public/0",
                "region": "SFO"
             }]
          },
                {
             "name": "Object Storage",
             "type": "object-store",
             "endpoints": [         {
                "tenantId": "14541255461800",
                "adminURL": "https://region-a.geo-1.objects.hpcloudsvc.com/auth/v1.0/",
                "internalURL": "https://region-a.geo-1.objects.hpcloudsvc.com/v1.0/AUTH_14541255461800",
                "publicURL": "https://region-a.geo-1.objects.hpcloudsvc.com/v1.0/AUTH_14541255461800",
                "region": "region-a.geo-1",
                "id": "1.0",
                "info": "https://region-a.geo-1.objects.hpcloudsvc.com/info/v1.0",
                "list": "https://region-a.geo-1.objects.hpcloudsvc.com/allVersions"
             }]
          },
                {
             "name": "Identity",
             "type": "identity",
             "endpoints": [         {
                "adminURL": "https://region-a.geo-1.identity.hpcloudsvc.com/v2.0",
                "internalURL": "hhttps://region-a.geo-1.identity.hpcloudsvc.com/v2.0",
                "publicURL": "https://region-a.geo-1.identity.hpcloudsvc.com/v2.0",
                "region": "region-a.geo-1",
                "id": "2.0",
                "info": "https://region-a.geo-1.identity.hpcloudsvc.com/info/v2.0",
                "list": "https://region-a.geo-1.identity.hpcloudsvc.com/allVersions"
             }]
          },
                {
             "name": "storage5065129211418544729",
             "type": "compute",
             "endpoints": [         {
                "adminURL": "https://localhost:8443/identity/api/v2.0/admin/0",
                "internalURL": "https://localhost:8443/identity/api/v2.0/internal/0",
                "publicURL": "https://localhost:8443/identity/api/v2.0/public/0",
                "region": "SFO"
             }]
          },
                {
             "name": "storage5042344434157721570",
             "type": "compute",
             "endpoints": [         {
                "adminURL": "https://localhost:8443/identity/api/v2.0/admin/0",
                "internalURL": "https://localhost:8443/identity/api/v2.0/internal/0",
                "publicURL": "https://localhost:8443/identity/api/v2.0/public/0",
                "region": "SFO"
             }]
          }
       ]
    }}

XML

    HTTP/1.1 200 OK
    Server: Apache-Coyote/1.1
    Cache-Control: no-cache
    Pragma: no-cache
    Expires: -1
    Content-Type: application/xml
    Content-Length: 2667
    Date: Fri, 14 Oct 2011 21:18:40 GMT
     
    <access xmlns="http://docs.openstack.org/identity/api/v2.0" xmlns:ns2="http://docs.openstack.org/common/api/v1.0" xmlns:ns3="http://www.w3.org/2005/Atom">
       <token id="HPAuth_4e98a5dbb0befc448cd0454f" expires="2011-10-14T21:42:59.455Z">
          <tenant id="14541255461800" name="HR Tenant Services"/>
       </token>
       <user id="30744378952176" name="testuser" domainStatus="enabled">
          <roles>
             <role id="00000000004008" name="nova:developer" serviceId="120" tenantId="14541255461800"/>
             <role id="00000000004003" name="domainadmin" serviceId="100" tenantId="14541255461800"/>
             <role id="00000000004004" name="domainuser" serviceId="100" tenantId="14541255461800"/>
             <role id="00000000004017" name="tenant-member" serviceId="100" tenantId="14541255461800"/>
          </roles>
       </user>
       <serviceCatalog>
          <service type="compute" name="storage5063096349006363528">
             <endpoint region="SFO" publicURL="https://localhost:8443/identity/api/v2.0/public/0" internalURL="https://localhost:8443/identity/api/v2.0/internal/0" adminURL="https://localhost:8443/identity/api/v2.0/admin/0">
                <version/>
             </endpoint>
          </service>
          <service type="object-store" name="Object Storage">
             <endpoint region="region-a.geo-1" tenantId="14541255461800" publicURL="https://region-a.geo-1.objects.hpcloudsvc.com/v1.0/AUTH_14541255461800" internalURL="https://region-a.geo-1.objects.hpcloudsvc.com/v1.0/AUTH_14541255461800" adminURL="https://region-a.geo-1.objects.hpcloudsvc.com/auth/v1.0/">
                <version id="1.0" info="https://region-a.geo-1.objects.hpcloudsvc.com/info/v1.0" list="https://region-a.geo-1.objects.hpcloudsvc.com/allVersions"/>
             </endpoint>
          </service>
          <service type="identity" name="Identity">
             <endpoint region="region-a.geo-1" publicURL="https://region-a.geo-1.identity.hpcloudsvc.com/v2.0" internalURL="hhttps://region-a.geo-1.identity.hpcloudsvc.com/v2.0" adminURL="https://region-a.geo-1.identity.hpcloudsvc.com/v2.0">
                <version id="2.0" info="https://region-a.geo-1.identity.hpcloudsvc.com/info/v2.0" list="https://region-a.geo-1.identity.hpcloudsvc.com/allVersions"/>
             </endpoint>
          </service>
          <service type="compute" name="storage5065129211418544729">
             <endpoint region="SFO" publicURL="https://localhost:8443/identity/api/v2.0/public/0" internalURL="https://localhost:8443/identity/api/v2.0/internal/0" adminURL="https://localhost:8443/identity/api/v2.0/admin/0">
                <version/>
             </endpoint>
          </service>
          <service type="compute" name="storage5042344434157721570">
             <endpoint region="SFO" publicURL="https://localhost:8443/identity/api/v2.0/public/0" internalURL="https://localhost:8443/identity/api/v2.0/internal/0" adminURL="https://localhost:8443/identity/api/v2.0/admin/0">
                <version/>
             </endpoint>
          </service>
       </serviceCatalog>
    </access>

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 401 | Unauthorized | Disabled or suspended user making the request. |
| 500 | Internal Server Error | The server encountered a problem while processing the request. |
| 429 | TooManyRequests | The request was rate limited. Please refer to the Rate Limits section for various limits. |

**Response Data**

JSON

    {
      "identityFault": {
        "message": "Fault",
        "details": "Error Details...",
        "code": 500
      }
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <identityFault xmlns="http://docs.openstack.org/identity/api/v2.0"
              code="500">
            <message>Fault</message>
            <details>Error Details...</details>
    </identityFault>

Curl Example

***Authenticate with Username/Password and Tenant ID***

    curl -X POST -H "Content-Type: application/json"
         https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/tokens
         -d '{"auth":{"passwordCredentials":{"username":"falken@wg.com",          "password":"J0shua!"}, "tenantId":"72020596871800"}}'
    

***Authenticate with Access Keys and Tenant ID***

    curl -X POST -H "Content-Type: application/json"
            https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/tokens
        -d '{"auth":{"apiAccessKeyCredentials":{"accessKey":"B5VKMNLEZ7YUN9BTFDZC", "secretKey":"CQSp+KsLQGFz6+V/S1s4XXpE42q472pD9VhIBFsn"}, "tenantId":"72020596871800"}}'

**Additional Notes**


#### 3.4.2.2 Rescope Token#### {#rescope_token}
#### POST /tokens

This API provides the ability to re-scope a valid token with another tenant. An existing unexpired token, regardless of its currently scoped or not, can be scoped to another tenant as long as the user has valid association with that tenant.

Re-scoping of token can be done from 1) unscoped token to a scoped token for specific tenant 2) scoped token from one tenant to another tenant 3) scoped token to unscoped token (with no tenantId and tenantName specified in request). Re-scoping of token does not alter the token expiration time and same token id is returned in response.

##### Service Catalog:

In case of un-scoped token request, the service catalog is going to include global active endpoint templates as endpoints in its data. In case of scoped token request, the service catalog is going to include tenant specific endpoints as well as global active endpoint templates as endpoints.

**Request Data**


**URL Parameters**

None

**Data Parameters**

See schema file for more details on the request and response data structure.

JSON

    Accept-Encoding: gzip,deflate
    Accept: application/json
    Content-Type: application/json
    Content-Length: 154
    
    {
        "auth": {
            "tenantId": "19694547081948",
            "token": {
                "id": "HPAuth_4e934043b0be09f52fb4c29d"
            }
        }
    }

XML

    Accept-Encoding: gzip,deflate
    Accept: application/xml
    Content-Type: application/xml
    Content-Length: 195
    
    <auth xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://docs.openstack.org/identity/api/v2.0" tenantId="19694547081948">
      <token id="HPAuth_4e934043b0be09f52fb4c29d" />
    </auth>

**Success Response**


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
    Content-Length: 1283
    Date: Wed, 26 Oct 2011 13:43:14 GMT
    
    {"access": {
      "token": {
        "expires": "2011-10-26T14:13:14.311Z",
        "id": "HPAuth_4ea80e72b0be73fc0385ecef",
        "tenant": {
          "id": "90260810095453",
          "name": "HP Swift Tenant Services"
        }
      },
      "user": {
        "id": "53449493563804",
        "name": "testuser",
        "otherAttributes":       {
             "domainStatus": "enabled"
        },
        "roles": [
          {
            "id": "00000000004017",
            "serviceId": "100",
            "name": "tenant-member",
            "tenantId": "90260810095453"
          },
          {
            "id": "00000000004003",
            "serviceId": "100",
            "name": "domainadmin",
            "tenantId": "90260810095453"
          },
          {
            "id": "00000000004004",
            "serviceId": "100",
            "name": "domainuser",
            "tenantId": "90260810095453"
          }
        ]
      },
      "serviceCatalog": [{
        "name": "Identity",
        "type": "identity",
        "endpoints": [{
          "adminURL": "https:\/\/region-a.geo-1.identity.hpcloudsvc.com\/v2.0",
          "internalURL": "https:\/\/region-a.geo-1.identity.hpcloudsvc.com\/v2.0",
          "publicURL": "https:\/\/region-a.geo-1.identity.hpcloudsvc.com\/v2.0",
          "region": "region-a.geo-1",
          "id": "2.0",
          "info": "https:\/\/region-a.geo-1.identity.hpcloudsvc.com\/info\/v2.0",
          "list": "https:\/\/region-a.geo-1.identity.hpcloudsvc.com\/allVersions"
        }]
      }]
    }}

XML

    HTTP/1.1 200 OK
    Server: Apache-Coyote/1.1
    Cache-Control: no-cache
    Pragma: no-cache
    Expires: -1
    Content-Type: application/xml
    Content-Length: 1166
    Date: Wed, 26 Oct 2011 13:46:53 GMT
    
    
    <access xmlns="http://docs.openstack.org/identity/api/v2.0" xmlns:ns2="http://docs.openstack.org/common/api/v1.0" xmlns:ns3="http://www.w3.org/2005/Atom">
       <token id="HPAuth_4ea80e72b0be73fc0385ecef" expires="2011-10-26T14:13:14.311Z">
          <tenant id="90260810095453" name="HP Swift Tenant Services"/>
       </token>
       <user id="53449493563804" name="testuser" domainStatus="enabled">
          <roles>
             <role id="00000000004017" name="tenant-member" serviceId="100" tenantId="90260810095453"/>
             <role id="00000000004003" name="domainadmin" serviceId="100" tenantId="90260810095453"/>
             <role id="00000000004004" name="domainuser" serviceId="100" tenantId="90260810095453"/>
          </roles>
       </user>
       <serviceCatalog>
          <service type="identity" name="Identity">
             <endpoint region="region-a.geo-1" publicURL="https://region-a.geo-1.identity.hpcloudsvc.com/v2.0" internalURL="https://region-a.geo-1.identity.hpcloudsvc.com/v2.0" adminURL="https://region-a.geo-1.identity.hpcloudsvc.com/v2.0">
                <version id="2.0" info="https://region-a.geo-1.identity.hpcloudsvc.com/info/v2.0" list="https://region-a.geo-1.identity.hpcloudsvc.com/allVersions"/>
             </endpoint>
          </service>
       </serviceCatalog>
    </access>

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 401 | Unauthorized | Disabled or suspended user making the request. |
| 500 | Internal Server Error | The server encountered a problem while processing the request. |
| 503 | Service Unavailable | The server is unavailable to process the request.   |
| 429 | TooManyRequests | The request was rate limited. Please refer to the Rate Limits section for various limits. |

**Response Data**

JSON

    {
      "identityFault": {
        "message": "Fault",
        "details": "Error Details...",
        "code": 500
      }
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <identityFault xmlns="http://docs.openstack.org/identity/api/v2.0"
              code="500">
            <message>Fault</message>
            <details>Error Details...</details>
    </identityFault>

Curl Example

    curl -k -H "Content-Type: application/json" -d '{"auth":{"tenantName":"HP Swift Tenant Services","token":{"id":"HPAuth_4ea80da3b0be73fc0385eceb"}}}' -XPOST https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/tokens

**Additional Notes**


#### 3.4.2.3 Revoke Token#### {#revoke_token}
#### DELETE /HP-IDM/v1.0/tokens/{tokenId}

This API is used to revoke an authentication token. This operation does not require a request body. Once a token has been revoked, attempts to validate the token via GET /tokens/tokenId will fail with a 404 (item not found) as the token no longer exists. Trying revoke a non existing token, including one which has expired will also return a 404 (item not found).

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
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 403 | Forbidden | Disabled or suspended user making the request. |
| 429 | TooManyRequests | The request was rate limited. Please refer to the Rate Limits section for various limits. |

**Response Data**

JSON

    {"forbidden":{"message":"Full authentication is required to access this resource","code":403}}

XML

    <?xml version="1.0" encoding="UTF-8"?><forbidden xmlns="http://docs.openstack.org/identity/api/v2.0" code="403"><message>Full authentication is required to access this resource</message></forbidden>

Curl Example

    curl -k -XDELETE https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/HP-IDM/v1.0/HPAuth_123456789

**Additional Notes**

{Specify any inconsistencies, ambiguities, issues, commentary or discussion relevant to the call.}


#### 3.4.2.4 Swift Legacy Authentication#### {#swift_legacy_authentication}
#### GET /v1.0

#### GET /v1.1

#### GET /auth/v1.0

#### GET /auth/v1.1

Pre-Keystone (aka auth v2.0), Openstack services rely on disparate authentication mechanisms to authenticate their services.  For example, Swift uses swauth, while Nova uses novaauth.  The v1/v1.1 style of authentication relies on custom HTTP headers (specific to each service) to communicate authentication data, rather than relying on well-defined XML/JSON documents that can be validated via XSDs.  With the release of Diablo, most Openstack services have switched to using Keystone API completely, with the exception of the Swift CLI tool.  To provide backward-compatibility for this particular tool, CS (as well as the FOSS Keystone) provides this API. 

**Request Data**


**URL Parameters**

None

**Data Parameters**

The following HTTP headers must be specified.

* *X-Auth-User* - containing the <tenantId:username> for a scoped token for Swift
* *X-Auth-Key* - containing the password for the given user

**Success Response**


**Status Code**

200 - OK

**Response Data**

In addition to the token access response, the following response HTTP headers are populated by the server.

* *X-Auth-Token* - token ID
* *X-Storage-URL* - containing a list of public endpoints for Swift

JSON

    HTTP/1.1 200 OK
    Server: Apache-Coyote/1.1
    Cache-Control: no-cache
    Pragma: no-cache
    Expires: -1
    X-Auth-Token: HPAuth_4f03696fe4b071e9f15c0550
    X-Storage-Url: https://az1-sw-proxy-ext-0001.rndd.aw1.hpcloud.net:443/v1.0/14565730729748
    Content-Type: application/json
    Content-Length: 1583
    Date: Tue, 03 Jan 2012 20:47:43 GMT
     
    {"access": {
      "token": {
        "expires": "2012-01-03T21:17:43.087Z",
        "id": "HPAuth_4f03696fe4b071e9f15c0550",
        "tenant": {
          "id": "14565730729748",
          "name": "Swift SSL"
        }
      },
      "user": {
        "id": "70970596121812",
        "name": "joeuserA@timewarner.com",
        "otherAttributes":       {
             "domainStatus": "suspended:2"
        },
        "roles": [
          {
            "id": "00000000004022",
            "serviceId": "110",
            "name": "Admin",
            "tenantId": "14565730729748"
          },
          {
            "id": "00000000004013",
            "serviceId": "130",
            "name": "block-admin",
            "tenantId": "14565730729748"
          },
          {
            "id": "00000000004025",
            "serviceId": "120",
            "name": "sysadmin",
            "tenantId": "14565730729748"
          },
          {
            "id": "00000000004016",
            "serviceId": "120",
            "name": "netadmin",
            "tenantId": "14565730729748"
          },
          {
            "id": "00000000004024",
            "serviceId": "140",
            "name": "user",
            "tenantId": "14565730729748"
          },
          {
            "id": "00000000004003",
            "serviceId": "100",
            "name": "domainadmin",
            "tenantId": "14565730729748"
          },
          {
            "id": "00000000004014",
            "serviceId": "150",
            "name": "cdn-admin",
            "tenantId": "14565730729748"
          },
          {
            "id": "00000000004004",
            "serviceId": "100",
            "name": "domainuser",
            "tenantId": "14565730729748"
          },
          {
            "id": "00000000004014",
            "serviceId": "150",
            "name": "cdn-admin",
            "tenantId": "14565730729748"
          }
        ]
      }
    }}

XML

    HTTP/1.1 200 OK
    Server: Apache-Coyote/1.1
    Cache-Control: no-cache
    Pragma: no-cache
    Expires: -1
    X-Auth-Token: HPAuth_4f03696fe4b071e9f15c0550
    X-Storage-Url: https://az1-sw-proxy-ext-0001.rndd.aw1.hpcloud.net:443/v1.0/14565730729748
    Content-Type: application/xml
    Content-Length: 730
    Date: Tue, 03 Jan 2012 20:47:43 GMT
    
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?><access xmlns="http://docs.openstack.org/identity/api/v2.0" xmlns:hpext="http://www.hp.com/identity/api/ext/HP-IDM/v1.0" xmlns:ns3="http://docs.openstack.org/common/api/v1.0" xmlns:ns4="http://www.w3.org/2005/Atom"><token id="HPAuth_767eaf4d50bee574eefb8e3b1081bde75edf31c59f806e35a8793296247aa7f9" expires="2012-10-10T11:09:38.813Z"><tenant id="62424047631429" name="conser4301_swift"/></token><user id="97539030347757" name="conser4301" domainStatus="enabled"><roles><role id="00000000004004" name="domainuser" serviceId="100"/><role id="00000000004022" name="Admin" serviceId="110" tenantId="62424047631429"/><role id="00000000004003" name="domainadmin" serviceId="100"/></roles></user></access>

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 401 | Unauthorized | Disabled or suspended user making the request. |
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

Curl Example

    curl -s -k -H "X-Auth-User: 62424047631429:jdoe" -H "X-Auth-Key: secrete" -H "Accept: application/xml" -D /tmp/headers.txt https://region-a.geo-1.identity.hpcloudsvc.com:35357/v1.0

**Additional Notes**


### 3.4.3 User Access Keys

The User Access Key REST API provides the ability to manage user access keys.

**Status Lifecycle**

N/A

**Rate Limits**

| Operation | Rate Limit per second | Rate Limited By | Path |
| :-----------| :-----------| :-------| :-------|
| Create User Access Key | 20 | X-Auth-Token in request header | /HP-IDM/v1.0/accesskeys |
| Delete User Access Key | 20 | X-Auth-Token in request header | /HP-IDM/v1.0/accesskeys/{accesskeyId} |
| Get Access Keys | 20 | X-Auth-Token in request header | /HP-IDM/v1.0/accesskeys |
| Get An Access Key | 50 | X-Auth-Token in request header | /HP-IDM/v1.0/accesskeys/{accesskeyId} |
| Import User Access Key | 20 | X-Auth-Token in request header | /HP-IDM/v1.0/accesskeys |
| Update User Access Key | 20 | X-Auth-Token in request header | /HP-IDM/v1.0/accesskeys/{accesskeyId} |

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

*Quota Limits**

N/A

**Business Rules**

None.


#### 3.4.3.1 Create User Access Key#### {#create_user_access_key}
#### POST /HP-IDM/v1.0/accesskeys



**Request Data**

The optional data parameters are algorithm, domainId, keyLength, status, userId, validFrom, and validTo.

**URL Parameters**

There are no URL parameters for this operation.

**Data Parameters**

See schema file for more details on the request and response data structure.

* *algorithm* (Optional) - String - the algorithm the key will be used with. One of 
* *domainId* - String - domain identifier of the owner of the key.
* *keyLength* (Optional) - Integer - Length of the key in bits.Minimum length is 64, and maximum length is 512. Default lenght is 240
* *status* (Optional) String - the key status. One the values (active, inactive). Defaults to active if not specified.
* *userId* (Optional) - String - User identifier of the owner of the key. If not specified the user identifier defaults to the user identifier of the requester.
* *validFrom* (Optional) - DateTime - The date the key becomes valid specified in the following form "YYYY-MM-DDThh:mm:ss". 
* *validTo* (Optional) - DateTime - The date the key becomes invalid specified in the following form "YYYY-MM-DDThh:mm:ss" 


A valid token must be present in the *X-Auth-Token* HTTP header. Otherwise, a 401 will be returned.

JSON

    POST https://localhost:8443/v2.0/HP-IDM/v1.0/accesskeys HTTP/1.1
    Accept-Encoding: gzip,deflate
    Accept: application/json
    Content-Type: application/json
    X-Auth-Token: HPAuth_4e7b748be4b0600fec3d2a24
    User-Agent: Jakarta Commons-HttpClient/3.1
    Host: localhost:8443
    Content-Length: 235
     
    { "accessKey":
                {
             "algorithm": "HmacSHA1",
             "keyLength": 64,
             "domainId": "00000000001001",
             "otherAttributes": {},
             "status": "active",
             "userId": "00000000003002"
           }
    }

XML

    POST https://localhost:8443/v2.0/HP-IDM/v1.0/accesskeys HTTP/1.1
    Accept-Encoding: gzip,deflate
    Accept: application/xml
    Content-Type: application/xml
    X-Auth-Token: HPAuth_4e69969de4b0a8f279022d55
    User-Agent: Jakarta Commons-HttpClient/3.1
    Host: localhost:8443
    Content-Length: 259
     
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
    <accessKey userId="000000003002" domainId="000000001001" status="active" xmlns="http://docs.openstack.org/identity/api/ext/hp/v1.0">
    <algorithm>HmacSHA1</algorithm>
    <keyLength>64</keyLength>
    </accessKey>

**Success Response**

**Status Code**

201 - Created

**Response Data**

JSON

    HTTP/1.1 201 Created
    Server: Apache-Coyote/1.1
    Cache-Control: no-cache
    Pragma: no-cache
    Expires: -1
    Content-Type: application/json
    Content-Length: 376
    Date: Thu, 22 Sep 2011 18:01:17 GMT
     
    {
      "accessKey" : {
        "algorithm" : "HmacSHA1",
        "keyLength" : 64,
        "secretKey" : "pXmYG556MjD",
        "accessKeyId" : "KNGTV6EFKLPYE8LXF4VL",
        "createdOn" : 1316714474259,
        "domainId" : "00000000001001",
        "otherAttributes" : {
        },
        "status" : "active",
        "userId" : "00000000003002",
        "validFrom" : 1316714474000,
        "validTo" : 1632074474000
      }
    }

XML

    HTTP/1.1 201 Created
    Server: Apache-Coyote/1.1
    Cache-Control: no-cache
    Pragma: no-cache
    Expires: -1
    Set-Cookie: JSESSIONID=C20FB3A7F8BE4A7EF0EA7BE232327FE6; Path=/v2.0; Secure
    Content-Type: application/xml
    Content-Length: 448
    Date: Fri, 09 Sep 2011 04:32:07 GMT
     
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?><accessKey xmlns="http://docs.openstack.org/identity/api/ext/hp/v1.0" accessKeyId="FG54K8NB67KHASRF6KY1" userId="000000003002" domainId="000000001001" status="active" validFrom="2011-09-08T21:32:04.000-07:00" validTo="2021-09-05T21:32:04.000-07:00" createdOn="2011-09-08T21:32:04.937-07:00">
       <algorithm>HmacSHA1</algorithm>
       <keyLength>64</keyLength>
       <secretKey>iwv//jFjJ2E</secretKey>
    </accessKey>

**Error Response**


**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation     |
| 403 | Forbidden | Disabled or suspended user making the request  |
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

Curl Example

    curl -k -X POST -H "X-Auth-Token: HPAuth_1661578e273d107d38b732849173e00d0a60d46d9bc279bee31565fd39be48a8" -H "Content-Type: application/json" -H "Accept: application/json" "https://localhost:8443/v2.0/HP-IDM/v1.0/accesskeys" -d '{
      "accessKey" : {
        "algorithm" : "HmacSHA1",
        "keyLength" : 240,
        "domainId" : "11180052618906",
        "otherAttributes" : {
        },
        "status" : "active",
        "userId" : "84463950217213"
      }}'

**Additional Notes**



#### 3.4.3.2 Delete User Access Key#### {#delete_user_access_key}
#### DELETE /HP-IDM/v1.0/accesskeys/{accesskeyId} 

Delete a user access key.

**Request Data**

The accesskeyId url path parameter is required. The userId query parameter is only required to delete an access key for a user other than the requester.

**URL Parameters**

* *accesskeyId* (Required) - URL path parameter - user access key identifier string
* *userId* (Optional) - Query Parameter - User identifier of the access key owner. If not specified then defaults to userId of the requester.

**Data Parameters**

This call does not require a request body.

A valid token must be present in the *X-Auth-Token* HTTP header. Otherwise, a 401 will be returned.

**Success Response**

**Status Code**

204 - No Content

**Response Data**

This call does not return a response body on success.

JSON

    HTTP/1.1 204 No Content
    Server: Apache-Coyote/1.1
    Cache-Control: no-cache
    Pragma: no-cache
    Expires: -1
    Set-Cookie: JSESSIONID=90D365930EDDB20FF49CC2DDA4B7C925; Path=/v2.0; Secure
    Date: Thu, 22 Sep 2011 22:15:42 GMT

XML

    HTTP/1.1 204 No Content
    Server: Apache-Coyote/1.1
    Cache-Control: no-cache
    Pragma: no-cache
    Expires: -1
    Set-Cookie: JSESSIONID=7F457E3037CCB2DEC6C33D408F544EA8; Path=/v2.0; 
    SecureDate: Fri, 09 Sep 2011 04:25:47 GMT 

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation     |
| 403 | Forbidden | Disabled or suspended user making the request  |
| 404 | Not Found | Specified accesskeyId or userId not found   |
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

Curl Example

    curl -k -X DELETE -H "X-Auth-Token: HPAuth_1661578e273d107d38b732849173e00d0a60d46d9bc279bee31565fd39be48a8" -H "Accept: application/json" "https://localhost:8443/v2.0/HP-IDM/v1.0/accesskeys/ZNFNCA1JJL3T7XY12V2F" 

**Additional Notes**



#### 3.4.3.3 Get Access Keys#### {#get_access_keys}
#### GET /HP-IDM/v1.0/accesskeys


Gets a list of selected user access keys. 

**Request Data**

The following query parameters are optional (domainId, export, status, userId). There are no required query parameters.


**URL Parameters**

* *domainId* (Optional) - Query Parameter - Domain identifier. Selects keys with matching domain identifier.
* *export* (Optional) - Query Parameter - Export secret key value. Value is one of (true, false). If not specified the value is set to false.
* *status* (Optional) - Query Parameter - Key status. Selects keys with matching status. Value is one of (active, inactive, expired, revoked, deleted, purged).
* *userId* (Optional) - Query Parameter - User identifier. Selects keys with matching user identifier. If not specified the userId of the requester is used.


**Data Parameters**

This call does not require a request body.

A valid token must be present in the *X-Auth-Token* HTTP header. Otherwise, a 401 will be returned.


JSON

    GET https://localhost:8443/v2.0/HP-IDM/v1.0/accesskeys?export=false HTTP/1.1
    Accept-Encoding: gzip,deflate
    Accept: application/json
    X-Auth-Token: HPAuth_4e7b71f5e4b0600fec3d2a20
    User-Agent: Jakarta Commons-HttpClient/3.1
    Host: localhost:8443

XML

    GET https://localhost:8443/v2.0/HP-IDM/v1.0/accesskeys?export=false HTTP/1.1
    Accept-Encoding: gzip,deflate
    Accept: application/xml
    X-Auth-Token: HPAuth_4e699292e4b0a8f279022d4d
    User-Agent: Jakarta Commons-HttpClient/3.1
    Host: localhost:8443

**Success Response**

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
    Content-Length: 798
    Date: Thu, 22 Sep 2011 17:37:18 GMT
     
    {
      "accessKeys" : {
        "anies" : null,
        "accessKey" : [ {
          "algorithm" : "HmacSHA1",
          "keyLength" : 64,
          "accessKeyId" : "V7TEGGSZZ4NJK9UR4UFE",
          "createdOn" : 1316712986234,
          "domainId" : "00000000001001",
          "otherAttributes" : {
          },
          "status" : "active",
          "userId" : "00000000003002",
          "validFrom" : 1316712986000,
          "validTo" : 1632072986000
        }, {
          "algorithm" : "HmacSHA1",
          "keyLength" : 64,
          "accessKeyId" : "WHDFDP7UVJS9F3USU1NF",
          "createdOn" : 1316661731171,
          "domainId" : "00000000001001",
          "otherAttributes" : {
          },
          "status" : "active",
          "userId" : "00000000003002",
          "validFrom" : 1316661731000,
          "validTo" : 1632021731000
        } ],
        "otherAttributes" : {
        }
      }
    }

XML

    HTTP/1.1 200 OK
    Server: Apache-Coyote/1.1
    Cache-Control: no-cache
    Pragma: no-cache
    Expires: -1
    Set-Cookie: JSESSIONID=744A36BAF6E7165CCBC4C6CA1812204D; Path=/v2.0; Secure
    Content-Type: application/xml
    Content-Length: 1340
    Date: Fri, 09 Sep 2011 04:20:29 GMT
     
    <accessKeys xmlns="http://docs.openstack.org/identity/api/ext/hp/v1.0">
       <accessKey accessKeyId="2SL748X97NEP7B6MVXPS" userId="000000003002" domainId="000000001001" status="active" validFrom="2011-09-08T15:20:20.000-07:00" validTo="2021-09-05T15:20:20.000-07:00" createdOn="2011-09-08T15:20:20.275-07:00">
          <algorithm>HmacSHA1</algorithm>
          <keyLength>64</keyLength>
       </accessKey>
       <accessKey accessKeyId="98XM1KSN7BC2C88U9S7G" userId="000000003002" domainId="000000001001" status="active" validFrom="2011-09-08T16:43:56.000-07:00" validTo="2021-09-05T16:43:56.000-07:00" createdOn="2011-09-08T16:43:56.494-07:00">
          <algorithm>HmacSHA1</algorithm>
          <keyLength>64</keyLength>
       </accessKey>
       <accessKey accessKeyId="3D76NSUB49C96DFBRUF9" userId="000000003002" domainId="000000001001" status="deleted" validFrom="2011-09-08T15:19:10.000-07:00" validTo="2021-09-05T15:19:10.000-07:00" createdOn="2011-09-08T15:19:10.378-07:00">
          <algorithm>HmacSHA1</algorithm>
          <keyLength>64</keyLength>
       </accessKey>
       <accessKey accessKeyId="9L47KGME4ZKCH9YRWDY7" userId="000000003002" domainId="000000001001" status="active" validFrom="2011-09-08T17:34:09.000-07:00" validTo="2021-09-05T17:34:09.000-07:00" createdOn="2011-09-08T17:34:09.494-07:00">
          <algorithm>HmacSHA1</algorithm>
          <keyLength>64</keyLength>
       </accessKey>
    </accessKeys>

**Error Response**


**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation     |
| 403 | Forbidden | Disabled or suspended user making the request  |
| 404 | Not Found | Specified accesskeyId or userId not found   |
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

Curl Example

    curl -k -H "X-Auth-Token: HPAuth_21805c02da2661574e46235bd8c27c10623bddc09a7cf4c67004771628e5453c" -H "Accept: application/json" "https://localhost:8443/v2.0/HP-IDM/v1.0/accesskeys?export=true"

**Additional Notes**



#### 3.4.3.4 Get An Access Key#### {#get_an_access_key}
#### GET /HP-IDM/v1.0/accesskeys/{accesskeyId}


Gets a single user access key by it's access key identifier.

**Request Data**

The accesskeyId URL path parameter is required. The 'export' and 'userId' query parameters are optional.

**URL Parameters**

* *accesskeyId* (Required) - URL path parameter - user access key identifier string
* *userId* (Optional) - Query Parameter - user identifier string for user other than current authenticated user
* *export* (Optional) - Query Parameter - used to specify whether secret key value should be returned ("true" or "false")

**Data Parameters**

This call does not require a request body.

A valid token must be present in the *X-Auth-Token* HTTP header. Otherwise, a 401 will be returned.


JSON

    GET https://localhost:8443/v2.0/HP-IDM/v1.0/accesskeys/V7TEGGSZZ4NJK9UR4UFE?export=true HTTP/1.1
    Accept-Encoding: gzip,deflate
    Accept: application/json
    X-Auth-Token: HPAuth_4e7bc0d2e4b0600fec3d2a4a
    User-Agent: Jakarta Commons-HttpClient/3.1
    Host: localhost:8443 
    

XML

    GET https://localhost:8443/v2.0/HP-IDM/v1.0/accesskeys/3D76NSUB49C96DFBRUF9?export=false HTTP/1.1
    Accept-Encoding: gzip,deflate
    Accept: application/xml
    X-Auth-Token: HPAuth_4e699292e4b0a8f279022d4d
    User-Agent: Jakarta Commons-HttpClient/3.1
    Host: localhost:8443

**Success Response**

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
    Content-Length: 376
    Date: Thu, 22 Sep 2011 23:12:53 GMT
    
    {  
       "accessKey" : {    
         "algorithm" : "HmacSHA1",    
         "keyLength" : 64,    
         "secretKey" : "hNi0oiTU2sH",    
         "accessKeyId" : "V7TEGGSZZ4NJK9UR4UFE",    
         "createdOn" : 1316712986234,    
         "domainId" : "00000000001001",    
         "otherAttributes" : {    
         },    
         "status" : "active",    
         "userId" : "00000000003002",    
         "validFrom" : 1316712986000,    
         "validTo" : 1632072986000  
       }
    } 
    

XML

    HTTP/1.1 200 OK
    Server: Apache-Coyote/1.1
    Cache-Control: no-cache
    Pragma: no-cache
    Expires: -1
    Set-Cookie: JSESSIONID=34C3B7E6EC0F9035A75BD4A0CF6CAC37; Path=/v2.0; 
    SecureContent-Type: application/xml
    Content-Length: 415
    Date: Fri, 09 Sep 2011 04:15:42 GMT
    
    <accessKey accessKeyId="3D76NSUB49C96DFBRUF9" userId="000000003002" domainId="000000001001" status="deleted" validFrom="2011-09-08T15:19:10.000-07:00" validTo="2021-09-05T15:19:10.000-07:00" createdOn="2011-09-08T15:19:10.378-07:00" xmlns="http://docs.openstack.org/identity/api/ext/hp/v1.0">
      <algorithm>HmacSHA1</algorithm>
      <keyLength>64</keyLength>
    </accessKey> 

**Error Response**


**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation     |
| 403 | Forbidden | Disabled or suspended user making the request  |
| 404 | Not Found | Specified accesskeyId or userId not found   |
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

Curl Example

    curl -k -H "X-Auth-Token: HPAuth_1661578e273d107d38b732849173e00d0a60d46d9bc279bee31565fd39be48a8" -H "Accept: application/json" "https://localhost:8443/v2.0/HP-IDM/v1.0/accesskeys/HAJ5LLHHTKHBXB6MK3TL?export=true"

**Additional Notes**



#### 3.4.3.5 Import User Access Key#### {#import_user_access_key}
#### PUT /HP-IDM/v1.0/accesskeys

Import one or more user access keys. 

**Request Data**

The request data consists of an accessKeys data structure containing one or more accessKey elements. The secretKey and algorithm elements of the accessKey are required. The accessKeyId, domainId, keyLength, status, userId, validFrom, and validTo attributes are optional.

**URL Parameters**

There are no URL parameters for this request.

**Data Parameters**

See schema file for more details on the request and response data structure.

* *algorithm* - String - the algorithm the key will be used with. This is not validated when imported.
* *domainId* (Optional) - String - domain identifier of the owner of the key.
* *keyLength* (Optional) - Integer - Length of the key in bits.
* *status* (Optional) String - the key status. One the values (active, inactive). Defaults to active if not specified.
* *userId* (Optional) - String - User identifier of the owner of the key. If not specified the user identifier defaults to the user identifier of the requester.
* *validFrom* (Optional) - DateTime - The date the key becomes valid specified in the following form "YYYY-MM-DDThh:mm:ss". 
* *validTo* (Optional) - DateTime - The date the key becomes invalid specified in the following form "YYYY-MM-DDThh:mm:ss". 
* *secretKey, accessKeyId*  - Length cannot be more than 999

A valid token must be present in the *X-Auth-Token* HTTP header. Otherwise, a 401 will be returned.

JSON

    PUT https://localhost:8443/v2.0/HP-IDM/v1.0/accesskeys HTTP/1.1
    Accept-Encoding: gzip,deflate
    Accept: application/json
    Content-Type: application/json
    X-Auth-Token: HPAuth_4e7bb54fe4b0600fec3d2a37
    User-Agent: Jakarta Commons-HttpClient/3.1
    Host: localhost:8443
    Content-Length: 919
     
    {"accessKeys": {
       "anies": null,
       "accessKey":    [
                {
             "algorithm": "HmacSHA1",
             "keyLength": 64,
             "secretKey": "hNi0oiTU2sH",
             "accessKeyId": "V7TEGGSZZ4NJK9UR4998",
             "createdOn": 1316712986234,
             "domainId": "00000000001001",
             "otherAttributes": {},
             "status": "inactive",
             "userId": "00000000003002",
             "validFrom": 1316712986000,
             "validTo": 1632072986000
          },
                {
             "algorithm": "HmacSHA1",
             "keyLength": 64,
             "secretKey": "DBWjcUCMEED",
             "accessKeyId": "RVWVEGE88EHZBSBMJ999",
             "createdOn": 1316724920250,
             "domainId": "00000000001001",
             "otherAttributes": {},
             "status": "inactive",
             "userId": "00000000003002",
             "validFrom": 1316724920000,
             "validTo": 1632084920000
          }
        ],
       "otherAttributes": {}
    }}

XML

    PUT https://localhost:8443/v2.0/HP-IDM/v1.0/accesskeys HTTP/1.1
    Accept-Encoding: gzip,deflate
    Accept: application/xml
    Content-Type: application/xml
    X-Auth-Token: HPAuth_4e6d258be4b05605729d7c3a
    User-Agent: Jakarta Commons-HttpClient/3.1
    Host: localhost:8443
    Content-Length: 546
     
    <accessKeys xmlns="http://docs.openstack.org/identity/api/ext/hp/v1.0" xmlns:ns2="http://docs.openstack.org/identity/api/v2.0" xmlns:ns3="http://www.w3.org/2005/Atom">
       <accessKey accessKeyId="98XM1KSN7BC2C88U9999" userId="000000003002" domainId="000000001001" status="inactive" validFrom="2011-09-08T16:43:56.000-07:00" validTo="2021-09-05T16:43:56.000-07:00" createdOn="2011-09-08T16:43:56.494-07:00">
          <algorithm>HmacSHA1</algorithm>
          <keyLength>64</keyLength>
          <secretKey>HyGB2QRiOu7</secretKey>
       </accessKey>
    </accessKeys>

**Success Response**

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
    Content-Length: 802
    Date: Thu, 22 Sep 2011 22:23:53 GMT
     
    {
      "accessKeys" : {
        "anies" : null,
        "accessKey" : [ {
          "algorithm" : "HmacSHA1",
          "keyLength" : 64,
          "accessKeyId" : "V7TEGGSZZ4NJK9UR4998",
          "createdOn" : 1316730228058,
          "domainId" : "00000000001001",
          "otherAttributes" : {
          },
          "status" : "inactive",
          "userId" : "00000000003002",
          "validFrom" : 1316712986000,
          "validTo" : 1632072986000
        }, {
          "algorithm" : "HmacSHA1",
          "keyLength" : 64,
          "accessKeyId" : "RVWVEGE88EHZBSBMJ999",
          "createdOn" : 1316730228065,
          "domainId" : "00000000001001",
          "otherAttributes" : {
          },
          "status" : "inactive",
          "userId" : "00000000003002",
          "validFrom" : 1316724920000,
          "validTo" : 1632084920000
        } ],
        "otherAttributes" : {
        }
      }
    }

XML

    HTTP/1.1 200 OK
    Server: Apache-Coyote/1.1
    Cache-Control: no-cache
    Pragma: no-cache
    Expires: -1
    Set-Cookie: JSESSIONID=41C4EA0FDBAB389A7F904935A283566A; Path=/v2.0; Secure
    Content-Type: application/xml
    Content-Length: 537
    Date: Sun, 11 Sep 2011 21:18:37 GMT
     
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
    <accessKeys xmlns="http://docs.openstack.org/identity/api/ext/hp/v1.0" xmlns:ns2="http://docs.openstack.org/identity/api/v2.0" xmlns:ns3="http://www.w3.org/2005/Atom">
       <accessKey accessKeyId="98XM1KSN7BC2C88U9999" userId="000000003002" domainId="000000001001" status="inactive" validFrom="2011-09-08T16:43:56.000-07:00" validTo="2021-09-05T16:43:56.000-07:00" createdOn="2011-09-11T14:18:34.736-07:00">
          <algorithm>HmacSHA1</algorithm>
          <keyLength>64</keyLength>
       </accessKey>
    </accessKeys>

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation     |
| 403 | Forbidden | Disabled or suspended user making the request  |
| 404 | Not Found | Specified accesskeyId or userId not found   |
| 409 | Conflict | An access key already exists with the specified access key identifier |
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

Curl Example

    curl -k -X PUT -H "X-Auth-Token: HPAuth_1661578e273d107d38b732849173e00d0a60d46d9bc279bee31565fd39be48a8" -H "Content-Type: application/json" -H "Accept: application/json" "https://localhost:8443/v2.0/HP-IDM/v1.0/accesskeys" -d '{"accessKeys": {
       "anies": null,
       "accessKey":    [
                {
             "algorithm": "HmacSHA1",
             "keyLength": 64,
             "secretKey": "hNi0oiTU2sH",
             "accessKeyId": "V7TEGGSZZ4NJK9UR4998",
             "createdOn": 1316712986234,
             "domainId": "11180052618906",
             "otherAttributes": {},
             "status": "inactive",
             "userId": "84463950217213",
             "validFrom": 1316712986000,
             "validTo": 1632072986000
          },
                {
             "algorithm": "HmacSHA1",
             "keyLength": 64,
             "secretKey": "DBWjcUCMEED",
             "accessKeyId": "RVWVEGE88EHZBSBMJ999",
             "createdOn": 1316724920250,
             "domainId": "11180052618906",
             "otherAttributes": {},
             "status": "inactive",
             "userId": "84463950217213",
             "validFrom": 1316724920000,
             "validTo": 1632084920000
          }
        ],
       "otherAttributes": {}
    }}'
    

**Additional Notes**


#### 3.4.3.6 Update User Access Key#### {#update_user_access_key}
#### PUT /HP-IDM/v1.0/accesskeys/{accesskeyId}

Update a user access key. This method may be used to modify the key status only.

**Request Data**

The accesskeyId url path parameter is required. The userId query parameter is optional. If the userId parameter is not specified then it defaults to the user identifer of the requester.

**URL Parameters**

* *accesskeyId* - URL path parameter - user access key identifier.
* *userId* (Optional) - Query Parameter - user identifier string. Defaults to user identifier of the requester if not specified.

**Data Parameters**

See schema file for more details on the request and response data structure.

* *status* - {data type} - Key status. One of the values (active, inactive).

A valid token must be present in the *X-Auth-Token* HTTP header. Otherwise, a 401 will be returned.

JSON

    PUT https://localhost:8443/v2.0/HP-IDM/v1.0/accesskeys/KNGTV6EFKLPYE8LXF4VL HTTP/1.1
    Accept-Encoding: gzip,deflate
    Accept: application/json
    Content-Type: application/json
    X-Auth-Token: HPAuth_4e7bba89e4b0600fec3d2a3a
    User-Agent: Jakarta Commons-HttpClient/3.1
    Host: localhost:8443
    Content-Length: 51
     
    {
      "accessKey" : {
        "status" : "inactive"
      }
    }

XML

    PUT https://localhost:8443/v2.0/HP-IDM/v1.0/accesskeys/2SL748X97NEP7B6MVXPS HTTP/1.1
    Accept-Encoding: gzip,deflate
    Accept: application/xml
    Content-Type: application/xml
    X-Auth-Token: HPAuth_4e6ab9fde4b06fe4272ee23e
    User-Agent: Jakarta Commons-HttpClient/3.1
    Host: localhost:8443
    Content-Length: 146
     
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
    <accessKey status="inactive" xmlns="http://docs.openstack.org/identity/api/ext/hp/v1.0"/>

**Success Response**

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
    Content-Length: 345
    Date: Thu, 22 Sep 2011 22:47:17 GMT
     
    {
      "accessKey" : {
        "algorithm" : "HmacSHA1",
        "keyLength" : 64,
        "accessKeyId" : "KNGTV6EFKLPYE8LXF4VL",
        "createdOn" : 1316714474259,
        "domainId" : "00000000001001",
        "otherAttributes" : {
        },
        "status" : "inactive",
        "userId" : "00000000003002",
        "validFrom" : 1316714474000,
        "validTo" : 1632074474000
      }
    }

XML

    HTTP/1.1 200 OK
    Server: Apache-Coyote/1.1
    Cache-Control: no-cache
    Pragma: no-cache
    Expires: -1
    Set-Cookie: JSESSIONID=4D3047BA05428AD806C48E269C8DD8B4; Path=/v2.0; Secure
    Content-Type: application/xml
    Content-Length: 416
    Date: Sat, 10 Sep 2011 01:16:12 GMT
     
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?><accessKey xmlns="http://docs.openstack.org/identity/api/ext/hp/v1.0" accessKeyId="2SL748X97NEP7B6MVXPS" userId="000000003002" domainId="000000001001" status="inactive" validFrom="2011-09-08T15:20:20.000-07:00" validTo="2021-09-05T15:20:20.000-07:00" createdOn="2011-09-08T15:20:20.275-07:00"><algorithm>HmacSHA1</algorithm><keyLength>64</keyLength></accessKey>

**Error Response**

**Status Code**

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation     |
| 403 | Forbidden | Disabled or suspended user making the request  |
| 404 | Not Found | Specified accesskeyId or userId not found   |
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

Curl Example

    curl -k -X PUT -H "X-Auth-Token: HPAuth_1661578e273d107d38b732849173e00d0a60d46d9bc279bee31565fd39be48a8" -H "Content-Type: application/json" -H "Accept: application/json" "https://localhost:8443/v2.0/HP-IDM/v1.0/accesskeys/V7TEGGSZZ4NJK9UR4998" -d '{
      "accessKey" : {
        "status" : "active"
      }
    }'

**Additional Notes**

---
