---
layout: default
title: "HP Helion OpenStack&#174; Object Operations Service Overview"
permalink: /helion/openstack/ga/services/object/overview/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/openstack/services/networking/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/orchestration/overview/"> NEXT &#9654</a> </p>-->

# HP Helion OpenStack&#174; Object Service Overview #

<!-- modeled after HP Cloud Networking Getting Started (network.getting.started.md) -->

Based on OpenStack Swift, HP Helion OpenStack&#174; Object service is a redundant, scalable, durable, and dynamic storage service. The core storage system is designed to provide a safe, secure, network accessible way to store data. You can store large amount of unstructured data and retrieve objects in publicly accessible physical machine.   

Swift is also designed to be horizontally scalable, allowing it to handle large number of simultaneous connections. It enables you to store, retrieve, and delete files and contents through a simple RESTFul API interface.

A cloud storage container provides a way to organize your objects. An object can be any arbitrary data, including a document, image, video, backup file or any  data that is required by your application.

Objects have a size limit of 5 GB. However, objects larger than 5 GB can be segmented and then concatenated together so that you can upload 5 GB segments and download a single concatenated object of any size. You can work with the segments and manifests directly with API requests.

HP Helion OpenStack Object&#174; service will have swift cluster as a part of cloud creation. It allows to scale-out swift to store end cloud user data and also to protect from 'no single point of failure policy'. 



##Purpose of Swift

Swift is used for two different purposes:

1. Cloud Controller Service data (used for Helion OpenStack&#174; Services implementation and High Availability (HA)) 
2. Tenant Object Storage data (used by end Tenants / Project Users for scaled-out Object Storage).

HP Helion OpenStack&#174; Swift which is deployed by default during installation of HP Helion OpenStack is used to serve Cloud Controller internal data. This can be expanded to scale-out to server user data storage. 


HP Helion OpenStack introduces the support of scale-out Swift. For more details, refer [Scale-out Swift](/helion/openstack/ga/services/object/overview/scale-out-swift/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
