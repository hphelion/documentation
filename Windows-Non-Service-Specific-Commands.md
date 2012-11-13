---
layout: default
title: "Windows Non-Service Specific Commands"
permalink: /cli/windows/commands/

---
# Windows Non-Service Specific Commands

The Windows PowerShell CLI commands (also sometimes called "cmdlets") allow you to access and control the HP Cloud services from your Windows command line.  There are commands that are specific to each type of service you are accessing--[compute](/cli/windows/compute), [object storage](/cli/windows/containers-and-folders), [CDN](/cli/windows/reference#CDN), and so on--as well as other commands that are not reliant on a particular service, or work across multiple different service types. 

For a complete list of the commands available to you, please take a look at the full CLI Reference](/cli/windows/reference) page; the commands listed on that page are organized based on service.  In addition, for examples of how to use commands on a per-service basis, just surf to the appropriate examples page, listed in the right-hand navigation bar at the top of this page.

The following commands are not specific to any particular service:

* [get-version](/cli/windows/reference#getversion)
* [get-notes](/cli/windows/reference#getnotes)
* [set-credentials](/cli/windows/reference#setcredentials)
* [get-catalog](/cli/windows/reference#getcatalog)
* [get-config](/cli/windows/reference#getconfig)
* [set-config](/cli/windows/reference#setconfig)
* [get-zone](/cli/windows/reference#getzone)
* [get-zones](/cli/windows/reference#getzones)
* [set-zone](/cli/windows/reference#setzone)

The following commands function across multiple services:

* [get-metadata](/cli/windows/reference#getmetadata)
* [set-metadata](/cli/windows/reference#setmetadata)

For a complete list of the Windows PowerShell CLI commands along with their descriptions, please take a look at the [CLI Command Reference](/cli/windows/reference) page.

**Note:** When referencing an argument, like a container name, that has a space, use quotes to access that resource. For example:
     
     PS: HPCS:\> cd "my container:"
     PS: HPCS:\> new-container "my new container"