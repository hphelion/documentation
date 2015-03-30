---
layout: page
permalink: /publiccloud/api/lbaas/
title: "HP Helion Public Cloud Load Balancer Service API"
description: "HP Helion Public Cloud Load Balancer Service API Specification"
keywords: "lbaas,loadbalancer"
product: lbaas

---
<!--PUBLISHED-->
# HP Helion Public Cloud Load Balancer Service API

**Date:** March 2015

**Document Version:** 1.2

## 1. Overview

This guide is intended for software developers who wish to create applications using the HP Helion Public Cloud Load Balancer as a Service (LBaaS) set of APIs. It assumes the reader has a general understanding of cloud APIs, load balancing concepts, RESTful web services, HTTP/1.1 conventions and JSON serialization formats. The LBaaS set of APIs utilize and take advantage of a variety of Openstack cloud API patterns which are described in detail.

We will be referring to HP Helion Public Cloud Load Balancer in this document as simply Load Balancer.

### 1.1 API Maturity Level

This API definition represents the Load Balancer as a Service (LBaaS) in Beta release form. 

**Maturity Level**: *Exploratory* (Load Balancer service is currently in Private Beta)

**Service activation required, please refer to the LBaaS service information on hpcloud.com for instructions on how to request activation for your account.**

**Version API Status**: *BETA*

### 1.2 Document Revision History ###

| Document Version| Date | Description |
| :-------- | :------------ | :------ |
| 1.0 | April 2014 | Initial entry |
| 1.1 | May 2014 | HP Helion updates |
| 1.2 | March 2015 | Updates for new Netscaler offering |

## 2. Architecture View
### 2.1 Overview

The Load Balancer as a Service (LBaaS) is a set of APIs that provide a RESTful interface for the creation and management of load balancers in the cloud. Currently only application servers hosted in the HP Helion Public Cloud are supported. The LBaaS APIs defined are integrated within the HP Helion API ecosystem including integration with the Identity management system, billing and monitoring systems.

### 2.2 Conceptual/Logical Architecture View

To use the Load Balancers API effectively, you should understand several key concepts.

#### 2.2.1 Load Balancer

A load balancer is a logical device. It is used to distribute workloads between multiple back-end systems or services called 'nodes', based on the criteria defined as part of its configuration.

#### 2.2.2 Virtual IP Address

A virtual IP address is an Internet Protocol (IP) address configured on the load balancer for use by clients connecting to a service that is load balanced. Incoming connections and requests are distributed to back-end nodes based on the configuration of the load balancer.  The load balancer Virtual IP address will need to be registered with the appropriate DNS domain record in order for users to access the nodes via a domain name-based URL.

#### 2.2.3 Node

A node is a back-end device providing a service, like a web or file server, on a specified IP and port.

The nodes defined by the load balancer are responsible for servicing the requests received through the load balancers virtual IP. By default, the load balancer employs a basic health check that ensures the node is listening on its defined port. The node is checked at the time of addition and at regular intervals as defined by the load balancer health check configuration. If a back-end node is not listening on its port or does not meet the conditions of the defined active health check for the load balancer, then the load balancer will not forward connections or requests to it and its status will be listed as OFFLINE. Only nodes that are in an ONLINE status will receive and be able to service traffic from the load balancer.

The IP address of a node is restricted to the IP address range of Compute instances.  An attempt to use a node outside this range will result in a 400 error in an API call.

#### 2.2.4 Health Monitor

A health monitor is a configurable, active monitoring operation that exists for all load balancer nodes. In addition to the basic health checks, active health monitoring operations periodically check your back-end nodes to ensure they are responding correctly. 

Active health monitoring offers two choices for the type of monitor it can provide:

- CONNECT monitoring is the most basic type of health check and it does not perform post-processing or protocol specific health checks. 

- HTTP monitoring, on the other hand, is more intelligent and it is capable of processing HTTP responses to determine the condition of a node. 
For both options, a user may configure the time delay between monitoring checks, the timeout period for a connection to a node, the number of attempts before removing a node from rotation and for HTTP monitoring, the HTTP path to test.

Active health monitoring, by default is configured to use CONNECT type monitoring with a 30 second delay, 30 second timeout, and 2 retries, and it cannot be disabled. The caller may configure one health monitor per load balancer and the same configuration is used to monitor all of the back-end nodes.

### 2.3 Infrastructure Architecture View

LBaaS fits into the HP Helion ecosystem of APIs by utilizing the same common authentication mechanisms as other HP Helion services. In order to use LBaaS, a user account must have activated "Load Balancer" service. All API calls require a valid HP Helion authentication token.

## 3. Account-level View 

Once the account is activated, the LBaaS service will show up in the service catalog returned during user login. In addition, LBaaS endpoints to be used will also be presented. Availability zone information may vary based on region.

### 3.1 Service Catalog

Once a user authenticates using the RESTful API, a service catalog will list the availability of the LBaaS service, roles and endpoints for the region you have logged into and in which you are activated for.

*The following is an example of LBaaS service information within the service catalog including roles and endpoints:* 

	"serviceCatalog": [
		{
			region_id: "region-a.geo-1.private-beta"
			links: {
			self: "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/2201_P"
		}
			url: "https://region-a.geo-1.ns-load-balancer.hpcloudsvc.com/v1.1"
			region: "region-a.geo-1.private-beta"
			interface: "public"
			service_Id: "220"
			id: "2201_P"
		}
		{
			region_id: "region-b.geo-1.private-beta"
			links: {
			self: "https://region-b.geo-1.identity.hpcloudsvc.com:35357/v3/endpoints/2204_P"
		}
			url: "https://region-b.geo-1.ns-load-balancer.hpcloudsvc.com/v1.1"
			region: "region-b.geo-1.private-beta"
			interface: "public"
			service_Id: "220"
			id: "2204_P"
		}
	    ]

## 4. General API Information 

This section describes operations and guidelines that are common to all LBaaS APIs.

### 4.1 Authentication

The LBaaS API uses standard defined by OpenStack Keystone project and used by the HP Helion for authentication. Please refer to the Identity service for more details on all authentication methods currently supported.

### 4.2 Service Access/Endpoints

