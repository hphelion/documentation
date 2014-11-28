---
layout: default
title: "HP Helion OpenStack&#174; Managing Images"
permalink: /helion/commercial/dashboard/managing/images/
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

# HP Helion OpenStack&#174; Managing Images

A virtual machine image is a single file that contains a virtual disk with a bootable operating system installed on it. You can use images to create virtual machine instances within the cloud. </p>

To create an image, you upload an ISO image file. After you upload an image, it is considered golden and you cannot change it.</p>

You can use the dashboards to create and configure private virtual machine images, which can be used to create instances.</p>

**Note:** You can also [create an image based on an instance](/helion/commercial/dashboard/managing/images/public/), which is called a <em>snapshot</em>.</p>

How you interact with these images depends upon your user type, either an administrative user (admin) or a non-administrative user (user). </p>

**Note:** The admin can perform all of the user tasks in addition to the admin tasks.</p>

## Managing images as a user ##

As a user, you can work with any <em>private</em> images associated with the active project.</p>

Access the image commands using the Compute panel on the Project dashboard. </p>

Click <strong>Images</strong> to perform the following tasks:</p>

* [Create an image](/helion/commercial/dashboard/managing/images/create/)
* [Modify an image](/helion/commercial/dashboard/managing/images/modify/)
* [Delete an image](/helion/commercial/dashboard/managing/images/delete/)
* [View image details](/helion/commercial/dashboard/managing/images/details/)
* [Protect an image or snapshot from being edited](/helion/commercial/dashboard/managing/image/protect/)


## Managing images as an admin ##

As an admin user, you can work on all of the images in your domain, regardless of which project the image is associated with. </p>

Access the admin image commands using the System Panel  on the Admin dashboard.</p>

As an admin, you can determine if the snapshot is available only in the current project or to all projects in the domain.</p>

* [Make an image or snapshot public](/helion/commercial/dashboard/managing/images/public/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a></p>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*