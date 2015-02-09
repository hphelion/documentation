---
layout: default
title: "HP Helion OpenStack: Create the baremetal.csv File for Installation"
permalink: /helion/openstack/install/CSV/
product: commercial.ga

---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


# HP Helion OpenStack&reg;: Create the baremetal.csv File for Installation #

During the installation process after the seed VM is installed, the installer script looks for information about the baremetal systems. Specifically, it looks for this information in a file called `baremetal.csv`. Before you begin the installation process, you must create this file and upload the file to the installer system (called the seed cloud host) at the appropriate installation step. 

The baremetal.csv file informs the installer of the size of the Computer that each node will be installed into.

Specify the MAC address, CPU, memory, local disk size, IPMI address, and IPMI password values for each baremetal system you intend to install.

There must be one entry in this file for each baremetal system you intend to install. 

**Notes:** 

- The first line of the baremetal.csv file is the undercloud node. 
- The second line is what TripleO uses to construct the flavor for baremetal deployment. If your servers are not all the same size, specify the smallest sized server in the second position so it uses that size as the flavor for all of the overcloud nodes being deployed.The second entry must be the smallest sized disc.

Use the following format in the `baremetal.csv` file.

`<mac_address>,<ipmi_user>,<ipmi_password>,<ipmi_address>,<no_of_cpus>,<memory_MB>,<diskspace_GiB>`

Where `<mac_address>` is the MAC address of the network interface from which to boot. Do not use the iLO NIC interface.

**Important** The diskspace size value must be specified in Gibibytes, not Gigabytes.  For example:<br>
- 900GB = 838 GiB<br>
- 1TB = 1000GB = 931 GiB

**Example:** 

Your file should look similar to the following:

	78:e7:d1:22:5d:58,administrator,password,192.168.11.1,12,32768,1900
	78:e7:d1:22:52:9b,administrator,password,192.168.11.6,12,16384,800
	78:e7:d1:22:5d:10,administrator,password,192.168.11.5,12,32768,1900
	78:e7:d1:22:52:90,administrator,password,192.168.11.3,12,32768,1900
	78:e7:d1:22:5d:c0,administrator,password,192.168.11.2,12,32768,1900
	78:e7:d1:22:5d:a8,administrator,password,192.168.11.4,12,32768,1900
	78:e7:d1:22:52:9e,administrator,password,192.168.11.7,12,16384,800

When creating this file, keep in mind the following:

* The IPMI user and password **must have** ADMINISTRATOR privilege; it is not sufficient to have OPERATOR privilege
* Memory must be at least 32 GB
* Disk size must be greater than 512GiB
* The disk size specified should never exceed the physical disk size

**Important**: Make sure that the information specified is correct. If any node fails to install, you must restart the installation from the beginning.

[Return to HP Helion OpenStack&reg;: Installation Prerequisites](/helion/openstack/install/prereqs/#csv).



----
