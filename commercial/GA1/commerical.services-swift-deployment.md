---
layout: default
title: "HP Helion OpenStack&#174; Object Operations Service Overview"
permalink: /helion/openstack/ga/services/swift/deployment-scale-out/
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



# Deploy scale-out Swift Nodes with HP Helion  OpenStack&#174; 

By deploying scale-out Swift you can create storage-policy:1 for object-ring:1, which is used to store the cloud user data. Storage-policy:1 is used to implement object-ring:1 and it adhere to 'no single point of failure' policy. We recommend you to use at least **two** nodes to implement storage-policy:1. Also, you can extend the object storage by adding one or more nodes to object-ring:1 as per your requirement.

This section describes the procedure for the deployment of two extra nodes to the storage policy:1 and no extra proxy node is added. 

Perform the following steps to deploy scale-out object-ring:1: 

1. [Prerequisite](#preq)
2. [Defining ring attributes of object-ring:1](#define-object-ring:1)
2. [Preparing Undercloud to perform Swift cluster management operation(s)](#prepare-undercloudswift)
3. [Deploying scale-out Swift object nodes](#deploying-scale-out-Swift-object-nodes)
4. [Verifying deployed Swift nodes](#verifying-deployed-Swift-nodes)
5. [Preparing disks on Swift nodes](#preparing-disks-on-Swift-nodes)
6. [Creating scale-out object-ring](#creating-scale-out-object-ring)
7. [Copying the rings to all Swift nodes](#copying-the-rings-to-all-Swift-nodes)
8. [Updating the storage policy for scale-out Swift](#update-storage-scaleout-swift)

##Prerequisites {#preq}

The cloud is successfully deployed and has the following: 

* Seed
* Undercloud
* Overcloud 
* Two Swift nodes

## Defining ring attributes of object-ring:1 {#define-object-ring:1}

You should carefully plan the following ring attributes before deployment of object-ring:1. Once the scale-out ring is deployed you cannot change the ring attributes like **part power** and **replica count**. For replica count the recommended and optimal value is 3.


<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th>Attributes</th>
	<th><center>Definition</center></th>
    <th><center>Recommendation</center></th>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Zone</b></td>
	<td>Single point of failure within your cluster. </td>
    <td> Three zones</td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Replica Count</b></td>
	<td>Number of copies of objects.</td>
    <td> Use three as replica count</td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Part Power</b></td>
	<td>The capacity of your storage cluster.</td>
    <td>Use 20 assuming average available drive capacity as 1-3 TB.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Min part hour</b></td>
	<td>Time for the replication to copy data. </td>
    <td> 24 (hour)</td>
</tr>
</table>


**Caution**: You cannot change your part power once you deploy object-ring:1.


##Preparing Undercloud to perform Swift cluster management operation(s) {#prepare-undercloudswift}

Using ringos utility you can add the [provisioned nodes]( /helion/openstack/ga/services/swift/provision-nodes/) to Swift cluster. 

To  perform this operation, it is necessary to enable SSH from Undercloud to Overcloud node. To do that, copy the SSH keys from Seed cloud to Undercloud as mentioned below: 

1.  Login to seed 

		ssh root@<IP address>
 
2. Copy the SSH key from seed cloud to undercloud

		# scp ~/.ssh/id_rsa heat-admin@<Undercloud IP>:/home/heat-admin

2. Login to Overcloud controller

		#ssh heat-admin@<Overcloud IP>
		#sudo -i
		#mv ~heat-admin/id_rsa ~/.ssh/ 


##Deploying scale-out Swift object nodes {#deploying-scale-out-Swift-object-nodes}

It is recommended to deploy scale-out object nodes in a set of 3 (replica count as mentioned above) and allocate each node to one zone.

Before starting the deployment of scale-out object nodes you must configure the `overcloud-config.json` file as shown in the sample below.


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


For more detailed, refer [Provisioning Swift node(s)]( /helion/openstack/ga/services/swift/provision-nodes/)


## Verifying deployed Swift nodes {#verifying-deployed-Swift-nodes}

Perform the following steps to verify the deployment of  object nodes:

1. login to the undercloud 
    
		ssh heat-admin<Undercloud IP address> 

2. Source stack RC using the following command:

     # Source stackrc 
 
3. List the available scale-out swift nodes 

		ringos list-swift-nodes -t object

2. List the disk available on each nodes

		ringos list-disks -n <IP address of Swift node> -u heat-admin
 
For example:The available disk on the node **192.0.2.29**  will be displayed as follows:

<img src="media/swift_deployment-pyriongos-lists-disk.png"/>

You must repeat the above steps for all the swift nodes.

##Preparing disks on Swift nodes{#preparing-disks-on-Swift-nodes}

Once thee Swift nodes are deployed ensure that you format the required disks and mount them before adding disks to Swift cluster. 

Use the following command to format disk:

	ringos format-disks -n <IP addres of Swift node> -u heat-admin -d all

You have the privilege to format and mount the disk one by one but ringos tool provide you to format all disk with a single command. Refer [pyringos]( /helion/openstack/GA1/services/object/pyringos/) for more details.

##Creating scale-out object-ring {#creating-scale-out-object-ring}

Once the disk is formatted you can create a scale-out object ring. This ring is created for the scale-out Swift which is independent of starter Swift.

1.Create a directory `ring-building` 

	mkdir -p /root/ring-building
	cd /root/ring-building

 

2.Create a ring with the attribute specified in [Defining ring attributes of object-ring:1](#define-object-ring:1) .

	ringos create-ring -f /root/ring-building/object-1.builder -p <value> -r <value> -m <value>


**Caution**: You cannot change your part power once you deploy object-ring:1.

In the following example , we use a single region with each of these 3 nodes in one zone each partition power =10, replicas =3, min&#095;part&#095;hours =1

	ringos create-ring -f /root/ring-building/object-1.builder -p 10 -r 3 -m 1


A ring will be created as shown below:

	created ring /root/ring-building/object-1.builder


3.Add disk to the ring. 

	ringos add-disk-to-ring -f /root/ring-building/object-1.builder -i  <Node IP address> -p  <value> -d <value> -w <value> -r <value> -z <value>

**Note:** Use labels and disks obtained in output of section [Preparing disks of Swift nodes](#preparing-disks-on-Swift-nodes)

In the following example we are adding disk to node(**192.0.2.29**) to zone 1:

	ringos add-disk-to-ring -f /root/ring-building/object-1.builder -i 192.0.2.29 -p 6000 -d a1410063335 -w 100 -r 1 -z 1
	Added disk 192.0.2.29:a1410063335 to ring

You must add all the disks formatted earlier to required zones and regions.

5.Verify the contents of `object-1.builder` file to ensure that it meets your required configuration.

	ringos view-ring -f /root/ring-building/object-1.builder

6.Re-balance the ring using the following command:

	ringos rebalance-ring -f /root/ring-building/object-1.builder

This will generate a **object-1.ring.gz** file.

7.Verify the content `object-1.builder` file after re-balancing the ring.

	ringos view-ring -f /root/ring-building/object-1.builder


##Copying the rings to all Swift nodes {#copying-the-rings-to-all-Swift-nodes}

1. List all the rings from the started Swift nodes. 

		ringos list-swift-nodes -t starter

	**Note:** Rings on the starter Swift nodes are identical. 

2. Get all the rings from the starter nodes.

		rsync -qzp --rsync-path="sudo rsync" heat-admin@<IP address of starter Swift node>:/etc/swift/object.ring.gz /root/ring-building/
		rsync -qzp --rsync-path="sudo rsync" heat-admin@<IP address of starter Swift node>:/etc/swift/account.ring.gz /root/ring-building/
		rsync -qzp --rsync-path="sudo rsync" heat-admin@<IP address of starter Swift node>:/etc/swift/container.ring.gz /root/ring-building/

3. List all the Swift nodes. 

		ringos list-swift-nodes -t  all
 
4. Copy account, container, object-0 , and generated `object-1.ring.gz` files to all nodes. 

		ringos copy-ring -s /root/ring-building/\*.ring.gz -n <IP address of Swift node>

In the following example account, container, object-0 , and generated `object-1.ring.gz` are copied to all the nodes

		ringos copy-ring -s /root/ring-building/\*.ring.gz -n 192.0.2.22
	
	    ringos copy-ring -s /root/ring-building/\*.ring.gz -n 192.0.2.24
	
	    ringos copy-ring -s /root/ring-building/\*.ring.gz -n 192.0.2.29
	
	    ringos copy-ring -s /root/ring-building/\*.ring.gz -n 192.0.2.30
	
	    ringos copy-ring -s /root/ring-building/\*.ring.gz -n 192.0.2.31
	
	    ringos copy-ring -s /root/ring-building/\*.ring.gz -n 192.0.2.32

12.Press **yes** when asked to authenticate node.  

The sample of authentication node will be displayed as follows:

	The authenticity of host '192.0.2.29 (192.0.2.29)' can't be established.
	ECDSA key fingerprint is 8a:eb:b7:66:3b:5f:fa:d6:d1:49:80:1a:a7:90:79:20.
	Are you sure you want to continue connecting (yes/no)? yes
	Copied ring /root/ring-building/object-1.ring.gz onto 192.0.2.29

<!--**Note**: The system may escape the authentication of node sometimes. --->

##Updating the storage policy for scale-out Swift{#update-storage-scaleout-swift}

1. Login to seed 

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



3.Replace the  `overcloud_swift_conf.json` file to set the storage policy to 1 for scale-out Swift.


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

4.Extract the information from `overcloud-config.json`

	source /root/tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh /root/overcloud-config.json


5.Run the installer script to update the cloud.

	bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --skip-install-seed --skip-install-undercloud 2>&1 | tee update.log


 
##For further information

* [Expand Swift Cluster]( /helion/openstack/ga/services/object/swift/expand-cluster/)
* [Monitor Swift Cluster]( /helion/openstack/ga/services/object/swift/Monitor-cluster/)
* [Provision Swift Node]( /helion/openstack/ga/services/swift/provision-nodes/)
* [Shrink Swift Cluster]( /helion/openstack/ga/services/object/swift/shrink-cluster/)

 
<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*