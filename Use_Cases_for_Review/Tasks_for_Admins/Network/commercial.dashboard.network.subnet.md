---
layout: default
title: "HP Helion OpenStack&#174; Adding and Removing Subnets"
permalink: /helion/commercial/dashboard/network/subnet/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/commercial/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/ga1/">NEXT &#9654;</a> </p>
-->

# HP Helion OpenStack&#174; Adding and Removing Subnets

When a <a href="#/helion/community/network/create/">network is created</a>, a subnet (short for <em>subnetwork</em>) can be assigned upon creation. However, you might need to add a subnet to a network at a later time.</p>

A subnet is a logically visible subdivision of a network. A subnet enables you to group instances logically, while maintaining a single network address to connect to the Internet.</p>

An admin user can create and delete subnets as needed. </p>

	**Note:** Before you delete a subnet, you must first <a href="/helion/community/network/ports/">delete all ports</a> associated with the subnet.</p>

### Add a subnet</h3>

1. <a href="/helion/community/dashboard/login/">Launch the HP Helion OpenStack Community web interface.</a></p>

2. Click the <strong>Networks</strong> link on the <strong>Admin</strong> dashboard <strong>System</strong> panel.</p>

	The network(s) in the domain appear. </p>

3. Click the name of the network you want to work with.</p>

4. On the <strong>Network Detail</strong> page click <strong>Create Subnet</strong>.</p>

5. On the <strong>Subnet</strong> tab of the <strong>Create Network</strong> screen:</p>

	a. Enter the subnet name.</li>

	b. Enter a network address range for the subnet in CIDR (Classless Inter-Domain Routing) format in the <strong>Network Address</strong> field, for example: 192.168.0.0/24.</li>

	c. Select IPv4 or IPv6, as appropriate, in the IP Version field.</li>

	d. Enter a gateway IP address from the subnet or leave the <strong>Gateway IP</strong> field blank to use the default value for the gateway IP address; for example, 192.168.0.1 for 192.168.0.0/24.</li>

	e. Leave <strong>Disable Gateway</strong> clear to enable the default gateway for this network, or select <strong>Disable Gateway</strong> to create the network with no default gateway.</li>

6. Click Next.</p>

7. On the Subnet Details tab:</p>

	a Clear the <strong>Enable DHCP</strong> option, as needed, to not use the network as a DCHP. DHCP is enabled by default. If enabled, the subnet will serve as your DHCP server. Instances associated with the subnet will be assigned an IP address from this pool. .</li>

	b. Optionally, enter the starting and ending IP addresses you want for your DHCP allocation pool in the <strong>Allocation Pools</strong> field, in the format IP<em>ADDR,IP</em>ADDR. For example: 192.168.1.10,192.168.1.120. By deafult, the server has an application pool starting with 10.0.0.0/24.	</li>

	c. Optionally, enter the IP Address of your subnet in the <strong>DNS Name Servers</strong> field. If blank, your subnet will default to using HP's internal DNS which uses DNSMASQ.</li>

	d. Optionally, enter the Destination CIDR and Next Hop for your subnet in the <strong>Host Routes</strong> field to create host routes.</li>

8. Click <strong>Create</strong>.  

### Delete a subnet ### {#deleteport}</h3>

Before you delete a subnet, you must first <a href="/helion/community/network/ports/">delete all ports</a> associated with the subnet.</p>

1. <a href="/helion/community/dashboard/login/">Launch the HP Helion OpenStack Community web interface.</a></p>

2. Click the <strong>Networks</strong> link on the <strong>Admin</strong> dashboard <strong>System</strong> panel.</p>

3. The network(s) for the selected project appear. </p>

4. Click the name of the network you want to work with.</p>

5. On the <strong>Network Detail</strong> page, for the subnet you want to delete, click <strong>More &gt; Delete Subnet</strong>.</p>

6. In the confirmation screen, click <strong>Delete Subnet</strong>.  

	A message appears indicating if the subnet was deleted successfully.</p>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a></p>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*