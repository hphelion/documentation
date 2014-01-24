---
layout: default
title: "HP Cloud OS Utilities"
permalink: /cloudos/moonshot/manage/utilities/
product: cloudos

---

<a name="_top"> </a>

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage/">&#9650; UP</a> | <a href="/cloudos/moonshot/manage/troubleshooting/">NEXT &#9654;</a> </p>

# HP Cloud OS Utilities

The current release features the HP Cloud OS Clean-up Utility. Additional utilities may be added in future releases and described in this topic.

## HP Cloud OS Clean-up Utility
 
The HP Cloud OS Clean-up Utility ensures that the databases used to store data within HP Cloud OS are kept clean, 
and do not retain and accumulate data that is no longer being accessed. 

### Overview

The HP Cloud OS Clean-up Utility ensures that the HP Cloud OS and OpenStack databases are running smoothly and the databases are clean. 
The utility uses the Nagios web interface for scheduling database clean-up tasks.

It is possible for a HP Cloud OS or OpenStack resource in one table to be reliant on a resource in another table with 
no foreign key reference. If the dependent resource were simply deleted, a dangling reference in the referring table 
would result. Likewise, if there are two tables with foreign key relationships and the data is deleted in one table 
but not the other, referential integrity is broken. 

As an example, a user entity may be associated with various resources in the system-projects, templates, key pairs, security groups, 
and so on. If the user represents an employee who has left the organization, and that user is removed in the Administration Dashboard, 
the data representing the user is marked for deletion in HP Cloud OS, but it is important that the data not be removed from the 
database until the associated data can be removed with the Clean-up Utility.

The HP Cloud OS Clean-up Utility addresses referential integrity issues by running a number of tasks that are offered as 
Nagios services. Running these tasks regularly keeps the HP Cloud OS and OpenStack databases clean. 

This section includes:

* [Clean-up Tasks](#clean-up-tasks)

* [Using Nagios](#using-nagios)


## Clean-up Tasks

The HP Cloud OS Clean-up Utility performs the following tasks:

* Clean up all resources associated with previously deleted resources. The HP Cloud OS Administration Dashboard does not 
delete projects or users. Instead, it "moves them to the trash can" by removing as many resources as possible and then 
prefixing the Project (or User) name with a tilde ~. Flavors are already only "marked for deletion" in the database.

* Prevent select HP Cloud OS database entries from existing in their respective tables longer than 24-Hours.

* Ensure that all of the database tables are referentially accurate. In other words, Cloud Utils cleans the database of all invalid data.

* Monitor key services to ensure that they are in a run state.

The Clean-up Utility runs every 24 hours by default, between 23:00 and 00:00 hours local time, but can be scheduled 
through Nagios to run whenever the admin needs to clean up the database.

The Clean-up Utility consists of the following four Nagios services:

* **Cloud clean db objects** &mdash; Cleans up the user and all the key pairs associated with that user from the database. 
For projects, removes the element from the database table or sets the "elements deleted" flag for the project. 
Removes hardware flavors that are marked for deletion and are no longer being used by a VM instance. 
Cleans up tokens that are expired for more than 24 hour, and for roles, removes the roles from the database table.

* **Cloud clean deleted objects** &mdash;-Cleans up referential integrity issues in the database.

* **Cloud clean outdated objects** &mdash; Deletes unused data that meets the deletion criteria.

* **Cloud clean tokens** &mdash; Cleans up tokens that have been expired for more than 24 hours from the database.


## Using Nagios

Nagios is used to run the HP Cloud OS Clean-up Utility. 

Note: In addition to the Clean-up Utility, other services that reside on the Cloud Controller and Compute Controller 
can be monitored using Nagios. 

1.	Access the Nagios dashboard (http://192.168.124.10/nagios3/). **Note:** In the current release, the dashboards use pre-defined login credentials. These are not published in the web-hosted documentation. To get the pre-defined login credentials, refer to the readme file included in the same ZIP that contained the HP Cloud OS ISO. 
If you have not already done so, see the ZIP on the <a href="https://cloudos.hpwsportal.com" target="codn">HP Cloud OS Distribution Network</a>. 

2.	Click the Services link in the left panel of the Nagios web interface to see the cloud service checks and the other cloud services. 

In the Nagios dashboard, services and  status information are grouped by node (or "host" in Nagios terminology). 
In the host column, only the admin node is identified by name. All other nodes are identified by their MAC addresses. 

To find your alias (or node name) for a given MAC address, go to the Cloud Tab in the Operational Dashboard and click Manage Nodes. 
The Alias and Node ID columns show the name and corresponding MAC address for each node in the cloud. 


### To manually schedule the running of Clean-up Utility tasks

As mentioned above, the Clean-up Utility will run automatically every 24 hours. 
No manual scheduling or user intervention is required. But you can manually schedule the Clean-up Utility service to run by 
performing these steps:

1.	Choose a node in the host column and click the name of the service you wish to schedule (Cloud clean db objects, Cloud clean deleted objects, Cloud clean outdated objects, or Cloud clean tokens). 

2.	In the Service Commands section, click Re-schedule the next check of this service.

3.	In the Check Time field, enter the time when you want the service to run.

4.	Click Commit.

5.	When the task has completed, the Nagios display is refreshed, showing the date and time that the service was run and the current (updated) status value. 

> **Note**: Although the Nagios dashboard shows all of the Clean-up Utility services for all nodes, 
the Cloud clean deleted objects service will always fail if run on a Cloud Controller node. This is expected behavior 
because that Clean-up Utility service includes tasks that interact with the OpenStack Nova compute service, 
which is not installed on the Cloud Controller node, but only on Compute Controller nodes.
 
<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

