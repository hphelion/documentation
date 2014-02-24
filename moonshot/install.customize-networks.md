---
layout: default
title: "Customize Networks (Required)"
permalink: /cloudos/moonshot/install/customize-networks/
product: moonshot

---


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/install/customize-connections/">&#9664; PREV</a> | <a href="/cloudos/moonshot/install/">&#9650; 
UP</a> | <a href="/cloudos/moonshot/install/complete-admin-node-installation/">NEXT &#9654;</a> </p>

# Customize Networks (Required)

This topic describes the steps to customize the network settings. These steps are required. 

* [Introduction](#introduction)

* [Customize the Admin Network](#customize-the-admin-network)

* [Customize the OS-SDN Network](#customize-the-os_sdn-network)

* [Customize the Public Network](#customize-the-public-network)

* [Next Step](#next-step)

## Introduction

Based on the network infrastructure suggested in the "Plan the Infrastructure for a Cloud" section of 
[Important Tasks Before You Install](/cloudos/moonshot/install/before-you-install), you must customize the network settings. Here are some of the
criteria to be considered while making changes to the default settings:

* For a production deployment, and to reduce the complexities of configuring the switches, it is strongly recommended that you provide separate wired 
networks for public and admin. This requires you to specify your own range of IP addresses and other settings.

* Get the details of your public network range from your Network Administrator. You must use a dedicated assigned IP address range when configuring the cloud's public network.          

**Caution:** You must customize the network settings before performing the steps in [Complete the Admin Node Installation](/cloudos/moonshot/install/complete-admin-node-installation/). After that, the network settings in the 
Operational Dashboard are read only. Once the install process is triggered, no changes can be made. If you want to make changes, you need to start 
over by re-installing the Admin Node.

* Some networks and address ranges for those networks are provided by default. You can modify or delete the IP address ranges as well as add new ones. You must use valid ranges that fall
within the subnet as defined by the subnet address and mask specified in the network details.

* If you edit the network IP address ranges and enter invalid ranges, you will get a validation error when you click Update Address Ranges in the Edit Address Ranges dialog. The validation
error shows the invalid address (start or end) and the corresponding network type. You must fix all errors in the Edit Address Ranges dialog and click Update Address Ranges to validate the
addresses are correct. Clicking Cancel will not trigger the validation step.

* **Caution:** Validation of the address ranges only occurs when you open the Edit Address Ranges dialog for each network and click Update Address Ranges. Otherwise,you will
not know if you have any errors. However, the Complete Install step will run a validation check and cannot be completed until the errors (if any) are fixed. If there is an address range error,
the validation check will show the network type and possibly the address value. If not, open the Edit Address Ranges dialog for the specified network and click Update Address
Ranges to identify the incorrect address.  

## Customize the Public Network

To provide external access, make sure you specify  a contiguous IP address range in the &lt;External/Public IP Address Range>. 
On successful deployment of a Cloud, only the Controller Node gets the external IP address. Therefore, a small range of this IP pool is sufficient. Get the range from your IT administrator.


### Edit the Public Network

To edit the public network:

1. On the Operational Dashboard, select the Environment tab > Networks.

2. Click **Edit Network** for the public Network Type.

3. Click each tab: Network, VLAN, and Router, one by one, to perform the following actions:
 * In the <b>Network</b> Tab, specify the <b>Subnet</b> and <b>Netmask</b> of your dedicated public IP address range. Do not change any other value. 
 The following values are set by default and need not be changed:
  * Bridge Enabled = False. 
  * In the VLAN Tab, VLAN Enabled = False.
  * VLANID= 300

4. In the <b>Router</b> Tab, in the <b>Router</b> box, enter the <b>Gateway IP</b> address of your Public IP address range. 
 The Router Preference default is sufficient. 
 

### Edit the Public Address Ranges

To edit the public address ranges:

1. In the public Edit Network drop-down list, select Edit Address Ranges to open the Edit Address Ranges dialog.

2. The Network Type and Subnet values are pre-populated by default, with the correct settings.

3. Click **Add Address Range** to modify the set of address range options.  Each time you click, you modify another set 
of address range options, based upon your public network. Get the range from your IT administrator:

 a. Set Node Type to host.
 
 b. Set IPV4 Start Addr to the start of the &lt;External/Public IP Address Range> described above.

 c. Set IPV4 End Addr to the end of the &lt;External/Public IP Address Range>. 
 Note: Provide the IP address range corresponding to the network address.

4. Click **Update Address Ranges** to save your changes to validate that the IP address is correct.

**Note:** If you enter invalid address ranges, you will get a validation error, which identifies the incorrect address (start or end) for the corresponding network type. You must fix all
errors in the <b>Edit Address Ranges</b> dialog and click <b>Update Address Ranges</b> to validate the addresses are correct.


## Customize the Nova_Flat Network

The Nova_Flat network is used for connectivity between the Controller and Baremetal hosts and the Moonshot cartridges. The Controller node provides DHCP and PXE services for this network. Workloads are provisioned to the Moonshot cartridges using this network.

### Edit the Nova_Flat Network

To edit the Nova_Flat network:

1. On the Operational Dashboard, select the Environment tab > Networks.

2. Click Edit Network for the Nova_Flat network type.

3. Click each tab: Network, VLAN, and Router, one by one, to perform the following actions:
 * In the <b>Network</b> Tab, specify the <b>Subnet</b> and <b>Netmask</b> of your dedicated public IP address range. Do not change any other value. 
 The following values are set by default and need not be changed:
  * Bridge Enabled = False. 
  * In the VLAN Tab, VLAN Enabled = False.
  * VLANID= 172

4. In the <b>Router</b> Tab, in the <b>Router</b> box, if you updated the Subnet on the Network tab, the router needs to be modified here accordingly. The Router Preference default is sufficient. 

5. Click <b>Update Network</b> to save your changes.

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

**Note:** If you enter invalid address ranges, you will get a validation error, which identifies the incorrect address (start or end) for the corresponding network type. You must fix all
errors in the Edit Address Ranges dialog and click <b>Update Address Ranges</b> to validate the addresses are correct.




## Customize the IPMI Network

The IPMI network is used for communication between the Baremetal host and the Moonshot Chassis Manager. This includes chassis and cartridge discovery, power control of cartridges and nodes, and monitoring of the health of the Moonshot systems.

### Edit the IPMI Network

To edit the IPMI network:

1. On the Operational Dashboard, select the Environment tab > Networks.

2. Click Edit Network for the IPMI network type.

3. Click each tab: Network, VLAN, and Router, one by one, to perform the following actions:
 * In the <b>Network</b> Tab, specify the <b>Subnet</b> and <b>Netmask</b> of your dedicated public IP address range. Do not change any other value. 
 The following values are set by default and need not be changed:
  * Bridge Enabled = False. 
  * In the VLAN Tab, VLAN Enabled = False.
  * VLANID= 172

4. In the <b>Router</b> Tab, in the <b>Router</b> box, if you updated the Subnet on the Network tab, the router needs to be modified here accordingly. The Router Preference default is sufficient. 

5. Click <b>Update Network</b> to save your changes.


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

Proceed to the next topic, [Complete Admin Node Installation (Required)](/cloudos/moonshot/install/complete-admin-node-installation/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


