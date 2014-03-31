---
layout: default
title: "HP Cloud OS for Moonshot: Administration Dashboard"
permalink: /cloudos/moonshot/manage/administration-dashboard/project-images/
product: moonshot

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage">&#9650; UP</a> | NEXT &#9654;</p>

# Manage Project Images #

**Note**:

* A Project Administrator can create an image for full use within a project. 
* Project Administrator can create Private and Protected images only. 
* Cloud Architect can also create Protected and Private images only. 

An instance is launched based on an image. The following tasks can be performed using Images option in the left panel:

* <a href="#View Image List">View Image List</a>

* <a href="#Create an Image">Create an Image</a>

* <a href="#Edit an Image">Edit an Image</a>

* <a href="#Delete an Image">Edit an Image</a>

* <a href="#Launch an Image">Launch an Image</a>

*To create images, refer to the Cloud Image Builder document for more details.*

## View Image List ##<a name="View Image List"></a>

To view different images that are present in the given project, do the following:

1.	Click the **Project** Tab to select it.<br>
The tab displays with options in the left panel.</br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Infrastructure** and then select **Images** to display Images page with the list of images.The page also displays the total number of images under the following headings:

	**Project**- Images that are specific to the selected project

	**Public**- Images that are public

	**Shared**- Images that are shared with the selected project from other projects
 
4.	Click **Image Name** to view the image details and specifications.

## Create a Project Image ##<a name="Create an Image"></a>

To create a project image, do the following:

1.	Click the **Project** Tab to select it.<br>
The tab displays with options in the left panel.</br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Infrastructure** and then select Images to display Images page with the list of images. 

4.	Click the **Project** Tab to activate it.<br>
The tab displays options in the left panel.</br>

4.	Click **Create Image** to open a Create an Image dialog box.

5.	Select **Images** from the left panel to open the Images page.

**Note**:

* It is mandatory to create image types such as QCOW2 and AMI with associated Amazon Kernel Image (AKI) and Amazon RAMdisk Image (ARI).

* It is suggested to create the images in the following sequence: Amazon Kernel Image (AKI), Amazon RAMdisk Image (ARI) and QCOW2.

* The Kernel Image drop-down list and RAM Disk Image drop-down list is displayed when the selected format is QCOW2 or AMI.



**To create AKI images, do the following:**

* Click **Create Image** to open a Create an Image dialog box.

* In the **Name** box, enter a name for the image.

  * (Optional) In the **Description** box, enter description for the image.
  
  * From the **Format** drop-down list, select the format as AKI.
  
  * From the **Image Source** drop-down list, do either of the following:
  
  * Select **Image Location** from the drop-down list.<br>
The Image Location box is displayed.</br>

   * In the **Image Location** box, enter the HTTP URL to load the AKI image from.

        OR

  * Select Image File from the drop-down-list.<br>
The Choose File option is displayed.</br>

  * Click **Choose File** to browse the AKI image.

  * Select the AKI Image to upload.

* The **CPU Architecture** drop-down list displays x86_64 by default.<br>The moonshot hardware supports the above specification.</br>

* In the **Minimum Disk** box, specify a minimum size required to boot image.<br>If no input is entered, the minimum value defaults to 0.</br>

* In the **Minimum Ram** box, specify a minimum size required to boot image.<br>
If no input is entered, the minimum value defaults to 0.</br>

* Click check box displayed against **Public** to select it.<br>This will make the image visible to all users.</br>

* Click check box displayed against **Protected** to select it.<br>This makes the image as read-only.

* Click **Create Image**.A message is displayed on successful creation.</br>
 
    OR
 
    Click **Cancel** to abort and go to the previous screen.

**To create the ARI image, do the following:**

* Click **Create Image** to open a Create an Image dialog box.

* In the **Name** box, enter a name for the image.

  * From the **Format** drop-down list, select the format as ARI.

  * From the **Image Source** drop-down list, do either of the following:
  
  * Select Image location from the drop-down list.<br>The Image Location box is displayed.</br>
  
  * In the **Image Location** box, enter the HTTP URL to load the ARI image from.

    OR 
  * Select Image File from the drop-down-list.<br> The Choose File option is displayed.</br>
   
  * Click **Choose File** to browse the ARI image.

  * Select the ARI Image to upload.

* The **CPU Architecture** drop-down list displays x86_64 by default.<br>
The moonshot hardware supports the above specification.</br>

* In the **Minimum Disk** box, specify a minimum size required to boot image.
<br>If no input is entered, the minimum value defaults to 0.</br>

