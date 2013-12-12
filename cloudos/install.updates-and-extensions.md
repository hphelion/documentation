---
layout: default
title: "Updates and Extensions"
permalink: /cloudos/install/updates-and-extensions/
product: cloudos

---

<a name="_top"> </a>

<script> 

function PageRefresh { 
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/install/hot-fixes/">&#9664; PREV</a> | <a href="/cloudos/install/">&#9650; UP</a> | <a href="/cloudos/install/advanced-cloud-setup/">NEXT &#9654;</a> </p>

# Install Hot Fixes

This topic explains how to obtain patches and other functionality that is relevant to your cloud environments from the 
HP Cloud OS Distribution Network (CODN). 

## Start in the HP Cloud OS Operational Dashboard

1. From the Cloud tab in the Operational Dashboard, click the Updates and Extensions panel.   
If you are accessing this page for the first time, there is no data to display in the table.

2. Click the Configure button.

3. On the Configure dialog, if you are using it for the first time, sign up for the CODN catalog store.

4. After registering or logging in, you are returned to the Updates and Extensions panel. Available downloads that are relevant to HP Cloud OS are presented.

5. Click the Download button. This step queues up the download but does not execute it yet.

6. If you are about to install a hot fix to an install module, for example "Keystone Token Expiration Hotfix", you should first go to the HP Cloud OS Installation Dashboard, at http://192.168.124.10:3000. The login is crowbar / crowbar.

7. In the Installation Dashboard, open the proposal by clicking the Edit button.  Verify that its role(s) and attributes are appropriately set for your cloud.  

8. Now return to the Operational Dashboard.  Back in the Updates and Extensions panel, click Install. 

9. More coming...

 
 
<!-- 
## Configure Option

Click the Configure option to sign up for an HP Web Catalog account, or login with your credentials.

In the CODN catalog, search for relevant functionality.  This could include:

* Hot fixes (patches) to your version of HP Cloud OS.

* An HP Moonshot workload that you want to execute on your cloud environment.  This could include portions of HP Cloud OS such as a customized Glance image and Focus topology document, which you could then deploy to your HP Moonshot chassis.  

* Specific VMs that support High Availability (HA) Apache servers.

* Or other value-added software, such as a Microsoft Outlook Mail Server, to be used as a resource in your cloud.
--> 

## Next Step

If you have not already done so, proceed to [Launch the Administration Dashboard](/cloudos/install/launch-admin-dashboard).

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

