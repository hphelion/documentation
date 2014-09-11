---
layout: default
title: "HP Helion OpenStack&#174; Object Operations Service Overview"
permalink: /helion/openstack/gaS/services/object/overview/
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
<p style="font-size: small;"> <a href="/helion/openstack/services/networking/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/orchestration/overview/"> NEXT &#9654</a> </p>-->

# HP Helion OpenStack&#174; Object Operations Service Overview #

<!-- modeled after HP Cloud Networking Getting Started (network.getting.started.md) -->

<!---
Based on OpenStack Swift, HP Helion OpenStack Object Operations is a redundant, scalable, and dynamic storage service. The core storage system is designed to provide a safe, secure, network accessible way to store data. You can store an unlimited number of files and each file can be as large as 5 GB. With segmented objects, you can upload and store objects of almost unlimited size.
. 

Object Operations allows you to store and retrieve files and content through a simple RESTful API interface.

A cloud storage container provides a way for you to organize your objects. The object can be any arbitrary data, including a document, image, video, backup file or anything else required by your application. 

Objects have a size limit of 5 GB. However, objects larger than 5 GB can be segmented and then concatenated together so that you can upload 5 GB segments and download a single concatenated object of any size. You can work with the segments and manifests directly with API requests. --->

Based on OpenStack Swift, HP Helion OpenStack Object Operations is a redundant, scalable, durable, and dynamic storage service. The core storage system is designed to provide a safe, secure, network accessible way to store data. You can store large amount of unstructured data and retrieve objects in publicly accessible physical machine. With segmented objects, you can upload and store objects of almost unlimited size.  

Swift has the capacity to scale from a few terabytes to multiple Petabytes of storage. It is also designed to be horizontally scaling, allowing it to handle large number of simultaneous connections. It enables you to store, retrieve, and delete files and contents through a simple RESTFul API interface.

A cloud storage container provides a way for you to organize your objects. The object can be any arbitrary data, including a document, image, video, backup file or any  data that is required by your application.

Objects have a size limit of 5 GB. However, objects larger than 5 GB can be segmented and then concatenated together so that you can upload 5 GB segments and download a single concatenated object of any size. You can work with the segments and manifests directly with API requests.

HP Helion Openstack Object Operation service will have swift cluster as a part of cloud creation. It deploys scale-out swift to store end cloud user data and also to protect from no single point of failure policy. 

##Scale-out Swift Architecture

With the concept of storage policy HP Helion allows you to deploy scale out Swift cluster. By default, two Swift nodes (termed as start-up node) are deployed during installation of HP Helion OpenStack. Swift cluster configured storage-policy:0 for internal purpose as a part of its deployment. Object ring (for example, object-ring:0) associated with storage-policy:0 is used to store data for internal services like Glance, Sherpa etc. The scale out object storage defines a new policy, storage-policy:1. Object ring (object-ring:1) associated with storage-policy:1 is used to store data for end cloud user. Once storage-policy:1 is created it becomes a default storage policy and a new container will use this ring to store objects. 

Note that you can still continue to use storage-policy:0 if you continue to use old container to store data.






<!---
HP Helion allows you to deploy scale out Swift cluster using the concept of storage policy. By default, Helion cloud deploys two node (termed as start-up node) Swift cluster as part of its deployment and configures storage-policy:0 for internal purpose. Object ring (say object-ring:0) associated with storage-policy:0 is used to store data for internal services like Glance, Sherpa etc. The scale out object storage is implemented by defining a new policy storage-policy:1. Object ring (say object-ring:1) associated with storage-policy:1 will be used to end cloud use objects.  After creation of storage-policy-1, it will be made as default storage policy and any new container will use this ring to store objects. However, any client using storage-policy:0 to can keep using old container to store the data. In a nutshell, object-ring:0 is used to store data for internal purpose and object-ring:1 is used to store object data for end cloud user. ---->


<!--


--->
**<Image of scale out architecture>**



###Deployment of Scale-out swift architecture

HP Helion has a Swift cluster as part of cloud creation. Helion deploys overcloud which supports 'no single point of failure policy'.

By deploying scale-out swift you can create storage-policy:1 for object-ring:1, which is used to store end cloud user data. Storage-policy:1 is used to implement object-ring:1 and needs to adhere to 'no single point of failure' policy. We recommend you to use at last two nodes to implement storage-policy:1. Also, you can extend the object storage by adding one or more nodes to object-ring:1 as per your requirement.


<**image**> 

