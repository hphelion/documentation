---
layout: default
title: "HP Helion OpenStack&#174; Edition: Manage Storage"
permalink: /helion/openstack/ga/undercloud/oc/config/storevirtual/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!---<p style="font-size: small;"> <a href="/helion/openstack/install-beta/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/esx/">NEXT &#9654;</a> </p>-->


# Working StoreVirtual Backends

This option allows you to do the following:

* [Add Backend](#add-backend)

* [Expand Backend](#expand-backend)

* [Shrink Backend](#shrink-backend) 

* [Delete Backend](#delete-backend)

* [Generate Config](#generate-config)

* [Update Overcloud](#update-overcloud) 


### Add Backends ###{#add-backend}

1. In the Configure Cloud page, click **StoreVitual** Tab to activate it.

2. Click **Add Backend** displayed at the top to open the StoreVirtual Volume Backend page.

3. In the **Volume Backend Name** box, enter the name for the backend.

4. From the **Available StoreVirtual Cluster Choices** box, select the cluster(s).

5. Click &rarr; to move the cluster to the **Selected StoreVirtual Cluster Choices** box. 

5.  (Optional) Click **Choose All** displayed below the **Available StoreVirtual Cluster Choices** box to select all the clusters . 

7. (Optional) Click **Remove All** displayed below the **Selected StoreVirtual Cluster Choices** box or select the cluster(s) and click &larr;to move the cluster(s) back to **Available StoreServ Choices** box. 

8. Click **Add**.<br>On successful addition of backend, the backend displays in the Backend Mapping table in the Configure Cloud page.</br>

### Expand Backend ###{#expand-backend}

Expand backend option allocates new clusters to an existing backend. You can select the required clusters from the list of registered clusters and add the same to a backend that has been already configured.

To expand a backend, do the following:

1. In the Configure Cloud page, click **StoreVirtual** Tab to activate it.<br> The page displays a list of backends.</br>

2. Click **Expand Backend** against the backend that you want to expand.<br> Expand StoreVirtual Volume Backend page is displayed.</br>

3. From the **Available StoreVirtual Cluster Choices** box, select the Cluster.

4.  Click &rarr; to move the cluster(s)to the **Selected StoreVirtual Cluster Choices** box.

5.  (Optional) Click **Choose All** displayed below the **Available StoreVirtual Cluster Choices** box to select and move all the clusters to the **Selected StoreVirtual Cluster Choices** box. 

7. (Optional) Click **Remove All** displayed below the **Selected StoreVirtual Cluster Choices** box or select the cluster(s) and click &larr;to move the clusters back to **Available StoreVirtual Cluster Choices** box. . 

8. Click **Update**.<br>On successful update, the number of clusters mapped to the backend is updated and displays in the Backend Mapping table in the Configure Cloud page.</br>


### Shrink Backend ###{#shrink-backend}

This option allows you to remove the clusters from the backend which are allocated to your cloud. To reduce the backend, do the following:

1. In the Configure Cloud page, click **StoreVirtual** Tab to activate it.<br> The page displays a list of backends.</br>

2. Click **More** drop-down list against the Volume Backend for which you want to reduce the cluster(s) and select **Shrink Backend**.<br> Configure StoreVirtual Backend page is displayed.

3.  From the **Existing StoreVirtual Clusters** box, select the cluster(s).

4.  Click &rarr; to move the cluster(s)to the **Removed StoreVirtual Clusters** box.

4. (Optional) Click **Remove All** displayed below the **Existing StoreVirtual Cluster(s)** box to move all the cluster(s) to **Removed StoreVirtual Clusters** box.


5. (Optional) Click **Select All** displayed below the **Removed StoreVirtual Clusters** box or select the cluster(s) and click &larr;to move the cluster(s) back to **Existing StoreVirtual Clusters** box.

6. Click **Update**.<br>On successful update, the number of clusters mapped to the backend is updated and displays in the Backend Mapping table in the Configure Cloud page.</br>

###Delete backend## {#delete-backend}

**Note**: Before you delete a backend cluster,  detach the volumes or migrate as appropriate as the volumes from this cluster backend will no longer be available once it is deleted.

Use this option to delete a backend. Do the following:

1. In the Configure Cloud page, click **StoreVirtual** Tab to activate it.<br> The page displays a list of backends.</br>

2. Click **More** drop-down list against the Volume Backend which you want to delete and select **Delete Volume Backend**.<br> A confirmation dialog box is displayed.

3. Click **Delete Volume Backend** to delete or **Cancel** to cancel the process.


### Generate Config ###{#generate-config}
You can download the Cinder configuration relevant to HP StoreVirtual for your cloud once  you have created the backend.

To generate configuration file, do the following:

1. In the Configure Cloud page, click **StoreVirtual** Tab to activate it.<br> The page displays a list of backends.</br>

2. Click **Generate Config** displayed at the top of the page to display Download StoreVirtual Config page.<br> The config file downloads automatically. 

3. (Optional) Click Download StoreVirtual Config link to download the file if the file does not download automatically.<br> A dialog box is displayed.</br>

4. Click **OK** to download and save the file.<br>Once you download the config file, you can proceed to update the Overcloud configuration.


### Update Overcloud ###{#update-overcloud}

To update your overcloud with the changes, do the following:

1. SSH to seed as root.

		ssh root@ <IP address> 

2. View the list of files.

		ls

3. Copy overcloud template config file to `/root/overcloud-config.json` if `/root/overcloud-config.json` is absent.
  
	    cp /root/tripleo/tripleo-incubator/scripts/ee-config.json /root/overcloud-config.json

4. Edit and update the /root/overcloud-config.json and add the JSON snippet(obtained from [Generate Config](#generate-config). Refer to the example below.<**TO ADD THE SAMPLE FILE**> Ensure the JSON file format is intact.

5. Apply the configuration.

        source /root/tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh /root/overcloud-config.json

6. Launch install script to update the Overcloud.

	    /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --skip-install-seed --skip-install-undercloud


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
