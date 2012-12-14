---
layout: default
title: "Migrating to the new HP Cloud Identity Service"
permalink: /node/39
product: identity

---
# Migrating to the new HP Cloud Identity Service

<!--This is a comment. Comments are not displayed in the browser-->


With the introduction of the HP Cloud Identity Service, the days of having to keep track of different sets of access keys for each individual service and not being able to access anyone else’s service except your own will be over.  A much more sophisticated mechanism for managing access to services will become available and this document spells out how you will be impacted by this significant, but welcome change.

Before going any further, though, we highly recommend that you read Introducing the HP Cloud Identity Service for an overview of how this new service works (an explanation of the new terminology, etc.).  The remainder of this document will focus on how steps that existing private beta customers will need to take in order to keep your use of HP Cloud Services functional to take advantage of this new authentication and access management approach.

## How Am I Impacted?

With a change to something as fundamental as how authentication works, all customers currently in private beta are impacted.  The most common situations customers find themselves in include:

* _Manage Console_ – Login credentials (email address and password) remain exactly the same.  In this first wave of Identity Service-based changes you will not be able to assign a Tenant to another user, but that ability will be coming later.  The biggest change will be on the API Keys screen, which now features a single set of keys and a Tenant ID: (graphic here)
* _Bindings and CLIs_ – More specific details are provided later in this document, but generally speaking, you will need to download new versions of the bindings and CLIs you are using.  All HP-supported bindings and CLIs have been upgraded to interact with the new Identity Service.  In many cases, the only impact after using the new version is that instead of using just access keys for authentication, you must now use access keys and your Tenant ID.
* _Service Endpoints for Object Storage and Compute_ - If you have written your own code on top of the raw REST API for Object Storage or Compute, the authentication for each is now performed with the Identity Service, which then also presents the endpoints for activated services.  More details on this are available in the Identity Service REST API documentation.
* _EC2 Compatibility_ (and 3rd party tools like euca2ools) – More details are presented later in this document, but the short version is that your endpoint won’t change but you will need to change your access key.

## Interruption of Service During the Upgrade

