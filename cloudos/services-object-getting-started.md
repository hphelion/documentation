---
layout: default
title: "Getting Started with HP Cloud OS Object Storage Service "
permalink: /cloudos/services/object/getting-started/
product: compute

---
<!--PUBLISHED-->
# Getting Started with HP Cloud OS Object Storage Service #

<!-- modeled after HP Cloud Networking Getting Started (network.getting.started.md) -->

HP Cloud OS Object Storage is an affordable, redundant, scalable, and dynamic storage service. The core storage system is designed to provide a safe, secure, network accessible way to store data. You can store an unlimited number of files and each file can be as large as 5GB. With segmented objects, you can upload and store objects of virtually any size.

HP Cloud OS Object Storage allows you to store and retrieve files and content via a simple Web Service Representational State Transfer (ReST) interface.

Key terms include:

- Storage Accounts -- The account is the top level resource in the hierarchy. There is a one-to-one relationship between an account and the project/tenant. 

	You may set custom metadata on an account.

- Cloud Storage Containers -- A container provides a way for you to organize your objects. You can pick any name that is meaningful to you. However, see Container and Object Naming for restrictions on container names.

	You may also set custom metadata on a container.

- Cloud Storage Objects -- An object provides a way for you to store any arbitrary data. This may be a document, image, video, backup file or anything else required by your application. You can pick any name that is meaningful to you. However, see Container and Object Naming for restrictions on object names.

	Objects have a size limit of 5 gigabytes. However, objects larger than 5GB can be segmented and then concatenated together so that you can upload 5GB segments and download a single concatenated object of any size. You can work with the segments and manifests directly with API requests.

- Container and Object Naming -- Container and object names should be UTF-8 encoded. If the names are stored using a different encoding (e.g., Unicode), they must be converted to UTF-8 encoding.

	To interact with the ReST API, the UTF-8 string should then be URL-encoded. 

###Using the API to access Imaging### {#API}
 
You can use a low-level, raw REST API access to HP Cloud OS Imaging service. See the [HP Cloud OS Object Storage Service API page](/api/v13/object-storage/).

###Using the CLI### {#cli}

You can use any of several command-line interface software to access HP Cloud OS Object Storage service. See [HP Cloud OS CLI](/cli/).

###Using language bindings### {#bindings}

You can use any of several language bindings to access HP Cloud OS Object Storage service. See [HP Cloud binding support](/bindings/).


## For more information ##
Also see the Help topics that are available in the Operational Dashboard and Administration Dashboard.  Website copies are available:

* [HP Cloud OS Operational Dashboard Help](/cloudos/manage/operational-dashboard/)
* [HP Cloud OS Administration Dashboard Help](/cloudos/manage/administration-dashboard/)
