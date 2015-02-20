---
layout: page
title: "HP Helion Public Cloud Image Service API Reference"
permalink: /publiccloud/api/image/
description: This document describes the HP Helion Public Cloud Image Service. HP Helion Public Cloud Image is based on OpenStack Glance.
keywords: Image, Glance, OpenStack
product: image

---
<!--PUBLISHED-->
# HP Helion Public Cloud Image Service API Specifications

**Date:** May 2014

**Document Version:** 1.5

## 1. Overview

This document describes the HP Helion Public Cloud Image service, which is based on OpenStack Glance.

We will be referring to HP Helion Public Cloud Image Service in this document as simply the Image service.

### 1.1 API Maturity Level

#### 1.1.1 Maturity Level Definitions

The maturity levels are defined as follows:

+ Beta. The functions and features are available publically. While HP expects the feature to operate as advertised, we do not offer a Service Level Agreement (SLA) for the service or feature.

+ Release to General Availability (GA). At this level of maturity, all features and functions are expected to operate as advertised. In particular, there is a Service Level Agreement (SLA) defined and in place.

#### 1.1.2 Maturity Level

**Maturity Level**: GA

**Version API Status**: *1.1*

### 1.2 Document Revision History

|Document Version | Date | Description |
|:--------------- | :----- | :-------- |
| 1.0 | December 2012 | Initial creation |
| 1.1 | Janurary 2013 | Added custom image properties |
|     |                | Added Image Ownership and Sharing |
|     |                | Added Authentication and Access Controls |
|     |                | Added Account Level View |
| 1.2 | March 2013    | Changes per QA's comment |
| 1.3 | April 2014 | Updated Sections 1.1.2, 3.2, 3.3 |
| 1.4 |            | Updated curl examples to reflect correct endpoint |
| | | Updated references to Project instead of Tenant|
| 1.5 | May 2014 | HP Helion updates |

## 2. Architectural View

### 2.1 Overview

The Image service is a web service for managing virtual machine images. It provides a set of RESTful APIs that enables querying/updating of image metadata as well as retrieval of the actual image data.

### 2.2 Images

#### 2.2.1 Image Files

An image file refers to a virtual disk image file that Compute service can load up to create a virtual machine.

#### 2.2.2 Image Metadata

