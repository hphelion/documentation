---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Enrolling the New Baremetal Server"
permalink: /helion/openstack/carrier/install/vsa/enroll/
product: carrier-grade
product-version1: HP Helion OpenStack Carrier Grade
role1: Storage Administrator
role2: Storage Architect
authors: Michael B, Paul F

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/openstack/install/vsa/">&#9664; Deploying HP StoreVirtual VSA </a> | <a href="/helion/openstack/carrier/install/vsa/cluster/">Verifying StoreVirtual Installation Status &#9654;</a>
</p> 
-->

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Enrolling the New Baremetal Server 

This page provides detailed instructions on deployment of HP StoreVirtual VSA Storage Nodes, and their configuration as Cinder backend. It covers the following topics:

**Note:** Before enrolling the new Baremetal server for StoreVirtual deployment, ensure that `ironic node-list` in the undercloud server does not have any free nodes suitable for StoreVirtual installation. If a suitable node is available, skip the Baremetal registration steps and go to **step 5** below.

You must add a server to the cloud inventory to handle the increased number of nodes. 

Perform the following steps to add a physical server:

1. Log in to the seed VM:

		ssh root@<Seed IP Address>

2. Make the respective Baremetal entry in `/root/baremetal.csv`.   
	
3. Add the node to `baremetal.csv` at the end.

		<mac_address>,<user>,<password>,<ip_address>,<no_of_cpus>,<memory_MB>,<diskspace_GiB>,<role>,<power_managemenment>

	The following sample displays the output of the above command:

		E8:39:35:2B:FA:30,administrator,password,10.1.192.46,12,73728,70,OvercloudVSAAOStorage,IPMI
		9C:B6:54:AD:55:A8,administrator,gone2far,10.1.192.50,12,73728,70,OvercloudVSAStorage,IPMI

  	Ensure that a new node is added at the end of the file. 

3. Edit the scale counts in JSON environment variables file (for example: `kvm-custom-ips.json`) that was used during the initial installation to define the appropriate scale number:

		"vsa_scale": "<no of StoreVirtual systems>"
		"vsa_ao_scale": "<no of StoreVirtual systems with AO enabled>"

4. Source the environment variables file created during initial installation.

		# source tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh tripleo/configs/<environment variables file name>

	For example:

		# source tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh tripleo/configs/kvm-custom-ips.json

5. Run the installer script:

		bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --update-overcloud 2>&1 | tee update.log


   This will register a new Ironic node and create a new Nova instance and a new Heat stack.

<!--**Caution**: Do not provision proxy and scale-out object nodes together. The requirements are different for proxy nodes and scale-out object nodes. It is recommended that you use HP DL380 or HP SL230 servers for Proxy nodes and SL4540 servers for scale-out Object storage nodes.-->
 <!--	**Note**: While deploying a scale-out **proxy** node ensure that the value of `vsa_scale` is unchanged. While deploying a scale-out **object** node ensure that the value of `vsa_ao_scale` is unchanged.-->
**NOTE**: For HP StoreVirtual VSA, a management group with two storage systems and a Failover Manager is the minimum configuration for automated fault tolerant operations. Configurations greater than two systems can be redundant and do not require a Failover Manager. The Failover Manager is a specialized version of the LeftHand OS software designed to operate as a manager and provide automated failover capability. It runs as a virtual appliance and must be installed on a separate system/VM  other than the storage systems in the SAN.

 
<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

### Setting the public interface parameter ###
As of Helion 1.1, you have to specify the public interface parameter when you are planning to configure VSA in:

- FLAT mode (no VLAN)
- FCP mode
- VLAN provider mode

To specify the public interface, edit the VSA_PUBLIC_INTERFACE variable in the `~/tripleo/overcloud-env.json` file. 
 


## Next Step {#next-steps}

[Working with HP StoreVirtual VSA](/helion/openstack/carrier/undercloud/storage/storevirtual/) REQUIRED


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----

