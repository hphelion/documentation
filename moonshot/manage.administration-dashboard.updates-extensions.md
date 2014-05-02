---
layout: default
title: "HP Cloud OS for Moonshot: Administration Dashboard"
permalink: /cloudos/moonshot/manage/administration-dashboard/manage-updates-extensions/
product: moonshot

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/administration-dashboard/manage-access-and-security/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage/administration-dashboard/working-with-project-tab/">&#9650; UP</a> | <a href= "/cloudos/moonshot/manage/administration-dashboard/before-you-begin/">NEXT &#9654;</p></a>

# Manage Updates and Extensions #

The updates and extensions feature allows you to connect to, list, and retrieve hot fixes and updates from the HP Cloud OS Delivery Network and apply them to your Cloud environment. These hot fixes and updates are referred to as content packages. After a package is imported and installed, you can view product and package details. 

The Update and Extensions page will be blank for the first time user. You need to configure your credentials for HP Cloud OS Delivery Network to view the updates.

You can perform the following tasks:

* <a href="#Configure Credentials">Configure Credentials</a>

* <a href="#View Updates List">View Updates List</a>

* <a href="#Download Updates or Extensions">Download Updates or Extensions</a>

* <a href="#Publish an Update">Publish an Update</a>

## Configure Credentials ##<a name="Configure Credentials"></a>

You cannot access the updates from the HP Cloud OS Delivery Network (CODN) unless you are a registered user. To Sign up to the Cloud OS Delivery Network, do the following:

### Signup Now ###<a name="View Updates List"></a>

To Sign up to the HP Cloud OS Delivery Network, do the following:

1.	Click the **Project** Tab to select it
The Project tab is activated and the options are displayed in the left panel.

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	Click **Updates and Extensions** to open the Updates and Extensions page.

4.	Click **Configure** displayed at the top right corner of the page to display the Configure dialog box.

5.	If you have a CODN account, go to STEP 6 else do the following:

    * Click **Signup Now** displayed at the bottom of the page.<br>
It displays the HP Cloud OS Delivery Network Page. Do the following:</br> 
    
    * Click **Sign In** displayed at the top of the page to open the HP Web ID dialog box.

    * Click S**ign Up for Web ID** to open create a HP Web ID dialog box.
    
    * Enter the required details.
  
    * Click against **I agree to the Terms of Use**.

	* Click **Submit**.<br>The credentials are authenticated and the account is created.</br> 

6.	In the **User Name** box, enter the email ID that you used while setting up your account in HP Cloud OS for Moonshot Distribution Network. 

7.	In the **Password** box, enter the password that you used for your account in the HP Cloud OS Delivery Network.

8.	Click **OK** to save the details.<br>The Updates and Extensions page is displayed with the list of available patches.</br>

	OR

	Click **Cancel** to abort and go to the previous screen.


## View the Updates List ##

To view the updates list, do the following:

1.	In the Administration Dashboard, select the **Project** Tab.
The tab displays with options in the left panel.

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Updates and Extensions** and then select **Updates and Extensions** to display the Updates and Extensions page with the list of updates. The following information is displayed:

   * **Name**: of the update.

   * **Version**: of the update. Information for each version is listed on a separate line.

   * **Size**: of the update.

   * **Provider**: the organization that created and is responsible for the update.

   * **Type**: the kind of image that downloads.

   * **Status**: the state of the update in the catalog. This state is independent of your local system. For example, you may successfully download an update, but the update later becomes suspended in the catalog. You can continue to publish and use the update on your local system.

   * **Actions**: tasks you can perform on the update.

4.	(Optional) Click a Name to open an Overview page with details of the update name, version, targets where it is installed.

## Import an Update ##

You can import a workload from your local folder or from CODN remote portal.  Once the import process is successful, the document displays in the Updates and Extensions page.  

### Import content from local Folder ###

To import an update that is stored on your local system, do the following:

1.	Click the **Project** Tab to select it.
The Project tab is activated and the options are displayed in the left panel

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Updates and Extensions** and then select **Updates and Extensions** to display the Updates and Extensions page with the list of updates. 

4.	Click **Import** displayed on the top right corner of the page.<br>An Import dialog box is displayed.</br>

5.	Click **Choose File** to display a dialog box to browse and select the file.<br>The file displays in the Import dialog box.</br>

6.	Click **Import**.<br>The file is imported to your local cloud and displayed in the Updates and Extensions page.</br>

### Login to CODN Remote Portal ###

To import an update from CODN remote portal, do the following:

1.	Click the **Project** Tab to select it.
The Project Tab is activated and the options are displayed in the left panel.

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Updates and Extensions** and then select **Updates and Extensions** to display the Updates and Extensions page with the list of updates.

4.	Click **Configure** displayed at the top right corner of the page to display the Configure dialog box.

5.	Enter your credentials.

6.	Click **OK** to save the details.
The updates are displayed in the Updates and Extensions page.

## Download Updates or Extensions ##<a name="Download Updates or Extensions"></a>

To download the packages, do the following:

1.	Click the **Project** Tab to select it
The Project tab is activated and the options are displayed in the left panel.

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Updates and Extensions** and then select **Updates and Extensions** to display the Updates and Extensions page with the list of updates. 

4.	Click **Configure** displayed at the top right corner of the page to display the Configure dialog box.

5.	Enter your credentials.

6.	Click **OK** to save the details.
The updates are displayed in the Updates and Extensions page. 

7.	Click **Download** against the package that you want to download on your local system.<br>Once the download completes successfully, the Publish option is displayed.</br>

8.	(Optional) To view the installation progress, click **More** drop-down list and select **View Progress**.

**Note**: Ensure that you have enough disk space before you start the download process as these need large disk space.

## Publish an Update or Extension ##<a name="Publish an Update or Extension"></a>

Once you download an update, you can publish it. The Publish option is displayed once the download is complete. A download can consist of one or more pieces that must be distributed to multiple HP Cloud OS repositories. Publish routes the download contents to their appropriate repositories.

To publish an update, do the following:

1.	Click the **Project** Tab to select it
The Project tab is activated and the options are displayed in the left panel.

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Updates and Extensions** and then select **Updates and Extensions** to display the Updates and Extensions page with the list of updates.

4.	Click **Publish** to open the Targets dialog box.

5.	Enter **Scope** to define who can use the update.<br>The Administration Dashboard offers scope choices, depending upon the update type.</br>

6.	Click **Publish**.<br>
After a successful publish, you see the update in the appropriate section of the Administration Dashboard. For example, if the update is a Glance image, you can see it in the Images page under the Infrastructure option and if the update is a workload, you can see it in the Workloads page under the Provisioning option.</br>


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
