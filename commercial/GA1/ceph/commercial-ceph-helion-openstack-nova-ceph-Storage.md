---
layout: default
title: "HP Helion OpenStack&#174; Edition: HP Helion Ceph"
permalink: /helion/openstack/ceph-helion-openstack-nova-ceph-storage/
product: commercial

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--
<p style="font-size: small;"> <a href="/helion/openstack/install-beta/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/esx/">NEXT &#9654;</a> </p>--->


##Helion OpenStack Nova Ceph Storage

Install and run the Ceph client script  on the Helion controller and compute node. After successfully installation the following steps are automatically performed.

1. Verify the Ceph health

		ceph health
	
	Output:	
	
		HEALTH_OK


2.  Create a new pool for Cinder volume

		ceph osd pool create <cinder pool name> <pg-num>

	For example:
		
		ceph osd pool create helion-ceph-nova 100

4.  Execute the following command to verify a new pool creation

		rados lspools
		
	Output:
		
		rbd ls helion-ceph-nova

4. Create symbolic or softlinks to the relevant files on overcloud controller nodes.

		ln -s /usr/lib/python2.7/dist-packages/rados* /opt/stack/venvs/openstack/lib/python2.7/site-packages/.
		ln -s /usr/lib/python2.7/dist-packages/rbd* /opt/stack/venvs/openstack/lib/python2.7/site-packages/.
		ln -s /usr/lib/python2.7/dist-packages/rados* /opt/stack/venvs/nova/lib/python2.7/site-packages
		ln -s /usr/lib/python2.7/dist-packages/rbd* /opt/stack/venvs/nova/lib/python2.7/site-packages



###Configure Nova

Configure Nova to boot all the virtual machined directly to Ceph. On each overcloud controller and compute node edit `nova.conf`.

Perform the following steps:

1. Edit `/etc/nova/nova.conf` and add the following options in the respective sections:


		# For ceph integration
		[DEFAULT]
		libvirt_inject_password=false
		libvirt_inject_key=false
		libvirt_inject_partition=-2
		The last libvirt section in the conf file
		[libvirt]
	
		#CEPH Related Changes
		images_type=rbd
		images_rbd_pool=helion-ceph-nova
		images_rbd_ceph_conf=/etc/ceph/ceph.conf

2. Restart the Nova services

	* From compute node

			service nova-compute restart

	* From all the controller nodes

			service nova-api restart
			service nova-scheduler restart
			service nova-conductor restart

	
<list of screenshot need to be added. page number 87-91>

###Attaching the Cinder volume to the Nova instance

There are two ways to attach a cinder volume to a nova instance.

* Using the Horizon UI Dashboard
* Using Command Line Interface (CLI)


**Using the Horizon UI Dashboard**

To attach a cinder volume to a nova instance, do the following:

1. In the Horizon dashboard, click the **Project** Tab. The tab displays with options in the left panel.

2. Click **Compute** and then select **Volume** to open Volume page.
3. Click **More Action** tab and select** Edit Attachments**. Manage Volume Attachments page displays.
4. Click **Attach** to **Instance** drop-down list and select the instance. 
5. In the **Device Name** box, enter the name of the name for the selected instance.
6. Click **Attach Volume** to attach the cinder volume to the nova instance, else click Cancel.


**Listing instance from Horizon**:

1. In the Horizon dashboard, click the **Project** Tab. The tab displays with options in the left panel.

2. Click **Compute** and then select **Instance** to open Volume page. Instance page is displayed. You can view the all the instances and the console log in Horizon UI.



**Using Command Line Interface (CLI)**

To attach a cinder volume to a nova instance, do the following:

1. Login to seed

		ssh <seed IP address>


2. Login to Overcloud Horizon.

		ssh heat-admin@<overcloud IP address> 

3. Execute the following command from overcloud controller node0:

		source /root/stackrc 

4. List the existing VM

		nova list

5. List the existing glance image

		glance index


6. List nova list

		rados lapools

7. List the ceph resource

		ceoh df
8. **What does the following command do?**

		ceph -w

9. Execute the following command to create an instance with RDB backend

**command required?**


10. List all nova instances
		
		nova list


11. **What does the following command do?**

		ceph -w


12. Logging in the instance from KVM host 

**commands required?**


	It displays the instances where the cinder volume is attached.

#####Verify Cinder volume attachment to a nova instance

Now the Cinder volume is attached to a nova instance. Perform the following steps to verify the attachment. 

1. Execute the following command to view all the volumes

		# cinder list


2. Execute the following command to view the Nova instance

		nova list 

