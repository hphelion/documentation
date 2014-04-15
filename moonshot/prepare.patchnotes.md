---
layout: default
title: "HP Cloud OS for Moonshot for Moonshot Patch Notes"
permalink: /cloudos/moonshot/prepare/patchnotes/
product: moonshot

---


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/prepare/">&#9664; PREV | <a href="/cloudos/moonshot/prepare/">&#9650; UP</a> | <a href="/cloudos/moonshot/prepare/releasenotes/">NEXT &#9654;</a> </p>

# HP Cloud OS for Moonshot 1.01.0000 Patch Notes 

This topic contains the following information about the HP Cloud OS for Moonshot patch release:

* [Features in HP Cloud OS for Moonshot Patch](#features)

* [Recommendations for HP Cloud OS for Moonshot Patch](#recommendations)

* [Procedure to apply HP Cloud OS for Moonshot Patch 1.01.0000](#apply-patch)

* [For further information](#for-further-information)

These Patch Notes include updates to information presented in the HP Cloud OS for Moonshot 1.0 [Release Notes](/cloudos/moonshot/prepare/releasenotes).

## Features in HP Cloud OS for Moonshot Patch 1.01.0000 {#features}


**Hard Disk Drive Boot (HDD)** &mdash; With this release, the user has an option to select the boot method based on the node persistent boot configuration. If the node is set to boot persistently from PXE, all subsequent boots after provisioning are from PXE. Similarly, if the node is set to boot persistently from HDD, all subsequent boots after provisioning are from HDD.    

**To ensure successful HDD boot process, the following is recommended:**

* Boot option for all the nodes of the chassis should be set to **HDD**. 

* Images are created using the steps 3 - 7 defined in Section One (Creating a disk image) as described in [Building Images](/cloudos/moonshot/manage/image-builder/) document.

Once the patch is applied successfully on HP Cloud OS for Moonshot, it enables the following:

1. If the boot configuration of the nodes in the chassis is set to HDD, the instances boot from HDD. The instances continue to boot successfully even if there is a downtime in the Baremetal host.

2. If the boot configuration of the nodes in the chassis is set to PXE, the instances boot from PXE. When there is a downtime in the Baremetal host, the instances try PXE booting first but are unable to and fall back on HDD. The instances boot successfully from HDD.

3. For instances created before the patch update, all the subsequent boots are from the PXE only irrespective of node boot setting.


**Windows Support** &mdash; This patch release of HP Cloud OS for Moonshot offers an additional feature to support the deployment of Microsoft Windows (Windows 2012, Windows 2012 R2) on m300 cartridge and Windows 7 Enterprise SP1(x64) on m700 cartridges.<br> 

Prior to the patch installation, upgrade the firmware of the chassis manager of the HP ProLiant m300 and m700 cartridges.

Windows images should be created using the instructions as mentioned in the Section Two - Creating Windows Images as described in [Building Images](/cloudos/moonshot/manage/image-builder/) document.


## Recommendations for HP Cloud OS for Moonshot {#recommendations}

This section describes the HP recommendations for best performance, functionality, and usability with this software version. 
We have also provided information about the resolved issues for reference purposes. This section contains:

* [Recommendations for best functionality, performance and reliability](#best-practices)
 
* [Resolved issues](#resolved-issues) 

### Recommendations for best functionality, performance and reliability {#best-practices} 

HP recommends the following best practices for HP Cloud OS for Moonshot.

#### Image Building

For best results, perform the steps mention in [Building Images](/cloudos/moonshot/manage/image-builder/) to build the image used for provisioning the instance.

#### Configuration

For successful local boot, the boot option should be set to Hard Disk Drive for all the nodes of the chassis that are managed by HP Cloud OS for Moonshot.
 
### Resolved issues {#resolved-issues}

The following issues are resolved in this patch release.

#### Installation

In 1.0, Create Region failed due to a GET_SERVER_CERTIFICATE verification issue. The 1.01.0000 patch fixes this issue.

#### Provisioning

In 1.0, there was a bulk provisioning issue.  The 1.01.0000 patch fixes this issue.

#### General

* In 1.0, the Edit Network option was disabled in the Networks page in the Administration Dashboard. The 1.01.0000 patch fixes this issue.

* In 1.0, there was an issue with the Refined Cloud Resource Pool creation process. The 1.01.0000 patch fixes this issue.

* Starting with the 1.01.0000 patch, the Apollo service now assigns an individual shellinabox port for all the nodes of an m700 cartridge. 


## Procedure to apply the HP Cloud OS for Moonshot Patch 1.01.0000 {#apply-patch}

Perform the following steps to apply the patch 1.01.0000:

1. Launch the Cloud OS for Moonshot Operational Dashboard.  

2. Login with the credentials. 

3. Select  **Updates and Extension.**  The patch COSMOS_1_01_patch is listed here.

4. Click **Download** to download COS4MS_1_01_patch. Once the patch is successfully downloaded, you can install it.

5. Click **Install**.  When the installation is completed the status changes to installed.

At that point, you will have successfully installed the patch.


##For further information## {#for-further-information}

For additional related information on HP Cloud OS for Moonshot, see:

* [HP Cloud OS for Moonshot documentation web site](/cloudos/moonshot/): Provides the topics listed below, plus FAQs, video tutorials, and more.

* [Building Images](/cloudos/moonshot/manage/image-builder/): Provides the steps to build the images for Linux and Windows.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

