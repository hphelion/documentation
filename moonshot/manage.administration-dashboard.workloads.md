---
layout: default
title: "HP Cloud OS for Moonshot: Administration Dashboard"
permalink: /cloudos/moonshot/manage/administration-dashboard/working-with-project-tab/
product: moonshot

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage">&#9650; UP</a> | NEXT &#9654;</p>

### Workloads ###

Workloads functionality in HP Cloud OS for Moonshot aims to facilitate the end user in deployment of a composite service comprising of different applications and hence different workloads in an easy to use manner. 
The end user can browse through HP's catalog listing of pre-tested and pre-crafted workloads, download and publish them to the cloud and launch them to get a running application infrastructure without worrying about the intricate and in-depth understanding of technical details like topology, OpenStack nova flavor, Moonshot Cartridge specification etc. The end user can also define personalized workloads by following a simplified folder structure and can import the same to the cloud.

This section includes the following topics:

* <a href="#Understanding Workload Entities">Understanding Workload Entities</a>

* <a href="#Relationship between Workload Entities">Relationship between Workload Entities</a>

* <a href="#Cloud Personalities">Cloud Personalities</a>

* <a href="#Understanding Workload Content">Understanding Workload Content</a>

* <a href="#Understanding Workload Lifecycle">Understanding Workload Lifecycle</a>
* <a href="#Managing Workload Lifecycle Using Administration Dashboard">Managing Workload Lifecycle Using Administration Dashboard</a>

#### Understanding Workload Entities ####<a name="Understanding Workload Entities"></a>
Some of the important entities that help to make up Workloads based provisioning are:

<img src="media/cos4ms-workload-prov.png"/>


#### Relationship between Workload Entities ###<a name="Relationship between Workload Entities"></a>

A workload entity is an abstract representation of a service which maps to a given infrastructure blue-print (technically termed as topology). The same workload can be realized by different cloud resources present in the system which can be uniquely represented as deployment profiles. 
For Example: Let us assume that a single server group based workload requirement is, to serve static web hosting. As we know that both Scott_1 and Borman can serve static web hosting, it is thus possible to have two different deployment profiles; where one maps to nova flavor compute resource of Borman while the other maps to Scott_1.  Also, a given deployment profile can be launched multiple times for same or different user. Considering this, there is an inherent relationship amongst workloads, topology, deployment profiles and deployed workloads which has been illustrated below:

<img src="media/cos4ms-relationship-between-workload-entities.png"/>

####Cloud Personalities####<a name="Cloud Personalities"></a>

Lifecycle of a Workload is a multi-phase activity and needs different actors to collaborate together to make a simplified realization of a given application infrastructure by the end user. The list below elaborates on the actors along with their roles and responsibilities in entire workload lifecycle.

<img src="media/cos4ms-cloud-personalities.png"/>

All the above players contribute towards realizing the lifecycle of a Workload and play relevant role in each stage of its workflow.

#### Understanding Workload Content ####<a name="Understanding Workload Content"></a>

Each workload is represented as a CSU file, which is inherently a data container to store various elements of workload (like images, topology design etc.) in compressed format as shown in the diagram below:

<img src="media/cos4ms-workload-content.png"/>

HP Cloud OS for Moonshot provides the functionality to import the CSU file and create a workload (a cloud entity) which can be managed by the Administration Dashboard. This section explains in detail the following:

1.	Elements of a Workload 
2.	Content Structure of CSU File
3.	Manifest file


Entire section illustrates the content using a sample Apache workload which allows you to deploy single Apache server on a Moonshot cartridge. 
 	

&#9654;**Elements of Workload**

A workload typically comprises of images, topology, manifest file etc. Every workload must have the following set of components as described in the table below:

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: lightgrey; color: black;">

 <td><b>Category</b></td> <td><b>Type</b></td><td><b>Description</b></td></tr>

<tr style="background-color: white; color: black;">
<td>
Infrastructure Documents</td><td>Topology</td><td>Defines the blue print of the infrastructure. Every workload has one topology document.</td></tr>
<tr style="background-color: white; color: black;">

<td></td><td>UI Binding</td><td>Contains graphical aspect of infrastructure design and is needed by CCUE designer to open the topology in Administrator Dashboard. Every workload must have UI binding document corresponding to the topology document.</td></tr>
<tr style="background-color: white; color: black;">

