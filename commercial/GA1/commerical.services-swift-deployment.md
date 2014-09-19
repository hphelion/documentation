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



### Procedure to deploy scale out Swift nodes with Helion 

This section describes the procedure for the deployment of scale out Swift nodes.

####Prerequisites

The cloud is successfully deployed and has the following: 

* Seed
* Undercloud
* Overcloud 
* Two Swift nodes


####Adding physical nodes for scale up Swift

To scale out Swift you must add physical node using ironic command. Perform the following steps to add a physical nodes:

1. Login to Undercloud 

		ssh heat-admin<Undercloud IP address> 

2. Add nodes using the following ironic command:

 		ironic node-create -d pxe_ipmitool <-p cpus=<value> -p memory_mb=<value> -p local_gb=<value> -p cpu_arch=<value> -i ipmi_address=<IP address> -i ipmi_username=<admin user name> -i ipmi_password=<password> 

For example:

 -p cpus=18 -p memory&#095;mb=78000 -p local&#095;gb=500 -p cpu&#095;arch=amd64 -i ipmi&#095;address=10.10.10.10 -i ipmi&#095;username=admin -i ipmi&#095;password=password


3.Create port, enter MAC address and Node ID  using the following ironic command: 
 	
 		 ironic create-port -a $MAC -n $NODE_ID
 
4.Enter `ironic node-list` to verify the successful registration of the baremetal node.


####Deploying Swift nodes for scale out

Perform the following steps to deploy scale out Swift nodes:

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


4. vi `overcloud-config.json` to edit  the following values as per your requirement:
 
 
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

12.(Optional) if you want to list only Proxy nodes, enter the following command

	ringos list-swift-nodes -t proxy

13.List the disk available on nodes

	ringos list-disks -n <IP address> -u heat-admin
 
For example:The available disk on the node **192.0.2.29**  will be displayed as follows:

<img src="media/swift_deployment-pyriongos-lists-disk.png"/>

14.Format disk on each node based on your configuration

	ringos format-disks -n (IP address of the node) -u heat-admin -d all <is this command correct??>
Once the disk is formatted you can create a new object-1 ring. This ring is created for the scaleout Swift and which is independent of starter Swift.

15.Create a directory `ring-building` 

	mkdir -p /root/ring-building
	cd /root/ring-building

Now based on the configuration and your hard drive capacity you can choose the number of zones, the partition power and regions.

16.Create a ring based part&#095;power, replicas, and min&#095;part&#095;hours.

	ringos create-ring -f /root/ring-building/object-1.builder -p <value> -r <value> -m <value>

In the following example , we use a single region with 3 zones with each of these 3 nodes in one zone each partition power =10, replicas =3, min&#095;part&#095;hours =1

	ringos create-ring -f /root/ring-building/object-1.builder -p 10 -r 3 -m 1

A ring will be created as shown below:

	ring /root/ring-building/object-1.builder


17.Add disk to the ring

	ringos add-disk-to-ring -f /root/ring-building/object-1.builder -i  <Node IP address> -p  <value> -d <value> -w <value> -r <value> -z <value>

In the following example we are adding disk of node(**192.0.2.29**) to zone 1:

	ringos add-disk-to-ring -f /root/ring-building/object-1.builder -i 192.0.2.29 -p 6000 -d a1410063335 -w 100 -r 1 -z 1
	Added disk 192.0.2.29:a1410063335 to ring

**Note:** Use format-disks output to identify nodes, disk and disk labels.

18.Verify the contents of `object-1.builder` file to ensure that it meets your required configuration.

	ringos view-ring -f /root/ring-building/object-1.builder

19.Rebalance the ring using the following command:

	ringos rebalance-ring -f /root/ring-building/object-1.builder

This will generate a **object-1.ring.gz** file.

20.Verify the content `object-1.builder` file after rebalancing the ring.

	ringos view-ring -f /root/ring-building/object-1.builder

21.List all the rings from either of the started swift nodes. 

	ringos list-swift-nodes -t starter

**Note:** Rings on the starter Swift nodes are identical. 

22.  

##Verification of the scale-out swift


yet to come

##Update the storage policy for scale out Swift

1. Login to seed VM

		ssh root@<IP address>

2. Enter `cat/root/tripleo/hp_passthrough/overcloud_swift_conf.json`

The Overcloud configuration file will be displayed as the sample below:

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


3. Replace 



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*