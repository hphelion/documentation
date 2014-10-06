---
layout: default
title: "HP Helion OpenStack&#174; Edition: Manage Storage"
permalink: /helion/openstack/ga/undercloud/oc/config/storeserv/
product: commercial.ga

---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!---
<p style="font-size: small;"> <a href="/helion/openstack/install-beta/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/esx/">NEXT &#9654;</a> </p> -->


# Working with StoreServ Backends

Once you register the StoreServ systems as per your requirements, you can use the Overcloud option in the Undercloud Horizon Dashboard for the following tasks:

* [Add Backend](#add-backend)

* [Expand Backend](#expand-backend)

* [Shrink Backend](#shrink-backend) 

* [Delete Backend](#delete-backend)

* [Generate Configuration](#generate-config)

* [Update Overcloud](#update-overcloud) 

* [Next Steps](#next-steps) 

### Add backend<a name="add-backend"></a>

**Note**: Ensure that you allocate only those CPGs that will be used by this cloud. Changing any attributes of the CPG after allocation, may disrupt cloud functionality if the corresponding change is not updated in Sirius.

1. In the Configure Cloud page, click **StoreServ Backends** Tab to activate it.

	<a href="javascript:window.open('/content/documentation/media/undercloud-storeserv-add-backend.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Configure Cloud StoreServ Option (opens in a new window)</a>

2. Click **Add Backend** displayed at the top to open the StoreServ Volume Backend page.

	<a href="javascript:window.open('/content/documentation/media/undercloud-storeserv-add-backendoption.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">StoreServ Volume Backend Page (opens in a new window)</a>

3. In the **Volume Backend Name** box, enter the name for the backend.

4. From the **Available StoreServ CPG Choices** box, select the CPG(s).

5. Click &rarr; to move the CPG(s)to the **Selected StoreServ Choices** box. 

5.  (Optional) Click **Choose All** displayed below the **Available StoreServ CPG Choices** box to select all the CPGs . 

7. (Optional) Click **Remove All** displayed below the **Selected StoreServ Choices** box or select the CPG(s) and click &larr;to move the CPGs back to **Available StoreServ Choices** box. 

8. Click **Add**.<br>On successful addition of backend, the backend displays in the Backend Mapping table in the Configure Cloud page. 

	<a href="javascript:window.open('/content/documentation/media/undercloud-storeserv-add-backendoption1.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Backend Mapping Page (opens in a new window)</a>

	The status of the selected CPG is displayed as *Reserved* in the StoreServ page under the **Resources** Tab.</br>

  	<a href="javascript:window.open('/content/documentation/media/undercloud-storeserv-add-backendoption2.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Common Provisioning Groups Page with the Reserved CPG (opens in a new window)</a>


### Expand backend<a name="expand-backend"></a>

Expand backend option allocates new CPGs to an existing backend. You can select the required CPG(s) from the list of registered CPGs and add them to a backend that has been already configured.

To expand a backend, do the following:

1. In the Configure Cloud page, click **StoreServ Backends** Tab to activate it.<br> The page displays a list of backends.</br>

	<a href="javascript:window.open('/content/documentation/media/undercloud-storeserv-expand-backend.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Expand Backend Option (opens in a new window)</a>

2. Click **Expand Backend** against the backend that you want to expand.<br> Expand StoreServ Volume Backend page is displayed.</br>

	<a href="javascript:window.open('/content/documentation/media/undercloud-storeserv-expand-backend1.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Expand StoreServ Volume Backend Page (opens in a new window)</a>


3. From the **Available StoreServ CPG Choices** box, select the CPG.

4.  Click &rarr; to move the CPG(s)to the **Selected StoreServ Choices** box.

5.  (Optional) Click **Choose All** displayed below the **Available StoreServ CPG Choices** box to select and move all the CPGs to the **Selected StoreServ Choices** box. 

7. (Optional) Click **Remove All** displayed below the **Selected StoreServ Choices** box or select the CPG(s) and click &larr;to move the CPGs back to **Available StoreServ Choices** box.

8. Click **Update**.<br>On successful update, the number of CPGs mapped to the backend is updated and displays in the Backend Mapping table in the Configure Cloud page.</br>

	<a href="javascript:window.open('/content/documentation/media/undercloud-storeserv-expand-backend2.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Expanded Backend in the Backend Mapping Table(opens in a new window)</a>


### Shrink backend<a name="shrink-backend"></a>

This option allows you to remove the CPGs from the backend which are allocated to your cloud. To shrink the backend, do the following:

1. In the Configure Cloud page, click **StoreServ Backends** Tab to activate it.<br> The page displays a list of backends.</br>

	<a href="javascript:window.open('/content/documentation/media/undercloud-storeserv-shrink-backend.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Shrink Backend Option(opens in a new window)</a>

2. Click **More** drop-down list against the Volume Backend for which you want to reduce the CPGs and select **Shrink Backend**.<br> Configure StoreServ Backend page is displayed.

3.  From the **Existing StoreServ CPGs** box, select the CPG.

4.  Click &rarr; to move the CPG(s)to the **Removed StoreServ CPGs** box.

4. (Optional) Click **Remove All** displayed below the **Existing StoreServ CPGs** box to move all the CPGs to **Removed StoreServ CPGs** box.


5. (Optional) Click **Select All** displayed below the **Removed StoreServ CPGs** box or select the CPG(s) and click &larr;to move the CPGs back to **Existing StoreServ CPGs** box.

6. Click **Update**.

	<a href="javascript:window.open('/content/documentation/media/undercloud-storeserv-shrink-backend1.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Shrink Backend Option(opens in a new window)</a>
	
	<br>On successful update, the number of CPGs mapped to the backend is updated and displays in the Backend Mapping table in the Configure Cloud page.</br>

	<a href="javascript:window.open('/content/documentation/media/undercloud-storeserv-shrink-backend2.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Backend Mapping Table with Reduced Number of Backends(opens in a new window)</a>

###Delete backend<a name="delete-backend"></a>

Before you delete the backend CPG, detach the volumes from this CPG as the backend you delete will no longer be available. 

Do the following to delete a backend:

1. In the Configure Cloud page, click **StoreServ Backends** Tab to activate it.<br> The page displays a list of backends.</br>

2. Click **More** drop-down list against the volume backend which you want to delete and select **Delete volume backend**.<br> A confirmation dialog box is displayed.

3. Click **Delete volume backend** to delete or **Cancel** to cancel the process. 


### Generate configuration<a name="generate-config"></a>
You can download the Cinder configuration relevant to HP 3PAR StoreServ for your cloud once you create the backend.

To generate configuration file, do the following:

1. In the Configure Cloud page, click **StoreServ Backends** Tab to activate it.<br> The page displays a list of backends.</br>

	<a href="javascript:window.open('/content/documentation/media/undercloud-storeserv-generate-config.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Generate Configuration Page (opens in a new window)</a>

2. Select the backend for which you want to generate the configuration file.

3. Click **Generate Config** displayed at the top of the page to display Download Storeserv Config page.<br> The configuration file downloads automatically. 

4. (Optional) Click Download StoreServ Config link to download the file if the file does not automatically download .<br> A dialog box is displayed.</br>

5. Click **OK** to download and save the file. <br>Once you download the configuration file, you can proceed to update the Overcloud configuration.</br>


### Update Overcloud<a name="update-overcloud"></a>

To update your Overcloud with the changes, do the following:

1. SSH to Seed as root from KVM host.

		# ssh root@<IP address> 

2. View the list of files.

		# ls

3. Copy Overcloud template configuration file to `/root/overcloud-config.json` if `/root/overcloud-config.json` is absent.
  
	 	# cp /root/tripleo/tripleo-incubator/scripts/ee-config.json /root/overcloud-config.json

4. Edit and update the /root/overcloud-config.json and add the JSON snippet(obtained from [Generate Config](#generate-config)). Ensure the JSON file format is unbroken. A sample of the file is given below:

		},
		  "3par": {
		    "DEFAULT": {
		      "enabled_backends": [
		        "CPG_db8b945c-b4f1-464d-9790-554d9b8c321e",
		        "CPG_f3740765-119f-4d0d-9bc5-c254cd0209f4",
		        "CPG_9531635c-d5a1-47d7-91e2-1e2a56b3d094",
		        "CPG_b86f8f87-d546-40b6-9ac5-3fa5169958dd"
		      ]
		    },
		    "CPG_db8b945c-b4f1-464d-9790-554d9b8c321e": {
		      "san_password": "3pardata",
		      "hp3par_username": "3paradm",
		      "volume_backend_name": "3par_backend",
		      "san_login": "3paradm",
		      "hp3par_api_url": "https://15.214.241.21:8080/api/v1",
		      "volume_driver": "cinder.volume.drivers.san.hp.hp_3par_iscsi.HP3PARISCSIDriver",
		      "hp3par_password": "3pardata",
		      "hp3par_cpg": "FC_r1",
		      "hp3par_iscsi_chap_enabled": "true",
		      "san_ip": "15.214.241.21",
		      "iscsi_ip_address": "10.1.0.200"
		    },
		    "CPG_f3740765-119f-4d0d-9bc5-c254cd0209f4": {
		      "san_password": "3pardata",
		      "hp3par_username": "3paradm",
		      "volume_backend_name": "3par_backend",
		      "san_login": "3paradm",
		      "hp3par_api_url": "https://15.214.241.21:8080/api/v1",
		      "volume_driver": "cinder.volume.drivers.san.hp.hp_3par_iscsi.HP3PARISCSIDriver",
		      "hp3par_password": "3pardata",
		      "hp3par_cpg": "FC_r61",
		      "hp3par_iscsi_chap_enabled": "true",
		      "san_ip": "15.214.241.21",
		      "iscsi_ip_address": "10.1.0.200"
		    },
		    
5. Apply the configuration.

     	# source /root/tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh /root/overcloud-config.json

6. Source the environment variables from the Environment Variables file created during initial installation.<!--- based on your configuration and the details of the StoreVirtual scale specified in the `/root/overcloud-config.json`-->


		# source /root/env_vars


7. Launch install script to update the Overcloud.

		# bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --update-overcloud |& tee update-bv1.log

## Next Steps{next-steps}

To use the newly added Cinder backend, create volume type and associate it with this backend using Overcloud Horizon or Cinder CLI. 



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
