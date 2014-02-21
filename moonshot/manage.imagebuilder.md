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


<p style="font-size: small;"> <a href="/cloudos/moonshot/prepare/releasenotes">&#9664; PREV</a> | <a href="/cloudos/moonshot/">&#9650; UP</a> | NEXT &#9654; </p>

# HP Cloud OS for Moonshot: Building Images # {#moon-image-builder}

Disk Image Builder is a tool used to create customized images suitable to your environment. This document helps you use Disk Image Builder to create images for the HP Cloud OS for Moonshot.

* [Supported operating systems](#image-builder-os)
* [About Disk Image Builder](#disk-image-builder)
* [Creating a disk image](#disk-image-create)
* [Using your disk image with OpenStack](#image-builder-openstack)
* [Creating an image for a specific workload](#image-specific-workload)

## Supported operating systems ## {#image-builder-os}

The following operating systems are supported for image building:

* Red Hat Enterprise Linux  version 6.4 and above
* Ubuntu version 12.04 LTS and above

## About Disk Image Builder ## {#disk-image-builder}
Disk Image Builder is the tool that can be used for building and customizing images for Nova-Baremetal deployment.  It helps in building disk images and PXE images for use with HP Cloud OS for Moonshot. The disk images are a thin version of images created compared to other disk image building tools.

Disk Image Builder creates images based on different elements defined in its element directory. These scripts are bundled in a specific pattern which provides the core functionality of creating cloud images. It provides elements to create a basic Virtual Machine of either Ubuntu or Fedora. We can also create our own Virtual Machine images by including/writing new elements and putting them under the elements directory. One such example is a LAMP image which provides a cloud image of LAMP server to use in OpenStack.

Disk Image Builder creates images of format QCOW2, by default. This image format can be added to Glance and used with OpenStack using the `glance-create` command. 

### Prerequisites ### {#disk-image-prereq}
Before you attempt to build an image, make sure you have:

* 4 GB physical RAM.
* Enough space in /tmp to hold two uncompressed cloud images. One uncompressed image is up to 800 MB in size.
* (Optional) Proxy settings for internet connectivity.
* qemu-utils and git-core package- Vlan, busybox, open-iscsi, python-lxml, python-libvirt, libvirt, qemu-system installed on the server.

## Creating a disk image ## {#disk-image-create}
To create a disk image using the Disk Image Builder tool, follow the steps below:

1. As a root user, clone the git repository of Disk Image Builder to the server:

    `git clone https://github.com/openstack/diskimage-builder.git`

    This creates a directory structure of /root/diskimage-builder and complete with its binary files, library file, elements, etc.

2. Edit your ~/.profile file to add the directory structure /root/diskimage-builder/bin to the path in your shell:

    `PATH="$HOME/bin:$PATH:/root/diskimage-builder/bin"`

3. Create a disk image in one of the following ways:

    - **Ubuntu image**

        To create a basic Ubuntu VM image with the associated kernel and ramdisk image, use the following command:

        `disk-image-create vm base -o base -a amd64 ubuntu baremetal`

        This creates a disk image file named base.qcow2 

    - **PXE image**

        To create a PXE image, use the following command:

        `ramdisk-image-create –a amd64 –o pxe deploy`

        This creates two files <pxe>.initramfs and <pxe>.kernel

    - **RHEL image**

        To create a RHEL image with associated kernel and ramdisk images, use the following command:

        `disk-image-create –o <image_prefix> –a amd64 –u base rhel baremetal`

### Using your disk image with OpenStack ### {#image-builder-openstack}
Now that you have created your disk image, you can add it to Glance and manage it with OpenStack.

1. Copy the image file base.qcow2, and associated kernel and ramdisk images, to the OpenStack controller node using the following commands:

    <pre>KERNEL_ID=`glance image-create --name="demo_image-kernel" --public --disk-format=aki &lt; base.vmlinuz | awk '/ id / { print $4 }'
    INITRD_ID=`glance image-create --name="demo_image-ramdisk" --public --disk-format=ari &lt; base.initrd | awk '/ id / { print $4 }'</pre>

2. Use the `glance-create` command to add the image to the Glance repository:
   
    `glance image-create --name="demo_image" --disk-format=qcow2 --property kernel_id=${KERNEL_ID} --property ramdisk_id=${INITRD_ID} < base.qcow2`

3. Verify that your image was added:

    `glance image-list`

3. From the UI or command line, create a key-pair:

    `nova keypair-add demokey > demokey.pem`

4. Create a VM using the `demo_image` and `demokey`:

    `nova boot --image demo_image flavor m1.medium -key_name demokey.pem demo_vm1`

5. Once the VM is booted and gets an IP assigned, SSH to it using the key as follows:

    `ssh  -i  demokey.pem <IP_of_demo_vm1>`

You can now access your image from the HP Cloud OS for Moonshot Administration dashboard. From there, you can manage your image.

## Creating an image for a specific workload ## {#image-specific-workload}
An element with appropriate hooks needs to be written for specific workload. This element can be used later for creating Images with specific workloads. For detailed instruction on how to write elements, check the following URL
 https://github.com/openstack/diskimage-builder.

### Creating an Ubuntu Image with nginx ### {#ubuntu-image}
To create an Ubuntu Image with nginx, we first need to create element for nginx.

#### Creating nginx element

1. Create a directory elements/nginx using following cmd and then change working directory to this newly created directory:

    <pre>mkdir –p ~/elements/nginx
    cd ~/elements/nginx</pre>

2. Create another directory install.d which will contain the installation hooks as follows:

    `mkdir –p ~/elements/nginx/install.d`

3. Under install.d, create a file 15-nginx and then change its execute permissions.

    <pre>touch ~/elements/nginx/install.d/15-nginx
    chmod a+x ~/elements/nginx/install.d/15-nginx</pre>

4. Using an editor, add the following lines to 15-nginx:
	
    <pre>!/bin/bash
    set -eux
    install-packages nginx</pre>

#### Using nginx element to create Ubuntu Image
To create a Ubuntu VM image having nginx pre-installed with associated kernel and ramdisk images, use the following command:

    disk-image-create vm base -o base -a amd64 baremetal nginx

This creates a disk image file named base.qcow2. You can now publish this disk image to HP Cloud OS Distributed Network.

### Creating an RHEL Image with mongodb ### {#rhel-image}
To create an RHEL Image with mongodb, we first need to create element for mongodb.

#### Creating mongodb element
1. From a command prompt, create the directory structure `element/mongodb` using following command:

    `mkdir –p ~/elements/mongodb`

    **Note:** The tilde (~) represents the path to your home directory.

2. Change to this newly-created directory:

    `cd ~/elements/mongodb`

3. Create another directory pre-install.d which will contain the pre-install hooks to setup yum repositories for yum as follows:

    `mkdir –p ~/elements/mongodb/pre-install.d`

4. Under pre-install.d, create a file 10-mongodb and then change its execute permissions.

    <pre>touch ~/elements/mongodb/pre-install.d/10-mongodb
    chmod a+x ~/elements/mongodb/pre-install.d/10-mongodb</pre>

5. Edit 10-nginx and then put the following into it:
 
    <pre>!/bin/bash
    set -eux
    echo "[mongodb]" &gt; /etc/yum.repos.d/mongodb.repo
    echo "name=mongodb_repo" &gt;&gt; /etc/yum.repos.d/mongodb.repo
    echo "baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/" &gt;&gt; /etc/yum.repos.d/mongodb.repo
    echo "enabled=1" &gt;&gt; /etc/yum.repos.d/mongodb.repo
    echo "gpgcheck=0" &gt;&gt; /etc/yum.repos.d/mongodb.repo</pre>

6. Create another directory install.d which will contain the installation hooks as follows:

    `mkdir –p ~/elements/mongodb/install.d`

7. Under install.d, create a file 10-mongodb and then change its execute permissions.

    <pre>touch ~/elements/mongodb/install.d/10-mongodb
    chmod a+x ~/eelments/mongodb/install.d/10-mongodb</pre>

8. Edit 10-nginx and then add the following into it:

    <pre>!/bin/bash
    set -eux
    install-packages mongo-10gen mongo-10gen-server</pre>

9. Create another directory finalise.d which will contain the finalise hooks as follows:
 
    `mkdir –p ~/elements/mongodb/finalise.d`

10. Under finalise.d, create a file 10-mongodb and then change its execute permissions.

    <pre>touch ~/elements/mongodb/finalise.d/10-mongodb
    chmod a+x ~/elements/mongodb/finalise.d/10-mongodb</pre>

11. Edit 10-nginx and then put the following into it:

    <pre>!/bin/bash
    set -eux
    rm -Rf /etc/yum.repos.d/mongodb.repo</pre>

#### Using mongodb element to create RHEL Image
To create a RHEL image having mongodb pre-installed with associated kernel and ramdisk, use the following command:

    disk-image-create –o <image_prefix> –a amd64 –u base rhel baremetal mongodb

This creates a disk image file named base.qcow2. You can now publish this disk image to HP Cloud OS Distributed Network.

