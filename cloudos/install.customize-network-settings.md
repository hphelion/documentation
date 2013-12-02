---
layout: default
title: "Customize Network Settings (Required)"
permalink: /cloudos/install/customize-network-settings/
product: cloudos

---

# Customize Network Settings (Required)

This topic describes the steps to customize the network settings. These steps are required. 

**Caution:** If you plan to customize the network settings, you must do it before performing the steps in [Complete the Admin Node Installation](/cloudos/install/complete-admin-node-installation/). 
After that, the network settings in the HP Cloud OS Operational Dashboard are read only. Once the install process is triggered, no changes can be made. If you want to make changes, you need to start over by re-installing the Admin Node.

<ul>
    <li>[Introduction](#introduction)</li>
    <li>[Customize the Admin Network](#customize-the-admin-network)</li>
    <li>[Customize the OS-SDN Network](#customize-the-os_sdn-network)</li>
    <li>[Customize the Public Network](#customize-the-public-network)</li>
</ul> 


## Introduction

Based on the network infrastructure suggested in "Plan Server, Network and Storage Infrastructure
for a Cloud" ( link ), you must customize the network settings. Here are some of the
criteria to be considered while making changes to the default settings:

* The default settings assume you have a single physical network across the Admin Node and all
the managed nodes, and other networks such as public and os_sdn are configured as VLAN on
the same physical network. To set up in this mode, it is recommended that you configure the
switch to allow tagged VLAN traffic.

* For a production type of deployment and to reduce the complexities of configuring the switches
(as suggested above), it is strongly recommended that you provide separate wired networks for
public, os_sdn and admin. This requires you to specify your own range of IP addresses and
other settings.

* Some networks and address ranges for those networks are provided by default. You can modify
or delete the IP address ranges as well as add new ones. You must use valid ranges that fall
within the subnet as defined by the subnet address and mask specified in the network details.

> If you edit the network IP address ranges and enter invalid ranges, you will get a validation error
when you click Update Address Ranges in the Edit Address Ranges dialog. The validation
error shows the invalid address (start or end) and the corresponding network type. You must fix
all errors in the Edit Address Ranges dialog and click Update Address Ranges to validate the
addresses are correct. Clicking Cancel will not trigger the validation step.

> **Caution:** Validation of the address ranges only occurs when you open the Edit Address
Ranges dialog for each network and click Update Address Ranges. Otherwise,you will
not know if you have any errors. However, the Complete Install step will run a validation
check and cannot be completed until the errors (if any) are fixed. If there is an address range error,
the validation check will show the network type and possibly the address value. If not, open
the Edit Address Ranges dialog for the specified network and click Update Address
Ranges to identify the incorrect address.  

**Tip:** Before editing any network's settings, take a screenshot of the default values. When you start
editing, the defaults disappear -- there is no reset.

## Customize the Admin Network

**Note:** HP recommends that you keep the default values because this network type is considered
to be an isolated, private network. Keeping the default values will overwrite any non-default IP
address that is provided during the booting of the Admin Node using the HP Cloud OS ISO. You can still
access the Operational Dashboard using the default URL: http://192.168.124.10:9000.

### Edit the Admin Network

To edit the admin network:

1. On the Operational Dashboard, select the Environment tab > Networks.

2. Click Edit Network for the Network Type admin.

3. Select the Network tab and review the settings. Modify these settings based on your required private network settings.

4. Select the VLAN tab and review the settings. Modify these settings based on your required private network settings.

5. Select the Router tab and review the settings. Modify these settings, based on your required private network settings.

> **Note:** It is recommended to provide a non-routable private network for the admin network. Therefore, do not specify a Router IP address in the Router tab.

6. Click Update Network to save your changes.

### Edit the Admin Address Ranges

To edit the admin address ranges:

1. In the admin Edit Network drop-down list, select Edit Address Ranges to open the Edit Address Ranges dialog.

2. The Network Type and Subnet values are pre-populated by default with the correct settings.

3. Review the default configurations for each Node Type, IPV4 Start Addr, IPV4 End Addr.
Following are the default Node Types and address ranges:

 a. admin: IP range for the Admin Node-- 192.168.124.10 to 192.168.124.11

 b. dhcp: Temporary IP address assignment for the PXE booted nodes --192.168.124.21 to
192.168.124.80

 c. host: Permanent admin network IP address assignment for the participating nodes --
192.168.124.81 to 192.168.124.160

 d. switch: This is for test purposes only.

4. Click Update Address Ranges to save your changes and to validate that the IP address is correct.

> **Note: If you enter invalid address ranges, you will get a validation error, which identifies the incorrect address (start or end) for the corresponding network type. You must fix all
errors in the Edit Address Ranges dialog and click Update Address Ranges to validate the addresses are correct.

## Customize the OS_SDN Network

The os_sdn network is the private network between the provisioned VMs, as well as from the VMs
to the Networking Node. By default this network is configured to use VLAN. Update the network to
set VLAN as false and provide the IP address range.

### Edit the os_sdn Network

To edit the os_sdn network:

1. On the Operational Dashboard, select the Environment tab > Networks.

2. Click Edit Network for the os_sdn network type.

3. Select the Network tab and review the settings. Do not make any changes.

4. Select the VLAN tab. If you plan to use the SINGLE Network mode, set the VLAN value to
True. If you plan to use the DUAL Network mode, set the VLAN value to False.
Note: The Operational Dashboard displays subsequent options based on the following rules:

 a. If os_sdn and public are both set to VLAN=True, the only displayed choice for Network mode will be SINGLE.

 b. If os_sdn or public are set to VLAN=False, the only displayed choice for Network mode will be DUAL.

5. Select the Router tab and review the settings. Do not make any changes.

6. Click Update Network to save your changes.

### Edit the os_sdn Address Ranges

To edit the os_sdn address ranges:

1. In the os_sdn Edit Network drop-down list, select Edit Address Ranges to open the Edit
Address Ranges dialog.

2. The Network Type and Subnet values are pre-populated by default with the correct settings.

3. Review the default configurations for each Node Type, IPV4 Start Addr, IPV4 End Addr.

Here are the default Node Types and address ranges:

 * Node Type = host

 * IPV4 Start Addr = 192.168.130.81
 
 * IPV4 End Addr = 192.168.130.160
 
4. Click Update Address Ranges to save your changes to validate that the IP address is correct.

> **Note:** If you enter invalid address ranges, you will get a validation error, which identifies the incorrect address (start or end) for the corresponding network type. You must fix all
errors in the Edit Address Ranges dialog and click Update Address Ranges to validate the addresses are correct.

## Customize the Public Network

To provide external access, make sure you have two sets of contiguous IP address ranges:

* **Range 1:** &lt;External/Public IP Address Range>. This range is used for PXE booted managed
nodes. On successful deployment of a Cloud, only the Controller Node gets the external IP
address. Therefore, a small range of this IP pool is sufficient. Get the range from your IT
administrator.

* **Range 2:** &lt;External/Public IP Address Range>. This range is used for a Floating IP assignment
of provisioned instances within OpenStack. Get the range from your IT administrator. This range
will be used when you create an External (Floating IP) IP Network on the Administration
Dashboard.  

### Edit the Public Network

To edit the public network:

1. On the Operational Dashboard, select the Environment tab > Networks.

2. Click Edit Network for the public Network Type.

3. On the Network tab, specify the Subnet and Netmask explicitly for your public IP address
range and set Bridge Enabled to False.

4. Click the VLAN tab. If you plan to use the SINGLE Network mode, set the VLAN value to
True. If you plan to use the DUAL Network mode, set the VLAN value to False.
Note: The Operational Dashboard displays subsequent options based on the following rules:

 * If os_sdn and public are both set to VLAN=True, the only displayed choice for Network mode will be SINGLE.

 * If os_sdn or public are set to VLAN=False, the only displayed choice for Network mode will be DUAL.

5. On the Router tab, specify the Router value as a Gateway IP address of your Public IP address range. Use the default Router Preference.

6. Click Update Network to save your changes.

### Edit the Public Address Ranges

To edit the public address ranges:

1. In the public Edit Network drop-down list, select Edit Address Ranges.

2. The Network Type and Subnet values are pre-populated by default, with the correct settings.

3. Click Add Address Range to add a set of address range options (each time you click, you add another set of address range options to be filled in):

 a. Set Node Type to host.

 b. Set IPV4 Start Addr to the start of the IP address range 1 described above.

 c. Set IPV4 End Addr to the end of the IP address range 1. Note: Provide the IP address range corresponding to the network address.

4. Click Update Address Ranges to save your changes to validate that the IP address is correct.

**Note:** If you enter invalid address ranges, you will get a validation error, which identifies
the incorrect address (start or end) for the corresponding network type. You must fix all
errors in the Edit Address Ranges dialog and click Update Address Ranges to validate
the addresses are correct.

## Next Step

Proceed to the next topic, [Complete Admin Node Installation (Required)](/cloudos/install/complete-admin-node-installation/).

