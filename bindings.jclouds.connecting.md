---
layout: default
title: "Connecting to the HP Cloud Service"
permalink: /bindings/jclouds/connecting/
published: false
product: jclouds

---
# Connecting to the HP Cloud Service

This page gives you details on how to connect to the HP Cloud service.

<b>Note</b>: In examples, text in angle brackets indicates a variable:

        <This_is_a_variable>

<h2 id="ConnectingtotheService">Connecting to the Service</h2>

Instantiate the context with the HP Cloud compute provider:

      String identity = "<tenantName>:<accessKey>";  
      String credentials = "<secretKey>";  
      ComputeServiceContext computeCtx = new ComputeServiceContextFactory().createContext("hpcloud-compute", identity, credentials);  

Access the Nova provider-specific API:

      RestContext<NovaClient, NovaAsyncClient> restCtx = computeCtx.unwrap(NovaApiMetadata.CONTEXT_TOKEN);
      NovaApi novaApi = restCtx.getApi();

When you have completed your jclouds compute operations, you need to finish by closing the context:

       context.close(); 

<b>Note</b>: You cannot specify an availability zone if it has not been activated.  To activate an availability zone, go to the [Management Console dashboard](https://console.hpcloud.com/) and click the <font face="courier"><strong>Activate</font></strong> button.

