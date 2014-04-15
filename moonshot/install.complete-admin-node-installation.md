---
layout: default
title: "Complete Admin Node Installation"
permalink: /cloudos/moonshot/install/complete-admin-node-installation/
product: moonshot

---


<script> 
 
function PageRefresh { 
onLoad="window.refresh" 
} 
 
PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/install/customize-networks/">&#9664; PREV</a> | <a href="/cloudos/moonshot/install/">&#9650; UP</a> | <a href="/cloudos/moonshot/install/create-cloud/">NEXT &#9654;</a> </p>

# Complete Admin Node Installation

This topic describes the steps to complete the Admin Node installation. These steps are required. 

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"><b>Caution:</b> Be sure the values for the Prerequisites, Connections, and Networks are what you need, before you follow the steps in this topic. Once you click Complete Install, the dialogs are read only. If you want to make changes, you need to start over by re-installing the Admin Node.  </p> 

To complete the Admin Node installation:

1. On the Operational Dashboard, select the <b>Environment</b> tab > <b>Complete Install</b>.

2. On the confirmation page, specify the following information.

 a. **Domain Name:** Enter the top-level domain name for your cloud. By default, it is set to <b>cloudos.local</b>. The name you provide must consist of lowercase characters with no numbers or special characters. It may end in any valid web domain type, such as (but not limited to) .com, .org, .net, .edu, .mil, .gov. 

 b. **Network Mode:** The Network Mode is <b>Dual</b> by default. Dual network mode needs two Ethernet cards and allows you to completely separate traffic to/from the admin network and to/from public network.
 
3. Click **Complete Install**. This action installs underlying components, such as TFTP Boot, DHCP, DNS, NTP servers, and monitoring tools, on the Admin Node. 
This may take several minutes. A working status message displays in the Setup Complete column.

4. The Operational Dashboard displays a working status message in the Install Complete column. **Note:** Any failure during this part of the process requires rebuilding the Admin Node through the bootable ISO. 

5. (Optional) Click **Show Install Log** to view the install activity in the /var/log/install.log, which appears on the bottom of the window.

6. (Optional) Click **Refresh** to monitor the install progress.

7. After the Admin Node is installed, the screen will display the timestamp in the Install Complete column. The Complete Install button is replaced by the **Continue...** button.

9. Click **Continue...** to add the Cloud tab to the Operational Dashboard, which allows you use additional Operational Dashboard dialogs to create your cloud and compute regions. 

## Next Step

Now that you have installed the Admin node, you can [Manage Nodes and Create a Cloud](/cloudos/moonshot/install/create-cloud/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

