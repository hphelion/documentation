---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Using System Alarms CLI Commands"
permalink: /helion/openstack/carrier/admin/alarms/cli/commands/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Using System Alarms CLI Commands
<!-- From the Titanium Server Admin Guide -->

You can use the CLI to find information about currently active and previously triggered system alarms.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

The following commands are used to interact with the alarms subsystem: 

* system alarm-list
* system alarm-show
* system alarm-delete
* system alarm-history-list 

Before using the commands you must log in to the active controller as the Keystone admin user. For more information, see [Linux User Accounts](/helion/openstack/carrier/admin/linux/users/).

## Listing system alarms {#list}

The `system alarm-list` command lists currently active alarms, as illustrated below 

Specific subsets of alarms, or a particular alarm, can be listed using one of the following --query command filters:

* `uuid=<uuid>` - Query alarm by UUID, for example:

		system alarm-list --query uuid=4ab5698a-19cb...

* `alarm_id=<alarm id>` - Query alarms by alarm ID, for example:

		system alarm-list --query alarm_id=100.104

* `alarm_type=<type>` - Query alarms by type, for example:

		system alarm-list --query \
		alarm_type=operational-violation

* `entity_type_id=<type id>` - Query alarms by entity type ID, for example:

		system alarm-list --query \
		entity_type_id=system.host

* `entity_instance_id=<instance-id>` - Query alarms by entity instance id, for example:

		system alarm-list --query \
		entity_instance_id=host=compute-0

* `severity=<severity>` - Query alarms by severity type, for example:

		system alarm-list --query severity=warning

	The valid severity types are critical, major, minor, and warning.

Query command filters can be combined into a single expression separated by semicolons, as illustrated in the following example:

	system alarm-list -q
	'alarm_id=400.002;entity_instance_id=service_domain=controller.service_group=directoryservices'

## Viewing details of an alarm

The `system alarm-show` command system alarm-show presents additional information about a currently active alarm.

	system alarm-show 4ab5698a-19cb-4c17-bd63-302173fef62c

The pair of attributes (alarm_id, entity_instance_id) uniquely identifies an active alarm:

* `alarm_id` - An ID identifying the particular alarm condition. Note that there are some alarm conditions, such as administratively locked , that can be raised by more than one entity-instance-id.

* `entity_instance_id` - Type and instance information of the object raising the alarm. A period-separated list of (key, value) pairs, representing the containment structure of the overall entity instance.  This structure is used for processing hierarchical clearing of alarms.

* `system alarm-delete` - The command system alarm-delete is used to manually delete an alarm that remains active for no apparent reason, which may happen in rare conditions. Alarms usually clear automatically when the trigger condition is corrected. Use this command as illustrated below:

		system alarm-delete 4ab5698a-19cb-4c17-bd63-302173fef62c

	Manually deleting an alarm should not be done unless it is absolutely clear that there is no reason for the alarm to be active.

* `system alarm-history-list` - The command system alarm-history-list is used to query the historical alarm table. It operates on an alarm ring buffer of up to 2000 entries used by the alarms subsystem to sequentially store active alarm change events.

	In its simplest form, without any parameters, the command returns a list of the 20 most recent change events in reverse chronological order, the most recent event first. Use the -l option to specify the size of the list. 

	The following command lists the 30 more recent change events:

		system alarm-history-list -l 30

	The console output is automatically paginated when the list size is greater than 20. Press the **Enter** key to go the next page, or press `q` to quit.

	Specific alarms, or alarm subsets, in the ring buffer can be listed using the --query command filters accepted by the `system alarms-list` command. For example, use the following command to query alarm events in the ring buffer by type ID:

		system alarm-history-list --query alarm_id=100.104

Two additional command filters are available to restrict the command output to change events in a particular time slot, as follows:

* `start=<time_stamp>` - Query change events that occurred at or after a particular time, for example: 

		system alarm-history-list --query \
		start=2014-11-26T18:58:53

* `end=<time_stamp>` - Query change events that occurred at or before a particular time, for example:

		system alarm-history-list --query \
		end=2014-11-26T18:59:53

**Note:** Time stamps must be entered in a suitable ISO 8601 date and time format. Some examples are: 2014, 2014-11-26, 2014-11-28T16:39, and 2014-11-28T16:42:35.647157.

Query command filters can be combined into a single expression separated by semicolons, as illustrated in the following example:

	system alarm-history-list -l 10 \
	-q 'start=2014-11-26T18:58:53;end=2014-11-26T18:59:53'

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----