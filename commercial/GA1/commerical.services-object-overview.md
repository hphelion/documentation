---
layout: default
title: "HP Helion OpenStack&#174; Object Operations Service Overview"
permalink: /helion/openstack/GA1/services/object/overview/
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
*  different object storage ring without using cloud controller nodes

####Prerequisites

* Cloud should be successfully deployed with Seed, Undercloud, Overcloud, and two swift nodes.

####Adding physical nodes for scale up swift

Note: Ignore the following steps if you have already configured empty baremetal nodes during initial deployment. (**which steps need to ignored??)**

Note: Get the new nodes details (ilo username, password, ram, cpu, disk and mac) (**where should one get the node details from?**)



1. Login to Undercloud 
 
		ssh

2. Add nodes with the following ironic commands:

 		1. ironic node-create -d pxe_ipmitool -p cpus=18 -p memory_mb=78000 -p local_gb=500 -p cpu_arch=amd64 -i ipmi_address=10.10.10.10 -i ipmi_username=admin -i ipmi_password=password
 		2.  ironic create-port -a $MAC -n $NODE_ID

 
3. Enter `ironic node-list` to verify the successful registration of the baremetal node.


####Deploying Swift nodes for scale out

Perform the following steps to deploy scale out swift nodes:

1. Login to seed VM

		ssh root@192.0.2.1 

2. Enter `cp /root/tripleo/tripleo-incubator/scripts/ee-config.json /root/overcloud-config.json`

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



4. Edit the values the following values are per your requirement:
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

	On the successful Upon the successful cloud update with the new nodes

8. Once the cloud is successfully updated with the new nodes login to undercloud 
    
		root@undercloud 

9. Verify the new nodes addition

		root@undercloud-undercloud-vattor43o22r:/home/heat-admin# nova list

	To view the list <img>


10. Above step confirms that update cloud is succeed and new swift node is added

		ov--soswiftstorage1-SwiftScaleoutObject1-hpmv5quvuojv | ACTIVE | -          | Running     | ctlplane=192.0.2.29



 
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
