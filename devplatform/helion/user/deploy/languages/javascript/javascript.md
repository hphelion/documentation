---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/javascript/
title: "Developing in Javascript"

---
<!--PUBLISHED-->

# HP Helion Development Platform: Developing in Javascript[](#java "Permalink to this headline")
===========================================

Whether you&#8217;re deploying an application to the HP Helion Development Platform, a
Cloud Foundry based Platform as a Service (PaaS), or writing applications that take
advantage of HP Helion OpenStack&reg; to manage infrastructure or software services, tools
to enable successful development are available in JavaScript.

##Application Lifecycle Services
Application Lifecycle Services (ALS), a cloud foundry based Platform as a Service,
has a built in Node framework with multiple versions of the Node.js runtime.
NPM is used to install Node packages automatically.
Deploying applications to the platform is as simple as adding configuration to
a YAML configuration file and using a console application to push the application to ALS.
Management of the deployed application and its services happens through a web application or
a console application.
To learn more see:

- [Working with applications in Node](/als/v1/user/deploy/languages/node/)
- [The manifest.yml reference](/als/v1/user/deploy/manifestyml/)

##HP Helion SDK
Javascript applications can communicate directly with the [Helion APIs](ref="http://docs.hpcloud.com/api) through a REST client
or use the SDK. The SDK is designed to have a simple, well-documented API set to simplify working with the
services.
To understand how it works, here is an example of uploading and downloading from object storage:

    var pkgcloud = require(&#39;pkgcloud&#39;);
    var hpStorageClient = pkgcloud.storage.createClient({
    provider: &#39;hp&#39;,
    username: &#39;your-user-name&#39;,
    apiKey: &#39;your-api-key&#39;,
    region: &#39;region of identity service&#39;,
    authUrl: &#39;https://your-identity-service&#39; });
    hpStorageClient.upload({
     container: &#39;my-container&#39;,
     remote: &#39;remote-file-name&#39;,
     local: &#39;path/to/local/file&#39;
         },
     function(err, result) {
    if(err) {
      console.dir(err);
      return;
    }
    console.log(<span class="s2">&quot;File uploaded successfully&quot;);
    });
    hpStorageClient.download({
     container: &#39;my-container&#39;,
     remote: &#39;my-file&#39;,
     local: &#39;/path/to/my/file&#39;
       },
       function( err, result) {
    if(err) {
     console.dir(err);
     return;
    }
       console.log(<span class="s2">&quot;File downloaded successfully&quot;);
    });

The example above uploads a local file from the file system into object storage,
and downloads a file onto the local file system.
You can also work with streams for upload and download operations.

    var fs = require(&#39;fs&#39;),
    var pkgcloud = require(&#39;pkgcloud&#39;);
    var hpStorageClient = pkgcloud.storage.createClient({
    provider: &#39;hp&#39;,
    username: &#39;your-user-name&#39;,
    apiKey: &#39;your-api-key&#39;,
    region: &#39;region of identity service&#39;,
    authUrl: &#39;https://your-identity-service&#39; });
    var myFile = fs.createReadStream(&#39;/my/local/file&#39;);
    myFile.pipe(hpStorageClient.upload({
    container: &#39;my-container&#39;,
    remote: &#39;remote-file-name&#39;
    },
    function(err, result) {
    if(err) {
      console.dir(err);
      return;
    }
    ));
    var writableFile = fs.createWriteStream(&#39;/path/to/my/file&#39;);
    hpStorageClient.download({
    container: &#39;my-container&#39;,
    remote: &#39;remote-file-name&#39;
    },
    function(err, result) {
     if(err) {
       console.dir(err);
       return;
    })).pipe(writableFile);

To learn more about using the SDK:
- 
- [Getting Started with the Javascript SDK](/als/v1/user/deploy/languages/javascript/getstarted/)
- [Identity Service, Authentication, and the Service Catalog ](/als/v1/user/deploy/languages/javascript/authentication/)
- [Working With Object Storage in Javascript ](/als/v1/user/deploy/languages/javascript/objectstore/)