<td></td><td>Default profile</td><td>Defines the structure of deployment profiles for a given topology document. Every workload must have a default profile corresponding to topology document.</td></tr>
<tr style="background-color: white; color: black;">
<td>Application Software specification</td><td>Deployment Profile Guide</td><td>Defines the software aspect of the workload. It primarily contains infrastructure hints in cloud agnostic format so that appropriate cloud resources can be discovered and can be referred in deployment profiles, which are used to deploy (often termed as launch) a given workload.</td></tr>
<tr style="background-color: white; color: black;">
<td>Images </td><td>OS image</td> <td>Specifies OS image used in server provisioning. A workload can have number of OS images depending upon the server design mentioned in the topology.</td></tr>
<tr style="background-color: white; color: black;">
<td></td><td> Kernel image</td><td>Every Baremetal OS image is associated with a kernel image which is used during PXE boot process.</td></tr>

<tr style="background-color: white; color: black;">
<td></td><td>RAM disk image</td><td>Every Baremetal OS image is associated with a RAMdisk image which is used during PXE boot process.</td></tr>

<td>CSU specification</td><td>Manifest</td><td>Specifies layout of workload and its components and their dependencies. It is used by CODN to import a given workload during the import process of the workload.</td></tr>

<tr style="background-color: white; color: black;">
<td>Help</td><td>Readme</td><td>Contains description of a workload.</td></table>

&#9654;**Content Structure of a CSU File**

As mentioned above, a workload CSU file is an archived version of different content types in a compressed format. The entire content is organized in a folder structure. The below figure explains the layout of Apache workload:

<img src="media/cos4ms-file-structure-manifest.png"/>
 	
&#9654;**Understanding Manifest File**

A manifest file is a JSON file which contains specification of elements of a workload.

#### Understanding Workload Lifecycle ####<a name="Understanding Workload Lifecycle"></a>
The following figure illustrates the lifecycle of workload entities and the workflow required when the content is being imported from remote folder using CODN:

<img src="media/cos4ms-understanding-workload-lifecycle.png"/>

Each lifecycle phase depicted above, and the various tasks that its respective owner / cloud personality plays, is briefly explained in the following sections. 

**Note**: The next section “Managing Workload Lifecycle using Administrator Dashboard” illustrates Workload workflow in detail.

**Phase 1: Create Content**

Content Creator is responsible for creating the deployable content that is uploaded to a shared portal. Content creation involves:

1.	Workload Creation - packaging different aspects of a workload (as topology, images, infrastructure hints etc.)
2.	Modifying the Manifest file

**Phase 2: Upload Content**

Content Publisher bundles the workload files as a .csu file and uploads it on a centralized portal. It is later published to HP Cloud's Public catalog after necessary approvals. It is then available for importing into the cloud environment using HP Cloud OS for Moonshot Administration Dashboard. Access to the catalog is based on username and password credentials. 

**Phase 3: Download / Import to Cloud**

Workload Management is primarily the task of Cloud Administrator. While the Cloud Administrator downloads the workload content and publishes it for user consumption, he also creates / edits and launches deployment profiles. Other roles can only manipulate the workload content that has been downloaded as per the project requirements.

**Phase 4: Publish to Cloud**

Once the content is downloaded / imported, the Cloud Administrator publishes it to the Cloud thus enabling the Workloads to be used in different projects depending on the scope defined while publishing the content. 

**Phase 5: Create Profile**

A workload can have multiple deployment profiles. When a workload is downloaded from CODN or is imported from local system, a deployment guide that is part of the setup is also downloaded to your cloud environment. This deployment guide helps in the creation of a deployment profile. Once the deployment profile is created, you can provision the workload.

**Phase 6: Provision**

Once the Workloads are deployed, Project Administrators / Users can use the workload content to create / edit deployment profile and launch profile as per project requirements.

#### Managing Workload Lifecycle using Administration Dashboard ####<a name="Managing Workload Lifecycle using Administration Dashboard"></a>

Workload workflow using Administration Dashboard can be depicted in the following sequence of steps:

<img src="media/cos4ms-managing-workload-lifecycle.png"/>

Each step is explained in detail in the following sections.

**Create Workload** 

