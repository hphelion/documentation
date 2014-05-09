---
layout: default
title: "HP Helion OpenStack&#174; Community Object Operations Service Overview"
permalink: /cloudos/community/services/object/overview/
product: community

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/community/services/networking/howto/">&#9664; PREV</a> | <a href="/cloudos/community/services/overview/">&#9650; UP</a> | <a href="/cloudos/community/services/object/howto/"> NEXT &#9654</a> </p>

# HP Helion OpenStack&#174; Community Object Operations Service Overview #

<!-- modeled after HP Cloud Networking Getting Started (network.getting.started.md) -->

HP Helion OpenStack&#174; Community Object Operations is a redundant, scalable, and dynamic storage service. The core storage system is designed to provide a safe, secure, network accessible way to store data. You can store an unlimited number of files and each file can be as large as 5GB. With segmented objects, you can upload and store objects of almost unlimited size.

Object Operations allows you to store and retrieve files and content via a simple Web Service Representational State Transfer (ReST) interface.

A cloud storage containers provides a way for you to organize your objects. The object can be any arbitrary data, including a document, image, video, backup file or anything else required by your application. 

Objects have a size limit of 5 gigabytes. However, objects larger than 5GB can be segmented and then concatenated together so that you can upload 5GB segments and download a single concatenated object of any size. You can work with the segments and manifests directly with API requests.

### Using the dashboards {#UI}

You can use the [HP Helion OpenStack&#174; Community Dashboard](/cloudos/community/services/dashboard/overview/) to work with the Compute service.


###Using the API to access Object Operations### {#API}
 
You can use a low-level, raw REST API access to HP Object Operations service. See the [OpenStack Object Storage API v2.0 Reference](http://api.openstack.org/api-ref-objectstorage.html).

###Using the CLI### {#cli}

You can use any of several command-line interface software to access HP Object Operations service. See the [OpenStack Command Line Interface Reference](http://docs.openstack.org/cli-reference/content/swiftclient_commands.html).


## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/) The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack&#174; Community edition takes care of these details for you. The *Operations* contains information on how to manage the system.

<!-- hide me Also see the Help topics that are available in the Operational Dashboard and Administration Dashboard.  Website copies are available:

* [HP Cloud OS Operational Dashboard Help](/cloudos/manage/operational-dashboard/)
* [HP Cloud OS Administration Dashboard Help](/cloudos/manage/administration-dashboard/) -->