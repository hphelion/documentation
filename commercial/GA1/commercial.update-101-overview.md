---
layout: default
title: "HP Helion OpenStack&#174; Update Overview"
permalink: /helion/openstack/update/overview/101/
product: commercial.ga

---
<!--PUBLISHED-->


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

An HP Helion OpenStack patch update is a series of images and scripts that enhance functionality or fix issues found in a  previous Helion release.  

The update process uses an image-based update technique, where the image that gives a particular node its features is replaced with a new image. This includes the operating system and the services that make a node type unique.  

During the process of updating, the node will be unavailable until it is updated with the new image.  When the node comes back up, the node will be using the new image and all the new services/functionality and fixes included in that updated image.  

There are unique images for all the node types in the cloud.  Only the images that need updating will be delivered as part of a patch update.  

There are multiple ways to update your cloud. This HP Helion OpenStack documentation will describe the recommended path and provide alternatives for some nodes in advanced situations.  Unless you are an advanced user it is strongly suggested that you follow the recommended path.  To avoid errors please read the documentation in its entirety prior to starting an update.  

* [Overview of the Update Process](#overview)
* [About the Update Options](#options)
* [Update Troubleshooting](#trouble)
* [Next Steps](#next-steps)

The HP Helion OpenStack 1.01 update with apply to all of the nodes: seed, undercloud, overcloud controllers, overcloud Swift, overcloud VSA, and overcloud compute nodes. There is also an update for the optional HP Helion OpenStack DNSaaS. 

## Overview of the Update Process {#overview}

This section describes what you need to know at a high level to perform an update. 

1. The first step of an [update is to obtain the patch update package](/helion/openstack/update/download/101/) using the Helion Horizon HDN client or the Helion catalog: 

	- In general, patch updates can be downloaded to the undercloud using the Sherpa UI, which is the Helion Horizon HDN client. The client can be found on the Updates and Extensions tab in the Helion Dashboard on the overcloud. 

	- For clouds that do not have Internet access, use the Helion catalog to download the update and then copy the update to the undercloud using the Sherpa import feature.  

2. Prior to performing an update you must know your cloud infrastructure.  This is vital so that you can choose a path that helps meet your system needs.  Important things to know about your cloud infrastructure are:

	* Which additional services and software you have installed, such as the HP Development Platform for Helion.  If you know the recommended update plans for these services, that can help you plan your overall Helion update.

	* Any special layouts such as availability zones may affect your decision on the sequence of nodes you wish to update.  There are additional details of this in the [Compute (n-scale, not ESX)](/helion/openstack/update/overcloud/101/#compute) section of *Updating the Overcloud*. 

3. Each patch update package will be unique, containing only the images of the node types that need to be updated.  

	* The update package might contain images for the overcloud node, the undercloud node, or in rare cases, the seed node (delivered in a separate package). It will also, where necessary, have a set of update scripts.  

	* So it is important to read the directions for the update that you plan to use. Instructions from previous updates will not work.  
 
		In general, you should upgrade the seed VM first, and then proceed to the undercloud and the overcloud. The overcloud nodes will have suggested ordering and that is listed in the overcloud section of the update download document.  

4. Once you know your infrastructure and the type of nodes that will be updated as a result of this update, prepare a plan for when to update so that your users can be made aware of any potential downtime or service interruption. 

	It is important to note that it is possible for a full cloud update to happen over a series of planned maintenance cycles. Nodes are typically updatable node-by-node, but depending on the nature of the specific patch, this may not be possible. If a certain set of nodes must be updated at the same time to ensure continued functionality, this will be called out.  

	**NOTE:** For node types that support backup and restore, it is HIGHLY recommended that you back up these nodes prior to performing any update steps.  Each section seed, undercloud, and specific overcloud will make you aware of the ability to backup and restore.  

	Throughout the update process you may be asked for particular IP addresses or image IDs to perform a particular manual step.  Steps on how to obtain these are listed in the [Update Prerequisites](/helion/openstack/update/prereqs/101/).

5. After the update is complete:
	
	* If your cloud uses the optional HP Helion OpenStack DNSaaS (Domain Name Server as a Service), install HP Helion OpenStack DNSaaS 1.01. For installation instructions, see [DNSaaS Installation and Configuration](/helion/openstack/install/dnsaas/).

		**Note:** The process for moving from DNSaaS 1.0 to DNSaaS 1.01 is to uninstall DNSaaS version 1.0, then install DNSaaS version 1.01. Do not attempt to install version 1.01 over the previous version. 

	* Review [Configuring Your Network Securely](/helion/openstack/install/security/) for information on configuring your HP Helion OpenStack deployment to protect against external abuse and insider abuse or administrative errors.

## About the Update Options ## {#options}

There are two ways to update once you have laid out your update plan: 

* **Helper script.** There is the guided node-by-node order determined by the helper script. The helper script method is the easiest and least error-prone. However, it will limit the user to a certain node order and this may not fit with your update plan.  

* **Manual method.** Performing the update manually gives you more control to make some modifications to the update sequence (usually not recommended, except for compute nodes).  

Inside the update documentation, you will see sections clearly marked as helper script method or manual method to help you distinguish which technique you are using.

 Manual verification steps are provided for each node to be updated. It is recommended that you follow these steps to validate that a node was updated successfully. If you have additional services/software or needs, you can add to the manual verification steps that are performed after each node update. 

**Note:** The seed update is different in that it has helper script components only. 

## Update Troubleshooting {#trouble}

If the update fails or the verification steps do not show the expected results, then recovery steps might be listed.  With each patch there will be a `troubleshooting.rst` file delivered in the `/opt/stack/tripleo-ansible` directory that will have potential issues and workarounds.  Always use the new `troubleshooting.rst` delivered with the update. If you cannot recover a node using the troubleshooting steps, use the Backup/Restore functionality to get the node back to original state.

If you have problems during the patch update, refer to the [Update Troubleshooting](/helion/openstack/update/troubleshooting/101/) for a list of known issues and possible solutions.

## Next Steps {#next-steps}

Download the software package that contains the patch update software, README file, and other information.

For information, see [Obtaining the Patch Update Package](/helion/openstack/update/download/101/).


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*


 