Creation of workload is a manual process. This necessitates the need of assembling the following elements as per the folder structure explained in the Understanding the Workload section and creating an archive file with a .csu extension:

1.	Infrastructures documents
    * Topology 
    * UI binding document
    * Default profile

2.	Deployment Profile Guide

3.	Images

4.	CSU file


Currently, you can use CCUE designer to generate infrastructure documents and export its content as an XML file. CSU and Deployment Profile Guide can be generated using normal text editor. Content of the deployment profile needs to be customized as per desired topology. 

&#9654;**Publish Workload to HP Cloud OS Enterprise Portal**

This process involves uploading content to HP Cloud OS Enterprise portal and initialization of the HP content approval process. Once content is approved by the appropriate authorities, it is published to HP Cloud Public catalog. The Cloud Administrator can now import, download and publish the workload in the Cloud environment using the Administration Dashboard. Refer to Updates and Extensions section for details.

&#9654;**Perform Cloud Prerequisites**

Cloud Administrator has to ensure the following prerequisites before provisioning any workload.
 
1.	Publish Graffiti factory data

2.	Automated creation of nova flavors
	
***Graffiti Factory Data***

 Cloud Administrator must publish graffiti factory data before importing any workload in the Cloud. This can be done either by using CODN to import graffiti content from local folder or HP Cloud OS Enterprise portal. Refer to the section on Importing Workload to initialize cloud with graffiti factory data.  One can validate if the content from CODN portal or local import is being downloaded or not. To validate the content download, do the following:

  1. On the Administration Dashboard, click Cloud Tab to select it.<br>
   Cloud tab is activated and the options are displayed in the left panel. By default, all the services are displayed in the right pane.

  2. Click Rest API displayed against Graffiti to display a Graffiti Service Details page.

  3. Go to namespace section and click /1/namespace/list to expand it.

  4. Search for the `URN:X-HP:2014-1:CLOUDOS:TYPES:CAPABILITIES:MOONSHOT` in the list of Moonshot namespace.
 
     OR

    Go to Reference UI and replace the token value with the Authentication token.
    To access your authentication token, click **Projects** Tab and then **Access and Security** to display the Access and Security page. Click **Authentication Token** to display your authentication token.

***Automated Creation of Nova Flavors***

  Cloud discovers the cartridges and creates flavors automatically. There is a polling cycle of five minutes to check for new registered cartridges for flavor creation .To validate that the flavor associated to content has been automatically created, do the following:

   1. On the Administration Dashboard, click **Region** Tab to select it.<br>
The Region tab is activated and the options are displayed in the left panel.</br>

 2.	Select **Flavors** to display the Flavors page.<br>
The page displays with the list of flavors.</br>

 3.	Click **More** against the flavor for which you want to view Extra Specs.

 4.	Click **View Extra Specs** to view the extra specifications of the flavor.

#### Populating Cloud with Workload  ####

Cloud Administrator can populate the Cloud with workload by either importing it using local folder (if the .csu file corresponding to workload is available) or by using remote HP Cloud OS Enterprise portal. 

**Note**: Cloud Administrator should have the necessary permissions to access the HP Cloud OS Enterprise portal.

Populating cloud with workload involves following phases:

1.	Import  using local folder <br>
    and/or</br> 
2.	Login to CODN remote portal

3.	Download 

4.	Publish


Once you have imported the workload or you have logged in to the remote folder, content is available for you to publish it to your local cloud.

***Import Using Local Folder***
 
   You can import a workload from your local folder.  Once the import process is successful, the document displays in the Updates and Extensions page.  To import an update that is stored on your local system, do the following:

1.	On the Administration Dashboard, click **Project** Tab to select it.<br>
The Project tab is activated and the options are displayed in the left panel.</br>
2.	From the options in the left panel, click **Updates and Extensions** and then select **Updates and Extensions** to display the Updates and Extensions page with the list of updates.

3.	Click **Import** displayed on the top right corner of the page.<br>
An Import dialog box is displayed.</br>

4.	Click **Choose File** to display a dialog box to browse and select the file.<br>
The file displays in the Import dialog box.</br>

5.	Click **Import**.<br>
The file is imported to your local cloud and displayed in the Updates and Extensions page.</br>

***Login to CODN Remote Portal***

To import an update from CODN remote portal, do the following:

