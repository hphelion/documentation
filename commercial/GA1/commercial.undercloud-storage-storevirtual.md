---
layout: default
title: "HP Helion OpenStack&#174; Edition: Manage Storage"
permalink: /helion/openstack/ga/undercloud/storage/storevirtual/
product: commercial.ga


---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!---
<p style="font-size: small;"> <a href="/helion/openstack/install-beta/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/esx/">NEXT &#9654;</a> </p>-->


# Working with HP StoreVirtual 

The StoreVirtual option allows you to configure HP StoreVirtual as storage.You can configure your StoreVirtual by either using the Undercloud Horizon Dashboard or [Sirius client](/helion/openstack/ga/sirius/cli/workflow/). This page describes the different tasks that you can perform using the StoreVirtual option in the Undercloud Horizon.

<!---Configuration of HP StoreServ/3PAR as Cinder backend using Sirius service involves the following steps:-->

* [Before you begin](#before-you-begin)

* [Register a cluster](#register-cluster)

* [Edit a cluster](#edit-cluster)
	
* [Unregister a cluster](#unregister-cluster) 
    
* [Unregister multiple clusters](#unregister-multiple-clusters) 

* [View Configuration](#view-configuration)

* [Next Steps](#next-steps)


<!---Configuration of HP StoreServ/3PAR as Cinder backend using Sirius service involves the following steps:-->


## Before you begin {#before-you-begin}

Before you start working with StoreVirtual, ensure that the following prerequisites have been fulfilled:

1. HP Helion Cloud is deployed

2. HP StoreVirtual is deployed

3. HP StoreVirtual cluster is created and is accessible by Cinder and Compute nodes running in the Overcloud


## Register a cluster{#register-cluster}
	
You can register a cluster using the Undercloud Horizon Dashboard.When you register a cluster, it registers the cluster to the cloud inventory. The registered cluster can later be added as a backend to the Overcloud Cinder.

<!---You can register a cluster by either using the Undercloud Horizon Dashboard or Sirius client. (Refer [User manual for Sirius client](/helion/openstack/ga/sirius-cli/)).-->

To register the cluster using Undercloud Horizon Dashboard, do the following:

1. Log in to the Undercloud Horizon Dashboard.

2. From the left panel, click **Resources** Tab and then **Storage** to display the Overview page.

3. Select **StoreVirtual** option to activate it.<br> HP StoreVirtual page is displayed.</br>

	<a href="javascript:window.open('/content/documentation/media/undercloud-storevirtual-register.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP StoreVirtual Page (opens in a new window)</a>

4. Click **Register Cluster** displayed on the top right corner of the page to display Register Cluster dialog box.

	<a href="javascript:window.open('/content/documentation/media/undercloud-storevirtual-register-page.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Register Cluster Dialog Box (opens in a new window)</a>

5. In the dialog box, do the following:

   * In the **Cluster Name** box, enter the StoreVirtual cluster name.

		**Note**: The cluster name is case sensitive
   
   * In the **IP Address** box, enter the virtual IP address of the cluster.
   
   * In the **Subnet** box, enter the subnet of the StoreVirtual cluster.
   
   * In the **Username** box, enter the user name to access the cluster.
   
   * In the **Password** box, enter the password to access the cluster.
   
 	 <!--- * In the **Port** box, enter the port number for the SSH access or select the default value. The Port by default is *16022*.-->
   
6. Click **Done** to save the details. 

    On successful registration, the cluster is added and is listed as *Registered*.

	<a href="javascript:window.open('/content/documentation/media/undercloud-storevirtual-registered-cluster.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Registered Cluster Displays in the HP StoreVirtual Page (opens in a new window)</a>


## Edit a cluster {#edit-cluster}

**Note**: Ensure that you edit the StoreVirtual cluster only if there are any updates done <!--through the CMC or the CLIQ -->for the selected cluster. After editing the details, the backend data should also be updated so that cinder configuration file has the updated cluster information.

To edit a cluster, do the following:

1. Log in to the Undercloud Horizon Dashboard.

2. From the left panel, click **Resources** Tab and then **Storage** to display the Overview page.

3. Select **StoreVirtual** option to activate it.<br> HP StoreVirtual page is displayed.</br>

4. Click **Edit Cluster** to display the Edit StoreVirtual Cluster dialog box.
 
 	<a href="javascript:window.open('/content/documentation/media/undercloud-storevirtual-edit-cluster.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Edit Cluster Dialog Box (opens in a new window)</a>

5. Make the required changes.

6. Click **Done** to save the changes.   


## Unregister a cluster {#unregister-cluster}


**Note**: Before you unregister the cluster, remove the backend associated with it. Detach or migrate the volumes, as appropriate, as the volumes from this cluster backend will no longer be available.


Unregistering a cluster will remove it from the cloud inventory.

To unregister a cluster, do the following:

1. Log in to the Undercloud Horizon Dashboard.

2. From the left panel, click **Resources** Tab and then **Storage** to display the Overview page.

3. Select **StoreVirtual** option to activate it.<br> HP StoreVirtual page is displayed.</br>

4. Click **More** drop-down list against the cluster which you want to unregister and select **Unregister Cluster**.<br> A confirmation box is displayed.</br>

	<a href="javascript:window.open('/content/documentation/media/undercloud-storevirtual-more-options.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">More Option (opens in a new window)</a>

5. Click **Unregister cluster** to unregister or click **Cancel** to cancel the process. 


## Unregister multiple clusters {#unregister-multiple-storevirtual}

Use this option to unregister multiple clusters using a single command.

1. Log in to the Undercloud Horizon Dashboard.

2. From the left panel, click **Resources** Tab and then **Storage** to display the Overview page.

3. Select **StoreVirtual** option to activate it.<br> HP StoreVirtual page is displayed.</br>

4. Click the checkbox displayed against the **Name** column to select all the clusters. 

5. Click **Unregister Clusters** to unregister the clusters.<br>A confirmation box is displayed.</br>

5. Click **Unregister Cluster** to unregister or click **Cancel** to cancel the process. 

 
## View configuration{#view-configuration}

Use this option to view the cluster configuration as it displays in the *cinder.config* file.

1. Log in to the Undercloud Horizon Dashboard.

2. From the left panel, click **Resources** Tab and then **Storage** to display the Overview page.

3. Select **StoreVirtual** option to activate it.<br> HP StoreVirtual page is displayed.</br>

4. Click **More** drop-down list against the cluster for which you want to view the configuration.<br> The configuration is displayed in a dialog box.</br>


## Next Steps {#next-steps}

[Working with StoreVirtual Backends](/helion/openstack/ga/undercloud/storage/storevirtual/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
