---
layout: default
title: "Complete Admin Node Installation (Required)"
permalink: /cloudos/moonshot/install/complete-admin-node-installation/
product: moonshot

---


<script> 
 
function PageRefresh { 
onLoad="window.refresh" 
} 
 
PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/install/customize-network-settings/">&#9664; PREV</a> | <a href="/cloudos/moonshot/install/">&#9650; UP</a> | <a href="/cloudos/moonshot/install/create-cloud/">NEXT &#9654;</a> </p>

# Complete Admin Node Installation (Required)

This topic describes the steps to complete the Admin Node installation. These steps are required. 

> **Caution:** Be sure the values for the Prerequisites, Server Types, Connections and Networks are what you need, before you follow the steps in this topic. Once the install process is triggered, the settings in preceding steps cannot be changed. If you want to make changes, you need to start over by re-installing the Admin Node.  

To complete the Admin Node installation:

1. On the Operational Dashboard, select the Environment tab > Complete Install.

3. On the confirmation page, specify the following information.

 a. **Domain Name:** Enter the top-level domain name for your cloud. The name must consist of lowercase characters with no numbers or 
 special characters. In the current release, it must end in .com, .org, .net, .edu, .mil, .gov, or .local. <!-- It may end in any valid web domain type, such as (but not limited to) 
.com, .org, .net, .edu, .mil, .gov. -->

 b. **Network Mode:** Select the displayed option, Dual, Single, or Teaming. For related details, see [Customize Network Settings (Required)](/cloudos/moonshot/install/customize-network-settings). 
 <!-- 
 The DUAL / SINGLE option is based on your network infrastructure and previously 
 selected choices. If you have separate wired networks for admin, os_sdn and public, you want DUAL. The recommended practice is to use DUAL. 
 **Note:** The Operational Dashboard displays the option based on the following rules. 
 If the os_sdn and public networks were both previously set to VLAN=True, the only displayed choice for Network mode is SINGLE. 
 If os_sdn or public were previously set to VLAN=False, the only displayed choice for Network mode is DUAL.
 --> 
 
 c. **IPMI/BMC Network Status:** Select Disabled. (The IPMI/BMC feature is for testing purposes only.)

4. Click **Complete Install**. This action installs required software on the Admin Node. This will take several minutes.

5. The Operational Dashboard displays a working status message in the Install Complete column. **Note:** Any failure during this part of the process requires rebuilding the Admin Node through the bootable ISO. 

6. (Optional) Click **Show Install Log** to view the install activity in the /var/log/install.log, which appears on the bottom of the window.

7. (Optional) Click **Refresh** to monitor the install progress.

8. After the Admin Node is installed, the screen will display the timestamp in the Install Complete column. The Complete Install button is replaced by the **Continue...** button.

9. Click **Continue...** to add the Cloud tab.

## Next Step

Now that you have installed the Admin node, you can [Create a Cloud](/cloudos/moonshot/install/create-cloud/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

