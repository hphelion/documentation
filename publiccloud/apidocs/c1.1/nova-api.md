---
layout: page
title: "HP Helion Public Cloud Compute Service API Reference"
permalink: /publiccloud/api/compute/
description: This document describes the HP Helion Public Cloud Compute Service. HP Helion Public Cloud Compute is based on OpenStack Nova.
keywords: Compute, Nova, OpenStack
product: compute

---
<!--PUBLISHED-->
# HP Helion Public Cloud Compute Service API Reference

**Date:** May 2014

**Document Version:** 1.9

## 1. Overview ##

This document describes the API for the HP Helion Public Cloud Compute Service. HP Helion Public Cloud Cloud Compute is based on OpenStack Nova.

We will be referring to HP Helion Public Cloud Compute service in this document as simply Compute or Compute service.

### 1.1 API Maturity Level ###

**Maturity Level**: Compute is currently in General Availability.

**Version API Status**: The Compute service is based on OpenStack Nova v2.0. The OpenStack v1.0 Nova API is deprecated 

### 1.2 Document Revision History ###

|Document Version|Date            |Description|
|:--------       | :------------  | :------ |
|1.0             |December 2012|Initial version|
|1.1             |April 2013   |Added [Get VNC Console](#getVNCConsole), and minor edits.|
|1.2             |June 2013    |Major revision to cover Compute API version 1.1.|
|1.3             |July 2013    |Added additional API Extensions|
|1.4             |January 2014 |Fixed broken internal links|
|1.5             |February 2014|Revised description of 'changes-since' parameter|
|1.6             |February 2014|Added more detail to Active server status in ServerStates|
|1.7             |March 2014   |Updates flavors used in examples|
|1.8             |April 2014   |Updated regions, availability zones, and service catalog to 13.5 environment|
| | |Updated references to Project instead of Tenant|
| | |Updated format to reflect format in other API documents.|
| | |Removed sections 4.4.1.19, 4.4.1.20, 4.4.1.21 as they aren't supported. |
| 1.9 | May 2014 | HP Helion updates |

## 2. Compute Service ##

The Compute service provides a scalable, on-demand compute infrastructure on which users can run applications.

### 2.1 Servers ### {#Server}

A Server (also referred to as an *Instance*) is the fundamental resource provided by Compute. A Server is a virtual machine (VM) capable of running a variety of operating system *image*s. The Compute API provided operations that allow users to control the life cycle of a server. The current status of a server is reported by the API as its *state*.  Characteristics of the server, such memory, amount of disk space, and number of CPUs, are determined by the server's *flavor* which is specified at the time the server is created. A server is referred to by its *name*. Metadata can be associated with a server and accessed in a number of ways as described in the section [Personalizing a server](#Personalizing). These concepts are described further in the sections below.

#### 2.1.1 Server Operations ####

The APIs support a number of operations that can be performed on servers. These include:

+ [Create Server](#createServer) - Create one or more VM instances.
+ [Update Server](#updateServer) - Allows update of editable attributes (display name) of an instance.
+ [Delete server](#deleteServer) - Terminates a server.
+ [Reboot Server](#rebootServer) - Reboots a server.
+ [Rebuild Server](#rebuildServer) - Restarts a server with a new image.
+ [Create Image](#createImage) - Create a snapshot of the server

For a complete list of server operations, see section 4.1, [Service API Operations](#ServiceAPIOperations).

#### 2.1.2 Flavors #### {#Flavors}

A flavor determines the primary characteristics of a server. It includes the amount of memory to be allocated to the server, the size of the disk to be created for ephemeral storage and the number of VCPUs to be allocated. Some extensions add additional properties to flavors. The following is an example list of flavors, the full list can be obtained using the [List Flavors](#listFlavors) operation:

| ID    | Name               | Memory_MB | Disk | Ephemeral | Swap | VCPUs |
|:------|:-------------------|:----------|:-----|:----------|:-----|:------|
| 100   | standard.xsmall    | 1024      | 10   | 10        |      | 1     |
| 101   | standard.small     | 2048      | 30   | 10        |      | 2     |
| 102   | standard.medium    | 4096      | 30   | 50        |      | 2     |
| 103   | standard.large     | 8192      | 30   | 130       |      | 4     |
| 104   | standard.xlarge    | 15360     | 30   | 270       |      | 4     |
| 105   | standard.2xlarge   | 30720     | 30   | 470       |      | 8     |
| 110   | standard.4xlarge   | 61440     | 30   | 870       |      | 12    |
| 114   | standard.8xlarge   | 122880    | 30   | 1770      |      | 16    |
| 203   | highmem.large      | 16384     | 30   | 130       |      | 4     |
| 204   | highmem.xlarge     | 30720     | 30   | 270       |      | 4     |
| 205   | highmem.2xlarge    | 61440     | 30   | 540       |      | 8     |

#### 2.1.3 Server States #### {#ServerStates}

The state of a server is maintained in two values: the VM State and the Task State. The VM State is the state of the server as maintained by Nova.  The possible values for VM State are `ACTIVE, BUILD, REBUILD, STOPPED, MIGRATING, RESIZING, PAUSED, SUSPENDED, RESCUE, ERROR` and `DELETED`. A server is running when it is in the `ACTIVE` state. The Task State is essentially a sub-state of the VM State. The status of a server as returned by the Create Server and Get Server Details API is a combination of the VM State and the Task State.

The following shows the sequence of states that a newly created server goes through when a user invokes [Create Server](#createServer). The Task state is shown following the VM state in parentheses.

1. [Create Server](#createServer) called
2. Nova-api creates database entry for new instance and sets state to `BUILD(scheduling)`.
3. The Nova scheduler selects a compute node on which to run the VM and sends it a request to create the VM.
4. The compute node sets state to `BUILD(networking)` and sets up networking.
5. The compute node sets the state to `BUILD(block_device_mapping)` and sets up volumes.
6. The compute node sets the state to `BUILD(spawning)` and calls the hypervisor to create the VM.
7. The VM starts and the state changes to `ACTIVE`. Active status indicates that the instance is powered on, but might not be fully booted. 

You can get details on the state of the server by checking the console log, as shown in [Get Console Output](#getConsoleOutput).

The [List Servers Detail](#listDetailServers) and [Get Server Details](#getServer) operations include server status in the information they return.

#### 2.1.4 Server Names #### {#serverNames}

There are three different ways to refer to a server using the OpenStack native API:

1. The Server is assigned an *id* when it is created. This is an integer and is guaranteed to be unique within the Availability Zone in which the server was created.
2. When it is created the server is also given a [UUID](http://en.wikipedia.org/wiki/Universally_unique_identifier). With a high degree of confidence, this identifier will be unique across all Availability Zones.
3. The Server must also be given a "display name" when it is created using the OpenStack API. This is done by including the name in the request to create the server. Note that the "display name" can be any string which includes an alphabetic character. This requirement prevents the display name from having the syntax of an *id*. The display names of all active servers are also required to be unique. (The exception to this rule is servers which are created with a single call to [Create Server](#createServer) specifying a value of *max_count* greater than 1. All servers created by a single call to [Create Server](#createServer) have the same display name.)
Servers which are created with the Public Cloud Console are automatically assigned display names of the form Server-&lt;time&gt;-az-1-region-a-geo-1 where time is the time in seconds since the Epoch on which the server was created (e.g., Server-1339537527-az-1-region-a-geo-1). This name is generated by the management console.

The server's *id* and UUID are assigned to the server when it is created. These identifiers cannot be changed. The server's display name can be altered using the [Update Server](#updateServer) API operation.

The OpenStack API operations require that the server be identified using either its *id* or its UUID. The server's display name cannot be used in API operations. (Other than in the [Update Server](#updateServer) request mentioned above which is used to change the display name).

#### 2.1.5 Personalizing a server #### {#Personalizing}

A number of mechanisms exist which allow a user to retrieve information about a server and to associate meta-data with the server.

##### 2.1.5.1 Server Metadata ##### {#ServerMetadata}

A server can have metadata in the form of key/value pairs. The initial value of a servers metadata is provided as a parameter to [Create Server](#createServer). On Linux servers metadata provided when the server is created is available as a json object in the server's root filesystem at /meta.js. If the server has a [Configuration Drive](#ConfigurationDrive), the metadata will be in the file /meta.js at the root of the file system on the configuration drive. A server's metadata can also be retrieved and updated using the [Server Metadata](#ServerMetadata) and [Server Metadata Item](#ServerMetadataItem) resources. Updates to a server's metadata are only available using subsequent calls to [Server List Metadata](#ServerMetadata_listMetadata) and [Server Get Metadata Item](#ServerMetadataItem_getMetadataItem).

##### 2.1.5.3 CloudInit ##### {#Section2_1_5_3}

[CloudInit](https://help.ubuntu.com/community/CloudInit) is a set of scripts that are run when an image boots. These scripts are provided by an Ubuntu package that is installed in the public Linux images provided by HP Helion. (CloudInit is not supported for Windows images.) The scripts are controlled by a configuration which is described in [cloud-config](http://bazaar.launchpad.net/~cloud-init-dev/cloud-init/trunk/view/head:/doc/examples/cloud-config.txt). The configuration is the result of a merge of information from multiple sources including configuration files stored in the image, configuration parameters on the kernel command line, configuration information provided by Nova and configuration information provided by the user when creating the instance. 

The scripts that are run by CloudInit perform a number of different tasks including:

+ setting a default locale
+ setting hostname
+ generating ssh private keys
+ adding ssh keys to user's .ssh/authorized_keys so they can log in
+ setting up ephemeral mount points

One of the tasks that CloudInit performs is to run user-provided scripts when an instance is booted. These scripts are provided by the user at the time the instance is booted using the *user_data* argument to [Create Server](#createServer). For more information on the format of user_data see the [CloudInit - Community Ubuntu Documentation](https://help.ubuntu.com/community/CloudInit).

##### 2.1.5.4 File Injection ##### {#FileInjection}

The [Create Server](#createServer) API has a parameter named *personality* which allows the specification of files to be injected into an image. For each file to be injected,the file path in the root filesystem of the server being created is specified along with the base64 encoded contents of the file. The following json object is a the body of a Create Server request which includes a file to be injected.

    {
        "server" : {
            "name" : "new-server-test",
            "imageRef" : 5579,
            "flavorRef" : 100,
            "metadata" : {
                "My Server Name" : "Apache1"
            },
            "personality" : [
                {
                    "path" : "/etc/banner.txt",
                    "contents" : "ICAgICAgDQoiQSBjbG91ZCBkb2VzIG5vdCBrbm93IHdoeSBp dCBtb3ZlcyBpbiBqdXN0IHN1Y2ggYSBkaXJlY3Rpb24gYW5k IGF0IHN1Y2ggYSBzcGVlZC4uLkl0IGZlZWxzIGFuIGltcHVs c2lvbi4uLnRoaXMgaXMgdGhlIHBsYWNlIHRvIGdvIG5vdy4g QnV0IHRoZSBza3kga25vd3MgdGhlIHJlYXNvbnMgYW5kIHRo ZSBwYXR0ZXJucyBiZWhpbmQgYWxsIGNsb3VkcywgYW5kIHlv dSB3aWxsIGtub3csIHRvbywgd2hlbiB5b3UgbGlmdCB5b3Vy c2VsZiBoaWdoIGVub3VnaCB0byBzZWUgYmV5b25kIGhvcml6 b25zLiINCg0KLVJpY2hhcmQgQmFjaA=="
                } 
            ] 
        }
    }

The path must specify a directory in the root file system, otherwise the file will be ignored. For example, files cannot be injected in /tmp for the images provided by HP as /tmp is not in the root filesystem in these images. If a [Configuration Drive](#ConfigurationDrive) is created when the server is created, the path is relative to the file system on the configuration drive, rather than the root file system.

The *maxPersonality* quota limits the number of files which can be injected into a servers file system. The maximum size of the decoded file contents is restricted by the *maxPersonalitySize* quota.
The maximum length of the file path is limited to 255 bytes.

File injection is not supported for Windows images.

##### 2.1.5.5 Configuration Drive ##### {#ConfigurationDrive}

A configuration drive is a disk containing a FAT filesystem with configuration data that is accessible to a server. The configuration drive is enabled by the Config Drive extension and created at the same time the server is created by specifying the [Create Server](#createServer) parameter *config_drive* with a value of true. This will cause a configuration drive to be created and items that are normally injected into the root filesystem of the newly created server are injected into the configuration drive instead. The items that are written to the configuration drive are:

+ server metadata
+ injected file data
+ the user's ssh public key

The server metadata is just the metadata that is provided as the value *metadata* parameter to [Create Server](#createServer). The injected file data is provided as the *personality* parameter to [Create Server](#createServer). The user's public key is specified using the *key_name* parameter to [Create Server](#createServer). These values are normally injected into the servers root file system when it is created. When a configuration drive is specified, they are injected into the filesystem on the configuration drive instead. Note that it is still possible to login to a server created in this manner as long as the server image includes CloudInit, since CloudInit will properly initialize authorized_keys with the user's public ssh_key independently of the injection of this value into the image that takes place when the server is created.

It is also possible to provide an imageRef as the value of the *config_drive* parameter. However, this is not useful in the Compute environment as all images are either HP publicly available images or snapshots, neither of which can be usefully used as a configuration drive.

Note that the configuration drive is an API extension in later versions of OpenStack Nova.

The configuration drive is not supported for servers running Windows images.

#### 2.1.6 Images #### {#Images}

Servers are booted from disk images which are specified at the time the server is created. There are three different types of disk images: machine images, kernel images and ramdisk images. The machine image contains the root file system for the image. The kernel image is the image that is loaded when the server is launched, and the ramdisk contains drivers used to boot the server. The latter two image types are optional. The machine image is always required, but the kernel and ramdisk may or may not be required depending on how the images were built.

Images may be public or private. Public images are provided by HP and are available to all users. Private images are created by taking a snapshot of the root file system of a running server using the [Create Image](#createImage) API method. Images have an attribute which distinguishes public images provided by HP from private images (snapshots) created by the user. A user can access all the public images and any private images he owns. The images available for use can be listed using the [List Images](#listImages) API method. 

##### 2.1.6.1 Snapshots ##### {#Section2_1_6_1}

Image snapshots are copies of the (virtual) disk partition containing the root file system that can be created from a running VM using [Create Image](#createImage). A snapshot is linked to the same kernel and ramdisk as the image which was originally booted on the VM.  In the listing above, foo100-snap and foo-snap are snapshots created by the user.

##### 2.1.6.2 Image Metadata ##### {#ImageMetadata}

Images can have metadata in the form of key/value pairs. This metadata can be queried and modified using operations of the [Image Metadata](#ImageMetadata) and [Image Metadata Item](#ImageMetadataItem) resources.

### 2.2 Volumes ### {#Section2_2}

Nova volumes are persistent disks that can be attached to servers. When attached to a server, the volume appears as a disk block device on which a filesystem can be created. The Volumes extension to the Compute API is described in a separate document.

#### 2.2.1 Boot Volumes ####

A volume can be prepared with a bootable image and used directly to boot a server. There are two ways to prepare a volume for booting:

+ Create and prepare manually
+ Create from image

To create a boot volume manually, a volume can be attached to an existing instance and a bootable OS image can be built on the volume from there. The volume can then be detached and used as a boot volume. Alternatively the volume can be created with a copy of one of the existing images. Volume creation is described in the [Volumes](#volumes) extension.

### 2.3 Network ### {#Section2_3}

#### 2.3.1 Network Model #### {#NetworkModel}

A network is a virtual resource managed by the Network Service API. The full scope of Network creation and management is beyond the scope of the Compute Service API and is not described here. However, the compute API does provide a model of networking that can be used to establish connectivity between servers and with the external internet.

A single network exists per project by default and is connected to the external internet. When servers are created they are added to this network by default. Any further networks that may have been created for the project via the Network Service API are also available for use. If there are additional networks the user is required to specify which networks to connect a server to when it is created using the [Create Server](#createServer) operation.

A network has a pool of IP address that are internal to the network. Addresses are allocated from the pool and bound to network interfaces using DHCP. When a server is booted it receives an internal address for each of its network interfaces.

External addresses in the 15.0.0.0/8 address range provide access to servers from the internet. Servers can be assigned one or more external addresses after being created. These addresses are referred to as "floating IPs" and are attached to a server using the [Add Floating Ip](#addFloatingIp) operation. Floating IPs assigned to servers in this way must be allocated using [Allocate Floating Ip](#allocateFloatingIP). The total number of floating IPs that can be allocated to a project is limited by a per-project quota. This quota can be retrieved using [List Limits](#listLimits).

#### 2.3.2 Security Groups #### {#securityGroups}

Access to servers is controlled by security groups which are a collection of rules about which sources, protocols and ports a server can receive traffic from. No traffic can be received by a server unless a security group rule explicitly allows it.

The Compute service creates the default security group shown below when an account is activated.

| IP Protocol | From Port | To Port |  IP Range | Source Group |
|:------------|:----------|:--------|:----------|:-------------|
| icmp        | -1        | -1      | 0.0.0.0/0 |              |
| tcp         | 22        | 22      | 0.0.0.0/0 |              |

These rules allow SSH and ping (ICMP) from all sources. Note in particular, that the IP range 0.0.0.0/0 means these rules apply to traffic from all sources.

Additional security groups can be created for a project using [Create Security Group](#createSecGroup). A security group can be associated with a server when the server is created by including its name in the list of security groups provided as the *security_groups* parameter of [Create Server](#createServer). If no security group is specified at the time a server is created, the server is associated with the default security group. You can also add/remove security groups to/from a server after it has been created using the server actions [Add Security Group](#addSecurityGroup) and [Remove Security Group](#removeSecurityGroup).

Additional rules can be added to a security group using [Create Security Group Rule](#createSecGroupRule). As shown in the example above, the source address for traffic can be specified as either a CIDR or as any server associated with a security group. (In the example above, the security group that is specified is the default security group itself.) Traffic within a security group is not automatically enabled. If you want to allow ports (or all traffic) within a given security group, you can create a rule using the same source and destination group.

Any change to a security group's rules take immediate effect for any server associated with the group when the change is made. Changes will also applied to any server subsequently associated with the security group containing the rule.

When a security group is deleted it is effectively removed from all servers with which it was previously associated. If access to a server was previously allowed by one of the rules in the deleted security group, and no other security group associated with the server allows similar access, it will no longer be possible to access the server. For example, if the deleted security group allowed ping access (ICMP) to the server from a particular source, and none of the rules in the remaining security groups associated with the server allow ICMP from the same source, then it will no longer be possible to ping the server from that source.

### 2.4 Projects ### {#Projects}

A project has access to a collection of resources uniquely associated with the project. Resources that are associated with a project include:

+ Server instances
+ Networks
+ Security Groups
+ Images
+ Users

All resources are uniquely allocated in an Availability Zone. However, the project may have resources in multiple Availability Zones. To access resources within a given Availability Zone, the API endpoints for that Availability Zone (as listed in the [Service Catalog](#ServiceCatalog) returned by the Identity Service) must be used.

Users are created separately from projects; a given user can be associated with no projects or with one or more projects.

*NOTE* The term 'tenant' is sometimes used to also refer to a 'project' as these can be used interchangeably.

## 3. General API Information ## {#Section3_}

### 3.1  Authorization ### {#Authorization}

Access to Compute is controlled on a per-project basis. All Compute API operations have a `projectId` parameter which identifies the particular collection of resources the user will be accessing (see [Projects](#Projects).) In order to perform an API operation, the user must first obtain an authorization token scoped to the particular project he will be accessing. This authorization process is described in [Identity Service Overview](https://docs.hpcloud.com/identity). The token obtained must be included in the `X-Auth-Token` header of any subsequent Compute API request. Tokens are valid for a limited period of time (on the order of 24 hours). When the token expires, subsequent attempts to access the API will return authorization failures and a new token must be obtained in order to continue using the API.

### 3.2 Regions and Availability Zones ### {#Section3_2}

In order to access Compute, the user must specify the endpoint for one of the regions. Each region has three Availability Zones which provide separate fault domains for the Compute service. Failures in one AZ should not affect any resources in another AZ. Highly available applications should therefore deploy resources in more than one region and AZ.

Availability Zones are further clustered into regions and geographies. Compute is currently available in two regions (region-a and region-b) in a single geography (geo-1). The set of endpoints that a project can access are returned in a Service Catalog when the user calls the Identity Service to get a token.

### 3.3  Service Catalog ### {#ServiceCatalog}

The listing below shows a fragment of the Service Catalog returned by the Identity Service which contains the endpoints for Compute. Note that a set of endpoints is returned for each region.

		{
			"name": "Compute",
			"type": "compute",
			"endpoints": [
				{
					"tenantId": "12345678910111",
					"publicURL": "https:\\region-a.geo-1.compute.hpcloudsvc.com\v2\12345678910111",
					"region": "region-a.geo-1",
					"versionId": "2",
					"versionInfo": "https:\\region-a.geo-1.compute.hpcloudsvc.com\v2\",
					"versionList": "https:\\region-a.geo-1.compute.hpcloudsvc.com"
				}
				{
					"tenantId": "12345678910111",
					"publicURL": "https:\\region-b.geo-1.compute.hpcloudsvc.com\v2\12345678910111",
					"region": "region-b.geo-1",
					"versionId": "2",
					"versionInfo": "https:\\region-b.geo-1.compute.hpcloudsvc.com\v2\",
					"versionList": "https:\\region-b.geo-1.compute.hpcloudsvc.com"
				}
			]
		}

### 3.4 Request/Response Types ### {#Section3_4}

The OpenStack Compute API supports both the JSON and XML data serialization formats. The request format is specified using the `Content-Type` header and is required for operations that have a request body. The response format can be specified in requests using either the `Accept` header or adding an .xml or .json extension to the request URI. Note that it is possible for a response to be serialized using a format different from the request (see example below). If no response format is specified, JSON is the default. If conflicting formats are specified using both an `Accept` header and a query extension, the query extension takes precedence.

Example Request with Headers - JSON

    POST /v2/11692683195772/servers HTTP/1.1
    Host: region-a.geo-1.compute.hpcloudsvc.com
    X-Auth-Token: HPAuth_a8df744befe0a7c0e759f0601f53226af35f3f6f44c55d9b3a3c0337e7664ac2
    Content-Type: application/json
    Accept: application/xml
    Content-Length: 63
    
    {
        "server":
            {
                "name":"webserver",
                "imageRef":5579,
                "flavorRef":100
            }
    }

Example Response with Headers - XML

    HTTP/1.1 202 Accepted
    Content-Length: 1224
    Content-Type: application/xml; charset=UTF-8
    Date: Thu, 25 Oct 2012 22:37:13 GMT
    
    <server accessIPv4="" accessIPv6="" adminPass="4QAx7M8MrXVmXZSL" created="2012-10-25T22:37:13Z" hostId="" id="467571" name="webserver" status="BUILD(scheduling)" tenantId="11692683195772" updated="2012-10-25T22:37:13Z" userId="28187593996363" uuid="e5ac3d3c-cda3-4106-b60a-0a29b382fda2" xmlns="http://docs.openstack.org/compute/api/v2" xmlns:atom="http://www.w3.org/2005/Atom">
	<atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/v2/11692683195772/servers/467571" rel="self"/>
	<atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/11692683195772/servers/467571" rel="bookmark"/>
	<image id="5579">
	    <atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/11692683195772/images/5579" rel="bookmark"/>
	</image>
	<flavor id="100">
	    <atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/11692683195772/flavors/100" rel="bookmark"/>
	</flavor>
	<addresses/>
	<security_groups>
	    <security_group id="9143" name="default">
		<atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/v2/11692683195772/os-security-groups/9143" rel="bookmark"/>
	    </security_group>
	</security_groups>
    </server>

Notice, in the above example, that the content type is set to application/json but it asks for an application/xml response with the `Accept` header. The same result could be achieved by adding an .xml extension to the request URI as shown below.

Example Request with .xml Extension - JSON

    POST /v2/11692683195772/servers.xml HTTP/1.1
    User-Agent: curl/7.21.3 (x86_64-pc-linux-gnu) libcurl/7.21.3 OpenSSL/0.9.8o zlib/1.2.3.4 libidn/1.18
    Host: region-a.geo-1.compute.hpcloudsvc.com
    Accept: */*
    X-Auth-Token: HPAuth_a8df744befe0a7c0e759f0601f53226af35f3f6f44c55d9b3a3c0337e7664ac2
    Content-Type: application/json
    Content-Length: 62
    
    {
        "server":
            {
                "name":"dbserver",
                "imageRef":5579,
                "flavorRef":100
            }
    }

### 3.5 Links and References ### {#Section3_5}

Responses to several API operations include links which refer to Compute resources. For example, here is the response to a call on the [Get Server](#getServer) method.

List Servers (limit=1) Response: XML

    <servers xmlns="http://docs.openstack.org/compute/api/v2" xmlns:atom="http://www.w3.org/2005/Atom">
        <server id="488379" name="web 1">
            <atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/v2/11692683195772/servers/488379" rel="self"/>
            <atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/11692683195772/servers/488379" rel="bookmark"/>
        </server>
    </servers>

List Servers (limit=1) Response: JSON

    {
        "servers": [
            {
                "id": 488379,
                "links": [
                    {
                        "href": "https://region-a.geo-1.compute.hpcloudsvc.com/v2/11692683195772/servers/488379",
                        "rel": "self"
                    },
                    {
                        "href": "https://region-a.geo-1.compute.hpcloudsvc.com/11692683195772/servers/488379",
                        "rel": "bookmark"
                    }
                ],
                "name": "web 1",
                "uuid": "7d447c46-cdde-45b4-bdf6-6412a272ce32"
            }
        ]
    }

The link elements in the response give references to the resource, in this case a server, which include the full URI of the server. This URI could be used at a later time to perform some server action (for example, to reboot the server) and capture both the AZ and the id of the server within the AZ.

### 3.6 Paginated Collections ### {#Pagination}

To reduce load on the service, list operations limit the number of items that can be returned by a single call.

To navigate a collection, the parameters `limit` and `marker` can be set in the URI (e.g.?`limit`=100&`marker`=1234). The `marker` parameter is the ID of
the last item in the previous list. Items are sorted by create time in descending order. When a create time is not available they are sorted by ID. The `limit` parameter sets the page size. A maximum of 1000 items are returned by a single call. Setting `limit` to a value greater than 1000 has no effect. A marker with an invalid ID will return a badRequest (400) fault.

### 3.7 Efficient Polling ### {#Polling}

The REST API allows you to poll for the status of certain operations by performing a GET on various elements. Rather than re-downloading and re-parsing the full status at each polling interval, your REST client may use the `changes-since` parameter to check for changes since a previous request. The `changes-since` time is specified as an [ISO 8601](http://en.wikipedia.org/wiki/ISO_8601) dateTime (2011-01-24T17:08:00). The form for the timestamp is CCYY-MM-DDThh:mm:ss. An optional time zone may be written in by appending the form Z[+|-]hh:mm (2011-01-24T17:08:00Z+01:00)which describes the timezone as an offset from UTC. When the timezone is not specified (2011-01-24T17:08:00), the UTC timezone will be assumed. If nothing has changed since the `changes-since` time, an empty list will be returned. If data has changed, only the items changed since the specified time will be returned in the response. For example, performing a GET against https://api.servers.openstack.org/v2/224532/servers?changes-since=2011-01-24T17:08:00 would list all servers that have changed since Mon, 24 Jan 2011 17:08:00 UTC.

To allow clients to keep track of changes, the changes-since filter displays items that have been *recently* deleted. Both images and servers contain a `DELETED` status that indicates that the resource has been removed. Implementations are not required to keep track of deleted resources indefinitely, so sending changes since a time in the distant past may miss deletions.

### 3.8 Limits ### {#Limits}

#### 3.8.1 Absolute Limits #### {#Section3_8_1}

Limits are established for the following resources on a per project basis:

+ metadata_items (maxServerMeta, maxImageMeta): number of metadata items allowed per instance
+ instances (maxTotalInstances): the maximum number of VM instances that can be created for the project
+ injected_files (maxPersonality): the number of injected files that can be specified when a new VM instance is created
+ injected_file_content_bytes (maxPersonalitySize): the maximum size of an injected file
+ cores (maxTotalCores): the maximum of the total number of cores for project VM instances
+ ram (maxTotalRAMSize): the maximum number of megabytes of instance RAM for the project
+ security_groups (maxSecurityGroups): the maximum number of security groups
+ security_group_rules (maxSecurityGroupRules): the maximum number of rules in a security group
+ floating_ip: the maximum number of floating ips that can be assigned to the project 
+ volumes: the number of volumes which can be created
+ gigabytes: the maximum total size of all volumes associated with the project

Please note that although the floating_api, security_groups and security_group_rules quotas are present in the Compute API, they are actually maintained by the Network API and the values held by the Compute API are not in effect. For accuracy please refer to the values returned by the Network API. 

The limits are applied per AZ. [List Limits](#listLimits) can be used to retrieve the current value of these limits within an AZ for a project.

#### 3.8.2 Rate Limits #### {#Section3_8_2}

In order to ensure fair sharing of cloud resources, limits are placed on the rate at which an individual project can make requests to the Compute API servers. The rate limits are specified in terms of HTTP verbs (GET, PUT, POST, DELETE) and are further qualified by URL. Stricter limits are place on operations that can affect servers than on queries. This allows users to monitor the status of the environment while guaranteeing equitable sharing of resources. Rate limiting is enforced per AZ - a project has a separate allowance in each AZ.

### 3.9 Versions ### {#Section3_9}

The Compute service is based on OpenStack Nova v2. The OpenStack v1 Nova API is deprecated.

### 3.10 Extensions ### {#Section3_10}

The OpenStack Compute API is extensible. Extensions serve two purposes: They allow the introduction of new features in the API without requiring a version change, and they allow the introduction of vendor-specific functionality. Applications can programmatically determine what extensions are available by using the [List Extensions](#listExtensions) and [Get Extension](#getExtension) API methods. Compute supports the following extensions:

+ os-availability-zone
+ os-config-drive
+ os-console-output
+ os-create-server-ext
+ OS-EXT-AZ
+ OS-EXT-STS
+ OS-FLV-EXT-DATA
+ os-floating-ips
+ os-keypairs
+ os-multiple-create 
+ OS-SCH-HNT
+ os-security-groups
+ os-used-limits
+ os-volumes
+ os-rescue
+ os-multiple-create
+ os-consoles
+ os-flavor-rxtx
+ os-flavor-swap
+ os-hide-server-address
+ OS-EXT-IMG_SIZE
+ os-instance-actions
+ os-user-data
+ os-extended-floating-ips
+ OS-EXT-IPS
+ OS-EXT-IPS-MAC
+ os-server-start-stop

The resources and methods of these extensions are described in section 4.1, [ServiceAPIOperations](#ServiceAPIOperations).

### 3.11 Faults ### {#Section3_11}

When an error occurs at request time, the system will return an HTTP error response code denoting the type of error. The system will also return additional information about the fault in the body of the response.

Fault Response: XML

    <?xml version="1.0" encoding="UTF-8"?>
    <cloudServersFault
        xmlns="http://docs.openstack.org/compute/api/v2"
        code="500">
    <message>Fault!</message>
    <details>Error Details...</details>
    </computeFault>

Fault Response: JSON

    {
        "cloudServersFault" : {
            "code" : 500,
            "message" : "Fault!",
            "details" : "Error Details..." 
        }
    }

The error code is returned in the body of the response for convenience. The message section returns a human-readable message that is appropriate for display to the end user. The details section is optional and may contain information - for example, a stack trace-to assist in tracking down an error. The detail section may or may not be appropriate for display to an end user.

The root element of the fault (e.g. cloudServersFault) may change depending on the type of error. The following is a list of possible elements along with their associated error codes.

| Fault Element | Associated Error Code(s) |
|:--------------|:-------------------------|
| cloudServersFault | 500, other codes possible |
| badRequest | 400 |
| unauthorized | 401 |
| resizeNotAllowed | 403 |
| itemNotFound | 404 |
| badMethod | 405 |
| conflictingRequest | 409 |
| overLimit | 413 |
| badMediaType | 415 |
| notImplemented | 501 |
| serviceUnavailable | 503 |

Fault Response, Item Not Found: XML

    <itemNotFound code="404" 
        xmlns="http://docs.openstack.org/compute/api/v2">
        <message>
            The resource could not be found.
        </message>
    </itemNotFound>
    

Fault Response, Item Not Found: JSON

    {
        "itemNotFound": 
    	   {
           "message": "The resource could not be found.", 
    	   "code": 404
            }
    }

The OverLimit fault is generated when any limit threshold is exceeded. When an OverLimit fault occurs, the time in seconds after which another request is allowed is returned in the `Retry-After` response header. An explanation of why the request was rejected is returned in the `details` attribute of the response.

Fault Response, Over Limit: XML

    <?xml version="1.0" encoding="UTF-8"?>
    <overLimit
        xmlns="http://docs.openstack.org/compute/api/v2"
        code="413"
      <message>"This request was rate-limited.</message>
      <details>Error Details...</details>
    </overLimit>
    

Fault Response, Over Limit: JSON

    {
        "overLimit" : {
            "code" : 413,
            "message" : "This request was rate-limited.",
            "details" : "Error Details...",
        }
    }

## 4. REST API Specifications ## {#Section4_}
### 4.1 API Operations ### {#ServiceAPIOperations}

The Compute API is composed of a core API and a number of API extensions. An API extension may add entirely new operations or extend the behavior of existing operations. This section lists the core API and API extensions. The HTTP method and resource path is listed for each operation along with its support for JSON and XML encodings. The API is served from a common base URI as below. See the [API Operation Details](#Section4_4) section for details of each operation.

**Hosts**:   
US West - https://region-a.geo-1.compute.hpcloudsvc.com   
US East - https://region-b.geo-1.compute.hpcloudsvc.com

**Base URI**: {Host}

**Operation URI**: {BaseURI}Path

#### 4.1.1 Core Compute API ###

| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? |
|:---------|:---------------------|:------------|:-----------------------|:------------------|
| **Versions** | [Get Version Info](#versionDetails) | GET | /v2 | Y/Y |
| **Extensions** | [List Extensions](#listExtensions) | GET | /v2/{project_id}/extensions | Y/Y |
| **Extension** | [Get Extension](#getExtension) | GET | /v2/{project_id}/extensions/{alias} | Y/Y |
| **Limits** | [List Limits](#listLimits) | GET | /v2/{project_id}/limits | Y/Y |
| **Servers** | [List Servers](#listServers) | GET | /v2/{project_id}/servers | Y/Y |
|  | [Create Server](#createServer) | POST | /v2/{project_id}/servers | Y/Y |
|  | [List Servers Detail](#listDetailServers) | GET | /v2/{project_id}/servers/detail | Y/Y |
| **Server** | [Get Server Details](#getServer) | GET | /v2/{project_id}/servers/{server_id} | Y/Y |
|  | [Update Server Name](#updateServer) | PUT | /v2/{project_id}/servers/{server_id} | Y/Y |
|  | [Delete Server](#deleteServer) | DELETE | /v2/{project_id}/servers/{server_id} | Y/Y |
| **Server Metadata** | [List Metadata](#ServerMetadata_listMetadata) | GET | /v2/{project_id}/servers/{server_id}/metadata | Y/Y |
|  | [Update Metadata](#ServerMetadata_updateMetadata) | POST | /v2/{project_id}/servers/{server_id}/metadata | Y/Y |
|  | [Create or Replace Metadata](#ServerMetadata_setMetadata) | PUT | /v2/{project_id}/servers/{server_id}/metadata | Y/Y |
| **Server Metadata Item** | [Get Metadata Item](#ServerMetadataItem_getMetadataItem) | GET | /v2/{project_id}/servers/{server_id}/metadata/{key} | Y/Y |
|  | [Create or Update Metadata Item](#ServerMetadataItem_setMetadataItem) | PUT | /v2/{project_id}/servers/{server_id}/metadata/{key} | Y/Y |
|  | [Delete Metadata Item](#ServerMetadataItem_deleteMetadataItem) | DELETE | /v2/{project_id}/servers/{server_id}/metadata/{key} | Y/Y |
| **Server Action** | [Reboot Server](#rebootServer) | POST | /v2/{project_id}/servers/{server_id}/action | Y/Y |
|  | [Rebuild Server](#rebuildServer) | POST | /v2/{project_id}/servers/{server_id}/action | Y/Y |
|  | [Create Image](#createImage) | POST | /v2/{project_id}/servers/{server_id}/action | Y/Y |
| **Server Addresses** | [List Server Addresses](#listServerAddresses) | GET | /v2/{project_id}/servers/{server_id}/ips | Y/Y |
|  | [List Addresses by Network](#listServerAddressesbyNetwork) | GET | /v2/{project_id}/servers/{server_id}/ips/{network_id} | Y/Y |
| **Images** | [List Images](#listImages) | GET | /v2/{project_id}/images | Y/Y |
|  | [List Images Detail](#listDetailImages) | GET | /v2/{project_id}/images/detail | Y/Y |
| **Image** | [Get Image Details](#getImage) | GET | /v2/{project_id}/images/{image_id} | Y/Y |
|  | [Delete Image](#deleteImage) | DELETE | /v2/{project_id}/images/{image_id} | Y/Y |
| **Image Metadata** | [List Metadata](#ImageMetadata_listMetadata) | GET | /v2/{project_id}/images/{image_id}/metadata | Y/Y |
|  | [Update Metadata](#ImageMetadata_updateMetadata) | POST | /v2/{project_id}/images/{image_id}/metadata | Y/Y |
|  | [Create or Replace Metadata](#ImageMetadata_setMetadata) | PUT | /v2/{project_id}/images/{image_id}/metadata | Y/Y |
| **Image Metadata Item** | [Get Metadata Item](#ImageMetadataItem_getMetadataItem) | GET | /v2/{project_id}/images/{image_id}/metadata/{key} | Y/Y |
|  | [Create or Update Metadata Item](#ImageMetadataItem_setMetadataItem) | PUT | /v2/{project_id}/images/{image_id}/metadata/{key} | Y/Y |
|  | [Delete Metadata Item](#ImageMetadataItem_deleteMetadataItem) | DELETE | /v2/{project_id}/images/{image_id}/metadata/{key} | Y/Y |
| **Flavors** | [List Flavors](#listFlavors) | GET | /v2/{project_id}/flavors | Y/Y |
|  | [List Flavors Detail](#listDetailFlavors) | GET | /v2/{project_id}/flavors/detail | Y/Y |
| **Flavor** | [Get Flavor Details](#getFlavor) | GET | /v2/{project_id}/flavors/{flavor_id} | Y/Y |

#### 4.1.2 Availability Zone ###

| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? | Extends Operation |
|:---------|:---------------------|:------------|:-----------------------|:------------------|:---------------:|
| **Availability Zone** | [List Availability Zones](#listaz) | GET | /v2/{project_id}/os-availability-zone | Y/Y | |
| **server** | [Create With Availability Zone](#createWithaz) | POST | /v2/project_id}/servers | Y/Y | [Create Server](#createServer) |

#### 4.1.3 Config Drive ###

| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? | Extends Operation |
|:---------|:---------------------|:------------|:-----------------------|:------------------|:---------------:|
| **servers** | [List Servers With Config Drive](#listWithConfig) | GET | /v2/{project_id}/servers/detail | Y/Y | [List Servers Detail](#listDetailServers) |
| **server** | [Create With Config Drive](#createWithConfig) | POST | /v2/project_id}/servers | Y/Y | [Create Server](#createServer) |
| | [Get Servers With Config Drive](#getWithConfig) | GET | /v2/{project_id}/servers/{server_id} | Y/Y | [Get Server Details](#getServer) |

#### 4.1.4 Console Output ###

| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? | Extends Operation |
|:---------|:---------------------|:------------|:-----------------------|:------------------|:---------------:|
| **Server Action** | [Get Console Output.](#getConsoleOutput) | POST | /v2/{project_id}/servers/{server_id}/action | Y/Y |  |
|  | [Get VNC Console](#getVNCConsole) | POST | /v2/{project_id}/servers/{server_id}/action | Y/N |  |

#### 4.1.5 Extended Availability Zone ###

| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? | Extends Operation |
|:---------|:---------------------|:------------|:-----------------------|:------------------|:---------------:|
| **Servers** | [List With Availability Zone](#listWithaz) | GET | /v2/{project_id}/servers/detail | Y/Y | [List Servers Detail](#listDetailServers) |
| **server** | [Get With Availability Zone](#getWithaz) | GET | /v2/{project_id}/servers/{server_id} | Y/Y | [Get Server Details](#getServer) |

#### 4.1.6 Extended Status ###

| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? | Extends Operation |
|:---------|:---------------------|:------------|:-----------------------|:------------------|:---------------:|
| **Servers** | [List Extended Server Zones](#listExtendedServerZones) | GET | /v2/{project_id}/servers/detail | Y/Y | [List Servers Detail](#listDetailServers) |
| **Server** | [Get Extended Server Zones](#getExtendedServerZones) | GET | /v2/{project_id}/servers/{server_id} | Y/Y | [Get Server Details](#getServer) |

#### 4.1.7 Flavor Extra Data ###

| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? | Extends Operation |
|:---------|:---------------------|:------------|:-----------------------|:------------------|:---------------:|
| **Flavors** | [List Flavors Data ](#listDataFlavors) | GET | /v2/{project_id}/flavors/detail | Y/Y | [List Flavors Detail](#listDetailFlavors) |
| **Flavor** | [Get Flavor Extra Data](#getFlavorData) | GET | /v2/{project_id}/flavors/{flavor_id} | Y/Y | [Get Flavor Details](#getFlavor) |

#### 4.1.8 Floating IPs ###

| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? | Extends Operation |
|:---------|:---------------------|:------------|:-----------------------|:------------------|:---------------:|
| **Server Action** | [Add Floating IP](#addFloatingIp) | POST | /v2/{project_id}/servers/{server_id}/action | Y/Y |  |
|  | [Remove Floating IP](#removeFloatingIp) | POST | /v2/{project_id}/servers/{server_id}/action | Y/Y |  |
| **os-floating-ips** | [List Floating IPs](#listFloatingIPs) | GET | /v2/{project_id}/os-floating-ips | Y/Y |  |
|  | [Allocate Floating IP](#allocateFloatingIP) | POST | /v2/{project_id}/os-floating-ips | Y/Y |  |
| **os-floating-ips Item** | [Get Floating Ip](#getFloatingIP) | GET | /v2/{project_id}/os-floating-ips/{id} | Y/Y |  |
|  | [Deallocate Floating IP](#deallocateFloatingIP) | DELETE | /v2/{project_id}/os-floating-ips/{id} | Y/Y |  |

#### 4.1.9 Keypairs ###

| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? | Extends Operation |
|:---------|:---------------------|:------------|:-----------------------|:------------------|:---------------:|
| **os-keypairs** | [List Keypairs](#listKeypairs) | GET | /v2/{project_id}/os-keypairs | Y/Y |  |
|  | [Create Keypair](#createKeypair) | POST | /v2/{project_id}/os-keypairs | Y/Y |  |
| **os-keypairs Item** | [Get Keypair](#getKeypair) | GET | /v2/{project_id}/os-keypairs/{keypair_name} | Y/Y |  |
|  | [Delete Keypair](#deleteKeypair) | DELETE | /v2/{project_id}/os-keypairs/{keypair_name} | Y/Y |  |

#### 4.1.10 Scheduler Hints ###

| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? | Extends Operation |
|:---------|:---------------------|:------------|:-----------------------|:------------------|:---------------:|
| **Servers** | [Create Server With Hints](#CreateServerWithHints) | POST | /v2/{project_id}/servers | Y/Y | [Create Server](#createServer) |

#### 4.1.11 Security Groups ###

| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? | Extends Operation |
|:---------|:---------------------|:------------|:-----------------------|:------------------|:---------------:|
| **Servers** | [List Server with Groups](#listServerWithGroups) | GET | /v2/{project_id}/servers/detail | Y/Y | [List Servers Detail](#listDetailServers) |
| **Server** | [Get Server with Groups](#getServerWithGroups) | GET | /v2/{project_id}/servers/{server_id} | Y/Y | [Get Server Details](#getServer) |
| **Server Action** | [Add Security Group](#addSecurityGroup) | POST | /v2/{project_id}/servers/{server_id}/action | Y/Y |  |
|  | [Remove Security Group](#removeSecurityGroup) | POST | /v2/{project_id}/servers/{server_id}/action | Y/Y |  |
| **os-security-groups** | [List Security Groups](#listSecGroups) | GET | /v2/{project_id}/os-security-groups | Y/Y |  |
|  | [Create Security Group](#createSecGroup) | POST | /v2/{project_id}/os-security-groups | Y/Y |  |
| **os-security-group** | [Get Security Group](#getSecGroup) | GET | /v2/{project_id}/os-security-groups/{security_group_id} | Y/Y |  |
|  | [Delete Security Group](#deleteSecGroup) | DELETE | /v2/{project_id}/os-security-groups/{security_group_id} | Y/Y |  |
| **os-security-group-rules** | [Create Security Group Rule](#createSecGroupRule) | POST | /v2/{project_id}/os-security-group-rules | Y/Y |  |
| **os-security-group-rule** | [Delete Security Group Rule](#deleteSecGroupRule) | DELETE | /v2/{project_id}/os-security-group-rules/{security_group_rule_id} | Y/Y |  |

#### 4.1.12 Used Limits ###

| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? | Extends Operation |
|:---------|:---------------------|:------------|:-----------------------|:------------------|:---------------:|
| **Limits** | [List Used Limits](#listUsedLimits) | GET | /v2/{project_id}/limits | Y/Y | [List Limits](#listLimits) |

#### 4.1.13 Volumes ###

| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? | Extends Operation |
|:---------|:---------------------|:------------|:-----------------------|:------------------|:---------------:| 
| **os-volumes** | [List Volumes](#listVolumes) | GET | /v2/{project_id}/os-volumes | Y/Y | |
|  | [List Volumes Details](#listVolumesDetails) | GET | /v2/{project_id}/os-volumes/detail | Y/Y | |
|  | [Create Volume](#createVolume) | POST | /v2/{project_id}/os-volumes/{volume_id} | Y/Y | |
|  | [Show Volume](#showVolume) | GET | /v2/{project_id}/os-volumes/{volume_id} | Y/Y | |
|  | [Delete Volume](#deleteVolume) | DELETE | /v2/{project_id}/os-volumes/{volume_id} | Y/Y | |
| **os-volume-types** | [List Volume Types](#listVolumeTypes) | Get | /v2/{project_id}/os-volume-types | Y/Y | |
|  | [Show Volume Type](#listVolumeTypes) | Get | /v2/{project_id}/os-volume-types/{type_id} | Y/Y | |
| **os-snapshots** | [Create Snapshot](#createSnapshot) | POST | /v2/{project_id}/os-snapshots | Y/Y | |
|  | [List Snapshots](#listSnapshots) | GET | /v2/{project_id}/os-snapshots | Y/Y | |
|  | [List Snapshots Details](#listSnapshotsDetails) | GET | /v2/{project_id}/os-snapshots/detail | Y/Y | |
|  | [List Snapshot](#listSnapshot) | GET | /v2/{project_id}/os-snapshots/{snapshot_id} | Y/Y | |
|  | [Delete Snapshots](#deleteSnapshot) | DELETE | /v2/{project_id}/os-snapshots/{snapshot_id} | Y/Y | |
| **os-volume-attachments** | [Attach a Volume to a Server](#AttachAVolumeToAServer) | POST | /v2/{project_id}/servers/{server_id}/os-volume_attachments | Y/N | |
|  | [List Volumes Attached to Server](#ListVolumeAttchedToServer) | GET | /v2/{project_id}/servers/{server_id}/os-volume_attachments | Y/N | |
|  | [Get Attached Volume Details](#GetAttachedVolumeDetails) | GET | /v2/{project_id}/servers/{server_id}/os-volume_attachments/{volume_id} | Y/N | |
|  | [Detach a Volume from a Server](#DetachAVolumeFromAServer) | DELETE | /v2/{project_id}/servers/{server_id}/os-volume_attachments/{volume_id} | Y/N | 

#### 4.1.14 Rescue ###

| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? | Extends Operation |
|:---------|:---------------------|:------------|:-----------------------|:------------------|:---------------:|
| **Server Action** | [Server Rescue](#rescue) | POST | /v2/{project_id}/servers/{server_id}/action | Y/Y |  |
|  | [Server Unrescue](#unrescue) | POST | /v2/{project_id}/servers/{server_id}/action | Y/Y |  |

#### 4.1.15 Multiple Create ###

| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? | Extends Operation |
|:---------|:---------------------|:------------|:-----------------------|:------------------|:---------------:|
| **Servers** | [Multiple Create](#multipleCreate) | POST | /v2/{project_id}/servers | Y/Y | [Create Server](#createServer) |

#### 4.1.16 Consoles ###

| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? | Extends Operation |
|:---------|:---------------------|:------------|:-----------------------|:------------------|:---------------:|
| **Server Action** | [Get VNC Console](#getVNCConcole) | POST | /v2/{project_id}/servers/{server_id}/action | Y/Y |  |

#### 4.1.17 FlavorRxtx ###

| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? | Extends Operation |
|:---------|:---------------------|:------------|:-----------------------|:------------------|:---------------:|
| **Flavors** | [List Flavors Rxtx ](#listFlavorsRxtx) | GET | /v2/{project_id}/flavors/detail | Y/Y | [List Flavors Detail](#listDetailFlavors) |
| **Flavor** | [Get Flavor Rxtx](#getFlavorRxtx) | GET | /v2/{project_id}/flavors/{flavor_id} | Y/Y | [Get Flavor Details](#getFlavor) |

#### 4.1.18 Flavor Swap ###

| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? | Extends Operation |
|:---------|:---------------------|:------------|:-----------------------|:------------------|:---------------:|
| **Flavors** | [List Flavors Swap ](#listFlavorsSwap) | GET | /v2/{project_id}/flavors/detail | Y/Y | [List Flavors Detail](#listDetailFlavors) |
| **Flavor** | [Get Flavor Swap](#getFlavorSwap) | GET | /v2/{project_id}/flavors/{flavor_id} | Y/Y | [Get Flavor Details](#getFlavor) |

#### 4.1.19 Image Size ###

| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? | Extends Operation |
|:---------|:---------------------|:------------|:-----------------------|:------------------|:---------------:|
| **Images** | [List Image Size](#listImageSize) | GET | /v2/{project_id}/images/detail | Y/Y | [List Images Detail](#listDetailImages) |
| **Image** | [Get Image Size](#getImageSize) | GET | /v2/{project_id}/images/{image_id} | Y/Y | [Get Image Details](#getImage) |

#### 4.1.20 Instance Actions ###

| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? | Extends Operation |
|:---------|:---------------------|:------------|:-----------------------|:------------------|:---------------:|
| **os-instance-actions** | [List Server Actions](#listServerActions) | GET | /v2/{project_id}/servers/{server_id}/os-instance-actions | Y/Y | |
| **os-instance-actions Item** | [List Server Actions](#listServerActions) | GET | /v2/{project_id}/servers/{server_id}/os-instance-actions/{action_id} | Y/Y | |

#### 4.1.21 User Data ###

| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? | Extends Operation |
|:---------|:---------------------|:------------|:-----------------------|:------------------|:---------------:|
|  | [Create Server With Users Data](#createServerUserData) | POST | /v2/{project_id}/servers | Y/Y | [Create Server](#createServer) |

#### 4.1.22 Extended Floating IPs ###

| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? | Extends Operation |
|:---------|:---------------------|:------------|:-----------------------|:------------------|:---------------:|
| **Server Action** | [Add Floating IP with fixed](#addFloatingIpWithFixed) | POST | /v2/{project_id}/servers/{server_id}/action | Y/Y | [Add Floating IP](#addFloatingIp) |

#### 4.1.23 Extended IPs ###

| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? | Extends Operation |
|:---------|:---------------------|:------------|:-----------------------|:------------------|:---------------:|
| **Servers** | [List with IPs](#listWithIps) | GET | /v2/{project_id}/servers/detail | Y/Y | [List Servers Detail](#listDetailServers) |
| **Servers** | [Get with IPs](#getWithIps) | GET | /v2/{project_id}/servers/{server_id} | Y/Y | [Get Server Details](#getServer) |

#### 4.1.24 Extended IPs MAC ###

| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? | Extends Operation |
|:---------|:---------------------|:------------|:-----------------------|:------------------|:---------------:|
| **Servers** | [List with IPs Mac](#listWithIpsMac) | GET | /v2/{project_id}/servers/detail | Y/Y | [List Servers Detail](#listDetailServers) |
| **Servers** | [Get with IPsMac](#getWithIpsMac) | GET | /v2/{project_id}/servers/{server_id} | Y/Y | [Get Server Details](#getServer) |

#### 4.1.25 Server Start-Stop ###
| Resource | Operation            | HTTP Method | Path                   | JSON/XML Support? | Extends Operation |
|:---------|:---------------------|:------------|:-----------------------|:------------------|:---------------:|
| **Server Action** | [Start Server](#startServer) | POST | /v2/{project_id}/servers/{server_id}/action | Y/Y |
|  | [Stop Server](#stopServer) | POST | /v2/{project_id}/servers/{server_id}/action | Y/Y |

### 4.2 Common Request Headers ### {#Section4_3}

*Http standard request headers*

**Accept** - Internet media types that are acceptable in the response. Compute supports the media types application/xml and application/json.

**Content-Length** - The length of the request body in octets (8-bit bytes).

**Content-Type** - The Internet media type of the request body. Used with POST and PUT requests. Must be either application/xml or application/json.

**Host** - The domain name of the server hosting Compute.

*Non-standard request headers*

**X-Auth-Token** - authorization token.

*Example*

    POST /v2/11692683195772/servers HTTP/1.1
    Host: az-1.region-a.geo-1.compute.hpcloudsvc.com
    Accept: */*
    X-Auth-Token: HPAuth_2895c13b1118e23d977f6a21aa176fd2bd8a10e04b74bd8e353216072968832a
    Content-Type: application/json
    Content-Length: 85

### 4.3 Common Response Headers ### {#Section4_3}

*Http standard response headers*

**Content-Length** - The length of the response body in octets (8-bit bytes).

**Content-Type** - Internet media type of the response body.

**Date** - The date and time that the response was sent.

*Non-standard response headers*

**Retry-After** - Number of seconds to wait before a retry will succeed. This header is included in the response to an operation which was rate limited.

*Example*

    HTTP/1.1 202 Accepted
    Content-Length: 1135
    Content-Type: application/json; charset=UTF-8
    Date: Tue, 30 Oct 2012 16:22:35 GMT

### 4.4 API Operation Details ### {#Section4_4}

The following provides details of each operation in the core API and API extensions listed in the [API Operations](#ServiceAPIOperations) section, documenting the naming conventions, request and response formats, status codes, error conditions, rate limits, quota limits, and specific business rules.

#### 4.4.1 Core Compute API ####
##### 4.4.1.1 Get Version Info ##### {#versionDetails}
##### GET /v2 #####

Returns detailed information about this specific version of the API.

**Request Data**
N/A

**URL Parameters**
N/A

**Data Parameters**   
This operation does not require a request body.

**Success Response**   
200 - OK

**Response Data**
This operation returns a response body.

JSON

    {
        "version": {
            "id": "v2.0",
            "links": [
                {
                    "href": "http://region-a.geo-1.compute.hpcloudsvc.com/v2/",
                    "rel": "self"
                },
                {
                    "href": "http://docs.openstack.org/api/openstack-compute/2/os-compute-devguide-2.pdf",
                    "rel": "describedby",
                    "type": "application/pdf"
                },
                {
                    "href": "http://docs.openstack.org/api/openstack-compute/2/wadl/os-compute-2.wadl",
                    "rel": "describedby",
                    "type": "application/vnd.sun.wadl+xml"
                }
            ],
            "media-types": [
                {
                    "base": "application/xml",
                    "type": "application/vnd.openstack.compute+xml;version=2"
                },
                {
                    "base": "application/json",
                    "type": "application/vnd.openstack.compute+json;version=2"
                }
            ],
            "status": "CURRENT",
            "updated": "2011-01-21T11:33:21Z"
        }
    }

XML

    <?xml version='1.0' encoding='UTF-8' ?>
    <version status="CURRENT" updated="2011-01-21T11:33:21Z" id="v2.0">
        <media-types>
            <media-type base="application/xml" type="application/vnd.openstack.compute+xml;version=2" />
            <media-type base="application/json" type="application/vnd.openstack.compute+json;version=2" />
        </media-types>
    <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/v2/" rel="self" />
    <atom:link href="http://docs.openstack.org/api/openstack-compute/2/os-compute-devguide-2.pdf" type="application/pdf" rel="describedby" />
    <atom:link href="http://docs.openstack.org/api/openstack-compute/2/wadl/os-compute-2.wadl" type="application/vnd.sun.wadl+xml" rel="describedby" />
    </version>

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/

##### 4.4.1.2 List Extensions ##### {#listExtensions}
##### GET /v2/{project_id}/extensions #####

Lists all available extensions.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
</ul>

**URL Parameters**
N/A

**Data Parameters**
This call does not require a request body

**Success Response**

JSON

    Content-Length: 6357 
    Content-Type: application/json 
    Date: Tue, 15 Apr 2014 19:28:16 GMT 
    X-Compute-Request-Id: req-932f8646-b36f-4e24-93eb-c35df0a68876

    {
        extensions: [26]
            0:  {
            updated: "2013-01-30T00:00:00+00:00"
            name: "ExtendedAvailabilityZone"
            links: [0]
            namespace: "http://docs.openstack.org/compute/ext/extended_availability_zone/api/v2"
            alias: "OS-EXT-AZ"
            description: "Extended Server Attributes support."
            }
            1:  {
            updated: "2013-02-19T00:00:00+00:00"
            name: "ImageSize"
            links: [0]
            namespace: "http://docs.openstack.org/compute/ext/image_size/api/v1.1"
            alias: "OS-EXT-IMG-SIZE"
            description: "Adds image size to image listings."
            }
            2:  {
            updated: "2013-01-06T00:00:00+00:00"
            name: "ExtendedIps"
            links: [0]
            namespace: "http://docs.openstack.org/compute/ext/extended_ips/api/v1.1"
            alias: "OS-EXT-IPS"
            description: "Adds type parameter to the ip list."
            }
            3:  {
            updated: "2013-03-07T00:00:00+00:00"
            name: "ExtendedIpsMac"
            links: [0]
            namespace: "http://docs.openstack.org/compute/ext/extended_ips_mac/api/v1.1"
            alias: "OS-EXT-IPS-MAC"
            description: "Adds mac address parameter to the ip list."
            }
            4:  {
            updated: "2011-11-03T00:00:00+00:00"
            name: "ExtendedStatus"
            links: [0]
            namespace: "http://docs.openstack.org/compute/ext/extended_status/api/v1.1"
            alias: "OS-EXT-STS"
            description: "Extended Status support."
            }
            5:  {
            updated: "2011-09-14T00:00:00+00:00"
            name: "FlavorExtraData"
            links: [0]
            namespace: "http://docs.openstack.org/compute/ext/flavor_extra_data/api/v1.1"
            alias: "OS-FLV-EXT-DATA"
            description: "Provide additional data for flavors."
            }
            6:  {
            updated: "2011-07-19T00:00:00+00:00"
            name: "SchedulerHints"
            links: [0]
            namespace: "http://docs.openstack.org/compute/ext/scheduler-hints/api/v2"
            alias: "OS-SCH-HNT"
            description: "Pass arbitrary key/value pairs to the scheduler."
            }
            7:  {
            updated: "2012-12-21T00:00:00+00:00"
            name: "AvailabilityZone"
            links: [0]
            namespace: "http://docs.openstack.org/compute/ext/availabilityzone/api/v1.1"
            alias: "os-availability-zone"
            description: "1. Add availability_zone to the Create Server v1.1 API. 2. Add availability zones describing. "
            }
            8:  {
            updated: "2012-07-16T00:00:00+00:00"
            name: "ConfigDrive"
            links: [0]
            namespace: "http://docs.openstack.org/compute/ext/config_drive/api/v1.1"
            alias: "os-config-drive"
            description: "Config Drive Extension."
            }
            9:  {
            updated: "2011-12-08T00:00:00+00:00"
            name: "ConsoleOutput"
            links: [0]
            namespace: "http://docs.openstack.org/compute/ext/os-console-output/api/v2"
            alias: "os-console-output"
            description: "Console log output support, with tailing ability."
            }
            10:  {
            updated: "2011-12-23T00:00:00+00:00"
            name: "Consoles"
            links: [0]
            namespace: "http://docs.openstack.org/compute/ext/os-consoles/api/v2"
            alias: "os-consoles"
            description: "Interactive Console support."
            }
            11:  {
            updated: "2011-07-19T00:00:00+00:00"
            name: "Createserverext"
            links: [0]
            namespace: "http://docs.openstack.org/compute/ext/createserverext/api/v1.1"
            alias: "os-create-server-ext"
            description: "Extended support to the Create Server v1.1 API."
            }
            12:  {
            updated: "2013-04-19T00:00:00+00:00"
            name: "ExtendedFloatingIps"
            links: [0]
            namespace: "http://docs.openstack.org/compute/ext/extended_floating_ips/api/v2"
            alias: "os-extended-floating-ips"
            description: "Adds optional fixed_address to the add floating IP command."
            }
            13:  {
            updated: "2012-08-29T00:00:00+00:00"
            name: "FlavorRxtx"
            links: [0]
            namespace: "http://docs.openstack.org/compute/ext/flavor_rxtx/api/v1.1"
            alias: "os-flavor-rxtx"
            description: "Support to show the rxtx status of a flavor."
            }
            14:  {
            updated: "2012-08-29T00:00:00+00:00"
            name: "FlavorSwap"
            links: [0]
            namespace: "http://docs.openstack.org/compute/ext/flavor_swap/api/v1.1"
            alias: "os-flavor-swap"
            description: "Support to show the swap status of a flavor."
            }
            15:  {
            updated: "2011-06-16T00:00:00+00:00"
            name: "FloatingIps"
            links: [0]
            namespace: "http://docs.openstack.org/compute/ext/floating_ips/api/v1.1"
            alias: "os-floating-ips"
            description: "Floating IPs support."
            }
            16:  {
            updated: "2012-12-11T00:00:00+00:00"
            name: "HideServerAddresses"
            links: [0]
            namespace: "http://docs.openstack.org/compute/ext/hide_server_addresses/api/v1.1"
            alias: "os-hide-server-addresses"
            description: "Support hiding server addresses in certain states."
            }
            17:  {
            updated: "2013-02-08T00:00:00+00:00"
            name: "InstanceActions"
            links: [0]
            namespace: "http://docs.openstack.org/compute/ext/instance-actions/api/v1.1"
            alias: "os-instance-actions"
            description: "View a log of actions and events taken on an instance."
            }   
            18:  {
            updated: "2011-08-08T00:00:00+00:00"
            name: "Keypairs"
            links: [0]
            namespace: "http://docs.openstack.org/compute/ext/keypairs/api/v1.1"
            alias: "os-keypairs"
            description: "Keypair Support."
            }
            19:  {
            updated: "2012-08-07T00:00:00+00:00"
            name: "MultipleCreate"
            links: [0]
            namespace: "http://docs.openstack.org/compute/ext/multiplecreate/api/v1.1"
            alias: "os-multiple-create"
            description: "Allow multiple create in the Create Server v1.1 API."
            }
            20:  {
            updated: "2011-08-18T00:00:00+00:00"
            name: "Rescue"
            links: [0]
            namespace: "http://docs.openstack.org/compute/ext/rescue/api/v1.1"
            alias: "os-rescue"
            description: "Instance rescue mode."
            }
            21:  {
            updated: "2013-05-28T00:00:00+00:00"
            name: "SecurityGroups"
            links: [0]
            namespace: "http://docs.openstack.org/compute/ext/securitygroups/api/v1.1"
            alias: "os-security-groups"
            description: "Security group support."
            }
            22:  {
            updated: "2012-01-23T00:00:00+00:00"
            name: "ServerStartStop"
            links: [0]
            namespace: "http://docs.openstack.org/compute/ext/servers/api/v1.1"
            alias: "os-server-start-stop"
            description: "Start/Stop instance compute API support."
            }
            23:  {
            updated: "2012-07-13T00:00:00+00:00"
            name: "UsedLimits"
            links: [0]
            namespace: "http://docs.openstack.org/compute/ext/used_limits/api/v1.1"
            alias: "os-used-limits"
            description: "Provide data on limited resources that are being used."
            }
            24:  {
            updated: "2012-08-07T00:00:00+00:00"
            name: "UserData"
            links: [0]
            namespace: "http://docs.openstack.org/compute/ext/userdata/api/v1. 1"
            alias: "os-user-data"
            description: "Add user_data to the Create Server v1.1 API."
            }
            25:  {
            updated: "2011-03-25T00:00:00+00:00"
            name: "Volumes"
            links: [0]
            namespace: "http://docs.openstack.org/compute/ext/volumes/api/v1.1"
            alias: "os-volumes"
            description: "Volumes support."
            }
    }

XML

    Content-Length: 6494 
    Content-Type: application/xml; charset=UTF-8 
    Date: Tue, 15 Apr 2014 20:01:56 GMT 
    X-Compute-Request-Id: req-190e0ea4-de8b-482e-8c6a-491b811fc1fb

    <?xml version='1.0' encoding='UTF-8' ?>
    <extensions>
        <extension alias="OS-EXT-AZ" updated="2013-01-30T00:00:00+00:00" namespace="http://docs.openstack.org/compute/ext/extended_availability_zone/api/v2" name="ExtendedAvailabilityZone">
        <description>Extended Server Attributes support.</description>
        </extension>
        <extension alias="OS-EXT-IMG-SIZE" updated="2013-02-19T00:00:00+00:00" namespace="http://docs.openstack.org/compute/ext/image_size/api/v1.1" name="ImageSize">
        <description>Adds image size to image listings.</description>
        </extension>
        <extension alias="OS-EXT-IPS" updated="2013-01-06T00:00:00+00:00" namespace="http://docs.openstack.org/compute/ext/extended_ips/api/v1.1" name="ExtendedIps">
        <description>Adds type parameter to the ip list.</description>
        </extension>
        <extension alias="OS-EXT-IPS-MAC" updated="2013-03-07T00:00:00+00:00" namespace="http://docs.openstack.org/compute/ext/extended_ips_mac/api/v1.1" name="ExtendedIpsMac">
        <description>Adds mac address parameter to the ip list.</description>
        </extension>
        <extension alias="OS-EXT-STS" updated="2011-11-03T00:00:00+00:00" namespace="http://docs.openstack.org/compute/ext/extended_status/api/v1.1" name="ExtendedStatus">
        <description>Extended Status support.</description>
        </extension>
        <extension alias="OS-FLV-EXT-DATA" updated="2011-09-14T00:00:00+00:00" namespace="http://docs.openstack.org/compute/ext/flavor_extra_data/api/v1.1" name="FlavorExtraData">
        <description>Provide additional data for flavors.</description>
        </extension>
        <extension alias="OS-SCH-HNT" updated="2011-07-19T00:00:00+00:00" namespace="http://docs.openstack.org/compute/ext/scheduler-hints/api/v2" name="SchedulerHints">
        <description>Pass arbitrary key/value pairs to the scheduler.</description>
        </extension>
        <extension alias="os-availability-zone" updated="2012-12-21T00:00:00+00:00" namespace="http://docs.openstack.org/compute/ext/availabilityzone/api/v1.1" name="AvailabilityZone">
        <description>1. Add availability_zone to the Create Server v1.1 API. 2. Add availability zones describing.</description>
        </extension>
        <extension alias="os-config-drive" updated="2012-07-16T00:00:00+00:00" namespace="http://docs.openstack.org/compute/ext/config_drive/api/v1.1" name="ConfigDrive">
        <description>Config Drive Extension.</description>
        </extension>
        <extension alias="os-console-output" updated="2011-12-08T00:00:00+00:00" namespace="http://docs.openstack.org/compute/ext/os-console-output/api/v2" name="ConsoleOutput">
        <description>Console log output support, with tailing ability.</description>
        </extension>
        <extension alias="os-consoles" updated="2011-12-23T00:00:00+00:00" namespace="http://docs.openstack.org/compute/ext/os-consoles/api/v2" name="Consoles">
        <description>Interactive Console support.</description>
        </extension>
        <extension alias="os-create-server-ext" updated="2011-07-19T00:00:00+00:00" namespace="http://docs.openstack.org/compute/ext/createserverext/api/v1.1" name="Createserverext">
        <description>Extended support to the Create Server v1.1 API.</description>
        </extension>
        <extension alias="os-extended-floating-ips" updated="2013-04-19T00:00:00+00:00" namespace="http://docs.openstack.org/compute/ext/extended_floating_ips/api/v2" name="ExtendedFloatingIps">
        <description>Adds optional fixed_address to the add floating IP command.</description>
        </extension>
        <extension alias="os-flavor-rxtx" updated="2012-08-29T00:00:00+00:00" namespace="http://docs.openstack.org/compute/ext/flavor_rxtx/api/v1.1" name="FlavorRxtx">
        <description>Support to show the rxtx status of a flavor.</description>
        </extension>
        <extension alias="os-flavor-swap" updated="2012-08-29T00:00:00+00:00" namespace="http://docs.openstack.org/compute/ext/flavor_swap/api/v1.1" name="FlavorSwap">
        <description>Support to show the swap status of a flavor.</description>
        </extension>
        <extension alias="os-floating-ips" updated="2011-06-16T00:00:00+00:00" namespace="http://docs.openstack.org/compute/ext/floating_ips/api/v1.1" name="FloatingIps">
        <description>Floating IPs support.</description>
        </extension>
        <extension alias="os-hide-server-addresses" updated="2012-12-11T00:00:00+00:00" namespace="http://docs.openstack.org/compute/ext/hide_server_addresses/api/v1.1" name="HideServerAddresses">
        <description>Support hiding server addresses in certain states.</description>
        </extension>
        <extension alias="os-instance-actions" updated="2013-02-08T00:00:00+00:00" namespace="http://docs.openstack.org/compute/ext/instance-actions/api/v1.1" name="InstanceActions">
        <description>View a log of actions and events taken on an instance.</description>
        </extension>
        <extension alias="os-keypairs" updated="2011-08-08T00:00:00+00:00" namespace="http://docs.openstack.org/compute/ext/keypairs/api/v1.1" name="Keypairs">
        <description>Keypair Support.</description>
        </extension>
        <extension alias="os-multiple-create" updated="2012-08-07T00:00:00+00:00" namespace="http://docs.openstack.org/compute/ext/multiplecreate/api/v1.1" name="MultipleCreate">
        <description>Allow multiple create in the Create Server v1.1 API.</description>
        </extension>
        <extension alias="os-rescue" updated="2011-08-18T00:00:00+00:00" namespace="http://docs.openstack.org/compute/ext/rescue/api/v1.1" name="Rescue">
        <description>Instance rescue mode.</description>
        </extension>
        <extension alias="os-security-groups" updated="2013-05-28T00:00:00+00:00" namespace="http://docs.openstack.org/compute/ext/securitygroups/api/v1.1" name="SecurityGroups">
        <description>Security group support.</description>
        </extension>
        <extension alias="os-server-start-stop" updated="2012-01-23T00:00:00+00:00" namespace="http://docs.openstack.org/compute/ext/servers/api/v1.1" name="ServerStartStop">
        <description>Start/Stop instance compute API support.</description>
        </extension>
        <extension alias="os-used-limits" updated="2012-07-13T00:00:00+00:00" namespace="http://docs.openstack.org/compute/ext/used_limits/api/v1.1" name="UsedLimits">
        <description>Provide data on limited resources that are being used.</description>
        </extension>
        <extension alias="os-user-data" updated="2012-08-07T00:00:00+00:00" namespace="http://docs.openstack.org/compute/ext/userdata/api/v1.1" name="UserData">
        <description>Add user_data to the Create Server v1.1 API.</description>
        </extension>
        <extension alias="os-volumes" updated="2011-03-25T00:00:00+00:00" namespace="http://docs.openstack.org/compute/ext/volumes/api/v1.1" name="Volumes">
        <description>Volumes support.</description>
        </extension>
    </extensions>

**Status Code**
200 - OK

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/extensions

##### 4.4.1.3 Get Extension ##### {#getExtension}
##### GET /v2/{project_id}/extensions/{alias} #####

List details about specified extension.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
<li><p><em>alias</em> - An alias is a name for a pointer to a resource, such as a named extension.</p></li>
</ul>

**URL Parameters**
N/A

**Data Parameters**
This call does not require a request body

**Success Response**

*Example used the os-console-output extension alias*

JSON

    {
        extension: {
            updated: "2011-12-08T00:00:00+00:00"
            name: "ConsoleOutput"
            links: [0]
            namespace: "http://docs.openstack.org/compute/ext/os-console-output/api/v2"
            alias: "os-console-output"
            description: "Console log output support, with tailing ability."
            }
    }

XML

    <?xml version='1.0' encoding='UTF-8' ?>
    <extension alias="os-console-output" updated="2011-12-08T00:00:00+00:00" namespace="http://docs.openstack.org/compute/ext/os-console-output/api/v2" name="ConsoleOutput">
        <description>Console log output support, with tailing ability.</description>
    </extension>

**Status Code**
200 - OK

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/extensions/{alias}

##### 4.4.1.4 List Limits ##### {#listLimits}
##### GET /v2/{project_id}/limits #####

Returns current limits for the project.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
</ul>

**URL Parameters**
Users can control which attributes should be returned by using the fields query parameter. For example: 

    GET /v2/{project_id}/limits?name={name}

**Data Parameters**
This call does not require a request body

**Success Response**

JSON

    Content-Length: 432 
    Content-Type: application/json 
    Date: Tue, 15 Apr 2014 20:12:28 GMT 
    X-Compute-Request-Id: req-e33c7cc4-4758-4cda-90a7-81f56b95c07e

    {
        limits: {
            rate: [0]
            absolute: {
                maxServerMeta: 50
                maxPersonality: 5
                maxImageMeta: 50
                maxPersonalitySize: 10240
                maxSecurityGroupRules: 20
                maxTotalKeypairs: 100
                totalRAMUsed: 2048
                totalInstancesUsed: 2
                maxSecurityGroups: 10
                totalFloatingIpsUsed: 0
                maxTotalCores: -1
                totalSecurityGroupsUsed: 0
                maxTotalFloatingIps: 10
                maxTotalInstances: 40
                totalCoresUsed: 2
                maxTotalRAMSize: 15360
                }
            }
    }

XML

    Content-Length: 956 
    Content-Type: application/xml; charset=UTF-8 
    Date: Tue, 15 Apr 2014 20:20:29 GMT 
    X-Compute-Request-Id: req-4193f9e2-b755-4938-85b7-313d8e5a62cd

    <?xml version='1.0' encoding='UTF-8' ?>
    <limits>
    <rates />
        <absolute>
            <limit name="maxServerMeta" value="50" />
            <limit name="maxPersonality" value="5" />
            <limit name="maxImageMeta" value="50" />
            <limit name="maxPersonalitySize" value="10240" />
            <limit name="maxSecurityGroupRules" value="20" />
            <limit name="maxTotalKeypairs" value="100" />
            <limit name="totalRAMUsed" value="2048" />
            <limit name="totalInstancesUsed" value="2" />
            <limit name="maxSecurityGroups" value="10" />
            <limit name="totalFloatingIpsUsed" value="0" />
            <limit name="maxTotalCores" value="-1" />
            <limit name="totalSecurityGroupsUsed" value="0" />
            <limit name="maxTotalFloatingIps" value="10" />
            <limit name="maxTotalInstances" value="40" />
            <limit name="totalCoresUsed" value="2" />
            <limit name="maxTotalRAMSize" value="15360" />
        </absolute>
    </limits>

**Status Code**
200 - OK

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Response**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/limits

##### 4.4.1.5 List Servers ##### {#listServers}
##### GET /v2/{project_id}/servers #####

Lists IDs, names, and links associated with the account. The list of servers returned can be filtered using query parameters described below.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
</ul>

**URL Parameters**
Users can control which attributes should be returned by using the fields query parameter. For example: 

    GET /v2/{project_id}/servers?name={name}

**Data Parameters**
This call does not require a request body

**Success Response**
200 - OK

**Response Data**

JSON

    {
        servers: [2]
            0:  {
            id: "abcc7211-0899-4e1d-b57b-d7e9d529bfe4"
            links: [2]
                0:  {
                href: "http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/servers/abcc7211-0899-4e1d-b57b-d7e9d529bfe4"
                rel: "self"
                }
                1:  {
                href: "http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/servers/abcc7211-0899-4e1d-b57b-d7e9d529bfe4"
                rel: "bookmark"
                }
            name: "Instance_Test"
            }
    }

XML

    <?xml version='1.0' encoding='UTF-8' ?>
    <servers>
        <server name="Instance_Test" id="abcc7211-0899-4e1d-b57b-d7e9d529bfe4">
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/servers/abcc7211-0899-4e1d-b57b-d7e9d529bfe4" rel="self" />
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/servers/abcc7211-0899-4e1d-b57b-d7e9d529bfe4" rel="bookmark" />
        </server>
    </servers>

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/servers

##### 4.4.1.6 Create Server ##### {#createServer}
##### POST /v2/{project_id}/servers #####

Creates a new server with the specified parameters. Creation of multiple servers in one operation is covered by the *Multiple Create* extension (see <a href="#multipleCreate">Multiple Create</a>). The number of servers that can be created is limited by the project's quota (See <a href="#Limits">Limits</a>). Returns an error if at least <code>min_count</code> servers can't be created. Otherwise, creates a number of servers equal to the minimum of the number of servers allowed by the user's quota and <code>max_count</code>. If multiple servers are created, they are all created with the same value for the remaining parameters. In particular, this means that all the server will have the same display name. (See <a href="#serverNames">Server Names</a>.)

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
</ul>

**URL Parameters**
N/A

**Data Parameters**

<ul>
<li><p><em>flavorRef</em> (required) - The ID of the flavor to be used when creating the server</p>
</li>
<li><p><em>imageRef</em> (required) - The ID of the image from which to boot the server </p>
</li>
<li><p><em>name</em> (required) - The name of the server.</p>
</li>
<li><p><em>key_name</em> (required) - Assigns the public key of the named keypair to the server. </p>
</li>
<li><p><em>networks</em> (required) - A list of networks to attach the server to. If there is only one network (the default network) the networks parameter may be omitted and the server will be attached to that network. If there are multiple networks available the networks parameter is required. Each network element contains either a <em>uuid</em> parameter giving the uuid of the network (and optionally a <em>fixed_ip</em> giving an address in the network), or a <em>port</em> parameter giving the uuid of a port. If the network uuid is specified the create operation will create a new port on the network. If the port uuid is specified the port must have been previously created using the Network API.</p>
</li>

<li><p><em>password</em> - None - Not supported. </p>
</li>
<li><p><em>accessIPv4</em> - None - Not supported</p>
</li>
<li><p><em>accessIPv6</em> - None - Not supported</p>
</li>
<li><p><em>config_drive</em> - If true, creates an ephemeral drive on the server which is formatted with a fat-32 filesystem. Metadata, networks and keys are written to files in the filesystem. (See <a href="#ConfigurationDrive"> Configuration Drive</a>.) Defaults to false. </p>
</li>
<li><p><em>metadata</em> - Metadata key and value pairs. The maximum size of the metadata key and value is 255 bytes each.</p>
</li>
<li><p><em>personality</em> - File path and contents to inject into the server at launch. The maximum size of the file path data is 255 bytes. The maxPersonality limit restricts the number of files that can be injected. The maxPersonalitySize limit restricts the maximum number of bytes for the decoded file contents. (See <a href="#FileInjection"> File Injection </a> .) </p>
</li>
<li><p><em>security_groups</em> - A list of names of security groups that are to be associated with the server. If no names are specified, the server is associated with the "default" security group. </p>
</li>
<li><p><em>availability_zone</em> - <em>Enabled by Availability Zone extension.</em> The name of the availability zone to use.  (see <a href="#createWithaz">Create With Availability Zone</a>)</p></li>
<li><p><em>OS-SCH-HINTS:scheduler_hints</em> - <em>Enabled by Scheduler Hints extensions.</em> A block of attributes and values that represent the information to be used by the scheduler. (See <a href="#CreateServerWithHints">Create Server With Hints</a>)</p>
</li>
<li><p><em>min_count</em> - <em>Enabled by Multiple Create extension.</em> The minimum number of servers to create. Defaults to 1 if not specified. An error is returned if at least <code>min_count</code> servers can not be created. (See <a href="#multipleCreate">Multiple Create</a>)</p>
</li>
<li><p><em>max_count</em> - <em>Enabled by Multiple Create extension.</em> The maximum number of servers to create. Defaults to <code>min_count</code> if not specified. The number of servers created will be the minimum of the number of servers allowed by the user's quota and <code>max_count</code>. (See <a href="#multipleCreate">Multiple Create</a>)</p>
</li>
<li><p><em>user_data</em> - <em>Enabled by User Data extension.</em> User defined data passed as a Base64 encoded string. (See <a href="#createServerUserData">Create Server With User Data</a>.)</p></li>
</ul>

JSON

    {
    "server":{
        "name":"{name}",
        "imageRef":"{image_id}",
        "flavorRef":"{flavor_id}",
        "key_name": "{keypair_name}",
        "config_drive": false,
        "availability_zone": "{az}",
        "max_count":1,
        "min_count":1,
        "metadata":{
            "{key}":"{value}"
            },
        "security_groups": [
            {
            "name": "{security_group_name}"
            }
            ],
        "networks":[
            {
            "uuid":"{network_uuid}"
            }
            ]
        }
    }

XML

    <server config_drive="false" flavorRef="{flavor_id}" imageRef="{image_id}" key_name="{keypair_name}" max_count="1" min_count="1" name="{name}" availability_zone="{az}">
    <security_groups>
        <security_group name="{security_group_name}"/>
    </security_groups>
    <networks>
        <network uuid="{network_uuid}"/>
    </networks>
    <metadata>
        <meta key="key-1" value="value-1"/>
        <meta key="key-2" value="value-2"/>
    </metadata>
    </server>

**Success Response**
202 - Accepted

**Response Data**

JSON

    Content-Length: 413 
    Content-Type: application/json 
    Date: Wed, 16 Apr 2014 15:18:22 GMT 
    Location: http://region-b.geo-1.compute-internal.hpcloudsvc.com/v2/10979209027984/servers/516a97d6-d8b7-4830-9a87-ff4b396b07ea 
    X-Compute-Request-Id: req-424f3b05-20db-40c2-ab67-46d976e92769
    
    {   
    server: {
        security_groups: [1]
            0:  {
            name: "default"
            }
            id: "516a97d6-d8b7-4830-9a87-ff4b396b07ea"
        links: [2]
            0:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/servers/516a97d6-d8b7-4830-9a87-ff4b396b07ea"
            rel: "self"
            }
            1:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/servers/516a97d6-d8b7-4830-9a87-ff4b396b07ea"
            rel: "bookmark"
            }
        adminPass: "nX9B2qtU6HUw"
        }
    }

XML

    Content-Length: 570 
    Content-Type: application/xml; charset=UTF-8 
    Date: Wed, 16 Apr 2014 15:45:21 GMT 
    Location: http://region-b.geo-1.compute-internal.hpcloudsvc.com/v2/10979209027984/servers/bc652b77-1343-4804-a905-ecd11055ccd7 
    X-Compute-Request-Id: req-798586e8-324b-40bf-8e67-2b620f75e69e
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <server id="bc652b77-1343-4804-a905-ecd11055ccd7" adminPass="bvTHj8wLuom5">
        <metadata />
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/servers/bc652b77-1343-4804-a905-ecd11055ccd7" rel="self" />
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/servers/bc652b77-1343-4804-a905-ecd11055ccd7" rel="bookmark" />
        <security_groups>
            <security_group name="default" />
        </security_groups>  
    </server>

**Error Response**
If an error occurs, the response body contains a description of the error.

JSON

    {
    badRequest: {
        message: "Malformed request body"
        code: 400
        }
    }

XML

    <badRequest code="400">
        <message>Unable to find security_group with name 'test'</message>
    </badRequest>

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 400 | Bad Request | The request body is malformed. |

**Curl Example**

    curl -i -k -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"server":{"name":"{name}","imageRef":"{image_id}","flavorRef":"{flavor_id}","key_name": "{keypair_name}","config_drive": false,"max_count":1,"min_count":1,"security_groups": [{"name": "{security_group_name}"}],"networks":[{"uuid":"{network_uuid}"}]}}' {BaseURI}/v2/{project_id}/servers

##### 4.4.1.7 List Servers Detail ##### {#listDetailServers}
##### GET /v2/{project_id}/servers/detail #####

Lists details for servers associated with the account. The list of servers returned can be filtered using the query parameters described below.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
</ul>

**URL Parameters**
Users can control which attributes should be returned by using the fields query parameter. For example: 

    GET /v2/{project_id}/servers/{id}?name={name}

**Data Parameters**
This call does not require a request body

**Success Response**
200 - OK

**Response Data**

JSON

    Content-Length: 9558 
    Content-Type: application/json 
    Date: Wed, 16 Apr 2014 21:46:14 GMT 
    X-Compute-Request-Id: req-9c2a0144-40fc-4d11-b588-68a32c5283fb
    
    {
    servers: [1]
        0:  {
        status: "ACTIVE"
        updated: "2014-04-16T20:51:57Z"
        hostId: "fa36a6fea33ba9c168289eb982012c3627ab5662401f2e9de02236ed"
        addresses: {
        CloudHorizonNetwork: [1]
            0:  {
            OS-EXT-IPS-MAC:mac_addr: "fa:16:3e:54:20:14"
            version: 4
            addr: "10.0.0.20"
            OS-EXT-IPS:type: "fixed"
            }
        }
        links: [2]
            0:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/servers/df4a89b0-30c7-4374-94e0-c6c523ffa1e3"
            rel: "self"
            }
            1:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/servers/df4a89b0-30c7-4374-94e0-c6c523ffa1e3"
            rel: "bookmark"
            }
        key_name: "Keypair"
        image: {
        id: "8c096c29-a666-4b82-99c4-c77dc70cfb40"
        links: [1]
            0:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/images/8c096c29-a666-4b82-99c4-c77dc70cfb40"
            rel: "bookmark"
            }
        }
        OS-EXT-STS:task_state: null
        OS-EXT-STS:vm_state: "active"
        flavor: {
        id: "100"
        links: [1]
            0:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/flavors/100"
            rel: "bookmark"
            }
        }
        id: "df4a89b0-30c7-4374-94e0-c6c523ffa1e3"
        security_groups: [1]
            0:  {
            name: "default"
            }
        OS-EXT-AZ:availability_zone: "az2"
        user_id: "52552375567809"
        name: "InstanceExample"
        created: "2014-04-16T15:28:21Z"
        tenant_id: "10979209027984"
        accessIPv4: ""
        accessIPv6: ""
        progress: 0
        OS-EXT-STS:power_state: 1
        config_drive: ""
        metadata: {
            key-1: "value-1"
            }
        }
        }
    }

XML

    Content-Length: 7110 
    Content-Type: application/xml; charset=UTF-8 
    Date: Wed, 16 Apr 2014 21:52:59 GMT 
    X-Compute-Request-Id: req-0ea73105-0ec2-4649-afff-2361e5c5301d
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <servers>
        <server status="ACTIVE" updated="2014-04-16T20:51:57Z" hostId="fa36a6fea33ba9c168289eb982012c3627ab5662401f2e9de02236ed" name="InstanceExample" created="2014-04-16T15:28:21Z" userId="52552375567809" tenantId="10979209027984" accessIPv4="" accessIPv6="" progress="0" id="df4a89b0-30c7-4374-94e0-c6c523ffa1e3" key_name="Keypair" config_drive="" OS-EXT-STS:vm_state="active" OS-EXT-STS:task_state="None" OS-EXT-STS:power_state="1" OS-EXT-AZ:availability_zone="az2">
        <image id="8c096c29-a666-4b82-99c4-c77dc70cfb40">
            <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/images/8c096c29-a666-4b82-99c4-c77dc70cfb40" rel="bookmark" />
        </image>
        <flavor id="100">
            <atom:link href="http://region-b.geo-1.compute.hpcloudsvc. com/10979209027984/flavors/100" rel="bookmark" />
        </flavor>
        <metadata>
            <meta key="key-1">value-1</meta>
        </metadata>
        <addresses>
            <network id="CloudHorizonNetwork">
                <ip OS-EXT-IPS:type="fixed" version="4" addr="10.0.0.20" OS-EXT-IPS-MAC:mac_addr="fa:16:3e:54:20:14" />
            </network>
        </addresses>
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/servers/df4a89b0-30c7-4374-94e0-c6c523ffa1e3" rel="self" />
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/servers/df4a89b0-30c7-4374-94e0-c6c523ffa1e3" rel="bookmark" />
        <security_groups>
            <security_group name="default" />
        </security_groups>
    </server>
    </servers>

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/servers/detail

##### 4.4.1.8 Get Server Details ##### {#getServer}
##### GET /v2/{project_id}/servers/{server_id} #####

Lists details for the specified server.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
<li><p><em>id</em> - Server ID. This parameter can be an integer ID or a UUID. In either case, the specified server must be in the addressed Region.</p></li>
</ul>

**URL Parameters**
Users can control which attributes should be returned by using the fields query parameter. For example: 

    GET /v2/{project_id}/servers/{id}?name={name}

**Data Parameters**
This call does not require a request body

**Success Response**
200 - OK

**Response Data**

JSON

    Content-Length: 1364 
    Content-Type: application/json 
    Date: Wed, 16 Apr 2014 16:05:06 GMT 
    X-Compute-Request-Id: req-b3088b1c-1fc3-4514-986b-e3044522346e
    
    {
    server: {
        status: "ACTIVE"
        updated: "2014-04-15T18:39:02Z"
        hostId: "8aaf385a8ce67ee589d48122901621affa53ad6504ee6bbac74b30e5"
        addresses: {
            CloudHorizonNetwork: [1]
                0:  {
                OS-EXT-IPS-MAC:mac_addr: "fa:16:3e:32:1a:2c"
                version: 4
                addr: "10.0.0.7"
                OS-EXT-IPS:type: "fixed"
                }
            }
        links: [2]
            0:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/servers/94166e08-57a1-4910-b529-120650e8887e"
            rel: "self"
            }
            1:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/servers/94166e08-57a1-4910-b529-120650e8887e"
            rel: "bookmark"
            }
            key_name: "USEast"
            image: {
            id: "8c096c29-a666-4b82-99c4-c77dc70cfb40"
        links: [1]
            0:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/images/8c096c29-a666-4b82-99c4-c77dc70cfb40"
            rel: "bookmark"
            }
            }
        OS-EXT-STS:task_state: null
        OS-EXT-STS:vm_state: "active"
        flavor: {
            id: "100"
            links: [1]
                0:  {
                href: "http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/flavors/100"
                rel: "bookmark"
                }
            }
        id: "94166e08-57a1-4910-b529-120650e8887e"
        security_groups: [1]
            0:  {
            name: "default"
            }
        OS-EXT-AZ:availability_zone: "az2"
        user_id: "52552375567809"
        name: "InstanceTest"
        created: "2014-04-15T18:38:47Z"
        tenant_id: "10979209027984"
        accessIPv4: ""
        accessIPv6: ""
        progress: 0
        OS-EXT-STS:power_state: 1
        config_drive: ""
        metadata: {}
        }
    }

XML

    Content-Length: 1786 
    Content-Type: application/xml; charset=UTF-8 
    Date: Wed, 16 Apr 2014 16:10:04 GMT 
    X-Compute-Request-Id: req-4b38db55-e008-44ac-a52d-0140f99c491f
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <server status="ACTIVE" updated="2014-04-15T18:39:02Z" hostId="8aaf385a8ce67ee589d48122901621affa53ad6504ee6bbac74b30e5" name="InstanceTest" created="2014-04-15T18:38:47Z" userId="52552375567809" tenantId="10979209027984" accessIPv4="" accessIPv6="" progress="0" id="94166e08-57a1-4910-b529-120650e8887e" key_name="USEast" config_drive="" OS-EXT-STS:vm_state="active" OS-EXT-STS:task_state="None" OS-EXT-STS:power_state="1" OS-EXT-AZ:availability_zone="az2">
        <image id="8c096c29-a666-4b82-99c4-c77dc70cfb40">
            <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/images/8c096c29-a666-4b82-99c4-c77dc70cfb40" rel="bookmark" />
        </image>
        <flavor id="100">
            <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/flavors/100" rel="bookmark" />
        </flavor>
        <metadata />
        <addresses>
        <network id="CloudHorizonNetwork">
            <ip OS-EXT-IPS:type="fixed" version="4" addr="10.0.0.7" OS-EXT-IPS-MAC:mac_addr="fa:16:3e:32:1a:2c" />
        </network>
        </addresses>
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/servers/94166e08-57a1-4910-b529-120650e8887e" rel="self" />
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/servers/94166e08-57a1-4910-b529-120650e8887e" rel="bookmark" />
        <security_groups>
            <security_group name="default" />
        </security_groups>
    </server>

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/servers/{id}

##### 4.4.1.9 Update Server Name ##### {#updateServer}
##### PUT /v2/{project_id}/servers/{server_id} #####

Updates the display name for the specified server.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
<li><p><em>id</em> - Server ID. This parameter can be an integer ID or a UUID. In either case, the specified server must be in the addressed Region.</p></li>
</ul>

**URL Parameters**
N/A

**Data Parameters**

<ul>
<li><p><em>name</em> (required) - The new display name of the server. </p>
</li>
</ul>

JSON

    {
    "server": {
        "name": "{name}"
        }
    }

XML

    <server>
        &#60;name>{name}</name>
    </server>

**Success Response**
200 - OK

**Response Data**

JSON

    Content-Length: 1079 
    Content-Type: application/json 
    Date: Wed, 16 Apr 2014 17:06:07 GMT 
    X-Compute-Request-Id: req-0abb2bc4-2af3-4811-919d-9aea01ab523e
    
    {
    server: {
        status: "ACTIVE"
        updated: "2014-04-16T17:06:07Z"
        hostId: "8aaf385a8ce67ee589d48122901621affa53ad6504ee6bbac74b30e5"
        addresses: {
        CloudHorizonNetwork: [1]
            0:  {
            version: 4
            addr: "10.0.0.7"
            }
        }
        links: [2]
            0:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/servers/94166e08-57a1-4910-b529-120650e8887e"
            rel: "self"
            }
            1:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/servers/94166e08-57a1-4910-b529-120650e8887e"
            rel: "bookmark"
            }
        image: {
        id: "8c096c29-a666-4b82-99c4-c77dc70cfb40"
        links: [1]
            0:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/images/8c096c29-a666-4b82-99c4-c77dc70cfb40"
            rel: "bookmark"
            }
        }   
        flavor: {
        id: "100"
        links: [1]
            0:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/flavors/100"
            rel: "bookmark"
            }  
        }
        id: "94166e08-57a1-4910-b529-120650e8887e"
        user_id: "52552375567809"
        name: "NameChange_Example"
        created: "2014-04-15T18:38:47Z"
        tenant_id: "10979209027984"
        accessIPv4: ""
        accessIPv6: ""
        progress: 0
        metadata: {}
        }
    }

XML

    Content-Length: 1174 
    Content-Type: application/xml; charset=UTF-8 
    Date: Wed, 16 Apr 2014 17:04:25 GMT 
    X-Compute-Request-Id: req-3391f302-284e-4a20-b387-cc16dd707a1f
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <server status="ACTIVE" updated="2014-04-16T17:04:25Z" hostId="8aaf385a8ce67ee589d48122901621affa53ad6504ee6bbac74b30e5" name="InstanceNameChange_Example" created="2014-04-15T18:38:47Z" userId="52552375567809" tenantId="10979209027984" accessIPv4="" accessIPv6="" progress="0" id="94166e08-57a1-4910-b529-120650e8887e">
        <image id="8c096c29-a666-4b82-99c4-c77dc70cfb40">
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/images/8c096c29-a666-4b82-99c4-c77dc70cfb40" rel="bookmark" />
        </image>
        <flavor id="100">
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/flavors/100" rel="bookmark" />
        </flavor>
        <metadata />
        <addresses>
        <network id="CloudHorizonNetwork">
        <ip version="4" addr="10.0.0.7" />
        </network>
        </addresses>
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/servers/94166e08-57a1-4910-b529-120650e8887e" rel="self" />
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/servers/94166e08-57a1-4910-b529-120650e8887e" rel="bookmark" />
    </server>

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Example**

    curl -i -k -X PUT -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"server":{"name":"{name}"}}' {BaseURI}/v2/{project_id}/servers/{id}

##### 4.4.1.10 Delete Server ##### {#deleteServer}
##### DELETE /v2/{project_id}/servers/{server_id} #####

Terminates the specified server. All network ports associated with this server will also be deleted.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
<li><p><em>id</em> - Server ID. This parameter can be an integer ID or a UUID. In either case, the specified server must be in the addressed Region.</p></li>
</ul>

**URL Parameters**
N/A

**Data Parameters**
This call does not require a request body

**Success Response**
N/A

**Status Code**
204 - No Content

**Response Data**
N/A

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Example**

    curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/servers/{id}

##### 4.4.1.11 List Metadata ##### {#ServerMetadata_listMetadata}
##### GET /v2/{project_id}/servers/{server_id}/metadata #####

Lists metadata associated with the resource.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
<li><p><em>id</em> - Server ID. This parameter can be an integer ID or a UUID. In either case, the specified server must be in the addressed Region.</p></li>
</ul>

**URL Parameters**
Users can control which attributes should be returned by using the fields query parameter. For example: 

    GET /v2/{project_id}/servers/{id}?name={name}

**Data Parameters**
This call does not require a request body

**Success Response**
200- OK

**Response Data**
This operations returns a response body

JSON

    Content-Length: 40 
    Content-Type: application/json 
    Date: Wed, 16 Apr 2014 19:02:38 GMT 
    X-Compute-Request-Id: req-59117be5-a9f5-4be2-b8eb-babca7e2a455
    
    {
        "metadata": {
            "key-1": "value-1",
            "key-2": "value-2"
        }
    }

XML

    Content-Length: 161 
    Content-Type: application/xml; charset=UTF-8 
    Date: Wed, 16 Apr 2014 19:00:54 GMT 
    X-Compute-Request-Id: req-dd028e84-02a3-4e87-9b97-06dab9086a91
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <metadata>
        <meta key="key-2" />
        <meta key="key-1" />
    </metadata>

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Example**

    curl -i -k -X GET -H "Content-type: application/json" -H "X-Auth-Token: {Auth_Token}" '{BaseURI}/v2/{project_id}/servers/{server_id}/metadata'

##### 4.4.1.12 Update Metadata ##### {#ServerMetadata_updateMetadata}
##### POST /v2/{project_id}/servers/{server_id}/metadata #####

Updates resource metadata. Updates will replace existing metadata items with the same key. Items not explicitly mentioned in the request will not be modified. An overLimit (<errorcode>413</errorcode>) fault may be thrown if the operation causes the maximum number of metadata items to be exceeded.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
<li><p><em>id</em> - Server ID. This parameter can be an integer ID or a UUID. In either case, the specified server must be in the addressed Region.</p></li>
</ul>

**URL Parameters**
N/A

**Data Parameters**

<ul>
<li><p><em>metadata</em> - A set of key/value pairs. These pair replace any existing key/value pairs in the resources metadata with matching keys. Any key/value pairs in the parameter with keys that do not occur in the existing resource metadata are added to the resources metadata. </p>
</li>
</ul>

JSON

    {
        "metadata": {
            "{key_1}": "{value_1}"
        }
    }

XML

    <metadata>
        <meta key="{key_1}">{value_1}</meta>
        <meta key="{key_2}">{value_2}</meta>
    </metadata>

**Success Response**
200 - OK

**Response Data**

JSON

    Content-Length: 30 
    Content-Type: application/json 
    Date: Wed, 16 Apr 2014 19:18:42 GMT 
    X-Compute-Request-Id: req-ae1433c2-5a38-4239-8cff-704dfbfa0c31
    
    {
        "metadata": {
            "key-1": "value-1"
        }
    }

XML

    Content-Length: 203 
    Content-Type: application/xml; charset=UTF-8 
    Date: Wed, 16 Apr 2014 19:20:39 GMT 
    X-Compute-Request-Id: req-cb01d00c-f4e7-49e8-a5f5-abe66843c999
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <metadata>
        <meta key="key-2">value-2</meta>
        <meta key="key-1">value-1</meta>
        <meta key="key">value</meta>
    </metadata>

**Curl Example**

    curl -i -k -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"metadata":{"{key}":"{value}"}}' {BaseURI}/v2/{project_id}/servers/{id}/metadata

##### 4.4.1.13 Create or Replace Metadata ##### {#ServerMetadata_setMetadata}
##### PUT /v2/{project_id}/servers/{server_id}/metadata #####

The metadata items set on the resource are those specified on the requests. Existing metadata items are replaced with the ones provided in the request. Metadata items, set previously, but not specified in the request are removed.

An overLimit (<errorcode>413</errorcode>) fault may be thrown if the maximum number of metadata items is exceeded.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization </a> .) </p>
</li>
<li><p><em>server_id</em> - Server ID. This parameter can be an integer ID or a UUID. In either case, the specified server must be in the addressed Availability Zone. </p>
</li>
</ul>

**URL Parameters**
N/A

**Data Parameters**

<ul>
<li><p><em>metadata</em> - csapi:Metadata - A set of key/value pairs. These pair replace any existing key/value pairs in the resources metadata with matching keys. Any key/value pairs in the parameter with keys that do not occur in the existing resource metadata are added to the resources metadata. </p></li>
</ul>

JSON

    {
        "metadata": {
            "key-1": "value-1",
            "key-2": "value-2"
        }
    }

XML

    <?xml version="1.0" ?>
    <metadata xmlns="http://docs.openstack.org/compute/api/v2">
        <meta key="key-1">value-1</meta>
        <meta key="key-2">value-2</meta>
    </metadata>

**Success Response**
200 - OK

**Response Data**

JSON

    Content-Length: 70 
    Content-Type: application/json 
    Date: Wed, 16 Apr 2014 19:55:30 GMT 
    X-Compute-Request-Id: req-056136be-7cbc-4663-9d06-22fc7d6fa4c9
    
    {
        "metadata": {
            "key-1": "value-1",
            "key-2": "value-2"
        }
    }

XML

    Content-Length: 203 
    Content-Type: application/xml; charset=UTF-8 
    Date: Wed, 16 Apr 2014 19:20:39 GMT 
    X-Compute-Request-Id: req-cb01d00c-f4e7-49e8-a5f5-abe66843c999
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <metadata>
        <meta key="key-2">value-2</meta>
        <meta key="key-1">value-1</meta>
        <meta key="key">value</meta>
    </metadata>

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Example**

    curl -i -k -X PUT -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"metadata":{"{key}":"{value}"}}' {BaseURI}/v2/{project_id}/servers/{id}/metadata

##### 4.4.1.14 Get Metadata Item ##### {#ServerMetadataItem_getMetadataItem}
##### GET /v2/{project_id}/servers/{server_id}/metadata/{key} #####

Retrieves a single metadata item by key.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
<li><p><em>id</em> - Server ID. This parameter can be an integer ID or a UUID. In either case, the specified server must be in the addressed Region.</p></li>
<li><p><em>key</em> - A string no longer than 255 characters.</p></li>
</ul>

**URL Parameters**
N/A

**Data Parameters**
This call does not require a request body

**Success Response**
200 - OK

**Response Data**

JSON

    Content-Length: 30 
    Content-Type: application/json 
    Date: Wed, 16 Apr 2014 19:59:42 GMT 
    X-Compute-Request-Id: req-e8a8972a-449c-4242-a360-723f01cf872c
    
    {
        "meta": {
            "key-1": "value-1"
        }
    }

XML

    Content-Length: 122 
    Content-Type: application/xml; charset=UTF-8 
    Date: Wed, 16 Apr 2014 20:00:33 GMT 
    X-Compute-Request-Id: req-d720bf47-79ba-4f70-afe1-f247e62bdcd2
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <meta key="key-2">value-2</meta>

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/servers/{id}/metadata/{key}

##### 4.4.1.15 Create or Update Metadata Item ##### {#ServerMetadataItem_setMetadataItem}
##### PUT /v2/{project_id}/servers/{server_id}/metadata/{key}  #####

Sets a metadata item by its key. 

An overLimit (<errorcode>413</errorcode>) fault may be thrown if the operation causes the maximum number of metadata items to be exceeded.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
<li><p><em>id</em> - Server ID. This parameter can be an integer ID or a UUID. In either case, the specified server must be in the addressed Region.</p></li>
<li><p><em>key</em> - A string no longer than 255 characters.</p></li>
</ul>

**URL Parameters**
N/A

**Data Parameters**

<ul>
<li><p><em>metadata</em> - csapi:Metadata - A set of key/value pairs. These pair replace any existing key/value pairs in the resources metadata with matching keys. Any key/value pairs in the parameter with keys that do not occur in the existing resource metadata are added to the resources metadata. </p>
</li>
</ul>

JSON

    {
        "metadata": {
            "key-1": "value-1",
            "key-2": "value-2"
        }
    }

XML

    <?xml version="1.0" ?>
    <metadata xmlns="http://docs.openstack.org/compute/api/v2">
        <meta key="key-1">value-1</meta>
        <meta key="key-2">value-2</meta>
    </metadata>

**Success Response**
200 - OK

**Response Data**

JSON

    Content-Length: 70 
    Content-Type: application/json 
    Date: Wed, 16 Apr 2014 19:55:30 GMT 
    X-Compute-Request-Id: req-056136be-7cbc-4663-9d06-22fc7d6fa4c9
    
    {
        "metadata": {
            "key-1": "value-1",
            "key-2": "value-2"
        }
    }

XML

    Content-Length: 203 
    Content-Type: application/xml; charset=UTF-8 
    Date: Wed, 16 Apr 2014 19:20:39 GMT 
    X-Compute-Request-Id: req-cb01d00c-f4e7-49e8-a5f5-abe66843c999
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <metadata>
        <meta key="key-2">value-2</meta>
        <meta key="key-1">value-1</meta>
        <meta key="key">value</meta>
    </metadata>

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Example**

    curl -i -k -X PUT -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"metadata":{"{key}":"{value}"}}' {BaseURI}/v2/{project_id}/servers/{id}/metadata/{key}

##### 4.4.1.16 Delete Metadata Item ##### {#ServerMetadataItem_deleteMetadataItem}
##### DELETE /v2/{project_id}/servers/{server_id}/metadata/{key} #####

Deletes a metadata item.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
<li><p><em>id</em> - Server ID. This parameter can be an integer ID or a UUID. In either case, the specified server must be in the addressed Region.</p></li>
<li><p><em>key</em> - A string no longer than 255 characters.</p></li>
</ul>

**URL Parameters**
N/A

**Data Parameters**
This call does not require a request body

**Success Response**
204 - No Content

**Response Data**
N/A

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Example**

    curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/servers/{id}/metadata/{key}

##### 4.4.1.17 Reboot Server ##### {#rebootServer}
##### POST /v2/{project_id}/servers/{server_id}/action #####

Reboots the specified server. Specify the <code>reboot</code> action in the request body.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
<li><p><em>id</em> - Server ID. This parameter can be an integer ID or a UUID. In either case, the specified server must be in the addressed Region.</p></li>
</ul>

**URL Parameters**
N/A

**Data Parameters**

<ul>
<li><p><em>type</em> (required) - Specifies <em>SOFT</em> or <em>HARD</em> reboot. A <em>SOFT</em> reboot signals the operating system to restart, which allows for graceful shutdown of all processes. A <em>HARD</em> reboot is equivalent to power cycling the server. This parameter is ignored in Compute where a <em>HARD</em> reboot is always performed. </p>
<p>Legal values are:<ul>
<li><em>SOFT</em> - Signal the operating system to restart.
</li>
<li><em>HARD</em> - Restart the server. Equivalent to power cycling the server.
</li>
</ul></p>
</li>
</ul>
</ul>

JSON

    {
        "reboot": {
            "type": "SOFT"
        }
    }

XML

    <reboot type="SOFT"/>

**Success Response**
202 - Accepted

**Response Data**
N/A

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Example**

    curl -i -k -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"reboot":{"type":"SOFT"}}' {BaseURI}/v2/{project_id}/servers/{id}/action

##### 4.4.1.18 Rebuild Server ##### {#rebuildServer}
##### POST /v2/{project_id}/servers/{server_id}/action #####

Rebuilds the specified server by rebooting it from a specified image. Other attributes of the server, such as its network configuration are not changed. Servers running licensed images, such as windows, can only be rebuilt from the same image. To rebuild a server, specify the <code>rebuild</code> action in the request body.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
<li><p><em>id</em> - Server ID. This parameter can be an integer ID or a UUID. In either case, the specified server must be in the addressed Region.</p></li>
</ul>

**URL Parameters**
N/A

**Data Parameters**

<ul>
<li><p><em>imageRef</em> (Required) - A reference to the image which is to be booted.</p></li>
<li><p><em>name</em> - The name for the new server.</p></li>
<li><p><em>metadata</em> - Metadata key and value pairs. The maximum size of the metadata key and value is 255 bytes each. (See <a href="#ServerMetadata"> Server Metadata</a></p></li>
<li><p><em>personality</em> - File path and contents to inject into the rebuilt server. The maximum size of the file path data is 255 bytes. The maxPersonality limit restricts the number of files that can be injected. The maxPersonalitySize limit restricts the maximum number of bytes for the decoded file contents. (See <a href="#FileInjection">File Injection</a>.)</p></li>
</ul>

JSON

    {
        "rebuild": {
            "imageRef": "{image_id}",
            "metadata": {
                "{key}": "{value}"
            },
            "name": "{name}"
        }
    }

XML

    <rebuild imageRef="{image_id}" name="{name}">
        <metadata>
            <meta key="key-1">value-1</meta>
        </metadata>
    </rebuild>

**Success Response**
202 - Accepted

**Response Data**

JSON

    Content-Length: 1133 
    Content-Type: application/json 
    Date: Wed, 16 Apr 2014 20:51:51 GMT 
    Location: http://region-b.geo-1.compute-internal.hpcloudsvc.com/v2/10979209027984/servers/df4a89b0-30c7-4374-94e0-c6c523ffa1e3 
    X-Compute-Request-Id: req-8bce3d2e-d3ed-4093-b16c-e5ef43cb6076
    
    {
    server: {
        status: "REBUILD"
        updated: "2014-04-16T20:51:51Z"
        hostId: "fa36a6fea33ba9c168289eb982012c3627ab5662401f2e9de02236ed"
        addresses: {
        CloudHorizonNetwork: [1]
            0:  {
            version: 4
            addr: "10.0.0.20"
            }
        }
        links: [2]
            0:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/servers/df4a89b0-30c7-4374-94e0-c6c523ffa1e3"
            rel: "self"
            }
            1:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/servers/df4a89b0-30c7-4374-94e0-c6c523ffa1e3"
            rel: "bookmark"
            }
        image: {
        id: "8c096c29-a666-4b82-99c4-c77dc70cfb40"
        links: [1]
        0:  {
        href: "http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/images/8c096c29-a666-4b82-99c4-c77dc70cfb40"
        rel: "bookmark"
            }
        }
        flavor: {
        id: "100"
        links: [1]
            0:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/flavors/100"
            rel: "bookmark"
            }
        }
        id: "df4a89b0-30c7-4374-94e0-c6c523ffa1e3"
        user_id: "52552375567809"
        name: "InstanceExample_rebuilt"
        created: "2014-04-16T15:28:21Z"
        tenant_id: "10979209027984"
        adminPass: "8A7aojUNJqzy"
        accessIPv4: ""
        accessIPv6: ""
        progress: 0
        metadata: {
        key-1: "value-1"
        }
        }
    }

XML

    Content-Length: 1231 
    Content-Type: application/xml; charset=UTF-8 
    Date: Wed, 16 Apr 2014 20:43:58 GMT 
    Location: http://region-b.geo-1.compute-internal.hpcloudsvc.com/v2/10979209027984/servers/df4a89b0-30c7-4374-94e0-c6c523ffa1e3 
    X-Compute-Request-Id: req-a2aab3f8-672b-4ac4-a1ea-48262b6f48d4
    
    <?xml version='1.0' encoding='UTF-8' ?>
    <server status="REBUILD" updated="2014-04-16T20:43:58Z" hostId="fa36a6fea33ba9c168289eb982012c3627ab5662401f2e9de02236ed" name="Instance_Test7" created="2014-04-16T15:28:21Z" userId="52552375567809" tenantId="10979209027984" accessIPv4="" accessIPv6="" progress="0" id="df4a89b0-30c7-4374-94e0-c6c523ffa1e3" adminPass="t26DD4ikri4F">
        <image id="8c096c29-a666-4b82-99c4-c77dc70cfb40">
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/images/8c096c29-a666-4b82-99c4-c77dc70cfb40" rel="bookmark" />
        </image>
        <flavor id="100">
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/flavors/100" rel="bookmark" />
        </flavor>
        <metadata>
            <meta key="key-1">value-1</meta>
        </metadata>
        <addresses>
        <network id="CloudHorizonNetwork">
            <ip version="4" addr="10.0.0.20" />
        </network>
        </addresses>
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/servers/df4a89b0-30c7-4374-94e0-c6c523ffa1e3" rel="self" />
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/servers/df4a89b0-30c7-4374-94e0-c6c523ffa1e3" rel="bookmark" />
    </server>

**Curl Example**

    curl -i -k -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"rebuild":{"imageRef":"{image_id}","metadata":{"{key}":"{value}"},"name":"{name}"}}' {BaseURI}/v2/{project_id}/servers/{id}/action

##### 4.4.1.19 Create Image ##### {#createImage}
##### POST /v2/{project_id}/servers/{server_id}/action #####

Creates a new image. Specify the <code>createImage</code> action in the request body.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
<li><p><em>id</em> - Server ID. This parameter can be an integer ID or a UUID. In either case, the specified server must be in the addressed Region.</p></li>
</ul>

**URL Parameters**
N/A

**Data Parameters**

<ul>
<li><p><em>name</em> - Image Name. This will be the display name you give your image.</p></li>
<li><p><em>metadata</em> - Metadata key and value pairs. The maximum size of the metadata key and value is 255 bytes each. (See <a href="#ImageMetadata"> Image Metadata</a></p></li>
</ul>

**Data Parameters**

JSON

    {
    "createImage": {
        "metadata": {
            "key-1": "value-1",
            "key-2": "value-2"
            },
        "name": "{name}"
        }
    }

XML

    <createImage name="{name}"/>

**Success Response**
202 - Accepted

**Response Data**

JSON

    Content-Length: 0 
    Content-Type: text/html; charset=UTF-8 
    Date: Wed, 16 Apr 2014 22:22:06 GMT 
    Location: http://region-b.geo-1.compute-internal.hpcloudsvc.com/v2/10979209027984/images/11d74685-53ce-4318-91a3-77db7722e981 
    X-Compute-Request-Id: req-fc849f93-70c9-4917-9434-3c182d00dc69

XML

    Content-Length: 0 
    Content-Type: text/html; charset=UTF-8 
    Date: Wed, 16 Apr 2014 22:19:30 GMT 
    Location: http://region-b.geo-1.compute-internal.hpcloudsvc.com/v2/10979209027984/images/b5f25d14-bdd1-4950-84a2-db3be8cb1d1b 
    X-Compute-Request-Id: req-e590c314-8777-4f34-89e1-4896646af876

**Curl Example**

    curl -i -k -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"createImage":{"metadata":{"{key}":"{value}","{key}":"{value}"},"name":"{name}"}}

##### 4.4.1.20 List Server Addresses ##### {#listServerAddresses}
##### GET /v2/{project_id}/servers/{server_id}/ips #####

Lists all server addresses by network.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
<li><p><em>id</em> - Server ID. This parameter can be an integer ID or a UUID. In either case, the specified server must be in the addressed Region.</p></li>
</ul>

**URL Parameters**
N/A

**Data Parameters**
This call does not require a request body

**Success Response**
200 - OK

**Response Data**

JSON

    Content-Length: 77 
    Content-Type: application/json 
    Date: Thu, 17 Apr 2014 14:54:30 GMT 
    X-Compute-Request-Id: req-150be3b6-c2e1-4d67-b9aa-3aec10293eb6

    {
    addresses: {
        CloudHorizonNetwork: [1]
           0:  {
            version: 4
            addr: "10.0.0.20"
            }
        }
    }

XML

    Content-Length: 191 
    Content-Type: application/xml; charset=UTF-8 
    Date: Thu, 17 Apr 2014 14:59:29 GMT 
    X-Compute-Request-Id: req-6a09323e-aafd-4d25-a7cb-49a4f387d68e

    <?xml version='1.0' encoding='UTF-8' ?>
    <addresses>
        <network id="CloudHorizonNetwork">
            <ip version="4" addr="10.0.0.20" />
        </network>
    </addresses>

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/servers/{id}/ips

##### 4.4.1.21 List Addresses by Network ##### {#listServerAddressesbyNetwork}
##### GET /v2/{project_id}/servers/{server_id}/ips/{network_id} #####

Lists server addresses for the specified network. 

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
<li><p><em>id</em> - Server ID. This parameter can be an integer ID or a UUID. In either case, the specified server must be in the addressed Region.</p></li>
<li><p><em>network_id</em> - Network Name.  This will be the name of your network.  UUID will not work for this value.</p>
</ul>

**URL Parameters**
N/A

**Data Parameters**
This call does not require a request body

**Success Response**
200 - OK

**Response Data**

JSON

    Content-Length: 62 
    Content-Type: application/json 
    Date: Thu, 17 Apr 2014 15:07:06 GMT 
    X-Compute-Request-Id: req-45435783-7a02-4ac2-8d11-121cc523fe5b

    {
    CloudHorizonNetwork: [1]
        0:  {
        version: 4
        addr: "10.0.0.20"
        }
    }

XML

    Content-Length: 168 
    Content-Type: application/xml; charset=UTF-8 
    Date: Thu, 17 Apr 2014 15:05:31 GMT 
    X-Compute-Request-Id: req-97c0badc-1ff4-4c4a-82d9-6c7cf8d2e275

    <?xml version='1.0' encoding='UTF-8' ?>
    <network id="CloudHorizonNetwork">
    <ip version="4" addr="10.0.0.20" />
    </network>

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/servers/{id}/ips/{network_name}

##### 4.4.1.22 List Images ##### {#listImages}
##### GET /v2/{project_id}/images #####

Lists IDs, names, and links for images available to the account. Query parameters can be used to filter the list of images.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
</ul>

**URL Parameters**
Users can control which attributes should be returned by using the fields query parameter. For example: 

    GET /v2/{project_id}/servers/{id}?name={name}

Other options for filtering your results are:

<ul>
<li><p><em>changes-since</em> - Filters the list of images returned to those that have changed since the <em>changes-since</em> time. See <a href="#Polling"> Efficient Polling with the <em>Changes-Since</em> Parameter </a> .</p>
</li>
<li><p><em>marker</em> - The UUID of the last item in the previous list. See <a href="#Pagination"> Paginated Collections </a> .</p>
</li>
<li><p><em>limit</em> - Sets the page size to <em>limit</em>. See <a href="#Pagination"> Paginated Collections </a> .</p>
</li>
</ul>

**Data Parameters**
This call does not require a request body

**Success Response**
200 - OK

**Response Data**

JSON

<em>snippet</em>

    Content-Length: 31257 
    Content-Type: application/json 
    Date: Thu, 17 Apr 2014 15:10:30 GMT 
    X-Compute-Request-Id: req-80761087-d067-4959-9737-003d04f5522e

    {
    images: [3]
        0:  {
        id: "8672f4c6-e33d-46f5-b6d8-ebbeba12fa02"
        links: [3]
            0:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/images/8672f4c6-e33d-46f5-b6d8-ebbeba12fa02"
            rel: "self"
            }
            1:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/images/8672f4c6-e33d-46f5-b6d8-ebbeba12fa02"
            rel: "bookmark"
            }
            2:  {
            href: "https://region-b.geo-1.images.hpcloudsvc.com:443/10979209027984/images/8672f4c6-e33d-46f5-b6d8-ebbeba12fa02"
            type: "application/vnd.openstack.image"
            rel: "alternate"
            }
        name: "Ubuntu Server 12.04.4 LTS (amd64 20140408) - Partner Image"
        }
        1:  {
        id: "622f2737-681a-40e9-ab47-37a3375f04f9"
        links: [3]
            0:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/images/622f2737-681a-40e9-ab47-37a3375f04f9"
            rel: "self"
            }
            1:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/images/622f2737-681a-40e9-ab47-37a3375f04f9"
            rel: "bookmark"
            }
            2:  {
            href: "https://region-b.geo-1.images.hpcloudsvc.com:443/10979209027984/images/622f2737-681a-40e9-ab47-37a3375f04f9"
            type: "application/vnd.openstack.image"
            rel: "alternate"
            }
            name: "SUSE Linux Enterprise Server 11 SP2 20130906 (b) (deprecated)"
        }
        2:  {
        id: "6a6790b6-31d6-4fe4-b26f-8950cb98725c"
        links: [3]
            0:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/images/6a6790b6-31d6-4fe4-b26f-8950cb98725c"
            rel: "self"
            }
            1:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/images/6a6790b6-31d6-4fe4-b26f-8950cb98725c"
            rel: "bookmark"
            }
            2:  {
            href: "https://region-b.geo-1.images.hpcloudsvc.com:443/10979209027984/images/6a6790b6-31d6-4fe4-b26f-8950cb98725c"
            type: "application/vnd.openstack.image"
            rel: "alternate"
            }
            name: "Windows Server 2008 R2 Enterprise SP1 x64 Volume License 20130925 (b)"
        }
    }

XML

<em>snippet</em>

    Content-Length: 31177 
    Content-Type: application/xml; charset=UTF-8 
    Date: Thu, 17 Apr 2014 15:20:10 GMT 
    X-Compute-Request-Id: req-e3572da0-46c1-4730-b1b6-0215a4b3c2a4

    <?xml version='1.0' encoding='UTF-8' ?>
    <images>
        <image name="Ubuntu Server 12.04.4 LTS (amd64 20140408) - Partner Image" id="8672f4c6-e33d-46f5-b6d8-ebbeba12fa02">
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/images/8672f4c6-e33d-46f5-b6d8-ebbeba12fa02" rel="self" />
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/images/8672f4c6-e33d-46f5-b6d8-ebbeba12fa02" rel="bookmark" />
        <atom:link href="https://region-b.geo-1.images.hpcloudsvc.com:443/10979209027984/images/8672f4c6-e33d-46f5-b6d8-ebbeba12fa02" type="application/vnd.openstack.image" rel="alternate" />
        </image>
        <image name="SUSE Linux Enterprise Server 11 SP2 20130906 (b) (deprecated)" id="622f2737-681a-40e9-ab47-37a3375f04f9">
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/images/622f2737-681a-40e9-ab47-37a3375f04f9" rel="self" />
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/images/622f2737-681a-40e9-ab47-37a3375f04f9" rel="bookmark" />
        <atom:link href="https://region-b.geo-1.images.hpcloudsvc.com:443/10979209027984/images/622f2737-681a-40e9-ab47-37a3375f04f9" type="application/vnd.openstack.image" rel="alternate" />
        </image>
        <image name="Windows Server 2008 R2 Enterprise SP1 x64 Volume License 20130925 (b)" id="6a6790b6-31d6-4fe4-b26f-8950cb98725c">
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/images/6a6790b6-31d6-4fe4-b26f-8950cb98725c" rel="self" />
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/images/6a6790b6-31d6-4fe4-b26f-8950cb98725c" rel="bookmark" />
        <atom:link href="https://region-b.geo-1.images.hpcloudsvc.com:443/10979209027984/images/6a6790b6-31d6-4fe4-b26f-8950cb98725c" type="application/vnd.openstack.image" rel="alternate" />
        </image>
    </images>

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/images

##### 4.4.1.23 List Images Detail ##### {#listDetailImages}
##### GET /v2/{project_id}/images/detail #####

Lists details for images available to the account. Query parameters can be used to filter the list of images.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
</ul>

**URL Parameters**
Users can control which attributes should be returned by using the fields query parameter. For example: 

    GET /v2/{project_id}/images/detail?name={name}

Other options for filtering your results are:

<ul>
<li><p><em>changes-since</em> - Filters the list of images returned to those that have changed since the <em>changes-since</em> time. See <a href="#Polling"> Efficient Polling with the <em>Changes-Since</em> Parameter </a> .</p>
</li>
<li><p><em>marker</em> - The UUID of the last item in the previous list. See <a href="#Pagination"> Paginated Collections </a> .</p>
</li>
<li><p><em>limit</em> - Sets the page size to <em>limit</em>. See <a href="#Pagination"> Paginated Collections </a> .</p>
</li>
</ul>

**Data Parameters**
This call does not require a request body

**Success Response**
200 - OK

**Response Data**

JSON

<em>snippet</em>

    Content-Length: 62126 
    Content-Type: application/json 
    Date: Thu, 17 Apr 2014 19:02:50 GMT 
    X-Compute-Request-Id: req-3f7fef91-2158-4e66-b3c9-7b35cf35b282

    {
    images: [55]
        6:  {
        status: "ACTIVE"
        updated: "2014-04-14T14:26:41Z"
        links: [3]
            0:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/images/8672f4c6-e33d-46f5-b6d8-ebbeba12fa02"
            rel: "self"
            }
            1:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/images/8672f4c6-e33d-46f5-b6d8-ebbeba12fa02"
            rel: "bookmark"
            }
            2:  {
            href: "https://region-b.geo-1.images.hpcloudsvc.com:443/10979209027984/images/8672f4c6-e33d-46f5-b6d8-ebbeba12fa02"
            type: "application/vnd.openstack.image"
            rel: "alternate"
            }
        id: "8672f4c6-e33d-46f5-b6d8-ebbeba12fa02"
        OS-EXT-IMG-SIZE:size: 260178432
        name: "Ubuntu Server 12.04.4 LTS (amd64 20140408) - Partner Image"
        created: "2014-04-09T14:24:23Z"
        minDisk: 8
        progress: 100
        minRam: 0
        metadata: {
            com.ubuntu.cloud__1__milestone: "release"
            com.hp__1__os_distro: "com.ubuntu"
            com.ubuntu.cloud_images.official: "True"
            com.ubuntu.cloud__1__suite: "12.04.4_LTS"
            com.ubuntu.cloud__1__serial: "20140408"
            com.hp__1__image_lifecycle: "active"
            com.hp__1__image_type: "disk"
            os_version: "12.04.4_LTS"
            architecture: "x86_64"
            os_type: "linux-ext4"
            com.ubuntu.cloud__1__stream: "server"
            com.ubuntu.cloud__1__pubdate: "2014-04-14"
            com.ubuntu.cloud__1__official: "True"
            com.hp__1__bootable_volume: "true"
            }
        }
    }

XML

<em>snippet</em>

    Content-Length: 65344 
    Content-Type: application/xml; charset=UTF-8 
    Date: Thu, 17 Apr 2014 16:15:37 GMT 
    X-Compute-Request-Id: req-aeee36de-8012-4ec5-8f60-b7e072ca2e5f

    <?xml version='1.0' encoding='UTF-8' ?>
    <images>
    <image status="ACTIVE" updated="2014-04-14T14:26:41Z" name="Ubuntu Server 12.04.4 LTS (amd64 20140408) - Partner Image" created="2014-04-09T14:24:23Z" minDisk="8" progress="100" minRam="0" id="8672f4c6-e33d-46f5-b6d8-ebbeba12fa02" OS-EXT-IMG-SIZE:size="260178432">
    <metadata>
        <meta key="com.ubuntu.cloud__1__milestone">release</meta>
        <meta key="com.hp__1__os_distro">com.ubuntu</meta>
        <meta key="com.ubuntu.cloud_images.official">True</meta>
        <meta key="com.ubuntu.cloud__1__suite">12.04.4_LTS</meta>
        <meta key="com.ubuntu.cloud__1__serial">20140408</meta>
        <meta key="com.hp__1__image_lifecycle">active</meta>
        <meta key="com.hp__1__image_type">disk</meta>
        <meta key="os_version">12.04.4_LTS</meta>
        <meta key="architecture">x86_64</meta>
        <meta key="os_type">linux-ext4</meta>
        <meta key="com.ubuntu.cloud__1__stream">server</meta>
        <meta key="com.ubuntu.cloud__1__pubdate">2014-04-14</meta>
        <meta key="com.ubuntu.cloud__1__official">True</meta>
        <meta key="com.hp__1__bootable_volume">true</meta>
    </metadata>
    <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/images/8672f4c6-e33d-46f5-b6d8-ebbeba12fa02" rel="self" />
    <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/images/8672f4c6-e33d-46f5-b6d8-ebbeba12fa02" rel="bookmark" />
    <atom:link href="https://region-b.geo-1.images.hpcloudsvc.com:443/10979209027984/images/8672f4c6-e33d-46f5-b6d8-ebbeba12fa02" type="application/vnd.openstack.image" rel="alternate" />
    </image>
    </images>  

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to 

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/images/detail

##### 4.4.1.24 Get Image Details ##### {#getImage}
##### GET /v2/{project_id}/images/{image_id} #####

Returns detailed information about the specified image.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
<li><p><em>id</em> - Image ID. This parameter can be an integer ID or a UUID. In either case, the specified image must be in the addressed Region.</p></li>
</ul>

**URL Parameters**
N/A

**Data Parameters**
This call does not require a request body

**Success Response**
200 - OK

**Response Data**

JSON

    Content-Length: 1310 
    Content-Type: application/json 
    Date: Thu, 17 Apr 2014 16:09:50 GMT 
    X-Compute-Request-Id: req-1154f5c1-1f4a-42fa-a691-627d5ef0aa41

    {
    image: {
        status: "ACTIVE"
        updated: "2014-04-14T14:26:41Z"
        links: [3]
            0:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/images/8672f4c6-e33d-46f5-b6d8-ebbeba12fa02"
            rel: "self"
            }
            1:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/images/8672f4c6-e33d-46f5-b6d8-ebbeba12fa02"
            rel: "bookmark"
            }
            2:  {
            href: "https://region-b.geo-1.images.hpcloudsvc.com:443/10979209027984/images/8672f4c6-e33d-46f5-b6d8-ebbeba12fa02"
            type: "application/vnd.openstack.image"
            rel: "alternate"
            }
        id: "8672f4c6-e33d-46f5-b6d8-ebbeba12fa02"
        OS-EXT-IMG-SIZE:size: 260178432
        name: "Ubuntu Server 12.04.4 LTS (amd64 20140408) - Partner Image"
        created: "2014-04-09T14:24:23Z"
        minDisk: 8
        progress: 100
        minRam: 0
        metadata: {
        com.ubuntu.cloud__1__milestone: "release"
        com.hp__1__os_distro: "com.ubuntu"
        com.ubuntu.cloud_images.official: "True"
        com.ubuntu.cloud__1__suite: "12.04.4_LTS"
        com.ubuntu.cloud__1__serial: "20140408"
        com.hp__1__image_lifecycle: "active"
        com.hp__1__image_type: "disk"
        os_version: "12.04.4_LTS"
        architecture: "x86_64"
        os_type: "linux-ext4"
        com.ubuntu.cloud__1__stream: "server"
        com.ubuntu.cloud__1__pubdate: "2014-04-14"
        com.ubuntu.cloud__1__official: "True"
        com.hp__1__bootable_volume: "true"
        }
        }
    }

XML

    Content-Length: 1665 
    Content-Type: application/xml; charset=UTF-8 
    Date: Thu, 17 Apr 2014 16:11:36 GMT 
    X-Compute-Request-Id: req-9abc0fdf-cdd4-492e-b7d4-db1110d85e8b

    <?xml version='1.0' encoding='UTF-8' ?>
    <image status="ACTIVE" updated="2014-04-14T14:26:41Z" name="Ubuntu Server 12.04.4 LTS (amd64 20140408) - Partner Image" created="2014-04-09T14:24:23Z" minDisk="8" progress="100" minRam="0" id="8672f4c6-e33d-46f5-b6d8-ebbeba12fa02" OS-EXT-IMG-SIZE:size="260178432">
    <metadata>
        <meta key="com.ubuntu.cloud__1__milestone">release</meta>
        <meta key="com.hp__1__os_distro">com.ubuntu</meta>
        <meta key="com.ubuntu.cloud_images.official">True</meta>
        <meta key="com.ubuntu.cloud__1__suite">12.04.4_LTS</meta>
        <meta key="com.ubuntu.cloud__1__serial">20140408</meta>
        <meta key="com.hp__1__image_lifecycle">active</meta>
        <meta key="com.hp__1__image_type">disk</meta>
        <meta key="os_version">12.04.4_LTS</meta>
        <meta key="architecture">x86_64</meta>
        <meta key="os_type">linux-ext4</meta>
        <meta key="com.ubuntu.cloud__1__stream">server</meta>
        <meta key="com.ubuntu.cloud__1__pubdate">2014-04-14</meta>
        <meta key="com.ubuntu.cloud__1__official">True</meta>
        <meta key="com.hp__1__bootable_volume">true</meta>
    </metadata>
    <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/images/8672f4c6-e33d-46f5-b6d8-ebbeba12fa02" rel="self" />
    <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/images/8672f4c6-e33d-46f5-b6d8-ebbeba12fa02" rel="bookmark" />
    <atom:link href="https://region-b.geo-1.images.hpcloudsvc.com:443/10979209027984/images/8672f4c6-e33d-46f5-b6d8-ebbeba12fa02" type="application/vnd.openstack.image" rel="alternate" />
    </image>

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 404 | Not Found | The Image ID specified does not exist on the Project |

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/images/{id}

##### 4.4.1.25 Delete Image ##### {#deleteImage}
##### DELETE /v2/{project_id}/images/{image_id} #####

Deletes the specified image.

**NOTE:** You can only delete images that you are the owner of. If you are not the owner of an image then a 403 Forbidden error will be thrown.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
<li><p><em>id</em> - Image ID. This parameter can be an integer ID or a UUID. In either case, the specified image must be in the addressed Region.</p></li>
</ul>

**URL Parameters**
N/A

**Data Parameters**
This call does not require a request body

**Success Response**
204 - No Content

**Response Data**
N/A

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Example**

    curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/images/{id}

##### 4.4.1.26 List Metadata ##### {#ImageMetadata_listMetadata}
##### GET /v2/{project_id}/images/{image_id}/metadata #####

Lists metadata associated with the resource.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
<li><p><em>id</em> - Image ID. This parameter can be an integer ID or a UUID. In either case, the specified image must be in the addressed Region.</p></li>
</ul>

**URL Parameters**
N/A

**Data Parameters**
This call does not require a request body

**Success Response**
200 - OK

**Response Data**

JSON

    Content-Length: 1157 
    Content-Type: application/json 
    Date: Thu, 17 Apr 2014 19:15:54 GMT 
    X-Compute-Request-Id: req-14073540-26dd-4a14-9cc0-af07acba27d7

    {
    metadata: {
        com.ubuntu.cloud__1__milestone: "release"
        com.hp__1__os_distro: "com.ubuntu"
        description: "Ubuntu Server 14.04 LTS (amd64 20140416.1) for HP Public Cloud. Ubuntu Server is the world's most popular Linux for cloud environments. Updates and patches for Ubuntu 14.04 LTS will be available until 2019-04-17. Ubuntu Server is the perfect platform for all workloads from web applications to NoSQL databases and Hadoop. More information regarding Ubuntu Cloud is available from http://www.ubuntu.com/cloud and instructions for using Juju to deploy workloads are available from http://juju.ubuntu.com EULA: http://www.ubuntu.com/about/about-ubuntu/licensing Privacy Policy: http://www.ubuntu.com/privacy-policy"
        com.ubuntu.cloud__1__suite: "trusty"
        com.ubuntu.cloud__1__serial: "20140416.1"
        com.hp__1__bootable_volume: "True"
        com.hp__1__vendor: "Canonical"
        com.hp__1__image_lifecycle: "active"
        com.hp__1__image_type: "disk"
        os_version: "14.04"
        architecture: "x86_64"
        os_type: "linux-ext4"
        com.ubuntu.cloud__1__stream: "server"
        com.ubuntu.cloud__1__official: "True"
        com.ubuntu.cloud_images.official: "True"
        }
    }

XML

    Content-Length: 1434 
    Content-Type: application/xml; charset=UTF-8 
    Date: Thu, 17 Apr 2014 19:17:14 GMT 
    X-Compute-Request-Id: req-6cc0b834-d36c-4673-a7ab-d56207c541e8

    <?xml version='1.0' encoding='UTF-8' ?>
    <metadata>
        <meta key="com.ubuntu.cloud__1__milestone">release</meta>
        <meta key="com.hp__1__os_distro">com.ubuntu</meta>
        <meta key="description">Ubuntu Server 14.04 LTS (amd64 20140416.1) for HP Public Cloud. Ubuntu Server is the world's most popular Linux for cloud environments. Updates and patches for Ubuntu 14.04 LTS will be available until 2019-04-17. Ubuntu Server is the perfect platform for all workloads from web applications to NoSQL databases and Hadoop. More information regarding Ubuntu Cloud is available from http://www.ubuntu.com/cloud and instructions for using Juju to deploy workloads are available from http://juju.ubuntu.com EULA: http://www.ubuntu.com/about/about-ubuntu/licensing Privacy Policy: http://www.ubuntu.com/privacy-policy</meta>
        <meta key="com.ubuntu.cloud__1__suite">trusty</meta>
        <meta key="com.ubuntu.cloud__1__serial">20140416.1</meta>
        <meta key="com.hp__1__bootable_volume">True</meta>
        <meta key="com.hp__1__vendor">Canonical</meta>
        <meta key="com.hp__1__image_lifecycle">active</meta>
        <meta key="com.hp__1__image_type">disk</meta>
        <meta key="os_version">14.04</meta>
        <meta key="architecture">x86_64</meta>
        <meta key="os_type">linux-ext4</meta>
        <meta key="com.ubuntu.cloud__1__stream">server</meta>
        <meta key="com.ubuntu.cloud__1__official">True</meta>
        <meta key="com.ubuntu.cloud_images.official">True</meta>
    </metadata>

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/images/{id}/metadata

##### 4.4.1.27 Update Metadata ##### {#ImageMetadata_updateMetadata}
##### POST /v2/{project_id}/images/{image_id}/metadata #####

Updates resource metadata. Updates will replace existing metadata items with the same key. Items not explicitly mentioned in the request will not be modified. An overLimit (<errorcode>413</errorcode>) fault may be thrown if the operation causes the maximum number of metadata items to be exceeded.

**NOTE:** You can only update the metadata on images that you are the owner of. If you are not the owner of an image then a 403 Forbidden error will be thrown.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
<li><p><em>id</em> - Image ID. This parameter can be an integer ID or a UUID. In either case, the specified image must be in the addressed Region.</p></li>
</ul>

**URL Parameters**
N/A

**Data Parameters**

<ul>
<li><p><em>metadata</em> - A set of key/value pairs. These pair replace any existing key/value pairs in the resources metadata with matching keys. Any key/value pairs in the parameter with keys that do not occur in the existing resource metadata are added to the resources metadata. </p>
</li>
</ul>

JSON

    {
        "metadata": {
            "key-1": "value-1"
        }
    }

XML

    <metadata>
        <meta key="key-1">value-1</meta>
        <meta key="key-2">value-2</meta>
    </metadata>

**Success Response**
200 - OK

**Response Data**

JSON

    Content-Length: 802 
    Content-Type: application/json 
    Date: Thu, 17 Apr 2014 19:26:10 GMT 
    X-Compute-Request-Id: req-448ef2b4-f3af-446f-82af-9ffc1649d3ec

    {
    metadata: {
        image_state: "available"
        com.hp__1__os_distro: "com.ubuntu"
        instance_type_id: "11"
        com.hp__1__image_type: "disk"
        key_1: "value-1"
        user_id: "52552375567809"
        image_type: "snapshot"
        instance_type_ephemeral_gb: "10"
        os_version: "12.04"
        clean_attempts: "4"
        network_allocated: "True"
        com.hp__1__bootable_volume: "true"
        image_location: "snapshot"
        instance_type_root_gb: "10"
        instance_type_name: "standard.xsmall"
        instance_type_rxtx_factor: "1.0"
        instance_type_vcpus: "1"
        instance_uuid: "df4a89b0-30c7-4374-94e0-c6c523ffa1e3"
        instance_type_memory_mb: "1024"
        instance_type_swap: "0"
        com.hp__1__image_lifecycle: "active"
        architecture: "x86_64"
        instance_type_flavorid: "100"
        os_type: "linux-ext4"
        owner_id: "10979209027984"
        }
    }

XML

    Content-Length: 1239 
    Content-Type: application/xml; charset=UTF-8 
    Date: Thu, 17 Apr 2014 19:34:22 GMT 
    X-Compute-Request-Id: req-0bf8715b-077d-4695-bfff-65fcba86bf97

    <?xml version='1.0' encoding='UTF-8' ?>
    <metadata>
        <meta key="image_state">available</meta>
        <meta key="com.hp__1__os_distro">com.ubuntu</meta>
        <meta key="instance_type_id">11</meta>
        <meta key="com.hp__1__image_type">disk</meta>
        <meta key="key_1">value-1,value-1</meta>
        <meta key="key_2">value-2</meta>
        <meta key="user_id">52552375567809</meta>
        <meta key="image_type">snapshot</meta>
        <meta key="instance_type_ephemeral_gb">10</meta>
        <meta key="os_version">12.04</meta>
        <meta key="clean_attempts">4</meta>
        <meta key="network_allocated">True</meta>
        <meta key="com.hp__1__bootable_volume">true</meta>
        <meta key="image_location">snapshot</meta>
        <meta key="instance_type_root_gb">10</meta>
        <meta key="instance_type_name">standard.xsmall</meta>
        <meta key="instance_type_rxtx_factor">1.0</meta>
        <meta key="instance_type_vcpus">1</meta>
        <meta key="instance_uuid">df4a89b0-30c7-4374-94e0-c6c523ffa1e3</meta>
        <meta key="instance_type_memory_mb">1024</meta>
        <meta key="instance_type_swap">0</meta>
        <meta key="com.hp__1__image_lifecycle">active</meta>
        <meta key="architecture">x86_64</meta>
        <meta key="instance_type_flavorid">100</meta>
        <meta key="os_type">linux-ext4</meta>
        <meta key="owner_id">10979209027984</meta>
    </metadata>

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 403 | Forbidden | The caller is not authorized to make changes to this image. |

**Curl Example**

    curl -i -k -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"metadata":{"key-1":"value-1"}}' {BaseURI}/v2/{project_id}/images/{id}/metadata

##### 4.4.1.28 Create or Replace Metadata ##### {#ImageMetadata_setMetadata}
##### PUT /v2/{project_id}/images/{image_id}/metadata #####

The metadata items set on the resource are those specified on the requests. Existing metadata items are replaced with the ones provided in the request. Metadata items, set previously, but not specified in the request are removed. An overLimit (<errorcode>413</errorcode>) fault may be thrown if the maximum number of metadata items is exceeded.

**NOTE:** You can only update the metadata on images that you are the owner of. If you are not the owner of an image then a 403 Forbidden error will be thrown

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
<li><p><em>id</em> - Image ID. This parameter can be an integer ID or a UUID. In either case, the specified image must be in the addressed Region.</p></li>
</ul>

**URL Parameters**
N/A

**Data Parameters**

<ul>
<li><p><em>metadata</em> - csapi:Metadata - A set of key/value pairs. These pair replace any existing key/value pairs in the resources metadata with matching keys. Any key/value pairs in the parameter with keys that do not occur in the existing resource metadata are added to the resources metadata. </p>
</li>
</ul>

**Data Parameters**

JSON

    {
        "metadata": {
            "key-1": "value-1",
            "key-2": "value-2"
        }
    }

XML

    <metadata>
        <meta key="key-1">value-1</meta>
        <meta key="key-2">value-2</meta>
    </metadata>

**Success Response**
200 - OK

**Response Data**

JSON

    Content-Length: 802 
    Content-Type: application/json 
    Date: Thu, 17 Apr 2014 19:26:10 GMT 
    X-Compute-Request-Id: req-448ef2b4-f3af-446f-82af-9ffc1649d3ec

    {
    metadata: {
        image_state: "available"
        com.hp__1__os_distro: "com.ubuntu"
        instance_type_id: "11"
        com.hp__1__image_type: "disk"
        key_1: "value-1"
        user_id: "52552375567809"
        image_type: "snapshot"
        instance_type_ephemeral_gb: "10"
        os_version: "12.04"
        clean_attempts: "4"
        network_allocated: "True"
        com.hp__1__bootable_volume: "true"
        image_location: "snapshot"
        instance_type_root_gb: "10"
        instance_type_name: "standard.xsmall"
        instance_type_rxtx_factor: "1.0"
        instance_type_vcpus: "1"
        instance_uuid: "df4a89b0-30c7-4374-94e0-c6c523ffa1e3"
        instance_type_memory_mb: "1024"
        instance_type_swap: "0"
        com.hp__1__image_lifecycle: "active"
        architecture: "x86_64"
        instance_type_flavorid: "100"
        os_type: "linux-ext4"
        owner_id: "10979209027984"
        }
    }

XML

    Content-Length: 1239 
    Content-Type: application/xml; charset=UTF-8 
    Date: Thu, 17 Apr 2014 19:34:22 GMT 
    X-Compute-Request-Id: req-0bf8715b-077d-4695-bfff-65fcba86bf97

    <?xml version='1.0' encoding='UTF-8' ?>
    <metadata>
        <meta key="image_state">available</meta>
        <meta key="com.hp__1__os_distro">com.ubuntu</meta>
        <meta key="instance_type_id">11</meta>
        <meta key="com.hp__1__image_type">disk</meta>
        <meta key="key_1">value-1,value-1</meta>
        <meta key="key_2">value-2</meta>
        <meta key="user_id">52552375567809</meta>
        <meta key="image_type">snapshot</meta>
        <meta key="instance_type_ephemeral_gb">10</meta>
        <meta key="os_version">12.04</meta>
        <meta key="clean_attempts">4</meta>
        <meta key="network_allocated">True</meta>
        <meta key="com.hp__1__bootable_volume">true</meta>
        <meta key="image_location">snapshot</meta>
        <meta key="instance_type_root_gb">10</meta>
        <meta key="instance_type_name">standard.xsmall</meta>
        <meta key="instance_type_rxtx_factor">1.0</meta>
        <meta key="instance_type_vcpus">1</meta>
        <meta key="instance_uuid">df4a89b0-30c7-4374-94e0-c6c523ffa1e3</meta>
        <meta key="instance_type_memory_mb">1024</meta>
        <meta key="instance_type_swap">0</meta>
        <meta key="com.hp__1__image_lifecycle">active</meta>
        <meta key="architecture">x86_64</meta>
        <meta key="instance_type_flavorid">100</meta>
        <meta key="os_type">linux-ext4</meta>
        <meta key="owner_id">10979209027984</meta>
    </metadata>

**Error Response**   
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 403 | Forbidden | The caller is not authorized to make changes to this image. |

**Curl Example**

    curl -i -k -X PUT -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"metadata":{"key-1":"value-1"}}' {BaseURI}/v2/{project_id}/images/{id}/metadata

##### 4.4.1.29 Get Metadata Item ##### {#ImageMetadataItem_getMetadataItem}
##### GET /v2/{project_id}/images/{image_id}/metadata/{key} #####

Retrieves a single metadata item by key.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
<li><p><em>id</em> - Image ID. This parameter can be an integer ID or a UUID. In either case, the specified image must be in the addressed Region.</p></li>
<li><p><em>key</em> - A string no longer than 255 characters.</p></li>
</ul>

**URL Parameters**
N/A

**Data Parameters**
This call does not require a request body

**Success Response**
200 - OK

**Response Data**

JSON

    Content-Length: 39 
    Content-Type: application/json 
    Date: Fri, 18 Apr 2014 13:38:18 GMT 
    X-Compute-Request-Id: req-856e6d68-f027-45ac-9ae5-5c61d8d09e22

    {
    meta: {
        os_version: "12.04.4_LTS"
        }
    }

XML

    Content-Length: 131 
    Content-Type: application/xml; charset=UTF-8 
    Date: Fri, 18 Apr 2014 13:40:06 GMT 
    X-Compute-Request-Id: req-ea9e73f6-ae8c-4de7-97d3-4787904961ba

    <?xml version='1.0' encoding='UTF-8' ?>
    <meta key="os_version">12.04.4_LTS</meta>

**Error Response**
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 404 | Not Found | The metadata key was not found |

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/images/{id}/metadata/{key}

##### 4.4.1.30 Create or Update Metadata Item ##### {#ImageMetadataItem_setMetadataItem}
##### PUT /v2/{project_id}/images/{id}/metadata/{key} #####

Sets a metadata item by its key. An overLimit (<errorcode>413</errorcode>) fault may be thrown if the operation causes the maximum number of metadata items to be exceeded.

**NOTE:** You can only update the metadata on images that you are the owner of. If you are not the owner of an image then a 403 Forbidden error will be thrown.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
<li><p><em>id</em> - Image ID. This parameter can be an integer ID or a UUID. In either case, the specified image must be in the addressed Region.</p></li>
<li><p><em>key</em> - A string no longer than 255 characters.</p></li>
</ul>

**URL Parameters**
N/A

**Data Parameters**

JSON

    {
        "meta": {
            "key-1": "value-1"
        }
    }

XML

    <?xml version="1.0" ?>
    <meta key="key-1">value-1</meta>

**Success Response**
200 - OK

**Response Data**

JSON

    {
        "meta": {
            "key-1": "value-1"
        }
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <meta key="key-1">value-1</meta>

**Error Response**
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 404 | Not Found | The metadata key was not found |

**Curl Example**

    curl -i -k -X PUT -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"metadata":{"key-1":"value-1"}}' {BaseURI}/v2/{project_id}/images/{id}/metadata/{key}

##### 4.4.1.31 Delete Metadata Item ##### {#ImageMetadataItem_deleteMetadataItem}
##### DELETE /v2/{project_id}/images/{id}/metadata/{key} #####

Deletes a metadata item.

**NOTE:** You can only update the metadata on images that you are the owner of. If you are not the owner of an image then a 403 Forbidden error will be thrown.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
<li><p><em>id</em> - Image ID. This parameter can be an integer ID or a UUID. In either case, the specified image must be in the addressed Region.</p></li>
<li><p><em>key</em> - A string no longer than 255 characters.</p></li>
</ul>

**URL Parameters**
N/A

**Data Parameters**
This call does not require a request body

**Success Response**
204 - No Content

**Response Data**
N/A

**Error Response**
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 404 | Not Found | The metadata key was not found |

**Curl Example**

    curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/images/{id}/metadata/{key}

##### 4.4.1.32 List Flavors ##### {#listFlavors}
##### GET /v2/{project_id}/flavors #####

Lists IDs, names, and links for available flavors.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
</ul>

**URL Parameters**
Users can control which attributes should be returned by using the fields query parameter. See [Filtering and Column Selection](#filtering) for more information. Filtering is supported on all top level attributes of an API entity. For example: 

    GET /v2/{project_id}/flavors?name={name}

**Data Parameters**
This call does not require a request body

**Success Response**
200 - OK

**Response Data**

JSON

<em>snippet</em>

    Content-Length: 2871 
    Content-Type: application/json 
    Date: Fri, 18 Apr 2014 14:20:16 GMT 
    X-Compute-Request-Id: req-95c8d511-f31a-455f-960f-70820e97bd59

    {
    flavors: [11]
        0:  {
        id: "100"
        links: [2]
            0:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/flavors/100"
            rel: "self"
            }
            1:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/flavors/100"
            rel: "bookmark"
            }
        name: "standard.xsmall"
        }
        1:  {
        id: "101"
            links: [2]
            0:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/flavors/101"
            rel: "self"
            }
            1:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/flavors/101"
            rel: "bookmark"
            }
            name: "standard.small"
            }
        .....
    }

