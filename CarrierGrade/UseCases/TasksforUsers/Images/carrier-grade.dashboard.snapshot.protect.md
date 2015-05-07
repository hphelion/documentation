---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Protecting Images"
permalink: /helion/commercial/carrier/dashboard/managing/images/protect/
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

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Protecting Images

A virtual machine image is a single file that contains a virtual disk with a bootable operating system installed on it. You can use images to create virtual machine instances within the cloud. 

If you want to prevent an image from being deleted, you can make that image *protected*. 

### Protect an image ###

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Project** dashboard, then the **System** panel, then the **Images** link.

3. In the **Images** screen, for the image you want to protect, click the arrow icon in the **Actions** menu and select **Edit**.

4. In the **Update Image** screen, select **Protected**.

5. Click **Update Image**.

The image is protected and the **Delete Image** command is removed from the **Edit** menu.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
