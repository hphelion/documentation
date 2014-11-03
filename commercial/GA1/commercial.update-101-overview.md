---
layout: default
title: "HP Helion OpenStack&#174; Update Overview"
permalink: /helion/openstack/update/overview/101/
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
<p style="font-size: small;"> <a href="/helion/openstack/">&#9664; PREV | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/faq/">NEXT &#9654; </a></p>
-->
# HP Helion OpenStack&reg; Update Overview

A Helion update patch is a series of images and scripts that Hewlett Packard will release to enhance functionality or fix issues found after a Helion release.  Helion update uses an image based update technique.  This means that the image that gives a particular node its features is replaced with a new one.  This includes the operating system and the services that make a node type unique.  During the process of updating the node goes down and is rebuilt with the new image.  When it comes back up it will be using the new image and all the new services/functionality and fixes included in that image.  There are unique images for all the node types in the cloud.  Only the images that need updating will be delivered as part of a Helion update patch.  There are a few ways to update your cloud, this document will describe a recommended way and give a few alternatives for some nodes in advanced situations.  Unless you are an advanced user it is strongly suggested that you follow the recommended path.  To avoid error please read this document in its entirety prior to starting an update.  
High-level walkthrough of update:
In this section we will walk you through what you need to know at a high level to update.  The sections later in this document dive deeper into this sections topics.  
1.	The first step of an update is to obtain the updates via the Helion catalog or via Helion Horizon CODN client.  In general all patch updates are downloaded to the Undercloud via the Helion Horizon CODN client called Sherpa.  For clouds that do not have Internet access or prefer to copy it from an outside host the Helion catalog is used to download the update.  The update is then copied to the Undercloud via Sherpa the Helion Horizion CODN client's import feature.  If the Undercloud has access to the Internet then a direct download from the Helion catalog can occur via Sherpa.  For a guided walkthrough to both methods of getting a patch update into your cloud please see the section Import the patch/update CSU into the cloud. 
2.	Prior to performing an update you have to know your cloud infrastructure.  This is vital so that you can choose a path that helps meet your system needs.  Important things to know about your cloud infrastructure are:
* What additional services and software do you have installed, such as Hewlett Packard Developer Platform for Helion.  If you know recommended update plans for these services they can help you plan your overall Helion update.
* Any special layouts such as availability zones may affect your decision on the sequence of nodes you wish to update.  There are additional details of this in the Compute (n-scale, not ESX):  section of Overcloud Update. 
3.	Each update patch will be unique as it will only contain the images of the node types that need to be updated.  It can contain images for Overcloud nodes, the Undercloud node or in rare cases the Seed node (delivered in a separate package).  It will also where necessary have an updated set of update scripts.  So it is important to read the directions for the update that you plan to use, as using instructions from previous updates may not work.  For this particular version the update sequence is listed in each section where sections from top to bottom are higher priority.  In the update covered by this document the Seed should come first, then the Undercloud and finally the Overcloud.  The Overcloud nodes will have suggested ordering and that is listed in the Overcloud section.  
4.	Once you know your infrastructure and the type of nodes that will be updated as a result of this update you'll want to prepare a plan for when to update so that your users can be made aware of any downtime or service interruption.  It is important to note that it is possible that a full cloud update can happen over a series of planned maintenance cycles.  The general goal of Helion update is for nodes to be updatable Node by Node.  Sometimes dependent on the nature of the patch this may not be possible.  If a certain set of nodes must be updated at the same time to ensure continued functionality they will be called out.  

NOTE:  For node types that support backup and restore it is HIGHLY recommended that you backup these nodes prior to performing update steps.  Each section Seed, Undercloud, and specific Overcloud will make you aware of the ability to backup and restore as well as point you to the Hewlett Packard document stating how to perform the backup.  

Throughout the update process you may be asked for particular IP addresses or Glance image IDs to perform a particular manual step.  Steps on how to obtain these are listed in the Appendix section:  Gather information needed for update:   
5.	There are a few ways to update once you have laid out your maintenance plan.  There is the guided node by node order already determined way via the helper script.  The helper script method is the easiest and least error prone as there are a lot of manual steps without it.  However, it will limit the user to a certain node order and this may not fit with your update plan.  

Another way to update the cloud is the manual method.  It gives you more control and while it has a recommended ordering to the nodes you can (though usually not recommended, except for compute nodes) make some modifications to the update sequence.  It also allows for grouping compute nodes so that you are not having to do them one by one (only recommended if you know your infrastructure well from nodes to installed services).  

The seed update is different in that it only has helper script components.  Inside the update sections you will seed clearly marked helper script vs. manual method sub sections to help you distinguish the technique you are using.       
a.	For each node updated some manual verification steps will be listed.  It is recommended that you follow these steps to validate that a node was updated successfully.  If you have additional services/software or needs you can add to the manual verification steps that are performed after each node update. 
b.	If the update fails or the verification steps do not show the expected results, then recovery steps may be listed.  With each patch there will be troubleshooting.rst delivered in the /opt/stack/tripleo-ansible directory that will have potential issues and workarounds.  Always use the new troubleshooting.rst delivered with the update.  If a node is not able to be recovered via the troubleshooting steps then the restore portion of the Backup/Restore functionality can be used to get a node back to original state.

