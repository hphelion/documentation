---
layout: default
title: "HP Cloud OS for Moonshot: Administration Dashboard"
permalink: /cloudos/moonshot/manage/administration-dashboard/region-images/
product: moonshot

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage">&#9650; UP</a> | NEXT &#9654; </p>


#Manage Images#

Images are stored at the Domain level with a single Glance service and are unaffected by region selection. Only Public images are visible to all users. To *create images, refer to the Cloud Image Builder document for more details*.

You can perform the following tasks:

* <a href="#Create a Region Image">Create a Region Image</a> 

* <a href="#Edit a Region Image">Edit a Region Image</a> 

* <a href="#Delete a Region Image">Delete a Region Image</a> 

* <a href= "#Launch a Region Image">Launch a Region Image</a>


To view the list of available image:

1.	Click the **Region** Tab to select it.

2.	From the options in the left panel, select Images to display the **Images** page with a list of images.

3.	Click **Image Name** to view the image details and specifications.

##Create a Region Image##<a name= "Create a Region Image"></a>

To create a region image:

1.	Click the **Region** Tab to activate it.<br>
The tab displays options in the left panel.

2.	Select **Images** from the left panel to open the Images page.

**Note**:

- It is mandatory to create image types such as QCOW2 and AMI with associated Amazon Kernel Image (AKI) and Amazon RAMdisk Image (ARI). It is suggested to create the images in the following sequence: Amazon Kernel Image (AKI), Amazon RAMdisk Image (ARI) and QCOW2.

- The Kernel Image drop-down list and RAM Disk Image drop-down list is displayed when the selected format is
QCOW2 or AMI.

**To create AKI images**:

* Click **Create Image** to open a Create an Image dialog box.

* In the **Name** box, enter a name for the image.

* (Optional) In the **Description** box, enter description for the image.

* From the **Format** drop-down list, select the format as *AKI*.

* From the **Image Source** drop-down list, do either of the following:

 * Select **Image Location** from the drop-down list.<br>
The Image Location box is displayed.

 * In the **Image Location** box, enter the HTTP URL to load the AKI image from.<br>
OR<br>

 * Select **Image File** from the drop-down-list. <br>
The Choose File option is displayed.

 * Click **Choose File** to browse the AKI image.
 
* Select the **AKI Image** to upload.

* The **CPU Architecture** drop-down list displays *x86_64* by default.<br>
The moonshot hardware supports the above specification.

* In the **Minimum Disk** box, specify a minimum size required to boot image.<br>
If no input is entered, the minimum value defaults to 0.

* In the **Minimum Ram** box, specify a minimum size required to boot image.<br>
If no input is entered, the minimum value defaults to 0.

* Select check box  against **Public** to select it.<br>
This will make the image visible to all users.

* Select check box against **Protected** to select it.<br>
This makes the image as read-only.

* Click **Create Image**.<br> A message is displayed on successful creation. The image displays in the table in the Images page.<br>
OR<br>
Click **Cancel** to abort and go to the previous screen.

**To create QCOW2****:**

* Click **Create Imag**e to open a Create an Image dialog box.

* In the **Name** box, enter a name for the image.

* From the **Format** drop-down list, select the format as *QCOW2-QEMU Emulator*.

* From the **Image Source** drop-down list, do either of the following:
 * Select **Image Location** from the drop-down list.<br>
The Image Location box is displayed.
 
 * In the **Image Location** box, enter the HTTP URL to load the QCOW2 image from.<br>
OR<br>
 
 * Select **Image File** from the drop-down-list.<br>
The Choose File option is displayed.
 
 * Click **Choose File** to browse the QCOW2 image.
 
 * Select the **QCOW2-QEMU Image** to upload.

* The **CPU Architecture** drop-down list displays *x86_64* by default.<br>
The moonshot hardware supports the above specification.

* In the **Minimum Disk** box, specify a minimum size required to boot image.<br>
If no input is provided, minimum is not considered and it defaults to 0.

* In the **Minimum Ram** box, specify a minimum size required to boot image.<br>
If no input is provided, minimum is not considered and it defaults to 0.

* Select check box against **Public** to select it.<br>
This will make the image visible to all users.

* Select check box against **Protected** to select it.<br>
This makes the image as read-only.

* From the **Kernel Image** drop-down list, select the corresponding kernel image.

* From the **RAM Disk Image** drop-down list, select the corresponding RAM disk image.

* Click **Create  Image**.<br>
A message is displayed on successful creation. The image displays in the table in the Images page.<br>
OR<br>
Click **Cancel** to abort and go to the previous screen.

**Note**: Do not navigate from the page while the image is being created.

##Edit a Region Image##<a name= "Edit a Region Image"></a>

To edit an image:

1.	Click **More** drop-down list displayed against the image that you wish to edit and select **Edit Image**. <br>
The Edit Image dialog box is displayed.

2.	Make the required changes.

3.	Click **Update Image** to update the changes.<br>
OR<br>
Click **Cancel** to abort and go to the previous screen.

##Delete a Region Image##<a name= "Delete a Region Image"></a>

To delete a region image:

* Click **More** drop-down list displayed against the image that you wish to delete and select Delete Image.<br>
A message is displayed to ask your confirmation. The image is deleted once your confirmation is received.

* To delete a group of images, select check box to select the image/images that you want to delete and click **Delete Images**.<br>
The images are deleted and removed from the image list.

##Launch a Region Image##<a name= "Launch a Region Image"></a>

To launch an image in the Administration Dashboard:

1. Click the **Region** Tab to select it.

1. From the options in the left panel, select **Images** to display the Images page.

1. Select **Launch** against the image listed in the table.<br>
A Launch Instance dialog box displays with four tabs: **Details** Tab, **Access & Security** Tab, **Networking** Tab, and **Post-Creation** Tab. By default, Details is the active tab.

1. On the **Details** Tab, perform the following:
 
 * From the **Instance Source** drop-down list, select the image.
 
 * From the **Image** drop-down list, select the value.
 
 * In the **Instance Name** box, enter a name for the instance.
 
 * From the **Flavor** drop-down list, select the Baremetal flavor.<br>
This is default flavor that is created.
 
 * In the **Instance Count** box, enter *1* or more than 1.<br>
The flavor details are displayed on the right side of the dialog box.

5. On the **Access & Security** Tab, do the following:
 
 * From the **Keypair** drop-down list, select value from the list.

6.	On the **Networking** Tab, no networks are listed in the **Selected Networks** section.
 
 * Select the private network from the **Available networks** section.
 
7.	Click **Launch**.<br>
The image is displayed in the table on the Image page with **Active** status.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>