---
layout: default
title: "HP Helion OpenStack: Create the baremetal.csv File for Installation"
permalink: /helion/openstack/install/csv/
product: commercial.ga
product-version1: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Michael B, 

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> &#9664; <a href="/helion/openstack/install/prereqs/#csv">Prerequisites | <a href="/helion/openstack/install/overview/test/"> &#9650; Installation Overview</a> </p> 

# HP Helion OpenStack&reg;: Create the baremetal.csv File for Installation #

During the installation process after the seed VM is installed, the installer script looks for information about the baremetal systems. Specifically, it looks for this information in a file called `baremetal.csv`. Before you begin the installation process, you must create this file and upload the file to the installer system (called the seed cloud host) at the appropriate installation step. 

The baremetal.csv file informs the installer of the size of the Computer that each node will be installed into.

Specify the MAC address, CPU, memory, local disk size, IPMI address, and IPMI password values for each baremetal system you intend to install.

There must be one entry in this file for each baremetal system you intend to install. 

**Notes:** 

- The first line of the baremetal.csv file is the undercloud node. 
- The second line is what TripleO uses to construct the flavor for baremetal deployment. If your servers are not all the same size, specify the smallest sized server in the second position so it uses that size as the flavor for all of the overcloud nodes being deployed.The second entry must be the smallest sized disc.

Use the following format in the `baremetal.csv` file.

`<mac_address>,<user>,<password>,<ip_address>,<no_of_cpus>,<memory_MB>,<diskspace_GiB>,<role>,<power_management>`

Where `<mac_address>` is the MAC address of the network interface from which to boot. **Do not use the iLO NIC interface.**

**Important** The diskspace size value must be specified in Gibibytes, not Gigabytes.  For example:<br>
- 900GB = 838 GiB<br>
- 1TB = 1000GB = 931 GiB

**Example:** 

Here is an sample file:

     78:e7:d1:22:5d:58,administrator,password,192.168.11.1,12,32768,2048,Undercloud,IPMI
     78:e7:d1:22:5d:10,administrator,password,192.168.11.5,12,32768,2048,OvercloudControl,IPMI
     78:e7:d1:22:52:90,administrator,password,192.168.11.3,12,32768,2048,OvercloudControl,IPMI
     78:e7:d1:22:5d:c0,administrator,password,192.168.11.2,12,32768,2048,OvercloudControl,IPMI
     78:e7:d1:22:5d:a8,administrator,password,192.168.11.4,12,32768,2048,OvercloudSwiftStorage,IPMI
     78:e7:d1:22:52:9b,administrator,password,192.168.11.6,12,32768,2048,OvercloudSwiftStorage,IPMI
     78:e7:d1:22:52:9e,administrator,password,192.168.11.7,12,32768,2048,OvercloudCompute,IPMI


When creating this file, keep the following in mind :

- This file must contain from 7 to 34 lines.

* There must be one entry in this file for each baremetal system you intend to install.
* The <mac_address> should be the MAC address of the network interface enabled for PXE/network boot on each baremetal system (*not* the MAC address of the BMC/IPMI controller).
* The systems specified in this file must meet the Hardware Requirements detailed above.
* The IPMI user and password must have ADMINISTRATOR privilege (it is not sufficient to have OPERATOR privilege.
* The <diskspace_GiB> specified should never exceed the physical disk size and is in units of GiB (2^30)
* The <role> can have these values: 

	- Undercloud, 
	- OvercloudControl, 
	- OvercloudSwiftStorage, 
	- OvercloudCompute
	- OvercloudVSAStorage, 
	- OvercloudVSAAOStorage, 
	- OvercloudSOSwiftProxy,
	- OvercloudSOSwiftStorage


- **If role is not specified then these rules apply.**

	If no Undercloud node is specified then the first node without a role is assigned as an Undercloud
	<br>
	else 
	<br>
	if there are not enough OvercloudControl nodes, the next nodes without a role are assigned as OvercloudControl until there are enough nodes
	<br>
	else if
	<br>
	there are not enough OvercloudSwiftStorage, nodes the next nodes without a role are assigned as OvercloudSwiftStorage, until there are enough nodes
	<br>
	else if
	<br>
	Similar logic is applied for VSA and Scale-Out Swift node assignments
	<br>
	else
	<br>
	The node will be assigned a role of OvercloudCompute



**Note also:**


- The required numbers of OvercloudControl and OvercloudSwiftStorage
nodes default to 3 and 2 respectively.
- Roles are case-insensitive.
- &lt;power_management&gt; can have these values:
	- VM, IPMI, HP_Moonshot, HP_iLO4

	<table>
<thead>
<tr>
<td>Value</td>  <td>Description</td> </tr>
</thead>
<tbody>
<tr>
          <td>VM</td>   <td>this is for virtual machines and is set automatically for a
                 virtual install.</td> </tr><tr>
          <td>IPMI</td>  <td>this is for all systems that can be accessed using IPMI
                 Currently this is ALL supported physical hardware.</td> </tr><tr>
          If no power_management is specified, a default of IPMI is assumed.
          <td>HP_Moonshot</td>  <td>this is for HP Moonshot hardware only. If this
                 is specified it *requires* two colon-separated extra arguments
                 as follows: <transit_address>:<target_address>
                     <transit_address> is also known as 'Cartridge Address'
                     <target_address> is also known as 'Node Address'
                 For example: HP_Moonshot:0x84:0x72
                 HP Moonshot hardware will use ipmitool as its power manager.
                 See the additional notes at the top of this document.</td> </tr><tr>
          <td>HP_iLO4</td>  <td>boot HP iLO4 Gen9 systems in UEFI mode.
                 Specify IPMI to boot such nodes in BIOS mode (you must manually
                 set the pending boot mode to BIOS mode).
</td> </tr>
</tbody>
</table>
- power_management maps to Openstack Ironic power drivers as
follows:

	- VM: pxe_ssh, 
	- (IPMI, HP_Moonshot): pxe_ipmitool, 
	- HP_iLO4: pxe_ilo


**Important**: Make sure that the information specified is correct. If any node fails to install, you must restart the installation from the beginning.

[Return to HP Helion OpenStack&reg;: Installation Prerequisites](/helion/openstack/install/prereqs/#csv).



----
