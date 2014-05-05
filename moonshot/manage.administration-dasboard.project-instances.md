---
layout: default
title: "HP Cloud OS for Moonshot: Administration Dashboard"
permalink: /cloudos/moonshot/manage/administration-dashboard/project-instances/
product: moonshot

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage">&#9650; UP</a> | NEXT &#9654;</p>

# Manage Project Instances #

Once the instances are created, they are displayed under the Instance option. The following tasks can be performed using Instance option in the left panel:

* <a href="#View Instance Details">View Instance Details</a>

* <a href="#Edit Project Instance">Edit Project Instance</a>

* <a href="#Launch an Instance">Launch an Instance</a>

* <a href="#Terminate an Instance">Terminate an Instance</a>

* <a href="#Force Delete an Instance">Force Delete an Instance</a>


## View Instance Details ##<a name="View Instance Details"></a>

Use this option to view the list of Project Instances.

1.	Click the **Project** Tab to select it.<br>
The tab displays with options in the left panel.</br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Infrastructure** and then select Instances to display Instances page with the list of instances.

4.	Click **Instance Name** to display a page with the **Overview** Tab.<br>
The **Overview** Tab displays the specifications, IP addresses and metadata of the selected instance.</br>

**Note**: The page displays two tabs: Overview and Console for the Cloud Administrator. Console Tab displays the Instance UI after accepting a valid password. 

## Edit a Project Instance ##<a name="Edit Project Instance"></a>

Once the instance is created, you can only edit its name.

Use this option to edit the instance details.

1.	Click the **Project** Tab to select it.<br>
The tab displays with options in the left panel.</br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Infrastructure** and then select Instances to display Instances page with the list of instances.

4.	From the options in the left panel, select **Instances** to display a page with the list of instances.

5.	Click **Edit Instance**.<br>
An Edit instance dialog box is displayed.</br>

6.	Make the required changes.

7.	Click **Save** to save the details.

    OR

    Click **Cancel** to abort and go to the previous screen.

## Launch an Instance ##<a name="Launch an Instance"></a>

1.	Click the **Project** Tab to select it.<br>
The tab displays with options in the left panel.</br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Infrastructure** and then select **Instances** to display Instances page with the list of instances.

4.	Click **Launch Instance** to open a Launch Instance dialog box with four tabs- **Details**, **Access and Security**, **Networking** and **Post Creation**. By default, Details is the active tab.

5.	From the **Instance Source** drop-down list, select the instance source.

6.	From the **Image** drop-down list, select the image.

7.	In the **Instance Name** dialog box, enter the name for the instance.

8.	From the **Flavor** drop-down list select the flavor.<br>
By default, the auto generated flavor is displayed.</br>

9.	In the **Instance Count** box, enter the number of instances required.

10.	Click the **Access & Security** Tab to activate it.

11.	From the **Keypair** drop-down list, select the **keypair** that you have created for the instance.

12.	Click the **Networking** Tab to activate it.

13.	From the **Available Networks** list, select the required network.<br>
The network is displayed in the Selected Networks box.</br>

14.	Click **Launch** to launch the instance.

    OR
    
    Click **Cancel** to abort and go to the previous screen.

## Terminate an Instance(s) ##<a name="Terminate an Instance"></a>

1.	Click the **Project** Tab to select it.<br>
The tab displays with options in the left panel.</br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Infrastructure** and then select **Instances** to display Instances page with the list of instances.

4.	Select the check box against the instance(s) that you want to delete.

5.	Click **Terminate Instances**.<br>
The instances are deleted after getting a confirmation from you.</br>

## Force Delete an Instance ##<a name="Force Delete an Instance"></a>

Use this option to delete an instance which is in unresponsive state.

1.	Click the **Project** Tab to select it.<br>
The tab displays with options in the left panel.</br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Infrastructure** and then select **Instances** to display Instances page with the list of instances.

4.	Click **More** against the instance to display the drop-down list.

5.	Click **Force Delete Instance**.
The selected instance(s) is deleted after getting a confirmation from you.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
