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

# HP Helion OpenStack&#174; Object Operations Service Overview #

<!-- modeled after HP Cloud Networking Getting Started (network.getting.started.md) -->

Based on OpenStack Swift, HP Helion OpenStack Object Operations is a redundant, scalable, durable, and dynamic storage service. The core storage system is designed to provide a safe, secure, network accessible way to store data. You can store large amount of unstructured data and retrieve objects in publicly accessible physical machine. With segmented objects, you can upload and store objects of almost unlimited size.  

Swift has the capacity to scale from a few Terabytes (TB) to multiple Petabytes (PB) of storage. It is also designed to be horizontally scaling, allowing it to handle large number of simultaneous connections. It enables you to store, retrieve, and delete files and contents through a simple RESTFul API interface.


A cloud storage container provides a way for you to organize your objects. The object can be any arbitrary data, including a document, image, video, backup file or any  data that is required by your application.

Objects have a size limit of 5 GB. However, objects larger than 5 GB can be segmented and then concatenated together so that you can upload 5 GB segments and download a single concatenated object of any size. You can work with the segments and manifests directly with API requests.


HP Helion Openstack Object Operation service will have swift cluster as a part of cloud creation. It allows to scale-out swift to store end cloud user data and also to protect from no single point of failure policy. 


##Purpose of Swift

Swift is used for two different purposes:

1. Cloud Controller Service data (used for Helion OpenStack Services implementation and HA) 
2. Tenant Object Storage data (used by end Tenants / Project Users for scaled-out Object Storage).

User can leverage a single swift which is deployed during installation to service Cloud Controller internal data and can expand over time to a scaled-out Tenant object Storage. 

The usage of Cloud Controller's Swift is in the order of tens to hundreds of TB whereas Tenant Object Storage can scale up to PBs over a period of time.

<!---
Some customers may want Scaled Out Swift right from onset of their deployments, whereas others may start out without a requirement for Object Storage, and may later on decide to add on Swift Object Storage.

While Swift will be used for 2 different purposes (Cloud Controller Service data and Tenant Object Storage), customers do not want to maintain 2 separate Swifts within their OpenStack, so we need a strategy to use a single Swift implementation that starts with servicing Cloud Controller internal data, but can expand over time to scaled out Tenant Object Storage. --->

HP Helion OpenStack introduces the support of scale-out Swift. For more details refer [Scale out Swift](/helion/openstack/ga/services/object/overview/scale-out-swift/)








<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>






*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
