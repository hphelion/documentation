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
<td>    </td>
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
<td>   </td>
</tr>

</table>



### Problem: Compute node not listed in the user-interface




<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td>    </td>
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
<td>   </td>
</tr>

</table>



### Problem: The time zone in the controller node is incorrect




<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td>    </td>
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
<td>   </td>
</tr>

</table>



### Problem: Compute node fails to install OS (kernel error)




<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td>    </td>
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
<td>   </td>
</tr>

</table>



### Problem: Problem creating images using remote location



<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td>    </td>
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
<td>   </td>
</tr>

</table>



### Problem: Problem creating image using image file



<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td>    </td>
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
<td>   </td>
</tr>

</table>



### Problem: Unable to launch more instances




<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td>    </td>
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
<td>   </td>
</tr>

</table>



### Problem: Default route disappears from controller node



<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td>    </td>
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
<td>   </td>
</tr>

</table>



### Problem: Not possible to log in the dashboard (license has expired)



<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td>    </td>
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
<td>   </td>
</tr>

</table>



### Problem: Create Cloud failed




<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td>    </td>
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
<td>   </td>
</tr>

</table>



### Problem: Find why Launch Topology Fails



<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td>    </td>
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
<td>   </td>
</tr>

</table>



### Problem: Unauthorized exceptions when navigating in the dashboard




<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td>    </td>
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
<td>   </td>
</tr>

</table>



### Problem: Location of the log files



<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td>    </td>
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
<td>   </td>
</tr>

</table>



### Problem: Launch topology fails and Instance is created but with Error status



<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td>    </td>
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
<td>   </td>
</tr>

</table>



### Problem: Complete Node Internet Access prerequisite hang and fail after some time



<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td>    </td>
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
<td>   </td>
</tr>

</table>



### Problem: Incorrect Manage Node status prevents use of the node



<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td>    </td>
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
<td>   </td>
</tr>

</table>




## Troubleshooting Cloud OS Administration Dashboard


This section describes the following known problems and solutions for the Administration Dashboard:

* [Problem: Console Connect timeout issue in the Administration Dashboard](#problem-console-connect-timeout-issue-in-the-administration-dashboard)
* [Problem: Default Ubuntu cloud image and CirrOS images only show one active network even if multiple networks are specified](#problem-default-ubuntu-cloud-image-and-cirros-images-only-show-one-active-network-even-if-multiple-networks-are-specified)
* [Problem: Instance resize feature does not work when there is only a single compute node](#problem-instance-resize-feature-does-not-work-when-there-is-only-a-single-compute-node)


### Problem: Console Connect timeout issue in the Administration Dashboard


<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td>    </td>
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
<td>   </td>
</tr>

</table>



### Problem: Default Ubuntu cloud image and CirrOS images only show one active network even if multiple networks are specified


<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td>    </td>
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
<td>   </td>
</tr>

</table>


### Problem: Instance resize feature does not work when there is only a single compute node


<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td>    </td>
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
<td>   </td>
</tr>

</table>







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
<td>    </td>
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
<td>   </td>
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
<td>    </td>
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
<td>   </td>
</tr>

</table>




### Problem: Stopping services before Cloud OS completes processing jobs can cause a job failure


<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td>    </td>
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
<td>   </td>
</tr>

</table>



### Problem: Configure Cinder to use RAW multipath devices


<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td>    </td>
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
<td>   </td>
</tr>

</table>



### Problem: Red screen when installing OS on bare metal nodes



<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td>    </td>
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
<td>   </td>
</tr>

</table>


<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

