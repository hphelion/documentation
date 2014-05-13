---
layout: default
title: "How To's with the HP Helion OpenStack&#174; Community Graffiti Service"
permalink: /cloudos/community/services/peer/howto/
product: community

---
# How To's with the HP Helion OpenStack&#174; Community Graffiti Service #

<!-- Taken from https://rndwiki2.atlanta.hp.com/confluence/display/cloudos/Peer%28Graffiti%29+Service+Interface+%28version+1%29+G2 -->

The following lists of tasks can be performed by a user or administrator through the [HP Helion OpenStack&#174; Community Dashboard](/cloudos/community/services/dashboard/overview/), the OpenStack CLI or OpenStack API.

For details on performing these tasks using the API or CLI, see the following OpenStack documentation:

- OpenStack Compute API v2.0 Reference:
http://api.openstack.org/api-ref-compute-v2.html
- OpenStack Command Line Interface Reference:
http://docs.openstack.org/cli-reference/content/novaclient_commands.html


This document lists example queries for [finding information about your resource pools](#list) and how to [create and modify resource pools](#create)

## Listing Resource Pool Information ## {#list}

The following queries are examples of how to find information on a specific resource pool, all resource pools or specific pools, based on the profile type type.

### Retrieve Single Resource Pool Description ###

Query this service to get the details about a specific resource pool when you already know the id. To find a list of all resource pools, use the query service defined further in this document.

<!--
Example GET request to retrieve a specific resource pool:

GET /1/resource/12341234123412341234123412341234 HTTP/1.1
X-Auth-Token: (UUID or PKI Keystone Token)
Accept: application/json

Example GET response:
HTTP/1.1 200 Ok`	json
 
{
   "name":"grizzly_pool",
   "scope":"user_project",
   "properties":{
 
   },
   "requirements":[
 
   ],
   "capabilities":[
      {
         "name":"openstack",
         "capability_type_name":"cloud_os_resource_pool",
         "capability_type_namespace":"urn:x-hp:2013-1:cloudos:types:capabilities",
         "properties":{
            "name":"openstack",
            "user_id":"e8e12301b89a4e73bce5bdfa9be4ced2",
            "project_id":"a72016d1cb61416e9f8285982a0d4d5e",
            "domain_id":"a72016d1cb61416e9f8285982a0d4d5e",
            "region_id":"RegionOne",
            "type":"openstack",
            "version":"Grizzly",
            "state":"ACTIVE",
            "provider_url":"http://192.168.124.81:5000/v2.0/tokens",
            "provider_user_name":"test_admin",
            "provider_password":"quasarqa",
            "provider_project_id":"b544974eebc34927b77baae424ab81d0",
            "provider_user_domain_name":"default",
            "provider_project_domain_name":"default",
            "cloud_profile_type":"hp_cos_grizzly"
         }
      },
      {
         "name":"chef-demo",
         "capability_type_name":"chef_service",
         "capability_type_namespace":"urn:x-hp:2013-1:cloudos:types:capabilities",
         "properties":{
            "flavor_id":2,
            "model":"chef",
            "name":"chef-demo",
            "type":"config_manager",
            "image_id":"02c6b86a-891a-445b-97ca-c11e8767abb2",
            "version":"10.14.2"
         }
      },
      {
         "name":"loadbalancerv2",
         "capability_type_name":"loadbalancer_service",
         "capability_type_namespace":"urn:x-hp:2013-1:cloudos:types:capabilities",
         "properties":{
            "flavor_id":2,
            "model":"haproxy",
            "name":"loadbalancerv2",
            "type":"load_balancer",
            "image_id":"3b624b52-2126-41f0-82d8-b87cdc60216d",
            "version":"1.4.21"
         }
      }
   ]
} 

-->
### Retrieve List of Resource Pools Description ###

Query this service to find all resource pools. Then use the "resourceId" property and directly query graffiti to get the resource details. See above.
Background

Graffiti performs search operations to find all resources that have the capabilities with the properties that you desire and presents a list of results based upon percentage of matched capabilities and properties.

<!--

    Methods: GET
    Required Request Headers: X-Auth-Token
    Optional query parameters: cloud_profile_type.
    Accepted Request Media Types: application/json, application/xml, application/atom+xml
    Supported Response Media Types: application/json, application/atom+xml (POST also supports application/xml)
    Response Body: list of resource pools in the specified content type.
    Status Codes: 200, 400, 404, 405, 406, 500

Example GET request to select all available resource pools based on the provided token:
GET /1/resource?query=cloud_os_resource_pool[namespace EQ 'urn:x-hp:2013-1:cloudos:types:capabilities'] HTTP/1.1
X-Auth-Token: (UUID or PKI Keystone Token)
Accept: application/json

Example GET response:
HTTP/1.1 200 Ok
Content-Type: application/json
 
[
   {
      "resourceId":8465,
      "@link":"http://localhost:21091/1/resource/8465",
      "match":{
         "percentage":100,
         "capabilities":[
            {
               "name":"cloud_os_resource_pool",
               "namespace":"'urn:x-hp:2013-1:cloudos:types:capabilities'",
               "properties":[
 
               ]
            }
         ]
      }
   },
   {
      "resourceId":8668,
      "@link":"http://localhost:21091/1/resource/8668",
      "match":{
         "percentage":100,
         "capabilities":[
            {
               "name":"resource_pool",
               "namespace":"'urn:x-hp:2013-1:cloudos:types:capabilities'",
               "properties":[
 
               ]
            }
         ]
      }
   }
]

-->
### Retrieve List of Resource Pools by Profile Type ###

Use this query to find a resource pool that matches a specific cloud profile type.
<!--
Example GET request to select all resource pools that matches the specified cloud profile type based on the provided token:
GET /1/resource?query=cloud_os_resource_pool[namespace EQ 'urn:x-hp:2013-1:cloudos:types:capabilities' and cloud_profile_type EQ 'hp_cos_grizzly'] HTTP/1.1
X-Auth-Token: (UUID or PKI Keystone Token)
Accept: application/json

Example GET response:
HTTP/1.1 200 Ok
Content-Type: application/json
 
[
    {
        "resourceId": 8465,
        "@link": "http://localhost:21091/1/resource/8465",
        "match": {
            "percentage": 100,
            "capabilities": [
                {
                    "name": "cloud_os_resource_pool",
                    "namespace": "'urn:x-hp:2013-1:cloudos:types:capabilities'",
                    "properties": [
                        "cloud_profile_type (EQ)"
                    ]
                }
            ]
        }
    },
    {
        "resourceId": 8668,
        "@link": "http://localhost:21091/1/resource/8668",
        "match": {
            "percentage": 100,
            "capabilities": [
                {
                    "name": "cloud_os_resource_pool",
                    "namespace": "'urn:x-hp:2013-1:cloudos:types:capabilities'",
                    "properties": [
                        "cloud_profile_type (EQ)"
                    ]
                }
            ]
        }
    }
]
-->

## Working with resource pools ## {#create}

The following queries are examples of how to create and rename a resource pool.

### Create Resource Pool Description ###

Use this to create a new resource pool
<!--
Example POST request to submit a new resource pool:
POST /1/resource_list HTTP/1.1
X-Auth-Token: (UUID or PKI Keystone Token)
Accept: application/json
Content-Type: application/json
 
{
   "name":"grizzly_pool",
   "scope":"user_project",
   "properties":{
 
   },
   "requirements":[
 
   ],
   "capabilities":[
      {
         "name":"openstack",
         "capability_type_name":"cloud_os_resource_pool",
         "capability_type_namespace":"urn:x-hp:2013-1:cloudos:types:capabilities",
         "properties":{
            "name":"openstack",
            "region_id":"RegionOne",
            "type":"openstack",
            "version":"Grizzly",
            "state":"ACTIVE",
            "provider_url":"http://192.168.124.81:5000/v2.0/tokens",
            "provider_user_name":"test_admin",
            "provider_password":"quasarqa",
            "provider_project_id":"b544974eebc34927b77baae424ab81d0",
            "provider_user_domain_name":"default",
            "provider_project_domain_name":"default",
            "cloud_profile_type":"hp_cos_grizzly"
         }
      },
      {
         "name":"chef-demo",
         "capability_type_name":"chef_service",
         "capability_type_namespace":"urn:x-hp:2013-1:cloudos:types:capabilities",
         "properties":{
            "flavor_id":2,
            "model":"chef",
            "name":"chef-demo",
            "type":"config_manager",
            "image_id":"02c6b86a-891a-445b-97ca-c11e8767abb2",
            "version":"10.14.2"
         }
      },
      {
         "name":"loadbalancerv2",
         "capability_type_name":"loadbalancer_service",
         "capability_type_namespace":"urn:x-hp:2013-1:cloudos:types:capabilities",
         "properties":{
            "flavor_id":2,
            "model":"haproxy",
            "name":"loadbalancerv2",
            "type":"load_balancer",
            "image_id":"3b624b52-2126-41f0-82d8-b87cdc60216d",
            "version":"1.4.21"
         }
      }
   ]
}

Example POST response:
HTTP/1.1 201 Created
Location: /1/resource/12341234123412341234123412341234
 
Content-Type: application/json
 
{
    "message": "A unique identifier for the created directory resource.",
    "id": "12341234123412341234123412341234"
}
-->

### Modify Resource Pool Description ###

Use this to modify an existing resource pool.

<!--
Example PUT request to update a resource pool:
PUT /1/resource/capability/12345/3434 HTTP/1.1
X-Auth-Token: (UUID or PKI Keystone Token)
Accept: application/json
Content-Type: application/json
 
{
         "name":"openstack",
         "capability_type_name":"cloud_os_resource_pool",
         "capability_type_namespace":"urn:x-hp:2013-1:cloudos:types:capabilities",
         "properties":{
            "name":"openstack",
            "region_id":"RegionOne",
            "type":"openstack",
            "version":"Essex",
            "state":"ACTIVE",
            "provider_url":"http://192.168.124.81:5000/v2.0/tokens",
            "provider_user_name":"test_admin",
            "provider_password":"quasarqa",
            "provider_project_id":"b544974eebc34927b77baae424ab81d0",
            "provider_user_domain_name":"default",
            "provider_project_domain_name":"default",
            "cloud_profile_type":"hp_cos_essex"
         }
}

Example PUT response:
HTTP/1.1 202 Accepted
Content-Type: application/json
Delete Resource Pool Description

Same as PUT. Delete is not hard delete. Soft delete by updating the "state" property on capability_type "cloud_os_resource_pool" to "DELETED".

-->

## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/) The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack&#174; Community edition takes care of these details for you. The *Operations* contains information on how to manage the system.

<!-- hide me Also see the Help topics that are available in the Operational Dashboard and Administration Dashboard.  Website copies are available:

* [HP Cloud OS Operational Dashboard Help](/cloudos/manage/operational-dashboard/)
* [HP Cloud OS Administration Dashboard Help](/cloudos/manage/administration-dashboard/) -->