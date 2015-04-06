---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade: Creating and Deleting Projects"
permalink: /helion/commercial/carrier/dashboard/managing/projects/creating/
product: carrier-grade

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/commercial/carrier/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/carrier/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/carrier/ga1/">NEXT &#9654;</a></p> 
-->

# HP Helion OpenStack&#174; Carrier Grade: Creating and Deleting Projects

As an admin, you can [create](#projectcreate) and [delete](#projectsdel) projects. 

### Create a project ### {#projectcreate}

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/1.1/dashboard/login/).

2. Click the **Projects** link on the **Admin** dashboard **Identity** panel.

3. In the **Projects** panel, click **Create Project**.

4. On the **Project Info** tab of the **Create Project** screen:

	a. Enter a unique name for the project.
	b, Enter an identifying description for the project.
	c. Leave **Enabled** selected to create an active project or clear the option to create a 

5. Click the **Project Members** tab. 

6. On the **Project Members** tab select the users who can access the project by clicking the **+** icon for each user.

7. Click the **Quotas** tab. 

8. Optionally, specify operational quotas for the project.     Metadata Items - Enter the maximum number of metadata items allowed per instance.

	* VCPUs Enter the maximum number of instance cores allowed for the project.
	* Instances Enter the maximum number of instances allowed for the project.
	* Injected Files Enter the maximum number of injected files allowed for the project.
	* Injected File Content Bytes Enter the maximum number of content bytes allowed per injected file.
	* RAM Enter the maximum megabytes of instance RAM allowed for the project.

9. Click **Create Project**.

### Delete a project ### {#projectdel}

As an admin, you can delete projects. Compute instances associated with a project will not be deleted.

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/1.1/dashboard/login/).

2. Click the **Projects** link on the **Admin** dashboard **Identity** panel.

3. For the project you want to delete, click **More &gt; Delete Project**.

4. In the confirmation screen, click **Delete Project**.
<p>The project is no longer available.  <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a></p>

----
