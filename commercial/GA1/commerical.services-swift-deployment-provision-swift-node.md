---
layout: default
title: "HP Helion OpenStack&#174; Object Operations Service Overview"
permalink: /helion/openstack/ga/services/swift/provision-nodes/
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
<p style="font-size: small;"> <a href="/helion/openstack/ga/services/object/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href=" /helion/openstack/ga/services/swift/deployment/"> NEXT &#9654</a> </p>-->


#Provision Swift Node(s) 

This page describes the procedure to provision scale-out Swift nodes. All types of Swift nodes (object, proxy) will be provisioned similarly. But you cannot provision both types of nodes together.


* [Prerequisite](#Preq)
* [Adding physical server for scale-out Swift](#adding-physical-server-for-scale-out-Swift) 
* [Provision Swift node](#provision-swift-node)
* [Verify Swift node deployment](#verify-Swift-node-deployment) 

##Prerequisite {#Preq}

* HP Helion OpenStack&#174; is deployed.
* Starter Swift nodes are functional by default as they are part of cloud deployment.

You can check health of starter Swift nodes by nova list command as shown below. All nodes should be in '**ACTIVE**' status and power state should be '**Running**':

	# nova list

##Adding physical server for scale-out Swift {#adding-physical-server-for-scale-out-Swift}

You must add a server to the cloud inventory so that you can scale out Swift nodes. 

Perform the following steps to add physical server for a scale-out Swift:


1. Get the server details:

	a. User name

	b. Password
	
	c. RAM
	
	d. CPU
	
	e. Disk capacity
	
	f. MAC address

	**Note**: For HP servers you can use iLO to gather the above details.


2. Log in to Seed. 

		# ssh root@<Seed IP address> 

3. When prompted for host authentication, type `yes` to allow the ssh connection to proceed.

4. Add server details in the `baremetal.csv` configuration file  in the following format and upload the file to `/root`.

		<mac_address>,<ipmi_user>,<ipmi_password>,<ipmi_address>,<no_of_cpus>,<memory_MB>,<diskspace_GB>

	**Notes**: 

	- There must be one entry in this file for each baremetal system you intend to install.
	- The first entry is used for the Undercloud.
	- The second entry is the node with the lowest specifications (CPU/RAM/Disk size) of nodes in the overcloud.

	The following sample displays the `baremetal.csv` configuration file after adding server details.

		E8:39:35:2B:FB:3E,Administrator,gone2far,10.1.192.33,12,73728,70
		E4:11:5B:B7:AD:CE,Administrator,gone2far,10.1.192.34,12,73728,70


5. Log in to Undercloud from Seed. 

		# ssh heat-admin@<Undercloud IP address> 

6. Add server details to ironic database using the following ironic command:

 		# ironic node-create -d pxe_ipmitool <-p cpus=<value> -p memory_mb=<value> -p local_gb=<value> -p cpu_arch=<value> -i ipmi_address=<IP address> -i ipmi_username=<admin user name> -i ipmi_password=<password> 

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
7.Create port, and enter the MAC address and Node ID  using the following ironic command: 
 	
 		 # ironic create-port -a $MAC -n $NODE_ID


	The following sample displays the output of above command: 
		
		+-----------+--------------------------------------+
		| Property  | Value                                |
		+-----------+--------------------------------------+
		| node_uuid | 08623d52-31cc-4d47-bb29-ecf34a59019b |
		| extra     | {}                                   |
		| uuid      | 1c5c5c54-bb3e-4883-8ebe-ba24e7f3d159 |
		| address   | e8:39:35:2b:fb:3e                    |
		+-----------+--------------------------------------+	

 
8.Verify the successful registration of a new physical server.

	# ironic node-list


##Provision Swift node {#provision-swift-node}

**Caution**: Do not provision proxy and scale-out object nodes together. The requirements are different for proxy nodes and scale-out object nodes. It is recommended that you use HP DL380 or HP SL230 servers for Proxy nodes and SL4540 servers for scale-out Object storage nodes. 


Perform the following steps to provision the Swift node:

1. Log in to Seed.

		# ssh root@<Seed IP address>

2. Copy `ee-config.json` to root home directory.

		 # cp /root/tripleo/tripleo-incubator/scripts/ee-config.json /root/overcloud-config.json

3. Edit the `overcloud-config.json` file to configure the following values as per your requirement:
 
 
	 "so&#95;swift&#95;storage&#95;scale": &lt;number of object servers &gt;  , 
	
	 "so&#95;swift&#95;proxy_scale": &lt;number of proxy servers &gt;  ,

**Note**: While deploying the scale-out proxy node ensure that "so&#095;swift&#095;storage&#095;scale"is unchanged and while deploying the scale-out object node ensure that "so&#095;swift&#095;proxy&#095;scale" is unchanged.
 
4.Enter the following command to source the `overcloud_config.json`  for the new values.

	# source /root/tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh /root/overcloud-config.json

5.Run the installer script to update the cloud.


	# bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --update-overcloud |& tee update_cloud.log


The cloud updates with the new nodes on successful operation.

##Verify Swift node deployment {#verify Swift node deployment}

Ensure the deployment of the Swift node using the following commands:

1. Log in to Underloud from Seed.

		# ssh heat-admin@<Undercloud IP address> 

2. List the available Swift nodes.

		# nova list

It displays available Swift nodes including the newly added node.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
