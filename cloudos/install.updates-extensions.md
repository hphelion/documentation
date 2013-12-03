---
layout: default
title: "Updates &amp; Extensions"
permalink: /cloudos/install/updates-extensions/
product: cloudos

---

# Updates and Extensions 

This topic describes the steps to apply updates (such as software hot fixes) or extensions, or both, to your deployed clouds. 
While the extensions may be optional, the updates from HP may be recommended by HP Support, as determined by your requirements 
and discussion with the support representative.

## Perform an Update

In the Operational Dashboard, from the Cloud tab:

1. Click Updates and Extensions

2. Initially the display may be blank. You have two options:

 a. Click the Configure button to access the HP Web Catalog, which is an online store that contains install modules representing a wide range of functionality that you could apply to your cloud.

 b. Click the Import Package button to browse to an install module that resides on your local filesystem. 
 
## Configure Option

Click the Configure option to sign up for an HP Web Catalog account, or login with your credentials.

In the Web Catalog, search for relevant functionality.  This could include:

* Hot fixes (patches) to your version of HP Cloud OS.

* An HP Moonshot workload that you want to execute on your cloud environment.  This could include portions of HP Cloud OS such as a customized Glance image and Focus topology document, which you could then deploy to your HP Moonshot chassis.  

* Specific VMs that support High Availability (HA) Apache servers.

* Or other value-added software, such as a Microsoft Outlook Mail Server, to be used as a resource in your cloud.

## Import Package Option

If you have already downloaded a package to your client's local filesystem, and you want to add its functionality to your cloud, click the Import Package option 
on the Operational Dashboard's Updates and Extensions page. 

## Next Step

If you followed the automated steps to create your cloud, which provided a default set of install modules, you are done and may proceed to the Administration Dashboard. 
However, if you need to customize values in the install modules that are not exposed in the Create Cloud Attributes tab, see the next topic, [Advanced Cloud Setup](/cloudos/install/advanced-cloud-setup/). 

