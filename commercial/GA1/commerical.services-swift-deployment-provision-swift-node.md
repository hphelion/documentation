---
layout: default
title: "HP Helion OpenStack&#174; Object Operations Service Overview"
permalink: /helion/openstack/services/swift/provision-nodes/
product: commercial.ga
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.0
product-version3: HP Helion OpenStack 1.0.1
product-version4: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Keshava HP, Binamra S

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/openstack/services/object/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href=" /helion/openstack/services/swift/deployment/"> NEXT &#9654</a> </p>-->


# HP Helion 1.0 OpenStack&#174;: Provisioning Swift Node(s) 

This page describes the procedure to provision scale-out Swift nodes. 
<!---
**Caution**: Do not provision proxy and scale-out object nodes together as the requirements for each are different. It is recommended that you use HP DL380 or HP SL230 servers for Proxy nodes and SL4540 servers for scale-out object storage nodes. --->

* [Prerequisites](#Preq)
* [Add a new physical server](#adding-physical-server-for-scale-out-Swift) 
* [Provision the Swift node](#provision-swift-node)
* [Verify the node deployment](#verify-swift-node-deployment) 

##Prerequisites {#Preq}

A HP Helion OpenStack&#174; cloud must be deployed. This ensures that the Starter Swift nodes are installed and functional as they are part of the default HP Helion OpenStack cloud deployment.

You can check the health of the starter nodes using the following command. All nodes should be in **ACTIVE** status and the power state should be **Running**.

	# nova list

##Adding physical server for scale-out Swift {#adding-physical-server-for-scale-out-Swift}

You must add a server to the cloud inventory to handle the increased number of nodes. 

Perform the following steps to add a physical server:

1. Get the server details. For HP servers you can use **iLO** to gather the required information.
	- User name
	- Password
	- RAM
	- CPU
	- Disk capacity
	- MAC address

2. Log in to the seed cloud. 

		# ssh root@<seed IP address> 

3. When prompted for host authentication, type **yes** to allow the ssh connection to proceed.

4. Add server details in the ***baremetal.csv*** configuration file in the following format and upload the file to `/root`.

		<mac_address>,<ipmi_user>,<ipmi_password>,<ipmi_address>,<no_of_cpus>,<memory_MB>,<diskspace_GB>

	**Notes**: 

	- There must be one entry in this file for each baremetal system you intend to install.
	- The first entry is used for the undercloud.
	- The second entry is the node with the weakest  (lowest) specifications (CPU/RAM/Disk size) of nodes in the overcloud.

	The following sample displays the `baremetal.csv` configuration file after adding server details.

		E8:39:35:2B:FB:3E,Administrator,gone2far,10.1.192.33,12,73728,70
		E4:11:5B:B7:AD:CE,Administrator,gone2far,10.1.192.34,12,73728,70

5. Log in to the undercloud. 

		# ssh heat-admin@<undercloud IP address> 

6. Add the server details to the ironic database using the following ***ironic*** command:

 		# ironic node-create -d pxe_ipmitool -p cpus=<value> -p memory_mb=<value> -p local_gb=<value> -p cpu_arch=<value> -i ipmi_address=<IP address> -i ipmi_username=<admin user name> -i ipmi_password=<password> 

	The following sample displays the ironic database with the new server details:

		+--------------+-----------------------------------------------------------------------+
		| Property     | Value                                                                 |
		+--------------+-----------------------------------------------------------------------+
		| uuid         | 08623d52-31cc-4d47-bb29-ecf34a59019b                                  |
		| driver_info  | {u'ipmi_address': u'10.1.192.33', u'ipmi_username': u'Administrator', |
		|              | u'ipmi_password': u'gone2far'}                                        |
		| extra        | {}                                                                    |
		| driver       | pxe_ipmitool                                                          |
		| chassis_uuid | None                                                                  |
		| properties   | {u'memory_mb': u'73728', u'cpu_arch': u'amd64', u'local_gb': u'70',   |
		|              | u'cpus': u'12'}                                                       |
		+--------------+-----------------------------------------------------------------------+
7. Create the port, and enter the MAC address and node ID  using the following ironic command: 
 	
		# ironic port-create -a $MAC -n $NODE_ID


	The following sample displays the output of the above command: 
		
		+-----------+--------------------------------------+
		| Property  | Value                                |
		+-----------+--------------------------------------+
		| node_uuid | 08623d52-31cc-4d47-bb29-ecf34a59019b |
		| extra     | {}                                   |
		| uuid      | 1c5c5c54-bb3e-4883-8ebe-ba24e7f3d159 |
		| address   | e8:39:35:2b:fb:3e                    |
		+-----------+--------------------------------------+	

 
8. Verify the successful registration of a new physical server.

		# ironic node-list

 	The newly created server should appear in the list.

##Provision Swift node {#provision-swift-node}

**Caution**: Do not provision proxy and scale-out object nodes together. The requirements are different for proxy nodes and scale-out object nodes. It is recommended that you use HP DL380 or HP SL230 servers for Proxy nodes and SL4540 servers for scale-out Object storage nodes. 

Perform the following steps to provision the Swift node:

1. Log in to the seed cloud.

		# ssh root@<Seed IP address>
		

2. Set the following variables in the environment variables file to configure the following values:

		"so_swift_storage_scale":<number of object servers>,
		"so_swift_proxy_scale":<number of proxy servers>,
<!--
3.Set the following variables **overcloud-config.json*** file to configure the following values

		so_swift_storage_scale: <number of object servers>,
		so_swift_proxy_scale: <number of proxy servers>, --->

	
 **Note**: While deploying a scale-out **proxy** node ensure that the value of `so_swift_storage_scale` is unchanged. While deploying a scale-out **object** node ensure that the value of `so_swift_proxy_scale` is unchanged.

3.Source the environment variables file created during initial installation.

	# source tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh tripleo/configs/<environment variables file name>

For example:

	# source tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh tripleo/configs/kvm-custom-ips.json

4.Run the installer script to update the cloud.

	# bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --update-overcloud |& tee update_cloud.log

## Verify Swift node deployment {#verify-swift-node-deployment}
Verify that the new nodes were created and are functioning properly using the following commands:

1. Log in to the undercloud from the seed cloud.

		# ssh heat-admin@<undercloud IP address> 

2. List the available Swift nodes.

		# nova list

	It displays available Swift nodes including the newly added node(s).


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
