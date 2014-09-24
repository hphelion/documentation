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

This page describes the procedure to provision the Swift nodes. It follows the similar procedure to provision all types of Swift node (proxy and object) but you cannot provision both of the nodes together.

* [Prerequisite](#Preq)
* [Adding physical server for scale-out Swift](#adding-physical-server-for-scale-out-Swift) 
* [Provision Swift node](#provision-swift-node)
* [Verify Swift node deployment](#verify-Swift-node-deployment)

##Prerequisite {#Preq}

HP Helion OpenStack cloud is successfully deployed and has the following: 

* Seed
* Undercloud
* Overcloud 
* Two Swift nodes 

Before provisioning swift node(s) ensure that the all nodes are **ACTIVE** and power state must be  **Running**.

You can view the status of the nodes using the following command:

	nova list

##Adding physical server for scale-out Swift {#adding-physical-server-for-scale-out-Swift}

You must add server to the cloud inventory so that you can scale-out Swift nodes. 

Perform the following steps to add physical server for scale-out Swift:

1. Get the server details:

	 a. User name

	b. Password
	
	c. RAM
	
	d. CPU
	
	e. Disk capacity
	
	f. MAC address

	**Note**: For HP server, use iLO to gather the above details.

2. Login to seed VM

		ssh root@<IP addredd of Seed> 

	**Note**: It might take a few moments for the seed VM to become reachable. 

3. When prompted for host authentication, type `yes` to allow the ssh connection to proceed.

4. Add server details in the `baremetal.csv` configuration file  in the following format and upload the file to `/root`.

		<mac_address>,<ipmi_user>,<ipmi_password>,<ipmi_address>,<no_of_cpus>,<memory_MB>,<diskspace_GB>

	**Notes**: 

	- There must be one entry in this file for each baremetal system you intend to install.
	- The first entry is used for the undercloud.
	- The second entry is the node with the lowest-specifications (CPU/RAM/Disk size) node in the overcloud.

	For example, your file should look similar to the following:

		78:e7:d1:22:5d:10,administrator,password,192.168.11.5,12,32768,2048   
		78:e7:d1:22:5d:58,administrator,password,192.168.11.1,8,16384,2048

5. Login to Undercloud 

		ssh heat-admin<Undercloud IP address> 

6. Add server details to ironic database using the following ironic command:

 		ironic node-create -d pxe_ipmitool <-p cpus=<value> -p memory_mb=<value> -p local_gb=<value> -p cpu_arch=<value> -i ipmi_address=<IP address> -i ipmi_username=<admin user name> -i ipmi_password=<password> 

For example:

 -p cpus=18 -p memory&#095;mb=78000 -p local&#095;gb=500 -p cpu&#095;arch=amd64 -i ipmi&#095;address=10.10.10.10 -i ipmi&#095;username=admin -i ipmi&#095;password=password

7.Create port, enter MAC address and Node ID  using the following ironic command: 
 	
 		 ironic create-port -a $MAC -n $NODE_ID
 
8.Enter `ironic node-list` to verify the successful registration of a new physical server.

##Provision Swift node {#provision-swift-node}

**Caution**: Do not provision proxy or scale-out object nodes together. The requirements are different for proxy nodes and scale-out object node. For example: It is recommended to use HP DL380 or HP SL230 servers for proxy nodes and SL4540 servers for scale-out object storage nodes. 

You cannot provision proxy or scale-out object nodes together. For example: If you have 3 SL4540 and 2 SL230 servers and you want to configure scale-out object nodes and proxy nodes together. Also,  all the five servers are added in the inventory in the beginning and you have specified so&#095;swift_storage&#095;scale as 2 and so&#095;swift&#095;proxy&#095;scale  as 1. Now, run the update cloud script to provision node. Three (2+1) nodes are provisioned. But it is not guaranteed whether the proxy servers are deployed on SL230 and object storage nodes are deployed on SL 4540.  To avoid this confusion it is recommended to provision proxy and scale-out object simultaneously.

For example:
<img src ="media/swift_deployment-provison-both-nodes.png/">


**Recommendation**:

It is recommended to follow the below sequence:

i. Add server either proxy or scale-out object to inventory. 

ii. Provision node using update cloud


Perform the following steps to provision Swift node:

1. Login to seed VM

		ssh root@<IP address>

2. Copy `/root/tripleo/tripleo-incubator/scripts/ee-config.json` to `/root/overcloud-config.json`

		 cp /root/tripleo/tripleo-incubator/scripts/ee-config.json /root/overcloud-config.json

3.Enter `cat /root/overcloud-config.json` to view the content in the `overcloud-config.json` file.

The Overcloud configuration file will be displayed as the sample below:

		{
		
		 "cloud_type": "KVM",
		
		 "compute_scale": 1,
		
		 "vsa_scale": 0,
		
		 "vsa_ao_scale": 0,
		
		 "so_swift_storage_scale": 0,
		
		 "so_swift_proxy_scale": 0,
		
		 "bridge_interface": "eth0",
		
		 "ntp": {
		
		 "overcloud_server": "",
		
		 "undercloud_server": ""
		
		 }
		
		}


4.vi `overcloud-config.json` to configure the following values as per your requirement:
 
 
	* so&#095;swift_storage&#095;scale

 	* so&#095;swift&#095;proxy&#095;scale

 
5.Enter the following command to source the `overcloud_config.json`  for the new values

		source /root/tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh /root/overcloud-config.json

6.Run the installer script to update the cloud

		bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --skip-install-seed --skip-install-undercloud 2>&1 | tee update.log

	The cloud updates with the new nodes on successful operation

##Verify Swift node deployment {#verify Swift node deployment}

Ensure the deployment of Swift node using the following commands:

1. Login to underloud

		ssh heat-admin<Undercloud IP address> 

2. List the available Swift nodes

		nova list

It displays available Swift nodes including the newly added node.





<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>





*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*