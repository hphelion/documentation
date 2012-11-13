---
layout: default
title: "HP Cloud jclouds Binding CDN Examples"
permalink: /bindings/jclouds/cdn/

---
# HP Cloud jclouds Binding CDN Examples

This page provides you with examples of how to use the jclouds bindings to perform CDN tasks.  

**Note**: In examples, text in angle brackets indicates a variable:

        <This_is_a_variable>

##Preparing to Use the Provider-Specific API## {#PreparingtoUseTheProviderSpecificAPI}

Before you can execute the object storage commands, you need to perform the following steps: 

Instantiate the context with the hpcloud-objectstorage provider:

        BlobStoreContext context = 
                new BlobStoreContextFactory().createContext("hpcloud-objectstorage", <user>, <password>);

When you need access to HP Cloud-specific features, use the provider-specific context:

        HPCloudObjectStorageClient hpcloudClient =
                HPCloudObjectStorageClient.class.cast(context.getProviderSpecificContext().getApi());

Next, you must get the optional CDN extension client:

        HPCloudCDNClient cdnClient = hpcloudClient.getCDNExtension().get();

When you have completed your jclouds compute operations, you need to finish by closing the context:

       context.close(); 

##Using CDN## {#UsingCDN}

CDN-enabling an existing container:

        URI uri = cdnClient.enableCDN(<container>);

Determining if a container is CDN-enabled:

        ContainerCDNMetadata cdnMetadata = cdnClient.getCDNMetadata(<container>);
                boolean cdnEnabled = cdnMetadata.isCDNEnabled());

Generating a list of CDN-enabled containers:

        Set<ContainerCDNMetadata> cdnContainers =
                cdnClient.listCDNContainers(ListCDNContainerOptions.Builder.maxResults(10));

Accessing the metadata for a CDN-enabled container:

        ContainerCDNMetadata cdnMetadata = cdnClient.getCDNMetadata(<container>);

Updating the Metadata for a CDN-Enabled Container

        URI newUri = cdnClient.updateCDN(<container>, 43200);

CDN-disabling a container:

        cdnClient.disableCDN(<container>);

Deleting an existing directory/container:

        boolean deleted = hpcloudClient.deleteContainerIfEmpty(<container>);
