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

# HP Cloud OS for Moonshot Patch 1.0.1

This topic contains the following information about the HP Cloud OS for Moonshot patch release:

* [Features in HP Cloud OS for Moonshot Patch](#features)

* [Recommendations for HP Cloud OS for Moonshot Patch](#recommendations)

* [For further information](#for-further-information)

##Features in HP Cloud OS for Moonshot Patch 1.0.1## {#features}

**Local Boot** &mdash; This release provides an enhancement to boot the nodes of the chassis using the local boot option. The patch allows the boot option to be set as Hard Drive Disk (HDD). Hence, when  a new instance is created the subsequent boot after the provisioning is from HDD/Local disk.


**Windows Support** &mdash; With this release, HP Cloud OS for Moonshot now supports the deployment of different versions of Microsoft Windows (Windows 2012, Windows 2012 R2, and Windows 7 Enterprise SP1(x64)) on HP ProLiant m300 and m700 cartridges. <br> 

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

 For best result, perform the steps mention in [Building Images](/cloudos/moonshot/manage/image-builder/) to build the image used for provisioning the instance.
 
###Resolved issues ### {#resolved-issues}

The following issues are resolved in this patch release.

####Installation####

Create Region fails due to a GET_SERVER_CERTIFICATE verification failure has been resolved.

####Provisioning####

Bulk provisioning issues has been resolved and is successful now. 

####General####

* Edit Network option is disabled in the Networks page in the Administration Dashboard.

* Refined Cloud Resource Pool creation for moonshot release.

* Apollo now assigns individual shellinabox port for all the nodes of m700 cartridge. 


##For further information## {#for-further-information}

For additional related information on HP Cloud OS for Moonshot:

* [HP Cloud OS for Moonshot documentation web site](/cloudos/moonshot/): Provides the topics listed below, plus FAQs, video tutorials, and more.

* [Building Images](/cloudos/moonshot/manage/image-builder/): Provides the steps to build the images for Linux and Windows.


