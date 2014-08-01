---
layout: default
title: "HP Cloud OS for Moonshot: Administration Dashboard"
permalink: /cloudos/moonshot/manage/administration-dashboard/region-instances/
product: moonshot

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/administration-dashboard/working-with-region-tab/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage/administration-dashboard/working-with-region-tab/">&#9650; UP</a> | <a href="/cloudos/moonshot/manage/administration-dashboard/region-images/">NEXT &#9654; </p></a>



#Manage Region Instances# 

Use this option to view the list of instances in a region.

You can  perform the following tasks:

* <a href= "#Edit a Region Instance">Edit a Region Instance</a>

* <a href= "#Edit a Region Instance">Soft Reboot an Instance</a>

* <a href= "#Terminate Region Instance(s)">Terminate Region Instance(s)</a>

* <a href= "#Force Delete an Instance">Force Delete an Instance</a>

* <a href= "#View Console">View Console</a>


To view region instances:

1.	Click the **Region** Tab to select it.

2.	From the options in the left panel, select **Instances** to display a page with the list of instances.

3. Click Name to display a page with two tabs- **Overview** and **Console**.<br>
By default, Overview is the active tab and displays the specifications, IP addresses and metadata of the selected instance.

4. Click the **Console** Tab to activate it.<br>
A page is displayed to enter a password. Enter the Chassis Manager password for the instance. Once the password is accepted, the boot process of the instance is displayed.

**Note**: You cannot login to the instance with this console; it only displays the boot process of the instance. To login, you need to open a separate SSH session using the IP assigned to the instance.

##Edit a Region Instance<a name= "Edit a Region Instances"></a>

Once a region instance is created, you can only edit the name of the instance. Use this option to edit the instance.

1.	Click the **Region** Tab to select it.

2.	From the options in the left panel, select Instances to display a page with the list of instances.

3.	Click **Edit Instance**.<br>
An Edit Instance dialog box is displayed. You can only edit the name of the instance.

4.	Make the required changes.

5.	Click **Save** to save the details.<br>
OR <br>
Click **Cancel** to abort and go to the previous screen.

##Soft Reboot an Instance<a name= "Soft Reboot an Instance"></a>

Soft reboot can be used to stop the instance and reboot it. This function is similar to the Restart option in Microsoft Windows.

To reboot the instance:

1.	Click the **Region** Tab to select it.

2.	From the options in the left panel, select Instances to display an Instances page.

3.	Click More against the instance to display the drop-down list.

4.	Select **Soft Reboot** an Instance.<br>
A confirm Soft Reboot dialog box is displayed.

5.	Click **Soft Reboot Instance** to reboot the instance.<br>
OR<br>
Click **Cancel** to abort and go to the previous screen.


##Terminate Region Instance(s)<a name= "Terminate Region Instance(s)"></a>

1.	Click the **Region** Tab to select it.

2.	From the options in the left panel, select **Instances** to display an Instances page.<br>
The page displays a list of instances.

3.	Select check box to select the instances to delete.

4.	Click **Terminate Instances**.
The instances are deleted after getting a confirmation from you.<br>
OR<br>
To terminate a single instance, click **More** against the instance to display a drop-down list.

1. Select **Terminate Instance** to terminate it.


##Force Delete an Instance<a name= "Force Delete an Instance"></a>

Use this option to delete an instance that is in an unresponsive state.

1.	Click the **Region** Tab to select it.

2.	From the options in the left panel, select **Instances** to display an Instances page.<br>
The page displays a list of instances Click **More** against the instance to display the drop-down list.

3.	Click **Force Delete Instance**.<br>
The selected instance is deleted after getting a confirmation from you.

##View Console<a name= "View Console"></a>

To view the console details:

1.	Click the **Region** Tab to select it.

2.	From the options in the left panel, select **Instances** to display the Instances page.<br>
The page displays a list of instances.

3.	Click **More** against the instance to display the drop-down list.

4.	Click the **Console** Tab to activate it.<br>
A page is displayed to enter a password. Enter the Chassis Manager password for the instance. Once the password is accepted, the boot process of the instance is displayed.

**Note**: You cannot login to the instance using this console; it only displays the boot process of the instance. To login, you need to open a separate SSH session using the IP assigned to the instance.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
