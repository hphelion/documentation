---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Specifying a Page Size for a VM"
permalink: /helion/commercial/carrier/dashboard/managing/flavors/extra/page/
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

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Specifying a Page Size for a VM

You can request a specific page size for a VM by using a flavor with the required extra spec when you launch the
VM, or by defining an image with the required metadata property.

<hr>
**Note:** This feature applies to the Wind River Linux region only.
<hr>

Before you can request huge pages for a VM, you must define the available page sizes on the hosts in the cluster. 

Memory required by a guest is allocated as one or more pages of the requested size. Once allocated, the memory is unavailable for use by other guests until the instance is terminated.

To add this extra spec to a flavor using the Horizon dashboard, use the VCPU Model selection in the [Create Flavor Extra Spec drop-down menu](/helion/commercial/carrier/dashboard/managing/flavors/extra/)

You can also specify the extra spec from the CLI by setting the following parameter for a flavor:

	hw:mem_page_size=pagesize

where `pagesize` is one of the following:

* small - Requests the smallest available size on the compute node.
* large - Requests the largest available huge page size (1GiB, then 2MiB). This setting is not recommended (see note).
* any - Requests any available size, including smaller pages. The actual size used depends on the compute driver implementation. 
* 2048 - Requests a 2MiB page.
* 1048576 - Requests a 1GiB page.

If no page size is specified, small pages are used by default.

**Note:** The use of large or any is not recommended. These settings can cause migration issues if the largest available size varies from host to host. For reliable results, use small or a specific page size.

**Example:** 

To set a 2MiB page size on a flavor that has already been created, use the following command:

	nova flavor-set hw:mem_page_size=2048

You can also define an image with the required property by including the hw_mem_page_size parameter, as in the following example:

	nova image-meta image hw_mem_page_size=pagesize

Note that if you use image metadata to request a page size, the image is unable to access a large page unless the setting for the flavor is also large or any.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
