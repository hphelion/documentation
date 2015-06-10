---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Adding and Removing Subnets"
permalink: /helion/commercial/carrier/dashboard/managing/network/guest/vlan/
product: carrier-grade

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/commercial/carrier/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/carrier/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/carrier/ga1/">NEXT &#9654;</a></p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): Adding Guest VLANs

Tenant users can define a guest VLAN when they add a new IP subnet to a tenant network they are creating, or to an existing one.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

From the Horizon dashboard, you add the VLAN ID of the guest VLAN to the **Subnet Detail** tab of the **Create Subnet** window.

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Networks** link on the **Admin** dashboard **System** panel.

	The network(s) in the domain appear. 

3. Click the name of the network you want to work with.

4. On the **Network Detail** page click **Create Subnet**.

5. On the **Subnet** tab of the **Create Network** screen:

	a. Enter the subnet name.

	b. Enter a network address range for the subnet in CIDR (Classless Inter-Domain Routing) format in the **Network Address** field, for example: 192.168.0.0/24.

	c. Select IPv4 or IPv6, as appropriate, in the IP Version field.

	d. Enter a gateway IP address from the subnet or leave the **Gateway IP** field blank to use the default value for the gateway IP address; for example, 192.168.0.1 for 192.168.0.0/24.

	e. Leave **Disable Gateway** clear to enable the default gateway for this network, or select **Disable Gateway** to create the network with no default gateway.

6. Click Next.

7. On the Subnet Details tab:

	a. Clear the **Enable DHCP** option, as needed, to not use the network as a DCHP. DHCP is enabled by default. If enabled, the subnet will serve as your DHCP server. Instances associated with the subnet will be assigned an IP address from this pool. 

	b. Optionally, enter the starting and ending IP addresses you want for your DHCP allocation pool in the **Allocation Pools** field, in the format IP*ADDR,IP*ADDR. For example: 192.168.1.10,192.168.1.120. By deafult, the server has an application pool starting with 10.0.0.0/24.

	c. Optionally, enter the IP Address of your subnet in the **DNS Name Servers** field. If blank, your subnet will default to using HP's internal DNS which uses DNSMASQ.

	d. Optionally, enter the Destination CIDR and Next Hop for your subnet in the **Host Routes** field to create host routes.

	e. Add the VLAN ID of the guest VLAN

8. Click **Create**.  

## Using the CLI

From the command line interface, a guest VLAN can be defined using the `--vlan-id` option when creating a new subnet, as illustrated below:

	neutron subnet-create --tenant-id ${tenant_UUID} \
	--name my-new-subnet --vlan-id 10

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