As shown in the example above, logging into your region will provide you with the appropriate LBaaS endpoints to use. In addition, all supported versions are published within the service catalog. A client may choose to use any LBaaS API version listed.

### 4.3 Request/Response Types

The LBaaS API currently only supports JSON data serialization formats for request and response bodies. The request format is specified using the 'Content-Type' header and is required for operations that have a request body. The response format should be specified in requests using the 'Accept' header. If no response format is specified, JSON is the default.

### 4.4 Persistent Connections

By default, the API supports persistent connections via HTTP/1.1 keep-alives. All connections will be kept alive unless the connection header is set to close. In adherence with the IETF HTTP RFCs, the server may close the connection at any time and clients should not rely on this behavior.

### 4.5 Absolute Limits

Absolute limits are limits which prohibit a user from creating too many LBaaS resources. For example, 'maxNodesPerLoadbalancer' identifies the total number of nodes that may be associated with a given load balancer. Limits for a specific tenant may be queried for using the 'GET /limits' API. This will return the limit values which apply to the tenant who made the request.

| Limited Resource | Description |
| :------ | :------- |
| maxLoadBalancers | Maximum number of load balancers allowed for this tenant |
| maxNodesPerLoadBalancer | Maximum number of nodes allowed for each load balancer |
| maxLoadBalancerNameLength | Maximum length allowed for a load balancer name |
| maxVIPsPerLoadBalancer | Maximum number of Virtual IPs for each load balancer |

### 4.6 Faults

When issuing a LBaaS API request, it is possible that an error can occur. In these cases, the system will return an HTTP error response code denoting the type of error and a LBaaS response body with additional details regarding the error. Specific HTTP status codes possible are listed in each API definition.

*The following JSON message represents the JSON response body used for all faults:*

	{
	   "message":"Description of fault",
	   "details":"Details of fault",
	   "code": HTTP standard error status
	}

### 4.7 Specifying Project/Tenant IDs

Project/Tenant identifiers with LBaaS API URIs are not required. The project/tenant identifier is derived from the Openstack Keystone authentication token provided with each API call. This simplifies the REST URIs to only include the base URI and the resource. The project/tenant identifier is derived from the authentication token which is provided with the API call. All LBaaS calls behave in this manner.

### 4.8 HTTPS Support

End-to-end HTTPS protocol support is currently provided by the TCP load balancer option. HTTPS-based traffic will flow between end-users and application server nodes via the TCP load balancer connection.  

What is *required* to support HTTPS via a TCP load balancer:

- The same SSL certificate needs to be installed on each application server node.
- The same private key needs to be installed on each application server node.
- The SSL certificate needs to reference the load balancer either via the registered domain name or via the Virtual IP address of the load balancer.

What is currently ***not*** supported:

- SSL certificate termination on the load balancer
- HTTPS/SSL session affinity or "stickyness"

### 4.9 Load Balancer Default Settings

The following are the non-configurable, default load balancer settings.

| Setting | Value |
| :------ | :------ |
| TCP | Ports 443, 8443 are supported. |
| HTTP | Ports 80, 8080, 8088 are supported. |
| TCP Sessions | Source-IP Affinity turned ON by default. No current option to turn this function OFF. |
| HTTP Sessions | Session Persistence is turned ON by default. The session persistent cookie name is SERVERID and the contents will be "id-xxxxx" where the x value will be the load balancer node ID.  No current option to turn this function OFF or edit the default HTTP cookie for this function. |
| HTTP X-Forwarded-For (XFF) | On by default |
| Assignable IP Addresses | Only Compute service IP range; no support for external IP addresses for nodes. |

## 5. REST API Specifications

The following is a summary of all supported LBaaS API resources and methods. Each resource and method is defined in detail in the subsequent sections. 

**Host**:   
US West - https://region-a.geo-1.ns-load-balancer.hpcloudsvc.com   
US East - https://region-b.geo-1.ns-load-balancer.hpcloudsvc.com

**BaseURI**: {Host}

**Derived resource identifiers:**

**{loadbalancerId}** is the unique identifier for a load balancer returned by the LBaaS service.

**{nodeId}** is the unique identifier for a load balancer node returned by the LBaaS service.

### 5.1 Service API Operations
#### 5.1.1 LBaaS API Summary Table

