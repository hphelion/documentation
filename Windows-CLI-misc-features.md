---
layout: default
title: "Windows CLI: misc-features"
permalink: /cli/windows/misc/

---
# Windows CLI: misc-features

#HP-Cloud Object Storage Powershell Tutorial: Changing Response Formats
##Changing Response Formats

Each command that you issue through the Provider or through a cmdlet will write out the response returned from the server in an easy to understand, human readable format. For a command line tool, this is the behavior one would expect. The CLI can also reformat each response
depending on your need. This is accomplished through the Set-Format cmdlet. With this cmdlet you can specify the response to be one of three formats

+ Data (the default)
+ XML
+ JSON

This cmdlet will take effect for the duration of the Session only.

**Example: XML Based Responses**

This example shows how we can quickly produce an XML file of what we find in the test folder. In addition, output received from cmdlets adhere to the format as well. Note
the response of the "ls" command.

<img src="media/SetFormatXML.png" width="580" height="573" alt="" />

A quick JSON example.

<img src="media/SetFormatJSON_0.png" width="580" height="390" alt="" />

##Changing Configuration Files

This system persist its settings in the CLI.config file located 
in the users application directory. This file is important as it's used for storing
Credentials, connection information such as addresses and timeout values, and various other settings.
Each time the shell loads, this file is opened and it's settings are used throughout the session. There may be times when
you wish to temporarily change these settings to accommodate impersonation, environment change (Pro, QA etc) or other testing scenarios.
This can be done in one of two ways

+ Per item 
+ Per Configuration

First, to see what the current configuration you are running under use the Get-Config cmdlet.  Assume that connectivity issues have required us to increment the http timeout period for each connection. This specific value can be altered via the Set-Config cmdlet.

<img src="media/SecureGetConfig2.png" width="580" height="573" alt="" />

If you want to revert back to the defaults as defined in your CLI.config file just issue the following command.

           Set-config -resetcfg

In addition to changing individual configuration items, you can also swap in entire full configuration environments by inserting a new configuration file with the <strong><font face="courier">set-config -s</strong></font" command.  This is useful if you are using multiple environments at your site--for example, you have a set of credentials that you use for development, but a different set of credentials for performing testing.  Substituting in a different config file gives you a quick way to switch back and forth between those environments. 

When you set to a new config file and the new file contains different credentials, you have to re-evaluate the list of Containers that the current user has access to. Changing your credentials is equivalent to changing your identity, and you may own just a small subset of Containers after the change. In this example you can see this rebinding in action.

<img src="media/SET-CONFIGFILE.jpg" width="580" height="547" alt="" />

## Viewing Your Service Catalog

If you want to take a look at your service catalog--for example, if you have modified some of your configuration credentials, and have authenticated them--you can use the <strong><font face="courier">get-config -v</strong></font> command, as shown below: 

<img src="media/viewing%20config%20file.jpg" width="580" height="547" alt="" />

This command provides you with all the service catalog information for your most-currently authenticated credential set.

##Finding an Objects Location

The contents of the Object store are URI addressable given that you have the proper permissions to view the resource. If you would like a quick way to load
the object into your browser, a fully qualified URI can be obtained with the Get-Uri cmdlet.

<img src="media/get-location_0.png" width="580" height="376" alt="" />

Note : When you issue this command the URI is also pasted to the Windows clipboard for your convenience. If you want to disable this behavior simply set the CLI.config
option entitled PasteGetURIResultsToClipboard to false.

##Getting Version Information

It may be useful at times to know what version of the product you are using. Just issue the Get-Version command to get the main assembly location, product and CLR version.

<img src="media/GetVersion.png" width="580" height="223" alt="" />

## Using Another User's Credentials

If you want to use the credentials of a particular user for a session ("imitating" that user), you can use the command <strong><font face="courier"> set-credentials</strong></font>.  The <strong><font face="courier"> set-credentials</strong></font> command allows you to define the access key, secret key, and tenant key for a session:

        set-credentials -ak Access-Key -sk Secret-Key -t Tenant-ID

Where you choose your desired values for <font face="courier"><strong>Access-Key</font></strong>, <font face="courier"><strong>Secret-Key</font></strong>, and <font face="courier"><strong>Tenant-ID</font></strong>.

##Viewing the Release Notes

The Get-Notes command gives you the ability to view release notes for the current version (no arguments), a specific version (-v), or all past versions of the product (-all).

<img src="media/GetNotes.png" width="580" height="544" alt="" />

Recommended Links

* [Index](/cli/windows) 
* [Command Line Reference](/cli/windows/reference) 
