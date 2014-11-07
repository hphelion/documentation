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

A HP Helion OpenStack patch update is a series of images and scripts that enhance functionality or fix issues found after a Helion release.  

The update process uses an image-based update technique, where the image that gives a particular node its features is replaced with a new image. This includes the operating system and the services that make a node type unique.  

During the process of updating the node will be unavailable until it is rebuilt with the new image.  When the node comes back up, the node will be using the new image and all the new services/functionality and fixes included in that updated image.  

There are unique images for all the node types in the cloud.  Only the images that need updating will be delivered as part of a patch update.  

There are multiple ways to update your cloud. This HP Helion OpenStack documentation will describe the recommended path and provide alternatives for some nodes in advanced situations.  Unless you are an advanced user it is strongly suggested that you follow the recommended path.  To avoid errors please read the documentation in its entirety prior to starting an update.  

* [Overview of the Update Process](#overview)
* [About the Update Options](#options)
* [Update Troubleshooting](#trouble)
* [Next Steps](#next-steps)

## Overview of the Update Process {#overview}

This section describes what you need to know at a high level to perform an update. 
 
1.	The first step of an [update is to obtain the patch update package](/helion/openstack/update/download/101/) using the Helion Horizon CODN client or the Helion catalog.

	a. In general patch updates can be downloaded to the Undercloud using the Sherpa UI, which is the Helion Horizon CODN client. 

	b. For clouds that do not have Internet access you can use the Helion catalog to download the update. You then copy the update to the undercloud using the Sherpa import feature.  

2.	Prior to performing an update you have to know your cloud infrastructure.  This is vital so that you can choose a path that helps meet your system needs.  Important things to know about your cloud infrastructure are:
	
	* What additional services and software do you have installed, such as the HP Development Platform for Helion.  If you know recommended update plans for these services they can help you plan your overall Helion update.

	* Any special layouts such as availability zones may affect your decision on the sequence of nodes you wish to update.  There are additional details of this in the Compute (n-scale, not ESX):  section of Overcloud Update. 

3.	Each patch update package will be unique, containing only the images of the node types that need to be updated.  

	The update package might contain images for overcloud nodes, the undercloud node, or in rare cases, the seed node (delivered in a separate package). It will also, where necessary, have an updated set of update scripts.  

	So it is important to read the directions for the update that you plan to use, as using instructions from previous updates may not work.  
 
	In general, you should upgrade the seed VM first. Then proceed with the undercloud and the Overcloud. The Overcloud nodes will have suggested ordering and that is listed in the Overcloud section.  

4.	Once you know your infrastructure and the type of nodes that will be updated as a result of this update, prepare a plan for when to update so that your users can be made aware of any downtime or service interruption. 
	It is important to note that it is possible that a full cloud update can happen over a series of planned maintenance cycles. The general goal of Helion update is for nodes to be updatable node-by-node. Sometimes, depending on the nature of the patch this might not be possible. If a certain set of nodes must be updated at the same time to ensure continued functionality they will be called out.  

	**NOTE:** For node types that support backup and restore it is HIGHLY recommended that you backup these nodes prior to performing update steps.  Each section Seed, Undercloud, and specific Overcloud will make you aware of the ability to backup and restore as well as point you to the HP Helion OpenStack document stating how to perform the backup.  

	Throughout the update process you may be asked for particular IP addresses or image IDs to perform a particular manual step.  Steps on how to obtain these are listed in the [Update Prerequisites](/helion/openstack/update/prereqs/101/).

## About the Update Options ## {#options}

There are a few ways to update once you have laid out your maintenance plan: 

* **Helper script.** There is the guided node-by-node order determined by the helper script. The helper script method is the easiest and least error-prone. However, it will limit the user to a certain node order and this may not fit with your update plan.  

* **Manual method.** Performing the update manually gives you more control to make some modifications to the update sequence (usually not recommended, except for compute nodes). Manually updating also allows for updating groups of compute nodes, rather than updating the nodes one by one (only recommended if you know your infrastructure well from nodes to installed services).  

Inside the update sections, you will see clearly marked helper script vs. manual method sub sections to help you distinguish the technique you are using.

* For each node to be updated, manual verification steps are listed.  It is recommended that you follow these steps to validate that a node was updated successfully. If you have additional services/software or needs, you can add to the manual verification steps that are performed after each node update. 

* If the update fails or the verification steps do not show the expected results, then recovery steps might be listed.  With each patch there will be `troubleshooting.rst` delivered in the `/opt/stack/tripleo-ansible` directory that will have potential issues and workarounds.  Always use the new `troubleshooting.rst` delivered with the update. If you cannot recover a node using the troubleshooting steps, use the Backup/Restore functionality to get the node back to original state.

**Note:** The seed update is different in that it only has helper script components. 

## Update Troubleshooting {#trouble}

If you have problems during the patch update, refer to the [Update Troubleshooting](/helion/openstack/update/troubleshooting/101/) for a list of known issues and possible solutions.

## Next Steps {#next-steps}

Download the software package that contains the patch update software, README file, and other information.

For information, see [Obtaining the Patch Update Package](/helion/openstack/update/prereqs/101/).


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*


 