* In the **Minimum Ram** box, specify a minimum size required to boot image.<br>
If no input is entered, the minimum value defaults to 0.</br>

* Click check box displayed against **Public** to select it.<br> This will make the image visible to all users.</br>

* Click check box displayed against **Protected** to select it.<br> This makes the image as read-only.</br>

* Click **Create Image**.<br>A message is displayed on successful creation.</br>

    OR

  Click **Cancel** to abort and go to the previous screen.


**To create QCOW2, do the following:**

* Click **Create Image** to open a Create an Image dialog box.

* In the **Name** box, enter a name for the image. 

* From the **Format** drop-down list, select the format as QCOW2-QEMU Emulator.

* From the **Image Source** drop-down list, do either of the following:
  
  * Select Image location from the drop-down list.<br> The Image Location box is displayed.</br>
  
  * In the **Image Location** box, enter the HTTP URL to load the QCOW2 image from.
  
    OR 

   * Select Image File from the drop-down-list.<br>The Choose File option is displayed.</br>
   
   * Click **Choose File** to browse the QCOW2 image.
   
   * Select the QCOW2-QEMU Image to upload.
  
* The **CPU Architecture** drop-down list displays x86_64 by default.<br>
The moonshot hardware supports the above specification.</br>

* In the **Minimum Disk** box, specify a minimum size required to boot image.<br>
If no input is entered, the minimum value defaults to 0.</br>

* In the **Minimum Ram** box, specify a minimum size required to boot image.<br>
If no input is entered, the minimum value defaults to 0.</br>

* Click check box displayed against **Public** to select it.<br>This will make the image visible to all users.</br>

* Click check box displayed against **Protected** to select it.<br>This makes the image as read-only.</br>

* From the **Kernel Image** drop-down list, select the corresponding kernel image.

* From the **RAM Disk Image** drop-down list, select the corresponding RAM disk image.

* Click **Create Image**.<br>A message is displayed on successful creation. The image displays in the Images page.</br>

    OR

    Click **Cancel** to abort and go to the previous screen.

**Note:** Do not navigate from the page while the image is being created.


## Edit a Project Image ##<a name="Edit an Image"></a>

To edit an image, do the following:

1.	Click the **Project** Tab to select it.<br> The tab displays with options in the left panel.</br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Infrastructure** and then select **Images** to display Images page with the list of images.

4.	Click **More** drop-down list displayed against the image that you wish to edit and select **Edit Image**.<br>The Edit Image dialog box is displayed.</br>

5.	Make the required changes.

6.	Click **Update Image** to update the changes.

7.	(Optional) Click **Cancel** to abort and go to the previous screen.

**Note**: Project Administrator cannot edit AKI and ARI Images.


## Delete a Project Image ##

1.	Click the **Project** Tab to select it.<br>The tab displays with options in the left panel.</br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Infrastructure** and then select **Images** to display Images page with the list of images.

4.	Click **More** drop-down list displayed against the image that you wish to delete and select **Delete Image**.<br>A message is displayed to ask your confirmation. The image is deleted once you give your confirmation.</br>


## Launch a Project Image ##<a name="Launch an Image"></a>

To launch an image in the Administration Dashboard, do the following:

1.	Click the **Project** Tab to select it.<br>The tab displays with options in the left panel.<br>

2.	From the **Current Project** drop-down list in the left panel, select the project.

3.	From the options in the left panel, click **Infrastructure** and then select **Images** to display Images page with the list of images.

4.	Select **Launch** against the image listed in the table.<br>A Launch Instance dialog box displays with four tabs: Details Tab, Access & Security Tab, Networking Tab and Post-Creation Tab. By default, Details is the active tab.</br>

5.	On the **Details** Tab, do the following:
	
    * From the **Instance Source** drop-down list, select the image.
	
    * From the **Image** drop-down list, select the value.
	
    * In the **Instance Name** box, enter a name for the instance.
   	
    * From the **Flavor** drop-down list, select the Baremetal flavor.
	
    * In the **Instance Count** box, enter 1 or more than 1.<br>The flavor details are displayed on the right side of the dialog box.</br>

6.	On the **Access & Security** Tab, do the following:
    
     * From the **Keypair** drop-down list, select value from the list.

7.	On the **Networking** Tab, no networks are listed in the Selected Networks section. 

    * Select the private network from the Available networks section.

8.	Click **Launch**.<br>The image is displayed in the table on the Image page with Active status.</br>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
