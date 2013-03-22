---
layout: default
title: Using HP Cloud Relational Database
permalink: /dbaas/tutorial/introduction/
product:
  - dbaas

---
# Using HP Cloud Relational Database

HP Cloud Relational Database (sometimes called Database as a Service, or DBaaS) provides highly optimized MySQL databases inside of the HP Cloud.

With HP Cloud Relational Database, you can quickly build and manage MySQL database servers without having to manage the mundane details. This tutorial explains (at a high level) how to work with our DBaaS.

## A Quick Guide to Terminology

HP Cloud Relational Database provides *database instances* (or *database servers*). A database instance is a MySQL server that communicates on a network socket.

Inside of a database instance, you can create *users*, *schemas* (also often called *databases*), and other entities. You can have as many *schemas* per *database instance* as you would like.

For example, if you want to have two WordPress blogs with separate databases (schemas), you can easily run both on one database instance. You do not need a separate instance for each database. In this case, both blogs would connect to the same instance's IP (possibly with different logins), but access different databases (schemas).

## Creating a New Database Server

When you create a new relational database instance, what you are actually creating is a database server that lives on a managed compute instance. HP Cloud takes care of operating that instance and keeping the database process comfortably running, and you get access to the MySQL server.

You can create a new database server using the HTTP REST API directly (check out the [API documentation](http://api-docs.hpcloud.com/)) or you can use one of the existing libraries or tools. For example, the [HPCloud-PHP library](http://hpcloud.github.com/HPCloud-PHP/) has support for working with DBaaS. As the HP Cloud Relational Database enters public beta, you will also be able to create database servers through the [Management Console](https://console.hpcloud.com).

When you create a new database server, you can supply certain parameters, like what size of a server you want (extra-small through extra-large, just like Compute). Once you request that the database be created, the server will respond with some information about the instance, including an IP address, a username and a password. *Make sure you get the password. The only time this is accessible is at database creation time.*

For example, say the database returns the user name `db`, the password `1234`, and the  address `192.168.0.21` (This is fictional. DBaaS will always return a public address). You will then be able to connect to the database server at that address with those credentials. If you have the MySQL command line client installed, you can connect like this:

~~~
$ mysql -H 192.168.0.21 -u db -p 1234
~~~

From here, you will be able to create new database users, schemas (databases), and so on, just as if you had installed MySQL on your own compute instance. Since the user name and password given to you is the administrative user, it is suggested that you create additional accounts for other applications and users.

## Managing your Database Servers

Most of the administrative tasks of running a database server are handled by HP Cloud. We keep your instances running and maintained. In fact, for HP Cloud Relational Database we do not provide logins to the compute instance itself. But there are several tasks that you can perform:

* Information: At any time you can retrieve information about a database server. Information returned includes the state of the database, it's address, and other details. Note that the administrative password is *never* returned in this request.
* Restart: You can restart your database instance any time. Database instances take several minutes to restart, since the compute instance is rebooted, and then the database is brought back online.
* Resetting the Admin Password: While you cannot retrieve the administrative password after an instance is created, you *can* reset the admin password.
* Delete a Database Server: You can also delete an HP Cloud Relational Database instance. Doing this will destroy the database server (and all of its contents). That server will not be recoverable.

## Snapshots and Backups

One critical aspect of managing a database service is creating backups. For MySQL databases, there is more than one way to do this. A common strategy is to dump the database into a SQL file, and the `mysqldump` tool performs this operation.

This method works fine on database instances, and you may perform this task at will.

It is also possible to take a *snapshot* of a MySQL server. In this process, a special binary copy of the database is built and stored. Snapshots are useful because they can be used as the basis for rapid system recovery.

HP Cloud Relational Database provides services for taking and managing snapshots. Through our tools (REST API, language-specific libraries, and management console), you can perform the following snapshot tasks:

* Take a snapshot of a database: This snapshots an entire database instance, including all database schemas and data on the server. For example, if you create a single database instance and then create several databases on that instance, a snapshot will capture all of the data for all of those databases.
* List the snapshots: You can see all of the snapshots for all of the database instances you are have.
* Deleting snapshots: Snapshots are large, and most accounts have limits on the number of snapshots that can be kept. For that reason, you may occasionally need or want to delete snapshot images.

What about re-building an instance from a snapshot? At this time, that step requires involvement from HP Cloud staff.

## More Information

For more information about HP Cloud Relational Database, see the [documentation](https://docs.hpcloud.com/).

For information about pricing and availability, visit the [HP Cloud Relational Database product home](https://www.hpcloud.com/products/RDB).