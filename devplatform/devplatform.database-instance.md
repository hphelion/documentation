---
layout: default-devplatform
title: "Creating a Database Instance"
permalink: /helion/devplatform/createdatabase/
product: devplatform

---
<!--UNDER REVISION-->

#Working with the Database Service 
The database service provides lifecycle services for MySQL database instances. Lifecycle services includes provisioning, configuration, patching, backups, restores, and monitoring that can be administered from either a CLI interface, RESTful APIs or the Horizon dashboard. 

These instances can then be utilized by your applications to provide standard datastore/backend functions. <!--  For more information on database access please refer to <Document: Database access> -->

##Key Learnings
You will understand the procedures necessary to create and replicate a database instance inside the public cloud. 

- [Create a database instance](#create)
- [Create a database backup](#backup)
- [Replicate a database](#replicate)

##Prerequisites
1. Install the HP Helion Development Platform 
2. Configure the database service.


##Creating the instance<a name="create"></a>

1. Log into Horizon and open the Database panel under your Project. Click on the instances tab. 
2. Click the **Launch Instance** button.
3. In the **Launch Instance** dialog's **Details** tab, specify the following options: 
	- Instance Name - the name of the MySQL instance to create 
	- Flavor - the size of the instance to host the database on
	- Volume Size - The size of the volume to host the data on (in GB). Note: this cannot be changed later.
	- Datastore - the MySQL database version to create
	- Availability Zone (optional) – the availability zone that the database will be created in.

4.	Under the **Networking** tab of the **Launch Instance** dialog specify the network to associate the database instance to. This is required and should be the same network that any application that accesses the database is on. 
5.	Optional - Specify the initial database to create on the database instance. This option can be used to pre-populate the instance with a database and a user for that database.  
6.	Click the **Launch** button
7.	Open the **Instances** panel of the **Database** tab to view the status of the newly created database instance. Once the database instance has been created it will show up in Active status.
8.	The database instance is now ready to use.

##Creating a database backup<a name="backup"></a>
The following section will demonstrate how to backup an existing database instance. This will take a backup of the entire database instance and can be restored into a new instance at a later time. 

1.	Log into Horizon and open the Database panel under your Project. Click on the instances tab. A list of active databases instances will be shown.

2.	Identify the database instance to back up and click the **Create Backup** button next to that instance.
3.	In the **Backup Database** dialog, specify the following information:
	- Name – the name of the backup to create. This name will help you identify the backup in the future.
	- Database Instance – The database instance that will be backed up.
	- Description – A text description of the backup (optional).
	- Parent Backup – If a previous backup of this database instance exists it is possible to take an incremental backup – this incremental backup will be faster because it only stores the changes. Select the previous back if desired.
4.	Select the **Backup** button.
5.	Open the **Backups** tab of the **Database** panel to view all existing backups.
6.	The newly created backup will be displayed there.

##Replicating a database<a name="replicate"></a>
Replicating a database creates a slave for your instance that replicates every action on the master. Creating a database instance that is replicated results in more durable data and can prevent data loss in a disaster scenario.

###Prerequisites###
To follow this guide, you must have already [created](#create) a database instance that will be the master database.  

###Steps###
1.	Log into Horizon and open the Database panel under your Project. Click on the instances tab.
2.	Click **Launch Instance**.
3.	In the **Launch Instance** dialog's **Details** tab, specify the following options:
	- Instance Name - the name of the MySQL instance that will be the slave instance.
	- Flavor - the size of the instance to host the slave database on.
	- Volume Size - The size of the volume to host the data on (in GB). Note: this cannot be changed later. 
	- Datastore - the MySQL datastore version to create.
	- Availability Zone (optional) - the availability zone that the database will be created in. For replication it is often important for this to be in a different AZ than the master.

4.	Under the **Networking** tab of the **Launch Instance** dialog, specify the network to associate the database instance to. This is required and should be the same network that any application that accesses the database is on.
5.	Click the **Advanced** tab and in the **Replicate from Instance** drop-down select the master instance to replicate.
6.	Click the **Launch** button to create the replica.

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*


 