XML

<em>snippet</em>

    Content-Length: 3008 
    Content-Type: application/xml; charset=UTF-8 
    Date: Fri, 18 Apr 2014 14:05:08 GMT 
    X-Compute-Request-Id: req-558a0718-26af-44bb-800c-b05552bbdf87

    <?xml version='1.0' encoding='UTF-8' ?>
    <flavors>
        <flavor name="standard.xsmall" id="100">
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/flavors/100" rel="self" />
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/flavors/100" rel="bookmark" />
        </flavor>
        <flavor name="standard.small" id="101">
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/flavors/101" rel="self" />
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/flavors/101" rel="bookmark" />
        </flavor>
    </flavors>

**Error Response**
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/flavors

##### 4.4.1.33 List Flavors Detail ##### {#listDetailFlavors}
##### GET /v2/{project_id}/flavors/detail #####

Lists all details for available flavors.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
</ul>

**URL Parameters**
Users can control which attributes should be returned by using the fields query parameter. See [Filtering and Column Selection](#filtering) for more information. Filtering is supported on all top level attributes of an API entity. For example: 

    GET /v2/{project_id}/flavors?name={name}

**Data Parameters**
This call does not require a request body

**Success Response**
200 - OK

**Response Data**

JSON

<em>snippet</em>

    Content-Length: 4012 
    Content-Type: application/json 
    Date: Fri, 18 Apr 2014 14:27:03 GMT 
    X-Compute-Request-Id: req-7325e520-07a1-4a70-92a6-d3d96bda3db6

    {
    flavors: [11]
        0:  {
        name: "standard.xsmall"
            links: [2]
            0:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/flavors/100"
            rel: "self"
            }
            1:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/flavors/100"
            rel: "bookmark"
            }
        ram: 1024
        vcpus: 1
        swap: ""
        rxtx_factor: 1
        OS-FLV-EXT-DATA:ephemeral: 10
        disk: 10
        id: "100"
        }
        1:  {
        name: "standard.small"
            links: [2]
            0:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/flavors/101"
            rel: "self"
            }
            1:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/flavors/101"
            rel: "bookmark"
            }
        ram: 2048
        vcpus: 2
        swap: ""
        rxtx_factor: 1
        OS-FLV-EXT-DATA:ephemeral: 10
        disk: 30
        id: "101"
        }
    }

