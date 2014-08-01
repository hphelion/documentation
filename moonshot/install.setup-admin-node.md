---
layout: default
title: "Install and Set Up the Admin Node"
permalink: /cloudos/moonshot/install/install-setup-admin-node/
product: moonshot

---
<!--PUBLISHED-->


<script> 
 
function PageRefresh { 
onLoad="window.refresh" 
} 
 
PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/install/before-you-install/">&#9664; PREV</a> | <a href="/cloudos/moonshot/install/">&#9650; UP</a> | <a href="/cloudos/moonshot/install/admin-node-prerequisites/">NEXT &#9654;</a> </p>

# Install and Set Up the Admin Node

This topic explains how to install the Admin Node, which launches the Operational Dashboard and helps in setting up the environment to create a cloud. 

* [Set Up the Admin Node](#set-up-the-admin-node)

* [Boot the Admin Node Using the Cloud OS ISO](#boot-the-admin-node-using-the-hp-cloud-os-for-moonshot-iso)

* [Launch the Operational Dashboard](#launch-the-operational-dashboard)

## Set Up the Admin Node

You can install the Admin Node only on a virtual machine. Use the following steps to create a virtual machine in an existing or a new hypervisor 
infrastructure:
 
1.	Configure the hypervisor host's networking as shown in the Deployment Architecture. The host must provide connectivity to the Admin Node (virtual machine) on an isolated private network and also to all the nodes' port eth0. The Admin Node must also have connectivity to a routable network for Internet access. 

2.	Create a virtual machine (Admin Node) with the hardware configuration suggested in Cloud Infrastructure section. The following configuration must be reviewed during this step: 
 * Ensure the Admin Node's primary NIC is bridged or connected to the admin network and the second NIC is bridged or connected to a routable network for Internet access. 
 * On a KVM based VM, for the disk configuration, ensure you set it to the IDE/SCSI type as this is the supported type.  
 <!-- **Note:** If your hypervisor is KVM, ensure the virt type is set to KVM. --> 

3. Download the HP Cloud OS for Moonshot ISO to the host's local file system or data store. 

4. Configure the Virtual Machine (VM) Admin Node to point to the HP Cloud OS for Moonshot ISO as a CD/DVD drive or install media ISO image. 


## Boot the Admin Node Using the HP Cloud OS for Moonshot ISO

The Admin Node is booted using HP Cloud OS for Moonshot *.iso.  Follow these steps:

1.	Ensure that ISO image is located in the host's local file system or data store.

2.	Edit the settings of the Admin Node (Virtual Machine) so that the CD ROM points to the Cloud OS ISO image.

3.	Switch on the power for the Admin Node.  The machine begins to boot.

4.	To view the boot process, select the Console Tab of the Virtual Machine.

5.	In the <b>Full Name</b> of the new user box, enter the name. This is the name that will be used while sending emails or will be used at any other place where the full user name is displayed. 

6.	In the <b>Username</b> for your account box, enter a user name. This is the name with which you can log into your Admin Node. **Note:** The user name should start with a lowercase alphabet and can include numbers also.  

7.	In the <b>Password</b> box, enter the password. **Note:** The password should be a mix of letters, numbers and special characters and should be changed at regular intervals.

8.	Verify your password.

9. The Admin Node Login screen is displayed once the installation completes. Enter your username and password.

10.	Click CTRL+ALT to regain the control of your cursor.  **Note:** This step is specific to VMware and might not be necessary in your client. 

11.	Power DOWN the Admin Node Virtual Machine.

12. Edit the Virtual Machine's settings so that it will not boot from the ISO again. Example:

 <img src="media/cos4ms-do-not-boot-again-from-iso.jpg" title="Do not boot from ISO again" />

13. Power up the Virtual Machine again.

At this point, HP Cloud OS for Moonshot is installed on the Admin Node. 


## Launch the Operational Dashboard

To launch the Operational Dashboard:

1. From a Windows or Linux client that has access to the Admin Node, open a Mozilla Firefox or Google Chrome browser.

2. Make sure the browser has the following IP addresses set as proxy exceptions:
  
 192.\*;10.\*;localhost;127.0.\*

3. In the browser, enter **https://192.168.124.10:9000** to launch the Operational Dashboard user interface, which is running on the Admin node.

4. On the Environment tab, review the types of prerequisites, servers, connections, and networks in your environment.

## Next Step

Proceed to the next topic, [Set the Admin Node Prerequisites](/cloudos/moonshot/install/admin-node-prerequisites/), to begin the process of setting up and installing the Admin node.  

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

