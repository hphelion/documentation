---
layout: default
title: "HP Helion OpenStack Managing Access to a Flavor"
permalink: /helion/commercial/dashboard/managing/flavors/access/
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

# HP Helion OpenStack&#174; Managing access to a flavor #

Compute flavors are machine configurations that describe the amount of memory, number of CPUs, and storage capacity of instances. </p>

As an admin, you can <a href="#add">allow specific projects to have access</a> to a <a href="#remove">prevent a project from accessing</a> a flavor.</p>

### Allowing a project to access a flavor ### {#add}

1. <a href="/helion/community/dashboard/login/">Launch the HP Helion OpenStack Community web interface.</a></p>

2. Click the <strong>Flavors</strong> link on the <strong>Admin</strong> dashboard <strong>System</strong> panel.</p>

	The flavors for in the domain are listed. </p>

3. For the flavor you want to modify, click <strong>More &gt; Modify Access</strong>.</p>

4. Click the <strong>+</strong> icon next to a project in the <strong>All Projects</strong> column to allow the project to access the the flavor.</p>
	By default, no project is specified as having access the the flavor. If none is specified, all projects can access the flavor.</p>

5. Click <strong>Save</strong> to create a new the flavor.<br></p>

	A message is displayed on successful change.</p>

### Preventing a project from accessing a flavor ### {#remove}

1. <a href="/helion/community/dashboard/login/">Launch the HP Helion OpenStack Community web interface.</a></p>

2. Click the <strong>Flavors</strong> link on the <strong>Admin</strong> dashboard <strong>System</strong> panel.</p>

	The flavors for in the domain are listed. </p>

3. For the flavor you want to modify, click <strong>More &gt; Modify Access</strong>.</p>

4. Click the <strong>-</strong> icon next to a project in the <strong>Selected projects</strong> column to remove the flavor from the project.</p>

	By default, no project is specified as having access the the flavor. If none is specified, all projects can access the flavor.</p>

5. Click <strong>Save</strong> to create a new the flavor.<br></p>
<p>A message is displayed on successful change.</p>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a></p>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*