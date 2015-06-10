---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Creating QOS Policies"
permalink: /helion/commercial/carrier/dashboard/managing/network/qos/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Creating QOS Policies

Quality of Service (QoS) policies specify relative packet processing priorities applied by the AVS switch on each compute node to incoming tenant network's traffic during overload conditions.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

The QoS polices play no role under normal traffic loads, when no input traffic queues in the AVS are close to their
overflow limits.

QoS policies are created by the cluster administrator, and selected by the tenant users to apply on a per-tenant network basis. 

An admin user can create and delete QOS policies as needed. 


### Create a QOS policy

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Networks** link on the **Admin** dashboard **System** panel.

	The network(s) in the domain appear. 

3. On the **QOS Policies** tab, click the **Create QoS Policy** button:

	a. Enter a name for the policy. 

	b. Enter a text description for the policy.

	c. Enter a sceduler weight.

	This is the relative weight the AVS traffic scheduler uses on overload conditions, as compared with the scheduler weight of all other QoS policies. See [About scheduler weight](#weight) below.

	d. Select a project. 

	The new QoS policy is available to only the selected project. If no pronect is selected, it is available to all projects in the cluster.

	Project users can select available QoS policies when the tenant networks are created from the [Create Network](/helion/commercial/carrier/dashboard/managing/network/create/) window and the Edit Network window.

	d. Enter a gateway IP address from the subnet or leave the **Gateway IP** field blank to use the default value for the gateway IP address; for example, 192.168.0.1 for 192.168.0.0/24.

	e. Leave **Disable Gateway** clear to enable the default gateway for this network, or select **Disable Gateway** to create the network with no default gateway.

6. Click Next.

7. On the Subnet Details tab:

	a Clear the **Enable DHCP** option, as needed, to not use the network as a DCHP. DHCP is enabled by default. If enabled, the subnet will serve as your DHCP server. Instances associated with the subnet will be assigned an IP address from this pool. 

	b. Optionally, enter the starting and ending IP addresses you want for your DHCP allocation pool in the **Allocation Pools** field, in the format IP*ADDR,IP*ADDR. For example: 192.168.1.10,192.168.1.120. By deafult, the server has an application pool starting with 10.0.0.0/24.

	c. Optionally, enter the IP Address of your subnet in the **DNS Name Servers** field. If blank, your subnet will default to using HP's internal DNS which uses DNSMASQ.

	d. Optionally, enter the Destination CIDR and Next Hop for your subnet in the **Host Routes** field to create host routes.

8. Click **Create**.  

## About scheduler weight {#weight}

Scheduler weight is the relative weight the AVS traffic scheduler uses on overload conditions, as compared with the scheduler weight of all other QoS policies.

The scheduler weight is a positive integer number associated with each QoS policy. On overload, the AVS schedules traffic processing for each tenant network according to its assigned QoS policy. By default, with no specific QoS policies defined, traffic from all tenant networks is processed in round-robin mode, one tenant network after another. Effectively, the default behavior is similar to assigning a scheduler weight of 1 to all tenant networks.

When a specific QoS policy with a scheduler weight greater than 1 is applied to a tenant network, its traffic is scheduled with a relative higher frequency. For example, if the scheduler weight for tenant network A is 10, and the one for tenant network B is 100, then on overload, tenant network B will see its queued traffic processed 10 times as often as tenant network A.

The handling of the scheduler weight is implemented as a per-packet token bucket for each tenant network. This means that each unit in the scheduler weight counts as one packet to be processed in sequence. In the previous example, the AVS processes 10 consecutive packets from tenant network A, followed by 100 packets from tenant network B. This implementation ensures a fair-share behavior that prevents any tenant network from running into total bandwidth starvation, even if its scheduler weight is relatively low.

The range of values for the scheduler weight is arbitrary. You must however ensure that the values assigned to the different policies make sense for the intended applications.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
