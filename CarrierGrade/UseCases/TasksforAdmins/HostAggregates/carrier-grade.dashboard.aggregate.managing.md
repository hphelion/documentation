---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Managing Host Aggregates"
permalink: /helion/commercial/carrier/dashboard/managing/aggregates/
product: carrier-grade

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/commercial/carrier/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/carrier/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/carrier/ga1/">NEXT &#9654;</a></p> -->

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Managing Host Aggregates

A host aggregate is a method to subdivide availability zones into *hypervisor pools*, which is a collection of hypervisors grouped together into a collection of common hosts.

Host aggregates can be regarded as a mechanism to further partition an availability zone into multiple groups of hosts that share common resources like storage and network.

As an administrator you can manage the host aggregates in your domain:

* [Create a host aggregate](#createagg)
* [Modify a host aggregate](#editagg)
* [Managing Metadata](#editmeta)
* [Delete a host aggregate](#deleteagg)

### Create a host aggregate ### {#createagg}

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **Host Aggregates** link.

3. In the Host Aggregates screen, click **Create Host Aggregate**.

4. In the **Create Host Aggregate** screen, enter a descriptive name for the aggregate in the **Name** field.

5. Optionally, specify an availability zone in which the aggregate will be created.

6. Click the **Manage Hosts within Aggregate** tab.
 
7. Add hosts to the aggregate by clicking the **+** icon next to the host system you want to add.

8. Click **Create Host Aggregate**.

	A message is displayed on successful creation.

### Modify a Host Aggregate ### {#editagg}

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **Host Aggregates** link.

3. Perform one of the following tasks:

	**To change the name or availability zone:**

	a. For the aggregate you want to edit click **Edit Host Aggregate**.

	b. Enter a new name and/or availability zone.

	c. Click **Save**.

	**To change the hosts associated with the aggregate:**

	a. For the aggregate you want to edit, click the arrow icon in the **Actions** menu and select **Manage Hosts**.

	b. Add a host to the aggregate by clicking the **+** icon next to each project in the **All Available Hosts** column.

	c. Remove a host from a aggregate by clicking the **-** icon in the **Selected Hosts** column.

	d. Click **Save** when done.

### Managing Metadata {#editmeta}

Compute uses a metadata service for virtual machine instances to retrieve instance-specific data. 

You can add and remove metadata for host aggregates, see [Managing Metadata](/helion/commercial/carrier/dashboard/managing/metadata/).


### Delete a host aggregate ### {#deleteagg}

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **Host Aggregates** link.

3. In the Host Aggregates screen, for the aggregate you want to delete,  click the arrow icon in the **Actions** menu and select **Delete Host Aggregate**.

	To delete multiple host aggregates, click the check box next to name of each host aggregate to delete. Click **Delete Host Aggregates**.


4. In the confirmation screen, click **Delete Host Aggregate**.

	The host aggregate is removed.

<p><a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a></p>


----