There will be some disruption to HP Cloud Services during the upgrade.  Specifics about the timing of the upgrade will be posted in the [HP Cloud Services Console](https://manage.hpcloud.com) at least three days prior to the upgrade.

### HP Cloud Object Storage
* The service will be shutdown and unavailable during the upgrade.
* If you use the Object Storage API, you should use this time to change your endpoint as described below or upgrade to a new version of the CLI or language binding.

### HP Cloud Compute
* Running compute instances will continue to operate normally.
* You will be unable to use the Management Console or the Compute API to manage any instances until the upgrade is complete (e.g., you will not be able to create new instances, terminate existing instances or query the state of your instances).
* If you use the Compute API, use this time to change your endpoint as described below or upgrade to a new version of the CLI or language binding.

## HP-provided Bindings and CLIs
All HP-provided bindings (Ruby Fog and  Java jclouds) and CLIs (Unix and Windows Powershell) have been upgraded to work with the Identity Service and will be available for download at the conclusion of the upgrade on our website:

* http://build.hpcloud.com/bindings
* http://build.hpcloud.com/clis

Upgraded documentation will also be available, but in most cases the biggest change has to do with providing a Tenant ID in addition to access keys when starting a session.  In some cases in order to help ease migration, backward compatibility in certain situations will be supported for a limited time, such as the Object Storage backward compatibility and EC2 compatibility interfaces described below.  HP will also provide a version of the python-novaclient 2.6.8 which will work with the Identity Service.

## Object Storage Backward Compatibility
Prior to the Identity Service being available, a typical calling sequence to initiate interaction with the Object Storage went like this:

* Get the Object Storage authentication endpoint off the Manage Console
* Send that endpoint an authentication request with  X-Auth-User and X-Auth-Key HTTP headers
* Get back a response with an X-Storage-URL and an X-Auth-Token to be used for subsequent requests.

In order to provide some backward compatibility with Object Storage, you may use the v1.0 of the Identity Service endpoint (https://region-a.geo-1.identity.hpcloudsvc.com:35357/auth/v1.0/) in the same manner as the Object Storage authentication endpoint  described in the sequence above.  For X-Auth-Key, use the Access Key ID off the new API Keys page of the Manage Console.  For the X-Auth-User, you concatenate your Tenant ID with your username separated by a colon.  For example, if your Tenant ID was 87135022548315 and your username was falken@wg.com, your X-Auth-User would be 87135022548315:falken@wg.com.  

This enables you to simply change endpoint, X-Auth-Key, and X-Auth-User and the remainder of your code written on top of the Object Storage REST API will continue to work.   Note, though, that this only works for the v1.0 version of the Identity Service endpoint.  The v2.0 version of the Identity Service endpoint does not support this backward compatibility.

It should be noted that this backward compatibility is provided as a convenience to help ease migration to the full blown Identity Service.  HP Cloud Services highly recommends you begin using the v2.0 endpoint and its operations as soon as possible as the v1.0 endpoint is deprecated.  The v1.0 endpoint will be removed at some point in the future.

## Account Specifiers in Object Storage Paths
In HP Cloud Object Storage, the first part of the path is referred to as the account. For example, this path refers to an object pic.gif, in container pictures in account AUTH_86ca9388-b3df-4016-ad3b-ca05a917455c:

        /v1.0/AUTH_86ca9388-b3df-4016-ad3b-ca05a917455c/pictures/pic.gif

For accounts created before the introduction of the Identity service, the Object Storage account has the form AUTH_<uuid>. This account is unique to the tenant. For accounts created after the introduction of the Identity service, the Object Storage account is in fact simply the tenant id. For example, for the tenant id 87135022548315, the path is:

        /v1.0/87135022548315/pictures/pic.gif

All of this is fairly transparent to your application since you find this path either in the X-Storage-Url response header or in the publicURL field of the service catalog.

## OpenStack swift-python-client and the swift Command Line
If you are using a version of the swift-python-client which does not support V2-style authentication, it can still be made to work with the Identity Service through the backward compatible API described earlier.

Alternatively, the swift program itself supports the V2-style API.  Using the –V and –U switches, you can make version 1.x.x or later work with the Identity Service as follows:

        $ swift –V 2 \ 
                -A https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/tokens \
                -U sally.smith@hp.com:sally.smith@hp.com \
                -K EH…kJ list

## OpenStack nova-python-client
In order to use the nova-python-client with the Identity Service (which is based on OpenStack Keystone), you must upgrade to version 2.6.8 or later as earlier versions are not Keystone-enabled.  In the client setup, the NOVA_API_KEY must be now be replaced with NOVA_PASSWORD. For instance, instantiating a Client object would look something like:

        from novaclient.v1_1 import Client
        from os import environ as env
        osclient = client.Client(env['NOVA_USERNAME'], 
                                                 env['NOVA_PASSWORD],
                                                 env['NOVA_PROJECT_ID'], 
                                                 env['NOVA_URL'], 
                                                 region_name=env['NOVA_REGION_NAME'])

This will enable your environment for use with the nova command line.

## The nova Command Line
If you are using the nova command line tools or programs that make use of the python-novaclient library, you need to configure it to work with the Identity Service.  Specifically, you must specify the endpoint, region name, tenant name, username, password and version number as follows:

* Endpoint. This is the URL used to access the Identity Service.
* Region name. Your service catalog may contain several Compute service instances. To pick the instance you need, set this value to be either az-1.region-a.geo-1 or az-2.region-a.geo-1.
* Tenant name. This is now the same concept as project id. The tenant name is your email address.
* Username. This is your email address that you log into the Management Console with.
* Password. This is the password you use to log onto the Management Console.
* Version. You must set this to “1.1”

Here is an example of using the Nova command:

        % export NOVA_URL=https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/
        % export NOVA_REGION_NAME= az-1.region-a.geo-1
        % export NOVA_PROJECT_ID=sally.smith@hp.com-default-tenant
        % export NOVA_VERSION=1.1
        % export NOVA_USERNAME=sally.smith@hp.com
        % export NOVA_PASSWORD= mypassword
        % nova …

## Euca2ools and EC2™ compatibility
The Identity Service is compatible with euca2ools and EC2 compatibly for HP Cloud Compute by setting environment variables in a way similar to the Object Storage backward compatibility described above.  To use euca200ls, you set your environment variables as follows:

* EC2-URL – set to:
    * Compute endpoint (from the publicURL field in the Service Catalog)
    * Remove path /v1.1/<tenant-id>
    * Add path “/services/Cloud”
* EC2_ACCESS_KEY – is <tenant_id>:<access_key>
* EC2-SECRET_KEY – use the secretKey from the response shown above.

For example:  

        export EC2_URL=https://az-1.region-a.geo-1.compute.hpcloudsvc.com/services/Cloud
        export EC2_ACCESS_KEY=87135022548315:2MYBW5CYD2U55VLWDTF8
        export EC2_SECRET_KEY=s9VQhwCK49TOPnEp+80ypRD7AK7rs8qgWp0zYCyE

Similar to the statements made in the Object Storage compatibility section  HP Cloud Services highly recommends you begin using the OpenStack Compute API and associated client libraries as soon as possible, as the EC2 compatible API is deprecated and will be removed at some point in the future.

