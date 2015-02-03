---
layout: default-devplatform
title: "Deploying the Application Lifecycle Service"
permalink: /helion/devplatform/deploy/
product: devplatform

---
<!--PUBLISHED-->
# HP Helion Development Platform: Configuring and Deploying an Application Lifecycle Service Cluster
This document explains the process to configure and deploy an Application Lifecycle Service (ALS) cluster from the Horizon user interface.

The document covers the following sections:

- [Prerequisites](#prereq)
- [Configuring and Deploying  an ALS Cluster](#configure)

##Prerequisites {#prereq}
You need to have [installed](/helion/devplatform/install/) the Helion Development Platform.

##Configuring an ALS Cluster {#configure}
1.	In the Horizon UI, from the **Project** tab, open the **Application Lifecycle Service** tab, and select the **Clusters** sub-tab.<br><img src="media/ALSConfig1.png"/>
 
2.	Click on the **Create Cluster** button to bring up the **Create Cluster** dialog.<br><img src="media/ALSConfig2.png"/>
 
3.	Fill out required fields in the Details tab of the Create Cluster dialog, including
	- **Title** - name of cluster
	- **Prefix** - DNS acceptable hostname string (not fully qualified DNS name) used to name the virtual machines created for the cluster.
	- **Admin Email**
	- **Admin Password**
	- **Availability Zone** - where the cluster will be created.
	- **DEA flavor** - [Droplet Execution Agents (DEAs)](http://docs.cloudfoundry.org/concepts/architecture/execution-agent.html) are responsible for running and staging applications in ALS. DEA flavors specify different amounts of RAM available per DEA instance, ranging from 0.5GB to 16GB. <br>**Note**: ALS DEA Nodes must be *m1.medium* or larger. Sizes *m1.tiny* and *m1.small* are too small to support the ALS Virtual Machine Image and will trigger an error state.
	- **DEA Instance Count** - the number of DEA instances to use in the cluster.
	- **Key Pair** - required for authentication.

4.	Click on the **Networking** tab of the Create Cluster dialog and drag an available network to the **Selected Networks** area.<br><img src="media/ALSConfig3.png"/>

5.	Select the **Application Services** tab of the **Create Cluster** dialog, and choose the application services to enable in the cluster.<br><img src="media/ALSConfig4.png"/>

6.	Select the **Database** tab of the **Create** **Cluster** dialog, and choose the databases to enable in the cluster. Detailed notes on how to create or connect to an OpenStack&reg; MySQL database can be found [here](/helion/devplatform/connectdatabase/). <br><img src="media/ALSConfig5.png"/>
 
7.	Click on the **Create** button. You will see the cluster building as shown below.<br><img src="media/ALSConfig6.png"/>
 
8.	Once the cluster has been built, you can access it by clicking on the URL of the created cluster, which can be reached in the **Clusters** view or by the **Cluster Details** page. <br><img src="media/ALSConfig7.png"/>
 
1. The [Application Lifecycle Service Documentation ](/als/v1/) provides an overview of how to administer and use the configured cluster, which opens up in a separate tab and requires the admin credentials set in step 3 to access and provision.

----
