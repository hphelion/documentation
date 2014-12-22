---
layout: default
title: "HP Helion OpenStack&#174; Recovering After Power Outage"
permalink: /helion/openstack/high-availability/recover/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!---<p style="font-size: small;"> <a href="/helion/openstack/services/object/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/reporting/overview/"> NEXT &#9654</a> </p>-->

# HP Helion OpenStack&#174;: Recovering After Power Outage 

If your datacenter had a power outage and the HP Helion OpenStack cloud system experienced a non-graceful shutdown, you must restart the servers in a specific order and execute some specific manual commands to bring back the overcloud controller cluster.

The following sections provide detailed instructions on how to recover a HP Helion OpenStack cloud system:

* [Recover the seed](#seed)
* [Recover the undercloud](#uc)
* [Recover the overcloud](#oc)
* [Recover the HP Helion OpenStack components](#comp)
* [Connect to the VMs](#vm)

**Note:** Several of the procedures in this document use the `nova start` command. If `nova start` fails with a message such as *ERROR (Conflict): Instance 9769893e in task_state powering-off. Cannot start while the instance is in this state. (HTTP 409)*, power on the node manually using the iLO console.


### Recover the seed {#seed} 

1. Power on the seed cloud host. Ensure that the networking is operating, by logging into the seed cloud host remotely. 

	If the network is not working, run the following commands to remove the Ethernet drivers from the kernel and add the module back to the kernel:

		rmmod mlx_*
		modprobe mlx4_core

	If you cannot access the seed cloud host through the external interface, run the following command to restart the Open vSwitch (OVS) service:

		service openvswitch-force-reload-kmod restart

2. Launch a terminal and log in to your seed VM as root. 

		sudo su -

3. Boot the seed VM using the following command: 

		BRIDGE_INTERFACE=eth2 
		bash -x ~root/tripleo/tripleo-incubator/scripts/hp_ced_host_manager.sh --boot-seed

	The BRIDGE_INTERFACE command sets the interface on the seed cloud host to use as the bridge interface, for example em2 or eth2.

### Recover the undercloud {#uc}

1. Launch a terminal and log in to your seed VM as root. 

		sudo su -

2. Make sure you can ping the iLO of the undercloud node.

3. On the seed VM, run the following command to restart services on the undercloud:

		os-refresh-config

4. Run the following command to source the OpenStack configuration file:

		source stackrc

5. Run the following command and note UUID of undercloud.

		nova list

6. Run the following command, using the UUID you obtained, to stop the undercloud:

		nova stop <UUID>

7. Run the following command, using the UUID you obtained, to start the undercloud: 

		nova start <UUID>

8. Once the undercloud is up, use the following command to verify the host name. 

		hostname

	When the undercloud is properly configured, the host name is similar to `undercloud-undercloud-rweuuzkaj4` and not `hlinux`.

### Recover the overcloud {#oc}

1. Launch a terminal and log in to your undercloud as root. 

		sudo su -

2. Run the following command to restart services:

		os-refresh-config

3. Run the following command to source the OpenStack configuration file:

		source stackrc

4. Run the following command and note the status and UUID of each overcloud node:

		nova list

5. For each controller with a status of `ACTIVE`, run the following command, using the UUID you obtained, to stop the node:

		nova stop <UUID>

6. When all Overcloud nodes have a status of `SHUTOFF`, run the following command for each overcloud node, using the UUID you obtained for each:  
 
		nova start <UUID>

	If any of the nova commands used to start the nodes fail, wait and try again later.
	
8. Once the overcloud is up, use the following command to verify the host name. 

		hostname

	When the overcloud is properly configured, the host name is similar to `overcloud-ce-controller-rweuuzkaj4` and not `hlinux`.

### Recover the HP Helion OpenStack components {#comp}

After a power outage, the various HP Helion OpenStack components might not restart or might need to be reconfigured.

* [Restart MySQL](#mysql)
* [Restart RabbitMQ](#rabbit)
* [Restart the Swift nodes](#swift)
* [Restart the VSA nodes](#vsa)
* [Restart the compute nodes](#compute)
* [Connect to the VMs](#vm)

#### Restart MySQL {#mysql}

After a power outage MySQL might not restart on the overcloud controllers on boot. If this is the case, perform the following steps.

1. Run the following command on each overcloud controller to display the sequence number (seqno) for that controller:

		cat /mnt/state/var/lib/mysql/grastate.dat

	The controller with the highest sequence number has the most updated database and should be used to bootstrap the other controllers.

2. On the controller with the highest sequence number, run the following command to use that controller as the bootstrap:

		/etc/init.d/mysql bootstrap-pxc

3. Connect to each controller and restart MySQL:

		/etc/init.d/mysql start

#### Restart RabbitMQ {#rabbit} 

RabbitMQ is a component used by the centralized logging service.

1. Run the following command to determine if the RabbitMQ service is running correctly:

		rabbitmqctl cluster_status

	If all three overcloud controller nodes are listed in both the `nodes` and `running` sections then RabbitMQ is working properly.

2. If the nodes are not listed correctly, run the following commands on each overcloud controller node in turn:

	**Important:** Do not run all three commands on a single controller at the same time. 

	a. Run the following command on each overcloud controller node:

		pkill rabbit

	b. Then, run the following commands on each overcloud controller node:

		mv /var/lib/rabbitmq/mnesia/ /var/lib/rabbitmq/mnesia.orig

	c. Then, run the following command on each overcloud controller node:

		os-refresh-config


#### Restart the Swift nodes {#swift}

Log into the undercloud to start each of the Swift nodes.

1. Log onto the undercloud as root:

		sudo su -

2. Run the following command and note the UUID of each Swift node:

		nova list

3. Run the following command to start each Swift nodes:

		nova start <UUID>

	Wait for each node to start up and stabilize.

#### Restart the VSA nodes {#vsa}

Use the undercloud to start each of the VSA nodes.

1. Run the following command and note the UUID of each VSA node:

		nova list

2. Run the following command to start each VSA nodes:

		nova start <UUID>

	Wait for the server(s) to start up and stabilize.

#### Restart the compute nodes {#compute}

Use the undercloud to start each of the compute nodes.

1. Run the following command and note the UUID of each compute node:

		nova list

2. Run the following command to start each compute nodes:

		nova start <UUID>

	Wait for the server(s) to start up and stabilize.

## Connect to the VMs {#vm}

1. Verify that pre-existing guest VMs are up and reachable.

2. Verify that it is possible to create and reach new VMs.


After the system is running again, the output of the `nova list` command on the undercloud might appear similar to the following image:

<img src="media/Restore-Nova-List.png">







<!-- hiding
### Start the seed cloud host

1. Re-create the bridge configuration -- I do not know if someone already have this documented. waiting for Tom Hancock information

2. SSH to the KVM Host and start the Seed VM (virsh start seed)


	Wait the VM boot up

3. Start Undercloud Node (using nova start in Seed VM)

	Wait the server start up and stabilize

4. Start all overcloud controllers


	Wait the server startup and stabilize

5. Execute the command `cat /mnt/state/var/lib/mysql/grastate.dat` in all the controller to find who has the most updated database (seqno) - Still need to add information to check if the database is corrupted or not.

	Example of result:

		cat /mnt/state/var/lib/mysql/grastate.dat

		GALERA saved state
		version: 2.1
		uuid: 98414b8c-661a-11e4-945b-5f36f0cd94d6
		seqno: 959325

6. In the controller with the higher seqno execute the command "/etc/init.d/mysql bootstrap-pxc"

7. Connect to the other controllers and normally start MySQL (/etc/init.d/mysql start)

8. When all nodes joined the cluster execute "os-refresh-config" in all the overcloud nodes, one each time to restart all the services and finish the startup.

9. Start Swift0 and 1 Nodes

	Wait the server start up and stabilize.

10. Start VSA Nodes

	Wait the server start up and stabilize.

11. Start Compute Nodes when everything else is running

	Wait the server start up and stabilize the instances should start automatically.
-->


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----