XML

<em>snippet</em>

    Content-Length: 4084 
    Content-Type: application/xml; charset=UTF-8 
    Date: Fri, 18 Apr 2014 14:29:32 GMT 
    X-Compute-Request-Id: req-f15234a6-bc9a-4aba-af11-30e254fcd337

    <?xml version='1.0' encoding='UTF-8' ?>
    <flavors>
        <flavor disk="10" vcpus="1" ram="1024" name="standard.xsmall" id="100" swap="" rxtx_factor="1.0" OS-FLV-EXT-DATA:ephemeral="10">
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/flavors/100" rel="self" />
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/flavors/100" rel="bookmark" />
        </flavor>
        <flavor disk="30" vcpus="2" ram="2048" name="standard.small" id="101" swap="" rxtx_factor="1.0" OS-FLV-EXT-DATA:ephemeral="10">
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/flavors/101" rel="self" />
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/flavors/101" rel="bookmark" />
        </flavor>
    </flavors>

**Error Response**
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/flavors/detail

##### 4.4.1.34 Get Flavor Details ##### {#getFlavor}
##### GET /v2/{project_id}/flavors/{id} #####

Lists details for the specified flavor.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
<li><p><em>id</em> - Flavor ID. This parameter can be an integer ID or a UUID.</p></li>
</ul>

