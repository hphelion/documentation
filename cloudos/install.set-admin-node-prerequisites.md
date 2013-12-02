---
layout: default
title: "Cloud OS Installation - Set Admin Node Prerequisites (Required)"
permalink: /cloudos/install/set-admin-node-prerequisites/
product: cloudos

---

# Cloud OS Installation - Set Admin Node Prerequisites (Required)

This topic describes the steps to set your Admin Node's prerequisites.  These steps are required. 

Your first step in the Operational Dashboard is to configure the following Admin Node prerequisites.

 **Caution:** Any prerequisites you want to configure, must be done before you complete the
steps in "Complete the Admin Node Installation". After that, the Edit Prerequisite dialogs will
be read-only. Once the install process is triggered, no changes can be made. If you want to
make changes, you need to start over by re-installing the Admin Node. See [Boot the Admin
Node Using the Cloud OS ISO](/cloudos/install/before-you-install/) in the previous topic.

 * (Optional) Cloud Administration Node Internet Access &mdash; configure if you want to set up
internet access on the Admin Node. You will need Internet access for downloading install
modules or plugins using the Updates and Extensions panel.  See the topic [Configure Updates and
Extensions](/cloudos/install/updates-and-extensions/.

 * External DNS Server - configure to add the IP address of the external DNS server your Cloud
OS environment is using to access named websites within your cloud.

## Install and Set Up the Admin Node

 * Cloud Administration Node Time Settings &mdash; configure to reflect the current time to ensure
that the Cloud is created successfully.

 * (Optional) Email Notification Settings -- configure to send email notifications when the Cloud
and Compute Region operation completes since this takes some time. By enabling and setting
this prerequisite, you can be alerted by e-mail when each operation completes.

### Enable Admin Node Internet Access

To enable the Admin Node Internet Access:

 1. On the Operational Dashboard, select the Environment tab > Prerequisites.

 2. For Cloud Administration Node Internet Access, click Edit to open the prerequisites dialog.

 3. Set the Network Interface to the network interface on the Admin Node that has been configured for internet access, for example, eth1.

 4. Leave the default Network Configuration checked as DHCP. If you have a static IP address allocated for the node, fill in the appropriate information and
uncheck DHCP.

5. Set the HTTP Proxy Information applicable for your environment. If you are on a network that has a proxy, you must fill in this Proxy information.

 **Caution:** Specifying incorrect proxy host settings might cause failures in launching the Operational Dashboard and the Administration Dashboard.

 a. Specify the Host - &lt;IP address>
 
 > Get this value from your system administrator or from the settings in your web browser.
 
 b. Specify the Port - &lt;Port>

 > Get this value from your system administrator or from the settings in your web browser.
 
 c. Specify the Non-Proxy Hosts - &lt;non-proxy IP address>
 > Specify addresses that should not use proxy servers (for the Controller/Compute Nodes' admin and os_sdn networks, IP range). Each network needs to be separated by a pipe bar "|".
 For example: 10.*|192.*|localhost.
 
 d. If necessary, specify the optional Username and Password.
 
 6. Click Update Prerequisite.

 7. Click Complete Prerequisite to complete this setup for the Cloud Administration Node Internet Access entry.

When this prerequisite completes, a timestamp will be displayed in the Last Updated column.


### Set the External DNS Server

To set the external DNS server:

 1. On the Operational Dashboard, select the Environment tab > Prerequisites.

 2. For External DNS Server, click Edit Prerequisite to edit the external DNS server prerequisites.

 3. Type the appropriate IP address for the external DNS server used by your Cloud OS environment to be able to access named websites within your cloud.

 4. Click Update Prerequisite.

When this prerequisite completes, a timestamp will be displayed in the Last Updated column.

### Set the Time for the Admin Node

To set the time for the Admin Node:

 1. On the Operational Dashboard, select the Environment tab > Prerequisites.

 2. For Cloud Administration Node Time Settings, click Edit Prerequisites.

 3. Set the appropriate Timezone for your area (UTC is the default).

 4. Set the Date and Time applicable for your environment if different from the default.
 
 5. Select Update Prerequisite, then Complete Prerequisite.
 
When this prerequisite completes, a timestamp will be displayed in the Last Updated column.

### Set the Email Notification

To set the email notification:

 1. On the Operational Dashboard, select the Environment tab > Prerequisites.

 2. For Email Notification Settings, click Edit Prerequisites to open the email notification dialog.

 3. Click the Enable Notification checkbox.

 4. Set the SMTP Server to an SMTP server that is valid for your network.

 5. Set From Address to an applicable email address for your environment. Most likely, you would add your email address as the person responsible for managing the cloud infrastructure.

 6. Set To Address to an applicable email address or comma-separated addresses for your environment. This address could be to the person who started the cloud build, or anyone who is
interested in following the cloud build process.

 7. Click Update Prerequisite. 

When the Cloud and Compute Region operation completes, the email goes to the listed recipients, showing the start and completion times.

When this prerequisite completes, a timestamp will be displayed in the Last Updated column.

## Prerequisite Troubleshooting

If any of the prerequisite steps fail to complete, an error message displays.  If this happens, see [Problem Admin Node Internet
Access Prerequisites fail to complete](/cloudos/troubleshooting/) in the Troubleshooting topic. 


[Previous: Before You Install](/cloudos/install/before-you-install/) | [Next: Customize Server Types](/cloudos/install/customize-server-types/)