3. To view the details of the attached volume, execute the following command

		# cinder show  <volume ID>

	For example:

		cinder show 580d3e95-970f-4a9c-92ea-284799dcbc82

	Output:

		+--------------------------------------+---------------------------------------------------------------------------------------------------------------------------------+
		| Property 							   | Value                           															   									 |
		+--------------------------------------+---------------------------------------------------------------------------------------------------------------------------------+
		| attachments 						   | [{u'device': u'/dev/vde', u'server_id': u'd6c98de0-b65e-4e43-bd5e-04c81ad26cd1', u'id': u'580d3e95-970f-4a9c-92ea-284799dcbc82', 											 u'host_name': None, u'volume_id': u'580d3e95-970f-4a9c-92ea-284799dcbc82'}] 	                  								 |
		| availability_zone 				   | nova 																														     |
		| bootable 							   | false																															 |
		| created_at 						   | 2014-08-13T03:38:27.000000   																									 |
		| display_description 				   | None  																														     |
		| display_name				           | volume2_RBD  																													 |
		| encrypetd 				           | False   																														 |
		|  id 								   | 580d3e95-970f-4a9c-92ea-284799dcbc82 				  																			 |
		| metadata 							   | {u'readonly': u'False', u'attached_mode': u'rw'}				           														 |
		| os-vol-host-attr:host 			   | overcloud-controller1-thg43e77ptei																								 |
		| os-vol-mig-status-attr:migstat       | None																															 |
		| os-vol-mig-status-attr:name_id       | None					   																										 | 
		| os-vol-tenant-attr:tenant_id         | 98ae295c1958428a890cf6441d70db08					   																			 | 
		| size 							       | 2																																 |	
		| snapshot_id 					       | None																															 |
		| source_volid 					       | None																										     				 |
		| status 							   | in-use		   			   																										 | 
		| volume_type 						   | None				   																											 | 	
		+--------------------------------------+---------------------------------------------------------------------------------------------------------------------------------+



5. To view the details of the nova instance, execute the following commands:

		nova show < nova instance ID> 

	For example:
 
		# nova show d6c98de0-b65e-4e43-bd5e-04c81ad26cd1

	Output:


		+--------------------------------------+--------------------------------------------------------------------------------+
		| Property 							   | Value                           															   									 
		+--------------------------------------+--------------------------------------------------------------------------------+
		| OS-EXT-AZ:availability_zone 		   | nova 	                  								 						|												 
		| OS-EXT-SRV-ATTR:host 			 	   | overcloud-novacompute0-k3kakatgtgb2 											|												 
		| OS-EXT-SRV-ATTR:hypervisor_hostname  | overcloud-novacompute0-k3kakatgtgb2.novalocal  								|												 
		| OS-EXT-SRV-ATTR:instance_name 	   | instance-00000087  															|										         
		| OS-EXT-STS:power_state 		       | 1 																				|												 	
		| OS-EXT-STS:task_state 		       | - 																			    |										 		 
		| OS-EXT-STS:vm_state 			       | active 																		|											 	 
		| accessIPv4 						   | 			  																	|		 									
		| accessIPv6 						   | 			           														    |
		| config_drive 					   	   | 																				|
		| created  						       | 2014-08-12T23:43:50Z 															|
		| default-net network 				   | 10.0.0.43, 192.168.100.108 													|
		| flavor 							   | m1.tiny (1) 																	|
		| hostId 							   | cf6bb4eb58517b0e06246628e3d0559267a2594c06ea44100e2fae1e 						|
		| id 								   | d6c98de0-b65e-4e43-bd5e-04c81ad26cd1 											|
		| image 							   | debian-wheezy-server-amd64-disk (39565ba5-bfe7-4ee7-be2b-abab70eeb989) 		|
		| key_name 							   | default 																		|
		| metadata 							   | {} 																			|
		| name 								   | vm1 																			|
		| progress 							   | 0 																				|
		| security_groups 					   | default 																		|
		| status 							   | ACTIVE 																		|
		| tenant_id 					       | 98ae295c1958428a890cf6441d70db08 												|
		| updated 					           | 2014-08-12T23:44:23Z 															|
		| user_id 							   | 835261faa1454b56bfab6cd07edfd433   											| 	
		+--------------------------------------+--------------------------------------------------------------------------------+


#####Verify 

From VM, cross checking if the cinder that uses RBD backend is seen.

Listing device file after attaching volume to instance - vdc is the block device from RBD

Listing pools
<screen shot>

Debian version on the instance
<screen shot>

Creating ext4 file system on vdc 1
<screen shot>

Mounting vdc
<screen shot>

vdc volume size after copying cirros img 1

<screen shot>