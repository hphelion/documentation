---
layout: default
title: "HP Helion OpenStack&#174; Object Operations Service Overview"
permalink: /helion/openstack/services/object/overview/
product: commercial

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/helion/openstack/services/networking/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/orchestration/overview/"> NEXT &#9654</a> </p>

# HP Helion OpenStack&#174; Object Operations Service Overview #

<!-- modeled after HP Cloud Networking Getting Started (network.getting.started.md) -->

<!---
Based on OpenStack Swift, HP Helion OpenStack Object Operations is a redundant, scalable, and dynamic storage service. The core storage system is designed to provide a safe, secure, network accessible way to store data. You can store an unlimited number of files and each file can be as large as 5 GB. With segmented objects, you can upload and store objects of almost unlimited size.
. 

Object Operations allows you to store and retrieve files and content through a simple RESTful API interface.

A cloud storage container provides a way for you to organize your objects. The object can be any arbitrary data, including a document, image, video, backup file or anything else required by your application. 

Objects have a size limit of 5 GB. However, objects larger than 5 GB can be segmented and then concatenated together so that you can upload 5 GB segments and download a single concatenated object of any size. You can work with the segments and manifests directly with API requests. --->

Based on OpenStack Swift, HP Helion OpenStack Object Operations is a redundant, scalable, durable, and dynamic storage service. The core storage system is designed to provide a safe, secure, network accessible way to store data. You can store large amount of unstructured data and retrieve objects in publicly accessible physical machine. With segmented objects, you can upload and store objects of almost unlimited size.  

Swift has the capacity to scale from a few terabytes to multiple Petabytes of storage. It is also designed to be horizontally scaling, allowing it to handle large number of simultaneous connections. It enables you to store, retrieve, and delete files and contents through a simple RESTFul API interface.

A cloud storage container provides a way for you to organize your objects. The object can be any arbitrary data, including a document, image, video, backup file or any  data that is required by your application.

Objects have a size limit of 5 GB. However, objects larger than 5GB can be segmented and then concatenated together so that you can upload 5GB segments and download a single concatenated object of any size. You can work with the segments and manifests directly with API requests.

HP Helion Openstack Object Operation service will have swift cluster as a part of cloud creation. It deploys scale-out swift to store end cloud user data and also to protect from no single point of failure policy. 

<!--
##Purpose

Swift is used for two different purpose:

* Cloud Controller Service Data
* Tenant Object Storage

Cloud Controller Service data is used for implementation of Helion OpenStack Services and High Availability (HA).

Tenant Object Storage data is used to scale out object storage by end Tenants or Project Users.

**Embedded Swift**

Embedded Swift is deployed on cloud controller. Initially only one object ring is provided for internal Cloud controller data like Glance images, Sherpa cache, Focus persistence, etc. You are provided with an option to scale out swift services if required. In this case a separate object ring is created and will be made as a default ring. Therefore,  a new scale-out ring stores all incoming object request. 

<img src ="media/hp-helion-swift-nodes.png/">


**Different Object storage ring without using cloud controller**


HP Helion will deploy two node CE Swift on separate nodes. To start with, Helion will have only one object ring meant for internal Cloud controller data like Glance images, Sherpa cache, Focus persistence, etc. Later, a separate object ring will be created if customer asks for scale out Swift, and will be made as default ring. All incoming object request will be stored in new scale-out ring. Please refer HP Helion scale out architecture for more details.



<!--
## Working with the Object Operations Service

To [perform tasks using the Object Operations service](#howto), you can use the dashboard, API or CLI.

### Using the dashboards {#UI}

You can use the [HP Helion OpenStack Dashboard](/helion/openstack/dashboard/how-works/) to work with the Object Operations service.

###Using the API to access Object Operations### {#API}

You can use a low-level, raw REST API access to HP Object Operations service. See the [OpenStack Object Storage API v2.0 Reference](http://developer.openstack.org/api-ref-objectstorage-v1.html).

###Using the CLI### {#cli}

You can use any of several command-line interface software to access HP Object Operations service. See the [OpenStack Command Line Interface Reference](http://docs.openstack.org/cli-reference/content/swiftclient_commands.html).

For more information on installing the CLI, see [Install the OpenStack command-line clients](http://docs.openstack.org/user-guide/content/install_clients.html). -->
<!--

## How To's with the HP Helion OpenStack Object Operations Service ## {#howto}

<!-- Taken from http://wiki.hpcloud.net/display/core/Core+Edition+Use+cases#CoreEditionUsecases-OverCloud -->
<!--
The following lists of tasks can be performed by a user or administrator through the [HP Helion OpenStack Dashboard](/helion/openstack/dashboard/how-works/), the OpenStack [CLI](http://docs.openstack.org/cli-reference/content/swiftclient_commands.html) or OpenStack [API](http://developer.openstack.org/api-ref-objectstorage-v1.html).

Depending upon your user type, you can perform the following tasks. 
<!--

### Working with containers ##

The Object Operations service allows users to create a storage container, move files to and from that storage container, and delete containers that are no longer needed.

- **Creating, modifying and deleting containers** -- Create, configure, and delete storage containers as needed.
- **Uploading files to a container** -- Upload files from a local system to your storage container.
- **Downloading files from a container** -- Download files from your container to a local system.
- **Deleting files from a container** -- Delete any of the files in your storage container.

## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/). The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack takes care of these details for you. The *Operations* section contains information on how to manage the system.

The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.
-->

 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
