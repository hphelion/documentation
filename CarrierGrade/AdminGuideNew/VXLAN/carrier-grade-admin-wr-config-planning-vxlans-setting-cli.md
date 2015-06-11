---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Setting Up a VXLAN Provider Network using the CLI"
permalink: /helion/openstack/carrier/config/plan/vxlans/setting-cli/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Setting Up a VXLAN Provider Network Using the CLI
<!-- From the Titanium Server Admin Guide -->

You can use the command line interface to set up a VXLAN provider network and add segmentation ranges.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

VXLAN provider networks are an alternative to VLAN provider networks when VM L2 connectivity is required across separate Layer 2 network segments separated by one or more Layer 3 routers.

The steps in this section describe how to set up a VXLAN provider network and add segmentation ranges using the
command line interface. For information about using the Horizon interface, see [Setting Up a VXLAN Provider Network using Horizon](/helion/openstack/carrier/config/plan/vxlans/setting/). 

To create a provider network using the CLI, use the following command:

	neutron providernet-create name \
	--type=type --description=description mtu=mtu_size

where

* `name` is a name for the provider network
* `type` is the type of provider network (flat, vlan, or vxlan
* `description` is a brief description for reference purposes
* `mtu_size` is the maximum transmission unit size

To add a segmentation range using the CLI, use the following command:

    neutron providernet-range-create provider_network \
    --name=range_name --tenant_id=tenant \
    --description=description --range min-max \
    --group multicast_address --port=udp_port \
    --ttl=time_to_live

where

* `provider_network` is the name of the associated provider network
* `name` is a name for the segmentation range
* `tenant` is the name or UUID of the tenant associated with the range
* `description` is a brief description for reference purposes
* `min` is the lowest value in the range
* `max` is the highest value in the range

The following additional values are used for segmentation ranges on VxLAN provider networks:

* `multicast_address` The IPv4 or IPv6 address for participation in a multicast group used to discover MAC addresses for destination VMs. You can use a different multicast group for each segmentation range to help organize and partition network traffic.
* `udp_port` - The destination UDP port for packets sent on the VXLAN. You can select either:
	
	*  the IANA standard 4789 to use this range with the OpenStack Neutron service
	*  the legacy standard 8472 for use with some commercial switch equipment.

* `time_to_live` - The time-to-live, measured in hops, for packets sent on the VXLAN. The value is decremented at each hop; when it reaches zero, the packet expires. You can use this to limit the scope of the VXLAN. For example, to limit the packet to no more than three router hops, use a time-to-live value of 4.

For more about these parameters, see [Setting Up a VXLAN Provider Network using Horizon](/helion/openstack/carrier/config/plan/vxlans/setting/).

You can obtain information about provider networks and segmentation ranges using the following commands.

	neutron net-list-on-providernet providernet
	neutron providernet-range-show providernet-range

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----