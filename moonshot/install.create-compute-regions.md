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

Once the Cloud setup is complete, the Cloud displays in an active state. You can now create one or more regions in the cloud. 

There are multiple use cases where you would prefer to have separate compute regions, such as:

* To accommodate a heterogeneous set of hardware configured for different workloads.

* To distribute the workload across regions to get better response times. Each region can contain dedicated endpoints with a full Nova installation including its own message queue and database.

To create a compute region:

<ol>

<li> In the Operational Dashboard, select the <b>Cloud</b> tab > <b>Manage Clouds</b>. </li> 

<li> For the cloud just created, click <b>Create Compute Region</b> to open the <b>Create Compute Region</b> dialog. </li> 

<li> Specify a Region Name. This will be the name that is used to initialize Keystone and will be displayed on the Administration Dashboard. A region name must contain only letters and numbers. It cannot contain spaces or special characters. </li> 

<li> From the Compute Controller drop down list, select the node that will have the Compute Controller services. The Compute Controller service can reside on a different node (recommended) or on the same Cloud Controller. </li> 

<li> In the Controllers and Compute Nodes Tab, do the following:

<ul>
<li> From the Compute Controller drop-down list, select the node that will have controller services.
<li> From the Number of Nodes drop-down list, select the nodes.
</ul>

<br /> <br /> Or click to select the checkbox against each node.
<br /> <br /> <b>Note:</b> The Cloud Controller and the Compute Controller can be in the same machine.

</li>

<li> In the Attributes tab, specify the property values required to create a cloud region.  From the <b>Compute Host Type</b> drop-down list, select <b>Moonshot Server</b>.  </li> 

<li> Click <b>Create Compute Region</b>.  </li> 

</ol>

The compute region will go through series of steps to create and will display the completion percentage. Once the Compute Region is created, the state will display as <b>Active</b>.

**Note:** This process takes apoproximately 10 minutes to complete.


## Next Step

Proceed to the next topic, [Enter or Update your License Key](/cloudos/moonshot/install/license/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

