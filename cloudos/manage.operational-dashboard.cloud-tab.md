---
layout: default
title: "Operational Dashboard: Cloud Tab"
permalink: /cloudos/manage/operational-dashboard/cloud-tab/
product: cloudos

---


<a name="_top"> </a>

<script> 

function PageRefresh { 
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/manage/operational-dashboard/environment-tab/">&#9664; PREV</a> | <a href="/cloudos/manage/operational-dashboard/">&#9650; UP</a> | <a href="/cloudos/manage/operational-dashboard/settings-tab/">NEXT &#9654;</a> </p>

# Operational Dashboard: Cloud Tab

The Cloud tab contains the following panels on which you complete the installation process to create a cloud, and 
download install modules and plugins. For the installation process, you must complete the Manage Nodes and Manage Clouds panels in the order 
they are displayed. 

* [Manage Nodes](#manage-nodes)
  
* [Manage Clouds](#manage-clouds)
    
* [Hot Fixes](#hot-fixes)
    
* [Updates and Extensions](#updates-and-extensions) 

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px;"> <b>Note:</b> The Cloud tab does not appear until you have 
completed all the installation steps on the <a href="/cloudos/manage/operational-dashboard/environment-tab">Environment tab</a>.</p>

For procedural instructions, see [Install and Configure Your Clouds](/cloudos/install/).

## Manage Nodes

The following information provides details about the Manage Nodes panel.

**Concepts:**

* [Manage Nodes Overview](#manage-nodes-overview)

**UI Descriptions:**

* [Manage Nodes Page](#manage-nodes-page)

* [Edit Node Dialog](#edit-node-dialog)

* [Manage Nodes Details Page](#manage-nodes-details-page) 


### Manage Nodes Overview

The Manage Nodes panel lists all of the nodes that have been discovered through the PXE-boot process. Nodes that are Allocated can be 
subsequently used as part of a Cloud installation. Nodes can be edited so that they have meaningful names or descriptions. Clicking on a node's 
ID gives more information about that node, including its role in a cloud deployment.

Before you begin:

* You have console access to all the virtual and bare-metal servers. This is required to power on the servers to trigger Network (PXE) boot, monitor 
operating system installation and if need be provide additional firmware drivers when prompted.
    
* Network and storage infrastructures are set up correctly. For the post-install of the operating system, a few steps are required to configure 
and mount the folder on an additional storage.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px;"> <b>Note:</b> Ensure that the boot order on all nodes is configured to boot from the network first (this only occurs once as the PXE service will not 
try to network boot a node again if it has already done so).</p>

For procedural instructions on setting up and configuring your nodes, see [Install and Configure Your Cloud](/cloudos/install).

### Manage Nodes Page

To access: Select the Cloud tab > Manage Nodes.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px;"> <b>Tip:</b> Access the virtual and bare-metal server's consoles 
to monitor operating system installation. Some of your hardware requires non-free firmware files to operate. The firmware can be loaded from removable media, 
such as a USB stick or CD/DVD.</p>

If a dialog displays prompting you to load missing firmware, provide the appropriate drive.

The following table describes the Manage Nodes page UI elements:

( table - coming soon ) 


### Edit Node Dialog

To access: Select the Cloud tab > Manage Nodes > Edit Node for the node you want to edit.

The following table describes the Edit Nodes dialog UI elements:

( table - coming soon )



### Manage Nodes Details Page

To access: Select the Cloud tab > Manage Nodes and click the node name link.

This page displays all the values used for the selected node.

The following table describes the Manage Nodes Details page UI elements:

( table - coming soon ) 
  




<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Manage Clouds

The following information provides details about the Manage Clouds panel.

**Concepts:**

* [Manage Clouds Overview](#manage-clouds-overview)

**UI Descriptions:**

* [Manage Clouds Page](#manage-clouds-page)
    
* [Create Cloud Dialog](#create-cloud-dialog)

* [Create Compute Region Dialog](#create-compute-region-dialog)
	
* [Extend Compute Region Dialog](#extend-compute-region-dialog)

* [Reduce Compute Region Dialog](#reduce-compute-region-dialog)

* [Remove Compute Region Dialog](#remove-compute-region-dialog)

* [Remove Cloud Dialog](#remove-cloud-dialog)

* [Manage Clouds Details Page](#manage-clouds-details-page)



### Manage Clouds Overview

The Manage Clouds panel lists the cloud that has been deployed in the current environment and the compute region(s). 
There is no limit to the number of compute regions that can be created and deployed, other than resource limitations.

The simplest cloud has one Compute Region with one Compute Controller that manages all the compute nodes. After creating an active cloud, 
you can go back and add more regions as your cloud environment expands. Or, you can plan to include several compute regions in your cloud 
depending on your environment.

There are multiple use cases where you would prefer to have separate compute regions, such as:

* To accommodate a heterogeneous set of hardware configured for different workloads.

* To distribute the workload across regions to get better response times. Each region can contain dedicated endpoints with a full Nova installation 
including its own message queue and database.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px;"> <b>Note:</b> Each region must use unique nodes - managed nodes cannot be 
shared between regions.</p> 


### Manage Clouds Page

To access: Select the Cloud tab > Manage Clouds and click the cloud name link.

The following table describes the Manage Clouds page UI elements:

( table - coming soon ) 
  



    
### Create Cloud Dialog

To access: Select the Cloud tab > Manage Clouds and click **Create Cloud**.

After you complete allocating the nodes on the Manage Nodes panel, you are ready to create your cloud.

The following table describes the Create Cloud dialog UI elements:

( table - coming soon ) 
  


### Create Compute Region Dialog

To access: Select the Cloud tab > Manage Clouds and click **Create Compute Region** for the corresponding cloud.

When the Create Cloud step is complete, the cloud's state displays Active on the Manage Clouds page. 
You can now create one or more compute regions. This is the last step in the installation process of creating a cloud. 
When the compute region is created, you have created an active cloud.

After successfully creating a cloud and compute region, you can manage your cloud environment by launching the 
HP Cloud OS Administration Dashboard.

Note: Successfully creating a compute region automatically creates a default resource pool for that region, which is configured and visible 
in the Administration Dashboard. For details, see the [HP Cloud OS Administration Dashboard Help](/cloudos/manage/administration-dashboard/).

The following table describes the Compute Region dialog UI elements:

( table - coming soon )  



	
### Extend Compute Region Dialog

To access: Select the Cloud tab > Manage Clouds and then click **More** > **Extend Compute Region** for the corresponding cloud.

The Extend Compute Region dialog is used to add nodes to an existing compute region. 
The following table describes the Extend Compute Region dialog UI elements:

( table - coming soon ) 
  


### Reduce Compute Region Dialog

To access: Select the Cloud tab > Manage Clouds and then click **More** > **Reduce Compute Region** for the corresponding cloud.

The Reduce Compute Region dialog is used to remove compute nodes from an existing compute region. 
When a node is successfully removed from a compute region, its previous context is lost, including its alias name and any HP Cloud OS software 
that had been previously installed on it. To use such a node again, re-set its alias and re-allocate it. Once in the Allocated state, 
the node can be associated with a cloud.

**Note:** You reset a node's alias in the Edit Node Dialog, and you re-allocate it in the Manage Nodes Page.

The following table describes the Reduce Compute Region dialog UI elements:

( table - coming soon ) 
  




### Remove Compute Region Dialog

To access: Select the Cloud tab > Manage Clouds and then click **More** > **Remove Compute Region** for the corresponding cloud.

The Remove Compute Region dialog is used to remove an existing compute region. This action sets the compute controller and compute 
nodes that comprise the compute region to the Not Allocated state. In the Not Allocated state, the previous context of such nodes is lost, 
including their alias names and any Cloud OS software that had been previously installed on them. To use such nodes again, reset 
their aliases and reallocate them. Once in the Allocated state, they can be associated with a cloud.

**Note:** If the compute controller is co-located with the cloud controller, the compute region cannot be removed.

**Note:** You reset a node's alias in the Edit Node Dialog, and re-allocate it in the Manage Nodes Page.

**Tip:** You can remove the last compute region from the cloud, in which case, it becomes a hybrid-only cloud. This is useful when provisioning 
should be done in a public cloud, such as HP Cloud.

The following table describes the Remove Compute Region dialog UI elements:
  
( table - coming soon ) 




### Remove Cloud Dialog

To access: Select the Cloud tab > Manage Clouds and then click **More** > **Remove Cloud** for the corresponding cloud.

The Remove Cloud dialog is used to remove an existing cloud. This action sets all cloud, network, storage, and compute controller nodes, 
and all compute nodes that comprise the cloud to the Not Allocated state. In the Not Allocated state, the previous context of the nodes is lost, 
including their alias names and any HP Cloud OS software that had been previously installed on them. To use such nodes again, reset their aliases 
and reallocate them. Once in the Allocated state, they can be associated with a cloud. 

Note: You reset a node's alias in the Edit Node Dialog, and re-allocate it in the Manage Nodes Page.

The following table describes the Remove Cloud dialog UI elements:

( table - coming soon ) 
  




### Manage Clouds Details Page

To access: Select the Cloud tab > Manage Clouds and click the cloud name link.

This page displays the values you used to create the cloud and compute regions.

The following table describes the Manage Clouds Details page UI elements:

( table - coming soon ) 
  



<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Hot Fixes

The following information provides details about the Hot Fixes panel.

**Concepts:**

* Hot Fixes Overview(#hot-fixes-overview) 

**UI Descriptions:**

* Hot Fixes Page(#hot-fixes-page)
    
* Package Details Page(#package-details-page)
    
* Import Package Dialog(#import-package-dialog) 


### Hot Fixes Overview

The hot fixes feature allows you to apply software hot fixes and updates to your HP Cloud OS environment after such hot fix or update files, 
having the .csu extension, have been downloaded to the local file system. In this help, such hot fixes and updates are referred to as content packages.

### Hot Fixes Page

To access: Select the Cloud tab > Hot Fixes.

The following table describes the Hot Fixes page UI elements:

( table - coming soon ) 




### Package Details Page

To access: Select the Cloud tab > Hot Fixes and click a Package Name link.

This page displays detailed information about a particular content package. The following sections describe the content package details page UI elements.

#### Overview Tab

The following table describes the UI elements on the Overview tab on the content package details page.

( table - coming soon ) 


#### Log Tab

Click the Log tab to select a log to view.


### Import Package Dialog

To access: Select the Cloud tab, > Hot Fixes, and then click the Import Package button on the Hot Fixes page.

The following table describes the Import Package dialog UI elements:

( table - coming soon ) 



<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Updates and Extensions

The following information provides details about the Updates and Extensions panel.

**Concepts::**

* [Updates and Extensions Overview](#updates-and-extensions-overview) 

**UI Descriptions:**

* [Updates and Extensions Page](#updates-and-extensions-page) 

* [Configure Dialog](#configure-dialog) 


### Updates and Extensions Overview

The updates and extensions feature allows you to connect to, list, and retrieve hot fixes and updates from the HP Cloud OS Distribution Network (CODN) 
and apply them to your HP Cloud OS environment. In this help, such hot fixes and updates are referred to as *content packages*.

### Updates and Extensions Page

To access: Select the Cloud tab > Updates and Extensions.

The following table describes the Updates and Extensions page UI elements:

( table - coming soon ) 



### Configure Dialog

To access: Select the Cloud tab > Updates and Extensions, and then the Configure button.

The following table describes the Configure dialog UI elements:

( table - coming soon) 



<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

