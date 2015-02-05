---
layout: default
title: "HP Helion OpenStack&#174; Configuring Fibre Channel Zone Manager"
permalink: /helion/openstack/services/volume/fibre/
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
# HP Helion OpenStack&reg; Configuring Fibre Channel Zone Manager

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
