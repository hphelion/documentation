---
layout: default
title: "Cloud OS Installation - Customize Network Connections (Optional)"
permalink: /cloudos/install/customize-network-connections/
product: cloudos

---

# Customize Network Connections (Optional)

This topic describes the steps to customize the network connections. These steps are optional. 

**Caution:** If you plan to customize the connections, you must do it before you complete the steps in "Complete the Admin Node Installation". After that, the connections dialogs are read only.
Once the install process is triggered, no changes can be made. If you want to make changes, you need to start over by re-installing the Admin Node.  

Based on the network infrastructure suggested in "Plan Server, Network and Storage Infrastructure for a Cloud" ( link ) , you must customize the Connections settings in the Connections view.

After the enumeration of ports is consistent across all machines in the cloud, the Connections view defines those ports into a set of logical connections (interfaces) that will be used to eventually
define the networks.

The connections are defined based on the Network Modes along with a list of logical interfaces and the corresponding physical interfaces' ports and bandwidth. For each logical connection (intf0, intf1,
intf2) the network type is identified (admin, os_sdn, public). The `os_sdn` value stands for OpenStack Software-Defined-Network.

## Examples of Network Modes

* Single Mode: All connections are shared on the same physical interface through VLAN.

* Dual Mode: All connections have their own interfaces where VLAN and bridge are off.

* Team Mode: All connections are shared on the same physical

## Examples of Logical Interface Values

* `intf0 (admin, bmc_vlan)`

* `intf1 (os_sdn)`

* `intf2 (public)`

## Examples of Physical Interface Values

* `1Gb (preferred) on 1st port`

* `1Gb (preferred) on 2nd port`

* `1Gb (preferred) on 3rd port`

In this Dual mode example, `1Gb (preferred) on 2nd port` means a one gigabit network for port 2, as enumerated by default from the server's BIOS or as overridden in the Server Types panel.
The "preferred" tag suggests that if the NIC/port does not support 1Gb, Cloud OS falls back to the next maximum speed supported by the NIC or port. However, if there is no preferred tag, it
means the port has to support 1Gb; otherwise the deployment may fail.

## Criteria for Changes to Default Connection Values

Here is the criteria to be considered if you make changes to the default connection values.

### Dual Mode Examples

In Dual mode, the default settings assume that all the nodes have their interfaces wired as follows.

* `eth0` - admin network

* `eth1` - os_sdn network

* `eth2` - public/external network

> **IMPORTANT:** In such a scenario, keep the default values intact.

In Dual mode, if the wiring of networks between the nodes are non-contiguous and/or not in sequence, you need to change the default mapping:

* Example 1: For all the nodes, `eth0 - admin`, `eth1 - public`, `eth2 - private` &mdash; the Connections table must be customized to look like the following:

    intf0 - 1Gb (preferred) on 1st port
	
    intf1 - 1Gb (preferred) on 3rd port
	
    intf2 - 1Gb (preferred) on 2nd port

* Example 2: For all the nodes, `eth0 - admin`, `eth2 - os_sdn`, `eth4 - public/external` &mdash; the Connections table must be customized to look like the following:

    intf0 - 1Gb (preferred) on 1st port
	
    intf1 - 1Gb (preferred) on 3rd port
	
    intf2 - 1Gb (preferred) on 5th port
	
### Single Mode Example

In Single mode, keep the defaults. It is assumed that the `eth0` port is configured on the switch to support tagged VLANs, as discussed in the next topic ( link ).

> **Note:** Interface mapping must be identical on all the nodes.

### Team Mode Examples

In Team mode, configure the virtual connections to use both trunks. For example:

* Map eth0, eth2, and eth4 to trunk 1.
* Map eth1, eth3, and eth5 to trunk 2.

Note that in this example, the eth0 and eth1 interfaces belongs to same VLAN; the same is true for the eth2 and eth3 pair, and the eth4 and eth5 pair. When the Admin node allocates the baremetal node, Cloud OS should create a teaming NIC using the NIC pairs.

