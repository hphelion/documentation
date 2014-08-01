---
layout: default
title: "HP Cloud OS for Moonshot: Administration Dashboard"
permalink: /cloudos/moonshot/manage/administration-dashboard/manage-access-and-security/
product: moonshot

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/administration-dashboard/project-networks/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage/administration-dashboard/working-with-project-tab/">&#9650; UP</a> | <a href=" /cloudos/moonshot/manage/administration-dashboard/manage-updates-extensions/">NEXT &#9654;</p></a>

# Manage Access and Security#
Use this option to manage and view the following access and security elements:

* **Keypairs** &mdash; Keypairs are SSH security keys that provide authentication and allow you to exchange traffic securely within the instance.

* **API Access**

* **Authentication Token**

The following tasks can be performed using Access and Security option in the left panel:

* <a href="#View Keypair List">View Keypair List</a>

* <a href="#Create Keypairs">Create Keypairs</a>

* <a href="#Delete Keypairs">Delete Keypairs</a>

* <a href="#Import Keypairs">Import Keypairs</a>

* <a href="#Download API Access">Download API Access</a>

* <a href="#Access Authentication Token">Access Authentication Token</a>


## View Keypair List<a name="View Keypair List"></a>

To view the list of keypairs, do the following:

1.	Click the **Project** Tab to select it.
The tab displays with options in the left panel.

2.	From the left panel, select **Access and Security** and click **Access and Security** again.<br>A page is displayed with three tabs-, **Keypairs**, **API Access** and **Authentication Token**. By default, **Keypairs** is the active tab. The list of Keypairs is displayed in a table.</br>

3.	Click the **API Access** Tab to activate it.<br>The window displays a list of API endpoints.</br>

    * (Optional) Click **Download OpenStack RC File** to download the file.

    * (Optional) Click **Download EC2 Credentials** to download the EC2 details.

4.	Click **Authentication Token** Tab to activate it.<br>The window displays the details of the Authentication Token.The Administration Dashboard manages your authentication token. The Administration Dashboard retrieves your token from the Keystone service when you successfully log in to the dashboard. You can access your authentication token in the Administration Dashboard for accessing the Baremetal host outside the dashboard.</br>

## Create Keypairs <a name="Create Keypairs"></a>

Keypairs are SSH security keys that are used to launch secure, provisioned cloud instances, images or topologies. The keypair is injected into the launched instance. Each project user needs to create a keypair(s) for use. Project Administrator cannot create it on behalf of the user.

To create keypairs, do the following:

1.	Click the **Project** Tab to select it
The tab displays with options in the left panel.

2.	From the left panel, select **Access and Security**.<br>
A window is displayed with three tabs- **Keypairs**, **API Access** and **Authentication Token**. By default, **Keypairs** is the active tab.</br>

3.	Click **Create Keypair** displayed in the right panel.<br>Create Keypair dialog box is displayed.</br>

4.	In the **Keypair Name** box, enter the name of the keypair.

5.	Click **Create Keypair**.<br> The credentials are downloaded onto your machine. Depending on your browser, the download is either automatic or a dialog box prompts you to download the keypair.</br>

    OR

    Click **Cancel** to abort and go to the previous screen.


## Delete Keypairs <a name="Delete Keypairs"></a>

To delete a keypair, do the following:

1.	Click the **Project** Tab to select it.<br>The tab displays with options in the left panel.</br>

2.	From the left panel, select **Access and Security**.</br>A window is displayed with three tabs- **Keypairs**, **API Access** and **Authentication Token**. By default, Keypairs is the active tab.</br>

3.	Click **Delete Keypair** against the keypair that you want to delete. <br>A Confirm Delete Keypair dialog box is displayed.</br>

4.	Click **Delete Keypair**.<br>A message is displayed on successful deletion.</br>
                                      
    OR 

    Click **Cancel** to abort and go to the previous screen.

## Import Keypairs <a name="Import Keypairs"></a>

To import a project keypair, do the following:

1.	Click the **Project** Tab to select it.<br>The tab displays with options in the left panel.</br>

2.	From the left panel, select **Access and Security**.<br>A window is displayed with three tabs- **Keypairs**, **API Access** and **Authentication Token**. By default, Keypairs is the active tab.</br>

3.	Click **Import Keypair** to display the Import Keypair dialog box.

4.	In the **Keypair Name** box, enter the name of the keypair.

5.	In the **Public Key** box, enter the public key.

6.	Click **Import Keypair**.

	OR

	Click **Cancel** to abort and go to the previous screen.

## Delete Multiple Keypairs ##

To delete multiple keypairs with a single command, do the following:

1.	Click the **Project** Tab to select it.<br>The tab displays with options in the left panel.</br>

2.	From the left panel, select **Access and Security**.<br>A window is displayed with three tabs- - **Keypairs**, **API Access** and **Authentication Token**. By default, Keypairs is the active tab.</br>

3.	Click **Keypairs** Tab to activate it.<br>Keypairs window is displayed.</br>

4.	Click the check box against the keypairs that you want to delete.

5.	Click **Delete Keypairs** to display a Confirm Delete Keypairs dialog box.

6.	Click **Delete Keypairs**.<br>A message is displayed on successful deletion.</br> 

    OR

    Click Cancel to abort and go to the previous screen.

## Download API Access <a name="Download API Access"></a>

To download the API Access, do the following:

1.	Click the Project Tab to select it.<br>The tab displays with options in the left panel.

2.	From the left panel, select **Access and Security**.<br>A window is displayed with three tabs- **Keypairs**, **API Access** and **Authentication Token**. By default, Keypairs is the active tab.</br>

3.	Click **API Access** Tab to activate it.<br>The API Access page is displayed with the details services and service endpoints.</br>

4.	(Optional) Click **Download OpenStack RC File** to download the file.

## Access Authentication Token <a name="Access Authentication Token"></a>

The Administration Dashboard manages your authentication token. The Administration Dashboard retrieves your token from the Keystone service when you successfully log in to the Administration Dashboard. You can use this authentication token to access outside services. For example: if you want to use API service endpoints, you will need this token to access it. 

To access authentication token, do the following:

1.	Click the **Project** Tab to select it.<br>The tab displays with options in the left panel.</br>

2.	From the left panel, select **Access and Security**.<br>A window is displayed with three tabs- **Keypairs**, **API Access** and **Authentication Token**.
By default, Keypairs is the active tab.</br>

3.	Click **Authentication Token** Tab to activate it.<br>The Authentication Token page is displayed with the details of the authentication token.</br>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
