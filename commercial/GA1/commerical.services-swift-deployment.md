---
layout: default
title: "HP Helion OpenStack&#174; Deploy Scale-out Swift Node"
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
<p style="font-size: small;"> <a href=" /helion/openstack/ga/services/object/overview/scale-out-swift/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href=" /helion/openstack/ga/services/object/swift/expand-cluster//"> NEXT &#9654</a> </p>
-->


# Deploy Scale-out Swift Nodes with HP Helion OpenStack&#174; 

**Note**: The Policy-0 concept is not the same as the *default* policy. Each policy has both a friendly, configurable ***name*** as well as an ***index*** or number. Index number zero (0) maps to the object ring that’s present by default in all installations. If you like you can change the name, but you cannot change the index, as there must always be a Policy-0. 

Policy-0 is used by Swift when accessing legacy containers created prior to the implementation of storage policies.

In contrast, the ***default*** policy can be any policy defined in the cluster. The default policy is automatically chosen when a container is created without a storage policy specified. Note that this means a container cannot be created with no storage policy; if a policy is not specified, the default policy is applied. 

In other words, default means *create the container using this policy if no policy was specified* and Policy-0 means *apply the legacy policy to an existing container that doesn’t have a specified policy*. Note that in the unique case where no other policies are defined, Policy-0 is also the default.

The scale-out object storage is implemented by defining a new storage policy: Storage-Policy 1. It is recommended that you use **at least two** nodes to implement Storage-policy:1.

Once the storage-policy:1 is created, it becomes the default policy for the ring, so all of the containers would be handled according to this policy unless otherwise specified.

The Object-1 ring, which is used to store end user data, is associated with storage-policy:1. Object storage can be extended further by adding one or more additional nodes to Object-ring:1 as necessary.

Perform the following steps to deploy scale-out object-ring:1 

