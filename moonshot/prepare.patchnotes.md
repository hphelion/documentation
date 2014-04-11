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


<p style="font-size: small;"> <a href="/cloudos/moonshot/">&#9664; PREV | <a href="/cloudos/moonshot/">&#9650; UP</a> | <a href="/cloudos/moonshot/prepare/supportmatrix/">NEXT &#9654;</a> </p>

# HP Cloud OS for Moonshot Patch 1.0.0002 


This topic contains the following information about the HP Cloud OS for Moonshot patch release:

* [Features in HP Cloud OS for Moonshot Patch](#features)

* [Recommendations for HP Cloud OS for Moonshot Patch](#recommendations)

* [For further information](#for-further-information)

##Features in HP Cloud OS for Moonshot Patch 1.0.0002## {#features}


**Local Boot** &mdash; With this release, you can now boot the nodes of the chassis using the local boot option. The patch allows the boot option to be set as Hard Disk Drive (HDD). 


**To ensure successful local boot process, the following is recommended:**

* Boot option for all the nodes of the chassis should be set to **HDD**. 

* Images are created using the steps defined in [Building Images](http:///cloudos/moonshot/manage/image-builder/) document.

Once the patch is applied successfully on HP Cloud OS for Moonshot, it enables the following:

1.	All subsequent boots after the provisioning are from HDD/local disk when a new instance is created.The instances continue to boot successfully even if there is a downtime in the Baremetal host.

2. If the boot configuration of the nodes in the chassis is set to PXE, the instances boot from PXE. When there is a downtime in the Baremetal host, the instances try PXE booting first but are unable to and fall back on HDD. The instances boot successfully from HDD.

3. For instances created before the patch update, all the subsequent boots  are from the HDD/local disk based on the boot settings of the nodes in the chassis.


**Windows Support** &mdash; This patch release of HP Cloud OS for Moonshot offers an additional feature to support the deployment of different versions of Microsoft Windows (Windows 2012, Windows 2012 R2, and Windows 7 Enterprise SP1(x64)) on HP ProLiant servers. This patch enables the deployment of Microsoft Windows (Windows 2012, Windows 2012 R2) on m300 cartridge and Windows 7 Enterprise SP1(x64)) on m700 cartridges.<br> 

Prior to the patch installation, upgrade the firmware of the chassis manager of the HP ProLiant m300 and m700 cartridges.

HP Moonshot Windows Component Packs can be used to upgrade the chassis firmware. The component pack consists of the following two packs: 

 * HP Moonshot Windows Deployment Pack for HP ProLiant m300 cartridge (HP MWDP) - This is designed for HP ProLiant m300 cartridge and is used to assist the deployment of Microsoft Windows Server 2012 or Microsoft Windows Server 2012 R2.
 
* HP Moonshot Windows Deployment Pack for HP ProLiant m700 cartridge (HP MWDP) - This is designed for HP ProLiant m700 cartridge and is used to assist the deployment of Microsoft Windows 7 Enterprise with SP1 (x64).

Download HP MWDP from [http://www.hp.com/go/moonshot/1500chassis-software-download](http://www.hp.com/go/moonshot/1500chassis-software-download)


##Recommendations for HP Cloud OS for Moonshot## {#recommendations}

This section describes the HP recommendations for best performance, functionality, and usability with this software version. 
We have also provided information about the resolved issues for reference purposes. This section contains:

* [Recommendations for best functionality, performance and reliability](#best-practices)
 
* [Resolved issues](#resolved-issues) 

###Recommendations for best functionality, performance and reliability### {#best-practices} 

HP recommends the following best practices for HP Cloud OS for Moonshot.

####Image Building####

 For best results, perform the steps mention in [Building Images](/cloudos/moonshot/manage/image-builder/) to build the image used for provisioning the instance.

#### Configuration####

For successful local boot, the boot option should be set to Hard Disk Drive for all the nodes of the chassis that are managed by HP Cloud OS for Moonshot.
 
###Resolved issues ### {#resolved-issues}

The following issues are resolved in this patch release.

####Installation####

Create Region fails due to a GET_SERVER_CERTIFICATE verification failure has been resolved.

####Provisioning####

Bulk provisioning issue has been resolved and is successful now. 

####General####

* Edit Network option is disabled in the Networks page in the Administration Dashboard.

* Refined Cloud Resource Pool creation for moonshot release.

* Apollo now assigns individual shellinabox port for all the nodes of m700 cartridge. 


##For further information## {#for-further-information}

For additional related information on HP Cloud OS for Moonshot:

* [HP Cloud OS for Moonshot documentation web site](/cloudos/moonshot/): Provides the topics listed below, plus FAQs, video tutorials, and more.

* [Building Images](/cloudos/moonshot/manage/image-builder/): Provides the steps to build the images for Linux and Windows.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
