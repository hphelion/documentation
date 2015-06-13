---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Adding an Infrastructure Network Using the CLI"
permalink: /helion/openstack/carrier/admin/system/config/cli/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Adding an Infrastructure Network Using the CLI #

<!-- modeled after Wind River Admin Guide -->


If an infrastructure network is not installed during initial configuration, you can add one later using the CLI.

**Note:** On a cluster with an infrastructure network, each host must have an infrastructure interface before it can be unlocked. Ensure that all hosts have the required hardware.

For a system with an LVM storage backend, the infrastructure network is optional. It can be used to offload the internal management network on clusters with many compute nodes.

You can view the existing infrastructure network configuration using the following command on the active controller.

	system infra-show

You can add an infrastructure network after initial installation. For this operation, all nodes except the active controller must be locked. During the change, the nodes cannot be unlocked until the new configuration is applied to both controllers. In addition, before a node can be unlocked, an infrastructure interface must be configured on the host.

1. Use the following command to lock all hosts except the active controller:

		system host-lock hostname

2. Use the following command to add an infrastructure interface on the standby controller, specifying a name for the network and the port to use for the network connection. To identify the port to use for an infrastructure network, consult your configuration plan.

	**Note:** You can also add an infrastructure network to a shared interface as a VLAN-tagged network.

		system host-if-add -n \
		infra hostname interfacename port

	For example:

		system host-if-add -n \
		infra controller-1 infra0 eth3

3. Use the following command to add the same infrastructure network on the active controller.

		system host-if-add -n \
		infra controller-0 infra0 eth3

	For example:

		system host-if-add -n \
		infra controller-0 infra0 eth3

4. Use the following command to specify the infrastructure subnet.

		system infra-modify \
		infra_subnet=subnet/mask action=apply

	For example:

		system infra-modify \
		infra_subnet=192.168.205.0/24 action=apply

5. Use the following command to reboot the standby controller.

		system host-reboot controller-1

	This updates its configuration.

	Wait for the standby controller to reboot. To monitor its status, use the following command.

		watch -n 5 system host-list

	This displays a refreshed host list every five seconds. Monitor the output until the standby controller is shown as locked and online. To stop monitoring, enter 

		CTRL-C.

	**Caution:** To prevent potential service conflicts due to inconsistent controller network configurations, do not unlock the standby controller until the active controller is also rebooted
.
6. Use the following command to reboot the active controller.

		sudo reboot

	The system is going down for reboot NOW!

	Wait for the controller to reboot.

7. Use the following command to log in to the active controller and become the Keystone admin user.

		/etc/nova/openrc

8. Unlock the standby controller.

		system host-unlock controller-1
9. Add infrastructure interfaces to each compute node.

	For each node, use the following command.

		system host-if-add -n \
		infra hostname networkname port
You can now unlock the compute nodes. This clears any `Configuration out-of-date` errors.

 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
