---
layout: default
title: "HP Helion OpenStack: Beta Installation and Configuration"
permalink: /helion/openstack/undercloud/resource/esx
product: commercial

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/helion/openstack/install-beta/prereqs/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/vsa/">NEXT &#9654;</a> </p>

#Compute Service

Compute service provides a way to instantiate virtual machine instances on publicly accessible physical machines hosted in your cloud environment.

Compute allows you to work with flavors, which are unique combinations of disk space, memory capacity, and CPU; images, which are collections of files used as a base installation, typically operating systems such as Ubuntu 10.10; and servers, which are virtual instances created using a flavor and an image

A variety of flavors and images are provided by HP Helion Compute that can be used to create a wide mix of servers.


## Virtual Environments


Virtual Environment is a system which implements, manages, and control multiple virtual instances. HP Helion OpenStack supports two type of clouds that is KVM and VMWare ESX. In ESX hypervisor, the only supported hypervisor is VMware Vsphere product line. With our ESX integration, you can provision and manage an overcloud ESX cluster. 

Manage virtual environment allows you to register, unregister vCenter and import clusters in the ESX vCenter environments. It also allows you to secure your vCenter by providing the SSL certificate while registering.



* [Register vCenter](#register-vcenter)

* [View registered ESX vCenter](#view-registered-vCenter)

* [Unregister vCenter](#unregister-vCenter)

	* [Unregister a vCenter](#unregister-a-vCenter)

	* [Unregister multiple vCenter](#unregister-multiple-vCenter)
 

* [Edit vCenter](#edit-vCenter)

* [Import cluster](#import-cluster)

* [View cluster](#view-cluster)

* [Unimport cluster](#unimport-cluster)
 
	* [Unimport a cluster](#unimport-a-cluster) 
	* [Unimport multiple clusters](#unimport-multiple-clusters)


##Register vCenter {#register-vcenter}

vCenter provides the centralized management of virtual host and virtual machines from a single console. vCenter are easier to manage. You can register only three vCenter in the compute service. A single administrator can manage multiple workloads.

<br>To register vCenter, perform the following:

1. In the Horizon Undercloud Dashboard, click the **Resource** Tab.<br>
The tab displays with options in the left panel.

2. Click **Compute** and then select **ESX** to open Manage Virtual Environments page.

3.  Click **Register vCenter** displayed at the top right corner of the page. Register vCenter dialog box is displayed with two different tabs: **vCenter Details** and **Proxy Details**. By default, vCenter Details is the active tab.

4.  In the vCenter Details tab, do the following
  
  * In the **vCenter Server Name** box, enter the name for the vCenter Server.
  * In the **vCenter Server Address** box, enter the IP address of the vCenter Server.
  * In the **vCenter Administrator** box, enter the vCenter administrator username. This is the vCenter credentails of the administrator.
  * In the **vCenter Server Password** box, enter the password.
  * In the **vCenter Server Port** box, enter the vCenter Server Port.
  * (Optional) In the **vCenter SSL CA-certificate** box, paste the SSL certificate that you have generated in vCenter. <br>SSL CA certificate secures your connections.

5. In the Proxy Details tab, do the following:

  * In the **vCenter Management Clusters** box, enter the name for the vCenter Management Cluster.
  * In the **Clusters Datacenter** box, enter the name of the vCenter Server.
  * In the **Cluster's shared Datastore** box, enter the name of the shared datastore.
  * In the **vCenter Port Group** box, enter the management port group.
  * In the **Compute Proxy Hostname** box, enter the name of the host name of the compute proxy.
  * DHCP is provided with two options: True and False.
 	 * If you want the automatically configuration the compute proxy details of the vCenter, in the **DHCP enabled** drop-down list, select **True**. 
 	 * If you want to manually enter the compute proxy details of vCenter, in the **DHCP enabled** drop-down list, select **False** and enter the values for the following fields.
  			* In the **Compute Proxy IP** box, enter the compute proxy IP of the vCenter.
  			* In the **Compute Proxy Netmask** box, enter the compute proxy netmask.
  			* In the **Compute Proxy Gateway** box, enter the compute proxy gateway.
  * Click **Register**. A message is displayed on successful registration of vCenter. <br> After successful registration the registered vCenter is displayed in the ESX vCenter table in Manage Virtual Environments page.
  
##View registered ESX vCenter {#view-registered-vCenter}

To view the list of registered ESX vCenter, do the following:

1. In the Horizon Undercloud Dashboard, click the **Resource** Tab.<br>
The tab displays with options in the left panel.

2. Click the **Resource** Tab in the left panel.<br> The tab displays an option in the left panel.

3. Click **Compute** and then select **ESX** to open Manage Virtual Environments page. <br>
  The following information is displayed:
   * **Name**: name of the vCenter.
   * **IP Address**: IP Address of the registered vCenter.
   * **Switch Definition Status**: (???).
   * **Actions**: tasks you can perform on the ESX vCenter. 

All the registered vCenter will be listed in the Manage Virtual Environment page.


## Unregister vCenter {#unregister-vCenter}

With a help of single command you can unregister one or multiple vCenter(s).

* Unregister a vCenter {#unregister-a-vCenter}

* Unregister multiple vCenter {#unregister-multiple-vCenter}
 
**Unregister a vCenter**

To unregister a vCenter, do the following:

1. In the Horizon Undercloud Dashboard,  click the **Resource** Tab in the left panel.<br> The tab displays an option in the left panel.

2. Click **Compute** and then select **ESX** to open Manage Virtual Environments page. 

3.	Click **More** drop-down list against the vCenter and select Unregister vCenter. **Confirm Unregister vCenter** dialog box is displayed.

4.	Click **Unregister vCenter** to unregister the selected vCenter, else click **Cancel**.

**Unregister multiple vCenter**

To unregister multiple vCenter with a single command, do the following:

1. Click the **Resource** Tab in the left panel.<br> The tab displays an option in the left panel.

2. Click **Compute** and then select **ESX** to open Manage Virtual Environments page. 
 
3. Select **Name** check box against the name of the vCenter. Unregister vCenter is enabled.
4. Click **Unregister vCenter** on the top right corner of the page. Confirm Unregister vCenter dialog box is displayed.

4.	Click **Unregister vCenter** to unregister a vCenter, else click **Cancel**.


##Edit vCenter {#edit-vCenter}

When there is any change in the vCenter details you can use the edit option to modify those change so that it reflects in the HP Helion Undercloud Horizon dashboard.

To edit the vCenter, do the following:

1. In the Horizon Undercloud Dashboard, click the **Resource** Tab in the left panel.<br> The tab displays an option in the left panel.

2. Click **Compute** and then select **ESX** to open Manage Virtual Environments page.

3. Click **Edit** against the name of the ESX vCenter to modify the vCenter details. Edit vCenter dialog box is displayed.

4. Make the required the changes. 

5. Click **Done** to save the changes.


##Import Cluster {#import-cluster}

You can import a clusters from Manage Virtual Environments page or vCenter Details (name of the vCenter). Manage Virtual Environments page displays the information related to registered vCenter and vCenter Details (name of the vCenter) page displays the vCenter details like name of the cluster, data center, CPU usage, memory usage, disk usage, and action.


To import a cluster from Manage Virtual Environments page, do the following:

1. In the Horizon Undercloud Dashboard, click the **Resource** Tab in the left panel.<br> The tab displays an option in the left panel.

2. Click **Compute** and then select **ESX** to open Manage Virtual Environments page. 

3.	Click **More** drop-down list against the vCenter and select **Import Clusters**. Import Cluster dialog box is displayed.<br> In the Import Cluster dialog box, do the following:
</br>
  * In the **vCenter Name Server**, the name of selected vCenter appears.
  * Click **Data Center** drop-down list and select the data center.
  * Click **Cluster** drop-down list and select the cluster.
 
5. Click **Done**. A message is displayed when the cluster is imported successful.

<p>
OR</p>

To import cluster from vCenter Details: (name of vCenter), do the following:

1.  In the Horizon Undercloud Dashboard, click the **Resource** Tab in the left panel.<br> The tab displays an option in the left panel.

2. Click **Compute** and then select **ESX** to open Manage Virtual Environments page. 
 
3. Select **Name** check box of the vCenter. <br> vCenter Details (name of selected vCenter) page is displayed.

4. Click **Import Clusters** displayed on the top right corner of the page.<br>An Import dialog box is displayed.</br> In the Import Cluster dialog box, do the following:
</br>
  * In the **vCenter Name Server**, the name of selected vCenter appears.
  * Click **Data Center** drop-down list and select the data center.
  * Click **Cluster** drop-down list and select the cluster.
 
5. Click **Done**. A message is displayed when the cluster is imported successful.


##View Cluster details {#view-cluster-details}

 To view the details of the registered ESX vCenter, do the following:

1.  In the Horizon Undercloud Dashboard, click the **Resource** Tab in the left panel.<br> The tab displays an option in the left panel.

2. Click **Compute** and then select **ESX** to open Manage Virtual Environments page. 
 
3. Select **Name** check box of the vCenter.  vCenter Details (name of selected vCenter) page is displayed. <br> The page displays the following information:
  * **Name**: name of the cluster
  * **Datacenter**: datacenter of the cluster
  * **CPU Usage**: the usage of the CPU by a cumulative cluster of a particular vCenter.
  * **Memory Usage**: the usage of the memory by a cumulative cluster of a particular vCenter.
  * **Disk Usage**: usage of the disk by a cumulative cluster of a particular vCenter.
  * **Action**: task you can perform, that is, unimport the cluster. 

<!--not for GA
##Configure Data Trunk


To configure data trunk, do the following:

1. Click the **Resource** Tab in the left panel.<br> The tab displays an option in the left panel.

2. Click **Compute** and then select **ESX** to open Manage Virtual Environments page. 

3.	Click **More** drop-down list against the vCenter  and select **Configure Data Trunk**. Configure Data Trunk dialog box is displayed.<br> In the Configure Data Trunk dialog box, do the following:
</br>
  * In the vCenter Name Server, the name of selected vCenter appears.
  * Click Data Center drop-down list and select the data center.
  * Click Distributed V- Switches drop-down list and select the dv-switches of your data center.
 
4. Click **Done**. A message is displayed when the distributed v-switches are configured.
<br>

OR
</br> 

To configure Data Trunk from vCenter Details: (name of vCenter), do the following:

1.  Click the **Resource** Tab in the left panel.<br> The tab displays an option in the left panel.

2. Click **Compute** and then select **ESX** to open Manage Virtual Environments page. 
 
3. Select **Name** check box of the vCenter. <br> vCenter Details (name of selected vCenter) page is displayed.

4.	Click **Configure Data Trunk** on the top right corner of the page. Configure Data Trunk dialog box is displayed.<br> In the Configure Data Trunk dialog box, do the following:
</br>
  * In the vCenter Name Server, the name of selected vCenter appears.
  * Click Data Center drop-down list and select the data center.
  * Click Distributed V- Switches drop-down list and select the dv-switches of your data center.
 
5. Click **Done**. A message is displayed when the distributed v-switches are configured. -->

##Unimport clusters {#unimport-cluster}

You can unimport multiple clusters or a single cluster with a single command. 

* Unimport a cluster {#unimport-a-cluster}

* Unimport multiple clusters {#unimport-multiple-clusters}


**Unimport a cluster**

To unimport a cluster, do the following:

1. In the Horizon Undercloud Dashboard, click the **Resource** Tab in the left panel.<br> The tab displays an option in the left panel.

2. Click **Compute** and then select **ESX** to open Manage Virtual Environments page. 
 
3. Select **Name** check box against the name of the vCenter. <br> vCenter Details (name of selected vCenter) page is displayed.

4. Select the **Name** check box against the name of the clusters to unimport cluster. 

5. Click **Unimport Clusters** against the name of the cluster in the Action cloumn.


**Unimport multiple clusters**

 To unimport multiple clusters with a single command, do the following:

1.  In the Horizon Undercloud Dashboard, click the **Resource** Tab in the left panel.<br> The tab displays an option in the left panel.

2. Click **Compute** and then select **ESX** to open Manage Virtual Environments page. 
 
3. Select **Name** check box of the vCenter. <br> vCenter Details (name of selected vCenter) page is displayed.

4. Select the **Name** check box against the name of the clusters to unimport cluster. You can select multiple clusters. Unimport Clusters get enabled on the top right corner of the page. 

5. Click **Unimport Clusters** on the top right corner of the page to unimport the selected clusters.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


