---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Changing the DNS Server Configuration"
permalink: /helion/openstack/carrier/admin/system/config/dns/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Changing the DNS Server Configuration #

<!-- modeled after Wind River Admin Guide -->

You can change the DNS servers defined for the Titanium Server at any time after installation.

You change these addresses using the [Horizon dashboard](#horizon) or [the CLI](#cli).

## Change the IP address using the Horizon Dashboard {#horizon}

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

	* Use the IP address for the appropriate region where you want to make the change, either: the hLinux region or the Wind River Linux region.

	The **System Configuration** pane is available from the System Panel section of the Admin menu.

2. Select the DNS tab.

	The **DNS page** appears, showing the currently defined DNS servers and their IP addresses.

3. Click Edit DNS.

	The **Edit DNS** dialog box appears.

4. Replace the DNS Server IP addresses with different ones as required.

## Change the IP address using the CLI {#cli}

To view the existing DNS server configuration, use the following command.

	system dns-show

To change the DNS server IP addresses, use the following command syntax. The nameservers option takes a comma-delimited list of DNS server IP addresses.

	system dns-modify \
	nameservers=IP_address_1[,IP_address_2][,IP_address_3] action=apply


 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
