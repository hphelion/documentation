---
layout: public-cloud
title: "HP Helion Public Cloud: How to Upload a Partner Image and Make it Public"
permalink: /publiccloud/upload-publish-partner-images135/
product: public-cloud

---
<!--PUBLISHED-->

# HP Helion Public Cloud: How to Upload a Partner Image and Make it Public
<a name="publishPartnerImage"></a>

This document describes how to use the HP Helion Public Cloud Image API to upload images and make them available for public use in the public cloud. It is not intended to be an exhaustive description of [managing images using the Glance client](http://docs.openstack.org/user-guide-admin/content/cli_manage_images.html). For additional detail, see the [glance command reference](http://docs.openstack.org/user-guide-admin/content/glanceclient_commands.html) and the [HP Helion Public Cloud Image Service API specification](http://docs.hpcloud.com/publiccloud/api/image/).

**Note:** As an image owner, it is your responsibility to ensure you have rights to use any software included in the image. HP is not responsible or liable for any unauthorized use of software by the owner of an image.

**Important:** The following regions support uploading an image and making it publicly available:

* Region A - US West (region-a.geo-1)
* Region B - US East (region-b.geo-1)

All other regions do not support the Image API.

### Why upload an image and make it public
HP Helion Public Cloud offers several public images for you to use; however, we might not have the exact image you require. With that in mind, HP Helion Public Cloud allows you to upload your own images and make them publicly available. For example, you might want a version of a Linux distribution that we do not currently offer. Or, you might want to create a customized golden master image to import into HP Helion Public Cloud. Whatever the scenario, if you require a specific customized, public image that we do not currently offer, uploading your own image and optionally making it public may be the right option for you.

### Image types
You can create either a public or private image to upload to HP Helion Public Cloud. Anyone can see and use a public image. If you upload a private image, it is listed in the image catalog for your Project and only visible to you.

We have two types of **public** images:

* HP Helion Public Cloud-created public images 
* Partner-created public images

All HP Helion Public Cloud users have access to both types of public images. When you create a server, your image options are:

* Public images
* Partner images
* Private images
* Bootable volumes

This document explains how to upload images and make them public within **Partner Images**, described in the following sections:

* [Getting started](#publishGetStarted)
* [Creating an image from a snapshot](#publishWindowsSnap)
* [Uploading and managing images](#publishManageGlance)

We also provide you with links to more information and ways to contact customer support:

* [Additional information](#MoreInfo)
* [Contacting customer support](#contactSupport)

## Getting started<a name="publishGetStarted"></a>
Image upload refers to the uploading of a virtual machine image into HP Helion Public Cloud, which creates a new image containing your image data and associated metadata.

**Important:** Images are region-specific; an image is only available in the region to which it has been uploaded. If you need an image in multiple regions, you must create it in each region.

Making an image public refers to setting the `is_public` metadata of an image which exists in HP Helion Public Cloud to `True`. Once set, the image becomes a public image in the HP Helion Public Cloud. Public images:

* Are visible when users list images.
* Can be used by all users to create new virtual machine instances in the region.

An image whose `is_public` metadata field is `False` is referred to as a private image. Private images are only visible to and accessible by their owners.

In brief, to upload an image and make it public, you must: 

1. Install the OpenStack Glance command line tool (or an appropriate API interaction tool like curl).
2. Configure the tool to interact with the HP Helion Public Cloud Image Service.
3. Create an image by either:
    * Creating an acceptable image in your environment and uploading it to HP Helion Public Cloud
    * Creating a snapshot image from a running instance in HP Helion Public Cloud
4. Supply the required documentation if you intend to make your image public.

**Warning:** You should only make an image public after you have fully tested it!

Before you upload an image and make it public, you must:

* [Install tools](#toolsInstall)
* [Configure environment variables](#publishConfigEnv)
* [Acquire a token if using curl](#publishCurlToken)
* [Understand image requirements](#publishImageReqs)
* [Understand required attributes and properties](#publishReqAttsProps)

### Installing tools<a name="toolsInstall"></a>
To interact with the HP Helion Public Cloud Image API, you need to install the Nova and Glance client tools. If your platform does not support the Glance client, you can use the curl command.

#### The Nova and Glance client tools<a name="publishInstallGlance"></a>
OpenStack's Nova client tool provides API access to the Nova service. OpenStack's Glance client tool provides the `glance` command, which is the preferred method for interacting with the HP Helion Public Cloud Image API. Refer to [OpenStack's documentation](http://docs.openstack.org/user-guide/content/install_clients.html) or [Cloud 13.5 CLI Installation Instructions](https://community.hpcloud.com/article/cloud-135-cli-installation-instructions) for information on installing the Nova and Glance client tools.

If the Glance client is not available for your platform, see the alternate instructions below for [installing curl](#installCurl).

#### The curl command<a name="installCurl"></a>
The preferred method for interacting with the HP Helion Public Cloud Image API is to use the `glance` command in the Glance client tool. If the `glance` command is not available for your platform, you can manage your images using the `curl` command.

**Important:** Before using curl, ensure that you have acquired a token and [configured environment variables](#publishConfigEnv) for your system.

### Configuring environment variables<a name="publishConfigEnv"></a>
Before using the Glance client (or curl) to manage images, ensure you have followed these instructions to set your environment variables. To interact with HP Helion Public Cloud Image API endpoint, appropriately set the following environment variables:

<ul>
<li>OS_USERNAME</li>
<li>OS_PASSWORD</li>
<li>OS_TENANT_NAME</li>
<li>OS_AUTH_URL</li>
<li>OS_AUTH_STRATEGY</li>
<li>OS_REGION_NAME
<p><b>Important:</b> The following regions support uploading an image and making it publicly available:

<ul><li>Region A - US West 13.5 (region-a.geo-1)</li>
<li>Region B - US East 13.5 (region-b.geo-1)</li>
</ul></p>
</li>
<li>OS_IMAGE_URL
<p><b>Important:</b> If you are using curl, you must also set the image URL. Since the Glance client determines the image URL automatically, if it is set, you do not need this variable.</p>
</li>
</ul>

To configure your environment variables using bash, complete the following steps.

**Note:** You can complete these steps in any shell; however, the commands will differ.

<ol>
<li>Open a bash command window and navigate to the directory where you want to keep the variables.</li>
<li>Run the following command to create a text file to store the variables, where <code>.glancerc</code> is your file name:

<pre>
$ touch .glancerc</pre>
</li>
<li>Change permissions on the file so that only you can read and write to it:
<pre>
$ chmod 600 .glancerc</pre>
</li>
<li>Open you editor of choice, such as vi:
<pre>
$ vi .glancerc</pre>
</li>
<li>Add the required variables and their values:

<pre>
# Account specific
export OS_USERNAME={username}  
export OS_TENANT_NAME={project_name}  
export OS_PASSWORD={password}  
# Not-account specific (same for all users)  
export OS_AUTH_URL=https://region-b.geo-1.identity.hpcloudsvc.com:35357/v2.0  
export OS_AUTH_STRATEGY=keystone  
export OS_REGION_NAME=region-b.geo-1  
# Note: If using 'curl' you must set "OS_IMAGE_URL"  
export OS_IMAGE_URL=https://region-b.geo-1.images.hpcloudsvc.com:443
</pre>

</li>
</ul>
<li>Save your changes and exit the editor.</li>
<li>Establish the environment:
<pre>
$ source .glancerc</pre>
</li>
</ol>

### Acquiring a token (curl)<a name="publishCurlToken"></a>
Before you can manage your images using curl, you must acquire a token using your credentials. To acquire a token:

<ol><li>Run the following command:

<pre>
$ curl -X POST -H "Content-Type: application/json" -d "{\"auth\":{\"tenantName\": \"$OS_TENANT_NAME\", \"passwordCredentials\": {\"username\": \"$OS_USERNAME\", \"password\": \"$OS_PASSWORD\"}}}" $OS_AUTH_URL/tokens
</pre>

**Important:** Be careful using the double quotes (") and escaped double quotes (\") in the command above.

The curl command should return output, such as:

<pre>
{"access": {  
  "token": {  
    "expires": "2013-05-24T22:03:30.036Z",   
    "id": "HPAuth10_a73d39f83b98359a7a0951f51a393aaeafdc00fcbcd31c300384917",  
    "tenant": {  
       "id": "12345678",   
       "name": "jane.smith@example.com"  
       }  
    },
.  
</pre>
</li>
<li> Copy the token ID to the system clipboard. For example, in the output above the token ID is:

<pre>HPAuth10_a73d39f83b98359a7a0951f51a393aaeafdc00fcbcd31c300384917
</pre>
</li>
<li> To perform Glance API operations using curl, you must export the token. To export the token, run the <code>export</code> command using the generated token ID. For example:

<pre>$ export TOKEN_ID=HPAuth10_a73d39f83b98359a7a0951f51a393aaeafdc00fcbcd31c300384917
</pre>
</li>
</ol>

### Image requirements ### {#publishImageReqs}
**NOTE:** We require documentation for all public images.

Your uploaded images must adhere to the following:

* Images for any licensed OS require a valid OS license.
    * If you build your own image of a licensed OS, you must ensure that you provide a valid license to image users.
    * If you use an HP Helion Public Cloud supplied licensed OS to create your own image from a snapshot, then the HP Helion Public Cloud provided license is included.
* If you make any third-party software programs available through your image, you must comply with all third-party license requirements for such use. HP does not control and is not responsible for any of these programs or their content. If you are required to agree to terms and conditions set by a third party for usage of such third-party software programs, you are responsible for compliance with these requirements.

#### Common requirements<a name="publishCommonReqs"></a>
You must ensure that all uploaded images meet the following requirements:

* An image must:
    * have the `architecture` property set to either x86_64 or i686.
    * have [supporting documentation](#publishDocReqs).
    * support the VirtIO disk driver and network driver.
    * be configured to use DHCP for its primary network interface.
    * not have a MAC address tied to its primary network interface; an instance booted in the HP Helion Public Cloud gets a random MAC address assigned by the HP Helion Public Cloud infrastructure.
    * be self-contained; it should not be a multi-part image, e.g., one that references a separate ramdisk/kernel.
    * be in the `qcow2` format
    * use qemu compatibility 0.10
* An image should:
    * support the x86_64 architecture; the HP Helion Public Cloud supports the i686 architecture, but it is not as efficient.

#### Linux requirements<a name="publishLinuxReqs"></a>
Additionally, any Linux image:

* Must support an SSH server.
* Should support the cloud-init package for instance customization.

#### Windows requirements<a name="publishWindowsReqs"></a>
All Windows images must support Remote Desktop Protocol.

#### Public image documentation requirements<a name="publishDocReqs"></a>
Because we require  documentation for all public images, you must provide a Knowledge Base document describing the intended use of the image, and:

* Steps to create an instance on the HP Helion Public Cloud using your image (we encourage examples not using Management Console). 
* Contact information for access to non-HP Helion Public Cloud support channels, for example, web URL, phone number, email address, etc. 

You can [contact HP Support](https://www.hpcloud.com/contact_us) or email this documentation to support@hpcloud.com. Be sure to include the image name and ID, if available. 

If you intend to use your public image outside of the HP Helion Public Cloud environment (for example, the partner/customer application makes API calls to HP Helion Public Cloud to bring up the instance), your documentation requirements do not have to be as detailed. Rather, a simple Knowledge Base document that includes what the image does and where to go for support should be sufficient. 

You can find partner-provided examples of the required documentation on the following pages:

* [CohesiveFT Partner Images](https://community.hpcloud.com/article/cohesiveft-partner-images-now-available)   
* [CohesiveFT VNS3 3.x Configuration for HP Helion Public Cloud](http://www.cohesiveft.com/dnld/CohesiveFT-VNS3-3.0.4_HPCS.pdf)

#### Required attributes and properties for images<a name="publishReqAttsProps"></a>
In general, you do not need to add additional attributes or properties to your image in order to use it in HP Helion Public Cloud with the Image API; however, you must define certain image attributes and properties for the image to either be **deployed on HP Helion Public Cloud** or **displayed in the HP Helion Public Cloud management console**. 

##### Deploying images in HP Helion Public Cloud<a name="publishReqsDeploy"></a>
To deploy an image in HP Helion Public Cloud, you must define/set the following attributes and properties when you create the image: 

**Attributes**

* container-format = `bare`
* disk-format = `qcow2`
* name = approximately 72 ASCII characters

**Property**

* architecture = `x86_64` or `i686`<br />
    This property is used by Nova to spin up instances and you must set it to either x86_64 or i686.

##### Displaying images in the HP Helion Public Cloud management console<a name="publishReqsDisplay"></a>
The HP Helion Public Cloud management console uses custom properties to categorize and display an image. If you want to use the management console, set the following custom properties to control how the image is categorized and displayed. 

<table>
  <thead>
    <tr>
      <th>Property</th>
      <th>Supported Values</th>
      <th>Usage</th>
    </tr>
  </thead>
  <tbody>
   
      <td>com.hp__1__image_type</td>
      <td><ul><li>disk</li>
      <li>kernel</li>
      <li>ramdisk</li>
      <li>machine</li>
      </ul></td>
      <td><ul><li>Filters out non-bootable images from image catalog.</li>
      <li>Only images with this property set to <code>disk</code> or <code>machine</code> appear in the image catalog.</li>
      <li>Use <code>disk</code> to describe single-part qcow2 images.</li>
      <li>Use <code>kernel</code>, <code>ramdisk</code>, <code>machine</code> to describe multi-part images.</li>
      <li><b>Important:</b> Currently, "<b>disk</b>" is the only valid value since images must be self-contained as we do not yet support multi-part images.</ul></td>      
    </tr>
    <tr>
      <td>com.hp__1__image_lifecycle</td>
      <td><ul><li>active</li>
      <li>deprecated</li>
      </ul></td>
      <td><ul><li>Filters out old images from the image catalog.</li>
      <li>Only images with this property set to <code>active</code> appear in the image catalog.</li>
      <li>Intended to show the latest (active) image of a given distribution.</li></ul></td>
    </tr>
    <tr>
      <td>com.hp__1__bootable_volume</td>
      <td><ul><li>true</li>
      <li>false</li>
      </ul></td>
      <td><ul><li>Filters out images that are not compatible with the bootable volume.</li>
      <li>Use <code>true</code> to create a bootable volume.</li></ul></td>
    </tr>
    <tr>
      <td>com.hp__1__os_distro</td>
      <td>Reverse URL of image's OS distribution</td>
      <td><ul><li>Example values: <code>com.ubuntu</code>, <code>org.debian</code>, or <code>com.microsoft.server</code>.</li>
      <li>Groups images into Linux and Windows categories.</li>
      <li>This property must be set to <code>com.microsoft.server</code> for Windows images to properly show up in the Windows image catalog.</li></ul></td>
    </tr>
  </tbody>
</table>

See the [Glance client](#publishGlanceCreate) and [curl](#publishCurlUpload) sections for the instructions to set these attributes and properties.

## Creating an image from a snapshot<a name="publishWindowsSnap"></a>
One way to create an image is to customize an HP Helion Public Cloud-provided licensed, public image. There are several ways you can do this; however, the steps below describe one method for customizing an HP Helion Public Cloud-provided licensed image. For more detailed information or to see alternative methods, see [Creating a snapshot of an instance](https://community.hpcloud.com/article/creating-snapshot-instance-0).

<ol>
<li>
Boot an HP-provided instance and note the instance ID.</li>
<li>Customize the instance by installing software, completing operating system customization, and any additional preparation steps.</li>
<li>Once you're ready, prepare your instance to be snapshot by following these steps for your operating system:
<ul>
<li><b>For a Windows instance</b> sysprep and shutdown the image as an Administrator from the command prompt.
<ol type=a>
<li>cd c:\windows\setup\hpcloud</li>
<li>sdelete -z c</li>
<li>startsysprep</li>
<p><b>Note:</b> After sysprep is done your instance will shut down.</p>
</ol></li>
<li><b>For a Linux instance</b> shutdown the instance as root.
</li>
</ul>
</li>

<li>Verify that the instance is shut down:

<pre>nova show &lt;instance_id&gt;</pre>

</li>
<li>Create the snapshot:

<pre>nova image-create &lt;instance_id&gt; &lt;my snapshot name&gt;</pre>

<p><b>Note:</b> Only the root disk is included with the snapshot; the ephemeral storage will be lost.</p>
</li>

<li>Verify that the image status shows "SAVING" and changes to "ACTIVE" when the snapshot is saved:

<pre>nova image-show &lt;my_snapshot_name&gt;</pre>

<p><img src="media/glance-snapshot-details.png" width="580" alt="" /></p>
</li>

<li>Remove the snapshot image properties:
<p><b>For Windows snapshots</b> you need to ensure you leave the following properties on the snapshot: <code>com.hp__1__license_os</code> and <code>hp_image_license</code> by forming your command like this:</p>

<pre>glance image-update {image_id} --purge-props --property com.hp__1__license_os={id} --property hp_image_license={id}</pre>

<p><b>For Linux snapshots</b> you should use this command:

<pre>glance image-update {image_id} --purge-props</pre>
</p>
<p><img src="media/glance-snapshot-details-purged.png" width="580" alt="" /></p>
</li>
<li><p>Your instance from which the snapshot was taken will need to be deleted as it's had it's final sysprep performed on it and you will not be able to retrieve the Administrator password for it, preventing you from connecting to it again:</p>

<pre>nova delete &lt;instance_id&gt;</pre>
</li>
</ol>

You are now ready to:

* [Add the required properties.](#publishReqsDisplay)
* Test your image while it is still private.
* Make the image publicly available.

<p><b>Important:</b> If you don't add the required properties to your snapshot file then it may not function properly.</p>

## Uploading and managing images<a name="publishManageGlance"></a>
Using the `glance` command is the preferred method for interacting with the HP Helion Public Cloud Image API. In this section, we describe the basic `glance` commands to use for uploading and managing your images. If the Glance client is not available for your platform, see the alternate instructions in each section for using curl commands. 

Before using the Glance client (or curl), ensure you have configured your environment variables. The rest of this section describes how to:

* [List images](#publishGlanceList)
* [Upload images](#publishGlanceCreate)
* [Update image attributes and properties](#publishGlanceUpdate)
* [Show image details](#publishGlanceShow)
* [Make an image public](#publishGlancePublic)
* [Delete an image](#publishGlanceDelete)
* [Deprecate an image](#publishGlanceDeprecate)

There is also a section on the most [common HTTP errors](#publishGlanceErrors) that might occur when using the Glance client tool. 

**Important:** For more information, see OpenStack's documentation on [managing images using the Glance client](http://docs.openstack.org/user-guide-admin/content/cli_manage_images.html) and the [glance command reference](http://docs.openstack.org/user-guide-admin/content/glanceclient_commands.html).

### Listing images<a name="publishGlanceList"></a>
To see a list of available images, follow the instructions below.

#### Glance client ####

1. Open your choice of command shell.
2. Run the following command at the prompt to see a list of images:

<pre>
$ glance image-list</pre>

<img src="media/glance-image-list.png" width="580" alt="" />

#### Curl ####

Type the following command, where `OS_IMAGE_URL/v1.0/images` is the location of your images:

<pre>
$ curl -H "X-Auth-Token: $TOKEN_ID" $OS_IMAGE_URL/v1.0/images</pre>

Your output should be similar to this:

<pre>
{"images": [{"name": "CentOS 6.3 Server 64-bit 20130116 (b)", "container_format": "bare", "disk_format": "qcow2", "checksum": "b43071530a6a1704b5b8b644a6f5231e", "id": "2ffc3a4c-8272-478f-a5a8-0067c0012e33", "size": 325020160}, {"name": "CentOS 5.8 Server 64-bit 20120828 (b)", "container_format": "bare","disk_format": "qcow2", "checksum": "e66bad1137c6d519fc5c6fb175e45b71", "id": "fcc0edba-6f1b-4451-a4cc-7c63f20430b5", "size": 305438208}]}
</pre>

**Note:** This command lists up to 1000 images.

### Uploading an image<a name="publishGlanceCreate"></a>
When you upload your image, you must [define/set the required attributes and property](#publishReqsDeploy). To upload an image, follow the instructions below.

**Note:** The `architecture` property you set and the attributes you define, allow you to upload and boot your image. If you want to use the HP Helion Public Cloud management console, you must [set additional properties](#publishReqsDisplay).

#### Glance client ####
To upload your new image using the Glance `image-create` command:

1. Open your choice of command shell.
2. Run the following command to upload your new image and define/set the required attributes and property, where your image name is `My Custom Image` and your image file location is `/root/images/my_test_image.qcow2`:

    <pre>
    $ glance image-create --name 'My Custom Image' --container-format bare --disk-format qcow2 --property architecture=x86_64 /root/images/my_test_image.qcow2</pre>
    
    **Note:** You can define/set all [required](#publishReqsDeploy) and [optional](#publishReqsDisplay) attributes and properties in this step.

3. Verify that your image status is active.

    **Important:** After your upload completes, your image should have status 'active'. 

    <img src="media/glance-image-attributes.png" width="580" alt="" />

4. After the image status is `active`, you can boot it using the appropriate nova commands or the HP Helion Public Cloud web interface. See the documentation for [creating instances](https://community.hpcloud.com/article/creating-your-first-instance) for more information.

**Important:** Image upload duration will vary depending on your internet service provider's bandwidth and on the image size. If you have a problem with your system timing out, you can upload the image to an instance running on HP Helion Public Cloud, and then use the Glance client tool to upload the image to Glance. Newer Glance clients provide a `progress` argument to allow you to monitor the progress of the upload. If you need to monitor the progress and your version of the Glance client does not support `progress`, use the curl command documented below.

#### Curl<a name="publishCurlUpload"></a>
**Important:** You must supply `"X-Image-Meta-Container_format"` and `"X-Image-Meta-Disk_format"` headers.

To upload your image, complete the following steps:

1. Run the following command, where `My Custom Image` is the name of your image and `tmp/image.qcow2` is the location and file name of your image:

    <pre>
    $ curl -XPOST -H "X-Auth-Token: $TOKEN_ID" -H "Content-Type: 
    application/octet-stream" -H "X-Image-Meta-Disk_format: qcow2" 
    -H "X-Image-Meta-Container_format: bare" -H "X-Image-Meta-Name: 
    My Custom Image" --data-binary @/tmp/image.qcow2 
    --progress-bar $OS_IMAGE_URL/v1.0/images -o /tmp/out
    </pre>

2. Run the following command to verify your image was uploaded:

    <pre>$ cat /tmp/out</pre>

    Your output should be similar to this:

    <pre>
    {"image": {"status": "active", "name": "My Custom Image", 
    "deleted": false, "container_format": "bare", "created_at": 
    "2013-05-24T11:44:48", "disk_format": "qcow2", "updated_at":  
    "2013-05-24T11:44:49", "id": "8d1ba046-b06e-425d-b867-7b8c960ddaaa", 
    "min_disk": 0, "protected": false, "min_ram": 0, "checksum": 
    "fcb3450fb99fd160f6567df398921aed", "owner": "123456", "is_public": 
    false, "deleted_at": null, "properties": {}, "size": 456}}
   </pre>

**Important:** When the upload is complete, your image status is `active`, and you can boot it using the relevant nova commands or the HP Helion Public Cloud web interface. See the documentation for [creating instances](https://community.hpcloud.com/article/creating-your-first-instance) for more information.

### Updating properties required for HP Helion Public Cloud management console<a name="publishGlanceUpdate"></a>
If you want your images to display in the HP Helion Public Cloud management console, you must [set additional properties](#publishReqsDisplay). To update these properties, follow the instructions below.

#### Glance client ####
Use the `--property` option of the `glance` command:

<pre>
$ glance image-update <image_name_or_id> --property <property_name>=<property_value></pre>

For example, to set the `image type` property to `disk`, run the following command:

<pre>
$ glance image-update <image_name_or_id> --property com.hp__1__image_type=disk</pre>

<br />
<img src="media/glance-image-property.png" width="580" alt="" />

You can run this command for each required property, or you can include all the required properties in one command. For example:
<pre>
$ glance image-update &lt;image_name_or_id&gt; --property com.hp__1__image_type=disk --property com.hp__1__image_lifecycle=active --property com.hp__1__bootable_volume=true --property com.hp__1__os_distro=org.debian</pre>

If you want to define additional attributes or set additional properties, follow the same syntax.

#### Curl<a name="publishCurlProps"></a>
Run the following command:
<pre>
curl -v -XPUT -H "X-Auth-Token: $TOKEN_ID"  -H 'X-Image-Meta-Property=&lt;property_name&gt;: &lt;property_value&gt;' $OS_IMAGE_URL/v1.0/images/&lt;image_id&gt;</pre>

For example, if you set the property `com.hp__1__image_type` to `disk`:
<pre>
curl -v -XPUT -H "X-Auth-Token: $TOKEN_ID" -H 'X-Image-Meta-Property=com.hp__1__image_type: disk' $OS_IMAGE_URL/v1.0/images/&lt;image_id&gt;</pre>

Run this command for each required property substituting the property name and value. If you want to set additional custom properties, follow the same syntax.

### Showing image details<a name="publishGlanceShow"></a>
Image details can be displayed using the `image-show` option. To see image details, follow the instructions below.

#### Glance client ####
To display information about an image, run the following command:

<pre>
$ glance image-show <image_name_or_id></pre>

<br />
<img src="media/glance-image-details.png" width="580" alt="" />

#### Curl<a name="publishCurlShow"></a>
To display information about an image, run the following command:

<pre>
$ curl -v -XHEAD -H "X-Auth-Token: $TOKEN_ID" $OS_IMAGE_URL/v1.0/images/<image_id></pre>

### Making an image public<a name="publishGlancePublic"></a>
Images are not public by default, and you must have been given privileges by HP Support to make an image publicly available. To make an image public, follow the instructions below.

#### Glance client ####
To make an image public, run the `glance image-update` command:

<pre>
$ glance image-update <image_name_or_id> --is-public=true</pre>
<br />
<img src="media/glance-image-public.png" width="580" alt="" />

#### Curl<a name="publishCurlPublic"></a>
To make an image public, run the following command:
<pre>
$ curl -v -XPUT -H "X-Auth-Token: $TOKEN_ID" -H 'X-Image-Meta-Is_public: True' -H 'X-glance-registry-Purge-props: False' $OS_IMAGE_URL/v1.0/images/&lt;image_id&gt;</pre>

**Important:** To avoid removal of existing custom properties, you must include `X-glance-registry-Purge-props: False`.

### Deleting an image<a name="publishGlanceDelete"></a>
**Warning:** You should never delete an active public image without [contacting HP Support](https://www.hpcloud.com/contact_us) because there might be active virtual machines using that image.

If you no longer want your image, follow the instructions below to delete it.

#### Glance client ####
To delete an image, use the `image-delete` command to remove it.

1. Type the following command: 

<pre>
$ glance image-delete <image_name_or_id></pre>

2. Type the following command to verify your image was deleted:

<pre>
$ glance image-show <image_name_or_id></pre>

<img src="media/glance-image-delete.png" width="580" alt="" />

#### Curl<a name="publishCurlDelete"></a>
To delete an image, run the following command:

<pre>
curl -v -XDELETE -H "X-Auth-Token: $TOKEN_ID" $OS_IMAGE_URL/v1.0/images/<image ID></pre>

### Deprecating an image<a name="publishGlanceDeprecate"></a>
<!--
**Warning:** you should never deprecate an active public image without [contacting HP Support](https://www.hpcloud.com/contact_us) because there might be active virtual machines using that image.
-->

As long as an image exists in HP Helion Public Cloud, it will appear in all image listings using an HP Helion Public Cloud Image API. You can exclude an image from the HP Helion Public Cloud management console by setting the `com.hp__1__image_lifecycle` property to `deprecated`. This will effectively deprecate the image for use by users of the management console. Use the following instructions to deprecate an image.

**Note:** We require that you append `(deprecated)` to the image name so that other users can easily spot deprecated images when listing all images using the Glance or Nova client tools.

#### Glance client ####
To deprecate an image in HP Helion Public Cloud management console:
<pre>
$ glance image-update &lt;image_name_or_id&gt; --property com.hp__1__image_lifecycle=deprecated --name '&lt;image_name&gt; (deprecated)'</pre>

#### Curl #### {#publishCurlDeprecate}
To deprecate an image, run the following command:
<pre>
curl -v -XPUT -H "X-Auth-Token: $TOKEN_ID"  -H 'X-Image-Meta-Property-com.hp__1__image_lifecycle: deprecated' $OS_IMAGE_URL/v1.0/images/&lt;image ID&gt;</pre>

### Common errors when using the Glance client {#publishGlanceErrors}
Possible HTTP return codes are listed in HP Helion Public Cloud Image API documentation. The most common errors (and possible explanations) are:

* HTTP 401: (unauthorized) you specified invalid credentials
* HTTP 403: (forbidden) you are not activated for HP Helion Public Cloud Compute Service
* HTTP 404: (not found) you incorrectly specified the image id

## For more information<a name="MoreInfo"></a>

For additional information on uploading an image and making it publicly available, see:

* [HP Helion Public Cloud Image Service API documentation](https://docs.hpcloud.com/publiccloud/api/image/)
* [OpenStack documentation](http://docs.openstack.org/user-guide/content/ch_cli.html)
* [Public Cloud CLI Installation Instructions](https://community.hpcloud.com/article/cloud-135-cli-installation-instructions)
* [Manage images using the Glance client](http://docs.openstack.org/user-guide/content/cli_manage_images.html)
* [glance command reference](http://docs.openstack.org/user-guide/content/glanceclient_commands.html)
* [Technical support knowledge base](https://community.hpcloud.com)

## Contacting support {#contactSupport}
If you need further assistance, you can contact support in any of these ways:

* [Live chat from hpcloud.com](https://community.hpcloud.com/article/how-contact-support-assistance#chat)
* [Open a support case](https://horizon.hpcloud.com/settings/cases)
* [Email support@hpcloud.com](mailto:support@hpcloud.com)
* Call at 1-855-61CLOUD (1-855-612-5683) in the U.S. or +1-678-745-9010 internationally.