The metadata of an image includes all the information about the image, e.g. image identifier, name, status, size, disk format, container format, owner, and custom properties. Not all metadata are required to be specified with a value when adding a new image to Image service, more details can be found in [section 4.4.2.2](#4422-add-a-new-image).

##### 2.2.2.1 Name

Its value should be the name of the image. Note that the name of an image is not unique as it would be unrealistic to expect users to know all the unique names of all other user's images.

##### 2.2.2.2 Identifier

Each image has an identifier, which is guaranteed to be unique to a Region. For Regions please refer to [section 3.2](#32-regions-and-availability-zones). Images identifiers are UUIDs, commonly represented in hexadecimal string notation.

##### 2.2.2.3 Status

Images in the Image service can be in one the following statuses:

+ **queued** The image identifier has been reserved for an image in the Image service. No image data has been uploaded to the Image service and the image size was not explicitly set to zero on creation.

+ **saving** Denotes that an image's raw data is currently being uploaded to the Image service. When an image is registered with a call to `POST /images` and there is an `x-image-meta-location` header present, that image will never be in the saving status (as the image data is already available in some other location).

+ **active** Denotes an image that is fully available in the Image service. This occurs when the image data is uploaded, or the image size is explicitly set to zero on creation.

+ **killed** Denotes that an error occurred during the uploading of an image's data, and that the image is not readable.

+ **deleted** The Image service has retained the information about the image, but it is no longer available to use. An image in this state will be removed automatically at a later date.

+ **pending_delete** This is similiar to deleted, however, the image data has not yet been removed. An image in this state is recoverable.

##### 2.2.2.4 Disk and Container Format

When adding an image to the Image service, specifying the image's disk format and container format is required.

The following lists all the formats that the Image service allows.  The Compute service may only support a subset of them, please refer to Compute document for more details.

##### Disk Format

The disk format of a virtual machine image is the format of the underlying disk image. Virtual appliance vendors have different formats for laying out the information contained in a virtual machine disk image.

You can set your image's disk format to one of the following:

+ **raw** This is an unstructured disk image format

+ **vhd** This is the VHD disk format, a common disk format used by virtual machine monitors from VMWare, Xen, Microsoft, VirtualBox, and others

+ **vmdk** Another common disk format supported by many common virtual machine monitors

+ **vdi** A disk format supported by VirtualBox virtual machine monitor and the QEMU emulator

+ **iso** An archive format for the data contents of an optical disc (e.g. CDROM).

+ **qcow2** A disk format supported by the QEMU emulator that can expand dynamically and supports Copy on Write

+ **aki** This indicates what is stored in the Image service is an Amazon kernel image

+ **ari** This indicates what is stored in the Image service is an Amazon ramdisk image

+ **ami** This indicates what is stored in the Image service is an Amazon machine image

##### Container Format

The container format refers to whether the virtual machine image is in a file format that also contains metadata about the actual virtual machine.

Note that the container format string is not currently used by the Image service or other OpenStack components, so it is safe to simply specify bare as the container format if you are unsure.

You can set your image's container format to one of the following:

+ **bare** This indicates there is no container or metadata envelope for the image

+ **ovf** This is the OVF container format

+ **aki** This indicates what is stored in the Image service is an Amazon kernel image

+ **ari** This indicates what is stored in the Image service is an Amazon ramdisk image

+ **ami** This indicates what is stored in the Image service is an Amazon machine image

##### 2.2.2.5 Size

The image size in Bytes.

##### 2.2.2.6 Checksum

The MD5 checksum of the image file data.

##### 2.2.2.7 Min-ram

The minimum ram required in megabytes to run this image on a HP Compute server. Please refer to HP Compute document for more details about this property.

##### 2.2.2.8 Min-disk

The minimum disk space required in gigabytes to run this image on a HP Compute server. Please refer to HP Compute document for more details about this property.

##### 2.2.2.9 Owner

The Image service normally sets the owner of an image to be the Project ID of the authenticated user adding the image.

##### 2.2.2.10 Custom Image Properties

The Image service allows a set of custom, free-form image properties stored with the image metadata. There is no limit on the number of free-form key/value attributes that can be attached to the image. However, keep in mind that the 8K limit on the size of all HTTP headers sent in a request will effectively limit the number of image properties.

##### Properties added by the Compute service when creating a snapshot

HP Compute adds some or all of the following custom properties to instance snapshots it creates.

|Name |Description |Example  |Comment  |
|:------- | :-------- | :------- | :-------- |
|architecture | arch type | 'x86_64' or 'i686' |
|image_location| location | 'snapshot' or 'local' |
|image_state| state | 'available' or 'creating' |
|owner_id | Project ID of the owner | |
|user_id | user name of the owner |
|instance_uuid|uuid of creating instance | |
|instance_ref| reference URL |
|ramdisk_id | Image ID of associated Ramdisk | |
|kernel_id | Image ID of associated Kernel Image || typically None|
|image_type | type | 'snapshot' |
|backup_type| | | typically None

##### Properties added to Public Images

The Image service adds many properties to public images. They are implemented as custom properties, as follow.

|Name |Description |Type  |Example  |Comment  |
|:------- | :-------- | :------- | :-------- | :-------- |
|com.hp_1_os_distro | OS name | string | 'org.ubuntu', 'org.centos', 'com.microsoft.server' | Will track org.openstack_1_os_distro in the future |
|com.hp_1_os_version | OS version | string | '12.04', '5.6', '2008 R2 Enterprise SP1' | Will track org.openstack_1_os_version in the future |
| com.hp_1_image_type | image type | string | 'kernel', 'ramdisk', 'machine', 'disk' | machine == AMI; disk == qcow2 raw image; this property will not be required when the glance API properties disk_format, container_format are visible to the DEVEX UI |
| com.hp_1_image_lifecycle | image lifecycle state | string | 'deprecated' or 'active' | absense of (a value for) this property should be interpreted as 'active' |
| com.hp_1_provider | WHO provides the image | string | com.hp, com.canonical, com.activestate etc. | note a ubuntu image built by HP would have com.hp as the provider |
| com.hp_1_bootable_volume | is this image compatible with bootable volumes? | boolean | true or false | in the absense of this flag assume the image is compatible with bootable volumes |

##### hp_image_license property

The hp_image_license property is custom to HP Helion and has the following semantics:

+ Value is private to HP Helion;

+ Not removable once set;

+ Will be copied to all snapshots taken in Nova using the image;

+ Applicable to non-public Windows images (snapshots);

+ Applied to Windows images only by HP Helion

### 2.3 Image Ownership and Sharing

The ownership of an image is defined by the value of its 'owner' attribute, as mentioned in section 2.2.2.9. The value of this attribute can be NULL, which indicates that the image is not owned by any specific Project. Ownership of an image is shared across all users that belong to the Project identified in the 'owner' attribute of an image.

An image can be shared with another Project by its owner, in which case the original owner can also indicate whether the recipient can share the image further. Modification of shared images is still restricted to the user that owns it.

### 2.4 Authentication and Access Controls

#### 2.4.1 Authentication

The Image service depends on Control Service (CS) API to handle authentication of clients. An Image service consumer must obtain an authentication token from CS and send it along with all API requests to Image Service through the `X-Auth-Token` header. The Image service will communicate back to CS to verify the token validity and obtain the consumer's identity credentials. Anonymous users cannot access Image service APIs.

#### 2.4.2 Access Control

Access to an image is controlled with the ownership of the image and whether the image is public or private.

Public images with an owner can be accessed by any user, but modifications are restricted to a user under the Project that owns it or Admin users.

Public images without an owner may be accessed by anyone, but modifications are restricted solely to Admins.

Adding a public image to the Image service is only allowed for users with a privileged role.

Private images with an owner can only be accessed or modified by the user that owns it or Admin users.

Private images may also have a null owner. These images will only be accessible and modifiable by Admins.

## 3. Account Level View

### 3.1 Accounts

+ Authenticated Users -- Any user that has authenticated against an authentication service (e.g. Control Services) and does not have the admin role
+ Admin Users -- Any user that has authenticated against an authentication service and has the admin role returned by the authentication service in that Project's list of roles. The Admin role is HP restricted.

### 3.2 Regions

Region(s): region-a, region-b

### 3.3 Service Catalog

The listing below shows a fragment of the Service Catalog returned by the Identity service which contains the endpoints for the Image service.

    {
        endpoints: [2]
            1:  {
            links: {
            self: "https://region-b.geo-1.identity.hpcloudsvc.com/v3/endpoints/14000300_P"
            }
            url: "https://region-b.geo-1.images.hpcloudsvc.com:443/v1.0"
            region: "region-b.geo-1"
            interface: "public"
            service_Id: "140"
            id: "14000300_P"
            }
            2:  {
            links: {
            self: "https://region-b.geo-1.identity.hpcloudsvc.com/v3/endpoints/14001200_P"
            }
            url: "https://region-a.geo-1.images.hpcloudsvc.com:443/v1.0"
            region: "region-a.geo-1"
            interface: "public"
            service_Id: "140"
            id: "14001200_P"
            }
            type: "image"
            id: "140"
            links: {
            self: "https://region-b.geo-1.identity.hpcloudsvc.com/v3/services/140"
            }
        name: "Image Management"
    }

## 4. REST API Specifications
### 4.1 Service API Operations

**Hosts**:   
https://region-a.geo-1.images.hpcloudsvc.com:443/v1.0   
https://region-b.geo-1.images.hpcloudsvc.com:443/v1.0

**BaseUri**: {Host}

| Resource | Operation                                      | HTTP Method | Path                   | JSON/XML Support? | Privilege Level |
|:---------|:-----------------------------------------------|:------------|:-----------------------|:------------------|:---------------:|
| **Image Metadata** | [List Images](#4411-list-images) | GET         | /images             | Y/N               |  |
| **Image Metadata** | [List Images Details](#4412-list-images-in-more-detail) | GET | /images/detail | Y/N |
| **Image Metadata** | [Filtering Images Lists](#4413-filtering-images-lists) | GET | /images?KEY=VALUE | Y/N |
| **Image Metadata** | [Filtering on Custom Properties](#4414-filtering-on-custom-properties) | GET | /images/detail?property-KEY=VALUE | Y/N |
| **Image Metadata** | [Paginating a List of Images](#4415-paginating-a-list-of-images) | GET | /images?limit=LIMIT&marker=ID | Y/N |
| **Image Metadata** | [Retrieve Image Metadata](#4416-retrieve-image-metadata) | HEAD | /images/{image_id} | Y/N |
| **Image Metadata** | [Update an Image](#4417-update-an-image) | PUT | /images/{image_id} | Y/N |
| **Image Data** | [Retrieve Raw Image Data](#4421-retrieve-raw-image-data) | GET | /images/{image_id} | Y/N |
| **Image Data** | [Add a New Image](#4422-add-a-new-image) | POST | /images | Y/N |
| **Image Data** | [Two-step Adding New Image](#4423-two-step-adding-new-image) | POST /images | PUT /images/{image_id} | Y/N | |
| **Image Memberships** | [List Image Memberships](#4431-list-image-memberships) | GET | /images/{image_id}/members | Y/N |
| **Image Memberships** | [List Shared Images](#4432-list-shared-images) | GET | /shared-images/{project_id} | Y/N |
| **Image Memberships** | [Add a Member to an Image](#4433-add-a-member-to-an-image) | PUT | /images/{image_id}/members/{project_id} | Y/N |
| **Image Memberships** | [Remove a Member from an Image](#4434-remove-a-member-from-an-image) | DELETE | /images/members/{project_id} | Y/N |
| **Image Memberships** | [Replace a Membership List for an Image](#4435-replace-a-membership-list-for-an-image) | PUT | /images/{image_id}/members | Y/N |

### 4.2 Common Request Headers

#### 4.2.1 Accept

Where applicable, this determines what Content-Types are acceptable, for example:

    text (text/plain)
    JSON (application/json)

#### 4.2.2 Content-Type

Where applicable, this indicates the MIME type of an object. For example when adding a new image a header of `Content-Type: application/octet-stream` should be specified.

#### 4.2.3 X-Auth-Token

When specified, this identifies the user making the request. See section 2.4 for more information about tokens.

#### 4.2.4 Content-Length

Where applicable, this is the length in bytes of the body of the request.

### 4.3 Common Response Headers

#### 4.3.1 Content-Type

When the response includes a body, this indicates the MIME type of the response.
#### 4.3.2 Content-Length

When the response includes a body, this indicates the length of the body in bytes.

### 4.4 Service API Operation Details
#### 4.4.1 Image Metadata

Status Lifecycle: N/A

Rate Limits: N/A

Quota Limits: N/A

Business Rules: None

##### 4.4.1.1 List Images
##### GET /images

Retrieve a list of available images that the authenticated user has access to. This includes images owned by the user, images shared with the user and public images.

**Status Codes**

200 - OK

**URL Parameters**

+ limit=LIMIT

The `LIMIT` is a numeric value that you wish to limit the number of images returned per call. If no limit specified, Glance returns **25** images at a time by default.

+ marker=ID

The `marker` query parameter is to specify an image id **after** which the page of images starts. The image with the ID specified will not be shown.

See section 4.4.1.3 for more parameters that can be used for filtering.

**Request Data**

No request body required.

**Response Data**

JSON-encoded data. For example:

    {'images':
      [
        {
         'name': 'Ubuntu 12.04 Plain',
         'disk_format': 'vhd',
         'container_format': 'ovf',
         'size': 5368709120,
         'checksum': '61eabaf2bf278703738b433ff884c91f',
         'id': "50928dd9-d57b-4b42-8f88-bdc4ccf16695"
        }
      ]
    }

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/images

##### 4.4.1.2 List Images in More Detail
##### GET /images/detail

Retrieve a more detailed list of available images that the authenticated user has access to. This includes images owned by the user, images shared with the user and public images.

**Status Codes**

200 - OK

**URL Parameters**

+ limit=LIMIT

The `LIMIT` is a numeric value that you wish to limit the number of images returned per call. If no limit specified, Glance returns **25** images at a time by default.

+ marker=ID

The `marker` query parameter is to specify an image id after which the page of images starts.

**Request Data**

No request body required.

**Response Data**

JSON-encoded data. For example:

    {'images':
      [
        {
         "status": "active", 
         "name": "UbuntuServer2-snap1", 
         "deleted": false, 
         "container_format": "bare", 
         "created_at": "2012-11-07T14:36:00", 
         "disk_format": "qcow2", 
         "updated_at": "2012-11-07T14:36:34", 
         "properties": {
            "instance_uuid": "a249a5a4-66ff-4b9c-a90b-d0ec5419f074", 
            "image_location": "snapshot", 
            "image_state": "available", 
            "user_id": "96028022561439", 
            "creator": "XXX", 
            "image_type": "snapshot", 
            "instance_ref": "http://nv1.example.net/v1.1/355478", 
            "ramdisk_id": null, 
            "kernel_id": null, 
            "backup_type": null, 
            "version": "1.0.0", 
            "architecture": "amd64", 
            "owner_id": "16488133588404"
         },
         "min_disk": 0, 
         "id": "50928dd9-d57b-4b42-8f88-bdc4ccf16695", 
         "checksum": "c5d96e1cf62c0bcf9c633f14e2f01c3e", 
         "owner": "16488133588404", 
         "is_public": false, 
         "deleted_at": null, 
         "min_ram": 0, 
         "size": 686751744
        }
      ]
    }

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/images/detail

##### 4.4.1.3 Filtering Images Lists
##### GET /images?{key=value}

Both the `GET /v1/images` and `GET /v1/images/detail` requests take certain query parameters that serve to filter the returned list of images.

**Status Codes**

200 - OK

**URL Parameters**

+ name=NAME

Showing images having a name attribute matching NAME.

+ container_format=FORMAT

Showing images having a container_format attribute matching FORMAT

+ disk_format=FORMAT

Showing images having a disk_format attribute matching FORMAT

+ status=STATUS

Showing images having a status attribute matching STATUS

+ size_min=BYTES

Showing images having a size attribute greater than or equal to BYTES

+ size_max=BYTES

Showing images having a size attribute less than or equal to BYTES

+ is_public=PUBLIC

An admin user may use the `is_public` parameter to control which results are returned.

When the `is_public` parameter is absent or set to `True` the following images will be listed: Images whose `is_public` field is `True`, owned images and shared images.

When the `is_public` parameter is set to `False` the following images will be listed: Images (owned, shared, or non-owned) whose `is_public` field is `False`.

When the `is_public` parameter is set to `None` all images will be listed irrespective of owner, shared status or the `is_public` field.

Note: Use of the `is_public` parameter is restricted to admin users. For all other users it will be ignored.

+ sort_key=KEY

Results will be ordered by the specified image attribute `KEY`. Accepted values include `id`, `name`, `status`, `disk_format`, `container_format`, `size`, `created_at` (default) and `updated_at`.

+ sort_dir=DIR

Results will be sorted in the direction `DIR`. Accepted values are `asc` for ascending or `desc` (default) for descending.

**Request Data**

No request body required

**Response Data**

JSON-encoded data. See the following for example.

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/images?{key=value}

##### 4.4.1.4 Filtering on Custom Properties
##### GET /images/detail?property={key=value}

A list of images can be filtered based on custom properties.

**Status Codes**

200 - OK

**URL Parameters**

Any custom property name

**Request Data**

No request body required

**Response Data**

JSON-encoded data. See the following for example.

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/images/detail?property={key=value}

##### 4.4.1.5 Paginating a list of images
##### GET /images?limit=LIMIT&marker=ID

A combination of **limit** and **marker** query parameters can be used to paginate a list of images. For example the following request will confine the resulting page length to be LIMIT, and the first image of this page is the one right after ID.

**Status Codes**

200 - OK

**URL Parameters**

+ limit

+ marker

**Request Data**

No request body required

**Response Data**

JSON-encoded data. See the following for example.

**Curl Example**

First we request a list of images without specifying the **limit** parameter, as a result 25 images were returned.

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/images?limit=LIMIT&marker=ID

Then we set the page length to be 3 by **limit**, and try to retrieve the images that are after **d69ede19-2145-4933-806f-e82ef103098f** in the list above. So we got:

    curl -v -k -X GET -H "x-auth-token: ***" "https://localhost:9292/v1/images?limit=3&marker=d69ede19-2145-4933-806f-e82ef103098f"

    > GET /v1/images?limit=3&marker=d69ede19-2145-4933-806f-e82ef103098f HTTP/1.1
    > Host: localhost:9292
    > Accept: */*
    > x-auth-token: ***
    >
    < HTTP/1.1 200 OK
    < Content-Type: text/html; charset=UTF-8
    < Content-Type: application/json
    < Content-Length: 456
    < X-Openstack-Request-Id: req-b135294c-7700-48cc-be0e-e00123c508a7
    < Date: Sat, 26 Jan 2013 03:08:16 GMT
    <

    {"images": [
      {"name": "Server1-snap1", "container_format": "bare", "disk_format": "qcow2", "checksum": "2ceadb1ab14775fc809b13301cbe2f10", "id": "d4388c1f-0047-4b46-9ad0-4ffd83b836eb", "size": 686751744},
      {"name": "Server1-snap1", "container_format": "bare", "disk_format": "qcow2", "checksum": "7402dab7e233cb81d8d9cc8b0b4d10e1", "id": "d313cbdb-152f-4cf9-a2c0-06b23d6afa01", "size": 686751744},
      {"name": "Server1-snap1", "container_format": "bare", "disk_format": "qcow2", "checksum": "241001b584803f30e3b6b135a66e3b09", "id": "50928dd9-d57b-4b42-8f88-bdc4ccf89000", "size": 686751744}
    ]}

##### 4.4.1.6 Retrieve Image Metadata
##### HEAD /images/{image_id}

**Status Codes**

200 - OK

**Request Data**

No request body required

**Response Data**

The metadata is returned as a set of HTTP headers that begin with the prefix `x-image-meta-`.

For example:

    X-Image-Meta-Property-User_id: 96028022561439
    X-Image-Meta-Status: active
    X-Image-Meta-Property-Image_state: available
    X-Image-Meta-Min_disk: 0
    X-Image-Meta-Owner: 16488133588404
    X-Image-Meta-Property-Instance_ref: http://nv1.example.net/v1.1/355478
    X-Image-Meta-Name: Server2-snap1
    X-Image-Meta-Container_format: bare
    X-Image-Meta-Property-Image_type: snapshot
    X-Image-Meta-Created_at: 2012-11-07T14:36:00
    X-Image-Meta-Property-Image_location: snapshot
    X-Image-Meta-Min_ram: 0
    X-Image-Meta-Updated_at: 2012-11-07T14:36:34
    X-Image-Meta-Property-Backup_type:
    X-Image-Meta-Id: 23a4120c-b394-41b1-834d-6ab04fca3358
    X-Image-Meta-Property-Instance_uuid: a249a5a4-66ff-4b9c-a90b-d0ec5419f074
    X-Image-Meta-Deleted_at:
    X-Image-Meta-Property-Ramdisk_id:
    X-Image-Meta-Property-Architecture: amd64
    X-Image-Meta-Property-Kernel_id:
    X-Image-Meta-Deleted: False
    X-Image-Meta-Checksum: c5d96e1cf62c0bcf9c633f14e2f01c3e
    X-Image-Meta-Property-Creator: XXX
    X-Image-Meta-Size: 686751744
    X-Image-Meta-Property-Version: 1.0.0
    X-Image-Meta-Is_public: False
    X-Image-Meta-Property-Owner_id: 16488133588404
    X-Image-Meta-Disk_format: qcow2

**Curl Example**

    curl -i -k -X HEAD -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/images/{image_id}

##### 4.4.1.7 Update an Image
##### PUT /images/{image_id}

**Status Codes**

200 - OK

**Request Data**

All the request headers prefixed with `x-image-meta-` and `x-image-meta-property-` are recognized as image metadata.

If an image was previously reserved, and thus is in the `queued` state, then image raw data can be added by including it as the request body. If the image already has data associated with it (e.g. not in the `queued` state), then including a request body will result in a 409 Conflict.

**Response Data**

On success, the `PUT` request will return the image metadata encoded as HTTP headers.

**Curl Example**

This example shows how to update metadata on an image.

    curl -i -k -X PUT -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -H "{key:value}" {BaseURI}/images/{image_id}

### 4.4.2 Image data

Status Lifecycle: N/A

Rate Limits: N/A

Quota Limits: N/A

Business Rules: None

##### 4.4.2.1 Retrieve Raw Image Data
##### GET /images/{image_id}

**Status Codes**

200 - OK

**Request Data**

No request body required

**Response Data**

The metadata is returned as a set of HTTP headers that begin with the prefix `x-image-meta-`, and the image itself is encoded into the response body. 

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/images/{image_id}

##### 4.4.2.2 Add a New Image
##### POST /images

**Status Codes**

201 - CREATED

**Request Data**

The metadata of the image is sent to the Image service in HTTP headers. The body of the HTTP request to the API will be the MIME-encoded image data.

Image Metadata in HTTP Headers:

All HTTP headers prefixed with `x-image-meta-` and `x-image-meta-property-` are recognized as image metadata.

The list of metadata headers are listed below.

+ x-image-meta-name (required)

The name of the image.

+ x-image-meta-id (optional)

The Image service will use the supplied identifier for the image if specified. A 409 Conflict will be returned if an identifier already exists in that Image service region.

The Image service will generate an identifier for the image and return this identifier in the response if not specified.

+ x-image-meta-disk_format (required)

Valid values are one of aki, ari, ami, raw, iso, vhd, vdi, qcow2, or vmdk.

+ x-image-meta-container_format (required)

Valid values are one of aki, ari, ami, bare, or ovf.

+ x-image-meta-size (optional)

The Image service assumes the supplied value is the expected size if specified. A 400 Bad Request will be returned if the length in bytes of the request body does not match the value of this header.

The Image service will set the image's size based on the size of the request body if not specified.

+ x-image-meta-checksum (optional)

The Image service will verify the checksum generated from the backend store against the supplied checksum value if specified, a 400 Bad Request will be returned if not match.

The Image service will calculate the MD5 checksum based on the image data in the request body if not specified.

+ x-image-meta-min-ram (optional)

The Image service views the supplied value as the minimum ram required in megabytes to run this image on a server if specified.

The Image service considers the minimum ram requirement is 0 for this image if not specified.

+ x-image-meta-min-disk (optional)

The Image service views the supplied value as the minimum disk space required in gigabytes to run this image on a server if specified.

The Image service considers the minimum disk space requirement is 0 for this image if not specified.

+ x-image-meta-owner (optional)

This header is only meaningful for admins.

The Image service normally sets the owner of an image to be the Project ID of the authenticated user issuing the request. However, if the authenticated user has the Admin role, this default may be overridden by setting this header to null or to a string identifying the owner of the image.

+ x-image-meta-property-*

When the Image service receives any HTTP header whose key begins with the prefix `x-image-meta-property-`, the Image service adds the key and value to a set of custom, free-form image properties stored with the image. The key is the lower-cased string following the prefix x-image-meta-property- with dashes and punctuation replaced with underscores.

For example, if the following HTTP header were sent:

`x-image-meta-property-architecture  amd64`
Then a key/value pair of "architecture"/"amd64" will be stored as image metadata with the image in the Image service.

There is no limit on the number of free-form key/value attributes that can be attached to the image. However, keep in mind that the 8K limit on the size of all HTTP headers sent in a request will effectively limit the number of image properties.

**Response Data**

JSON-encoded metadata of the new image. See the following for example.

**Curl Example**

    curl -i -k -X POST -H 'X-Auth-Token: {Auth_Token}' -H "X-Image-Meta-Name: post_example" -H "X-Image-Meta-disk_format: raw" -H "x-image-meta-container_format: bare" -H "Content-Type: application/octet-stream" --data-binary @/home/lijam/img-800k {BaseURI}/images

    > POST /v1/images HTTP/1.1
    > Host: localhost:9292
    > Accept: */*
    > x-auth-token: ***
    > X-Image-Meta-Name: post_example
    > X-Image-Meta-disk_format: raw
    > x-image-meta-container_format: bare
    > Content-Type: application/octet-stream
    > Content-Length: 819200
    > Expect: 100-continue
    >
    < HTTP/1.1 100 Continue
    < HTTP/1.1 201 Created
    < Content-Type: application/json
    < Content-Length: 441
    < Location: https://localhost:9292/v1/images/50928dd9-d57b-4b42-8f88-bdc4ccf16695
    < Etag: 3f8ad80bece5aabec127446bf3bd7a02
    < X-Openstack-Request-Id: req-13d89606-3b04-4d45-b0e4-ea1e6c7d743e
    < Date: Tue, 05 Mar 2013 04:38:11 GMT
    <
    {"image": {"status": "active", "name": "post_example", "deleted": false, "container_format": "bare", "created_at": "2013-03-05T04:38:10", "disk_format": "raw", "updated_at": "2013-03-05T04:38:11", "properties": {}, "min_disk": 0, "protected": false, "id": "50928dd9-d57b-4b42-8f88-bdc4ccf16695", "checksum": "3f8ad80bece5aabec127446bf3bd7a02", "owner": "34096082065107", "is_public": false, "deleted_at": null, "min_ram": 0, "size": 819200}}

##### 4.4.2.3 Two-step Adding New Image
##### POST /images
##### PUT /images/{image_id}

Another way to add a new image to the Image service is to first register an image via a POST request and then upload the image data via a PUT.

**Status Codes**

POST: 201 - CREATED

PUT: 200 - OK

**Request Data**

POST: 'x-image-meta-name', 'X-Image-Meta-disk_format' and 'x-image-meta-container_format' are required, no request body required

PUT: 'Content-Type' is required, request body should be the image data

**Response Data**

POST: JSON-encoded metadata

PUT: JSON-encoded metadata

See the following for example.

**Curl Example**

    curl -i -k -X PUT -H 'X-Auth-Token: {Auth_Token}' -H "Content-Type: application/octet-stream" --data-binary @/home/lijam/img-800k {BaseURI}/images/{image_id}

    > PUT /v1/images/c639c44f-32df-4734-9baa-7f7452337ffc HTTP/1.1
    > Host: localhost:9292
    > Accept: */*
    > x-auth-token: ***
    > Content-Type: application/octet-stream
    > Content-Length: 819200
    > Expect: 100-continue
    >
    < HTTP/1.1 100 Continue
    < HTTP/1.1 200 OK
    < Content-Length: 441
    < Content-Type: application/json
    < Location: https://localhost:9292/v1/images/c639c44f-32df-4734-9baa-7f7452337ffc
    < Etag: 3f8ad80bece5aabec127446bf3bd7a02
    < X-Openstack-Request-Id: req-dd31ebbf-8bd2-4b8c-9a45-4cf9622fb23d
    < Date: Tue, 05 Mar 2013 04:44:08 GMT
    <
    {"image": {"status": "active", "name": "post_example", "deleted": false, "container_format": "bare", "created_at": "2013-03-05T04:41:17", "disk_format": "raw", "updated_at": "2013-03-05T04:44:08", "properties": {}, "min_disk": 0, "protected": false, "id": "c639c44f-32df-4734-9baa-7f7452337ffc", "checksum": "3f8ad80bece5aabec127446bf3bd7a02", "owner": "34096082065107", "is_public": false, "deleted_at": null, "min_ram": 0, "size": 819200}}

### 4.4.3 Image Membership

Status Lifecycle: N/A

Rate Limits: N/A

Quota Limits: N/A

Business Rules: None

##### 4.4.3.1 List Image Memberships
##### GET /images/{image_id}/members

Retrieve a list of the other Projects that may access a given image.

**Status Codes**

200 - OK

**Request Data**

No request body required

**Response Data**

JSON data

    {'members': [
     {'member_id': '12345',
      'can_share': false}
     ]}

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/images/{image_id}/members

##### 4.4.3.2 List Shared Images
##### GET /shared-images/{project_id}

Retrieve a list of images which are shared with a given Project.

**Status Codes**

200 - OK

**Request Data**

No request body required

**reponse**

JSON data

    {'shared_images': [
     {'image_id': 'd313cbdb-152f-4cf9-a2c0-06b23d6afa01',
      'can_share': false}
     ]}

**Curl Example**

    curl -i -k -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/shared-images/{project_id}

##### 4.4.3.3 Add a Member to an Image
##### PUT /images/{image_id}/members/{project_id}

To authorize a Project to access a private image.

**Status Codes**

204 - No Content

**Request Data**

With no body, this will add the membership to the image, leaving existing memberships unchanged and defaulting new memberships to have `can_share` set to false.

If the following body is specified, both existing and new memberships will have `can_share` set to the supplied value.

    {'member':
     {'can_share': true}
    }

**Response Data**

No response body

**Curl Example**

    curl -i -k -X PUT -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"memberships": [{"member_id": "{member_id}", "can_share": false}]}' {BaseURI}/images/{image_id}/members/{project_id}

##### 4.4.3.4 Remove a Member from an Image
##### DELETE /images/{image_id}/members/{project_id}

To revoke a Project's right to access a private image.

**Status Codes**

This query will return a 204 ("No Content") status code.

**Request Data**

No request body

**Response Data**

No response body

**Curl Example**

    curl -i -k -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' {BaseURI}/images/{image_id}/members/{project_id}

##### 4.4.3.5 Replace a Membership List for an Image
##### PUT /images/{image_id}/members

The full membership list for a given image may be replaced. 

**Status Codes**

204 - No Content

**Request Data**

A body in the following form:

    {'memberships': [
     {'member_id': 'tenant1',
      'can_share': false}
     ...]}

All the supplied memberships will be created, having `can_share` set to false by default if not specified.

The existing memberships named in the body will have their `can_share` set to the specified value, or keep the existing values unchanged if the corresponding `can_share` is not specified in the body.

All existing memberships which are not named in the body are removed.

**Response Data**

No response body

**Curl Example**

    curl -i -k -X PUT -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-Auth-Token: {Auth_Token}' -d '{"memberships": [{"member_id": "{member_id}", "can_share": false}]}' {BaseURI}/images/{image_id}/members

## 5. Additional Notes

### 5.1 APIv1 Differences between HP Helion Public Cloud 13.5 and 12.12

| |1.1 (2013.1) |1.0 (2011.3)|
|:------- | :-------- | :------- |
|Image Identifier| UUID (for example: 6eab43da-eb20-4e43-8984-48fa057989c5) | Integer |
|Get Metadata API | new response header "X-Openstack-Request-Id" | N/A |
|Add new image API | "X-Image-Meta-Name", "X-Image-Meta-Disk_format", "X-Image-Meta-Container_format" are required | "X-Image-Meta-Name" is required |
