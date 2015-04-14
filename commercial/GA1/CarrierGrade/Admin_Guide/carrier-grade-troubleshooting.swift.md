---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade: Troubleshooting Scale-Out Swift"
permalink: /helion/openstack/carrier/services/troubleshooting/swift/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: Systems Administrator 
role2: Cloud Architect 
role3: Storage Administrator 
role4: Network Administrator 
role5: Service Developer 
role6: Cloud Administrator 
role7: Application Developer 
role8: Network Engineer 
authors: Paul F

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--

<p style="font-size: small;"> <a href="/helion/openstack/carrier/services/object/overview/">&#9664; PREV</a> | <a href="/helion/openstack/carrier/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/carrier/services/reporting/overview/"> NEXT &#9654</a> </p> -->


# HP Helion OpenStack&#174; Carrier Grade: Troubleshooting Scale-Out Swift

HP Helion OpenStack&#174; is an OpenStack technology coupled with a version of Linux&#174; provided by HP. This topic describes all the known issues that you might encounter. To help you resolve these issues, we have provided possible solutions.

* [Cannot create storage containers using Amazon S3 API](#S3)
* [Failure of newly added compute or VSA node during Scale-out](#failnew)
* [Scale-out nodes : os-refresh-configuration fails on Controller Node](#refreshfails)
* [Recovery when Scale-out nodes of newly added compute node or VSA](#recovery)
* [Ironic intermittently set maintenance mode to True during scale-out](#ironic)

### Cannot create storage containers using Amazon S3 API {#S3}
<!-- DOCS-698 -->

**System Behavior/Message**

An attempt to create a bucket fails with "The remote server returned an error: (404) Not Found.". 

**Probable Cause**

HP Helion OpenStack does not support Amazon S3 API.

**Resolution**

Create containers using the [Helion OpenStack Object Storage Service](/helion/openstack/carrier/services/object/overview/) through the Swift APIs or the Horizon dashboard. 

### Scale-out nodes : os-refresh-configuration fails on Controller Nodes {#refreshfails}

**System Behavior/Message**

The os-refresh-config on the controller Nodes fail during scale-out.

**Probable Cause**

The controller nodes can fail due to following reasons:

* RabbitMQ clustering
* MySQL clustering

**Resolution**

To resolve RabbitMQ cluster issue:

* Use the following command and verify the running status of RabbitMQ.

	status rabbitmqserver

If RabbitMQ is not running, start RabbitMQ using the `start rabbitmqserver` command.

* Verify that the `rabbitmqctl cluster_status` displays all 3 nodes in `running_nodes` and disc. If it does not display one or more nodes in running nodes then restart RabbitMQ and run the following command on the missing nodes:

	rabbitmqctl join_cluster &#60;clusternode>

* If rabbitmqctl cluster_status displays expected output but there is an issue with one or more node(s) for joining RabbitMQ cluster, do the following:

	1. Execute the following commands on all controller nodes:

			pkill u rabbitmq

	2. Run `osrefreshconfig` command first on the `cluster_name` (`rabbitmqctl cluster_status` output) and then on the remaining controller nodes.

**To resolve MySQL cluster issue**

1. Use the following command and verify the running status of MySQL on the node.

		/etc/init.d/mysql status

	If mysql has stopped, restart it.

2. If MySQL fails to restart, perform the following instructions:

* Run mysqld_safe wsreprecover on all the controller nodes.
* Compare the output from all controller nodes for last committed transaction sequence number. For example:

		root@overcloudcecontrollercontroller0defen5afl75f:~#
		mysqld_safe wsreprecover
		sed: -e expression #1, char 25: unknown option to `s'
		sed: -e expression #1, char 24: unknown option to `s'
		141113 01:00:36 mysqld_safe Logging to '/mnt/state/var/log/mysql/error.log'.
		141113 01:00:36 mysqld_safe Starting mysqld daemon with databases from /mnt/state/var
		141113 01:00:36 mysqld_safe Skipping wsreprecover for 1e9d939a6a0711e49c28aa3122
		141113 01:00:36 mysqld_safe Assigning 1e9d939a6a0711e49c28aa31223485e0:220764 to 141113 01:00:38 mysqld_safe mysqld from pid file /var/run/mysqld/mysqld.pid ended 

	So the last committed transaction sequence number on this node is 220764.

* Compare the last committed transaction sequence number across all 3 nodes and bootstrap from the latest node using `/etc/init.d/mysql bootstrappxc` or `/etc/init.d/mysql restart` and start MySQL on the remaining nodes.

<HR>

### Recovery when Scale-out nodes of newly added compute node or VSA {#recovery}

***System Behavior/Message***

The newly added compute node or VSA node fails during scale-out.


**Resolution**

You must remove a failed compute node before adding a new compute node.

Perform the following steps to remove a failed compute node:

1. Run `heat stack-list` on the undercloud node and search for failed stack.
2. Delete the failed stack using the following command:
		
		# heat stack-delete <stackname or uuid>

3. List the newly added nova node which is created during scale-out.

		# nova-list

4. Execute the following command to delete nova node. Node name and ID is obtained from step 3.
 	
		# nova delete &#60;name or id>

5. View a newly added node using the following command:

		# ironic node-list
 
6. If newly added node is in **ERROR** state or it has maintenance as **True** then remove those node(s) using following command.

		# ironic node-delete <uuid>, where uuid is the ID of the node

<hr />

### Scale-out nodes : os-refresh-config on Controller Nodes Fail {#refresh}

***System Behavior/Message***

The os-refresh-config on controller Nodes fail during scale-out.

***Probable Cause***

The controller nodes can fail due to following reasons:

* wrong user input

* rabbitmq clustering

* mysql clustering

**Resolution**

**To resolve rabbitmq cluster issue** 

* Use the following command and verify the running status of rabbitmq.
 
		status rabbitmq-server 

 If rabbitmq is not running, start rabbitmq  using `start rabbitmq-server` command.

* Verify that the `rabbitmqctl cluster_status` displays all 3 nodes in `running_nodes`, disc. If it does not display one or more nodes in running nodes then restart rabbitmq and run the following command on the missing nodes:

		rabbitmqctl join_cluster &#60;clusternode>


* If `rabbitmqctl cluster_status` shows expected output but there is an issue with one or more node(s) for joining rabbitmq cluster, do the following:

	1. Execute the following commands on all controller nodes:
		
			pkill -u rabbitmq  
 
	2. Run `os-refresh-config`  command first on the `cluster_name` (rabbitmqctl cluster_status output) and on the remaining controller nodes.




**Resolve mysql cluster issue**

1. Use the following command and verify the running status of mysql on the node.

		/etc/init.d/mysql status

	If mysql has stopped, restart it.
 
4.  If mysql fails to restart, perform the following instructions:

	* Run  `mysqld_safe --wsrep-recover` on all controller nodes.
	* Compare the output from all controller nodes for last committed transaction sequence number. For example:

			root@overcloud-ce-controller-controller0-defen5afl75f:~# mysqld_safe --wsrep-recover
			sed: -e expression #1, char 25: unknown option to `s'
			sed: -e expression #1, char 24: unknown option to `s'
			141113 01:00:36 mysqld_safe Logging to '/mnt/state/var/log/mysql/error.log'.
			141113 01:00:36 mysqld_safe Starting mysqld daemon with databases from /mnt/state/var/lib/mysql/
			141113 01:00:36 mysqld_safe Skipping wsrep-recover for 1e9d939a-6a07-11e4-9c28-aa31223485e0:220764 pair
			141113 01:00:36 mysqld_safe Assigning 1e9d939a-6a07-11e4-9c28-aa31223485e0:220764 to wsrep_start_position
			141113 01:00:38 mysqld_safe mysqld from pid file /var/run/mysqld/mysqld.pid ended
 
 	So the last committed transaction sequence number on this node is 220764. 

	* Compare the last committed transaction sequence number across all 3 nodes and bootstrap from the latest node using `/etc/init.d/mysql bootstrap-pxc` or `/etc/init.d/mysql restart` and start mysql on the remaining nodes.

<hr />

### Ironic intermittently set maintenance mode to True during scale-out {#ironic}

This issue can happen during the scale-out of the overcloud nodes. The update will fail for one or more nodes. <!-- CORE-2082 -->

**System Behavior/Message:**

If the update fails, from undercloud node:

1. Source the stackrc file:
 
		source stackrc 

2. Execute the `nova list` command to determine which Compute node(s) is in an error state. The node will have a status of ERROR.

		nova list

3. Execute the `heat stack-list` command to determine which Heat stack is in an error state. The stack will have a status of `CREATE_FAILED`.

		heat stack-list

3. Execute the `ironic node-list` command to determine which node(s) is in maintenance mode. The stack will have a maintenance of `TRUE`.

		ironic node-list

3. Execute the `ironic node-show` command for the node that is node(s) is in maintenance mode. The stack will have a maintenance of `TRUE`.

		ironic node-show <UUID>

	In the output, check the `last_error` field for an error similar to the following:

		During sync_power_state, max retries exceeded for node 81baacd5-657e-476f-b7ef, node state None does not match expected state

		'None'. Updating DB state to 'None' Switching node to maintenance mode. 


**Solution**

1. List the stacks using the following command:

		heat stack-list


2. Delete the stack with the failed Nova node.

		heat stack-delete &#60;ID of failed node>

3. Change the node(s) to false for the maintenance option, using the following command:
		
		`ironic node-update &#60;id> replace maintenance=False`

4. Remove the failed node in maintenance mode using the following command:

		nova node-delete &#60;ID of error node>

	You can re-use the node, if needed.



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593;</a>


