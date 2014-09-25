---
layout: default
title: "HP Helion OpenStack&#174; Add New Proxy Node"
permalink: /helion/openstack/ga/services/swift/deployment/add-proxy-node/
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
<p style="font-size: small;"> <a href=" /helion/openstack/ga/services/object/overview/scale-out-swift/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/overview/"> NEXT &#9654</a> </p>-->


#Add New Proxy Node

You can add proxy node to store account, container, and object-ring.


##Prerequisite

1. HP Helion OpenStack cloud is successfully deployed and has the following: 

	* Seed
	* Undercloud
	* Overcloud 
	* Two Swift nodes (which is functional)
2. Scale-out object-ring:1 is deployed



##Deploying proxy node

Perform the following steps to add proxy node:

1. Login to seed 

		ssh root@<IP address>

2. Copy `/root/tripleo/tripleo-incubator/scripts/ee-config.json` to `/root/overcloud-config.json`

		 cp /root/tripleo/tripleo-incubator/scripts/ee-config.json /root/overcloud-config.json

3. Enter `cat /root/overcloud-config.json` to view the content in the `overcloud-config.json` file.

The Overcloud configuration file will be displayed as the sample below:

	{
	
	    "cloud_type": "KVM",
	
	    "compute_scale": 1,
	
	    "vsa_scale": 0,
	
	    "vsa_ao_scale": 0,
	
	    "so_swift_storage_scale": 3,
	
	    "so_swift_proxy_scale": 0,
	
	    "bridge_interface": "eth0",
	
	    "ntp": {
	
	           "overcloud_server": "",
	
	           "undercloud_server": ""
	
	    }
	
	}

4.vi `overcloud-config.json` to updated value for so&#095;swift_proxy&#095scale.

For more information refer [Provisioning Swift node]( /helion/openstack/ga/services/swift/provision-nodes/)

5.Enter the following command to source the `overcloud_config.json`  for the new values

		source /root/tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh /root/overcloud-config.json

6.Run the installer script to update the cloud

		bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --skip-install-seed --skip-install-undercloud 2>&1 | tee update.log

	The cloud updates with the new nodes on successful operation.

##Add disk to account and container ring

1. Login to Undercloud 

		ssh heat-admin<Undercloud IP address> 
		#sudo -i

2. Change the directory to ring builder

		#cd /root/ring-building

3. List the builder file

		ls

	Identify `account.builder` and `container.builder` files in the ring builder directory.

3. List the Swift node

		ringos list-swift-nodes -t proxy

4. List the disk on the node

		ringos list-disks -n <NODE IP> -u heat-admin

5. Format a disk

		ringos format-disks -n <NODE IP> -u heat-admin -d <disk>

	**Note**: You can format all the disk with the single command (--all).

6. List all the Swift nodes. Ensure to capture the list of the nodes.

		ringos list-swift-nodes -t all

7. Add formatted disk to account and container ring

		ringos add-disk-to-ring -f /root/ring-building/account.builder -i <IP address of Swift node> -p value -d <value> -w <weight> -r <region> -z <zone>
		ringos add-disk-to-ring -f /root/ring-building/container.builder -i <IP address of Swift node> -p value -d <value> -w <weight> -r <region> -z <zone>


##Re-balancing account and container rings 

1. Perform the following command to re-balance both the rings.

		ringos rebalance-ring -f /root/ring-building/account.builder
		
		ringos rebalance-ring -f /root/ring-building/container.builder	

	This will generate a `account.ring.gz`  and `container.ring.gz` files.

2. Verify the content in`account builder` and `container.builder` files after re-balancing the ring.

		ringos view-ring -f /root/ring-building/account.builder
	
		ringos view-ring -f /root/ring-building/container.builder


##Copying account, container, object-ring:0 and object-ring:1 to all nodes

1. List all the Swift nodes. 

		ringos list-swift-nodes -t  all
 
2. Copy account, container, object-0 , and generated `account.ring.gz`  and `container.ring.gz` files files to new nodes. 

		ringos copy-ring -s /root/ring-building/\*.ring.gz -n <IP address of Swift node>


3. Press **yes** when asked to authenticate node.  

The sample of authentication node will be displayed as follows:

	The authenticity of host '192.0.2.29 (192.0.2.29)' can't be established.
	ECDSA key fingerprint is 8a:eb:b7:66:3b:5f:fa:d6:d1:49:80:1a:a7:90:79:20.
	Are you sure you want to continue connecting (yes/no)? yes
	Copied ring /root/ring-building/object-1.ring.gz onto 192.0.2.29

##Update load balancer with new proxy nodes
 
1. After creation of Proxy node, list the Proxy IPs.

		ringos list-swift-nodes -t proxy

A list of Proxy nodes will be displayed as shown in the sample below:
<br>
<img src="media/swift_node_ha-proxy.png"/>

2.Edit `swift-proxy.cfg` on each of the controller nodes. 

	 /etc/haproxy/manual/swift-proxy.cfg

3.Add the following content in the `swift-proxy.cfg` file.

	  listen scale_swift_proxy
	  bind 192.0.2.21:8080
	  server ov--ce-soswiftproxy1-SwiftScaleoutProxy1-<hostname><>IP address of Proxy node>:8080 check inter 2000 rise 2 fall 5 

**Note**:You will have the number of "server" lines equal to number of Swift proxies you have setup.

4.Restart HA proxy service on all these nodes.

	service haproxy restart

Thus the Swift-Proxies are successfully enabled with HA proxy. 

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*