1.	On the Administration Dashboard, click **Project** Tab to select it.<br>
The Project Tab is activated and the options are displayed in the left panel.</br>

2.	From the options in the left panel, click **Updates and Extensions** and then select **Updates and Extensions** to display the Updates and Extensions page with the list of updates.

3.	Click **Configure** displayed at the top right corner of the page to display the Configure dialog box.

4.	Enter your credentials.

5.	Click **OK** to save the details.
The updates are displayed in the Updates and Extensions page. 

***Download***

To download the Workload content that has been imported, do the following:

1.	On the Administration Dashboard, click Project Tab to select it.<br>
The Project tab is activated and the options are displayed in the left panel.</br>

2.	From the options in the left panel, click **Updates and Extensions** and then select **Updates and Extensions** to display the Updates and Extensions page with the list of updates.

3.	Click **Download** against the workload that you want to download.<br>
The workload is downloaded to your local system in the form of a .csu file which is a zip file and the Publish option is displayed.</br>

***Publish***

Once the content is downloaded, you can publish it using the Publish option. The Publish option unzips the .csu file and stores it in the relevant repositories. This enables the Workloads to be used in different projects depending on the scope defined while publishing the content. 
Do the following:

1.	In the Updates and Extensions page, click **Publish** against the document to publish.<br>
Publish dialog box is displayed. The Update Name and Update Version are prepopulated.</br>

2.	From the **Openstack Scope** drop-down list, select *Public*.<br>
It displays the following options:</br>

    * Private: This means that the update is private to this project.

    * Public: This means that the update is available to others outside the project.

3.	From the **Cloud OS Scope** drop-down list, select *Public, Cloud*.<br>
It displays the following four options:</br>

<table style="text-align: left; vertical-align: top; width:600px;">

<tr style="background-color: lightgrey; color: black;">

 <td><b>Scope</b></td> <td><b>Description</b></td></tr>

<tr style="background-color: white; color: black;">
<td>Private, Project</td><td>Allows you access while working in this project.</td></tr>
<tr style="background-color: white; color: black;">
 
<td>Private, Cloud</td> <td>Allows you access while working in any project.</td></tr>

<tr style="background-color: white; color: black;">
<td>Public, Project</td><td>Allows access to you and other project members.</td><tr> 
<td>Public, Cloud</td><td>This document can be viewed by anyone in the cloud in any project.</td></table>


4. Click **Publish** to start the installation process.<br>
A success message is displayed. Once the installation completes, the workload will display in the Workloads page.</br>

5.	(Optional) Click **View Progress** to view the installation progress.

&#9654;**Managing Workload**

Once the Workload content is downloaded, it is displayed in the Workloads page. The Workloads page displays the Workload Dashboard with the details of the Workload content. The Cloud Administrator and Project Administrator can use the Workloads Page to view the workloads and create deployment profiles.

To view the Workload Dashboard, do the following:

1.	On the Administration Dashboard, click **Project** Tab to select it.<br>
The Project tab is activated and the options are displayed in the left panel.</br>
2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the left panel, click **Provisioning** and then select **Workloads**.<br>
The Workloads page is displayed.
The Workloads Dashboard displays the details of the total workload topologies, the corresponding deployment profiles and the deployed workloads. The total workloads are the workloads that are downloaded using the Updates and Extensions option or are present on your local system.</br>

The Dashboard page is divided into two views: **Tree View** in the left and **Details View** in the right.

* Tree View displays all the workloads in the system. It also represents the relationship between existing workloads, deployment profiles and deployed workloads.

* Details View is further divided into three sections: 

 * The top section displays the total number of Workload Topologies, Deployment Profiles, and Deployed Workloads. It also displays the progress in terms of running and not running Workload Topologies, Deployed Profiles and Workloads. 
 * The above information is also represented in a tabular view in the bottom section of the panel. The table also displays the source of the workload. Currently, supported sources are- <br>

        CODN-Local- If the content is being published using local import folder

        CODN-Remote- If the content is being published using remote HP Cloud OS Portal.

 * The middle section of the right panel displays a graphical representation of the top ten workload topologies based on the highest number of successfully deployed workloads

 * Click the Workload in the left panel or click Name displayed in the right panel table.<br>
The details of the workload are displayed.</br>

    **Note**: This is an optional step at the initial stage as no data is displayed, once you create the profiles, they will be visible in the list.

