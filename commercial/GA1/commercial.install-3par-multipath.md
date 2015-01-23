---
layout: default
title: "HP Helion OpenStack&#174; Configuring Multipath for 3PAR"
permalink: /helion/openstack/install/3par/multipath/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--
<p style="font-size: small;"> <a href="/helion/openstack/">&#9664; PREV | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/faq/">NEXT &#9654; </a></p>
-->
# HP Helion OpenStack&reg; Configuring Multipath for 3PAR

<!-- Copied overview information from http://www.vmware.com/files/pdf/partners/hp/vmware-vsphere-hp-3par-storeserv-so.pdf -->

Multi-pathing considerations
To maintain a constant connection between an ESXi host and its storage, ESXi supports multi-pathing. To take advantage of this support, virtual volumes should be exported to multiple paths to the host server. To do this, create a host definition on the HP 3PAR StoreServ Storage system that includes the World Wide Names (WWNs) of multiple HBA ports on the host server and then export the VLUNs to that host definition. For an ESXi cluster, the VLUNs must be exported to all of the host definitions for the cluster nodes, or a host set may be created containing all of the servers and the VLUNs can be exported to the host set.

VMware ESXi 5 includes active/active multipath support to maintain a constant connection between the ESXi host and the HP 3PAR StoreServ Storage array. Three path policies are available: **Fixed**, **Most Recently Used** and **Round Robin**. For HP 3PAR StoreServ storage, Round Robin is the recommended policy for best performance and load balancing; however, it may not be enabled by default.

The path policies can be viewed and modified from the vSphere Web Client on a per datastore basis as follows:

<!-- Copied steps from http://www.vmware.com/files/pdf/partners/hp/vmware-vsphere-hp-3par-storeserv-so.pdf -->


1. In the vSphere Web Client, select the datastore.
2. Select the Manage tab, then the Settings tab, and then click on
Connectivity and Multipathing.
3. Select one of the ESXi hosts and then click the Edit Multipathing
button (highlighted in red in Figure 5).
4. In the pop-up window, select Round Robin from the Path Selection drop-down menu (as shown in Figure 6).
5. Click the OK button to save the new setting.
6. Repeat steps 3 through 5 for each ESXi host. 