Here's a partial example of how the Team mode configuration could look on this Connections dialog:

<table style="background-color: white; color: black;">

<tr>
<th>Logical Interface</th>
<th>Physical Interface</th>
<th>Interface Mode</th>
</tr>

<tr>
<td>intf0 (admin, bmc_vlan)</td>
<td>1Gb on 1st port, 1Gb on 2nd port</td>
<td>6</td>
</tr>

<tr>
<td>intf1 (os_sdn)</td>
<td>1Gb on 1st port, 1Gb on 2nd port</td>
<td>6</td>
</tr>

<tr>
<td>intf2 (public)</td>
<td>1Gb on 1st port, 1Gb on 2nd port</td>
<td>6</td>
</tr>

</table>

### Interface Mode

The Interface Mode signifies how traffic sent out of the bonded interface is dispersed over the actual interfaces.

* **Mode 0 (balance-rr)**

> Mode means the packets are transmitted in sequential order from the first available slave through the last. If two real interfaces are slaves in the 
bond and two packets arrive destined out of the bonded interface the first will be transmitted on the first slave and the second frame 
will be transmitted on the second slave. The third packet will be sent on the first and so on. This provides load balancing and fault tolerance.

* **Mode 1 (active-backup)**

> Mode 1 can be used for fault tolerance. One of the interfaces is placed into a backup state and will only make it active if the link is lost by the active interface. 
Only one slave in the bond is active at an instance of time. A different slave becomes active only when the active slave fails. 

* **Mode 2 (balance-xor)**

> Mode 2 transmits based on XOR formula. (Source MAC address is XOR'd with destination MAC address) modula slave count. 
This mode selects the same slave for each destination MAC address and provides load balancing and fault tolerance.

* **Mode 3 (broadcast)**

> Mode 3 transmits everything on all slave interfaces. This mode is the least used and provides only fault tolerance.

* **Mode 4 (802.3ad)**

> Mode 4 is also called Dynamic Link Aggregation. It creates aggregation groups that share the same speed and duplex settings. 
This mode requires a switch that supports IEEE 802.3ad Dynamic link.

* **Mode 5 (balance-tlb)**

> Mode 5 is also called Adaptive transmit load balancing. The outgoing traffic is distributed according to the current load and queue on each 
slave interface. Incoming traffic is received by the current slave.

* **Mode 6 (balance-alb)**

> Mode 6 is also called Adaptive load balancing. This mode includes balance-tlb + receive load balancing (rlb) for IPV4 traffic. 
The receive load balancing is achieved by ARP negotiation. The bonding driver intercepts the ARP Replies sent by the server on their 
way out and overwrites the src hw address with the unique hw address of one of the slaves in the bond such that different clients use different hw addresses for the server.

## Edit Connections

If you need to edit the connections:

1. In the Operational Dashboard, from the Environment tab, click Edit Connection for the Network Mode you want to customize.  Most likely, this would be Dual or Team.

2. The Edit Connection dialog presents the Physical Interface values in a succinct format, such as ?1g1. The value contains (up to) four characters, and follows these conventions: 

    * 1st character: the allowable value is a question mark (?) or blank.  The question mark indicates a preferred connection, meaning the  available bandwidth supported by the Network Interface card (NIC). If not specified (blank), Cloud OS configures the physical interface to the value specified by the next character.

    * 2nd character: the allowable value may be 1, 10, or 100. It is a numerical value to indicate the network bandwidth.

    * 3rd character: the value may be g, m, or k. It is the bandwidth unit. g represents gigabits; m represents megabits; k represents kilobits.

    * 4th character: the value may be a number between 1 and 16.  It is a numerical value to specify the port or NIC number.

3. To add settings, click Add Details to add a new blank row, and add the logical interface, physical interface and optional interface mode.

4. To delete settings, click one or more checkboxes next to the existing settings and click Delete Details.

## Next Step

Proceed to the [Customize Network Settings (Required)](/cloudos/install/customize-network-settings/) topic.

