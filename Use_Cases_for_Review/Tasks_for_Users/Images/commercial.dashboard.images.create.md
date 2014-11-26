---
layout: default
title: "HP Helion OpenStack&#174; Creating Images"
permalink: /helion/commercial/dashboard/managing/images/create/
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

# HP Helion OpenStack&#174; Creating Images

Creating a new image for use in HP Helion OpenStack Community requires two general steps.</p>

The first step is to create an ISO image file outside of your HP Helion OpenStack Community. </p>

When the ISO image file is complete and ready for use, you use HP Helion OpenStack Community to upload the image to your cloud.</p>

<strong>Note:</strong> After you upload an image, it is considered *golden* and you cannot change it.</p>

### Create an image ###

1. <a href="/helion/community/dashboard/login/">Launch the HP Helion OpenStack Community web interface.</a></p>

2. Click the <strong>Images</strong> link on the <strong>Project</strong> dashboard <strong>Compute</strong> panel.</p>

3. In the <strong>Images</strong> screen, click <strong>Create Image</strong>.</p>

4. In the <strong>Create an Image</strong> screen, provide the image information:</p>

	* Name - Enter a name for the image.</li>
	* Description - Optionally, enter a brief description of the image.</li>
	* Image Source - Choose the image source from the list. Your choices are Image Location and Image File.</li>
	* Image File or Image Location - Based on your selection for Image Source, you either enter the location URL of the image in the Image Location field. or browse to the image file on your system and add it.</p>
		**Note:** The Image Location field must be a valid and direct URL to the image binary. URLs that redirect or serve error pages will result in unusable images.</p>
	* Format - Select the correct format (for example, QCOW2) for the image.</li>
	* Architecture - Specify the architecture. For example, i386 for a 32-bit architecture or x86-64 for a 64-bit architecture.</li>
	* Minimum Disk - Enter the minimum disk size required to boot the image. Leave the field blank to specify no minimum. </li>
	* Minimum RAM (MB) - Enter the minimum memory size required to boot the image. Leave the field blank to specify no minimum.</li>
	* Public - Select this option to make the image public to all users with access to the current project. Leave the option clear to allow the image to be used in all projects in the domain.</li>
	* Protected - Select this option to prevent the image from being deleted.  Leave the option clear to allow the image to be deleted.</li>

5. Click <strong>Create Image</strong> to launch the image.	</p>

6. Optionally, you can click <strong>Launch</strong> to <a href="/helion/community/instances/create/">create a running instance</a> based on this image.</p>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a></p>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*