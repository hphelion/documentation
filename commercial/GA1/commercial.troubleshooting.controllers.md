---
layout: default
title: "HP Helion OpenStack&#174; Troubleshooting Controller Nodes"
permalink: /helion/openstack/services/troubleshooting/controller/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--

<p style="font-size: small;"> <a href="/helion/openstack/services/object/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/reporting/overview/"> NEXT &#9654</a> </p> --->

# HP Helion OpenStack&#174;  Troubleshooting the Controller Nodes

HP Helion OpenStack&#174; is an OpenStack technology coupled with a version of Linux&reg; provided by HP. This topic describes all the known issues that you might encounter. To help you resolve these issues, we have provided possible solutions.

**System Behavior/Message:**

A heat stack-update takes longer time, that is, 30 minutes or longer. 

**Solution**

1. Login to seed

		ssh root@<seed IP>

2. Execute the following command to identify which resource is updating.

		heat resource-list overcloud-ce-controller | grep -v -i complete

**View Logs**

1. On the controller node, execute the following command to view the log errors, especially those running os-refresh-config.

		sudo tail -f /var/log/upstart/os-collect-config

 	If  `os-svc-restart -n rabbitmq-server` message appears in the log then execute the following command


		sudo pkill -u rabbitmq
		sudo rm -rf /mnt/state/var/lib/rabbitmq
		sudo rm -rf /mnt/state/var/log/rabbitmq
		sudo os-refresh-config


	 If the following error occurs while executing os-refresh-config then skip executing `os-refresh-config` or `rm /var/run/os-refresh-config.lock` and `re-run os-refresh-config`.


 		"ERROR: os-refresh-config:Could not lock /var/run/os-refresh-config.lock. [Errno 11] Resource temporarily unavailable."


 	If the controller1 or management controller is the only node in its cluster and waiting for other node to join for a longer time after adding controller0 then execute the following command on controllers to view cluster status:

		sudo rabbitmqctl cluster_status

	Execute the following command to join the controller cluster, if the cluster name is not controller0.

		sudo rabbitmqctl stop_app
		sudo rabbitmqctl forget_cluster_node <cluster node name>
		sudo rabbitmqctl start_app
		sudo rabbitmqctl join_cluster_node <controller0 clustername>
		sudo os-refresh-config



2.  On the seed node, verify the logs in `/var/log/upstart`, especially those from heat, nova, and ironic.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593;</a>


