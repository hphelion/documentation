---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Working with Host Aggregates"
permalink: /helion/openstack/carrier/admin/host/management/hostaggregate/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: Systems Administrator 
role2: Cloud Architect 
role3: Storage Administrator 
role4: Network Administrator 
role5: Service Developer 
role6: Cloud Administrator 
role7: Application Developer 
role8: Network Engineer 
authors: Paul F

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/openstack/carrier/services/imaging/overview/">&#9664; PREV</a> | <a href="/helion/openstack/carrier/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/carrier/services/object/overview/"> NEXT &#9654</a> </p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): Working with Host Aggregates
<!-- From the Titanium Server Admin Guide -->

Host aggregates are collections of hosts that share common attributes for the purposes of VM scheduling.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

To view host aggregates, open the Host Aggregates page from the Admin menu.

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **Host Aggregates** link.


When the Nova Scheduler selects a compute node to instantiate a VM, it can use host aggregates to narrow the selection. 

For example:

* If the VM requires local storage, the Nova scheduler selects a host from the `local_storage_hosts` host aggregate. 
* Or, if the VM requires remote storage, the scheduler selects from
the `remote_storage_hosts` host aggregate. This ensures that the instance is instantiated on a host that meets the requirements of the VM.

The Nova scheduler does not always use host aggregates. For example, if a VM does not specify either local or remote storage, the Nova scheduler can instantiate it on any resource.

Some host aggregates are managed automatically by HP Helion OpenStack Carrier Grade.

**Caution:** Do not make manual changes to host aggregates that are managed automatically.

The `local_storage_hosts` and `remote_storage_hosts` memberships are updated automatically whenever a local volume group is added or removed on a compute host. For more information, see Configuring a Compute Host to Provide Local Storage.

You can use host aggregates to meet special requirements. For example, you can create a pool of compute hosts to offer dedicated resources such as pinned NUMA nodes or specific huge page sizes, while grouping the remaining compute hosts to offer shared resources.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----