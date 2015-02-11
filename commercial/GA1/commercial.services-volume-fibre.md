---
layout: default
title: "HP Helion OpenStack&#174; Configuring Fibre Channel Zone Manager"
permalink: /helion/openstack/services/volume/Fibre/
product: commercial.ga
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Sunitha K, Binamra S

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


# HP Helion OpenStack&reg; 1.1 Block Storage (Cinder): Auto-zoning - Brocade Fibre Channel Zone Manager

Zoning is a fabric-based service in a Storage Area Network (SAN), which enables you to group host and storage nodes that need to communicate. Zoning allows nodes to communicates with each other if they are the member of a same zone.

The Fibre Channel Zone Manager allows FC SAN Zone/Access control management in conjunction with Fibre Channel block storage. OpenStack Cinder supports the auto-zoning functionality from Icehouse release. 

HP Helion OpenStack&reg; 1.1 supports Brocade FC Zone Manager. Block Storage (Cinder) needs to be configured to enable auto-zoning using Brocade FC Zone Manager. The following section describes the procedure to add Brocade Zone Manager configuration to` cinder.config`

Caution:

Please do follow recommended steps to configure HP 3PAR and HP Storevirtual as storage backend. Please do not modify any other file directly under hp_passthrough for HP 3PAR and HP Storevirtual integration. For more details refer step 5.
Please strongly adhere to json format depicted in section . Otherwise, it might cause failure of update cloud.
Please do not touch any other files in /tripleo/hp_passthrough/ folder.
Please create file with prefix  as "overcloud" .

<!----

FC zone manager automates the zone access management at attach/detach entry points of volume operations. The cinder volume manager invokes the `FCZoneManager` at the attach/detach entry points based on zoning mode (if set to **fabric**) and the volume drive type. Zone manager interacts with the appropriate vendor (**what vendor is it referred?**) specific zone driver based on the properties specified in the `kvm-default.json` file. Brocade zone driver manages access control using FC zoning for Braocade FC fabrics. This is a concrete implementation of `FCZoneDriver` interface implementing `add_connection` and `delete_connection` interfaces. Brocade Fibre Channel Zone Driver performs zoning operations through SSH.

--->

**Volume Operations: High-level component interactions with the FC Zone Manager**

<img src="media/commercial_cinder-fc-zone-50.png"/)>

<a href="javascript:window.open('/content/documentation/media/commercial_cinder-fc-zone.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">View larger image (opens in a new window)</a>

##Prerequisite

1. HP Helion OpenStack&#174; cloud is successfully deployed.
2. Sirius service is running in the undercloud.
3. HP StoreServ (3PAR) device is accessible from the undercloud.
4. FC Brocade switches are accessible from nova compute and node where cinder services are running. 
5. HP StoreServ (3PAR) device(running operating system v 3.1.3 or later) is accessible by 6. 6. Block Storage (Cinder) and compute nodes are running in the overcloud.
7. Common Provisioning Groups (CPGs) are created for HP StoreServ (3PAR)
8. HP StoreServ (3PAR) web services API server must be enabled and running. Also, HTTPS is enabled.




## Add Brocade Zone Manager configuration to `cinder.config`

If block storage is configured to use a Fibre Channel volume driver that supports zone manager, update `cinder.config` to enable Fibre Channel Zone Manager.

###Steps for configuration

Perform the following steps to configure Brocade Zone Manager.

1. SSH to seed VM as root

		ssh root@<seed IP address>

2. Change the directory

		cd /tripleo/hp_passthrough/

3. Create a JSON file with prefix **overcloud**.  For example: `overcloud_brocade_config.json`

