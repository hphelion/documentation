---
layout: default
title: "HP Helion OpenStack: Working with ESX Clusters"
permalink: /helion/openstack/1.1/undercloud/oc/config/esx/
product: commercial.ga
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: Systems Administrator 
role2: Cloud Architect 
role3: Storage Administrator 
role4: Network Administrator 
role5: Service Developer 
role6: Cloud Administrator 
role7: Application Developer 
role8: Network Engineer 
authors: Paul F

---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!---
<p style="font-size: small;"> <a href="/helion/openstack/1.1/install-beta/prereqs/">&#9664; PREV</a> | <a href="/helion/openstack/1.1/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/1.1/install-beta/vsa/">NEXT &#9654;</a> </p> --->

## HP Helion OpenStack&#174;: Working with ESX Clusters
 
In the undercloud, you register your vCenter and import the clusters from the EON data of the registered vCenter. These resources are available in your cloud after registration and it can be allocated for the usage of cloud. 

You can perform the following activities in the Horizon undercloud dashboard.

* [Activate clusters](#activate-cluster)
* [Deactivate clusters](#deactivate-cluster)
* [Restore a proxy](#restore-proxy) 

 
##Activate clusters<a name="activate-cluster"></a>

Perform the following steps to activate clusters:

1. In the Horizon undercloud dashboard, click the **Resource** Tab in the left panel.<br> The tab displays an option in the left panel.

2. Click **Overcloud** and then select **Configure** to open Configured Cloud page. 

3. Click **Activate Clusters** on the top right corner of the page to configure the clusters for the cloud. The page navigates to Configure ESX Computes page.

4. Select the desired cluster(s) from the **Available vCenter Choices** box list. The selected cluster(s) is displayed in the **Selected vCenter Choices** box.

5. (Optional) Click **Choose All** displayed below the **Available vCenter Choices** box to select all the  displayed clusters.

6. Click  &rarr; to move the selected clusters in the **Selected vCenter Choices** box list. 

7. (Optional) Click **Remove All** displayed  below the **Selected vCenter Choices** box to remove all the listed clusters. <br>OR<br> Select the desired cluster(s) from the **Selected vCenter Choices** box list and click &larr; to move the selected cluster (s) in the **Available vCenter Choices** box.

5. Click **Configure**. After successful configuration of clusters a message is displayed. <br>The configured cluster(s) get listed in the in the **Activated Clusters** table.

##Deactivate clusters<a name="deactivate-cluster"></a>

1. In the Horizon undercloud dashboard, click the **Resource** Tab in the left panel.<br> The tab displays an option in the left panel.

2. Click **Overcloud** and then select **Configure** to open Configured Cloud page. 

3. Click **Deactivate Clusters** on the top right corner of the page to deactivate the clusters for the cloud. The page navigates to Deactivate ESX Clusters page.

4. Select the desired cluster(s) from the **Available vCenter Choices** box list. The selected cluster(s) is displayed in the **Selected vCenter Choices** box.

5. (Optional) Click **Choose All** displayed below the **Available vCenter Choices** box to select all the  displayed clusters.

6. Click  &rarr; to move the selected clusters in the **Selected vCenter Choices** box list. 

7. (Optional) Click **Remove All** displayed  below the **Selected vCenter Choices** box to remove all the listed clusters. <br>OR<br> Select the desired cluster(s) from the **Selected vCenter Choices** box list and click &larr; to move the selected cluster (s) in the **Available vCenter Choices** box.

5. Click **Deactivate**. After successful deactivation of clusters a message is displayed. 


##Restore a Proxy<a name="restore-proxy"></a>

You can restore failed or deleted compute proxies. Select a vCenter to restore its compute proxy. Ensure that you remove any existing compute proxy VM (if any) from the vCenter before proceeding.

1. In the Horizon undercloud dashboard, click the **Resource** Tab in the left panel.<br> The tab displays an option in the left panel.

2. Click **Overcloud** and then select **Configure** to open Configured Cloud page. 

3. Click **Restore Proxy** on the top right corner of the page to deactivate the clusters for the cloud. Restore Compute Proxy box is displayed.
4. Click **vCenter** drop-down list and select the vCenter. 
5.  Click Done.



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
