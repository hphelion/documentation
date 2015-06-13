---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Virtual Machines and Carrier-Grade Availability"
permalink: /helion/openstack/carrier/admin/carrier-grade-avail/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: All

authors: Paul F

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/openstack/1.1/3rd-party-license-agreements/">&#9664; PREV</a> | <a href="/helion/openstack/1.1/">&#9650; UP</a> | NEXT &#9654; </p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): Virtual Machines and Carrier-Grade Availability

The Wind River Linux servers in HP Helion OpenStack Carrier Grade provide a health monitoring mechanism that can be used to implement and support the deployment of guest applications in Carrier-Grade High Availability (HA) mode.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

A simplified view of the health monitoring system is illustrated in the following figure:

<img src="media/CGH-WR-High-Avail.png">


## Host monitoring

A host failure occurs when the compute node hardware that hosts the application fails, or when its kernel becomes unresponsive. Host failures are detected by the active controller node through an efficient and scalable monitoring process that runs continuously during normal operation of the Wind River Linux server cluster.

When such a failure is detected, the Wind River Linux server automatically re-schedules all affected virtual machines for deployment on alternative compute nodes.

Host monitoring, and its recovery mechanisms, are always available for every deployed virtual machine in the Wind River Linux server cluster.

## Virtual machine monitoring

From the point of view of a guest application, a hardware failure occurs when the hosting virtual machine fails to execute. From the compute node, this means that the virtual machine process itself is experiencing execution problems, or that it is no longer running.

When such a failure is detected, the Wind River Linux server automatically tries to restart the affected virtual machine on the same compute node. If the restart operation fails, the virtual machine is automatically scheduled to deploy on an alternative compute node.

Virtual machine monitoring, and its recovery mechanisms, are always available for every deployed virtual machine in the Wind River Linux server cluster.

## Execution environment

The Wind River Linux Server Heartbeat daemon, built into the guest image, verifies the execution environment. If the guest kernel becomes unresponsive, the lack of heartbeat messages from the daemon triggers an alarm on the active controller.

For all purposes, the virtual machine is considered then to be at fault, and is therefore re-scheduled for execution, first on the same compute node, and then on a different host if necessary.

## Application monitoring

Software failures at the application level can be addressed within the context of the following failure scenarios:

* Sudden death of the application process. The application process ends abruptly, likely because of a software bug in its code.
* The application becomes unresponsive. Several conditions can lead the application process to stall, that is, to be unscheduled for additional work. This might happen because the application is waiting for some resource that is not available, or because of a bug in the application's logic.
* The application declares itself to have failed. Logic built into the application determines conditions under which it must declare itself to be in an unrecoverable error state.

Handling of these cases is optional, and subject to the proper API integration into the guest application itself.

Application monitoring happens when the Wind River Linux Server Heartbeat daemon in the virtual machine registers the application for monitoring. What happens after an application failure occurs is determined when the application is registered. By default, an application failure results in the Nova service triggering a hard reboot of the virtual
machine instance.

If the application makes use of the Wind River Linux Server Heartbeat API, it can instruct the active controller on how to proceed when the application declares itself in a state of error. This could include a restart of the virtual machine, which in the case of 1:1 HA application/VM pair, would trigger a VM switchover. The application can also use the VM Peer Notification API to receive notifications when virtual machines in the same server group go up or down.

### Data Persistence

Data persistence is another aspect that impacts the high-availability of a running application. This is addressed by providing storage persistence across applications restarts for Block Storage (Cinder) service remote HA using distributed storage backends, such as Ceph, for configuration databases.

By instrumenting the level of interaction between the guest application and the health-monitoring system, and by using the appropriate Cinder storage backends, guest applications can be deployed to run in different HA scenarios.

Note that in all cases, monitoring of hardware and virtual machines, and their corresponding failure recovery mechanisms, are always active.

## HA-unaware Guest Applications

These are applications designed with no consideration for special behavior needed when a failure occurs. Typical scenarios include:

* Stateless applications such as web servers serving static data, and data query systems. The requirement in these cases is for the application to be running continuously.

	This requirement is fulfilled when the application is deployed on the Titanium Server by the automatic monitoring at the hardware and virtual machine levels. Optionally, the application can benefit from all other monitoring levels when the proper instrumentation is in place.

* Stateful applications such as an enterprise-level call center, where the application's state is maintained in a database or some form of journaling system. An additional requirement in these cases is for storage persistence across restart operations, that is, for the state to be recoverable when the application restarts.

	This additional requirement is fulfilled when the application is deployed on the Titanium Server by the Block Storage (Cinder) service, when configured to use distributed storage backends.

## HA-aware Guest Applications

Typically, these are legacy applications supporting their own HA framework. They are expected to run unmodified, or with minimal changes, when deployed on the Titanium Server.

As with any other application, HA-aware applications benefit from the hardware and virtual machine monitoring processes, which provide them with automatic restart upon failures. When coupled with [server groups])/helion/commercial/carrier/dashboard/managing/groups/), they also benefit from the anti-affinity options to ensure that hot/standby running applications are protected against hardware failures.

HA-aware applications also benefit from internal tenant networks on top of which the application's HA framework, and any journaling framework it may use, can be deployed.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----