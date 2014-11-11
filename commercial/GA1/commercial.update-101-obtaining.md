---
layout: default
title: "HP Helion OpenStack&#174; Obtaining the Patch Update"
permalink: /helion/openstack/update/download/101/
product: commercial.ga

---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--
<p style="font-size: small;"> <a href="/helion/openstack/">&#9664; PREV | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/faq/">NEXT &#9654; </a></p>
-->
# HP Helion OpenStack&reg; Obtaining the Patch Update Package

An HP Helion OpenStack patch update is a series of images and scripts that enhance functionality or fix issues found in a previous Helion release.  

Before beginning the update, obtain the patch update package using one of the two following methods:

* Using the Helion Distribution Network by connecting to the catalog.
* Importing a local copy when there is no network connectivity or when the user would like to obtain the latest files that are not yet published in the catalog.

## Downloading from the Catalog

To use the Helion Distribution Network (HDN) to download the patch update from the catalog.

1. [Log in to the Sherpa UI on the undercloud](/helion/openstack/services/sherpa/accessing/).

2. Navigate to **Admin -> Updates and Extensions -> Updates and Extensions**.

3.	Click **Configure** to authenticate to the Helion Distribution Network.

	<img src="media/SherpaConfigure.png">

4. Select **Patch Update Code** and click **Download**.

5. Review the information in [Update Prerequisites](/helion/openstack/update/prereqs/101/).
 
## Importing a Local Copy ##

1. [Log in to the Sherpa UI on the undercloud](/helion/openstack/services/sherpa/accessing/).

2. Navigate to **Admin -> Updates and Extensions -> Updates and Extensions**.

3.	Click the **Import** button on top right corner.

4.	Select the patch update file to download.

5.	Click **Import** to deliver the patch update file for further processing.

	<img src="media/SherpaImport.png">

## Next Steps {#next-steps}

Review the Prerequisites for information or tasks that need to be performed before starting the update. 

For prerequisites, see the [Update Prerequisites](/helion/openstack/update/prereqs/101/).


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*


 