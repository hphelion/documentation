---
layout: default
title: "HP Helion OpenStack: Managing Moonshot"
permalink: /helion/openstack/install/moonshot/
product: commercial.ga
product-version1: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Tom H, Nancy M

---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> &#9664; <a href="/helion/openstack/install/prereqs/#csv">Prerequisites | <a href="/helion/openstack/install/overview/test/"> &#9650; Installation Overview</a> </p> 

# Managing Moonshot Servers
####

The HP Moonshot Servers

- HP ProLiant m710 Server Cartridge 
- HP ProLiant m300 Server Cartridge

are now supported as tested and verified hardware to run HP Helion OpenStack.

To manage HP Moonshot servers you must know the cartridge address and the node
address (these are also known as the **transit&#95;address** and the **target&#95;address**
respectively).

  
- **transit&#95;address** and **target&#95;address** are the values that would be specified
to the `-T` and `-t` flags of ipmitool, respectively, when using dual bridging mode.

- **Node Address** `-t target_address`
Moonshot cartridges may have one or more nodes in a single cartridge.
The first node in the cartridge has `0x72` as its node address. 

<!--The HP ProLiant m710 Server Cartridge has only one node and so the  -->
If the Moonshot cartridge has only one node, the node address will always be `0x72`.<br>

If it were to have 4 nodes, for example, the second, third and fourth 
nodes will have `0x74`, `0x76` and `0x78` as their addresses, respectively.

- Cartridge Address `-T transit_address`
Below is a sample mapping between the cartridge-no and cartridge address.
The address increases by 2  as the cartridge number increases
	- C1N1  = 0x82
	- C2N1  = 0x84
	- C3N1  = 0x86
	- C10N1 = 0x94 
	- C11N1 = 0x96
	- C28N1 = 0xB8


This command returns the cartridge address:

	ipmitool -I lanplus -H xx.xx.xx.xx -U Administrator -P xxxxx sdr list mcloc

For example, here are some sample values:

	ipmitool -l lanplus -H iloatx-gem-2c -U admin -P admin123 sdr list all

Consult [HP Moonshot iLO documentation](http://h50146.www5.hp.com/products/software/oe/linux/mainstream/support/whitepaper/pdfs/c03933550-1.pdf) to determine the values needed.


...
[Return to HP Helion OpenStack&reg;: Installation Prerequisites](/helion/openstack/install/prereqs/#csv).

<!--Tom hancock-->

----
