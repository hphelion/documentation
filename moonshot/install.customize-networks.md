---
layout: default
title: "Customize Networks"
permalink: /cloudos/moonshot/install/customize-networks/
product: moonshot

---


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/install/view-connection-settings/">&#9664; PREV</a> | <a href="/cloudos/moonshot/install/">&#9650; 
UP</a> | <a href="/cloudos/moonshot/install/complete-admin-node-installation/">NEXT &#9654;</a> </p>

# Customize Networks

This topic describes the steps to customize the network settings. These steps are required. 

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"><b>Caution:</b> You must customize the network settings before performing the steps in <a href="/cloudos/moonshot/install/complete-admin-node-installation/">Complete the Admin Node Installation</a>. After that, the network settings in the Operational Dashboard are read only. Once the install process is triggered, no changes can be made. If you want to make changes, you need to start over by re-installing the Admin Node. </p>

* [Introduction](#introduction)

* [Customize the Public Network](#customize-the-public-network)

* [Customize the Nova_Flat Network](#customize-the-nova-flat-network)

* [Customize the IPMI Network](#customize-the-ipmi-network)

* [Next Step](#next-step)

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"><b>Note:</b>  You do not have to customize the Admin Network. </p>

## Introduction

Based on the network infrastructure suggested in the "Plan the Infrastructure for a Cloud" section of [Important Tasks Before You Install](/cloudos/moonshot/install/before-you-install), you must customize the network settings. Here are some of the criteria to be considered while making changes to the default settings:

* For a production deployment, and to reduce the complexities of configuring the switches, it is strongly recommended that you provide separate wired networks for public and admin. This requires you to specify your own range of IP addresses and other settings.

* Get the details of your public network range from your Network Administrator. You must use a dedicated assigned IP address range when configuring the cloud's public network.          

* Some networks and address ranges for those networks are provided by default. You can modify or delete the IP address ranges as well as add new ones. You must use valid ranges that fall within the subnet as defined by the subnet address and mask specified in the network details.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"><b>Note:</b> Validation of the address ranges only occurs when you open the <b>Edit Address Ranges</b> dialog for each network and click Update Address Ranges. Otherwise,you will not know if you have any errors. However, the <b>Complete Install</b> step will run a validation check and cannot be completed until the errors (if any) are fixed. If there is an address range error, the validation check will show the network type and possibly the address value. If not, open the <b>Edit Address Ranges</b> dialog for the specified network and click <b>Update Address Ranges</b> to identify the incorrect address.  </p>

## Customize the Public Network

To provide external access, make sure you specify  a contiguous IP address range in the &lt;External/Public IP Address Range>. On successful deployment of a Cloud, only the Controller Node gets the external IP address. Therefore, a small range of this IP pool is sufficient. Get the range from your IT administrator.


### Edit the Public Network

To edit the public network:

<ol>
<li>On the Operational Dashboard, select the <b>Environment</b> tab > <b>Networks</b>. </li>
<li>Click <b>Edit Network</b> for the public Network Type. </li>
<li>Click each tab: Network, VLAN, and Router, one by one, to perform the following actions:

<ul>

<li>On the <b>Network</b> tab, specify the <b>Subnet</b> and <b>Netmask</b> of your dedicated public IP address range. Do not change:
<ul>
<li>Bridge Enabled = False
</ul>

<li>On the <b>VLAN</b> tab, do not change:
<ul>
<li>VLAN Enabled = False
<li>VLANID = 300
</ul>

<li>On the <b>Router</b> tab, in the <b>Router</b> box, enter the <b>Gateway IP</b> address of your Public IP address range. 
The Router Preference default value is 5 and is sufficient.
<p><b>Note:</b> The Router Preference value indicates the number of hops to reach the destination; the lesser the value, the higher the priority of the network.</p>

</ul> </li>
</ol>
 
### Edit the Public Address Ranges

To edit the public address ranges:

1. In the public Edit Network drop-down list, select Edit Address Ranges to open the Edit Address Ranges dialog.

2. The Network Type and Subnet values are pre-populated by default, with the correct settings.

3. Click **Add Address Range** to modify the set of address range options.  Each time you click, you modify another set 
of address range options, based upon your public network. Get the range from your IT administrator:

 a. Set Node Type to host.
 
 b. Set IPV4 Start Addr to the start of the &lt;External/Public IP Address Range> described above.

 c. Set IPV4 End Addr to the end of the &lt;External/Public IP Address Range>. <b>Note</b>: Provide the IP address range corresponding to the network address.

4. Click **Update Address Ranges** to save your changes to validate that the IP address is correct.

**Note:** If you enter invalid address ranges, you will get a validation error, which identifies the incorrect address (start or end) for the corresponding network type. You must fix all errors in the <b>Edit Address Ranges</b> dialog and click <b>Update Address Ranges</b> to validate the addresses are correct.


## Customize the Nova_Flat Network

The Nova_Flat network is used for connectivity between the Controller and Baremetal hosts and the Moonshot cartridges. The Controller node provides DHCP and PXE services for this network. Workloads are provisioned to the Moonshot cartridges using this network.

### Edit the Nova_Flat Network

To edit the Nova_Flat network:

<ol>

<li>On the Operational Dashboard, select the <b>Environment</b> tab > <b>Networks</b>. </li>

<li>Click <b>Edit Network</b> for the public Network Type. </li>

<li>Click each tab: Network, VLAN, and Router, one by one, to perform the following actions:

<ul>

<li>On the <b>Network</b> tab, specify the <b>Subnet</b> and <b>Netmask</b> of your dedicated public IP address range. Do not change:
<ul>
<li>Bridge Enabled = False
</ul>

<li>On the <b>VLAN</b> tab, do not change:
<ul>
<li>VLAN Enabled = False
<li>VLANID = 172
</ul>

<li>On the <b>Router</b> tab, in the <b>Router</b> box, enter the <b>Gateway IP</b> address of your Public IP address range. The Router Preference default value is 10 and is sufficient.
</ul> </li>

<li>  Click <b>Update Network</b> to save your changes. </li>

</ol>

### Edit the Nova_Flat Address Ranges

To edit the Nova_Flat address ranges:

1. In the Nova_Flat <b>Edit Network</b> drop-down list, select <b>Edit Address Ranges</b> to open the <b>Address Ranges</b> dialog.

2. The following fields are pre-populated:
 * <b>Network Type</b> 
 * <b>Subnet values </b>
 * <b>Node Type</b> - It is set for three types: Host, Router, DHCP.
 * <b>IPV4 Start Addr</b> displays the start of the IP address range for all three node types.
 * <b>IPV4 End Addr</b> displays the end of the IP address range for all three node types.

3.	Make the required changes as per your environment.

4. (Optional) Click <b>Add Address Range</b> to add a set of address range options to the bottom of the Edit Address Ranges dialog box. Each time you click Add Address Range, you add another set of address range options to be filled in. <b>Note</b>: Provide the IP address range corresponding to the network address.

5.	Click <b>Update Address Ranges</b> to save your changes.

**Note:** If you enter invalid address ranges, you will get a validation error, which identifies the incorrect address (start or end) for the corresponding network type. You must fix all errors in the Edit Address Ranges dialog and click <b>Update Address Ranges</b> to validate the addresses are correct.


## Customize the IPMI Network

The IPMI network is used for communication between the Baremetal host and the Moonshot Chassis Manager. This includes chassis and cartridge discovery, power control of cartridges and nodes, and monitoring of the health of the Moonshot systems.

### Edit the IPMI Network

To edit the IPMI network:

<ol>

<li>On the Operational Dashboard, select the <b>Environment</b> tab > <b>Networks</b>. </li>

<li>Click <b>Edit Network</b> for the public Network Type. </li>

<li>Click each tab: Network, VLAN, and Router, one by one, to perform the following actions:

<ul>

<li>On the <b>Network</b> tab, specify the <b>Subnet</b> and <b>Netmask</b> of your dedicated public IP address range. Do not change:
<ul>
<li>Bridge Enabled = False
</ul>

<li>On the <b>VLAN</b> tab, do not change:
<ul>
<li>VLAN Enabled = False
<li>VLANID = 172
</ul>

<li>On the <b>Router</b> tab, you do not need to specify the <b>Gateway IP</b> address in the <b>Router</b> box, and the Router Preference default value is sufficient. 
</ul> </li>

<li>  Click <b>Update Network</b> to save your changes. </li>

</ol>


### Edit the IPMI Address Ranges

To edit the IPMI address ranges:

1. In the IPMI <b>Edit Network</b> drop-down list, select <b>Edit Address Ranges</b> to open the <b>Address Ranges</b> dialog.

2. The following fields are pre-populated:
 * <b>Network Type</b> 
 * <b>Subnet values </b>
 * <b>Node Type</b> - It is set for three types: Host, Router, DHCP.
 * <b>IPV4 Start Addr</b> displays the start of the IP address range for all three node types.
 * <b>IPV4 End Addr</b> displays the end of the IP address range for all three node types.

3.	Make the required changes as per your environment.

4. (Optional) Click <b>Add Address Range</b> to add a set of address range options to the bottom of the Edit Address Ranges dialog box. Each time you click Add Address Range, you add another set of address range options to be filled in. <b>Note</b>: Provide the IP address range corresponding to the network address.

5.	Click <b>Update Address Ranges</b> to save your changes.

**Note:** If you enter invalid address ranges, you will get a validation error, which identifies the incorrect address (start or end) for the corresponding network type. You must fix all
errors in the Edit Address Ranges dialog and click <b>Update Address Ranges</b> to validate the addresses are correct.



## Next Step

Proceed to the next topic, [Complete Admin Node Installation](/cloudos/moonshot/install/complete-admin-node-installation/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