4. Edit the JSON file with the following details:
    
	a.   Create the initial structure as follows:

        {
             "cinder": {
                 "config": [
                ]
        }

	b.  Add the following parameters in the brocade cinder configuration for each section.

        {
              "section": "<SECTION_NAME>",
              "values": [
                  {
                      "option": "KEY_1",
                      "value": "VALUE_1"
                  },
                  {
                       "option": "KEY_2",
                       "value": "VALUE_2"
                  }
                    .
                    .
                    .
                 ]
        }
      
        
	The sample cloud configuration file for Brocade Zone Manager integration is shown as follows:



		{
		    "cinder": {
		        "config": [
		            {
		                "section": "DEFAULT",
		                "values": [
		                    {
		                        "option": "zoning_mode",
		                        "value": "fabric"
		                    }
		                ]
		            },
		            {
		                "section": "fc-zone-manager",
		                "values": [
		                    {
		                        "option": "brcd_sb_connector",
		                        "value": "cinder.zonemanager.drivers.brocade.brcd_fc_zone_client_cli.BrcdFCZoneClientCLI"
		                    },
		                    {
		                        "option": "fc_fabric_names",
		                        "value": "BRCD_FAB_A,BRCD_FAB_B"
		                    },
		                    {
		                        "option": "zone_name_prefix",
		                        "value": "helion-BZM"
		                    },
		                    {
		                        "option": "fc_san_lookup_service",
		                        "value": "cinder.zonemanager.drivers.brocade.brcd_fc_san_lookup_service.BrcdFCSanLookupService"
		                    },
		                    {
		                        "option": "zone_driver",
		                        "value": "cinder.zonemanager.drivers.brocade.brcd_fc_zone_driver.BrcdFCZoneDriver"
		                    },
		                    {
		                        "option": "zoning_policy",
		                        "value": "initiator-target"
		                    }
		                ]
		            },
		            {
		                "section": "BRCD_FAB_A",
		                "values": [
		                    {
		                        "option": "fc_fabric_address",
		                        "value": "10.10.20.28"
		                    },
		                    {
		                        "option": "fc_fabric_user",
		                        "value": "admin"
		                    },
		                    {
		                        "option": "fc_fabric_password",
		                        "value": "password"
		                    },
		                    {
		                        "option": "zoning_policy",
		                        "value": "initiator-target"
		                    },
		                    {
		                        "option": "zone_active",
		                        "value": "true"
		                    }
		                ]
		            },
		            {
		                "section": "BRCD_FAB_B",
		                "values": [
		                    {
		                        "option": "fc_fabric_address",
		                        "value": "10.10.20.29"
		                    },
		                    {
		                        "option": "fc_fabric_user",
		                        "value": "admin"
		                    },
		                    {
		                        "option": "fc_fabric_password",
		                        "value": "password"
		                    },
		                    {
		                        "option": "zoning_policy",
		                        "value": "initiator-target"
		                    },
		                    {
		                        "option": "zone_active",
		                        "value": "true"
		                    }
		                ]
		            }
		        ]
		    }
		}

3. Run the installer script to update the overcloud.

		bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh  --update-overcloud |& tee install_update.log

You can also configure HP 3PAR Storeserv  as storage backend with Brocade Zone Manager.

Configure HP Storevirtual as storage backend with Brocade Zone Manager.

##Configure HP 3PAR Storeserv as storage backend with Brocade Zone Manager

This section describes the procedure to configure HP 3PAR Storeserv as storage backend with Brocade Zone Manager.

###Steps for configuration

Perform the following steps to configure Brocade Zone Manager.

1. SSH to seed VM as root

		ssh root@<seed IP address>

2. Change the directory

		cd tripleo/configs/

3. List the files in the directory

		ls

3. Edit `kvm-default.json`

		vi kvm-default.json

4. Enter the following configuration and updated the `tripleo/configs/kvm-default.json`:

	1. Generate `Config.json` from Sirius. Refer [Add HP 3PAR StoreServ CPG as Cinder backend](/helion/openstack/sirius/cli/workflow/) to generate `Config.json`.
	3. Add the updated JSON snippet in `kvm-default.json` as shown below:

	
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
	
	           "3par": {
	            "DEFAULT": {
			     "enabled_backends": [
		            "CPG_6287cd1a-f8fb-4e10-93b0-88152db3b5df",
	                "CPG_b86f8f87-d546-40b6-9ac5-3fa5169958dd"
	             ]
	          },
	            "CPG_6287cd1a-f8fb-4e10-93b0-88152db3b5df": {
	              "san_password": "3pardata",
	              "hp3par_username": "3paradm",
	              "volume_backend_name": "3pariscsi",
	              "san_login": "3paradm",
	              "hp3par_api_url": "https://15.214.241.21:8080/api/v1",
	              "volume_driver": "cinder.volume.drivers.san.hp.hp_3par_iscsi.HP3PARISCSIDriver",
	              "hp3par_password": "3pardata",
	              "hp3par_cpg": "3par_iscsi",
	              "hp3par_iscsi_chap_enabled": "true",
	              "san_ip": "15.214.241.21",
	              "iscsi_ip_address": "10.1.0.200"
	            },
	
		         "CPG_b86f8f87-d546-40b6-9ac5-3fa5169958dd": {
		           "san_password": "3pardata",
	               "hp3par_username": "3paradm",
	               "volume_backend_name": "3par_FC",
	               "san_login": "3paradm",
	               "hp3par_api_url": "https://15.214.241.21:8080/api/v1",
	               "volume_driver": "cinder.volume.drivers.san.hp.hp_3par_fc.HP3PARFCDriver",
	               "hp3par_password": "3pardata",
	               "hp3par_cpg": "3par_FC",
	               "hp3par_iscsi_chap_enabled": "true",
	               "san_ip": "15.214.41.21",
	               "zoning_mode": "fabric"
		       }

	4. Add the brocade zone manager configuration below **3PAR** section as shown in the sample below.
	
	
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
	
	           "3par": {
	            "DEFAULT": {
			     "enabled_backends": [
		            "CPG_6287cd1a-f8fb-4e10-93b0-88152db3b5df",
	                "CPG_b86f8f87-d546-40b6-9ac5-3fa5169958dd"
	             ]
	          },
	            "CPG_6287cd1a-f8fb-4e10-93b0-88152db3b5df": {
	              "san_password": "3pardata",
	              "hp3par_username": "3paradm",
	              "volume_backend_name": "3pariscsi",
	              "san_login": "3paradm",
	              "hp3par_api_url": "https://15.214.241.21:8080/api/v1",
	              "volume_driver": "cinder.volume.drivers.san.hp.hp_3par_iscsi.HP3PARISCSIDriver",
	              "hp3par_password": "3pardata",
	              "hp3par_cpg": "3par_iscsi",
	              "hp3par_iscsi_chap_enabled": "true",
	              "san_ip": "15.214.241.21",
	              "iscsi_ip_address": "10.1.0.200"
	            },
	
		         "CPG_b86f8f87-d546-40b6-9ac5-3fa5169958dd": {
		           "san_password": "3pardata",
	               "hp3par_username": "3paradm",
	               "volume_backend_name": "3par_FC",
	               "san_login": "3paradm",
	               "hp3par_api_url": "https://15.214.241.21:8080/api/v1",
	               "volume_driver": "cinder.volume.drivers.san.hp.hp_3par_fc.HP3PARFCDriver",
	               "hp3par_password": "3pardata",
	               "hp3par_cpg": "3par_FC",
	               "hp3par_iscsi_chap_enabled": "true",
	               "san_ip": "15.214.41.21",
	               "zoning_mode": "fabric"
		       },
	
	            "fc-zone-manager": {
	              "brcd_sb_connector": "cinder.zonemanager.drivers.brocade.brcd_fc_zone_client_cli.BrcdFCZoneClientCLI",
	              "fc_fabric_names": "BRCD_FAB_A,BRCD_FAB_B",
	              "zone_name_prefix": "helion",
	              "fc_san_lookup_service": "cinder.zonemanager.drivers.brocade.brcd_fc_san_lookup_service.BrcdFCSanLookupService",
	              "zone_driver": "cinder.zonemanager.drivers.brocade.brcd_fc_zone_driver.BrcdFCZoneDriver",
	              "zoning_policy": "initiator-target"
		     },
	
	            "BRCD_FAB_A": {
			      "fc_fabric_address": "15.214.242.160",
			      "fc_fabric_user": "admin",
			      "fc_fabric_password": "admblabla",
			      "zoning_policy": "initiator-target",
			      "zone_activate": "true"
			    },
		
	            "BRCD_FAB_B": {
	              "fc_fabric_address": "15.214.242.161",
	              "fc_fabric_user": "admin",
	              "fc_fabric_password": "admblabla",
	              "zoning_policy": "initiator-target",
	              "zone_activate": "true"
	             }
	           }
	     	 }

6. Ensure the format of the JSON file remains the same.


####Update overcloud

After the configuration of Brocade FC zone manager for 3PAR device, perform the following steps:


1. Source the environment variables.

		source /root/tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh  tripleo/configs/<environment variables file name>

	For example:

		source /root/tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh  tripleo/configs/<kvm-default.json>


2. Run the installer script to update the overcloud.

		bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh  --update-overcloud |& tee install_update.log




###More information

Please refer the Openstack Cinder configuration guide available at the below URLs for the specific configuration required for enabling auto-zoning.

* For Zone Manager specific configuration, refer to  [http://docs.openstack.org/trunk/config-reference/content/enable-fc-zone-manager.html](http://docs.openstack.org/trunk/config-reference/content/enable-fc-zone-manager.html)
* For Zone Driver configuration, refer to [http://docs.openstack.org/trunk/config-reference/content/brcd-fc-zone-driver.html](http://docs.openstack.org/trunk/config-reference/content/brcd-fc-zone-driver.html)
 
 


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----







<!--

If Block Storage is configured to use a Fibre Channel volume driver that supports Zone Manager, update cinder.conf to add the following configuration options to enable Fibre Channel Zone Manager.

Make the following changes in the /etc/cinder/cinder.conf file.

Table 1.39. Description of zoning configuration options Configuration option = Default value 	Description
[DEFAULT]
zoning_mode = none 	(StrOpt) FC Zoning mode configured
[fc-zone-manager]
fc_fabric_names = None 	(StrOpt) Comma separated list of Fibre Channel fabric names. This list of names is used to retrieve other SAN credentials for connecting to each SAN fabric
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
