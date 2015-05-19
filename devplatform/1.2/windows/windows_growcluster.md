---
layout: default-devplatform
title: "HP Helion 1.2 Development Platform: Growing and Renaming Clusters Using Horizon"
permalink: /helion/devplatform/1.2/growcluster
product: devplatform2.0
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.2
role1: Systems Administrator 
role2: System Engineer
role3: Cloud Administrator
role4: Network Administrator
role5: Application Developer
Role6: Security Engineer
role7: Application Developer 
role8: ISV Developer
role9: Service Developer
authors: Patrick F
publish: true

---
<!--PUBLISHED-->
# HP Helion 1.2 Development Platform: Growing and Renaming Clusters Using Horizon

<span style="font-size:70%">*Windows, .NET, SQL Server, and IIS are either registered trademarks or trademarks of Microsoft Corporation in the United States and/or other countries.*</span>

Follow these instructions to use the [Horizon console](https://horizon.hpcloud.com/) to grow your clusters by adding more DEA nodes or services. These instructions are intended for installations of the Helion Development Platform running on Helion OpenStack version 1.1.1 or later.

Note that Windows DEA nodes and SQL Server services will not appear in the Horizon interface until you upload the appropriate images into Glance.

After [creating a cluster](/helion/devplatform/1.2/deploy/), go to the **Clusters** page. [**Project** tab > expand **Application Lifecycle Service** > **Clusters**]
Click on the **Actions** down arrow to display the options and select the desired option.<br /><img src="media/growcluster1.png"/><br />

 
##To add DEAs

Click on **Grow DEAs**, fill out the details, and then click **Grow**. This will create the specified number of DEAs of the selected type and attach them to the cluster.<br /><img src="media/growcluster2.png"/>
 
##To add more services
Check the check box to select the services and then click **Grow Services**. This will create the selected service nodes and attach them to the cluster.<br /><img src="media/growcluster3.png"/>

##To rename a cluster
Click **Rename Cluster**, enter the new name, and then click **Rename**. Note that this renames the cluster title, but does not affect the cluster prefix. <br /><img src="media/growcluster4.png"/>


---
<div align="center"><a href="/helion/devplatform/1.2/windows/">Windows Overview</a> </div>
<div align="center"> <a href="/helion/devplatform/1.2/windows/deployingnet/">Deploying your first .NET Application</a> | <a href="/helion/devplatform/1.2/windows/tools_guide/">Windows and .NET Tools Guide</a> </div>
<div align="center"> <a href="/helion/devplatform/1.2/windows/building_windows/">Building and Deploying Windows DEA and SQL Server Express Images</a> | <a href="/helion/devplatform/1.2/windows/glazier/">Glazier Reference Guide</a></div>
<div align="center"><a href="/helion/devplatform/1.2/windows/adding_services/">Adding Services to a Windows Application</a> | <a href="/helion/devplatform/1.2/windows/buildpack/">Deploying Windows Applications with the IIS Buildpack</a></div>