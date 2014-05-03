---
layout: default
title: "HP Cloud OS for Moonshot: Administration Dashboard"
permalink: /cloudos/moonshot/manage/administration-dashboard/cloud-images/
product: moonshot

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/administration-dashboard/cloud-users/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage/administration-dashboard/working-with-cloud-tab/">&#9650; UP</a> | <a href="/cloudos/moonshot/manage/administration-dashboard/manage-moonshot-chasssis-tab/">NEXT &#9654; </p></a>


#Manage Images#

Cloud Administrator can create, modify and publish cloud images. The scope of an image can be set within a cloud or within a region. The image is required for installing an Operating System in an instance.

You can perform the following tasks:

* <a href="#Create a Cloud Image">Create a Cloud Image</a> 

* <a href="#Edit a Cloud Image">Edit a Cloud Image</a> 

* <a href="#Delete a Cloud Image">Delete a Cloud Image</a> 

* <a href= "#Launch a Cloud Image">Launch a Cloud Image</a>



To create images, refer to the Cloud Image Builder document for more details.

To view the list of cloud images:

1. Click **Cloud** Tab to select it.

2. From the options in the left panel, select **Images**  to display the Images page with a list of images.

3. Click **Image Name** to view the image details and specifications.

##Create a Cloud Image<a name= "Create a Cloud Image"></a>

To create cloud images:

1. Click **Cloud** Tab to select it.

2. Select Images, from the options in the left panel, select Images to open the Images page.

**Note**: It is mandatory to create image types such as *QCOW2* and *AMI* with associated *Amazon Kernel Image (AKI)* and *Amazon RAMdisk Image (ARI)*. It is suggested to create the images in the following sequence:* Amazon Kernel Image (AKI)*, Amazon RAMdisk Image (ARI)**, and *QCOW2*.
<br>
The **Kernel Image** drop-down list and **RAM Disk Image** drop-down list is displayed when the selected format is QCOW2 or AMI.</p>
<p>
To create AKI images, perform the following:</p>
 
 * Click **Create Image** to open a Create an Image dialog box.
 
 * To create AKI images, do the following:
 
 * Click **Create Image** to open a Create an Image dialog box.
 
 *  In the **Name** box, enter a name for the image.
 
 * (Optional) In the **Description** box, enter description for the image.
 
 * From the **Format** drop-down list, select the format as AKI.
 
* From the **Image Source** drop-down list, do either of the following:
  
  * Select **Image** location from the drop-down list. The Image Location box is displayed.
 
  * In the **Image Location** box, enter the HTTP URL from which to load the AKI image.<br>
   OR
 
  * Select **Image File** from the drop-down-list.
   
  * The **Choose File** option is displayed.
 
  * Click **Choose File** to browse the AKI image.
 
  * Select the AKI Image to upload.
 
* The **CPU Architecture** drop-down list displays *x86_64* by default. The moonshot hardware supports the above specification.
 
* In the **Minimum Disk** box, specify a minimum size required to boot image. If no input is entered, the minimum value defaults to 0.

 *  In the **Minimum Ram** box, specify a minimum size required to boot image. If no input is entered, the minimum value defaults to 0.

 * Click check box against **Public** to select it. This will make the image visible to all users.

 * Click check box against **Protected** to select it. This makes the image as editable but cannot be deleted.

 * Click **Create Image**. A message is displayed on successful creation.<br>
OR<br>
Click **Cancel** to abort and go to the previous screen.
<br>

**Note**: ARI and AKI images are only listed in the Region Tab. Cloud and Project Tabs display images from which an instance can be launched such as QCOW2, AMI etc.</br>

To create QCOW2, perform the following:

 * Click **Create Image** to open a Create an Image dialog box.
 
 * In the **Name** box, enter a name for the image.
 
 * Select the format as QCOW2-QEMU Emulator from the **Format** drop-down list.
 
 * From the **Image Source** drop-down list, perform either of the following:
  
  * Select Image Location from the drop-down list. The Image Location box is displayed.
  
  * In the **Image Location** box, enter the HTTP URL from which to load the QCOW2 image.<br>
OR<br>
  
  * Select Image File from the drop-down-list. The Choose File option is displayed.
 
  * Click **Choose File** to browse the QCOW2 image.
  
  * Select the QCOW2 Image to upload.

* The **CPU Architecture** drop-down list displays *x86_64* by default. The moonshot hardware supports the above specification.

*  In the **Minimum Disk** box, specify a minimum size required to boot image. If no input is entered, the minimum value defaults to 0.
 
*  In the **Minimum Ram** box, specify a minimum size required to boot image. If no input is entered, the minimum value defaults to 0.

* Click check box against **Public** to select it. This will make the image visible to all users.

* Click check box against **Protected** to select it. This makes the image as editable but cannot be deleted.
 
* From the **Kernel Image** drop-down list, select the corresponding kernel image.

* From the **RAM Disk Image** drop-down list, select the corresponding RAM disk image.

* Click **Create Image**. <br>A message is displayed on successful creation. The image displays in the table in the Images page.<br>
OR <br>
Click **Cancel** to abort and go to the previous screen.

**Note**:<br>

- Do not navigate from the page while the image is being created.<br>
- It is suggested to use different names while creating images.

##Edit a Cloud Image<a name= "Edit a Cloud Image"></a>

To edit an image:

1. Click **Cloud** Tab to select it.

2. From the options in the left panel, select **Image** to open the Images page.

3. Click **More** drop-down list displayed against the image that you wish to edit and select **Edit Image**. The Edit Image dialog box is displayed.

4. Make the required changes.

5. Click **Update Image** to update the changes.<br>
OR <br>
Click **Cancel** to abort and go to the previous screen.

##Delete a Cloud Image<a name= "Delete a Cloud Image"></a>

To delete a cloud:

1. Click **Cloud** Tab to activate it. The tab displays options in the left panel.

2. From the options in the left panel, select **Images** to display the Images page.

3. Click **More** drop-down list displayed against the image that you wish to delete and select Delete Image.<br>
A message is displayed to ask your confirmation. The image is deleted once your confirmation is received.</br>

To delete a group of images, click to select the image/images that you want to delete and click check box **Delete Images**. The images are deleted and removed from the image list.

##Launch a Cloud Image<a name= "Launch a Cloud Image"></a>

To launch an image in the Administration Dashboard:

1. Click **Cloud** Tab to select it.

2. From the options in the left panel, select **Image** to display the Images page.

3. Select **Launch** against the image listed in the table. A Launch Instance dialog box displays with four tabs: **Details** Tab, **Access & Security** Tab, **Networking** Tab and **Post-Creation** Tab. By default, Details is the active tab.

4. On the **Details** Tab, perform the following:
   
* From the **Instance Source** drop-down list, select the image.
  
 * From the **Image** drop-down list, select the value. 
  
 * In the **Instance Name** box, enter a name for the instance.
   
 * From the **Flavor** drop-down list, select the Baremetal flavor. <br>This is default flavor that is created.
  
  * In the Instance Count box, enter 1 or more than 1.<br><p>
The flavor details are displayed on the right side of the dialog box.</br></p>

1. On the Access and Security Tab, perform the following:
  
 * From the **Keypair** drop-down list, select value from the list.

6. On the **Networking** Tab, no networks are listed in the **Selected Networks** section.
  
 * Select the network from the **Available Networks** section.

7. Click **Launch**. <br>You are taken to the Instances page with the progress bar displaying the completion progress.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>