**URL Parameters**
N/A

**Data Parameters**
This call does not require a request body

**Success Response**
200 - OK

**Response Data**

JSON

    {
    flavor: {
        name: "standard.xsmall"
            links: [2]
            0:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/flavors/100"
            rel: "self"
            }
            1:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.    com/10979209027984/flavors/100"
            rel: "bookmark"
            }
        ram: 1024
        vcpus: 1
        swap: ""
        rxtx_factor: 1
        OS-FLV-EXT-DATA:ephemeral: 10
        disk: 10
        id: "100"
        }
    }

XML

    <?xml version='1.0' encoding='UTF-8' ?>
    <flavor disk="10" vcpus="1" ram="1024" name="standard.xsmall" id="100" swap="" rxtx_factor="1.0" OS-FLV-EXT-DATA:ephemeral="10">
    <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/flavors/100" rel="self" />
    <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/flavors/100" rel="bookmark" />
    </flavor>

**Error Response**
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/flavors/{id}

#### 4.4.2 Availability Zone ####
##### 4.4.2.1 List Availability Zones. ##### {#listaz}
##### GET /v2/{project_id}/os-availability-zone #####

List the availability zones. This operation provides summary information about the availability zones.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
</ul>

**Data Parameters**
This call does not require a request body

**Success Response**
200 - OK

**Response Data**

JSON

    {
    availabilityZoneInfo: [3]
        0:  {
        zoneState: {
        available: true
        }
        hosts: null
        zoneName: "az2"
        }
        1:  {
        zoneState: {
        available: true
        }
        hosts: null
        zoneName: "az1"
        }
        2:  {
        zoneState: {
        available: true
        }
        hosts: null
        zoneName: "az3"
        }
    }

