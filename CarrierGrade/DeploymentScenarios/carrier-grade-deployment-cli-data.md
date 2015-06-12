---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Setting Up User Data Using the CLI"
permalink: /helion/openstack/carrier/deploy/cli/data/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Setting Up User Data Using the CLI

Using the CLI, you can save user data as a file for reference when launching an instance.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

When launching an instance, you can provide user data containing configuration details. If you use the CLI, you can save the user data to a text file, and then supply the file name as a parameter.

The scenarios require four user data files: one for instances using the Linux kernel bridging facilities, one for instances using the DPDK-accelerated virtual switch, and two for instances using a Linux router. The user data specifies which function to implement, and includes any information required by the function, such as the ports to bridge or the IP subnets to route.

**Caution:** The first line in the user data file is a mandatory comment. Without it, the user data is ignored, and all network interfaces are initialized using DHCP.

1. Create a directory `/usr/share/userdata` for storing user data files.

	The following command creates the directory if does not already exist.

		/usr/share/userdata

2. Create a user data file for use with the Linux kernel bridging facilities.

	Create a file `/usr/share/userdata/linux-bridge.txt` with the following content:

		#wrs-config
		FUNCTIONS="bridge"
		BRIDGE_PORTS="eth1,eth2.5"

	The BRIDGE_PORTS variable specifies the virtual machine ports to bridge: `eth1` (the tenant network)  and `eth2.5` (the internal network on VLAN ID 5).

3. Create a user data file for use with the DPDK-accelerated virtual switch.

	Create a file `/usr/share/userdata/linux-dpdk-vswitch.txt` with the following content:

		#wrs-config
		FUNCTIONS="hugepages,vswitch"
		BRIDGE_PORTS="eth0,eth1.5"

	Note that in this case, the name of the Ethernet interfaces refers to ports in the accelerated virtual switch, and not to ports in the virtual machine.

4. Create a user data file for use with the `tenant1` Linux router.

	Create a file `/usr/share/userdata/tenant1-linux-router.txt` with the following content:

		#wrs-config
		FUNCTIONS="routing"
		ADDRESSES=(
			"172.31.1.1,255.255.255.0,eth1,1500"
			"10.1.1.1,255.255.255.0,eth2.5,1500"
			)
		ROUTES=(
			"10.160.2.0/24,172.31.2.2,eth1"
			"10.170.2.0/24,10.1.1.2,eth2.5"
			)

5. Create a user data file for use with the `tenant2` Linux router.

	Create a file /usr/share/userdata/tenant2-linux-router.txt with the following content:

		#wrs-config
		FUNCTIONS="routing"
		ADDRESSES=(
			"172.31.2.1,255.255.255.0,eth1,1500"
			"10.1.2.1,255.255.255.0,eth2.5,1500"
			)
		ROUTES=(
			"10.170.2.0/24,172.31.2.2,eth1"
			"10.160.2.0/24,10.1.1.1,eth2.5"
			)

	The image user data files are available for use when launching instances.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----