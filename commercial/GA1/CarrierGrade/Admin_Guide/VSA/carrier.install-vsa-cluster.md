---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Creating a StoreVirtual Cluster and Adding it to a New Management Group"
permalink: /helion/openstack/carrier/install/vsa/cluster/
product: carrier-grade
product-version1: HP Helion OpenStack Carrier Grade
role1: Storage Administrator
role2: Storage Architect
authors: Michael B, Paul F 

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/helion/openstack/carrier/install/vsa/deploy/">&#9664; Deploying HP StoreVirtual VSA Storage Sytems </a> | <a href="/helion/openstack/carrier/install/vsa/add-mgmt/">Adding HP StoreVirtual VSA System to an Existing Management Group &#9654;</a>
</p> 

# Creating a StoreVirtual Cluster and Adding to a Management Group

After HP StoreVirtual Storage systems are deployed, you must create clusters and add the clusters to a management group. 

**Prerequisites**

Before starting, make sure the following tasks have been completed.

* CMC is already installed.
* HP StoreVirtual VSA (one or more) is deployed in the same management network where CMC is installed.

## Creating a cluster and management group

You can create a new management group where you can add a new cluster. 

To create a cluster, do the following:

1. Open CMC.

	By default, the CMC is configured to discover the StoreVirtual nodes in the subnet in which it is installed. You can manually add the nodes also.

	<a href="javascript:window.open('/content/documentation/media/storevirtual-cmc1.png','_self','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><img src="media/storevirtual-cmc1.png" width="500" /></a>
<br>	Click to view larger image; click **Back** to return.

2. In the CMC UI, click **Find** and then click **Find Systems** from the left panel.<br /> Find Systems dialogue box is displayed.<br />

	<a href="javascript:window.open('/content/documentation/media/storevirtual-cmc2.png','_self','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><img src="media/storevirtual-cmc2.png" width="500" /></a>
<br>	Click to view larger image; click **Back** to return.

3. You can choose **Add** or **Find** option to search the system. <br />Find option  starts searching for the nodes in the same subnet as that of CMC. Add option displays an **Enter IP** pop-up box to enter the IP of the StoreVirtual system.

	**Note:**To get the details of the HP StoreVirtual VSA IP, log in to StoreVirtual system and check `/mnt/state/vsa/vsa_network_config.json` file and select the second option, which is listed under "vsa network".

	<a href="javascript:window.open('/content/documentation/media/storevirtual-cmc3.png','_self','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><img src="media/storevirtual-cmc3.png" width="500" /></a>
<br>	Click to view larger image; click **Back** to return.

	<a href="javascript:window.open('/content/documentation/media/storevirtual-cmc4.png','_self','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><img src="media/storevirtual-cmc4.png" width="500" /></a>
<br>	Click to view larger image; click **Back** to return.

4. Click **OK** to proceed, or click **Cancel** to cancel the process.<br />The node is discovered and the details are displayed in a tabular format in the Find Systems dialogue box.

5. (Optional) Click **Add** in the Find Systems dialogue box to add more nodes. 

6. (Optional) Click **Edit** in the Find Systems dialogue box to modify the details of the selected node.

7. (Optional) Click **Remove** in the Find Systems box to delete a node.

8. Click **Close** to return to the Home page.<br /> The discovered nodes are displayed under **Available Systems** option in the left panel.

	<a href="javascript:window.open('/content/documentation/media/storevirtual-cmc5.png','_self','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><img src="media/storevirtual-cmc5.png" width="500" /></a>
<br>	Click to view larger image; click **Back** to return.

9.  To add the node to a management group, right-click the node to display a menu and select **Add to a New Management Group**.<br /> Management Groups, Clusters, And Volumes wizard is displayed.

	<a href="javascript:window.open('/content/documentation/media/storevirtual-cmc6.png','_self','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><img src="media/storevirtual-cmc6.png" width="500" /></a>
<br>	Click to view larger image; click **Back** to return.

10.  In the **Management Group Name** box, enter a name for the management group and click **Next** to display the Add Administrative User page.

11.  Enter the required information for the Administrative user and click **Next** to display the Management Group Time page.

12.  Synchronize the time manually or using an NTP server and click **Next** to display the Domain Name Server Configuration page.

13. Define  DNS details and click **Next** to display the Email Notification Setup page and define SMTP details.

    **Note**: It is optional to enter the details in the above step.

14. Click **Next** to display a Wizard in the Create a Cluster page. 

15. Select the cluster type as *Standard Cluster* from the displayed options and click **Next**.

16. In the **Cluster Name** box, enter the name of the cluster and click **Next**.

17. In the Add VIP and Subnet Mask pop-up box, enter the virtual IP and Subnet Mask of the cluster in the respective boxes and click **OK**.<br /> The details are displayed in a tabular format in the page.


	**Note**: Ensure that the Virtual IP (VIP) is unique and is in the same subnet as the HP StoreVirtual VSA system. 


18. Click **Next** to go to the next page.

17. (Optional) Click the checkbox displayed against **Skip Volume Creation**.

18. Click **Next**.<br />The Management Group and Cluster is created and displays in the Home page of CMC.

	<a href="javascript:window.open('/content/documentation/media/storevirtual-cmc7.png','_self','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><img src="media/storevirtual-cmc7.png" width="500" /></a>
<br>	Click to view larger image; click **Back** to return.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>



## Adding HP StoreVirtual VSA System to an existing Management Group {#adding-a-node}

To add a StoreVirtual system to any existing Management Group, do the following:

1. Open CMC.

	By default, the CMC is configured to discover the HP StoreVirtual VSA systems in the subnet on which it is installed. You can manually add the nodes also.

2. In the CMC page, click **Find Systems** from the left panel. Find Systems dialogue box is displayed with an Enter IP pop-up box.

3. You can choose **Add** or **Find** option to search the system. <br />Find option  starts searching for the nodes in the subnet. Add option displays an **Enter IP** pop-up box to enter the IP of the StoreVirtual node.<br />

4. Click **OK** to proceed or click **Cancel** to cancel the process.<br />The node is discovered and the details are displayed in a tabular format in the Find Systems dialogue box.

5. (Optional) Click **Add** in the Find Systems dialogue box to add more nodes. 

6. (Optional) Click **Edit** in the Find Systems dialogue box to modify the details of the selected node.

7. (Optional) Click **Remove** in the Find Systems box to delete a node.

8. Click **Close** to return to the Home page.<br /> The discovered nodes are displayed under **Available Systems** option in the left panel.

9.  Right-click the node to display a menu and select **Add to an Existing Management Group**.

10. Enter the name of the management group.

11. Click **Add** to add the node to the group that you specified.<br /> The node is added to the management group.

## Next Step {#next-steps}

[Adding HP StoreVirtual VSA System to an Existing Management Group]("/helion/openstack/carrier/install/vsa/add-mgmt/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----

