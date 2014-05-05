---
layout: default
title: "HP Cloud OS for Moonshot: Administration Dashboard"
permalink: /cloudos/moonshot/manage/administration-dashboard/region-flavors/
product: moonshot

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage">&#9650; UP</a> | NEXT &#9654; </p>



#Manage Flavors#
 
A flavor describes the amount of memory, number of CPUs, and storage capacity of Baremetal instances. Only a Cloud Administrator can create and delete flavors.

You can perform the following tasks:

* <a href="#Create a Flavor">Create a Flavor</a>

* <a href="#Edit a Region Flavor">Edit a Region Flavor</a>

* <a href="#Delete a Region Flavor">Delete a Region Flavor</a>

* <a href="#View a Region Flavor Extra Specifications">View a Region Flavor Extra Specifications</a>

* <a href= "#Create a Region Flavor Extra Specifications">Create a Region Flavor Extra Specifications</a>

* <a href= "#Edit a Region Flavor Extra Specifications">Edit a Region Flavor Extra Specifications</a>

* <a href= "#Delete a Region Flavor Extra Specifications">Delete a Region Flavor Extra Specifications</a>


To view the list of available flavors:

1.	Click the **Region** Tab to select it.

2.	From the options in the left panel, select **Flavors** to display a page with the list of flavors.

##Create a Flavor##<a name= "Create a Flavor"></a>

Flavors are machine configurations that describe the amount of memory, number of CPUs, and storage capacity of Baremetal instances. The moment you register a chassis, a flavor is created by default. You can use the default flavor or create a flavor of your choice.

To create a flavor:

1.	Click the **Region** Tab to select it.

2.	From the options in the left panel, select **Flavors** to display the Flavors page.

3.	Click **Create Flavor** to open a Create Flavor dialog box.

4.	In the **Name** box, enter the name that you want to assign to the Baremetal flavor.

5.	In the CPUs box, enter the required number.

6.	In the **RAM MB** box, specify the RAM corresponding to the cartridge.

7.	In the **Root Disk GB** box, enter the required space.

8.	From the **CPU Architecture** drop-down list, select the architecture.

9.	From the **Kernel Image** drop-down list, select the PXE Kernel image.

10.	From the **RAM Disk Image** drop-down list, select the PXE RAMdisk image.

11.	Click **Create Flavor** to create a new the flavor.<br>
A message is displayed on successful creation.
<br>
OR<br>
Click **Cancel** to abort and go to the previous screen.
 
**Note**: A Baremetal flavor must have the following extra specifications to provision instance successfully.

 - CPU Architecture
 
 - Deploy Kernel Image

 - Deploy RAMDisk Image 

##Edit a Region Flavor##<a name= "Edit a Region Flavor"></a>

You cannot edit a system generated flavor. 

To edit a user created flavor:

1.	Click the **Region** Tab to select it.

2.	From the options in the left panel, select **Flavors** to display the Flavors page.<br>
The Flavors page displays with a list of flavors.

3.	Click **Edit Flavor** against the flavor that you want to edit.<br>
The Edit Flavor dialog box is displayed.

4.	Make the required changes.

5.	Click **Save** to save the details.<br>
OR<br>
Click **Cancel** to abort and go to the previous screen


##Delete a Region Flavor##<a name= "Delete a Region Flavor"></a>

Use this option to delete a region flavor. You cannot delete a system generated flavor. A flavor cannot be deleted if it is in use.

To delete a flavor:

1.	Click **Region** Tab to select it.

2.	From the options in the left panel, select **Flavors** to display the Flavors page.<br>
The Flavors page displays with a list of flavors.

3.	Click **More** drop-down list against the flavor that you want to delete.

4.	Select **Delete**.<br>
A confirmation box is displayed. The flavor is deleted after getting a confirmation from you.


##View a Region Flavor Extra Specifications##<a name= "View a Region Flavor Extra Specification"></a>

This option allows you to view the extra specifications key-value pair for the selected flavor.

1.	Click **Region** Tab to select it.

2.	From the options in the left panel, select **Flavors** to display the Flavors page.<br>
The Flavors page displays with a list of flavors.

3.	Click **More** drop-down list against the flavor for which you want to view the Extra Specifications and click **View Extra Specs**.<br>
The Extra Specs page is displayed with the details of the extra specifications.

4.	Click **Close** to cancel the dialog box.


##Create a Region Flavor Extra Specifications##<a name= "Create a Region Flavor Extra Specifications"></a>

This option allows you to create an extra specifications key-value pair for the custom flavor. You cannot create extra specifications for default flavor.

1.	In the Administration Dashboard, select the **Region** Tab.<br>
The tab displays with options in the left panel.

2.	Select **Flavors** to display the Flavors window.<br>
The Flavors window displays with a list of flavors.

3.	Click **More** drop-down list against the flavor for which you want to create that you want to edit and click **View Extra Specs**.<br>
The Extra Specs window is displayed with the different items.

4.	Click **Create** to display Create Flavor Extra Spec dialog box.

5.	In the **Key** box, enter the key, for example *baremetal:deploy_kernel_id*.

6.	In the **Value** box, enter the value, for example,*c209db5f-2ee9-479d-ac2a-a9753725e555*.<br>

7.	Click **Create** to create the extra specifications.
OR<br>
Click **Cancel** to cancel the process


##Edit a Region Flavor Extra Specifications##<a name= "Edit a Region Flavor Extra Specifications"></a>

**Important**: Ensure that the following extra specifications for Baremetal are not deleted or wrongly edited:

* *CPU Architecture*

* *Deploy Kernel Image*

* *Deploy RAMDisk Image*


This option allows you to edit extra specifications for the selected custom flavor. You cannot create extra specifications for default flavor.

1.	In the Administration Dashboard, select the **Region** Tab.<br>
The tab displays with options in the left panel.

2.	Select **Flavors** to display the Flavors page.<br>
The Flavors page displays with a table of flavors.

3.	Click **More** drop-down list against the flavor that you want to edit and click **View Extra Specs**.<br>
The Extra Specs page is displayed with the different items.

4.	Select check box  against the item which you want to edit.

5.	Click **Edit** to display the Edit Flavor Extra Spec dialog box.

6.	Make the required changes in the Key or the value.

7.	(Optional) Click **Cancel** to cancel the process and return to the View **Extra Specs** window.

8.	Click **Save** to save the details.

9.	Click **Close** to close the window.

##Delete a Region Flavor Extra Specifications##<a name= "Delete a Region Flavor Extra Specifications"></a>

**Important**: Ensure that the following extra specifications for Baremetal are not deleted or wrongly edited:

* *CPU Architecture*

* *Deploy Kernel Image*

* *Deploy RAMDisk Image*

This option allows you to delete extra specifications for the selected custom flavor. You cannot create extra specifications for default flavor.

1.	In the Administration Dashboard, select the **Region** Tab.<br>
The tab displays with options in the left panel.

2.	Select **Flavors** to display the Flavors page.<br>
The Flavors window displays with a table of flavors.

3.	Click **More** drop-down list against the flavor for which you want to delete extra specifications and click **View Extra Specs**.<br>
The extra specification is deleted after receiving a confirmation from you.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
