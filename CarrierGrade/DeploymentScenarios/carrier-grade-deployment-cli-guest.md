---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Setting Up the Example Guest Image Using the CLI"
permalink: /helion/openstack/carrier/deploy/cli/guest/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: All

authors: Paul F

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/openstack/1.1/3rd-party-license-agreements/">&#9664; PREV</a> | <a href="/helion/openstack/1.1/">&#9650; UP</a> | NEXT &#9654; </p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): Setting Up the Example Guest Image Using the CLI

You can use the CLI to import guest images for use with HP Helion OpenStack Carrier Grade. 

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

An example guest disk image is distributed with HP Helion OpenStack Carrier Grade. It must be transferred to the active controller using a tool such as scp. This exercise assumes that the image is available as `/usr/share/images/example-guest.img`.

Once it is available in the controller, the image must be uploaded to the Image Operations service (Glance), the OpenStack image deployment service.

Once it is available in Image Operations service, the image must be used to create a bootable Cinder volume. The volume can be used
to launch an instance.

1. List the images available on the system.

	glance image-list

	Since no images have been defined yet, an empty list is displayed.

2. Upload the guest image to the Image Operations service.

	glance image-create --name example-guest \
	--is-public true --container-format bare --disk-format qcow2 \
	--file /usr/share/images/example-guest.img

	The image `example-guest` is listed as active, as illustrated below:

		glance image-list

3. Create a bootable volume using the image.

	a. Set up the UUID variable for the image.

		export image_UUID=`glance image-list | grep exampleguest \
		| awk '{print $2}'`

	b. Create the volume.

	cinder create --image-id ${image_UUID} \
	--display-name=vol-example-guest 1

	The new volume is created.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----