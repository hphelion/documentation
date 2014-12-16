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

If your datacenter had a power outage and the HP Helion OpenStack cloud systems experiences a non-graceful shutdown, you must restart the server in a specific order and execute some specific manual commands to bring back the overcloud controller cluster.

### Start the seed cloud host

1. Re-create the bridge configuration – I do not know if someone already have this documented. waiting for Tom Hancock information

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

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----