---
layout: default
title: "Set Admin Node Prerequisites (Required)"
permalink: /cloudos/moonshot/install/admin-node-prerequisites/
product: cloudos

---

<a name="_top"> </a>

<script> 

function PageRefresh { 
onLoad="window.refresh"
}
 
PageRefresh();
 
</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/install/before-you-install/">&#9664; PREV</a> | <a href="/cloudos/moonshot/install/">&#9650; UP</a> | <a href="/cloudos/moonshot/install/customize-server-types/">NEXT &#9654;</a> </p>


# Set Admin Node Prerequisites (Required)

Your first step in the HP Cloud OS Operational Dashboard is to configure the Admin Node prerequisites. See the sections in this topic:

* [Enable Admin Node Internet Access](#enable-admin-node-internet-access) &mdash; Set up Internet access on the Admin Node. You will need Internet access for downloading hot fixes using the Hot Fixes panel of the Cloud tab. For details, see the [Install Hot Fixes](/cloudos/moonshot/install/hot-fixes/) topic.

* [Set the External DNS Server](#set-the-external-dns-server) &mdash;  Add the IP address of the external DNS server that your Cloud OS environment is using to access named websites within your cloud.

* [Set the Time for the Admin Node](#set-the-time-for-the-admin-node) &mdash; Configure the date/time settings accurately because the Admin Node acts as the NTP Server to all the managed nodes.

* [Set the Email Notification](#set-the-email-notification) &mdash; Configure your cloud to send email notifications when the Cloud and Compute Region operation completes since this takes some time. By enabling and setting this prerequisite, you can be alerted by e-mail when each operation completes.

**Note:** In the current release, after you complete the Admin Node installation, you cannot go back to modify the prerequisite settings. Set the values carefully! 

<!--
...., you may continue to use the Operational Dashboard to modify the following prerequisite values:  
* Cloud Admin Node Time settings 
* Email Notification settings
You cannot change:
* Admin Node Internet Access settings
* External DNS Server settings
--> 


## Enable Admin Node Internet Access

To enable the Admin Node Internet Access:

1. On the Operational Dashboard, select the Environment tab > Prerequisites.

2. For the Cloud Administration Node Internet Access, click **Edit Prerequisite**.

3. Set the Network Interface to the network interface on the Admin Node that has been configured for internet access, for example, eth1.

4. Leave the default Network Configuration checked as DHCP. If you have a static IP address allocated for the node, uncheck DHCP and fill in the appropriate information.

5. Set the HTTP Proxy Information applicable for your environment. If you are on a network that has a proxy, you must fill in this Proxy information.

**Caution:** Specifying incorrect proxy host settings might cause some features to not work correctly later, after the installation, when you use the HP Cloud OS Administration Dashboard.

 a. Specify the Host's IP address
 
> Get this value from your system administrator or from the settings in your web browser.
 
 b. Specify the Port

> Get this value from your system administrator or from the settings in your web browser.
 
 c. Specify the Non-Proxy Hosts' IP addresses
	 
> Specify addresses that **should not** use proxy servers (for the Controller/Compute Nodes' admin and os_sdn networks, IP range). 
Each network needs to be separated by a pipe bar "|". For example: 10.\*|192.\*|localhost.
 
 d. If necessary, specify the optional Username and Password.
 
> After completing the steps above, click **Update Prerequisite**.

> Now click **Complete Prerequisite** to complete this setup for the Cloud Administration Node Internet Access entry.

When this prerequisite completes, a timestamp will be displayed in the Last Updated column.


## Set the External DNS Server

To set the external DNS server:

1. On the Operational Dashboard, select the Environment tab > Prerequisites.

2. For the External DNS Server, click **Edit Prerequisite**.

3. Type the appropriate IP address for the external DNS server used by your Cloud OS environment to be able to access named websites within your cloud.

4. Click **Update Prerequisite**.

When this prerequisite completes, a timestamp will be displayed in the Last Updated column.


## Set the Time for the Admin Node

To set the time for the Admin Node:

1. On the Operational Dashboard, select the Environment tab > Prerequisites.

2. For the Cloud Administration Node Time Settings, click **Edit Prerequisite**.

3. Set the appropriate Timezone for your area (UTC is the default).

4. Set the Date and Time applicable for your environment if different from the default.
 
5. Click **Update Prerequisite**.

6. Click **Complete Prerequisite** to complete this setup for the Set the Time for the Admin Node entry.
 
When this prerequisite completes, a timestamp will be displayed in the Last Updated column.


## Set the Email Notification

To set the email notification:

1. On the Operational Dashboard, select the Environment tab > Prerequisites.

2. For the email notification settings, click **Edit Prerequisites**.

3. Click the Enable Notification checkbox.

4. Set the SMTP Server to an SMTP server that is valid for your network.

5. Set From Address to an applicable email address for your environment. Most likely, you would add your email address as the person responsible for managing the cloud infrastructure.

6. Set To Address to an applicable email address or comma-separated addresses for your environment. This address could be to the person who started the cloud build, or anyone who is interested in following the cloud build process.

7. Click **Update Prerequisite**.

When the Cloud and Compute Region operation completes, the email goes to the listed recipients, showing the start and completion times.

When this prerequisite completes, a timestamp will be displayed in the Last Updated column.

## Prerequisite Troubleshooting

If any of the prerequisite steps fail to complete, an error message displays.  If this happens, see the "Admin Node Internet Access 
Prerequisites fail to complete" section of the [Troubleshooting](/cloudos/moonshot/manage/troubleshooting/) topic. 

## Next Step

Proceed to the next topic, [Customize Server Types](/cloudos/moonshot/install/customize-server-types/). 

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