XML

    <?xml version='1.0' encoding='UTF-8' ?>
    <availabilityZones>
        <availabilityZone name="az2">
        <zoneState available="True" />
        <metadata />
        </availabilityZone>
        <availabilityZone name="az1">
        <zoneState available="True" />
        <metadata />
        </availabilityZone>
        <availabilityZone name="az3">
        <zoneState available="True" />
        <metadata />
        </availabilityZone>
    </availabilityZones>

**Error Response**
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/os-availability-zone

##### 4.4.2.2 Create With Availability Zone. ##### {#createWithaz}
##### POST /v2/{project_id}/servers #####

This extends the [Create Server](#createServer) operation with the availability_zone attribute. This specifies which availability zone should contain the server.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization</a>)</p></li>
</ul>

**URL Parameters**
N/A

**Data Parameters**

<ul>
<li><p><em>availability_zone</em> - The name of the availability zone to use.</p></li>
</ul>

JSON

    {
    "server":{
        "name":"{name}",
        "imageRef":"{image_id}",
        "flavorRef":"{flavor_id}",
        "key_name": "{keypair_name}",
        "config_drive": false,
        "availability_zone": "{az}",
        "max_count":1,
        "min_count":1,
        "metadata":{
            "{key}":"{value}"
            },
        "security_groups": [
            {
            "name": "{security_group_name}"
            }
            ],
        "networks":[
            {
            "uuid":"{network_uuid}"
            }
            ]
        }
    }

XML

    <server config_drive="false" flavorRef="{flavor_id}" imageRef="{image_id}" key_name="{keypair_name}" max_count="1" min_count="1" name="{name}" availability_zone="{az}">
    <security_groups>
        <security_group name="{security_group_name}"/>
    </security_groups>
    <networks>
        <network uuid="{network_uuid}"/>
    </networks>
    <metadata>
        <meta key="key-1" value="value-1"/>
        <meta key="key-2" value="value-2"/>
    </metadata>
    </server>

**Success Response**
202 - Accepted

**Response Data**

JSON

    {   
    server: {
        security_groups: [1]
            0:  {
            name: "default"
            }
            id: "516a97d6-d8b7-4830-9a87-ff4b396b07ea"
        links: [2]
            0:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/servers/516a97d6-d8b7-4830-9a87-ff4b396b07ea"
            rel: "self"
            }
            1:  {
            href: "http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/servers/516a97d6-d8b7-4830-9a87-ff4b396b07ea"
            rel: "bookmark"
            }
        adminPass: "nX9B2qtU6HUw"
        }
    }

XML

    <?xml version='1.0' encoding='UTF-8' ?>
    <server id="bc652b77-1343-4804-a905-ecd11055ccd7" adminPass="bvTHj8wLuom5">
        <metadata />
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/v2/10979209027984/servers/bc652b77-1343-4804-a905-ecd11055ccd7" rel="self" />
        <atom:link href="http://region-b.geo-1.compute.hpcloudsvc.com/10979209027984/servers/bc652b77-1343-4804-a905-ecd11055ccd7" rel="bookmark" />
        <security_groups>
            <security_group name="default" />
        </security_groups>  
    </server>

**Error Response**
If an error occurs, the response body contains a description of the error.

**Status Code**   
      
| Status Code | Description | Reasons |
| :-----------| :-----------| :-------|
| 401 | Unauthorized | The caller does not have the privilege required to perform the operation. |
| 400 | Bad Request | The request body is malformed. |

**Curl Example**

    curl -i -k -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"server":{"name":"{name}","imageRef":"{image_id}","flavorRef":"{flavor_id}","key_name": "{keypair_name}","config_drive": false,"availability_zone": "{az}","max_count":1,"min_count":1,"security_groups": [{"name": "{security_group_name}"}],"networks":[{"uuid":"{network_uuid}"}]}}' {BaseURI}/v2/{project_id}/servers

#### 4.4.3 Config Drive ####
##### 4.4.3.1 List Servers With Config Drive ##### {#listWithConfig}
##### GET /v2/{project_id}/servers/detail #####

This extends the [List Servers Detail](#listDetailServers) operation by adding the attribute config_drive. Config drive indicates if an ephemeral configuration drive is used by the server.

**Request Data**

<ul>
<li><p><em>project_id</em> The ID for the project or account in a multi-tenancy cloud.</p></li>
</ul>

**Data Parameters**

This call does not require a request body.

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "servers": [
            {
            "OS-EXT-AZ:availability_zone": "az2",
            "OS-EXT-STS:power_state": 1,
            "OS-EXT-STS:task_state": null,
            "OS-EXT-STS:vm_state": "active",
            "accessIPv4": "",
            "accessIPv6": "",
            "addresses": {
                "default": [
                    {
                        "addr": "16.24.24.14",
                        "version": 4
                    }
                ],
            },
            "config_drive": "true",
            "created": "2013-05-30T09:51:46Z",
            "flavor": {
                "id": "101",
                "links": [
                    {
                        "href": "http://region-a.geo-1.compute.hpcloudsvc.com/10424127775376/flavors/101",
                        "rel": "bookmark"
                    }
                ]
            },
            "hostId": "7e8dfb2e80b9d17362790d4f4cdf025f46ad4ddcbaff0deae8f516ee",
            "id": "fead84c5-f1f3-4dbf-afe2-a84e9127e2b6",
            "image": {
                "id": "8dbf51b8-8fcd-4218-823c-62b4b79acd0b",
                "links": [
                    {
                        "href": "http://region-a.geo-1.compute.hpcloudsvc.com/10424127775376/images/8dbf51b8-8fcd-4218-823c-62b4b79acd0b",
                        "rel": "bookmark"
                    }
                ]
            },
            "key_name": null,
            "links": [
                {
                    "href": "http://region-a.geo-1.compute.hpcloudsvc.com/v2/10424127775376/servers/fead84c5-f1f3-4dbf-afe2-a84e9127e2b6",
                    "rel": "self"
                },
                {
                    "href": "http://region-a.geo-1.compute.hpcloudsvc.com/10424127775376/servers/fead84c5-f1f3-4dbf-afe2-a84e9127e2b6",
                    "rel": "bookmark"
                }
            ],
            "metadata": {
                "id": "25"
            },
            "name": "server-1",
            "progress": 0,
            "security_groups": [
                {
                    "name": "default"
                },
            ],
            "status": "ACTIVE",
            "tenant_id": "10424127775376",
            "updated": "2013-05-30T09:51:54Z",
            "user_id": "10957921068964"
            }
        ]
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <servers xmlns="http://docs.openstack.org/compute/api/v1.1" xmlns:OS-EXT-AZ="http://docs.openstack.org/compute/ext/extended_availability_zone/api/v2" xmlns:OS-EXT-STS="http://docs.openstack.org/compute/ext/extended_status/api/v1.1" xmlns:atom="http://www.w3.org/2005/Atom">
        <server OS-EXT-AZ:availability_zone="az2" OS-EXT-STS:power_state="1" OS-EXT-STS:task_state="None" OS-EXT-STS:vm_state="active" accessIPv4="" accessIPv6="" config_drive="" created="2013-05-30T09:51:46Z" hostId="7e8dfb2e80b9d17362790d4f4cdf025f46ad4ddcbaff0deae8f516ee" id="fead84c5-f1f3-4dbf-afe2-a84e9127e2b6" key_name="None" name="PaulsCD" progress="0" status="ACTIVE" tenantId="10424127775376" updated="2013-05-30T09:51:54Z" userId="10957921068964">
            <image id="8dbf51b8-8fcd-4218-823c-62b4b79acd0b">
                <atom:link href="http://region-a.geo-1.compute.hpcloudsvc.com/10424127775376/images/8dbf51b8-8fcd-4218-823c-62b4b79acd0b" rel="bookmark"/>
            </image>
            <flavor id="101">
                <atom:link href="http://region-a.geo-1.compute.hpcloudsvc.com/10424127775376/flavors/101" rel="bookmark"/>
            </flavor>
            <metadata>
                <meta key="id">25</meta>
            </metadata>
            <addresses>
                <network id="default">
                    <ip addr="15.184.40.12" version="4"/>
                </network>
            </addresses>
            <atom:link href="http://region-a.geo-1.compute.hpcloudsvc.com/v2/10424127775376/servers/fead84c5-f1f3-4dbf-afe2-a84e9127e2b6" rel="self"/>
            <atom:link href="http://region-a.geo-1.compute.hpcloudsvc.com/10424127775376/servers/fead84c5-f1f3-4dbf-afe2-a84e9127e2b6" rel="bookmark"/>
            <security_groups>
                <security_group name="default"/>
            </security_groups>
        </server>
    </servers>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H "X-Auth-Token: {Auth_Token}" {BaseURI}/v2/10424127775376/servers/detail' 

##### 4.4.3.2 Create With Config Drive ##### {#createWithConfig}
##### POST /v2/project_id}/servers

This extends the [Create Server](#createServer) operation by adding the attribute config_drive. Config drive indicates if an ephemeral configuration drive is used by the server.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account in a multi-tenancy cloud. </p>
</li>
</ul>

**Request Parameters**

<ul>
<li><p><em>config_drive</em> - If true, creates an ephemeral drive on the server which is formatted with a fat-32 filesystem. Metadata, networks and keys are written to files in the filesystem. (See <a href="#ConfigurationDrive"> Configuration Drive </a> .) Defaults to false.</p></li>
</ul>

**Data Parameters**

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <server xmlns="http://docs.openstack.org/compute/api/v1.1" imageRef="8dbf51b8-8fcd-4218-823c-62b4b79acd0b" flavorRef="101" name="server-1" config_drive="true">
        <metadata>
            <meta key="My Server Name">Apache1</meta>
        </metadata>
    </server>

JSON

    {
        "server": {
            "config_drive": true,
            "flavorRef": "101",
            "imageRef": "8dbf51b8-8fcd-4218-823c-62b4b79acd0b",
            "metadata": {
                "id": "25"
            },
            "name": "server-1"
        }
    }

**Response Data**

Normal Response Code(s): 202

JSON

    {
        "server": {
            "adminPass": "jwB4zK4GjGRg",
            "id": "fead84c5-f1f3-4dbf-afe2-a84e9127e2b6",
            "links": [
                {
                    "href": "http://region-a.geo-1.compute.hpcloudsvc.com/v2/10424127775376/servers/fead84c5-f1f3-4dbf-afe2-a84e9127e2b6",
                    "rel": "self"
                },
                {
                    "href": "http://region-a.geo-1.compute.hpcloudsvc.com/10424127775376/servers/fead84c5-f1f3-4dbf-afe2-a84e9127e2b6",
                    "rel": "bookmark"
                }
            ],
            "security_groups": [
                {
                    "name": "default"
                }
            ]
        }
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <server adminPass="jwB4zK4GjGRg" id="fead84c5-f1f3-4dbf-afe2-a84e9127e2b6" xmlns="http://docs.openstack.org/compute/api/v1.1" xmlns:atom="http://www.w3.org/2005/Atom">
        <metadata/>
        <atom:link href="http://region-a.geo-1.compute.hpcloudsvc.com/v2/10424127775376/servers/fead84c5-f1f3-4dbf-afe2-a84e9127e2b6" rel="self"/>
        <atom:link href="http://region-a.geo-1.compute.hpcloudsvc.com/10424127775376/servers/fead84c5-f1f3-4dbf-afe2-a84e9127e2b6" rel="bookmark"/>
        <security_groups>
            <security_group name="default"/>
        </security_groups>
    </server>

**Curl Example**

    curl -i -X 'POST'  -H "Content-type: application/json" -H "X-Auth-Token: {Auth_Token}" {BaseURI}/v2/10424127775376/servers' -d '{"server": {"name": "server-1", "imageRef": "8dbf51b8-8fcd-4218-823c-62b4b79acd0b", "flavorRef": "101", "metadata": {"id": "25"}, "config_drive": true}}'

##### 4.4.3.3 Get Servers With Config Drive ##### {#getWithConfig}
##### GET /v2/{project_id}/servers/{server_id}

This extends the [Get Server Details](#getServer) operation by adding the attribute config_drive. Config drive indicates if an ephemeral configuration drive is used by the server.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account in a multi-tenancy cloud. </p></li>
<li><p><em>server_id</em> - The ID for the server. </p></li>
</ul>

**Data Parameters**

This call does not require a request body.

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "server": {
            "OS-EXT-AZ:availability_zone": "az2",
            "OS-EXT-STS:power_state": 1,
            "OS-EXT-STS:task_state": null,
            "OS-EXT-STS:vm_state": "active",
            "accessIPv4": "",
            "accessIPv6": "",
            "addresses": {
                "default": [
                    {
                        "addr": "16.24.24.14",
                        "version": 4
                    }
                ],
            },
            "config_drive": "true",
            "created": "2013-05-30T09:51:46Z",
            "flavor": {
                "id": "101",
                "links": [
                    {
                        "href": "http://region-a.geo-1.compute.hpcloudsvc.com/10424127775376/flavors/101",
                        "rel": "bookmark"
                    }
                ]
            },
            "hostId": "7e8dfb2e80b9d17362790d4f4cdf025f46ad4ddcbaff0deae8f516ee",
            "id": "fead84c5-f1f3-4dbf-afe2-a84e9127e2b6",
            "image": {
                "id": "8dbf51b8-8fcd-4218-823c-62b4b79acd0b",
                "links": [
                    {
                        "href": "http://region-a.geo-1.compute.hpcloudsvc.com/10424127775376/images/8dbf51b8-8fcd-4218-823c-62b4b79acd0b",
                        "rel": "bookmark"
                    }
                ]
            },
            "key_name": null,
            "links": [
                {
                    "href": "http://region-a.geo-1.compute.hpcloudsvc.com/v2/10424127775376/servers/fead84c5-f1f3-4dbf-afe2-a84e9127e2b6",
                    "rel": "self"
                },
                {
                    "href": "http://region-a.geo-1.compute.hpcloudsvc.com/10424127775376/servers/fead84c5-f1f3-4dbf-afe2-a84e9127e2b6",
                    "rel": "bookmark"
                }
            ],
            "metadata": {
                "id": "25"
            },
            "name": "server-1",
            "progress": 0,
            "security_groups": [
                {
                    "name": "default"
                },
            ],
            "status": "ACTIVE",
            "tenant_id": "10424127775376",
            "updated": "2013-05-30T09:51:54Z",
            "user_id": "10957921068964"
        }
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <server OS-EXT-AZ:availability_zone="az2" OS-EXT-STS:power_state="1" OS-EXT-STS:task_state="None" OS-EXT-STS:vm_state="active" accessIPv4="" accessIPv6="" config_drive="" created="2013-05-30T09:51:46Z" hostId="7e8dfb2e80b9d17362790d4f4cdf025f46ad4ddcbaff0deae8f516ee" id="fead84c5-f1f3-4dbf-afe2-a84e9127e2b6" key_name="None" name="PaulsCD" progress="0" status="ACTIVE" tenantId="10424127775376" updated="2013-05-30T09:51:54Z" userId="10957921068964" xmlns="http://docs.openstack.org/compute/api/v1.1" xmlns:OS-EXT-AZ="http://docs.openstack.org/compute/ext/extended_availability_zone/api/v2" xmlns:OS-EXT-STS="http://docs.openstack.org/compute/ext/extended_status/api/v1.1" xmlns:atom="http://www.w3.org/2005/Atom">
        <image id="8dbf51b8-8fcd-4218-823c-62b4b79acd0b">
            <atom:link href="http://region-a.geo-1.compute.hpcloudsvc.com/10424127775376/images/8dbf51b8-8fcd-4218-823c-62b4b79acd0b" rel="bookmark"/>
        </image>
        <flavor id="101">
            <atom:link href="http://region-a.geo-1.compute.hpcloudsvc.com/10424127775376/flavors/101" rel="bookmark"/>
        </flavor>
        <metadata>
            <meta key="id">25</meta>
        </metadata>
        <addresses>
            <network id="default">
                <ip addr="15.184.40.12" version="4"/>
            </network>
        </addresses>
        <atom:link href="http://region-a.geo-1.compute.hpcloudsvc.com/v2/10424127775376/servers/fead84c5-f1f3-4dbf-afe2-a84e9127e2b6" rel="self"/>
        <atom:link href="http://region-a.geo-1.compute.hpcloudsvc.com/10424127775376/servers/fead84c5-f1f3-4dbf-afe2-a84e9127e2b6" rel="bookmark"/>
        <security_groups>
            <security_group name="default"/>
        </security_groups>
    </server>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/10424127775376/servers/10957921068964' 

#### 4.4.4 Console Output ####
##### 4.4.4.1 Get Console Output. ##### {#getConsoleOutput}
##### POST /v2/{project_id}/servers/{server_id}/action #####

Get the console output for a server instance.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account in a multi-tenancy cloud. </p>
</li>
<li><p><em>server_id</em> - Server id. This parameter can be an integer id or a UUID. In either case, the specified server must be in the addressed Availability Zone. </p>
</li>
</ul>

**Request Parameters**

<ul>
<li><p><em>length</em> - Number of lines to fetch from end of console log. </p>
</li>
</ul>

**Data Parameters**

JSON

    {
        "os-getConsoleOutput": {
            "length": 50
        }
    }

XML

    <?xml version="1.0" ?>
    <os-getConsoleOutput>
        <length>
            50
        </length>
    </os-getConsoleOutput>

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "output": "Begin: Loading essential drivers ... done.\r\n[    0.845263] udevd[79]: starting version 173\r\nBegin: Running /scripts/init-premount ... done.\r\nBegin: Mounting root file system ... Begin: Running /scripts/local-top ... done.\r\n[    0.960487] FDC 0 is a S82078B\r\nBegin: Running /scripts/local-premount ... done.\r\n[    1.045440] EXT4-fs (vda1): INFO: recovery required on readonly filesystem\r\n[    1.046550] EXT4-fs (vda1): write access will be enabled during recovery\r\n[    1.128786] Refined TSC clocksource calibration: 2666.693 MHz.\r\n[    1.317845] EXT4-fs (vda1): recovery complete\r\n[    1.319330] EXT4-fs (vda1): mounted filesystem with ordered data mode. Opts: (null)\r\nBegin: Running /scripts/local-bottom ... done.\r\ndone.\r\nBegin: Running /scripts/init-bottom ... done.\r\n[    3.147572] udevd[313]: starting version 173\r\nlxcmount stop/pre-start, process 228\r\r\nfsck from util-linux 2.19.1\r\r\nephemeral0: recovering journal\r\r\nephemeral0 has gone 186 days without being checked, check forced.\r\r\ncloud-init start-local running: Wed, 31 Oct 2012 03:59:50 +0000. up 5.98 seconds\r\r\nno instance data found in start-local\r\r\nci-info: lo    : 1 127.0.0.1       255.0.0.0       \r\r\nci-info: eth0  : 1 10.4.15.127     255.254.0.0     02:16:3e:58:ff:18\r\r\nci-info: route-0: 0.0.0.0         10.4.0.1        0.0.0.0         eth0   UG\r\r\nci-info: route-1: 10.4.0.0        0.0.0.0         255.254.0.0     eth0   U\r\r\ncloud-init start running: Wed, 31 Oct 2012 03:59:51 +0000. up 6.31 seconds\r\r\nmountall: Event failed\r\r\nChecking disk drives for errors. This may take several minutes.\r\r\nPress C to cancel all checks in progress\r\r\n * Stopping Handle applying cloud-config\u001b[74G[ OK ]\r\r\n * Starting AppArmor profiles       \u001b[80G \r\u001b[74G[ OK ]\r\r\nChecking for running unattended-upgrades: \r\r\n * Stopping Failsafe Boot Delay\u001b[74G[ OK ]\r\r\n * Stopping System V initialisation compatibility\u001b[74G[ OK ]\r\r\n * Starting System V runlevel compatibility\u001b[74G[ OK ]\r\r\n * Stopping automatic crash report generation\u001b[74G[\u001b[31mfail\u001b[39;49m]\r\r\n * Starting save kernel messages\u001b[74G[ OK ]\r\r\n * Starting regular background program processing daemon\u001b[74G[ OK ]\r\r\n * Starting deferred execution scheduler\u001b[74G[ OK ]\r\r\n * Stopping save kernel messages\u001b[74G[ OK ]\r\r\n * Starting CPU interrupts balancing daemon\u001b[74G[ OK ]\r\r\nlandscape-client is not configured, please run landscape-config.\r\r\n * Stopping System V runlevel compatibility\u001b[74G[ OK ]\r\r\n * Starting execute cloud user/final scripts\u001b[74G[ OK ]\r\r\nmountall: Plymouth command failed\r\nmountall: Disconnected from Plymouth\r\ncloud-init boot finished at Wed, 31 Oct 2012 03:59:53 +0000. Up 8.90 seconds\r\nephemeral0: 11/1310720 files (0.0% non-contiguous), 126322/5242880 blocks\r\n"
    }

XML

    <output>
        Begin: Loading essential drivers ... done.
    [    0.845263] udevd[79]: starting version 173
    Begin: Running /scripts/init-premount ... done.
    Begin: Mounting root file system ... Begin: Running /scripts/local-top ... done.
    [    0.960487] FDC 0 is a S82078B
    Begin: Running /scripts/local-premount ... done.
    [    1.045440] EXT4-fs (vda1): INFO: recovery required on readonly filesystem
    [    1.046550] EXT4-fs (vda1): write access will be enabled during recovery
    [    1.128786] Refined TSC clocksource calibration: 2666.693 MHz.
    [    1.317845] EXT4-fs (vda1): recovery complete
    [    1.319330] EXT4-fs (vda1): mounted filesystem with ordered data mode. Opts: (null)
    Begin: Running /scripts/local-bottom ... done.
    done.
    Begin: Running /scripts/init-bottom ... done.
    [    3.147572] udevd[313]: starting version 173
    lxcmount stop/pre-start, process 228
    fsck from util-linux 2.19.1
    ephemeral0: recovering journal
    ephemeral0 has gone 186 days without being checked, check forced.
    cloud-init start-local running: Wed, 31 Oct 2012 03:59:50 +0000. up 5.98 seconds
    no instance data found in start-local
    ci-info: lo    : 1 127.0.0.1       255.0.0.0       
    ci-info: eth0  : 1 10.4.15.127     255.254.0.0     02:16:3e:58:ff:18
    ci-info: route-0: 0.0.0.0         10.4.0.1        0.0.0.0         eth0   UG
    ci-info: route-1: 10.4.0.0        0.0.0.0         255.254.0.0     eth0   U
    cloud-init start running: Wed, 31 Oct 2012 03:59:51 +0000. up 6.31 seconds
     mountall: Event failed
    Checking disk drives for errors. This may take several minutes.
    Press C to cancel all checks in progress
     * Stopping Handle applying cloud-config                                 [ OK ]
     * Starting AppArmor profiles                                            [ OK ]
    Checking for running unattended-upgrades: 
     * Stopping Failsafe Boot Delay                                          [ OK ]
     * Stopping System V initialisation compatibility                        [ OK ]
     * Starting System V runlevel compatibility                              [ OK ]
     * Stopping automatic crash report generation                            [fail]
     * Starting save kernel messages                                         [ OK ]
     * Starting regular background program processing daemon                 [ OK ]
     * Starting deferred execution scheduler                                 [ OK ]
     * Stopping save kernel messages                                         [ OK ]
     * Starting CPU interrupts balancing daemon                              [ OK ]
    landscape-client is not configured, please run landscape-config.
     * Stopping System V runlevel compatibility                              [ OK ]
     * Starting execute cloud user/final scripts                             [ OK ]
    mountall: Plymouth command failed
    mountall: Disconnected from Plymouth
    cloud-init boot finished at Wed, 31 Oct 2012 03:59:53 +0000. Up 8.90 seconds
    ephemeral0: 11/1310720 files (0.0% non-contiguous), 126322/5242880 blocks
    </output>

**Curl Example**

    curl -i -X 'POST'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' -d '{"os-getConsoleOutput": {"length": 50}}' {BaseURI}/v2/11692683195772/servers/330579/action'

#### 4.4.5 Extended Availability Zone ####
##### 4.4.5.1 List With Availability Zone ##### {#listWithaz}
##### GET /v2/{project_id}/servers/detail #####

This extends the [List Servers Detail](#listDetailServers) operation with availability zone information. Each server result includes the attribute OS-EXT-AZ:availability_zone giving the name of the availability zone containing the server.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
</ul>

**Data Parameters**

This call does not require a request body.

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "servers": [
            {
                "OS-EXT-AZ:availability_zone": "az1",
               "accessIPv4": "",
                "accessIPv6": "",
                "addresses": {
                    "default": [
                        {
                            "addr": "16.24.24.2",
                            "version": 4
                        }
                    ]
                },
                "created": "2013-05-10T12:40:43Z",
                "flavor": {
                    "id": "101",
                    "links": [
                        {
                            "href": "http://compute.systestb.hpcloud.net/10424127775376/flavors/101",
                            "rel": "bookmark"
                        }
                    ]
                },
                "hostId": "7d9b3edec861c4a351970b88195016e701765ba9daad9fadad637d1f",
                "id": "129e43cb-82ad-48b5-860a-372d67ca85f6",
                "image": {
                    "id": "8dbf51b8-8fcd-4218-823c-62b4b79acd0b",
                    "links": [
                        {
                            "href": "http://compute.systestb.hpcloud.net/10424127775376/images/8dbf51b8-8fcd-4218-823c-62b4b79acd0b",
                            "rel": "bookmark"
                        }
                    ]
                },
                "key_name": "key-10",
                "links": [
                    {
                        "href": "http://compute.systestb.hpcloud.net/v2/10424127775376/servers/129e43cb-82ad-48b5-860a-372d67ca85f6",
                        "rel": "self"
                    },
                    {
                        "href": "http://compute.systestb.hpcloud.net/10424127775376/servers/129e43cb-82ad-48b5-860a-372d67ca85f6",
                        "rel": "bookmark"
                    }
                ],
                "name": "server-1",
                "progress": 0,
                "security_groups": [
                    {
                        "name": "default"
                    }
                ],
                "status": "ACTIVE",
                "tenant_id": "36991859863737",
                "updated": "2013-05-10T12:40:53Z",
                "user_id": "10957921068964"
            }
        ]
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <servers xmlns="http://docs.openstack.org/compute/api/v1.1" xmlns:OS-EXT-AZ="http://docs.openstack.org/compute/ext/extended_availability_zone/api/v2" xmlns:atom="http://www.w3.org/2005/Atom">
        <server OS-EXT-AZ:availability_zone="az1"
               accessIPv4=""
               accessIPv6=""
               created="2013-05-10T12:40:43Z"
               hostId=""
               id="44e39c34-7ec8-4b69-bb85-315fdc1bb3ae"
               key_name="key-10"
               name="server-1"
               progress="0"
               status="ACTIVE"
               tenantId="10389545063147"
               updated="2013-05-10T12:40:53Z"
               userId="10957921068964">
            <image id="8dbf51b8-8fcd-4218-823c-62b4b79acd0b">
                <atom:link href="http://compute.systestb.hpcloud.net/10424127775376/images/8dbf51b8-8fcd-4218-823c-62b4b79acd0b" rel="bookmark"/>
            </image>
            <flavor id="101">
                <atom:link href="http://compute.systestb.hpcloud.net/10424127775376/flavors/101" rel="bookmark"/>
            </flavor>
            <addresses/>
                <network id="default">
                    <ip version="4" addr="16.24.24.2"/>
                </network>
            <atom:link href="http://compute.systestb.hpcloud.net/v2/10424127775376/servers/129e43cb-82ad-48b5-860a-372d67ca85f6" rel="self"/>
            <atom:link href="http://compute.systestb.hpcloud.net/10424127775376/servers/129e43cb-82ad-48b5-860a-372d67ca85f6" rel="bookmark"/>
            <security_groups>
                <security_group name="default"/>
            </security_groups>
        </server>
    <servers>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/servers/detail'

##### 4.4.5.2 Get With Availability Zone ##### {#getWithaz}
##### GET /v2/{project_id}/servers/{server_id} #####

This extends the [List Servers Detail](#listDetailServers) operation with availability zone information. Each server result includes the attribute OS-EXT-AZ:availability_zone giving the name of the availability zone containing the server.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account in a multi-tenancy cloud. </p>
</li>
<li><p><em>server_id</em> - Server ID. This parameter can be an integer ID or a UUID. In either case, the specified server must be in the addressed Availability Zone. </p>
</li>
</ul>

**Data Parameters**

This call does not require a request body.

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "server": {
                "OS-EXT-AZ:availability_zone": "az1",
               "accessIPv4": "",
                "accessIPv6": "",
                "addresses": {
                    "default": [
                        {
                            "addr": "16.24.24.2",
                            "version": 4
                        }
                    ]
                },
                "created": "2013-05-10T12:40:43Z",
                "flavor": {
                    "id": "101",
                    "links": [
                        {
                            "href": "http://compute.systestb.hpcloud.net/10424127775376/flavors/101",
                            "rel": "bookmark"
                        }
                    ]
                },
                "hostId": "7d9b3edec861c4a351970b88195016e701765ba9daad9fadad637d1f",
                "id": "129e43cb-82ad-48b5-860a-372d67ca85f6",
                "image": {
                    "id": "8dbf51b8-8fcd-4218-823c-62b4b79acd0b",
                    "links": [
                        {
                            "href": "http://compute.systestb.hpcloud.net/10424127775376/images/8dbf51b8-8fcd-4218-823c-62b4b79acd0b",
                            "rel": "bookmark"
                        }
                    ]
                },
                "key_name": "key-10",
                "links": [
                    {
                        "href": "http://compute.systestb.hpcloud.net/v2/10424127775376/servers/129e43cb-82ad-48b5-860a-372d67ca85f6",
                        "rel": "self"
                    },
                    {
                        "href": "http://compute.systestb.hpcloud.net/10424127775376/servers/129e43cb-82ad-48b5-860a-372d67ca85f6",
                        "rel": "bookmark"
                    }
                ],
                "name": "server-1",
                "progress": 0,
                "security_groups": [
                    {
                        "name": "default"
                    }
                ],
                "status": "ACTIVE",
                "tenant_id": "36991859863737",
                "updated": "2013-05-10T12:40:53Z",
                "user_id": "10957921068964"
            }
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <server xmlns="http://docs.openstack.org/compute/api/v1.1" xmlns:OS-EXT-AZ="http://docs.openstack.org/compute/ext/extended_availability_zone/api/v2" xmlns:atom="http://www.w3.org/2005/Atom"
             OS-EXT-AZ:availability_zone="az1"
             accessIPv4=""
             accessIPv6=""
             created="2013-05-10T12:40:43Z"
             hostId=""
             id="44e39c34-7ec8-4b69-bb85-315fdc1bb3ae"
             key_name="key-10"
             name="server-1"
             progress="0"
             status="ACTIVE"
             tenantId="10389545063147"
             updated="2013-05-10T12:40:53Z"
             userId="10957921068964">
        <image id="8dbf51b8-8fcd-4218-823c-62b4b79acd0b">
            <atom:link href="http://compute.systestb.hpcloud.net/10424127775376/images/8dbf51b8-8fcd-4218-823c-62b4b79acd0b" rel="bookmark"/>
        </image>
        <flavor id="101">
            <atom:link href="http://compute.systestb.hpcloud.net/10424127775376/flavors/101" rel="bookmark"/>
        </flavor>
        <addresses/>
            <network id="default">
                <ip version="4" addr="16.24.24.2"/>
            </network>
        <atom:link href="http://compute.systestb.hpcloud.net/v2/10424127775376/servers/129e43cb-82ad-48b5-860a-372d67ca85f6" rel="self"/>
        <atom:link href="http://compute.systestb.hpcloud.net/10424127775376/servers/129e43cb-82ad-48b5-860a-372d67ca85f6" rel="bookmark"/>
        <security_groups>
            <security_group name="default"/>
        </security_groups>
    </server>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/servers/129e43cb-82ad-48b5-860a-372d67ca85f6'

#### 4.4.6 Extended Status ####
##### 4.4.6.1 List Extended Server Status ##### {#listExtendedServerStatus}
##### GET /v2/{project_id}/servers/detail #####

This extends the [List Servers Detail](#listDetailServers) operation with additional status information. Each server result includes the attribute OS-EXT_STS:power_state, OS-EXT-STS:task_state, and OS-EXT-STS:vm_state.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
</ul>

**Data Parameters**

This call does not require a request body.

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "servers": [
            {
                "OS-EXT-STS:power_state": 1,
                "OS-EXT-STS:task_state": null,
                "OS-EXT-STS:vm_state": "active",
                "accessIPv4": "",
                "accessIPv6": "",
                "addresses": {
                    "default": [
                        {
                            "addr": "16.24.24.2",
                            "version": 4
                        }
                    ]
                },
                "created": "2013-05-10T12:40:43Z",
                "flavor": {
                    "id": "101",
                    "links": [
                        {
                            "href": "http://compute.systestb.hpcloud.net/10424127775376/flavors/101",
                            "rel": "bookmark"
                        }
                    ]
                },
                "hostId": "7d9b3edec861c4a351970b88195016e701765ba9daad9fadad637d1f",
                "id": "129e43cb-82ad-48b5-860a-372d67ca85f6",
                "image": {
                    "id": "8dbf51b8-8fcd-4218-823c-62b4b79acd0b",
                    "links": [
                        {
                            "href": "http://compute.systestb.hpcloud.net/10424127775376/images/8dbf51b8-8fcd-4218-823c-62b4b79acd0b",
                            "rel": "bookmark"
                        }
                    ]
                },
                "key_name": "key-10",
                "links": [
                    {
                        "href": "http://compute.systestb.hpcloud.net/v2/10424127775376/servers/129e43cb-82ad-48b5-860a-372d67ca85f6",
                        "rel": "self"
                    },
                    {
                        "href": "http://compute.systestb.hpcloud.net/10424127775376/servers/129e43cb-82ad-48b5-860a-372d67ca85f6",
                        "rel": "bookmark"
                    }
                ],
                "name": "server-1",
                "progress": 0,
                "security_groups": [
                    {
                        "name": "default"
                    }
                ],
                "status": "ACTIVE",
                "tenant_id": "36991859863737",
                "updated": "2013-05-10T12:40:53Z",
                "user_id": "10957921068964"
            }
        ]
    }

XML
         
    <?xml version="1.0" encoding="UTF-8"?>
    <servers xmlns="http://docs.openstack.org/compute/api/v1.1" xmlns:OS-EXT-STS="http://docs.openstack.org/compute/ext/extended_status/api/v1.1" xmlns:atom="http://www.w3.org/2005/Atom">
        <server OS-EXT-STS:power_state="1"
                 OS-EXT-STS:task_state=""
                 OS-EXT-STS:vm_state="active"
                 accessIPv4=""
                 accessIPv6=""
                 created="2013-05-10T12:40:43Z"
                 hostId=""
                 id="44e39c34-7ec8-4b69-bb85-315fdc1bb3ae"
                 key_name="key-10"
                 name="server-1"
                 progress="0"
                 status="ACTIVE"
                 tenantId="10389545063147"
                 updated="2013-05-10T12:40:53Z"
                 userId="10957921068964">
            <image id="8dbf51b8-8fcd-4218-823c-62b4b79acd0b">
                <atom:link href="http://compute.systestb.hpcloud.net/10424127775376/images/8dbf51b8-8fcd-4218-823c-62b4b79acd0b" rel="bookmark"/>
            </image>
            <flavor id="101">
                <atom:link href="http://compute.systestb.hpcloud.net/10424127775376/flavors/101" rel="bookmark"/>
            </flavor>
            <addresses/>
                <network id="default">
                    <ip version="4" addr="16.24.24.2"/>
                </network>
            <atom:link href="http://compute.systestb.hpcloud.net/v2/10424127775376/servers/129e43cb-82ad-48b5-860a-372d67ca85f6" rel="self"/>
            <atom:link href="http://compute.systestb.hpcloud.net/10424127775376/servers/129e43cb-82ad-48b5-860a-372d67ca85f6" rel="bookmark"/>
            <security_groups>
                <security_group name="default"/>
            </security_groups>
        </server>
    </servers>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/servers/detail'

##### 4.4.6.2 Get Extended Server Status ##### {#getExtendedServerStatus}
##### GET /v2/{project_id}/servers/{server_id} #####

This extends the [List Servers Detail](#listDetailServers) operation with availability zone information. Each server result includes the attribute OS-EXT-AZ:availability_zone giving the name of the availability zone containing the server.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account in a multi-tenancy cloud. </p>
</li>
<li><p><em>server_id</em> - Server ID. This parameter can be an integer ID or a UUID. In either case, the specified server must be in the addressed Availability Zone. </p></li>
</ul>

**Data Parameters**

This call does not require a request body.

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "server": {
            "OS-EXT-STS:power_state": 1,
            "OS-EXT-STS:task_state": null,
            "OS-EXT-STS:vm_state": "active",
            "accessIPv4": "",
            "accessIPv6": "",
            "addresses": {
                "default": [
                    {
                        "addr": "16.24.24.2",
                        "version": 4
                    }
                ]
            },
            "created": "2013-05-10T12:40:43Z",
            "flavor": {
                "id": "101",
                "links": [
                    {
                        "href": "http://compute.systestb.hpcloud.net/10424127775376/flavors/101",
                        "rel": "bookmark"
                    }
                ]
            },
            "hostId": "7d9b3edec861c4a351970b88195016e701765ba9daad9fadad637d1f",
            "id": "129e43cb-82ad-48b5-860a-372d67ca85f6",
            "image": {
                "id": "8dbf51b8-8fcd-4218-823c-62b4b79acd0b",
                "links": [
                    {
                        "href": "http://compute.systestb.hpcloud.net/10424127775376/images/8dbf51b8-8fcd-4218-823c-62b4b79acd0b",
                        "rel": "bookmark"
                    }
                ]
            },
            "key_name": "key-10",
            "links": [
                {
                    "href": "http://compute.systestb.hpcloud.net/v2/10424127775376/servers/129e43cb-82ad-48b5-860a-372d67ca85f6",
                    "rel": "self"
                },
                {
                    "href": "http://compute.systestb.hpcloud.net/10424127775376/servers/129e43cb-82ad-48b5-860a-372d67ca85f6",
                    "rel": "bookmark"
                }
            ],
            "name": "server-1",
            "progress": 0,
            "security_groups": [
                {
                    "name": "default"
                }
            ],
            "status": "ACTIVE",
            "tenant_id": "36991859863737",
            "updated": "2013-05-10T12:40:53Z",
            "user_id": "10957921068964"
        }
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <server xmlns="http://docs.openstack.org/compute/api/v1.1" xmlns:OS-EXT-STS="http://docs.openstack.org/compute/ext/extended_status/api/v1.1" xmlns:atom="http://www.w3.org/2005/Atom"
             OS-EXT-STS:power_state="1"
             OS-EXT-STS:task_state=""
             OS-EXT-STS:vm_state="active"
             accessIPv4=""
             accessIPv6=""
             created="2013-05-10T12:40:43Z"
             hostId=""
             id="44e39c34-7ec8-4b69-bb85-315fdc1bb3ae"
             key_name="key-10"
             name="server-1"
             progress="0"
             status="ACTIVE"
             tenantId="10389545063147"
             updated="2013-05-10T12:40:53Z"
             userId="10957921068964">
        <image id="8dbf51b8-8fcd-4218-823c-62b4b79acd0b">
            <atom:link href="http://compute.systestb.hpcloud.net/10424127775376/images/8dbf51b8-8fcd-4218-823c-62b4b79acd0b" rel="bookmark"/>
        </image>
        <flavor id="101">
            <atom:link href="http://compute.systestb.hpcloud.net/10424127775376/flavors/101" rel="bookmark"/>
        </flavor>
        <addresses/>
            <network id="default">
                <ip version="4" addr="16.24.24.2"/>
            </network>
        <atom:link href="http://compute.systestb.hpcloud.net/v2/10424127775376/servers/129e43cb-82ad-48b5-860a-372d67ca85f6" rel="self"/>
        <atom:link href="http://compute.systestb.hpcloud.net/10424127775376/servers/129e43cb-82ad-48b5-860a-372d67ca85f6" rel="bookmark"/>
        <security_groups>
            <security_group name="default"/>
        </security_groups>
    </server>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/servers/129e43cb-82ad-48b5-860a-372d67ca85f6'

#### 4.4.7 Flavor Extra Data ####
##### 4.4.7.1 List Flavors Data ##### {#listDataFlavors}
##### GET /v2/{project_id}/flavors/detail #####

Extends the flavor operation [List Flavors Detail](#listDetailFlavors) by adding to each flavor the OS-FLV-EXT-DATA:ephemeral attribute defining the size in GB of an ephemeral disk.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "flavors": [
            {
                "id": 100,
                "links": [
                    {
                        "href": "https://region-a.geo-1.compute.hpcloudsvc.com/v2/36991859863737/flavors/100",
                        "rel": "self"
                    },
                    {
                        "href": "https://region-a.geo-1.compute.hpcloudsvc.com/36991859863737/flavors/100",
                        "rel": "bookmark"
                    }
                ],
                "name": "standard.xsmall",
                "OS-FLV-EXT-DATA:ephemeral": 10
            },
            {
                "id": 101,
                "links": [
                    {
                        "href": "https://region-a.geo-1.compute.hpcloudsvc.com/v2/36991859863737/flavors/101",
                        "rel": "self"
                    },
                    {
                        "href": "https://region-a.geo-1.compute.hpcloudsvc.com/36991859863737/flavors/101",
                        "rel": "bookmark"
                    }
                ],
                "name": "standard.small",
                "OS-FLV-EXT-DATA:ephemeral": 20
            }
         ]
    }

XML

    <flavors xmlns="http://docs.openstack.org/compute/api/v2" xmlns:OS-FLV-EXT-DATA="http://docs.openstack.org/compute/ext/flavor_extra_data/api/v1.1" xmlns:atom="http://www.w3.org/2005/Atom">
        <flavor id="100" name="standard.xsmall" OS-FLV-EXT-DATA:ephemeral="10">
            <atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/v2/36991859863737/flavors/100" rel="self"/>
            <atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/36991859863737/flavors/100" rel="bookmark"/>
        </flavor>
        <flavor id="101" name="standard.small" OS-FLV-EXT-DATA:ephemeral="20">
            <atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/v2/36991859863737/flavors/101" rel="self"/>
            <atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/36991859863737/flavors/101" rel="bookmark"/>
        </flavor>
    </flavors>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/flavors/detail'

##### 4.4.7.2 Flavor Extra Data ##### {#getFlavorData}
##### GET /v2/{project_id}/flavors/{flavor_id} #####

Extends the flavor operation [Get Flavor Details](#getFlavor) by adding the OS-FLV-EXT-DATA:ephemeral attribute defining the size in GB of an ephemeral disk.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account</p></li>
<li><p><em>flavor_id</em> - The ID for the flavor. </p></li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "flavors": [
            {
                "id": 100,
                "links": [
                    {
                        "href": "https://region-a.geo-1.compute.hpcloudsvc.com/v2/36991859863737/flavors/100",
                        "rel": "self"
                    },
                    {
                        "href": "https://region-a.geo-1.compute.hpcloudsvc.com/36991859863737/flavors/100",
                        "rel": "bookmark"
                    }
                ],
                "name": "standard.xsmall",
                "OS-FLV-EXT-DATA:ephemeral": 10
            }
         ]
    }

XML

    <flavors xmlns="http://docs.openstack.org/compute/api/v2" xmlns:OS-FLV-EXT-DATA="http://docs.openstack.org/compute/ext/flavor_extra_data/api/v1.1" xmlns:atom="http://www.w3.org/2005/Atom">
        <flavor id="100" name="standard.xsmall" OS-FLV-EXT-DATA:ephemeral="10">
            <atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/v2/36991859863737/flavors/100" rel="self"/>
            <atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/36991859863737/flavors/100" rel="bookmark"/>
        </flavor>
    </flavors>

**Curl Example**

    curl -i -X 'GET' -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/flavors/100'

#### 4.4.8 Floating IPs ####
##### 4.4.8.1 Add Floating Ip ##### {#addFloatingIp}
##### POST /v2/{project_id}/servers/{server_id}/action #####

Adds the specified floating IP to the server. The floating IP must have been previously allocated with <em>Allocate Floating Ip</em>.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account.</p></li>
<li><p><em>server_id</em> - Server ID. This parameter can be an integer ID or a UUID. In either case, the specified server must be in the addressed Availability Zone.</p></li>
</ul>

**Request Parameters**

<ul>
<li><p><em>address</em> (required) - The address to add to the server. This address must have been previously allocated with <em>Allocate Floating Ip</em>. </p>
</li>
</ul>

**Data Parameters**

JSON

    {
        "addFloatingIp": {
            "address": "15.185.230.113"
        }
    }

XML

    <?xml version="1.0" ?>
    <addFloatingIp xmlns="http://docs.openstack.org/compute/api/v2">
        <address>
            15.185.230.99
        </address>
    </addFloatingIp>

**Response Data**

Normal Response Code(s): 202

**Curl Example**

    curl -i -X 'POST'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' -d '{"addFloatingIp": {"address": "15.185.230.113"}}' {BaseURI}/v2/{project_id}/servers/233691/action'

##### 4.4.8.2 Remove Floating Ip ##### {#removeFloatingIp}
##### POST /v2/{project_id}/servers/{server_id}/action #####

Removes the specified floating IP from the server. Only floating IPs which have been explicitly added to the server using <em>Add Floating Ip</em> can be removed.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
<li><p><em>server_id</em> - Server ID. This parameter can be an integer ID or a UUID. In either case, the specified server must be in the addressed Availability Zone. </p>
</li>
</ul>

**Request Parameters**

<ul>
<li><p><em>address</em> (required) - The address to be removed from the server. This address must have previously been added to the server using <em>Add Floating Ip</em> </p></li>
</ul>

**Data Parameters**

JSON

    {
        "removeFloatingIp": {
            "address": "15.185.230.113"
        }
    }

XML

    <?xml version="1.0" ?>
    <removeFloatingIp xmlns="http://docs.openstack.org/compute/api/v2">
        <address>
            15.185.230.99
        </address>
    </removeFloatingIp>

**Response Data**

Normal Response Code(s): 202

**Curl Example**

    curl -i -X 'POST'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' -d '{"removeFloatingIp": {"address": "15.185.230.113"}}' {BaseURI}/v2/{project_id}/servers/233691/action'

##### 4.4.8.3 List Floating IPs ##### {#listFloatingIPs}
##### GET /v2/{project_id}/os-floating-ips #####

Lists floating IP addresses associated with the project or account.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account.</p></li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "floating_ips": [
            {
                "fixed_ip": null,
                "id": 980,
                "instance_id": null,
                "ip": "15.185.227.211"
            },
            {
                "fixed_ip": null,
                "id": 1146,
                "instance_id": null,
                "ip": "15.185.228.121"
            }
        ]
    }

XML

    <floating_ips xmlns="http://docs.openstack.org/compute/api/v2">
        <floating_ip>
            <instance_id>
                None
            </instance_id>
            <ip>
                15.185.227.211
            </ip>
            <fixed_ip>
                None
            </fixed_ip>
            <id>
                980
            </id>
        </floating_ip>
        <floating_ip>
            <instance_id>
                None
            </instance_id>
            <ip>
                15.185.228.121
            </ip>
            <fixed_ip>
                None
            </fixed_ip>
            <id>
                1146
            </id>
        </floating_ip>
    </floating_ips>

**Curl Example**

    curl -i -X 'GET' -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/os-floating-ips'

##### 4.4.8.4 Allocate Floating IP ##### {#allocateFloatingIP}
##### POST /v2/{project_id}/os-floating-ips #####

Allocate a new floating IP address to a project or account.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "floating_ip": {
            "fixed_ip": null,
            "id": 980,
            "instance_id": null,
            "ip": "15.185.227.211"
        }
    }

XML

    <floating_ip xmlns="http://docs.openstack.org/compute/api/v2">
        <instance_id>
            None
        </instance_id>
        <ip>
            15.185.228.121
        </ip>
        <fixed_ip>
            None
        </fixed_ip>
        <id>
            1146
        </id>
    </floating_ip>

**Curl Example**

    curl -i -X 'POST'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/os-floating-ips'

##### 4.4.8.5 Get Floating Ip ##### {#getFloatingIP}
##### GET /v2/{project_id}/os-floating-ips/{id} #####

Get information about the specified floating IP.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
<li><p><em>id</em> (required) - None - The unique identifier associated with allocated floating IP address. </p>
</li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "floating_ip": {
            "fixed_ip": null,
            "id": 1146,
            "instance_id": null,
            "ip": "15.185.228.121"
        }
    }

XML

    <floating_ip xmlns="http://docs.openstack.org/compute/api/v2">
        <instance_id>
            None
        </instance_id>
        <ip>
            15.185.228.121
        </ip>
        <fixed_ip>
            None
        </fixed_ip>
        <id>
            1146
        </id>
    </floating_ip>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/os-floating-ips/1146'

##### 4.4.8.6 Deallocate Floating IP ##### {#deallocateFloatingIP}
##### DELETE /v2/{project_id}/os-floating-ips/{id} #####

Deallocates the floating IP address associated with floating_IP_address_ID.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
<li><p><em>id</em> (required) - None - The unique identifier associated with allocated floating IP address. </p>
</li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 202

**Curl Example**

    curl -i -X 'DELETE'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/os-floating-ips/1677'

#### 4.4.9 Keypairs ####
##### 4.4.9.1 List Keypairs ##### {#listKeypairs}
##### GET /v2/{project_id}/os-keypairs

Lists keypairs associated with the project or account. Returns the name, public key and fingerprint of each keypair associated with the account.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "keypairs": [
            {
                "keypair": {
                    "fingerprint": "57:64:ca:c3:83:25:69:19:03:6f:d2:66:83:d6:6e:20",
                    "name": "hochmuth.pub",
                    "public_key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDRhFDIz1RJDgUW2tTRTZpJpbJyQbrUy586balui6Hj3g5I0Qogw42SRXr4EpM8S26M28OsfI3nfxPXQnJz41oUxutBrxaOo0wySinWE7imaDL7i4YE7pj8X3tPTDNzmmPI/VWheS97GwZcTdl3sI/wy4Fm/DOqU/DhpxmgfhKyOuhI65dNRglJN1RqQ6jc8i2egqAU5ZvDL1D9lBYjsKwwFtQXRU80DncbPdVtAITeR9X4CGsHKqTSAMbELfa4NZyX0y3AgYvJq9DpK1ySc5Y0f+iTuqvQvdsB69uTB8/n24ThV9GpiguashYlrWKcBKIxNcpEdg+Tla0zOPVro16x roland.hochmuth@hp.com"
                }
            },
            {
                "keypair": {
                    "fingerprint": "57:64:ca:c3:83:25:69:19:03:6f:d2:66:83:d6:6e:20",
                    "name": "key.pub",
                    "public_key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDRhFDIz1RJDgUW2tTRTZpJpbJyQbrUy586balui6Hj3g5I0Qogw42SRXr4EpM8S26M28OsfI3nfxPXQnJz41oUxutBrxaOo0wySinWE7imaDL7i4YE7pj8X3tPTDNzmmPI/VWheS97GwZcTdl3sI/wy4Fm/DOqU/DhpxmgfhKyOuhI65dNRglJN1RqQ6jc8i2egqAU5ZvDL1D9lBYjsKwwFtQXRU80DncbPdVtAITeR9X4CGsHKqTSAMbELfa4NZyX0y3AgYvJq9DpK1ySc5Y0f+iTuqvQvdsB69uTB8/n24ThV9GpiguashYlrWKcBKIxNcpEdg+Tla0zOPVro16x roland.hochmuth@hp.com\n"
                }
            },
            {
                "keypair": {
                    "fingerprint": "d3:e3:5f:26:dc:30:fc:04:57:91:ba:c0:1c:f8:8d:cd",
                    "name": "keypair-1",
                    "public_key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQChJO5vnbzIRU45LFdm5ohdFtIDQo1jPB1xSnWu2vJtyw5wGFjoclpuFLstPMRDixloNTh36ff3XnW6Nb4CTpm5Vwz0V6Im2q56vTbS246Lw0+3fDSrnmwFkuJ7rqI5AKZkN4zJg/iJdsuJ768K7yVzwMHP/FWy6bUdRZm5ETjM2w== \n"
                }
            },
            {
                "keypair": {
                    "fingerprint": "76:e3:b7:ca:95:91:fb:86:f7:fe:5d:d4:11:4d:77:65",
                    "name": "keypair-2",
                    "public_key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQDZcOCJGRF2REub4+j5Y6LnF7Lk4xyvpdeqAEZYRJe8lC0YOhkF9PxOAQnSgRuAvcmFiff9E1Dt9yLCSlU40zRClLEMwchG4S51y4JI/mbMwppWKYxgPnIa9rHSIccEtZbhBU1MkwpUHeRcZE+b60y5xXiYSmVacmtwDZ89qf6TvQ== \n"
                }
            }
        ]
    }

XML

    <keypairs xmlns="http://docs.openstack.org/compute/api/v2">
        <keypair>
            <keypair>
                <public_key>
                    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDRhFDIz1RJDgUW2tTRTZpJpbJyQbrUy586balui6Hj3g5I0Qogw42SRXr4EpM8S26M28OsfI3nfxPXQnJz41oUxutBrxaOo0wySinWE7imaDL7i4YE7pj8X3tPTDNzmmPI/VWheS97GwZcTdl3sI/wy4Fm/DOqU/DhpxmgfhKyOuhI65dNRglJN1RqQ6jc8i2egqAU5ZvDL1D9lBYjsKwwFtQXRU80DncbPdVtAITeR9X4CGsHKqTSAMbELfa4NZyX0y3AgYvJq9DpK1ySc5Y0f+iTuqvQvdsB69uTB8/n24ThV9GpiguashYlrWKcBKIxNcpEdg+Tla0zOPVro16x roland.hochmuth@hp.com
                </public_key>
                &#60;name>
                    hochmuth.pub
                </name>
                <fingerprint>
                    57:64:ca:c3:83:25:69:19:03:6f:d2:66:83:d6:6e:20
                </fingerprint>
            </keypair>
        </keypair>
        <keypair>
            <keypair>
                <public_key>
                    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDRhFDIz1RJDgUW2tTRTZpJpbJyQbrUy586balui6Hj3g5I0Qogw42SRXr4EpM8S26M28OsfI3nfxPXQnJz41oUxutBrxaOo0wySinWE7imaDL7i4YE7pj8X3tPTDNzmmPI/VWheS97GwZcTdl3sI/wy4Fm/DOqU/DhpxmgfhKyOuhI65dNRglJN1RqQ6jc8i2egqAU5ZvDL1D9lBYjsKwwFtQXRU80DncbPdVtAITeR9X4CGsHKqTSAMbELfa4NZyX0y3AgYvJq9DpK1ySc5Y0f+iTuqvQvdsB69uTB8/n24ThV9GpiguashYlrWKcBKIxNcpEdg+Tla0zOPVro16x roland.hochmuth@hp.com
                </public_key>
                &#60;name>
                    key.pub
                </name>
                <fingerprint>
                    57:64:ca:c3:83:25:69:19:03:6f:d2:66:83:d6:6e:20
                </fingerprint>
            </keypair>
        </keypair>
        <keypair>
            <keypair>
                <public_key>
                    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQChJO5vnbzIRU45LFdm5ohdFtIDQo1jPB1xSnWu2vJtyw5wGFjoclpuFLstPMRDixloNTh36ff3XnW6Nb4CTpm5Vwz0V6Im2q56vTbS246Lw0+3fDSrnmwFkuJ7rqI5AKZkN4zJg/iJdsuJ768K7yVzwMHP/FWy6bUdRZm5ETjM2w== 
                </public_key>
                &#60;name>
                    keypair-1
                </name>
                <fingerprint>
                    d3:e3:5f:26:dc:30:fc:04:57:91:ba:c0:1c:f8:8d:cd
                </fingerprint>
            </keypair>
        </keypair>
        <keypair>
            <keypair>
                <public_key>
                    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQDZcOCJGRF2REub4+j5Y6LnF7Lk4xyvpdeqAEZYRJe8lC0YOhkF9PxOAQnSgRuAvcmFiff9E1Dt9yLCSlU40zRClLEMwchG4S51y4JI/mbMwppWKYxgPnIa9rHSIccEtZbhBU1MkwpUHeRcZE+b60y5xXiYSmVacmtwDZ89qf6TvQ== 
                </public_key>
                &#60;name>
                    keypair-2
                </name>
                <fingerprint>
                    76:e3:b7:ca:95:91:fb:86:f7:fe:5d:d4:11:4d:77:65
                </fingerprint>
            </keypair>
        </keypair>
    </keypairs>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/os-keypairs'

##### 4.4.9.2 Create Keypair ##### {#createKeypair}
##### POST /v2/{project_id}/os-keypairs #####

Generate or import a keypair.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
</ul>

**Request Parameters**

<ul>
<li><p><em>name</em> (required) - The <em>name</em> to be associated with the keypair. </p>
</li>
<li><p><em>public_key</em> - The ssh <em>public_key</em> to import. If not provided, a keypair will be generated and both the public and private keys are returned to the user. </p>
</li>
</ul>

**Data Parameters**

JSON

    {
        "keypair": {
            "name": "keypair-1"
        }
    }

XML

    <?xml version="1.0" ?>
    <keypair>
        &#60;name>keypair-2</name>
    </keypair>

**Response Data**

Normal Response Code(s): 202

JSON

    {
        "keypair": {
            "fingerprint": "d3:e3:5f:26:dc:30:fc:04:57:91:ba:c0:1c:f8:8d:cd",
            "name": "keypair-1",
            "private_key": "-----BEGIN RSA PRIVATE KEY-----\nMIICXAIBAAKBgQChJO5vnbzIRU45LFdm5ohdFtIDQo1jPB1xSnWu2vJtyw5wGFjo\nclpuFLstPMRDixloNTh36ff3XnW6Nb4CTpm5Vwz0V6Im2q56vTbS246Lw0+3fDSr\nnmwFkuJ7rqI5AKZkN4zJg/iJdsuJ768K7yVzwMHP/FWy6bUdRZm5ETjM2wIDAQAB\nAoGAae+pgF8mWFKXliZ8Xv128BusfNAnuvEuOehFbWoqrdsr5q1a5ZUnte6TDq5A\nKFctoMA8GzkI9up2YrAp9cJOc+qYwNakMq1IQ/psxH7uga3Ey8aa3sTjUFK+rxMW\nZF5swcatcKiu7TzEgg5vcmfQr4r+547cihhWBKApEknt56ECQQDPEOq+aYhtthzg\ngisuYsOlB4bUpLTJUNZDLeO9UM7R5sIELblmOIfvoyqCY8bU4ZiPvMdFfkcajCva\nk51TIjcFAkEAxznWHyUfJEud5k2nJ8UUIAzDFv4YQEL25halw8tkl6bXxqnQ1Z44\njTVDAdsaIi9fVz8/0hQYDBlks41g6XZ6XwJBAK5uadGNxUfmqdzWytmAiZ9z/7kS\nJtmQJ27gMYFBmXhpE/fBLPVXmevdX+oHc2/Ru1sahCOehPdwLWEsCNQHdqECQGEg\nulp+z5rzXqzcKOVDuNcTQb2g7ZPO0e5FFlXJgGZLCiGpws2SkMGPOPbbqfcGn3W6\nuVOjRkIH00eSYrAPegMCQBpXlXHyLLNzmvnqQtSuC+efX90wcvsVPd1ytT7EHTSX\nv4gpK7hK3EyKStTsaADbYNjlh/mrMU2Q8Zlu7ybUI2Q=\n-----END RSA PRIVATE KEY-----\n",
            "public_key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQChJO5vnbzIRU45LFdm5ohdFtIDQo1jPB1xSnWu2vJtyw5wGFjoclpuFLstPMRDixloNTh36ff3XnW6Nb4CTpm5Vwz0V6Im2q56vTbS246Lw0+3fDSrnmwFkuJ7rqI5AKZkN4zJg/iJdsuJ768K7yVzwMHP/FWy6bUdRZm5ETjM2w== \n",
            "user_id": "13311562627589"
        }
    }

XML

    <keypair xmlns="http://docs.openstack.org/compute/api/v2">
        <public_key>
            ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQDZcOCJGRF2REub4+j5Y6LnF7Lk4xyvpdeqAEZYRJe8lC0YOhkF9PxOAQnSgRuAvcmFiff9E1Dt9yLCSlU40zRClLEMwchG4S51y4JI/mbMwppWKYxgPnIa9rHSIccEtZbhBU1MkwpUHeRcZE+b60y5xXiYSmVacmtwDZ89qf6TvQ== 
        </public_key>
        <private_key>
            -----BEGIN RSA PRIVATE KEY-----
    MIICXQIBAAKBgQDZcOCJGRF2REub4+j5Y6LnF7Lk4xyvpdeqAEZYRJe8lC0YOhkF
    9PxOAQnSgRuAvcmFiff9E1Dt9yLCSlU40zRClLEMwchG4S51y4JI/mbMwppWKYxg
    PnIa9rHSIccEtZbhBU1MkwpUHeRcZE+b60y5xXiYSmVacmtwDZ89qf6TvQIDAQAB
    AoGACJA2d4/CLUsxQxltsmynHLzFMdhz58L7RFmwa4eABlA7mmmnVKG6UgQec+jb
    wW04A4dUeeYJ2OVTvB0bUBqZQzdpHDb0wAu+y/LiQJ1cIvpLhXF7NSCmqjfLPHYQ
    KQEeTEaixl6gBenrgenPW+t2QDKsyL3mAnUU+9yYiWAJDg0CQQD1BWWgkp4t8Hk/
    l4JViymp4FCY9Vyp6h4uzO9Q7kKQiJk2ApeJHlShlw7VLaJJ/wJhj2P2881CaYPs
    zn5LcBR3AkEA4y8cqLOgHvlhQJ1ceC6fYkX/6TKtGo10ptHqhczZbQj8CbUiNAmA
    iFxlVRToyUI+lrI2vOdAHFMpXiwZ3qmqawJBANsqGa5Yl26mI/5Syn0z/m96Ov2m
    s101EgxwuTvd8uKPnOPny54V6EOl99mNeRXRKVMUzKjviNF3yk5+og9eUJ8CQFwT
    wifV9bXYGUSZAttq+gpYmKopceNrJbZfKhBkwFLi61P76ArzNvcNi7x6Jwc7JCbr
    wCe8Ck3wnrmeYjXOylUCQQDqwdYfAlkoWjxtJ8GfxmFteIQOUVopoLS4opRTNafw
    Naws/HNm7BwTeXRI+XgnFaIB+yxVMmzmh0/qRVEPEC/P
    -----END RSA PRIVATE KEY-----
        </private_key>
        <user_id>
            13311562627589
        </user_id>
        &#60;name>
            keypair-2
        </name>
        <fingerprint>
            76:e3:b7:ca:95:91:fb:86:f7:fe:5d:d4:11:4d:77:65
        </fingerprint>
    </keypair>

**Curl Example**

    curl -i -X 'POST'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' -d '{"keypair": {"name": "keypair-1"}}' {BaseURI}/v2/{project_id}/os-keypairs'

##### 4.4.9.3 Get Keypair ##### {#getKeypair}
##### GET /v2/{project_id}/os-keypairs/{keypair_name} #####

Get the public key and fingerprint for the specified keypair.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
<li><p><em>keypair_name</em> (required) - The name associated with a keypair. </p>
</li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "keypair": {
            "fingerprint": "d3:e3:5f:26:dc:30:fc:04:57:91:ba:c0:1c:f8:8d:cd",
            "name": "keypair-1",
            "public_key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQChJO5vnbzIRU45LFdm5ohdFtIDQo1jPB1xSnWu2vJtyw5wGFjoclpuFLstPMRDixloNTh36ff3XnW6Nb4CTpm5Vwz0V6Im2q56vTbS246Lw0+3fDSrnmwFkuJ7rqI5AKZkN4zJg/iJdsuJ768K7yVzwMHP/FWy6bUdRZm5ETjM2w== \n"
        }
    }

