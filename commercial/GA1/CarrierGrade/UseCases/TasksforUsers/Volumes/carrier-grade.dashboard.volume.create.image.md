---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Creating an Image from a Volume"
permalink: /helion/commercial/carrier/dashboard/managing/volume/image/create/
product: carrier-grade

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/commercial/carrier/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/carrier/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/carrier/ga1/">NEXT &#9654;</a></p> 
-->

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Creating a Image Using a Volume

You can use a volume to create a new virtual machine image.

A [virtual machine image](/helion/commercial/carrier/dashboard/managing/images/) is a single file that contains a virtual disk with a bootable operating system installed on it. You can use images to create virtual machine instances within the cloud.

To create a image:

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Compute** tab on the dashboard **Project** panel.

3. In the **Compute** panel, click **Volumes**.

3. In the **Volumes** screen, for the volume you want for the image, click the arrow icon in the **Actions** menu and select **Upload to Image**.

4. In the **Upload Volume to Image** dialog box, enter a name for the image and select a disk format.

	* **raw** - An unstructured disk image format; if you have a file without an extension it is possibly a raw format.
	* **qcow2** - Supported by the QEMU emulator that can expand dynamically and supports Copy on Write.
	* **vdi** - Supported by VirtualBox virtual machine monitor and the QEMU emulator.
	* **vmdk** - Common disk format supported by many common virtual machine monitors.

4. Click **Upload**.

The image is created and is listed on the  [Images tab](/helion/commercial/carrier/dashboard/managing/images/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
