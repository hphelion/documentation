---
layout: default-devplatform
title: "HP Helion 1.2 Development Platform: Adding DEA Nodes and Services to a Cluster"
permalink: /helion/devplatform1.2/growcluster
product: devplatform
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
<!--UNDER REVISION-->
# HP Helion 1.2 Development Platform: Adding DEA Nodes and SQL Services to a Cluster

<span style="font-size:70%">*Windows, .NET, SQL Server, and IIS are either registered trademarks or trademarks of Microsoft Corporation in the United States and/or other countries.*</span>
Follow these instructions to use the Horizon console to grow your clusters by adding more DEA nodes or additional SQL services (2012 or 2014).

1. After [creating a cluster](/helion/devplatform/1.2/windows/building_windows/#enabling), go to the **Clusters** page and click on the **Actions** down arrow to display the options.<br /><img src="media/growcluster1.png"/>
 
1. Click on **Grow DEAs**, fill out the details, and then click Grow. This will create the specified number of DEAs of the selected type and attach them to the cluster.<br /><img src="media/growcluster2.png"/>
 
1. To add more services, check the check box to select the services and then click **Grow Services**. This will create the selected service nodes and attach them to the cluster.<br /><img src="media/growcluster3.png"/>
1. To rename a cluster, click Rename Cluster, enter the new name, and then click Rename. Note that this renames the cluster title but does not affect the cluster prefix. <br /><img src="media/growcluster4.png"/>

---
<div align="center"><a href="/helion/devplatform/1.2/windows/">Windows Overview</a> </div>
<div align="center"> <a href="/helion/devplatform/1.2/windows/deployingnet/">Deploying your first .NET Application</a> | <a href="/helion/devplatform/1.2/windows/tools_guide/">Windows and .NET Tools Guide</a> </div>
<div align="center"> <a href="/helion/devplatform/1.2/windows/building_windows/">Building and Deploying Windows DEA and SQL Server Express Images</a> | <a href="/helion/devplatform/1.2/windows/glazier/">Glazier Reference Guide</a></div>
<div align="center"><a href="/helion/devplatform/1.2/windows/adding_services/">Adding Services to a Windows Application</a> | <a href="/helion/devplatform/1.2/windows/buildpack/">Deploying Windows Applications with the IIS Buildpack</a></div>