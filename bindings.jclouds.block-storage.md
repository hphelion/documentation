---
layout: default
title: "HP Cloud jclouds Binding Block Storage Examples"
permalink: /bindings/jclouds/block-storage/
published: false
product: jclouds

---
# HP Cloud jclouds Binding Block Storage Examples

This page provides you with examples of how to use the jclouds binding to perform Block Storage tasks.  This page discusses the following tasks:

* [Connecting to the Service](#ConnectingtotheService)
* [Volume Operations](#VolumeOperations)
* [Volume Attachments](#VolumeAttachments)
* [Snapshots](#Snapshots)

*Note*: In examples, text in angle brackets indicates a variable:

        <This_is_a_variable>

<h2 id="ConnectingtotheService">Connecting to the Service</h2>

Instantiate the ComputeServiceContext with the HP Cloud Compute provider:  

      String identity = "<tenantName>:<accessKeyID>";  
      String credentials = "<secretKey>";  
      ComputeServiceContext computeCtx = new ComputeServiceContextFactory().createContext("hpcloud-compute", identity, credentials) ;  

Access the Nova provider-specific API:

      RestContext<NovaClient, NovaAsyncClient> restCtx = computeCtx.unwrap(NovaApiMetadata.CONTEXT_TOKEN);
      NovaApi novApi = restCtx.getApi();

Access the Block Storage (Volume) API:  

      VolumeApi volumeApi = novaApi.getVolumeExtensionForZone("<availabilityZone>");  

When you have completed your jclouds compute operations, you need to finish by closing the context:

     computeCtx.close(); 

*Note*: You cannot specify an availability zone if it has not been activated.  To activate an availability zone, go to the [Management Console dashboard](https://console.hpcloud.com/) and click the <font face="courier"><strong>Activate</font></strong> button.

<h2 id="VolumeOperations">Volume Operations</h2>

Return a summary list of volumes:  

      Set<Volume> volumes = volumeApi.listVolumes();  

Return a detailed list of volumes:  

      Set<Volume> volDetails = volumeApi.listVolumesInDetail();  

Return data about the given volume:  

      Volume volume = volumeApi.getVolume("<volumeID>");  

Create a new volume:  

      Volume volume = volumeApi.createVolume("<sizeInGB>", CreateVolumeOptions.NONE);  

Delete a volume:  

      Boolean deleted = volumeApi.deleteVolume("<volumeID>");  


<h2 id="VolumeAttachments">Volume Attachments</h2>

List volume attachments for a given instance:  

      Set<VolumeAttachment> attachments = volumeApi.listAttachmentsOnServer("<serverID>");  

Get a specific attached volume:   

      VolumeAttachment attachment = volumeApi.getAttachmentForVolumeOnServer("<volumeID>", "<serverID>");  

Attach a volume to an instance:  

      VolumeAttachment attachment = volumeApi.attachVolumeToServerAsDevice("<volumeID>", "<serverID>", "<deviceName>");  

Detach a volume from an instance:  

      Boolean detached = volumeApi.detachVolumeFromServer("<serverID>", "<volumeID>");  

<h2 id="Snapshots">Snapshots</h2>

Return a summary list of snapshots:  

      Set<VolumeSnapshot> snapshots = volumeApi.listSnapshots();  

Return a detailed list of snapshots:  

      Set<VolumeSnapshot> snapshots = volumeApi.listSnapshotsInDetail();  

Return details about a specific snapshot:  

      VolumeSnapshot snapshot = volumeApi.getSnapshot("<snapshotID>");

Create a new snapshot:  

      VolumeSnapshot snapshot = volumeApi.createSnapshot("<volumeID>", CreateVolumeSnapshotOptions.NONE); 

Delete a snapshot:  

      Boolean deleted = volumeApi.deleteSnapshot("<snapshotID>");  


See the [HP Cloud jclouds Java/Clojure Bindings](/bindings/jclouds) page for further information on the jclouds binding.
