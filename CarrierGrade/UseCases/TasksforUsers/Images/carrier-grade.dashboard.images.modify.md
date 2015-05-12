---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Modifying Images"
permalink: /helion/commercial/carrier/dashboard/managing/images/modify/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Modifying Images

You can modify images, as needed, to change the name and description of the image, or protect and un-protect the image.

* [Modify an image](#edit)
* [Edit image metadata](#editmeta)

### Modify an image ### {#edit}

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Project** dashboard, then the **System** panel, then the **Images** link.

3. In the **Images** screen, click **Edit** next to the image you want to modify.

4. Update the image information:

	* Name - Enter a name for the image.
	* Description - Optionally, enter a brief description of the image.
	* Protected - Select this option to prevent the image from being deleted. Leave the option clear to allow the image to be deleted.

	**Note:** Fields that cannot be modified are shaded.

5, When complete, click **Update Image**. 

### Managing Metadata {#editmeta}

Compute uses a metadata service for virtual machine instances to retrieve instance-specific data. 

You can add and remove metadata for flavors, see [Managing Metadata](/helion/commercial/carrier/dashboard/managing/metadata/).


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
