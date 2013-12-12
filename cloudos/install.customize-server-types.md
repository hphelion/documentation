---
layout: default
title: "Customize Server Types (Optional)"
permalink: /cloudos/install/customize-server-types/
product: cloudos

---

<a name="_top"> </a>

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/install/admin-node-prerequisites/">&#9664; PREV</a> | <a href="/cloudos/install/">&#9650; UP</a> | <a href="/cloudos/install/customize-network-settings/">NEXT &#9654;</a> </p>



# Customize Server Types (Optional)

This topic describes the steps to customize the server types. These steps are optional. 

**Caution:** If you plan to customize the servers, you must do it before performing the steps in [Complete the Admin Node Installation](/cloudos/install/complete-admin-node-installation/). 
After that, the server type dialogs in the HP Cloud OS Operational Dashboard are read only. Once the install process is triggered, no changes can be made. 
If you want to make changes, you need to start over by re-installing the Admin Node.  

## Introduction

The Server Types panel allows you to capture new or use existing server definitions about the networking ports for various servers in your bare-metal cloud environment. If all servers in your
cloud are the same machine type (homogeneous nodes), you are not required to configure anything in this view. HP recommends that you keep and accept the default settings.

However, if the servers in your cloud are different types of machines, you may be required to use a Linux utility such as dmidecode to get the pattern and CLI commands to determine the bus
addresses of your server's network ports.

Here is a way to get the values for Server Name Pattern and Bus Order:

Server Name Pattern:

    `dmidecode | grep "Product Name"`

Bus Order (for UbuntuOS):

    `ls -l /sys/class/net | egrep pci | sed -e 's/^.*pci//' -e 's%/net.*$%%'`

Obtaining the values is necessary to define the correct order of those ports for the various server types so that all the servers have the same enumeration of network ports (0, 1, 2, 3 and so on) across the cloud. If
you do not configure the server types for a cloud with heterogeneous nodes in this way, you will experience networking failures because the machines will not have the same network port
enumeration order.

> **Tip:** Based on your network and hardware infrastructure, you can accept defaults or customize Server Types.

## Create or Edit the Server Types

To create or edit the server types:

1. On the Operational Dashboard, select the Environment tab > Server Types.

2. Click Edit Server Types for the server type you want to customize. The Edit Server Definition opens.

3. Click Add Bus Order to add a blank bus order text box in which you type the new bus order related to the server type.

4. Add the appropriate number of bus orders for the server type.

5. To delete a bus order, click the checkbox next to the bus order and click Delete Bus Order.

6. Click Update Server Definition to save the updated server definition.

## Next Step

Proceed to the next topic, [Customize Network Connections (Optional)](/cloudos/install/customize-network-connections/).

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


