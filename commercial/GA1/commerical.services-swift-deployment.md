---
layout: default
title: "HP Helion OpenStack&#174; Object Operations Service Overview"
permalink: /helion/openstack/ga/services/swift/deployment/
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



### Procedure to deploy scale-out Swift nodes with HP Helion OpenStack 

This section describes the procedure for the deployment of scale-out Swift nodes.

1. [Prerequisite](#preq)
2. [Adding physical nodes for scale-out Swift](#add-physical-nodes)
3. [Deploying Swift nodes for scale-out](#deploy-scaleout-swift)
4. [Create ring](#create-ring)
5. [Update the storage policy for scale-out Swift](#update-storage-scaleout-swift)
6. [Verify new scale-out storage policy after the cloud update](#verify)
7. [Swift-proxy nodes with HA proxy](#ha-swift)

####Prerequisites {#preq}

The cloud is successfully deployed and has the following: 

* Seed
* Undercloud
* Overcloud 
* Two Swift nodes


####Adding physical nodes for scale-out Swift {#add-physical-nodes}

To scale-out Swift you must add physical node using ironic command. Perform the following steps to add a physical nodes:

1. Login to Undercloud 

		ssh heat-admin<Undercloud IP address> 

2. Add nodes using the following ironic command:

 		ironic node-create -d pxe_ipmitool <-p cpus=<value> -p memory_mb=<value> -p local_gb=<value> -p cpu_arch=<value> -i ipmi_address=<IP address> -i ipmi_username=<admin user name> -i ipmi_password=<password> 

For example:

 -p cpus=18 -p memory&#095;mb=78000 -p local&#095;gb=500 -p cpu&#095;arch=amd64 -i ipmi&#095;address=10.10.10.10 -i ipmi&#095;username=admin -i ipmi&#095;password=password


3.Create port, enter MAC address and Node ID  using the following ironic command: 
 	
 		 ironic create-port -a $MAC -n $NODE_ID
 
4.Enter `ironic node-list` to verify the successful registration of the baremetal node.


####Deploying Swift nodes for scale-out {#deploy-scaleout-swift}

Perform the following steps to deploy scale-out Swift nodes:

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


4.vi `overcloud-config.json` to edit  the following values as per your requirement:
 
 
	* so&#095;swift_storage&#095;scale

 	* so&#095;swift&#095;proxy&#095;scale

5.Enter the following command to source the `overcloud_config.json`  for the new values

		source /root/tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh /root/overcloud-config.json

6.Comment out the following line to ignore ping test 


		vi /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh
	
		###
	
		if [ "$SKIP_INSTALL_OVERCLOUD" != "1" ] ; then
	
	    echo "HP - configuring overcloud - $(date)"
	
		#    hp_ced_validate_ip ping -s $FLOATING_START -e $FLOATING_END
	
7.Run the installer script to update the cloud

		bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --skip-install-seed --skip-install-undercloud 2>&1 | tee update.log

	The cloud updates with the new nodes on successful operation

8.Once the cloud is successfully updated with the new nodes, login to the undercloud 
    
		ssh heat-admin<Undercloud IP address> 

9.Source stack RC using the following command:

     # Source stackrc 

10.Use the following command to list the available Swift nodes
    
     ringos  list-swift-nodes

It will list all the available nodes - two starter swift nodes, object nodes, and proxy nodes. For more information on ringos see [pyringos]( /helion/openstack/GA1/services/object/pyringos/)

For example: <img src="media/swift_deployment-pyriongos-all-nodes.png"/>


11.(Optional) If you want to list only Object nodes, enter the following command

	ringos list-swift-nodes -t object

12.(Optional) If you want to list only Proxy nodes, enter the following command

	ringos list-swift-nodes -t proxy

13.List the disk available on nodes

	ringos list-disks -n <IP address> -u heat-admin
 
For example:The available disk on the node **192.0.2.29**  will be displayed as follows:

<img src="media/swift_deployment-pyriongos-lists-disk.png"/>

14.Format disk on each node based on your configuration

	ringos format-disks -n <IP address of the node> -u heat-admin -d all 

##Create ring {#create-ring}

Once the disk is formatted you can create a new object-1 ring. This ring is created for the scale-out Swift and which is independent of starter Swift

The following attributes are recommended for creating a ring:


<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th>Attributes</th>
	<th><center>Definition</center></th>
    <th><center>Recommendation</center></th>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Zone</b></td>
	<td>Defines single points of failure within your cluster. </td>
    <td> Three zones</td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Replica Count</b></td>
	<td>Defines number of copy of objects.</td>
    <td> Use three as replica count</td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Part Power</b></td>
	<td>Defines the capacity of your storage cluster.</td>
    <td>Use 20 assuming average available drive capacity as 1-3 TB.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Min part hour</b></td>
	<td>Defines period a replication has to copy data. </td>
    <td> 24 (hour)</td>
</tr>
</table>

1.Create a directory `ring-building` 

	mkdir -p /root/ring-building
	cd /root/ring-building

Now based on the configuration and your hard drive capacity you can choose the number of zones, the partition power and regions. 

Once scale-out ring is deployed the following attributes cannot be changed:

* part&#095;power
* replica count ( as 3 is an optimal and recommend value)

 

3.Create a ring based part&#095;power, replicas, and min&#095;part&#095;hours.

	ringos create-ring -f /root/ring-building/object-1.builder -p <value> -r <value> -m <value>

In the following example, we use a single region with 3 zones with each of these 3 nodes in one zone each partition power =10, replicas =3, min&#095;part&#095;hours =1

	ringos create-ring -f /root/ring-building/object-1.builder -p 10 -r 3 -m 1

A ring will be created as shown below:

	ring /root/ring-building/object-1.builder


4.Add disk to the ring

	ringos add-disk-to-ring -f /root/ring-building/object-1.builder -i  <Node IP address> -p  <value> -d <value> -w <value> -r <value> -z <value>

In the following example we are adding disk of node(**192.0.2.29**) to zone 1:

	ringos add-disk-to-ring -f /root/ring-building/object-1.builder -i 192.0.2.29 -p 6000 -d a1410063335 -w 100 -r 1 -z 1
	Added disk 192.0.2.29:a1410063335 to ring

**Note:** Use format-disks output to identify nodes, disk and disk labels.

5.Verify the contents of `object-1.builder` file to ensure that it meets your required configuration.

	ringos view-ring -f /root/ring-building/object-1.builder

6.Rebalance the ring using the following command:

	ringos rebalance-ring -f /root/ring-building/object-1.builder

This will generate a **object-1.ring.gz** file.

7.Verify the content `object-1.builder` file after rebalancing the ring.

	ringos view-ring -f /root/ring-building/object-1.builder

8.List all the rings from either of the started Swift nodes. 

	ringos list-swift-nodes -t starter

**Note:** Rings on the starter Swift nodes are identical. 

9.Get all the rings from either of the starter nodes.

	rsync -qzp --rsync-path="sudo rsync" heat-admin@<IP address of starter node>:/etc/swift/object.ring.gz /root/ring-building/
	rsync -qzp --rsync-path="sudo rsync" heat-admin@<IP address of starter node>:/etc/swift/account.ring.gz /root/ring-building/
	rsync -qzp --rsync-path="sudo rsync" heat-admin@<IP address of starter node>:/etc/swift/container.ring.gz /root/ring-building/

10.List all the swift nodes

	ringos list-swift-nodes –t all
 
11.Copy the generated object-1.ring.gz with the ring files in step 11 to all nodes. This steps should be performed with all the nodes so that all the nodes are in sync.

	ringos copy-ring -s /root/ring-building/\*.ring.gz -n <IP address of Swift node>


12.Press **yes** when asked to authenticate node.  

The sample of authentication node will be displayed as the sample below:

	The authenticity of host '192.0.2.29 (192.0.2.29)' can't be established.
	ECDSA key fingerprint is 8a:eb:b7:66:3b:5f:fa:d6:d1:49:80:1a:a7:90:79:20.
	Are you sure you want to continue connecting (yes/no)? yes
	Copied ring /root/ring-building/object-1.ring.gz onto 192.0.2.29

**Note**: The system may escape the authentication of node sometimes.

##Update the storage policy for scale-out Swift{#update-storage-scaleout-swift}

1. Login to seed VM

		ssh root@<IP address>

2. Enter `cat/root/tripleo/hp_passthrough/overcloud_swift_conf.json`

The Overcloud configuration file will be displayed as the sample below:

		{"swift":
	  {"config":
	    [
	      {"section": "storage-policy:1",
	       "values":
	        [
	          {"option": "name",
	           "value": "ScaleOut"
	          },
	          {"option": "default",
	           "value": "yes"
	          }
	        ]
	      }
	    ]
	  }



3.Change the default value of existing Policy-0 to **no** and replace the  `overcloud_swift_conf.json` file to set the storage policy to 1 for scale-out Swift.

	{"swift":
	  {"config":
	    [ 
	      {"section": "storage-policy:0",
	       "values":
	        [ 
	          {"option": "name",
	           "value": "Policy-0"
	          },
	          {"option": "default",
	           "value": "no"
	          }
	        ]
	      },
	      {"section": "storage-policy:1",
	       "values":
	        [
	          {"option": "name",
	           "value": "ScaleOut"
	          },
	          {"option": "default",
	           "value": "yes"
	          }
	        ]
	      }
	    ]
	  }
	}

4.Run the installer script to update the cloud.

	bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --skip-install-seed --skip-install-undercloud 2>&1 | tee update.log


###Verify new scale-out storage policy{#verify}

1. Login to Swift storage node
	
		 # swift stat

2. Enter `cat /etc/swift/swift.conf` to ensure that a new policy is updated and starter Swift node is set to 0.

## Swift-proxy nodes with HA proxy {#ha-swift}

1. After creation of Proxy node, list the Proxy IPs.

		ringos list-swift-nodes -t proxy

A list of Proxy nodes will be displayed as shown in the sample below:
<br>
<img src="media/swift_node_ha-proxy.png"/>

2.Edit `swift-proxy.cfg` on each of the controller node. 

	 /etc/haproxy/manual/swift-proxy.cfg

3.Add the following content in the `swift-proxy.cfg` file.

	  listen scale_swift_proxy
	  bind 192.0.2.21:8080
	  server ov--ce-soswiftproxy1-SwiftScaleoutProxy1-<hostname><>IP address of Proxy node>:8080 check inter 2000 rise 2 fall 5 

**Note**:You will have the number of "server" lines equal to number of Swift proxies you have setup.

4.Restart HA proxy on all the nodes

	service haproxy restart

Thus the Swift-Proxies are successfully enabled with HAproxy. 
 
<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*