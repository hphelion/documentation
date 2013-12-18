---
layout: default
title: "HP Cloud OS Troubleshooting"
permalink: /cloudos/manage/troubleshooting/
product: cloudos

---

<a name="_top"> </a>

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

 * [Problem: Admin Node displays the "not ready" (grey) state](#problem-admin-node-displays-the-not-ready-grey-state)
 * [Problem: Create new router fails](#problem-create-new-router-fails)
 * [Problem: When creating a new PXE node, the PXE boot fails with a TFTP timeout error](#problem-when-creating-a-new-pxe-node-the-pxe-boot-fails-with-a-tftp-timeout-error)
 * [Problem: Manage Nodes not updating the status](#problem-manage-nodes-not-updating-the-status)
 * [Problem: Create cloud or compute region fails](#problem-create-cloud-or-compute-region-fails)
 * [Problem: Admin Node Internet Access Prerequisites fail to complete](#problem-admin-node-internet-access-prerequisites-fail-to-complete)
 * [Problem: Instance not getting IP from a private network](#problem-instance-not-getting-ip-from-a-private-network)
 * [Problem: Admin node redirects to License page](#problem-admin-node-redirects-to-license-page)
 * [Problem: Fiber-Channel errors when booting node](#problem-fiber-channel-errors-when-booting-node)
 * [Problem: Error in the log during Deploy Cloud](#problem-error-in-the-log-during-deploy-cloud)
 * [Problem: Services not started after controller node is rebooted](#problem-services-not-started-after-controller-node-is-rebooted)
 * [Problem: Yellow screen with exception is thrown when using the Cloud OS solution](#problem-yellow-screen-with-exception-is-thrown-when-using-the-cloud-os-solution)
 * [Problem: After restart Cloud OS not working anymore](#problem-after-restart-cloud-os-not-working-anymore)
 * [Problem: Compute node not listed in the user-interface](#problem-compute-node-not-listed-in-the-user-interface)
 * [Problem: The time zone in the controller node is incorrect](#problem-the-time-zone-in-the-controller-node-is-incorrect)
 * [Problem: Compute node fails to install OS (kernel error)](#problem-compute-node-fails-to-install-os-kernel-error)
 * [Problem: Problem creating images using remote location](#problem-problem-creating-images-using-remote-location)
 * [Problem: Problem creating image using image file](#problem-problem-creating-image-using-image-file)
 * [Problem: Unable to launch more instances](#problem-unable-to-launch-more-instances)
 * [Problem: Default route disappears from controller node](#problem-default-route-disappears-from-controller-node)
 * [Problem: Not possible to log in the dashboard (license has expired)](#problem-not-possible-to-log-in-the-dashboard-license-has-expired)
 * [Problem: Create Cloud failed](#create-cloud-failed)
 * [Problem: Find why Launch Topology Fails](#find-why-launch-topology-fails)
 * [Problem: Unauthorized exceptions when navigating in the dashboard](#problem-unauthorized-exceptions-when-navigating-in-the-dashboard)
 * [Problem: Location of the log files](#problem-location-of-the-log-files)
 * [Problem: Launch topology fails and Instance is created but with Error status](#problem-launch-topology-fails-and-instance-is-created-but-with-error-status)
 * [Problem: Complete Node Internet Access prerequisite hang and fail after some time](#problem-complete-node-internet-access-prerequisite-hang-and-fail-after-some-time)
 * [Problem: Incorrect Manage Node status prevents use of the node](#problem-incorrect-manage-node-status-prevents-use-of-the-node)

* [Troubleshooting Cloud OS Administration Dashboard](#troubleshooting-cloud-os-administration-dashboard)

 * [Problem: Console Connect timeout issue in the Administration Dashboard](#problem-console-connect-timeout-issue-in-the-administration-dashboard)
 * [Problem: Default Ubuntu cloud image and CirrOS images only show one active network even if multiple networks are specified](#problem-default-ubuntu-cloud-image-and-cirros-images-only-show-one-active-network-even-if-multiple-networks-are-specified)
 * [Problem: Instance resize feature does not work when there is only a single compute node](#problem-instance-resize-feature-does-not-work-when-there-is-only-a-single-compute-node)

* [Troubleshooting Cloud OS Installation](#troubleshooting-cloud-os-installation)

 * [Problem: Cloud Infrastructure install module proposal fails](#problem-cloud-infrastructure-install-module-proposal-fails)
 * [Problem: Cloud Controller node or Compute Region node displays the "not ready" (grey) state](#problem-cloud-controller-node-or-compute-region-node-displays-the-not-ready-grey-state)
 * [Problem: Stopping services before Cloud OS completes processing jobs can cause a job failure](#problem-stopping-services-before-cloud-os-completes-processing-jobs-can-cause-a-job-failure)
 * [Problem: Configure Cinder to use RAW multipath devices](#problem-configure-cinder-to-use-raw-multipath-devices)
 * [Problem: Red screen when installing OS on bare metal nodes](#problem-red-screen-when-installing-os-on-bare-metal-nodes)


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
<td> No root file system, no root file system is defined </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> This error is due to the format of the virtual disk configured for the VM. </td>
</tr>

</table>

##### Solution

Ensure that the virtual disk format is either IDE or SCSI before booting the VM with the HP Cloud OS ISO media.



## Troubleshooting Cloud OS Operational Dashboard

This section describes the following known problems and solutions for the Operational Dashboard:

* [Problem: Admin Node displays the "not ready" (grey) state](#problem-admin-node-displays-the-not-ready-grey-state)
* [Problem: Create new router fails](#problem-create-new-router-fails)
* [Problem: When creating a new PXE node, the PXE boot fails with a TFTP timeout error](#problem-when-creating-a-new-pxe-node-the-pxe-boot-fails-with-a-tftp-timeout-error)
* [Problem: Manage Nodes not updating the status](#problem-manage-nodes-not-updating-the-status)
* [Problem: Create cloud or compute region fails](#problem-create-cloud-or-compute-region-fails)
* [Problem: Admin Node Internet Access Prerequisites fail to complete](#problem-admin-node-internet-access-prerequisites-fail-to-complete)
* [Problem: Instance not getting IP from a private network](#problem-instance-not-getting-ip-from-a-private-network)
* [Problem: Admin node redirects to License page](#problem-admin-node-redirects-to-license-page)
* [Problem: Fiber-Channel errors when booting node](#problem-fiber-channel-errors-when-booting-node)
* [Problem: Error in the log during Deploy Cloud](#problem-error-in-the-log-during-deploy-cloud)
* [Problem: Services not started after controller node is rebooted](#problem-services-not-started-after-controller-node-is-rebooted)
* [Problem: Yellow screen with exception is thrown when using the Cloud OS solution](#problem-yellow-screen-with-exception-is-thrown-when-using-the-cloud-os-solution)
* [Problem: After restart Cloud OS not working anymore](#problem-after-restart-cloud-os-not-working-anymore)
* [Problem: Compute node not listed in the user-interface](#problem-compute-node-not-listed-in-the-user-interface)
* [Problem: The time zone in the controller node is incorrect](#problem-the-time-zone-in-the-controller-node-is-incorrect)
* [Problem: Compute node fails to install OS (kernel error)](#problem-compute-node-fails-to-install-os-kernel-error)
* [Problem: Problem creating images using remote location](#problem-problem-creating-images-using-remote-location)
* [Problem: Problem creating image using image file](#problem-problem-creating-image-using-image-file)
* [Problem: Unable to launch more instances](#problem-unable-to-launch-more-instances)
* [Problem: Default route disappears from controller node](#problem-default-route-disappears-from-controller-node)
* [Problem: Not possible to log in the dashboard (license has expired)](#problem-not-possible-to-log-in-the-dashboard-license-has-expired)
* [Problem: Create Cloud failed](#create-cloud-failed)
* [Problem: Find why Launch Topology Fails](#find-why-launch-topology-fails)
* [Problem: Unauthorized exceptions when navigating in the dashboard](#problem-unauthorized-exceptions-when-navigating-in-the-dashboard)
* [Problem: Location of the log files](#problem-location-of-the-log-files)
* [Problem: Launch topology fails and Instance is created but with Error status](#problem-launch-topology-fails-and-instance-is-created-but-with-error-status)
* [Problem: Complete Node Internet Access prerequisite hang and fail after some time](#problem-complete-node-internet-access-prerequisite-hang-and-fail-after-some-time)
* [Problem: Incorrect Manage Node status prevents use of the node](#problem-incorrect-manage-node-status-prevents-use-of-the-node)


### Problem: Admin Node displays the "not ready" (grey) state


<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> You may not be able to PXE boot any new node. This problem occurs when you re-install Cloud OS on machines that have been used with a Cloud OS environment earlier. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin Node  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td>    </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> You changed the date on the Admin Node or you brought up a previously allocated node to the Admin Node.  </td>
</tr>

</table>

##### Solution

1.	Create a new Admin Node.
2.	Before setting up the Admin Node, be sure to power down all participating nodes that were running controller and compute roles.
3.	After the Admin Node is set up, you must use the PXE boot process to power up the participating nodes.

See [Install &amp; Configure Your Clouds](/cloudos/install) for complete instructions. If the nodes boot to the original operating system that was set up with the earlier Admin Node, the boot process will cause irreparable damage to the Admin Node and the entire process will need to be restarted.



### Problem: Create new router fails

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> The operation to create a new router fails if using designer or manually creating a new router and adding the interfaces.   </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Operational Dashboard  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> Failed to add interface to router XYZ   </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> The environment already has a router configured connecting the same networks. Only one router connecting the same networks is allowed.  </td>
</tr>

</table>

##### Solution

Provision with the already existing router instead of creating a new one. 




### Problem: When creating a new PXE node, the PXE boot fails with a TFTP timeout error

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> In the Operational Dashboard, the Admin Node takes a long time to reboot. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin Node  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td>    </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> This occurs in a few cases after the Admin Node is rebooted. </td>
</tr>

</table>

##### Solution

<ol>

<li> Log in to the Admin Node and run the following commands:

<pre>
sudo bluepill tftpd stop
sudo bluepill tftpd start
</pre>  

</li>

<li> After these commands have run, PXE boot the nodes.

</ol>



### Problem: Manage Nodes not updating the status

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> The status of the Manage Nodes page is not updated after any operation.  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin Node </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td>  N/A  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> The manage node page fails to update the status of the nodes.  </td>
</tr>

</table>

##### Solution

Navigate to other menus and back to the Manage Nodes tab to force an update of the status.




### Problem: Create cloud or compute region fails



<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> The operation to create a cloud or a compute region fails without reason.  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin Node  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> Failed  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> One or more of the nodes used wasn't ready to be used or in bad state. </td>
</tr>

</table>

##### Solution

1.	Check if the used nodes are in a good status, using SSH check:

 * Node not with problem or hanged in PXE boot (PXE-MOF: Exiting Emulex PXE ROM), in this case reboot the node and do again a PXE boot.
 * Chef-client running in the node, if no errors happen re-try the operation otherwise reboot the node and do again a PXE boot. 
 
2.	If everything is correctly check the logs for more information.

<pre>
/var/log/cosmos/cosmos.log
/var/log/apache2/error.log
</pre> 




### Problem: Admin Node Internet Access Prerequisites fail to complete



<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> For the Cloud Administration Node Internet Access prerequisite, after completing the Complete Prerequisite action, a failure message displays.   </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Operational Dashboard  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> Failed completing the Prerequisite  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> The selected interface does not exist in your environment. For example, if you have a system with two NICs, (eth0 and eth1), selecting eth2 will cause the prerequisite to fail.
On the Admin Node, view the log files for details:

<pre>
/var/log/cosmos/cosmos.log
/var/log/apache2/error.log
</pre>

</td>
</tr>

</table>

##### Solution

* Verify a public network is configured in the Admin Node.
* Redo the steps for Cloud Administration Node Internet Access prerequisite - see "Set Admin Node Prerequisites" in the HP Cloud OS Installation and Configuration Dashboard.
* Correct the proxy entries and/or specify a different proxy host and/or port.

You must do pre-work before starting cloud deployment. If there are any incorrect details, the entire operation needs to be re-done. 

The pre-work includes:

* Identifying the NIC card sequence for Admin, OS_SDN and Public interfaces on all participating machines. 
* Identifying the private IP range for hosts and guest VMs.
* Identifying the Public IP range for hosts and guestVMs



### Problem: Instance not getting IP from a private network



<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td>  After a new private network is created the new launched instances are not getting IP from this specific network.  </td>
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

Restart the network services on network controller executing the command below in the in the respective node.

<pre>
cd /etc/init.d/
for i in $( ls quantum-* ); do sudo service $i restart; done
</pre>


### Problem: Admin node redirects to License page



<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> All operations executed in the Admin Node redirect the user to the license page. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin Node </td>
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

The license is expired. Contact HP Support to renew your license. 



### Problem: Fiber-Channel errors when booting node

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> After node is allocated Fiber-Channel (FC) error can appear during the boot of the operational system. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin Node </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> Blocked FC remote port timeout: removing rport </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> The blade FC connection is not configured and because of that a timeout happened and the port will be removed from in the OS level. See screen capture. </td>
</tr>

</table>

<img src="media/cloudos-fiber-channel-errors.png" title="Fiber channel errors" /> 


##### Solution

This problem can be ignored and shouldn't case future problem. IF any side-effect happen, contact HP Support.



### Problem: Error in the log during Deploy Cloud

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> Compute node not been listed in the user-interface (UI) after PXE boot and installation completed with success.   </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin Node  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> Crowbar configuration has errors. Please fix and rerun install. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> That's a known message in the logs and won't cause any problem during the use of the solution.  </td>
</tr>

</table>

##### Solution 

You can ignore this error message. If any other problem happens during the deployment of the cloud, please contact HP Support.


### Problem: Services not started after controller node is rebooted

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> After reboot the controller node, some of the services are not started, this mean they are stopped when they shouldn't be.   </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Controller Node  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> N/A  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> This is normally a timing issue caused by the hardware that was used, a possible reason for this problem is that the server is with a lower configuration than the minimum required.  </td>
</tr>

</table>


##### Solution

Connect to the controller node using SSH and check if the services are started using the commands bellow, if any service is stopped just start manually.

<pre>
for job in $( ls /etc/init.d/nova-* ); do service ${job##*/} status; done
for job in $( ls /etc/init.d/cinder-* ); do service ${job##*/} status; done
for job in $( ls /etc/init.d/quantum-* ); do service ${job##*/} status; done
</pre>



### Problem: Yellow screen with exception is thrown when using the Cloud OS solution

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> Yellow exception may occur when using and navigating in the dashboards.   </td>
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
<td> It wasn't possible to get specific information or the information was wrong. See examples in the screen capture. </td>
</tr>

</table>

<img src="media/cloudos-yellow-screen.png" title="Example yellow screen" /> 

#### Solution

Refresh your browser. If the problem persist, please contact HP Support.



### Problem: After restart Cloud OS not working anymore

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> After restart all the nodes, the solution doesn't seem to be working as before, services not working as expected. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin Node </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> General problems using the solution </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> Sometimes after a restart the services don't start automatically or in a good state. </td>
</tr>

</table>

#### Solution
 
Check if all services are running fine in the controller node, first declare all the system variables and after that execute:

* <code>keystone user-list</code> (list of all user should return)
* <code>glance index</code> (list of images should return)
* <code>cinder list</code> (list of volumes should return, if any created)
* <code>quantum agent-list</code> (list of the agents should return with "happy" status)
* <code>nova-manage service list</code> (list of services should return with "happy" status)


### Problem: Compute node not listed in the user-interface

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> Compute node is not listed in the user-interface (UI) after PXE boot and installation completed with success. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin Node </td>
</tr>

<tr style="background-color: white; color: black;">
<td> N/A </td>
<td>    </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> Cloud OS network with more than one DHCP server running.  </td>
</tr>

</table>

#### Solution 

If the installation completed without problem and the node is not been listed, probably the node booted using another DHCP server, and this caused the problem. The Cloud OS network should be isolated.



### Problem: The time zone in the controller node is incorrect




<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> The time zone in the controller node by default will be different than the one in the admin node.   </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Controller Node </td>
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

Change the time-zone to the one you need/want in the Controller Node using the command:

<pre>
pkg-reconfigure tzdata.
</pre>


### Problem: Compute node fails to install OS (kernel error)

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> After reboot the controller node, some of the services are not started, this mean they are stopped when shouldn't be. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin Node </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> N/A  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> Server configuration (hardware) not supported by the OS.  </td>
</tr>

</table>

#### Solution 

Will be necessary to check why the problem is happening; normally will be related with the hardware used. The easy way is to search in the Internet why the specific error happened and try again.




### Problem: Problem creating images using remote location



<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> Creating an image using the remote location option, pointing to an external server not working. </td>
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
<td> Connectivity problem between the server with the image and the controller node. </td>
</tr>

</table>

#### Solution 

Check if the controller node can access the image server, for that SSH to the server and execute this command:

<pre>
curl -O http://server.ip/image.file
</pre>

If the curl didn't worked this mean the server can't access the image, probably a proxy issue or no connectivity. Fix that and try again.


### Problem: Problem creating image using image file

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> Creating an image using the image file option, pointing to a file that is located in your local system not working. </td>
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
<td> The image is bigger than the supported for this specific operation. </td>
</tr>

</table>

#### Solution

Images bigger than 1.5 GB cannot be uploaded using the Image File option (image located in the user's computer). 
The solution for this problem is to:

1. Win SCP to the Admin Node.
2. Upload the image to /tmp/.
3. Change the permission of the file to 777 (chmod 777 /tmp/&amp;image.name>).
4. Move the file to the folder <code>tftpboot</code>.
5. Create the image pointing to this URL (http://&amp;admin.node.ip>:8091/&amp;image.name>).



### Problem: Unable to launch more instances

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> Launch new instances stopped to work after some instances was created without any problem. </td>
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
<td> The limit of instances for the specific project was reached. </td>
</tr>

</table>

#### Solution 

To change the project limits,  access the dashboard's Domain > Projects > Select a Project > Properties > Limits tab; update the necessary values. For network and storage quota, you need to change it through command line options, such as:

<pre>
cinder quota-update; quantum -quota-update
</pre>


### Problem: Default route disappears from controller node



<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> The default route disappears from the controller node after reboot. </td>
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

Nothing needs to be done. The default route should be re-added automatically after 20 minutes or less after the reboot of the node. Also is possible to manually start the process connecting to the controller node and executing the command <code>chef-client</code>.


### Problem: Not possible to log in the dashboard (license has expired)

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> Trying to open/log in any of the dashboards will be blocked.   </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin Node  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td>  The HP Cloud OS license has expired  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td>  The license being used expired. </td>
</tr>

</table>

#### Solution 

This means your license expired; to solve the problem, contact HP Support to renew your license, then add the new license in the 
Admin Node (Settings > License).



### Problem: Create Cloud failed

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td>  The operation to create cloud failed without any useful information to find what happened.  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin Node </td>
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
 
Check the logs below for more information, the logs may help to point what was the cause of the error.

<pre>
/opt/dell/crowbar_framework/log/production.log
/opt/dell/crowbar_framework/log/* (for more information)
/var/log/barclamps/*
</pre>



### Problem: Find why Launch Topology Fails

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> The operation to create cloud failed without any useful information to find what happened. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin Node </td>
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

Click in the topology that failed to see the details of the error, if the message doesn't explain why the provisioning fail check the 
Cloud OS logs in the controller node located at:

<pre>
/var/log/eve-requestworker/eve-requestworker.log
/var/log/eve-api/eve-api.log
</pre>


### Problem: Unauthorized exceptions when navigating in the dashboard

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> When user navigating in the dashboard a Unauthorized error message may appear in the top of the browser and no items will be rendered in the user interface. </td>
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
<td> Session expired but the user didn't logout from the dashboard. </td>
</tr>

</table>

#### Solution

Navigate to another item in the menu of the dashboard; if the problem persist, just logout and re-login to the dashboard.



### Problem: Location of the log files

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> Sometimes will be necessary to check the logs or collect the logs for further investigation and the logs are not all in the same place. </td>
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
<td> Sometimes only with the logs will be possible to figure out what is the problem or what happened. </td>
</tr>

</table>

#### Solution

* Admin Node Logs:

<pre>
  /var/log/cosmos/cosmos.log
  /var/log/apache2/error.log
</pre>

* Deploy Cloud Logs:

<pre>
  /var/log/install*.log
  /var/log/install*.err
</pre>

* Controller Node Logs:

<pre>
  /var/log/cosmos/cosmos.log
  /var/log/apache2/error.log
</pre>

* Deploying Admin Node:

<pre>
  /opt/dell/crowbar_framework/log/production.log
  /opt/dell/crowbar_framework/log/* (for more information)
  /var/log/barclamps/*
</pre>

* Launch Topology Logs:

<pre>
  /var/log/eve-api/eve-api.log
  /var/log/eve-requestworker/eve-requestworker.log
  /var/log/focus-api/focus-api.log
  /var/log/graffiti-api/graffiti.log
</pre>



### Problem: Launch topology fails and Instance is created but with Error status

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> Launching a topology fails but all the components in the design (router, network,..) will be created with success and the instance have an Error status.  </td>
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
<td> This problem happen normally when Cloud OS services had any problem executing the operation, normally happens in environments with I18N. </td>
</tr>

</table>

#### Solution

Cleanup all the items created by the topology that was launched and failed (e.g.: router, network, groups, instance…) and restart in the controller node the Cloud OS services mentioned below:

<pre>
service eve-requestworker restart
service eve-api restart
</pre>




### Problem: Complete Node Internet Access prerequisite hang and fail after some time

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> "Complete the Cloud Administration Node Internet Access" prerequisite hangs for a long time, and fail in the end.  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin Node </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> Unable to access the Internet. Check network and proxy settings  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> The Admin Node server can't access the Internet using the proxy information that was used to configure the prerequisite. </td>
</tr>

</table>

#### Solution

1.	Check if the proxy details in is really correct, if not fix and try again.
2.	Check if the Admin Node really has access to the proxy server, if not fix and try again.
3.	The last option is to remove the proxy information and complete the prerequisite without the proxy information.



### Problem: Incorrect Manage Node status prevents use of the node

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> After some operations the manage node status remains incorrect, for example Resetting. Because of that the node is no longer usable. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Primary software component </td>
<td> Admin Node </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Failure message </td>
<td> N/A </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Probable cause </td>
<td> The node entered in an invalid state for an unknown reason, and its status is no longer updated. </td>
</tr>

</table>

#### Solution: 

If the node is not been used at the moment, shut down the node, power on again, and make it PXE boot again. This should fix the status and set the node to "Not Allocated," allowing the user to use the node again.



## Troubleshooting Cloud OS Administration Dashboard


This section describes the following known problems and solutions for the Administration Dashboard:

* [Problem: Console Connect timeout issue in the Administration Dashboard](#problem-console-connect-timeout-issue-in-the-administration-dashboard)
* [Problem: Default Ubuntu cloud image and CirrOS images only show one active network even if multiple networks are specified](#problem-default-ubuntu-cloud-image-and-cirros-images-only-show-one-active-network-even-if-multiple-networks-are-specified)
* [Problem: Instance resize feature does not work when there is only a single compute node](#problem-instance-resize-feature-does-not-work-when-there-is-only-a-single-compute-node)


### Problem: Console Connect timeout issue in the Administration Dashboard


<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> In the Administration Dashboard, if you click the provisioned instance, and use Internet Explorer to open the Console, a Console Connect timeout issue occurs. </td>
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
<td> Default number of networks for the Ubuntu cloud image and CirrOS images is one. </td>
</tr>

</table>

#### Solution

There are two ways to get the second NIC up and running.

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



### Problem: Instance resize feature does not work when there is only a single compute node


<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> In a cloud with only a single compute node, if you click More in the Instances tab of the Administration Dashboard and try to resize the instance to a different flavor, the operation will fail. </td>
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
<td> Instance resize only works with multiple compute nodes. </td>
</tr>

</table>

#### Solution

Use this feature only if your HP Cloud OS environment includes multiple compute nodes.




## Troubleshooting Cloud OS Installation


This section describes the following known problems and solutions for the Installation Dashboard:

* [Problem: Cloud Infrastructure install module proposal fails](#problem-cloud-infrastructure-install-module-proposal-fails)
* [Problem: Cloud Controller node or Compute Region node displays the "not ready" (grey) state](#problem-cloud-controller-node-or-compute-region-node-displays-the-not-ready-grey-state)
* [Problem: Stopping services before Cloud OS completes processing jobs can cause a job failure](#problem-stopping-services-before-cloud-os-completes-processing-jobs-can-cause-a-job-failure)
* [Problem: Configure Cinder to use RAW multipath devices](#problem-configure-cinder-to-use-raw-multipath-devices)
* [Problem: Red screen when installing OS on bare metal nodes](#problem-red-screen-when-installing-os-on-bare-metal-nodes)


### Problem: Cloud Infrastructure install module proposal fails

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> An error message displays and the status turns red if a proposal fails. </td>
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
<td> There are a number of possible causes. See the solution section. </td>
</tr>

</table>

#### Solution

Try applying the proposal again. If that fails:

* Deactivate the proposal.
* Delete the proposal and create it again.
* SSH in to the Admin Node using the credentials: crowbar/crowbar.
* Review the log files /opt/dell/crowbar_framework/log/production.log and MacAddressHostname>.chef.log.
* Review the log file /var/log/apache2/error.log.
* Review the folder /var/tmp/cosmos and verify the installer settings.


### Problem: Cloud Controller node or Compute Region node displays the "not ready" (grey) state

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td>  Installation Dashboard is unable to monitor the Cloud Controller Node or the Compute Region Node. </td>
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
<td> The Cloud Controller Node or the Compute Region Node has not updated the live status to the Admin Node.  </td>
</tr>

</table>

#### Solution

Log in to the suspect node through SSH and run <code>sudo chef-client</code>. This will force the node to update its status with Chef.



### Problem: Stopping services before Cloud OS completes processing jobs can cause a job failure

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> Jobs may fail if services (such as Eve, Peer, and Focus) are stopped before Cloud OS completes provisioning or deprovisioning the jobs. </td>
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
<td> The state of the job may vary in this situation. The job might fail with an error message or be stuck in processing with no error message. In some cases, the job may even resume once the service has restarted. Make sure all the processing jobs are completed or canceled before stopping any Cloud OS services. </td>
</tr>

</table>

#### Solution

Wait for the job processing to complete or manually terminate those jobs, before re-applying the install modules or restarting the upstart services manually in the Installation Dashboard.


### Problem: Configure Cinder to use RAW multipath devices

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
<td> By default Cinder doesn't come configured for multipath.</td>
</tr>

</table>

#### Solution 

Ensure you get the multipath storage configured, for that use the below commands:

<pre>
apt-get install multipath-tools
cp /home/crowbar/multipath.conf /etc
/lib/udev/scsi_id -g -u -d /dev/sdb
sed \-i 's/36001438005df087b0000600003d40000/Replace with value from line #3/' /etc/multipath.conf
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
sed -i '$ a /dev/nova_instances/logical_nova1 /var/lib/nova/instances 0 2' /etc/fstab
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
<td> During the installation process the partition could not be created. </td>
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

Reboot the server, check if the iLO is still mapped correctly and re-execute the operation.


<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

