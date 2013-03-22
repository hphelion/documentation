---
layout: default
title: Installing And Usint The Swift CLI Client
permalink: /object-storage/tutorial/installing-and-using-swift-cli-client/
product:
  - object-storage

---
# Installing And Usint The Swift CLI Client

This article describes the steps you'll need to follow in order to download files from and upload files to your HP Cloud object storage containers from your *nix command-line.

Specifically, it describes how to do the following:

1. Install the command-line swift client
1. Use the swift client to list containers and list container contents
1. Use the swift client to download the contents of a container
1. Use the swift client to upload files to a container
1. Simply calls to the swift client with bash scripts

This article assumes that you already have an HP Cloud account set up and that you have already created a container.

## (1) Install the command-line swift client from OpenStack.

### 1a: Install the python-setuptools package on your machine.


On Ubuntu, you can do this with:

    sudo apt-get install python-setuptools
  
If you're distro's package-manager doesn't have a repository for installing the python-setuptools package, you can install them by following the instructions on the setuptools package homepage: http://pypi.python.org/pypi/setuptools

### 1b: Install the OpenStack's python keystone client for authentication

On Ubuntu, you can just do it with:

    apt-get install python-keystoneclient
  
If you're distro's package-manager doesn't have a repository for installing the python-keystoneclient package, you could (NOT RECOMMENDED) setup the latest development by cloning a copy of the github repository and doing the following: 

    git clone https://github.com/openstack/python-keystoneclient.git
    cd python-keystoneclient
    python setup.py build
    sudo python setup.py install
  
Again, this is NOT RECOMMENDED due to this revision's problems with it's implementation of 2-way SSL encryption.  However, if you're willing to troubleshoot the implementation, I'm sure the OpenStack project would very much appreciate the contribution.
  
My suggestion, if you're on a non-debian distro, is to directly download and install the version installed by the Ubuntu 12.04 package manager:

    wget http://githubredir.debian.net/github/openstack/python-keystoneclient/2012.1.tar.gz
    tar xvzf 2012.1.tar.gz
    cd openstack-python-keystoneclient-04f8e5e
    python setup.py build
    python setup.py install 
  
### 1c: Finally, you'll want to download and install the python-swiftclient:

(First, make sure to have the python-setuptools package installed; see above)

    git clone https://github.com/openstack/python-swiftclient.git
    cd python-swiftclient
    python setup.py build
    sudo python setup.py install

One way to tell whether or not you've successfully installed the swift client is to ask "which swift".  If you get back a file path to the executable, then you'll know you have your swift client installed.

Feel free to take a look at help info for the swift command line utility:

    swift --help
  
## (2) Try listing the names of your containers.

