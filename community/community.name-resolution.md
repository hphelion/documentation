---
layout: default
title: "HP Helion OpenStack&#174; Community Enabling name resolution from tenant VMs in the overcloud"
permalink: /helion/community/name-resolution/
product: community

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/community/">&#9664; PREV</a> | <a href="/helion/community/">&#9650; UP</a> | <a href="/helion/community/install-overview/">NEXT &#9654;</a> </p>
-->

# Enabling name resolution from tenant VMs in the overcloud

To enable name resolution from tenant VMs in the overcloud, it is necessary to configure the DNS servers that will be used by `dnsmasq`.

Edit the `overcloud_neutron_dhcp_agent.json file` in the `ce-installer/tripleo/hp_passthrough` directory to add the desired `dnsmasq_dns_servers`
items.  

The `overcloud_neutron_dhcp_agent.json` file should also be copied over to a new file named `undercloud_neutron_dhcp_agent.json` to configure the same forwarders for the undercloud.

Use the following commands:

	{"dhcp_agent":
		{"config":
			[
				{"section":"DEFAULT",
					"values":
						[
							{"option":"dhcp_delete_namespaces","value":"True"},
							{"option":"dnsmasq_dns_servers", "value":"0.0.0.0"}
						]
					}
				]
			}
		}

Where `value` is the IP address of the DNS server to use.  Multiple DNS servers can be specified as a comma separated list.



 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
