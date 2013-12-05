---
layout: default
title: "Updates &amp; Extensions"
permalink: /cloudos/install/updates-extensions/
product: cloudos

---

<a name="_top"> </a>

<script> 

function PageRefresh { 
onLoad="window.refresh"
}

PageRefresh();

</script>


# Updates and Extensions 

This topic describes the steps to apply updates (such as software hot fixes) or extensions, or both, to your deployed clouds. 
While the extensions may be optional, the updates from HP may be recommended by HP Support, as determined by your requirements 
and discussion with the support representative.

## Perform an Update

In the Operational Dashboard, from the Cloud tab:

1. Click Updates and Extensions

2. Initially the display may be blank. You have two options:

 a. Click the Configure button to access the HP Cloud OS Distribution Network (CODN), which is an online catalog store that contains install modules representing a wide range of functionality that you could apply to your cloud.

 b. Click the Import button to browse to an install module that resides on your local filesystem. 
 
## Configure Option

**Internal note**: This feature might be removed from Cosmos in G3 - waiting for final word.

Click the Configure option to sign up for an HP Web Catalog account, or login with your credentials.

In the CODN catalog, search for relevant functionality.  This could include:

* Hot fixes (patches) to your version of HP Cloud OS.

* An HP Moonshot workload that you want to execute on your cloud environment.  This could include portions of HP Cloud OS such as a customized Glance image and Focus topology document, which you could then deploy to your HP Moonshot chassis.  

* Specific VMs that support High Availability (HA) Apache servers.

* Or other value-added software, such as a Microsoft Outlook Mail Server, to be used as a resource in your cloud.

## Import Option

If you have already downloaded a package to your client's local filesystem, and you want to add its functionality to your cloud, click the Import button 
on the Operational Dashboard's Updates and Extensions page. You can then browse for a .CSU file that contains the already downloaded package. 

Use case: you have received information that updated or new versions of functionality are available, and after downloading them, you now want to apply them to your existing cloud environment.  This 
functionality could include:

* Hot fixes (patches) to your version of HP Cloud OS.

* An HP Moonshot workload that you want to execute on your cloud environment.  This could include portions of HP Cloud OS such as a customized Glance image and Focus topology document, which you could then deploy to your HP Moonshot chassis.  

* Specific VMs that support High Availability (HA) Apache servers.

* Or other value-added software, such as a Microsoft Outlook Mail Server, to be used as a resource in your cloud.

## Next Step

Proceed to [Launch the Administration Dashboard](/cloudos/install/launch-admin-dashboard).

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

