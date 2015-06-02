---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Managing Instances"
permalink: /helion/commercial/carrier/dashboard/managing/instances/overview/
product: carrier-grade

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

| <a href="/helion/openstack/carrier/admin/">&#9650; Administrators Guide</a> | <a href="/helion/commercial/carrier/dashboard/managing/volumes/">Managing Volumes &#9654;</a></p> 


# HP Helion OpenStack&#174; Carrier Grade (Beta): Managing Instances

Instances are virtual machines that run inside the cloud.

How you interact with instances depends upon your user type, either an administrative user (admin) or a non-administrative user (user).

**Note:** The admin can perform all of the user tasks in addition to the admin tasks. For some tasks, the admin will need to use the **Project** > **Compute** > **Instances** panel.

To work with instances [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/). Then, Click the **Project** dashboard, then the **System** panel, then the **Instances** link. The instances in the current project are listed.

* [Managing instances](#user)
* [Managing instances as an admin](#admin)
*

The **Instances** panel looks similar to the following. Click the image to view in a new window: 

<img src="media/CGH-Helion-Instance.png" width="500">

<a href="javascript:window.open('/content/documentation/media/CGH-Helion-Instance.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Click here to view a larger image in a new window.</a>

For details on an instance, click the image name. 


## Managing instances {#user}

As an admin user or non-admin user, you can use the **Compute** panel on the **Project** dashboard to:

* [Create a new instance](/helion/commercial/carrier/dashboard/managing/instances/create/)
* [Terminate an instance](/helion/commercial/carrier/dashboard/managing/instances/terminate/)
* [Reboot an instance](/helion/commercial/carrier/dashboard/managing/instances/reboot/)
* [Rebuild an instance](/helion/commercial/carrier/dashboard/managing/instances/rebuild/)
* [Resize an Instance](/helion/commercial/carrier/dashboard/managing/instances/resize/)
* [Suspend and resume an instance](/helion/commercial/carrier/dashboard/managing/instances/suspend/)
* [Pause and un-pause an instance](/helion/commercial/carrier/dashboard/managing/instances/pause/)
* [Create an instance snapshot](/helion/commercial/carrier/dashboard/managing/images/public/)
* [Associate, or assign, a floating IP address to an instance](/helion/commercial/carrier/dashboard/managing/instances/ipaddresses/) 
* [Launch a console session to an instance](/helion/commercial/carrier/dashboard/managing/instances/console/)

## Managing instances as an admin {#admin}

As an admin user, you can work on all of the instance(s) in your domain, regardless of which project the instance is associated with.

* [Migrate or Live Migrate and instance](/helion/commercial/carrier/dashboard/managing/instances/migrate/)

<p><a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a></p>



----
