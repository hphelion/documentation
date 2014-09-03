---
layout: default
title: "HP Helion OpenStack&#174; Edition: Manage Storage"
permalink: /helion/openstack/ga/undercloud/oc/config/
product: commercial

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/helion/openstack/install-beta/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/esx/">NEXT &#9654;</a> </p>


# Manage Overcloud Configuration

The Overcloud option  allows you to define the configurations for your Overcloud.You can define the configuration for ESX Clusters, StoreVirtual 
backends and StoreServs backends.

To define the configuration, do the following:

1. Log into the Undercloud Horizon Dashboard.

2. From the left panel, click **Overcloud** Tab and then **Configure** to display the Configure Cloud page.<br>The page displays with three tabs- **ESX Clusters**, **StoreVirtual Backends** and **StoreServ Backends**. By default,<---> is the active tab.



## ESX Clusters ##

## StoreVirtual Backends



## StoreServ backends ##

This option allows you to do the following:

* [Add Backend](#add-backend)

* [Expand Backend](#expand-backend)

* [Generate Config](#generate-config)

* [Shrink Backend](#shrink-backend) 

* [Delete Backend](#delete-backend)

### Add backends ###{#add-backend}

1. In the Configure Cloud page, click **StoreServs** Tab to activate it.

2. Click **Add Backend** displayed at the top to open the StoreServ Volume Backend page.

3. In the **Volume Backend Name** box, enter the name for the backend.

4. From the **Available StoreServ CPG Choices** box, select the CPG(s).

5. Click &rarr; to move the CPG(s)to the **Selected StoreServ Choices** box. 

5.  (Optional) Click **Choose All** displayed below the **Available StoreServ CPG Choices** box to select all the CPGs . 

7. (Optional) Click **Remove All** displayed below the **Selected StoreServ Choices** box or select the CPG(s) and click &larr;to move the CPGs back to **Available StoreServ Choices** box. 

8. Click **Add**.<br>On successful addition of backend, the backend displays in the Backend Mapping table in the Configure Cloud page. The status of the selected CPG is displayed as *Reserved* in the StoreServ page under the **Resources** Tab.</br>

### Expand backend ###{#expand-backend}

Expand backend is allocating new CPGs to an existing backend. You can select the required CPG(s) from the list of registered CPGs and add the same to a backend that has already been already configured.

To expand a backend, do the following:

1. In the Configure Cloud page, click **StoreServs** Tab to activate it.<br> The page displays a list of backends.</br>

2. Click **Expand Backend** against the backend that you want to expand.<br> Expand StoreServ Volume Backend page is displayed.</br>

3. From the **Available StoreServ CPG Choices** box, select the CPG.

4.  Click &rarr; to move the CPG(s)to the **Selected StoreServ Choices** box.

5.  (Optional) Click **Choose All** displayed below the **Available StoreServ CPG Choices** box to select and move all the CPGs to the **Selected StoreServ Choices** box. 

7. (Optional) Click **Remove All** displayed below the **Selected StoreServ Choices** box or select the CPG(s) and click &larr;to move the CPGs back to **Available StoreServ Choices** box. . 

8. Click **Update**.<br>On successful update, the number of CPGs mapped to the backend is updated and displays in the Backend Mapping table in the Configure Cloud page.</br>


### Generate config ###{#generate-config}
You can download the Cinder configuration relevant to HP 3PAR for your cloud once  you have created the backend.

To generate configuration file, do the following:

1. In the Configure Cloud page, click **StoreServs** Tab to activate it.<br> The page displays a list of backends.</br>

2. Click **Generate Config** displayed at the top of the page to display Download Storeserv Config page.<br> The config file downloads automatically. 

3. (Optional) Click Download StoreServ Config link to download the file if the file does not download automatically.<br> A dialog box is displayed.</br>

4. Click **OK** to download and save the file.

### Shrink backend ###{#shrink-backend}

This option allows you to remove the CPGS from the backend which are allocated to your cloud. To reduce the backend, do the following:

1. In the Configure Cloud page, click **StoreServs** Tab to activate it.<br> The page displays a list of backends.</br>

2. Click **More** drop-down list against the Volume Backend for which you want to reduce the CPGs and select **Shrink Backend**.<br> Configure StoreServ Backend page is displayed.

3.  From the **Existing StoreServ CPGs** box, select the CPG.

4.  Click &rarr; to move the CPG(s)to the **Removed StoreServ CPGs** box.

4. (Optional) Click **Remove All** displayed below the **Existing StoreServ CPGs** box to move all the CPGs to **Removed StoreServ CPGs** box.


5. (Optional) Click **Select All** displayed below the **Removed StoreServ CPGs** box or select the CPG(s) and click &larr;to move the CPGs back to **Existing StoreServ CPGs** box.

6. Click **Update**.<br>On successful update, the number of CPGs mapped to the backend is updated and displays in the Backend Mapping table in the Configure Cloud page.</br>

###Delete backend##

Use this option to delete a backend. Do the following:

1. In the Configure Cloud page, click **StoreServs** Tab to activate it.<br> The page displays a list of backends.</br>

2. Click **More** drop-down list against the Volume Backend which you want to delete and select **Delete Volume Backend**.<br> A confirmation dialog box is displayed.

3. Click **Delete Volume Backend** to delete or **Cancel** to cancel the process. 


### Update Overcloud ###

To update your overcloud with the changes, do the following:

1. SSH to seed as root

		ssh root@ <IP address> 

2. View the list of files

		ls

3. Copy overcloud template config file to `/root/overcloud-config.json` if `/root/overcloud-config.json` is absent.
  
	cp /root/tripleo/tripleo-incubator/scripts/ee-config.json /root/overcloud-config.json

4. Edit and update the /root/overcloud-config.json and add the JSON snippet(obtained from [Generate Config](#generate-config). Refer to the example below. Ensure the JSON file format is intact.

5. Apply the configuration

        source /root/tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh /root/overcloud-config.json

6. Launch install script to update the Overcloud

	    /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --skip-install-seed --skip-install-undercloud

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
