---
layout: default
title: "HP Cloud Compute API"
permalink: /compute/api/
product: compute

---
# HP Cloud Compute API

The HP Cloud Compute API is documented in your choice of formats:

* [HP Cloud Compute Developer Guide API 1.1, Browser View](https://api-docs.hpcloud.com/hpcloud-compute/1.0/content/ch_compute-supplement-dev-overview.html )
* [HP Cloud Compute Developer Guide API 1.1, PDF View](https://api-docs.hpcloud.com/hpcloud-compute/1.0/hpcloud-compute-1.0.pdf)

For a detailed overview of how to interact with the Compute REST API using cURL:
<iframe src="http://player.vimeo.com/video/37391923?title=0&amp;byline=0&amp;portrait=0" width="640" height="464" frameborder="0"> </iframe>

**Note**: For security purposes, when you create a server, it is automatically assigned a floating, non-removable IP address.

### EC2 Compatibility
In addition to the OpenStack Compute API, HP Cloud Compute also offers EC2 compatibility.  Note that the authentication mechanism for the EC2 API differs from that of the OpenStack Compute API.  Both sets of keys can be found on the [Manage Console](https://console.hpcloud.com/account/api_keys).  Authentication specifics for the OpenStack Compute API can be found in the documents referenced above.  For EC2 API authentication, [see Amazon's documentation on the subject](http://docs.amazonwebservices.com/AWSEC2/latest/UserGuide/index.html?using-query-api.html#query-authentication).

Want details?  Take a look at our [EC2 Compatibility Method List](/ec2-compatibility-method-list).