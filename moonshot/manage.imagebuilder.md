---
layout: default
title: "HP Cloud OS for Moonshot: Building Images"
permalink: /cloudos/moonshot/manage/image-builder/
product: moonshot

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>



<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/administration-dashboard">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage">&#9650; UP</a> | <a href="/cloudos/moonshot/manage/backup-process">NEXT &#9654;</a> </p>

# HP Cloud OS for Moonshot: Building Images {#moon-image-builder}

You can create customized images suitable to your environment either manually or using Disk Image Builder tool. 
HP Cloud OS for Moonshot supports both Linux and Windows images.  This document covers two sections:

* [Section One](#section-one) provides detailed instructions on creating Linux images using Disk Image Builder.

* [Section Two](#section-two) defines the steps to create Windows images manually. 


## Section One - Creating Linux Images {#section-one}

* [Supported operating systems](#image-builder-os)
* [About Disk Image Builder](#disk-image-builder)
* [Creating a disk image](#disk-image-create)
* [Using your disk image with OpenStack](#image-builder-openstack)
* [Creating an image for a specific workload](#image-specific-workload)


### Supported operating systems {#image-builder-os}

The following operating systems are supported for image building:

* Red Hat Enterprise Linux version 6.4 and above
* Ubuntu version 12.04 LTS and above


### About Disk Image Builder {#disk-image-builder}

Disk Image Builder is the tool that can be used for building and customizing images for Nova-Baremetal deployment. It helps in building disk images and PXE images for use with HP Cloud OS for Moonshot. The disk images are a thin version of images created compared to other disk image building tools.

Disk Image Builder creates images based on different elements defined in its element directory. These scripts are bundled in a specific pattern which provides the core functionality of creating cloud images. It provides elements to create a basic Virtual Machine of either Ubuntu or Fedora. We can also create our own Virtual Machine images by including/writing new elements and putting them under the elements directory. One such example is a LAMP image which provides a cloud image of LAMP server to use in OpenStack.

Disk Image Builder creates images of format QCOW2, by default. This image format can be added to Glance and used with OpenStack using the `glance image-create` command.


#### Prerequisites {#disk-image-prereq}

Before you attempt to build an image, make sure you have:

* 4 GB physical RAM.
* Enough space in /tmp to hold two uncompressed cloud images. One uncompressed image is up to 800 MB in size.
* (Optional) Proxy settings for Internet connectivity.
* qemu-utils and git-core package, VLAN, busybox, open-iscsi, python-lxml, python-libvirt, libvirt, qemu-system installed on the server.


### Creating a disk image {#disk-image-create}

To create a disk image using the Disk Image Builder tool, follow the steps below:

1. As a root user, clone the git repository of a Disk Image Builder to the server:

    `git clone https://github.com/openstack/diskimage-builder.git`

    This creates a directory structure of /root/diskimage-builder, complete with its binary files, library file, elements, etc.

2. Edit your **~/.profile** file to add the directory structure /root/diskimage-builder/bin to the path in your shell:

    `PATH="$HOME/bin:$PATH:/root/diskimage-builder/bin"`

3. If boot from hard disk drive support is needed, continue the following steps else skip to step 7. 

4.	Clone the git repository of TripleO Image Elements to the server:

    <pre>git clone https://github.com/openstack/tripleo-image-elements.git`</pre>

5.	Apply necessary patches needed for boot from hard disk drive support

	<pre>cd /root/tripleo-image-elements

	git fetch https://review.openstack.org/openstack/tripleo-image-elements refs/changes/89/79289/12 && git cherry-pick FETCH_HEAD

	cd /root/diskimage-builder

	git fetch https://review.openstack.org/openstack/diskimage-builder refs/changes/73/79873/6 && git cherry-pick FETCH_HEAD

	git fetch https://review.openstack.org/openstack/diskimage-builder refs/changes/73/84973/1 && git cherry-pick FETCH_HEAD

	cd /root</pre>

6.	Set ELEMENTS_PATH for DIB so that it can use elements from tripleo-image-elements.

    <pre>export ELEMENTS_PATH=/root/tripleo-image-elements/elements</pre>

7. Create a disk image in one of the following ways:

    - **Ubuntu image**

        To create a basic Ubuntu VM image with the associated kernel and ramdisk image, use the following command:

        <pre>disk-image-create -o base -a amd64 vm base ubuntu baremetal</pre>

        This creates a disk image file named base.qcow2

    - **PXE image**

        To create a PXE image, use the following command:

        <pre>ramdisk-image-create -a amd64 -o pxe deploy</pre>

        This creates two files: pxe.initramfs and pxe.kernel

    - **RHEL image**

        To create a RHEL VM image with associated kernel and ramdisk images, use the following command:

        <pre>disk-image-create &ndash;o &lt;image_prefix> &ndash;a amd64 &ndash;u base rhel baremetal</pre>

        <p>This creates three files: &lt;image_prefix>.qcow2, &lt;image_prefix>.vmlinux, and &lt;image_prefix>.kernel</p>

	- **Ubuntu Image with boot from hard disk drive support**
	
        To create a basic Ubuntu image capable of booting from hard disk drive support with associated kernel and ramdisk, use the following command:
    
        `disk-image-create -o base -a amd64 base ubuntu baremetal localboot serial-console`

        This creates a disk image file named base.qcow2


#### Using your disk image with OpenStack {#image-builder-openstack}

Now that you have created your image, you can add it to Glance and manage it with OpenStack.

1. Copy the image file base.qcow2, and associated kernel and ramdisk images, to the OpenStack controller node using the following commands:

    <pre>KERNEL_ID=`glance image-create --name="demo_image-kernel" --public --disk-format=aki &lt; base.vmlinuz | awk '/ id / { print $4 }'
    INITRD_ID=`glance image-create --name="demo_image-ramdisk" --public --disk-format=ari &lt; base.initrd | awk '/ id / { print $4 }'</pre>

2. Use the `glance image-create` command to add the image to the Glance repository:
   
    <pre>glance image-create --name="demo_image" --disk-format=qcow2 --property kernel_id=${KERNEL_ID} --property ramdisk_id=${INITRD_ID} &lt; base.qcow2</pre>

3. Verify that your image was added:

    `glance image-list`

3. From the UI or command line, create a key-pair:

    <pre>nova keypair-add demokey &gt; demokey.pem</pre>

4. Create a VM using `demo_image` and `demokey`:

    <pre>nova boot --image demo_image flavor m1.medium -key_name demokey.pem demo_vm1</pre>

5. Once the VM is booted and gets an IP assigned, SSH to it using the key as follows:

    <pre>ssh -i demokey.pem &lt;IP_of_demo_vm1></pre>

<p>You can now access and manage your VM image from the HP Cloud OS for Moonshot Administration Dashboard. For detailed instructions, see the <b>Manage Images</b> topic of the <a href="http://docs.hpcloud.com/cloudos/moonshot/pdf/HP-Cloud-OS-for-Moonshot-Administration-Dashboard-Help.pdf" target="_blank">Administration Dashboard help (PDF)</a>.</p>


### Creating an image for a specific workload {#image-specific-workload}

You might want to create an image for a specific workload, such as an Internet server. To do this, you must have an element with appropriate hooks written for that specific workload. The rest of this section shows you how to create Ubuntu and RHEL images for specific workloads, and their associated elements.

**Note:** For detailed instructions on how to write elements, refer to the <a href="https://github.com/openstack/diskimage-builder" target="_blank">OpenStack Disk Image Builder documentation</a>.


#### Creating an Ubuntu image for a specific workload {#ubuntu-image}

To create an Ubuntu image for a specific workload, you first need to create the nginx element.


##### Creating a nginx element

1. From a command prompt, create a directory structure of **elements/nginx** using following command:

    <pre>mkdir &ndash;p ~/elements/nginx</pre>
     
    **Note:** The tilde (~) represents your home directory.

2. Change to this newly created directory:

    `cd ~/elements/nginx`

3. From here, create another directory named **install.d**, which will contain the installation hooks:

    `mkdir install.d`

4. In install.d, create a file named **15-nginx** and change its execute permissions:

    <pre>touch 15-nginx
    chmod a+x 15-nginx</pre>

5. Using an editor, such as vi, add the following lines to the 15-nginx file:
	
    <pre>#!/bin/bash
    set -eux
    install-packages nginx</pre>

	
##### Creating an image using nginx with Ubuntu

To use your new nginx element with Ubuntu to create a VM image that is pre-installed with associated kernel and ramdisk images, use the following command:

<pre>disk-image-create -o base -a amd64 vm base baremetal nginx</pre>

<p>This creates a VM image file named base.qcow2. You can now upload and work with this image in HP Cloud OS for Moonshot. For detailed instructions, see the <b>Manage Images</b> topic of the <a href="http://docs.hpcloud.com/cloudos/moonshot/pdf/HP-Cloud-OS-for-Moonshot-Administration-Dashboard-Help.pdf" target="_blank">Administration Dashboard help (PDF)</a>.</p>


#### Creating a RHEL image for a specific workload {#rhel-image}

To create a RHEL image for a specific workload, you first need to create the mongodb element.


##### Creating a mongodb element

1. From a command prompt, create the directory structure **elements/mongodb** using following command:

    <pre>mkdir &ndash;p ~/elements/mongodb</pre>

    **Note:** The tilde (~) represents the path to your home directory.

2. Change to this newly created directory:

    `cd ~/elements/mongodb`

3. From here, create another directory named **pre-install.d**, which will contain the pre-installation hooks to setup yum repositories:

    `mkdir pre-install.d`

4. In pre-install.d, create a file named **10-mongodb** and change its execute permissions:

    <pre>touch 10-mongodb
    chmod a+x 10-mongodb</pre>

5. Using an editor, such as vi, add the following lines to the 10-mongodb file:
 
    <pre>#!/bin/bash
    set -eux
    echo "[mongodb]" &gt; /etc/yum.repos.d/mongodb.repo
    echo "name=mongodb_repo" &gt;&gt; /etc/yum.repos.d/mongodb.repo
    echo "baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/" &gt;&gt; /etc/yum.repos.d/mongodb.repo
    echo "enabled=1" &gt;&gt; /etc/yum.repos.d/mongodb.repo
    echo "gpgcheck=0" &gt;&gt; /etc/yum.repos.d/mongodb.repo</pre>

6. While still in ~/elements/mongodb, create another directory named **install.d**, which will contain the installation hooks:

    `mkdir install.d`

7. In install.d, create a file named **10-mongodb** and change its execute permissions:

    <pre>touch 10-mongodb
    chmod a+x 10-mongodb</pre>

8. Using your editor, add the following lines to the 10-mongodb file:

    <pre>#!/bin/bash
    set -eux
    install-packages mongo-10gen mongo-10gen-server</pre>

9. While still in ~/elements/mongodb, create another directory named **finalise.d**, which will contain the finalise hooks:
 
    `mkdir finalise.d`

10. In finalise.d, create a file named **10-mongodb** and change its execute permissions:

    <pre>touch 10-mongodb
    chmod a+x 10-mongodb</pre>

11. Using an editor, add the following lines to the 10-mongodb file:

    <pre>#!/bin/bash
    set -eux
    rm -Rf /etc/yum.repos.d/mongodb.repo</pre>

	
##### Creating an image using mongodb with RHEL

To use your new mongodb element with RHEL to create an image that is pre-installed with associated kernel and ramdisk images, use the following command:

<pre>disk-image-create &ndash;o &lt;image_prefix> &ndash;a amd64&ndash;u base rhel baremetal mongodb</pre>

<p>This creates a disk image file named base.qcow2. You can now upload and work with this image in HP Cloud OS for Moonshot. For detailed instructions, see the <b>Manage Images</b> topic of the <a href="http://docs.hpcloud.com/cloudos/moonshot/pdf/HP-Cloud-OS-for-Moonshot-Administration-Dashboard-Help.pdf" target="_blank">Administration Dashboard help (PDF)</a>.</p>


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Section Two - Creating Windows Images {#section-two}

This section defines the process to create a Windows Disk image for use with openstack baremetal provisioning service. The following steps provide generalized and specific instructions for image to work on Moonshot cartridges. The section covers the following:

* <a href="#Supported Operating System">Supported Operating System</a>

* <a href="#Tool Requirement">Tool Requirement</a>

* <a href="#HP Moonshot Windows Deployment Pack Details">HP Moonshot Windows Deployment Pack Details</a>

* <a href= "#Steps for creating Windows image">Steps for creating Windows image</a>


<a name="Supported Operating System"></a>

### Supported Operating System 

This section is applicable to the following Windows operating systems:

* Windows 2012

* Windows 2012 R2

* Windows 7 Enterprise with SP1(x64)


<a name="Tool Requirement"></a>

### Tool Requirement

The following are the tool prerequisites for creating a Windows Image: 

* Microsoft Windows Operating System ISO images and licenses.

    You need to download `install.wim` from the product DVD containing the Windows Operating System images for installation.

* HP Moonshot Component Pack (Required on Moonshot cartridges)

  * The HP Moonshot Windows Deployment Pack (HP MWDP) for HP ProLiant m300 server cartridge, if deploying an m300 cartridge.

  * The HP Moonshot Windows Deployment Pack (HP MWDP) for HP ProLiant m700 server cartridge, if deploying an m700 cartridge.

   		Download HP MWDP from [http://www.hp.com/go/moonshot/1500chassis-software-download](http://www.hp.com/go/moonshot/1500chassis-software-download)


* A Machine running Windows OS

    The Windows OS running on the machine should be either same or advanced as compared to the OS image being generated.


<a name="HP Moonshot Windows Deployment Pack Details"></a>
	
### HP Moonshot Windows Deployment Pack (HP MWDP) 

To deploy Microsoft Windows on HP ProLiant Moonshot server cartridges, HP provides software bundles called HP Moonshot Windows Deployment Packs (HP MWDP).

HP ProLiant Moonshot servers are headless and do not have USB connectivity. Therefore, it is critical that the network interface(s) and EMS are operational after installation. HP MWDP contains the minimum set of drivers, typically the network driver, chipset driver and configuration scripts. This is used for updating the `boot.wim` and `install.wim` files as well as SAC support in Windows 7 Enterprise with SP1 to deploy a functional Windows image. The package includes sample unattend files that can be customized and used as the client and also contains image unattend files in your configuration.

**IMPORTANT**: Using the HP Moonshot Windows Deployment Pack (or similar processes) is critical for successful deployment of  Microsoft Windows Operating System because images supplied by Microsoft would not necessarily have the required drivers for the HP ProLiant Moonshot server cartridges.


#### HP MWDP Bundle Composition

The following are an integral part of the bundle apart from the files which are specific to each server cartridge:

* `hpeula-en.html`: HP end-user license agreement (English)

* `hpeula-ja.html`: HP end-user license agreement (Japanese)

* `MWDP_m#00_README.txt`: MWDP read me file.

* A directory containing drivers that can be added to the Windows deployment `boot.wim` and `install.wim` files, particularly the boot-critical NIC driver essential for network based deployments.

* A scripts directory with script(s) to configure Windows deployment boot and `install.wim` files.

* An unattend directory with Windows deployment files. These files are necessary for automating the Windows installation and a requirement for the cartridges.
 
As both ProLiant m300 server cartridges and ProLiant m700 server cartridges have a different purpose as well as Microsoft Operating System support, they need  the following bundles specific to them:

**HP Moonshot Windows Deployment Pack for HP ProLiant m300 Cartridge**

This bundle is designed specifically for the ProLiant m300 server cartridge and assists with the deployment of Microsoft Windows Server 2012 or Microsoft Windows Server 2012 R2.

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: white; color: black;">

<td><b>Drivers</b></td> <td>Chipset - Drivers that support the ProLiant m300 server cartridge platform and eliminate yellow bangs in Windows Device Manager.
<br>Ethernet — Folder containing NIC drivers for Windows deployment on the ProLiant m300 server cartridge.</br>
</td></tr>

<tr style="background-color: white; color: black;">
<td><b>Scripts</b></td> <td>Scripts used for customizing boot.wim and install.wim files from the Windows Server 2012 media or Windows Server 2012 R2.</td></tr>

<tr style="background-color: white; color: black;">
<td><b>Unattend</b></td> <td>Unattend files used for automating Windows Server 2012, or 2012 R2 installation. The unattend files are OS specific.
</td>
</tr>
</table>


**HP Moonshot Windows Deployment Pack for HP ProLiant m700 Cartridge**

This bundle is specifically designed for the ProLiant m700 server cartridge and used to assist with the deployment of Microsoft Windows 7 Enterprise with SP1 (x64).

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: white; color: black;">
<td><b>Drivers</b></td> <td>Chipset - Drivers that support the ProLiant m700 server cartridge platform and eliminate yellow bangs in Windows Device Manager.
<br>Ethernet — Folder containing NIC drivers for Windows deployment on the ProLiant m700 server cartridge</td></tr></br>

<tr style="background-color: white; color: black;">
<td><b>Scripts</b></td> <td>Scripts used for customizing boot.wim and install.wim files from the Windows 7 Enterprise with SP1 media.</td></tr>

<tr style="background-color: white; color: black;">
<td><b>Unattend</b></td> <td>Unattend files used for automating Windows 7 Enterprise with SP1 (x64) installation. The unattend files are OS specific.
</td>
</tr>
</table>


<a name= "Steps for creating Windows image"></a>

#### Steps for creating a Windows Image 

1. **Create a working folder**

	 For the purpose of explanation, C:\WinImage is used as the working folder. On a Windows Machine, create a working folder. Once the folder is created, use the following commands to make it your working folder. For example:

    <pre>mkdir C:\WinImage
    cd C:\WinImage</pre>

2.	**Extract HP MWDP**

	This step is mandatory for Moonshot cartridges. As a general practice,all drivers are placed in a folder and the folder is renamed as **drivers**.

	Perform the following steps:
	
	Extract HP MWDP and copy the drivers folder to the working folder. Execute the following command to check the folder content:

	<pre>C:\WinImage> dir drivers</pre>

 	It should display the following drivers which is used later to enable  support to different devices present on the Moonshot cartridges. 
    
      * chipset

      * ethernet

3.	**Copy `install.wim` to working directory**

	Copy `install.wim` from the source folder on your Windows media to the working directory. Execute the following command to check the folder content: 

	<pre>C:\WinImage> dir</pre>
	 
	Windows Server 2012 media is used for the purpose of explanation.

4.	**Identify the SKU from `install.wim`**

    Windows Server 2012 and Windows Server 2012 R2 contain 4 different Windows SKUs. SKUs are defined in the `install.wim` file by an index number.

	Open an elevated command prompt to the working folder and execute the following command:

	<pre>C:\WinImage> dism /get-imageinfo /imagefile:install.wim</pre>

	The command displays Index for SKUs.

	Make a note of the Index for the desired SKU. For the purpose of explanation, Index 4 is used.

	The Windows 7 Enterprise with SP1 `install.wim` file only contains a single Windows SKU.

5.	**Create a VHD disk**

	Use the following commands:

       * Create a VHD Disk image where the OS image is laid out:

	    <pre>C:\WinImage> diskpart
       DISKPART> create vdisk file="C:\WinImage\WinImageDisk.vhd" maximum=15360</pre> 

       For the purpose of explanation, the size of VHD disk Image is taken as 15GB.


       * Once the virtual disk file is created, mount the VHD:

        <pre>DISKPART> attach vdisk</pre>

       * Create a partition on this disk:

        <pre> DISKPART> create partition primary</pre>

       * Mark the partition as active:

        <pre> DISKPART> active</pre>

       * Format this partition with NTFS file system:

        <pre>DISKPART> format</pre>

       * Assign a drive letter to this newly created partition:

        <pre>DISKPART> assign letter=g</pre>

		For the purpose of explanation, the partition on the VHD is assigned drive letter G.
  
       * Exit the process:

         <pre>DISKPART> exit</pre>

    
6.	**Extract desired SKU**

	Execute the following command to extract files from `install.wim` on the newly created NTFS file system:

    <pre>C:\WinImage> dism /apply-image /imagefile:install.wim /index:4 /ApplyDir:G:\</pre>

7.	**Update the extracted files on G:\ with drivers**

	This step is mandatory for Moonshot cartridges. Please update the commands based on the driver path as required.

	Use the following command to inject the chipset drivers to the VHD image:

	<pre>C:\WinImage> dism /image:G:\ /Add-Driver /driver:drivers\chipset /ForceUnsigned /recurse</pre>

	The Ethernet drivers are different for different Windows version. We are using Windows Server 2012 here.  The drivers are available at drivers\ethernet\ws2012. Use the following command to inject Ethernet drivers:

	<pre>C:\WinImage> dism /image:G:\ /Add-Driver /driver:drivers\ethernet\ws2012 /ForceUnsigned /recurse</pre>

	If you want to inject additional drivers, use the above command again.

8.	**Apply unattend.xml to the image**

	Create unattend.xml file for use with the image. This enables remote desktop, user account creation and necessary operations at the first boot. The remote desktop is disabled by default on Windows deployment. 

	To begin, unattend.xml templates packaged with HP MWDP can be used as a base and should be enhanced/customized. Once the template is customized, copy it under G:\ using the following command.

	<pre>C:\WinImage> copy drivers\ImageUnattend_WS2012.xml g:\unattend.xml</pre>
       
9.	**Make VHD Bootable**

	To make VHD bootable, bcd-store is created and configured. Use bcdedit.exe and bcdboot.exe utility present on Windows OS.
 
	<pre>C:\WinImage> bcdboot G:\windows /s G:
	C:\WinImage> bcdedit /store G:\boot\BCD /set {bootmgr} device locate		
	C:\WinImage> bcdedit /store G:\boot\BCD /set {default} device locate
	C:\WinImage> bcdedit /store G:\boot\BCD /set {default} osdevice locate</pre>

	<pre>C:\WinImage> bcdedit /store G:\boot\BCD</pre>

	Execute the following mandatory commands  when creating images for use with Moonshot cartridges. 

	* Enable boot ems for default boot option:

	<pre>C:\WinImage> bcdedit /store G:\boot\BCD /set {default} bootems on</pre>
	
	* Enable ems for default boot option:

	<pre>C:\WinImage> bcdedit /store G:\boot\BCD /set {default} ems on</pre>

	* Enable novga for default boot option:

	<pre>C:\WinImage> bcdedit /store G:\boot\BCD /set {default} novga on</pre>
	
	* Enable boot ems for bootmgr boot option:

	<pre>C:\WinImage> bcdedit /store G:\boot\BCD /set {bootmgr} bootems on</pre>
	
	* Enable debugging on serial port:

	<pre>C:\WinImage> bcdedit /store G:\boot\BCD /dbgsettings serial debugport:1 baudrate:115200</pre>
	
	* Verify the created BCD-Store:

	<pre>C:\WinImage> bcdedit /store G:\boot\BCD</pre>

	* View Debugger Settings:

	<pre>C:\WinImage> bcdedit /store G:\boot\BCD /enum {dbgsettings} /v</pre>

10.	**Disconnect the VHD Image**

	* Now disconnect the Image to use with openstack:

	    <pre>C:\WinImage> diskpart</pre>

    * Select the virtual disk: 

		<pre>DISKPART> select vdisk file C:\WinImage\WinImageDisk.vhd</pre>

    * Detach the virtual disk:

        <pre>DISKPART> detach vdisk</pre>

    * Exit:

        <pre>DISKPART> exit</pre>

Once the image is detached, it can be tested and verified with Virtual Machines. The image can be used with openstack for deployment on Baremetal servers after successful verification.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

