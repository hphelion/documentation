---
layout: default
title: "HP Helion OpenStack&#174; Edition: Manage Storage"
permalink: /helion/openstack/undercloud/storage/storeserv/
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


# Working with HP StoreServ (3PAR)

The StoreServ option allows you to configure 3PAR as storage. Before you start working with 3PAR, ensure that HP 3PAR is accessible from the Undercloud and you have all the required details to register the device. <!---the following prerequisites have been fulfilled:-->

1. HP Helion Cloud is deployed.

2. Sirius service is up and running in the Undercloud

3. HP StoreServ/3PAR device is accessible from Undercloud

4. HP StoreServ/3PAR device(running operating system v 3.1.3 or later) is accessible by Cinder and Compute nodes running in Overcloud

5. Common Provisioning Groups (CPGs) are created for HP StoreServ/3PAR
HP 3PAR web services API server must be enabled and running and HTTPS is enabled.


<!---Configuration of HP StoreServ/3PAR as Cinder backend using Sirius service involves the following steps:-->

You can do the following tasks using the StoreServ option:

* [Registering the 3PAR device](#registering-device)

	* [Edit StoreServ](#edit-storeserv)
	
    * [Unregister a StoreServ](#unregister-storeserv) 
    
	* [Unregister multiple StoreServs](#unregister-multiple-storeservs) 

* [Registering the required Common Provisioning Group(CPG)s](#registering-cpg)

## Registering the 3PAR device ##{#registering-device}

You can register 3PAR device to Sirius by either using the Undercloud Horizon Dashboard or Sirius REST client (Refer User manual for Sirius client <GIVE HYPERLINK>)

To register the device using Undercloud Horizon Dashboard, do the following:

1. Log into the Undercloud Horizon Dashboard.

2. From the left panel, click **Resources** Tab and then **Storage** to display the Overview page.

3. Select **StoreServ** option to activate it.<br> HP StoreServ page is displayed.</br>

4. Click Register StoreServ displayed on the top right corner of the page to display Register 3PAR StoreServ dialog box.

5. In the dialog box, do the following:

   * In the **Name** box, enter the name for the 3PAR array.
   
   * In the **IP Address** box, enter the IP address of 3PAR WS API Server.
   
   * In the **Username** box, enter the user name of the 3PAR super user.
   
   * In the **Password** box, enter the password of the 3PAR super user.
   
   * In the **Port** box, enter the Port for 3PAR WS API service.
   
   * In the **SAN IP** box, enter the IP address of SAN controller for SSH access to the array.
   
   * In the **SAN username** box, enter the user name of SAN controller for SSH access to the array.
   
   * In the **SAN Password** box, enter the Password of SAN controller for SSH access to the array.
   
   * From the **Device Type** drop-down list, select the device type. 
   
   * Click **Done** to save the details. 

    On successful registration, the 3PAR device is added and is listed as the registered Storeserv.


### Edit a StoreServ ###{#edit-storeserv}

To edit a StoreServ, do the following:

1. Log into the Undercloud Horizon Dashboard.

2. From the left panel, click **Resources** Tab and then **Storage** to display the Overview page.

3. Select **StoreServ** option to activate it.<br> HP StoreServ page is displayed.</br>

4. Click **Edit StoreServ**. 

5. Make the required changes.

6. Click **Done** to save the changes.   


### Unregister a StoreServ ###{unregister-storeserv}

Use this option to unregister a StoreServ.

1. Log into the Undercloud Horizon Dashboard.

2. From the left panel, click **Resources** Tab and then **Storage** to display the Overview page.

3. Select **StoreServ** option to activate it.<br> HP StoreServ page is displayed.</br>

4. Click **More** drop-down list against the StoreServ which you want to unregister and select **Unregister StoreServ**.<br> A confirmation box is diplayed.</br>

5. Click **Unregister StoreServ** to unregister or click **Cancel** to cancel the process. 


### Unregister multiple StoreServs ###{unregister-multiple-storeserv}

Use this option to unregister multiple StoreServs using a single command.

1. Log into the Undercloud Horizon Dashboard.

2. From the left panel, click **Resources** Tab and then **Storage** to display the Overview page.

3. Select **StoreServ** option to activate it.<br> HP StoreServ page is displayed.</br>

4. Click the checkbox on the left of the **Name** column to select all the StoreServs. 

5. Click **Unregister StoreServ** to unregister the StoreServs.<br>A confirmation box is diplayed.</br>

5. Click **Unregister StoreServ** to unregister or click **Cancel** to cancel the process. 

 
## Registering HP 3PAR Common Provisioning Groups (CPGs)##{#registering-cpg}

Once you have registered the 3PAR device, the next step is to choose the CPGs for your Cloud. CPG(Common Provisioning Group) is a fundamental unit which can be configured as Cinder backend. A single HP 3PAR may have many CPGs. You can choose and allocate them to the cloud as a per your requirement. <!---First register the CPG in Sirius and then configure the CPG as backend for Overcloud Cinder service. You can register a few CPGs and allocate them as and when required. Cinder config file is updated only during the allocation, the registeration of the CPG just updates the Sirius database.-->

**Note**: Ensure that you allocate only those CPGs which will be used by this cloud. Changing any attributes of CPG after allocating may disrupt cloud functionality if corresponding change is not updated here.

To register the CPGs, do the following:

1. Log into the Undercloud Horizon Dashboard.

2. From the left panel, click **Resources** Tab and then **Storage** to display the Overview page.

3. Select **StoreServ** option to activate it.<br> HP StoreServ page is displayed with the list of StoreServs.

4. Click **More** drop-down list against the StoreServ for which you want to register CPG and select **Register CPG**.<br> The Register CPG page is displayed with a list of CPGs that are present in the selected 3PAR array in the **Available CPG** box and list of already selected CPGs in the **Selected CPG** box.</br>

**OR**

   * Click the device name for which you want to register CPG. <br>The Common Provisioning Groups page is displayed with a list of CPGs.
    
    * Click **Register CPG**. <br>The Register CPG page is displayed with a list of CPGs that are present in the selected 3PAR array in the **Available CPG** box and list of already selected CPGs in the **Selected CPG** box.</br> 

5.Select the desired CPG(s) from **Available CPG** box list.

6.Click &rarr; to move the CPG(s)to the **Selected CPG(s)** box.<br> The CPG is displayed in the **Selected CPG(s)** box.

6.(Optional) Click **Choose All** displayed below the **Available CPG** box to select all the CPGs . 

7.(Optional)Click **Remove All** displayed below the **Selected CPG** box to move all the CPGs back to the **Available CPG(s)** or select the CPG(s) and click &larr; to move them back.

8.Click **Register** to register the CPG.

9.To check the status of CPG registration, in the HP StoreServ page, click the device name to display the Common Provisioning Groups page. The selected CPG displays as **registered**.    

### Edit CPG ###

To edit a CPG, do the following:

1. Log into the Undercloud Horizon Dashboard.

2. From the left panel, click **Resources** Tab and then **Storage** to display the Overview page.

3. Select **StoreServ** option to activate it.<br> HP StoreServ page is displayed with the list of StoreServs.

4. Click the device name for which you want to register CPG. <br>The Common Provisioning Groups page is displayed with a list of CPGs.

5. Click **Edit CPG** against the CPG that you want to edit.<br> The Update CPG Details dialog box is displayed.</br> 

6. Make the required changes.

7. Click **Done** to save the changes or click **Cancel** to cancel the process.  


### Unregister a CPG ###

This option allows you to unregister a CPG. To unregister, do the following:

1. Log into the Undercloud Horizon Dashboard.

2. From the left panel, click **Resources** Tab and then click **Storage** to display the Overview page.

3. Select **StoreServ** option to activate it.<br> HP StoreServ page is displayed.</br>

4. Click the device name for which you want to unregister CPG. <br>The Common Provisioning Groups page is displayed with a list of CPGs.<br> 

5. Click **More** drop-down list against the CPG which you want to unregister and select **Uregister CPG**.<br> A confirmation dialog box is dislayed.</br>

7. Click **Unregister StoreServ** to unregister or click **Cancel** to cancel the process. 

8. Click **Unregister CPG** to unregister or click **Cancel** to cancel the process.


### Unregister multiple CPGs ###

Use this option to unregister multiple CPGs using a single command.

1. Log into the Undercloud Horizon Dashboard.

2. From the left panel, click **Resources** Tab and then **Storage** to display the Overview page.

3. Select **StoreServ** option to activate it.<br> HP StoreServ page is displayed.</br>

4. Click the device name for which you want to unregister CPG. <br>The Common Provisioning Groups page is displayed with a list of CPGs.<br> 

5. Click the checkbox on the left of the **Name** column to select all the CPGs. 

5. Click **Unregister CPGS** to unregister the CPGs.<br>A confirmation box is diplayed.</br>

5. Click **Unregister CPGs** to unregister or click **Cancel** to cancel the process. 

### View CPG configuration ###

Use this option to view the CPG configuration.

Log into the Undercloud Horizon Dashboard.

2. From the left panel, click **Resources** Tab and then **Storage** to display the Overview page.

3. Select **StoreServ** option to activate it.<br> HP StoreServ page is displayed.</br>

4. Click the device name for which you want to view CPG configuration. <br>The Common Provisioning Groups page is displayed with a list of CPGs.<br> 

5. Click **More** drop-down list against the CPG for which you want to view the configuration.<br> The configuration is displayed in a dialog box.</br>


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
