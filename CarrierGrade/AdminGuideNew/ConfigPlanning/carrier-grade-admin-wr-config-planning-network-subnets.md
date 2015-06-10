---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Planning for Subnets"
permalink: /helion/openstack/carrier/configuration/plan/network/subnets/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Planning for Subnets
<!-- From the Titanium Server Admin Guide -->

Use the System Managed Subnet and Enable DHCP subnet attributes to determine how IP addresses are allocated and offered on an IP subnet.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

With the proper configuration in place, DHCP services can be provided by the built-in Neutron DHCP server, by a standalone server available from an external network infrastructure, or by both.

When creating a new IP subnet for a tenant network you can specify the following attributes:

* **System Managed Subnet** - When this attribute is enabled, the subnet is system managed. the Neutron service automatically allocates an IP address from the address allocation pools defined for the subnet to any new virtual machine instance with a virtual Ethernet interface attached to the tenant network. Once allocated, the pair (MAC address, IP address) is registered in the Neutron database as part of the overall registration process for the new virtual machine.

	When the system managed subnet attribute is disabled, the subnet is unmanaged. No automatic allocation of IP addresses takes place, and the Neutron DHCP service for the subnet is disabled. Allocation of IP addresses for new virtual machines must be done at boot time using the CLI or the API interfaces.

* **Enable DHCP** - When this attribute is enabled, a virtual DHCP server becomes available when the subnet is created. It uses the (MAC address, IP address) pairs registered in the Neutron database to offer IP addresses in response to DHCP discovery requests broadcast on the subnet. DHCP discovery requests from unknown MAC addresses are ignored.

	The Neutron DHCP server can only be enabled on system managed subnets. DHCP services for unmanaged subnets, if required, must be provisioned by external, non-Neutron, DHCP servers.

	When the DHCP attribute is disabled, all DHCP and DNS services, and all static routes, if any, must be provisioned externally.

* **Allocation Pools** - This a list attribute where each element in the list specifies an IP address range, or address pool, in the subnet address space that can be used for dynamic offering of IP addresses. By default there is a single allocation pool comprised of the entire subnet's IP address space, with the exception of the default gateway's IP address.

	An external, non-Neutron, DHCP server can be attached to a system managed subnet to support specific deployment needs as required. For example, it can be configured to offer IP addresses on ranges outside the Neutron allocation pools to service physical devices attached to the tenant network, such as testing equipment and servers.
	
	Allocation pools can only be specified on system managed subnets.

On the web administration interface you set these attributes in the [Subnet Detail tab of the Create Subnet window](/helion/commercial/carrier/dashboard/managing/network/subnet/).

## Accessing the Metadata Server {#meta}

Access to the system's metadata server is available using the well known URL http://169.254.169.254. In the HP Helion OpenStack Carrier Grade implementation, access to this address is provided by a virtual router attached to the tenant on which the access request is made. Virtual routers are automatically configured as proxies to the metadata service.

The following requirements must be satisfied in order for a guest application to access the metadata service:

* There is a route table entry to route traffic destined to the 169.254.169.254 address via a Neutron router, or via a suitable static route to the 169.254.169.254 address.
* The metadata server knows about the virtual machine instance associated with the MAC and IP addresses of the virtual Ethernet interface issuing the metadata service request. This is necessary for the metadata server to be able to validate the request, and to identify the virtual machine's specific data to be returned.

	On system managed subnets, the Neutron service has all address information associated with the virtual machines in its database.

	On unmanaged subnets, you must tell the Neutron service the IP address of the network interface issuing the metadata service requests. This can only be done using the command line or API interfaces when instantiating the virtual machine, as shown:

		nova boot \
		--nic net-id=net-uuid,vif-model=avp,v4-fixed-ip=172.18.0.1 \
		my-new-vm

	In this simplified example, the option v4-fixed-ip tells Neutron what the IP address for this interface should be. The interface's MAC address is automatically generated by Nova.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----