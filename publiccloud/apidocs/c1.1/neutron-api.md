---
layout: page
permalink: /publiccloud/api/networking/
title: "HP Helion Public Cloud Networking Service API Specifications"   
description: "HP Helion Public Cloud Networking Service. This service is based upon OpenStack Networking"
keywords: "Networking, OpenStack"   
product: Networking

---
<!--PUBLISHED-->
# HP Helion Public Cloud Networking API Specifications

**Date:** May 2014

**Document Version:** 1.5

## 1. Overview

The HP Helion Public Cloud Networking Service is based on [OpenStack Neutron](https://wiki.openstack.org/wiki/Neutron).   

HP Helion Public Cloud Networking is a virtual network service that provides a powerful API to define the network connectivity and addressing used by devices from other services, such as HP Helion Public Cloud Compute. The HP Helion Public Cloud Networking API supports virtual network, subnet, router and port abstractions to describe network resources.
 
Users can configure rich network topologies by creating and configuring networks, subnets, ports and routers.  Other services such as Compute may be used to attach virtual devices to ports on these networks.  In particular, Networking supports each tenant having multiple private networks, and allows tenants to choose their own IP addressing scheme, even if those IP addresses overlap with those used by other tenants.  This enables advanced cloud networking use cases, such as building multi-tiered web applications and allowing applications to be migrated to the Cloud without changing IP addresses.

HP Helion Public Cloud Networking API extensions provide additional abstractions and features. The Networking service supports the following extensions: 

* Layer-3 Networking Extension
  * Floating IP
  * Router
* Quotas Extension
* Security Groups

HP Helion Public Cloud Networking includes an API extension that provides abstract L3 routers that API users can dynamically provision and configure. These Networking routers can connect multiple L2 Networking networks, and can also provide a "gateway" that connects one or more private L2 networks to a shared "external" network (e.g., a public network for access to the Internet).

The L3 router support provides basic NAT capabilities on "gateway" ports that uplink the router to external networks. This router SNATs all traffic by default, and supports Floating IPs, which creates a static one-to-one mapping from a public IP on the external network to a private IP on one of the other subnets attached to the router. This allows a tenant to selectively expose VMs on private networks to other hosts on the external network (and often to all hosts on the Internet). Floating IPs can be allocated and then mapped from one HP Helion Public Cloud Networking port to another, as needed.

Security Groups and Security Group Rules allow administrators and tenants the ability to specify the type of traffic and direction (ingress/egress) that is allowed to pass through a port.

We will be referring to HP Helion Public Cloud Networking Service in this document as simply Networking or the Networking service.

### 1.1 API Maturity Level

**Maturity Level**:  
Networking is currently in General Availability.   

**Version API Status**:  
The Networking service is based upon OpenStack Neutron v2.0 API.

### 1.2 Document Revision History

| Document Version| Date        | Description    |
| :-------------- | :--------   | :------------  |
| 1.0             | 5/27/2013   | Initial release  |
| 1.1             | 1/27/2014   | Fixed internal link  |
| 1.2             | 4/3/2014    | Changed instances of security_group to security-group. Updated XML and JSON code examples under  4.5.3.3  Create Port|
| 1.3             | 4/8/2014    | Fixed JSON, XML, and Curl code examples under each section.  Updated Quota Limits fields.  |
| 1.4             | 4/11/2014   | Added API call for /quotas  |
| 1.5 | May 2014 | HP Helion updates |

## 2. Architecture View
### 2.1 Overview

The Networking service provides virtual networking services among devices that are managed by the Compute service.

Key features of Networking include:

* As a tenant you own your own dedicated private network.  
* As a tenant you own your IP space.
* Ability to duplicate IP addresses across autonomous networks

#### 2.1.1 High-Level Task Flow

The high-level task flow for Networking is as follows:

1. The tenant creates a router.   
  E.g., the tenant creates the *newrouter* router.

2. The tenant creates a network.   
  E.g., the tenant creates the *net1* network.

3. The tenant associates a subnet with that network.   
  E.g., the tenant associates the 10.0.0.0/24 subnet with the *net1* network.

4. The tenant adds an interface between the router and the subnet.

5. The tenant boots a virtual machine (VM) and specifies a single NIC that connects to the network.

  Example A: Compute contacts Networking and creates the *port1* port on the *net1* network   
    
    $ nova boot --image image_name --nic net-id="id_of_net1" server_name
  
  Example B:  Tenant creates a port prior to booting the VM   
    
    $ nova boot --image image_name --nic port-id="id_of_port1" server_name

6. Networking assigns an IP address to the *port1* port.   
  **Note:** Networking chooses the IP address by default.

7. The tenant deletes the VM.
  * Compute contacts Networking and deletes the *port1* port.
  * The allocated IP address is returned to the pool of available IP addresses.

### 2.2 Conceptual/Logical Architecture View
#### 2.2.1 Core APIs

Networking API v2.0 manages the following entities:

- **Network**: An isolated virtual layer-2 domain. A network can also be a virtual, or logical, switch.
- **Subnet**: An IP version 4 address block from which IP addresses that are assigned to VMs on a specified network are selected.
- **Port**: A virtual, or logical, switch port on a specified network.

The above entities have auto-generated unique identifiers and support basic create, read, update, and delete (CRUD) functions with the POST, GET, PUT, and DELETE verbs.

CRUD Functionality:  
C - Attribute can be used in *create* operations  
R - Attribute is returned in response object for *show* and *list* operations  
U - Attribute value can be updated  
D - Attribute value can be deleted

##### 2.2.1.1 Network
A network is an isolated virtual layer-2 broadcast domain that is typically reserved for the tenant who created it unless the network is configured to be shared. Tenants can create multiple networks until they reach the thresholds specified by per-tenant quotas.

In Networking, the network is the main entity. Ports and subnets are always associated with a network.

##### 2.2.1.2 Subnet
A subnet represents an IP address block that can be used to assign IP addresses to virtual instances. Each subnet must have a CIDR and must be associated with a network. IPs can be either selected from the whole subnet CIDR or from allocation pools that can be specified by the user.

A subnet may optionally have a gateway, a list of DNS name servers, and host routes. This information is pushed to instances whose interfaces are associated with the subnet.

##### 2.2.1.3 Port
A port represents a virtual switch port on a logical network switch. Virtual instances attach their interfaces into ports. The logical port also defines the MAC address and the IP address(es) to be assigned to the interfaces plugged into them. 

When IP addresses are associated to a port, this implies the port is associated with a subnet, as the IP address was taken from the allocation pool for a specific subnet.

####2.2.2 API Extensions
In addition to the above core entities, Networking service manages the following entities through API extensions:  

- **Router**: Provides L3 forwarding and NAT capabilities.
- **Floating IP**: A public IP address that can be mapped to a private IP address via NAT.
- **Security Group**: A container for Security Group Rules. Associated with a port.
- **Security Group Rule**: Defines the type and direction of traffic that is allowed to pass through a port.

##### 2.2.2.1 Router 
A router is used to interconnect subnets and forward traffic among them. Another feature of the router is to NAT internal traffic to external networks.

A router has an interface for each subnet it is associated with. By default the IP address of such interface is the subnets gateway IP. Also, whenever a router is associated with a subnet, a port for that router interface will be added to the subnet's network.

The *router:external* attribute is characterized as follows:   

* Available in **Get** requests.
* Of type Boolean (bool).  Default value is *false*
* Attribute is set by the cloud service provider

##### 2.2.2.2 Floating IP
A Floating IP is an IP address on an external network, which is associated with a specific port, and optionally a specific IP address, on a private network. A Floating IP allows access to an instance on a private network from an external network. 

Floating IPs can only be defined on networks for which the attribute router:external has been set to True.

##### 2.2.2.3 Security Groups and Rules
Security groups and security group rules allows administrators and tenants the ability to specify the type of traffic and direction (ingress/egress) that is allowed to pass through a port. A security group is a container for security group rules.

When a port is created in Networking it is associated with a security group. If a security group is not specified the port will be associated with a *default* security group. By default this group will drop all ingress traffic and allow all egress. Rules can be added to this group in order to change the behavior.

### 2.3 Entity Relationship Diagram
<img src="media/networking_overview.jpg">Networking Object Relationships</a>

### 2.4 Service Quotas
Quotas are established for the following resources on a per-project basis. Quotas may be increased by contacting Public Cloud Support.

| Quota          | Value   | Description    |                          
| :------------------- | :------ | :------------------------------------------ |
| Networks | 5 | Number of networks available. |
| Subnets | 5 | Number of subnets available. |
| Ports | 70  | Number of ports available. |
| Floating IPs | 45 | Number of floating IP addresses available. |
| Routers | 1 | Number of routers. |
| Security Groups | 10 | Number of Security Groups allowed. |
| Security Group Rules | 50 | Number of Security Group Rules allowed across all Security Groups. |

### 2.5 Rate Limits
In order to ensure fair sharing of cloud resources, limits are placed on the rate at which an individual tenant can make requests to the Networking API servers. The rate limits are specified in terms of HTTP verbs (GET, PUT, POST, DELETE).

Should an operation be rate limited, an error is returned in the operation response.

### 2.6 Service Limitations
The below functional limitations apply to the Networking service:    
 
* Multicast/broadcast is not supported except for ARP and DHCP
* IPv6 is currently not supported
* Multi-NIC on a single instance is not supported

Networking does not support all OpenStack Networking APIs and extensions as documented in the OpenStack Networking API Guide.  Operations not supported for customer use include:  
 
* Bulk Create Networks  
* Bulk Create Subnets  
* Bulk Create Ports  
* Provider Network Extensions  
* Quota Extensions  
* Security Groups: Update  
* Security Group Rules: Update  

## 3. Account-level View
### 3.1 Accounts
An account is created when a user first signs up with HP Helion Public Cloud. A project (also known as a tenant) is created upon account activation. All calls to Networking APIs include the user's *tenant_id* as part of the call.

For additional details on accounts and tenants/projects, please refer to the Identity Service Overview.

### 3.2 Regions and Availability Zones
Networking provides the following service instance:

**Region(s)**:   
region-a.geo-1.network.hpcloudsvc.com   
region-b.geo-1.network.hpcloudsvc.com 

### 3.3 Service Catalog
The service is exposed in the service catalog, as shown in the following fragment:
 
    {
     "serviceCatalog": [
        {
          "name": "Networking",
          "type": "network",
          "endpoints": [{
            "tenantId": {tenant_id}
            "publicURL": "https://region-b.geo-1.network.hpcloudsvc.com",
            "publicURL2": "",
            "region": "region-b.geo-1",
            "versionId": "2.0",
            "versionInfo": "https://region-b.geo-1.network.hpcloudsvc.com",
            "versionList": "https://region-b.geo-1.network.hpcloudsvc.com"
          }]
        }
      ]
    }

## 4. REST API Specifications
The Networking API is a ReSTful HTTP service that uses all aspects of the HTTP protocol including methods, URIs, media types and response codes.

### 4.1 Service API Operations

**Hosts**:   
https://region-a.geo-1.network.hpcloudsvc.com   
https://region-b.geo-1.network.hpcloudsvc.com

**BaseUri**: {Host}

**Admin URI**: N/A

| Resource              | Operation            | URI | Path      | JSON/XML Support? |
| :-------------------- | :------------------- | :---------- | :--------------------- | :---------------- |
| [**Limits**](#network_limits) | | | | |
| | [List Limits](#list_limits) | GET | /quotas/{project_id} | Y/Y | 
| [**Networks**](#network_api) | | | | | 
| | [Create Network](#create_network) | POST | /networks | Y/Y |
| | [Get Network](#get_network) | GET | /networks/{id} | Y/Y |
| | [Update Network](#update_network) | PUT | /networks/{id} | Y/Y |
| | [Delete Network](#delete_network) | DELETE | /networks/{id} | Y/Y |
| | [List all Networks](#list_networks) | GET | /networks | Y/Y |
| [**Subnets** ](#subnet_api) | | | | |
| | [Create Subnet](#create_subnet) | POST | /subnets | Y/Y |
| | [Get Subnet](#get_subnet) | GET | /subnets/{id}  | Y/Y |
| | [Update Subnet](#update_subnet) | PUT | /subnets/{id} | Y/Y |
| | [Delete Subnet](#delete_subnet) | DELETE | /subnets/{id} | Y/Y |
| | [List all Subnets](#list_subnets) | GET | /subnets | Y/Y |
| [**Ports**](#port_api) | | | | | 
| | [Create Port](#create_port) | POST | /ports | Y/Y |
| | [Get Port](#get_port) | GET | /ports/{id}  | Y/Y |
| | [Update Port](#update_port) | PUT | /ports/{id} | Y/Y |
| | [Delete Port](#delete_port) | DELETE | /ports/{id} | Y/Y |
| | [List all Ports](#list_ports) | GET | /ports/{id} | Y/Y |
| [**Routers**](#router_api) | | | | | 
| | [Create Router](#create_router) | POST | /routers | Y/Y |
| | [Get Router](#get_router) | GET | /routers/{id}  | Y/Y |
| | [Update Router](#update_router) | PUT | /routers | Y/Y |
| | [Delete Router](#delete_router) | DELETE | /routers/{id} | Y/Y |
| | [List all Routers](#list_routers) | GET | /routers/{id} | Y/Y |
| | [Create Router Interface](#add_interface) | PUT | /routers/{id}/add_router_interface | Y/Y |
| | [Delete Router Interface](#delete_interface) | PUT | /routers/{id}/remove_router_interface | Y/Y |
| [**Floating IPs**](#floatingip_api) | | | |
| | [Create Floating IP](#create_fIP) | POST | /floatingips | Y/Y |
| | [Get Floating IP](#get_fIP) | GET | /floatingips/{id} | Y/Y |
| | [Update Floating IP](#update_fIP) | PUT | /floatingips/{id} | Y/Y |
| | [Delete Floating IP](#delete_fIP) | DELETE | /floatingips/{id} | Y/Y |
| | [List all Floating IP](#list_fIPs) | GET | /floatingips | Y/Y |
| [**Security Groups**](#securitygroup_api) | | | | | 
| | [Create Security Group](#create_securityGroup) | POST | /security-groups | Y/Y |
| | [Get Security Group](#get_securityGroup) | GET | /security-groups/{id}  | Y/Y |
| | [Delete Security Group](#delete_securityGroup) | DELETE | /security-groups/{id} | Y/Y |
| | [List all Security Groups](#list_securityGroup) | GET | /security-groups  | Y/Y |
| [**Security Group Rules**](#securitygrouprules_api) | | | | |
| | [Create Security Group Rule](#create_securityGroupRule) | POST | /security-group-rules | Y/Y |
| | [Get Security Group Rule](#get_securityGroupRule) | GET | /security-group-rules/{id}  | Y/Y |
| | [Delete Security Group Rule](#delete_securityGroupRule) | DELETE | /security-group-rules/{id} | Y/Y |
| | [List Security Group Rules](#get_securityGroupRule) | GET | /security-group-rules | Y/Y |

### 4.1.1 Filtering and Fields Selection ### {#filtering}

**Fields Selection**   
If there are *fields* in request URL, v2.0 API will extract the list of fields to return. 

Example:

    https://region-a.geo-1.network.hpcloudsvc.com/v2.0/networks?fields=id&amp;fields=name

**Filtering by Value**   
Any other fields except the *fields* attribute may be used to filter resources. 
Example:   
  
    https://region-a.geo-1.network.hpcloudsvc.com/v2.0/networks?name=test1&amp;name=test2. 

### 4.2 Common Request Headers
The Networking API supports both the JSON and XML data serialization formats. The request format is specified using the Content-Type header and is required for operations that have a request body. 

Example Request - JSON:

    POST /v2.0/networks 
    Content-Type: application/json
    Accept: application/json
    
    {
        "network":
            {
                "name": "network-name",
                "admin_state_up": true
            }
    }

### 4.3 Common Response Headers
The Networking API supports both the JSON and XML data serialization formats. The response format can be specified in requests using either the Accept header or adding an .xml or .json extension to the request URI. If no response format is specified, JSON is the default. If conflicting formats are specified using both an Accept header and a query extension, the query extension takes precedence.

It is possible for a response to be serialized using a format different from the request. If no response format is specified, JSON is the default. If conflicting formats are specified using both an Accept header and a query extension, the query extension takes precedence.

Example Response - JSON

    HTTP/1.1 201 Created
    Content-Type: application/json
    Content-Length 204

    {
        "network":
            {
                "status": "ACTIVE",
                "subnets": [],
                "name": "net-name",
                "admin_state_up": true,
                "tenant_id": "388a70781bae4ca895f17b7f6293eb70",
                "shared": false, "id": "2a4017ef-31ff-496a-9294-e96ecc3bc9c9"
            }
    }

### 4.4 HTTP Error Responses ### {#http_codes}
The v2.0 API returns an error response if a failure occurs while processing
a request. Networking uses only standard HTTP error codes. `4xx` errors typically indicate problems in the particular request being sent from the client.

- 400 Bad Request. Malformed request URI or body, requested admin state invalid, invalid values entered, validation failed, method not allowed for request body (such as trying to update attributes that can be specified at create-time only) 
 
- 401 Unauthorized. Invalid credentials provided

- 403 Forbidden.  User cannot access a specific resource or perform the requested operation
 
- 404 Not Found. Non existent URI, resource not found. Check for trailing slashes.

- 409 Conflict.  Port already configured on network, IP previously allocated on subnet, conflicting IP allocation pools for subnet.

- 500 Internal server error.  Internal Networking error.  Try operation again.

- 503 Service unavailable.  Failure in Mac address generation

### 4.5 Service API Operation Details
#### 4.5.1 Limits #### {#network_limits}
##### 4.5.1.1 List Limits ##### {#list_limits}
##### GET /v2.0/quotas/{project_id}

This operation is used to list current quota limits for a project

**Request Data**   
This operation does not require a request body.

**URL Parameters**   
N/A

**Data Parameters**   
This operation does not require a request body.

JSON

    GET /v2.0/quotas/{project_id}
    Accept: application/json
    Content-Type: application/json

XML

    GET /v2.0/quotas/{project_id}
    Accept: application/xml
    Content-Type: application/xml

**Success Response**   
200 - OK

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.

**Response Data**
This operation returns a response body.

JSON

    Content-Type: application/json
     
    {
        quota: 
            {
                subnet: 5
                network: 5
                floatingip: 45
                security_group_rule: 50
                security_group: 10
                router: 2
                port: 70
            }
    }

XML

    Content-Type: application/xml
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <quota>
        <subnet quantum:type="int">5</subnet>
        <network quantum:type="int">5</network>
        <floatingip quantum:type="long">45</floatingip>
        <security_group_rule quantum:type="int">50</security_group_rule>
        <security_group quantum:type="int">10</security_group>
        <router quantum:type="long">2</router>
        <port quantum:type="int">70</port>
    </quota>

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2.0/quotas/{project_id}

#### 4.5.2 Networks #### {#network_api}

These operations are used to manage Network resources.

| Verb    | URI        |      Description |
| :------------ | :---------- | :-------- |
| GET    | /v2.0/networks             |   Lists a summary of all networks |
| GET    | /v2.0/networks/{id} |  Lists detailed information for the specified network. |
| POST   | /v2.0/networks              |  Creates a new network.|
| PUT    | /v2.0/networks/{id} |  Updates the specified network. |
| DELETE | /v2.0/networks/{id} |  Destroys the specified network. |

The following table describes the attributes available for network objects:   

| Attribute     | Type        | Required  | CRUD      |  Default Value | Description |
| :------------ | :---------- | :-------- | :-------- | :-------- | :---------------- |
| id  | uuid-str  | N/A   | R  | generated id | UUID of the network.|
| name | string  | N |  CRU | N/A |  Symbolic name for the network.  Name is not required to be unique.|
| admin_state_up  | bool | N |  CRU | true  | Administrative status of the network. If false (down), the network will not forward packets. |
| status | string | N/A  | R | N/A | Indicates whether the network is currently operational. Possible values include: ACTIVE, DOWN, BUILD, ERROR |
| tenant_id   | uuid-str | N | CR  | N/A | Owner of the network.  Only admin users can specify a tenant identifier other than its own. |
| subnets  | list(uuid) | N | CRU   |empty list | Subnets associated with this network.|
| shared | bool | No |CRU | false| Specifies if this network should be shared across all tenants or not. Note that the default policy setting restricts usage of this attribute to administrative users only. |
|port_security_enabled | bool | N | CRU|  true | Specifies if new ports created on this network should have the port security extension enabled or disabled. |

**Unsupported API calls**   
Bulk Create Networks

**Status Lifecycle**   
N/A

**Rate Limits**   
Rate limits apply.

**Quota Limits**   
Default of five (5) networks per tenant.

**Business Rules**   
None

##### 4.5.2.1 List Networks ##### {#list_networks}
##### GET /v2.0/networks

This operation lists a summary of all networks defined in Networking that are accessible to the tenant who submits the request. Results provide the unique ID for each network.

**Request Data**   
This operation does not require a request body.

**URL Parameters**   
Users can control which attributes should be returned by using the fields query parameter. See [Filtering and Column Selection](#filtering) for more information. Filtering is supported on all top level attributes of an API entity. For example: 

    GET /v2.0/networks?name={name}

**Data Parameters**   
This operation does not require a request body.

JSON

    GET /v2.0/networks
    Accept: application/json
    Content-Type: application/json

XML

    GET /v2.0/networks
    Accept: application/xml
    Content-Type: application/xml

**Success Response**   
200 - OK

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.

**Response Data**
This operation returns a response body.

JSON

    Content-Type: application/json
    
    {
        networks: [1]
            0:  {
            status: "ACTIVE"
            subnets: [1]
                0:  "e12f0c45-46e3-446a-b207-9474b27687a6"
            name: "network_example"
            router:external: false
            tenant_id: "10979209027984"
            admin_state_up: true
            shared: false
            port_security_enabled: true
            id: "afc75773-640e-403c-9fff-62ba98db1f19"
            }
    }

XML

    Content-Type: application/xml
    
    <networks>
        <network>
            <status>ACTIVE</status>
            <subnets>
                <subnet>e12f0c45-46e3-446a-b207-9474b27687a6</subnet>
            </subnets>
            <name>network_example</name>
            <router:external quantum:type="bool">False</router:external>
            <tenant_id>10979209027984</tenant_id>
            <admin_state_up quantum:type="bool">True</admin_state_up>
            <shared quantum:type="bool">False</shared>
            <port_security_enabled quantum:type="bool">True</port_security_enabled>
            <id>afc75773-640e-403c-9fff-62ba98db1f19</id>
        </network>
    </networks>

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseUri}/v2.0/networks

##### 4.5.2.2 Show Network ##### {#get_network}
##### GET /v2.0/networks/{id}

This operation returns the status, subnets, name, tenant ID, admin state, shared status, port security status, and ID for the specified network ID.

**Request Data**   
This operation does not require a request body.  

**URL Parameters**   
Users can control which attributes should be returned by using the fields query parameter. See [Filtering and Column Selection](#filtering) for more information. Filtering is supported on all top level attributes of an API entity. For example:

    GET /v2.0/networks/{id}?name=foobar 

**Data Parameters**   
This operation does not require a request body.

JSON   

    GET /v2.0/networks/{id}
    Accept: application/json
    Content-Type: application/json

XML

    GET /v2.0/networks/{id}
    Accept: application/xml
    Content-Type: application/xml

**Success Response**   
200 - OK

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.

**Response Data**   
This operation returns a response body.

JSON

    Content-Type: application/json

    {
        network: {
            status: "ACTIVE"
            subnets: [1]
                0:  "e12f0c45-46e3-446a-b207-9474b27687a6"
            name: "network_example"
            router:external: false
            tenant_id: "10979209027984"
            admin_state_up: true
            shared: false
            port_security_enabled: true
            id: "afc75773-640e-403c-9fff-62ba98db1f19"
            }
    }

XML

    Content-Type: application/xml
    
    <network>
        <status>ACTIVE</status>
        <subnets>
            <subnet>e12f0c45-46e3-446a-b207-9474b27687a6</subnet>
        </subnets>
        <name>network_example</name>
        <router:external quantum:type="bool">False</router:external>
        <tenant_id>10979209027984</tenant_id>
        <admin_state_up quantum:type="bool">True</admin_state_up>
        <shared quantum:type="bool">False</shared>
        <port_security_enabled quantum:type="bool">True</port_security_enabled>
        <id>afc75773-640e-403c-9fff-62ba98db1f19</id>
    </network>

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**     

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 404 | Not Found | Non existent URI, resource not found.  |

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseUri}/v2.0/networks/{id}

##### 4.5.2.3 Create Network ##### {#create_network}
##### POST /v2.0/networks

This operation creates a new network using the specified symbolic name for the network.

To specify a *tenant_id* different from the authenticated tenant requires administrative privileges.

**Request Data**   
This operation does not require a request body. 

**URL Parameters**   
N/A

**Data Parameters**    
A request body is not required.  If specified the body may optionally include one or more of the network attributes.

The *port_security_enabled* attribute is optional.  If not specified, the attribute will be created with the default value of True.

JSON

    POST /v2.0/networks
    Accept: application/json
    Content-Type: application/json
    
    {
        "network":
            {
                "name": "sample_network",
                "admin_state_up": false
                "port_security_enabled": true
            }
    }

XML

    POST /v2.0/networks
    Accept: application/xml
    Content-Type: application/xml
    
    <network>
        <name>sample_network</name>
        <admin_state_up>true</admin_state_up>
        <port_security_enabled>true</port_security_enabled>
    </network>

**Success Response**  
201 - Created

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.  

**Response Data**   
This operation returns a response body.

JSON 
  
    Content-Type: application/json
    
    {
        network: 
            {
            status: "ACTIVE"
            subnets: [0]
            name: "network_example"
            router:external: false
            tenant_id: "10979209027984"
            admin_state_up: true
            shared: false
            port_security_enabled: true
            id: "4bc5fbb8-a6c4-43a1-88b3-3216d8892d57"
            }
    }

XML

    Content-Type: application/xml
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <network>
        <status>ACTIVE</status>
            <subnets quantum:type="list" />
        <name>sample_network</name>
        <router:external quantum:type="bool">False</router:external>
        <tenant_id>10979209027984</tenant_id>
        <admin_state_up quantum:type="bool">False</admin_state_up>
        <shared quantum:type="bool">False</shared>
        <port_security_enabled quantum:type="bool">True</port_security_enabled>
        <id>4bc5fbb8-a6c4-43a1-88b3-3216d8892d57</id>
    </network>

**Error Response**  
If an error occurs, the response body contains a description of the error. 

**Status Code**
     
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Example**

    curl -i -k -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"network":{"name": "{name}", "admin_state_up": true, "port_security_enabled": true}}' {BaseURI}/v2.0/networks

##### 4.5.2.4 Update Network ##### {#update_network}
##### PUT /v2.0/networks/{id}

This operation updates the specified network object.  

It is not allowed to update the *status*, *tenant_id*, or *id* attributes. Attempts to update these attributes will result in a 400 Bad Request error being returned.

**Request Data**   
This operation requires a request body. The request body must contain a network object that specifies a symbolic name for the network.

**URL Parameters**   
N/A

**Data Parameters**     
This operation requires a request body.  

JSON

    PUT /v2.0/networks/{id} 
    Content-Type: application/json
    Accept: application/json
    
    {
        "network":
            {
                "name": "updated_name"
            }
    }

XML

    PUT /v2.0/networks/{id}
    Content-Type: application/xml
    Accept: application/xml
    
    <network>
        <name>updated_name</name>
    </network>

**Success Response**   
200 - OK

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.  

**Response Data**   
This operation returns a response body.

JSON  

    Content-Type: application/json
    
    {
        "network":
            {
            "status": "ACTIVE",
            "subnets": [],
            "name": "updated_name",
            "admin_state_up": false,
            "shared": false,
            "tenant_id": "c1210485b2424d48804aad5d39c61b8f",
            "id": "fc68ea2c-b60b-4b4f-bd82-94ec81110766"
            "port_security_enabled": true
            }
    }

XML

    Content-Type: application/xml
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <network>
        <status>ACTIVE</status>
        <subnets quantum:type="list" />
        <name>network_example</name>
        <router:external quantum:type="bool">False</router:external>
        <tenant_id>10979209027984</tenant_id>
        <admin_state_up quantum:type="bool">False</admin_state_up>
        <shared quantum:type="bool">False</shared>
        <port_security_enabled quantum:type="bool">True</port_security_enabled>
        <id>d97b0cc1-01bc-4349-8a9c-8388150104f0</id>
    </network>

**Error Response**  
If an error occurs, the response body contains a description of the error. 
 
**Status Code**     

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 403 | Forbidden | Operation not allowed. |
| 404 | Not Found | Non existent URI, resource not found. |

**Curl Example**

    curl -i -k -X PUT -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"network":{"name": "{name}"}}' {BaseURI}/v2.0/networks/{id}

##### 4.5.2.5 Delete Network ##### {#delete_network}
##### DELETE /networks/{id}

This operation deletes a network and its associated subnets provided that no port is currently configured on the network.  

If ports are still configured on the network specified for deletion, a '409 Network In Use' error is returned.

**Request Data**  
This operation does not require a request body. 

**URL Parameters**   
N/A

**Data Parameters**    
This operation does not require request body.

JSON

    DELETE /v2.0/networks/{id} 
    Content-Type: application/json
    Accept: application/json

XML

    DELETE /v2.0/networks/{id}
    Content-Type: application/XML
    Accept: application/xml

**Success Response**  
204 - Delete successful; no content to return

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.  

**Response Data**   
This operation does not return a response body.

**Error Response**   
If an error occurs, the response body contains a description of the error.
 
**Status Code**  
   
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 404 | Not Found| Non existent URI, resource not found. |
| 409 | Network in Use | Unable to delete.  Network is in use. |

**Curl Example**

    curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2.0/networks/{id}

#### 4.5.3 Subnets #### {#subnet_api}

Manage subnet resources.

| Verb    | URI        |      Description |
| :------------ | :---------- | :-------- |
| GET    |  /v2.0/subnets        |       Lists all subnets that are accessible to the tenant who submits the request.|
| GET     | /v2.0/subnets/{id} |  Lists detailed information for the specified subnet.|
| POST    | /v2.0/subnets              | Creates a subnet on the specified network.|
| PUT     | /v2.0/subnets/{id}  | Updates the specified subnet.|
| DELETE  | /v2.0/subnets/{id}  | Removes the specified subnet.|

The following table describes the attributes for subnet objects: 
 
| Attribute | Type  | Required  | CRUD  | Default Value | Validation | Description  | Notes |
| :---------- | :---------- | :------------ | :-------------- | :----------- | :----------------------- | :---------------- | :---------------- |
| id  | uuid-str  | N/A | R | generated | N/A | UUID of the subnet |
| network_id | uuid-str | Yes | CR  | N/A | Network this subnet is associated with. | | 
| name  | string  | No  | CRU | None  | N/A | Human-readable name for the subnet. Might not be unique. |
| ip_version  | int | No  | CR  | 4 | 4 |IP version | IPv6 is not supported
| CIDR  | string  | Yes | CR  | N/A | valid CIDR in the form *network_address/prefix* | CIDR representing the IP range for this subnet.  Based on the IP version |
|gateway_ip |string | No  | CRUD  | first address in CIDR | Valid IP address or null  | Default gateway used by devices in this subnet. |
| dns_nameservers | list(str) | No  | CRU | Empty list  | N/A | DNS name servers used by hosts in this subnet. |
| allocation_pools |list(dict) |No  | CR  |Every address in CIDR, excluding gateway_ip if configured |start/end of range must be valid IP |Sub-ranges of CIDR available for dynamic allocation to ports [ { "start": "10.0.0.2", "end": "10.0.0.254"} ] |
|host_routes  | list(dict)|No | CRU | Empty List  | [] | Routes that should be used by devices with IPs from this subnet (not including local subnet route). | 
|enable_dhcp | bool |No | CRU | true  | true, false |Specifies whether DHCP is enabled for this subnet or not.|
|tenant_id  | uuid-str  | No |  CR  | N/A| N/A | Owner of the network.  Only admin users can specify a tenant identifier other than its own.|

**Unsupported API calls**   
Bulk Create Subnets

**Status Lifecycle**   
N/A

**Rate Limits**   
Rate limits apply.

**Quota Limits**  
Default of one (1) subnet per network

**Business Rules**   
None

##### 4.5.3.1 List Subnets ##### {#list_subnets}
##### GET /v2.0/subnets

This operation returns a list of subnet objects the tenant has access to. Default policy settings return exclusively subnets owned by the tenant submitting the request, unless the request is submitted by an user with administrative rights. You can control which attributes are returned by using the *fields* query parameter. See [Filtering and Column Selection](#filtering) for more information.

This operation lists a summary of all subnets defined in your network that are accessible to the tenant who submits the request. The list provides the unique ID for each subnet.

**Request Data**   
This operation does not require a request body.

**URL Parameters**   
Users can control which attributes should be returned by using the fields query parameter. See [Filtering and Column Selection](#filtering) for more information. Filtering is supported on all top level attributes of an API entity. For example: 

    GET /v2.0/subnets?name={name}

**Data Parameters**   
This operation does not require a request body.

JSON

    GET /v2.0/subnets
    Content-Type: application/json
    Accept: application/json

XML

    GET /v2.0/subnets
    Content-Type: application/xml
    Accept: application/xml

**Success Response**   
200 - OK

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.

**Response Data**   
This operation returns a response body.

JSON

    Content-Type: application/json
    
    {
        subnets: [1]
            0:  {
            name: "subnet_example"
            enable_dhcp: true
            network_id: "8ff719a1-914f-43a4-879a-b70ad23547ad"
            tenant_id: "10979209027984"
            dns_nameservers: [0]
                allocation_pools: [1]
                0:  {
                start: "10.0.0.2"
                end: "10.0.0.254"
                }
            host_routes: [0]
            ip_version: 4
            gateway_ip: "10.0.0.1"
            cidr: "10.0.0.0/24"
            id: "8a96392c-86cd-472b-bd05-0498303f088e"
            }
    }

XML

    Content-Type: application/xml
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <subnets>
        <subnet>
            <name>subnet_example</name>
            <enable_dhcp quantum:type="bool">True</enable_dhcp>
            <network_id>8ff719a1-914f-43a4-879a-b70ad23547ad</network_id>
            <tenant_id>10979209027984</tenant_id>
            <dns_nameservers quantum:type="list" />
                <allocation_pools>
                    <allocation_pool>
                    <start>10.0.0.2</start>
                    <end>10.0.0.254</end>
                    </allocation_pool>
                </allocation_pools>
            <host_routes quantum:type="list" />
            <ip_version quantum:type="long">4</ip_version>
            <gateway_ip>10.0.0.1</gateway_ip>
            <cidr>10.0.0.0/24</cidr>
            <id>8a96392c-86cd-472b-bd05-0498303f088e</id>
        </subnet>
    </subnets>

**Error Response**   
If an error occurs, the response body contains a description of the error.  

**Status Code**      

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Example**
  
    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2.0/subnets

##### 4.5.3.2 Show Subnet ##### {#get_subnet}
##### GET /v2.0/subnets/{id}

This operation returns data about the subnet specified in the request URI. You can control which attributes are returned by using the *fields* query parameter. See [Filtering and Column Selection](#filtering) for more information.

**Request Data**   
This operation does not require a request body.

**URL Parameters**   
Users can control which attributes should be returned by using the fields query parameter. See [Filtering and Column Selection](#filtering) for more information. Filtering is supported on all top level attributes of an API entity. For example:

    GET /v2.0/subnets/{id}?name={name}

**Data Parameters**   
This operation does not require a request body.

JSON

    GET /v2.0/subnets/{id}
    Content-Type: application/json
    Accept: application/json

XML

    GET /v2.0/subnets/{id}
    Content-Type: application/xml
    Accept: application/xml

**Success Response**   
200 - OK

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.

**Response Data**
This operation returns a response body.

JSON

    Content-Type: application/json
    
    {
        subnet: 
            {
            name: "subnet_example"
            enable_dhcp: true
            network_id: "8ff719a1-914f-43a4-879a-b70ad23547ad"
            tenant_id: "10979209027984"
            dns_nameservers: [0]
            allocation_pools: [1]
                0:  {
                start: "10.0.0.2"
                end: "10.0.0.254"
                }
            host_routes: [0]
            ip_version: 4
            gateway_ip: "10.0.0.1"
            cidr: "10.0.0.0/24"
            id: "8a96392c-86cd-472b-bd05-0498303f088e"
            }
    }

XML

    Content-Type: application/xml
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <subnet>
        <name>subnet_example</name>
        <enable_dhcp quantum:type="bool">True</enable_dhcp>
        <network_id>8ff719a1-914f-43a4-879a-b70ad23547ad</network_id>
        <tenant_id>10979209027984</tenant_id>
        <dns_nameservers quantum:type="list" />
        <allocation_pools>
          <allocation_pool>
          <start>10.0.0.2</start>
          <end>10.0.0.254</end>
          </allocation_pool>
        </allocation_pools>
        <host_routes quantum:type="list" />
        <ip_version quantum:type="long">4</ip_version>
        <gateway_ip>10.0.0.1</gateway_ip>
        <cidr>10.0.0.0/24</cidr>
        <id>8a96392c-86cd-472b-bd05-0498303f088e</id>
    </subnet>

**Error Response**  
If an error occurs, the response body contains a description of the error.  

**Status Code**      

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | The allocation pool spans beyond the subnet CIDR |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 404 | Not Found | Non existent URI, resource not found. |

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2.0/subnets{id}

##### 4.5.3.3 Create Subnet ##### {#create_subnet}
##### POST /v2.0/subnets 

This operation creates a new subnet on the specified network. The *network_id* is required. You must also specify the *cidr* attribute for the subnet, in the form: *network_address/prefix*

By default, Networking creates IPv4 subnets. Networking does not try to derive the correct IP version from the provided CIDR. If the parameter for the gateway address, *gateway_ip*, is not specified, an address from the CIDR for the gateway of the subnet, is allocated.

**NOTE:** HPCS Networking does not support the use of IPv6, at this time.

To specify a subnet without a gateway, specify the value null for the *gateway_ip* attribute in the request body. If the *allocation_pools* attribute is not specified, Networking automatically allocates pools for covering all IP addresses in the CIDR, excluding the address reserved for the subnet gateway. Otherwise, you can explicitly specify allocation pools as shown in the following example.

When the attributes *allocation_pools* and *gateway_ip* are both specified, it is up to the user to ensure the gateway IP does not overlap with the specified allocation pools; otherwise a 409 Conflict error will be returned.

A subnet can only be added to a network that is owned by the same tenant. Attempting to add a subnet to another users network will result in a 403 error:  Tenant not allowed to create subnet on this network.

**Request Data**   
Both the *network_id* and the *cidr* attributes are required. 

**URL Parameters**   
N/A

**Data Parameters**  
A request body is required. 

JSON

    POST /v2.0/subnets
    Content-Type: application/json
    Accept: application/json
    
    {
        "subnet": 
            {
                "network_id": "{id}",
                "name": "{name}",
                "ip_version": 4,
                "cidr": "10.0.0.0/24",
                "allocation_pools": 
                    [{
                    "start": "10.0.0.2", 
                    "end": "10.0.0.254"
                    }]
            }
    }

XML
  
    POST /v2.0/subnets
    Content-Type: application/xml
    Accept: application/xml
    
    <subnet>
    <network_id>{Network_ID}</network_id>
    <name>{Subnet_Name}</name>
    <ip_version>4</ip_version>
    <cidr>10.0.0.0/24</cidr>
    <allocation_pools>
     <allocation_pool>
         <start>10.0.0.2</start>
         <end>10.0.0.254</end>
     </allocation_pool>
    </allocation_pools>
    </subnet>

**Success Response**   
201 - Created

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.

**Response Data**
This operation returns a response body.

JSON

    Content-Type: application/json
    
    {
        subnet: 
            {
            name: "subnet_example"
            enable_dhcp: true
            network_id: "8ff719a1-914f-43a4-879a-b70ad23547ad"
            tenant_id: "10979209027984"
            dns_nameservers: [0]
            allocation_pools: [1]
                0:  {
                start: "10.0.0.2"
                end: "10.0.0.254"
                }
            host_routes: [0]
            ip_version: 4
            gateway_ip: "10.0.0.1"
            cidr: "10.0.0.0/24"
            id: "fd3b0981-43d0-486c-b1cb-630c4778174a"
            }
    }

XML

    Content-Type: application/xml
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <subnet>
    <name>subnet_example</name>
    <enable_dhcp quantum:type="bool">True</enable_dhcp>
    <network_id>8ff719a1-914f-43a4-879a-b70ad23547ad</network_id>
    <tenant_id>10979209027984</tenant_id>
    <dns_nameservers quantum:type="list" />
    <allocation_pools>
        <allocation_pool>
        <start>10.0.0.2</start>
        <end>10.0.0.254</end>
        </allocation_pool>
    </allocation_pools>
    <host_routes quantum:type="list" />
    <ip_version quantum:type="int">4</ip_version>
    <gateway_ip>10.0.0.1</gateway_ip>
    <cidr>10.0.0.0/24</cidr>
    <id>c2d51cea-a1eb-48eb-affc-dd929c5791f5</id>
    </subnet>

**Error Response**  
If an error occurs, the response body contains a description of the error.

**Status Code**      
See [HTTP Status Codes](#http_codes) for more information.

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 403 | Forbidden | Operation not allowed |
| 404 | Not Found | Non existent URI, resource not found. |
| 409 | Conflict | Duplicate Network present. |

**Curl Example**
  
    curl -i -k -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"subnet": {name: "{name}", "network_id": "{id}","ip_version": 4,"cidr": "10.0.0.0/24","allocation_pools": [{"start": "10.0.0.2", "end": "10.0.0.254"}]}}' {BaseURI}/v2.0/subnets

##### 4.5.3.4 Update Subnet ##### {#update_subnet}
##### PUT /v2.0/subnets/{id}

This operation updates the specified subnet. 

Some attributes, such as IP version (ip_version), CIDR (cidr), and IP allocation pools (allocation_pools) cannot be updated. Attempting to update these attributes will result in a 400 - Bad Request error.

**Request Data**   
This operation requires a request body.

**URL Parameters**   
N/A

**Data Parameters**   
This operation requires a request body.

JSON

    PUT /v2.0/subnets/{id}
    Content-Type: application/json
    Accept: application/json
    
    {
        "subnet":
            {
            "gateway_ip": "{gateway_ip}",
            "name": "{name}"
            }
    }

XML   

    PUT /v2.0/subnets/{id}
    Content-Type: application/xml
    Accept: application/xml
    
    <subnet>
      <gateway_ip>{gateway_ip}</gateway_ip>
      <name>{name}2</name>
    </subnet>

**Success Response**   
200 - OK

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.

**Response Data**
This operation returns a response body.

JSON

    Content-Type: application/json
    
    {
        subnet: {
            name: "subnet_example2"
            enable_dhcp: true
            network_id: "8ff719a1-914f-43a4-879a-b70ad23547ad"
            tenant_id: "10979209027984"
            dns_nameservers: [0]
                allocation_pools: [1]
                    0:  {
                    start: "10.0.0.2"
                    end: "10.0.0.254"
                    }
            host_routes: [0]
            ip_version: 4
            gateway_ip: "10.0.1.2"
            cidr: "10.0.0.0/24"
            id: "8a96392c-86cd-472b-bd05-0498303f088e"
            }
    }

XML   

    Content-Type: application/xml
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <subnet>
        <name>subnet_example2</name>
        <enable_dhcp quantum:type="bool">True</enable_dhcp>
        <network_id>8ff719a1-914f-43a4-879a-b70ad23547ad</network_id>
        <tenant_id>10979209027984</tenant_id>
        <dns_nameservers quantum:type="list" />
        <allocation_pools>
            <allocation_pool>
            <start>10.0.0.2</start>
            <end>10.0.0.254</end>
            </allocation_pool>
        </allocation_pools>
        <host_routes quantum:type="list" />
        <ip_version quantum:type="long">4</ip_version>
        <gateway_ip>10.0.1.2</gateway_ip>
        <cidr>10.0.0.0/24</cidr>
        <id>8a96392c-86cd-472b-bd05-0498303f088e</id>
    </subnet>

**Error Response**  
If an error occurs, the response body contains a description of the error.

**Status Code**      

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 403 | Forbidden | Disabled or suspended user making the request. |
| 404 | Not Found | Non existent URI, resource not found. |

**Curl Example**

    curl -i -k -X PUT -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"subnet":{"gateway_ip": "{gateway_ip}","name":"{name}"}}' {BaseURI}/v2.0/subnets/{id}

##### 4.5.3.5 Delete Subnet ##### {#delete_subnet}
##### DELETE /v2.0/subnets/{id}

This operation removes a subnet from the specified network. The operation fails if IP addresses from the subnet are still allocated.

**Request Data**   
This operation does not require a request body.

**URL Parameters**   
N/A

**Data Parameters**   
This operation does not require a request body.

JSON

    DELETE /v2.0/subnets/{id}
    Content-Type: application/json
    Accept: application/json

XML

    DELETE /v2.0/subnets/{id}
    Content-Type: application/xml
    Accept: application/xml

**Success Response**   
204 - Delete successful; no content returned

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.

**Response Data**   
This operation does not return a response body.

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**      

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 404 | Not Found | Non existent URI, resource not found. |
| 409 | Conflict | Unable to delete subnet. |

**Curl Example**

    curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2.0/subnets/{id}

#### 4.5.4 Ports #### {#port_api}

Manage port resources.

| Verb    | URI                | Description |
| :------------ | :----------  | :-------- |
| GET     | /v2.0/ports        | Lists all ports |
| GET     | /v2.0/ports/{id}   | Shows information for the specified port |
| POST    | /v2.0/ports        | Creates a new port |
| PUT     | /v2.0/ports/{id}   | Updates the specified port |
| DELETE  | /v2.0/ports/{id}   | Removes the specified port |

The following table describes the attributes for port objects: 

| Attribute | Type | Required | CRUD | Default Value | Validation | Description |
| :-------- | :--- | :------- | :--- | :------------ | :--------- | :----------- |
| id  | uuid-str  | N/A | R | generated | N/A | UUID of the port. |
| network_id | uuid-str | Yes | CR  | N/A | Network this port is associated with. | 
| name  | string  | No  | CRU | None  | N/A | Human-readable name for the port. Not required to be unique. |
| admin_state_up | bool  | No  | CRU | true  | true, false | Administrative state of the port. If false (down), port will not forward packets. |
| status | string | N/A | R | N/A | N/A | Indicates if network is currently operational. Possible values include:  ACTIVE, DOWN, BUILD, ERROR |
| mac_address | string  | No | CR | generated  | Valid MAC in 6-octet form separated by colons | MAC address to use on this port. |
| fixed_ips | list(dict) | No | CRU | automatically allocated from pool |  Valid IP address and existing subnet identifier | Specifies IP addresses for the port thus associating the port itself with the subnets where the IP addresses are picked from |
| device_id | string | No | CRUD | None | No constraint | Identifies the device (e.g., virtual server) using this port. |
| device_owner | string | No | CRUD | None | No constraint | Identifies the entity (e.g., dhcp agent) using this port. |
| tenant_id | uuid-str | No | CR | N/A | No constraint | Owner of network. Only admin users can specify a tenant_id other than their own. |
| port_security_enabled | bool | N | CR | same value as network |  | If set to True, the rules of the default security group will be applied on the port.  If False, no security group rules will be applied. |

**Unsupported API calls**   
Bulk Create Ports

**Status Lifecycle**   
N/A

**Rate Limits**   
Rate limits apply.

**Quota Limits**   
Default of seventy (70) ports per tenant; one port per a VM.

**Business Rules**   
None

##### 4.5.4.1 List Ports ##### {#list_ports}
##### GET /v2.0/ports

This operation returns a list of ports to which the tenant has access. Default policy settings return only those ports that are owned by the tenant who submits the request. Users can control which attributes should be returned by using the fields query parameter. 

**Request Data**   
This operation does not require a request body.

**URL Parameters**   
Users can control which attributes should be returned by using the fields query parameter. See [Filtering and Column Selection](#filtering) for more information. Filtering is supported on all top level attributes of an API entity.

**Data Parameters**   
This operation does not require a request body.

JSON

    GET /v2.0/ports
    Content-Type: application/json
    Accept: application/json

XML

    GET /v2.0/ports
    Content-Type: application/xml
    Accept: application/xml

**Success Response**   
200 - OK

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.

**Response Data**   
This operation returns a response body.

JSON

    Content-Type: application/json
    
    {
        ports: [1]
            0:  {
            status: "ACTIVE"
            name: ""
            admin_state_up: true
            network_id: "138a44f8-6ea4-4f5d-8671-e7b73fcdea67"
            tenant_id: "10979209027984"
            device_owner: ""
            mac_address: "fa:16:3e:b4:32:bd"
            port_security_enabled: true
                fixed_ips: [1]
                0:  {
                subnet_id: "713d823a-c438-4472-90e9-eca238699553"
                ip_address: "10.0.0.4"
                }
            id: "05dce6b4-1bec-4055-a2f8-b4a3bab10ba3"
            security_groups: [1]
                0:  "94b2a4be-3d6e-4687-9ec3-a5c4abde1377"
            device_id: ""
            }
    }

XML   

    Content-Type: application/xml
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <ports>
        <port>
            <status>ACTIVE</status>
            <name />
            <admin_state_up quantum:type="bool">True</admin_state_up>
            <network_id>138a44f8-6ea4-4f5d-8671-e7b73fcdea67</network_id>
            <tenant_id>10979209027984</tenant_id>
            <device_owner />
            <mac_address>fa:16:3e:b4:32:bd</mac_address>
            <port_security_enabled quantum:type="bool">True</port_security_enabled>
            <fixed_ips>
                <fixed_ip>
                <subnet_id>713d823a-c438-4472-90e9-eca238699553</subnet_id>
                <ip_address>10.0.0.4</ip_address>
                </fixed_ip>
            </fixed_ips>
            <id>05dce6b4-1bec-4055-a2f8-b4a3bab10ba3</id>
            <security_groups>
                <security_group>94b2a4be-3d6e-4687-9ec3-a5c4abde1377</security_group>
            </security_groups>
            <device_id />
        </port>
    </ports>

**Error Response**   
If an error occurs, the response body contains a description of the error.  

**Status Code**      

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2.0/ports

##### 4.5.4.2 Show Port ##### {#get_port}
##### GET /v2.0/ports/{id}

This operation returns information for the port specified in the request URI.

**Request Data**   
This operation does not require a request body.

**URL Parameters**   
N/A   

**Data Parameters**   
This operation does not require a request body.

JSON   

    GET /v2.0/ports/{id}
    Content-Type: application/json
    Accept: application/json

XML

    GET /v2.0/ports/{id}
    Content-Type: application/xml
    Accept: application/xml

**Success Response**   
200 - OK

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.

**Response Data**   
This operation returns a response body.

JSON

    Content-Type: application/json
    
    {
        port: 
            {
            status: "ACTIVE"
            name: ""
            admin_state_up: true
            network_id: "138a44f8-6ea4-4f5d-8671-e7b73fcdea67"
            tenant_id: "10979209027984"
            device_owner: ""
            mac_address: "fa:16:3e:b4:32:bd"
            port_security_enabled: true
            fixed_ips: [1]
                0:  {
                subnet_id: "713d823a-c438-4472-90e9-eca238699553"
                ip_address: "10.0.0.4"
                }
            id: "05dce6b4-1bec-4055-a2f8-b4a3bab10ba3"
            security_groups: [1]
                0:  "94b2a4be-3d6e-4687-9ec3-a5c4abde1377"
            device_id: ""
            }
    }

XML

    Content-Type: application/xml
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <port>
        <status>ACTIVE</status>
        <name />
        <admin_state_up quantum:type="bool">True</admin_state_up>
        <network_id>138a44f8-6ea4-4f5d-8671-e7b73fcdea67</network_id>
        <tenant_id>10979209027984</tenant_id>
        <device_owner />
        <mac_address>fa:16:3e:b4:32:bd</mac_address>
        <port_security_enabled quantum:type="bool">True</port_security_enabled>
        <fixed_ips>
            <fixed_ip>
            <subnet_id>713d823a-c438-4472-90e9-eca238699553</subnet_id>
            <ip_address>10.0.0.4</ip_address>
            </fixed_ip>
        </fixed_ips>
        <id>05dce6b4-1bec-4055-a2f8-b4a3bab10ba3</id>
        <security_groups>
        <security_group>94b2a4be-3d6e-4687-9ec3-a5c4abde1377</security_group>
        </security_groups>
        <device_id />
    </port>

**Error Response**
If an error occurs or the port is not found, the response body contains a description of the error.  

**Status Code**     

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 404 | Not Found | Non existent URI, resource not found. |

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2.0/ports/{id}

##### 4.5.4.3 Create Port ##### {#create_port}
##### POST /v2.0/ports

This operation creates a new port. The network where the port is created must be specified in the *network_id* attribute in the request body. You can also specify the following optional attributes:

- A symbolic name for the port
- MAC address. If an invalid address is specified a 400 Bad Request error will be returned, whereas a 409 Conflict error will be returned if the specified MAC address is already in use.
  - If the MAC address is not specified, Networking will try to allocate one for the port being created. If there is a failure while generating the address, a 503 Service Unavailable error will be returned.
- Administrative state. Set to true for up, and false for down.
- Fixed IPs
  - If you specify just a subnet ID, Networking allocates an available IP from that subnet to the port.
  - If you specify both a subnet ID and an IP address, Networking tries to allocate the specified address to the port.
  - Host routes for the port, in addition to the host routes defined for the subnets that the port is associated with.

**Request Data**   
The *network_id* must be specified in the request body.

**URL Parameters**   
N/A

**Data Parameters**   
This operation requires a request body.

The *port_security_enabled* attribute is optional.  If not specified, the attribute will have the same value as the network object value.

<!--
Also optional are the *device_id* and the *security_groups* attributes. -->

JSON

    POST /v2.0/ports
    Content-Type: application/json
    Accept: application/json
    
    {
        "port": 
            {
            "admin_state_up": "true", 
            "name": "{name}", 
            "network_id": "{id}"
            }
    }

XML   

    POST /v2.0/ports
    Content-Type: application/xml
    Accept: application/xml
    
    <port>
        <admin_state_up>true</admin_state_up>
        <name>{name}</name>
        <network_id>{id}</network_id>
    </port>

**Success Response**   
201 - Created

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.

**Response Data**
This operation returns a response body.

JSON

    Content-Type: application/json
    
    {
        port: 
            {
            status: "ACTIVE"
            name: "port_example"
            admin_state_up: true
            network_id: "8ff719a1-914f-43a4-879a-b70ad23547ad"
            tenant_id: "10979209027984"
            device_owner: ""
            mac_address: "fa:16:3e:d0:f8:8a"
            port_security_enabled: true
            fixed_ips: [1]
                0:  {
                subnet_id: "8a96392c-86cd-472b-bd05-0498303f088e"
                ip_address: "10.0.0.2"
                }
            id: "ea41aae0-29a7-448e-923f-8644deb27041"
            security_groups: [1]
                0:  "94b2a4be-3d6e-4687-9ec3-a5c4abde1377"
            device_id: ""
            }
    }

XML

    Content-Type: application/xml
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <port>
        <status>ACTIVE</status>
        <name>port_example</name>
        <admin_state_up quantum:type="bool">True</admin_state_up>
        <network_id>8ff719a1-914f-43a4-879a-b70ad23547ad</network_id>
        <tenant_id>10979209027984</tenant_id>
        <device_owner />
        <mac_address>fa:16:3e:f7:ca:f9</mac_address>
        <port_security_enabled quantum:type="bool">True</port_security_enabled>
        <fixed_ips>
            <fixed_ip>
            <subnet_id>8a96392c-86cd-472b-bd05-0498303f088e</subnet_id>
            <ip_address>10.0.0.2</ip_address>
            </fixed_ip>
        </fixed_ips>
        <id>16a7ec70-0687-48b9-9339-268859bbe931</id>
        <security_groups>
            <security_group>94b2a4be-3d6e-4687-9ec3-a5c4abde1377</security_group>
        </security_groups>
        <device_id />
    </port>

**Error Response**  
If an error occurs, the response body contains a description of the error.

**Status Code**      

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 403 | Forbidden | Disabled or suspended user making the request. |
| 404 | Not Found | Non existent URI, resource not found. |
| 409 | Conflict | Duplicate Port present. |
| 503 | MAC Generation Failure | Unable to generate MAC address.  Service unavailable |

**Curl Example**

    curl -i -k -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"port": {"admin_state_up": true, "name": "{name}", "network_id": "{id}", "port_security_enabled": true}}' {BaseURI}/v2.0/ports

##### 4.5.4.4 Update Port ##### {#update_port}
##### PUT /v2.0/ports/{id}

This operation updates the information for a port, such as its symbolic name and associated IPs. When you update IPs for a port, the previously associated IPs are removed, returned to their respective subnets allocation pools, and replaced by the IPs specified in the body for the update request. 

This operation replaces the *fixed_ip* attribute when it is specified, in the request body. If the new IP addresses are not valid (i.e., they are already in use) the operation fails and the existing IP addresses are not removed from the port.

**Request Data**   
This operation requires a request body. 

**URL Parameters**   
N/A

**Data Parameters**   
This operation requires a request body.

JSON
 
    PUT /v2.0/ports/{id}
    Content-Type: application/json
    Accept: application/json
    
    {
        "port":
            {
            "admin_state_up":"true",
            "name":"{name}",
            "fixed_ips":
                [{
                "ip_address": "{fixed_ip}",
                "subnet_id": "{id}"
                }]
            }
    }

**Success Response**   
200 - OK

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.  

**Response Data**   
This operation returns a response body.

JSON    
  
    Content-Type: application/json
    
    {
        port: 
            {
            status: "ACTIVE"
            name: "port_test"
            admin_state_up: true
            network_id: "8ff719a1-914f-43a4-879a-b70ad23547ad"
            tenant_id: "65589599430509"
            device_owner: ""
            mac_address: "fa:16:3e:d0:f8:8a"
            fixed_ips: [1]
                0:  {
                subnet_id: "8a96392c-86cd-472b-bd05-0498303f088e"
                ip_address: "10.0.0.8"
                }
            id: "ea41aae0-29a7-448e-923f-8644deb27041"
            security_groups: [1]
                0:  "94b2a4be-3d6e-4687-9ec3-a5c4abde1377"
            device_id: ""
            }
    }

**Error Response** 
If an error occurs, the response body contains a description of the error.  

**Status Code**     

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 403 | Forbidden | Disabled or suspended user making the request. |
| 404 | Not Found | Non existent URI, resource not found. |
| 409 | Conflict | Unable to update port. |

**Curl Example**

    curl -i -k -X PUT -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"port": {"admin_state_up":"true", "name":"{name}", "fixed_ips":[ {"ip_address": "{fixed_ip}", "subnet_id": "{id}"}]}}' {BaseURI}/v2.0/ports/{id}

##### 4.5.4.5 Delete Port ##### {#delete_port}
##### DELETE /v2.0/ports/{id}

This operation removes a port from the network. If IP addresses are associated with the port, they are returned to their respective subnets allocation pools.

**Request Data**   
This operation does not require request body. 

**URL Parameters**   
N/A

**Data Parameters**    
This operation does not require request body.   

JSON

    DELETE /v2.0/ports/{id}
    Content-Type: application/json
    Accept: application/json

XML

    DELETE /v2.0/ports/{id}
    Content-Type: application/xml
    Accept: application/xml

**Success Response**   
204 - Delete successful; no content returned

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.  

**Response Data**   
This operation does not return a response body.

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**     

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 403 | Forbidden | Disabled or suspended user making the request. |
| 404 | Not Found |Non existent URI, resource not found. |

**Curl Example**

    curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2.0/ports/{id}

#### 4.5.5 Layer-3 Networking Extensions #### {#extension_api}
##### 4.5.5.1 Router Operations ##### {#router_api}

Manage routers through the Networking L3 API extension.

A router is used to interconnect subnets and forward traffic among them. Another feature of the router is to NAT internal traffic to external networks.

A router has an interface for each subnet it is associated with. By default the IP address of such interface is the subnet's gateway IP. Also, whenever a router is associated with a subnet, a port for that router interface will be added to the subnet's network.   

| Verb    | URI        |      Description |
| :------------ | :---------- | :-------- |
| GET    |  /v2.0/routers    |         List of logical routers to which the tenant has access |
| GET     | /v2.0/routers/{id} |  Show details of the specified logical router|
| POST  | /v2.0/routers     | Create a new logical router|
| PUT     | /v2.0/routers/{id}|  Update the specified logical router|
| DELETE  | /v2.0/routers/{id} | Removes the specified logical router and its external gateway interface, if it exists|
| PUT   | /v2.0/routers/{id}/add_router_interface | Add a new internal interface to the specified logical router|
| PUT   | /v2.0/routers/{id}/remove_router_interface | Remove the internal interface to the specified logical router|

The following table describes the attributes for router objects: 
  
| Attribute | Type  | Required  | CRUD  | Default Value | Validation | Description  |
| :---------- | :---------- | :------------ | :-------------- | :----------- | :----------------------- | :---------------- | 
| id  | uuid-str  | N/A | R | generated | N/A | UUID of the router. |
| name |  string |  No |  CRU | None  | N/A | Human readable name for the router. Name is not required to be unique. |
| admin_state_up  | bool |  No |  CRU | true  |true, false |  Administrative state of the router. |
|status | string  | N/A | R | N/A | N/A | Indicates whether a router is currently operational or not. |
| tenant_id | uuid-str  | No |  CR  | Derived from Authentication token | N/A |Owner of the network.  Only admin users can specify an identifier other than their own. |
|external_gateway_info |  dict  | No  |CRU  |None |No constraints |Information on external gateway for the router. |

**Status Lifecycle**   
N/A

**Rate Limits**   
Rate limits apply.

**Quota Limits**   
Quota limit of one (1) router per tenant.

**Business Rules**   
None

##### 4.5.5.1.1 List Routers ##### {#list_routers}
##### GET /v2.0/routers

This operation returns a list of routers to which the tenant has access. Default policy settings return only those routers that are owned by the tenant who submits the request.

**Request Data**   
This operation does not require a request body.

**URL Parameters**   
Users can control which attributes should be returned by using the fields query parameter.  See [Filtering and Column Selection](#filtering) for more information.  Filtering is supported on all top level attributes of an API entity. For example: 

    GET /v2.0/routers?admin_state_up=false 

**Data Parameters**   
This operation does not require a request body.

JSON

    GET /v2.0/routers
    Content-Type: application/json
    Accept: application/json

XML

    GET /v2.0/routers
    Content-Type: application/xml
    Accept: application/xml

**Success Response**   
200 - OK

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.

**Response Data**   
This operation returns a response body.

JSON

    Content-Type: application/json
    
    {
        routers: [1]
            0:  {
            status: "ACTIVE"
            external_gateway_info: {
            network_id: "7da74520-9d5e-427b-a508-213c84e69616"
            enable_snat: true
            }
        name: "default_router"
        admin_state_up: true
        tenant_id: "10979209027984"
        id: "797568e9-15e1-4b0a-b4a6-4181a8659897"
        }
    }

XML

    Content-Type: application/xml
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <routers>
        <router>
            <status>ACTIVE</status>
            <external_gateway_info>
            <network_id>7da74520-9d5e-427b-a508-213c84e69616</network_id>
            <enable_snat quantum:type="bool">True</enable_snat>
            </external_gateway_info>
        <name>default_router</name>
        <admin_state_up quantum:type="bool">True</admin_state_up>
        <tenant_id>10979209027984</tenant_id>
        <id>797568e9-15e1-4b0a-b4a6-4181a8659897</id>
        </router>
    </routers>    

**Error Response**   
If an error occurs, the response body contains a description of the error.  

**Status Code**      

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Example**
  
    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2.0/routers

##### 4.5.5.1.2 Show Router ##### {#get_router}
##### GET /v2.0/routers/{id}

This operation returns the details for a specific router whose identifier is specified on the request URI. 

**Request Data** 
This operation does not require a request body.  

**URL Parameters**   
N/A

**Data Parameters**   
This operation does not require a request body.

JSON   

    GET /v2.0/routers/{id}
    Content-Type: application/json
    Accept: application/json

XML

    GET /v2.0/routers/{id}
    Content-Type: application/xml
    Accept: application/xml

**Success Response**   
200 - OK

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.

**Response Data**   
This operation returns a response body.

JSON 

    Content-Type: application/json
    
    {
        router: 
            {
            status: "ACTIVE"
            external_gateway_info: {
            network_id: "7da74520-9d5e-427b-a508-213c84e69616"
            enable_snat: true
            }
        name: "default_router"
        admin_state_up: true
        tenant_id: "10979209027984"
        id: "797568e9-15e1-4b0a-b4a6-4181a8659897"
        }
    }

XML

    Content-Type: application/xml
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <router>
        <status>ACTIVE</status>
        <external_gateway_info>
        <network_id>7da74520-9d5e-427b-a508-213c84e69616</network_id>
        <enable_snat quantum:type="bool">True</enable_snat>
        </external_gateway_info>
        <name>default_router</name>
        <admin_state_up quantum:type="bool">True</admin_state_up>
        <tenant_id>10979209027984</tenant_id>
        <id>797568e9-15e1-4b0a-b4a6-4181a8659897</id>
    </router>    

**Error Response**  
If an error occurs, the response body contains a description of the error.  

**Status Code**     

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 403 | Forbidden | Operation not allowed |
| 404 | Not Found | Non existent URI, resource not found. |

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2.0/routers/{id}

##### 4.5.5.1.3 Create Router ##### {#create_router}
##### POST /v2.0/routers

This operation creates a new logical router. When it is created, a logical router does not have any internal interface. In other words, it is not associated to any subnet. The user can optionally specify an external gateway for a router at create time; a router's external gateway must be plugged into an external network, that is to say a network for which the extended field *router:external* is set to *true*.

In order to specify an external gateway, the identifier of the external network must be passed in the request body's *external_gateway_info* attribute. This can be achieved as shown in the following snippet:

    "external_gateway_info" :
        {"network_id": "{id}"}

**Request Data**  
This operation requires a request body 

**URL Parameters**   
N/A

**Data Parameters**   
This operation requires a request body.

JSON

    POST /v2.0/routers
    Content-Type: application/json
    Accept: application/json
    
    {
        "router":
            {
            "name": "{name}",
            "admin_state_up": true,
            "external_gateway_info" :
                {
                "network_id": "{id}"
                }
            }
    }

XML

    POST /v2.0/routers
    Content-Type: application/xml
    Accept: application/xml
    
    <router>
      <name>{Router_Name}</name>
      <admin_state_up>true</admin_state_up>
      <external_gateway_info>
          <network_id>{id}</network_id>
      </external_gateway_info>
    </router>

**Success Response**   
201 - Created

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.

**Response Data**
This operation returns a response body.

JSON
  
    Content-Type: application/json
    
    {
        router: 
            {
            status: "ACTIVE"
            external_gateway_info: 
                {
                network_id: "7da74520-9d5e-427b-a508-213c84e69616"
                enable_snat: true
                }
            name: "new_router"
            admin_state_up: true
            tenant_id: "10979209027984"
            id: "65de76c1-10df-47e9-88d9-bfe638a73441"
            }
    }

XML

    Content-Type: application/xml
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <router>
        <status>ACTIVE</status>
        <external_gateway_info>
        <network_id>7da74520-9d5e-427b-a508-213c84e69616</network_id>
        <enable_snat quantum:type="bool">True</enable_snat>
        </external_gateway_info>
        <name>new_router</name>
        <admin_state_up quantum:type="bool">True</admin_state_up>
        <tenant_id>10979209027984</tenant_id>
        <id>1e5057bf-6afa-471f-9bc0-fd0a88a52105</id>
    </router>

**Error Response**  
If an error occurs, the response body contains a description of the error.

**Status Code**      

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 403 | Forbidden | Operation not allowed. |
| 404 | Not Found | Non existent URI, resource not found. |
| 409 | Conflict | Duplicate Router present or Quota exceeded. |

**Curl Example**

    curl -i -k -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"router": {"name": "{name}","admin_state_up":"true","external_gateway_info":{"network_id":"{id}"}}}' {BaseURI}/v2.0/routers

##### 4.5.5.1.4 Update Router ##### {#update_router}
##### PUT /v2.0/routers/{id}

This operation updates a logical router. Beyond the name and the administrative state, the only parameter which can be updated with this operation is the external gateway. For more information concerning how to set the external gateway for a router, please refer to the previous section (Create Router) or to the following example.

This operation does not allow updating the router interfaces. 

**Request Data**   
This operation requires a request body. 

**URL Parameters**   
N/A

**Data Parameters**   
This operation requires a request body. 

JSON
 
    PUT /v2.0/routers/{id}
    Content-Type: application/json
    Accept: application/json
    
    {
        "router":
            {
                "external_gateway_info":
                    {
                    "network_id": "{id}"
                    },
                "name":"{name}",
                "admin_state_up":"true"
            }
    }

XML
  
    PUT /v2.0/routers/{id}
    Content-Type: application/xml
    Accept: application/xml
    
    <router>
    <external_gateway_info>
        <network_id>{id}</network_id>
    </external_gateway_info>
    <name>{name}</name>
    <admin_state_up>true</admin_state_up>
    </router>

**Success Response**   
200 - OK

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.  

**Response Data**   
This operation returns a response body.

JSON   

    Content-Type: application/json
    
    {
        router: 
            {
            status: "ACTIVE"
            external_gateway_info: 
                {
                network_id: "7da74520-9d5e-427b-a508-213c84e69616"
                enable_snat: true
                }
            name: "router_newname"
            admin_state_up: true
            tenant_id: "10979209027984"
            id: "797568e9-15e1-4b0a-b4a6-4181a8659897"
            }
    }

XML

    Content-Type: application/xml
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <router>
        <status>ACTIVE</status>
        <external_gateway_info>
        <network_id>7da74520-9d5e-427b-a508-213c84e69616</network_id>
        <enable_snat quantum:type="bool">True</enable_snat>
        </external_gateway_info>
        <name>router_newname</name>
        <admin_state_up quantum:type="bool">True</admin_state_up>
        <tenant_id>10979209027984</tenant_id>
        <id>797568e9-15e1-4b0a-b4a6-4181a8659897</id>
    </router>
   
**Error Response**   
If an error occurs, the response body contains a description of the error.  

**Status Code**     

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 403 | Forbidden | Operation not allowed. |
| 404 | Not Found | Non existent URI, resource not found. |
| 409 | Conflict | Unable to update router. |

**Curl Example**

    curl -i -k -X PUT -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"router": {"name": "{name}","admin_state_up":true,"external_gateway_info":{"network_id":"{id}"}}}' {BaseURI}/v2.0/routers/{id}

##### 4.5.5.1.5 Delete Router ##### {#delete_router}
##### PUT /v2.0/routers/{id}

This operation removes a logical router. The operation will fail if the router still has internal interfaces attached.

**Note:**  All router interfaces must be removed prior to deleting the router.  Router interfaces can be removed through the [Remove router interface](#delete_interface)

**Request Data**   
This operation does not require request body.

**URL Parameters**   
N/A

**Data Parameters**    
This operation does not require request body.   

JSON

    DELETE /v2.0/routers/{id}
    Content-Type: application/json
    Accept: application/json

XML

    DELETE /v2.0/routers/{id}
    Content-Type: application/xml
    Accept: application/xml

**Success Response**   
204 - Delete successful; no content returned

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.  

**Response Data**   
This operation does not return a response body.

**Error Response**     
If an error occurs, the response body contains a description of the error.

**Status Code**     

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 404 | Not Found | Non existent URI, resource not found. |
| 409| Conflict | Unable to delete router due to a conflict. |

**Curl Example**   

    curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2.0/routers/{id}

##### 4.5.5.1.6 Add Router Interface ##### {#add_interface}  
##### PUT /v2.0/routers/{id}/add_router_interface

This operation attaches a subnet to an internal router interface. Either a subnet identifier or a port identifier must be passed in the request body. If both are specified, a 400 Bad Request error is returned.

If the *subnet_id* attribute is specified in the request body, the subnets gateway IP address is used to create the router interface; otherwise, if the *port_id* is specified, the IP address associated with the port is used for creating the router interface.

**NOTE:**  A 400 Bad Request error is returned if several IP addresses are associated with the specified port, or if no IP address is associated with the port.  A 409 Conflict is returned if the port is already in use.

**Request Data**   
This operation requires a request body.

**URL Parameters**   
N/A

**Data Parameters**    
This operation requires a request body.   

JSON

    PUT /v2.0/routers/{id}/add_router_interface
    Content-Type: application/json
    Accept: application/json
    
    {
        "subnet_id": "{id}"
    }

XML

    PUT /v2.0/routers/{id}/add_router_interface
    Content-Type: application/xml
    Accept: application/xml
    
    <subnet_id>{id}</subnet_id>

**Success Response**   
200 - OK

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.  

**Response Data**   
The port identifier returned by this operation can either be the same identifier passed in the request body or the identifier of a new port created by this operation to attach the subnet specified by subnet_id to the router.

After executing this operation, the device_id attribute of this port is set to the router's identifier, and the device_owner attribute is set to network:router_interface.

JSON

    Content-Type: application/json
    
    {
        subnet_id: "8a96392c-86cd-472b-bd05-0498303f088e"
        tenant_id: "10979209027984"
        port_id: "11aa37b3-3e40-45b3-b869-ddfe209ff186"
        id: "797568e9-15e1-4b0a-b4a6-4181a8659897"
    }

XML

    Content-Type: application/xml
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <_v_root>
        <subnet_id>8a96392c-86cd-472b-bd05-0498303f088e</subnet_id>
        <tenant_id>10979209027984</tenant_id>
        <port_id>eefa960e-2761-4643-bc23-da2becb2d983</port_id>
        <id>797568e9-15e1-4b0a-b4a6-4181a8659897</id>
    </_v_root>

**Error Response**   
If an error occurs or attempting to add an interface to a non existing router, the response body contains a description of the error.

**Status Code**     

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 404 | Not Found | Non existent URI, resource not found. |
| 409| Conflict | Port already in use|

**Curl Example**

    curl -i -k -X PUT -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"subnet_id": "{id}"}' {BaseURI}/v2.0/routers/{id}/add_router_interface

##### 4.5.5.1.7 Remove Router Interface ##### {#delete_interface}
##### PUT /v2.0/routers/{id}/remove_router_interface

This operation removes an internal router interface, thus detaching a subnet from the router. Either a subnet identifier (subnet_id) or a port identifier (port_id) should be passed in the request body; this will be used to identify the router interface to remove. If both are specified, the subnet identifier must correspond to the first IP address on the port specified by the port identifier. Otherwise, a 409 Conflict error will be returned.

A 404 Not Found error will be returned if either the router or the subnet/port does not exist or are not visible to the user.

This operation will cause the port connecting the router to the subnet to be removed from the subnets network.

**Request Data**   
This operation requires a request body.

**URL Parameters**  
N/A

**Data Parameters**    
This operation requires a request body.   

JSON

    PUT /v2.0/routers/{id}/remove_router_interface
    Content-Type: application/json
    Accept: application/json
    
    {
        "subnet_id": "{id}"
    }

XML

    PUT /v2.0/routers/{id}/remove_router_interface
    Content-Type: application/xml
    Accept: application/xml
    
    <subnet_id>{id}<subnet_id>

**Success Response**   
200 - OK

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.  

**Response Data**   
This request does not return a response body.
  
**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**     

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 404 | Not Found | Unable to find request.   Router or the subnet/port do not exist or are not visible to the requester|
| 409| Conflict | subnet identifier must correspond to the first IP address on the port specified by the port identifier|

**Curl Example**   

    curl -i -k -X PUT -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"subnet_id": "{id}"}' {BaseURI}/v2.0/routers/{id}/remove_router_interface

##### 4.5.5.2 Floating IP Operations ##### {#floatingip_api}
Manage floating IPs through the Networking L3 API extension.

**NOTE:** Floating IPs can only be defined on networks for which the attribute *router:external* has been set to True.

| Verb    | URI        |      Description |
| :------------ | :---------- | :-------- |
| GET     | /v2.0/floatingips  |List of Floating IPs accessible to the tenant submitting the request |
|  GET | /v2.0/floatingips/{id} | Show details about the specified Floating IP|
| POST  | /v2.0/floatingips   | Create a new floating IP|
| PUT      |/v2.0/floatingips/{id}|   Update a Floating IP|
| DELETE   |/v2.0/floatingips/{id} |  Delete a Floating IP|

The following table describes the attributes for Floating IP objects:  

| Attribute | Type  | Required  | CRUD  | Default Value | Validation | Constraints  | Notes |
| :---------- | :---------- | :------------ | :-------------- | :----------- | :----------------------- | :---------------- | :---------------- |
| id  | uuid-str  | N/A | R | generated | N/A | UUID of the Floating IP instance |
|router_id  | uuid-str |  Yes | CR |  N/A | UUID Pattern |  UUID of the router where the Floating IP will be created. |
|floating_network_id  | uuid-str |  Yes | CR |  N/A | UUID Pattern |  UUID of the external network where the Floating IP will be created. |
|port_id  | uuid-str  | Yes | CRU | N/A | UUID Pattern  | UUID of the port on an internal network which should be associated to the Floating IP.|
|fixed_ip_address | IP Address |  No |  CRU | None |  IP address or null |  Specific IP address on the port_id which should be associated with the Floating IP. |
|floating_ip_address  | IP Address |  N/A | R| Automatically allocated from pool |  N/A | Address of the Floating IP on the external network. |
|tenant_id  | uuid-str  | No  | CR| Derived from Authentication token | N/A | Owner of the network.  Only admin users can specify an identifier other than their own. |

**Status Lifecycle**   
N/A

**Rate Limits**   
Rate limits apply.

**Quota Limits**   
Default of forty-five (45) floating IPs per a tenant.

**Business Rules**   
None

##### 4.5.5.2.1 List Floating IPs ##### {#list_fIPs}
##### GET /v2.0/floatingips

The operation returns a list of Floating IPs to which the tenant has access. Default policy settings return only those Floating IPs that are owned by the tenant who submits the request, unless the request is submitted by an user with administrative rights. 

**Request Data**   
This operation does not require a request body.

**URL Parameters**   
Users can control which attributes should be returned by using the *fields* query parameter. See [Filtering and Column Selection](#filtering) for more information.  Filtering is supported on all top level attributes of an API entity. For example: 

    GET /v2.0/floatingips?router_id="{id}"

**Data Parameters**   
This operation does not require a request body.

JSON 
  
    GET /v2.0/floatingips
    Content-Type: application/json
    Accept: application/json

XML

    GET /v2.0/floatingips
    Content-Type: application/xml
    Accept: application/xml

**Success Response**   
200 - OK

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.

**Response Data**   
This operation returns a response body.

JSON   

    Content-Type: application/json
    
    {
        "floatingips":
            [
                {
                "router_id": "d23abc8d-2991-4a55-ba98-2aaea84cc72f",
                "tenant_id": "10979209027984",
                "floating_network_id": "376da547-b977-4cfe-9cba-275c80debf57",
                "fixed_ip_address": "10.0.0.3",
                "floating_ip_address": "15.126.241.42",
                "port_id": "ce705c24-c1ef-408a-bda3-7bbd946164ab",
                "id": "2f245a7b-796b-4f26-9cf9-9e82d248fda7"
                },
                {
                "router_id": null,
                "tenant_id": "10979209027984",
                "floating_network_id": "376da547-b977-4cfe-9cba-275c80debf57",
                "fixed_ip_address": null,
                "floating_ip_address": "15.126.241.43",
                "port_id": null,
                "id": "61cea855-49cb-4846-997d-801b70c71bdd"
                }
            ]
    }

XML
  
    Content-Type: application/xml
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <floatingips>
        <floatingip>
        <router_id>797568e9-15e1-4b0a-b4a6-4181a8659897</router_id>
        <tenant_id>10979209027984</tenant_id>
        <floating_network_id>7da74520-9d5e-427b-a508-213c84e69616</floating_network_id>
        <fixed_ip_address>10.0.0.3</fixed_ip_address>
        <floating_ip_address>15.126.241.43</floating_ip_address>
        <port_id>da92aabc-a633-4773-b410-a5fe75245c51</port_id>
        <id>01b17b81-544c-4538-ba79-c7f6cfbbd00a</id>
        </floatingip>
    </floatingips>

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**     

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2.0/floatingips

##### 4.5.5.2.2 Show Floating IPs ##### {#get_fIP}
##### GET /v2.0/floatingips/{id}

This operation will show the details of the specified Floating IP.

This operation returns the details for a specific Floating IP whose identifier is specified in the request URI. 

**Request Data**   
This operation does not require a request body.

**URL Parameters**   
Users can control which attributes should be returned by using the *fields* query parameter. See [Filtering and Column Selection](#filtering) for more information. Filtering is supported on all top level attributes of an API entity. For example: 

  GET /v2.0/floatingips/{id}?fields=fixed_ip_address

**Data Parameters**   
This operation does not require a request body.

JSON
  
    GET /v2.0/floatingips/{id}
    Content-Type: application/json
    Accept: application/json

XML

    GET /v2.0/floatingips/{id}
    Content-Type: application/xml
    Accept: application/xml

**Success Response**   
200 - OK

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.

**Response Data**   

This operation returns a response body.

JSON 
  
    Content-Type: application/json
    
    {
        floatingip: 
            {
            router_id: "797568e9-15e1-4b0a-b4a6-4181a8659897"
            tenant_id: "10979209027984"
            floating_network_id: "7da74520-9d5e-427b-a508-213c84e69616"
            fixed_ip_address: "10.1.1.100"
            floating_ip_address: "15.126.245.242"
            port_id: "da92aabc-a633-4773-b410-a5fe75245c51"
            id: "01b17b81-544c-4538-ba79-c7f6cfbbd00a"
            }
    }

XML  

    Content-Type: application/xml
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <floatingip>
        <router_id>797568e9-15e1-4b0a-b4a6-4181a8659897</router_id>
        <tenant_id>10979209027984</tenant_id>
        <floating_network_id>7da74520-9d5e-427b-a508-213c84e69616</floating_network_id>
        <fixed_ip_address>10.1.1.100</fixed_ip_address>
        <floating_ip_address>15.126.245.242</floating_ip_address>
        <port_id>da92aabc-a633-4773-b410-a5fe75245c51</port_id>
        <id>01b17b81-544c-4538-ba79-c7f6cfbbd00a</id>
    </floatingip>

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**     

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 404 | Not Found |Non existent URI, resource not found. |

**Curl Example**   

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2.0/floatingips/{id}

##### 4.5.5.2.3 Create Floating IP ##### {#create_fIP}
##### POST /v2.0/floatingips

This operation creates a Floating IP. Users can specify information for this Floating IP in the request body. This information is optional, and can be specified with an UPDATE call at a later stage. The only mandatory parameter in the request body is the external network identifier; *floating_network_id*. Floating IPs can only be created on external networks. If the network specified by *floating_network_id* is not external (for example, router:external=False), a 400 error is returned.

Users can associate the Floating IP with an internal port using the *port_id* attribute in the request body. If an invalid port identifier is specified, a 404 error will be returned. The internal Networking port associated with the Floating IP must have at least an IP address configured, otherwise a 400 error will be returned.

If the internal Networking port and IP address, selected for association, are already associated with another Floating IP, a 409 error will be returned.

**Request Data**   
This operation requires a request body.

**URL Parameters**   
None

**Data Parameters**   
This operation requires a request body.

JSON

    POST /v2.0/floatingips
    Content-Type: application/json
    Accept: application/json
    
    {
        "floatingip":
            {
            "floating_network_id": "{id}",
            "port_id": "{id}"
            }
    }

XML

    POST /v2.0/floatingips
    Content-Type:  application/xml
    Accept: application/xml
    
    <floatingip>
        <floating_network_id>{id}</floating_network_id>
        <port_id>{id}</port_id>
    </floatingip>

**Success Response**   
201 - OK

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.

**Response Data**
This operation returns a response body.

JSON

    Content-Type: application/json
    
    {
        "floatingip":
            {
            "router_id": "d23abc8d-2991-4a55-ba98-2aaea84cc72f",
            "tenant_id": "10979209027984",
            "floating_network_id": "7da74520-9d5e-427b-a508-213c84e69616",
            "fixed_ip_address": "10.1.1.1",
            "floating_ip_address": "15.126.227.179",
            "port_id": "21a65d97-7599-4691-8d1a-5476fb2700eb",
            "id": "2f245a7b-796b-4f26-9cf9-9e82d248fda7"
            }
    }

XML

    Content-Type: application/xml
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <floatingip>
        <router_id>797568e9-15e1-4b0a-b4a6-4181a8659897</router_id>
        <tenant_id>10979209027984</tenant_id>
        <floating_network_id>7da74520-9d5e-427b-a508-213c84e69616</floating_network_id>
        <fixed_ip_address>10.1.1.1</fixed_ip_address>
        <floating_ip_address>15.126.227.179</floating_ip_address>
        <port_id>21a65d97-7599-4691-8d1a-5476fb2700eb</port_id>
        <id>e2214114-2b6a-493e-a28e-6eb4f4ddd778</id>
    </floatingip>

**Error Response**  
If an error occurs, the response body contains a description of the error.

**Status Code**      
See [HTTP Status Codes](#http_codes) for more information.

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 409 | Conflict | Duplicate Floating IP present. |

**Curl Example**

    curl -i -k -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"floatingip":{"floating_network_id":"{id}","port_id":"{id}"}}' {BaseURI}/v2.0/floatingips

##### 4.5.5.2.4 Update Floating IP ##### {#update_fIP}
##### PUT /v2.0/floatingips/{id} 

This operation updates an association between a floating IP and a networking port. The association process is exactly the same as the one discussed for the create Floating IP operation.

To disassociate a floating IP from a port, set the *port_id* request attribute to null or omit it from the request body.

**Request Data**   
This operation requires a request body.

**URL Parameters**   
None

**Data Parameters**   
This operation requires a request body.

JSON - Associate Request

    PUT /v2.0/floatingips/{id}
    Content-Type: application/json
    Accept: application/json
    
    {
        "floatingip":
            {
            "port_id": "{id}"
            }
    }

JSON - Disassociate Request

    PUT /v2.0/floatingips/{id}
    Content-Type:  application/json
    Accept: application/json
    
    {
        "floatingip":
            {
            "port_id": null
            }
    }

**Success Response**   
200 - OK

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.

**Response Data**
This operation returns a response body.

JSON - Associate response

    Content-Type: application/json
    
    {
        floatingip:
            {
            "router_id": "d23abc8d-2991-4a55-ba98-2aaea84cc72f",
            "tenant_id": "10979209027984",
            "floating_network_id": "7da74520-9d5e-427b-a508-213c84e69616",
            "fixed_ip_address": "10.0.0.4",
            "floating_ip_address": "15.126.245.246",
            "port_id": "fc861431-0e6c-4842-a0ed-e2363f9bc3a8",
            "id": "01b17b81-544c-4538-ba79-c7f6cfbbd00a"
            }
    }

JSON - Disassociate response

    Content-Type: application/json
    
    {
        floatingip: 
            {
            router_id: null
            tenant_id: "10979209027984"
            floating_network_id: "7da74520-9d5e-427b-a508-213c84e69616"
            fixed_ip_address: null
            floating_ip_address: "15.126.245.246"
            port_id: null
            id: "01b17b81-544c-4538-ba79-c7f6cfbbd00a"
            }
    }

**Error Response**  
If an error occurs, the response body contains a description of the error.

**Status Code**      

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | Malformed request in URI or request body. |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 404 | Not Found | Non existent URI, resource not found. |

**Curl Example - associate**

    curl -i -k -X PUT -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"floatingip":{"port_id":"{id}"}}' {BaseURI}/v2.0/floatingips/{id}

**Curl Example - disassociate**

    curl -i -k -X PUT -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"floatingip":{"port_id":"null"}}' {BaseURI}/v2.0/floatingips/{id}

##### 4.5.5.2.5 Delete Floating IP ##### {#delete_fIP}
##### DELETE /v2.0/floatingips/{id}

The operation removes the floating IP whose identifier is specified in the request URI. If the floating IP being removed is associated with a port, the association is removed as well.

**Request Data**   
This operation does not require a request body.

**URL Parameters**
None

**Data Parameters**    
This operation does not require request body.   

JSON

    DELETE /v2.0/floatingips/{id}
    Content-Type: application/json
    Accept: application/json

XML

    DELETE /v2.0/floatingips/{id}
    Content-Type: application/xml
    Accept: application/xml

**Success Response**   
200 - OK

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.  

**Response Data**   
This operation does not return a response body.

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**     

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 404 | Not Found | Non existent URI, resource not found. |

**Curl Example**

    curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2.0/floatingips/{id}

#### 4.5.6 Security Groups #### {#securitygroup_api}
Manage Security Groups.

Security groups and security group rules allows administrators and tenants the ability to specify the type of traffic and direction (ingress/egress) that is allowed to pass through a port. A security group is a container for security group rules.

When a port is created in Networking it is associated with a security group. If a security group is not specified the port will be associated with a 'default' security group. **By default this group will allow ingress traffic over port 22 (SSH) and allow all egress.** Rules can be added to this group in order to change the behavior.

| Verb | URI | Description |
|:-----| :--- | :--------------|
|GET    | security-groups      |List of security groups accessible to the tenant submitting the request|
|GET    | security-groups/{id} |Show details of a specific security group|
|POST | security-groups     |Create a security group|
|DELETE | security-groups/{id}  |Delete a security group |

The following table describes the attributes for Security Group objects:

| Attribute | Type  | Required  | CRUD  | Default Value | Validation | Description  |
| :---------- | :---------- | :------------ | :-------------- | :----------- | :----------------------- | :---------------- | 
| id  | uuid-str  | N/A | R | generated | N/A | UUID of the security group. |
| name |  string |  No |  CRU | None  | N/A | Human-readable name for the security group. Name is not required to be unique. A new Security Group is not allowed to be named *default* as a rule of that name is automatically created for the tenant.|
| description | string | No | CRU | None|  N/A | Human-readable description of a security group.|
|tenant_id  | uuid-str  | No  | CR| Derived from Authentication token | N/A | Owner of the network.  Only admin users can specify an identifier other than their own.|

**NOTE:** Updating of a Security Group Rule is not supported.  To accomplish the update operation you must first delete and then create the new rule.
  
Upon creation of the Security Group, it can be attached to a port using the [Port APIs](#port_api)

**Status Lifecycle**   
N/A

**Rate Limits**   
Rate limits apply.

**Quota Limits**   
Quota of ten (10) security groups and fifty (50) security group rules, per tenant, is applied.

**Business Rules**   
None

##### 4.5.6.1 List Security Groups ##### {#list_securityGroup}
##### GET /v2.0/security-groups

This operation returns a list of security groups accessible to the tenant who submitted the request.

**Request Data**   
This operation does not require a request body.

**URL Parameters**  
Users can control which attributes should be returned by using the fields query parameter. 
Filtering is supported on all top level attributes of an API entity. For example: 

    GET /v2.0/security-groups?tenant_id={id} 

**Data Parameters**    
This operation does not require a request body.

JSON 
 
    GET /v2.0/security-groups
    Content-Type: application/json
    Accept: application/json

XML
  
    GET /v2.0/security-groups
    Content-Type: application/xml
    Accept: application/xml

**Success Response**   
200 - OK

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.  

**Response Data**   
This operation returns a response body.

JSON

    Content-Type: application/json
    
    {
        security_groups: [1]
            0:  {
            tenant_id: "10979209027984"
            name: "default"
            description: "default"
            security_group_rules: [3]
                0:  {
                remote_group_id: null
                direction: "egress"
                remote_ip_prefix: null
                protocol: null
                ethertype: "IPv6"
                tenant_id: "10979209027984"
                port_range_max: null
                port_range_min: null
                id: "1af33e6f-9136-43d3-950a-b5b70cb405aa"
                security_group_id: "c70771a4-e0c8-48d8-90e3-489b7897ae45"
                }
                1:  {
                remote_group_id: null
                direction: "ingress"
                remote_ip_prefix: "0.0.0.0/0"
                protocol: "tcp"
                ethertype: "IPv4"
                tenant_id: "10979209027984"
                port_range_max: 22
                port_range_min: 22
                id: "a022b074-832b-42ee-a02a-f17eb6cf5854"
                security_group_id: "c70771a4-e0c8-48d8-90e3-489b7897ae45"
                }
                2:  {
                remote_group_id: null
                direction: "egress"
                remote_ip_prefix: null
                protocol: null
                ethertype: "IPv4"
                tenant_id: "10979209027984"
                port_range_max: null
                port_range_min: null
                id: "f48c1d8d-5664-496c-bcb9-f86dde44727a"
                security_group_id: "c70771a4-e0c8-48d8-90e3-489b7897ae45"
                }
            id: "c70771a4-e0c8-48d8-90e3-489b7897ae45"
            }
    }

XML

    Content-Type: application/xml
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <security_groups>
        <security_group>
        <tenant_id>10979209027984</tenant_id>
        <name>default</name>
        <description>default</description>
        <security_group_rules>
            <security_group_rule>
            <remote_group_id xsi:nil="true" />
            <direction>egress</direction>
            <remote_ip_prefix xsi:nil="true" />
            <protocol xsi:nil="true" />
            <ethertype>IPv6</ethertype>
            <tenant_id>10979209027984</tenant_id>
            <port_range_max xsi:nil="true" />
            <port_range_min xsi:nil="true" />
            <id>1af33e6f-9136-43d3-950a-b5b70cb405aa</id>
            <security_group_id>c70771a4-e0c8-48d8-90e3-489b7897ae45</security_group_id>
            </security_group_rule>
            <security_group_rule>
            <remote_group_id xsi:nil="true" />
            <direction>ingress</direction>
            <remote_ip_prefix>0.0.0.0/0</remote_ip_prefix>
            <protocol>tcp</protocol>
            <ethertype>IPv4</ethertype>
            <tenant_id>10979209027984</tenant_id>
            <port_range_max quantum:type="long">22</port_range_max>
            <port_range_min quantum:type="long">22</port_range_min>
            <id>a022b074-832b-42ee-a02a-f17eb6cf5854</id>
            <security_group_id>c70771a4-e0c8-48d8-90e3-489b7897ae45</security_group_id>
            </security_group_rule>
            <security_group_rule>
            <remote_group_id xsi:nil="true" />
            <direction>egress</direction>
            <remote_ip_prefix xsi:nil="true" />
            <protocol xsi:nil="true" />
            <ethertype>IPv4</ethertype>
            <tenant_id>10979209027984</tenant_id>
            <port_range_max xsi:nil="true" />
            <port_range_min xsi:nil="true" />
            <id>f48c1d8d-5664-496c-bcb9-f86dde44727a</id>
            <security_group_id>c70771a4-e0c8-48d8-90e3-489b7897ae45</security_group_id>
            </security_group_rule>
            </security_group_rules>
        <id>c70771a4-e0c8-48d8-90e3-489b7897ae45</id>
        </security_group>
    </security_groups>

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**     

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2.0/security-groups    

##### 4.5.6.2 Show Security Group ##### {#get_securityGroup}
##### GET /v2.0/security-groups/{id}

This operation returns details of the specified security group.

**Request Data**   
This operation does not require a request body.

**URL Parameters**  
Users can control which attributes should be returned by using the fields query parameter. See [Filtering and Column Selection](#filtering) for more information. Filtering is supported on all top level attributes of an API entity. For example: 

  GET /v2.0/security-groups/{id}?name={name} 

**Data Parameters**    
This operation does not require a request body.

JSON  

    GET /v2.0/security-groups/{id}
    Content-Type: application/json
    Accept: application/json

XML

    GET /v2.0/security-groups/{id}
    Content-Type: application/xml
    Accept: application/xml

**Success Response**   
200 - OK

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.  

**Response Data**   
This operation returns a response body.

JSON   

    Content-Type: application/json
    
    {
        security_groups: [1]
            0:  {
            tenant_id: "10979209027984"
            name: "default"
            description: "default"
            security_group_rules: [3]
                0:  {
                remote_group_id: null
                direction: "egress"
                remote_ip_prefix: null
                protocol: null
                ethertype: "IPv6"
                tenant_id: "10979209027984"
                port_range_max: null
                port_range_min: null
                id: "1af33e6f-9136-43d3-950a-b5b70cb405aa"
                security_group_id: "c70771a4-e0c8-48d8-90e3-489b7897ae45"
                }
                1:  {
                remote_group_id: null
                direction: "ingress"
                remote_ip_prefix: "0.0.0.0/0"
                protocol: "tcp"
                ethertype: "IPv4"
                tenant_id: "10979209027984"
                port_range_max: 22
                port_range_min: 22
                id: "a022b074-832b-42ee-a02a-f17eb6cf5854"
                security_group_id: "c70771a4-e0c8-48d8-90e3-489b7897ae45"
                }
                2:  {
                remote_group_id: null
                direction: "egress"
                remote_ip_prefix: null
                protocol: null
                ethertype: "IPv4"
                tenant_id: "10979209027984"
                port_range_max: null
                port_range_min: null
                id: "f48c1d8d-5664-496c-bcb9-f86dde44727a"
                security_group_id: "c70771a4-e0c8-48d8-90e3-489b7897ae45"
                }
            id: "c70771a4-e0c8-48d8-90e3-489b7897ae45"
            }
    }

XML

    Content-Type: application/xml
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <security_groups>
    <security_group>
    <tenant_id>10979209027984</tenant_id>
    <name>default</name>
    <description>default</description>
        <security_group_rules>
        <security_group_rule>
        <remote_group_id xsi:nil="true" />
        <direction>egress</direction>
        <remote_ip_prefix xsi:nil="true" />
        <protocol xsi:nil="true" />
        <ethertype>IPv6</ethertype>
        <tenant_id>10979209027984</tenant_id>
        <port_range_max xsi:nil="true" />
        <port_range_min xsi:nil="true" />
        <id>1af33e6f-9136-43d3-950a-b5b70cb405aa</id>
        <security_group_id>c70771a4-e0c8-48d8-90e3-489b7897ae45</security_group_id>
        </security_group_rule>
        <security_group_rule>
        <remote_group_id xsi:nil="true" />
        <direction>ingress</direction>
        <remote_ip_prefix>0.0.0.0/0</remote_ip_prefix>
        <protocol>tcp</protocol>
        <ethertype>IPv4</ethertype>
        <tenant_id>10979209027984</tenant_id>
        <port_range_max quantum:type="long">22</port_range_max>
        <port_range_min quantum:type="long">22</port_range_min>
        <id>a022b074-832b-42ee-a02a-f17eb6cf5854</id>
        <security_group_id>c70771a4-e0c8-48d8-90e3-489b7897ae45</security_group_id>
        </security_group_rule>
        <security_group_rule>
        <remote_group_id xsi:nil="true" />
        <direction>egress</direction>
        <remote_ip_prefix xsi:nil="true" />
        <protocol xsi:nil="true" />
        <ethertype>IPv4</ethertype>
        <tenant_id>10979209027984</tenant_id>
        <port_range_max xsi:nil="true" />
        <port_range_min xsi:nil="true" />
        <id>f48c1d8d-5664-496c-bcb9-f86dde44727a</id>
        <security_group_id>c70771a4-e0c8-48d8-90e3-489b7897ae45</security_group_id>
        </security_group_rule>
        </security_group_rules>
        <id>c70771a4-e0c8-48d8-90e3-489b7897ae45</id>
        </security_group>
    </security_groups>

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**     

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 403 | Forbidden | Operation not allowed. |
| 404 | Not Found | Non existent URI, resource not found. |

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2.0/security-groups/{id}

##### 4.5.6.3 Create Security Group ##### {#create_securityGroup}
##### POST /v2.0/security-groups

This operation creates a new Security Group.

Rules may be added to the Security Group through [Create Security Group Rule](#create_Security GroupRule) and deleted via [Delete Security Group Rule](#delete_SecurityGroupRule).

**Request Data**   
This operation requires a request body.

**URL Parameters**  
N/A

**Data Parameters**  
This operation requires a request body. 
  
JSON  

    POST /v2.0/security-groups
    Content-Type: application/json
    Accept: application/json
    
    {
        "security_group":
            {
            "name": "{name}"
            }
    }

XML
  
    POST /v2.0/security-groups
    Content-Type: application/xml
    Accept: application/xml
    
    <security_group>
      <name>{name}</name>
    </security_group>

**Success Response**   
201 - Created

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.  

**Response Data**   
This operation returns a response body.

JSON   
  
    Content-Type: application/json
    
    {
        security_group: {
            tenant_id: "10979209027984"
            name: "SecGroup_Name"
            description: ""
            security_group_rules: [2]
                0:  {
                remote_group_id: null
                direction: "egress"
                remote_ip_prefix: null
                protocol: null
                ethertype: "IPv4"
                tenant_id: "10979209027984"
                port_range_max: null
                port_range_min: null
                id: "7b88c89a-e818-455e-bbf8-733ac60fce59"
                security_group_id: "6b7eec04-3586-4c5d-8296-f970724705c1"
                }
                1:  {
                remote_group_id: null
                direction: "egress"
                remote_ip_prefix: null
                protocol: null
                ethertype: "IPv6"
                tenant_id: "10979209027984"
                port_range_max: null
                port_range_min: null
                id: "5ef76035-c9d4-4dfd-aecb-89f724c4ed5f"
            security_group_id: "6b7eec04-3586-4c5d-8296-f970724705c1"}
            id: "6b7eec04-3586-4c5d-8296-f970724705c1"
            }
    }

XML   

    Content-Type: application/xml
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <security_group>
    <tenant_id>10979209027984</tenant_id>
    <name>SecGroup_Name</name>
    <description />
      <security_group_rules>
        <security_group_rule>
          <remote_group_id xsi:nil="true" />
          <direction>egress</direction>
          <remote_ip_prefix xsi:nil="true" />
          <protocol xsi:nil="true" />
          <ethertype>IPv4</ethertype>
          <tenant_id>10979209027984</tenant_id>
          <port_range_max xsi:nil="true" />
          <port_range_min xsi:nil="true" />
          <id>4767f837-58da-4b11-8999-7ad8a6048257</id>
          <security_group_id>3c8a70ef-a55f-412f-9d1d-754e963ddeea</security_group_id>
        </security_group_rule>
      <security_group_rule>
        <remote_group_id xsi:nil="true" />
        <direction>egress</direction>
        <remote_ip_prefix xsi:nil="true" />
        <protocol xsi:nil="true" />
        <ethertype>IPv6</ethertype>
        <tenant_id>10979209027984</tenant_id>
        <port_range_max xsi:nil="true" />
        <port_range_min xsi:nil="true" />
        <id>13e888df-e290-477f-8934-8fc0d36da590</id>
        <security_group_id>3c8a70ef-a55f-412f-9d1d-754e963ddeea</security_group_id>
        </security_group_rule>
      </security_group_rules>
    <id>3c8a70ef-a55f-412f-9d1d-754e963ddeea</id>
    </security_group>

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**     

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 403 | Forbidden | Disabled or suspended user making the request. |

**Curl Example**

    curl -i -k -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"security_group": {"name": "{name}"}}' {BaseURI}/v2.0/security-groups/{id}

##### 4.5.6.4 Delete Security Group ##### {#delete_securityGroup}
##### DELETE /v2.0/security-groups/{SecGroup_ID}

This operation deletes the requested Security Group.

**Request Data**   
This operation does not require a request body.

**URL Parameters**   
N/A

**Data Parameters**   
This operation does not require a request body.
  
JSON

    DELETE /v2.0/security-groups/{id}
    Content-Type: application/json
    Accept: application/json

XML

    DELETE /v2.0/security-groups/{id}
    Content-Type: application/xml
    Accept: application/xml

**Success Response**   
204 - Delete successful; no content returned

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.  

**Response Data**   
This operation does not return a response body.

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**     

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 403 | Forbidden | Operation not allowed. |
| 409 | Conflict | Unable to delete |

**Curl Example**

    curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2.0/security-groups/{id}

#### 4.5.7 Security Group Rules #### {#securitygrouprules_api}
Manage Security Group Rules.

Security group rules allows administrators and tenants the ability to specify the type of traffic and direction (ingress/egress) that is allowed to pass through a port.

| Verb | URI | Description |
|:-----| :--- | :--------------|
|GET   |security-group-rules  |List of security group rules accessible to the tenant submitting the request. |
|GET  |security-group-rules/{id}  |Show details of a specific security group rule. |
|POST |security-group-rules |Create a security group rule|
|DELETE |security-group-rules/{id}  |Delete the specified security group rule|

**NOTE** Updating of a Security Group Rule is not supported.  To accomplish the update operation you must first delete and then create the new rule.

The following table describes the attributes for Security Group Rule objects:

| Attribute | Type  | Required  | CRUD  | Default Value | Validation | Description  | 
| :---------- | :---------- | :------------ | :-------------- | :----------- | :----------------------- | :---------------- | 
| id  | uuid-str  |Y  |  R  | generated | N/A | UUID of the security group rule. |
|security-group-id | uuid-str | Y | C | generated | N/A | Security group ID the rule is associated with.|
| direction | string | Y | CR | N/A | | Ingress or egress: The direction in which the security group rule is applied. For a compute instance, an 'ingress' security group rule matches traffic that is incoming (ingress) for that instance. An 'egress' rule is applied to traffic leaving the instance. |
| protocol | string | N | CR | None | | IP Protocol (icmp, tcp, udp, etc)|
| port_range_min | integer |N | CR | None | | The minimum port number in the range that is matched by the security group rule. If the protocol is TCP or UDP, this value must be less than or equal to the value of the port_range_max attribute. If the protocol is ICMP, this value must be an ICMP type. |
| port_range_max | integer | N | CR | None | | The maximum port number in the range that is matched by the security group rule. The port_range_min attribute constrains the port_range_max attribute. If the protocol is ICMP, this value must be an ICMP type. |
| ethertype | string | N | | None | R | Ethertype in L2 packet (IPv4, IPv6, etc).|
| remote_ip_prefix | string | N | CR| None | Must be a valid CIDR address | The remote IP prefix to be associated with this security group rule. You can specify either remote_group_id or remote_ip_prefix in the request body. This attribute matches the specified IP prefix as the source IP address of the IP packet. |
| remote_group_id | uuid | N| CR |generated |  | The remote group ID to be associated with this security group rule. You can specify either remote_group_id or remote_ip_prefix in the request body.|
|tenant_id  | uuid-str  |N|  R| Derived from Authentication token | N/A | Owner of the network.  Only admin users can specify an identifier other than their own. |

**Status Lifecycle**   
N/A

**Rate Limits**   
Rate limits apply.

**Quota Limits**   
Quota of fifty (50) security group rules, per tenant, is applied.

**Business Rules**   
None

##### 4.5.7.1 List Security Group Rules ##### {#list_securityGroupRules}
##### GET /v2.0/security-group-rules

This operation returns a list of the Security Group Rules accessible to the tenant submitting the request.

**Request Data**  
This operation does not require a request body. 

**URL Parameters**   
Users can control which attributes should be returned by using the fields query parameter. 
Filtering is supported on all top level attributes of an API entity. For example: 

    GET /v2.0/security-groups-rules?tenant_id={id} 

**Data Parameters** 
This operation does not require a request body.

JSON  

    GET /v2.0/security-group-rules
    Content-Type: application/json
    Accept: application/json

XML

    GET /v2.0/security-group-rules
    Content-Type: application/xml
    Accept: application/xml

**Success Response**   
200 - OK

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.  

**Response Data**   

JSON

    Content-Type: application/json
    
    {
        security_group_rules: [1]
            0:  {
            remote_group_id: null
            direction: "egress"
            remote_ip_prefix: null
            protocol: null
            tenant_id: "10979209027984"
            port_range_max: null
            security_group_id: "c70771a4-e0c8-48d8-90e3-489b7897ae45"
            port_range_min: null
            ethertype: "IPv6"
            id: "1af33e6f-9136-43d3-950a-b5b70cb405aa"
            }
    }

XML

    Content-Type: application/xml
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <security_group_rules>
        <security_group_rule>
        <remote_group_id xsi:nil="true" />
        <direction>egress</direction>
        <remote_ip_prefix xsi:nil="true" />
        <protocol xsi:nil="true" />
        <tenant_id>10979209027984</tenant_id>
        <port_range_max xsi:nil="true" />
        <security_group_id>c70771a4-e0c8-48d8-90e3-489b7897ae45</security_group_id>
        <port_range_min xsi:nil="true" />
        <ethertype>IPv6</ethertype>
        <id>1af33e6f-9136-43d3-950a-b5b70cb405aa</id>
        </security_group_rule>
    </security_group_rules>

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**     

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 404 |Not Found | Non existent URI, resource not found. |

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2.0/security-group-rules

##### 4.5.7.2 Show Security Group Rules ##### {#get_securityGroupRules}
##### GET /security-group-rules/{id}

This operation returns details of a specified Security Group Rule.

**Request Data**  
This operation does not require a request body. 

**URL Parameters**  
Users can control which attributes should be returned by using the fields query parameter. See [Filtering and Column Selection](#filtering) for more information. Filtering is supported on all top level attributes of an API entity. For example: 

    GET /v2.0/security-groups-rules/{id}?name={name} 

**Data Parameters**   
This operation does not require a request body.

JSON  

    GET /v2.0/security-group-rules/{id}
    Content-Type: application/json
    Accept: application/json

XML

    GET /v2.0/security-group-rules/{id}
    Content-Type: application/xml
    Accept: application/xml

**Success Response**   
200 - OK

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.  

**Response Data**   
 
JSON   

    Content-Type: application/json
    
    {
        security_group_rule: 
            {
            remote_group_id: null
            direction: "egress"
            remote_ip_prefix: null
            protocol: null
            tenant_id: "10979209027984"
            port_range_max: null
            security_group_id: "c70771a4-e0c8-48d8-90e3-489b7897ae45"
            port_range_min: null
            ethertype: "IPv6"
            id: "1af33e6f-9136-43d3-950a-b5b70cb405aa"
            }
    }

XML   

    Content-Type: application/xml
    
    <?xml version='1.0' encoding='UTF-8' ?>
      <security_group_rule>
          <remote_group_id xsi:nil="true" />
          <direction>egress</direction>
          <remote_ip_prefix xsi:nil="true" />
          <protocol xsi:nil="true" />
          <tenant_id>10979209027984</tenant_id>
          <port_range_max xsi:nil="true" />
          <security_group_id>c70771a4-e0c8-48d8-90e3-489b7897ae45</security_group_id>
          <port_range_min xsi:nil="true" />
          <ethertype>IPv6</ethertype>
          <id>1af33e6f-9136-43d3-950a-b5b70cb405aa</id>
      </security_group_rule>

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**     

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 404 | Not Found | Non existent URI, resorce not found.. |

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2.0/security-group-rules/{id}

##### 4.5.7.3 Create Security Group Rule ##### {#create_securityGroupRule}
##### POST /v2.0/security-group-rules

This operation creates a new Security Group Rule.

**Request Data**  
This operation requires a request body.

**URL Parameters**  
N/A

**Data Parameters**   
This operation requires a request body.  Both *direction* and *security_group_id* attributes are required.

JSON  

    POST /v2.0/security-group-rules
    Content-Type: application/json
    Accept: application/json
    
    {
        "security_group_rule":
            {
            "direction": "ingress",
            "port_range_min": 3389,
            "tenant_id": "10979209027984",
            "ethertype": "IPv4",
            "port_range_max": 3389,
            "protocol": "tcp",
            "security_group_id": "{id}"
            }
    }

XML   

    POST /v2.0/security_group_rules
    Content-Type: application/xml
    Accept: application/xml
    
    <security_group_rule>
        <direction>ingress</direction>
        <port_range_min>80</port_range_min>
        <tenant_id>10979209027984</tenant_id>
        <ethertype>IPv4</ethertype>
        <port_range_max>80</port_range_max>
        <protocol>tcp</protocol>
        <security_group_id>{id}</security_group_id>
    </security_group_rule>

**Success Response**   
201 - Created

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.  

**Response Data**  
 
JSON   

    Content-Type: application/json
    
    {
        security_group_rule: 
            {
            remote_group_id: null
            direction: "ingress"
            remote_ip_prefix: null
            protocol: "tcp"
            tenant_id: "10979209027984"
            port_range_max: 3389
            security_group_id: "c70771a4-e0c8-48d8-90e3-489b7897ae45"
            port_range_min: 3389
            ethertype: "IPv4"
            id: "1b65239c-5a28-4c2f-b53a-63567a5224f4"
            }
    }

XML   

    Content-Type: application/xml
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <security_group_rule>
        <remote_group_id xsi:nil="true" />
        <direction>ingress</direction>
        <remote_ip_prefix xsi:nil="true" />
        <protocol>tcp</protocol>
        <tenant_id>10979209027984</tenant_id>
        <port_range_max quantum:type="int">80</port_range_max>
        <security_group_id>c70771a4-e0c8-48d8-90e3-489b7897ae45</security_group_id>
        <port_range_min quantum:type="int">80</port_range_min>
        <ethertype>IPv4</ethertype>
        <id>84d13d56-7763-417d-8f73-887bef88c38d</id>
    </security_group_rule>

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**     

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | The request cannot be fulfilled due to bad syntax |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 404 | Item Not Found | Non existent URI, resource not found.|
| 409 | Build in Process | |

**Curl Example**

    curl -i -k -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"security_group_rule":{"direction": "ingress","port_range_min": 3389,"tenant_id": "10979209027984","ethertype": "IPv4","port_range_max": 3389,"protocol": "tcp","security_group_id": "{id}"}}' {BaseURI}/v2.0/security-group-rules

##### 4.5.7.4 Delete Security Group Rule ##### {#delete_securityGroupRule}
##### DELETE /v2.0/security-group-rules/{id}

This operation deletes the specified Security Group Rule.

**Request Data**    
This operation does not require a request body.  

**URL Parameters**   
N/A

**Data Parameters**    
This operation does not require a request body.
  
JSON  

    DELETE /v2.0/security-group-rules/{id}
    Content-Type: application/json
    Accept: application/json

XML

    DELETE /v2.0/security-group-rules/{id}
    Content-Type: application/xml
    Accept: application/xml

**Success Response**   
204 - Delete successful; no content returned

**Status Code**   
See [HTTP Status Codes](#http_codes) for more information.  

**Response Data**   
This operation does not return a response body.

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**     

| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 400 | Bad Request | The request cannot be fulfilled due to bad syntax |
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation . |
| 404 | Item Not Found | Non existent URI, resource not found. |

**Curl Example**

    curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2.0/security-group-rules/{id}

## 5. Glossary

| Term | Description |
| :----------- | :----------- |
| CIDR | Classless Inter-Domain Routing (or supernetting) |
| CIDR | Classless Inter-Domain Routing (or supernetting) |
| CRUD | In computer programming, create, read, update, and delete (CRUD) functions are the basic functions of persistent storage. |
| Entity | Any piece of hardware or software that wants to connect to the network services. An entity can use Networking services by implementing a VIF. |
| IPAM | Internet Protocol Address Management (IPAM) is a means of planning, tracking, and managing the Internet Protocol (IP) address space that is used in a network. |
| L2 Network | A virtual Ethernet network that is managed by the Networking service. Currently, only Ethernet networks are managed. |
| Network | An isolated virtual layer-2 broadcast domain that is typically reserved for the tenant who created it unless the network is configured to be shared. Tenants can create multiple networks until they reach the thresholds specified by per-tenant quotas. |
| Plugin | A software component that implements API v2. |
| Port | A virtual switch port on a logical network switch. Virtual instances attach their interfaces into ports. The logical port also defines the MAC address and the IP addresses to be assigned to the interfaces plugged into them. When IP addresses are associated to a port, this also implies the port is associated with a subnet, as the IP address was taken from the allocation pool for a specific subnet. |
| Subnet | An IP address block that can be used to assign IP addresses to virtual instances. Each subnet must have a CIDR and must be associated with a network. IPs can be either selected from the whole subnet CIDR or from allocation pools that can be specified by the user. |
| URI | Uniform Resource Identifier |
| VIF | Virtual Network Interface also known as a Virtual Interface |
| VIP | Virtual IP |
| VM | Virtual Machine (VM).  A completely isolated guest operating system installation within a normal host operating system. |
| VPC | Virtual Private Cloud |
