---
layout: default
title: "UNIX CLI for HP Helion Public Cloud Installation"
permalink: /cli/unix/install/
product: unix-cli
published: false

---
<!--PUBLISHED-->
# UNIX CLI for HP Helion Public Cloud Installation for v12.12

___________________

###Important Notice###

On November 4, 2013, the UNIX CLI was moved into its End-of-Life Cycle process toward final deprecation. During this 6-month transition time:

* New and existing customers are encouraged to migrate to the OpenStackClient (Unified) CLIs or the OpenStack command-line clients for each respective service
* No new feature requests will be honored
* Bug reports will be accepted

HP Helion Public Cloud has contributed the Unix CLI back to the open source community, and you can get support, access the documentation, and download the source code [here](https://github.com/hpcloud/unix_cli).

_________________________________________


Before you can begin working with the UNIX CLI for HP Helion Public Cloud, you have to install the package (of course!).  The instructions below work for Ubuntu, MacOS X, and CentOS installations.  Take a look at the [UNIX CLI for HP Helion Public Cloud - Release Notes](/cli/unix/release-notes/) for the latest features.

[You can download the latest version of the UNIX CLI for HP Helion Public Cloud software here (Version 1.9.1)](/file/hpcloud-1.9.1.gem)!

To install the UNIX CLI for HP Helion Public Cloud software, follow these steps:

1. Start by [installing](/bindings/fog/install/) the [Ruby Fog Bindings for HP Helion Public Cloud](/bindings/fog/) software on which the UNIX CLI for HP Helion Public Cloud depends.

2. Download and install the UNIX CLI for HP Helion Public Cloud gem using curl:

        curl -sL https://docs.hpcloud.com/file/hpcloud-1.9.1.gem >hpcloud.gem
        sudo gem install hpcloud.gem

3. Verify the installation:

        hpcloud info

    This shows you the version info for the installation.  In addition, you can type the command

        hpcloud

   If you see a listing of available commands similar to that shown below, your installation was successful:

        Tasks:
        hpcloud account:setup                                            # set up or modify your credentials
        hpcloud acl <object/container>                                   # view the ACL for an object or container
        hpcloud acl:set <resource> <acl>                                 # set a given resource to a canned ACL
        hpcloud addresses                                                # list of available addresses
        hpcloud addresses:add                                            # add or allocate a new public IP address
        . . .

4. Once installation is complete you can set up your account:

        hpcloud account:setup

You can find the values for these variables on through the [HP Helion Public Cloud Console](https://horizon.hpcloud.com). Click the project menu and select *Manage Access Keys* and *Roles and API Endpoints*.  

<img src="media/api_keys-2.jpg" width="580" height="471" alt="" />

Please be sure to confirm the default values for `Auth Uri` and your various zones and regions where services are activated.

Now that you've finished installing the software package, it's time to [perform a few configuration steps](/cli/unix/configuration/)!

## Uninstalling ##  {#Unistalling}

Its recommended that you uninstall a previous version prior to upgrading. To uninstall:

        gem uninstall hpcloud


##Related topics

* [Account Configuration](/cli/unix/configuration/)
* [Advanced Account Management](/cli/unix/account-management/)
* [Compute Examples](/cli/unix/compute/)
* [Object Storage Examples](/cli/unix/object-storage/)
* [CDN Examples](/cli/unix/cdn/)
* [Block Storage Examples](/cli/unix/block-storage/)
* [Volume Management](/block-storage/volume/)
* [DNS Examples](/cli/unix/dns/)
* [CLI Reference](/cli/unix/reference/)