1. [Prerequisite](#preq)
2. [Defining ring attributes of object-ring:1](#define-object-ring:1)
2. [Preparing Undercloud to perform Swift cluster management operation(s)](#prepare-undercloudswift)
3. [Deploying scale-out Swift object nodes](#deploying-scale-out-Swift-object-nodes)
4. [Verifying deployed Swift nodes](#verifying-deployed-swift-nodes)
5. [Preparing disks on Swift nodes](#preparing-disks-on-Swift-nodes)
6. [Creating scale-out object-ring](#creating-scale-out-object-ring)
7. [Copying the rings to all Swift nodes](#copying-the-rings-to-all-Swift-nodes)
8. [Updating the storage policy for scale-out Swift](#update-storage-scaleout-swift) 

##Prerequisites {#preq}

A HP Helion OpenStack&#174; cloud must be deployed. Functional Swift starter nodes are created as an integral part of cloud deployment.

## Defining ring attributes of object-ring:1 {#define-object-ring:1}
**Caution**:Plan the following ring attributes before deployment of object-ring:1 because many attributes, such as **part power** and **replica count**, cannot be changed after the ring has been deployed.


<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th>Attributes</th>
	<th><center>Definition</center></th>
    <th><center>Recommendation</center></th>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Zone</b></td>
	<td>It defines single points of failure within your cluster. </td>
    <td>It is recommended to use single zone with multiple servers. Having multiple servers (of at least three in number) ensures that the replicas are distributed across servers.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Replica Count</b></td>
	<td>It defines the number of copies of objects.</td>
    <td> It is recommended to use 3 as replica count.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Part Power</b></td>
	<td>It defines your storage cluster capacity.</td>
    <td>It is recommended to use 20 assuming that the average available drive capacity is 1-3 TB.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Min part hour</b></td>
	<td>This should be set to however long a full replication/update cycle takes. </td>
    <td> The recommended value is 24 hours.</td>
</tr>
</table>


##Preparing Undercloud to perform Swift cluster management operation(s) {#prepare-undercloudswift}

Using ringos utility you can add the [provisioned nodes]( /helion/openstack/ga/services/swift/provision-nodes/) to Swift cluster. 

To  perform this operation, it is necessary to enable SSH from Undercloud to Overcloud node. To do that, copy the SSH keys from Seed to Undercloud as mentioned below: 

1.  Login to Seed. 

		# ssh root@<Seed IP address>
 
2. Copy the SSH key from Seed cloud to Undercloud.

		# scp ~/.ssh/id_rsa heat-admin@<Undercloud IP address>:/home/heat-admin

2. Login to Undercloud.

		# ssh heat-admin@<Undercloud IP address>
		# sudo -i
		# mv ~heat-admin/id_rsa ~/.ssh/ 


##Deploying scale-out Swift object nodes {#deploying-scale-out-Swift-object-nodes}

Before starting the deployment of scale-out object nodes you must configure the `overcloud-config.json` file. 

**IMPORTANT:** If `overcloud-config.json` has already been created during installation, just edit the file.


1. Login to Seed. 

		# ssh root@<Seed IP address>


2. Update `so_swift_storage_scale` parameter in `/root/overcloud-config.json` as per your scale

 
For more details, refer [Provisioning Swift node(s)]( /helion/openstack/ga/services/swift/provision-nodes/)


3.Enter the following command to source the `overcloud_config.json`  for the new values.

	# source /root/tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh /root/overcloud-config.json

4.Run the installer script to update the cloud.

	# bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --update-overcloud |& tee update_cloud.log

Wait for the update cloud completion.


## Verifying deployed Swift nodes {#verifying-deployed-Swift-nodes}

Perform the following steps to verify the deployment of  Swift nodes:

1. Log in to the Undercloud from Seed.
    
		# ssh heat-admin@<Undercloud IP address> 
		# sudo -i

2. Source stackrc using the following command:

    	 # source stackrc 
 
3. List the available scale-out Swift nodes. 

		# ringos list-swift-nodes -t object

	The following sample displays scale-out Swift nodes. 

		+--------------+
		| object-nodes |
		+--------------+
		| 192.0.2.29   |
		| 192.0.2.30   |
		+--------------+

4. List the disks available on each node.

		# ringos list-disks -n <Object nodes IP address> 
 
The following sample displays the disk available on the node **192.0.2.29**.
	
		+----------+------------+
		| disk     | size       |
		+----------+------------+
		| /dev/sda | 1073741824 |
		|          |            |
		| /dev/sdb | 1073741824 |
		+----------+------------+


You must repeat the above steps for all the Object nodes.

##Preparing disks on Swift nodes {#preparing-disks-on-swift-nodes}

Once Swift nodes are deployed ensure that you format the required disks and mount them before adding disks to Swift cluster. 

Format a given disk:

	# ringos format-disks -n <Object node IP address> -d all


The following sample displays the output of formatted disk of **192.0.2.29**.

		+----------+-----------+---------+---------------------------------+-------------+------------+
		| disk     | formatted | mounted | mount_point                     | label       | size       |
		+----------+-----------+---------+---------------------------------+-------------+------------+
		| /dev/sda | y         | y       | /mnt/state/srv/node/a1410063335 | a1410063335 | 1073741824 |
		| /dev/sdb | y         | y       | /mnt/state/srv/node/b1410063336 | b1410063336 | 1073741824 |               
		+----------+-----------+---------+---------------------------------+-------------+------------+

**Note**: You can also format disks individually by using &#45;d &lt;device-name&gt;.
For more details, see [ringos]( /helion/openstack/GA1/services/object/pyringos/) manual.

Repeat the above steps for all the Object nodes.

##Creating scale-out object-ring {#creating-scale-out-object-ring}

Once the disk is formatted you can create a scale-out object ring. This ring is created for the scale-out Swift which is independent of starter Swift.

1. Create a directory named `ring-building`. 

		# mkdir -p /root/ring-building
		# cd /root/ring-building
 

2. Create a ring with the attribute specified in [Defining ring attributes of object-ring:1](#define-object-ring:1). 

		# ringos create-ring -f /root/ring-building/object-1.builder -p <part_power> -r <replicas> -m <min_part_hours>


The following sample displays the creation of ring by adding scale-out Swift node to a zone with partition power =10, replicas =3, min&#095;part&#095;hours =24

	# ringos create-ring -f /root/ring-building/object-1.builder -p 10 -r 3 -m 24
	created ring /root/ring-building/object-1.builder


3.Add disk to the ring. 

	# ringos add-disk-to-ring -f /root/ring-building/object-1.builder -i  <Object Node IP address> -p  <port> -d <disk label> -w <weight> -r <region> -z <zone>

**Note:** Use labels and disks obtained in output of section [Preparing disks on Swift nodes](#preparing-disks-on-Swift-nodes).

The following sample displays the addition of disk to **192.0.2.29** and its output.

	# ringos add-disk-to-ring -f /root/ring-building/object-1.builder -i 192.0.2.29 -p 6000 -d a1410063335 -w 100 -r 1 -z 1
	Added disk 192.0.2.29:a1410063335 to ring

4.Verify the content of `object-1.builder` file to ensure that it meets your required configuration.

	# ringos view-ring -f /root/ring-building/object-1.builder
	
The following sample displays the content of `object-1.builder` file:

	object-1.builder, build version 9
	1024 partitions, 3.000000 replicas, 1 regions, 3 zones, 9 devices, 100.00 balance
	The minimum number of hours before a partition can be reassigned is 1
	Devices:    id  region  zone      ip address  port  replication ip  replication port      name weight partitions balance meta
	             0       1     1      192.0.2.29  6000      192.0.2.29              6000 a1410063335 100.00          0 -100.00
	             1       1     1      192.0.2.29  6000      192.0.2.29              6000 b1410063336 100.00          0 -100.00

5.Re-balance the ring. 

	# ringos rebalance-ring -f /root/ring-building/object-1.builder

This will generate an **object-1.ring.gz** file.

 The following sample displays the output of re-balancing the ring:

	Rebalanced ring /root/ring-building/object-1.builder

6.Verify the content `object-1.builder` file after re-balancing the ring.

	# ringos view-ring -f /root/ring-building/object-1.builder


##Copying the rings to all Swift nodes {#copying-the-rings-to-all-Swift-nodes}

1. List all the rings from the starter Swift nodes. 

		# ringos list-swift-nodes -t starter

	The following sample displays the list of Starter Swift nodes.

		+---------------+
		| starter-nodes |
		+---------------+
		| 192.0.2.22    |
		| 192.0.2.24    |
		+---------------+

	
2. Get all the rings and builder files from either of the starter nodes.

		rsync -qzp --rsync-path="sudo rsync" heat-admin@<Starter Swift nodes IP address>:/etc/swift/object.ring.gz /root/ring-building/
		rsync -qzp --rsync-path="sudo rsync" heat-admin@<Starter Swift nodes IP address>:/etc/swift/account.ring.gz /root/ring-building/
		rsync -qzp --rsync-path="sudo rsync" heat-admin@<Starter Swift nodes IP address>:/etc/swift/container.ring.gz /root/ring-building/
		rsync -qzp --rsync-path="sudo rsync" heat-admin@<Starter Swift nodes IP address>:/etc/swift/object.builder /root/ring-building/
		rsync -qzp --rsync-path="sudo rsync" heat-admin@<Starter Swift nodes IP address>:/etc/swift/account.builder /root/ring-building/
		rsync -qzp --rsync-path="sudo rsync" heat-admin@<Starter Swift nodes IP address>:/etc/swift/container.builder /root/ring-building/

	The following sample displays all the rings and builder files from **19.0.2.22**

		rsync -qzp --rsync-path="sudo rsync" heat-admin@<19.0.2.22>:/etc/swift/object.ring.gz /root/ring-building/
		rsync -qzp --rsync-path="sudo rsync" heat-admin@<19.0.2.22>:/etc/swift/account.ring.gz /root/ring-building/
		rsync -qzp --rsync-path="sudo rsync" heat-admin@<19.0.2.22>:/etc/swift/container.ring.gz /root/ring-building/
		rsync -qzp --rsync-path="sudo rsync" heat-admin@<19.0.2.22>:/etc/swift/object.builder /root/ring-building/
		rsync -qzp --rsync-path="sudo rsync" heat-admin@<19.0.2.22>:/etc/swift/account.builder /root/ring-building/
		rsync -qzp --rsync-path="sudo rsync" heat-admin@<19.0.2.22>:/etc/swift/container.builder /root/ring-building/


3. List all the Swift nodes. 

		# ringos list-swift-nodes -t  all
 
4. Copy account, container, object-0 , and generated `object-1.ring.gz` files to all Swift nodes and press **yes** when asked to authenticate node. 

		# ringos copy-ring -s /root/ring-building/\*.ring.gz -n <Swift node IP address>

In the following example account, container, object-0 , and generated `object-1.ring.gz` are copied to all the nodes:

	# ringos copy-ring -s /root/ring-building/\*.ring.gz -n 192.0.2.22
	# ringos copy-ring -s /root/ring-building/\*.ring.gz -n 192.0.2.29
		
	The authenticity of host '192.0.2.29 (192.0.2.29)' can't be established.
	ECDSA key fingerprint is 8a:eb:b7:66:3b:5f:fa:d6:d1:49:80:1a:a7:90:79:20.
	Are you sure you want to continue connecting (yes/no)? yes
	Copied ring /root/ring-building/object-1.ring.gz onto 192.0.2.29

<!--**Note**: The system may escape the authentication of node sometimes. --->

##Updating the storage policy for scale-out Swift {#update-storage-scaleout-swift}

1. Log in to Seed. 

		# ssh root@<Seed IP address>

2. Edit ` /root/tripleo/hp_passthrough/overcloud_swift_conf.json` to replace its value with below:


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

4.Source `overcloud-config.json` file.

	# source /root/tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh /root/overcloud-config.json


5.Run the installer script to update the cloud.

	# bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --update-overcloud |& tee update_cloud.log

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

**Related topics**

* [Provision Swift Node]( /helion/openstack/ga/services/swift/provision-nodes/)
* [Extend Swift Cluster]( /helion/openstack/ga/services/object/swift/expand-cluster/)
* [Monitor Swift Cluster]( /helion/openstack/ga/services/object/swift/Monitor-cluster/)
* [Shrink Swift Cluster]( /helion/openstack/ga/services/object/swift/shrink-cluster/)




*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*