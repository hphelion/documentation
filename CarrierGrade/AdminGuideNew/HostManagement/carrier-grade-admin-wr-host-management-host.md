---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Working with Host Inventory"
permalink: /helion/openstack/carrier/admin/host/management/inventory/host/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Working with Host Inventory
<!-- From the Titanium Server Admin Guide -->

The **Hosts** tab on the **System Inventory** page provides an overview of the current state of all hosts in the HP Helion OpenStack Carrier Grade cluster. From this tab, you can obtain detailed information about the hosts, and execute maintenance operations.

* [Viewing information on Hosts](#view)
* [Unlocking a Host](#unlock)

## Viewing information on Hosts {#view}

To view information on a host:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

	* Use the IP address for the appropriate region where you want to make the change, either: the hLinux region or the Wind River Linux region.

2. Click the **Admin** dashboard, then the **System** panel, then the **System Inventory** link.

3. Click the **Hosts** tab.

The information is refreshed periodically to reflect the ongoing changes on the cluster. It consists of the following
columns:

* **Host Name** - The name assigned to the host. This is an active link pointing to the detailed inventory page for the host. 
* **Personality** - The personality of the host (controller, compute, or storage).
* **Admin State** - The administrative state of the host. It can be in one of two states:
	* **Locked** - The host is administratively prohibited from performing services. This is the initial state for hosts autodiscovered in the cluster.
	* **Unlocked** -  The host is administratively in service. A controller node in this state, and not in the failed state, is active in its HA role, and is running the assigned controller services.
* **Operational State** - The operational state of the host. It can be in one of two states:
	* **Disabled** - Indicates that the host is not providing the expected services. This may be due to the fact that it is in the process of being unlocked, a failure has occurred, or it is being automatically recovered due to a failure.
	* **Enabled** - Indicates that the host is providing the expected services, even if its operational environment is compromised. In the latter case, the host is reported to be in the degraded availability state, in which case, state maintenance is constantly trying to recover the host to fully available state through in-service testing.
* **Availability State** - The availability state of the host. It can be in one of the following states:
	* **Offline** - The host is known to the HP Helion OpenStack Carrier Grade, but is not reachable for maintenance purposes.
	* **Online** -  The host is reachable and ready to be unlocked.
	* **InTest** - A transient state that occurs when transitioning from locked, or from a failed operational state, to unlocked states. While in this state, the host is executing a series of tests to validate its hardware and software integrity.
	* **Available** - The host is fully operational and providing services.
	* **Degraded** - The host is experiencing compromised operational conditions, such as low memory, but is still providing the expected services. Details about the compromised conditions are available through the alarms subsystem. See System Alarms on page 139 for details.
	* **Failed** -  A major fault has occurred and the host is no longer providing any services. The HP Helion OpenStack Carrier Grade maintenance system automatically tries to recover hosts in this state.
	* **Power-off** -  The host is known to have been powered off by a previous maintenance action.
* **Uptime** - The uptime of the host, as reported by the system maintenance service.
* **Status** - An indicator of the immediate activity occurring on the host. It reports transitory steps such as booting, initializing, configuration out of date, and in-test, which a host goes through as it transitions from one administrative or availability state to another.

## Locking and Unlocking a Host {#unlock}

Unlocking a host brings the host into service. The first step is to reset the target host to ensure that it starts from a wellknown state. 

Locking a host brings the host out of service.

Force locking a host takes the host out of service if for the Lock Host option does not work.

For more information, see [Locking and Unlocking a System](/helion/openstack/carrier/admin/host/management/inventory/lock/). 

## Power Off and On a Host {#poweroff}

You can use the Hosts page to power on or gracefully power off a host, ensuring that all system processes are properly shut off first. 

These selections are available if board management is configured on the system, the host is equipped with an iLO module, and the host is in a powered-on state.

To power on/off a host:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Clicking **Inventory** on the **System Panel** section of the **Admin** menu, and then selecting the **Hosts** tab. 

3. In the **Hosts** list, for the system to power on or off, select **Power On** or **Power Off** from the **More** menu.

You can power off and on a host from the controller's command line, as follows:

	system host-power-off <hostname>
	system host-power-off <hostname>

	Where <hostname> is the name of the system.


## Reboot a Host {#reboot}

Gracefully shuts down the host, ensuring that all system processes are properly shut off first. The host then reboots automatically.

To reboot a host:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Clicking **Inventory** on the **System Panel** section of the **Admin** menu, and then selecting the **Hosts** tab. 

3. In the **Hosts** list, for the system to reboot, select **Reboot Host** from the **More** menu.

You can reboot a host from the controller's command line, as follows:

	system host-reboot <hostname>

	Where <hostname> is the name of the system.

## Reset a Host {#reset}

Use this selection only if Reboot Host fails. It performs an out-of-band reset, stopping and restarting the host without ensuring that all system processes are shut off first.

To reset a host:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Clicking **Inventory** on the **System Panel** section of the **Admin** menu, and then selecting the **Hosts** tab. 

3. In the **Hosts** list, for the system to reset, select **Reset Host** from the **More** menu.

	**Note:** This selection is available if board management is configured on the system, the host is equipped with an iLO module, and the host is in a powered-on state.

You can reset a host from the controller's command line, as follows:

	system host-reset <hostname>

	Where <hostname> is the name of the system.

## Reinstall a Host {#reinstall}

Forces a full re-installation of the HP Helion OpenStack Carrier Grade software on the host. The host's hard drive is erased, and the installation process is started afresh.

To reinstall a host:


1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Clicking **Inventory** on the **System Panel** section of the **Admin** menu, and then selecting the **Hosts** tab. 

3. In the **Hosts** list, for the system to reinstall, select **Reinstall Host** from the **More** menu.


## Delete Host {#delete}

Removes the host from the inventory database, and its hard drive is erased.

To delete a host:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Clicking **Inventory** on the **System Panel** section of the **Admin** menu, and then selecting the **Hosts** tab. 

3. In the **Hosts** list, for the system to delete, select **Delete Host** from the **More** menu.


You can delete a host from the controller's command line, as follows:

	system host-delete <hostname>

	Where <hostname> is the name of the system.

## Swact a Host {#swact}

This operation is available on controller nodes only, and should be run on the active controller to initiate a switch of the active/standby roles.

Swact is an abbreviated form of the term Switch Active (host). When selected, this option forces the other controller to become the active one in the HA cluster. This means that all active system services on this controller move to standby operation, and that the corresponding services on the other controller become active.
Use this option when you need to lock the currently active controller, or do any kind of maintenance procedures, for example, when updating hardware or replacing faulty components.

To swact a host:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Clicking **Inventory** on the **System Panel** section of the **Admin** menu, and then selecting the **Hosts** tab. 

3. In the **Hosts** list, for the system to switch to active, select **Swact Host** from the **More** menu.


You can swact a host from the controller's command line, as follows:

	system host-swact --force <hostname>

	Where <hostname> is the name of the system.


The Life Cycle of a host
The life cycle of a host is the set of state transitions the host goes through as its current state changes. The host states
in the HP Helion OpenStack Carrier Grade are based on the ITU X.731 State Management Function Specification for
Open Systems.
The current state of a host is determined by the allowed combinations of the administrative, operational, and
availability states at any given time. The following figure illustrates the life cycle of a host.
HP Helion OpenStack Carrier Grade (Beta) Administration Guide | Managing Hardware Resources | 93
Figure 4: The Life Cycle of a Host
In this figure:
• the administrative states, locked and unlocked, are presented in two columns
• the operational states, disabled and enabled, are presented in two rows
• the availability states are presented as elements inside the administrative/operational matrix
The description that follows uses the availability states only, since for each state the corresponding administrative and
operational states can be read directly from the figure.
The life cycle of a new host starts when it is discovered by the active controller on the internal management network.
A new host is initially reported as Offline. As an exception, the first controller, controller-0, is automatically set to
available during initial commissioning. The following are the available transitions. Numbers are attached to them for
easier reference:
(1) Offline to Online
This transition takes place once the administrator configures the host name and personality of the host. During
the transition, the HP Helion OpenStack Carrier Grade software is installed and the host reboots. The transition
concludes when the controller establishes maintenance and inventory connectivity with the new host.
(2) Online to InTest
This transition takes place when the administrator requests to move the host from the locked to the unlocked
administrative states. The host reboots first. After it finishes booting, it establishes maintenance communication
and enters the transient InTest state. While in this state, the configuration is applied, and a set of hardware and
software tests are executed to ensure the integrity of the host.
(3) InTest to Available, Degraded, or Failed
The transition is initiated automatically after the activities in the transient state inTest are complete. Depending
on the outcome, the host goes into one the three states.
(4) Failed to InTest
This is a value-added maintenance transition that the HA framework executes automatically to recover failed
hosts.
(5) Available to/from Degraded, Available to Failed, and Degraded to Failed
These are transitions that may occur at any time due to changes on the operational state and faults on unlocked
hosts.
(6) Available, Degraded, or Failed, to Offline
These are maintenance transitions that take place automatically to reflect the operational state of a host.
HP Helion OpenStack Carrier Grade (Beta) Administration Guide | Managing Hardware Resources | 94
On a compute node in Available or Degraded state, the transition triggers the live migration of the active
instances to another available compute node.