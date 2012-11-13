---
layout: default
title: "HP Cloud Services UNIX CLI Installation"
permalink: /cli/unix/install/

---
# HP Cloud Services UNIX CLI Installation

Before you can begin working with the UNIX CLI, you have to install the package (of course!).  The instructions below work for Ubuntu, MacOS X, and CentOS installations.  Take a look at the [HP Cloud Unix CLI - Release Notes](/cli/unix/release-notes) for the latest features.

<!-- list of prerequisites? -->

To install the UNIX CLI software, follow these steps:

1. Start by [installing](/bindings/fog/install) the [HP Cloud Ruby Fog Binding](/bindings/fog) software on which the HP Cloud Unix CLI depends.

2. Download and install the HPCloud Unix CLI gem using curl:

        curl -sL https://docs.hpcloud.com/file/hpcloud-1.2.0.gem >hpcloud-1.2.0.gem
        gem install hpcloud-1.2.0.gem

   You should see output similar to the following:

        bash-3.2$ gem install hpcloud.gem
        Fetching: thor-0.14.6.gem (100%)
        Fetching: builder-3.0.0.gem (100%)
        Fetching: excon-0.13.4.gem (100%)
        Fetching: formatador-0.2.3.gem (100%)
        Fetching: multi_json-1.0.4.gem (100%)
        Fetching: mime-types-1.19.gem (100%)
        Fetching: net-ssh-2.5.2.gem (100%)
        Fetching: net-scp-1.0.4.gem (100%)
        Fetching: nokogiri-1.5.5.gem (100%)
        Building native extensions.  This could take a while...
        Fetching: ruby-hmac-0.4.0.gem (100%)
        Successfully installed thor-0.14.6
        Successfully installed builder-3.0.0
        . . .

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

You can find the values you need for your setup by clicking the [`API Keys`](https://console.hpcloud.com/account/api_keys) button in the [Console Dashboard](https://console.hpcloud.com/dashboard).  

<img src="media/api%20keys-2.jpg" width="580" height="471" alt="" />

Please be sure to confirm the default values for `Auth Uri`, `Compute zone`, `Storage zone`, `CDN zone`, and `Block zone`.

Now that you've finished installing the software package, it's time to [perform a few configuration steps](/cli/unix/configuration)!

## Unistalling ##  {#Unistalling}

Its recommended that you uninstall a previous version prior to upgrading. To uninstall:

        gem uninstall hpcloud