This will require having a few of your HP Cloud account credentials, which you can access from your HP Cloud Management Console (in the console at https://console.hpcloud.com, go to *Account --> API Keys*):

- the Endpoint URL for the Identity services
- your username (this will be the email associated with your HPCS account)
- the Endpoint URL for Object Storage
- the tenant ID 
- the password to your HPCS account

The command, with all of your authentication and identifcation parameters, will take the following form (with placeholders in all caps):

    swift -A IDENTITY_SERVICE_ENDPOINT_URL -V 2.0 --os-username=YOUR_EMAIL@EXAMPLE.COM --key=YOUR_PASSWORD --os-storage-url=YOUR_OBJECT_STORAGE_ENDPOINT_URL --os-tenant-id=YOUR_TENANT_ID list

An example with more realistic looking parameters might look like this:

    swift -A https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/ -V 2.0 --os-username=my_email@example.com --key=my_password --os-storage-url=https://region-a.geo-1.objects.hpcloudsvc.com/v1.0/13632180903902 --os-tenant-id=my_tenant_id list

I can use the swift "list" command to also list the contents of a specific container by simply specifying a container name at the end of the swift "list" subcommand.  Suppose I have a container called "my_first_container".  Then I would enter the following to list that container's filenames:

    swift -A https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/ -V 2.0 --os-username=my_email@example.com --key=my_password --os-storage-url=https://region-a.geo-1.objects.hpcloudsvc.com/v1.0/13632180903902 --os-tenant-id=my_tenant_id list my_container

You may see the following message, when you run a swift client command:

    No handlers could be found for logger "keystoneclient.v2_0.client"

You can ignore this for now.  

However, if you see an error message that says that you're not authorized (and you're sure that you've entered the proper credentials) or you see an error message about verifying SSL certificates, then it most likely means you've installed the latest version from the OpenStack python-keystone client's master branch, which (at least as of this writing in October 2012), is buggy in its implementation of 2-way SSL encryption.  Again, my suggestion would be to either to install the version in the Ubuntu repo or to download it directly from the link given above.

## (3) Try downloading contents from a container

In order to do this, you will need the same parameters you needed above in the example give for listing your account's Object Storage containers.

The swift utility will allow you to download files from a container to your current directory with a command in the following format (again, with placeholders in all caps):

    swift -A IDENTITY_SERVICE_ENDPOINT_URL -V 2.0 --os-username=YOUR_EMAIL@EXAMPLE.COM --key=YOUR_PASSWORD --os-storage-url=YOUR_OBJECT_STORAGE_ENDPOINT_URL --os-tenant-id=YOUR_TENANT_ID download CONTAINER_NAME

In my case, this would look something like:

    swift -A https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/ -V 2.0 --os-username=my_email@example.com --key=my_password --os-storage-url=https://region-a.geo-1.objects.hpcloudsvc.com/v1.0/13632180903902 --os-tenant-id=my_tenant_id download my_container

## (4) Try uploading contents to a container

To upload files to a container, you'll need all of the same parameters, but with a different swift operation (the "upload" operation).  You'll also need to specify the directory from which you want to upload files:

    swift -A IDENTITY_SERVICE_ENDPOINT_URL -V 2.0 --os-username=YOUR_EMAIL@EXAMPLE.COM --key=YOUR_PASSWORD --os-storage-url=YOUR_OBJECT_STORAGE_ENDPOINT_URL --os-tenant-id=YOUR_TENANT_ID upload CONTAINER_NAME LOCAL_DIRECTORY_OR_FILE_NAME

## (5) Advanced, more convenient usage

Of course, with so many parameters (mostly for identification and authentication purposes) it can be a bit of a headache to have to enter an entire swift command everytime.  In my case, I typically want to pull a copy of a production site's assets down to a local development environment for website projects.

To speed this up, I usually create a bash script for each project, with these parameters set up:

    #!/bin/bash
    
    swift -A https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/ -V 2.0 --os-username=my_email@example.com --key=my_password --os-storage-url=https://region-a.geo-1.objects.hpcloudsvc.com/v1.0/13632180903902 --os-tenant-id=my_tenant_id download my_container

Of course, you don't want to leave your password lying around in a bash script.  Instead of passing it as a parameter in your script, you actually want to have your script prompt you for it everytime you run it:

    #!/bin/bash
    
    read -sp "Please enter the password for your HP Cloud Services account
    Password:" PASS

    swift -A https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/ -V 2.0 --os-username=my_email@example.com --key=$PASS --os-storage-url=https://region-a.geo-1.objects.hpcloudsvc.com/v1.0/13632180903902 --os-tenant-id=my_tenant_id download my_container

Here, the "read" command in the script promts the user for input, with the message "Please enter the password for your HP Cloud Services account", with the "Password:" phrase on the next-line, followed by an input cursor.

    ~$ ./my_bash_script.sh
    Please enter the password for your HP Cloud Services account
    Password:
    
    No handlers could be found for logger "keystoneclient.v2_0.client"
    
    js/foo.js [headers 0.183s, total 0.189s, 0.310s MB/s]
    css/bar.css [headers 0.202s, total 0.203s, 0.011s MB/s]
    image_uploads/foobar.jpg [headers 0.249s, total 0.250s, 0.040s MB/s]
    
    ~$

Another option for saving yourself from having to enter these parameters at the command line is to set these parameters in your environment variables.  Run "swift --help" for notes on how to do this.
