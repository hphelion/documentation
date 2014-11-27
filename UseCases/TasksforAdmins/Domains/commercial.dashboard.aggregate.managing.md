---
layout: default
title: "HP Helion OpenStack&#174; HP Helion OpenStack Commercial Manage Your Cloud"
permalink: /helion/commercial/dashboard/aggregate/managing/
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
<p style="font-size: small;"> <a href="/helion/commercial/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/ga1/">NEXT &#9654;</a> </p>
-->

# HP Helion OpenStack&#174; Managing Host Aggregates

A host aggregate is a method to subdivide availability zones into *hypervisor pools*, which is a collection of hypervisors grouped together into a collection of common hosts.

Host aggregates can be regarded as a mechanism to further partition an availability zone into multiple groups of hosts that share common resources like storage and network.

As an administrator you can manage the host aggregates in your domain:</p>

* [Create a host aggregate](#createagg)
* [Modify a host aggregate](#editagg)
* [Delete a host aggregate](#deleteagg)

### Create a host aggregate ### {#createagg}

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/dashboard/login/).

2. Click the <strong>Host Aggregates</strong> link on the <strong>Admin</strong> dashboard <strong>System</strong> panel.

3. In the Host Aggregates screen, click **Create Host Aggregate**.

4. In the <strong>Create Host Aggregate</strong> screen, enter a descriptive name for the aggregate in the <strong>Name</strong> field.

5. Optionally, specify an availability zone in which the aggregate will be created.

6. Click the <strong>Manage Hosts within Aggregate</strong> tab.</p>
 
7. Add hosts to the aggregate by clicking the <strong>+</strong> icon next to the host system you want to add.</p>

8. Click <strong>Create Host Aggregate</strong>.</p>

	A message is displayed on successful creation.</p>

### Modify a Host Aggregate ### {#editagg}

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/dashboard/login/).

2. Click the <strong>Host Aggregates</strong> link on the <strong>Admin</strong> dashboard <strong>System</strong> panel.</p>

3. Perform one of the following tasks:</p>

	**To change the name or availability zone:**

	a. For the aggregate you want to edit click <strong>Edit Host Aggregate</strong>.

	b. Enter a new name and/or availability zone.

	c. Click <strong>Save</strong>.

	**To change the hosts associated with the aggregate:</p>**

	a. For the aggregate you want to edit click *<em>More &gt; Manage Hosts</em></li>

	b. Add a host to the aggregate by clicking the <strong>+</strong> icon next to each project in the <strong>All Available Hosts</strong> column.</li>

	c. Remove a host from a aggregate by clicking the <strong>-</strong> icon in the <strong>Selected Hosts</strong> column.</li>

	d. Click <strong>Save</strong> when done.</li>

### Delete a host aggregate ### {#deleteagg}

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/dashboard/login/).

2. Click the <strong>Host Aggregates</strong> link on the <strong>Admin</strong> dashboard <strong>System</strong> panel.</p>

3. In the Host Aggregates screen, for the aggregate you want to delete, click <strong>More &gt; Delete Host Aggregate</strong>.</p>

4. In the confirmation screen, click <strong>Delete Host Aggregate</strong>.</p>

	The host aggregate is removed.</p>

<p><a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a></p>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*