###Deployment of scale-out Swift

This section describes the procedure for the deployment of scale out swift.

* with one object ring
* different object storage ring using Overcloud controller nodes
* different object storage ring without using <over> cloud controller nodes



####Adding physical nodes for scale up swift
This document describes the steps to deploy scale out swift -  proxy & object nodes post cloud deployment

####Prerequisites

* Cloud should be successfully deployed with Seed, Undercloud, Overcloud, and two swift nodes.


**Note**: Ignore the following steps if you have already configured empty baremetal nodes during initial deployment. (**which steps need to ignored??)**

Note: Get the new node details (iLO username, password, RAM, CPU, disk and MAC Address) (**where should one get the node details from?**)



1. Login to Undercloud 
 which is the cor
		ssh <undercloud_IP> ???? or root@undercloud ?????

2. Add nodes with the following ironic commands:

 		1. ironic node-create -d pxe_ipmitool -p cpus=18 -p memory_mb=78000 -p local_gb=500 -p cpu_arch=amd64 -i ipmi_address=10.10.10.10 -i ipmi_username=admin -i ipmi_password=password
 		2.  ironic create-port -a $MAC -n $NODE_ID

 
3. Enter `ironic node-list` to verify the successful registration of the baremetal node.


####Deploying Swift nodes for scale out

Perform the following steps to deploy scale out swift nodes:

1. Login to seed VM

		ssh root@192.0.2.1 <will it change for the user?>

2. Copy /root/tripleo/tripleo-incubator/scripts/ee-config.json to /root/overcloud-config.json

 `cp /root/tripleo/tripleo-incubator/scripts/ee-config.json /root/overcloud-config.json`

3. Enter `cat /root/overcloud-config.json`


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



4. Edit  the following values are per your requirement in `overcloud-config.json`:
 
 * so&#095;swift_storage&#095;scale

 * so&#095;swift&#095;proxy&#095;scale

	Number of nodes should match the new nodes addition in ironic

5. Enter the following command to source the `overcloud_config.json`  for the new values

		source /root/tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh /root/overcloud-config.json

6. Comment out the following line to ignore ping test 


		vi /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh
	
		###
	
		if [ "$SKIP_INSTALL_OVERCLOUD" != "1" ] ; then
	
	    echo "HP - configuring overcloud - $(date)"
	
		#    hp_ced_validate_ip ping -s $FLOATING_START -e $FLOATING_END
	
7. Run the installer script to update the cloud

		bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --skip-install-seed --skip-install-undercloud 2>&1 | tee update.log

	The cloud update with the new nodes on successful operation

8. Once the cloud is successfully updated with the new nodes login to undercloud 
    
		root@undercloud 

9. Verify the new nodes addition

		root@undercloud-undercloud-vattor43o22r:/home/heat-admin# nova list <how to verify added nodes>

	

10. Above step confirms that update cloud is successful and new swift node is added

		ov--soswiftstorage1-SwiftScaleoutObject1-hpmv5quvuojv | ACTIVE | -          | Running     | ctlplane=192.0.2.29


##End to end deployment of Swift scale-out

Perform the following steps 

1. Set number of nodes

   	To increase the number of VMs created, before creating the seed, modify "TOTAL=" using  the following command.
		
		 $TRIPLEO_ROOT/tripleo-incubator/scripts/hp_ced_host_manager.sh

2. To create a seed, enter the following command. 

		HP_VM_MODE=y bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_host_manager.sh --create-seed |& tee /root/create-seed.log
	On the succesfull creation of seed the following message appears:

**	<get the information from keshava>**

3. Login to seed  

		ssh root@ <IP Address>

4. Copy  what to what loaction???
		
		cp tripleo/tripleo-incubator/scripts/ee-config.json /root/overcloud-config.json
		source tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh /root/overcloud-config.json


5. Export the following variables
			
			export NeutronPublicInterface="eth0"
			export OVERCLOUD_NTP_SERVER="<IP address>"
			export UNDERCLOUD_NTP_SERVER="<IP address>"
			export OVERCLOUD_VIRTUAL_INTERFACE="br-ex"
			export OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID="101"
			export VLAN_RANGE="200:300"



6. To create undercloud, enter the following commands.

		bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh |& tee install_cloud.log
 
7. Export scale-out swift variables

		export OVERCLOUD_SOSWIFT_STORAGESCALE=3
		export OVERCLOUD_SOSWIFT_PROXYSCALE=1

