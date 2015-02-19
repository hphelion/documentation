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


<script

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

HP Helion OpenStack&reg; 1.1 supports Brocade FC Zone Manager. Block Storage (Cinder) needs to be configured to enable auto-zoning using Brocade FC Zone Manager. The following section describes the procedure to add Brocade Zone Manager configuration to `cinder.conf`


**Volume Operations: High-level component interactions with the FC Zone Manager**

<img src="media/commercial_cinder-fc-zone-50.png"/)>

<a href="javascript:window.open('/content/documentation/media/commercial_cinder-fc-zone.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">View larger image (opens in a new window)</a>

##Prerequisite

* HP Helion OpenStack&#174; cloud is successfully deployed.
* FC Brocade switches are accessible from nova compute and node where cinder services are running. 


## Add Brocade Zone Manager configuration to cinder.conf {#brocade-zone}

If block storage is configured to use a Fibre Channel volume driver that supports zone manager, update `cinder.conf` to enable Fibre Channel Zone Manager.

###Caution:

* Do not modify any other files in `/tripleo/hp_passthrough/`. Modification may led to failover of overcloud.
* Do not modify any other file directly under `hp_passthrough` for HP 3PAR integration. 
* Create a new file with a prefix **overcloud**
* Adhere to the JSON format (mentioned in Step 4). Otherwise, it might cause failure of update cloud.
* Ensure to follow the recommended steps to configure HP 3PAR as a storage backend. 

* Create a file with the prefix as **overcloud**.

###Steps for configuration

Perform the following steps to configure Brocade Zone Manager.

1. SSH to seed VM as root

		ssh root@<seed IP address>

2. Change the directory

		cd /tripleo/hp_passthrough/

3. Create a JSON file with prefix **overcloud**. <br> For example: 

	 	touch overcloud_brocade_config.json

4. Edit the JSON file with the following details:
    
	a.   Create the initial structure as follows:

        {
             "cinder": {
                 "config": [
                ]
        }

	b.  Add the following parameters in the brocade cinder configuration under **config** for each section.

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
      
        
	After creating initial structure and adding parameters under **config** section, the JSON file should appears as shown in the sample below:


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
                                "value": "brocade_helion"
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

###Update cloud

* Run the installer script to update the overcloud.

		bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh  --update-overcloud |& tee install_update.log

You can also configure [HP 3PAR Storeserv](#configure-hp-3par-brocade) or [HP Storevirtual](#configure-hp-storevirtual-brocade) as storage backend with Brocade Zone Manager.

##Configure HP 3PAR Storeserv as a storage backend with Brocade Zone Manager

This section explains the configuration of HP 3PAR Storeserv as a storage backend with Brocade Zone Manager.

You can configure HP 3PAR as storage backend with Brocade Zone Manager. 

###Prerequisite

* HP Helion OpenStack&#174; cloud is successfully deployed.
* Sirius service is running in the undercloud.
* HP StoreServ (3PAR) device is accessible from the undercloud.
* FC Brocade switches are accessible from nova compute and node where cinder services are running. 
* HP StoreServ (3PAR) device(running operating system v 3.1.3 or later) is accessible by Block Storage (Cinder) and compute nodes are running in the overcloud.
* Common Provisioning Groups (CPGs) are created for HP StoreServ (3PAR)
* HP StoreServ (3PAR) web services API server must be enabled and running. Also, HTTPS is enabled.
 

###Steps

Perform the following steps to configure HP 3PAR as storage backend with Brocade Zone Manager.

1. Perform the steps [1- 4](#brocade-zone) to add brocade zone manager configuration.
2. Add and configure HP StoreVirtual and update overcloud. See [HP Helion OpenStack&reg; : Working With StoreVirtual Backends](/helion/openstack/undercloud/oc/config/storevirtual/) for detailed procedure.


<!----

### To configure HP StoreVirtual as storage backend with Brocade Zone Manager {#configure-hp-storevirtual-brocade}

You can  configure HP StoreVirtual as storage backend with Brocade Zone Manager.

###Prerequisite

* HP Helion OpenStack&#174; cloud is successfully deployed.
* FC Brocade switches are accessible from nova compute and node where cinder services are running. 
* You must be running the X Windows System to install the CMC.
* We recommend that you install CMC on the same KVM host that is used to run the seed VM. This host has direct network connectivity to servers running HP StoreVirtual VSA. However, you may select an alternate host as long as it is accessible from the HP Helion OpenStack management network.

**Note**: These changes are required for 64-bit operating system only.

###Steps

Perform the following steps to configure HP 3PAR as storage backend with Brocade Zone Manager.

1. Perform the steps [1- 4](#brocade-zone) to add brocade zone manager configuration.
2. Add and configure  HP StoreServ (3PAR) and update overcloud. See [HP Helion OpenStack&reg; : Working With StoreServ Backends]( /helion/openstack/undercloud/oc/config/storeserv/) for detailed procedure.

---->

###More information

Please refer the Openstack Cinder configuration guide available at the below URLs for the specific configuration required for enabling auto-zoning.

* For Zone Manager specific configuration, refer to  [http://docs.openstack.org/trunk/config-reference/content/enable-fc-zone-manager.html](http://docs.openstack.org/trunk/config-reference/content/enable-fc-zone-manager.html)
* For Zone Driver configuration, refer to [http://docs.openstack.org/trunk/config-reference/content/brcd-fc-zone-driver.html](http://docs.openstack.org/trunk/config-reference/content/brcd-fc-zone-driver.html)
 
 


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----







