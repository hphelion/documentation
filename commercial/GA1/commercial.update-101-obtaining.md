---
layout: default
title: "HP Helion OpenStack&#174; Release Notes"
permalink: /helion/openstack/update/download/101/
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
<p style="font-size: small;"> <a href="/helion/openstack/">&#9664; PREV | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/faq/">NEXT &#9654; </a></p>
-->
# HP Helion OpenStack&reg; Obtaining the Patch Update

There are two methods to obtain latest working update code:

* Using Cloud OS Distribution Network by connecting to the catalog.
* Import for cases where there is no network connectivity or would like to obtain the latest CSU's that are not published in the catalog.

## Downloading from catalog: 

To use the Cloud OS Distribution Network (CODN) to download the patch update from the catalog.

1. [Login to the Sherpa UI on the undercloud](/helion/openstack/services/sherpa/accessing/).

2. Navigate to **Admin -> Updates and Extensions -> Updates and Extensions**.

3.	Click **Configure** to authenticate to the Cloud OS Distribution Network.

	<img src="media/SherpaConfigure.jpg">

4. Select **Patch Update Code** and click **Download**.

5. Follow instructions at Installing update code
 
**Please note that the catalog item will be updated regularly, but might be lagging with respect to the latest merges into the project. 

Importing local copy:

1. [Login to the Sherpa UI on the undercloud](/helion/openstack/services/sherpa/accessing/).

2. Navigate to **Admin -> Updates and Extensions -> Updates and Extensions**.

3.	Click the **Import** button on top right corner.

4.	Select the CSU file created by the build process or a manually created file. You can ignore the signature file. **

5.	Click **Import** to deliver the CSU file for further processing.

	<img src="media/SherpaImport.jpg">

6.	Follow instructions at Installing update code

 