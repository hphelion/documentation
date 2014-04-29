---
layout: default
title: "HP Cloud OS for Moonshot: Administration Dashboard"
permalink: /cloudos/moonshot/manage/administration-dashboard/running-topologies/
product: moonshot

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage">&#9650; UP</a> | NEXT &#9654;</p>

# Manage Running Topologies #

Topology is an infrastructure blue print defining compute, network and storage requirement.. Once the Infrastructure Topology and Infrastructure Design are created, the topology is ready to be launched.
The following tasks can be performed using Running Topologies option in the left panel:

Topology is the visual representation of networking resources. Once the Infrastructure Topology and Infrastructure Design are created, the topology is ready to be launched.

The following tasks can be performed using Running Topologies option in the left panel:

* <a href="#View Topology List">View Topology List</a>

* <a href="#Launch Topology">Launch Topology</a>

* <a href="#Terminate Topology">Terminate Topology</a>

* <a href="#Delete Topology">Delete Topology</a>

## View Topology List ##<a name="View Topology List"></a>

To view the existing topologies, do the following:

1.	Click the **Project** Tab to select it.</ab>The tab displays with options in the left panel.</br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the left panel, click **Provisioning** and then select Running Topologies to display the Running Topologies page with a list of existing topologies.<br>The page displays the topology name, state and time stamp.</br>

4. (Optional) Click Topology Name to open the topology details page.
The details page opens with three tabs: Overview, Job, and Content. By default, Overview is the active tab and displays the details of the topology.

5.	(Optional) Click **Job** Tab to activate it.
The details of all the jobs that were performed are displayed.

6.	(Optional) Click **Content** Tab to activate it.
The XML version of the document is displayed.

  * (Optional) Click **Export** to download the design document to your local system.

## Launch Topology ##<a name="Launch Topology"></a>

Use this option to launch the latest version of the topology document. 

Do the following:

1.	Click the **Project** Tab to select it.
The tab displays with options in the left panel.

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the left panel, click **Provisioning** and then select **Running Topologies** to display the Running Topologies page with a list of existing topologies.<br>The page displays the topology name, state and time stamp.</br>

4.	Click **Launch Topology** to display a launch dialog box.

## Terminate Topology ##<a name="Terminate Topology"></a>

When the topology is terminated, the Administration Dashboard stops the instance.

**Note**: Even if the terminated topologies are not running, they are still displayed in the list of topologies.

To terminate the topology, do the following:

1.	Click the **Project** Tab to select it.
The tab displays with options in the left panel.

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the left panel, click **Provisioning** and then select **Running Topologies** to display the Running Topologies page with a list of existing topologies.<br>The page displays the topology name, state and time stamp.</br>

4.	Click Terminate Topology.
The topology state changes to inactive.

##Delete Topology##<a name="Delete Topology"></a>

When a topology is deleted, the Administration Dashboard stops the instance and permanently removes it. This action cannot be undone.

To delete a running topology, do the following:

1.	Click the **Project** Tab to select it. 
The tab displays with options in the left panel.

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the left panel, click **Provisioning** and then select **Running Topologies** to display the Running Topologies page with a list of existing topologies. 

4.	Select the topology you want to delete and then click **Delete Topology**.
<br>A confirmation box is displayed. The topology is deleted after getting a confirmation from you.</br>


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