| Resource | Operation | Method | Path |
| :------ | :------ | :------ | :------ |
| Versions | [Get specific API version](#api-version) | GET | /v1.1/ |
| Limits | [Get list of LBaaS limits](#api-limits) | GET | /v1.1/limits |
| Protocols | [Get list of supported protocols](#api-protocols) | GET | /v1.1/protocols |
| Algorithms | [Get list of supported algorithms](#api-algorithms) | GET    |/v1.1/algorithms |
| Load Balancer | [Get list of all load balancers](#api-list) | GET |/v1.1/loadbalancers |
| Load Balancer | [Get load balancer details](#api-status) | GET |/v1.1/loadbalancers/{loadbalancerId} |
| Load Balancer |[Create a new load balancer](#api-create) | POST   |/v1.1/loadbalancers |
| Load Balancer |[Update load balancer attributes](#api-modify) | PUT    |/v1.1/loadbalancers/{loadbalancerId} |
| Load Balancer |[Delete an existing load balancer](#api-delete) | DELETE |/v1.1/loadbalancers/{loadbalancerId} |
| Node |[Get list of load balancer nodes](#api-node-list) | GET    |/v1.1/loadbalancers/{loadbalancerId}/nodes |
| Node |[Get a specific load balancer node](#api-node-status) | GET    |/v1.1/loadbalancers/{loadbalancerId}/nodes/{nodeId} |
| Node |[Create a new load balancer node](#api-node-create) | POST   |/v1.1/loadbalancers/{loadbalancerId}/nodes |
| Node |[Update a load balancer node](#api-node-modify) | PUT    |/v1.1/loadbalancers/{loadbalancerId}/nodes/{nodeId} |
| Node |[Delete a load balancer node](#api-node-delete) | DELETE |/v1.1/loadbalancers/{loadbalancerId}/nodes/{nodeId} |
| Virtual IP |[Get list of virtual IPs](#api-vips) | GET |/v1.1/loadbalancers/{loadbalancerId}/virtualips |
| Health Monitor |[Get a load balancer monitor](#api-monitor-status) | GET    |/v1.1/loadbalancers/{loadbalancerId}/healthmonitor |
| Health Monitor |[Update a load balancer monitor](#api-monitor-modify) | PUT |/v1.1/loadbalancers/{loadbalancerId}/healthmonitor |
| Health Monitor |[Reset a load balancer monitor](#api-monitor-delete) | DELETE |/v1.1/loadbalancers/{loadbalancerId}/healthmonitor |

#### 5.1.2 Common Request Headers 

*HTTP standard request headers*

**Accept** - Internet media types that are acceptable in the response. LBaaS API supports the media type 'application/json'.

**Content-Length** - The length of the request body in octets (8-bit bytes).

**Content-Type** - The Internet media type of the request body. Used with POST and PUT requests. LBaaS API supports 'application/json'.

*Non-standard request headers*

**X-Auth-Token** - Identity service authorization token.

*Example*

	GET /v1.0/loadbalancers HTTP/1.1
	Host: system.hpcloudsvc.com
	Content-Type: application/json
	Accept: application/json
	X-Auth-Token: HPAuth_2895c13b1118e23d977f6a21aa176fd2bd8a10e04b74bd8e353216072968832a
	Content-Length: 85

#### 5.1.3 Common Response Headers 

*HTTP standard response headers*

**Content-Type** - Internet media type of the response body.

**Date** - The date and time that the response was sent.

*Example*

	HTTP/1.1 200 OK
	Content-Length: 1135
	Content-Type: application/json; charset=UTF-8
	Date: Tue, 30 Oct 2012 16:22:35 GMT

#### 5.2 Versions ####
##### 5.2.1 Get Specific LBaaS API Version Information ##### {#api-version}
##### GET /v1.1/

**Description**

This method allows querying the LBaaS service for information regarding a specific version of the LBaaS API. This method is also advertised within the Keystone service catalog which is presented upon user login.

**Request Data**

None required.

**Query Parameters Supported**

None required.

**Required HTTP Header Values**

X-Auth-Token

**Request Body**

None required.

**Normal Response Code**

|HTTP Status Code  |Description          |
|:-----------------|:--------------------|
|200               |OK                   |

**Response Body**

The response body contains information regarding a specific LBaaS API version.

**Error Response Codes**

|HTTP Status Code  |Description          |
|:-----------------|:--------------------|
|400               |Bad Request          |
|401               |Unauthorized         |
|404               |Not Found            |
|405               |Not Allowed          |
|500               |LBaaS Fault          |
|503               |Service Unavailable  |
**Curl Request**

	curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v1.1/

**Response**

	{
    "versions": [
        {
            "status": "CURRENT",
            "updated": "2012-12-18T18:30:02.25Z",
            "id": "v1.1",
            "links": [
                {
                    "href": "http://wiki.openstack.org/Atlas-LB",
                    "rel": "self"
                }
            ]
        }
    ]
	}

#### 5.3 Limits ####
##### 5.3.1 Get List of LBaaS API Limits ##### {#api-limits}
##### GET /v1.1/limits

**Description**

This method allows querying the LBaaS service for a list of API limits which apply on a tenant basis. Each tenant may not utilize LBaaS API resources exceeding these limits and will receive and over limit error if attempted (413).

| Returned Limit Name | Value |
| :------ | :------- |
| maxLoadBalancers | Maximum number of load balancers allowed for this tenant |
| maxNodesPerLoadBalancer | Maximum number of nodes allowed for each load balancer |
| maxLoadBalancerNameLength | Maximum length allowed for a load balancer name |
| maxVIPsPerLoadBalancer | Maximum number of Virtual IPs for each load balancer |

**Request Data**

None required.

**Query Parameters Supported**

None required.

**Required HTTP Header Values**

X-Auth-Token

**Request Body**

None required.

**Normal Response Code**

|HTTP Status Code  |Description          |
|:-----------------|:--------------------|
|200               |OK                   |

**Response Body**

The response body contains information regarding limits imposed for the tenant making the request.

**Error Response Codes**

|HTTP Status Code  |Description          |
|:-----------------|:--------------------|
|400               |Bad Request          |
|401               |Unauthorized         |
|404               |Not Found            |
|405               |Not Allowed          |
|500               |LBaaS Fault          |
|503               |Service Unavailable  |

**Curl Request**

	curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v1.1/limits

**Response**

	{
	"limits": {
        	"absolute": {
            		"values": {
                		"maxLoadBalancerNameLength": 128, 
                		"maxLoadBalancers": 20, 
                		"maxNodesPerLoadBalancer": 5, 
                		"maxVIPsPerLoadBalancer": 1
            			}
        		}
    		}
	}

#### 5.4 Protocols ####
##### 5.4.1 Get List of Supported LBaaS Protocols ##### {#api-protocols}
##### GET /v1.1/protocols

**Description**

All load balancers must be configured with the protocol of the service which is being load balanced. The protocol selection should be based on the protocol of the back-end nodes. The current specification supports HTTP (port 80/8080) and TCP (port 443/8443) services.  HTTPS traffic is supported currently via the TCP connection.  Support for SSL termination on the load balancer is not currently supported.

**Request Data**

None required.

**Query Parameters Supported**

None required.

**Required HTTP Header Values**

X-Auth-Token

**Request Body**

None required.

**Normal Response Code**

|HTTP Status Code  |Description          |
|:-----------------|:--------------------|
|200               |OK                   |

**Response Body**

The response body contains the currently supported protocols and port numbers.

**Error Response Codes**

|HTTP Status Code  |Description          |
|:-----------------|:--------------------|
|400               |Bad Request          |
|401               |Unauthorized         |
|404               |Not Found            |
|405               |Not Allowed          |
|500               |LBaaS Fault          |
|503               |Service Unavailable  |

**Curl Request**

	curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v1.1/protocols

**Response**

	{
    "protocols": [
        {
            "name": "HTTP",
            "port": 80
        },
        {
            "name": "HTTP",
            "port": 8080
        },
        {
            "name": "HTTP",
            "port": 8088
        },
        {
            "name": "TCP",
            "port": 443
        },
        {
            "name": "TCP",
            "port": 8443
        },
        {
            "name": "GALERA",
            "port": 3306
        }
    ]
	}

#### 5.5 Algorithms ####
##### 5.5.1 Get List Of Supported LBaaS Algorithms ##### {#api-algorithms}
##### GET /v1.1/algorithms

**Description**

All load balancers utilize an algorithm that defines how traffic should be directed between back end nodes. The default algorithm for newly created load balancers is ROUND_ROBIN, which can be overridden at creation time or changed after the load balancer has been initially provisioned.

The algorithm name is to be constant within a major revision of the load balancing API, though new algorithms may be created with a unique algorithm name within a given major revision of this API.

**Supported Algorithms**

|Name               |Description                                                           |
|:------------------|:---------------------------------------------------------------------|
|LEAST_CONNECTIONS  |The node with the lowest number of connections will receive requests. |
|ROUND_ROBIN        |Connections are routed to each of the back-end servers in turn.       |

**Request Data**

None required.

**Query Parameters Supported**

None required.

**Required HTTP Header Values**

X-Auth-Token

**Request Body**

None required.

**Normal Response Code**

| HTTP Status Code | Description         |
|:-----------------|:--------------------|
|200               |OK                   |

**Response Body**

The response body contains the currently supported algorithms.

**Error Response Codes**

| HTTP Status Code | Description         |
|:-----------------|:--------------------|
|400               |Bad Request          |
|401               |Unauthorized         |
|404               |Not Found            |
|405               |Not Allowed          |
|500               |LBaaS Fault          |
|503               |Service Unavailable  |

**Curl Request**

	curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v1.1/algorithms

**Response**

	{
    "algorithms": [
        {
            "name": "ROUND_ROBIN"
        },
        {
            "name": "LEAST_CONNECTIONS"
        }
    ]
	}

#### 5.6 Load Balancers ####
##### 5.6.1 Get List Of All Load Balancers ##### {#api-list}
##### GET /v1.1/loadbalancers

**Description**

This operation provides a list of all load balancers configured and associated with your account. This includes a summary of attributes for each load balancer. In order to retrieve all the details for a load balancer, an individual request for the load balancer must be made.

This operation returns the following attributes for each load balancer:

*id :* Unique identifier for the load balancer

*name :*  Creator assigned name for the load balancer

*algorithm :* Creator specified algorithm for the load balancer

*protocol :* Creator specified protocol for the load balancer

*port :* Creator specified port for the load balancer

*status :* Current status, see section on load balancer status within load balancer create

*created :* When the load balancer was created

*updated :* When the load balancer was last updated

*nodeCount :* The number of backend servers attached to this load balancer

*options :* Current options are timeout (30 sec) and retries (3) for each load balancer

**Request Data**

None required.

**Query Parameters Supported**

*status :* When status=DELETED provided a list of load balancers deleted in the last week will be provided

**Required HTTP Header Values**

X-Auth-Token

**Request Body**

None required.

**Normal Response Code**

| HTTP Status Code | Description         |
|:-----------------|:--------------------|
|200               |OK                   |

**Response Body**

The response body contains a list of load balancers for the tenant making the request.

**Error Response Codes**

| HTTP Status Code | Description         |
|:-----------------|:--------------------|
|400               |Bad Request          |
|401               |Unauthorized         |
|404               |Not Found            |
|405               |Not Allowed          |
|500               |LBaaS Fault          |
|503               |Service Unavailable  |

**Curl Request**

	curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v1.1/loadbalancers

**Response**

	{
	"loadBalancers":[
         	{
           		"name":"lb-site1",
           		"id":"71",
           		"protocol":"HTTP",
           		"port":80,
           		"algorithm":"LEAST_CONNECTIONS",
           		"status":"ACTIVE",
           		"created":"2010-11-30T03:23:42Z",
           		"updated":"5.18510-11-30T03:23:44Z",
                "nodeCount":2,
                "options": {"timeout": 30000, "retries": 3}
         	},
         	{
           		"name":"lb-site2",
           		"id":"166",
           		"protocol":"TCP",
           		"port":443,
           		"algorithm":"ROUND_ROBIN",
           		"status":"ACTIVE",
           		"created":"2010-11-30T03:23:42Z",
           		"updated":"2010-11-30T03:23:44Z",
                "nodeCount":2,
                "options": {"timeout": 30000, "retries": 3}
         	}
      		]
	}

##### 5.6.2 Get Load Balancer Details ##### {#api-status}
##### GET /v1.1/loadbalancers/{loadbalancerID}

**Description**

This operation provides detailed description for a specific load balancer configured and associated with your account. This operation is not capable of returning details for a load balancer which has been deleted. Details include load balancer virtual IP and node information.

**Request Data**

None required.

**Query Parameters Supported**

None required.

**Required HTTP Header Values**

X-Auth-Token

**Request Body**

None required.

**Normal Response Code**

| HTTP Status Code | Description         |
|:-----------------|:--------------------|
|200               |OK                   |

**Response Body**

The response body contains the load balancer requested or 404, if not found.

**Error Response Codes**

| HTTP Status Code | Description         |
|:-----------------|:--------------------|
|400               |Bad Request          |
|401               |Unauthorized         |
|404               |Not Found            |
|405               |Not Allowed          |
|500               |LBaaS Fault          |
|503               |Service Unavailable  |

**Curl Request**

	curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v1.1/loadbalancers/{loadbalancerID}

**Response**

	{
      		"id": "2000",
      		"name":"sample-loadbalancer",
      		"protocol":"HTTP",
      		"port": 80,
      		"algorithm":"ROUND_ROBIN",
      		"status":"ACTIVE",
            "statusDescription":"",
      		"created":"2010-11-30T03:23:42Z",
      		"updated":"2010-11-30T03:23:44Z",
            "nodeCount":2,
            "options": {"timeout": 30000, "retries": 3},
      		"virtualIps":[
                    	{
                       		"id": 1000,
                       		"address":"15.186.1.1",
                       		"type":"PUBLIC",
                       		"ipVersion":"IPV4"
                    	}
                 ],
       		"nodes":     [
                      {
                         	"id": "1041",
                         	"address":"15.185.1.1",
                         	"port": 80,
                         	"condition":"ENABLED",
                         	"status":"ONLINE"
                       },
                       {
                         	"id": "1411",
                         	"address":"15.185.1.2",
                         	"port": 80,
                         	"condition":"ENABLED",
                         	"status":"ONLINE"
                       }
                  ],
	}

##### 5.6.3 Create a New Load Balancer ##### {#api-create}
##### POST /v1.1/loadbalancers

**Description**

This operation provisions a new load balancer based on the configuration defined in the request object. Once the request is validated and progress has started on the provisioning process, a response object will be returned. The object will contain a unique identifier and status of the request.

If the status returned is set to 'BUILD', then using the identifier of the load balancer, the caller can check on the progress of the creation operation by performing a GET on loadbalancers/{loadbalancerId}. When the status of the load balancer returned changes to 'ACTIVE', then the load balancer has been successfully provisioned and is now operational.

**Load Balancer Status Values**

| Status Name | Description |
| :------- | :------- |
| BUILD | Load balancer is in a building state and not yet operational |
| ACTIVE | Load balancer is in an operational state |
| PENDING_UPDATE | Load balancer is in the process of an update |
| ERROR | Load balancer is in an error state and not operational |

The caller of this operation must specify at least the following attributes of the load balancer:

- name
- at least one node

If the request cannot be fulfilled due to insufficient or invalid data, an HTTP 400 (Bad Request) error response will be returned with information regarding the nature of the failure in the body of the response. Failures in the validation process are non-recoverable and require the caller to correct the cause of the failure and POST the request again.

By default, the system will create a load balancer with protocol set to HTTP, port set to 80 (or 443 if protocol is TCP), and assign a public IPV4 address to the load balancer. The default algorithm used is set to ROUND_ROBIN. 

The load balancer options consist of a 30 second timeout for client connections (30,000ms) and 3 retries. Valid timeout values range from 0 to 1000 seconds (1,000,000 ms) with 0 indicating no timeout. retries can range from 0 to 100.

A load balancer name has a max length that can be queried when querying limits.

Users may configure all documented features of the load balancer at creation time by simply providing the additional elements or attributes in the request. This document provides an overview of all the features the load balancing service supports.

If you have at least one load balancer, you may create subsequent load balancers that share a single virtual IP by issuing a POST and supplying a virtual IP ID instead of a type. Additionally, this feature is highly desirable if you wish to load balance both an unsecured and secure protocol using one IP address. For example, this method makes it possible to use the same load balancing configuration to support an HTTP and a TCP load balancer. Load balancers sharing a virtual IP must utilize a unique port.

**Request Data**

The caller is required to provide a request data with the POST which includes the appropriate information to create a new load balancer.

**Query Parameters Supported**

None required.

**Required HTTP Header Values**

* X-Auth-Token   
* Accept: application/json   
* Content-Type: application/json

**Request Body**

The request body must follow the correct format for new load balancer creation, examples....

**Request body example to create a load balancer with two nodes**

	{
    		"name": "a-new-loadbalancer",
    		"nodes":      [
                    	{
                      		"address": "15.185.1.1",
                      		"port": 80
                    	},
                    	{
                      		"address": "15.185.1.2",
                      		"port": 81
                    	}
                ]
	} 

**Request body example to create a load balancer using existing load balancer virtual IP**

	{
	"name":"a-new-loadbalancer",
		"port":80,
		"protocol":"HTTP",
		"options": {"timeout": 30000, "retries": 3},
		"virtualIps": [
                   {
                      "id":39
                   }
                 ],
		"nodes":      [
                   {
                      "address":"15.185.1.1",
                      "port":80,
                      "condition":"ENABLED"
                   }
                 ]
	}

**Normal Response Code**

| HTTP Status Code | Description         |
|:-----------------|:--------------------|
|202               |Accepted             |

**Response Body**

The response body contains the load balancer requested or appropriate error.

**Create Load Balancer (Required Attributes with Shared IP) Response: JSON**

	{
    		"name": "a-new-loadbalancer",
    		"id": "144",
    		"protocol": "HTTP",
    		"port": 83,
    		"algorithm": "ROUND_ROBIN",
    		"status": "BUILD",
    		"created": "2011-04-13T14:18:07Z",
    		"updated":"2011-04-13T14:18:07Z",
            "options": {"timeout": 30000, "retries": 3},
    		"virtualIps": [
                    {
                      	"address": "3ffe:1900:4545:3:200:f8ff:fe21:67cf",
                      	"id": 39,
                      	"type": "PUBLIC",
                      	"ipVersion": "IPV6"
                    }
                  ],
    		"nodes":      [
                    {
                      	"address": "15.185.1.1",
                      	"id": "653",
                      	"port": 80,
                      	"status": "ONLINE",
                      	"condition": "ENABLED"
                    }
                  ]
	}

**Error Response Codes**

| HTTP Status Code | Description         |
|:-----------------|:--------------------|
|400               |Bad Request          |
|401               |Unauthorized         |
|404               |Not Found            |
|405               |Not Allowed          |
|413               |Over Limit           |
|500               |LBaaS Fault          |
|503               |Service Unavailable  |

**Example**

**Contents of Request file lb.json**

	{
	"name": "lb #1",
		"protocol":"tcp",
    		"nodes":      [
                    {
                      	"address": "15.185.229.153",
                      	"port": 443
                    },
                   {
                      	"address": "15.185.226.163",
                      	"port": 443
                    },
                   ],
	}

**Curl Request**

	curl -i -k -X POST -H "X-Auth-Token: {Auth_Token}" --data-binary "@lb.json" {BaseURI}/v1.1/loadbalancers

**Response**

	{
		"port":443,
		"id":"10",
		"protocol":"tcp",
		"updated":"2013-02-10T18:20Z",
		"created":"2013-02-10T18:20Z",
		"status":"BUILD",
		"nodes":[
			{	
				"port":443,
				"id":"19",
				"condition":"ENABLED",
				"status":"ONLINE",
				"address":"15.185.229.153"
			},
			{
				"port":443,
				"id":"20",
				"condition":"ENABLED",
				"status":"ONLINE",
				"address":"15.185.226.163"
			}
		],
		"name":"lb #1",
		"virtualIps":[
			{
				"id":5,
				"address":"15.185.96.125",
				"ipVersion":"IPV_4",
				"type":"PUBLIC"
			}
		],
		"algorithm":"ROUND_ROBIN",
        "options": {"timeout": 30000, "retries": 3}
	}

##### 5.6.4 Update an Existing Load Balancer ##### {#api-modify}
##### PUT /v1.1/loadbalancers/{loadbalancerId}

**Description**

This operation updates the attributes of the specified load balancer. Upon successful validation of the request, the service will return a 202 (Accepted) response code. A caller should check that the load balancer status is ACTIVE to confirm that the update has taken effect. If the load balancer status is 'PENDING_UPDATE' then the caller can poll the load balancer with its ID (using a GET operation) to wait for the changes to be applied and the load balancer to return to an ACTIVE status.

This operation allows the caller to change one or more of the following attributes:

- name
- algorithm
- options

This operation does not return a response body.

**Note:** The load balancer ID, status, port and protocol are immutable attributes and cannot be modified by the caller. Supplying an unsupported attribute will result in a 400 (badRequest) fault.

**Request Data**

Load balancer body with attributes to be updated.

**Query Parameters Supported**

None required.

**Required HTTP Header Values**

X-Auth-Token

**Request Body**

**Example**

	{
		"name": "newname-loadbalancer",
		"algorithm": "LEAST_CONNECTIONS",
		"options": {"timeout": 30000, "retries": 3}
	}

**Normal Response Code**

| HTTP Status Code | Description         |
|:-----------------|:--------------------|
|202               |Accepted             |

**Response Body**

None.

**Error Response Codes**

| HTTP Status Code | Description         |
|:-----------------|:--------------------|
|400               |Bad Request          |
|401               |Unauthorized         |
|404               |Not Found            |
|405               |Not Allowed          |
|500               |LBaaS Fault          |
|503               |Service Unavailable  |
**Example**

**Contents of Request file lb.json**

	{
		"name": "newname-loadbalancer",
		"algorithm": "LEAST_CONNECTIONS",
        "options": {"timeout": 30000, "retries": 3}
	}

**Curl Request**

	curl -i -k -X PUT -H "X-Auth-Token: {Auth_Token}" --data-binary "@lb.json" {BaseURI}/v1.1/loadbalancers/{loadbalancerID}

**Response**

202 status with no response body.

##### 5.6.5 Delete Load Balancer ##### {#api-delete}
##### DELETE /v1.1/loadbalancers/{loadbalancerId}

**Description**

Delete load balancer removes the specified load balancer and its associated configuration from the account. Any and all configuration data is immediately purged and is not recoverable.

**Request Data**

This operation does not require a request body.

**Query Parameters Supported**

None required.

**Required HTTP Header Values**

X-Auth-Token

**Request Body**

None required.

**Normal Response Code**

| HTTP Status Code | Description         |
|:-----------------|:--------------------|
|202               |Accepted             |

**Response Body**

None.

**Error Response Codes**

| HTTP Status Code | Description         |
|:-----------------|:--------------------|
|400               |Bad Request          |
|401               |Unauthorized         |
|404               |Not Found            |
|405               |Not Allowed          |
|500               |LBaaS Fault          |
|503               |Service Unavailable  |

**Curl Example**

	curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v1.1/loadbalancers/{loadbalancerID}

**Response**

202 status with no response body.

#### 5.7 Nodes ####
##### 5.7.1 List All Load Balancer Nodes ##### {#api-node-list}
##### GET /v1.1/loadbalancers/{loadbalancerId}/nodes

**Description**

List all nodes for a specified load balancer.

**Request Data**

None required.

**Query Parameters Supported**

None required.

**Required HTTP Header Values**

X-Auth-Token

**Request Body**

None required.

**Normal Response Code**

| HTTP Status Code | Description         |
|:-----------------|:--------------------|
|200               |OK                   |

**Response Body**

The response body contains the load balancer nodes requested or 404, if not found.

**Error Response Codes**

| HTTP Status Code | Description         |
|:-----------------|:--------------------|
|400               |Bad Request          |
|401               |Unauthorized         |
|404               |Not Found            |
|405               |Not Allowed          |
|500               |LBaaS Fault          |
|503               |Service Unavailable  |

**Curl Example**

	curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v1.1/loadbalancers/{loadbalancerID}/nodes

**Response**

	{
	"nodes" : [
              	{
                	"id":"410",
                	"address":"15.185.1.1",
                	"port":80,
                	"condition":"ENABLED",
                	"status":"ONLINE"
              	},
              	{
                	"id":"236",
                	"address":"15.185.1.2",
                	"port":80,
                	"condition":"ENABLED",
                	"status":"ONLINE"
              	},
              	{
                	"id":"2815",
                	"address":"15.185.1.3",
                	"port":83,
                	"condition":"DISABLED",
                	"status":"OFFLINE"
              	},
        		]
	}	

##### 5.7.2 Get Load Balancer Node ##### {#api-node-status}
##### GET /v1.1/loadbalancers/{loadbalancerId}/nodes/{nodeId}

**Description**

This operation retrieves the configuration of a node.

**Request Data**

None required.

**Query Parameters Supported**

None required.

**Required HTTP Header Values**

X-Auth-Token

**Request Body**

None required.

**Normal Response Code**

| HTTP Status Code | Description         |
|:-----------------|:--------------------|
|200               |OK                   |

**Response Body**

The response body contains the load balancer node requested or 404, if not found.

**Error Response Codes**

| HTTP Status Code | Description         |
|:-----------------|:--------------------|
|400               |Bad Request          |
|401               |Unauthorized         |
|404               |Not Found            |
|405               |Not Allowed          |
|500               |LBaaS Fault          |
|503               |Service Unavailable  |

**Curl Example**

	curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v1.1/loadbalancers/{loadbalancerId}/nodes/{nodeId}

**Response**

	{
		"id":"410",
		"address":"15.185.1.2",
		"port":80,
		"condition":"ENABLED",
		"status":"ONLINE"
	}

##### 5.7.3 Create Load Balancer Node ##### {#api-node-create}
##### POST /v1.1/loadbalancers/{loadbalancerId}/nodes/

**Description**

Add a new node to any existing load balancer. When a node is added, it is assigned a unique identifier that can be used for mutating operations such as changing the condition, or removing the node from the load balancer. When a node is added to a load balancer it is enabled by default.

**Request Data**

The request must contain information regarding the new node to be added. More than one node can be added at a time.

**Query Parameters Supported**

None required.

**Required HTTP Header Values**

X-Auth-Token

**Request Body**

The request body defines the attributes of the new node to be created.

**Normal Response Code**

| HTTP Status Code | Description         |
|:-----------------|:--------------------|
|202               |Accepted             |

**Response Body**

The response body contains the load balancer requested or 404, if not found.

**Error Response Codes**

| HTTP Status Code | Description         |
|:-----------------|:--------------------|
|400               |Bad Request          |
|401               |Unauthorized         |
|404               |Not Found            |
|405               |Not Allowed          |
|413               |Over Limit           |
|500               |LBaaS Fault          |
|503               |Service Unavailable  |
**Example** 

**Contents of Request file nodes.json**

	{
	"nodes": [
             		{
               			"address": "15.185.1.1",
               			"port": 80
             		},
             		{
               			"address": "15.185.2.1",
               			"port": 80
             		},
             		{
               			"address": "15.185.2.2",
               			"port": 88,
               			"condition": "DISABLED"
             		}
           	]
	}

**Curl Request**

	curl -i -k -X POST -H "X-Auth-Token: {Auth_Token}" --data-binary "@nodes.json" {BaseURI}/v1.1/loadbalancers/{loadbalancerId}/nodes

**Response**

	{
	"nodes": [
             		{
               			"id": "7298",
               			"address": "15.185.1.1",
               			"port": 80,
               			"condition": "ENABLED",
               			"status": "ONLINE"
             		},
             		{
               			"id": "293",
               			"address": "15.185.2.1",
               			"port": 80,
               			"condition": "ENABLED",
               			"status": "OFFLINE"
             		},
             		{
               			"id": "183",
               			"address": "15.185.2.2",
               			"port": 88,
               			"condition": "DISABLED",
               			"status": "OFFLINE"
             		}
           	]
	}

##### 5.7.4 Update Load Balancer Node Condition ##### {#api-node-modify}
##### PUT /v1.1/loadbalancers/{loadbalancerId}/nodes/{nodeId}

**Description**

Every node in the load balancer is either enabled or disabled which determines its role within the load balancer. When the node has condition='ENABLED' the node is permitted to accept new connections. Its status will eventually become 'ONLINE' to reflect this configuration. When the node has condition='DISABLED' the node is not permitted to accept any new connections. Existing connections to the node are forcibly terminated. The nodes status changes to OFFLINE once the configuration has been successfully applied.

The node IP and port are immutable attributes and cannot be modified with a PUT request. Supplying an unsupported attribute will result in a 400 fault. A load balancer supports a maximum number of nodes. The maximum number of nodes per load balancer is returned when querying the limits of the load balancer service.

**Request Data**

Request data includes the desired condition of the node.

**Query Parameters Supported**

None required.

**Required HTTP Header Values**

X-Auth-Token

**Request Body**

The request body includes the node 'condition' attribute and its desired state.

**Normal Response Code**

| HTTP Status Code | Description         |
|:-----------------|:--------------------|
|202               |Accepted             |

**Response Body**

None.

**Error Response Codes**

| HTTP Status Code | Description         |
|:-----------------|:--------------------|
|400               |Bad Request          |
|401               |Unauthorized         |
|404               |Not Found            |
|405               |Not Allowed          |
|500               |LBaaS Fault          |
|503               |Service Unavailable  |
**Example**

**Contents of Request file node.json**

	{
		"condition": "DISABLED"
	}

**Curl Request**

	curl -i -k -X PUT -H "X-Auth-Token: {Auth_Token}" --data-binary "@node.json" {BaseURI}/v1.1/loadbalancers/{loadbalancerId}/nodes/{nodeId}

**Response**

202 status with no response body.

##### 5.7.5 Delete Load Balancer Node ##### {#api-node-delete}
##### DELETE /v1.1/loadbalancers/{loadbalancerId}/nodes/{nodeId}

**Description**

Delete node for a load balancer. 

**Note**: A load balancer must have at least one node. Attempting to remove the last node of a load balancer will result in a 401 error.

**Request Data**

None required.

**Query Parameters Supported**

None required.

**Required HTTP Header Values**

X-Auth-Token

**Request Body**

None required.

**Normal Response Code**

| HTTP Status Code | Description         |
|:-----------------|:--------------------|
|202               |Accepted             |

**Response Body**

None.

**Error Response Codes**

| HTTP Status Code | Description         |
|:-----------------|:--------------------|
|400               |Bad Request          |
|401               |Unauthorized         |
|404               |Not Found            |
|405               |Not Allowed          |
|500               |LBaaS Fault          |
|503               |Service Unavailable  |

**Curl Request**

	curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v1.1/loadbalancers/{loadbalancerId}/nodes/{nodeId}

**Response**

202 status with no response body.

#### 5.8 Virtual IP ####
##### 5.8.1 Get List of Virtual IPs ##### {#api-vips}
##### GET /v1.1/loadbalancers/{loadbalancerId}/virtualips

**Description**

This operation lists all the virtual IP addresses of a load balancer. The maximum number of VIPs that can be configured when creating a load balancer can be discovered by querying the limits of the load balancer service.

**Request Data**

None required.

**Query Parameters Supported**

None required.

**Required HTTP Header Values**

X-Auth-Token

**Request Body**

None required.

**Normal Response Code**

| HTTP Status Code | Description         |
|:-----------------|:--------------------|
|200               |OK                   |

**Response Body**

The response body contains the load balancer VIP list requested or 404, if not found.

**Error Response Codes**

| HTTP Status Code | Description         |
|:-----------------|:--------------------|
|400               |Bad Request          |
|401               |Unauthorized         |
|404               |Not Found            |
|405               |Not Allowed          |
|500               |LBaaS Fault          |

**Curl Request**

	curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v1.1/loadbalancers/{loadbalancerId}/nodes/{nodeId}/virtualips

**Response**

	{
	"virtualIps": [
                 	{
                   		"id": 1021,
                   		"address": "15.186.10.210",
                   		"type": "PUBLIC",
                   		"ipVersion": "IPV4"
                 	}
                	]
	}

#### 5.9 Health Monitor ####
##### 5.9.1 Get Load Balancer Health Monitor ##### {#api-monitor-status}
##### GET /v1.1/loadbalancers/{loadbalancerId}/healthmonitor

**Description**

This operation retrieves the current configuration of a load balancer health monitor.

**Request Data**

None required.

**Query Parameters Supported**

None required.

**Required HTTP Header Values**

X-Auth-Token

**Request Body**

None required.

**Normal Response Code**

| HTTP Status Code | Description |
|:-----------------|-------------|
| 200              | OK          |

**Response Body**

The response body contains the health monitor for the requested load balancer or 404, if not found.

**Error Response Codes**

| HTTP Status Code | Description |
|:-----------------|-------------|
| 400              | Bad Request |
| 401              | Unauthorized|
| 404              | Not Found   |
| 405              | Not Allowed |
| 500              | LBaaS Fault |

**Curl Example**

	curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v1.1/loadbalancers/{loadbalancerId}/healthmonitor

**Response**

	{
    "type": "CONNECT",
    "delay": "30",
    "timeout": "30",
    "attemptsBeforeDeactivation": "2"
	}

or..

	{
    "type": "HTTP",
    "delay": "30",
    "timeout": "30",
    "attemptsBeforeDeactivation": "2",
    "path": "/healthcheck"
	}

##### 5.9.2 Update Load Balancer Health Monitor ##### {#api-monitor-modify}
##### PUT /v1.1/loadbalancers/{loadbalancerId}/healthmonitor

**Description**

Active health monitoring provides two types of health monitors: CONNECT or HTTP. The caller can configure one health monitor per load balancer.  The health monitor has a type attribute to signify which types it is. The required attributes for each type is as follows:

**CONNECT Monitor**

The monitor connects to each node on its defined port to ensure that the node is listening properly.
The CONNECT monitor is the most basic type of health check and does not perform post-processing or protocol specific health checks. It includes several configurable properties:

- delay: This is the minimum time in seconds between regular calls to a monitor. The default is 30 seconds.
- timeout: Maximum number of seconds for a monitor to wait for a connection to be established to the node before it times out. The value cannot be greater than the delay value. The default is 30 seconds.
- attemptsBeforeDeactivation: Number of permissible monitor failures before removing a node from rotation. Must be a number between 1 and 10. The default is 2 attempts.

**HTTP Monitor**

The HTTP monitor is more intelligent than the CONNECT monitor. It is capable of processing an HTTP response to determine the condition of a node. It supports the same basic properties as the CONNECT monitor and includes the additional attribute of path that is used to evaluate the HTTP response to a monitor probe.

- path: The HTTP path used in the HTTP request by the monitor. This must be a string beginning with a / (forward slash). The monitor expects a response from the node with an HTTP status code of 200.

The default Health Monitor Configuration, when a load balancer is created is:

    {
    "type": "CONNECT",
    "delay": "30",
    "timeout": "30",
    "attemptsBeforeDeactivation": "2"
    }

**Request Data**

Request data includes the desired configuration attributes of the health monitor.

**Query Parameters Supported**

None required.

**Required HTTP Header Values**

X-Auth-Token

**Request Body**

The request body includes the health monitor attributes.

**Normal Response Code**

| HTTP Status Code | Description |
|:-----------------|-------------|
| 202 | Accepted |

**Response Body**

The response body contains the health monitor requested

**Error Response Codes**

|HTTP Status Code | Description |
|:----------------|-------------|
| 400 | Bad Request |
| 401 | Unauthorized |
| 404 | Not Found |
| 405 | Not Allowed |
| 500 | LBaaS Fault |

**Example**

Contents of Request file node.json

	{
    "type": "CONNECT",
    "delay": "30",
    "timeout": "30",
    "attemptsBeforeDeactivation": "2"
	}

or..

	{
    "type": "HTTP",
    "delay": "30",
    "timeout": "30",
    "attemptsBeforeDeactivation": "2",
    "path": "/healthcheck"
	}

**Curl Example**

	curl -i -k -X PUT -H "X-Auth-Token: {Auth_Token}" --data-binary "@node.json" {BaseURI}/v1.1/loadbalancers/{loadbalancerId}/healthmonitor

**Response**

202 status with the following response body.

	{
    "type": "CONNECT",
    "delay": "30",
    "timeout": "30",
    "attemptsBeforeDeactivation": "2"
	}

or..
	
	{
    "type": "HTTP",
    "delay": "30",
    "timeout": "30",
    "attemptsBeforeDeactivation": "2",
    "path": "/healthcheck"
	}

##### 5.9.3 Reset Load Balancer Health Monitor ##### {#api-monitor-delete}
##### DELETE /v1.1/loadbalancers/{loadbalancerId}/healthmonitor

**Description**

Reset health monitor settings for a load balancer back to the following default configuration.

	{
    "type": "CONNECT",
    "delay": "30",
    "timeout": "30",
    "attemptsBeforeDeactivation": "2"
	}

**Request Data**

None required.

**Query Parameters Supported**

None required.

**Required HTTP Header Values**

X-Auth-Token

**Request Body**

None required.

**Normal Response Code**

| HTTP Status Code | Description |
|:-----------------|-------------|
|202 | Accepted |

**Response Body**

None.

**Error Response Codes**

| HTTP Status Code | Description |
|:-----------------|-------------|
| 400 | Bad Request |
| 401 | Unauthorized |
| 404 | Not Found |
| 405 | Not Allowed |
| 500 | LBaaS Fault |

**Curl Example**

	curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v1.1/loadbalancers/{loadbalancerId}/healthmonitor

**Response**

202 status with no response body.

#### 6. Features Currently Not Implemented or Supported ####

The following features are not supported.

* IPV6 address types are not supported. 

* SSL termination for load balancers is not currently supported.  Instead TCP will be used for port 443 and the HTTPS connections will be passed through the load balancer with no termination at the load balancer.
