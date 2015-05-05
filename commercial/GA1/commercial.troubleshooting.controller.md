---
layout: default
title: "HP Helion OpenStack&#174; 1.1: Troubleshooting the Controller Nodes"
permalink: /helion/openstack/services/troubleshooting/controller/
product: commercial.ga
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
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--

<p style="font-size: small;"> <a href="/helion/openstack/services/object/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/reporting/overview/"> NEXT &#9654</a> </p> -->

# HP Helion OpenStack&#174; 1.1: Troubleshooting the Controller Nodes

HP Helion OpenStack&#174; is an OpenStack technology coupled with a version of Linux&#174; provided by HP. This topic describes all the known issues that you might encounter. To help you resolve these issues, we have provided possible solutions.

- [Heat Stack Updates Take 30+ Minutes](#foreverupdate)
<!-- [After Updating, Cinder Create and Backups Fail](#failcinder)-->

<hr />
## Heat Stack Updates Take 30+ Minutes {#foreverupdate}

**System Behavior/Message:**

When [Replacing a Failed Overcloud Controller](/helion/openstack/removing/failedovercloud/), a Heat stack-update appears to be taking a long time (30 minutes or longer).

**Solution**

Identify which resource is updating: From the seed, run following command to get an indication of which nodes to look at.

	heat resource-list overcloud-ce-controller | grep -v -i complete

**View Logs** 

1. On the controller node, look at the `/var/log/upstart/os-collect-config.log` for errors. Error messages for `os-refresh-config` are the most likely to indicate what the problem is.

	* If the `waiting on os-svc-restart -n rabbitmq-server` message appears in the log then execute the following command.

		sudo pkill -u rabbitmq
		sudo rm -rf /mnt/state/var/lib/rabbitmq
		sudo rm -rf /mnt/state/var/log/rabbitmq
		sudo os-refresh-config
		ironic port-create --address <MAC> --node_uuid <UUID>

	**Note:** If you see the following error after runing` os-refresh-config`, re-run the command.

		ERROR: os-refresh-config:Could not lock /var/run/os-refresh-config.lock. [Errno 11] Resource temporarily unavailable.

	* After adding back controller0, you see that controller1 is the only node in the cluster, and other nodes are taking a long time to join the cluster, run the following command on the controllers to show cluster status:

		sudo rabbitmqctl cluster_status

	If the cluster name is not `controller0`, run the following command to add the node to the `controller0` cluster:

		sudo rabbitmqctl stop_app
		sudo rabbitmqctl forget_cluster_node <cluster node name>
		sudo rabbitmqctl start_app
		sudo rabbitmqctl join_cluster_node <controller0 clustername>
		sudo os-refresh-config

2. On the seed node, verify the logs in `/var/log/` directories, especially those in the `heat`, `nova` and `ironic` subdirectories respectively.

	sudo tail -f /var/log/upstart/os-collect-config.log


<!-- ## After Updating, Cinder Create and Backups Fail {#failcinder}

After updating to HP Helion OpenStack 1.1, Cinder [backup](#backupfail) and Cinder [create volume from image](#volumefail) (bootable volume) fail. 

This indicates that ISCSI authentication is failing on controller0. The work-around is to migrate the cinder-volume service to another node and then stop the Cinder Backup service on controller0.

###Fails to Create Volume {#volumefail}

For example, the following command resulted in a volume with the status 'error'

	cinder create --image-id eeecc4aa-8a99-447d-848f-c40f4af0d606 --availability-zone nova --display-name bv_deb_001 --display_description bv_deb_001 20
	+---------------------+--------------------------------------+
	|       Property      |                Value                 |
	+---------------------+--------------------------------------+
	|     attachments     |                  []                  |
	|  availability_zone  |                 nova                 |
	|       bootable      |                false                 |
	|      created_at     |      2015-02-21T19:44:20.394735      |
	| display_description |              bv_deb_001              |
	|     display_name    |              bv_deb_001              |
	|      encrypted      |                False                 |
	|          id         | 0260a9e1-2e4a-444f-81d7-867f63f23fe9 |
	|       image_id      | eeecc4aa-8a99-447d-848f-c40f4af0d606 |
	|       metadata      |                  {}                  |
	|         size        |                  20                  |
	|     snapshot_id     |                 None                 |
	|     source_volid    |                 None                 |
	|        status       |               creating               |
	|     volume_type     |                 None                 |
	+---------------------+--------------------------------------+
	
	$ cinder list
	+--------------------------------------+--------+--------------+------+-------------+----------+-------------+
	|                  ID                  | Status | Display Name | Size | Volume Type | Bootable | Attached to |
	+--------------------------------------+--------+--------------+------+-------------+----------+-------------+
	| 0260a9e1-2e4a-444f-81d7-867f63f23fe9 | error  |  bv_deb_001  |  20  |     None    |  false   |             |
	+--------------------------------------+--------+--------------+------+-------------+----------+-------------+

If this error message occurs, **confirm** that the cause is an ISCSI error.

1. Search for the following string in */var/log/cinder/cinder-volume.log* on controller0:

		grep 'Failed to copy image <image-id> to volume: <volume-id>, error: iscsiadm: No session found.' /var/log/cinder/cinder-volume.log
		2015-02-23 13:46:01.415 21650 ERROR cinder.volume.flows.manager.create_volume [req-918f993f-5456-4eba-a266-67a638e9aa99 9f5ec59efa57483aad14b20378091195 c4b1111b613c4454a4cb3101ac420f54 - - -] Failed to copy image eeecc4aa-8a99-447d-848f-c40f4af0d606 to volume: 0260a9e1-2e4a-444f-81d7-867f63f23fe9, error: iscsiadm: No session found.

2. If the string is found, [failover the cinder-volume manager](/helion/openstack/high-availability/#cinder-volume) from controller0 to controller1. 
3. Stop the cinder-volume service on controller0.

		sudo service cinder-volume stop
		sudo os-svc-enable-upstart cinder-volume disable


4. Start the cinder-volume service on controller1.
 
		sudo os-svc-enable-upstart cinder-volume enable
		sudo service cinder-volume start

###Backup Fails {#backupfail}

In the case of Cinder volume backups, the following command may result in a volume backup with the status 'error'

	cinder backup-create --display-name test10-backup001 dce6491b-87b9-4ccf-89bf-d38540a72
	+-----------+--------------------------------------+
	|  Property |                Value                 |
	+-----------+--------------------------------------+
	|     id    | a4ae0286-ba48-4d28-a6b2-4a0022c1f46b |
	|    name   |           test10-backup001           |
	| volume_id | dce6491b-87b9-4ccf-89bf-d38540a72580 |
	+-----------+--------------------------------------+
	
	cinder backup-list
	+--------------------------------------+--------------------------------------+-----------+------------------+------+--------------+---------------+
	|                  ID                  |              Volume ID               |   Status  |       Name       | Size | Object Count |   Container   |
	+--------------------------------------+--------------------------------------+-----------+------------------+------+--------------+---------------+
	| a4ae0286-ba48-4d28-a6b2-4a0022c1f46b | dce6491b-87b9-4ccf-89bf-d38540a72580 |   error   | test10-backup001 |  10  |     None     |      None     |
	+--------------------------------------+--------------------------------------+-----------+------------------+------+--------------+---------------+
	

If this error occurs, **confirm** that the cause is an ISCSI error.

1. Search the /var/log/cinder/cinder-backup.log on **each** of the controller nodes.

		grep 'Unexpected error while running command' /var/log/cinder/cinder-backup.log | grep <volume-id> | grep 'iscsiadm: No session found'

2. If you find that the error is present on a controller node, stop the cinder-backup service on that node.
	
		sudo service cinder-backup stop

<hr />
-->
<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593;</a>


