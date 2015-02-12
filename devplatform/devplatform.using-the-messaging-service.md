---
layout: default-devplatform
title: "Using the Messaging Service"
permalink: /helion/devplatform/messageservice/
product: devplatform
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
role1: Systems Administrator 
role2: System Engineer
role3: Cloud Administrator
role4: Network Administrator
role5: Application Developer
Role6: Security Engineer
role7: Application Developer 
role8: ISV Developer
role9: Service Developer
writer: Jayme P

---
<!--PUBLISHED-->

# HP Helion Development Platform: Using the RabbitMQ Messaging Service#

The Messaging service is a key aspect of applications architected for the cloud as it helps to create scalable and distributed applications. This is achieved by enabling your software applications and services to communicate with each other as sub-components of a larger-scale application while allowing you to incorporate data from users, devices, and data streams. 

The Messaging service (beta) provisions RabbitMQ clusters that can be used for robust messaging in applications. 

The following topics explain how to create and manage a RabbitMQ instance:

- [Creating a RabbitMQ cluster](#create) 
- [Deleting a RabbitMQ cluster](#delete)
- [Managing a RabbitMQ cluster](#manage)

##Prerequisites

1. Install the [HP Helion Development Platform](/helion/devplatform/install/). 
2. [Configure](/helion/devplatform/install/#install-database) the services.

##Creating a RabbitMQ Cluster {#create}
The following guide will demonstrate how to deploy a multi-node RabbitMQ cluster using the Messaging Service.

1.	Log into Horizon and open the **Messaging (Beta)** panel under your project. Click on the **RabbitMQ** tab.
2.	Click the **Create Cluster** button.<br><img src="media/usingRMQ1.png"/>
3.	In the Create RabbitMQ dialog, specify the following information:
	- **Cluster Name** - A name for the cluster that will be created.
	- **Number of Cluster Instances** - the number of instances of RabbitMQ to have in the cluster. This can be 1, 3 or 5.
	- **Flavor of Cluster Instances** - The flavor size to use when creating the RabbitMQ instances in the cluster.
	- **Network** - The network to join the cluster to. This should be the network that your application will use to connect to the cluster.
	- **SSH Key Pair** - A key pair to use when connecting to the cluster. You can choose to create one if one does not already exist.
	- **Floating IP Pool** - A pool to choose a floating IP from to assign to the cluster.
	- **SSL Credentials** - The certificate to use when interacting with RabbitMQ in the cluster.
	- **Password for user** - The password for the user that is currently logged in.

 
3.	Click the **Launch** button.

4.	Open the **RabbitMQ** tab under the **Messaging (Beta)** panel and identify the **RabbitMQ** cluster from the list that was created in the previous step. Wait for the cluster to go to the **Complete** state<br><img src="media/usingRMQ2.png"/>

5.	Your cluster is now ready to use.

##Deleting a RabbitMQ Cluster {#delete}
The following guide will demonstrate how to delete an existing RabbitMQ cluster.

1.	Log in to Horizon and open the **Messaging (Beta)** panel under your project. Click on the **RabbitMQ** tab.
2.	Identify the **RabbitMQ** cluster to delete from the list.
3.	Click the **More** button and then the **Delete Cluster** button.

##Managing a RabbitMQ Cluster {#manage}
RabbitMQ clusters have a built-in dashboard for managing the cluster; this allows you to view the current state and health of the cluster. The following steps will demonstrate how to manage an existing cluster.

1.	Log in to Horizon and open the **Messaging (Beta)** panel under you project. Click on the **RabbitMQ** tab.
2.	Identify the RabbitMQ cluster that you will manage from the clusters listed in the **Clusters** table.
3.	Click on **Manage Cluster** next to your cluster.<br><img src="media/usingRMQ3.png"/>
4.	A new browser window will open with the log-in screen for the RabbitMQ cluster. Enter the same username and password you used to log in to HP Helion OpenStack&reg; when creating the RabbitMQ cluster and select **Login**.<br><img src="media/usingRMQ4.png"/>
5.	The management console for RabbitMQ will open. In the management console you can perform tasks such as monitor the queues and message rates, check resource usage on the instances, manage user accounts, and many others.  <br><img src="media/usingRMQ5.png"/>

##More Information


- For more information on using RabbitMQ and managing the RabbitMQ cluster, visit the [RabbitMQ documentation site](https://www.rabbitmq.com/documentation.html).

- For more information using HP Helion OpenStack, visit the [documentation page](http://docs.hpcloud.com/helion/openstack/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----

