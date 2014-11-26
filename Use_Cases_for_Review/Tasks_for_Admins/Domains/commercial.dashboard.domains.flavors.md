---
layout: default
title: "HP Helion OpenStack&#174; HP Helion OpenStack Commercial Manage Flavors"
permalink: /helion/commercial/dashboard/managing/flavors/
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

# HP Helion OpenStack&#174; Managing Compute Flavors</h1>

Compute flavors are machine configurations that describe the amount of memory, number of CPUs, and storage capacity of instances. The moment you register a chassis, a flavor is created by default. You can use the default flavor or create a flavor of your choice.</p>

An admin user can create, edit, and delete instances as needed. </p>

*<a href="#createflavor">Create a flavor</a></li>
*<a href="#editflavor">Edit a flavor</a></li>
*<a href="#deleteflavor">Delete a flavor</a></li>

### Create a flavor ### {#createflavor}

To create a flavor:</p>

1 <a href="/helion/community/dashboard/login/">Launch the HP Helion OpenStack Community web interface.</a></p>

2 Click the <strong>Flavors</strong> link on the <strong>Admin</strong> dashboard <strong>System</strong> panel.</p>
	The flavors in the domain are listed. </p>

3. Click <strong>Create Flavor</strong>. </p>

4. In the <strong>Create Flavor</strong> screen, click the <strong>Flavor Info</strong> tab (should be active).</p>

5. Enter the name that you want to assign to the flavor.</li>
	* In the <strong>ID</strong> field, enter a unique string that identifies this flavor.</li>
	* In the <strong>VCPUs</strong> field, enter the required number of virtual CPUs to be included in the flavor.</li>
	* In the <strong>RAM MB</strong> field, enter the virtual machine memory in megabytes to be included in the flavor.</li>
	* In the <strong>Root Disk GB</strong> field, enter the size for the virtual root disk size in gigabytes.</li>
	* From the <strong>Ephemeral disk GB</strong> field, enter the size of a secondary ephemeral data disk in gigabytes. This is an empty, unformatted disk and exists only for the life of the instance.</li>
	* From the <strong>Swap Disk MB</strong> field, enter the amount of swap space allocation for the flavor.</li>

6. Click the <strong>Flavor Access</strong> tab.</p>

7. Add the flavor to a project by clicking the <strong>+</strong> icon next to each project in the <strong>All Projects</strong> column.</p>

	By default, no project is specified as having access the the flavor. If none is specified, all projects can access the flavor.</p>

8. Click <strong>Create Flavor</strong> to create a new the flavor.<br></p>
A message is displayed on successful creation.</p>

### Edit a flavor ### {#editflavor}</h3>

To edit a flavor:</p>

1. <a href="/helion/community/dashboard/login/">Launch the HP Helion OpenStack Community web interface.</a></p>

2. Click the <strong>Flavors</strong> link on the <strong>Admin</strong> dashboard <strong>System</strong> panel.</p>

	The flavors in the domain are listed. </p>

3. For the flavor you want to modify, click <strong>Edit Flavor</strong>. </p>

4. In the <strong>Edit Flavor</strong> screen, click the <strong>Flavor Info</strong> tab (should be active).</p>

5. Use the <strong>Flavor Info</strong> and <strong>Flavor Access</strong> tabs to modify the flavor as needed. See <a href="#createflavor">Create a flavor</a> for a description of each field.</p>

6. When done editing, click <strong>Save</strong>.</p>

A message is displayed on successful edit.</p>

### Delete a flavor ### {#deleteflavor}</h3>

Instances that use the flavor are not affected when a flavor is deleted.</p>

To delete a flavor:</p>

1. <a href="/helion/community/dashboard/login/">Launch the HP Helion OpenStack Community web interface.</a></p>

2. Click the <strong>Flavors</strong> link on the <strong>Admin</strong> dashboard <strong>System</strong> panel.</p>

	The flavors in the domain are listed. </p>

3. For the flavor you want to modify, click <strong>More &gt; Delete Flavor</strong>. </p>

4. In the confirmation screen, click <strong>Delete Flavor</strong>.</p>
<p>A message is displayed on successful delete. </p>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a></p>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*