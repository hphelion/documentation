---
layout: default
title: "Create Compute Regions"
permalink: /cloudos/moonshot/install/create-compute-regions/
product: moonshot

---


<script> 

function PageRefresh { 
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/install/create-cloud/">&#9664; PREV</a> | <a href="/cloudos/moonshot/install/">&#9650; UP</a> | <a href="/cloudos/moonshot/install/license/">NEXT &#9654;</a> </p>

# Create Compute Regions

When the Create Cloud step is complete, the cloud's state displays Active. You can now create one or more compute regions. This is the last step in the process of creating a cloud.
When the compute region is created, you have created an active cloud.

The simplest cloud has one compute region with one Compute Controller that manages all the compute nodes. After creating an active cloud, you can go back and add more compute regions as your cloud
environment expands. Or, you can plan to include several compute regions in your cloud depending on your environment.

There are multiple use cases where you would prefer to have separate compute regions, such as:

* To accommodate a heterogeneous set of hardware configured for different workloads.

* To distribute the workload across regions to get better response times. Each region can contain
dedicated endpoints with a full Nova installation including its own message queue and database.

To create a compute region:

1. In the Operational Dashboard, select the <b>Cloud</b> tab > <b>Manage Clouds</b>.

2. For the cloud just created, click **Create Compute Region** to open the Create Compute Region dialog.

3. Specify a Region Name. This will be the Region name that is used to initialize Keystone and will be displayed on the Administration Dashboard. A region name must contain only letters and numbers. It cannot contain spaces or special characters.

4. From the Compute Controller drop down list, select the node that will have the Compute Controller services. The Compute Controller service can reside on a different node (recommended) or on the same Cloud Controller.

5. Specify which nodes will have the Compute Nodes service. Select the Compute Node(s) in one of the following ways:

 * Choose a number from the drop-down list to auto-select check boxes for you.
 * Individually select the check boxes of the node(s) you want.
 
> **Note:** You can have a single node act as both the Compute Controller and Compute Node. If you choose this configuration, make sure the underlying node has enough
CPU, Memory and Storage capacity to be able to run all the controller services as well as act as the virtualization host.

At this point, you can use the Attributes tab to specify property values required to create a Compute
Region. For the Hypervisor attribute, use `kvm` (the default) if the compute nodes are baremetal
nodes. Use `qemu` if the compute nodes are VMs.

When you're ready, now select **Create Compute Region**. The compute region will go through a series of steps to create an active cloud, showing the
percent (%) completed.

> **Note:** When creating a cloud or a compute region, all of the nodes involved are first checked to ensure they can be resolved on the network. This verification process can take (up to) approximately five minutes.  During this time, the progress percentage will remain at 1%. If any of the nodes fail to resolve during the verification process, the cloud or region creation will fail. 

Once the Create Compute Region step is complete, the name supplied for the region will be
displayed and the cloud's Status will be Active. This indicates that the cloud and compute region
have been successfully created.

You can now add additional compute regions using steps in the prior list. The added compute regions appear on the Manage Clouds page as a comma-separated list.

To see all the cloud and compute region(s) values you configured, click the cloud name to open the Manage Clouds Detail page.

* The created cloud details show the timestamp of the cloud creation, the nodes specified for the Cloud Controller, Network Controller, and Storage Controller.

* Each compute region is a tab with the region's name. Each region's tab shows the timestamp of that compute region creation, the nodes specified for the Compute Controller and Compute
Nodes, and the Hypervisor.

## Next Step

Proceed to the next topic, [Enter or Update your License Key](/cloudos/moonshot/install/license/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