***Search a workload***

To search for a particular workload, in the left panel, do the following:

* In the **Search** box, enter the first few characters of the workload name and click the magnifier.<br>
The workloads matching the search criteria are displayed.<br>

To search for details of a particular workload, do the following:

* In the right panel, above the table in the search box, enter the first few characters of the workload name.<br>
The search results are displayed.</br>

&#9654; **Managing Deployment Profiles**
 
A workload can have multiple deployment profiles. The deployment profile can be created by Cloud Administrator as well as Project Administrator.
Once the deployment profile is created, you can provision the workload. To create a deployment profile from an existing workload, do the following:

1.	In the Administration Dashboard, select the **Project** Tab.<br>
The tab displays with options in the left panel.</br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the left panel, click **Provisioning** and then select **Workloads**.
The Workloads page is displayed. 

4.	Click the **Workload** in the Tree View or click Name displayed in the right panel table.<br>
The Deployment Profile Details page of the selected workload is displayed. It has two tabs-Overview and Topology. By default, Overview is the active tab and displays the profile details of the selected workload. Topology Tab gives a graphical representation of the workload topology.</br>
 
5.	Click **Create Profile** displayed at the top right corner of the right panel.<br>
A dialog box is displayed.</br>

6.	In the **Profile Name** box, enter the profile name.

7.	From the **Resource Pool** drop-down list, select the resource pool to associate with the profile.

8.	Click **Create** to create the profile.<br>
The profile is created and is displayed in the Editor Tab of Topology Designer.</br>

9.	Click the icon displayed in the canvas to select it.</br>
The details are displayed in the right panel.</br>

10.	From the **Key Name** drop-down list, select the keypair.<br>
The keypair value has to be injected at the time of profile creation. All other values are pre-populated.</br>

11.	Click **Save** to save the profile.

12.	Click the close icon displayed on the top right corner to close the Topology Designer page.<br>
The deployment profile is displayed in the Workloads page.</br>

13.	Click **Workloads** option again to view the Dashboard and the click the Workload for which you created the deployment profile.<br>
The profile that you created displays in the table in Deployment Profile Details page of the selected Workload.</br>


&#9654; **Provisioning Workload**

Once the Deployment Profile is created, it results in provisioning of physical infrastructure and creation of a deployed workload. Once the Workloads are deployed, Project Administrators and Project users can use the workload content to Launch Profile and Edit Profile as per project requirements. Provisioning a Workload involves the following tasks:

***Launch a Profile***

To launch the profile, do the following:

1.	In the Administration Dashboard, select the **Project** Tab.<br>
The tab displays with options in the left panel.</br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the left panel, click **Provisioning** and then select **Workloads**.<br>
The Workloads page is displayed.</br>

4.	Click **Workload** in the left panel and then click the arrow displayed against the workload to expand the list.

5.	Click the **Deployment Profile** to display the Deployment Profile Details page of the selected profile.

6.	Click **Launch** displayed at the top right corner of the page.<br>
A Launch Profile dialog box is displayed.</br>

**Note**: You can also click   displayed in the table against the profile in the Workload Profile Details page to launch the profile.

7.	In the **Workload Name** box, enter the name for the workload.

8.	Click **Launch** to launch the profile.<br>
A success message is displayed.</br>
Once the launch is successful, the profile is visible in the Deployed Workload.


***View Running Topologies***

To view the progress of the launch of deployment profiles, do the following:

1.	In the Administration Dashboard, select the **Project** Tab.<br>
The tab displays with options in the left panel.</br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the left panel, click **Provisioning** and then select **Running Topologies** to display the Running Topologies page with a list of topologies in the provisioning state. <br>Once it is successfully provisioned and instances associated with it are running, the deployed workload status is counted as successful.</br>


***Edit a Profile***

To edit a deployment profile, do the following:

1.	In the Administration Dashboard, select the **Project** Tab.
The tab displays with options in the left panel.

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the left panel, click **Provisioning** and then select **Workloads**.
The Workloads page is displayed. 

4.	Click **Workload** in the left panel to display the Workloads Details page.

5.	Click  displayed in the table against the profile that you want to edit.
The profile displays in the Profile Tab of the Workload Topology Designer.

6.	Make the required changes.

7.	Click **Save** to save the details.