XML

    <keypair xmlns="http://docs.openstack.org/compute/api/v2">
        <public_key>
            ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQChJO5vnbzIRU45LFdm5ohdFtIDQo1jPB1xSnWu2vJtyw5wGFjoclpuFLstPMRDixloNTh36ff3XnW6Nb4CTpm5Vwz0V6Im2q56vTbS246Lw0+3fDSrnmwFkuJ7rqI5AKZkN4zJg/iJdsuJ768K7yVzwMHP/FWy6bUdRZm5ETjM2w== 
        </public_key>
        &#60;name>
            keypair-1
        </name>
        <fingerprint>
            d3:e3:5f:26:dc:30:fc:04:57:91:ba:c0:1c:f8:8d:cd
        </fingerprint>
    </keypair>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/os-keypairs/keypair-1'

##### 4.4.9.4 Delete Keypair ##### {#deleteKeypair}
##### DELETE /v2/{project_id}/os-keypairs/{keypair_name} #####

Delete the specified keypair.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
<li><p><em>keypair_name</em> (required) - The name associated with a keypair. </p>
</li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 202

**Curl Example**

    curl -i -X 'DELETE' -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/os-keypairs/keypair-1'

#### 4.4.10 Scheduler Hints ####
##### 4.4.10.1 Create Server With Hints ##### {#CreateServerWithHints}
##### POST /v2/{project_id}/servers #####

Extends the operation [Create Server](#createServer) to allow the user to specify additional information that the scheduler may use in scheduling the server. The information is provided in the form of key/value pairs.

**Request Data**

<ul>
<li><p><em>OS-SCH-HINTS:scheduler_hints</em> - A block of attributes and values that represent the information to be used by the scheduler. </p>
</li>
</ul>

**Data Parameters**

JSON

    {
        "server": {
            "name": "new-server-test",
            "imageRef": "70a599e0-31e7-49b7-b260-868f441e862b",
            "flavorRef": "103"
        },
        "OS-SCH-HNT:scheduler_hints": {
            "near": "2b7c42eb-7736-4a0f-afab-f23969a35ada"
        }
    }

XML

    <server xmlns="http://docs.openstack.org/compute/api/v1.1"
            xmlns:OS-SCH-HNT="http://docs.openstack.org/compute/ext/scheduler-hints/api/v2"
            name='new-server-test'
            imageRef='70a599e0-31e7-49b7-b260-868f441e862b'
            flavorRef='103'>
            <OS-SCH-HNT:scheduler_hints>
                    <near>eb999657-dd6b-464e-8713-95c532ac3b18</near>
            </OS-SCH-HNT:scheduler_hints>
    </server>

**Response Data**

Normal Response Code(s): 202

JSON

    {
        "server": {
            "adminPass": "yjzytFHb7XHc",
            "id": "f8f4f3ce-f6e0-4e05-8f79-bf984fdfce45",
            "links": [
                {
                    "href": "http://region-a.geo-1.compute.hpcloudsvc.com/v2/openstack/servers/f8f4f3ce-f6e0-4e05-8f79-bf984fdfce45",
                    "rel": "self"
                },
                {
                    "href": "http://region-a.geo-1.compute.hpcloudsvc.com/openstack/servers/f8f4f3ce-f6e0-4e05-8f79-bf984fdfce45",
                    "rel": "bookmark"
                }
            ]
        }
    }

XML

    <?xml version='1.0' encoding='UTF-8'?>
    <server xmlns:atom="http://www.w3.org/2005/Atom" xmlns="http://docs.openstack.org/compute/api/v1.1" id="a14a9bf5-93b3-49e4-85f1-01d7cf2645b4" adminPass="Q6jfHPrnvB9X">
        <metadata/>
        <atom:link href="http://region-a.geo-1.compute.hpcloudsvc.com/v2/openstack/servers/a14a9bf5-93b3-49e4-85f1-01d7cf2645b4" rel="self"/>
        <atom:link href="http://region-a.geo-1.compute.hpcloudsvc.com/openstack/servers/a14a9bf5-93b3-49e4-85f1-01d7cf2645b4" rel="bookmark"/>
    </server>

**Curl Example**

    curl -i -X 'POST'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/servers' -d '{"server": {"name": "new-server-test", "imageRef": "70a599e0-31e7-49b7-b260-868f441e862b", "flavorRef": "103"}, "OS-SCH-HNT:scheduler_hints": {"near": "2b7c42eb-7736-4a0f-afab-f23969a35ada"}}'

#### 4.4.11 Security Groups ####
##### 4.4.11.1 List Servers With Groups ##### {#listServerWithGroups}
##### GET /v2/{project_id}/servers/detail #####

Extends the [List Servers Detail](#listDetailServers) operation to add the attribute block security_groups to each server, listing the security groups applied to the server.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p></li>
</ul>

**Data Parameters**

This call does not require a request body.

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "servers": [
            {
                "accessIPv4": "",
                "accessIPv6": "",
                "addresses": {
                    "default": [
                        {
                            "addr": "16.24.24.2",
                            "version": 4
                        }
                    ]
                },
                "created": "2013-05-10T12:40:43Z",
                "flavor": {
                    "id": "101",
                    "links": [
                        {
                            "href": "http://compute.systestb.hpcloud.net/10424127775376/flavors/101",
                            "rel": "bookmark"
                        }
                    ]
                },
                "hostId": "7d9b3edec861c4a351970b88195016e701765ba9daad9fadad637d1f",
                "id": "129e43cb-82ad-48b5-860a-372d67ca85f6",
                "image": {
                    "id": "8dbf51b8-8fcd-4218-823c-62b4b79acd0b",
                    "links": [
                        {
                            "href": "http://compute.systestb.hpcloud.net/10424127775376/images/8dbf51b8-8fcd-4218-823c-62b4b79acd0b",
                            "rel": "bookmark"
                        }
                    ]
                },
                "key_name": "key-10",
                "links": [
                    {
                        "href": "http://compute.systestb.hpcloud.net/v2/10424127775376/servers/129e43cb-82ad-48b5-860a-372d67ca85f6",
                        "rel": "self"
                    },
                    {
                        "href": "http://compute.systestb.hpcloud.net/10424127775376/servers/129e43cb-82ad-48b5-860a-372d67ca85f6",
                        "rel": "bookmark"
                    }
                ],
                "name": "server-1",
                "progress": 0,
                "security_groups": [
                    {
                        "name": "default"
                    }
                ],
                "status": "ACTIVE",
                "tenant_id": "36991859863737",
                "updated": "2013-05-10T12:40:53Z",
                "user_id": "10957921068964"
            }
        ]
    }

XML
         
    <?xml version="1.0" encoding="UTF-8"?>
    <servers xmlns="http://docs.openstack.org/compute/api/v1.1" xmlns:OS-EXT-STS="http://docs.openstack.org/compute/ext/extended_status/api/v1.1" xmlns:atom="http://www.w3.org/2005/Atom">
        <server
               accessIPv4=""
               accessIPv6=""
               created="2013-05-10T12:40:43Z"
               hostId=""
               id="44e39c34-7ec8-4b69-bb85-315fdc1bb3ae"
               key_name="key-10"
               name="server-1"
               progress="0"
               status="ACTIVE"
               tenantId="10389545063147"
               updated="2013-05-10T12:40:53Z"
               userId="10957921068964">
            <image id="8dbf51b8-8fcd-4218-823c-62b4b79acd0b">
                <atom:link href="http://compute.systestb.hpcloud.net/10424127775376/images/8dbf51b8-8fcd-4218-823c-62b4b79acd0b" rel="bookmark"/>
            </image>
            <flavor id="101">
                <atom:link href="http://compute.systestb.hpcloud.net/10424127775376/flavors/101" rel="bookmark"/>
            </flavor>
            <addresses/>
                <network id="default">
                    <ip version="4" addr="16.24.24.2"/>
                </network>
            <atom:link href="http://compute.systestb.hpcloud.net/v2/10424127775376/servers/129e43cb-82ad-48b5-860a-372d67ca85f6" rel="self"/>
            <atom:link href="http://compute.systestb.hpcloud.net/10424127775376/servers/129e43cb-82ad-48b5-860a-372d67ca85f6" rel="bookmark"/>
            <security_groups>
                <security_group name="default"/>
            </security_groups>
        </server>
    </servers>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/servers/detail'

##### 4.4.11.2 Get Server With Groups ##### {#getServerWithGroups}
##### GET /v2/{project_id}/servers/{server_id}

Extends the [Get Server Details](#getServer) operation to add the attribute block security_groups listing the security groups applied to the server.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p></li>
<li><p><em>server_id</em> - The ID for the server. </p></li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "server": {
                "accessIPv4": "",
                "accessIPv6": "",
                "addresses": {
                    "default": [
                        {
                            "addr": "16.24.24.2",
                            "version": 4
                        }
                    ]
                },
                "created": "2013-05-10T12:40:43Z",
                "flavor": {
                    "id": "101",
                    "links": [
                        {
                            "href": "http://compute.systestb.hpcloud.net/10424127775376/flavors/101",
                            "rel": "bookmark"
                        }
                    ]
                },
                "hostId": "7d9b3edec861c4a351970b88195016e701765ba9daad9fadad637d1f",
                "id": "129e43cb-82ad-48b5-860a-372d67ca85f6",
                "image": {
                    "id": "8dbf51b8-8fcd-4218-823c-62b4b79acd0b",
                    "links": [
                        {
                            "href": "http://compute.systestb.hpcloud.net/10424127775376/images/8dbf51b8-8fcd-4218-823c-62b4b79acd0b",
                            "rel": "bookmark"
                        }
                    ]
                },
                "key_name": "key-10",
                "links": [
                    {
                        "href": "http://compute.systestb.hpcloud.net/v2/10424127775376/servers/129e43cb-82ad-48b5-860a-372d67ca85f6",
                        "rel": "self"
                    },
                    {
                        "href": "http://compute.systestb.hpcloud.net/10424127775376/servers/129e43cb-82ad-48b5-860a-372d67ca85f6",
                        "rel": "bookmark"
                    }
                ],
                "name": "server-1",
                "progress": 0,
                "security_groups": [
                    {
                        "name": "default"
                    }
                ],
                "status": "ACTIVE",
                "tenant_id": "36991859863737",
                "updated": "2013-05-10T12:40:53Z",
                "user_id": "10957921068964"
            }
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <server xmlns="http://docs.openstack.org/compute/api/v1.1" xmlns:OS-EXT-STS="http://docs.openstack.org/compute/ext/extended_status/api/v1.1" xmlns:atom="http://www.w3.org/2005/Atom"
             accessIPv4=""
             accessIPv6=""
             created="2013-05-10T12:40:43Z"
             hostId=""
             id="44e39c34-7ec8-4b69-bb85-315fdc1bb3ae"
             key_name="key-10"
             name="server-1"
             progress="0"
             status="ACTIVE"
             tenantId="10389545063147"
             updated="2013-05-10T12:40:53Z"
             userId="10957921068964">
        <image id="8dbf51b8-8fcd-4218-823c-62b4b79acd0b">
            <atom:link href="http://compute.systestb.hpcloud.net/10424127775376/images/8dbf51b8-8fcd-4218-823c-62b4b79acd0b" rel="bookmark"/>
        </image>
        <flavor id="101">
            <atom:link href="http://compute.systestb.hpcloud.net/10424127775376/flavors/101" rel="bookmark"/>
        </flavor>
        <addresses/>
            <network id="default">
                <ip version="4" addr="16.24.24.2"/>
            </network>
        <atom:link href="http://compute.systestb.hpcloud.net/v2/10424127775376/servers/129e43cb-82ad-48b5-860a-372d67ca85f6" rel="self"/>
        <atom:link href="http://compute.systestb.hpcloud.net/10424127775376/servers/129e43cb-82ad-48b5-860a-372d67ca85f6" rel="bookmark"/>
        <security_groups>
            <security_group name="default"/>
        </security_groups>
    </server>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/servers/129e43cb-82ad-48b5-860a-372d67ca85f6'

##### 4.4.11.3 Add Security Group ##### {#addSecurityGroup}
##### POST /v2/{project_id}/servers/{server_id}/action #####

Adds a security group to the list of security groups that are associated with the server.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
<li><p><em>server_id</em> - Server ID. This parameter can be an integer ID or a UUID. In either case, the specified server must be in the addressed Availability Zone. </p>
</li>
</ul>

**Request Parameters**

<ul>
<li><p><em>name</em> (required) - The name of the security group to add.</p>
</li>
</ul>

**Data Parameters**

JSON

    {
        "addSecurityGroup": {
            "name": "security-group-1"
        }
    }

XML

    <?xml version="1.0" ?>
    <addSecurityGroup xmlns="http://docs.openstack.org/compute/api/v2">
        &#60;name>security-group-2</name>
    </addSecurityGroup>

**Response Data**

Normal Response Code(s): 202

**Curl Example**

    curl -i -X 'POST'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' -d '{"addSecurityGroup": {"name": "security-group-1"}}' {BaseURI}/v2/{project_id}/servers/233691/action'

##### 4.4.11.4 Remove Security Group ##### {#removeSecurityGroup}
##### POST /v2/{project_id}/servers/{server_id}/action #####

Removes a security group from the list of security groups that are associated with the server. 

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account.</p>
</li>
<li><p><em>server_id</em> - Server ID. This parameter can be an integer ID or a UUID. In either case, the specified server must be in the addressed Availability Zone. </p>
</li>
</ul>
**Request Parameters**

<ul>
<li><p><em>name</em> (required) - The name of the security group to remove.</p>
</li>
</ul>
**Data Parameters**

JSON

    {
        "removeSecurityGroup": {
            "name": "security-group-1"
        }
    }

XML

    <?xml version="1.0" ?>
    <removeSecurityGroup xmlns="http://docs.openstack.org/compute/api/v2">
        &#60;name>security-group-2</name>
    </removeSecurityGroup>

**Response Data**

Normal Response Code(s): 202

**Curl Example**

    curl -i -X 'POST'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' -d '{"removeSecurityGroup": {"name": "security-group-1"}}' {BaseURI}/v2/{project_id}/servers/233691/action'

##### 4.4.11.5 List Security Groups ##### {#listSecGroups}
##### GET /v2/{project_id}/os-security-groups #####

List security groups.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "security_groups": [
            {
                "description": "default",
                "id": 12091,
                "name": "default",
                "rules": [
                    {
                        "from_port": 22,
                        "group": {},
                        "id": 31701,
                        "ip_protocol": "tcp",
                        "ip_range": {
                            "cidr": "0.0.0.0/0"
                        },
                        "parent_group_id": 12091,
                        "to_port": 22
                    },
                    {
                        "from_port": -1,
                        "group": {},
                        "id": 31703,
                        "ip_protocol": "icmp",
                        "ip_range": {
                            "cidr": "0.0.0.0/0"
                        },
                        "parent_group_id": 12091,
                        "to_port": -1
                    },
                    {
                        "from_port": null,
                        "group": {
                            "name": "default",
                            "tenant_id": "36991859863737"
                        },
                        "id": 31705,
                        "ip_protocol": null,
                        "ip_range": {},
                        "parent_group_id": 12091,
                        "to_port": null
                    }
                ],
                "tenant_id": "36991859863737"
            },
            {
                "description": "A security group",
                "id": 14703,
                "name": "security-group",
                "rules": [],
                "tenant_id": "36991859863737"
            },
            {
                "description": "Security group 1",
                "id": 17753,
                "name": "security-group-1",
                "rules": [],
                "tenant_id": "36991859863737"
            },
            {
                "description": "Security group 2",
                "id": 17755,
                "name": "security-group-2",
                "rules": [],
                "tenant_id": "36991859863737"
            }
        ]
    }

XML

    <security_groups xmlns="http://docs.openstack.org/compute/api/v2">
        <security_group id="12091" name="default" tenant_id="36991859863737">
            <rules>
                <rule id="31701" parent_group_id="12091">
                    <from_port>
                        22
                    </from_port>
                    <group/>
                    <ip_protocol>
                        tcp
                    </ip_protocol>
                    <to_port>
                        22
                    </to_port>
                    <ip_range>
                        <cidr>
                            0.0.0.0/0
                        </cidr>
                    </ip_range>
                </rule>
                <rule id="31703" parent_group_id="12091">
                    <from_port>
                        -1
                    </from_port>
                    <group/>
                    <ip_protocol>
                        icmp
                    </ip_protocol>
                    <to_port>
                        -1
                    </to_port>
                    <ip_range>
                        <cidr>
                            0.0.0.0/0
                        </cidr>
                    </ip_range>
                </rule>
                <rule id="31705" parent_group_id="12091">
                    <from_port>
                        None
                    </from_port>
                    <group>
                        <tenant_id>
                            36991859863737
                        </tenant_id>
                        &#60;name>
                            default
                        </name>
                    </group>
                    <ip_protocol>
                        None
                    </ip_protocol>
                    <to_port>
                        None
                    </to_port>
                    <ip_range/>
                </rule>
            </rules>
            <description>
                default
            </description>
        </security_group>
        <security_group id="14703" name="security-group" tenant_id="36991859863737">
            <rules/>
            <description>
                A security group
            </description>
        </security_group>
        <security_group id="17753" name="security-group-1" tenant_id="36991859863737">
            <rules/>
            <description>
                Security group 1
            </description>
        </security_group>
        <security_group id="17755" name="security-group-2" tenant_id="36991859863737">
            <rules/>
            <description>
                Security group 2
            </description>
        </security_group>
    </security_groups>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/os-security-groups'

##### 4.4.11.6 Create Security Group ##### {#createSecGroup}
##### POST /v2/{project_id}/os-security-groups #####

Create a new security group.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
</ul>

**Request Parameters**

<ul>
<li><p><em>name</em> - Name of the security group. </p>
</li>
<li><p><em>description</em> - Description of the security group. </p>
</li>
</ul>

**Data Parameters**

JSON

    {
        "security_group": {
            "description": "Security group 1",
            "name": "security-group-1"
        }
    }

XML

    <?xml version="1.0" ?>
    <security_group name="security-group-2">
        <description>
            Security group 2
        </description>
    </security_group>

**Response Data**

Normal Response Code(s): 202

JSON

    {
        "security_group": {
            "description": "Security group 1",
            "id": 17753,
            "name": "security-group-1",
            "rules": [],
            "tenant_id": "36991859863737"
        }
    }

XML

    <security_group id="17755" name="security-group-2" tenant_id="36991859863737" xmlns="http://docs.openstack.org/compute/api/v2">
        <rules/>
        <description>
            Security group 2
        </description>
    </security_group>

**Curl Example**

    curl -i -X 'POST'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' -d '{"security_group": {"name": "security-group-1", "description": "Security group 1"}}' {BaseURI}/v2/{project_id}/os-security-groups'

##### 4.4.11.7 Get Security Group ##### {#getSecGroup}
##### GET /v2/{project_id}/os-security-groups/{security_group_id} #####

Get specified security group.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
<li><p><em>security_group_id</em> - The unique identifier of the security group. </p>
</li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "security_group": {
            "description": "Security group 1",
            "id": 17965,
            "name": "security-group-1",
            "rules": [
                {
                    "from_port": 80,
                    "group": {},
                    "id": 42941,
                    "ip_protocol": "tcp",
                    "ip_range": {
                        "cidr": "0.0.0.0/0"
                    },
                    "parent_group_id": 17965,
                    "to_port": 8080
                }
            ],
            "tenant_id": "36991859863737"
        }
    }

