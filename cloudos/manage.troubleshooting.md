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

* [Troubleshooting Cloud OS Operational Dashboard](#troubleshooting-cloud-os-operational-dashboard)

( TOC intra-file xrefs coming...)

* [Troubleshooting Cloud OS Administration Dashboard](#troubleshooting-cloud-os-administration-dashboard)

 * [Problem: Console Connect timeout issue in the Administration Dashboard](#problem-console-connect-timeout-issue-in-the-administration-dashboard)
 * [Problem: Default Ubuntu cloud image and CirrOS images only show one active network even if multiple networks are specified](#problem-default-ubuntu-cloud-image-and-cirros-images-only-show-one-active-network-even-if-multiple-networks-are-specified)
 * [Problem: Instance resize feature does not work when there is only a single compute node](#problem-instance-resize-feature-does-not-work-when-there-is-only-a-single-compute-node)

* [Troubleshooting Cloud OS Installation](#troubleshooting-cloud-os-installation)

(TOC intra-file xrefs coming...) 


## Troubleshooting Cloud OS ISO

This section describes the following known problems and solutions for the Cloud OS ISO:

#### Problem: ISO Error Running on a VM Hosted on a KVM Hypervisor

<table style="text-align: left; vertical-align: top; width:700px;">

<tr style="background-color: white; color: black;">
<td> Symptoms </td>
<td> The HP Cloud OS ISO shows an error when running on a virtual machine (VM) hosted on a KVM hypervisor. </td>
</tr>

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

### Solution

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


### Problem: Create new router fails



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



### Problem: When creating a new PXE node, the PXE boot fails with a TFTP timeout error



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



### Problem: Manage Nodes not updating the status



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



### Problem: Create cloud or compute region fails



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



### Problem: Admin Node Internet Access Prerequisites fail to complete



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



### Problem: Instance not getting IP from a private network



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



### Problem: Admin node redirects to License page



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



### Problem: Fiber-Channel errors when booting node



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



### Problem: Error in the log during Deploy Cloud



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



### Problem: Services not started after controller node is rebooted



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



### Problem: Yellow screen with exception is thrown when using the Cloud OS solution



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

* [Problem: Cloud Infrastructure install module proposal fails
* [Problem: Cloud Controller node or Compute Region node displays the "not ready" (grey) state
* [Problem: Stopping services before Cloud OS completes processing jobs can cause a job failure
* [Problem: Configure Cinder to use RAW multipath devices
* [Problem: Red screen when installing OS on bare metal nodes


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

### Solution

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