8. Update cloud Node (node --skip declaratives) 

		bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh  --skip-install-seed --skip-install-undercloud |& tee update_cloud.log

	On the successful Upon the successful cloud update with the new nodes

9. Copy the private key from seed cloud to undercloud

		scp ~/.ssh/id_rsa heat-admin@<IP address>:/home/heat-admin

		
10. Login to overcloud controller
    
		#ssh heat-admin@<IP address>
  		#sudo -i
		#mv ~heat-admin/id_rsa ~/.ssh/

11. List the available scale-out swift nodes

		root@undercloud-undercloud-hh5lmjj4hngf:~# ringos list-swift-nodes -t object

12. List the disks available on each node

		root@undercloud-undercloud-hh5lmjj4hngf:~# ringos list-disks -n <IP address> -u heat-admin


13. Format disks on each node based on your configuration.

	To fromat all disk

 		ringos format-disks -n xxx.x.x.xx (IP address of the node) -u heat-admin -d all

	OR

	To format a specific disk.

		ringos format-disks -n xxx.x.x.xx (IP address of the node) -u heat-admin -d /dev/sdc -l d2

##Create a new object ring

Now we create a  new object-1 ring to scale-out swift. You can use this scale-out swift independently without depending on start-up node (swift) which was installed during the installation.

1. Create a directory named `ring-building` 

		mkdir -p /root/ring-building
		cd /root/ring-building


You can choose the number of zones, the partition power, and regions based on the configuration and the hard drive capacity.

In the following example , we use a single region with 3 zone, with each of these 3 nodes in one zone each partition power =10, replicas =3, min_part_hours =1

		root@undercloud-undercloud-hh5lmjj4hngf:~/ring-building# ringos create-ring -f /root/ring-building/object-1.builder -p 10 -r 3 -m 1
		Created ring /root/ring-building/object-1.builder

2.Add disks to ring. Use format-disks output to identify nodes, disk and disk labels. you should add disk using labels.

		add disks of 192.0.2.29 into zone1
	root@undercloud-undercloud-hh5lmjj4hngf:~/ring-building# ringos add-disk-to-ring -f /root/ring-building/object-1.builder -i 192.0.2.29 -p 6000 -d a1410063335 -w 100 -r 1 -z 1
	Added disk 192.0.2.29:a1410063335 to ring


3.Verify the contents of builder file to make sure it meets your required configuration
<command required>

		root@undercloud-undercloud-hh5lmjj4hngf:~/ring-building# ringos view-ring -f /root/ring-building/object-1.builder 
		object-1.builder, build version 9
		1024 partitions, 3.000000 replicas, 1 regions, 3 zones, 9 devices, 100.00 balance
		The minimum number of hours before a partition can be reassigned is 1




4.Rebalance the ring

	root@undercloud-undercloud-hh5lmjj4hngf:~/ring-building# ringos rebalance-ring -f /root/ring-building/object-1.builder
	Rebalanced ring /root/ring-building/object-1.builder

This would generate a `object-1.ring.gz` file.

5.Verify the contents of `object-1.builder`. 

	root@undercloud-undercloud-hh5lmjj4hngf:~/ring-building# ringos view-ring -f /root/ring-building/object-1.builder
	/root/ring-building/object-1.builder, build version 9
	1024 partitions, 3.000000 replicas, 1 regions, 3 zones, 9 devices, 0.20 balance
	The minimum number of hours before a partition can be reassigned is 1

6.Get all the rings from either of starter swift nodes. (Note: rings on starter swift are identical)

	root@undercloud-undercloud-hh5lmjj4hngf:~/ring-building# ringos list-swift-nodes -t starter

7.Push the generated object-1.ring.gz, along with the ring file in step 6 to all nodes

  a.get all nodes
  b. copy ringo 

	ringos copy-ring -s /root/ring-building/\*.ring.gz -n 192.0.2.22
    ringos copy-ring -s /root/ring-building/\*.ring.gz -n 192.0.2.24
    ringos copy-ring -s /root/ring-building/\*.ring.gz -n 192.0.2.29
    ringos copy-ring -s /root/ring-building/\*.ring.gz -n 192.0.2.30
    ringos copy-ring -s /root/ring-building/\*.ring.gz -n 192.0.2.31
    ringos copy-ring -s /root/ring-building/\*.ring.gz -n 192.0.2.32

8.Press **yes** when asked to authenticate node
**<>command required to push node**

