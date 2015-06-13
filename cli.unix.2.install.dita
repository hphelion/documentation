---
layout: default
title: "UNIX CLI for HP Helion Public Cloud Installation"
permalink: /cli/unix/2/install/
product: unix-cli
published: false

---
<!--PUBLISHED-->
# UNIX CLI for HP Helion Public Cloud v13.5 Installation

If you are using v12.12, click [here](https://docs.hpcloud.com/cli/unix/install) for documentation.
___________________

###Important Notice###

On November 4, 2013, the UNIX CLI was moved into its End-of-Life (EOL) Cycle process toward final deprecation. Please be aware that this does not mean that the UNIX CLI is "going away", but simply that HP Helion Public Cloud is relinquishing its ownership of this CLI and, instead, making it available on the [HPCloud Github](https://github.com/hpcloud/unix_cli) repository. We encourage existing customers to consider migrating to the OpenStackClient (Unified) CLIs. As such, during this 6-month transition timeframe, HP Helion Public Cloud will be dedicating engineering efforts around the OpenStackClient CLI as the primary Unified CLI of choice for development around your OpenStack cloud services.

We wanted to ensure you were aware of the changes that may affect you during this 6-month transition time:

+ The UNIX CLI has moved to the HP Helion Public Cloud Github repository

  + In order to encourage development by the community, HP Helion Public Cloud is sharing it with the community as open source, hosted on [https://github.com/hpcloud/unix_cli](https://github.com/hpcloud/unix_cli).
 
  + However, [links to 12.12 and 13.5 UNIX CLI downloads](#downloads), and all documentation, are still currently available on docs.hpcloud.com, as usual.

+ Bugs will be addressed.
 
  + Although the CLI has moved into the open source community, showstoppers and significant defects will be examined and addressed by the HP Helion Public Cloud SDK/CLI team on a case-by-case basis.

HP Helion Public Cloud has contributed the Unix CLI back to the open source community, and you can get support, access the documentation, and download the source code [here](https://github.com/hpcloud/unix_cli).

_________________________________________

Before you can begin working with the UNIX CLI, you have to install the package (of course!).  The instructions below work for Ubuntu, MacOS X, and CentOS installations.  Take a look at the [HP Helion Public Cloud Unix CLI - Release Notes](/cli/unix/release-notes/) for the latest features.

To install the UNIX CLI software, follow these steps:

1.  Download and install the HPCloud Unix CLI gem:

        sudo gem install hpcloud

2. Verify the installation:

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

3. Once installation is complete you can set up your account:

        hpcloud account:setup

You can find the values for these variables through the [HP Helion Public Cloud Console](https://horizon.hpcloud.com). Click the project menu and select *Manage Access Keys* and *Account Info*.  

<img src="media/api_keys-2.jpg" width="580" height="471" alt="" />

Please be sure to confirm the default values for `Auth Uri` and your various zones and regions where services are activated.

Now that you've finished installing the software package, it's time to [perform a few configuration steps](/cli/unix/configuration/)!

## Uninstalling ##  {#Unistalling}

Its recommended that you uninstall a previous version prior to upgrading. To uninstall:

        sudo gem uninstall hpcloud

