---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Viewing System Alarms"
permalink: /helion/openstack/carrier/admin/alarms/viewing/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: Systems Administrator 
role2: Cloud Architect 
role3: Storage Administrator 
role4: Network Administrator 
role5: Service Developer 
role6: Cloud Administrator 
role7: Application Developer 
role8: Network Engineer 
authors: Paul F

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/openstack/carrier/services/imaging/overview/">&#9664; PREV</a> | <a href="/helion/openstack/carrier/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/carrier/services/object/overview/"> NEXT &#9654</a> </p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): Viewing System Alarms
<!-- From the Titanium Server Admin Guide -->

HP Helion OpenStack Carrier Grade can generate system alarms when operational conditions change on any of the hosts in the cluster.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

The supported interfaces to the alarms subsystem are the command line interface (see System Alarms CLI Commands on page 145), the web interface (click the Fault Management menu on the Admin tab), SNMP, and the system REST API.

This topic contains the following:

* [About SNMP Support](#about)
* [SNMPv2-MIB (RFC 3418)](#snmpv2)
* [Enterprise MIBs](#enterprise)
* [Viewing alarms](#viewing)
* [Enabling SNMP Support](#enabling)

## About SNMP Support {#about}

Support for SNMP is implemented as follows:
* access is disabled by default, must be enabled manually from the
command line interface
* available using the controller's node floating OAM IP address, over the standard UDP port 161
* supported version is SNMPv2c
* access is read-only for all SNMP communities
* all SNMP communities have access to the entire OID tree, there is not
support for VIEWS
* supported SNMP operations are GET, GETNEXT, GETBULK, and SNMPv2C-TRAP2
* the SNMP SET operation is not supported 

## SNMPv2-MIB (RFC 3418) {#snmpv2}

Support for the basic standard MIB for SNMP entities is limited to the System and SNMP groups, as follows:

* System Group, .iso.org.dod.internet.mgmt.mib-2.system
* SNMP Group, .iso.org.dod.internet.mgmt.mib-2.snmp
* coldStart and warmStart Traps

The following system attributes are used in support of the SNMP implementation. They can be displayed using the system show command.
<!-- command descriptions from http://docstore.mik.ua/orelly/networking_2ndEd/snmp/ch07_01.htm -->

* **contact** - A read-write system attribute used to populate the sysContact attribute of the SNMP System group. The contact value can be set with the following command:

		system modify contact=<contact>

	where <site-contact> is a descriptive string containing the contact information of those who should be be notified of an alarm, for example: admin <admin@email>

* **location** - A read-write system attribute used to populate the sysLocation attribute of the SNMP System group. The location value can be set with the following command:

		system modify location=<location>

	where <location> is a descriptive string containing for the name of the device being monitored.

* **name** - A read-write system attribute used to populate the sysName attribute of the SNMP System group. The name value can be set with the following command:

		system modify name=<name>

	where <name> is the fully-qualified domain name (FQDN) of the device being monitored.

* **software_version** - A read-only system attribute set automatically by the system. Its value is used to populate the sysDescr attribute of the SNMP System group.

The following SNMP attributes are used as follows:

* **sysObjectId** - Set to iso.org.dod.internet.private.enterprise.wrs.titanium (1.3.6.1.4.1.1.2).

* **sysUpTime** - Set to the up time of the active controller.

* **sysServices** - Set to the nominal value of 72 to indicate that the host provides services at layers 1 to 7.

## Enterprise MIBs {#enterprise}

The HP Helion OpenStack Carrier Grade supports the Enterprise Registration and Alarm MIBs.

* **Enterprise Registration MIB, wrsEnterpriseReg.mib** - Defines the hierarchy underneath the iso(1).org(3).dod(6).internet(1).private(4).enterprise(1). This hierarchy is administered as follows:

		* .wrs(731), the IANA-registered enterprise code
		* .wrs(731).wrsCommon(1).wrs<Module>(1-...), defined in wrsCommon<Module>.mib.
		* .wrs(731).wrsProduct(2-...), defined in wrs<Product>.mib.

* **Alarm MIB, wrsAlarmMib.mib** - Defines the common TRAP and ALARM MIBs. The definition includes
textual conventions, an active alarm table, a historical alarm table, and traps.

* **Textual Conventions** - Semantic statements used to simplify definitions in the active alarm table and traps components of the MIB.

* **Active Alarm Table** - A list of all active or set alarms in the system. Each entry in the table includes the following variables:
		* UUID
		* AlarmID
		* EntityInstanceID
		* DateAndTime
		* AlarmSeverity
		* ReasonText
		* EventType
		* ProbableCause
		* ProposedRepairAction
		* ServiceAffecting
		* SuppressionAllowed

## Viewing alarms {#viewing}

On the web interface, click the Fault Management menu on the
Admin tab, and then select the Active Alarms tab.

For more information on accessing the Fault Managemen tab, see [Host Status and Alarms During System Configuration Changes](/helion/openstack/carrier/admin/system/config/alarms/#viewing).

The Fault Management tab contains two tabs:

* **Historical Alarm Table** - A history of set and clear alarm operations in the system. The table includes the same variables as the active alarm table, plus the variable AlarmState used to indicate whether the table entry is a SET or a CLEAR operation.

Traps Defines the following generic traps:

* wrsAlarmCritical
* wrsAlarmMajor
* wrsAlarmMinor
* wrsAlarmWarning
* wrsAlarmMessage
* wrsAlarmClear
* wrsAlarmHierarchicalClear

For all alarms, the **Notification Type** is based on the severity of the trap or alarm. This is done to facilitate the interaction with most SNMP trap viewers which typically use the Notification Type to drive the coloring of traps, that is, red for critical, yellow for minor, and so on.

For **Critical**, **Major**, **Minor**, **Warning**, and **Message** traps, all variables in the active alarm table are included as varbinds.

For the **Clear** trap, `varbinds` include only the `AlarmID`, `EntityInstanceID`, `DateAndTime`, and `ReasonText` variables.

For the **HierarchicalClear** trap, `varbinds` include only the `EntityInstanceID`, `DateAndTime`, and `ReasonText` variables.

## Enabling SNMP Support {#enabling}

In order to have a workable SNMP configuration you must use the command
line interface on the active controller to:

1. Define at least one SNMP community string. See [Adding an SNMP Community String](/helion/openstack/carrier/admin/alarms/community/strings/).
2. Configure at least one SNMP trap destination so that alarms can be
reported as they happen. See [Configuring SNMP Trap Destinations](/helion/openstack/carrier/admin/alarms/snmp/traps/).



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----