**Note:** Change the default value of existing Policy-0 to no

	root@undercloud-undercloud-hh5lmjj4hngf:~/ring-building# ringos copy-ring -s /root/ring-building/\*.ring.gz -n 192.0.2.29
	The authenticity of host '192.0.2.29 (192.0.2.29)' can't be established.
	ECDSA key fingerprint is 8a:eb:b7:66:3b:5f:fa:d6:d1:49:80:1a:a7:90:79:20.
	Are you sure you want to continue connecting (yes/no)? yes
	Copied ring /root/ring-building/object-1.ring.gz onto 192.0.2.29
		
	root@undercloud-undercloud-hh5lmjj4hngf:~/ring-building# ringos copy-ring -s /root/ring-building/\*.ring.gz -n 192.0.2.30
	The authenticity of host '192.0.2.30 (192.0.2.30)' can't be established.
	ECDSA key fingerprint is e6:3b:49:1d:44:9e:bf:65:de:b7:89:2f:0b:9d:a7:23.
	Are you sure you want to continue connecting (yes/no)? yes
	Copied ring /root/ring-building/object-1.ring.gz onto 192.0.2.30
	
	root@undercloud-undercloud-hh5lmjj4hngf:~/ring-building# ringos copy-ring -s /root/ring-building/\*.ring.gz -n 192.0.2.31
	The authenticity of host '192.0.2.31 (192.0.2.31)' can't be established.
	ECDSA key fingerprint is bf:3e:eb:0a:b0:e6:bb:0d:55:c4:4b:a8:e1:4a:d5:87.
	Are you sure you want to continue connecting (yes/no)? yes
	Copied ring /root/ring-building/object-1.ring.gz onto 192.0.2.31


9.Add the following section to `/root/tripleo/hp_passthrough/overcloud_swift_conf.json`

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
	}
	
	this will be final json
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
	


10.To update a cloud first you need to perform the following commands

 1. Kill rabbitmq (if running)
 2. Delete all the contents of /var/lib/rabbitmq
3. Tail /var/log/upstart/os-collect-config.log to ensure that it begins moving again; if it doesn't, then restart the node

11.Update cloud 

	root@hLinux:~# bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh  --skip-install-seed --skip-install-undercloud |& tee update_cloud.log


##Verification of the scale-out swift


1. root@hLinux:~# swift stat
      
		 Account: AUTH_e3c534ff359a48c28b9db11d371ffd90
	    Containers: 1
	       Objects: 1
	         Bytes: 245010944
			X-Account-Storage-Policy-Policy-0-Bytes-Used: 245010944
	   	 Connection: keep-alive
	  	 X-Timestamp: 1409938379.39333
		X-Account-Storage-Policy-Policy-0-Object-Count: 1
	    X-Trans-Id: tx02864a6dda2f47839f16f-00540bf9ca
		  Content-Type: text/plain; charset=utf-8
		 Accept-Ranges: bytes

2. upload an object <what is the command used to upload>   
3.  verify uploaded object
 
			root@hLinux:/tmp# swift download first_container first
			No handlers could be found for logger "keystoneclient.httpclient"
			first [auth 0.441s, headers 0.696s, total 0.697s, 0.000 MB/s]
			root@hLinux:/tmp# more first
			first scaleout object

4. You can see the storage policies created, and the new container getting created in new storage policy and glance container in old policy.
root@hLinux:~# swift stat glance
No handlers could be found for logger "keystoneclient.httpclient"
       Account: AUTH_e3c534ff359a48c28b9db11d371ffd90
     Container: glance
       Objects: 1
         Bytes: 245010944
      Read ACL:
     Write ACL:
       Sync To:
      Sync Key:
 Accept-Ranges: bytes
X-Storage-Policy: Policy-0
    Connection: keep-alive
   X-Timestamp: 1409938379.41770
    X-Trans-Id: tx5cc9a2346f494e14b9e5b-00540c0dcb
  Content-Type: text/plain; charset=utf-8
root@hLinux:~# swift stat first_container
No handlers could be found for logger "keystoneclient.httpclient"
       Account: AUTH_e3c534ff359a48c28b9db11d371ffd90
     Container: first_container
       Objects: 1
         Bytes: 22
      Read ACL:
     Write ACL:
       Sync To:
      Sync Key:
 Accept-Ranges: bytes
X-Storage-Policy: ScaleOut
    Connection: keep-alive
   X-Timestamp: 1410076014.71287
    X-Trans-Id: txfde275f9edd94f288f5bf-00540c0dd2
  Content-Type: text/plain; charset=utf-8







*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
