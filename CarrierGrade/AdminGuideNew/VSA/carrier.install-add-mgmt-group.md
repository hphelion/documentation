---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Adding HP StoreVirtual VSA System to an Existing Management Group"
permalink: /helion/openstack/carrier/install/vsa/add-mgmt/
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


<p style="font-size: small;"> <a href="/helion/openstack/carrier/install/vsa/cluster/">&#9664; Creating a StoreVirtual Cluster and Adding it to a New Management Group </a>| <a href="/helion/openstack/carrier/undercloud/storage/storevirtual/">Working with HP StoreVirtual VSA &#9654;</a>
</p> 



# HP Helion OpenStack&#174; Carrier Grade (Beta): Adding HP StoreVirtual VSA System to an Existing Management Group

To add a StoreVirtual system to any existing Management Group, do the following:

1. Open CMC.

	By default, the CMC is configured to discover the HP StoreVirtual VSA systems in the subnet on which it is installed. You can manually add the nodes also.

2. In the CMC page, click **Find Systems** from the left panel.<br /> Find Systems dialogue box is displayed with an Enter IP pop-up box.

3. You can choose **Add** or **Find** option to search the system. <br />Find option  starts searching for the nodes in the subnet. Add option displays an **Enter IP** pop-up box to enter the IP of the StoreVirtual node.<br />

4. Click **OK** to proceed or click **Cancel** to cancel the process.<br />The node is discovered and the details are displayed in a tabular format in the Find Systems dialogue box.

5. (Optional) Click **Add** in the Find Systems dialogue box to add more nodes. 

6. (Optional) Click **Edit** in the Find Systems dialogue box to modify the details of the selected node.

7. (Optional) Click **Remove** in the Find Systems box to delete a node.

8. Click **Close** to return to the Home page.<br /> The discovered nodes are displayed under **Available Systems** option in the left panel.

9.  Right-click the node to display a menu and select **Add to an Existing Management Group**.

10. Enter the name of the management group.

11. Click **Add** to add the node to the group that you specified.<br /> The node is added to the management group.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Next Step

[Working with HP StoreVirtual VSA](/helion/openstack/1.1/undercloud/storage/storevirtual/)

----

