---
layout: default
title: "HP Cloud OS for Moonshot: Administration Dashboard"
permalink: /cloudos/moonshot/manage/administration-dashboard/setting-tab/
product: moonshot

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/administration-dashboard/before-you-begin/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage/administration-dashboard/before-you-begin/">&#9650; UP</a> | <a href= "/cloudos/moonshot/manage/image-builder/">NEXT &#9654; </p> </a> 


# Setting Tab #

On the top right corner of the Administration Dashboard window, the **Settings** link is displayed. The link is available to all users. The Settings link helps you to modify dashboard settings for all users of your site, change password and gives details about the HP Cloud OS for Moonshot Administration Dashboard.

You can perform the following tasks:

* <a href="#Customize Site Settings">Customize Site Settings</a>

* <a href="#Customize User Settings">Customize User Settings</a>

* <a href= "#Change Password"> Change Password</a>

* <a href= "#About HP Cloud OS for Moonshot Administration Dashboard">About HP Cloud OS for Moonshot Administration Dashboard</a>



##Customize Site Settings <a name= "Customize Site Settings"></a>

All Administration Dashboard users can access settings for User, Password, About and Help. Only the Admin user can access the Administration Dashboard Site Settings window. When the Admin user changes site settings, the changes affect all users of the site.

To access site settings:

1.	Log into the Administration Dashboard as Admin User.

2.	Click **Settings** in the upper right corner of the window.

3.	Click **Site** to display the Site page.

In site page you can:

* Change the log level

* Enable extra logging 

* Change proxy settings

### To Change the Log Level

Use log level to capture more detailed log files when you need to troubleshoot, or to save disk space with less detailed log files when your system is running routinely.

The different Log levels are as follows:

* **Debug**: Writes the most detailed log file messages.

* **Info**: Writes informational, warning, error, and critical messages to the log file.

* **Warning**: Writes warning, error, and critical messages to the log file. Informational messages are not written.
 
* **Error**:  Writes error and critical messages to the log file. Informational and warning messages are not written.

* **Critical**: Writes only critical messages to the log file. Informational, error, and warning messages are not written.

The default log level is Info. To change the default, select a log level from the drop down list.

###Enable Extra Logging

Certain functional areas are set to generate informational messages. Log level does not control the functional area level of log information unless you select that area. Select a functional area to change log file messages from informational to more detailed messages. You can select the following areas to enable extra logging:

* Documents

* Resource Pools

* Topologies

* Service REST APIs

###Change Proxy Settings

Cloud Administrators can change proxy information from the default values that were entered in the Admin Node. You use a proxy when you upload or create images, and when you provision to HP Cloud Services.

You might need to change your proxy information if your default server fails or if you prefer to use a different proxy server. You can change the following proxy information:

* Proxy Host

* Proxy Port

* Proxy Exceptions

* Proxy Username

* Proxy Password  

* Confirm Proxy Password

##Customize User Settings <a name="Customize User Settings"></a>

This option allows you to customize the settings as per your requirements. To change the settings, do the following:

1.	Click the **Settings** link on the upper right corner of the Administration Dashboard window.
The Settings page is displayed with options in the left panel.

2.	Click **User** from the left panel.
The User Settings window is displayed.

3.	From the **Language** drop-down list, select the language. For example: *English*

4.	From the **Timezone** drop-down list, select the time. For example: *UTC*

5.	In the **Table Page Size** box, enter a number. For example *20*, meaning a maximum of 20 line items will be displayed at a given time.

6.	Click **Save**. <br>A message is displayed on successful completion.

##Change Password <a name="Change Password"></a>
To change your password, do the following:

1. Click the **Settings** link on the upper right corner of the Administration Dashboard window. The Settings page is displayed with options in the left panel.

2. Click **Password** from the left panel. The Change Password window is displayed.

3. In the **Current Password** box, enter your current password.

4. In the **New Password** box, enter your new password.

5. In the **Confirm New Password**, enter your new password again.

6. Click **Change** to save the changes.

##About HP Cloud OS for Moonshot Administration Dashboard <a name="About HP Cloud OS for Moonshot Administration Dashboard"></a>

This option gives detailed information about the HP Cloud OS for Moonshot Administration Dashboard.

1. Click the **Settings** link on the upper right corner of the Administration Dashboard window. The Settings page is displayed with options in the left panel.

2. Click **About** to display the About HP Cloud OS for Moonshot Administration Dashboard window. It displays the product version number.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
