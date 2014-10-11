---
layout: default-devplatform
title: "Creating a Database Instance"
permalink: /helion/devplatform/createdatabase/
product: devplatform

---
<!--UNDER REVISION-->

#Working with the Database Service 
The database service provides lifecycle services for MySQL database instances. Lifecycle services include provisioning, configuration, patching, backups, restores, and monitoring that can be administered from either a CLI interface, RESTful APIs or the Horizon dashboard. 

These instances can then be utilized by your applications to provide standard datastore/back-end functionality. For more information on database access please refer to //Document: Database access.

##Key learnings
You will understand the procedures necessary to create and replicate a database instance inside the public cloud. 

- [Create a database instance](#create)
- [Create a database backup](#backup)
- [Replicate a database](#replicate)

##Prerequisites
1. Install the [HP Helion Development Platform](/helion/devplatform/install/). 
2. Configure the database service.


##Create a database instance<a name="create"></a>

1. Log into the Horizon console.
2. Under your project, open the Database panel and then click the **Instances** tab. 
2. Click **Launch Instance**.
3. In the **Details** tab, specify the following options: 
	- I**nstance Name** - the name of the MySQL instance to create 
	- **Flavor** - the size of the instance to host the database on
	- **Volume Size** - the size of the volume to host the data on (in GB). Note: this **cannot** be changed later.
	- **Datastore** - the MySQL database version to create
	- **Availability Zone** (optional) – the availability zone that the database will be created in.

4.	Under the **Networking** tab, specify the network to associate the database instance with. This is required and should be the same network that any application that accesses the database is on. 
	- Optional - Specify the initial database to create on the database instance. This option can be used to pre-populate the instance with a database and a user for that database.  
6.	Click **Launch**.
7.	In the **Database** tab, open the **Instances** panel. This panel displays the status of the newly created database instance. 
8.	Once the database instance has reached **Active** status, the instance is ready to use.

##Create a database backup<a name="backup"></a>
The following section will demonstrate how to back up an existing database instance. This will take a backup of the entire database instance. If necessary, the backup can be restored to a new instance at a later time. 

1.	Log in to the Horizon console.
2.	Under your project, open the **Database** panel and then click the **Instances** tab.
3.	A list of active database instances will be displayed. Identify the database instance to back up and click **Create Backup** next to that instance.
3.	In the **Backup Database** dialog, specify the following information:
	- **Name** – the name of the backup to create. This name will help you identify the backup in the future.
	- **Database Instance** – The database instance that will be backed up.
	- **Description** – a text description of the backup (optional).
	- **Parent Backup** – if a previous backup of this database instance exists. it is possible to take an incremental backup. An incremental backup will process faster because it only stores the differences between the two. Select the previous backup if an incremental backup is desired.
4.	Click **Backup**.
5.	In the **Database** panel, click the **Backups** tab to view all existing backups, including the newly-created backup.

##Replicate a database<a name="replicate"></a>
Replicating a database creates a slave for your instance that replicates every action on the master. Creating a database instance that is automatically replicated results in more durable data and can prevent data loss in a disaster scenario.

###Prerequisites###
To follow this guide, you must have already [created](#create) a database instance that will be the master database.  

###Steps###
1.	Log in to the Horizon console.
2.	Under your project, open the **Database** panel and then click the **Instances** tab.
2.	Click **Launch Instance**.
3.	In the **Details** tab, specify the following options:
	- **Instance Name** - the name of the MySQL instance that will be the slave instance.
	- **Flavor** - the size of the instance to host the slave database on.
	- **Volume Size**- the size of the volume to host the data on (in GB). Note: this **cannot** be changed later. 
	- **Datastore** - the MySQL datastore version to create.
	- **Availability Zone** (optional) - the availability zone that the database will be created in. For replication, it is important for this to be in a different availability zone than the master.

4.	Under the **Networking** tab, specify the network to associate the database instance with. This is required and should be the same network that any application that accesses the database is on.
5.	Click the **Advanced** tab  and then use the **Replicate from Instance** drop-down to select the master instance to replicate.
6.	Click **Launch** to create the replica.

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*


 
