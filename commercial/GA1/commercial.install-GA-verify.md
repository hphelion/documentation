---
layout: default
title: "HP Helion OpenStack: Verifying your installation"
permalink: /helion/openstack/install/verify/
product: commercial.ga

---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/openstack/install-beta/prereqs/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/vsa/">NEXT &#9654;</a> </p>
-->

# HP Helion OpenStack&reg;: Verifying your installation

Once your installation is complete, you should ensure you can connect to your HP Helion OpenStack baremetal cloud.


### Connect to the undercloud Horizon console {#connectconsoleunder}

Make sure you can access the undercloud Horizon dashboard. To do this, follow the steps below:

1. From the seed, run the following command.

		. /root/stackrc

2. Assign the undercloud IP address to a variable.

		UNDERCLOUD_IP=$(nova list | awk '/\| undercloud/{print $12}' | sed 's/ctlplane=//'); echo $UNDERCLOUD_IP

3. Determine the undercloud IP from the output of step 2 using the following command. It is in the last line returned.
  
		echo ${UNDERCLOUD_IP}

4. Obtain the undercloud admin password using the following command:

		UNDERCLOUD_ADMIN_PASSWORD=$(grep UNDERCLOUD_ADMIN_PASSWORD /root/tripleo/tripleo-undercloud-passwords | sed 's/UNDERCLOUD_ADMIN_PASSWORD=//'); echo $UNDERCLOUD_ADMIN_PASSWORD

5. From your install system, open a web browser and point to:

		http://<undercloud_IP>

6. Log in as user 'admin' with the admin password from step 4.

### Connect to the overcloud Horizon console {#connectconsoleover}

Make sure you can access the overcloud Horizon dashboard. To do this, follow the steps below:

1. From the seed, export the overcloud passwords:

		. /root/tripleo/tripleo-overcloud-passwords

2. Export the overcloud users:

		TE_DATAFILE=/root/tripleo/ce_env.json . /root/tripleo/tripleo-incubator/overcloudrc

3. Assign the overcloud IP address to a variable:

		OVERCLOUD_IP=$(jq '.overcloud.endpointhost' /root/tripleo/ce_env.json); echo ${OVERCLOUD_IP}

	<!-- Remove per Divaker
	4. With the IP address and root password, log in as the main user, root using the following command 

		ssh root@${DEMO_IP}

	If the optional second network was configured, the overcloud controller IP is the value set for `NeutronPublicInterfaceIP`. -->

4.	Obtain the overcloud admin password using the following command:

		OVERCLOUD_ADMIN_PASSWORD=$(grep OVERCLOUD_ADMIN_PASSWORD /root/tripleo/tripleo-overcloud-passwords | sed 's/OVERCLOUD_ADMIN_PASSWORD=//'); echo $OVERCLOUD_ADMIN_PASSWORD

5. From your install system, open a web browser and point to:

		http://<overcloud_IP>/

6. Log in to the overcloud as user `admin` with the password you obtained from the `/root/tripleo/tripleo-overcloud-passwords` file in step 4.

	**Note:** If you are unable to connect to the Horizon console, check your proxy settings to ensure that access to the controller VM is successfully redirected through a proxy.

### Connect to the demo VM ### {#connectvm}

From the seed cloud host, you can connect to the demo VM using the following steps:

<!-- Maybe not needed per Chris Cannon
1. Export the overcloud passwords:

	`. /root/tripleo/tripleo-overcloud-passwords`

2. Export the overcloud users:

	`TE_DATAFILE=/root/tripleo/ce_env.json . /root/tripleo/tripleo-incubator/overcloudrc-user`

3. Verify you can view the nova instances:

	`nova list`

4. Assign the demo VM IP address to a variable:

	`DEMO_IP=$(nova list | grep " demo " | awk ' { print $13 } ')`
-->
5. Connect to the demo VM using the IP address you obtained from the Horizon console:

	`ssh debian@${DEMO_IP}`

	**Note:** It might take a few minutes for the demo vm to become available using ssh after finishing the installation.

	If the prompt changes to `debian@demo`, you have successfully connected to the demo VM.

6. Before proceeding, enter `exit` to disconnect from the demo VM.


### Connect to the monitoring interface {#connectmonitor}

1. Retrieve the undercloud IP by entering the following commands on the seed VM: 

		. /root/stackrc
		UNDERCLOUD_IP=$(nova list | grep "undercloud" | awk ' { print $12 } ' | sed s/ctlplane=// )
		echo $UNDERCLOUD_IP

	Note: The `echo $UNDERCLOUD_IP` command prints the IP address of the undercloud to the screen.

2. Open a web browser and point to:

		http://<undercloud IP>/icinga/

3. Log in as user `icingaadmin` with the password `icingaadmin`.

### Connect to the logging interface {#connectlogging}

1. Retrieve the undercloud IP by entering the following commands on the seed VM: 

		. /root/stackrc
		UNDERCLOUD_IP=$(nova list | grep "undercloud" | awk ' { print $12 } ' | sed s/ctlplane=// )
		echo $UNDERCLOUD_IP

	Note: The `echo $UNDERCLOUD_IP` command prints the IP address of the undercloud to the screen.

2. Obtain the logging interface password using the following command:

		UNDERCLOUD_KIBANA_PASSWORD=$(grep UNDERCLOUD_KIBANA_PASSWORD /root/tripleo/tripleo-undercloud-passwords | sed 's/UNDERCLOUD_ KIBANA _PASSWORD=//'); echo $UNDERCLOUD_ KIBANA _PASSWORD

3. Open a web browser and point to:

		http://<undercloud IP>:81/
 

4. Log in as user `kibana` and the password from Step 4.


----
