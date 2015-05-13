---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Verifying StoreVirtual Installation Status"
permalink: /helion/openstack/carrier/install/vsa/verify/
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


<p style="font-size: small;"> <a href="/helion/openstack/carrier/install/vsa/deploy/">&#9664; Deploying HP StoreVirtual VSA </a>| <a href="/helion/openstack/carrier/install/vsa/cluster/">Creating a StoreVirtual Cluster and adding it to a new Management Group &#9654;</a>
</p> 


# HP Helion OpenStack&#174; Carrier Grade (Beta): Verifying StoreVirtual Installation Status

To verify that the StoreVirtual storage system is deployed successfully, perform the following checks:

1. Log in to the undercloud from seed.




		# ssh heat-admin@<undercloud IP address>

 		 
2. Source stackrc file and list the deployed StoreVirtual nodes.

		# source stackrc 
		# heat stack-list
		# nova list|grep vsa

3. Log in to the StoreVirtual system from the seed using the IP address retrieved 
from the above steps.

		# ssh heat-admin@<StoreVirtual system IP Address>

4. Check the log files.

		# tail-f /installer.log

	The message "*Started VM vsa-hostname*" indicates the successful installation of StoreVirtual on the machine.The IP Address of the StoreVirtual storage system can be retrieved from this log file.

5. To display the status of all the StoreVirtual VMs.

		# virsh list --all 

	To get more details on the installer logs, check the `/var/log/storevirtual-installer.log` file.

6. On successful installation of StoreVirtual VM on Baremetal, go to the Centralized Management Console (CMC) and discover the storage systems. 

## Next Step

[Creating a StoreVirtual Cluster and Adding it to a New Management Group](/helion/openstack/carrier/install/vsa/cluster/)


