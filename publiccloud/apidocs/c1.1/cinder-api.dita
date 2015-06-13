---
layout: page
permalink: /publiccloud/api/block-storage/
title: "HP Helion Public Cloud Block Storage API Specification"
description: "HP Helion Public Cloud Block Storage API Specification"
keywords: "block storage, volume, cinder, bootable volume, volume backup"
product: block-storage

---
<!--PUBLISHED-->
# HP Helion Public Cloud Block Storage API Specification

**Date:** May 2014

**Document Version:** 1.7

## 1. Overview

The HP Helion Public Cloud Block Storage service is based on
[OpenStack Cinder](http://docs.openstack.org/developer/cinder/).

HP Helion Public Cloud Block Storage provides persistent block devices that can be attached to [HP Helion Public Cloud Compute instances](/api/compute/). HP Helion Public Cloud Block Storage volumes can be created in sizes from 1GB to 2047GB. Volumes attached to instances can be used as standard block devices. As volumes areexposed as standard block devices, the user is responsible for partitioning them and creating filesystems on them. There are no limitations on whatfilesystems can be created on volumes other than those imposed by the operating system running on the instance to which to volume is attached. Volumes persistuntil the user deletes them. A volume can only be attached to one instance at a time.

HP Helion Public Cloud Block Storage provides data durability with volume snapshots and volume backups. Snapshots capture the point in time state of a volume and are quick to create. A volume from which snapshots have been created cannot be deleted while any of these snapshots remains in existence. To use a snapshot, the user must create a new volume from the snapshot. Backups are full copies of volumes stored to [HP Helion Public Cloud Object Storage](/api/object-storage/). Since they are full copies, they take longer to create than snapshots. Backups are independent of the original volume once created and are intended for archival and disaster recovery purposes.

HP Helion Public Cloud Block Storage also supports bootable volumes, volumes which are pre-initialized with an operating system image.

We will be referring to HP Helion Public Cloud Block Storage in this document as simply Block Storage or Block Storage service.

### 1.1 API Maturity Level

**Maturity Level**: *GA* (Block Storage is General Availability)

**Version API Status**: *CURRENT*

### 1.2 Document Revision History

| Version      | Date        | Description                                                         |
| :----------- | :---------- | :------------------------------------------------------------------ |
| 1.0          | 27-Mar-2013 | Initial draft.                                                      |
| 1.1          | 02-May-2013 | Added details of volume cloning to [create volume](#create_volume). |
| 1.2          | 06-Jun-2013 | Updated sections on volume snapshots to note volumes must be in an available state. Clarified that volumes with snapshots cannot be deleted. Added the additional availability zone az3. Changed the BASE_URI variable used in the curl examples to HOST_URI to avoid confusion with the BaseURI field used in the document. Updated from v1.1 to v2 for HP Helion Compute Service API Operations. Various other minor corrections. |
| 1.3          | 27-Aug-2013 | Added details of the limit on the maximum number of volumes and snapshots which can be created from an origin volume through any combination of create snapshot from volume, create volume from snapshot and clone volume operations. Documented the limit of 26 volumes which can be attached to a guest. Added details to 4.5.4.2 on how to reliably identify an attached volume from within a Linux guest. |
| 1.4          | 30-Aug-2013 | Updated references to tenant to use the term project. |
| 1.5          | Apr-2014    | Updated section 3.2 |
| 1.6 | April 2014 | Added section 4.5.1 for Limits |
| 1.7 | May 2014 | HP Helion updates |

### 1.3 Changes from First Gen API to Next Gen API

* Block Storage API status has changed from *Public Beta* to *General Availability*.
* All operations now support XML output (in addition to existing JSON output).
* Block Storage API requests are now cross-AZ, requests no longer need to be sent to individual AZ endpoints.
* Create volume requests can specify the AZ to use, defaulting to AZ2.
* Volumes can only be attached to instances in the same AZ. Similarly, Boot from volume instances can only be created in the same
AZ as the bootable volume.
* Block Storage API endpoints changed from *az*.*region*.*geo*.compute.hpcloudsvc.com to *region*.*geo*.block.hpcloudsvc.com.
* List volume backups and get volume backups use name instead of display_name.
* List volume backups and get volume backups use description instead of display_description.
* Backups API URI changed from /hp-volume-backups to /backups

## 2. Architecture View 

### 2.1 Overview

The Block Storage API is implemented as a set of RESTful web services. All volume, snapshot and backup operations can be performed with standard HTTP calls. See the [Wikipedia article on REST](http://en.wikipedia.org/wiki/REST)  for more information.

### 2.2 Resources

The Block Storage API allows the management of the following resources:

* [Volumes](#volume_resource)
* [Volume Snapshots](#volume_snapshot_resource)
* [Volume Backups](#volume_backup_resource)

#### 2.2.1 Block Storage Volumes #### {#volume_resource}

Volumes are persistent block devices provided by the Block Storage API. Data on volumes is accessed in the same way that a user accesses data on local physical block devices. On creation, volumes are in an unattached state (and the volume status is _available_). Volume size is specified at creation time and is fixed for the lifetime of the volume. Volume sizes can be from 1GB to 2047GB in units of 1GB. Volumes have an optional _display-name_ and _display-description_ associated with them. 

__Bootable volumes__ can be created by specifying an _image-id_ when creating
a new volume. The _image-id_ must refer to a suitable image available from
the image service. The bootable volume can be used as the root file system for
a new instance, and offers a persistent storage model to an otherwise ephemeral
instance. An instance created from a bootable volume can be terminated without
losing the volume or its contents (although the instance should be terminated
using the best practices for the guest operating system to avoid the data loss which can result from the improper shutdown of any operating system). A new instance can be created from the same volume.

Volumes may also be created from existing [Volume Snapshots](#volume_snapshot_resource) by specifying the _snapshot-id_ at volume creation.

Custom metadata may be associated with a volume at creation time using a set
of optional key-value pairs.

#### 2.2.2 Block Storage Volume Snapshots #### {#volume_snapshot_resource}

Volume Snapshots capture the point in time state of a volume. They are quick
to create.  A volume from which snapshots have been created cannot be deleted while any of these snapshots remains in existence. Volumes must be in an unattached state (with a volume status of _available_) before a snapshot can be taken from them. To use a snapshot, a new volume must be created from a snapshot. Volume snapshots cannot be attached or otherwise used directly.

#### 2.2.3 Block Storage Volume Backups #### {#volume_backup_resource}

Volume Backups are full copies of volumes stored in HP Object Storage. Since
they are full copies, they take longer to create than snapshots. Backups are
independent of the original volume once created and are intended for archival
and disaster recovery purposes. Volumes must be in an unattached state (with
a volume status of _available_) before a backup can be taken from them. To use
a backup, the backup must be restored to a new or existing volume.

### 2.3 Conceptual/Logical Architecture View

The Block Storage facility consists of a,

* The Block Storage API - a RESTful API which allows users to view,
create, delete, modify, snapshot, backup and restore volumes.
* An extension to the [Compute API](/api/compute/) which allows users
 to attach/detach volumes to/from instances.
* The volume service which handles volume requests.
* The volume backup service which handles volume backup requests.

The compute service handles the volume attach/detach requests, communicating directly with the volume service to do so.

The volume backup service handles volume backup requests, communicating
directly with the volume service and the Object Storage service to
do so.

## 3. Account-level View

### 3.1 Accounts

An account is created when a user first signs up with HP Helion Public Cloud. A _project_ (with an associated _project_id_) is also created on first signing up with the cloud. All calls to the Block Storage APIs include the users
_project_id_ as part of the call. HP Helion and the OpenStack community previously used the term _tenant_ to refer to the what is now known as a _project_. The terms can be used interchangeably when reviewing HP Helion documentation (this document uses the term _project_).

Similarly, the references to _tenant_id_ can be read as _project_id_. For upstream OpenStack tools and libraries (including _python-cinderclient_ which can be used to interact with the Block Storage API), you can provide your _project_name_ anywhere _tenant_name_ is requested and your _project_id_ anywhere _tenant_id_ is requested. Similarly, where APIs return _tenant_id_ or _tenantId_, this is equivalent to your _project_id_.

For additional details on accounts, tenants and projects please refer to the
[Identity Service Overview](/api/identity/).

### 3.2 Regions and Availability Zones

**Region(s)**: region-a, region-b

**Availability Zone(s)**: az1, az2 and az3

### 3.3 Service Catalog

The listing below shows a fragment of the Service Catalog returned by the
Identity Service which contains the endpoints for Block Storage.

    {
    endpoints: [2]
        0:  {
        links: {
        self: "https://region-b.geo-1.identity.hpcloudsvc.com/v3/endpoints/13000300_P"
        }
        url: "https://region-b.geo-1.block.hpcloudsvc.com/v1/65589599430509"
        region: "region-b.geo-1"
        interface: "public"
        service_Id: "130"
        id: "13000300_P"
        }
        1:  {
        links: {
        self: "https://region-b.geo-1.identity.hpcloudsvc.com/v3/endpoints/130140_P"
        }
        url: "https://region-a.geo-1.block.hpcloudsvc.com/v1/65589599430509"
        region: "region-a.geo-1"
        interface: "public"
        service_Id: "130"
        id: "130140_P"
        }
    type: "volume"
    id: "130"
    links: {
    self: "https://region-b.geo-1.identity.hpcloudsvc.com/v3/services/130"
    }
    name: "Block Storage"
    }

## 4. REST API Specifications

### 4.1 Service API Operations ### {#service_api}

In the following sections, a set of examples of how to use each API
operation are provided using the *curl* command. The examples provided
use Bourne shell style environment variables but should be easily adapted
to Windows style environment variables if you are testing the examples
from a Windows system.

The curl examples do require the following variables to be set before
they will work: AUTH_TOKEN, HOST_URI and PROJECT_ID. Some examples also
use VOLUME_ID, BACKUP_ID and SERVER_ID.

One easy way to retrieve the AUTH_TOKEN, HOST_URI and PROJECT_ID variables
is to run the python novaclient or python cinderclient with the --debug
option with a valid set of credentials configured in your environment.
The variables can be extracted from any of the REQ lines in the debug output.
The VOLUME_ID, BACKUP_ID and SERVER_ID will be valid IDs from the list
of volumes, volume backups and compute instances that your user has
access to respectively.

#### 4.1.1 Block Storage Service API Operations

**Hosts**:   
https://region-a.geo-1.block.hpcloudsvc.com   
https://region-b.geo-1.block.hpcloudsvc.com

**BaseURI**: {Host}/v1/{project_id}

| Resource      | Operation                                                 | HTTP Method   | Path                          | JSON/XML?         | Privilege Level   |
| :-------      | :-------------------                                      | :----------   | :---------------------        | :---------------- | :--------------   |
| **Limits**  | [List limits](#list_limits) | GET | /limits | Y/Y | |
| **Volumes** | [List volumes](#list_volumes) | GET | /volumes | Y/Y | |
|             | [List volumes details](#list_volumes_details) | GET | /volumes/detail | Y/Y | |
|               | [Get volume details](#get_volume_details)                 | GET           | /volumes/{volume_id}          | Y/Y               |                   |
|               | [Create volume](#create_volume)                           | POST          | /volumes                      | Y/Y               |                   |
|               | [Set volume details](#set_volume_details)                 | PUT           | /volumes/{volume_id}          | Y/Y               |                   |
|               | [Delete volume](#delete_volume)                           | DELETE        | /volumes/{volume_id}          | Y/Y               |                   |
| **Snapshots** | [List volume snapshots](#list_snapshots)                  | GET           | /snapshots                    | Y/Y               |                   |
|               | [List volume snapshots details](#list_snapshots_details)  | GET           | /snapshots/detail             | Y/Y               |                   |
|               | [Get volume snapshot details](#get_snapshot_details)      | GET           | /snapshots/{snapshot_id}      | Y/Y               |                   |
|               | [Create volume snapshot](#create_snapshot)                | POST          | /snapshots                    | Y/Y               |                   |
|               | [Delete volume snapshot](#delete_snapshot)                | DELETE        | /snapshots/{snapshot_id}      | Y/Y               |                   |
| **Backups**   | [List volume backups](#list_backups)                      | GET           | /backups                      | Y/Y               |                   |
|               | [List volume backups details](#list_backups_details)      | GET           | /backups/detail               | Y/Y               |                   |
|               | [Get volume backup details](#get_backup_details)          | GET           | /backups/{backup_id}          | Y/Y               |                   |
|               | [Create volume backup](#create_backup)                    | POST          | /backups                      | Y/Y               |                   |
|               | [Delete volume backup](#delete_backup)                    | DELETE        | /backups/{backup_id}          | Y/Y               |                   |
|               | [Restore volume backup](#restore_backup)                  | POST          | /backups/{backup_id}/restore  | Y/Y               |                   |

#### 4.1.2 Compute Service API Operations

**Hosts**:   
https://region-a.geo-1.compute.hpcloudsvc.com   
https://region-b.geo-1.compute.hpcloudsvc.com

**BaseURI**: {Host}/v2/{project_id}

| Resource      | Operation                                             | HTTP Method   | Path                                                      | JSON/XML?         | Privilege Level   |
| :-------      | :-------------------                                  | :----------   | :---------------------                                    | :---------------- | :--------------   |
| **Servers**   | [List attached volumes](#list_attached_volumes)       | GET           | /servers/{server_id}/os-volume_attachments                | Y/Y               |                   |
|               | [Attach a volume](#attach_volume)                     | POST          | /servers/{server_id}/os-volume_attachments                | Y/Y               |                   |
|               | [Detach a volume](#detach_volume)                     | DELETE        | /servers/{server_id}/os-volume_attachments/{volume_id}    | Y/Y               |                   |
|               | [Get attached volume details](#get_attvolume_details) | GET           | /servers/{server_id}/os-volume_attachments/{volume_id}    | Y/Y               |                   |

### 4.2 Common Request Headers

Many operations accept request headers. This section provides an overview of
each request header. Consult the specific operation to determine if the
header applies to the operation and any other notes that are of interest.

#### 4.2.1 Accept #### {#accept_request}

Where applicable, this specifies the media types which are acceptable for the
response. The tables in [Service API Operations](#service_api) detail which
media types are supported for each operation. Typically, all operations
support either of the following formats:

* JSON (application/json)
* XML (application/xml)

The response format can also be specified by adding a _.json_ or _.xml_
extension to the request URI. If both an _Accept_ header and an
extension are used, the extension takes precedence. If no response format
is requested, JSON is the default.

For example:

    curl -H "Accept: application/json" ...

#### 4.2.2 Content-Type #### {#content_type_request}

Where applicable, this indicates the media type of the request body. The tables
in [Service API Operations](#service_api) detail which formats are supported
for each operation. Typically, all operations support either of the following
formats:

* JSON (application/json)
* XML (application/xml)

For example:

    curl -H "Content-Type: application/json" ...

#### 4.2.3 X-Auth-Token #### {#x_auth_token_request}

All requests to the Block Storage API must be accompanied by a token.
This is issued by the Identity Service in response to a successful
authentication request. Each token has a scope which describes which resources
are accessible with it. If the token is not specified or if an invalid or
expired token is specified, the request will fail.

### 4.3 Common Response Headers

#### 4.3.1 Content-Type #### {#content_type_response}

When the response includes a body, this indicates the media type of the
response body. For operations that return a body, an [Accept](#accept_request)
request header can be used to request a JSON or XML response.

#### 4.3.2 Content-Length #### {#content_length_response}

When the response includes a body, this indicates the length of the body in
bytes.

#### 4.3.3 Date #### {#date_response}

When supplied, the Date header is the time of the operation expressed in GMT
(effectively UTC) as shown in the following example:
 
      HTTP/1.1 200 OK
      Date: Sun, 06 Nov 1994 08:49:37 GMT

#### 4.3.4 X-Compute-Request-Id #### {#request_id_response}

The Block Storage API generates a unique id for each request received.
This id is reported in the response with the _X-Compute-Request-Id_ header and
can be used by support to track individual requests within the system in the
event of a failure.

### 4.4 Error Responses

When an error occurs at request time, the system will return an HTTP
error response code denoting the type of error. The system will also
return additional information about the fault in the body of the
response.

JSON

    {
        "badRequest": {
            "code": 400
            "message": "Malformed request body",
        }
    }

XML

    <badRequest code="400"
    xmlns="http://docs.openstack.org/volume/api/v1">
      <message>Malformed request body</message>
    </badRequest>

The error code is returned in the body of the response for convenience.
The message section returns a human-readable message that is appropriate
for display to the end user.

The following error codes are used by Block Storage.

|Code               | Description                                                                                                   | Notes                                                                                             |
|:---               | :----------                                                                                                   | :----                                                                                             |
| 5xx Server Error  | Response codes starting with 5 indicate the server has experienced an error and cannot process the request.   | Retry the request after a short delay. Contact Public Cloud support if the error persists.            |
| 400 Bad Request   | The request could not be processed by the server due to malformed syntax.                                     | Fix the request.                                                                                  |
| 401 Unauthorized  | This usually means that the [authorization token](#x_auth_token_request) is missing, invalid or expired.      | Supply a valid token, possibly by request a new one with valid credentials.                       |
| 403 Forbidden     | The request was a valid request, you do not have the appropriate access rights to the resource.               |                                                                                                   |
| 404 Not Found     | The requested resource could not be found.                                                                    | Either your are using an incorrect url or the resource request never existed or has been deleted. |

The OverLimit fault is generated when any limit threshold is exceeded. Limits
can be either transient limits (the number of requests allowed per second) or
static limits (the number of volumes or backups allowed for a particular
project).

JSON

    {
        "overLimit" : {
            "code" : 413,
            "message" : "This request was rate-limited."
        }
    }

XML

    <?xml version="1.0" encoding="UTF-8"?>
    <overLimit
        xmlns="http://docs.openstack.org/compute/api/v1.1"
        code="413">
      <message>This request was rate-limited.</message>
    </overLimit>

### 4.5 Service API Operation Details

#### 4.5.1 Limits #### {limits}
##### 4.5.1.1 List limits #### {#list_limits}
##### GET /limits

Returns current limits for the project.

**Request Data**

**URL Parameters**

* *project_id* - The unique identifier of the project or account.

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

JSON

    {
        limits: {
        rate: [0]
        absolute: {
            maxTotalVolumeGigabytes: 3000
            maxTotalVolumes: 20
            }
        }
    }

XML

    <?xml version='1.0' encoding='UTF-8' ?>
    <limits>
    <rates />
        <absolute>
            <limit name="maxTotalVolumeGigabytes" value="3000" />
            <limit name="maxTotalVolumes" value="20" />
        </absolute>
    </limits>

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/limits

#### 4.5.2 Volumes #### {#volumes}

See [Block Storage Volumes](#volume_resource) for details.

**Status Lifecycle**

_creating_ => _available_ (creation of standard volume)

_downloading_ => _available_ (creation of bootable volume)

_available_ => _attaching_ (during attach)

_attaching_ => _in-use_ (after attach)

_in-use_ => _detaching_ (during detach)

_detaching_ => _available_ (after detach)

_available_ => _backing-up_ (during volume backup creation)

_available_ => _restoring-backup_ (during volume backup restore)

In the event of an error the status can be  set to _error_. If an error occurs
 during attach, the status is set to _error_attaching_  and if an error occurs
during detach, the volume status is set to _error_detaching_. If an error occurs 
while restoring  a backup to a volume, the volume status is set to _error_restoring_.

**Rate Limits**

The Block Storage API has a limit of 1 call per second for each project.

**Quota Limits**

The quota as configured for the project governs the size of the volume that can
be created. An exception will be raised if quota is exceeded. Sample exception:

    413 Request Entity Too Large
    {
        "overLimit": {
            "code": 413,
            "message": "VolumeSizeExceedsAvailableQuota: Requested volume or snapshot exceeds allowed Gigabytes quota",
            "retryAfter": 0
        }
    }

The error reported to the user when using the standard python-cinderclient is:

    "ERROR: VolumeLimitExceeded: Maximum number of volumes allowed (10) exceeded"

when the number of volumes quota is exceeded and:

    "ERROR: VolumeSizeExceedsAvailableQuota: Requested volume or snapshot exceeds allowed Gigabytes quota"

when the volume size quota is exceed.

The default per-project quotas are as follows:

| Resource                                  | Quota |
| :-------                                  | :---- |
| **Total No. of Volumes and Snapshots**    | 10    |
| **Total Storage (GB)**                    | 3000  |

**Business Rules**

There is an additional limit on the maximum number of volumes and snapshots which can
be created from an origin volume through any combination of create snapshot from
volume, create volume from snapshot and clone volume operations. The maximum number
of such operations that be performed on any one volume is currently 10. Attempting
to perform additional create snapshot, create volume from snapshot or clone volume
operations after hitting this limit will result in the created resources going into
an error state.

##### 4.5.2.1 List volumes #### {#list_volumes}
##### GET /volumes

Lists volumes for this project.

**Request Data**

**URL Parameters**

* *project_id* - The unique identifier of the project or account.

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

JSON

    {
        "volumes": [
            {
                "attachments": [], 
                "availability_zone": "az1", 
                "bootable": "false", 
                "created_at": "2013-01-23T11:25:03.000000", 
                "display_description": "test volume 1", 
                "display_name": "testvol01", 
                "id": "128a2078-0de3-4ff2-bf9f-d315e91fe3bb", 
                "metadata": {}, 
                "size": 200, 
                "snapshot_id": null, 
                "source_volid": null, 
                "status": "available", 
                "volume_type": "None"
            }, 
            {
                "attachments": [
                    {
                        "device": "/dev/vdd", 
                        "id": "29b53979-c09d-4944-a170-5430aac864df", 
                        "server_id": "c31ae64f-03d4-4bc9-b2bf-06f80db0ff62", 
                        "volume_id": "29b53979-c09d-4944-a170-5430aac864df"
                    }
                ], 
                "availability_zone": "az1", 
                "bootable": "true", 
                "created_at": "2013-01-21T16:36:19.000000", 
                "display_description": "test volume 1", 
                "display_name": "testvol01", 
                "id": "29b53979-c09d-4944-a170-5430aac864df", 
                "metadata": {}, 
                "size": 5, 
                "snapshot_id": null, 
                "source_volid": null, 
                "status": "in-use", 
                "volume_type": "None"
            }, 
            {
                "attachments": [], 
                "availability_zone": "az1", 
                "bootable": "false", 
                "created_at": "2013-01-21T14:32:27.000000", 
                "display_description": null, 
                "display_name": null, 
                "id": "d9f5479a-a9af-4e96-b418-0d9a602a8b03", 
                "metadata": {}, 
                "size": 2, 
                "snapshot_id": "2ee9a7ed-48f3-481c-a20e-6c53bf08c067", 
                "source_volid": null, 
                "status": "available", 
                "volume_type": "None"
            }, 
    

XML

    <?xml version="1.0" ?>
    <volumes xmlns="http://docs.openstack.org/volume/api/v1" xmlns:atom="http://www.w3.org/2005/Atom">
        <volume availability_zone="nova" created_at="2013-01-23 11:25:03" display_description="None" display_name="None" id="128a2078-0de3-4ff2-bf9f-d315e91fe3bb" size="200" snapshot_id="None" source_volid="None" status="error" volume_type="None">
            <attachments/>
            <metadata/>
        </volume>
        <volume availability_zone="nova" created_at="2013-01-21 16:36:19" display_description="None" display_name="None" id="29b53979-c09d-4944-a170-5430aac864df" size="5" snapshot_id="None" source_volid="None" status="in-use" volume_type="None">
            <attachments>
                <attachment device="/dev/vdd" id="29b53979-c09d-4944-a170-5430aac864df" server_id="c31ae64f-03d4-4bc9-b2bf-06f80db0ff62" volume_id="29b53979-c09d-4944-a170-5430aac864df"/>
            </attachments>
            <metadata/>
        </volume>
        <volume availability_zone="nova" created_at="2013-01-21 14:32:27" display_description="None" display_name="None" id="d9f5479a-a9af-4e96-b418-0d9a602a8b03" size="2" snapshot_id="2ee9a7ed-48f3-481c-a20e-6c53bf08c067" source_volid="None" status="available" volume_type="None">
            <attachments/>
            <metadata/>
        </volume>
        <volume availability_zone="nova" created_at="2013-01-17 11:39:56" display_description="None" display_name="None" id="9b93609e-229f-4e99-8f1e-721fcd86e7db" size="1" snapshot_id="None" source_volid="None" status="available" volume_type="None">
            <attachments/>
            <metadata/>
        </volume>
    </volumes>

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/volumes

##### 4.5.2.2 List volumes details #### {#list_volumes_details}
##### GET /volumes/detail

Lists volumes for this project, providing more detail about each volume
than [List volumes](#list_volumes).

**Request Data**

**URL Parameters**

* *project_id* - The unique identifier of the project or account.

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

JSON

    {
        "volumes": [
            {
                "attachments": [], 
                "availability_zone": "az1", 
                "bootable": "false", 
                "created_at": "2013-01-23T11:25:03.000000", 
                "display_description": "test volume 1", 
                "display_name": "testvol01", 
                "id": "128a2078-0de3-4ff2-bf9f-d315e91fe3bb", 
                "metadata": {}, 
                "size": 200, 
                "snapshot_id": null, 
                "source_volid": null, 
                "status": "error", 
                "volume_type": "None"
            }, 
            {
                "attachments": [
                    {
                        "device": "/dev/vdd", 
                        "id": "29b53979-c09d-4944-a170-5430aac864df", 
                        "server_id": "c31ae64f-03d4-4bc9-b2bf-06f80db0ff62", 
                        "volume_id": "29b53979-c09d-4944-a170-5430aac864df"
                    }
                ], 
                "availability_zone": "az1", 
                "bootable": "true", 
                "created_at": "2013-01-21T16:36:19.000000", 
                "display_description": "test volume 2", 
                "display_name": "testvol02", 
                "id": "29b53979-c09d-4944-a170-5430aac864df", 
                "metadata": {}, 
                "size": 5, 
                "snapshot_id": null, 
                "source_volid": null, 
                "status": "in-use", 
                "volume_image_metadata": {
                    "image_id": "62560ce2-ee31-4ee6-bc9b-81a98fd3d52b", 
                    "image_name": "precise-server-cloudimg-i386"
                }, 
                "volume_type": "None"
            }, 
            {
                "attachments": [], 
                "availability_zone": "az1", 
                "bootable": "false", 
                "created_at": "2013-01-21T14:32:27.000000", 
                "display_description": null, 
                "display_name": null, 
                "id": "d9f5479a-a9af-4e96-b418-0d9a602a8b03", 
                "metadata": {}, 
                "size": 2, 
                "snapshot_id": "2ee9a7ed-48f3-481c-a20e-6c53bf08c067", 
                "source_volid": null, 
                "status": "available", 
                "volume_type": "None"
            }, 
            {
                "attachments": [], 
                "availability_zone": "az1", 
                "bootable": "false", 
                "created_at": "2013-01-17T11:39:56.000000", 
                "display_description": null, 
                "display_name": null, 
                "id": "9b93609e-229f-4e99-8f1e-721fcd86e7db", 
                "metadata": {}, 
                "size": 1, 
                "snapshot_id": null, 
                "source_volid": null, 
                "status": "available", 
                "volume_type": "None"
            }
        ]
    }

XML

    <?xml version="1.0" ?>
    volumes xmlns="http://docs.openstack.org/volume/api/v1" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:os-vol-image-meta="http://docs.openstack.org/volume/ext/volume_image_metadata/api/v1">
       <volume availability_zone="nova" created_at="2013-01-23 11:25:03" display_description="None" display_name="None" id="128a2078-0de3-4ff2-bf9f-d315e91fe3bb" size="200" snapshot_id="None" source_volid="None" status="error" volume_type="None">
           <attachments/>
           <metadata/>
       </volume>
       <volume availability_zone="nova" created_at="2013-01-21 16:36:19" display_description="None" display_name="None" id="29b53979-c09d-4944-a170-5430aac864df" size="5" snapshot_id="None" source_volid="None" status="in-use" volume_type="None">
           <attachments>
               <attachment device="/dev/vdd" id="29b53979-c09d-4944-a170-5430aac864df" server_id="c31ae64f-03d4-4bc9-b2bf-06f80db0ff62" volume_id="29b53979-c09d-4944-a170-5430aac864df"/>
           </attachments>
           <metadata/>
           <volume_image_metadata>
               <meta key="image_id">62560ce2-ee31-4ee6-bc9b-81a98fd3d52b</meta>
               <meta key="image_name">precise-server-cloudimg-i386</meta>
           </volume_image_metadata>
       </volume>
       <volume availability_zone="nova" created_at="2013-01-21 14:32:27" display_description="None" display_name="None" id="d9f5479a-a9af-4e96-b418-0d9a602a8b03" size="2" snapshot_id="2ee9a7ed-48f3-481c-a20e-6c53bf08c067" source_volid="None" status="available" volume_type="None">
           <attachments/>
           <metadata/>
       </volume>
       <volume availability_zone="nova" created_at="2013-01-17 11:39:56" display_description="None" display_name="None" id="9b93609e-229f-4e99-8f1e-721fcd86e7db" size="1" snapshot_id="None" source_volid="None" status="available" volume_type="None">
           <attachments/>
           <metadata/>
       </volume>
    /volumes>

**Curl Examples**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/volumes/detail

##### 4.5.2.3 Get volume details #### {#get_volume_details}
##### GET /volumes/{volume_id}

Gets the details of the volume specified by {volume_id}.

**Request Data**

**URL Parameters**

* *project_id* - The unique identifier of the project or account.
* *volume_id* - The identifier for the volume.

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

JSON

    {
        "volume": {
            "attachments": [], 
            "availability_zone": "az1", 
            "bootable": "false", 
            "created_at": "2013-01-17T11:39:56.000000", 
            "display_description": null, 
            "display_name": null, 
            "id": "9b93609e-229f-4e99-8f1e-721fcd86e7db", 
            "metadata": {}, 
            "size": 1, 
            "snapshot_id": null, 
            "source_volid": null, 
            "status": "available", 
            "volume_type": "None"
        }
    }

XML

    <?xml version="1.0" ?>
    <volume availability_zone="nova" created_at="2013-01-17 11:39:56" display_description="None" display_name="None" id="9b93609e-229f-4e99-8f1e-721fcd86e7db" size="1" snapshot_id="None" source_volid="None" status="available" volume_type="None" xmlns="http://docs.openstack.org/volume/api/v1" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:os-vol-image-meta="http://docs.openstack.org/volume/ext/volume_image_metadata/api/v1">
        <attachments/>
        <metadata/>
    </volume>

**Curl Examples**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/volumes/{volume_id}

##### 4.5.2.4 Create volume #### {#create_volume}
##### POST /volumes

Create a new volume of a given size in the specified _availability_zone_.
If _availability_zone_ is not specified, it defaults to *az2*.

If _snapshot_id_ is specified, then the volume created is a copy
of the specified snapshot. If the _imageRef_ parameter is specified
then a bootable volume is created using the specified image for the
volume. If the _source_volid_ is specified, then the volume created
is a copy or clone of the specified source volume.

If the _imageRef_ parameter is specified, the _size_ specified for the
volume needs to be sufficiently large to accomodate the size of the
specified image, specifying an inadequate size will result in an
error.

If the _source_volid_ parameter is specified, the specified volume
must be in the _available_ state, specifying a volume which is not
in an _available_ state will result in an error.

The _snapshot_id_, _source_volid_ and _imageRef_ parameters are
mutually exclusive and only one should be specified in a request.
Specifying values for more than one of these in the same request
will result in an error.

The _volume_type_ defaults to *standard* which is currently the only
supported type.

**Request Data**

**URL Parameters**

* *project_id* - The unique identifier of the project or account.

**Data Parameters**

* *availability_zone* (Optional) - string - The availability zone (az1, az2 or az3)
* *display_description* (Optional) - string - Description for the volume
* *display_name* (Optional) - string - Name of the volume
* *imageRef* (Optional) - string - Id of an image service image from which to create the volume
* *metadata* (Optional) - hash or dictionary - Metadata key/value pairs
* *size* - (Optional if _snapshot_id_ is specified) - integer - Size of the volume in GB
* *snapshot_id* (Optional) - string - Id of a volume snapshot from which to create the volume
* *source_volid* (Optional) - string - Id of a volume from which to create the volume
* *volume_type* (Optional) - string - The volume type

JSON

    {
        "volume":{
            "availability_zone": "az2", 
            "size":1,
            "display_description": "test volume 1", 
            "display_name": "testvol01"
        }
    }

XML

    <volume availability_zone="nova" size="1"/>

**Success Response**

**Status Code**

200 - OK

**Response Data**

JSON

    {
        "volume": {
            "attachments": [], 
            "availability_zone": "az2", 
            "bootable": "false", 
            "created_at": "2013-01-30T13:38:50.411386", 
            "display_description": "test volume 1", 
            "display_name": "testvol01",
            "id": "b6f6b5fb-ba09-44c9-a263-b4acbdbf1d38", 
            "metadata": {}, 
            "size": 1, 
            "snapshot_id": null, 
            "source_volid": null, 
            "status": "creating", 
            "volume_type": "None"
        }
    }

XML

    <?xml version='1.0' encoding='utf-8'?>
    <volume xmlns:atom="http://www.w3.org/2005/Atom"
        xmlns="http://docs.openstack.org/volume/api/v1" status="creating"
        display_name="testvol01" availability_zone="nova"
        created_at="2013-01-30 13:50:55.134360" display_description="test volume 1"
        volume_type="None" snapshot_id="None" source_volid="None"
        id="8276e101-2d67-4e67-b63f-78b3a34e678c" size="1">
      <attachments />
      <metadata />
    </volume>

**Curl Example**

    curl -i -k -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"volume":{"availability_zone": "{az}","size":{size},"display_description": "{description}","display_name": "{display_name}"}}' {BaseURI}/volumes

##### 4.5.2.5 Set volume details #### {#set_volume_details}
##### PUT /volumes/{volume_id}

Modify the details of an existing volume. Details that can be
modified are _display_description_, _display_name_ and 
_metadata_. All of these are optional.

**Request Data**

**URL Parameters**

* *project_id* - The unique identifier of the project or account.
* *volume_id* - The identifier for the volume.

**Data Parameters**

* *display_description* (Optional) - string - Description for the volume
* *display_name* (Optional) - string - Name of the volume
* *metadata* (Optional) - hash or dictionary - Metadata key/value pairs

JSON

    {
        "volume":{
            "display_description": "new description"
        }
    }

XML

    <volume display_description="new description"/>

**Success Response**

**Status Code**

200 - OK

**Response Data**

JSON

    {
        "volume": {
            "attachments": [], 
            "availability_zone": "az1", 
            "bootable": "false", 
            "created_at": "2013-04-02T14:38:47.000000", 
            "display_description": "new description", 
            "display_name": "testvol01", 
            "id": "d4a389d4-1612-409e-9e6b-d72c99c66a47", 
            "metadata": {}, 
            "size": 1, 
            "snapshot_id": null, 
            "source_volid": null, 
            "status": "available", 
            "volume_type": "None"
        }
    }

XML

    <?xml version='1.0' encoding='utf-8'?>
    <volume xmlns:atom="http://www.w3.org/2005/Atom"
    xmlns="http://docs.openstack.org/volume/api/v1" status="available"
    display_name="testvol01" availability_zone="az1"
    created_at="2013-04-02 14:38:47"
    display_description="new description" volume_type="None"
    snapshot_id="None" source_volid="None"
    id="d4a389d4-1612-409e-9e6b-d72c99c66a47" size="1">
    <attachments />
    <metadata />
    </volume>

**Curl Examples**

    curl -i -k -X PUT -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"volume":{"display_description": "{description}"}}' {BaseURI}/volumes/{volume_id}

##### 4.5.2.6 Delete volume #### {#delete_volume}
##### DELETE /volumes/{volume_id}

Delete the volume specified by {volume_id}.

**Request Data**

**URL Parameters**

* *project_id* - The unique identifier of the project or account.
* *volume_id* - The identifier for the volume.

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

202 - Accepted

**Response Data**

This call does not return a response body.

**Curl Example**

    curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/volumes/{volume_id}

#### 4.5.3 Volume Snapshots

See [Block Storage Volume Snapshots](#volume_snapshot_resource) for details.

**Status Lifecycle**

_creating_ => _available_ (after creation)

In the event of an error status is set to _error_.

**Rate Limits**

The Block Storage API has a limit of 1 call per second for each project.

**Quota Limits**

The quota limits for snapshots are part of the quota limits for volumes, see
_Quota Limits_ in [Block Storage Volumes](#volumes) for details.

**Business Rules**

A volume from which snapshots have been created cannot be deleted while
any of these snapshots remains in existence. After you create a volume
from a snapshot you can delete the snapshot and continue to work with the
volume. You can not create a snapshot from a volume that is attached to a server.

See _Business Rules_ in [Block Storage Volumes](#volumes) for some
additional limits on the total number of snapshots that can be created from
a volume (and volumes that can be created from that snapshot).

##### 4.5.3.1 List volume snapshots #### {#list_snapshots}
##### GET /snapshots

Lists volume snapshots for this project. At the moment this returns the
same information as [List volume snapshots details](#list_snapshots_details),
this operation may change in the future to return less information.

**Request Data**

**URL Parameters**

* *project_id* - The unique identifier of the project or account.

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

JSON

    {
        "snapshots": [
            {
                "created_at": "2013-01-30T16:44:13.000000", 
                "display_description": null, 
                "display_name": null, 
                "id": "0500944b-1179-4b1c-9f31-b3f0da8e669c", 
                "metadata": {},
                "size": 1, 
                "status": "available", 
                "volume_id": "64f5d2fb-d836-4063-b7e2-544d5c1ff607"
            }, 
            {
                "created_at": "2013-01-30T16:41:58.000000", 
                "display_description": null, 
                "display_name": null, 
                "id": "e45fed49-801d-4a61-8927-5c8005a1c584", 
                "metadata": {},
                "size": 1, 
                "status": "available", 
                "volume_id": "64f5d2fb-d836-4063-b7e2-544d5c1ff607"
            }
        ]
    }

XML

    <?xml version='1.0' encoding='utf-8'?>
    <snapshots>
      <snapshot status="available" display_name="None"
      created_at="2013-01-30 16:44:13" display_description="None"
      volume_id="64f5d2fb-d836-4063-b7e2-544d5c1ff607"
      id="0500944b-1179-4b1c-9f31-b3f0da8e669c" size="1">
        <metadata />
      </snapshot>
      <snapshot status="available" display_name="None"
      created_at="2013-01-30 16:41:58" display_description="None"
      volume_id="64f5d2fb-d836-4063-b7e2-544d5c1ff607"
      id="e45fed49-801d-4a61-8927-5c8005a1c584" size="1">
        <metadata />
      </snapshot>
    </snapshots>

**Curl Examples**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/snapshots

##### 4.5.3.2 List volumes snapshots details #### {#list_snapshots_details}
##### GET /snapshots/detail

Lists volume snapshots for this project. At the moment this returns the
same information as [List volume snapshots](#list_snapshots). This
operation will always return detailed information (while
[List volume snapshots](#list_snapshots) may change in the future to
return less information).

**Request Data**

**URL Parameters**

* *project_id* - The unique identifier of the project or account.

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

JSON

    {
        "snapshots": [
            {
                "created_at": "2013-03-28T13:09:55.000000", 
                "display_description": null, 
                "display_name": null, 
                "id": "cb6519c5-1990-4b3d-803f-2aa9679e3c4f", 
                "metadata": {}, 
                "size": 1, 
                "status": "available", 
                "volume_id": "fef2fa3d-19db-4fcc-8228-b1cebf1b2244"
            }, 
            {
                "created_at": "2013-03-29T11:56:44.000000", 
                "display_description": null, 
                "display_name": null, 
                "id": "ed1ea8aa-4440-44ee-a643-9e280ee445e4", 
                "metadata": {}, 
                "size": 1, 
                "status": "error", 
                "volume_id": "48a24407-4c94-46ea-a577-ad71907af2c2"
            }
        ]
    }

XML

    <?xml version='1.0' encoding='utf-8'?>
    <snapshots>
      <snapshot status="available" display_name="None"
      created_at="2013-03-28 13:09:55" display_description="None"
      volume_id="fef2fa3d-19db-4fcc-8228-b1cebf1b2244"
      id="cb6519c5-1990-4b3d-803f-2aa9679e3c4f" size="1">
        <metadata />
      </snapshot>
      <snapshot status="error" display_name="None"
      created_at="2013-03-29 11:56:44" display_description="None"
      volume_id="48a24407-4c94-46ea-a577-ad71907af2c2"
      id="ed1ea8aa-4440-44ee-a643-9e280ee445e4" size="1">
        <metadata />
      </snapshot>
    </snapshots>

**Curl Examples**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/snapshots/detail

##### 4.5.3.3 Get volume snapshot details #### {#get_snapshot_details}
##### GET /snapshots/{snapshot_id}

Gets the details of the snapshot specified by _snapshot_id_.

**Request Data**

**URL Parameters**

* *project_id* - The unique identifier of the project or account.
* *snapshot_id* - The identifier for the snapshot.

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

JSON

    {
        "snapshot": {
            "created_at": "2013-01-30T17:37:06.000000", 
            "display_description": null, 
            "display_name": null, 
            "id": "49bfe04f-32c6-4804-805d-9c3d0040a11f", 
            "metadata": {}, 
            "size": 1, 
            "status": "available", 
            "volume_id": "64f5d2fb-d836-4063-b7e2-544d5c1ff607"
        }
    }

XML

    <?xml version='1.0' encoding='utf-8'?>
    <snapshot xmlns:os-extended-snapshot-attributes="http://docs.openstack.org/volume/ext/extended_snapshot_attributes/api/v1"
    status="available" display_name="None"
    created_at="2013-01-30 17:37:06" display_description="None"
    volume_id="64f5d2fb-d836-4063-b7e2-544d5c1ff607"
    id="49bfe04f-32c6-4804-805d-9c3d0040a11f" size="1">
        <metadata />
    </snapshot>

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/snapshots/{snapshot_id}

##### 4.5.3.4 Create volume snapshot #### {#create_snapshot}
##### POST /snapshots

Create a new snapshot of the specified volume.

The snapshot will be created in the _availability_zone_ of the specified
volume.

**Request Data**

**URL Parameters**

* *project_id* - The unique identifier of the project or account.

**Data Parameters**

* *display_description* (Optional) - string - Description for the snapshot
* *display_name* (Optional) - string - Name of the snapshot
* *force* (Optional) - boolean - Defaults to false.
* *volume_id* - string - Id of the volume from which to create the snapshot

JSON

    {
        "snapshot": {
            "display_description": null, 
            "display_name": null, 
            "force": false, 
            "volume_id": "64f5d2fb-d836-4063-b7e2-544d5c1ff607"
        }
    }

XML

    <snapshot display_name="None" display_description="None"
    force="false" volume_id="64f5d2fb-d836-4063-b7e2-544d5c1ff607"/>

**Success Response**

**Status Code**

200 - OK

**Response Data**

JSON

    {
        "snapshot": {
            "created_at": "2013-01-30T19:15:22.014175", 
            "display_description": null, 
            "display_name": null, 
            "id": "64f0946c-2863-4392-afe3-94f3f600f5e8",
            "metadata": {},
            "size": 1, 
            "status": "creating", 
            "volume_id": "64f5d2fb-d836-4063-b7e2-544d5c1ff607"
        }
    }

XML

    <?xml version='1.0' encoding='utf-8'?>
    <snapshot status="creating" display_name="None"
    created_at="2013-01-30 19:16:10.149951" display_description="None"
    volume_id="64f5d2fb-d836-4063-b7e2-544d5c1ff607"
    id="9b211c57-7fb5-4811-88ea-15fc30908dba" size="1">
      <metadata />
    </snapshot>

**Curl Example**

    curl -i -k -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"snapshot": {"display_description": {description},"display_name": {name},"force": false,"volume_id": "{volume_id}"}}' {BaseURI}/snapshots

##### 4.5.3.5 Delete volume snapshot #### {#delete_snapshot}
##### DELETE /snapshots/{snapshot_id}

Delete the snapshot specified by _snapshot_id_.

**Request Data**

**URL Parameters**

* *project_id* - The unique identifier of the project or account.
* *snapshot_id* - The identifier for the snapshot.

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

202 - Accepted

**Response Data**

This call does not return a response body.

**Curl Example**

    curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/snapshots/{snapshot_id}

#### 4.5.4 Volume Backups

See [Block Storage Volume Backups](#volume_backup_resource) for details.

**Status Lifecycle**

_creating_ => _available_ (after creation)

_available_ => _restoring_ (during restore)

_available_ => _deleting_ (during delete)

In the event of an error, during any operation, status is set to _error_

Volume status is set to _backing-up_ during backup creation and
 _restoring-backup_  during backup restore. If an error occurs while restoring
 a backup to a volume, the volume status is set to _error_restoring_.

**Rate Limits**

The Block Storage API has a limit of 1 call per second for each project.

**Quota Limits**

There are no specified quota limits associated with backups. The only limits are 
those imposed by [HP Object Storage](/api/object-storage/) where backups are 
actually stored. When restoring a backup, the normal quota limits for volumes
apply if a new volume is created as part of a restore operation. See 
_Quota Limits_ in [Block Storage Volumes](#volumes) for details.

**Business Rules**

N/A

##### 4.5.4.1 List volume backups #### {#list_backups}
##### GET /backups

Lists volume backups for this project.

**Request Data**

**URL Parameters**

* *project_id* - The unique identifier of the project or account.

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

JSON

    {
        "backups": [
            {
                "id": "2ef47aee-8844-490c-804d-2a8efe561c65", 
                "links": [
                    {   
                        "href": "http://10.3.194.25:8776/v1/c95fc3e4afe248a49a28828f286a7b38/backups/2ef47aee-8844-490c-804d-2a8efe561c65", 
                        "rel": "self"
                    }, 
                    {
                        "href": "http://10.3.194.25:8776/c95fc3e4afe248a49a28828f286a7b38/backups/2ef47aee-8844-490c-804d-2a8efe561c65", 
                        "rel": "bookmark"
                    }
                ], 
                "name": null
            }, 
            {
                "id": "4dbf0ec2-0b57-4669-9823-9f7c76f2b4f8", 
                "links": [
                    {
                        "href": "http://10.3.194.25:8776/v1/c95fc3e4afe248a49a28828f286a7b38/backups/4dbf0ec2-0b57-4669-9823-9f7c76f2b4f8", 
                        "rel": "self"
                    }, 
                    {
                        "href": "http://10.3.194.25:8776/c95fc3e4afe248a49a28828f286a7b38/backups/4dbf0ec2-0b57-4669-9823-9f7c76f2b4f8", 
                        "rel": "bookmark"
                    }
                ], 
                "name": null
            }
        ]
    }

XML

    <?xml version='1.0' encoding='utf-8'?>
    <backups xmlns:backups="http://docs.openstack.org/volume/ext/backups/api/v1">

      <backup name="None" id="2ef47aee-8844-490c-804d-2a8efe561c65" />
      <backup name="None" id="4dbf0ec2-0b57-4669-9823-9f7c76f2b4f8" />
      <backup name="None" id="7ace10b7-3fe6-43a7-89b3-aed33b2fed3f" />
      <backup name="None" id="ce7f60c5-5b0f-4139-95fd-d0a4dead7533" />
    </backups>

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/backups

##### 4.5.4.2 List volume backups details #### {#list_backups_details}
##### GET /backups/detail

Lists volume backups for this project, providing more detail about each
backup than [List volume backups](#list_backups).

**Request Data**

**URL Parameters**

* *project_id* - The unique identifier of the project or account.

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

JSON

    {
        "backups": [
            {
                "availability_zone": "az1", 
                "container": "volumebackups", 
                "created_at": "2013-04-02T10:35:27.000000", 
                "description": null, 
                "fail_reason": null, 
                "id": "2ef47aee-8844-490c-804d-2a8efe561c65", 
                "links": [
                    {
                        "href": "http://10.3.194.25:8776/v1/c95fc3e4afe248a49a28828f286a7b38/backups/2ef47aee-8844-490c-804d-2a8efe561c65", 
                        "rel": "self"
                    }, 
                    {
                        "href": "http://10.3.194.25:8776/c95fc3e4afe248a49a28828f286a7b38/backups/2ef47aee-8844-490c-804d-2a8efe561c65", 
                        "rel": "bookmark"
                    }
                ], 
                "name": null, 
                "object_count": 22, 
                "size": 1, 
                "status": "available", 
                "volume_id": "e5185058-943a-4cb4-96d9-72c184c337d6"
            }, 
            {
                "availability_zone": "az1", 
                "container": "volumebackups", 
                "created_at": "2013-04-02T10:21:48.000000", 
                "description": null, 
                "fail_reason": null, 
                "id": "4dbf0ec2-0b57-4669-9823-9f7c76f2b4f8", 
                "links": [
                    {
                        "href": "http://10.3.194.25:8776/v1/c95fc3e4afe248a49a28828f286a7b38/backups/4dbf0ec2-0b57-4669-9823-9f7c76f2b4f8", 
                        "rel": "self"
                    }, 
                    {
                        "href": "http://10.3.194.25:8776/c95fc3e4afe248a49a28828f286a7b38/backups/4dbf0ec2-0b57-4669-9823-9f7c76f2b4f8", 
                        "rel": "bookmark"
                    }
                ], 
                "name": null, 
                "object_count": 22, 
                "size": 1, 
                "status": "available", 
                "volume_id": "e5185058-943a-4cb4-96d9-72c184c337d6"
            } 
        ]
    }

XML

    <?xml version='1.0' encoding='utf-8'?>
    <backups xmlns:backups="http://docs.openstack.org/volume/ext/backups/api/v1">

      <backup status="available" object_count="22"
      container="volumebackups" name="None" availability_zone="az1"
      created_at="2013-04-02 10:35:27" description="None"
      volume_id="e5185058-943a-4cb4-96d9-72c184c337d6"
      fail_reason="None" id="2ef47aee-8844-490c-804d-2a8efe561c65"
      size="1" />
      <backup status="available" object_count="22"
      container="volumebackups" name="None" availability_zone="az1"
      created_at="2013-04-02 10:21:48" description="None"
      volume_id="e5185058-943a-4cb4-96d9-72c184c337d6"
      fail_reason="None" id="4dbf0ec2-0b57-4669-9823-9f7c76f2b4f8"
      size="1" />
    </backups>

**Curl Examples**

    curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/backups/detail

##### 4.5.4.3 Get volume backup details #### {#get_backup_details}
##### GET /backups/{backup_id}

Gets the details of the backup specified by {backup_id}.

**Request Data**

**URL Parameters**

* *project_id* - The unique identifier of the project or account.
* *backup_id* - The identifier for the backup.

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

JSON

    {
        "backup": {
            "availability_zone": "az1", 
            "container": "volumebackups", 
            "created_at": "2013-04-02T10:35:27.000000", 
            "description": null, 
            "fail_reason": null, 
            "id": "2ef47aee-8844-490c-804d-2a8efe561c65", 
            "links": [
                {
                    "href": "http://10.3.194.25:8776/v1/c95fc3e4afe248a49a28828f286a7b38/backups/2ef47aee-8844-490c-804d-2a8efe561c65", 
                    "rel": "self"
                }, 
                {
                    "href": "http://10.3.194.25:8776/c95fc3e4afe248a49a28828f286a7b38/backups/2ef47aee-8844-490c-804d-2a8efe561c65", 
                    "rel": "bookmark"
                }
            ], 
            "name": null, 
            "object_count": 22, 
            "size": 1, 
            "status": "available", 
            "volume_id": "e5185058-943a-4cb4-96d9-72c184c337d6"
        }
    }

XML

    <?xml version='1.0' encoding='utf-8'?>
    <backup xmlns:backups="http://docs.openstack.org/volume/ext/backups/api/v1"
    status="available" object_count="22" container="volumebackups"
    name="None" availability_zone="az1"
    created_at="2013-04-02 10:35:27" description="None"
    volume_id="e5185058-943a-4cb4-96d9-72c184c337d6" fail_reason="None"
    id="2ef47aee-8844-490c-804d-2a8efe561c65" size="1" />

**Curl Examples**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/backups/{backup_id}

##### 4.5.4.4 Create volume backup #### {#create_backup}
##### POST /backups

Create a new backup of the specified volume, copying the contents of the
volume to the project's Object Storage. The backup will be created
in a container called _volumebackups_ if the container name is not
specified. If the container does not exist, it will be created.

The backup will be created in the _availability_zone_ of the specified
volume.

The volume data is split into chunks (normally 50MB in size but this may
change) and written to files named as follows,

    volume_<volume id>/<YYYYMMDDHHMMSS>/az_<availability zone>_backup_<backup id>-<object number>

For example,

    volume_795114e8-7489-40be-a978-83797f2c1dd3/20130131124331/az_az1_backup_1-00001

This operation is asynchronous. You must list backups repeatedly to determine
if the backup has been created.

**Request Data**

**URL Parameters**

* *project_id* - The unique identifier of the project or account.

**Data Parameters**

* *container* (Optional) - string - The name of the object storage container to which the volume is to be backed up.
* *description* (Optional) - string - Description for the backup
* *name* (Optional) - string - Name of the backup
* *volume_id* - string - Id of the volume from which to create the backup

JSON

    {
        "backup": {
            "container": null, 
            "description": null, 
            "name": null, 
            "volume_id": "64f5d2fb-d836-4063-b7e2-544d5c1ff607"
        }
    }

XML

    <backup container="None" name="None" description="None"
    volume_id="64f5d2fb-d836-4063-b7e2-544d5c1ff607"/>

**Success Response**

**Status Code**

202 - Accepted

**Response Data**

JSON

    {
        "backup": {
            "id": "deac8b8c-35c9-4c71-acaa-889c2d5d5c8e", 
            "links": [
                {
                    "href": "http://10.3.194.25:8776/v1/c95fc3e4afe248a49a28828f286a7b38/backups/deac8b8c-35c9-4c71-acaa-889c2d5d5c8e", 
                    "rel": "self"
                }, 
                {
                    "href": "http://10.3.194.25:8776/c95fc3e4afe248a49a28828f286a7b38/backups/deac8b8c-35c9-4c71-acaa-889c2d5d5c8e", 
                    "rel": "bookmark"
                }
            ], 
            "name": null
        }
    }

XML

    <?xml version='1.0' encoding='utf-8'?>
    <backup xmlns:backups="http://docs.openstack.org/volume/ext/backups/api/v1"
    name="None" id="0e11a5c9-57a8-46c7-8f07-f17c7b019ec1" />

**Curl Example**

    curl -i -k -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"backup": {"container":{container_name},"description":{description},"name":{name},"volume_id": "volume_id"}}' {BaseURI}/backups

##### 4.5.4.5 Delete volume backup #### {#delete_backup}
##### DELETE /backups/{backup_id}

Delete the backup specified by {backup_id}.

This operation is asynchronous. You must list backups repeatedly to determine
if the backup has been deleted.

**Request Data**

**URL Parameters**

* *project_id* - The unique identifier of the project or account.
* *backup_id* - The identifier for the backup.

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

202 - Accepted

**Response Data**

This call does not return a response body.

**Curl Example**

    curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/backups/{backup_id}

##### 4.5.4.6 Restore volume backup #### {#restore_backup}
##### POST /backups/{backup_id}/restore

Restore the specific backup to a volume. The backup objects for this backup
will be copied from the project's Object Storage to a volume.

**If a _volume_id_ is specified in the request, that volume will be
overwritten with the backup data. If no _volume_id_ is specified, a new
volume will be created and used for the restore operation.**

If a new volume is created as part of a restore operation, it will be created
in the *az2* _availability_zone_, the API does not currently allow the
_availability_zone_ to be specified. If you require a new volume in a specific
_availability_zone_ for a restore operation, the volume should be created
first using [Create volume](#create_volume) which does allow the
_availability_zone_ to be specified.

This operation is asynchronous. To check the status of the restore operation,
the user can call [Get volume details](#get_volume_details) for the _volume_id_
returned in the response (status will be set to _restoring_ while the the
restore operation runs, _error_restoring_ if the restore operation fails and
_available_ if the restore operation succeeds).

**Request Data**

**URL Parameters**

* *backup_id* - The identifier for the backup.
* *project_id* - The unique identifier of the project or account.

**Data Parameters**

* *volume_id* - string - Id of the volume to which the backup should be restored.

JSON

    {
        "restore": {
            "volume_id": "64f5d2fb-d836-4063-b7e2-544d5c1ff607",
         }
    }

XML

    <restore volume_id="64f5d2fb-d836-4063-b7e2-544d5c1ff607"/>

**Success Response**

**Status Code**

202 - OK

**Response Data**

JSON

    {
        "restore": {
            "backup_id": 2, 
            "volume_id": "795114e8-7489-40be-a978-83797f2c1dd3"
        }
    }

XML

    <?xml version='1.0' encoding='utf-8'?>
    <restore xmlns:backups="http://docs.openstack.org/volume/ext/backups/api/v1"
    backup_id="d45c6a10-4471-4dc1-88d2-453e67194db3"
    volume_id="e5185058-943a-4cb4-96d9-72c184c337d6" />

**Curl Examples**

    curl -i -k -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"restore":{"volume_id":"{volume_id}"}}' {BaseURI}/backups/{backup_id}/restore

#### 4.5.5 Servers

See [Compute Service Servers](/api/compute#Server) for details of
the Server resource. From the Block Storage Service perspective,
a server is system to which a [volume](#volume_resource) can be attached.
When a volume is attached to a server, the server can mount the volume
and use it as a normal block storage device (allowing it to be partitioned,
formatted with a filesystem and so on).

**Status Lifecycle**

The volume status lifecycle for attach/detach is as follows:

_available_ => _attaching_ (during attach)

_attaching_ => _in-use_ (after attach)

_in-use_ => _detaching_ (during detach)

_detaching_ => _available_ (after detach)

If an error occurs during attach, the volume status is set to _error_attaching_
 and if an error occurs during detach, the volume status is set to _error_detaching_.

**Rate Limits**

See [Compute instances](/api/compute/) for details of the rate limits
associated with the Server resource.

**Quota Limits**

N/A

**Business Rules**

A maximum of 26 volumes can be attached to a single guest. This limit is
imposed by KVM (virtio-blk).

##### 4.5.5.1 List attached volumes #### {#list_attached_volumes}
##### GET /servers/{server_id}/os-volume_attachments

Lists the volumes attached to the server specified by {server_id}.

**Request Data**

**URL Parameters**

* *project_id* - The unique identifier of the project or account.
* *server_id* - The identifier for the server.

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

JSON

    {
        "volumeAttachments": [
            {
                "device": "/dev/vdb", 
                "id": "795114e8-7489-40be-a978-83797f2c1dd3", 
                "serverId": "bb6a4f73-c851-4d62-8ef4-56c9b6c12df1", 
                "volumeId": "795114e8-7489-40be-a978-83797f2c1dd3"
            }
        ]
    }

XML

    <?xml version='1.0' encoding='utf-8'?>
    <volumeAttachments>
      <volumeAttachment device="/dev/vdb"
      serverId="bb6a4f73-c851-4d62-8ef4-56c9b6c12df1"
      id="795114e8-7489-40be-a978-83797f2c1dd3"
      volumeId="795114e8-7489-40be-a978-83797f2c1dd3" />
    </volumeAttachments>

**Curl Examples**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/servers/{server_id}/os-volume_attachments

##### 4.5.5.2 Attach a volume #### {#attach_volume}
##### POST /servers/{server_id}/os-volume_attachments

Attach the volume specified by _volume_id_ to the server specified by
_server_id_. This call takes a device name specified by _device_ but
it is advisory only and should not be relied on to be the same on the
guest instance. In practice, the guest instance allocates device names
in order of availability, starting at /dev/vdc and iterating up,
regardless of what device is requested.

For guests running Linux, the recommended approach for identifying and
using attached volumes from within the guest is to use the unique device
names in the */dev/disk/by-id* directory. When a volume is attached to a
guest, on guests using Linux kernel 3.2 or newer, the first 20 characters
of the volume UUID are used as the device serial number and a link to
the volume will appear as */dev/disk/by-id/virtio-*_first 20 characters
of volume UUID_. This device path should be used rather than the
*/dev/vdX* path, particularly if multiple volumes are being attached to
a guest.

For example, when the volume with id 795114e8-7489-40be-a978-83797f2c1dd3
is attached to a guest, the volume can be referenced from within the guest
by the path */dev/disk/by-id/virtio-795114e8-7489-40be-a*.

**Request Data**

**URL Parameters**

* *server_id* - The identifier for the server.
* *project_id* - The unique identifier of the project or account.

**Data Parameters**

* *volume_id* - string - Id of the volume to attach
* *device* (Optional) - string - Name of the device to use

JSON

    {
        "volumeAttachment": {
            "volumeId": "795114e8-7489-40be-a978-83797f2c1dd3"
        }
    }

XML

    <volumeAttachment
    volume_id="64f5d2fb-d836-4063-b7e2-544d5c1ff607"/>

**Success Response**

**Status Code**

200 - OK

**Response Data**

JSON

    {
        "volumeAttachment": {
            "device": "/dev/vdc", 
            "id": "c3b1a45c-9f3a-4226-af72-f38709ab25f2", 
            "serverId": "bb6a4f73-c851-4d62-8ef4-56c9b6c12df1", 
            "volumeId": "c3b1a45c-9f3a-4226-af72-f38709ab25f2"
        }
    }

XML

    <?xml version='1.0' encoding='utf-8'?>
    <volumeAttachment device="/dev/vdc"
    serverId="bb6a4f73-c851-4d62-8ef4-56c9b6c12df1"
    id="c3b1a45c-9f3a-4226-af72-f38709ab25f2"
    volumeId="c3b1a45c-9f3a-4226-af72-f38709ab25f2" />

**Curl Examples**

    curl -i -k -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"volumeAttachment":{"volumeId": "{volume_id}"}}' {BaseURI}/servers/{server_id}/os-volume_attachments

##### 4.5.5.3 Detach a volume #### {#detach_volume}
##### DELETE /servers/{server_id}/os-volume_attachments/{volume_id}

Detach the volume specified by _volume_id_ from the server specified by
_server_id_.

**Request Data**

**URL Parameters**

* *server_id* - The identifier for the server.
* *project_id* - The unique identifier of the project or account.
* *volume_id* - The identifier of the volume to detach.

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

202 - Accepted

**Response Data**

This call does not return a response body.

**Curl Example**

    curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/servers/{server_id}/os-volume_attachments/{volume_id}

##### 4.5.5.4 Get attached volume details #### {#get_attvolume_details}
##### GET /servers/{server_id}/os-volume_attachments/{volume_id}

Gets the details of the volume specified by _volume_id_ attached to _server_id_.

**Request Data**

**URL Parameters**

* *server_id* - The identifier for the server.
* *project_id* - The unique identifier of the project or account.
* *volume_id* - The identifier of the volume to detach.

**Data Parameters**

This call does not require a request body.

**Success Response**

**Status Code**

200 - OK

**Response Data**

JSON

    {
        "volumeAttachment": {
            "device": "/dev/vdc", 
            "id": "c3b1a45c-9f3a-4226-af72-f38709ab25f2", 
            "serverId": "bb6a4f73-c851-4d62-8ef4-56c9b6c12df1", 
            "volumeId": "c3b1a45c-9f3a-4226-af72-f38709ab25f2"
        }
    }

XML

    <?xml version='1.0' encoding='utf-8'?>
    <volumeAttachment device="/dev/vdc"
    serverId="bb6a4f73-c851-4d62-8ef4-56c9b6c12df1"
    id="c3b1a45c-9f3a-4226-af72-f38709ab25f2"
    volumeId="c3b1a45c-9f3a-4226-af72-f38709ab25f2" />

**Curl Examples**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/servers/{server_id}/os-volume_attachments/{volume_id}
