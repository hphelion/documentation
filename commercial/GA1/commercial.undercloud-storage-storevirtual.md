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

The StoreVirtual option allows you to configure HP StoreVirtual as storage. Before you start working with StoreVirtual, ensure that the following prerequisites have been fulfilled:

1. HP Helion Cloud is deployed

2. HP StoreVirtual is deployed

3. HP StoreVirtual cluster is created.

4. HP StoreVirtual cluster is accessible by Cinder and Compute nodes running in the Overcloud.


<!---Configuration of HP StoreServ/3PAR as Cinder backend using Sirius service involves the following steps:-->

You can do the following tasks using the StoreVirtual option:

* [Registering the cluster](#registering-cluster)

	* [Edit cluster](#edit-cluster)
	
    * [Unregister a cluster](#unregister-cluster) 
    
	* [Unregister multiple clusters](#unregister-multiple-clusters) 

	* [View Configuration](#view-configuration)

## Registering the cluster ##{#registering-cluster}

You can register a cluster using the Undercloud Horizon Dashboard.When you register a cluster, it registers the cluster to the cloud inventory. The registered cluster can later be added as a backend to the Overcloud Cinder.

<!---You can register a cluster by either using the Undercloud Horizon Dashboard or Sirius client. (Refer [User manual for Sirius client](/helion/openstack/ga/sirius-cli/)).-->

To register the cluster using Undercloud Horizon Dashboard, do the following:

1. Log into the Undercloud Horizon Dashboard.

2. From the left panel, click **Resources** Tab and then **Storage** to display the Overview page.

3. Select **StoreVirtual** option to activate it.<br> HP StoreVirtual page is displayed.</br>

4. Click **Register Cluster** displayed on the top right corner of the page to display Register Cluster dialog box.

5. In the dialog box, do the following:

   * In the **Cluster Name** box, enter the StoreVirtual cluster name.

		**Note**: The cluster name is case sensitive
   
   * In the **IP Address** box, enter the virtual IP address of the cluster.
   
   * In the **Subnet** box, enter the subnet of the StoreVirtual cluster.
   
   * In the **Username** box, enter the user name to access the cluster.
   
   * In the **Password** box, enter the password to access the cluster.
   
  <!--- * In the **Port** box, enter the port number for the SSH access or select the default value. The Port by default is *16022*.-->
   
   * Click **Done** to save the details. 

    On successful registration, the cluster is added and is listed as *Registered*.


### Edit a cluster ###{#edit-cluster}

**Note**: Ensure that you edit the StoreVirtual cluster only if there are any updates done <!--through the CMC or the CLIQ -->for the selected cluster. After editing the details, the backend data should also be updated so that cinder configuration file has the updated cluster information.

To edit a cluster, do the following:

1. Log into the Undercloud Horizon Dashboard.

2. From the left panel, click **Resources** Tab and then **Storage** to display the Overview page.

3. Select **StoreVirtual** option to activate it.<br> HP StoreVirtual page is displayed.</br>

4. Click **Edit Cluster** to display the Edit StoreVirtual Cluster dialog box. 

5. Make the required changes.

6. Click **Done** to save the changes.   


### Unregister a cluster ###{unregister-cluster}

**Note**: Before you unregister the cluster, remove the backend associated with it. Detach or migrate the volumes, as appropriate, as the volumes from this cluster backend will no longer be available.


Unregistering a cluster will remove it from the cloud inventory.

To unregister a cluster, do the following:

1. Log into the Undercloud Horizon Dashboard.

2. From the left panel, click **Resources** Tab and then **Storage** to display the Overview page.

3. Select **StoreVirtual** option to activate it.<br> HP StoreVirtual page is displayed.</br>

4. Click **More** drop-down list against the cluster which you want to unregister and select **Unregister Cluster**.<br> A confirmation box is displayed.</br>

5. Click **Unregister cluster** to unregister or click **Cancel** to cancel the process. 


### Unregister multiple clusters ###{unregister-multiple-storevirtual}

Use this option to unregister multiple clusters using a single command.

1. Log into the Undercloud Horizon Dashboard.

2. From the left panel, click **Resources** Tab and then **Storage** to display the Overview page.

3. Select **StoreVirtual** option to activate it.<br> HP StoreVirtual page is displayed.</br>

4. Click the checkbox displayed against the **Name** column to select all the clusters. 

5. Click **Unregister Clusters** to unregister the clusters.<br>A confirmation box is diplayed.</br>

5. Click **Unregister Cluster** to unregister or click **Cancel** to cancel the process. 

 
### View configuration ###

Use this option to view the cluster configuration as it displays in the cinder.config file.

Log into the Undercloud Horizon Dashboard.

2. From the left panel, click **Resources** Tab and then **Storage** to display the Overview page.

3. Select **StoreVirtual** option to activate it.<br> HP StoreVirtual page is displayed.</br>

4. Click **More** drop-down list against the cluster for which you want to view the configuration.<br> The configuration is displayed in a dialog box.</br>


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