XML

    <security_group id="17965" name="security-group-1" tenant_id="36991859863737" xmlns="http://docs.openstack.org/compute/api/v2">
        <rules>
            <rule id="42941" parent_group_id="17965">
                <from_port>
                    80
                </from_port>
                <group/>
                <ip_protocol>
                    tcp
                </ip_protocol>
                <to_port>
                    8080
                </to_port>
                <ip_range>
                    <cidr>
                        0.0.0.0/0
                    </cidr>
                </ip_range>
            </rule>
        </rules>
        <description>
            Security group 1
        </description>
    </security_group>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/os-security-groups/17965'

##### 4.4.11.8 Delete Security Group ##### {#deleteSecGroup}
##### DELETE /v2/{project_id}/os-security-groups/{security_group_id} #####

Delete a security group.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
<li><p><em>security_group_id</em> - xsd:int - The unique identifier of the security group. </p>
</li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 202

**Curl Example**

    curl -i -X 'DELETE'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/os-security-groups/17865'

##### 4.4.11.9 Create Security Group Rule ##### {#createSecGroupRule}
##### POST /v2/{project_id}/os-security-group-rules #####

Create a security group rule. Security group rules specify the traffic that is allowed through to the server. For a packet to be delivered, it must meet all the criteria established by the rule.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
</ul>

**Request Parameters**

<ul>
<li><p><em>parent_group_id</em> (required) - xsd:int - ID of the security group to which this rule will belong. </p>
</li>
<li><p><em>ip_protocol</em> - Packets using <em>ip_protocol</em> are delivered to the server. If <em>ip_protocol</em> is specified, then <em>from_port</em> and <em>to_port</em> must also be specified. If <em>ip_protocol</em> is omitted, traffic is delivered without regard to protocol. </p>
<p>Legal values are:<ul>
<li><em>TCP</em> 
</li>
<li><em>UDP</em> 
</li>
<li><em>ICMP</em> 
</li>
</ul></p>
</li>
<li><p><em>from_port</em> - xsd:int - For TCP and UDP packets, traffic to ports between <em>from_port</em> and <em>to_port</em> are delivered to the server. <em>from_port</em> must be &lt;= <em>to_port</em>. For ICMP packets, <em>from_port</em> specifies the ICMP type of the packets that will be accepted. If <em>from_port</em> is specified, then <em>to_port</em> and <em>ip_protocol</em> must also be specified. </p>
</li>
<li><p><em>to_port</em> - xsd:int - For TCP and UDP packets, traffic to ports between <em>from_port</em> and <em>to_port</em> are delivered to the server. <em>from_port</em> must be &lt;= <em>to_port</em>. For ICMP packets, <em>from_port</em> specifies the ICMP type of the packets that will be accepted. If <em>from_port</em> is specified, then <em>to_port</em> and <em>ip_protocol</em> must also be specified. </p>
</li>
<li><p><em>cidr</em> - Traffic from source with an IP address in the range specified by <em>cidr</em> will be accepted. Exactly one of <em>cidr</em> and <em>group_id</em> must be specified. </p>
</li>
<li><p><em>group_id</em> - xsd:int - Traffic from all servers associated with the security group specified by <em>group_id</em> will be accepted. Exactly one of <em>cidr</em> and <em>group_id</em> must be specified. </p>
</li>
</ul>

**Data Parameters**

JSON

    {
        "security_group_rule": {
            "cidr": "0.0.0.0/0",
            "from_port": "80",
            "ip_protocol": "tcp",
            "parent_group_id": "17965",
            "to_port": "8080"
        }
    }

XML

    <?xml version="1.0" ?>
    <security_group_rule xmlns="http://docs.openstack.org/compute/api/v2">
        <parent_group_id>17963</parent_group_id>
        <from_port>80</from_port>
        <ip_protocol>tcp</ip_protocol>
        <to_port>8080</to_port>
        <cidr>0.0.0.0/0</cidr>
    </security_group_rule>

**Response Data**

Normal Response Code(s): 202

JSON

    {
        "security_group_rule": {
            "from_port": 80,
            "group": {},
            "id": 45001,
            "ip_protocol": "tcp",
            "ip_range": {
                "cidr": "0.0.0.0/0"
            },
            "parent_group_id": 17965,
            "to_port": 8080
        }
    }

XML

    <security_group_rule id="45003" parent_group_id="17963" xmlns="http://docs.openstack.org/compute/api/v2">
        <from_port>
            80
        </from_port>
        <group/>
        <ip_protocol>
            tcp
        </ip_protocol>
        <to_port>
            8080
        </to_port>
        <ip_range>
            <cidr>
                0.0.0.0/0
            </cidr>
        </ip_range>
    </security_group_rule>

**Curl Example**

    curl -i -X 'POST'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' -d '{"security_group_rule": {"to_port": "8080", "cidr": "0.0.0.0/0", "from_port": "80", "parent_group_id": "17965", "ip_protocol": "tcp"}}' {BaseURI}/v2/{project_id}/os-security-group-rules'

##### 4.4.11.10 Delete Security Group Rule ##### {#deleteSecGroupRule}
##### DELETE /v2/{project_id}/os-security-group-rules/{security_group_rule_id}

Delete security group rule.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
<li><p><em>security_group_rule_id</em> - The unique identifier of the security group rule. </p>
</li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 202

**Curl Example**

    curl -i -X 'DELETE'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/os-security-group-rules/42937'

#### 4.4.12 Used Limits ####
##### 4.4.12.1 List Used Limits ##### {#listUsedLimits}
##### GET v2/{project_id}/limits #####

Extends the [List Limits](#listLimits) operation by adding information about limited resources that are currently used. This information is represented by the attributes totalCoresUsed, totalFloatingIpsUsed, totalInstancesUsed, totalRAMUsed, and totalSecurityGroupsUsed.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "limits": {
            "absolute": {
                "maxImageMeta": 50,
                "maxPersonality": 5,
                "maxPersonalitySize": 10240,
                "maxSecurityGroupRules": 20,
                "maxSecurityGroups": 10,
                "maxServerMeta": 50,
                "maxTotalCores": -1,
                "maxTotalFloatingIps": 10,
                "maxTotalInstances": 40,
                "maxTotalKeypairs": 100,
                "maxTotalRAMSize": 204800,
                "totalCoresUsed": 15,
                "totalFloatingIpsUsed": 2,
                "totalInstancesUsed": 8,
                "totalRAMUsed": 15360,
                "totalSecurityGroupsUsed": 5
            },
            "rate": []
        }
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <limits xmlns="http://docs.openstack.org/common/api/v1.0" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:os-used-limits="http://docs.openstack.org/compute/ext/used_limits/api/v1.1">
        <rates />
        <absolute>
            <limit name="maxServerMeta" value="50"/>
            <limit name="maxPersonality" value="5"/>
            <limit name="maxImageMeta" value="50"/>
            <limit name="maxPersonalitySize" value="10240"/>
            <limit name="maxSecurityGroupRules" value="20"/>
            <limit name="maxTotalKeypairs" value="100"/>
            <limit name="totalRAMUsed" value="15360"/>
            <limit name="totalInstancesUsed" value="8"/>
            <limit name="maxSecurityGroups" value="10"/>
            <limit name="totalFloatingIpsUsed" value="2"/>
            <limit name="maxTotalCores" value="-1"/>
            <limit name="totalSecurityGroupsUsed" value="5"/>
            <limit name="maxTotalFloatingIps" value="10"/>
            <limit name="maxTotalInstances" value="40"/>
            <limit name="totalCoresUsed" value="15"/>
            <limit name="maxTotalRAMSize" value="204800"/>
        </absolute>
    </limits>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/limits'

#### 4.4.13 Volumes #### {#volumes}
##### 4.4.13.1 List Volumes ##### {#listVolumes}
##### GET /v2/{project_id}/os-volumes #####

List the volumes.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "volumes": [
            {
                "attachments": [
                    {}
                ],
                "availabilityZone": "az2",
                "createdAt": "2013-05-20T13:21:37.000000",
                "displayDescription": null,
                "displayName": null,
                "id": "cfe5e0a9-251a-40b8-8f4b-919af1e4ff42",
                "metadata": {},
                "size": 30,
                "snapshotId": null,
                "status": "available",
                "volumeType": "None"
            },
            {
                "attachments": [
                    {
                        "device": "vda",
                        "id": "96b0b9ef-67f9-4754-b6be-ddf65c0b73aa",
                        "serverId": "3c5e4458-3109-4e36-a478-0777bf1c085a",
                        "volumeId": "96b0b9ef-67f9-4754-b6be-ddf65c0b73aa"
                    }
                ],
                "availabilityZone": "az2",
                "createdAt": "2013-05-14T10:21:41.000000",
                "displayDescription": null,
                "displayName": "PaulsVolume",
                "id": "96b0b9ef-67f9-4754-b6be-ddf65c0b73aa",
                "metadata": {},
                "size": 20,
                "snapshotId": null,
                "status": "in-use",
                "volumeType": "None"
            }
        ]
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <volumes>
        <volume
            availabilityZone="az2"
            createdAt="2013-05-20T13:21:37.000000"
            displayDescription="None"
            displayName="None"
            id="cfe5e0a9-251a-40b8-8f4b-919af1e4ff42"
            size="30"
            snapshotId="None"
            status="available"
            volumeType="None">
            <attachments>
              <attachment/>
            </attachments>
            <metadata/>
        </volume>
        <volume
            availabilityZone="az2"
            createdAt="2013-05-14T10:21:41.000000"
            displayDescription="None"
            displayName="PaulsVolume"
            id="96b0b9ef-67f9-4754-b6be-ddf65c0b73aa"
            size="20"
            snapshotId="None"
            status="in-use"
            volumeType="None">
            <attachments>
                <attachment device="vda" id="96b0b9ef-67f9-4754-b6be-ddf65c0b73aa" serverId="3c5e4458-3109-4e36-a478-0777bf1c085a" volumeId="96b0b9ef-67f9-4754-b6be-ddf65c0b73aa"/>
            </attachments>
            <metadata/>
        </volume>
    </volumes>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/os-volumes'

##### 4.4.13.2 List Volume Details ##### {#listVolumesDetails}
##### GET /v2/{project_id}/os-volumes/detail #####

List volumes giving details.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "volumes": [
            {
                "attachments": [
                    {}
                ],
                "availabilityZone": "az2",
                "createdAt": "2013-05-20T13:21:37.000000",
                "displayDescription": null,
                "displayName": null,
                "id": "cfe5e0a9-251a-40b8-8f4b-919af1e4ff42",
                "metadata": {},
                "size": 30,
                "snapshotId": null,
                "status": "available",
                "volumeType": "None"
            },
            {
                "attachments": [
                    {
                        "device": "vda",
                        "id": "96b0b9ef-67f9-4754-b6be-ddf65c0b73aa",
                        "serverId": "3c5e4458-3109-4e36-a478-0777bf1c085a",
                        "volumeId": "96b0b9ef-67f9-4754-b6be-ddf65c0b73aa"
                    }
                ],
                "availabilityZone": "az2",
                "createdAt": "2013-05-14T10:21:41.000000",
                "displayDescription": null,
                "displayName": "PaulsVolume",
                "id": "96b0b9ef-67f9-4754-b6be-ddf65c0b73aa",
                "metadata": {},
                "size": 20,
                "snapshotId": null,
                "status": "in-use",
                "volumeType": "None"
            }
        ]
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <volumes>
        <volume
            availabilityZone="az2"
            createdAt="2013-05-20T13:21:37.000000"
            displayDescription="None"
            displayName="None"
            id="cfe5e0a9-251a-40b8-8f4b-919af1e4ff42"
            size="30"
            snapshotId="None"
            status="available"
            volumeType="None">
            <attachments>
                <attachment/>
            </attachments>
            <metadata/>
        </volume>
        <volume
            availabilityZone="az2"
            createdAt="2013-05-14T10:21:41.000000"
            displayDescription="None"
            displayName="PaulsVolume"
            id="96b0b9ef-67f9-4754-b6be-ddf65c0b73aa"
            size="20"
            snapshotId="None"
            status="in-use"
            volumeType="None">
            <attachments>
                <attachment device="vda" id="96b0b9ef-67f9-4754-b6be-ddf65c0b73aa" serverId="3c5e4458-3109-4e36-a478-0777bf1c085a" volumeId="96b0b9ef-67f9-4754-b6be-ddf65c0b73aa"/>
            </attachments>
            <metadata/>
        </volume>
    </volumes>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/os-volumes/detail'

##### 4.4.13.3 Create Volume ##### {#createVolume}
##### POST /v2/{project_id}/os-volumes #####

List volumes giving details.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
</ul>

**Request Parameters**

<ul>
<li><p><em>volume</em> - A partial representation of a volume to be created.</p>
<li><p><em>display_name</em> - A name for the volume.</p>
<li><p><em>display_description</em> - A description for the volume</p>
<li><p><em>size</em> - xsd:int - The size of the volume in GB</p>
<li><p><em>volume_type</em> - Optional volume type identifier</p>
<li><p><em>metadata": {"contents": "junk"},
<li><p><em>availability_zone</em> - Optional availability zone for the volume.</p>
<li><p><em>snapshot_id</em> - Optional snapshot id to build the volume from.</p>
</ul>

**Data Parameters**

JSON

    {
        "volume": {
            "display_name": "vol-001",
            "display_description": "Another volume.",
            "size": 30,
            "volume_type": "289da7f8-6440-407c-9fb4-7db01ec49164",
            "metadata": {"contents": "junk"},
            "availability_zone": "az1",
            "snapshot_id": "ad39719b-6f56-4eb3-8c7d-b1ae059ce057"
        }
    }

XML

	<?xml version="1.0" encoding="UTF-8"?>
	<volume xmlns="http://docs.openstack.org/volume/api/v1"/>
	    <display_name>vol-001</display_name>
	    <display_description>Another volume.</display_description>
	    <size>30</size>
	    <volume_type>289da7f8-6440-407c-9fb4-7db01ec49164</volume_type>
	    <availability_zone>az1</availability_zone>
	    <snapshot_id>ad39719b-6f56-4eb3-8c7d-b1ae059ce057</snapshot_id>
	    <metadata>
		<meta key=contents>junk</meta>
	    </metadata>
	</volume>

**Response Data**

Normal Response Code(s): 202

