---
layout: default
title: "HP Helion OpenStack&#174;: Updates and Extension"
permalink: /helion/openstack/undercloud/admin/updates-and-extension/
product: commercial.ga.


---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/openstack/install-beta/prereqs/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/vsa/">NEXT &#9654;</a> </p> --->

# HP Helion OpenStack&#174;: Updates and Extensions

HP provides a simple mechanism for downloading and publishing the content and updates for the Undercloud node.

* [Register on the Cloud Distribution Network](#Signup-for-Cloud-Distribution-Network)
* [Configure credentials](#configcre)
* [Import and install](#import-and-install)
* [Download a package](#download-a-package)

##Register for Cloud OS Distribution Network Access<a name="Signup-for-Cloud-Distribution-Network"></a>

You cannot access the updates from the HP Helion Horizon undercloud dashboard unless you are a registered user.

To register on the Cloud Distribution Network:

1.  On the HP Helion Horizon undercloud dashboard, click  the **Admin** tab in the left panel.

2.	Click **Updates and Extensions** and then select **Updates and Extensions** to open the Updates and Extensions page.

3.	Click **Configure** in the top-right corner of the page to display the Configure dialog box.

4.	Click **Sign up Now** below the description in the Configure dialog box.<br>
The page navigates to the HP Helion Product Catalog. Then, do the following:</br> 
    
5.  Click **Sign In** in the top of the page to open the HP Web ID dialog box.

6. Click **Sign Up for Web ID** to create log-in credentials. The HP WEB ID dialog box is displayed. 
    
7. Enter the required details.
  
8. Select the check box next to **I agree to the Terms of Use** to accept the terms and conditions.

9. Click **Submit**.<br>The credentials are authenticated and the account is created.

Once you register on the HP Helion Product Catalog, you are required to configure your credentials.

##Configure credentials<a name="configcre"></a>

To configure your credentials:

1.  On the HP Helion Horizon undercloud dashboard, click  the **Admin** tab in the left panel.

2.	Click **Updates and Extensions** and then select **Updates and Extensions** to open the Updates and Extensions page.

3.	Click **Configure** in the top-right corner of the page to display the Configure dialog box.

4. In the **User Name** box, enter the email ID that you have created while setting up your account in the HP Helion Product Catalog. 

5.	In the **Password** box, enter the password that you have created for your account in the HP Helion Product Catalog.

6.	Click **OK** to save the details.<br>The Updates and Extensions page is displayed with the list of available patches.</br>


	Or

	Click **Cancel** to abort and go to the previous screen.

##Import and install {#import-and-install}

To import a package that is stored on your local system, take the following steps:

1.  On the HP Helion Horizon undercloud dashboard, click  the **Admin** tab in the left panel.<br> The tab displays an option in the left panel.

2.	Click **Updates and Extensions** and then select **Updates and Extensions** to open the Updates and Extensions page.

3.	Click **Import** in the top-right corner of the page. An import dialog box is displayed.

4.	Click **Browse** to select and import the **.csu** file.<br>The imported file is displayed in the Import dialog box.</br> **Note**: Only CSU files are supported.

5.	Click **Import**.<br>The file is imported to your local cloud and displayed in the Updates and Extensions page.


	Or

	Click **Cancel** to abort and go to the previous screen.

6. Click **Publish** to install the imported file. The Publish dialog box is displayed.

7. Click **Publish**.  A message is displayed after successful installation.

8. (Optional) To view the progress of the installation, click the **More** drop-down list and select **View Progress**.



## Download a package<a name="download-a-package"></a>

Perform the following steps to download the packages:

1. On the HP Helion Horizon undercloud dashboard, click  the **Admin** tab in the left panel.

2.	Click **Updates and Extensions** and then select **Updates and Extensions** to open the Updates and Extensions page.
3. Click **Download** to download the file to your local system, if the file is being downloaded for the first time.
<br>
Or<br>
Click the **More** drop-down list and select **Download** next to the package that you want to download on your local system. A Confirm Download Update dialog box is displayed.

4. Click **Download** to download the package. A message is displayed when the **.csu** file is successfully downloaded.


	Or

	Click **Cancel** to abort and go to the previous screen.

7. (Optional) To view the download status, click the **More** drop-down list and select **View Progress**. <br>The View Progress box is displayed, containing the log, updated name, updated version, task type, and the status of the task. 



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----




