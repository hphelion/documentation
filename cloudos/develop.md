---
layout: default
title: "Cloud OS Development"
permalink: /cloudos/develop/
product: cloudos

---

<a name="_top"> </a>

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> &#9664; PREV | <a href="/cloudos/">&#9650; UP</a> | <a href="/cloudos/develop/quickstart-intro">NEXT &#9654;</a> </p>

# Cloud OS Development with REST APIs

Welcome! These topics describe the HP Cloud OS REST APIs for the value-added services. 

## Introduction

HP Cloud OS features an interactive REST API environment: the HP Cloud OS API Documentation app. Learn the syntax and 
properties by reading the well-organized reference details. Submit each request using the provided forms and immediately 
view the server response. The app is installed on your deployed clouds. The documentation app's URLs per service are:

* Eve: http://my_server:21051/?token=&lt;keystone-token-value>

* Focus: http://my_server:21061/?token=&lt;keystone-token-value>

* Graffiti: http://my_server:21071/?token=&lt;keystone-token-value>

On your cloud, replace &lt;my_server> with the your cloud controller node's IP or DNS value. See the next topic for the steps to generate or copy the Keystone v3 token used in REST calls.


## Read the API Quick Start topic

For information about the HP Cloud OS REST API, start with the [API Quick Start - Introduction](/cloudos/develop/quickstart-intro/).

<!-- Add this topic later:
## Read the Value-Added Services topic
Read the [Value-Added Services](/cloudos/api/services/) topic to learn more about Eve, Focus, and Graffiti from HP Cloud OS.
--> 

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


