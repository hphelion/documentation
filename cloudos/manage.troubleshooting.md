---
layout: default
title: "HP Cloud OS Troubleshooting"
permalink: /cloudos/manage/troubleshooting/
product: cloudos

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- Look for passwords --> 

<p style="font-size: small;"> <a href="/cloudos/manage/utilities/">&#9664; PREV</a> | <a href="/cloudos/manage/">&#9650; UP</a> | NEXT &#9654; </p>

# HP Cloud OS Troubleshooting

This topic describes known problems and solutions for the following areas:

* [Troubleshooting Cloud OS ISO](#troubleshooting-cloud-os-iso)

 * [Problem: ISO Error Running on a VM Hosted on a KVM Hypervisor](#problem-iso-error-running-on-a-vm-hosted-on-a-kvm-hypervisor)

* [Troubleshooting Cloud OS Operational Dashboard](#troubleshooting-cloud-os-operational-dashboard)

 * [Problem: Admin node displays the "not ready" (gray) state](#problem-admin-node-displays-the-not-ready-gray-state)
 * [Problem: Create new router fails](#problem-create-new-router-fails)
 * [Problem: When creating a new PXE node, the PXE boot fails with a TFTP timeout error](#problem-when-creating-a-new-pxe-node-the-pxe-boot-fails-with-a-tftp-timeout-error)
 * [Problem: Manage Nodes window not updating the status](#problem-manage-nodes-window-not-updating-the-status)
 * [Problem: Create cloud or compute region fails](#problem-create-cloud-or-compute-region-fails)
 * [Problem: Admin node internet access prerequisites fail to complete](#problem-admin-node-internet-access-prerequisites-fail-to-complete)
 * [Problem: Instance not getting IP from a private network](#problem-instance-not-getting-ip-from-a-private-network)
 * [Problem: Admin node redirects to License page](#problem-admin-node-redirects-to-license-page)
 * [Problem: Fiber-Channel errors when booting node](#problem-fiber-channel-errors-when-booting-node)
 * [Problem: Error in the log during Deploy Cloud](#problem-error-in-the-log-during-deploy-cloud)
 * [Problem: Services not started after controller node is rebooted](#problem-services-not-started-after-controller-node-is-rebooted)
 * [Problem: A Cloud OS solution displays a yellow exception screen](#problem-a-cloud-os-solution-displays-a-yellow-exception-screen)
 * [Problem: Cloud OS does not work after a restart](#problem-Cloud-OS-does-not-work-after-a-restart)
 * [Problem: Compute node not listed in the user-interface](#problem-compute-node-not-listed-in-the-user-interface)
 * [Problem: The time zone in the Controller node is incorrect](#problem-the-time-zone-in-the-controller-node-is-incorrect)
 * [Problem: Compute node fails to install OS (kernel error)](#problem-compute-node-fails-to-install-os-kernel-error)
 * [Problem: Problem creating images using remote location](#problem-problem-creating-images-using-remote-location)
 * [Problem: Problem creating image using image file](#problem-problem-creating-image-using-image-file)
 * [Problem: Unable to launch more instances](#problem-unable-to-launch-more-instances)
 * [Problem: Default route disappears from Controller node](#problem-default-route-disappears-from-controller-node)
 * [Problem: Not possible to log in the dashboard (license has expired)](#problem-not-possible-to-log-in-the-dashboard-license-has-expired)
 * [Problem: Create Cloud failed](#problem-create-cloud-failed)
 * [Problem: Find why Launch Topology fails](#problem-find-why-launch-topology-fails)
 * [Problem: Unauthorized exceptions when navigating in the dashboard](#problem-unauthorized-exceptions-when-navigating-in-the-dashboard)
 * [Problem: Location of the log files](#problem-location-of-the-log-files)
 * [Problem: Launch topology fails and Instance is created but with Error status](#problem-launch-topology-fails-and-instance-is-created-but-with-error-status)
 * [Problem: Complete node internet access prerequisite hangs and then fails](#problem-complete-node-internet-access-prerequisite-hangs-and-then-fails)
 * [Problem: Incorrect Manage Node status prevents use of the node](#problem-incorrect-manage-node-status-prevents-use-of-the-node)

* [Troubleshooting Cloud OS Administration Dashboard](#troubleshooting-cloud-os-administration-dashboard)

 * [Problem: Console Connect timeout issue in the Administration Dashboard](#problem-console-connect-timeout-issue-in-the-administration-dashboard)
 * [Problem: Default Ubuntu cloud image and CirrOS images only show one active network even if multiple networks are specified](#problem-default-ubuntu-cloud-image-and-cirros-images-only-show-one-active-network-even-if-multiple-networks-are-specified)
 * [Problem: Instance resize feature does not work when there is only a single Compute node](#problem-instance-resize-feature-does-not-work-when-there-is-only-a-single-compute-node)

* [Troubleshooting Cloud OS Installation](#troubleshooting-cloud-os-installation)

 * [Problem: Cloud Infrastructure install module proposal fails](#problem-cloud-infrastructure-install-module-proposal-fails)
 * [Problem: Cloud Controller node or Compute Region node displays the "not ready" (gray) state](#problem-cloud-controller-node-or-compute-region-node-displays-the-not-ready-gray-state)
 * [Problem: Stopping services before Cloud OS completes processing jobs can cause a job failure](#problem-stopping-services-before-cloud-os-completes-processing-jobs-can-cause-a-job-failure)
 * [Problem: How to configure Cinder to use RAW multipath devices](#problem-how-to-configure-cinder-to-use-raw-multipath-devices)
 * [Problem: Red screen when installing OS on bare metal nodes](#problem-red-screen-when-installing-os-on-bare-metal-nodes)


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a> 



## Troubleshooting Cloud OS ISO

This section describes the following known problems and solutions for the Cloud OS ISO:

#### Problem: ISO Error Running on a VM Hosted on a KVM Hypervisor

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> The HP Cloud OS ISO shows an error when running on a virtual machine (VM) hosted on a KVM hypervisor. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> ISO </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> No root file system, no root file system is defined. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> This error is due to the format of the virtual disk that is configured for the VM. </td>
</tr>

</table>

##### Solution

Before booting the VM with the HP Cloud OS ISO media, ensure that the virtual disk format is IDE or SCSI.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a> 


## Troubleshooting Cloud OS Operational Dashboard

This section describes the following known problems and solutions for the Operational Dashboard:

* [Problem: Admin node displays the "not ready" (gray) state](#problem-admin-node-displays-the-not-ready-gray-state)
* [Problem: Create new router fails](#problem-create-new-router-fails)
* [Problem: When creating a new PXE node, the PXE boot fails with a TFTP timeout error](#problem-when-creating-a-new-pxe-node-the-pxe-boot-fails-with-a-tftp-timeout-error)
* [Problem: Manage Nodes window not updating the status](#problem-manage-nodes-window-not-updating-the-status)
* [Problem: Create cloud or compute region fails](#problem-create-cloud-or-compute-region-fails)
* [Problem: Admin node internet access prerequisites fail to complete](#problem-admin-node-internet-access-prerequisites-fail-to-complete)
* [Problem: Instance not getting IP from a private network](#problem-instance-not-getting-ip-from-a-private-network)
* [Problem: Admin node redirects to License page](#problem-admin-node-redirects-to-license-page)
* [Problem: Fiber-Channel errors when booting node](#problem-fiber-channel-errors-when-booting-node)
* [Problem: Error in the log during Deploy Cloud](#problem-error-in-the-log-during-deploy-cloud)
* [Problem: Services not started after Controller node is rebooted](#problem-services-not-started-after-controller-node-is-rebooted)
* [Problem: A Cloud OS solution displays a yellow exception screen](#problem-a-cloud-os-solution-displays-a-yellow-exception-screen)
* [Problem: Cloud OS does not work after a restart](#problem-Cloud-OS-does-not-work-after-a-restart)
* [Problem: Compute node not listed in the user-interface](#problem-compute-node-not-listed-in-the-user-interface)
* [Problem: The time zone in the Controller node is incorrect](#problem-the-time-zone-in-the-controller-node-is-incorrect)
* [Problem: Compute node fails to install OS (kernel error)](#problem-compute-node-fails-to-install-os-kernel-error)
* [Problem: Problem creating images using remote location](#problem-problem-creating-images-using-remote-location)
* [Problem: Problem creating image using image file](#problem-problem-creating-image-using-image-file)
* [Problem: Unable to launch more instances](#problem-unable-to-launch-more-instances)
* [Problem: Default route disappears from Controller node](#problem-default-route-disappears-from-controller-node)
* [Problem: Not possible to log in the dashboard (license has expired)](#problem-not-possible-to-log-in-the-dashboard-license-has-expired)
* [Problem: Create Cloud failed](#problem-create-cloud-failed)
* [Problem: Find why Launch Topology ails](#problem-find-why-launch-topology-fails)
* [Problem: Unauthorized exceptions when navigating in the dashboard](#problem-unauthorized-exceptions-when-navigating-in-the-dashboard)
* [Problem: Location of the log files](#problem-location-of-the-log-files)
* [Problem: Launch topology fails and Instance is created but with Error status](#problem-launch-topology-fails-and-instance-is-created-but-with-error-status)
* [Problem: Complete node internet access prerequisite hangs and then fails](#problem-complete-node-internet-access-prerequisite-hangs-and-then-fails)
* [Problem: Incorrect Manage Node status prevents use of the node](#problem-incorrect-manage-node-status-prevents-use-of-the-node)


### Problem: Admin node displays the "not ready" (gray) state

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> You cannot PXE boot new nodes. This problem occurs when you re-install Cloud OS on machines that were previously used with a Cloud OS environment. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin node  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td>    </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> You changed the date on the Admin node or you brought up a previously allocated node to the Admin node.  </td>
</tr>

</table>

##### Solution

1.	Create a new Admin node.
2.	Before setting up the Admin node, be sure to power down all participating nodes that were running controller and compute roles.
3.	After the Admin node is set up, you must use the PXE boot process to power up the participating nodes.

See [Install &amp; Configure Your Cloud](/cloudos/install) for complete instructions. If the nodes boot to the original operating system that was set up with the earlier Admin node, the boot process will cause irreparable damage to the Admin node and the entire process must be restarted.

### Problem: Create new router fails

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> Your attempt to create a new router fails, either in the designer or when manually creating a new router and adding the interfaces.   </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Operational Dashboard  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> Failed to add interface to router &lt;router-name> </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> Your environment already contains a router that is configured to connect the networks you are attempting to connect. Only one router is allowed to connect networks.  </td>
</tr>

</table>

##### Solution

Use the existing router to provision, instead of creating a new one. 


### Problem: When creating a new PXE node, the PXE boot fails with a TFTP timeout error

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> In the Operational Dashboard, the Admin node takes a long time to reboot. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin node   </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td>    </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> This occurs in a few cases after the Admin node is rebooted. </td>
</tr>

</table>

##### Solution

<ol>

<li> Log in to the Admin node and run the following commands:

<pre>
sudo bluepill tftpd stop
sudo bluepill tftpd start
</pre>  

</li>

<li> After these commands have run, PXE boot the nodes.

</ol>



### Problem: Manage Nodes window not updating the status

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> The status of the Manage Nodes window does not update after you perform an operation.  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin node </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td>  N/A  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> The Manage Node window needs to refresh, so it will show updated node status.  </td>
</tr>

</table>

##### Solution

Navigate to other menus, and then back to the Manage Nodes tab to force the display to update.




### Problem: Create cloud or compute region fails



<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> The operation to create a cloud or a compute region fails without a known cause.  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin node  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> Failed  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> One or more of the nodes used wasn't ready to be used or is in a bad state. </td>
</tr>

</table>

##### Solution

1.	Check whether the nodes you are using are in a good status. Use SSH to check:

 * Node not with problem or hanged in PXE boot (PXE-MOF: Exiting Emulex PXE ROM).  In this case, reboot the node and perform another PXE boot.
 * Chef-client running in the node. If no errors occur, re-try the operation. Otherwise, reboot the node and perform another PXE boot. 
 
2.	If SSH does not reveal the problem, check the logs for more information.

<pre>
/var/log/cosmos/cosmos.log
/var/log/apache2/error.log
</pre> 




### Problem: Admin node internet access prerequisites fail to complete



<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> You work through the steps for the Cloud Administration node internet access prerequisite. You click <b>Complete Prerequisite</b>, and a failure message displays.   </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Operational Dashboard  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> Failed completing the Prerequisite.  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> You selected an interface that does not exist in your environment. For example, if your system contains two NICs, (eth0 and eth1), selecting eth2 will cause the prerequisite to fail.
On the Admin node, view the log files for details:

<pre>
/var/log/cosmos/cosmos.log
/var/log/apache2/error.log
</pre>

</td>
</tr>

</table>

##### Solution

* Verify that a public network is configured in the Admin node.
* Redo the steps for Cloud Administration node internet access prerequisite - see "Set Admin Node Prerequisites" in the HP Cloud OS Installation and Configuration Dashboard.
* Correct the proxy entries and/or specify a different proxy host and/or port.

You must do pre-work before starting cloud deployment. If there are any incorrect details, the entire operation must be re-done. 

The pre-work includes:

* Identifying the NIC card sequence for Admin, OS_SDN and Public interfaces on all participating machines. 
* Identifying the private IP range for hosts and guest VMs.
* Identifying the Public IP range for hosts and guestVMs.



### Problem: Instance not getting IP from a private network



<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td>  You create a new private network. New launched instances do not get IP from that network.  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Operational Dashboard  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td>  N/A  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td>   </td>
</tr>

</table>

##### Solution

Restart the network services on the network controller. Execute the command below in the respective node.

<pre>
cd /etc/init.d/
for i in $( ls quantum-* ); do sudo service $i restart; done
</pre>


### Problem: Admin node redirects to License page



<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> Every operation that you execute in the Admin node redirects you to the License page. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin node </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> N/A </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> The license is expired. </td>
</tr>

</table>

##### Solution

Contact HP Support to renew your license. 



### Problem: Fiber-Channel errors when booting node

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> After a node is allocated, a Fiber-Channel (FC) error appears during the operational system boot. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin node </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> Blocked FC remote port timeout: removing rport </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> The blade FC connection is not configured. That causes a timeout, and the port is removed from the OS level. See screen capture. </td>
</tr>

</table>

<img src="media/cloudos-fiber-channel-errors.png" title="Fiber channel errors" /> 


##### Solution

This problem can be ignored and shouldn't cause future problems. In the unlikely event of side-effects, contact HP Support.



### Problem: Error in the log during Deploy Cloud

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> A PXE boot and installation completes with success. However, the Compute node is not listed in the user-interface (UI).   </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin node  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> Crowbar configuration has errors. Please fix and rerun install. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> This is a known message in the logs, which likely does not signify a problem. You should be able to use the cloud.  </td>
</tr>

</table>

##### Solution 

You can ignore this error message. If you experience any other problem during cloud deployment, contact HP Support.


### Problem: Services not started after Controller node is rebooted

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> After you reboot the Controller node, some of the services are not started.  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Controller node  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> N/A  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> This is likely a timing issue, caused by the hardware you use. For example, one possible reason is that your server configuration is less than the minimum required.  </td>
</tr>

</table>


##### Solution

Use SSH to connect to the Controller node. Then use the following commands to learn whether services are started. If a service is stopped, start it manually.

<pre>
for job in $( ls /etc/init.d/nova-* ); do service ${job##*/} status; done
for job in $( ls /etc/init.d/cinder-* ); do service ${job##*/} status; done
for job in $( ls /etc/init.d/quantum-* ); do service ${job##*/} status; done
</pre>



### Problem: A Cloud OS solution displays a yellow exception screen

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> A yellow exception screen occurs when you are navigating in a dashboard.   </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Installation, Administration and Operational Dashboards</td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> Value Error at XYZ </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> The Cloud OS solution could not get specific information, or the information was wrong. See the following screen capture examples. </td>
</tr>

</table>

<img src="media/cloudos-yellow-screen.png" title="Example yellow screen" /> 

#### Solution

Refresh your browser. If the problem persists, contact HP Support.



### Problem: Cloud OS does not work after a restart

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> After you restart all the nodes, the Cloud OS solution doesn't work as before. Services do not work as expected. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin node </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> General problems using the solution. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> Sometimes, after a restart, the services don't start automatically, or services start in a bad state. </td>
</tr>

</table>

#### Solution
 
Check whether all services are running well in the Controller node.  First, declare all the system variables, and then execute:

* <code>keystone user-list</code> (Should 
*  a list of all users.)
* <code>glance index</code> (Should return a list of images.)
* <code>cinder list</code> (Should return a list of volumes, if any were created.)
* <code>quantum agent-list</code> (Should return a list of agents with "happy" status.)
* <code>nova-manage service list</code> (Should return a list of services with "happy" status.)


### Problem: Compute node not listed in the user interface

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> After a successful PXE boot and installation, the Compute node does not display in the user interface. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin node </td>
</tr>

<tr style="background-color: white; color: black;">
<td> N/A </td>
<td>    </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> A Cloud OS network with more than one DHCP server running.  </td>
</tr>

</table>

#### Solution 

If the installation completed without a problem and the node is not listed, probably the node booted using a different DHCP server. The Cloud OS network should be isolated.



### Problem: The time zone in the Controller node is incorrect




<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> By default, the time zone in the Controller node will be different from the time zone in the Admin node.   </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Controller node </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td>  N/A </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> This behavior is by design.  </td>
</tr>

</table>

#### Solution 

Change the time zone in the Controller node to the one you want. Use the following command:

<pre>
pkg-reconfigure tzdata.
</pre>


### Problem: Compute node fails to install OS (kernel error)

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> After you reboot the Controller node, some of the services are not started. The services should be started. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin node </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> N/A  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> The server configuration (hardware) is not supported by the OS.  </td>
</tr>

</table>

#### Solution 

Investigate the problem. Normally, the problem is related to the hardware used. Try an Internet search on the specific error.




### Problem: Problem creating images using remote location



<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> Cannot create an image pointing to an external server, when using the remote location option. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Operational Dashboard  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> Connection was reset </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> Connectivity problem between the server with the image and the Controller node. </td>
</tr>

</table>

#### Solution 

Check whether the Controller node can access the image server. SSH to the server and execute this command:

<pre>
curl -O http://server.ip/image.file
</pre>

If the curl does not work, you know that the server can't access the image. You probably have a proxy issue or no connectivity. Fix the issue and try again.


### Problem: Problem creating image using Image File

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> Cannot create an image pointing to a file that is located on your local system, when using the Image File option. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Operational Dashboard </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> Connection was reset </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> The image is bigger than the supported limit for this specific operation. </td>
</tr>

</table>

#### Solution

You cannot use the Image File option (which is for images on your local system) to upload images bigger than 1.5 GB. 
The solution is to:

1. Win SCP to the Admin node.
2. Upload the image to /tmp/.
3. Change the permission of the file to 777 (chmod 777 /tmp/<image.name>).
4. Move the file to the folder <code>tftpboot</code>.
5. Create the image pointing to this URL (http://<admin.node.ip>:8091/<image.name>).



### Problem: Unable to launch more instances

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> You have created instances successfully. Then "Launch new instance" fails. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Operational Dashboard </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> Quota exceeded for instances: Requested 1, but already used 1 of 1 instances", "code": 413  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> You have reached the limit of instances that are allowed for your project. </td>
</tr>

</table>

#### Solution 

To change the project limits,  see How to Change a Project's Compute or Storage Limits in the *Cloud OS Administration Dashboard Help*.


### Problem: Default route disappears from Controller node



<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> The default route disappears from the Controller node after reboot. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Operational Dashboard  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> N/A </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> This behavior is by design. </td>
</tr>

</table>

#### Solution 

You do not need to do anything. The default route should automatically be re-added within 20 minutes of the node reboot. However, you can manually start the process by connecting to the Controller node and executing the command <code>chef-client</code>.


### Problem: Not possible to log in the dashboard (license has expired)

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> You cannot open or log in to any of the dashboards.   </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin node  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td>  The HP Cloud OS license has expired  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td>  You are attempting to use an expired license. </td>
</tr>

</table>

#### Solution 

Contact HP Support to renew your license, and then add the new license in the 
Admin node (Settings > License).



### Problem: Create Cloud failed

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td>  The operation to create a cloud failed without providing any useful failure information.  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin node </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> N/A </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> Check the logs for indications of a possible cause.  </td>
</tr>

</table>

#### Solution
 
Check the logs below for more information. The logs may help you understand the cause of the error.

<pre>
/opt/dell/crowbar_framework/log/production.log
/opt/dell/crowbar_framework/log/* (for more information)
/var/log/barclamps/*
</pre>



### Problem: Find why Launch Topology fails

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> The operation to create a cloud failed without providing any useful failure information. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin node </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> N/A  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> Check the logs for indications of a possible cause. </td>
</tr>

</table>

####Solution 

Click on the failed topology to see the details of the error. If the message doesn't explain why the provisioning failed, check the 
Cloud OS logs in the Controller node located at:

<pre>
/var/log/eve-requestworker/eve-requestworker.log
/var/log/eve-api/eve-api.log
</pre>


### Problem: Unauthorized exceptions when navigating in the dashboard

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> While navigating through the Operational Dashboard, you see an Unauthorized error, and no items display in the user interface. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Operational Dashboard  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> Unauthorized (HTTP 401) </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> Your session expired, but you did not log out from the Operational Dashboard. </td>
</tr>

</table>

#### Solution

Navigate to another item in the Operational Dashboard menu. If the problem persists, logout and login again. 



### Problem: Location of the log files

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> You want to check the logs or collect the logs for further investigation. However, the logs are not all saved in one place. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td>   </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td>    </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> You need to check all the logs to discover the cause of a failure. </td>
</tr>

</table>

#### Solution

* Admin node logs:

<pre>
  /var/log/cosmos/cosmos.log
  /var/log/apache2/error.log
</pre>

* Deploy Cloud Logs:

<pre>
  /var/log/install*.log
  /var/log/install*.err
</pre>

* Controller node logs:

<pre>
  /var/log/cosmos/cosmos.log
  /var/log/apache2/error.log
</pre>

* Deploying Admin node:

<pre>
  /opt/dell/crowbar_framework/log/production.log
  /opt/dell/crowbar_framework/log/* 
  /var/log/barclamps/* 
</pre>

* Launch Topology Logs:

<pre>
  /var/log/eve-api/eve-api.log
  /var/log/eve-requestworker/eve-requestworker.log
  /var/log/focus-api/focus-api.log
  /var/log/graffiti-api/graffiti.log
</pre>



### Problem: Launch topology fails and instance is created but with error status

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> Your attempt to launch a topology fails, but all the components in the design (for example, router, network, etc.) are successfully created. The instance has an Error status.  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Operational Dashboard </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> N/A </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> This problem is usually because Cloud OS services had a problem executing the operation. Likely, this happened in an I18N environment. </td>
</tr>

</table>

#### Solution

Clean up all the items (for example, router, network, groups, and instance) created by the failed topology launch.  In the Controller node, restart the following Cloud OS services:

<pre>
service eve-requestworker restart
service eve-api restart
</pre>




### Problem: Complete node internet access prerequisite hangs and then fails

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> "Complete the Cloud Administration Node Internet Access" prerequisite hangs for a long time and then fails.  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin node </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> Unable to access the Internet. Check network and proxy settings.  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> The Admin node server can't access the Internet using the proxy information that was used to configure the prerequisite. </td>
</tr>

</table>

#### Solution

1.	Check whether the proxy details are correct. If the details are incorrect, fix them and try again.
2.	Check whether the Admin node has access to the proxy server. If it does not have access, fix the problem and try again.
3.	The last option is to remove the proxy information and complete the prerequisite without the proxy information.



### Problem: Incorrect Manage Node status prevents use of the node

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> After some operations, the Manage Node status remains incorrect, for example "Resetting." The node is not usable. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin node </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> N/A </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> For an unknown reason, the node entered an invalid state, and its status is not being updated. </td>
</tr>

</table>

#### Solution: 

If the node is not in use, shut it down, power it on again, and make it PXE boot again. This should fix the status and set the node to "Not Allocated," allowing you to use the node again.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a> 


## Troubleshooting Cloud OS Administration Dashboard


This section describes the following known problems and solutions for the Administration Dashboard:

* [Problem: Console Connect timeout issue in the Administration Dashboard](#problem-console-connect-timeout-issue-in-the-administration-dashboard)
* [Problem: Default Ubuntu cloud image and CirrOS images only show one active network even if multiple networks are specified](#problem-default-ubuntu-cloud-image-and-cirros-images-only-show-one-active-network-even-if-multiple-networks-are-specified)
* [Problem: Instance resize feature does not work when there is only a single Compute node](#problem-instance-resize-feature-does-not-work-when-there-is-only-a-single-compute-node)


### Problem: Console Connect timeout issue in the Administration Dashboard


<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> In the Administration Dashboard, if you click a provisioned instance and use Internet Explorer to open the Console, a Console Connect timeout issue occurs. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Browser used for the Console in Administration Dashboard. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> Console Connect timeout </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> Microsoft Internet Explorer browser is not supported. </td>
</tr>

</table>

#### Solution

Only use Google Chrome 14 or Mozilla Firefox 6 to open the Console.



### Problem: Default Ubuntu cloud image and CirrOS images only show one active network even if multiple networks are specified

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> The default Ubuntu cloud image and CirrOS images have only one active NIC in their network configuration. If you specify multiple VNICs (networks) when creating a VM, only the first interface is used. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Administration Dashboard  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td>    </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> The default number of networks for the Ubuntu cloud image and CirrOS images is one. </td>
</tr>

</table>

#### Solution

There are two ways to make the second NIC active.

<ol>

<li>Bring up eth1 manually. 
<p>Place the entry for the eth1 in /etc/network/interfaces file to make it persistent across reboots.</p>
<p>Sample eth1 entry:</p>
<pre>
auto eth1
iface eth1 inet dhcp 
dhclient eth1 
</pre>
<p> (The last command above will query for the DHCP ip for eth1.) </p> </li>

<li>Create a custom image with 2 active NICs. 

<p>To do this, specify both eth0 and eth1 in the ./etc/network/interfaces file while creating an image.</p>  </li>

</ol>



### Problem: Instance resize feature does not work when there is only a single Compute node


<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> In a cloud with only one Compute node, you attempt to resize an instance to a different flavor. The operation fails. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Browser used for the Console in Administration Dashboard. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> N/A </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> Instance resize only works when your environment includes multiple Compute nodes. </td>
</tr>

</table>

#### Solution

Use this feature only if your HP Cloud OS environment includes multiple Compute nodes.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a> 


## Troubleshooting Cloud OS Installation


This section describes the following known problems and solutions for the Installation Dashboard:

* [Problem: Cloud Infrastructure install module proposal fails](#problem-cloud-infrastructure-install-module-proposal-fails)
* [Problem: Cloud Controller node or Compute Region node displays the "not ready" (gray) state](#problem-cloud-controller-node-or-compute-region-node-displays-the-not-ready-gray-state)
* [Problem: Stopping services before Cloud OS completes processing jobs can cause a job failure](#problem-stopping-services-before-cloud-os-completes-processing-jobs-can-cause-a-job-failure)
* [Problem: How to configure Cinder to use RAW multipath devices](#problem-how-to-configure-cinder-to-use-raw-multipath-devices)
* [Problem: Red screen when installing OS on bare metal nodes](#problem-red-screen-when-installing-os-on-bare-metal-nodes)


### Problem: Cloud Infrastructure install module proposal fails

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> An error message displays and the status turns red when a proposal fails. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Installation Dashboard </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> Failed to apply the proposal to: &lt;Cloud Controller Node name> </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> There are several possible causes. See the Solution section. </td>
</tr>

</table>

#### Solution

Try applying the proposal again. If that fails:

* Deactivate the proposal.
* Delete the proposal and create it again.
* SSH in to the Admin node using the credentials: crowbar/crowbar.
* Review the log files /opt/dell/crowbar_framework/log/production.log and &lt;MacAddressHostname>.chef.log.
* Review the log file /var/log/apache2/error.log.
* Review the folder /var/tmp/cosmos and verify the installer settings.


### Problem: Cloud Controller node or Compute Region node displays the "not ready" (gray) state

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td>  Installation Dashboard is unable to monitor the Cloud Controller node or the Compute Region node. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Installation Dashboard </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td>    </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> The Cloud Controller node or the Compute Region node has not updated the live status to the Admin node.  </td>
</tr>

</table>

#### Solution

Log in to the suspect node through SSH and run <code>sudo chef-client</code>. This will force the node to update its status with Chef.



### Problem: Stopping services before Cloud OS completes processing jobs can cause a job failure

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> The state of the job may vary in this situation. The job might fail with an error message or be stuck in processing with no error message. In some cases, the job might resume after the service restarts. Make sure all the processing jobs are completed or canceled before stopping any Cloud OS services. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td>   </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td>   </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> Jobs may fail if services (such as Eve, Peer, and Focus) are stopped before Cloud OS completes provisioning or deprovisioning the jobs. </td>

</tr>

</table>

#### Solution

Wait for the jobs that are processing to complete, or manually terminate those jobs. Then re-apply the install modules or restart the upstart services manually in the Installation Dashboard.


### Problem: How to configure Cinder to use RAW multipath devices

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> The administrator wants to configure Cinder to use a multipath device. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Installation </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> N/A </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> By default, Cinder doesn't come configured for multipath.</td>
</tr>

</table>

#### Solution 

Configure multipath storage. Use the following commands:

<pre>
apt-get install multipath-tools
cp /home/crowbar/multipath.conf /etc
/lib/udev/scsi_id -g -u -d /dev/sdb
<nobr>sed \-i 's/36001438005df087b0000600003d40000/Replace with value from line #3/' /etc/multipath.conf</nobr>
cat /etc/multipath.conf
reboot
</pre>

<pre>
pvcreate /dev/mapper/iaasc
vgcreate nova_instances /dev/mapper/iaasc
lvcreate -L999G -n logical_nova1 nova_instances
mke2fs -t ext4 /dev/nova_instances/logical_nova1
mount -t ext4 /dev/nova_instances/logical_nova1 /var/lib/nova/instances/
chown nova:nova /var/lib/nova/instances/
restart nova-compute
<nobr>sed -i '$ a /dev/nova_instances/logical_nova1 /var/lib/nova/instances 0 2' /etc/fstab</nobr>
</pre>

After that, follow the instruction below post reboot:

<pre>
pvcreate --metadatasize 1020 /dev/mapper/iaasc
vgextend cinder-volumes /dev/mapper/iaasc
vgreduce cinder-volumes  /dev/loop0
</pre>



### Problem: Red screen when installing OS on bare metal nodes

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> During the installation process, the partition cannot be created. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Installation </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> No root file system is defined </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> The iLO lost the virtual drive connection. See the example screen capture.</td>
</tr>

</table>

<img src="media/cloudos-red-screen.png" title="Example red screen" /> 

#### Solution 

Reboot the server, check whether the iLO is still mapped correctly, and re-execute the operation.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a> 

