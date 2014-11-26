---
layout: default
title: "HP Helion OpenStack&#174; Creating and Deleting Projects"
permalink: /helion/commercial/dashboard/projects/creating/
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

# HP Helion OpenStack&#174; Creating and Deleting Projects

As an admin, you can create and delete projects. </p>

### Create a project ###

1. <a href="/helion/community/dashboard/login/">Launch the HP Helion OpenStack Community web interface.</a></p>

2. Click the <strong>Projects</strong> link on the <strong>Admin</strong> dashboard <strong>Identity</strong> panel.</p>

3. In the <strong>Projects</strong> panel, click <strong>Create Project</strong>.</p>

4. On the <strong>Project Info</strong> tab of the <strong>Create Project</strong> screen:</p>

	a. Enter a unique name for the project.</li>
	b, Enter an identifying description for the project.</li>
	c. Leave <strong>Enabled</strong> selected to create an active project or clear the option to create a </li>

5. Click the <strong>Project Members</strong> tab. </p>

6. On the <strong>Project Members</strong> tab select the users who can access the project by clicking the <strong>+</strong> icon for each user.</p>

7. Click the <strong>Quotas</strong> tab. </p>

8. Optionally, specify operational quotas for the project.     Metadata Items - Enter the maximum number of metadata items allowed per instance.</p>

	* VCPUs Enter the maximum number of instance cores allowed for the project.</li>
	* Instances Enter the maximum number of instances allowed for the project.</li>
	* Injected Files Enter the maximum number of injected files allowed for the project.</li>
	* Injected File Content Bytes Enter the maximum number of content bytes allowed per injected file.</li>
	* RAM Enter the maximum megabytes of instance RAM allowed for the project.</li>

9. Click <strong>Create Project</strong>.</p>

### Delete a project ###

As an admin, you can delete projects. Compute instances associated with a project will not be deleted.</p>

1. <a href="/helion/community/dashboard/login/">Launch the HP Helion OpenStack Community web interface.</a></p>

2. Click the <strong>Projects</strong> link on the <strong>Admin</strong> dashboard <strong>Identity</strong> panel.</p>

3. For the project you want to delete, click <strong>More &gt; Delete Project</strong>.</p>

4. In the confirmation screen, click <strong>Delete Project</strong>.</p>
<p>The project is no longer available.</p>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a></p>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*