JSON

    {
        "volume": {
            "id": "521752a6-acf6-4b2d-bc7a-119f9148cd8c",
            "display_name": "vol-001",
            "display_description": "Another volume.",
            "size": 30,
            "volume_type": "289da7f8-6440-407c-9fb4-7db01ec49164",
            "metadata": {"contents": "junk"},
            "availability_zone": "az1",
            "snapshot_id": null,
            "attachments": [],
            "created_at": "2012-02-14T20:53:07Z"
         }
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <volume xmlns="http://docs.openstack.org/volume/api/v1"
            id="521752a6-acf6-4b2d-bc7a-119f9148cd8c"
            display_name="vol-001"
            display_description="Another volume."
            status="active"
            size="30"
            volume_type="289da7f8-6440-407c-9fb4-7db01ec49164"
            availability_zone="az1"
            created_at="2012-02-14T20:53:07Z">
        <metadata>
            <meta key="contents">junk</meta>
        </metadata>
    </volume>

**Curl Example**

    curl -i -X 'POST' -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/os-volumes' -d '{"volume": {"display_name": "vol-001","display_description": "Another volume.","size": 30,"volume_type": "289da7f8-6440-407c-9fb4-7db01ec49164","metadata": {"contents": "junk"},"availability_zone": "az1","snapshot_id": "ad39719b-6f56-4eb3-8c7d-b1ae059ce057"}}'

##### 4.4.13.4 Show Volume ##### {#showVolume}
##### GET /v2/{project_id}/os-volumes/{volume_id} #####

List the details of a volume.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p></li>
<li><p><em>volume_id</em> - The ID for the volume. </p></li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "volume": {
        "attachments": [
            {}
        ], 
        "availabilityZone": "az2", 
        "createdAt": "2013-05-20T13:21:37.000000", 
        "displayDescription": null, 
        "displayName": null, 
        "id": "cfe5e0a9-251a-40b8-8f4b-919af1e4ff42", 
        "metadata": {}, 
        "size": 30, 
        "snapshotId": null, 
        "status": "available", 
        "volumeType": "None"
        }
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <volume
         availabilityZone="az2"
         createdAt="2013-05-20T13:21:37.000000"
         displayDescription="None"
         displayName="None"
         id="cfe5e0a9-251a-40b8-8f4b-919af1e4ff42"
         size="30"
         snapshotId="None"
         status="available"
         volumeType="None">
        <attachments>
            <attachment/>
        </attachments>
        <metadata/>
    </volume>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/os-volumes/521752a6-acf6-4b2d-bc7a-119f9148cd8c'

##### 4.4.13.5 Delete Volume ##### {#deleteVolume}
##### DELETE /v2/{project_id}/os-volumes/{volume_id} #####

Delete a volume.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
<li><p><em>volume_id</em> - The ID for the volume. </p></li>
</li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 202

**Curl Example**

    curl -i -X 'DELETE'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/os-volumes/cfe5e0a9-251a-40b8-8f4b-919af1e4ff42'

##### 4.4.13.6 Create Snapshot ##### {#createSnapshot}
##### POST /v2/{project_id}/os-snapshots #####

Create a snapshot of a volume.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p></li>
</ul>

**Request Parameters**

<ul>
<li><p><em>display_name</em> - A display name for the snapshot</p></li>
<li><p><em>display_description</em> - A description of the snapshot</p></li>
<li><p><em>volume_id</em> - The source volume for the snapshot</p></li>
<li><p><em>force</em> - xsd:bool - If True the operation will snapshot the source volume even if it is attached to a server. If it is False it will only snapshot if the volume is not attached.</p></li>
</ul>

**Data Parameters**

JSON

    {
        "snapshot": {
            "display_name": "snap-001",
            "display_description": "Daily backup",
            "volume_id": "521752a6-acf6-4b2d-bc7a-119f9148cd8c",
            "force": true
         }
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <snapshot xmlns="http://docs.openstack.org/volume/api/v1"
              display_name="snap-001"
              display_description="Daily backup"
              volume_id="521752a6-acf6-4b2d-bc7a-119f9148cd8c"
              force="true" />

**Response Data**

Normal Response Code(s): 202

JSON

    {
        "snapshot": {
            "id": "3fbbcccf-d058-4502-8844-6feeffdf4cb5",
            "display_name": "snap-001",
            "display_description": "Daily backup",
            "volume_id": "521752a6-acf6-4b2d-bc7a-119f9148cd8c",
            "status": "available",
            "size": 30,
            "created_at": "2012-02-29T03:50:07Z"
         }
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <snapshot xmlns="http://docs.openstack.org/volume/api/v1"
              id="3fbbcccf-d058-4502-8844-6feeffdf4cb5"
              display_name="snap-001"
              display_description="Daily backup"
              volume_id="521752a6-acf6-4b2d-bc7a-119f9148cd8c"
              status="available"
              size="30"
              created_at="2012-02-29T03:50:07Z" />

**Curl Example**

    curl -i -X 'POST'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/os-volume-type' -d '{"snapshot": {"display_name": "snap-001", "display_description": "Daily backup", "volume_id": "521752a6-acf6-4b2d-bc7a-119f9148cd8c", "force": true}}'

##### 4.4.13.7 List Snapshots ##### {#listSnapshots}
##### GET /v2/{project_id}/os-snapshots #####

List the volume snapshots.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "snapshots": [
            {
                "id": "3fbbcccf-d058-4502-8844-6feeffdf4cb5",
                "display_name": "snap-001",
                "display_description": "Daily backup",
                "volume_id": "521752a6-acf6-4b2d-bc7a-119f9148cd8c",
                "status": "available",
                "size": 30,
                "created_at": "2012-02-29T03:50:07Z"
            },
            {
                "id": "e479997c-650b-40a4-9dfe-77655818b0d2",
                "display_name": "snap-002",
                "display_description": "Weekly backup",
                "volume_id": "76b8950a-8594-4e5b-8dce-0dfa9c696358",
                "status": "available",
                "size": 25,
                "created_at": "2012-03-19T01:52:47Z"
            }
        ]
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <snapshots xmlns="http://docs.openstack.org/volume/api/v1">
        <snapshot id="3fbbcccf-d058-4502-8844-6feeffdf4cb5"
                  display_name="snap-001"
                  display_description="Daily backup"
                  volume_id="521752a6-acf6-4b2d-bc7a-119f9148cd8c"
                  status="available"
                  size="30"
                  created_at="2012-02-29T03:50:07Z" />
        <snapshot id="e479997c-650b-40a4-9dfe-77655818b0d2"
                  display_name="snap-002"
                  display_description="Weekly backup"
                  volume_id="76b8950a-8594-4e5b-8dce-0dfa9c696358"
                  status="available"
                  size="25"
                  created_at="2012-03-19T01:52:47Z" />
    </snapshots>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/os-snapshots'

##### 4.4.13.8 List Snapshots Details ##### {#listSnapshotsDetails}
##### GET /v2/{project_id}/os-snapshots/detail #####

List volume snapshots giving details.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "snapshots": [
            {
                "id": "3fbbcccf-d058-4502-8844-6feeffdf4cb5",
                "display_name": "snap-001",
                "display_description": "Daily backup",
                "volume_id": "521752a6-acf6-4b2d-bc7a-119f9148cd8c",
                "status": "available",
                "size": 30,
                "created_at": "2012-02-29T03:50:07Z"
            },
            {
                "id": "e479997c-650b-40a4-9dfe-77655818b0d2",
                "display_name": "snap-002",
                "display_description": "Weekly backup",
                "volume_id": "76b8950a-8594-4e5b-8dce-0dfa9c696358",
                "status": "available",
                "size": 25,
                "created_at": "2012-03-19T01:52:47Z"
            }
        ]
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <snapshots xmlns="http://docs.openstack.org/volume/api/v1">
        <snapshot id="3fbbcccf-d058-4502-8844-6feeffdf4cb5"
                  display_name="snap-001"
                  display_description="Daily backup"
                  volume_id="521752a6-acf6-4b2d-bc7a-119f9148cd8c"
                  status="available"
                  size="30"
                  created_at="2012-02-29T03:50:07Z" />
        <snapshot id="e479997c-650b-40a4-9dfe-77655818b0d2"
                  display_name="snap-002"
                  display_description="Weekly backup"
                  volume_id="76b8950a-8594-4e5b-8dce-0dfa9c696358"
                  status="available"
                  size="25"
                  created_at="2012-03-19T01:52:47Z" />
    </snapshots>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/os-snapshots/detail'

##### 4.4.13.9 List Snapshot ##### {#listSnapshot}
##### GET /v2/{project_id}/os-snapshots/{snapshot_id} #####

List details of a volume snapshot.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p></li>
<li><p><em>snapshot_id</em> - The ID for the snapshot. </p></li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "snapshot": {
            "id": "3fbbcccf-d058-4502-8844-6feeffdf4cb5",
            "display_name": "snap-001",
            "display_description": "Daily backup",
            "volume_id": "521752a6-acf6-4b2d-bc7a-119f9148cd8c",
            "status": "available",
            "size": 30,
            "created_at": "2012-02-29T03:50:07Z"
         }
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <snapshot xmlns="http://docs.openstack.org/volume/api/v1"
              id="3fbbcccf-d058-4502-8844-6feeffdf4cb5"
              display_name="snap-001"
              display_description="Daily backup"
              volume_id="521752a6-acf6-4b2d-bc7a-119f9148cd8c"
              status="available"
              size="30"
              created_at="2012-02-29T03:50:07Z" />

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/os-snapshots/3fbbcccf-d058-4502-8844-6feeffdf4cb5'

##### 4.4.13.10 Delete Snapshots ##### {#deleteSnapshot}
##### DELETE /v2/{project_id}/os-snapshots/{snapshot_id} #####

Delete a snapshot.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p></li>
<li><p><em>snapshot_id</em> - The ID for the snapshot. </p></li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 202

**Curl Example**

    curl -i -X 'DELETE' -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/os-snapshots/3fbbcccf-d058-4502-8844-6feeffdf4cb5'

##### 4.4.13.11 Attach a Volume to a Server ##### {#AttachAVolumeToAServer}
##### GET /v2/{project_id}/servers/{server_id}/os-volume_attachments #####

Attach a volume to a server.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p></li>
</ul>

**Request Parameters**

<ul>
<li><p><em>volumeAttachment</em> - A partical definition of a volume attachment. </p></li>
<li><p><em>serverid</em> - The ID for server. </p></li>
<li><p><em>volumeid</em> - The ID for the volume. </p></li>
<li><p><em>device</em> - Name of the device e.g. /dev/vdb. Use "auto" for autoassign (if supported).</p></li>
</ul>

**Data Parameters**

JSON

    {
        "volumeAttachment": {
            "volumeId": "5f800cf0-324f-4234-bc6b-e12d5816e962",
            "device": "/dev/vdd"
        }
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <volumeAttachment
        xmlns="http://docs.openstack.org/compute/api/v1.1"
        volumeId="5f800cf0-324f-4234-bc6b-e12d5816e962"
        device="/dev/vdd"/>

**Response Data**

Normal Response Code(s): 202

JSON

    {
        "volumeAttachment": {
            "device": "/dev/vdd",
            "serverId": "fd783058-0e27-48b0-b102-a6b4d4057cac",
            "id": "5f800cf0-324f-4234-bc6b-e12d5816e962",
            "volumeId": "5f800cf0-324f-4234-bc6b-e12d5816e962"
        }
    }

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/os-volume_attachments'

##### 4.4.13.12 List Volumes Attached to Server ##### {#ListVolumeAttchedToServer}
##### GET /v2/{project_id}/servers/{server_id}/os-volume_attachments #####

List volumes giving details.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p></li>
<li><p><em>server_id</em> - The ID for the server. </p></li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "volumeAttachments": [
            {
                "device": "vda",
                "id": "96b0b9ef-67f9-4754-b6be-ddf65c0b73aa",
                "serverId": "3c5e4458-3109-4e36-a478-0777bf1c085a",
                "volumeId": "96b0b9ef-67f9-4754-b6be-ddf65c0b73aa"
            }
        ]
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <volumeAttachments>
        <volumeAttachment device="vda"
            id="96b0b9ef-67f9-4754-b6be-ddf65c0b73aa"
            serverId="3c5e4458-3109-4e36-a478-0777bf1c085a"
            volumeId="96b0b9ef-67f9-4754-b6be-ddf65c0b73aa"/>
    </volumeAttachments>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/servers/fd783058-0e27-48b0-b102-a6b4d4057cac/os-volume_attachments'

##### 4.4.13.13 Get Attached Volume Details ##### {#GetAttachedVolumeDetails}
##### GET /v2/{project_id}/servers/{server_id}/os-volume_attachments/{volume_id}

Get the details a volume attachment.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p></li>
<li><p><em>server_id</em> - The ID for the server. </p></li>
<li><p><em>volume_id</em> - The ID for the volume. </p></li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 200

    {
        "volumeAttachment": {
            "device": "/dev/vdd",
            "serverId": "fd783058-0e27-48b0-b102-a6b4d4057cac",
            "id": "5f800cf0-324f-4234-bc6b-e12d5816e962",
            "volumeId": "5f800cf0-324f-4234-bc6b-e12d5816e962"
        }
    }

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/servers/fd783058-0e27-48b0-b102-a6b4d4057cac/os-volume_attachments/5f800cf0-324f-4234-bc6b-e12d5816e962'

##### 4.4.13.14 Detach a Volume from a Server ##### {#DetachAVolumeFromAServer}
##### DELETE /v2/{project_id}/servers/{server_id}/os-volume_attachments/{volume_id}

Detach a volume from a server.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p></li>
<li><p><em>server_id</em> - The ID for the server. </p></li>
<li><p><em>volume_id</em> - The ID for the volume. </p></li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 202

**Curl Example**

    curl -i -X 'DELETE'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/servers/fd783058-0e27-48b0-b102-a6b4d4057cac/os-volume_attachments/5f800cf0-324f-4234-bc6b-e12d5816e962'

#### 4.4.14 Rescue ####
##### 4.4.14.1 Server Rescue ##### {#rescue}
##### POST /v2/{project_id}/servers/{server_id}/action #####

Put a server in rescue mode.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p></li>
<li><p><em>server_id</em> - The ID for the server. </p></li>
</ul>

**Request Parameters**

<ul>
<li><p><em>rescue</em> - Rescue action selector.</p></li>
<li><p><em>adminPass</em> - Optional admin password (if not provided a password will be generated by the compute service)</p></li>
</ul>

**Data Parameters**

JSON

    {
        "rescue": {
            "adminPass": "MySecretPass"
        }
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <rescue xmlns="http://docs.openstack.org/compute/api/v2"
        adminPass="MySecretPass"/>

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "adminPass": "MySecretPass"
    }

XML

    <?xml version='1.0' encoding='UTF-8'?>
    <adminPass>MySecretPass</adminPass>

**Curl Example**

    curl -i -X 'POST'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/servers/fd783058-0e27-48b0-b102-a6b4d4057cac/action' -d '{"rescue": {"adminPass": "MySecretPass"}}'

##### 4.4.14.2 Server Unrescue ##### {#unrescue}
##### POST /v2/{project_id}/servers/{server_id}/action #####

Return a server to the state it was in before being put in rescue mode.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p></li>
<li><p><em>server_id</em> - The ID for the server. </p></li>
</ul>

**Request Parameters**

<ul>
<li><p><em>unrescue</em> - Unrescue action selector. </p></li>
</ul>

**Data Parameters**

JSON

    {
        "unrescue": null
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <unrescue xmlns="http://docs.openstack.org/compute/api/v2"/>

**Response Data**

Normal Response Code(s): 200

**Curl Example**

    curl -i -X 'POST'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/servers/fd783058-0e27-48b0-b102-a6b4d4057cac/action' -d '{"unrescue": null}'

#### 4.4.15 Multiple Create ####
##### 4.4.15.1 Multiple Create ##### {#multipleCreate}
##### POST /v2/{project_id}/servers #####

Multiple create enables a feature of the core server create operation [Create Server](#createServer). Two additional parameters are provided that define a maximum and a minimum number of servers to create. The computer service attempts to create the maximum number of servers, respecting the limits set for the project. No servers are created if the limits do not allow at least the minimum number.

The names of the servers are generated by extending the given name parameter with an incrementing number. On successful completion the operation returns information of the first server.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p></li>
</ul>

**Request Parameters**

<ul>
<li><p><em>min_count</em> - The minimum number of servers to create (defaults to 1). </p></li>
<li><p><em>max_count</em> - The maximum number of servers to create (defaults to min_count). </p></li>
</ul>

**Data Parameters**

JSON

    {
        "server": {
            "min_count": 5,
            "max_count": 10,
            "flavorRef": "101",
            "name": "server-group",
            "imageRef": "8dbf51b8-8fcd-4218-823c-62b4b79acd0b"
        }
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <server xmlns="http://docs.openstack.org/compute/api/v1.1"
        min_count=5,
        max_count=10,
        flavorRef="101",
        name="server-group",
        imageRef="8dbf51b8-8fcd-4218-823c-62b4b79acd0b"/>

**Response Data**

Normal Response Code(s): 202

JSON

    {
        "server": {
            "adminPass": "VKFyaC2KngRJ",
            "id": "b1852c63-9e93-46bd-93e2-063006e33d7f",
            "links": [
                {
                    "href": "http://region-a.geo-1.compute.hpcloudsvc.com/v2/10424127775376/servers/b1852c63-9e93-46bd-93e2-063006e33d7f",
                    "rel": "self"
                },
                {
                    "href": "http://region-a.geo-1.compute.hpcloudsvc.com/10424127775376/servers/b1852c63-9e93-46bd-93e2-063006e33d7f",
                    "rel": "bookmark"
                }
            ],
            "security_groups": [
                {
                    "name": "default"
                }
            ]
        }
    }

XML

    <?xml version='1.0' encoding='UTF-8'?>
    <server xmlns:atom="http://www.w3.org/2005/Atom" xmlns="http://docs.openstack.org/compute/api/v1.1"
        id="6c69cc67-6515-45f9-a46f-2ddd57998307"
        adminPass="x4thKcrBwKLn">
        <metadata/>
            <atom:link href="http://region-a.geo-1.compute.hpcloudsvc.com/v2/10424127775376/servers/6c69cc67-6515-45f9-a46f-2ddd57998307" rel="self"/>
            <atom:link href="http://region-a.geo-1.compute.hpcloudsvc.com/10424127775376/servers/6c69cc67-6515-45f9-a46f-2ddd57998307" rel="bookmark"/>
        <security_groups>
            <security_group name="default"/>
        </security_groups>
    </server>

**Curl Example**

    curl -i -X 'POST'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/servers' -d '{"server": {"min_count": 5, "max_count": 10, "flavorRef": "101", "name": "server-group", "imageRef": "8dbf51b8-8fcd-4218-823c-62b4b79acd0b" }}'

#### 4.4.16 Consoles ####
##### 4.4.16.1 Get VNC Console ##### {#getVNCConsole}
##### POST /v2/{project_id}/servers/{server_id}/action #####

Get a url to access a server's console using VNC. The url will include an authorisation token.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p></li>
<li><p><em>server_id</em> - The ID for the server. </p></li>
</ul>

**Request Parameters**

<ul>
<li><p><em>os-getVNCConsole</em> - The get VNC console action.</p></li>
<li><p><em>type</em> - The type - valid values are 'novnc' or 'xvpvnc'</p></li>
</ul>

**Data Parameters**

JSON

    {
        "os-getVNCConsole": {
            "type": "novnc"
        }
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <os-getVNCConsole type="novnc" />

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "console": {
            "type": "novnc",
            "url": "http://region-a.geo-1.vnc-compute.hpcloudsvc.com/vnc_auto.html?token=f9906a48-b71e-4f18-baca-c987da3ebdb3&title=dafa(75ecef58-3b8e-4659-ab3b-5501454188e9)"
        }
    }

XML

    <?xml version='1.0' encoding='UTF-8'?>
    <console>
      <type>novnc</type>
      <url>http://region-a.geo-1.vnc-compute.hpcloudsvc.com/vnc_auto.html?token=f9906a48-b71e-4f18-baca-c987da3ebdb3</url>
    </console>

**Curl Example**

    curl -i -X 'POST'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/servers/fd783058-0e27-48b0-b102-a6b4d4057cac/action' -d {"os-getVNCConsole": {"type": "novnc"}}'

#### 4.4.17 FlavorRxtx ####
##### 4.4.17.1 List Flavors Rxtx ##### {#listFlavorsRxtx}
##### GET /v2/{project_id}/flavors/detail #####

Extends the flavor operation [List Flavors Detail](#listDetailFlavors) by adding the flavor_rxtx attribute defining bandwidth for the flavor.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "flavors": [
            {
                "id": 100,
                "links": [
                    {
                        "href": "https://region-a.geo-1.compute.hpcloudsvc.com/v2/36991859863737/flavors/100",
                        "rel": "self"
                    },
                    {
                        "href": "https://region-a.geo-1.compute.hpcloudsvc.com/36991859863737/flavors/100",
                        "rel": "bookmark"
                    }
                ],
                "name": "standard.xsmall",
                "rxtx_factor": "1.0"
            },
            {
                "id": 101,
                "links": [
                    {
                        "href": "https://region-a.geo-1.compute.hpcloudsvc.com/v2/36991859863737/flavors/101",
                        "rel": "self"
                    },
                    {
                        "href": "https://region-a.geo-1.compute.hpcloudsvc.com/36991859863737/flavors/101",
                        "rel": "bookmark"
                    }
                ],
                "name": "standard.small",
                "rxtx_factor": "1.0"
            }
         ]
    }

XML

    <flavors xmlns="http://docs.openstack.org/compute/api/v2" xmlns:atom="http://www.w3.org/2005/Atom">
        <flavor id="100" name="standard.xsmall" rxtx_factor="1.0">
            <atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/v2/36991859863737/flavors/100" rel="self"/>
            <atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/36991859863737/flavors/100" rel="bookmark"/>
        </flavor>
        <flavor id="101" name="standard.small" rxtx_factor="1.0">
            <atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/v2/36991859863737/flavors/101" rel="self"/>
            <atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/36991859863737/flavors/101" rel="bookmark"/>
        </flavor>
    </flavors>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/flavors/detail'

##### 4.4.17.2 Get Flavor Rxtx ##### {#getFlavorRxtx}
##### GET /v2/{project_id}/flavors/{flavor_id} #####

Extends the flavor operation [Get Flavor Details](#getFlavor) by adding the flavor_rxtx attribute defining bandwidth for the flavor.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p></li>
<li><p><em>flavor_id</em> - The ID for the flavor. </p></li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "flavors": [
            {
                "id": 100,
                "links": [
                    {
                        "href": "https://region-a.geo-1.compute.hpcloudsvc.com/v2/36991859863737/flavors/100",
                        "rel": "self"
                    },
                    {
                        "href": "https://region-a.geo-1.compute.hpcloudsvc.com/36991859863737/flavors/100",
                        "rel": "bookmark"
                    }
                ],
                "name": "standard.xsmall",
                "rxtx_factor": "1.0"
            }
         ]
    }

XML

    <flavors xmlns="http://docs.openstack.org/compute/api/v2" xmlns:atom="http://www.w3.org/2005/Atom">
        <flavor id="100" name="standard.xsmall" rxtx_factor="1.0">
            <atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/v2/36991859863737/flavors/100" rel="self"/>
            <atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/36991859863737/flavors/100" rel="bookmark"/>
        </flavor>
    </flavors>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/flavors/100'

#### 4.4.18 Flavor Swap ####
##### 4.4.18.1 List Flavors Swap ##### {#listVolumes}
##### GET /v2/{project_id}/flavors/detail #####

Extends the flavor operation [List Flavors Detail](#listDetailFlavors) by adding the swap attribute defining swap space.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "flavors": [
            {
                "id": 100,
                "links": [
                    {
                        "href": "https://region-a.geo-1.compute.hpcloudsvc.com/v2/36991859863737/flavors/100",
                        "rel": "self"
                    },
                    {
                        "href": "https://region-a.geo-1.compute.hpcloudsvc.com/36991859863737/flavors/100",
                        "rel": "bookmark"
                    }
                ],
                "name": "standard.xsmall",
                "swap": 5
            },
            {
                "id": 101,
                "links": [
                    {
                        "href": "https://region-a.geo-1.compute.hpcloudsvc.com/v2/36991859863737/flavors/101",
                        "rel": "self"
                    },
                    {
                        "href": "https://region-a.geo-1.compute.hpcloudsvc.com/36991859863737/flavors/101",
                        "rel": "bookmark"
                    }
                ],
                "name": "standard.small",
                "swap": 5
            }
         ]
    }

XML

    <flavors xmlns="http://docs.openstack.org/compute/api/v2" xmlns:atom="http://www.w3.org/2005/Atom">
        <flavor id="100" name="standard.xsmall" swap="5">
            <atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/v2/36991859863737/flavors/100" rel="self"/>
            <atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/36991859863737/flavors/100" rel="bookmark"/>
        </flavor>
        <flavor id="101" name="standard.small" swap="5">
            <atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/v2/36991859863737/flavors/101" rel="self"/>
            <atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/36991859863737/flavors/101" rel="bookmark"/>
        </flavor>
    </flavors>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/flavors/detail'

##### 4.4.18.2 Get Flavor Swap ##### {#getFlavorSwap}
##### GET /v2/{project_id}/flavors/{flavor_id} #####

Extends the flavor operation [Get Flavor Details](#getFlavor) by adding the swap attribute defining swap space.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p></li>
<li><p><em>flavor_id</em> - The ID for the flavor. </p></li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "flavors": [
            {
                "id": 100,
                "links": [
                    {
                        "href": "https://region-a.geo-1.compute.hpcloudsvc.com/v2/36991859863737/flavors/100",
                        "rel": "self"
                    },
                    {
                        "href": "https://region-a.geo-1.compute.hpcloudsvc.com/36991859863737/flavors/100",
                        "rel": "bookmark"
                    }
                ],
                "name": "standard.xsmall",
                swap 5
            }
         ]
    }

XML

    <flavors xmlns="http://docs.openstack.org/compute/api/v2" xmlns:atom="http://www.w3.org/2005/Atom">
        <flavor id="100" name="standard.xsmall" swap 5>
            <atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/v2/36991859863737/flavors/100" rel="self"/>
            <atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/36991859863737/flavors/100" rel="bookmark"/>
        </flavor>
    </flavors>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/flavors/100'

#### 4.4.19 Image Size ####
##### 4.4.19.1 List Image Size ##### {#listImageSize}
##### GET /v2/{project_id}/images/detail #####

Extends the image operation [List Images Detail](#listDetailImages) by adding the attribute OS-EXT-IMG-SIZE:size to the image details.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p></li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "images": [
            {
                "created": "2012-09-04T16:45:17Z",
                "id": "34971",
                "OS-EXT-IMG-SIZE:size": 325020160,
                "links": [
                    {
                        "href": "https://region-a.geo-1.compute.hpcloudsvc.com/v2/36991859863737/images/34971",
                        "rel": "self"
                    },
                    {
                        "href": "https://region-a.geo-1.compute.hpcloudsvc.com/36991859863737/images/34971",
                        "rel": "bookmark"
                    }
                ],
                "name": "CentOS 5.8 Server 64-bit 20120828",
                "progress": 100,
                "status": "ACTIVE",
                "updated": "2012-09-04T16:45:22Z"
            },
            {
                "created": "2012-05-07T04:54:46Z",
                "id": "120",
                "OS-EXT-IMG-SIZE:size": 325020160,
                "links": [
                    {
                        "href": "https://region-a.geo-1.compute.hpcloudsvc.com/v2/36991859863737/images/120",
                        "rel": "self"
                    },
                    {
                        "href": "https://region-a.geo-1.compute.hpcloudsvc.com/36991859863737/images/120",
                        "rel": "bookmark"
                    }
                ],
                "name": "Ubuntu Precise 12.04 LTS Server 64-bit 20120424",
                "progress": 100,
                "status": "ACTIVE",
                "updated": "2012-05-07T04:54:51Z"
            }
        ]
    }

XML

    <images xmlns="http://docs.openstack.org/compute/api/v2" xmlns:atom="http://www.w3.org/2005/Atom">
        <image created="2012-09-04T16:45:17Z" id="34971" OS-EXT-IMG-SIZE:size="325020160" name="CentOS 5.8 Server 64-bit 20120828" progress="100" status="ACTIVE" updated="2012-09-04T16:45:22Z">
            <atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/v2/36991859863737/images/34971" rel="self"/>
            <atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/36991859863737/images/34971" rel="bookmark"/>
        </image>
        <image created="2012-05-07T04:54:46Z" id="120" OS-EXT-IMG-SIZE:size="325020160" name="Ubuntu Precise 12.04 LTS Server 64-bit 20120424" progress="100" status="ACTIVE" updated="2012-05-07T04:54:51Z">
            <atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/v2/36991859863737/images/120" rel="self"/>
            <atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/36991859863737/images/120" rel="bookmark"/>
        </image>
    </images>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/images'

##### 4.4.19.2 Get Image Size ##### {#getImageSize}
##### GET /v2/{project_id}/images/{image_id} #####

Extends the image operation [Get Image Details](#getImage) by adding the attribute OS-EXT-IMG-SIZE:size to the image details.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p></li>
<li><p><em>image_id</em> - The ID for the image. </p></li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 200

JSON


        {
            "created": "2012-09-04T16:45:17Z",
            "id": "34971",
            "OS-EXT-IMG-SIZE:size": 325020160,
            "links": [
                {
                    "href": "https://region-a.geo-1.compute.hpcloudsvc.com/v2/36991859863737/images/34971",
                    "rel": "self"
                },
                {
                    "href": "https://region-a.geo-1.compute.hpcloudsvc.com/36991859863737/images/34971",
                    "rel": "bookmark"
                }
            ],
            "name": "CentOS 5.8 Server 64-bit 20120828",
            "progress": 100,
            "status": "ACTIVE",
            "updated": "2012-09-04T16:45:22Z"
        }

XML

        <image created="2012-09-04T16:45:17Z" id="34971" OS-EXT-IMG-SIZE:size="325020160" name="CentOS 5.8 Server 64-bit 20120828" progress="100" status="ACTIVE" updated="2012-09-04T16:45:22Z">
            <atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/v2/36991859863737/images/34971" rel="self"/>
            <atom:link href="https://region-a.geo-1.compute.hpcloudsvc.com/36991859863737/images/34971" rel="bookmark"/>
        </image>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/images/34971'

#### 4.4.20 Instance Actions ####
##### 4.4.20.1 List Server Actions ##### {#listServerActions}
##### GET /v2/{project_id}/servers/{server_id}/os-instance-actions #####

View a log of actions and events taken on an server.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p></li>
<li><p><em>server_id</em> - The ID for the server. </p></li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "instanceActions": [
            {
                "action": "create",
                "instance_uuid": "60411f3c-a3eb-4952-8685-982bdb7aee0f",
                "message": null,
                "project_id": "10424127775376",
                "request_id": "req-c97ccabd-24aa-41c4-b122-4f7239386ad9",
                "start_time": "2013-05-10T12:41:56.000000",
                "user_id": "10957921068964"
            }
        ]
    }

XML

    <?xml version='1.0' encoding='UTF-8'?>
    <instanceActions>
        <instanceAction action="create" instance_uuid="60411f3c-a3eb-4952-8685-982bdb7aee0f"
            message="" project_id="10424127775376" request_id="req-c97ccabd-24aa-41c4-b122-4f7239386ad9"
            start_time="2013-05-10T12:41:56.000000" user_id="10957921068964" />
    </instanceActions>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/servers/44823245-b322-4ad0-9cf3-c3c84fd4cbec/os-instance-actions'

##### 4.4.20.2 List Server Action ##### {#listServerAction}
##### GET /v2/{project_id}/servers/{server_id}/os-instance-actions/{action_id}

View details of an action taken on a server.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p></li>
<li><p><em>server_id</em> - The ID for the server. </p></li>
<li><p><em>action_id</em> - The ID for the action. </p></li>
</ul>

**Data Parameters**

This call does not require a request body

**Response Data**

Normal Response Code(s): 202

JSON

    {
        "instanceAction": {
            "action": "create",
            "instance_uuid": "60411f3c-a3eb-4952-8685-982bdb7aee0f",
            "message": null,
            "project_id": "10424127775376",
            "request_id": "req-c97ccabd-24aa-41c4-b122-4f7239386ad9",
            "start_time": "2013-05-10T12:41:56.000000",
            "user_id": "10957921068964"
        }
    }

XML

    <?xml version='1.0' encoding='UTF-8'?>
    <instanceAction action="create" instance_uuid="60411f3c-a3eb-4952-8685-982bdb7aee0f"
        message="" project_id="10424127775376" request_id="req-c97ccabd-24aa-41c4-b122-4f7239386ad9"
        start_time="2013-05-10T12:41:56.000000" user_id="10957921068964" />

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/servers/44823245-b322-4ad0-9cf3-c3c84fd4cbec/os-instance-actions/req-c97ccabd-24aa-41c4-b122-4f7239386ad9'

#### 4.4.21 User Data ####
##### 4.4.21.1 Create Server With Users Data ##### {#createServerUserData}
##### POST /v2/{project_id}/servers #####

Extends the operation [Create Server](#createServer) to add the attribute user_data. This is a Base64 encoded string that is passed to the server by the meta data server.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p></li>
</ul>

**Request Parameters**

<ul>
<li><p><em>user_data</em> - User defined data passed as a Base64 encoded string</p></li>
</ul>

**Data Parameters**

This call does not require a request body

JSON

    {
        "server": {
            "flavorRef": "101",
            "imageRef": "8dbf51b8-8fcd-4218-823c-62b4b79acd0b",
            "name": "server-example",
            "user_data": "SUNBZ0lDQWdEUW9pUVNCamJHOTFaQ0JrYjJWeklHNXZkQ0JyYm05M0lIZG9lU0Jw"
        }
    }

XML

    <?xml version="1.0" ?>
    <server flavorRef="101" imageRef="8dbf51b8-8fcd-4218-823c-62b4b79acd0b" name="server-example" xmlns="http://docs.openstack.org/compute/api/v2">
        <user_data>SUNBZ0lDQWdEUW9pUVNCamJHOTFaQ0JrYjJWeklHNXZkQ0JyYm05M0lIZG9lU0Jw</user_data>
    </server>

**Response Data**

Normal Response Code(s): 202

JSON

    {
        "server": {
            "adminPass": "e2SxMBW25VkR",
            "id": "1fe0fc7d-1fed-4312-9ea4-8591d42c511d",
            "links": [
                {
                    "href": "http://region-a.geo-1.compute.hpcloudsvc.com/v2/10424127775376/servers/1fe0fc7d-1fed-4312-9ea4-8591d42c511d",
                    "rel": "self"
                },
                {
                    "href": "http://region-a.geo-1.compute.hpcloudsvc.com/10424127775376/servers/1fe0fc7d-1fed-4312-9ea4-8591d42c511d",
                    "rel": "bookmark"
                }
            ],
            "security_groups": [
                {
                    "name": "default"
                }
            ]
        }
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <server adminPass="e2SxMBW25VkR" id="1fe0fc7d-1fed-4312-9ea4-8591d42c511d" xmlns="http://docs.openstack.org/compute/api/v1.1" xmlns:atom="http://www.w3.org/2005/Atom">
        <metadata/>
        <atom:link href="http://region-a.geo-1.compute.hpcloudsvc.com/v2/10424127775376/servers/1fe0fc7d-1fed-4312-9ea4-8591d42c511d" rel="self"/>
        <atom:link href="http://region-a.geo-1.compute.hpcloudsvc.com/10424127775376/servers/1fe0fc7d-1fed-4312-9ea4-8591d42c511d" rel="bookmark"/>
        <security_groups>
            <security_group name="default"/>
        </security_groups>
    </server>

**Curl Example**

    curl -i -X 'POST'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/v2/{project_id}/servers' -d '{"server": {"flavorRef": "101", "imageRef": "8dbf51b8-8fcd-4218-823c-62b4b79acd0b", "name": "server-example", "user_data": "SUNBZ0lDQWdEUW9pUVNCamJHOTFaQ0JrYjJWeklHNXZkQ0JyYm05M0lIZG9lU0Jw" }}'

#### 4.4.22 Extended Floating IPs ####
##### 4.4.22.1 Add Floating IP with Fixed ##### {#addFloatingIpWithFixed}
##### POST /v2/{project_id}/servers/{server_id}/action #####

Extends the [Add Floating IP](#addFloatingIP) operation to allow the user to specify a Fixed IP address.

**Request Parameters**

<ul>
<li><p><em>fixed_address</em> - The fixed address to add to the server. </p>
</li>
</ul>

**Request Data**

JSON

    {
        "addFloatingIp": {
            "address": "15.185.230.113",
            "fixed_address": "10.10.10.22"
        }
    }

XML

    <?xml version="1.0" ?>
    <addFloatingIp xmlns="http://docs.openstack.org/compute/api/v2">
        <address>
            15.185.230.99
        </address>
        <fixed_address>
            10.10.10.22
        </fixed_address>
    </addFloatingIp>

**Response Data**

Normal Response Code(s): 202

**Curl Example**

    curl -i -X 'POST'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' -d '{"addFloatingIp": {"address": "15.185.230.113", "fixed_address": "10.10.10.22"}}' {BaseURI}/v2/{project_id}/servers/233691/action'

#### 4.4.23 Extended IPs ####
##### 4.4.23.1 List with IPs  ##### {#listWithIps}
##### GET /v2/{project_id}/servers/detail #####

This extends the [List Servers Detail](#listDetailServers) operation with IP address information. Each server result includes the attribute OS-EXT-IPS:ip_address giving details of the IP address of the server.

**Data Parameters**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
</ul>

**Request Data**

This call does not require a request body.

**Response Data**

Normal Response Code(s): 200

JSON

    {
        "servers": [
            {
                "status": "ACTIVE",
                "updated": "2013-07-03T14:04:31Z",
                "hostId": "8681d9e1519858bad616ce3711eecbf98891a26544d829285489f6b2",
                "addresses": {
                    "private": [
                        {
                            "version": 4,
                            "addr": "10.0.0.3",
                            "OS-EXT-IPS:type": "fixed"
                        }
                    ]
                },
                "links": [
                    {
                        "href": "http://10.6.45.16:8774/v2/e3db2bf577c74594b69eb47d4174701f/servers/7a807421-85fa-4e65-b890-17411b02d3e3",
                        "rel": "self"
                    },
                    {
                        "href": "http://10.6.45.16:8774/e3db2bf577c74594b69eb47d4174701f/servers/7a807421-85fa-4e65-b890-17411b02d3e3",
                        "rel": "bookmark"
                    }
                ],
                "key_name": null,
                "image": {
                    "id": "fcde4357-0b5b-43d2-98f1-f373c84f73d0",
                    "links": [
                        {
                            "href": "http://10.6.45.16:8774/e3db2bf577c74594b69eb47d4174701f/images/fcde4357-0b5b-43d2-98f1-f373c84f73d0",
                            "rel": "bookmark"
                        }
                    ]
                },
                "flavor": {
                    "id": "1",
                    "links": [
                        {
                            "href": "http://10.6.45.16:8774/e3db2bf577c74594b69eb47d4174701f/flavors/1",
                            "rel": "bookmark"
                        }
                    ]
                },
                "id": "7a807421-85fa-4e65-b890-17411b02d3e3",
                "security_groups": [
                    {
                        "name": "default"
                    }
                ],
                "user_id": "3952db5d6cac45619a78cdd0c52c8bc2",
                "name": "server1",
                "created": "2013-07-03T14:04:26Z",
                "tenant_id": "e3db2bf577c74594b69eb47d4174701f",
                "accessIPv4": "",
                "accessIPv6": "",
                "progress": 0,
                "config_drive": "",
                "metadata": {}
            }
        ]
    }

XML

    <servers xmlns="http://docs.openstack.org/compute/api/v1.1" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:OS-EXT-IPS="http://docs.openstack.org/compute/ext/extended_ips/api/v1.1" >
    <server 
       status="ACTIVE" 
       updated="2013-07-03T14:04:31Z" 
       hostId="8681d9e1519858bad616ce3711eecbf98891a26544d829285489f6b2" 
       name="server1" 
       created="2013-07-03T14:04:26Z" 
       userId="3952db5d6cac45619a78cdd0c52c8bc2" 
       tenantId="e3db2bf577c74594b69eb47d4174701f" 
       accessIPv4="" 
       accessIPv6="" 
       progress="0" 
       id="7a807421-85fa-4e65-b890-17411b02d3e3" 
       key_name="None" 
       config_drive="">
       <image id="fcde4357-0b5b-43d2-98f1-f373c84f73d0">
           <atom:link href="http://10.6.45.16:8774/e3db2bf577c74594b69eb47d4174701f/images/fcde4357-0b5b-43d2-98f1-f373c84f73d0" rel="bookmark" />
       </image>
       <flavor id="1">
           <atom:link href="http://10.6.45.16:8774/e3db2bf577c74594b69eb47d4174701f/flavors/1" rel="bookmark" />
       </flavor>
       <metadata />
       <addresses>
           <network id="private">
               <ip OS-EXT-IPS:type="fixed" 
                   version="4" 
                   addr="10.0.0.3" />
           </network>
       </addresses>
       <atom:link href="http://10.6.45.16:8774/v2/e3db2bf577c74594b69eb47d4174701f/servers/7a807421-85fa-4e65-b890-17411b02d3e3" rel="self" />
       <atom:link href="http://10.6.45.16:8774/e3db2bf577c74594b69eb47d4174701f/servers/7a807421-85fa-4e65-b890-17411b02d3e3" rel="bookmark" />
       <security_groups>
           <security_group name="default" />
       </security_groups>
    </server>
    </servers>

**Curl Example**


    curl -i -X GET -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}'  'http://10.6.45.16:8774/v2/e3db2bf577c74594b69eb47d4174701f/servers/detail'

##### 4.4.23.2 Get with IPs ##### {#getWithIps}
##### GET /v2/{project_id}/servers/{server_id} #####

This extends the [List Servers Detail](#listDetailServers) operation with IP address information. Each server result includes the attribute OS-EXT-IPS:ip_address giving details of the IP address of the server.

**Data Parameters**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
<li><p><em>server_id</em> - Server ID. This parameter can be an integer ID or a UUID.</p>
</li>
</ul>

**Data Parameters**

This call does not require a request body.

**Response Data**

Normal Response Code(s): 200

JSON

    {
      "server": {
        "status": "ACTIVE",
        "updated": "2013-07-03T14:04:31Z",
        "hostId": "8681d9e1519858bad616ce3711eecbf98891a26544d829285489f6b2",
        "addresses": {
          "private": [
            {
              "version": 4,
              "addr": "10.0.0.3",
              "OS-EXT-IPS:type": "fixed"
            }
          ]
        },
        "links": [
          {
            "href": "http://10.6.45.16:8774/v2/e3db2bf577c74594b69eb47d4174701f/servers/7a807421-85fa-4e65-b890-17411b02d3e3",
            "rel": "self"
          },
          {
            "href": "http://10.6.45.16:8774/e3db2bf577c74594b69eb47d4174701f/servers/7a807421-85fa-4e65-b890-17411b02d3e3",
            "rel": "bookmark"
          }
        ],
        "key_name": null,
        "image": {
          "id": "fcde4357-0b5b-43d2-98f1-f373c84f73d0",
          "links": [
            {
              "href": "http://10.6.45.16:8774/e3db2bf577c74594b69eb47d4174701f/images/fcde4357-0b5b-43d2-98f1-f373c84f73d0",
              "rel": "bookmark"
            }
          ]
        },
        "flavor": {
          "id": "1",
          "links": [
            {
              "href": "http://10.6.45.16:8774/e3db2bf577c74594b69eb47d4174701f/flavors/1",
              "rel": "bookmark"
            }
          ]
        },
        "id": "7a807421-85fa-4e65-b890-17411b02d3e3",
        "security_groups": [
          {
            "name": "default"
          }
        ],
        "user_id": "3952db5d6cac45619a78cdd0c52c8bc2",
        "name": "server1",
        "created": "2013-07-03T14:04:26Z",
        "tenant_id": "e3db2bf577c74594b69eb47d4174701f",
        "accessIPv4": "",
        "accessIPv6": "",
        "progress": 0,
        "config_drive": "",
        "metadata": {}
      }
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <server xmlns="http://docs.openstack.org/compute/api/v1.1" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:OS-EXT-IPS="http://docs.openstack.org/compute/ext/extended_ips/api/v1.1"
       status="ACTIVE" 
       updated="2013-07-03T14:04:31Z" 
       hostId="8681d9e1519858bad616ce3711eecbf98891a26544d829285489f6b2" 
       name="server1"
       created="2013-07-03T14:04:26Z"
       userId="3952db5d6cac45619a78cdd0c52c8bc2"
       tenantId="e3db2bf577c74594b69eb47d4174701f"
       accessIPv4=""
       accessIPv6=""
       progress="0"
       id="7a807421-85fa-4e65-b890-17411b02d3e3"
       key_name="None"
       config_drive="">
       <image id="fcde4357-0b5b-43d2-98f1-f373c84f73d0">
           <atom:link href="http://10.6.45.16:8774/e3db2bf577c74594b69eb47d4174701f/images/fcde4357-0b5b-43d2-98f1-f373c84f73d0" rel="bookmark" />
       </image>
       <flavor id="1">
           <atom:link href="http://10.6.45.16:8774/e3db2bf577c74594b69eb47d4174701f/flavors/1" rel="bookmark" />
       </flavor>
       <metadata />
       <addresses>
           <network id="private">
               <ip OS-EXT-IPS:type="fixed"
                   version="4"
                   addr="10.0.0.3" />
           </network>
       </addresses>
       <atom:link href="http://10.6.45.16:8774/v2/e3db2bf577c74594b69eb47d4174701f/servers/7a807421-85fa-4e65-b890-17411b02d3e3" rel="self" />
       <atom:link href="http://10.6.45.16:8774/e3db2bf577c74594b69eb47d4174701f/servers/7a807421-85fa-4e65-b890-17411b02d3e3" rel="bookmark" />
       <security_groups>
           <security_group name="default" />
       </security_groups>
    </server>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' 'http://10.6.45.16:8774/v2/e3db2bf577c74594b69eb47d4174701f/servers/7a807421-85fa-4e65-b890-17411b02d3e3'

#### 4.4.24 Extended IPs MAC ####
##### 4.4.24.1 List with IPs MAC  ##### {#listWithIpsMac}
##### GET /v2/{project_id}/servers/detail #####

This extends the [List Servers Detail](#listDetailServers) operation with IP MAC Address information. Each server result includes the attribute OS-EXT-IPS-MAC:mac_address giving details of the mac address associated with each ip address of the server.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
</ul>

**Data Parameters**

This call does not require a request body.

**Response Data**

Normal Response Code(s): 200

JSON

    {
      "servers": [
        {
          "status": "ACTIVE",
          "updated": "2013-07-03T14:04:31Z",
          "hostId": "8681d9e1519858bad616ce3711eecbf98891a26544d829285489f6b2",
          "addresses": {
            "private": [
              {
                "OS-EXT-IPS-MAC:mac_addr": "fa:16:3e:5a:c0:ac",
                "version": 4,
                "addr": "10.0.0.3",
                "OS-EXT-IPS:type": "fixed"
              }
            ]
          },
          "links": [
            {
              "href": "http://10.6.45.16:8774/v2/e3db2bf577c74594b69eb47d4174701f/servers/7a807421-85fa-4e65-b890-17411b02d3e3",
              "rel": "self"
            },
            {
              "href": "http://10.6.45.16:8774/e3db2bf577c74594b69eb47d4174701f/servers/7a807421-85fa-4e65-b890-17411b02d3e3",
              "rel": "bookmark"
            }
          ],
          "key_name": null,
          "image": {
            "id": "fcde4357-0b5b-43d2-98f1-f373c84f73d0",
            "links": [
              {
                "href": "http://10.6.45.16:8774/e3db2bf577c74594b69eb47d4174701f/images/fcde4357-0b5b-43d2-98f1-f373c84f73d0",
                "rel": "bookmark"
              }
            ]
          },
          "flavor": {
            "id": "1",
            "links": [
              {
                "href": "http://10.6.45.16:8774/e3db2bf577c74594b69eb47d4174701f/flavors/1",
                "rel": "bookmark"
              }
            ]
          },
          "id": "7a807421-85fa-4e65-b890-17411b02d3e3",
          "security_groups": [
            {
              "name": "default"
            }
          ],
          "user_id": "3952db5d6cac45619a78cdd0c52c8bc2",
          "name": "server1",
          "created": "2013-07-03T14:04:26Z",
          "tenant_id": "e3db2bf577c74594b69eb47d4174701f",
          "accessIPv4": "",
          "accessIPv6": "",
          "progress": 0,
          "config_drive": "",
          "metadata": {}
        }
      ]
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <servers xmlns="http://docs.openstack.org/compute/api/v1.1" xmlns:OS-EXT-IPS-MAC="http://docs.openstack.org/compute/ext/extended_ips_mac/api/v1.1" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:OS-EXT-IPS="http://docs.openstack.org/compute/ext/extended_ips/api/v1.1">
      <server
       status="ACTIVE"
       updated="2013-07-03T14:04:31Z"
       hostId="8681d9e1519858bad616ce3711eecbf98891a26544d829285489f6b2"
       name="server1"
       created="2013-07-03T14:04:26Z"
       userId="3952db5d6cac45619a78cdd0c52c8bc2"
       tenantId="e3db2bf577c74594b69eb47d4174701f"
       accessIPv4=""
       accessIPv6=""
       progress="0"
       id="7a807421-85fa-4e65-b890-17411b02d3e3"
       key_name="None"
       config_drive="">
       <image id="fcde4357-0b5b-43d2-98f1-f373c84f73d0">
         <atom:link href="http://10.6.45.16:8774/e3db2bf577c74594b69eb47d4174701f/images/fcde4357-0b5b-43d2-98f1-f373c84f73d0" rel="bookmark" />
       </image>
       <flavor id="1">
         <atom:link href="http://10.6.45.16:8774/e3db2bf577c74594b69eb47d4174701f/flavors/1" rel="bookmark" />
       </flavor>
       <metadata />
       <addresses>
         <network id="private">
           <ip OS-EXT-IPS:type="fixed"
               version="4" 
               addr="10.0.0.3" 
               OS-EXT-IPS-MAC:mac_addr="fa:16:3e:5a:c0:ac" />
         </network>
       </addresses>
       <atom:link href="http://10.6.45.16:8774/v2/e3db2bf577c74594b69eb47d4174701f/servers/7a807421-85fa-4e65-b890-17411b02d3e3" rel="self" />
       <atom:link href="http://10.6.45.16:8774/e3db2bf577c74594b69eb47d4174701f/servers/7a807421-85fa-4e65-b890-17411b02d3e3" rel="bookmark" />
       <security_groups>
           <security_group name="default" />
       </security_groups>
      </server>
    </servers>

**Curl Example**

    curl -i -X GET -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}'  'http://10.6.45.16:8774/v2/e3db2bf577c74594b69eb47d4174701f/servers/detail'

##### 4.4.24.2 Get with IPs ##### {#getWithIpsMac}
##### GET /v2/{project_id}/servers/{server_id} #####

This extends the [List Servers Detail](#listDetailServers) operation with IP MAC Address information. Each server result includes the attribute OS-EXT-IPS-MAC:mac_address giving details of the mac address associated with each ip address of the server.

**Request Data**

<ul>
<li><p><em>project_id</em> - The ID for the project or account. </p>
</li>
<li><p><em>server_id</em> - Server ID. This parameter can be an integer ID or a UUID.</p>
</li>
</ul>

**Data Parameters**

This call does not require a request body.

**Response Data**

Normal Response Code(s): 200

JSON

    {
      "server": {
        "status": "ACTIVE",
        "updated": "2013-07-03T14:04:31Z",
        "hostId": "8681d9e1519858bad616ce3711eecbf98891a26544d829285489f6b2",
        "addresses": {
          "private": [
            {
              "OS-EXT-IPS-MAC:mac_addr": "fa:16:3e:5a:c0:ac",
              "version": 4,
              "addr": "10.0.0.3",
              "OS-EXT-IPS:type": "fixed"
            }
          ]
        },
        "links": [
          {
            "href": "http://10.6.45.16:8774/v2/e3db2bf577c74594b69eb47d4174701f/servers/7a807421-85fa-4e65-b890-17411b02d3e3",
            "rel": "self"
          },
          {
            "href": "http://10.6.45.16:8774/e3db2bf577c74594b69eb47d4174701f/servers/7a807421-85fa-4e65-b890-17411b02d3e3",
            "rel": "bookmark"
          }
        ],
        "key_name": null,
        "image": {
          "id": "fcde4357-0b5b-43d2-98f1-f373c84f73d0",
          "links": [
            {
              "href": "http://10.6.45.16:8774/e3db2bf577c74594b69eb47d4174701f/images/fcde4357-0b5b-43d2-98f1-f373c84f73d0",
              "rel": "bookmark"
            }
          ]
        },
        "flavor": {
          "id": "1",
          "links": [
            {
              "href": "http://10.6.45.16:8774/e3db2bf577c74594b69eb47d4174701f/flavors/1",
              "rel": "bookmark"
            }
          ]
        },
        "id": "7a807421-85fa-4e65-b890-17411b02d3e3",
        "security_groups": [
          {
            "name": "default"
          }
        ],
        "user_id": "3952db5d6cac45619a78cdd0c52c8bc2",
        "name": "server1",
        "created": "2013-07-03T14:04:26Z",
        "tenant_id": "e3db2bf577c74594b69eb47d4174701f",
        "accessIPv4": "",
        "accessIPv6": "",
        "progress": 0,
        "config_drive": "",
        "metadata": {}
      }
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <server xmlns="http://docs.openstack.org/compute/api/v1.1" xmlns:OS-EXT-IPS-MAC="http://docs.openstack.org/compute/ext/extended_ips_mac/api/v1.1" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:OS-EXT-IPS="http://docs.openstack.org/compute/ext/extended_ips/api/v1.1" 
       status="ACTIVE" 
       updated="2013-07-03T14:04:31Z" 
       hostId="8681d9e1519858bad616ce3711eecbf98891a26544d829285489f6b2" 
       name="server1" 
       created="2013-07-03T14:04:26Z" 
       userId="3952db5d6cac45619a78cdd0c52c8bc2"
       tenantId="e3db2bf577c74594b69eb47d4174701f"
       accessIPv4=""
       accessIPv6=""
       progress="0"
       id="7a807421-85fa-4e65-b890-17411b02d3e3"
       key_name="None"
       config_drive="">
       <image id="fcde4357-0b5b-43d2-98f1-f373c84f73d0">
           <atom:link href="http://10.6.45.16:8774/e3db2bf577c74594b69eb47d4174701f/images/fcde4357-0b5b-43d2-98f1-f373c84f73d0" rel="bookmark" />
       </image>
       <flavor id="1">
           <atom:link href="http://10.6.45.16:8774/e3db2bf577c74594b69eb47d4174701f/flavors/1" rel="bookmark" />
       </flavor>
       <metadata />
       <addresses>
           <network id="private">
               <ip OS-EXT-IPS:type="fixed"
                   version="4" 
                   addr="10.0.0.3" 
                   OS-EXT-IPS-MAC:mac_addr="fa:16:3e:5a:c0:ac" />
           </network>
       </addresses>
       <atom:link href="http://10.6.45.16:8774/v2/e3db2bf577c74594b69eb47d4174701f/servers/7a807421-85fa-4e65-b890-17411b02d3e3" rel="self" />
       <atom:link href="http://10.6.45.16:8774/e3db2bf577c74594b69eb47d4174701f/servers/7a807421-85fa-4e65-b890-17411b02d3e3" rel="bookmark" />
       <security_groups>
           <security_group name="default" />
       </security_groups>
    </server>

**Curl Example**

    curl -i -X 'GET'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' 'http://10.6.45.16:8774/v2/e3db2bf577c74594b69eb47d4174701f/servers/7a807421-85fa-4e65-b890-17411b02d3e3'

#### 4.4.25 Server start-stop ####
##### 4.4.25.1 Start Server ##### {#startServer}
##### POST /v2/{project_id}/servers/{server_id}/action #####

Starts the specified server. Specify the <code>os-start</code> action in the request body.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization </a> .) </p>
</li>
<li><p><em>server_id</em> - Server ID. This parameter can be an integer ID or a UUID. In either case, the specified server must be in the addressed Availability Zone. </p>
</li>
</ul>

**Data Parameters**

JSON

    {
        "os-start": null
    }

XML

    <?xml version="1.0" ?>
    <os-start xmlns="http://docs.openstack.org/compute/api/v2"/>

**Response Data**

Normal Response Code(s): 202

**Curl Example**

    curl -i -X 'POST'  -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' -d '{"os-start":null}' {BaseURI}/v2/{project_id}/servers/233069/action'

##### 4.4.25.2 Stop Server ##### {#stopServer}
##### POST /v2/{project_id}/servers/{server_id}/action #####

Stops the specified server. Specify the <code>os-stop</code> action in the request body.

**Request Data**

<ul>
<li><p><em>project_id</em> - The projectId. (See <a href="#Authorization"> Authorization </a> .) </p>
</li>
<li><p><em>server_id</em> - Server ID. This parameter can be an integer ID or a UUID. In either case, the specified server must be in the addressed Availability Zone.</p>
</li>
</ul>

**Data Parameters**

JSON

    {
        "os-stop": null
    }

XML

    <?xml version="1.0" ?>
    <os-stop xmlns="http://docs.openstack.org/compute/api/v2"/>

**Response Data**

Normal Response Code(s): 202

**Curl Example**

    curl -i -X 'POST' -H "Content-type: application/json" -H 'X-Auth-Token: {Auth_Token}' -d '{"os-stop":null}' {BaseURI}/v2/{project_id}/servers/233069/action'

## 5. Changes From Version 1.0 ##

Version 1.1 of the Compute service API introduces a significant number of additional features over version 1.0. These can be divided into new extensions and the new network model. 

### 5.1 Extensions ###

The following is a list of the extensions in version 1.0:

+ os-keypairs
+ os-volumes
+ os-console-output
+ security_groups
+ os-floating-ips
+ hp-bootable-volumes
+ hp-volume-backup

The Compute service extensions hp-bootable-volumes and hp-volume-backup in version 1.0 are replaced in version 1.1 by the standard OpenStack extension os-volumes. New extensions added in version 1.1 include the following:

+ os-availability-zone
+ os-config-drive
+ os-create-server-ext
+ OS-EXT-AZ
+ OS-EXT-STS
+ OS-FLV-EXT-DATA
+ os-multiple-create 
+ OS-SCH-HNT
+ os-used-limits
+ os-volumes
+ os-rescue
+ os-consoles
+ os-flavor-rxtx
+ os-flavor-swap
+ os-hide-server-address
+ OS-EXT-IMG_SIZE
+ os-instance-actions
+ os-user-data
+ os-extended-floating-ips
+ OS-EXT-IPS
+ OS-EXT-IPS-MAC
+ os-server-start-stop

### 5.2 Networking ###

The most significant change in version 1.1 is the introduction of Neutron networking. Neutron introduces a new network model and provides the capability to create multiple private networks, network services, security groups and inter-network connectivity. These features are made available through the Network API but influence the behavior of the Compute API. 

For the purpose of backward compatibility, the Compute API continues to provide security group management through the os-security-group extension and the ability to control connection to available networks. A default network and security group is provided to all projects in version 1.1 that approximates to the network model implemented in verson 1.0. The exception is that the defaults isolate projects from one another.

Where a user has created additional networks for a project via the Network API, the network model deviates from backward compatibility and requires the user to specify which networks or network ports to use in the [Create Server](#createServer) operation. 

## 6. Additional References ##

1. [OpenStack API Documentation](http://api.openstack.org)
2. [OpenStack Compute Developer Guide - API v2](http://docs.openstack.org/api/openstack-compute/2/content/)

## 7. Glossary ##

**Server:** A server is a irtual machine instance within Compute. See [Servers](#Servers).

**Flavor:** A set of attributes which describe the resources available to a server. See [Flavors](#Flavors).

**Image:** The contents of a disk. See [Images](#Images).

**Reboot:** Restart a server. See [Reboot Server](#rebootServer)

**Rebuild:** Reinitialize an existing server specifying a new image from which the server is to be booted. See [Rebuild Server](#rebuildServer).

**Resize:** Change the flavor of an existing image. This operation is not supported by Compute.
