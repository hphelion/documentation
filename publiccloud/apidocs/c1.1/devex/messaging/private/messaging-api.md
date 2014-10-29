---
layout: public-cloud
permalink: /api/devex/messaging/
title: HP Cloud Management Console Messaging API
description: "Management Console Messaging API documentation."
keywords: "Messaging, MessagePub, MessageHub"
product: devex-messaging
private: true
---
<!--UNDER REVISION-->

# HP Cloud v13.5 Management Console Messaging API Overview


The Management Console Messaging API is a lightweight messaging platform for the exchange of messages between the  

 that allows for messaging targeted at both the Network Operations Center (NOC) and the Support group to initiate messages to HPCS clients and HP Cloud Admin users. These messages will target Management Console users via the web UI.

The HP Cloud Message Hub is a lightweight message subscription platform that allows the Network Operations Center (NOC) and the Support group to retrieve archived messaging data.


## 1.1 API Maturity Level

**Maturity Level**: *Experimental*

**Version API Status**: *ALPHA*

---


# 2. Architecture View

Documentation for MessagePub is available on the [MessagePub](https://wiki.hpcloud.net/display/iaas/MessagePub+-+Message+Publishing) Wiki page.

Documentation for MessageHub is available on the [MessageHub](https://wiki.hpcloud.net/display/iaas/MessageHub+-+Message+Subscriptions) Wiki page.


---

# 3. Account-level View


## 3.1 Regions and Availability Zones

**Region(s)**: region-a

**Availability Zone(s)**: az-1

**Future Expansion**: region-b

---


# 4. REST API Specifications


## 4.1 Service API Operations

**Host**: https://mp.uswest.hpcloud.net

**BaseUri**: /

| Resource | Operation                 | HTTP Method           | Path                   | JSON/XML Support? | Privilege Level |
| :------- | :------------------------ | :----------           | :--------------------- | :---------------- | :-------------: |
| Public Platform Alert | [Create a new Platform Alert](#create_platform_alert) | POST | {BaseURI}/api/pm/public/platform/alert | Y/N | L3 Support Role |
| Public Platform Status | [Create a new Public Platform Status](#create_public_platform_status) | POST | {BaseURI}/api/pm/public/platform/status | Y/N | L3 Support Role |
| Private Platform Status | [Create a new Private Platform Status](#create_private_platform_status) | POST | {BaseURI}/api/pm/private/platform/status | Y/N | L3 Support Role |
| Private Platform | [Retrieve all Private Platform messages](#get_private_platform) | GET | {BaseURI}/api/pm/private/platform | Y/N | HP Cloud Domain |
| Private Platform Alert | [Retrieve all Private Platform Alert messages](#get_private_platform_alert) | GET | {BaseURI}/api/pm/private/platform/alert | Y/N | HP Cloud Domain |
| Private Platform Status | [Retrieve all Private Platform Status messages](#get_private_platform_status) | GET | {BaseURI}/api/pm/private/platform/status | Y/N | HP Cloud Domain |
| Public Platform | [Retrieve all Public Platform messages](#get_public_platform) | GET | {BaseURI}/api/pm/public/platform | Y/N | None |
| Public Platform Alert | [Retrieve all Public Platform Alert messages](#get_public_platform_alert) | GET | {BaseURI}/api/pm/public/platform/alert | Y/N | None |
| Public Platform Status | [Retrieve all Public Platform Status messages](#get_public_platform_status) | GET | {BaseURI}/api/pm/public/platform/status | Y/N | None |



## 4.2 Common Request Headers

    Accept: application/json
    Content-Type: application/json
    X-Auth-Token:HPAuth_XXXXX


## 4.3 Common Response Headers

    Content-Type: application/json
    Content-Length: 2940
    Connection: keep-alive
    Server: thin 1.5.0 codename Knife


## 4.4 Service API Operation Details




### 4.4.1 Public Platform Alert

The Public Platform Alert provides critical platform feedback to both internal and external users of the Management Console.
More information is on the wiki - [Messaging Characteristics](https://wiki.hpcloud.net/display/iaas/Messaging+Characteristics)


**Status Lifecycle**

N/A

**Rate Limits**

N/A

**Quota Limits**

N/A

**Business Rules**

None.

#### 4.4.1.1 Create a Platform Alert {#create_platform_alert}
#### POST /api/public/platform/alert

The creation of a Platform Alert will post a message containing a title and message content to this Publish API. The API will drop the message onto the RabbitMQ messaging cluster where it will be consumed by connected Management Console clients and saved to a database for archival purposes.

**Data Parameters**

* title - string - brief title of the message to convey significance
* message - string - message to be sent

JSON

```
{ :title => 'Test Message',
  :message => 'This is a <strong>test</strong> message'
}
```

**Success Response**

**Status Code**

200 - OK

**Response Data**

A successful response does not require a response body.

**Error Response**

**Status Code**

400 - Malformed request, normally because of missing required data.  
401 - Unauthorized access has been attempted.  
500 - Internal Server Error of an unspecified nature.  

**Response Data**

JSON - 400 Exception example

    {"PlatformAlertException": {"message": "Malformed Request - missing message title.", "code": 400}}

JSON - 401 Exception example

    {"PlatformAlertException": {"message": "Unauthorized Request - invalid CS token.", "code": 401}}
    {"PlatformAlertException": {"message": "Unauthorized Request - user doesn't have sufficient access to perform this operation.", "code": 401}}

JSON - 500 Exception example

    {"PlatformAlertException": {"message": "Server Error of an unknown nature.", "code": 500}}

**Curl Example**

Here's an example in the RDD environment:

    curl -v -H "Accept=application/vnd.messagepub-v1+json" \
         -H "Content-Type: application/json" \
         -H "X-Auth-Token: <HPAuthToken>" \
         -X POST \
         -d '{"title":"public platform alert test message","message":"public platform alert test message"}' \
         https://mp.rndd.aw1.hpcloud.net/api/pm/public/platform/alert

**Additional Notes**

The 'message' attribute can include a number of HTML markup tags. A whitelist of allowed tags are noted on the [HPCS Wiki](https://wiki.hpcloud.net/display/iaas/Messaging+-+Markup+Tags+Whitelist).

A 400 exception will be thrown if the content length of the request exceeds 4096 characters.




### 4.4.2 Public Platform Status

The Public Platform Status provides platform status information to all users of the Management Console.
More information is on the wiki - [Messaging Characteristics](https://wiki.hpcloud.net/display/iaas/Messaging+Characteristics)


**Status Lifecycle**

N/A

**Rate Limits**

N/A

**Quota Limits**

N/A

**Business Rules**

None.

#### 4.4.2.1 Create a Public Platform status {#create_public_platform_status}
#### POST /api/pm/public/platform/status


The creation of a Public Platform Status message will post a message containing a title and message content to this API. The API will drop the message onto the RabbitMQ messaging cluster where it will be consumed by connected Management Console clients and saved to a database for archival purposes.

**Request Data**

**URL Parameters**

None.

**Data Parameters**

* title - string - brief title of the message to convey significance
* message - string - message to be sent

JSON

    { :title => 'Test Message',
      :message => 'This is a <strong>test</strong> message'
    }

**Success Response**

**Status Code**

200 - OK

**Response Data**

A successful response does not require a response body.

**Error Response**

**Status Code**

400 - Malformed request, normally because of missing required data.  
401 - Unauthorized access has been attempted.  
500 - Internal Server Error of an unspecified nature.

**Response Data**

JSON - 400 Exception example

    {"PlatformStatusException": {"message": "Malformed Request - missing message title.", "code": 400}}

JSON - 401 Exception example

    {"PlatformStatusException": {"message": "Unauthorized Request - invalid CS token.", "code": 401}}
    {"PlatformStatusException": {"message": "Unauthorized Request - user doesn't have sufficient access to perform this operation.", "code": 401}}

JSON - 500 Exception example

    {"PlatformStatusException": {"message": "Server Error of an unknown nature.", "code": 500}}

**Curl Example**

Here's an example in the RDD environment:

    curl -v -H "Accept=application/vnd.messagepub-v1+json" \
         -H "Content-Type: application/json" \
         -H "X-Auth-Token: <HPAuthToken>" \
         -X POST \
         -d '{"title":"public platform status test message","message":"public platform status test message"}' \
         https://mp.rndd.aw1.hpcloud.net/public/platform/status

**Additional Notes**

The 'message' attribute can include a number of HTML markup tags. A whitelist of allowed tags are noted on the [HPCS Wiki](https://wiki.hpcloud.net/display/iaas/Messaging+-+Markup+Tags+Whitelist).

A 400 exception will be thrown if the content length of the request exceeds 4096 characters.




### 4.4.3 Private Platform Status

The Private Platform Status provides platform status information to all HPCS users of the Management Console.
More information is on the wiki - [Messaging Characteristics](https://wiki.hpcloud.net/display/iaas/Messaging+Characteristics)


**Status Lifecycle**

N/A

**Rate Limits**

N/A

**Quota Limits**

N/A

**Business Rules**

None.

#### 4.4.3.1 Create a Private Platform Status {#create_private_platform_status}
#### POST /api/pm/private/platform/status

The creation of a Private Platform Status message will post a message containing a title and message content to this API. The API will drop the message onto the RabbitMQ messaging cluster where it will be consumed by connected Management Console clients and saved to a database for archival purposes.

**Request Data**

**URL Parameters**

None.

**Data Parameters**

* title - string - brief title of the message to convey significance
* message - string - message to be sent

JSON

    { :title => 'Test Message',
      :message => 'This is a <strong>test</strong> message'
    }

**Success Response**

**Status Code**

200 - OK

**Response Data**

A successful response does not require a response body.

**Error Response**

**Status Code**

400 - Malformed request, normally because of missing required data.  
401 - Unauthorized access has been attempted.  
500 - Internal Server Error of an unspecified nature.

**Response Data**

JSON - 400 Exception example

    {"PlatformStatusException": {"message": "Malformed Request - missing message title.", "code": 400}}

JSON - 401 Exception example

    {"PlatformStatusException": {"message": "Unauthorized Request - invalid CS token.", "code": 401}}
    {"PlatformStatusException": {"message": "Unauthorized Request - user doesn't have sufficient access to perform this operation.", "code": 401}}

JSON - 500 Exception example

    {"PlatformStatusException": {"message": "Server Error of an unknown nature.", "code": 500}}

**Curl Example**

Here's an example in the RDD environment:


    curl -v -H "Accept=application/vnd.messagepub-v1+json" \
         -H "Content-Type: application/json" \
         -H "X-Auth-Token: <HPAuthToken>" \
         -X POST \
         -d '{"title":"private platform status test message","message":"private platform status private test message"}' \
         https://mp.rndd.aw1.hpcloud.net/private/platform/status

**Additional Notes**

The 'message' attribute can include a number of HTML markup tags. A whitelist of allowed tags are noted on the [HPCS Wiki](https://wiki.hpcloud.net/display/iaas/Messaging+-+Markup+Tags+Whitelist).

A 400 exception will be thrown if the content length of the request exceeds 4096 characters.




### 4.4.4 Public Platform

Public Platform messages represents raw message data for messages targeted towards public/external users of the Management Console.


**Status Lifecycle**

N/A

**Rate Limits**

N/A

**Quota Limits**

N/A

**Business Rules**

None.

#### 4.4.4.1 Get Public Platform {#get_public_platform}
#### GET /api/pm/public/platform

Returns all the public platform alert and status messages.

**Request Data**

    GET /api/pm/public/platform HTTP/1.1
    Accept: application/json
    Content-Type: application/json
    X-Auth-Token:HPAuth_XXXXX

**URL Parameters**

None.

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

Header

    HTTP/1.1 200 OK
    Content-Type: application/json
    Content-Length: 2940
    Connection: keep-alive
    Server: thin 1.5.0 codename Knife

JSON Body

    [
        {
        "_id":"5112ac8834ce3857d500000c", 
        "created_at":"2013-02-06T19:18:32+00:00", 
        "message":"Platform alert test message.", 
        "scope":"public", 
        "title":"Alert Message", 
        "type":"platform_alert"
        }, 
        {
        "_id":"51155e0b34ce3857d500000d", 
        "created_at":"2013-02-08T20:20:27+00:00", 
        "message":"Platform status test message.", 
        "scope":"public", 
        "title":"Status Message", 
        "type":"platform_status"
        }
    ]

**Error Response**
<!---
*Enumerate all the possible error status codes and any content that is returned.*
-->

**Status Code**

500 - Internal Server Error of an unspecified nature.

**Response Data**

JSON - 500 Exception example

    {"message": "Server Error of an unknown nature.", "code": 500}

**Curl Example**

Here's an example in the RDD environment:

    curl -v -H "Accept=application/vnd.messagehub-v1+json" 
            -H X-Auth-Token:<HPAuthToken> 
            https://mp.rndd.aw1.hpcloud.net/api/pm/public/platform


**Additional Notes**
<!---
*Specify any inconsistencies, ambiguities, issues, commentary or discussion relevant to the call.*
-->

None.


#### 4.4.4.2 Get Public Platform Alert
#### GET /api/pm/public/platform/alert {#get_public_platform_alert}

Returns all the public platform alert messages.

**Request Data**

    GET /api/pm/public/platform HTTP/1.1
    Accept: application/json
    Content-Type: application/json
    X-Auth-Token:HPAuth_XXXXX

**URL Parameters**

None.

**Data Parameters**

None.

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

Header

    GET /api/pm/public/platform HTTP/1.1
    Accept: application/json
    Content-Type: application/json
    X-Auth-Token:HPAuth_XXXXX

JSON Body

    [
        {
        "_id":"5112ac8834ce3857d500000c", 
        "created_at":"2013-02-06T19:18:32+00:00", 
        "message":"Platform alert test message.", 
        "scope":"public", 
        "title":"Alert Message", 
        "type":"platform_alert"
        }
    ]

**Error Response**

**Status Code**

500 - Internal Server Error of an unspecified nature.

**Response Data**

JSON - 500 Exception example


    {"message": "Server Error of an unknown nature.", "code": 500}


**Curl Example**

Here's an example in the RDD environment:

    curl -v -H "Accept=application/vnd.messagehub-v1+json"
            -H X-Auth-Token:<HPAuthToken>
            https://mp.rndd.aw1.hpcloud.net/api/pm/public/platform/alert


**Additional Notes**

None.


#### 4.4.4.3 Get Public Platform Status {#get_public_platform_status}
#### GET /api/pm/public/platform/status

Returns all the public platform status messages.

**Request Data**

    GET /api/pm/public/platform HTTP/1.1
    Accept: application/json
    Content-Type: application/json
    X-Auth-Token:HPAuth_XXXXX

**URL Parameters**

None.

**Data Parameters**

None.

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

Header

    GET /api/pm/public/platform HTTP/1.1
    Accept: application/json
    Content-Type: application/json
    X-Auth-Token:HPAuth_XXXXX

JSON Body

    [
        {
        "_id":"51155e0b34ce3857d500000d", 
        "created_at":"2013-02-08T20:20:27+00:00", 
        "message":"Platform status test message.", 
        "scope":"public", 
        "title":"Status Message", 
        "type":"platform_status"
        }
    ]

**Error Response**

**Status Code**

500 - Internal Server Error of an unspecified nature.

**Response Data**

JSON - 500 Exception example

    {"message": "Server Error of an unknown nature.", "code": 500}

**Curl Example**

Here's an example in the RDD environment:

    curl -v -H "Accept=application/vnd.messagehub-v1+json"
            -H "X-Auth-Token:<HPAuthToken>"
            https://mp.rndd.aw1.hpcloud.net/api/pm/public/platform/status

**Additional Notes**

None.


### 4.4.5 Private Platform

Public Platform messages represents raw message data for messages targeted towards public/internal users of the Cloud Admin Console.

**Status Lifecycle**

N/A

**Rate Limits**

N/A

**Quota Limits**

N/A

**Business Rules**

None.

#### 4.4.5.1 Get Private Platform {#get_private_platform}
#### GET /api/pm/private/platform

Returns all the private platform alert and status messages.

**Request Data**

    GET /api/pm/public/platform HTTP/1.1
    Accept: application/json
    Content-Type: application/json
    X-Auth-Token:HPAuth_XXXXX

**URL Parameters**

None.

**Data Parameters**

None.

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

Header

    GET /api/pm/public/platform HTTP/1.1
    Accept: application/json
    Content-Type: application/json
    X-Auth-Token:HPAuth_XXXXX

JSON Body

    [
        {
        "_id":"5112ac8834ce3857d500000c", 
        "created_at":"2013-02-06T19:18:32+00:00", 
        "message":"Platform alert test message.", 
        "scope":"private", 
        "title":"Alert Message", 
        "type":"platform_alert"
        }, 
        {
        "_id":"51155e0b34ce3857d500000d", 
        "created_at":"2013-02-08T20:20:27+00:00", 
        "message":"Platform status test message.", 
        "scope":"private", 
        "title":"Status Message", 
        "type":"platform_status"
        }
    ]

**Error Response**

**Status Code**

500 - Internal Server Error of an unspecified nature.  
401 - Unauthorized access has been attempted.

**Response Data**

JSON - 401 Exception example

    {"message": "Unauthorized Request - invalid CS token.", "code": 401}

JSON - 500 Exception example

    {"message": "Server Error of an unknown nature.", "code": 500}

**Curl Example**

Here's an example in the RDD environment:

    curl -v -H "Accept=application/vnd.messagehub-v1+json"
            -H "X-Auth-Token:<HPAuthToken>"
            https://mp.rndd.aw1.hpcloud.net/api/pm/private/platform

**Additional Notes**

None.


#### 4.4.5.2 Get Private Platform Alert {#get_private_platform_alert}
#### GET /api/pm/private/platform/alert

Returns all the private platform alert messages.

**Request Data**

    GET /api/pm/public/platform HTTP/1.1
    Accept: application/json
    Content-Type: application/json
    X-Auth-Token:HPAuth_XXXXX

**URL Parameters**

None.

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

Header

    GET /api/pm/public/platform HTTP/1.1
    Accept: application/json
    Content-Type: application/json
    X-Auth-Token:HPAuth_XXXXX

JSON Body

    [
        {
        "_id":"5112ac8834ce3857d500000c", 
        "created_at":"2013-02-06T19:18:32+00:00", 
        "message":"Platform alert test message.", 
        "scope":"private", 
        "title":"Alert Message", 
        "type":"platform_alert"
        }
    ]

**Error Response**

**Status Code**

500 - Internal Server Error of an unspecified nature.  
401 - Unauthorized access has been attempted.

**Response Data**

JSON - 401 Exception example

    {"message": "Unauthorized Request - invalid CS token.", "code": 401}

JSON - 500 Exception example

    {"message": "Server Error of an unknown nature.", "code": 500}

**Curl Example**

Here's an example in the RDD environment:

    curl -v -H "Accept=application/vnd.messagehub-v1+json"
            -H "X-Auth-Token:<HPAuthToken>"
            https://mp.rndd.aw1.hpcloud.net/api/pm/private/platform/alert

**Additional Notes**

None.


#### 4.4.5.3 Get Private Platform Status {#get_private_platform_status}
#### GET /api/pm/private/platform/status

Returns all the private platform status messages.

**Request Data**

    GET /api/pm/public/platform HTTP/1.1
    Accept: application/json
    Content-Type: application/json
    X-Auth-Token:HPAuth_XXXXX

**URL Parameters**

None.

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

Header

    GET /api/pm/public/platform HTTP/1.1
    Accept: application/json
    Content-Type: application/json
    X-Auth-Token:HPAuth_XXXXX

JSON Body

    [ 
        {
        "_id":"51155e0b34ce3857d500000d", 
        "created_at":"2013-02-08T20:20:27+00:00", 
        "message":"Platform status test message.", 
        "scope":"private", 
        "title":"Status Message", 
        "type":"platform_status"
        }
    ]

**Error Response**

**Status Code**

500 - Internal Server Error of an unspecified nature.  
401 - Unauthorized access has been attempted.

**Response Data**

JSON - 401 Exception example

    {"message": "Unauthorized Request - invalid CS token.", "code": 401}

JSON - 500 Exception example

    {"message": "Server Error of an unknown nature.", "code": 500}

**Curl Example**

Here's an example in the RDD environment:

    curl -v -H "Accept=application/vnd.messagehub-v1+json"
            -H "X-Auth-Token:<HPAuthToken>"
            https://mp.rndd.aw1.hpcloud.net/api/pm/private/platform/status

**Additional Notes**

None.

---


# 5. Additional References

## 5.1 Resources

**Wiki Page**:

https://wiki.hpcloud.net/display/iaas/MessagePub+-+Message+Publishing
https://wiki.hpcloud.net/display/iaas/Implementation+Phases+and+Scope
https://wiki.hpcloud.net/display/iaas/Messaging+Characteristics
https://wiki.hpcloud.net/display/iaas/Messaging+-+Markup+Tags+Whitelist
https://wiki.hpcloud.net/display/iaas/MessageHub+-+Message+Subscriptions

**Code Repo**:

https://git.hpcloud.net/ManagementConsole/message_pub.git

**API Lead Contacts**:

Chris Johnson (wchrisjohnson@hp.com)  
Travis Longoris (travis.longoria@hp.com)

---

# 6. Glossary
<!---
{Put down definitions of terms and items that need explanation.}
-->

---
