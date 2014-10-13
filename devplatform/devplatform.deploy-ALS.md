---
layout: default-devplatform
title: "Deploying the Application Lifecycle Service"
permalink: /helion/devplatform/ALS/deploy
product: devplatform

---
<!--UNDER REVISION-->
HP Helion Development Platform: Configuring and Deploying an Application Lifecycle Service Cluster
This document explains the process to configure and deploy an Application Lifecycle Service (ALS) cluster from the Horizon user interface.
The document covers the following sections:
•	Prerequisites
•	Configuring and Deploying  an ALS Cluster
Prerequisites
You need to have installed Helion Development Platform.

Configuring an ALS Cluster
1.	In the Horizon UI, from the Project tab, open the Application Lifecycle Service tab, and select the Clusters sub-tab.
 
2.	Click on the Create Cluster button to bring up the Create Cluster dialog.
 
3.	Fill out required fields in the Details tab of the Create Cluster dialog, including
a.	Title – name of cluster
b.	Prefix – DNS acceptable hostname string (not fully qualified DNS name) used to name the virtual machines created for the cluster.
c.	Admin Email
d.	Admin Password
e.	Availability Zone – where the cluster will be created.
f.	DEA flavor – Droplet Execution Agents (DEAs) are responsible for running and staging applications in ALS. DEA flavors specify different amounts of RAM available per DEA instance, ranging from 0.5GB to 16GB.
g.	DEA Instance Count – the number of DEA instances to use in the cluster.
h.	Key Pair – required for authentication.
4.	Click on the Networking tab of the Create Cluster dialog and drag an available network to the Selected Networks area.
 
5.	Select the Application Services tab of the Create Cluster dialog, and choose the application services to enable in the cluster.
 

6.	Select the Database tab of the Create Cluster dialog, and choose the databases to enable in the cluster. Detailed notes on how to create or connect to an Openstack MySQL database can be found here. 
 
7.	Click on the Create button. You will see the cluster building as shown below.
 

8.	Once the cluster has been built, you can access it by clicking on the URL of the created cluster, which can be reached in the Clusters view or by the Cluster Details page. 
 
9.	The Application Lifecycle Service Documentation provides an overview of how to administer and use the configured cluster, which opens up in a separate tab and requires the admin credentials set in step 3 to access and provision.



----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*


 
