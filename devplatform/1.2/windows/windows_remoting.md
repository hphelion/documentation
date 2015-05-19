---
layout: default-devplatform
title: "HP Helion 1.2 Development Platform: Deploying your first .NET Application"
permalink: /helion/devplatform/1.2/windows/remoting/
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

---
<!--UNDER REVISION-->

# HP Helion 1.2 Development Platform: Providing Remote Desktop Access to Windows DEA and Windows SQL Server Instances 

<span style="font-size:70%">*Windows, .NET, SQL Server, and IIS are either registered trademarks or trademarks of Microsoft Corporation in the United States and/or other countries.*</span>

This tutorial demonstrates how to set up Remote Desktop access to new Windows instances running in HP Helion OpenStack. Since the instances are running full versions of Windows, you must connect to them using Remote Desktop rather than SSH.

The steps needed to do this are as follows:

* [Create an RDP security group](#create_security)
* [Add the RDP security group to the instance](#add_security)
* [Retrieve the Windows instance password (Public Cloud)](#get_pw_cloud)</a>
* [Retrieve the Windows instance password (Helion OpenStack)](#get_pw_hos)

##Create the RDP Security Group {#create_security}







