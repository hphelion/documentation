---
layout: default
title: "HP Helion OpenStack&#174; Configuring Fiber Channel Zone Manager"
permalink: /helion/openstack/services/volume/fibre/
product: commercial.ga
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Sunitha K, Deeplai V, Binamra S

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--
<p style="font-size: small;"> <a href="/helion/openstack/">&#9664; PREV | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/faq/">NEXT &#9654; </a></p>
-->
# HP Helion OpenStack&reg; Cinder (Volume) - Auto-zoning using Brocade FC Zone Manager 

Fibre Channel (FC) Zone Management automates the zone lifecycle management. It is a new functionality available in Cinder - Icehouse. <!--Zoning groups host and storage nodes that need to communicate. Zoning allows nodes to communicates with each other if they are member of a same zone.--->Zoning groups host and storage nodes so that nodes can communicate with each other if they are the member of the same zone. 

FC zone manager automates the zone access management at attach/detach entry points of volume operations. The cinder volume manager invokes the `FCZoneManager` at the attach/detach entry points based on zoning mode (if set to **fabric**) and the volume drive type. Zone Manager interacts with the (appropriate vendor**?** specific Zone driver based on the properties specified in the `kvm-default.json` file. Brocade Zone Driver manages access control using FC zoning for Braocade FC fabrics. This is a concrete implementation of `FCZoneDriver` interface implementing `add_connection` and `delete_connection` interfaces. Brocade Fibre Channel Zone Driver performs zoning operations through SSH.

**Volume Operations: High-level component interactions with the FC Zone Manager**

<img src="media/commercial_cinder-fc-zone.png"/)>


##Configuration of Brocade FC Zone Manager

If Block Storage is configured to use a Fibre Channel volume driver that supports Zone Manager, update `kvm-default.json` to enable Fibre Channel Zone Manager.

###Prerequisite

1. HP Helion OpenStack&#174; cloud is successfully deployed
2. Sirius service is up and running in the undercloud
3. HP 3PAR device is accessible from the undercloud
4. FC Brocade switches are accessible from nova compute and node where cinder services are running. 
5. HP 3PAR device(running operating system v 3.1.3 or later) is accessible by 6. 6. Cinder and Compute nodes are running in the overcloud
7. Common Provisioning Groups (CPGs) are created for HP 3PAR
8. HP 3PAR web services API server must be enabled and running and HTTPS is enabled


###Steps for configuration

Perform the following steps to configure Brocade Zone Manager.

1. SSH to seed VM as root

		ssh root@<seed IP address>

2. Change the directory

		cd tripleo/configs/

3. List the files in the directory

		ls

4. Edit `kvm-default.json`

		vi kvm-default.json

5.  Edit and update the `tripleo/configs/kvm-default.json` 

	a.   Add the JSON snippet obtained in "Generate Config" from Sirius .
		
	   1. Refer Add HP 3PAR StoreServ CPG as Cinder backend to generate Config.json.
	   2. As of now manually add "zoning_mode": "fabric" parameter under 3PAR FC backend.

6. Manually add FC Brocade Zone Manager configurations under the "**3par**" section as shown in the sample below.

	
	
		
		{
		  "cloud_type": "KVM",
		  "compute_scale": 1,
		  "vsa_scale": 0,
		  "vsa_ao_scale": 0,
		  "so_swift_storage_scale": 0,
		  "so_swift_proxy_scale": 0,
		  "bridge_interface": "eth0",
		  "ntp": {
			 "overcloud_server": "16.110.135.123",
		     "undercloud_server": "16.110.135.123"
		 },
				 
		  

			
7. Ensure the JSON file format is intact.


####Update overcloud

After configuration of Brocade FC zone manager for 3PAR device perform the following steps:

1. Apply the configuration
 
**command?**

2. Source the environment variables.

		source /root/tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh  tripleo/configs/<environment variables file name>

	For example:

		source /root/tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh  tripleo/configs/<kvm-default.json>


3. Run the installer script to update the overcloud.

		bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh  --update-overcloud |& tee install_update.log




###More information

Please refer the Openstack Cinder configuration guide available at the below URLs for the specific configuration required for enabling auto-zoning.
http://docs.openstack.org/trunk/config-reference/content/enable-fc-zone-manager.html - For Zone Manager specific configuration
http://docs.openstack.org/trunk/config-reference/content/brcd-fc-zone-driver.html - Zone Driver configuration
 









<!--

If Block Storage is configured to use a Fibre Channel volume driver that supports Zone Manager, update cinder.conf to add the following configuration options to enable Fibre Channel Zone Manager.

Make the following changes in the /etc/cinder/cinder.conf file.

Table 1.39. Description of zoning configuration options Configuration option = Default value 	Description
[DEFAULT]
zoning_mode = none 	(StrOpt) FC Zoning mode configured
[fc-zone-manager]
fc_fabric_names = None 	(StrOpt) Comma separated list of fibre channel fabric names. This list of names is used to retrieve other SAN credentials for connecting to each SAN fabric
zoning_policy = initiator-target 	(StrOpt) Zoning policy configured by user

To use different Fibre Channel Zone Drivers, use the parameters described in this section.
Taken from http://docs.openstack.org/juno/config-reference/content/enable-fc-zone-manager.html

Brocade Fibre Channel Zone Driver performs zoning operations via SSH. Configure Brocade Zone Driver and lookup service by specifying the following parameters:

Table 1.35. Description of configuration options for zoning_manager Configuration option = Default value 	Description
[fc-zone-manager]
brcd_sb_connector = cinder.zonemanager.drivers.brocade.brcd_fc_zone_client_cli.BrcdFCZoneClientCLI 	(StrOpt) Southbound connector for zoning operation
fc_san_lookup_service = cinder.zonemanager.drivers.brocade.brcd_fc_san_lookup_service.BrcdFCSanLookupService 	(StrOpt) FC San Lookup Service
zone_driver = cinder.zonemanager.drivers.brocade.brcd_fc_zone_driver.BrcdFCZoneDriver 	(StrOpt) FC Zone Driver responsible for zone management

Configure SAN fabric parameters in the form of fabric groups as described in the example below:

Table 1.36. Description of configuration options for zoning_fabric Configuration option = Default value 	Description
[BRCD_FABRIC_EXAMPLE]
fc_fabric_address = 	(StrOpt) Management IP of fabric
fc_fabric_password = 	(StrOpt) Password for user
fc_fabric_port = 22 	(IntOpt) Connecting port
fc_fabric_user = 	(StrOpt) Fabric user ID
principal_switch_wwn = None 	(StrOpt) Principal switch WWN of the fabric
zone_activate = True 	(BoolOpt) overridden zoning activation state
zone_name_prefix = None 	(StrOpt) overridden zone name prefix
zoning_policy = initiator-target 	(StrOpt) overridden zoning policy

[Note]	Note

Define a fabric group for each fabric using the fabric names used in fc_fabric_names configuration option as group name. 

From http://docs.openstack.org/icehouse/config-reference/content/brcd-fc-zone-driver.html
---->