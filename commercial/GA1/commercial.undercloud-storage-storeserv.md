---
layout: default
title: "HP Helion OpenStack&#174; Edition: Manage Storage"
permalink: /helion/openstack/ga/undercloud/storage/storeserv/
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

<!--what is HP Helion CLoud referring to in bullet 1??-->

# Working with HP StoreServ (3PAR)

The StoreServ option allows you to configure 3PAR as storage. Before you start working with 3PAR, ensure that HP 3PAR is accessible from the undercloud and you have all the required details to register the device. <!---the following prerequisites have been fulfilled:-->

1. HP Helion Cloud is deployed.

2. The Sirius service is up and running in the undercloud.

3. The HP StoreServ/3PAR device is accessible from the undercloud.

4. The HP StoreServ/3PAR device (running operating system v 3.1.3 or later) is accessible by Cinder and Compute nodes running in the overcloud.

5. Common Provisioning Groups (CPGs) are created for HP StoreServ (also named 3PAR).

6. The HP 3PAR REST service is running and HTTPS is enabled.



<!---Configuration of HP StoreServ/3PAR as Cinder backend using Sirius service involves the following steps:-->

You can perform the following tasks using the StoreServ option:

* [Registering the 3PAR device](#registering-device)

	* [Edit StoreServ](#edit-storeserv)
	
    * [Unregister a StoreServ](#unregister-storeserv) 
    
	* [Unregister multiple StoreServs](#unregister-multiple-storeservs) 

* [Registering the required Common Provisioning Group(CPG)s](#registering-cpg)

## Registering the 3PAR device ##{#registering-device}

You can register a 3PAR device to Sirius by using either the Undercloud Horizon Dashboard or Sirius REST client (Refer to the [User manual for Sirius client](/helion/openstack/ga/sirius-cli/)).

To register the device using the Undercloud Horizon Dashboard, do the following:

1. Log in to the Undercloud Horizon Dashboard.

2. From the left panel, click the **Resources** tab and then **Storage** to display the overview page.

3. Select the **StoreServ** option to activate it.<br> The HP StoreServ page is displayed.

4. Click **Register StoreServ** displayed on the top right corner of the page to display the Register 3PAR StoreServ dialog box.

5. In the dialog box, do the following:

   * In the **Name** box, enter the name for the 3PAR array.
   
   * In the **IP Address** box, enter the IP address of the 3PAR WS API Server.
   
   * In the **Username** box, enter the user name of the 3PAR super user.
   
   * In the **Password** box, enter the password of the 3PAR super user.
   
   * In the **Port** box, enter the Port for the 3PAR WS API service.
   
   * In the **SAN IP** box, enter the IP address of the SAN controller for SSH access to the array.
   
   * In the **SAN username** box, enter the user name of the SAN controller for SSH access to the array.
   
   * In the **SAN password** box, enter the password of the SAN controller for SSH access to the array.
   
   * From the **Device Type** drop-down list, select the device type. For example: FC, iSCSI 
   
   * Click **Done** to save the details. 

    On successful registration, the 3PAR device is added and is listed as the registered Storeserv.


### Edit a StoreServ ###{#edit-storeserv}

To edit a StoreServ, do the following:

1. Log in to the Undercloud Horizon Dashboard.

2. From the left panel, click the **Resources** tab and then **Storage** to display the overview page.

3. Select the **StoreServ** option to activate it.<br> The HP StoreServ page is displayed.

4. Click **Edit StoreServ**. 

5. Make the required changes.

6. Click **Done** to save the changes.   


### Unregister a StoreServ ###{unregister-storeserv}

**Note**: Before you unregister the storeserv, you need to unregister the CPG and remove the back end, etc. Once the 3PAR is unregistered, none of the CPGs nor the volume that are present from the array are accessible.


Use this option to unregister a StoreServ.

1. Log in to the Undercloud Horizon Dashboard.

2. From the left panel, click the **Resources** tab and then **Storage** to display the overview page.

3. Select the **StoreServ** option to activate it.<br> The HP StoreServ page is displayed.

4. Click the **More** drop-down list against the StoreServ that you want to unregister and select **Unregister StoreServ**.<br> A confirmation box is diplayed.

5. Click **Unregister StoreServ** to unregister, or click **Cancel** to cancel the process. 


### Unregister multiple StoreServs ###{unregister-multiple-storeserv}

Use this option to unregister multiple StoreServs using a single command.

1. Log in to the Undercloud Horizon Dashboard.

2. From the left panel, click the **Resources** tab and then **Storage** to display the overview page.

3. Select the **StoreServ** option to activate it.<br> The HP StoreServ page is displayed.

4. Click the checkbox on the left of the **Name** column to select all the StoreServs. 

5. Click **Unregister StoreServ** to unregister the StoreServs.<br>A confirmation box is diplayed.

5. Click **Unregister StoreServ** to unregister or click **Cancel** to cancel the process. 

 
## Registering HP 3PAR Common Provisioning Groups (CPGs)##{#registering-cpg}

Once you have registered the 3PAR device, the next step is to choose the CPGs for your cloud. CPG (Common Provisioning Group) is a fundamental unit that can be configured as a Cinder back end. A single HP 3PAR may have many CPGs. You can choose and allocate them to the cloud as a per your requirement. <!---First register the CPG in Sirius and then configure the CPG as backend for Overcloud Cinder service. You can register a few CPGs and allocate them as and when required. Cinder config file is updated only during the allocation, the registeration of the CPG just updates the Sirius database.-->

**Note**: Only registered CPG(s) can be configured as a storage back end for Cinder.

To register the CPGs, do the following:

1. Log in to the Undercloud Horizon Dashboard.

2. From the left panel, click the **Resources** tab and then **Storage** to display the overview page.

3. Select the **StoreServ** option to activate it.<br> The HP StoreServ page is displayed with the list of StoreServs.

4. Click the **More** drop-down list against the StoreServ for which you want to register CPG and select **Register CPG**.<br> The Register CPG page is displayed with a list of CPGs that are present in the selected 3PAR array in the **Available CPG** box and a list of already selected CPGs in the **Selected CPG** box.</br>

**OR**

   * Click the device name for which you want to register CPG. <br>The Common Provisioning Groups page is displayed with a list of CPGs.
    
    * Click **Register CPG**. <br>The Register CPG page is displayed with a list of CPGs that are present in the selected 3PAR array in the **Available CPG** box and a list of already selected CPGs in the **Selected CPG** box.</br> 

5.Select the desired CPG(s) from the **Available CPG** box list.

6.Click &rarr; to move the CPG(s)to the **Selected CPG(s)** box.<br> The CPG is displayed in the **Selected CPG(s)** box.

6.(Optional) Click **Choose All** displayed below the **Available CPG** box to select all the CPGs . 

7.(Optional) Click **Remove All** displayed below the **Selected CPG** box to move all the CPGs back to the **Available CPG(s)** or select the CPG(s) and click &larr; to move them back.

8.Click **Register** to register the CPG.

9.To check the status of CPG registration, in the HP StoreServ page, click the device name to display the Common Provisioning Groups page. The selected CPG displays as **registered**.    

### Edit CPG ###

**Note**: You cannot edit a CPG that is in *'Reserved'* state. Ensure that you enter a CPG name that already exists on the 3PAR device when you edit the CPG details.

To edit a CPG, do the following:

1. Log in to the Undercloud Horizon Dashboard.

2. From the left panel, click the **Resources** tab and then **Storage** to display the overview page.

3. Select the **StoreServ** option to activate it.<br> The HP StoreServ page is displayed with the list of StoreServs.

4. Click the device name for which you want to register CPG. <br>The Common Provisioning Groups page is displayed with a list of CPGs.

5. Click **Edit CPG** against the CPG that you want to edit.<br> The Update CPG Details dialog box is displayed. 

6. Make the required changes.

7. Click **Done** to save the changes or click **Cancel** to cancel the process.  


### Unregister a CPG ###

**Note**: Before you unregister a CPG, remove the back end associated with this CPG. You need to either detach the volumes from Cinder or migrate to another back end as the volumes from this CPG will no longer be available.

This option allows you to unregister a CPG. To unregister, do the following:

1. Log in to the Undercloud Horizon Dashboard.

2. From the left panel, click the **Resources** tab and then click **Storage** to display the overview page.

3. Select the **StoreServ** option to activate it.<br> HP StoreServ page is displayed.

4. Click the device name for which you want to unregister CPG. <br>The Common Provisioning Groups page is displayed with a list of CPGs.<br> 

5. Click the **More** drop-down list against the CPG you want to unregister and select **Uregister CPG**.<br> A confirmation dialog box is dislayed.

6. Click **Unregister CPG** to unregister or click **Cancel** to cancel the process.


### Unregister multiple CPGs ###

Use this option to unregister multiple CPGs using a single command.

1. Log in to the Undercloud Horizon Dashboard.

2. From the left panel, click the **Resources** tab and then **Storage** to display the overview page.

3. Select the **StoreServ** option to activate it.<br> The HP StoreServ page is displayed.

4. Click the device name for which you want to unregister the CPG. <br>The Common Provisioning Groups page is displayed with a list of CPGs.<br> 

5. Click the checkbox on the left of the **Name** column to select all the CPGs. 

5. Click **Unregister CPGs** to unregister the CPGs.<br>A confirmation box is diplayed.

5. Click **Unregister CPGs** to unregister or click **Cancel** to cancel the process. 

### View CPG configuration ###

Use this option to view the CPG configuration.

1. Log in to the Undercloud Horizon Dashboard.

2. From the left panel, click the **Resources** tab and then **Storage** to display the overview page.

3. Select the **StoreServ** option to activate it.<br> The HP StoreServ page is displayed.

4. Click the device name for which you want to view CPG configuration. <br>The Common Provisioning Groups page is displayed with a list of CPGs.<br> 

5. Click the **More** drop-down list against the CPG for which you want to view the configuration.<br> The configuration is displayed in a dialog box.</br>

6. Click **Close** to close and return to the Common Provisioning Groups page. 


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
